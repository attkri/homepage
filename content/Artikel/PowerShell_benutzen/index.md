---
draft: false
date: 2026-02-08T00:00:00+02:00
title: "PowerShell produktiv starten: Setup mit VS Code und Windows Terminal"
description: "So richtest du PowerShell 7, VS Code und Windows Terminal sauber ein und startest mit den ersten Cmdlets ohne typische Einsteigerfehler."
aliases:
  - /powershell/gui-mit-powershell-erstellen/
categories:
  - PowerShell
tags:
  - powershell-setup
  - vscode
  - windows-terminal
  - einsteiger
author: "Attila Krick"
cover:
  image: cover.webp
  alt: "Visual Studio Code mit PowerShell-Erweiterung"
  caption: "PowerShell-Setup für produktives Arbeiten mit VS Code"
  relative: true
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

Dieser Artikel beantwortet eine konkrete Frage: **Wie richtest du PowerShell so ein, dass du vom ersten Tag an stabil und produktiv arbeiten kannst?**

> Stand: 2026-02  
> Getestet mit: PowerShell 7.5 (`pwsh`), VS Code und Windows Terminal unter Windows 11.

## 1) PowerShell 7 installieren

Windows PowerShell 5.1 ist oft bereits vorhanden, für neue Automatisierung ist aber PowerShell 7 die bessere Basis.

- Download: [PowerShell Releases](https://github.com/PowerShell/PowerShell/releases)
- passende `.msi` auswählen (zum Beispiel `win-x64`)
- Installation durchführen und `pwsh` starten

Version prüfen:

```powershell
$PSVersionTable.PSVersion
```

## 2) VS Code für PowerShell einrichten

VS Code ist der Standardeditor für PowerShell im professionellen Umfeld.

Empfohlenes Minimal-Setup:

- Erweiterung `PowerShell` von Microsoft installieren
- integriertes Terminal auf PowerShell setzen
- Formatierung beim Speichern aktivieren

```json
{
  "editor.formatOnSave": true,
  "terminal.integrated.defaultProfile.windows": "PowerShell"
}
```

## 3) Windows Terminal sinnvoll nutzen

Windows Terminal hilft, mehrere Shells sauber parallel zu betreiben.

- Tabs für PowerShell, CMD und [WSL](/glossar/#wsl-windows-subsystem-for-linux)
- schnelle Profilwechsel
- gute Lesbarkeit bei langen Sessions

![Windows Terminal Beispiel](WindowsTerminal-Beispiel-2.webp)

Start über `wt`:

```powershell
wt
```

## 4) Erste Cmdlets direkt ausprobieren

```powershell
Get-Process |
    Sort-Object CPU -Descending |
    Select-Object -First 10 Name, Id, CPU
```

```powershell
Get-Service |
    Where-Object Status -eq Running |
    Select-Object Name, Status
```

[Cmdlets](/glossar/#cmdlet) folgen in der Regel dem Muster `Verb-Noun`, zum Beispiel `Get-Help`, `Set-Location`, `Start-Service`.

## 5) Erstes Skript erstellen und sicher ausführen

Beispielskript `system-check.ps1`:

```powershell
Get-ChildItem -Path C:\Windows -Directory
```

Zum Starten einzelner Zeilen in VS Code: `F8`, für den Debuglauf: `F5`.

Falls Skriptausführung blockiert ist:

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

## Häufige Einsteigerfehler vermeiden

- zu früh mit großen Skripten starten statt mit kleinen, prüfbaren Schritten
- keine Versionsprüfung vor Supportfällen
- fehlende Fehlerbehandlung und kein Logging
- Befehle aus dem Internet ungeprüft übernehmen

## Weiterführende Inhalte

- [PowerShell verstehen]({{< relref "/Artikel/PowerShell_verstehen/index.md" >}})
- [PowerShell-Hilfe richtig nutzen]({{< relref "/Artikel/PowerShell-Hilfe_nutzen/index.md" >}})
- [PowerShell Cmdlets finden]({{< relref "/Artikel/PowerShell_Cmdlet_finden/index.md" >}})
- [PowerShell in VS Code produktiv einrichten]({{< relref "/Artikel/VSCode_Starter/index.md" >}})
- [PowerShell sicher einsetzen]({{< relref "/Artikel/PowerShell_sicher_einsetzen/index.md" >}})
- [Leistungen]({{< relref "/Leistung/index.md" >}})
- [Kontakt]({{< relref "/Kontakt/index.md" >}})

## Fazit

Mit PowerShell 7, VS Code und Windows Terminal steht deine Arbeitsumgebung auf einer stabilen Basis. Wenn Version, Editor und Ausführung sauber konfiguriert sind, wird der Einstieg deutlich schneller und spätere Automatisierung robuster.
