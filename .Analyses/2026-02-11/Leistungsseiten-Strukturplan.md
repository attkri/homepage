# Leistungsseiten-Strukturplan (Transaktionale Keywords)

- Stand: 2026-02-11
- Ziel: Mehr qualifizierte Anfragen durch klare Leistungs-Landingpages mit eindeutiger Suchintention
- Grundlage: Deine Filterliste aus der Keyword-Matrix (alle ohne `nein` gelten als `ja`)

## Warum diese Struktur

- Eine Seite beantwortet genau eine Frage und rankt stabiler für transaktionale Suchen.
- Entscheider finden schneller das passende Angebot (Schulung, Beratung, Code Review).
- Interne Verlinkung von Artikeln auf die passende Leistungsseite erhöht Conversion-Chancen.

## URL- und Seitenplan

| Priorität | Hauptkeyword | URL-Vorschlag | Seitenziel | Primäre CTA |
| --- | --- | --- | --- | --- |
| 1 | sql server beratung | `/leistung/sql-server-beratung/` | Beratungsanfrage | Kontaktgespräch anfragen |
| 1 | sql performance tuning | `/leistung/sql-performance-tuning/` | Performance-Projekt anfragen | Performance-Check anfragen |
| 2 | dotnet beratung | `/leistung/dotnet-beratung/` | Architektur/Projektunterstützung | Beratungstermin buchen |
| 2 | dotnet code review | `/leistung/dotnet-code-review/` | Review-Audit anfragen | Code-Review starten |
| 2 | wpf refactoring beratung | `/leistung/wpf-refactoring-beratung/` | Legacy-Modernisierung | Refactoring-Workshop anfragen |
| 3 | tsql workshop | `/leistung/tsql-workshop/` | Schulungsanfrage | Workshop-Termin abstimmen |

## Meta-Set pro Seite (Startvorschlag)

| URL | Title | Description |
| --- | --- | --- |
| `/leistung/sql-server-beratung/` | `SQL Server Beratung für stabile Datenplattformen | Attila Krick` | `SQL Server Beratung für Unternehmen und Behörden: Architektur, Betrieb, Stabilität und klare Handlungsempfehlungen für produktive Umgebungen.` |
| `/leistung/sql-performance-tuning/` | `SQL Performance Tuning für SQL Server | Attila Krick` | `SQL Performance Tuning mit messbaren Ergebnissen: Abfragen beschleunigen, Engpässe beheben und Datenbank-Performance nachhaltig verbessern.` |
| `/leistung/dotnet-beratung/` | `.NET Beratung für robuste Business-Anwendungen | Attila Krick` | `.NET Beratung für Architektur, Modernisierung und Umsetzungsbegleitung. Praxisnah, strukturiert und auf produktive Ergebnisse ausgelegt.` |
| `/leistung/dotnet-code-review/` | `.NET Code Review für Qualität und Wartbarkeit | Attila Krick` | `.NET Code Review mit klaren Prioritäten: Risiken erkennen, Wartbarkeit erhöhen und konkrete Maßnahmen für dein Team ableiten.` |
| `/leistung/wpf-refactoring-beratung/` | `WPF Refactoring Beratung für bestehende Anwendungen | Attila Krick` | `WPF Refactoring Beratung für Legacy-Desktop-Anwendungen: technische Schulden reduzieren, Struktur verbessern und Änderungen sicher umsetzen.` |
| `/leistung/tsql-workshop/` | `T-SQL Workshop für Teams und Projekte | Attila Krick` | `T-SQL Workshop für Unternehmen: JOINs, Performance, saubere Abfragen und praxisnahe Übungen für direkt nutzbares Teamwissen.` |

## Seitenstruktur (einheitlich)

Für jede neue Leistungsseite:

- H1: Thema + Zielgruppe
- H2: Wann ist diese Leistung sinnvoll?
- H2: Typische Probleme in Projekten
- H2: Mein Vorgehen in 4 Schritten
- H2: Ergebnisse, die du erwarten kannst
- H2: Für wen diese Leistung passt
- H2: Nächster Schritt (CTA)

## Interne Verlinkung (Pflicht)

- Von Artikeln mit passender Suchintention auf die jeweilige Leistungsseite verlinken.
- Von jeder Leistungsseite zurück auf 1-2 fachlich passende Artikel verlinken.
- Von allen Leistungsseiten auf `/kontakt/` verlinken.

## Hugo-Dateiablage (Vorschlag)

- `content/Leistung/sql-server-beratung/index.md`
- `content/Leistung/sql-performance-tuning/index.md`
- `content/Leistung/dotnet-beratung/index.md`
- `content/Leistung/dotnet-code-review/index.md`
- `content/Leistung/wpf-refactoring-beratung/index.md`
- `content/Leistung/tsql-workshop/index.md`

## Front-Matter-Template (statische Leistungsseiten)

```yaml
---
draft: false
date: 2026-02-11T00:00:00+02:00
title: "<Title>"
description: "<Description>"
comments: false
HideTags: true
---
```

## Rollout-Reihenfolge

1. `sql-server-beratung`
2. `sql-performance-tuning`
3. `dotnet-beratung`
4. `dotnet-code-review`
5. `wpf-refactoring-beratung`
6. `tsql-workshop`

## Messplan nach Veröffentlichung

- GSC beobachten: Impressionen, Klicks, CTR, Position je neuer URL.
- Zeitfenster: erste valide Tendenzen nach 4-8 Wochen.
- Erfolgskriterium: steigende Non-Brand-Impressionen + mehr Kontaktanfragen über `/kontakt/`.
