$Path = Join-Path -Path ..\www\ -ChildPath content\Artikel\Sicherheit_wie_viel_PowerShell\index.md

Get-Content -Path $Path | Measure-Object -Word
