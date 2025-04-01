---
draft: false
date: 2025-03-31
title: "PowerShell benutzen – Tools, VS Code und erste Schritte"
description: "Ein praxisnaher Leitfaden für PowerShell-Einsteiger: So richtest du deine Umgebung ein und startest deine ersten Skripte."
categories: ["PowerShell"]
author: "Attila Krick"

cover:
  image: "/images/posts/VisualStudioCode-PowerShell-Beispiel-1.webp"
  alt: "Visual Studio Code mit PowerShell-Erweiterung"
  caption: "PowerShell Skripte schreiben mit Visual Studio Code"
  relative: false

showToc: true
TocOpen: false
comments: true
ShowReadingTime: true
ShowBreadCrumbs: true
ShowPostNavLinks: true
ShowShareButtons: true
ShowCodeCopyButtons: true
#ShowWordCount: false

assets:
  disableHLJS: true
---

## PowerShell benutzen – Tools, VS Code und erste Schritte

Im ersten Teil hast du erfahren, was PowerShell ist und warum sie so mächtig ist. Jetzt geht’s ans Eingemachte: In diesem Beitrag zeige ich dir, wie du PowerShell installierst, welche Tools dir das Leben leichter machen – und wie du deine ersten Cmdlets schreibst.

### PowerShell installieren

Die klassische „Windows PowerShell“ ist auf jedem Windows 10/11 bereits vorinstalliert – in Version 5.1. Aber: Die Zukunft heißt **PowerShell 7**. Diese moderne Version ist plattformübergreifend (Windows, Linux, macOS) und basiert auf **.NET Core**.

#### So installierst du PowerShell 7 auf Windows

1. Lade das aktuelle Installationspaket von GitHub herunter: [PowerShell Releases](https://github.com/PowerShell/PowerShell/releases)
2. Wähle die passende `.msi`-Datei für dein System (z. B. `PowerShell-7.x.x-win-x64.msi`)
3. Installieren, fertig. PowerShell 7 findest du danach im Startmenü unter „PowerShell 7 (x64)“

> 💡 Die alte Windows PowerShell 5.1 und PowerShell 7 können parallel betrieben werden – das ist sogar empfehlenswert.

---

### Die besten Tools zum Arbeiten mit PowerShell

#### 1. Visual Studio Code (VS Code)

Visual Studio Code ist der perfekte Editor für PowerShell. Microsoft empfiehlt ihn offiziell als Nachfolger der alten „PowerShell ISE“.

- Kostenlos, Open Source, plattformübergreifend
- Integriertes Terminal und Debugger
- Erweiterbar mit Extensions

> 💡 Alternativ: **VSCodium** – komplett ohne Microsoft-Telemetrie

#### Diese Extensions solltest du installieren

| Erweiterung         | Beschreibung                                 |
| ------------------- | -------------------------------------------- |
| PowerShell          | Syntax-Highlighting, IntelliSense, Debugging |
| Better Comments     | Kommentiere Skripte farblich strukturiert    |
| Markdown All in One | Praktisch für Dokumentationen und Blogposts  |

Nach der Installation kannst du PowerShell-Skripte direkt in VS Code schreiben, ausführen (`F8`) und debuggen (`F5`).

#### 2. Windows Terminal

Das neue Windows Terminal ist ein echter Gamechanger:

- Mehrere Tabs für PowerShell, CMD, WSL & mehr
- Modernes Design, schnelle Eingabe
- Vollständig anpassbar

Du kannst es direkt über den Microsoft Store installieren oder via GitHub. Starte es danach über `WIN + R` → `wt`

![Windows Terminal Beispiel](/posts/powershell/WindowsTerminal-Beispiel-2.png)

---

### Erste Schritte mit Cmdlets

Jetzt wird’s praktisch. Öffne PowerShell 7 oder VS Code mit Terminal und gib folgende Zeilen ein:

```powershell
Get-Process
```

Das zeigt dir alle laufenden Prozesse als Tabelle. Noch besser:

```powershell
Get-Process | Format-List
```

Oder hübsch mit GUI:

```powershell
Get-Process | Out-GridView
```

💡 Cmdlets folgen immer dem Muster `Verb-Substantiv`, z. B. `Get-Help`, `Set-Location`, `Start-Service`

Du kannst mehrere Cmdlets mit der **Pipeline (`|`)** verbinden. Das ist eines der wichtigsten Prinzipien in PowerShell.

---

### Skripte erstellen und ausführen

In VS Code: `File > New File` → Inhalt eingeben → speichern als `.ps1`-Datei.

Beispiel:

```powershell
Get-ChildItem -Path C:\Windows -Directory
```

Drücke `F8`, um einzelne Zeilen auszuführen – oder `F5`, um das gesamte Skript zu starten.

Achtung: PowerShell schützt dich vor der Ausführung unbekannter Skripte. Du musst einmalig die **Execution Policy** ändern:

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

> Mehr zur Sicherheit und Ausführungsrichtlinien folgt in Teil 3.

---

### Fazit & Ausblick

Du hast jetzt alles, was du brauchst, um PowerShell produktiv zu nutzen: Eine moderne Shell, ein komfortables Editor-Setup und erste Befehle, mit denen du direkt loslegen kannst.

In **Teil 3** steigen wir tiefer ein: Du lernst, wie du mit Objekten arbeitest, Daten analysierst und eigene Cmdlets kombinierst.

👉 Du willst schneller vorankommen? Schau dir meine [PowerShell Seminare](https://attilakrick.com/powershell/powershell-seminare/) an – oder nimm direkt Kontakt auf.

---

**Noch Fragen oder Feedback?**  
👉 [Melde dich gern bei mir!](https://attilakrick.com/kontakt)
