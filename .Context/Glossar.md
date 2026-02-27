# Glossar

## Abkürzungen & Begriffe

| Begriff | Erklärung |
| :--- | :--- |
| GSC | Google Search Console – Googles Tool für Webseitenbetreiber (Suchanalyse, Indexierung) |
| CTR | Click-Through-Rate – Verhältnis Klicks zu Impressionen |
| KI-Auffindbarkeit | Sichtbarkeit einer Website als Quelle für KI-Systeme (ChatGPT, Perplexity, Gemini, Copilot) |
| llms.txt | Standard-Datei unter `/llms.txt`, die KI-Modellen strukturierte Informationen über eine Website liefert |
| Domain-Property | GSC-Property-Typ, der alle Subdomains und Protokolle abdeckt (Format: `sc-domain:example.com`) |
| Service Account | Google-Cloud-Dienstkonto für automatisierten API-Zugriff ohne User-Login |
| PaperMod | Hugo-Theme der Website |
| Page Bundle | Hugo-Konzept: Artikel als Verzeichnis mit `index.md` + zugehörigen Dateien (z. B. `cover.webp`) |
| GoAT | Go ASCII Tool – Diagramm-Format für Hugo (ASCII-Art wird zu SVG gerendert) |
| Freshness-Signal | Aktualitätshinweis für Suchmaschinen/KIs (z. B. "Stand: 2026") |
| Non-Brand-Keyword | Suchbegriff ohne Marken-/Personennamen (z. B. "PowerShell Schulung") |
| Brand-Keyword | Suchbegriff mit Marken-/Personennamen (z. B. "Attila Krick PowerShell") |
| News-Sektion | Täglicher IT-News-Bereich auf attilakrick.com (`/news/`), automatisiert via `PublishNew_AKC` |
| PublishNew_AKC | OpenCode-Command (`.opencode/commands/PublishNew_AKC.md`) zur Erstellung täglicher News-Ausgaben |
| Topic-Clustering | Mehrere Artikel zum gleichen Ereignis werden zu einem News-Eintrag zusammengefasst (zählt als 1 Artikel) |
| RSS | Really Simple Syndication – Abonnement-Feed; News-Feed unter `/news/index.xml` |
| Breaking News | News-Kategorie für besonders wichtige Meldungen mit Score ≥ 8; nur wenn zutreffend |
| SearXNG | Selbst gehostete Metasuchmaschine (lokale Instanz `192.168.0.9:8888`) als MCP für News-Recherche |
| Score ≥ 8 | Interne Relevanzbewertung (1–10) für Breaking-News-Einstufung |
| Glossar-Seite | Statische Hugo-Seite (`/glossar/`) mit 68 Fachbegriffen (A–W), alphabetisch, per Anker aus Artikeln verlinkbar |
| Glossar-Anker | Hugo generiert Anker automatisch aus H3-Überschriften (Leerzeichen → `-`, lowercase, Sonderzeichen bleiben bei Umlauten) |
| Interne Verlinkung | Links von Artikeln zur Glossar-Seite via `/glossar/#anker`; max. 3–5 pro Artikel, nur erste Erwähnung |
| Cross-Link | Verweis von einem News-Eintrag auf einen eigenen Fachartikel (`→ Mein Fachartikel dazu: ...`) |
| .Tools/ | Verzeichnis für Hilfs-Skripte (früher `.Utils/`, umbenannt 2026-02-27) |
