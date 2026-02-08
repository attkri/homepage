# AGENTS -- Website-Konventionen & Projektdaten

Dieses Dokument enthält projektspezifische Daten und Konventionen für alle Agenten, die mit diesem Repository arbeiten.

## Website-Technologie

- **Generator:** Hugo (Static Site Generator)
- **Theme:** PaperMod
- **Sprache:** `de-DE`
- **Base-URL:** `https://attilakrick.com/`
- **Publish-Verzeichnis:** `docs/`
- **Hosting:** GitHub Pages -- dieses GitHub-Repository ist gleichzeitig Quellcode-Repository und Hoster der Website
- **Cookie-Policy:** Die Website ist technisch **100% cookie-frei**. Funktionen mit Cookies sind ausnahmslos verboten.
- **DSGVO:** Google Analytics deaktiviert; Drittanbieter nur ohne Cookies

## Verbindliche Cookie-Regel (Pflicht)

- Es duerfen **nie** Funktionen, Skripte oder Dienste eingesetzt werden, die Cookies setzen, lesen oder voraussetzen.
- Die Website bleibt dauerhaft **100% cookie-frei**.
- Es werden **keine** Cookie-Banner, Cookie-Consent-Tools oder Cookie-Disclaimer eingesetzt.
- Drittanbieter-Integrationen sind nur erlaubt, wenn sie nachweislich ohne Cookies funktionieren.

## Freigabe-Regel fuer Aenderungen

- Nur Aenderungen am **direkten Website-Inhalt** brauchen vor dem Speichern die Freigabe durch den User.
- Als direkter Website-Inhalt gelten insbesondere Inhalte unter `content/` sowie sichtbare Medien/Assets fuer Seiten und Artikel.
- Alle anderen Aenderungen (z. B. `README.md`, `AGENTS.md`, interne Doku, Skripte, Build-/Tooling-Konfiguration) duerfen ohne separate Freigabe umgesetzt werden.

## Verzeichnisstruktur

```
content/
  Artikel/              # Fachartikel (Hugo Page Bundles)
    <Thema>/
      index.md           # Artikel-Inhalt
      cover.webp         # Titelbild
  Leistung/             # Leistungsseite (Page Bundle)
  Suchen/               # Suchseite
  Impressum/            # Impressum
  Kontakt/              # Kontaktseite
static/
  images/posts/         # Artikelbilder (alt, nicht mehr verwenden)
assets/                 # Hugo Assets (CSS, JS)
layouts/                # Custom Layouts
themes/PaperMod/        # Theme (nicht editieren)
.TODO/                  # Offene Aufgaben, Templates
.Secrets/               # Personendaten (NICHT im Git)
```

## Hugo Front Matter -- Artikel

Basierend auf `.TODO/post_template.md`. Alle Artikel verwenden dieses Schema:

```yaml
---
draft: false
date: YYYY-MM-DDT00:00:00+02:00
title: "<Titel>"                    # max. 580px Breite
description: "<Beschreibung>"       # max. 1000px Breite
categories:
  - PowerShell                      # oder: T-SQL, dotNET, Divers
tags:
  - <tag1>
  - <tag2>
author: "Attila Krick"
cover:
  image: images/posts/<bild>.webp
  alt: "<Alt-Text>"
  caption: "<Bildunterschrift>"
  relative: false
showToc: true
TocOpen: false
comments: true
ShowReadingTime: true
ShowBreadCrumbs: true
ShowPostNavLinks: true
ShowShareButtons: true
ShowCodeCopyButtons: true
disableHLJS: true
---
```

## Hugo Front Matter -- Statische Seiten

Für Seiten ohne Artikelcharakter (Leistung, Kontakt, etc.):

```yaml
---
draft: false
date: YYYY-MM-DDT00:00:00+02:00
comments: false
HideTags: true
---
```

## Content-Konventionen

- Überschriften ab `##` (H2) -- `#` (H1) ist der Titel aus dem Front Matter
- Kategorien: `PowerShell`, `T-SQL`, `dotNET`, `Divers` (exakte Schreibweise)
- Aufzählungen ausschließlich mit `-`
- Bilder: WebP-Format, im Page Bundle (`cover.webp`) oder unter `static/images/posts/`
- Code-Blöcke mit Sprachkennung (```powershell, ```sql, ```csharp)
- Zeichensatz: UTF-8 mit echten Umlauten (ä, ö, ü, ß)

## SEO-Tools (Referenz)

- [Seobility](https://www.seobility.net/de/seocheck/)
- [SEOptimer](https://www.seoptimer.com/)
- [PageSpeed Insights](https://pagespeed.web.dev/)
- [LinkedIn Post Inspector](https://www.linkedin.com/post-inspector/)

## Navigation / Menü

- Start, Artikel, Kategorien, Leistungen, Kontakt, Impressum, Suchen

## Suche

- Fuse.js (clientseitig)

## Bestehende Inhalte (Übersicht)

### Artikel (content/Artikel/)

- PowerShell: Sicherheit, Hilfe, Cmdlets, Best Practices, PS vs Bash, Nutzung, Verständnis, Sicherheits-Deployment, Objekte/Pipeline, PS+T-SQL-Automation, PS 7.5/7.6 News
- Sonstige: VSCode Starter, T-SQL JOIN, .NET EF Grundlagen, Direkte Instruktion (Didaktik)

### Statische Seiten

- Leistung (Dienstleistungsübersicht)
- Kontakt, Impressum, Suchen
