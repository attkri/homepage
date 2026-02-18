[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [ValidateSet('GetAuthUrl', 'ExchangeCode', 'RefreshToken', 'GetMe', 'PostText', 'HealthCheck', 'DeletePost')]
    [string]$Action,

    [string]$ClientId = $env:LINKEDIN_CLIENT_ID,
    [string]$ClientSecret = $env:LINKEDIN_CLIENT_SECRET,
    [string]$RedirectUri = $env:LINKEDIN_REDIRECT_URI,
    [string]$SecretFile = '~\.secrets\LinkedIn.secret.json',
    [string[]]$Scopes,
    [string]$State,

    [string]$Code,
    [string]$RefreshToken,
    [string]$AccessToken,
    [string]$Text,
    [ValidateSet('PUBLIC', 'CONNECTIONS')]
    [string]$Visibility = 'PUBLIC',
    [string]$PostUrn,
    [string]$OrganizationId,

    [string]$TokenFile = (Join-Path $env:USERPROFILE '.linkedin/token.json'),
    [switch]$OpenBrowser
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Assert-RequiredValue {
    param(
        [Parameter(Mandatory = $true)][string]$Name,
        [Parameter(Mandatory = $true)][AllowEmptyString()][string]$Value
    )

    if ([string]::IsNullOrWhiteSpace($Value)) {
        throw "Missing required value: $Name"
    }
}

function Get-UrlEncodedQuery {
    param([Parameter(Mandatory = $true)][hashtable]$Params)

    return ($Params.GetEnumerator() | ForEach-Object {
            '{0}={1}' -f [Uri]::EscapeDataString([string]$_.Key), [Uri]::EscapeDataString([string]$_.Value)
        }) -join '&'
}

function Resolve-SecretFilePath {
    param([Parameter(Mandatory = $true)][string]$Path)

    if ([System.IO.Path]::IsPathRooted($Path)) {
        return $Path
    }

    $repoRoot = Split-Path -Path $PSScriptRoot -Parent
    $candidates = @(
        (Join-Path -Path (Get-Location) -ChildPath $Path),
        (Join-Path -Path $repoRoot -ChildPath $Path),
        (Join-Path -Path $PSScriptRoot -ChildPath $Path)
    ) | Select-Object -Unique

    foreach ($candidate in $candidates) {
        if (Test-Path -LiteralPath $candidate) {
            return (Resolve-Path -LiteralPath $candidate).Path
        }
    }

    return $candidates[0]
}

function Get-LinkedInSecretConfig {
    param([Parameter(Mandatory = $true)][string]$Path)

    $resolvedPath = Resolve-SecretFilePath -Path $Path
    if (-not (Test-Path -LiteralPath $resolvedPath)) {
        return $null
    }

    try {
        return Get-Content -LiteralPath $resolvedPath -Raw | ConvertFrom-Json
    }
    catch {
        throw "Could not parse secret file '$resolvedPath': $($_.Exception.Message)"
    }
}

function Get-ConfigValue {
    param(
        [psobject]$Config,
        [Parameter(Mandatory = $true)][string]$Name
    )

    if ($null -eq $Config) {
        return $null
    }

    $property = $Config.PSObject.Properties[$Name]
    if ($null -eq $property) {
        return $null
    }

    return $property.Value
}

function ConvertTo-ScopeString {
    param([string[]]$InputScopes)

    $expanded = @()
    foreach ($scope in $InputScopes) {
        if ([string]::IsNullOrWhiteSpace($scope)) {
            continue
        }

        $expanded += ($scope -split '[,\s]+' | Where-Object { -not [string]::IsNullOrWhiteSpace($_) })
    }

    $unique = @($expanded | Select-Object -Unique)
    if ($unique.Count -eq 0) {
        throw 'At least one OAuth scope is required.'
    }

    return [string]::Join(' ', $unique)
}

function Save-TokenData {
    param(
        [Parameter(Mandatory = $true)][psobject]$Token,
        [Parameter(Mandatory = $true)][string]$Path,
        [string]$ScopeString
    )

    $directory = Split-Path -Path $Path -Parent
    if (-not (Test-Path -Path $directory)) {
        New-Item -Path $directory -ItemType Directory -Force | Out-Null
    }

    $nowUtc = (Get-Date).ToUniversalTime()
    $expiresAt = $null
    if ($Token.PSObject.Properties.Name -contains 'expires_in') {
        $expiresAt = $nowUtc.AddSeconds([int]$Token.expires_in).ToString('o')
    }

    $payload = [ordered]@{
        created_at_utc            = $nowUtc.ToString('o')
        expires_at_utc            = $expiresAt
        scope                     = $ScopeString
        access_token              = (Get-ConfigValue -Config $Token -Name 'access_token')
        expires_in                = (Get-ConfigValue -Config $Token -Name 'expires_in')
        refresh_token             = (Get-ConfigValue -Config $Token -Name 'refresh_token')
        refresh_token_expires_in  = (Get-ConfigValue -Config $Token -Name 'refresh_token_expires_in')
    }

    $payload | ConvertTo-Json -Depth 6 | Set-Content -Path $Path -Encoding UTF8
}

function Get-TokenData {
    param([Parameter(Mandatory = $true)][string]$Path)

    if (-not (Test-Path -Path $Path)) {
        throw "Token file not found: $Path"
    }

    return Get-Content -Path $Path -Raw | ConvertFrom-Json
}

function Invoke-LinkedInTokenRequest {
    param(
        [Parameter(Mandatory = $true)][hashtable]$Body
    )

    return Invoke-RestMethod `
        -Method Post `
        -Uri 'https://www.linkedin.com/oauth/v2/accessToken' `
        -ContentType 'application/x-www-form-urlencoded' `
        -Body $Body
}

function Resolve-AccessToken {
    param(
        [string]$DirectToken,
        [string]$Path
    )

    if (-not [string]::IsNullOrWhiteSpace($DirectToken)) {
        return $DirectToken
    }

    $token = Get-TokenData -Path $Path
    if ([string]::IsNullOrWhiteSpace($token.access_token)) {
        throw 'No access token in token file.'
    }

    if (-not [string]::IsNullOrWhiteSpace($token.expires_at_utc)) {
        $expiry = [DateTime]::Parse($token.expires_at_utc).ToUniversalTime()
        if ($expiry -lt (Get-Date).ToUniversalTime().AddMinutes(2)) {
            Write-Warning 'Access token appears expired (or close to expiry). Run RefreshToken first.'
        }
    }

    return $token.access_token
}

function Get-AuthorUrn {
    param(
        [Parameter(Mandatory = $true)][string]$Token,
        [string]$OrgId
    )

    if (-not [string]::IsNullOrWhiteSpace($OrgId)) {
        return "urn:li:company:$OrgId"
    }

    try {
        $me = Invoke-RestMethod `
            -Method Get `
            -Uri 'https://api.linkedin.com/v2/me' `
            -Headers @{
                Authorization = "Bearer $Token"
                'X-Restli-Protocol-Version' = '2.0.0'
            }

        if (-not [string]::IsNullOrWhiteSpace([string]$me.id)) {
            return "urn:li:person:$($me.id)"
        }
    }
    catch {
        Write-Verbose "Could not resolve author via /v2/me. Trying /v2/userinfo fallback."
    }

    $userInfo = Invoke-RestMethod `
        -Method Get `
        -Uri 'https://api.linkedin.com/v2/userinfo' `
        -Headers @{
            Authorization = "Bearer $Token"
        }

    if ([string]::IsNullOrWhiteSpace([string]$userInfo.sub)) {
        throw 'Could not resolve LinkedIn member id from /v2/me or /v2/userinfo.'
    }

    return "urn:li:person:$($userInfo.sub)"
}

function Remove-LinkedInPost {
    param(
        [Parameter(Mandatory = $true)][string]$Token,
        [Parameter(Mandatory = $true)][string]$InputPostUrn
    )

    $target = $InputPostUrn.Trim()
    if ([string]::IsNullOrWhiteSpace($target)) {
        throw 'PostUrn must not be empty.'
    }

    $endpoint = $null
    if ($target -match '^urn:li:share:(\d+)$') {
        $shareId = $Matches[1]
        $endpoint = "https://api.linkedin.com/v2/shares/$shareId"
    }
    elseif ($target -match '^urn:li:ugcPost:[^\s]+$') {
        $encoded = [Uri]::EscapeDataString($target)
        $endpoint = "https://api.linkedin.com/v2/ugcPosts/$encoded"
    }
    elseif ($target -match '^\d+$') {
        $endpoint = "https://api.linkedin.com/v2/shares/$target"
    }
    else {
        throw 'Unsupported PostUrn format. Use urn:li:share:<id>, urn:li:ugcPost:<id>, or numeric share id.'
    }

    Invoke-RestMethod `
        -Method Delete `
        -Uri $endpoint `
        -Headers @{
            Authorization = "Bearer $Token"
            'X-Restli-Protocol-Version' = '2.0.0'
        }

    return [ordered]@{
        success  = $true
        deleted  = $target
        endpoint = $endpoint
    }
}

$secretConfig = Get-LinkedInSecretConfig -Path $SecretFile
if ($null -ne $secretConfig) {
    $secretClientId = [string](Get-ConfigValue -Config $secretConfig -Name 'ClientId')
    if ([string]::IsNullOrWhiteSpace($ClientId) -and -not [string]::IsNullOrWhiteSpace($secretClientId)) {
        $ClientId = $secretClientId
    }

    $secretClientSecret = [string](Get-ConfigValue -Config $secretConfig -Name 'ClientSecret')
    if ([string]::IsNullOrWhiteSpace($ClientSecret) -and -not [string]::IsNullOrWhiteSpace($secretClientSecret)) {
        $ClientSecret = $secretClientSecret
    }

    $secretRedirectUri = [string](Get-ConfigValue -Config $secretConfig -Name 'RedirectUri')
    if ([string]::IsNullOrWhiteSpace($RedirectUri) -and -not [string]::IsNullOrWhiteSpace($secretRedirectUri)) {
        $RedirectUri = $secretRedirectUri
    }

    $secretOrganizationId = [string](Get-ConfigValue -Config $secretConfig -Name 'OrganizationId')
    if ([string]::IsNullOrWhiteSpace($OrganizationId) -and -not [string]::IsNullOrWhiteSpace($secretOrganizationId)) {
        $OrganizationId = $secretOrganizationId
    }

    $secretAccessToken = [string](Get-ConfigValue -Config $secretConfig -Name 'AccessToken')
    if ([string]::IsNullOrWhiteSpace($AccessToken) -and -not [string]::IsNullOrWhiteSpace($secretAccessToken)) {
        $AccessToken = $secretAccessToken
    }

    $secretRefreshToken = [string](Get-ConfigValue -Config $secretConfig -Name 'RefreshToken')
    if ([string]::IsNullOrWhiteSpace($RefreshToken) -and -not [string]::IsNullOrWhiteSpace($secretRefreshToken)) {
        $RefreshToken = $secretRefreshToken
    }

    $secretScopes = Get-ConfigValue -Config $secretConfig -Name 'Scopes'
    if (-not $Scopes -and $null -ne $secretScopes) {
        if ($secretScopes -is [System.Array]) {
            $Scopes = @($secretScopes)
        }
        else {
            $Scopes = @([string]$secretScopes)
        }
    }

    $secretTokenFile = [string](Get-ConfigValue -Config $secretConfig -Name 'TokenFile')
    if (-not [string]::IsNullOrWhiteSpace($secretTokenFile) -and $TokenFile -eq (Join-Path $env:USERPROFILE '.linkedin/token.json')) {
        $TokenFile = $secretTokenFile
    }
}

if (-not $Scopes) {
    $Scopes = @('openid', 'profile', 'w_member_social')
}

switch ($Action) {
    'GetAuthUrl' {
        Assert-RequiredValue -Name 'ClientId / LINKEDIN_CLIENT_ID' -Value $ClientId
        Assert-RequiredValue -Name 'RedirectUri / LINKEDIN_REDIRECT_URI' -Value $RedirectUri

        if ([string]::IsNullOrWhiteSpace($State)) {
            $State = [Guid]::NewGuid().ToString('N')
        }

        $scopeString = ConvertTo-ScopeString -InputScopes $Scopes
        $query = Get-UrlEncodedQuery -Params @{
            response_type = 'code'
            client_id     = $ClientId
            redirect_uri  = $RedirectUri
            scope         = $scopeString
            state         = $State
        }

        $url = "https://www.linkedin.com/oauth/v2/authorization?$query"
        Write-Host 'Open this URL in your browser and complete login/consent:'
        Write-Host $url
        Write-Host "State: $State"

        if ($OpenBrowser) {
            Start-Process $url | Out-Null
        }
        break
    }

    'ExchangeCode' {
        Assert-RequiredValue -Name 'ClientId / LINKEDIN_CLIENT_ID' -Value $ClientId
        Assert-RequiredValue -Name 'ClientSecret / LINKEDIN_CLIENT_SECRET' -Value $ClientSecret
        Assert-RequiredValue -Name 'RedirectUri / LINKEDIN_REDIRECT_URI' -Value $RedirectUri
        Assert-RequiredValue -Name 'Code' -Value $Code

        $response = Invoke-LinkedInTokenRequest -Body @{
            grant_type    = 'authorization_code'
            code          = $Code
            client_id     = $ClientId
            client_secret = $ClientSecret
            redirect_uri  = $RedirectUri
        }

        $scopeString = ConvertTo-ScopeString -InputScopes $Scopes
        Save-TokenData -Token $response -Path $TokenFile -ScopeString $scopeString
        Write-Host "Access token saved to: $TokenFile"
        $response | ConvertTo-Json -Depth 5
        break
    }

    'RefreshToken' {
        Assert-RequiredValue -Name 'ClientId / LINKEDIN_CLIENT_ID' -Value $ClientId
        Assert-RequiredValue -Name 'ClientSecret / LINKEDIN_CLIENT_SECRET' -Value $ClientSecret

        if ([string]::IsNullOrWhiteSpace($RefreshToken)) {
            $tokenData = Get-TokenData -Path $TokenFile
            $RefreshToken = $tokenData.refresh_token
        }
        Assert-RequiredValue -Name 'RefreshToken (argument or token file)' -Value $RefreshToken

        $response = Invoke-LinkedInTokenRequest -Body @{
            grant_type    = 'refresh_token'
            refresh_token = $RefreshToken
            client_id     = $ClientId
            client_secret = $ClientSecret
        }

        $scopeString = ConvertTo-ScopeString -InputScopes $Scopes
        Save-TokenData -Token $response -Path $TokenFile -ScopeString $scopeString
        Write-Host "Refreshed token saved to: $TokenFile"
        $response | ConvertTo-Json -Depth 5
        break
    }

    'GetMe' {
        $token = Resolve-AccessToken -DirectToken $AccessToken -Path $TokenFile
        $me = Invoke-RestMethod `
            -Method Get `
            -Uri 'https://api.linkedin.com/v2/me' `
            -Headers @{
                Authorization = "Bearer $token"
                'X-Restli-Protocol-Version' = '2.0.0'
            }

        $me | ConvertTo-Json -Depth 6
        break
    }

    'PostText' {
        Assert-RequiredValue -Name 'Text' -Value $Text

        $token = Resolve-AccessToken -DirectToken $AccessToken -Path $TokenFile
        $authorUrn = Get-AuthorUrn -Token $token -OrgId $OrganizationId

        $body = @{
            author          = $authorUrn
            lifecycleState  = 'PUBLISHED'
            specificContent = @{
                'com.linkedin.ugc.ShareContent' = @{
                    shareCommentary   = @{ text = $Text }
                    shareMediaCategory = 'NONE'
                }
            }
            visibility      = @{
                'com.linkedin.ugc.MemberNetworkVisibility' = $Visibility
            }
        }

        $result = Invoke-RestMethod `
            -Method Post `
            -Uri 'https://api.linkedin.com/v2/ugcPosts' `
            -Headers @{
                Authorization = "Bearer $token"
                'X-Restli-Protocol-Version' = '2.0.0'
            } `
            -ContentType 'application/json' `
            -Body ($body | ConvertTo-Json -Depth 10)

        $result | ConvertTo-Json -Depth 10
        break
    }

    'HealthCheck' {
        $token = Resolve-AccessToken -DirectToken $AccessToken -Path $TokenFile
        $tokenInfo = $null
        try {
            $tokenInfo = Get-TokenData -Path $TokenFile
        }
        catch {
            $tokenInfo = $null
        }

        $health = [ordered]@{
            timestamp_utc = (Get-Date).ToUniversalTime().ToString('o')
            token_file    = $TokenFile
            token_expiry  = if ($null -ne $tokenInfo) { $tokenInfo.expires_at_utc } else { $null }
            endpoints     = [ordered]@{
                userinfo = [ordered]@{ ok = $false; status = $null; detail = $null }
                me       = [ordered]@{ ok = $false; status = $null; detail = $null }
            }
        }

        try {
            $userInfo = Invoke-RestMethod `
                -Method Get `
                -Uri 'https://api.linkedin.com/v2/userinfo' `
                -Headers @{ Authorization = "Bearer $token" }

            $health.endpoints.userinfo.ok = $true
            $health.endpoints.userinfo.status = 200
            $health.endpoints.userinfo.detail = [ordered]@{
                sub  = $userInfo.sub
                name = $userInfo.name
            }
        }
        catch {
            $response = $_.Exception.Response
            if ($null -ne $response) {
                $health.endpoints.userinfo.status = [int]$response.StatusCode
            }
            $health.endpoints.userinfo.detail = $_.Exception.Message
        }

        try {
            $me = Invoke-RestMethod `
                -Method Get `
                -Uri 'https://api.linkedin.com/v2/me' `
                -Headers @{
                    Authorization = "Bearer $token"
                    'X-Restli-Protocol-Version' = '2.0.0'
                }

            $health.endpoints.me.ok = $true
            $health.endpoints.me.status = 200
            $health.endpoints.me.detail = [ordered]@{ id = $me.id }
        }
        catch {
            $response = $_.Exception.Response
            if ($null -ne $response) {
                $health.endpoints.me.status = [int]$response.StatusCode
            }
            $health.endpoints.me.detail = $_.Exception.Message
        }

        $health | ConvertTo-Json -Depth 10
        break
    }

    'DeletePost' {
        Assert-RequiredValue -Name 'PostUrn' -Value $PostUrn

        $token = Resolve-AccessToken -DirectToken $AccessToken -Path $TokenFile
        $deleteResult = Remove-LinkedInPost -Token $token -InputPostUrn $PostUrn
        $deleteResult | ConvertTo-Json -Depth 5
        break
    }
}
