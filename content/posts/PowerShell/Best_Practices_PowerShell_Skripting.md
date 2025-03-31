---
title: "PowerShell-Scripting Best Practices - Effiziente Automatisierung und Sicherheit"
date: 2025-03-16
description: "Die besten Methoden für PowerShell-Skripting, inklusive Fehlerbehandlung, Sicherheitsrichtlinien und Performance-Optimierung."
tags: ["PowerShell", "Skripting", "Automatisierung", "Sicherheit", "Best Practices"]
---

## Best Practices für PowerShell-Skripting

### 1. Verwende aussagekräftige Variablennamen

Nutze sprechende Variablennamen, um die Lesbarkeit und Wartbarkeit zu verbessern:

```powershell
$logDateiPfad = "C:\Logs\error.log"
$benutzerListe = Get-ADUser -Filter *
```

### 2. Kommentare für bessere Verständlichkeit

Füge sinnvolle Kommentare hinzu, um die Nachvollziehbarkeit zu erhöhen:

```powershell
# Ermittelt alle aktiven Benutzer und speichert sie in einer Variablen
$aktiveBenutzer = Get-ADUser -Filter {Enabled -eq $true}
```

### 3. Nutze `Try-Catch-Finally` für Fehlerbehandlung

Ein gutes Fehlerhandling macht Skripte robuster:

```powershell
Try {
    Get-Item "C:\NichtVorhandeneDatei.txt"
} Catch {
    Write-Host "Fehler: $_" -ForegroundColor Red
} Finally {
    Write-Host "Skript abgeschlossen."
}
```

### 4. Setze Funktionen für wiederverwendbaren Code ein

Funktionen helfen, Code sauber zu strukturieren:

```powershell
Function Get-FreierSpeicher {
    Param($Laufwerk)
    Get-PSDrive -Name $Laufwerk | Select-Object Used, Free
}
```

### 5. Verwende Module für größere Projekte

Strukturiere größere Skripte mit Modulen:

```powershell
New-ModuleManifest -Path "C:\MeinModul\MeinModul.psd1"
```

### 6. Parameter validieren

Nutze `[Validate*]`-Attribute, um Parameter sicherer zu machen:

```powershell
Function Set-BenutzerPasswort {
    Param(
        [Parameter(Mandatory)]
        [ValidatePattern("^[a-zA-Z0-9]{8,}$")]
        [string]$NeuesPasswort
    )
    # Passwort setzen
}
```

### 7. Logging in Skripten implementieren

Protokolliere wichtige Aktionen, um Fehler zu analysieren:

```powershell
Function Write-Log {
    Param([string]$Nachricht)
    "$(Get-Date) - $Nachricht" | Out-File "C:\Logs\script.log" -Append
}
```

### 8. Automatisierte Tests mit Pester nutzen

Verwende **Pester**, um Skripte zu testen:

```powershell
Describe "Get-FreierSpeicher Tests" {
    It "Soll eine Ausgabe mit Werten haben" {
        Get-FreierSpeicher C | Should -Not -BeNullOrEmpty
    }
}
```

### 9. Skripte digital signieren

Sicherheit erhöhen durch signierte Skripte:

```powershell
Set-AuthenticodeSignature -FilePath "MeinSkript.ps1" -Certificate (Get-ChildItem Cert:\CurrentUser\My -CodeSigningCert)
```

### 10. Performance optimieren

Nutze effiziente Methoden für hohe Performance:

```powershell
# Vermeide langsame Schleifen mit ForEach-Object
$BenutzerNamen = (Get-ADUser -Filter *).SamAccountName
```
