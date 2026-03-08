# AttilaKrick.com - Website-Repository

Dieses Repository enthält die berufliche Website von [Attila Krick](https://attilakrick.com).

Die README ist bewusst kurz und richtet sich an Menschen, die das Projekt schnell verstehen wollen.

## Überblick

Dieses Repository enthält Inhalte, Layouts und Konfigurationen für die Hugo-Website `attilakrick.com`.

## Voraussetzungen

- [Hugo](https://gohugo.io/) `v0.155.2 extended`
- Git

## Zweck des Projekts

- Fachartikel und Praxiswissen zu PowerShell, T-SQL und .NET veröffentlichen
- Leistungen, Kontakt und rechtliche Seiten bereitstellen
- Inhalte mit Hugo effizient pflegen und versionieren

## Technologie

- [Hugo](https://gohugo.io/) mit dem Theme [PaperMod](https://themes.gohugo.io/themes/hugo-papermod/)
- Markdown
- Versionsverwaltung und Hosting über GitHub
- OpenCode

## Projektgedächtnis (OpenCode)

Das session-übergreifende Projektwissen liegt in `.opencode/instructions/MyMemory.Instruction.md`.
`AGENTS.md` enthält Regeln und Konventionen; das Projektgedächtnis enthält Entscheidungen, Probleme/Lösungen und den aktuellen Arbeitsstand.
Single Source of Truth: `AGENTS.md` für Regeln/Workflows; `.opencode/instructions/MyMemory.Instruction.md` für Entscheidungen, Status sowie Probleme & Lösungen (inkl. Projektgedächtnis-Pfad).

## Deployment

Wenn in den `main`-Branch gepusht wird, greift die GitHub Action `Deploy Hugo site to Pages` und veröffentlicht die Website automatisch.

## Wichtige Kommandos

| Kommando         | Zweck                                          |
| ---------------- | ---------------------------------------------- |
| `hugo server -D` | Lokaler Entwicklungsserver mit Drafts          |
| `hugo --gc`      | Hugo-Cache bereinigen (Ressourcen-Verzeichnis) |

## Mitwirkung

Hinweise auf Fehler (z. B. Tippfehler, defekte Links) sind willkommen.
Bitte dafür ein Issue erstellen.

## Copyright

Copyright (c) 2026 Attila Krick. Alle Rechte vorbehalten.

## Lizenz

Dieses Repository enthält Inhalte und Quelltexte der Website attilakrick.com.
Ohne ausdrückliche, separate Lizenzdatei ist keine allgemeine Wiederverwendung,
Vervielfältigung oder Weitergabe erlaubt.

## Wichtiger Hinweis

Projektregeln, Content-Konventionen, Front-Matter-Schemata und Agentenrichtlinien stehen in `AGENTS.md`.
Das Projektgedächtnis (Entscheidungen/Probleme/Lösungen) liegt in `.opencode/instructions/MyMemory.Instruction.md`.
