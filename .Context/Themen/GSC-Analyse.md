# GSC-Analyse

## Ziel

Automatisierte Messung der Google-Sichtbarkeit für `attilakrick.com`.

## Setup

- **Property:** `sc-domain:attilakrick.com` (Domain-Property)
- **API:** Google Search Console API (aktiviert im Projekt „GSC-Export")
- **Auth:** Service Account mit JSON-Key (`.Secrets/gsc-export.service-account.json`)
- **Script:** `.Utils/GoogleSearchConsole.ps1`
- **Export-Ordner:** `.Utils/gsc-exports/`
- **Auswertungen:** `.Analyses/YYYY-MM-DD_GSC-Auswertung.md`

## Erster Export (2026-02-11)

- Queries: leer (keine Suchanfragen-Daten)
- Pages: 5 Seiten mit Impressionen, 0 Klicks
- Fazit: Minimale Sichtbarkeit, Daten noch nicht aussagekräftig

## Offene Punkte

- Nächster Export: 7 Tage nach Erstexport
- Keyword-Matrix (`.todo/Keyword-Matrix.md`) gegen echte Daten abgleichen
- Branding vs. Non-Brand auswerten
