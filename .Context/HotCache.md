# HotCache

Häufig relevante Informationen für den aktuellen Arbeitskontext.

## Aktuelle Projekte

- **Glossar:** Erstellt und live (`/glossar/`, 68 Einträge A–W). 16 Artikel verlinkt. Erweiterbar.
- **News-Sektion:** Eingerichtet und live. 4 Ausgaben veröffentlicht (24.–27. Feb 2026). Tägliche Pflege via `PublishNew_AKC`-Command.
- **GSC-Analyse:** Erste Daten exportiert (2026-02-11), sehr geringe Sichtbarkeit. Nächster Export überfällig (war 7 Tage nach 11. Feb geplant).
- **Keyword-Matrix:** Erstellt unter `.todo/Keyword-Matrix.md`, wartet auf GSC-Abgleich.
- **KI-Auffindbarkeit:** `llms.txt` und `llms-full.txt` in `static/` angelegt (freigegeben).
- **robots.txt:** Repariert (Sitemap-URL korrigiert, freigegeben).

## GSC-Setup

- Property: `sc-domain:attilakrick.com` (Domain-Property)
- Service Account: zentral im Secret hinterlegt
- JSON-Key: `~\.secrets\GoogleSearchConsole.Secrets.json`
- Script: `.Tools/GoogleSearchConsole.ps1`
- Export-Ordner: `.Analyses/YYYY-MM-DD/gsc-exports/`
- Auswertungen: `.Analyses/YYYY-MM-DD/GSC-Auswertung.md`

## News-Sektion

- URL: `https://attilakrick.com/news/`
- RSS: `https://attilakrick.com/news/index.xml`
- Command: `.opencode/commands/PublishNew_AKC.md` (in `.gitignore`, wird nicht committet)
- Commit-Message-Konvention: `content: News YYYY-MM-DD`
- Fenster: Rollierend 3 Tage rückwärts ab Ausgabedatum
- Zeitzone: Europe/Berlin
- Mindestens 5 Artikel gesamt pro Ausgabe
- Schritt 10 (Commit & Push) immer manuell durch User freigeben

## LinkedIn-Script

- Secret: `~\.secrets\LinkedIn.secret.json`
- Script: `.Tools/LinkedIn.ps1` (früher `.Utils/LinkedIn.ps1`, umbenannt 2026-02-27)

## Website-Status (2026-02-27)

- 17 Fachartikel online (PowerShell, T-SQL, .NET, KI, Methodik) — 1 Neuer seit letztem Stand
- Glossar-Seite live: `https://attilakrick.com/glossar/` (68 Einträge, A–W)
- 16 Artikel mit Glossar-Verlinkungen versehen (erste Erwähnung je Begriff)
- News-Sektion neu: 4 Ausgaben live (24.–27. Feb 2026)
- Menü: Start, Artikel, Kategorien, Leistungen, News, Kontakt, Impressum, Suchen
- Google-Sichtbarkeit: minimal (Stand 2026-02-11; nächster Export ausstehend)

## Bekannte Cross-Link-Kandidaten (News → Fachartikel)

| Slug | Passt zu News-Kategorie |
| :--- | :--- |
| `powershell-sicher-einsetzen` | IT-Security (CVEs, Hardening) |
| `ki-vscode-github-copilot-agent-powershell-nutzen` | Tools & Dev (Copilot, VS Code) |
| `ki-mcp-sql-server-db-abfrage` | T-SQL & KI |
| `vscode-starter` | Tools & Dev (VS Code) |
| `powershell-tsql-automatisierung` | PowerShell & Automation, T-SQL |
| `sicherheit-wie-viel-powershell` | IT-Security, PowerShell |

## Betriebsmodus: PublishNew_AKC (2026-02-27)

- **Warum:** Ein externer Scheduler schickt den Command `PublishNew_AKC` täglich automatisch. Der Agent arbeitet ihn vollständig ab -- inklusive Schritt 10 (Commit & Push) und Schritt 11 (JSON-Rückgabe). Keine Rückfragen, keine manuelle Freigabe nötig.
- **Ablauf:** Recherche → Datei erstellen → Commit → Push → JSON zurückgeben (alle Schritte 1–11)
- **Risiko:** Falls Quellen offline sind oder weniger als 5 Artikel gefunden werden, trotzdem eine Ausgabe erstellen (leere Kategorien mit Platzhalter), committen und JSON mit `"JobStatus": "COMPLETED"` zurückgeben.
- **Rückfallplan:** User kann fehlerhafte Ausgaben jederzeit manuell editieren und einen Korrektur-Commit pushen. Bei Git-Fehler: 1x wiederholen, dann `"JobStatus": "FAILED"` im JSON.

## Session-Update 2026-02-27 (Glossar)

- Kontext: Glossar-Seite (`/glossar/`) mit 68 Einträgen erstellt; 16 Artikel mit Glossar-Links versehen (erste Erwähnung je Begriff, max. 3–5 pro Artikel)
- Entscheidungen: Glossar als statische Seite (kein Menüeintrag), alphabetisch mit H2/H3-Ankern, Verlinkung per `/glossar/#anker`; Artikel 17 (`Methode_Direkte_Instruktion`) übersprungen (keine passenden Glossar-Terme); Pester-Link in Code-Blöcken absichtlich nicht gesetzt
- Offene Fragen: Keine
- Risiken: Glossar wächst organisch — neue Artikel sollten neue Begriffe ergänzen; Anker-Stabilität bei Umbenennungen beachten

## Session-Update 2026-02-27

- Kontext: News-Sektion von Grund auf eingerichtet und erste 4 Ausgaben erstellt & veröffentlicht
- Entscheidungen: Tägliche News als Hugo Page Bundle, rollierendes 3-Tage-Fenster, kein Emoji in Überschriften, Cross-Links nur bei echter Übereinstimmung, Commit-Freigabe immer beim User
- Offene Fragen: GSC-Export ist überfällig -- wann soll der nächste laufen?
- Risiken: PowerShell- und T-SQL-News in DE dünn gedeckt; EN-Fallback nötig, aber dann inhaltlich übersetzen
