---
title: "Integration von PowerShell in Visual Studio Code"
date: 2025-03-18
description: "Wie man PowerShell effizient in VS Code nutzt - Installation, Konfiguration und Tipps für eine produktive Arbeitsumgebung."
categories: ["PowerShell"]
tags: ["PowerShell", "VS Code", "Skripting", "Debugging", "Produktivität"]
draft: false
cover:
  image: "/images/cover/vscode-powershell.webp"
  alt: "PowerShell-Integration in VS Code"
---

## Warum PowerShell mit VS Code nutzen?

Viele Entwickler und IT-Administratoren setzen *Visual Studio Code (VS Code)* als bevorzugte Entwicklungsumgebung für PowerShell-Skripte ein. Die Kombination aus *leichtgewichtigem Editor, leistungsstarken Erweiterungen und integrierten Debugging-Features* macht VS Code zu einer idealen Plattform für PowerShell-Entwicklung. Zusätzlich ermöglicht es eine einheitliche Entwicklungserfahrung über verschiedene Betriebssysteme hinweg, da VS Code sowohl unter Windows als auch auf macOS und Linux verfügbar ist.

## Installation der PowerShell-Erweiterung

Damit VS Code PowerShell optimal unterstützt, benötigst du die **PowerShell-Erweiterung**. Diese bietet:

- **Syntaxhervorhebung** für besser lesbaren Code
- **IntelliSense** für Autovervollständigung und Parameterhilfe
- **Debugging-Funktionen**, um Skripte effizient zu testen
- **Integrierte PowerShell-Konsole** für direkten Code-Output
- **Erweiterte Fehleranalyse** für bessere Fehlersuche

### Schritte zur Installation

1. VS Code herunterladen und installieren  
   - [Download VS Code](https://code.visualstudio.com/)

2. PowerShell-Erweiterung hinzufügen  
   - Öffne VS Code
   - Gehe zu Erweiterungen (`Ctrl + Shift + X`)
   - Suche nach `PowerShell`
   - Klicke auf Installieren

3. PowerShell als Standard-Terminal setzen  
   - Öffne die Einstellungen (`Strg + ,`)
   - Suche nach `terminal.integrated.defaultProfile.windows`
   - Setze den Wert auf `PowerShell`

## VS Code für PowerShell optimieren

### Automatische Formatierung aktivieren

Um sicherzustellen, dass dein Code sauber und einheitlich bleibt, kannst du die Auto-Formatierung aktivieren:

1. Öffne die VS Code **Einstellungen** (`Strg + ,`).
2. Suche nach `editor.formatOnSave`.
3. Setze den Wert auf `true`.

```json
"editor.formatOnSave": true
```

### Standard-Terminal auf PowerShell setzen

Falls VS Code ein anderes Terminal nutzt, kannst du es wie folgt ändern:

1. Gehe zu den **Einstellungen** (`Strg + ,`).
2. Suche nach `terminal.integrated.defaultProfile.windows`.
3. Setze den Wert auf `PowerShell`.

```json
"terminal.integrated.defaultProfile.windows": "PowerShell"
```

### Erweiterte Tastenkombinationen für PowerShell nutzen

- **Aktuelle Zeile ausführen**: In `.ps1`-Dateien kann die aktuelle Zeile mit `F8` ausgeführt werden.
- **Skript starten**: Drücke `F5`, um das gesamte Skript auszuführen.
- **Fehlersuche starten**: Setze einen Breakpoint und starte das Debugging mit `F5`.

## Debugging von PowerShell-Skripten

Eine der größten Stärken von VS Code ist das **integrierte Debugging** für PowerShell. So kannst du Fehler schneller finden und beheben.

### Breakpoints setzen und Debugging starten

1. Breakpoint setzen: Klicke links neben eine Zeilennummer.
2. Debugging starten (`F5`).
3. Variablen überwachen und durch den Code schrittweise gehen.
4. Eingabeaufforderung für interaktives Debugging nutzen, um Werte in Echtzeit zu verändern.

## Tipps für eine produktive Umgebung

- **Zusätzliche VS Code Extensions**
  - "Bracket Pair Colorizer" für farbige Klammern
  - "Code Spell Checker" für weniger Tippfehler
  - "PowerShell Pro Tools" für erweiterte Skriptfunktionen

## Fazit

Die Integration von PowerShell in Visual Studio Code macht die Entwicklung deutlich komfortabler und effizienter. Mit der richtigen Konfiguration, Debugging-Tools und erweiterten Features kannst du produktiver arbeiten und deine Skripte schneller optimieren.

Nutze die gezeigten Einstellungen und steigere deine Produktivität mit VS Code und PowerShell!
