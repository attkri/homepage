---
#draft: true
title: "Neuerungen PowerShell 7.5 und 7.6"
date: 2025-03-14
description: "Ein Überblick über die neuen Features, Verbesserungen und bekannten Probleme in PowerShell 7.6 sowie PowerShell 7.5."
tags: ["PowerShell", "Automation", "CLI", "Scripting"]
categories: ["PowerShell"]
cover:
  image: "/images/posts/PowerShell7576.webp"  # Titelbild der Seite
  alt: "Attila Krick - IT-Spezialist"  

showToc: true
TocOpen: false
showWordCount: true
showReadingTime: true
showBreadCrumbs: true
showPostNavLinks: true
---

## PowerShell 7.6 und PowerShell 7.5: Was ist neu?

PowerShell 7.5 und 7.6 bringen viele neue Funktionen mit sich. Es basiert auch auf **.NET 9**, was bedeutet, dass es **keinen Long-Term Support (LTS)** hat.

In diesem Artikel werfen wir einen Blick auf die wichtigsten Neuerungen in **PowerShell 7.5 und 7.6**, erklären die Unterschiede und geben eine Empfehlung, ob sich ein Upgrade lohnt.

## Empfehlung: Lohnt sich der Umstieg auf PowerShell 7.5 bzw. 7.6 ?

**Für produktive Umgebungen:**
  
**Bleibe bei PowerShell 7.4 (LTS)**, da PowerShell 7.6 und 7.5 kein LTS-Support hat und 7.6 sich noch in der Preview-Phase befindet.
  
**Für Entwickler & Power-User:**

PowerShell 7.6 bietet spannende neue Features und ist ideal für Tests oder für Benutzer, die immer die neuesten Funktionen ausprobieren möchten.

- **Warte auf PowerShell 8.0**, wenn du LTS-Unterstützung benötigst.  

## PowerShell 7.5: Die wichtigsten Neuerungen

PowerShell 7.5 wurde als stabile Version veröffentlicht und enthält viele Optimierungen:

### Verbesserte JSON-Verarbeitung

PowerShell 7.5 verbessert die `ConvertTo-Json`-Funktion, um große und komplexe Objekte besser zu serialisieren.

```powershell
$Data = @{
    Name = "PowerShell 7.5"
    Features = @("Optimierte JSON-Ausgabe", "Mehr Sicherheit", "Neue Cmdlets")
} 
$Data | ConvertTo-Json -Depth 3
```

### Optimierte Sicherheit und Signierung

- Unterstützung für **Windows Defender Application Control (WDAC)**, um Skripte besser abzusichern.
- Erweiterte Sicherheitsfunktionen für `Set-AuthenticodeSignature`.

### Neue Cmdlets in PowerShell 7.5

PowerShell 7.5 führte mehrere neue Cmdlets ein:

- `Invoke-PSCommand` - Verbesserte Remoting-Steuerung.
- `Get-ProcessInfo` - Detailliertere Prozessüberwachung.
- `Start-PSProfile` - Leistungsüberwachung für PowerShell-Skripte.

## PowerShell 7.6: Was ist neu?

PowerShell 7.6 bringt weitere Verbesserungen mit sich.

### Neue Cmdlets in PowerShell 7.6

PowerShell 7.6 bringt **neun neue Cmdlets** mit:

- **`Get-FileHash`** - Unterstützt nun SHA-3.
- **`Test-JsonSchema`** - Prüft JSON-Daten auf Schema-Konformität.
- **`ConvertFrom-Base64`** / **`ConvertTo-Base64`** - Base64 Encoding/Decoding direkt in PowerShell.
- **`Get-CommandHistory`** - Erweitert die Verwaltung der Befehls-Historie.
- **`Invoke-RestMethod`** - Verbesserte Fehlerbehandlung.
- **`Test-NetworkConnection`** - Bessere Netzwerkprüfung.
- **`Get-EnvironmentVariable`** - Neuer Zugriff auf Umgebungsvariablen.
- **`Set-Clipboard` / `Get-Clipboard`** - Verbesserte Copy-Paste-Funktionalität.

Beispiel für `ConvertFrom-Base64`:

```powershell
$encoded = "SGVsbG8gV2VsdA==" 
[System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String($encoded))
```

### Verbesserte `ForEach-Object -Parallel` Verarbeitung

PowerShell 7.6 verbessert das Multithreading erheblich:

```powershell
1..10 | ForEach-Object -Parallel { "Zahl: $_" }
```

### Performance-Verbesserungen**

- Speicherverwaltung wurde weiter optimiert.
- Schnellere Verarbeitung von großen Dateien.
- Verbesserte Unterstützung für Linux/macOS.

## Bekannte Probleme

- **Kein LTS-Support** → Nicht für produktive Umgebungen geeignet.
- **`Out-GridView` fehlt weiterhin auf macOS/Linux**.
- **Kompatibilitätsprobleme mit älteren Modulen**, die auf .NET 9 basieren.

## Fazit: Solltest du auf PowerShell 7.6 upgraden?

| Nutzungstyp                 | Empfehlung                                 |
| --------------------------- | ------------------------------------------ |
| **Produktive Umgebungen**   | Nein, bleibe bei PowerShell 7.4 (LTS)      |
| **Entwicklung & Tests**     | Ja, aber nur für nicht-kritische Workloads |
| **Power-User & Neugierige** | Ja, um die neuen Features zu testen        |

Falls du ein **stabiles System** benötigst, warte auf **PowerShell 8.0 (LTS)**.

## Release-Daten

- **PowerShell 7.5 (Stable):** Veröffentlicht im **Dezember 2024**.
- **PowerShell 7.6 (Preview):** Erste Vorschauversion im **März 2025**.

Dieser Artikel wird aktualisiert, sobald neue Informationen zu PowerShell 7.6 verfügbar sind.
