---
draft: false
date: 2026-02-08T00:00:00+02:00
title: "PowerShell Sicherheit: Execution Policy, Signierung, Hardening"
description: "So setzt du PowerShell sicher ein: Execution Policy, Script-Signierung und konkrete Hardening-Schritte für produktive Umgebungen."
aliases:
  - /powershell/powershell-sicherheit/
  - /powershell/verschluesseln-mit-powershell/
categories:
  - PowerShell
tags:
  - powershell-security
  - execution-policy
  - script-signing
  - hardening
author: "Attila Krick"
cover:
  image: cover.webp
  alt: "PowerShell-Sicherheit mit Execution Policy und Best Practices"
  caption: "Execution Policy richtig einsetzen und Risiken im Betrieb senken"
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

Dieser Artikel beantwortet eine konkrete Frage: **Wie setzt du PowerShell in produktiven Umgebungen sicher ein, ohne dein Team auszubremsen?**

> Stand: 2026-02  
> Getestet mit: PowerShell 7.5 (`pwsh`) und Windows PowerShell 5.1 in Unternehmensumgebungen.

## Security-Grundsatz: Execution Policy ist wichtig, aber nicht allein ausreichend

Execution Policies steuern, ob und unter welchen Bedingungen Skripte ausgeführt werden. Sie sind ein wichtiger Schutzbaustein, aber kein vollständiger Sicherheitsersatz.

Aktuelle Konfiguration prüfen:

```powershell
Get-ExecutionPolicy
Get-ExecutionPolicy -List
```

## Die wichtigsten Policies im Überblick

| Policy | Bedeutung | Typischer Einsatz |
| --- | --- | --- |
| `Restricted` | keine Skriptausführung | harte Standardvorgabe auf manchen Windows-Setups |
| `AllSigned` | nur signierte Skripte | hohe Compliance-Anforderungen |
| `RemoteSigned` | lokale Skripte erlaubt, Remote-Skripte signiert | praxisnaher Standard in vielen Teams |
| `Unrestricted` | Ausführung mit Warnhinweisen | nur mit klarer Risikoabwägung |
| `Bypass` | keine Policy-Prüfung | eng begrenzte Sonderfälle |

Beispiel für eine kontrollierte Benutzer-Policy:

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

## Scopes richtig verstehen

PowerShell-Policies können in verschiedenen Scopes gesetzt sein:

- `MachinePolicy` (GPO, höchste Priorität)
- `UserPolicy` (GPO für Benutzer)
- `Process` (nur aktuelle Sitzung)
- `CurrentUser` (aktueller Benutzer)
- `LocalMachine` (alle lokalen Benutzer)

Wenn GPO-Policies gesetzt sind, überschreiben sie lokale Änderungen.

## PowerShell sicher konfigurieren in der Praxis

## Best Practices für sichere Skriptnutzung

- produktive Skripte signieren
- Eingaben validieren und Fehlerpfade testen
- `try/catch/finally` konsequent einsetzen
- `#Requires` für Versionen und Module nutzen
- Logging und nachvollziehbare Exit-Codes einbauen
- `Set-StrictMode -Version Latest` in kritischen Skripten prüfen

## Zusätzliche Schutzmechanismen

- `PSScriptAnalyzer` für statische Qualitäts- und Sicherheitschecks
- JEA (Just Enough Administration) für minimale Rechte
- Constrained Language Mode in gehärteten Umgebungen
- WDAC/App-Control-Ansätze für vertrauenswürdige Ausführung

## Häufige Fragen

**Kann ich die Policy für ein einzelnes Skript umgehen?**  
Ja, technisch zum Beispiel über `-ExecutionPolicy Bypass`, aber nur in klar dokumentierten Ausnahmefällen.

**Gilt Execution Policy auch auf Linux/macOS?**  
Nicht im gleichen Sinne wie unter Windows. Dort greifen andere Sicherheitsmechanismen (Berechtigungen, Laufzeitumgebung, OS-Hardening).

## Weiterführende Inhalte

- [PowerShell Scripting Best Practices]({{< relref "/Artikel/Best_Practices_PowerShell_Scripting/index.md" >}})
- [Sicherheit: Wie viel PowerShell ist sinnvoll?]({{< relref "/Artikel/Sicherheit_wie_viel_PowerShell/index.md" >}})
- [PowerShell Cmdlets finden]({{< relref "/Artikel/PowerShell_Cmdlet_finden/index.md" >}})
- [PowerShell-Hilfe richtig nutzen]({{< relref "/Artikel/PowerShell-Hilfe_nutzen/index.md" >}})
- [PowerShell in VS Code produktiv einrichten]({{< relref "/Artikel/VSCode_Starter/index.md" >}})
- [Leistungen]({{< relref "/Leistung/index.md" >}})
- [Kontakt]({{< relref "/Kontakt/index.md" >}})

## Fazit

Sicherer PowerShell-Einsatz entsteht durch mehrere Ebenen: sinnvolle Policy, saubere Skriptqualität, minimale Rechte und überprüfbare Betriebsprozesse. Genau diese Kombination reduziert Risiken nachhaltig.
