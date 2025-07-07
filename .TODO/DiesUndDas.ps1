$Path = Join-Path -Path ..\www\ -ChildPath content\posts\PowerShell_Cmdlet_finden.md

Get-Content -Path $Path | Measure-Object -Word
