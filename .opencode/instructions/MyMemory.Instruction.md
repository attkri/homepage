# My Memory

Fakten, Erkenntnisse und Fortschritt für `attilakrick.com`. Wird von Agenten gelesen und erweitert.

## Website-Status (Stand: 2026-03-03 19:15)

- 17 Fachartikel online (PowerShell, T-SQL, .NET, KI, Methodik)
- Glossar-Seite live: `https://attilakrick.com/glossar/` (68 Einträge, A–W)
- 16 Artikel mit Glossar-Verlinkungen versehen (erste Erwähnung je Begriff, max. 3–5 pro Artikel)
- News-Sektion live: `https://attilakrick.com/news/` — mehrere Ausgaben seit 2026-02-24
- Menü: Start, Artikel, Kategorien, Leistungen, News, Kontakt, Impressum, Suchen
- Google-Sichtbarkeit: minimal (Stand 2026-02-11; nächster GSC-Export ausstehend)

## Projekte & Aktuelle Vorhaben

### Glossar (`/glossar/`)

- Erstellt und live, 68 Einträge A–W
- 16 Artikel mit Glossar-Links versehen (erste Erwähnung je Begriff)
- Anker-Schema: Hugo generiert aus H3-Überschriften (Leerzeichen → `-`, lowercase)
- Verlinkung per `/glossar/#anker`; max. 3–5 pro Artikel
- Artikel `Methode_Direkte_Instruktion` übersprungen (keine passenden Glossar-Terme)
- Pester-Links in Code-Blöcken absichtlich nicht gesetzt

### News-Sektion (`/news/`)

- Infrastruktur: `content/News/_index.md` + `content/News/YYYY-MM-DD/index.md`
- Command: `.opencode/commands/PublishNew_AKC.md` (in `.gitignore`)
- Betrieb: vollautomatisch via externem Scheduler, kein manueller Eingriff nötig

#### Bisherige Ausgaben

| Datum | Artikel | Besonderheiten |
| :--- | :--- | :--- |
| 2026-02-24 | 8 | Erster Testtag |
| 2026-02-25 | 9 | Erstes Breaking News (Anthropic vs. Pentagon) |
| 2026-02-26 | 10 | Reichhaltigste Ausgabe bisher |
| 2026-02-27 | 8 | Nach User-Review überarbeitet, dann live |
| 2026-02-28 | — | Datumsfix: war `T07:00:00`, korrigiert auf `T00:00:00` |
| 2026-03-02 | — | Live |
| 2026-03-03 | — | Live |

#### Recherche-Erkenntnisse News

- Starke DE-Quellen: `borncity.com`, `heise.de`, `golem.de`, `the-decoder.de`, `all-ai.de`, `all-about-security.de`, `informatik-aktuell.de`, `digitaleprofis.de`
- `digitaleprofis.de` veröffentlicht jeden Mittwoch eine KI-Wochenzusammenfassung
- `heise.de/newsticker/` gut nach Ressort scrapbar
- `techrepublic.com` gibt 403 zurück — nicht nutzbar
- SearXNG ignoriert `!Bang`-Syntax → normale Suchanfragen mit `time_range` verwenden
- PowerShell-DE-News oft außerhalb 3-Tage-Fenster → EN-Fallback nötig (Titel übersetzen)
- T-SQL und .NET haben kaum tägliche DE-News → häufig EN-Fallback erforderlich

#### Cross-Link-Kandidaten (News → Fachartikel)

| Slug | Passt zu News-Kategorie |
| :--- | :--- |
| `powershell-sicher-einsetzen` | IT-Security (CVEs, Hardening) |
| `ki-vscode-github-copilot-agent-powershell-nutzen` | Tools & Dev (Copilot, VS Code) |
| `ki-mcp-sql-server-db-abfrage` | T-SQL & KI |
| `vscode-starter` | Tools & Dev (VS Code) |
| `powershell-tsql-automatisierung` | PowerShell & Automation, T-SQL |
| `sicherheit-wie-viel-powershell` | IT-Security, PowerShell |

### GSC-Analyse

- Property: `sc-domain:attilakrick.com` (Domain-Property)
- JSON-Key: `~\.secrets\GoogleSearchConsole.Secrets.json`
- Script: `.Tools/GoogleSearchConsole.ps1`
- Erster Export (2026-02-11): 5 Seiten mit Impressionen, 0 Klicks, leer bei Queries
- Nächster Export: ausstehend (war 7 Tage nach 11. Feb geplant)
- Keyword-Matrix: `.todo/Keyword-Matrix.md`, wartet auf GSC-Abgleich

### KI-Auffindbarkeit

- `static/llms.txt` und `static/llms-full.txt` live (seit 2026-02-09)
- `static/robots.txt` repariert (Sitemap-URL korrigiert, 2026-02-09)
- Offene Punkte: Schema.org-Markup erweitern, Startseite/Leistungsseite auf KI-Zitierbarkeit prüfen

## Infrastruktur & Tools

- LinkedIn-Script: `.Tools/LinkedIn.ps1` — Secret: `~\.secrets\LinkedIn.secret.json`
- GSC-Script: `.Tools/GoogleSearchConsole.ps1` — Secret: `~\.secrets\GoogleSearchConsole.Secrets.json`
- `.Tools/` (früher `.Utils/`, umbenannt 2026-02-27)
- GitHub-Repo: `github.com/attkri/homepage`

## Timeline (Meilensteine)

| Datum | Ereignis |
| :--- | :--- |
| 2026-02-09 | `llms.txt` und `llms-full.txt` angelegt; `robots.txt` repariert |
| 2026-02-11 | Erster GSC-Export; Keyword-Matrix erstellt |
| 2026-02-24 | News-Sektion eingerichtet; erste Ausgabe live |
| 2026-02-27 | News-Ausgaben 24.–27. Feb committed & gepusht |
| 2026-02-27 | `.Utils/` → `.Tools/` umbenannt |
| 2026-02-27 | Glossar live (68 Einträge); 16 Artikel mit Glossar-Links |
| 2026-03-03 | Memory.md angelegt (ersetzt alte .Context/-Dateien); AGENTS.md aktualisiert |

## Glossar der Projektbegriffe

| Begriff | Erklärung |
| :--- | :--- |
| GSC | Google Search Console |
| CTR | Click-Through-Rate (Klicks / Impressionen) |
| KI-Auffindbarkeit | Sichtbarkeit als Quelle für KI-Systeme (ChatGPT, Perplexity, Gemini, Copilot) |
| llms.txt | Standard-Datei unter `/llms.txt` für KI-Modelle |
| Domain-Property | GSC-Property-Typ, deckt alle Subdomains ab (`sc-domain:...`) |
| Page Bundle | Hugo: Artikel als Verzeichnis mit `index.md` + Dateien |
| Freshness-Signal | Aktualitätshinweis für Suchmaschinen/KIs |
| Non-Brand-Keyword | Suchbegriff ohne Personennamen |
| Brand-Keyword | Suchbegriff mit Personennamen |
| Topic-Clustering | Mehrere Artikel zum gleichen Ereignis = ein News-Eintrag |
| SearXNG | Selbst gehostete Metasuchmaschine (`192.168.0.9:8888`) |
| Score ≥ 8 | Relevanzschwelle für Breaking-News-Kategorie |
| Cross-Link | Verweis von News auf eigenen Fachartikel |
| PublishNew_AKC | Command zur Erstellung täglicher News-Ausgaben |

## Fortschritt

- [x] Leistungsseite (`/leistung/`) erfolgreich in Hub-Seite umgebaut (inkl. Custom-Layout, KI-Stufenmodell und visueller Auflockerung durch 4 konsistente Designer-Grafiken)
- [x] Anlage des Projektgedächtnisses abgeschlossen
- [x] Pfad-Inkonsistenz in `AGENTS.md` behoben

## Entscheidungen

### Datumsangaben in Artikeln (2026-03-03)

**Entscheidung:** Einführung einer strikten Regelung für `date` und `lastmod` in Artikel-Front-Matters.
**Begründung:** Um die korrekte chronologische Sortierung von Artikeln sicherzustellen und SEO-relevante Aktualisierungen (Freshness-Signale) korrekt abzubilden, ohne das ursprüngliche Veröffentlichungsdatum zu verfälschen.
**Konsequenz:** 
1. Neue Artikel erhalten immer eine konkrete Uhrzeit im `date`-Feld (z.B. `T12:00:00+02:00`).
2. Bei kleineren Änderungen/SEO-Updates bleibt `date` unverändert, stattdessen wird `lastmod` mit aktuellem Zeitstempel hinzugefügt/aktualisiert.
3. Nur bei kompletten Überarbeitungen (Major Rewrites) wird das `date`-Feld aktualisiert.

### Orchestrator Task Permissions (2026-03-03)

**Entscheidung:** Der Orchestrator blockiert via `task: deny` explizit zentrale `Code-*` Agenten (Code-Critic, Code-Reviewer, Code-Planner, Code-Publisher).
**Begründung:** Um Verwechslungen und versehentliche Fallbacks auf projektfremde Agenten zu verhindern. Der Orchestrator muss sich strikt an seine Routing-Tabelle halten.
**Konsequenz:** Höhere Robustheit des Projekt-Setups und konsequente Nutzung der projekt-eigenen Subagenten (z.B. `@Critic` statt `Code-Critic`).

### Memory-System etabliert (2026-03-03)

**Entscheidung:** Das Projektgedächtnis `Memory.md` wird in `.opencode/context/` angelegt und verwaltet.
**Begründung:** Dies entspricht den OpenCode-Konventionen aus den `MyMemory.Instruction.md` und `Agent_Codex.Instruction.md` Regeln. Der zuvor fehlerhafte Pfad in `AGENTS.md` wurde konsolidiert.
**Konsequenz:** Alle Agenten verwenden künftig diese Datei als session-übergreifendes Wissen und aktualisieren sie bei Bedarf.

## Probleme & Lösungen

### Orchestrator nutzt falsche Agenten (2026-03-03)

**Problem:** Der Orchestrator rief versehentlich die globalen OpenCode-Agenten (`Code-Critic`, `Code-Reviewer`) anstelle der projektspezifischen Agenten (`Critic`) auf.
**Ursache:** Verwechslungsgefahr bei ähnlichen Agent-Namen und fehlende strikte technische Absicherung der Routing-Tabelle.
**Lösung:** Die `Code-*` Agenten wurden im Orchestrator-Frontmatter (`task: deny`) explizit gesperrt. Zudem wurde eine Verbotsregel ergänzt, die Fallbacks auf projektfremde Agenten verbietet.

### Pfad-Konflikt AGENTS.md (2026-03-03)

**Problem:** `AGENTS.md` referenzierte `.opencode/.context/Memory.md`, während die System-Instruktionen `.opencode/context/Memory.md` verlangten.
**Ursache:** Tippfehler / veraltete Dokumentation.
**Lösung:** Verweis in `AGENTS.md` auf den korrekten Pfad ohne den extra Punkt aktualisiert.

## Nützliche Kommandos (kurz)

- `hugo server -D`: Lokaler Entwicklungsserver mit Drafts
- `hugo --gc`: Hugo-Cache bereinigen (Ressourcen-Verzeichnis)

## Context

Dieses Repository enthält die berufliche Website von Attila Krick, generiert mit Hugo und dem Theme PaperMod. Das Projektgedächtnis dient dazu, alle agenten- und session-übergreifenden Erkenntnisse und Beschlüsse nachhaltig zu sichern.

## Referenzen

Dateien:
- `README.md`
- `AGENTS.md`
- `.opencode/context/Memory.md`

## Notes

- Regelmäßiges Bereinigen des Hugo-Caches mit `hugo --gc` vor Commits empfohlen.
