# News-Sektion

## Ziel

Täglicher IT-News-Bereich auf `attilakrick.com` als kuratierte Ausgabe für IT-Entscheider, Admins und Entwickler. Stärkt Freshness-Signale und KI-Auffindbarkeit der Website.

## URLs

- Übersicht: `https://attilakrick.com/news/`
- Ausgabe: `https://attilakrick.com/news/YYYY-MM-DD/`
- RSS-Feed: `https://attilakrick.com/news/index.xml`

## Infrastruktur

- `content/News/_index.md` – Sektion-Startseite (Beschreibung, RSS-Hinweis)
- `content/News/YYYY-MM-DD/index.md` – Einzelne Ausgabe als Hugo Page Bundle
- `hugo.yaml` – Menüeintrag "News" (weight 3)
- `.opencode/commands/PublishNew_AKC.md` – Command-Datei (in `.gitignore`, nicht im Repo)

## Konventionen

- `draft: false` – immer sofort live
- Commit-Message: `content: News YYYY-MM-DD`
- Schritt 10 (Commit & Push): immer manuell durch User freigeben
- Zeitfenster: rollierend 3 Tage rückwärts ab Ausgabedatum, Zeitzone Europe/Berlin
- Mindestens 5 Artikel gesamt pro Ausgabe
- Keine Emojis in Überschriften, Fließtext oder Tabellen
- Artikeltitel als H3-Link: `### [Titel](URL)`
- Quellenangabe: `*Quelle: domain.de · DD. Mon YYYY*`
- Leere Kategorien trotzdem anzeigen mit Platzhalter-Text
- Topic-Clustering: 2+ Artikel zum gleichen Ereignis → ein Eintrag, zählt als 1

## Kategorien-Reihenfolge

1. Breaking News (nur wenn Score ≥ 8)
2. KI
3. Tools & Dev
4. T-SQL & SQL Server
5. IT-Security
6. PowerShell & Automation
7. .NET
8. Besonders relevant (Tabelle)

## Recherche-Erkenntnisse

- DE-Quellen stark: `borncity.com`, `heise.de`, `golem.de`, `the-decoder.de`, `all-ai.de`, `all-about-security.de`, `informatik-aktuell.de`, `digitaleprofis.de`
- `digitaleprofis.de` veröffentlicht jeden Mittwoch eine KI-Wochenzusammenfassung
- `heise.de/newsticker/` gut nach Ressort scrapbar
- `techrepublic.com` gibt 403 zurück – nicht nutzbar
- SearXNG ignoriert `!Bang`-Syntax → normale Suchanfragen mit `time_range`
- PowerShell-DE-News oft außerhalb 3-Tage-Fenster → EN-Fallback nötig (Titel übersetzen)
- T-SQL und .NET haben kaum tägliche DE-News → häufig leere Kategorien

## Cross-Link-Kandidaten

| Slug | Passt zu |
| :--- | :--- |
| `powershell-sicher-einsetzen` | IT-Security (CVEs, Hardening) |
| `ki-vscode-github-copilot-agent-powershell-nutzen` | Tools & Dev (Copilot, VS Code) |
| `ki-mcp-sql-server-db-abfrage` | T-SQL & KI |
| `vscode-starter` | Tools & Dev (VS Code) |
| `powershell-tsql-automatisierung` | PowerShell & Automation, T-SQL |
| `sicherheit-wie-viel-powershell` | IT-Security, PowerShell |

## Bisherige Ausgaben

| Datum | Artikel | Besonderheiten |
| :--- | :--- | :--- |
| 2026-02-24 | 8 | Erster Testtag |
| 2026-02-25 | 9 | Erstes Breaking News (Anthropic vs. Pentagon) |
| 2026-02-26 | 10 | Reichhaltigste Ausgabe bisher |
| 2026-02-27 | 8 | Nach User-Review überarbeitet, dann live |
