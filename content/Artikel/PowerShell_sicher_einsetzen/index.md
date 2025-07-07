---
draft: false
date: 2025-07-07
title: "PowerShell Execution Policies erklärt"
description: "Sicherer Umgang mit PowerShell-Skripten: Lerne, wie du Execution Policies nutzt, Risiken minimierst und Skripte verantwortungsvoll ausführst."
categories: ["PowerShell"]
author: "Attila Krick"

cover:
  image: "cover.webp"
  alt: "PowerShell Sicherheit Keywords auf einem Bildschirm"
  caption: "Verantwortungsvoller Einsatz von PowerShell beginnt mit den richtigen Policies"
  relative: false

showToc: true
TocOpen: false
comments: true
ShowReadingTime: true
ShowBreadCrumbs: true
ShowPostNavLinks: true
ShowShareButtons: true
ShowCodeCopyButtons: true

assets:
  disableHLJS: true
---

## PowerShell sicher einsetzen – Execution Policies & Best Practices

PowerShell ist mächtig – und wie bei jeder mächtigen Technologie gilt: **Mit großer Macht kommt große Verantwortung.** In diesem Beitrag erfährst du, wie du PowerShell **sicher und verantwortungsvoll einsetzt**, insbesondere mit Blick auf **Execution Policies** und ergänzende Sicherheitsmaßnahmen.

---

### Was sind Execution Policies?

Die Execution Policy regelt, **ob und welche PowerShell-Skripte auf einem System ausgeführt werden dürfen**. Sie ist **kein vollständiger Schutzmechanismus**, aber ein grundlegender Baustein in jedem Sicherheitskonzept.

Um die aktuelle Policy abzufragen:

```powershell
Get-ExecutionPolicy
```

Noch besser, für alle Scopes:

```powershell
Get-ExecutionPolicy -List
```

> 🧠 Diese Abfrage hilft dir zu erkennen, ob z. B. Gruppenrichtlinien bereits eine Policy gesetzt haben, die lokale Einstellungen überschreibt.

---

### Die wichtigsten Execution Policies im Überblick

| Policy         | Beschreibung                                                                 |
|----------------|------------------------------------------------------------------------------|
| Restricted     | Standard auf Windows: **Keine** Skriptausführung erlaubt                     |
| AllSigned      | Nur **signierte Skripte** werden ausgeführt – auch lokal                     |
| RemoteSigned   | Lokale Skripte erlaubt, Remote-Skripte nur mit Signatur                     |
| Unrestricted   | Alles wird ausgeführt – mit **Warnungen** bei Remote-Skripten               |
| Bypass         | **Keine Einschränkungen**, keine Warnungen – nur für Sonderfälle geeignet   |

Zum Setzen einer Policy:

```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
```

> 💡 Für Entwicklungsumgebungen ist `RemoteSigned` ein guter Kompromiss: flexibel, aber sicher genug.

---

### Wo gelten Execution Policies?

PowerShell erlaubt unterschiedliche Gültigkeitsbereiche (`Scopes`), z. B.:

- `MachinePolicy` – per GPO gesetzt, hat höchste Priorität
- `UserPolicy` – GPO auf Benutzerebene
- `Process` – gilt nur für die aktuelle Session
- `CurrentUser` – für den aktuellen Benutzer
- `LocalMachine` – für alle Benutzer auf dem System

Wenn du mit Gruppenrichtlinien arbeitest, überschreiben `MachinePolicy` und `UserPolicy` alles andere.

---

### Best Practices für sichere Skript-Nutzung

Sicherheit ist mehr als nur die Execution Policy. Diese Grundregeln solltest du zusätzlich beachten:

1. **Signiere produktive Skripte** mit einem vertrauenswürdigen Zertifikat
2. **Verwende Try-Catch-Finally**, um Fehler abzufangen
3. **Nutze Parameter-Validierung** wie `[ValidateSet()]`, `[ValidatePattern()]`
4. Dokumentiere Skripte sinnvoll – inkl. `#Requires`-Direktiven
5. **Meide gefährliche Aliase** in produktiven Umgebungen (`?`, `ls`, `%%`, etc.)
6. Baue bewusst **Logging und Exit-Codes** ein – besonders für Automation & Monitoring
7. Setze `Set-StrictMode -Version Latest`, um typabhängige Fehler früh zu erkennen

---

### Tools & Features für mehr Sicherheit

Neben der Policy gibt es weitere nützliche Werkzeuge:

- **PSScriptAnalyzer** – statische Codeanalyse für Best Practices
- **Just Enough Administration (JEA)** – stark eingeschränkte Rechtevergabe
- **Constrained Language Mode** – reduziert gefährliche Operationen auf Hochsicherheitsgeräten
- **Defender Application Control (WDAC)** – White-Listing von vertrauenswürdigen Skripten

Gerade in sicherheitskritischen Umgebungen lohnt sich ein Blick auf diese Werkzeuge.

---

### Häufige Fragen (FAQ)

**Kann ich die Execution Policy für ein einzelnes Skript umgehen?**  
Ja, mit `powershell.exe -ExecutionPolicy Bypass -File .\script.ps1` – aber nur, wenn du genau weißt, was du tust.

**Was ist mit PowerShell 7?**  
PowerShell 7 respektiert dieselben Policies wie Windows PowerShell, setzt aber häufig `RemoteSigned` als Default. Gilt unabhängig vom Betriebssystem.

**Funktioniert die Execution Policy auch unter Linux/macOS?**  
Nein. Unter Nicht-Windows-Systemen greift sie nicht – dort ist das Sicherheitskonzept durch Dateiberechtigungen abgedeckt.

---

### Fazit

Sicherheit in PowerShell beginnt mit einem klaren Verständnis der Execution Policies – und hört dort nicht auf. Policies allein sind kein Allheilmittel, aber ein sinnvoller Startpunkt, um unkontrollierte Skriptausführung zu verhindern.

Wenn du Skripte entwickelst oder automatisierst, frag dich immer:

- Wo kommt das Skript her?
- Welche Rechte benötigt es wirklich?
- Welche Policies gelten gerade – und warum?

📚 Mehr dazu erfährst du in meinem [PowerShell Seminar für Fortgeschrittene](https://attilakrick.com/powershell/powershell-seminare/)

---

**Noch Fragen zur sicheren PowerShell-Nutzung?**  
👉 [Kontaktiere mich gern!](https://attilakrick.com/Kontakt)
