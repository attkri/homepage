---
draft: false
date: 2025-03-31
title: "Objekte, Pipeline & Cmdlets – So arbeitest du effizient mit PowerShell"
description: "Verstehe das Herzstück von PowerShell: Die Pipeline, objektbasierte Verarbeitung und der gezielte Umgang mit Cmdlets. Ideal für Einsteiger und aufstrebende Automatisierer."
categories: ["PowerShell"]
tags: ["Pipeline", "Objekte"]
author: "Attila Krick"

cover:
  image: "/images/cover/PowerShell-Pipelining-FlipChart-Vorschau.webp"
  alt: "PowerShell Pipelining visualisiert auf einem Flipchart"
  caption: "Objekte fließen durch die Pipeline – das Grundprinzip von PowerShell"
  relative: false

editPost:
  URL: "https://github.com/attkri/homepage/tree/main/content/posts/PowerShell/Objekte_Pipeline_Cmdlets.md"
  Text: "Diesen Artikel bearbeiten"
  appendFilePath: true

showToc: true
TocOpen: false
comments: true
ShowReadingTime: true
ShowBreadCrumbs: true
ShowPostNavLinks: true
ShowShareButtons: true
ShowCodeCopyButtons: true
ShowWordCount: false

assets:
  disableHLJS: true
---

## So funktioniert PowerShell wirklich – mit Objekten & Pipeline

Jetzt wird’s technisch – aber keine Sorge: In diesem Beitrag lernst du Schritt für Schritt, wie PowerShell im Inneren funktioniert. Wir schauen uns die **Objektverarbeitung**, die **Pipeline** und die clevere Kombination von Cmdlets an – so, wie PowerShell eigentlich gedacht ist.

Denn: PowerShell ist keine normale Kommandozeile – sie ist **objektbasiert**. Und genau das macht sie so einzigartig und leistungsfähig.

---

### Warum PowerShell keine Texte verarbeitet – sondern Objekte

In klassischen Shells bekommst du oft nur Text zurück – z. B. bei `ipconfig`. In PowerShell erhältst du **strukturierte Objekte**, mit Eigenschaften und Methoden. Das ist ein riesiger Vorteil, denn damit kannst du gezielt auf Werte zugreifen, filtern und weiterverarbeiten.

Beispiel:

```powershell
Get-Process
```

zeigt nicht nur eine Texttabelle, sondern liefert eine Liste von **Prozessobjekten** mit Eigenschaften wie `Name`, `Id`, `WorkingSet`, etc.

Du willst wissen, was du mit diesen Objekten machen kannst?
Nutze dieses Cmdlet zur Analyse:

```powershell
Get-Process | Get-Member
```

(Der Alias dafür ist `gm`)

---

### Die Pipeline – das Herzstück von PowerShell

Mit dem Pipe-Zeichen `|` leitest du die Ausgabe eines Cmdlets direkt an das nächste weiter. Und da es Objekte sind, bleibt die Struktur erhalten.

Ein Beispiel für einen einfachen Datenfluss:

```powershell
Get-Service | Where-Object Status -eq "Running" | Sort-Object DisplayName
```

Was passiert hier?

1. `Get-Service` holt alle Dienste
2. `Where-Object` filtert nur laufende (`Running`) heraus
3. `Sort-Object` sortiert sie nach Namen

Objekt rein – Objekt raus. So einfach.

---

### Was ist ein Cmdlet eigentlich?

Ein Cmdlet (sprich: „Command-Let“) ist der kleinste Befehl in PowerShell. Jedes Cmdlet folgt der Konvention `Verb-Noun`, z. B.:

- `Get-Process`
- `Set-Location`
- `Remove-Item`

Cmdlets sind **modular**, oft über PowerShell-Module bereitgestellt und lassen sich über `Get-Command` oder `Find-Command` finden.

---

### Daten selektieren, filtern & ausgeben

Mit Cmdlets wie `Select-Object`, `Where-Object` und `Sort-Object` kannst du Daten verarbeiten wie ein echter Datenjongleur:

```powershell
Get-ChildItem -Path C:\Windows -File \
| Where-Object Length -ge 10KB \
| Select-Object Name, Length \
| Sort-Object Length -Descending
```

Jeder Schritt liefert wieder ein Objekt – perfekt für weitere Verarbeitung oder Ausgabe.

---

### Bonus: Ausgabe als CSV-Datei speichern

Du möchtest Ergebnisse weitergeben oder archivieren? Kein Problem:

```powershell
Get-Process \
| Select-Object Name, Id, @{Name='RAM_MB';Expression={ [math]::Round($_.WorkingSet/1MB,2) }} \
| ConvertTo-Csv -Delimiter ";" \
| Out-File "$env:TEMP\\prozesse.csv"
```

So exportierst du strukturierte Daten in eine Datei – ideal für Reporting, Audits oder Excel-Nutzer.

---

### Fazit & Ausblick

Jetzt hast du das Herzstück von PowerShell verstanden:

- PowerShell verarbeitet Objekte statt Text
- Die Pipeline leitet Daten weiter – effizient und elegant
- Cmdlets lassen sich logisch kombinieren

In einem der nächsten Beiträge zeige ich dir, wie du **eigene Cmdlets und Funktionen schreibst** oder die PowerShell zur **SQL-Automatisierung** nutzt.

---

**Noch Fragen oder Interesse an individueller Beratung?**
👉 [Kontaktiere mich hier!](https://attilakrick.com/kontakt)
