---
title: "PowerShell 7.6 ist da – die wichtigsten Neuerungen auf einen Blick"
meta_title: "PowerShell 7.6 LTS: Neue Features, Breaking Changes und Praxis-Beispiele"
description: "PowerShell 7.6 LTS auf .NET 10 ist erschienen. Die wichtigsten neuen Features, Breaking Changes und was sich in der täglichen Arbeit konkret ändert – mit Code-Beispielen."
date: 2026-03-20T14:35:00+01:00
cover_image: "/images/artikel/powershell-7-6-neue-features/cover.webp"
image: "/images/artikel/powershell-7-6-neue-features/cover.webp"
author: "Attila Krick"
author_image: "/images/legacy/site/portrait-attila-krick-300x300.webp"
draft: false
---

Wer PowerShell produktiv einsetzt, kennt die kleinen Reibungen im Alltag: Tab-Completion, die bei Arrays streikt. Fehlerströme, die man umständlich in Dateien umleiten muss. Pfad-Joins, die unnötig viele Parameter brauchen. PowerShell 7.6 räumt genau an diesen Stellen auf.

Am 18. März 2026 hat Microsoft die neue Long-Term-Support-Version veröffentlicht – gebaut auf .NET 10, mit drei Jahren Support. Kein revolutionärer Umbruch, aber eine Menge Feinschliff, der sich beim täglichen Arbeiten sofort bemerkbar macht.

## Fehlerströme direkt in Variablen umleiten

Bisher brauchte man temporäre Dateien oder den Stream-Merge `2>&1`, um Fehler in einer Variablen zu sammeln. Das Feature `PSRedirectToVariable` ist jetzt Mainstream und macht diesen Umweg überflüssig.

```powershell
# Vorher: Fehler über Stream-Merge abfangen
$alles = Get-ChildItem C:\Windows\Temp -Recurse 2>&1
$fehler = $alles | Where-Object { $_ -is [System.Management.Automation.ErrorRecord] }

# Nachher: Fehler direkt in Variable umleiten
Get-ChildItem C:\Windows\Temp -Recurse 2> Variable:fehler
```

- **Weniger Boilerplate** in Skripten mit Fehlerprotokollierung – der Zwischenschritt über `2>&1` und nachträgliches Filtern entfällt.
- **Alle Ausgabeströme** unterstützt: Warning (`3>`), Verbose (`4>`), Debug (`5>`) – nicht nur Errors.
- **Temporäre Log-Dateien** fallen in vielen Fällen weg. Wer bisher `2> C:\temp\errors.txt` geschrieben hat, kann jetzt direkt mit der Variable weiterarbeiten.

## PSForEach() und PSWhere() – schneller filtern, klarer lesen

Die intrinsischen Methoden `.Where()` und `.ForEach()` waren schon immer schneller als `Where-Object` in der Pipeline. Mit PowerShell 7.6 gibt es dafür die Aliase `PSWhere()` und `PSForEach()` – lesbarer und weniger verwechselbar mit LINQ.

```powershell
# Vorher: Pipeline mit Where-Object
$services = Get-Service
$stopped = $services | Where-Object { $_.Status -eq 'Stopped' }

# Nachher: Intrinsische Methode mit klarem Namen
$stopped = $services.PSWhere({ $_.Status -eq 'Stopped' })
```

- **Bei großen Collections spürbar schneller.** Wer 1.000 oder mehr Objekte filtert, umgeht mit `PSWhere()` den Pipeline-Overhead komplett.
- **Klarerer Name** als `.Where()` – gerade in gemischten Teams mit C#-Entwicklern weniger Verwechslungsgefahr.
- **Bestehende Skripte** mit `.Where()` und `.ForEach()` funktionieren weiterhin unverändert.

## Join-Path akzeptiert jetzt Arrays

Der `-ChildPath`-Parameter von `Join-Path` nimmt jetzt `string[]` entgegen. Das klingt nach einer Kleinigkeit, spart aber bei mehrgliedrigen Pfaden spürbar Tipparbeit.

```powershell
# Vorher: Verschachteln oder AdditionalChildPath nutzen
Join-Path C:\ -ChildPath "Program Files" -AdditionalChildPath "MyApp", "config.xml"

# Nachher: Alles in einem Parameter
Join-Path C:\ -ChildPath "Program Files", "MyApp", "config.xml"
```

- **Weniger Parameter, gleiche Funktion** – Skripte werden lesbarer, besonders bei tief verschachtelten Pfaden.
- **`-AdditionalChildPath` existiert weiterhin**, ist aber in den meisten Fällen nicht mehr nötig.
- **Breaking Change:** Skripte, die `-ChildPath` mit positionellen Parametern nutzen, sollten vor dem Rollout getestet werden.

## Tab-Completion endlich konsistent

Über 30 Fixes machen die Tab-Vervollständigung in PowerShell 7.6 deutlich zuverlässiger. Wer täglich in der Konsole arbeitet, merkt den Unterschied sofort.

```powershell
# Vorher: Keine Vorschläge nach Array-Zuweisung
$servers = @("DC01", "DC02", "SQL01")
$servers.  # Tab → nichts

# Nachher: Eigenschaften und Methoden werden vorgeschlagen
$servers.  # Tab → Count, Length, Contains()...

# Registry-Pfade vervollständigen jetzt korrekt
Get-ChildItem HKLM:\Software\  # Tab → Subkeys

# Wert-Completion für New-ItemProperty
New-ItemProperty -Path ... -PropertyType  # Tab → String, DWord, QWord...
```

- **Array-Variablen und Kommando-Ergebnisse** werden jetzt korrekt inferiert – der häufigste Frustpunkt beim interaktiven Arbeiten.
- **Pfade mit Leerzeichen oder Sonderzeichen** vervollständigen zuverlässiger – relevant für UNC-Pfade und Registry.
- **Modul-Completion** funktioniert auch mit Kurznamen (`Az` statt `Az.Accounts`) und zeigt keine Duplikate mehr an.

## Kleine Cmdlet-Verbesserungen mit großer Wirkung

Neben den großen Features hat PowerShell 7.6 auch einzelne Cmdlets mit neuen Parametern ausgestattet. Zwei davon fallen im Alltag besonders auf:

`Get-Command -ExcludeModule` löst ein Problem, das jeder kennt, der mit mehreren Modulen gleichzeitig arbeitet: gleichnamige Cmdlets aus verschiedenen Quellen. Ein `Get-Command -ExcludeModule AzureRM*, MSOL*` zeigt sofort, welche Befehle aus den neuen Modulen kommen – Wildcards inklusive. Gerade bei der Migration von AzureRM nach Az oder von MSOnline nach Microsoft.Graph spart das einiges an Sucharbeit.

`Get-Clipboard -Delimiter` klingt unscheinbar, beseitigt aber einen klassischen Zwischenschritt: Wer eine kommaseparierte Serverliste aus einer E-Mail kopiert, kann sie jetzt direkt mit `Get-Clipboard -Delimiter ','` als Array abrufen und an `Test-Connection` oder `Invoke-Command` weiterreichen – ohne manuelles `-split`.

## Tilde-Expansion unter Windows – endlich konsistent

Wer zwischen Linux und Windows wechselt, hat sich vermutlich schon mehr als einmal gewundert: `~/Documents/notes.txt` funktionierte in PowerShell zwar bei eigenen Cmdlets, aber nicht bei nativen Windows-Befehlen. PowerShell 7.6 behebt das.

```powershell
# Vorher: Tilde wird bei nativen Befehlen nicht aufgelöst
Get-ChildItem -Path C:\Users\attila\.secrets # Umständlicher Pfad nötig
Get-ChildItem -Path ~\.secrets # Fehler: Datei nicht gefunden

# Nachher: Expansion funktioniert überall
Get-ChildItem -Path ~\.secrets  # Öffnet die Datei korrekt
```

- **Konsistentes Verhalten** zwischen PowerShell-Cmdlets und nativen Programmen wie `notepad.exe`, `code` oder `git`.
- **Cross-Plattform-Skripte** funktionieren jetzt ohne Sonderbehandlung für Windows – wer `~` in CI/CD-Pipelines nutzt, muss keinen Pfad-Workaround mehr einbauen.
- **Gerade im gemischten Betrieb** (Linux-Server, Windows-Workstation) spart das immer wieder kleine Irritationen.

## Tippfehler-Korrektur ist jetzt Standard

Das Feature `PSFeedbackProvider` ist Mainstream. Bei einem Tippfehler im Cmdlet-Namen schlägt PowerShell jetzt automatisch den richtigen Befehl vor.

```powershell
PS> Get-Proess
# Suggestion: Get-Process

PS> Invoke-WebRequst
# Suggestion: Invoke-WebRequest
```

- **Spart Zeit in interaktiven Sessions** – statt den Tippfehler zu suchen, bekommt man direkt den Vorschlag.
- **Besonders nützlich in Schulungsumgebungen**, wo Einsteiger häufiger mit unbekannten Cmdlet-Namen arbeiten.

## Weitere Verbesserungen im Überblick

| Feature                      | Was ändert sich                                                                                       |
| ---------------------------- | ----------------------------------------------------------------------------------------------------- |
| **NO_COLOR-Support**         | `stderr` respektiert die Umgebungsvariable `NO_COLOR` – saubere Log-Dateien ohne ANSI-Sequenzen       |
| **Hex-Exit-Codes**           | Native Fehler-Codes erscheinen jetzt als Hex und Dezimal (`0x80070005 / -2147024891`)                 |
| **Tausender-Trennzeichen**   | `[bigint]'1,000,000'` funktioniert – lesbarer bei großen Zahlen                                       |
| **Out-GridView repariert**   | Der veraltete `BinaryFormatter` wurde durch eine sichere Implementierung ersetzt                      |
| **Start-Process -Wait**      | Effizienteres Polling – weniger CPU-Last bei langen Wartezeiten                                       |
| **Invoke-WebRequest -Debug** | Zeigt Request- und Response-Details im Debug-Stream – erleichtert API-Debugging direkt in der Konsole |

## Breaking Changes – was vor dem Rollout prüfen?

PowerShell 7.6 bringt drei Breaking Changes mit:

1. **Join-Path -ChildPath** ist jetzt `string[]` – Skripte mit positionellen Parametern testen.
2. **ThreadJob-Modul umbenannt** zu `Microsoft.PowerShell.ThreadJob` – ein Proxy-Modul sorgt für Rückwärtskompatibilität, aber wer den alten modulqualifizierten Namen `ThreadJob\Start-ThreadJob` explizit nutzt, sollte umstellen.
3. **WildcardPattern.Escape()** escaped jetzt auch einzelne Backticks korrekt – manuelle Workarounds können zu doppeltem Escaping führen.

Keiner dieser Punkte ist dramatisch, aber wer automatisierte Deployments betreibt, sollte vor dem Rollout einen Testlauf einplanen.

## Installation und Update

```powershell
# Neu installieren
winget install --id Microsoft.PowerShell --source winget

# Bestehende Installation aktualisieren
winget upgrade --id Microsoft.PowerShell

# Version prüfen
$PSVersionTable.PSVersion
```

## Einordnung

PowerShell 7.6 ist kein Feature-Feuerwerk, sondern ein solides LTS-Release, das an den richtigen Stellen schleift. Die Tab-Completion-Fixes allein rechtfertigen den Update-Aufwand, und Features wie `PSRedirectToVariable` oder `PSWhere()` machen Skripte kürzer und lesbarer.

Wer produktive Automatisierung betreibt, hat mit dem LTS-Status drei Jahre Ruhe. Wer noch auf 7.4 sitzt: Der Support dafür endet am 10. November 2026 – ein guter Zeitpunkt, den Umstieg zu planen.

Wer den Schritt von 7.4 auf 7.5 noch nicht gemacht hat, findet im Artikel [Neuerungen in PowerShell 7.5](/artikel/neuerungen_powershell_75/) eine Upgrade-Checkliste. Und wer seine Skripte bei der Gelegenheit gleich robuster machen will: Die [Best Practices für PowerShell-Scripting](/artikel/best_practices_powershell_scripting/) gelten auch unter 7.6 unverändert. _(Stand: März 2026)_
