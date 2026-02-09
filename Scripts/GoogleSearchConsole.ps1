#requires -Version 7.0
<#[
.SYNOPSIS
  Exportiert Google Search Console Search Analytics Daten (Queries & Pages) per Service Account.

.DESCRIPTION
  Dieses Skript erstellt ein JWT für einen Google Service Account, holt ein Access Token
  und ruft die Search Console API (searchAnalytics.query) ab. Es exportiert CSV/JSON Dateien.

.NOTES
  - Das Service-Account-JSON niemals committen.
  - Der Service Account muss in der GSC-Property als Nutzer hinzugefügt werden.
#>

[CmdletBinding()]
param(
  [Parameter(Mandatory)]
  [string]$ServiceAccountJsonPath,

  [Parameter(Mandatory)]
  [string]$SiteUrl,

  [Parameter()]
  [datetime]$StartDate = (Get-Date).AddMonths(-3).Date,

  [Parameter()]
  [datetime]$EndDate = (Get-Date).Date,

  [Parameter()]
  [string]$OutputDir = (Join-Path $PSScriptRoot "gsc-exports"),

  [Parameter()]
  [int]$RowLimit = 25000
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function New-GoogleServiceAccountToken {
  param(
    [Parameter(Mandatory)][string]$ClientEmail,
    [Parameter(Mandatory)][string]$PrivateKeyPem,
    [Parameter(Mandatory)][string]$TokenUri,
    [Parameter(Mandatory)][string]$Scope
  )

  $now = [DateTimeOffset]::UtcNow
  $iat = [int]$now.ToUnixTimeSeconds()
  $exp = [int]$now.AddMinutes(55).ToUnixTimeSeconds()

  $header = @{ alg = "RS256"; typ = "JWT" } | ConvertTo-Json -Compress
  $payload = @{
    iss   = $ClientEmail
    scope = $Scope
    aud   = $TokenUri
    iat   = $iat
    exp   = $exp
  } | ConvertTo-Json -Compress

  function ConvertTo-Base64Url([byte[]]$bytes) {
    $b64 = [Convert]::ToBase64String($bytes)
    $b64 = $b64.TrimEnd("=")
    $b64 = $b64.Replace("+", "-").Replace("/", "_")
    return $b64
  }

  $headerB64 = ConvertTo-Base64Url ([Text.Encoding]::UTF8.GetBytes($header))
  $payloadB64 = ConvertTo-Base64Url ([Text.Encoding]::UTF8.GetBytes($payload))
  $unsignedJwt = "$headerB64.$payloadB64"

  $rsa = [System.Security.Cryptography.RSA]::Create()
  try {
    $rsa.ImportFromPem($PrivateKeyPem)
  } catch {
    throw "Private Key konnte nicht geladen werden. Prüfe das JSON-Format (private_key)."
  }

  $dataBytes = [Text.Encoding]::UTF8.GetBytes($unsignedJwt)
  $signature = $rsa.SignData($dataBytes, [System.Security.Cryptography.HashAlgorithmName]::SHA256, [System.Security.Cryptography.RSASignaturePadding]::Pkcs1)
  $signedJwt = "$unsignedJwt.$(ConvertTo-Base64Url $signature)"

  $tokenResponse = Invoke-RestMethod -Method Post -Uri $TokenUri -Body @{
    grant_type = "urn:ietf:params:oauth:grant-type:jwt-bearer"
    assertion  = $signedJwt
  }

  return $tokenResponse.access_token
}

function Invoke-GscQuery {
  param(
    [Parameter(Mandatory)][string]$AccessToken,
    [Parameter(Mandatory)][string]$SiteUrl,
    [Parameter(Mandatory)][datetime]$StartDate,
    [Parameter(Mandatory)][datetime]$EndDate,
    [Parameter(Mandatory)][string[]]$Dimensions,
    [Parameter()][int]$RowLimit = 25000
  )

  $encodedSite = [System.Uri]::EscapeDataString($SiteUrl)
  $uri = "https://searchconsole.googleapis.com/webmasters/v3/sites/$encodedSite/searchAnalytics/query"

  $body = @{
    startDate = $StartDate.ToString("yyyy-MM-dd")
    endDate   = $EndDate.ToString("yyyy-MM-dd")
    dimensions = $Dimensions
    rowLimit  = $RowLimit
  } | ConvertTo-Json

  $headers = @{ Authorization = "Bearer $AccessToken" }
  return Invoke-RestMethod -Method Post -Uri $uri -Headers $headers -Body $body -ContentType "application/json"
}

if (-not (Test-Path $ServiceAccountJsonPath)) {
  throw "ServiceAccountJsonPath nicht gefunden: $ServiceAccountJsonPath"
}

$serviceAccount = Get-Content $ServiceAccountJsonPath -Raw | ConvertFrom-Json

$scope = "https://www.googleapis.com/auth/webmasters.readonly"
$accessToken = New-GoogleServiceAccountToken -ClientEmail $serviceAccount.client_email `
  -PrivateKeyPem $serviceAccount.private_key `
  -TokenUri $serviceAccount.token_uri `
  -Scope $scope

if (-not (Test-Path $OutputDir)) {
  New-Item -ItemType Directory -Path $OutputDir | Out-Null
}

$queryResult = Invoke-GscQuery -AccessToken $accessToken -SiteUrl $SiteUrl -StartDate $StartDate -EndDate $EndDate -Dimensions @("query") -RowLimit $RowLimit
$pageResult  = Invoke-GscQuery -AccessToken $accessToken -SiteUrl $SiteUrl -StartDate $StartDate -EndDate $EndDate -Dimensions @("page")  -RowLimit $RowLimit

function Export-GscResult {
  param(
    [Parameter(Mandatory)]$Result,
    [Parameter(Mandatory)][string]$Name,
    [Parameter(Mandatory)][string]$OutputDir
  )

  $rows = @()
  if ($null -ne $Result -and $Result.PSObject.Properties.Name -contains "rows" -and $Result.rows) {
    foreach ($row in $Result.rows) {
      $rows += [pscustomobject]@{
        Key        = ($row.keys -join ", ")
        Clicks     = $row.clicks
        Impressions= $row.impressions
        CTR        = $row.ctr
        Position   = $row.position
      }
    }
  }

  $csvPath  = Join-Path $OutputDir ("gsc-$Name.csv")
  $jsonPath = Join-Path $OutputDir ("gsc-$Name.json")
  if ($rows.Count -gt 0) {
    $rows | Sort-Object -Property Impressions -Descending | Export-Csv -NoTypeInformation -Encoding UTF8 -Path $csvPath
  } else {
    @() | Export-Csv -NoTypeInformation -Encoding UTF8 -Path $csvPath
  }
  $Result | ConvertTo-Json -Depth 10 | Out-File -Encoding UTF8 -FilePath $jsonPath

  Write-Host "Exportiert: $csvPath"
  Write-Host "Exportiert: $jsonPath"
}

Export-GscResult -Result $queryResult -Name "queries" -OutputDir $OutputDir
Export-GscResult -Result $pageResult  -Name "pages"   -OutputDir $OutputDir

Write-Host "Fertig. Export-Ordner: $OutputDir"
