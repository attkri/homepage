# Indexierung-Analyse 2026-02-12

## Grundlage

- Quelle: 5 GSC-Drilldown-Exporte aus `.Analyses/2026-02-12/`
- Property: `attilakrick.com`
- Sicht: "Alle bekannten Seiten"

## Ergebnis nach Grund

| Grund                              | Anzahl URLs | Bewertung                                                          | Lösung nötig? |
| ---------------------------------- | ----------: | ------------------------------------------------------------------ | ------------- |
| Nicht gefunden (404)               |          17 | Alte/legacy URLs (WordPress-Pfade, alte Slugs, www/http-Varianten) | Ja, teilweise |
| Durch "noindex"-Tag ausgeschlossen |          12 | Teils alte Seiten/Varianten, teils Kontakt/Impressum-Varianten     | Teilweise     |
| Seite mit Weiterleitung            |           4 | Erwartete Canonical-Weiterleitungen (http/www -> https non-www)    | Nein          |
| Durch robots.txt-Datei blockiert   |           1 | Alte URL `/posts/efcore/` wird durch robots blockiert              | Ja            |
| Gecrawlt - zurzeit nicht indexiert |           2 | Feed-URLs (`index.xml`)                                            | Nein          |

## Auffällige Muster

- Viele Treffer sind Altlasten aus früherer URL-Struktur:
  - `/powershell/...` (alte Blog-Slugs)
  - `/home/`, `/seminar/`, `/leistungen/`
  - `www.attilakrick.com/...` und `http://...`
- 404 enthält auch klar bot-getriebene Altlasten wie `/wp-admin/admin-ajax.php`.
- "Gecrawlt - zurzeit nicht indexiert" betrifft Feed-Dateien (`/index.xml`), das ist normal.

## Konkrete Einschätzung: Handlungsbedarf

### 1) 404 -> Ja, gezielt beheben

- Nur URLs beheben, die fachlich heute noch eine Zielseite haben.
- Für wichtige alte URLs 301-Weiterleitungen auf passende aktuelle Seiten setzen (z. B. alte PowerShell-Artikel auf `/artikel/...`).
- URLs ohne fachliches Pendant können 404 bleiben.

### 2) noindex -> Nur bei wichtigen Zielseiten prüfen

- Wenn eine Seite ranken soll, darf sie nicht noindex sein.
- Kontakt/Impressum müssen nicht ranken; dort ist kein dringender SEO-Handlungsdruck.

### 3) Weiterleitungen -> Kein Problem

- `http`/`www` auf `https://attilakrick.com/` umzuleiten ist korrekt.

### 4) robots.txt blockiert -> Ja, für `/posts/efcore/`

- Aktuell ist `/posts/` blockiert und verhindert, dass Google diese Alt-URL sauber neu auswertet.
- Empfehlung:
  - Entweder gezielte Weiterleitung von `/posts/efcore/` auf die aktuelle EF-Artikel-URL,
  - oder `Disallow: /posts/` überdenken, falls dort noch relevante Alt-URLs ankommen.

### 5) Crawled not indexed (XML-Feeds) -> Kein Problem

- Feed-Dateien müssen nicht in den Suchergebnissen ranken.

## Priorisierte To-do-Liste

1. Top-404-URLs mit fachlichem Gegenstück identifizieren (Priorität: hoch).
2. 301-Mapping Alt-URL -> neue URL erstellen (Priorität: hoch).
3. robots-Regel für `/posts/` prüfen, damit alte wichtige URL nicht dauerhaft blockiert bleibt (Priorität: hoch).
4. Danach in GSC "Validierung starten" für betroffene Gründe (Priorität: mittel).

## Umsetzung 2026-02-12

- Alias-Mapping für zentrale Alt-URLs ergänzt (u. a. `/leistungen/`, `/seminar/`, mehrere `/powershell/...`-Pfade).
- Redirect-Seiten für Altpfade ergänzt:
  - `static/home/index.html` -> `/`
  - `static/feed/index.html` -> `/index.xml`
- Ziel: 404-Signale bei weiterhin aufgerufenen Legacy-URLs reduzieren und Crawl-Budget auf aktuelle URLs lenken.
