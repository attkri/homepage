# GSC-Auswertung 2026-02-18

## Datenbasis

- Property: `sc-domain:attilakrick.com`
- Zeitraum: `2025-11-18` bis `2026-02-18` (Default-Lauf des Export-Skripts)
- Quellen:
  - `.Analyses/2026-02-18/gsc-exports/gsc-queries.csv`
  - `.Analyses/2026-02-18/gsc-exports/gsc-pages.csv`

## KPI-Überblick

| KPI | Wert |
|---|---:|
| Suchanfragen (Zeilen) | 36 |
| Suchanfragen-Impressionen gesamt | 113 |
| Suchanfragen-Klicks gesamt | 0 |
| Seiten (Zeilen) | 15 |
| Seiten-Impressionen gesamt | 340 |
| Seiten-Klicks gesamt | 3 |
| Seiten-CTR gesamt | 0,88 % |

## Top-Suchanfragen nach Impressionen

| Suchanfrage | Impressionen | Klicks | Position (Ø) |
|---|---:|---:|---:|
| performance sql server | 11 | 0 | 12,73 |
| sql server beratung | 9 | 0 | 10,67 |
| optimierung sql server | 7 | 0 | 53,00 |
| beratung sql server | 7 | 0 | 13,14 |
| index optimierung sql server | 6 | 0 | 84,17 |

## Top-Seiten nach Impressionen

| Seite | Impressionen | Klicks | Position (Ø) |
|---|---:|---:|---:|
| https://attilakrick.com/artikel/ki_vscode_github_copilot_agent_powershell_nutzen/ | 95 | 1 | 6,75 |
| https://attilakrick.com/leistung/sql-performance-tuning/ | 65 | 0 | 27,00 |
| https://attilakrick.com/artikel/ki_mcp_sql_server_db_abfrage/ | 59 | 2 | 7,19 |
| https://attilakrick.com/leistung/sql-server-beratung/ | 33 | 0 | 26,06 |
| https://attilakrick.com/artikel/neuerungen_powershell_75/ | 18 | 0 | 7,06 |

## Fachliche Bewertung

Die Sichtbarkeit wächst messbar (340 Impressionen, 3 Klicks), aber die geschäftsrelevanten Leistungsseiten haben trotz Nachfrage-Signalen bei SQL-Keywords noch zu geringe Rankingtiefe und damit zu wenig Klickpotenzial.

## Priorisierte Maßnahmen (nächste 14 Tage)

- Leistungsseiten `/leistung/sql-performance-tuning/` und `/leistung/sql-server-beratung/` auf die Query-Cluster `performance sql server`, `sql server beratung`, `optimierung sql server` ausrichten (Title, Intro, H2, FAQ).
- Interne Links von den zwei klickstarken KI-Artikeln gezielt auf die beiden SQL-Leistungsseiten setzen (kontextnaher Anchor-Text, 1-2 Links je Artikel).
- Snippet-Optimierung für die beiden SQL-Leistungsseiten: klarer Outcome im ersten Absatz (z. B. Performance-Gewinn, Risiko-Reduktion, Workshop-Format) plus prägnante Meta-Description.
- Für Query `index optimierung sql server` einen fokussierten Fachartikel mit konkretem Vorgehen erstellen und intern mit den Leistungsseiten verknüpfen.

## Nächster Messpunkt

- Nächsten GSC-Export in 7 Tagen erneut ausführen und Veränderung bei Impressionen, Klicks und Positionen der SQL-Leistungsseiten vergleichen.
