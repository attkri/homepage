---
draft: false
date: 2026-02-08T00:00:00+02:00
title: "PowerShell Best Practices für wartbare Skripte"
description: "Best Practices für PowerShell-Scripting: Struktur, Logging, Tests mit Pester und klare Standards für Teams."
aliases:
  - /powershell/powershell-script-aufbau/
categories:
  - PowerShell
tags:
  - powershell-scripting
  - best-practices
  - pester
  - automations
author: "Attila Krick"
showToc: true
TocOpen: false
comments: true
ShowReadingTime: true
ShowBreadCrumbs: true
ShowPostNavLinks: true
ShowShareButtons: true
ShowCodeCopyButtons: true
disableHLJS: true
---

## Welche Frage beantwortet dieser Artikel?

Dieser Artikel beantwortet eine klare Frage: **Welche Regeln machen PowerShell-Skripte im Team dauerhaft wartbar und sicher betreibbar?**

> Stand: 2026-02  
> Getestet mit: PowerShell 7.4 ([LTS](/glossar/#lts-long-term-support)) und 7.5 für typische Admin- und Automatisierungsaufgaben.

## PowerShell Scripting Best Practices im Team

## 10 Best Practices für professionelles PowerShell-Scripting

### 1) Namen so waehlen, dass Absicht sofort klar ist

Lesbarkeit ist die Basis fuer Wartbarkeit. Variablen und Funktionen sollten den fachlichen Zweck zeigen, nicht nur den Datentyp.

```powershell
$logFilePath = "C:\Logs\deployment.log"
$activeUsers = Get-ADUser -Filter { Enabled -eq $true }
```

### 2) Fehler steuerbar machen statt verstecken

Nutze `try/catch/finally` konsequent und setze bei kritischen Befehlen `-ErrorAction Stop`, damit Fehler im `catch` landen.

```powershell
try {
    Get-Item "C:\NichtVorhandeneDatei.txt" -ErrorAction Stop
}
catch {
    Write-Error "Datei konnte nicht gelesen werden: $_"
}
finally {
    Write-Verbose "Aufraeumarbeiten abgeschlossen" -Verbose
}
```

### 3) Eingaben validieren, bevor Business-Logik startet

Parameter-Validierung reduziert Laufzeitfehler und macht Funktionen selbsterklaerend.

```powershell
function Set-UserPassword {
    param(
        [Parameter(Mandatory)]
        [ValidateLength(12, 128)]
        [string]$NewPassword
    )

    "Passwort wird gesetzt"
}
```

### 4) Funktionen klein und eindeutig halten

Eine Funktion sollte genau eine Aufgabe haben. Das erleichtert Testbarkeit und Wiederverwendung.

```powershell
function Get-FreeDiskSpace {
    param([Parameter(Mandatory)][string]$DriveLetter)

    Get-PSDrive -Name $DriveLetter | Select-Object Name, Used, Free
}
```

### 5) Logging standardisieren

Ohne vernuenftiges Logging wird Incident-Analyse teuer. Nutze ein einheitliches Format mit Zeitstempel und Level.

```powershell
function Write-Log {
    param(
        [Parameter(Mandatory)][string]$Message,
        [ValidateSet('INFO','WARN','ERROR')][string]$Level = 'INFO'
    )

    "$((Get-Date).ToString('s')) [$Level] $Message" |
        Out-File -FilePath "C:\Logs\script.log" -Append -Encoding utf8
}
```

### 6) Tests mit Pester als Pflichtschritt einbauen

Produktive Skripte brauchen automatisierte Tests. Schon wenige [Pester](/glossar/#pester)-Tests verhindern teure Regressionen.

```powershell
Describe "Get-FreeDiskSpace" {
    It "liefert ein Ergebnisobjekt" {
        Get-FreeDiskSpace -DriveLetter C | Should -Not -BeNullOrEmpty
    }
}
```

### 7) Sicherheitsgrenzen explizit machen

Nutze `#Requires`, least privilege und Code-Signing, wenn Skripte in sensiblen Umgebungen laufen.

```powershell
#Requires -Version 7.4
#Requires -Modules ActiveDirectory
```

### 8) Module statt Skript-Monolithen bauen

Ab einer gewissen Groesse sollten wiederverwendbare Funktionen in Module wandern. Das verbessert Versionierung und Deployment.

```powershell
New-ModuleManifest -Path "C:\Modules\Company.Automation\Company.Automation.psd1"
```

### 9) Performance mit Messwerten beurteilen

Nicht raten, messen. `Measure-Command` und gezieltes Filtern vermeiden falsche Optimierungen.

```powershell
$duration = Measure-Command {
    Get-ADUser -Filter * -Properties SamAccountName |
        Select-Object -ExpandProperty SamAccountName
}

$duration.TotalMilliseconds
```

### 10) Team-Standards verbindlich dokumentieren

Skripte bleiben nur dann stabil, wenn Konventionen klar sind: Namensschema, Logging-Format, Fehlerstrategie, Testpflicht.

## Mini-Checkliste fuer den produktiven Einsatz

- Eingaben validiert und Fehlerpfade getestet
- Logging mit Zeitstempel und Severity aktiv
- [Pester](/glossar/#pester)-Tests in CI/CD integriert
- Versions- und Modulabhaengigkeiten mit `#Requires` definiert
- Rollback-Plan fuer kritische Jobs dokumentiert

## Weiterfuehrende Inhalte

- [PowerShell sicher einsetzen]({{< relref "/Artikel/PowerShell_sicher_einsetzen/index.md" >}})
- [PowerShell Cmdlet finden]({{< relref "/Artikel/PowerShell_Cmdlet_finden/index.md" >}})
- [PowerShell Objekte und Pipeline verstehen]({{< relref "/Artikel/PowerShell_Objekte_Pipeline_Cmdlets/index.md" >}})
- [PowerShell verstehen]({{< relref "/Artikel/PowerShell_verstehen/index.md" >}})
- [Leistungen]({{< relref "/Leistung/index.md" >}})
- [Kontakt]({{< relref "/Kontakt/index.md" >}})

## Fazit

PowerShell-Skripte sind dann professionell, wenn sie auch nach Monaten nachvollziehbar, sicher und testbar bleiben. Mit diesen 10 Regeln minimierst du Betriebsrisiko und erhoehst die Geschwindigkeit im Team spuerbar.
