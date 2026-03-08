[CmdletBinding()]
param()

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$repoRoot = Split-Path -Path $PSScriptRoot -Parent
$canonicalScript = Join-Path -Path $repoRoot -ChildPath '.opencode/scripts/LinkedIn.ps1'

if (-not (Test-Path -LiteralPath $canonicalScript)) {
    throw "Canonical LinkedIn script not found: $canonicalScript"
}

& $canonicalScript @args
exit $LASTEXITCODE
