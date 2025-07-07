---
title: "PowerShell Scripting Best Practices"
date: 2025-07-07
description: "Die besten Methoden für PowerShell-Scripting, inklusive Fehlerbehandlung, Sicherheitsrichtlinien und Performance-Optimierung."
categories: ["PowerShell"]
---

## Best Practices für PowerShell-Scripting

Gutes PowerShell-Scripting ist mehr als das Aneinanderreihen von Befehlen. Es geht um Wartbarkeit, Lesbarkeit, Sicherheit und Performance. Hier findest du bewährte Methoden, wie du professionelle Skripte erstellst – unabhängig davon, ob du als Administrator, Entwickler oder Automatisierer arbeitest.

---

### 1. Verwende aussagekräftige Variablennamen

Vermeide kryptische Kurzformen. Gute Namen verbessern die Lesbarkeit – gerade bei Teamarbeit oder späterem Refactoring.

```powershell
$logDateiPfad = "C:\Logs\error.log"
$benutzerListe = Get-ADUser -Filter *
```

---

### 2. Kommentare für bessere Verständlichkeit

Schreibe nicht für dich – schreibe für den „zukünftigen Du“ oder deine Kollegen. Kommentare helfen enorm.

```powershell
# Ermittelt alle aktiven Benutzer und speichert sie in einer Variablen
$aktiveBenutzer = Get-ADUser -Filter {Enabled -eq $true}
```

---

### 3. Nutze `Try-Catch-Finally` für Fehlerbehandlung

Robuste Skripte können mit Fehlern umgehen:

```powershell
Try {
    Get-Item "C:\NichtVorhandeneDatei.txt"
} Catch {
    Write-Host "Fehler: $_" -ForegroundColor Red
} Finally {
    Write-Host "Skript abgeschlossen."
}
```

> 🔄 `Finally` wird immer ausgeführt – ideal für Aufräumarbeiten oder Logging.

---

### 4. Setze Funktionen für wiederverwendbaren Code ein

Funktionen machen deinen Code modular und wiederverwendbar:

```powershell
Function Get-FreierSpeicher {
    Param($Laufwerk)
    Get-PSDrive -Name $Laufwerk | Select-Object Used, Free
}
```

---

### 5. Verwende Module für größere Projekte

Bei umfangreichen Skripten solltest du ein Modul erstellen:

```powershell
New-ModuleManifest -Path "C:\MeinModul\MeinModul.psd1"
```

Das erhöht Wiederverwendbarkeit und erleichtert Wartung und Deployment.

---

### 6. Parameter validieren

Vermeide fehlerhafte Eingaben durch gezielte Validierung:

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

> 🎯 Validierung macht Skripte sicherer und nutzerfreundlicher.

---

### 7. Logging in Skripten implementieren

Protokolliere, was dein Skript macht. Das erleichtert Fehlersuche und Nachvollziehbarkeit:

```powershell
Function Write-Log {
    Param([string]$Nachricht)
    "$(Get-Date) - $Nachricht" | Out-File "C:\Logs\script.log" -Append
}
```

---

### 8. Automatisierte Tests mit Pester nutzen

Qualitätssicherung für PowerShell – mit dem Pester-Modul:

```powershell
Describe "Get-FreierSpeicher Tests" {
    It "Soll eine Ausgabe mit Werten haben" {
        Get-FreierSpeicher C | Should -Not -BeNullOrEmpty
    }
}
```

Tests gehören in produktiven Skripten heute zum Standard.

---

### 9. Skripte digital signieren

Skript-Sicherheit erhöhen und Vertrauen schaffen:

```powershell
Set-AuthenticodeSignature -FilePath "MeinSkript.ps1" -Certificate (Get-ChildItem Cert:\CurrentUser\My -CodeSigningCert)
```

> 🔐 Besonders wichtig in sicherheitskritischen Umgebungen.

---

### 10. Performance optimieren

Vermeide ineffiziente Schleifen und unnötige Aufrufe:

```powershell
# Langsame Variante vermeiden
Get-ADUser -Filter * | ForEach-Object { $_.SamAccountName }

# Schneller:
$BenutzerNamen = (Get-ADUser -Filter *).SamAccountName
```

Auch Caching und gezieltes Filtern wirken Wunder.

---

## Bonus: Weitere Tipps für sauberes Scripting

- Nutze `Set-StrictMode` zur Fehlervermeidung
- Verwende `#Requires` für Versions- und Modulabhängigkeiten
- Halte Funktionen kurz und thematisch fokussiert
- Vermeide globale Variablen – arbeite mit Rückgabewerten
- Dokumentiere alle Eingaben, Ausgaben und Seiteneffekte

---

## Fazit

Professionelles PowerShell-Scripting braucht Struktur, Disziplin und Weitblick. Mit diesen Best Practices entwickelst du Skripte, die nicht nur funktionieren, sondern auch wartbar, sicher und performant sind.

📚 In meinem [PowerShell-Seminar für Fortgeschrittene](https://attilakrick.com/powershell/powershell-seminare/) vertiefen wir genau diese Aspekte – praxisnah und mit vielen realen Beispielen.

---

**Fragen zu deinem PowerShell-Skript oder Wunsch nach Code-Review?**  
👉 [Jetzt Kontakt aufnehmen!](https://attilakrick.com/Kontakt)
