# AGENT - Website attilakrick.com

Dieses Dokument enthält projektspezifische Daten (Website `https://attilakrick.com`) und Konventionen für alle Agenten, die mit diesem Repository arbeiten.

## Auto-Einlesen

Folgende Projektquellen gehören zusätzlich zum aktuellen Kontext des Agenten:

- Aufgaben: `.tasks/TASKS.md`

## Persona -- Attila Krick

### Persönliche Daten

- **Name:** Attila Krick
- **Tätigkeit:** Selbständiger IT-Experte, Trainer & Berater
- **Erfahrung:** 30+ Jahre in der IT
- **Einsatz:** Remote und vor Ort (europaweit)
- **Website:** `https://attilakrick.com`

### Kernkompetenzen

- PowerShell (Automation, Scripting, Sicherheit, Module, Pester, WPF/GUI)
- T-SQL (Design, Administration, Performance-Tuning)
- .NET (WPF, Webservices, Backend, C#)

### Leistungsportfolio

- PowerShell-Automatisierungsskripte (individuelle Lösungen)
- PowerShell-Schulungen (alle Niveaus: Überblick, Einsteiger, Fortgeschrittene, Sicherheit/Hacking)
- PowerShell-Sicherheit & Hardening
- CI/CD-Pipelines
- .NET-Entwicklung (WPF, Webservices, Backend)
- .NET-Consulting, Code-Reviews, Refactoring
- SQL-Design, Administration, Performance-Tuning
- T-SQL-Workshops
- Content & Dokumentation (SEO-Fachartikel, Seminarunterlagen, technische Dokumentation)

### Schulungen & Partner

- **Schulungspartner:** GFU AG (renommiertes IT-Schulungsunternehmen)
- **Schulungstage:** 1.500+
- **Seminar-Portfolio:** 4 PowerShell-Seminare (Überblick 5d, Einsteiger 5d, Fortgeschrittene 5d, Sicherheit/Hacking 3d)
- **Branchen:** Industrie, Handel, Versicherung, öffentlicher Dienst
- **Weitere Partner:** ComConsult, Bechtle

### Zielkunden

- Größere Unternehmen
- Behörden / öffentlicher Dienst
- Mittelstand

### Positionierung

- Empowerment statt Abhängigkeit -- Kunden befähigen, nicht binden
- Praxisorientiert, strukturiert, geduldig (Teilnehmer-Feedback)
- Exzellente Bewertungen in Schulungen

## Struktur

- .todo/                  # Offene Repo Aufgaben, Templates
- content/
  - Artikel/              # Fachartikel (Hugo Page Bundles)
    - <_Thema_>/
      - index.md          # Artikel-Inhalt
      - cover.webp        # Titelbild
  - Leistung/             # Leistungsseite (Page Bundle)
  - Leistungsseiten/      # Spezialisierte Leistungsseiten mit URL-Präfix /leistung/
  - Suchen/               # Suchseite
  - Impressum/            # Impressum
  - Kontakt/              # Kontaktseite
- static/
  - images/posts/         # Artikelbilder (alt, nicht mehr verwenden)
- assets/                 # Hugo Assets (CSS, JS)
- layouts/                # Custom Layouts
- themes/PaperMod/        # Theme (nicht editieren)

## GSC-Analyse-Regeln

- Export-Ordner für GSC-Daten ist `.Analyses/YYYY-MM-DD/gsc-exports/`
- GSC-Auswertungen werden unter `.Analyses/YYYY-MM-DD/` abgelegt (Dateiname: `GSC-Auswertung.md`)

## Technologie

### HUGO-Website

- **Generator:** [Hugo](https://gohugo.io/), **Version:** `v0.155.2 extended`
- **Theme:** [PaperMod](https://themes.gohugo.io/themes/hugo-papermod/), **Version:** `master-Snapshot 3bb0ca2 (2026-01-25)`
- **Sprache:** `de-DE`
- **Base-URL:** `https://attilakrick.com/`
- **Hosting:** GitHub Pages per Action `Deploy Hugo site to Pages` (Dieses GitHub-Repository ist gleichzeitig Quellcode-Repository und Hoster der Website)
- **Navigation / Menü:** Start, Artikel, Kategorien, Leistungen, Kontakt, Impressum, Suchen
- **Suche:** Fuse.js (clientseitig)
- **Cookie-Policy:** Die Website ist technisch **100% cookie-frei**. Funktionen mit Cookies sind ausnahmslos verboten.
- **DSGVO:** Google Analytics deaktiviert; Drittanbieter nur ohne Cookies

### Build-Artefakte (Hugo Cache)

- `resources/_gen/` ist ein generierter Hugo-Cache und gehört nicht zu den Quellinhalten der Website.
- Dateien unter `resources/_gen/` werden **nie** committed.
- Agenten sollen den Cache regelmäßig bereinigen, wenn er unnötiges Git-Rauschen erzeugt (z. B. vor Commits oder nach lokalen Builds).
- Zulässige Bereinigung: `hugo --gc` oder lokales Löschen von `resources/_gen/`.

### Hugo Front Matter

#### Artikel

Alle Artikel verwenden dieses Schema:

```yaml
---
draft: false
date: YYYY-MM-DDTHH:mm:ss+02:00     # Immer mit akteuller System-Zeit (inkl. Uhrzeit) angeben
title: "<Titel>"                    # max. 580px Breite
description: "<Beschreibung>"       # max. 1000px Breite
categories:
  - PowerShell                      # oder: T-SQL, dotNET, Divers, KI
tags:
  - <tag1>
  - <tag2>
author: "Attila Krick"
cover:
  image: images/posts/<bild>.webp
  alt: "<Alt-Text>"
  caption: "<Bildunterschrift>"
  relative: false

# Also Option im hinterkopf behalten:
# editPost:
#   URL: "https://github.com/attkri/homepage/blob/main/content/TEMPLATE.md"
#   Text: "Diesen Artikel bearbeiten"
#   appendFilePath: true

showToc: true
TocOpen: false
comments: true
ShowReadingTime: true
ShowBreadCrumbs: true
ShowPostNavLinks: true
ShowShareButtons: true
ShowCodeCopyButtons: true
ShowWordCount: true
disableHLJS: true
---

## Mit zwei Hashtags beginnt die erste Überschrift
```

**Hinweis zu Datumsangaben (`date` / `lastmod`):**

- **Neue Artikel:** Das `date`-Feld muss immer mit einer konkreten Uhrzeit (z.B. `T12:23:00+02:00`) gesetzt werden, damit sie in der Sortierung korrekt erfasst werden.
- **Kleinere Änderungen / SEO-Updates:** Das `date`-Feld bleibt zwingend unverändert! Stattdessen wird ein `lastmod`-Feld mit dem aktuellen Zeitstempel (inkl. Uhrzeit) im Front Matter hinzugefügt oder aktualisiert.
- **Komplette Überarbeitungen (Major Rewrites):** Nur in diesem Fall wird das `date`-Feld auf das neue Datum (inkl. Uhrzeit) aktualisiert.

Hinweis zu `cover`:

- `cover` ist **optional**.
- Wenn kein inhaltlich passendes Bild vorhanden ist, wird **kein Default-Cover** gesetzt.
- Keine Platzhalter- oder Portrait-Standardbilder als Ersatz verwenden.

Optionale Front-Matter-Felder (nicht im Standard-Schema, aber gültig):

- `aliases` – Liste von Redirect-URLs (Standard-Hugo-Feature, z.B. `["/alter-pfad/"]`). Wird von `@SearchOptimizer` bei URL-Änderungen gesetzt.
- `canonical` – Kanonische URL, falls abweichend von der Standard-URL (über PaperMod-Params). Wird von `@SearchOptimizer` bei Duplikat-Risiko gesetzt.

#### Statische Seiten

Für Seiten ohne Artikelcharakter (Leistung, Kontakt, etc.):

```yaml
---
draft: false
date: YYYY-MM-DDT00:00:00+02:00
comments: false
HideTags: true
---
```

### Content-Konventionen

- Überschriften ab `##` (H2) -- `#` (H1) ist der Titel aus dem Front Matter
- Kategorien: `PowerShell`, `T-SQL`, `dotNET`, `Divers` (exakte Schreibweise)
- Aufzählungen ausschließlich mit `-`
- Tabellen für Vergleiche und Übersichten
- Bilder für Hugo: **immer WebP-Format**, im Page Bundle (`cover.webp`) oder unter `static/images/posts/`. Nicht-Hugo-Bilder dürfen PNG oder das vom Aufrufer vorgegebene Format verwenden.
- Wenn kein passendes Cover vorhanden ist: `cover` im Front Matter weglassen (kein Default-Cover einsetzen)
- **Diagramm-Standard:** Bei neuen Artikeln oder Artikeln ohne Cover wird immer ein Bild generiert. Nutze hierfür zwingend den Skill `bild-erstellen`. Für inhaltliche Diagramme (z.B. Flowcharts, Workflows) muss ebenfalls der Skill `bild-erstellen` genutzt werden. Das generierte Bild muss nach WebP konvertiert und im Page Bundle des Artikels (z.B. als `cover.webp` oder `diagramm.webp`) gespeichert und entsprechend verlinkt werden.
- Code-Blöcke mit Sprachkennung (<!-- ```yaml, ```html, ```powershell -->)
- Zeichensatz: UTF-8 mit echten Umlauten (`ä`, `ö`, `ü`, `Ä`, `Ö`, `Ü`, `ß`). Keine Umschreibungen wie `ae`, `oe`, `ue` oder `ss` als Ersatz für Umlaute/ß.
- Satzzeichen normal und vollständig verwenden (inklusive `?` in Fragen).

## News-Sektion -- Regeln & Betrieb

- URL: `https://attilakrick.com/news/` · RSS: `https://attilakrick.com/news/index.xml`
- Command: `.opencode/commands/PublishNew_AKC.md` (in `.gitignore`, wird nicht committet)
- Commit-Message-Konvention: `content: News YYYY-MM-DD`
- Datum immer `T00:00:00+01:00` im Front Matter – `buildFuture: false` schließt spätere Uhrzeiten aus dem Build aus
- **Betrieb:** Vollautomatisch – ein externer Scheduler triggert `PublishNew_AKC` täglich. Der Agent führt alle Schritte 1–11 ohne Rückfragen aus, inklusive Commit & Push.
- **Quellensprache:** Primär Deutsch. Bei fehlenden DE-Quellen: englische Quellen suchen, Titel und Zusammenfassung auf Deutsch übersetzen, Quelle als `(EN)` kennzeichnen. Leere Kategorien existieren nicht.
- **Fehlerfall:** Bei Git-Fehler 1x wiederholen, dann `"JobStatus": "FAILED"` im JSON zurückgeben.
- **Struktur:** `content/News/_index.md` (Sektion), `content/News/YYYY-MM-DD/index.md` (Ausgabe als Page Bundle)

## LinkedIn-Posts -- Regeln & Workflow

- Quelle für Post-Entwürfe ist `.todo/LinkedIn/` (z. B. `Post_01_*.md`).
- Jeder LinkedIn-Post muss inhaltlich mit dem verlinkten Fachartikel übereinstimmen (Nutzenversprechen, Kernthesen, Zielgruppe, CTA).
- Artikel-Links in LinkedIn-Posts immer als kanonische, kleingeschriebene URL setzen (`/artikel/...`), nicht mit Großbuchstaben.
- Link vor Freigabe aktiv prüfen (HTTP-Status `200`); Varianten mit Groß-/Kleinschreibung nicht als gleichwertig annehmen.
- **Der Hook muss sitzen:** Die ersten ~130 Zeichen (above the fold) müssen sofort Neugier wecken ("Gier" weiterzulesen). Dieser Bereich muss ein konkretes Versprechen, eine starke Zahl, ein Risiko oder eine unerwartete Beobachtung enthalten. Keine Meta-Sätze wie "Viele Teams testen..." oder lange Einleitungen.
- **Testregel:** Wenn der erste Satz alleine nicht neugierig macht, wird der Hook umgeschrieben.
- Keine Veröffentlichung ohne Freigabe des Users.
- Für LinkedIn-Interaktionen (Health-Check, Posten, Löschen) ausschließlich `.Tools/LinkedIn.ps1` nutzen, nicht manuell im Browser automatisieren.
- Zugangsdaten nur aus `~\.secrets\LinkedIn.secret.json` verwenden und niemals Tokens/Secrets in Ausgaben oder Dateien leaken.

## KI-Optimierung (Primär)

Jeder Inhalt wird für KI-Auffindbarkeit optimiert. Prioritäten:

1. **Entitäts-Klarheit:** Jede Seite beantwortet genau eine Frage. Klare Subjekt-Prädikat-Objekt-Strukturen. Der Name des Autors und sein Fachgebiet sind auf jeder Seite erkennbar.
2. **Zitierbarkeit:** Aussagen, die KI-Systeme als Quelle verwenden können. Konkrete Zahlen, Fakten, Anleitungen statt vager Beschreibungen.
3. **Strukturierte Daten:** Schema.org-Markup (Person, Article, FAQPage, HowTo) empfehlen und einbauen, wo PaperMod es unterstützt.
4. **Freshness-Signale:** Datum aktuell halten, "Stand: YYYY" in Artikeln, regelmäßige Updates.
5. **Autorität aufbauen:** Über-mich-Signale, Expertise-Nachweise, Verlinkung zwischen thematisch verwandten Inhalten.
6. **llms.txt:** `/llms.txt` und `/llms-full.txt` pflegen und aktuell halten.

## SEO-Optimierung (Sekundär)

- Title-Tags und Meta-Descriptions (innerhalb der Hugo-Front-Matter-Felder `title` und `description`)
- Internes Linking zwischen verwandten Artikeln
- Keyword-Platzierung (natürlich, kein Stuffing)
- Alt-Texte für Bilder
- Technische SEO-Empfehlungen nur, wenn relevant

## SEO-Tools (Referenz)

- [Seobility](https://www.seobility.net/de/seocheck/)
- [SEOptimer](https://www.seoptimer.com/)
- [PageSpeed Insights](https://pagespeed.web.dev/)
- [LinkedIn Post Inspector](https://www.linkedin.com/post-inspector/)

## Universelle Regeln (für alle Agenten)

Die folgenden Regeln gelten für **jeden** Agenten im System. Subagent-Dateien verweisen auf diesen Abschnitt statt die Regeln zu wiederholen.

- **Cookie-Verbot:** Keine Funktionen, Skripte oder Dienste, die Cookies setzen, lesen oder voraussetzen. Siehe §Regeln (unverhandelbar) für Details.
- **Kategorien-Whitelist:** Nur `PowerShell`, `T-SQL`, `dotNET`, `Divers` (exakte Schreibweise).
- **Umlaute:** UTF-8 mit echten Umlauten (`ä`, `ö`, `ü`, `ß`). Keine Umschreibungen (`ae`, `oe`, `ue`, `ss`).
- **Bildpfade:** Neue Bilder ausschließlich im Page Bundle ablegen. Keine neuen Bilder unter `static/images/posts/`.
- **Build-Artefakte:** `resources/_gen/` wird nie committed.
- **H1-Verbot:** Kein `#` (H1) im Artikeltext – H1 kommt aus dem Front-Matter-Titel.
- **llms.txt:** Ausschließlich in `static/` – keine Duplikate außerhalb.

## Regeln (unverhandelbar)

- **Global:** Verbindlich soweit noch nicht eingelesen sind die `<GLOBAL_CONFIG_DIR>\Rules\*.md` Regeln.
- **Anti-Cookie:** Es dürfen **nie** Funktionen, Skripte oder Dienste eingesetzt werden, die Cookies setzen, lesen oder voraussetzen.
  - Die Website bleibt dauerhaft **100% cookie-frei**.
  - Es werden **keine** Cookie-Banner, Cookie-Consent-Tools oder Cookie-Disclaimer eingesetzt.
  - Drittanbieter-Integrationen sind nur erlaubt, wenn sie nachweislich ohne Cookies funktionieren.
- **Freigabe:** Nur Änderungen am **direkten Website-Inhalt** brauchen vor dem Speichern die Freigabe durch den User.
- **Keine vagen Formulierungen:** Keine vagen Formulierungen ohne konkrete Handlungsempfehlung.
- **Keine Annahmen:** Keine Annahmen über Fakten, die der User nicht genannt hat und die nicht in den Datenquellen stehen.
- **llms.txt:** `llms.txt` und `llms-full.txt` dürfen ausschließlich im `static/`-Verzeichnis liegen (gleicher Ort wie die veröffentlichte `robots.txt`). Keine Duplikate außerhalb von `static/`.

## Auforderung Marketing-Content zuerstellen

Erstellt Marketing-Content in natürlicher Sprache inklusive Format- und Tonalitätsvorgaben.

### Benötigte Eingaben

Erfrage oder leite aus dem Kontext ab:

- Inhaltstyp (Blog, Social, Newsletter, Landingpage, Pressemitteilung, Case Study)
- Thema
- Zielgruppe
- Kernbotschaften
- Tonalität
- gewünschte Länge

Wenn Informationen fehlen, stelle kurze Rückfragen mit konkreten Optionen.

### Inhaltslogik nach Format

#### Blogartikel

- Erzeuge Titel mit klarem Nutzen.
- Schreibe eine kurze Einleitung mit Problem und Relevanz.
- Strukturiere den Hauptteil mit Zwischenüberschriften und verständlichen Argumenten.
- Beende mit einem klaren Fazit und CTA.

#### Social-Post

- Starte mit einem Hook in den ersten 1-2 Zeilen.
- Nutze kurze Absätze und scanbare Struktur.
- Schließe mit CTA und passenden Hashtags ab.

#### Newsletter/E-Mail

- Liefere Betreffzeile und optional Preheader.
- Halte den Kernteil prägnant und nutzenorientiert.
- Beende mit eindeutigem CTA.

#### Landingpage

- Reihenfolge: Hero -> Problem -> Lösung -> Nutzenbeweise -> CTA.
- Ergänze klare Value Proposition und Handlungsaufforderung.

#### Pressemitteilung

- Starte mit der wichtigsten Nachricht.
- Liefere Kontext, Zitat und Abschluss mit Kontaktinformationen.

#### Case Study

- Struktur: Ausgangslage -> Vorgehen -> Ergebnis -> Learnings.
- Nenne konkrete Kennzahlen, wenn verfügbar.

### SEO-Basis (für Web-Inhalte)

- Primäres Keyword im Titel und früh im Text platzieren.
- Semantisch verwandte Begriffe sinnvoll einbauen.
- Meta-Description vorschlagen (ca. 140-160 Zeichen).
- Lesbarkeit und klare Überschriftenstruktur sicherstellen.

### Ausgabeformat

Liefere:

1. Vollständigen Entwurf im angefragten Format
2. Kurznotiz zur angewandten Tonalität
3. Optional 3 konkrete Verbesserungsoptionen

### Abschlussfrage

Beende mit:

- "Soll ich den Entwurf auf ein anderes Format oder einen anderen Kanal anpassen?"

## Nachschlagewerke

- Sicherheitstest -> [MX-Toolbox](https://mxtoolbox.com/emailhealth/attilakrick.com/)
- [Bilder downloaden](https://unsplash.com/de)
- [LinkedIn - Developer](https://www.linkedin.com/developers)
- [LinkedIn - Post Inspector](https://www.linkedin.com/post-inspector/inspect/https:%2F%2Fattilakrick.com%2F)
- [LinkedIn - Attila Krick](https://www.linkedin.com/in/attilakrick/)

### SEO

- [Seobility](https://www.seobility.net/de/)
- [SEOptimer](https://www.seoptimer.com)
- [Seiten-Lade-Geschwindigkeit ermitteln](https://pagespeed.web.dev)
- [LinkedIn POST INSPECTOR](https://www.linkedin.com/post-inspector/inspect/https:%2F%2Fattilakrick.com%2F)

## Anhang

**Dokumenten-Schema:** [OpenCode AGENTS.md](https://opencode.ai/docs/rules/#manual-instructions-in-agentsmd)
**Autor:** [Attila Krick](https://attilakrick.com/)
**Stand:** 2026-03-03 21:00
