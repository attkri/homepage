---
draft: false
date: 2025-07-07
title: "Cmdlets in PowerShell clever finden"
description: "PowerShell bietet tausende Cmdlets – mit diesen Tricks findest du genau das richtige für deine Aufgabe. Inklusive Beispiele, Gallery-Tipps und GUI-Suche."
categories: ["PowerShell"]
author: "Attila Krick"

cover:
  image: "cover.webp"
  alt: "Cmdlets finden leicht gemacht"
  caption: "So findest du gezielt Cmdlets, die dein Problem lösen"
  relative: false

assets:
  disableHLJS: true
---

## Cmdlets in PowerShell clever finden

PowerShell bringt tausende Cmdlets mit – und mit jedem Modul werden es mehr. Kein Mensch kennt sie alle. Muss man auch nicht. Aber: **Man muss wissen, wie man sie findet.** Genau das zeige ich dir in diesem Beitrag.

Du lernst, mit welchen Techniken du in Sekunden **das passende Cmdlet** findest – ob du gerade eine neue Aufgabe lösen willst oder in einem Skript auf einen bestimmten Parameter stößt. Diese Methoden helfen dir sowohl beim Schreiben eigener Skripte als auch beim Verstehen fremder Automatisierung.

### 1. Suche per Verb oder Noun

Alle Cmdlets folgen der Konvention `Verb-Noun`. Diese Namenskonvention hilft dir bereits enorm beim Auffinden:

```powershell
# Suche alle Cmdlets zum Beenden von Dingen:
Get-Command -Verb Stop

# Suche alle Cmdlets, die mit „Service“ arbeiten:
Get-Command -Noun Service
```

Das ist besonders hilfreich, wenn du den groben Zweck kennst, aber nicht den genauen Namen. Die Kombination dieser Filter ergibt oft eine treffsichere Liste.

### 2. Suche nach Schlüsselwörtern im Namen

Wenn du nur einen Begriff im Kopf hast – etwa „connection“ oder „user“ –, kannst du auch mit Wildcards arbeiten:

```powershell
Get-Command -Name '*connection*'
```

Das ist ideal bei unscharfer Erinnerung oder beim Erkunden eines neuen Themengebiets.

> 💡 Probiere es z. B. mit `*cert*` für Zertifikatsverwaltung oder `*event*` für Eventlog-Befehle.

### 3. Suche per Parametername

Du kennst einen Parameter wie `-ComputerName`, weißt aber nicht, welche Cmdlets ihn unterstützen?

```powershell
Get-Command -ParameterName ComputerName
```

Das ist besonders bei Fernwartung, Netzwerkverwaltung oder Remoting-Szenarien nützlich.

### 4. Suche im richtigen Modul

Manchmal möchtest du gezielt nur Cmdlets aus einem bestimmten Modul betrachten:

```powershell
Get-Command -Module 'Microsoft.PowerShell.Management'
```

Wenn du mit Drittanbieter-Modulen arbeitest, z. B. Azure oder Exchange, grenzt das die Trefferliste stark ein. Nutze bei Bedarf:

```powershell
Get-Module -ListAvailable
```

Oder stöbere in der PowerShell Gallery:

```powershell
Find-Command -Name 'Invoke-SqlCmd'
```

> 🔎 Besonders nützlich, um **Cmdlets zu entdecken, die noch nicht installiert sind**.

### 5. Suche mit Show-Command (GUI)

Für visuelle Nutzer gibt es `Show-Command`. Damit öffnet sich ein kleines GUI-Fenster:

```powershell
Show-Command
```

Du kannst dort Cmdlets durchstöbern, Parameter befüllen und sogar direkt ausführen – ideal zum Testen und Lernen.

### 6. Suche online – aber gezielt

Die Community ist riesig – Google ist oft der schnellste Weg, vor allem mit gezielten Suchbegriffen:

```powershell
Start-Process 'https://www.google.com/search?q=powershell+new+ad+user'
```

Auch hilfreich:

- [PowerShell Cmdlet Reference](https://docs.microsoft.com/en-us/powershell/scripting/reference/)
- [PowerShell Gallery](https://www.powershellgallery.com/)

### 7. Kontext verstehen mit Get-Help

Wichtig zu wissen: `Get-Command` findet Cmdlets – aber `Get-Help` erklärt sie. Oft unterschätzt:

```powershell
Get-Help Restart-Computer -Full
```

So erkennst du, ob ein Cmdlet für deinen Fall wirklich geeignet ist. `-Examples` gibt dir direkt lauffähige Muster.

## Fazit

Du musst keine 2.000 Cmdlets auswendig können – aber du solltest wissen, **wie du das richtige findest**. Mit diesen Methoden kommst du schnell ans Ziel:

- Wildcards & Filter mit `Get-Command`
- Parametersuche nach `-ComputerName` & Co.
- Gallery-Suche mit `Find-Command`
- GUI mit `Show-Command`
- Hilfe mit `Get-Help`
- Und im Zweifel: Google!

📚 Noch mehr praktische Tipps und Übungen findest du in meinem [PowerShell Seminar für Einsteiger](https://attilakrick.com/powershell/powershell-seminare/).

---

**Noch Fragen oder Feedback?**
👉 [Kontaktiere mich hier!](https://attilakrick.com/Kontakt)
