---
draft: false
date: 2026-02-08T00:00:00+02:00
title: "Neuerungen in PowerShell 7.5: Upgrade-Check fuer Teams"
description: "PowerShell 7.5 im Praxiseinsatz: Was sich aendert, wie du ein Upgrade sauber pruefst und wann 7.4 LTS die bessere Wahl bleibt."
categories:
  - PowerShell
tags:
  - powershell-7-5
  - upgrade
  - scripting
  - automation
author: "Attila Krick"
cover:
  image: cover.webp
  alt: "PowerShell 7.5 Upgrade-Check fuer Teams"
  caption: "PowerShell 7.5 richtig bewerten: Risiko, Nutzen, Rollout"
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
aliases:
  - "/posts/powershell7576/"
  - "/Artikel/Neuerungen_PowerShell_75_76/"
---

## Solltest du auf PowerShell 7.5 wechseln?

PowerShell 7.5 ist seit **Dezember 2024** als stabile Version verfuegbar. Fuer viele Teams ist der Wechsel sinnvoll, wenn neue Features gebraucht werden und ein kontrollierter Rollout moeglich ist.

> Stand: 2026-02  
> Getestet mit: PowerShell 7.5 (`pwsh`) und einem modularen Upgrade-Check in Test-/Staging-Umgebungen.  
> Fokus dieses Artikels: PowerShell 7.5.  
> Die gezeigten Befehle sind so gewaehlt, dass du sie direkt in deinem eigenen Umfeld verifizieren kannst.

## Kurzempfehlung nach Einsatztyp

| Einsatztyp                                               | Empfehlung                                                       |
| -------------------------------------------------------- | ---------------------------------------------------------------- |
| Produktive Kernsysteme mit hoher Stabilitaetsanforderung | Bei **PowerShell 7.4 ([LTS](/glossar/#lts-long-term-support))** bleiben und 7.5 parallel evaluieren |
| Automatisierungsteams mit Test-/Staging-Umgebung         | **7.5 pilotieren**, dann schrittweise ausrollen                  |
| Einzelne Admin-Workstations und Dev-Umgebungen           | **7.5 direkt einsetzen**, wenn Modultests gruen sind             |

## Upgrade-Checkliste fuer PowerShell 7.5

### 1) Ist-Zustand sauber erfassen

```powershell
$PSVersionTable.PSVersion
Get-Module -ListAvailable | Sort-Object Name, Version
```

Damit dokumentierst du Version und Modulbasis vor dem Wechsel.

### 2) Kritische Module gezielt pruefen

```powershell
$requiredModules = @('Az', 'SqlServer', 'Pester')

foreach ($name in $requiredModules) {
    $module = Get-Module -ListAvailable -Name $name |
        Sort-Object Version -Descending |
        Select-Object -First 1

    [pscustomobject]@{
        Module           = $name
        InstalledVersion = if ($module) { $module.Version } else { 'nicht installiert' }
    }
}
```

Wenn kritische Module fehlen oder zu alt sind, zuerst Modulstrategie klaeren, dann upgraden.

### 3) Kernskripte mit Messwerten vergleichen

```powershell
$baseline = Measure-Command {
    1..200 | ForEach-Object {
        Get-Date | Out-Null
    }
}

$baseline.TotalMilliseconds
```

Miss vor und nach dem Wechsel dieselben Jobs. Nur so ist ein Nutzen belastbar belegbar.

## Typische Risiken im Upgrade

- Unterschiede in Modulen und Abhaengigkeiten werden oft spaet entdeckt.
- Nicht reproduzierbare Umgebungen erschweren Ursachenanalyse.
- Fehlende Rollback-Strategie verlaengert Stoerungen im Betrieb.

## So fuehrst du den Wechsel risikoarm ein

- Erst Pilotgruppe, dann stufenweiser Rollout.
- CI/CD-Pipeline mit [Pester](/glossar/#pester)-Tests vor produktiven Jobs.
- Pro Skript eine klare Rueckfalloption auf die vorherige Runtime.

## Weiterfuehrende Ressourcen

- Offizielle Releases: [PowerShell Releases auf GitHub](https://github.com/PowerShell/PowerShell/releases)
- Sicherheitsfokus: [PowerShell sicher einsetzen]({{< relref "/Artikel/PowerShell_sicher_einsetzen/index.md" >}})
- Cmdlet-Recherche: [PowerShell Cmdlet finden]({{< relref "/Artikel/PowerShell_Cmdlet_finden/index.md" >}})
- Praxisbeispiel Automation: [PowerShell und T-SQL automatisieren]({{< relref "/Artikel/PowerShell_TSQL_Automatisierung/index.md" >}})

## Unterstuetzung fuer dein Team

Wenn du PowerShell 7.5 in deinem Unternehmen strukturiert einfuehren willst, findest du hier den passenden Einstieg:

- [Leistungen]({{< relref "/Leistung/index.md" >}})
- [Kontakt]({{< relref "/Kontakt/index.md" >}})
