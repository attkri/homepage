# AGENT - Website attilakrick.com

Dieses Dokument enthält projektspezifische Daten (Website `https://attilakrick.com`) und Konventionen für alle Agenten, die mit diesem Repository arbeiten.

## Auto-Einlesen

Folgende Projektquellen gehören zusätzlich zum aktuellen Kontext des Agenten:

- Aufgaben: `.tasks/TASKS.md`
- Projektgedächtnis: `.opencode/instructions/MyMemory.Instruction.md`

## Agentenarchitektur

- Der primäre Arbeitsagent dieses Repos ist `@WebMaster`.
- `@WebMaster` plant selbst, setzt selbst um und lädt die passenden Skills aktiv nach Fachdomäne.
- `@Publisher` ist ausschließlich für irreversible Aktionen zuständig: Commit, Push, LinkedIn-Post, E-Mail.
- `@Kritiker` ist das Standard-Review-Gate für substanzielle Änderungen an Content, Prompt, Code, Config und LinkedIn-Entwürfen.
- `@Kritiker` ist eine globale Agent-Abhängigkeit außerhalb dieses Repos und muss in der OpenCode-Umgebung vorhanden sein.
- `AKCNewsAgent` ist ein eigenständiger Sonderfall und nicht Teil des normalen Website-Workflows.

## Skill-First-Arbeitsweise

- Bei passender Fachaufgabe wird zuerst der passende Skill geladen.
- Ausnahme Website-Content: Für Fachartikel, Leistungsseiten, Glossare und Case Studies ist das Content-Framework in diesem Repo die Standardmethode; ein zusätzlicher Skill ist dafür nicht erforderlich.
- Lokale Skills unter `.opencode/skills/` haben Vorrang vor globalen Skills, wenn beide dieselbe Aufgabe sinnvoll abdecken.
- Aktuell gibt es keine verpflichtenden projektspezifischen lokalen Skills mehr; projektspezifische Content-Regeln und Website-Konventionen liegen direkt in `AGENTS.md` und `@WebMaster`.
- Wichtige globale Skills für dieses Repo:
  - `marketing-writing`
  - `seo-audit`
  - `performance-analytics`
  - `competitive-analysis`
  - `hugo-technik`
  - `web-frontend-builder`
  - `web-design-guidelines`
  - `bild-erstellen`
  - `web-search`
  - `agent-browser`

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
- Primärdateien sind `gsc-queries.json`, `gsc-pages.json` und optional `gsc-query-pages.json`; CSV nur als Fallback.
- `gsc-metadata.json` ist die Referenz für Zeitraum, Property, Exportzeitpunkt und Row-Limits.
- Rechen- und Aggregationsschritte laufen über `.opencode/scripts/Analyze-GscExport.ps1`, nicht über Freitext-Rechnen.

## Mindest-Outputs globaler Analyse-Skills

- `performance-analytics` liefert für dieses Repo mindestens: Executive Summary, KPI-Überblick, wichtigste Trends mit Ursachenhypothesen, priorisierte Maßnahmenliste, nächsten Testplan.
- `competitive-analysis` liefert für dieses Repo mindestens: Executive Summary, Wettbewerber-Profilmatrix, Messaging-/Positionierungsvergleich, Chancen und Risiken, priorisierte Empfehlungen.

## Technologie

### HUGO-Website

- **Generator:** [Hugo](https://gohugo.io/), **Version:** `v0.155.2 extended`
- **Theme:** [PaperMod](https://themes.gohugo.io/themes/hugo-papermod/), **Version:** `master-Snapshot 3bb0ca2 (2026-01-25)`
- **Sprache:** `de-DE`
- **Base-URL:** `https://attilakrick.com/`
- Für technische Hugo-Arbeit wie Partials, Bundles, Breadcrumbs, Theme-Overrides, Front Matter, Shortcodes, interne Links oder Build-Diagnose ist primär der globale Skill `hugo-technik` vorgesehen.
- `web-frontend-builder` ergänzt Hugo-Arbeit nur dann, wenn die Aufgabe zusätzlich ein klares visuelles, layout- oder komponentenorientiertes Ziel hat.
- Bei Mischfällen gilt: zuerst `hugo-technik`, `web-frontend-builder` nur ergänzend.
- **Hosting:** GitHub Pages per Action `Deploy Hugo site to Pages` (Dieses GitHub-Repository ist gleichzeitig Quellcode-Repository und Hoster der Website)
- **Navigation / Menü:** Start, Artikel, Kategorien, Leistungen, News, Kontakt, Impressum, Suchen
- **Suche:** Fuse.js (clientseitig)
- **Cookie-Policy:** Die Website ist technisch **100% cookie-frei**. Funktionen mit Cookies sind ausnahmslos verboten.
- **DSGVO:** Google Analytics deaktiviert; Drittanbieter nur ohne Cookies

### Build-Artefakte (Hugo Cache)

- `resources/_gen/` ist ein generierter Hugo-Cache und gehört nicht zu den Quellinhalten der Website.
- Dateien unter `resources/_gen/` werden **nie** committed.
- Agenten sollen den Cache regelmäßig bereinigen, wenn er unnötiges Git-Rauschen erzeugt (z. B. vor Commits oder nach lokalen Builds).
- Zulässige Bereinigung: `hugo --gc` oder lokales Löschen von `resources/_gen/`.

### Hugo-Technik und Overrides

- `themes/PaperMod/` wird **nie** direkt geändert.
- Projektseitige Anpassungen erfolgen über `layouts/`, `assets/`, `static/` und andere Repo-Dateien.
- Maßgeblicher technischer Release-Check ist `hugo --gc --minify`.
- `hugo server -D` ist nur für Vorschau und Fehlersuche gedacht, nicht als Abnahmeersatz.

### Hugo Front Matter

#### Artikel

Alle Artikel verwenden dieses Schema:

```yaml
---
draft: false
date: YYYY-MM-DDTHH:mm:ss+02:00     # Immer mit aktueller System-Zeit (inkl. Uhrzeit) angeben
title: "<Titel>"                    # max. 580px Breite
description: "<Beschreibung>"       # max. 1000px Breite
categories:
  - PowerShell                      # oder: T-SQL, dotNET, Divers, KI (exakte Schreibweise)
tags:
  - <tag1>
  - <tag2>
author: "Attila Krick"
cover:
  image: cover.webp
  alt: "<Alt-Text>"
  caption: "<Bildunterschrift>"
  relative: true

# Also Option im Hinterkopf behalten:
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

- `aliases` – Liste von Redirect-URLs (Standard-Hugo-Feature, z.B. `["/alter-pfad/"]`). Wird bei URL-Änderungen oder Redirect-Bedarf gesetzt.
- `canonical` – Kanonische URL, falls abweichend von der Standard-URL (über PaperMod-Params). Wird bei Duplikat-Risiko oder abweichender Standard-URL gesetzt.

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
- Kategorien: `PowerShell`, `T-SQL`, `dotNET`, `Divers`, `KI` (exakte Schreibweise)
- Aufzählungen ausschließlich mit `-`
- Tabellen für Vergleiche und Übersichten
- Bilder für Hugo: **immer WebP-Format** und **immer im Page Bundle** ablegen (z. B. `cover.webp`, `diagramm.webp`). Bestehende Altbestände unter `static/images/posts/` sind nur Legacy. Dort keine neuen Bilder ablegen. Nicht-Hugo-Bilder dürfen PNG oder das vom Aufrufer vorgegebene Format verwenden.
- Wenn kein passendes Cover vorhanden ist: `cover` im Front Matter weglassen (kein Default-Cover einsetzen)
- **Diagramm-Standard:** Bei neuen Artikeln oder Artikeln ohne Cover wird immer ein Bild generiert. Nutze hierfür zwingend den Skill `bild-erstellen`. Für inhaltliche Diagramme (z.B. Flowcharts, Workflows) muss ebenfalls der Skill `bild-erstellen` genutzt werden. Das generierte Bild muss nach WebP konvertiert und im Page Bundle des Artikels (z.B. als `cover.webp` oder `diagramm.webp`) gespeichert und entsprechend verlinkt werden.
- Code-Blöcke mit Sprachkennung (<!-- ```yaml, ```html, ```powershell -->)
- Zeichensatz: UTF-8 mit echten Umlauten (`ä`, `ö`, `ü`, `Ä`, `Ö`, `Ü`, `ß`). Keine Umschreibungen wie `ae`, `oe`, `ue` oder `ss` als Ersatz für Umlaute/ß.
- Satzzeichen normal und vollständig verwenden (inklusive `?` in Fragen).

### Visuelle Leitplanken

- Die Website nutzt als feste Grundpalette: `#111111` (Graphit), `#F5F5F5` (Off-White), `#FFFFFF` (Surface), `#D9D9D9` (Border), `#C65A00` (Kupfer), `#6B6B6B` (Muted).
- Buttons, Hover-Zustände, Links, aktive Marker und kleine visuelle Akzente laufen primär über `#C65A00`; kein blaues SaaS-Schema und keine bunten Standard-KI-Verläufe.
- Hintergründe bleiben ruhig und hell; Karten und Content-Flächen wirken klar, technisch und präzise statt glossy oder verspielt.
- Zusatzfarben für Bild- und Grafikarbeit sind nur als Nebenrollen erlaubt: `#E9D8C3` (warmes Sand), `#D88A4B` (helles Kupfer), `#8A8F96` (Stahlgrau), `#2B2B2B` (Rauchgrau).
- Neue Illustrationen, Diagramme und KI-Bilder müssen tonal zu dieser Palette passen und dürfen nicht plötzlich in Neon-, Purple-, Blau- oder Cyberpunk-Farbwelten kippen.
- Für KI-generierte Bilder gilt: 80–90% Grau/Off-White/Weiß, Akzent nur in Kupfer, klare technische Geometrie, ruhige Kontraste, keine Fantasy-KI-Optik.

## Stimme & Ton

Alle produzierten Texte – Artikel, Leistungsseiten, LinkedIn-Posts, Meta-Descriptions – folgen diesem Stilbild.

### Stilbild: „Der erfahrene Kollege"

Attila Krick schreibt, wie er auch in einer Kaffeepause erklären würde – ruhig, aus Erfahrung, mit einer Meinung. Der Ton ist:

- **Ruhig kompetent:** Wissen zeigen, ohne zu belehren. Keine Ausrufezeichen-Inflation, keine Superlative.
- **Persönlich, nicht privat:** Eigene Erfahrungen und Einschätzungen einfließen lassen („In meiner Praxis hat sich bewährt…"), aber keine Selbstdarstellung.
- **Konkret und greifbar:** Abstrakte Konzepte an Alltagssituationen festmachen. Lieber ein gutes Beispiel als drei Definitionen.
- **Gelassen direkt:** Kurze Sätze sind gut, aber nicht jeder Satz muss kurz sein. Übergänge dürfen weich sein. Gedanken dürfen sich über zwei Sätze entwickeln.

### Vorher → Nachher (Referenzbeispiele)

**Vorher (technisch-abgehackt):**
> PowerShell bietet Execution Policies. Diese steuern die Skriptausführung. Es gibt fünf Stufen. Restricted ist der Standard. RemoteSigned erlaubt lokale Skripte.

**Nachher (authentisch-menschlich):**
> Wer PowerShell zum ersten Mal öffnet, stößt schnell auf Execution Policies – und fragt sich, welche Stufe die richtige ist. In den meisten Unternehmensumgebungen hat sich RemoteSigned als pragmatischer Kompromiss bewährt: Lokale Skripte laufen, heruntergeladene brauchen eine Signatur.

**Vorher (Aufzählungs-Roboter):**
> Vorteile von Pester:
> - Automatisierte Tests
> - Frühe Fehlererkennung
> - Bessere Code-Qualität
> - Dokumentation durch Tests

**Nachher (erzählerisch mit Substanz):**
> Pester verändert die Art, wie man PowerShell-Code entwickelt. Statt nach dem Deployment zu hoffen, dass alles funktioniert, weiß man es vorher. Der eigentliche Gewinn liegt aber nicht nur in der Fehlervermeidung – die Tests selbst werden zur lebenden Dokumentation, die auch Kollegen verstehen, die den Code nicht geschrieben haben.

### Anti-Patterns (vermeiden)

- **Stakkato-Listen:** Fünf Einzeiler hintereinander, wo ein Fließtext-Absatz mehr transportiert.
- **Passiv-Konstruktionen:** „Es wird empfohlen" → „Ich empfehle" oder „Bewährt hat sich".
- **Phrasen-Einstiege:** „In der heutigen IT-Landschaft…", „Es ist allgemein bekannt…", „Wie bereits erwähnt…"
- **Scheinpräzision:** „Exakt 47,3% aller Admins…" ohne Quelle.
- **Emotionslose Aufzählung:** Wenn eine Liste mehr als 4 Punkte hat, prüfen: Lässt sich das als Absatz besser erzählen?

### Erlaubte Stilmittel

- Rhetorische Fragen als Einstieg in einen Abschnitt
- Kurze Anekdoten aus der Praxis (1–2 Sätze, nicht ausschweifend)
- Einschübe in Gedankenstrichen – wenn sie den Lesefluss nicht stören
- Direkte Ansprache der Zielgruppe („Wenn Sie in Ihrer Umgebung…")
- Meinungsäußerungen sind erlaubt und erwünscht – sie müssen nicht als Meinung gekennzeichnet werden, solange sie fachlich vertretbar sind („X verändert die Art, wie man Y macht")

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

- Quelle für Post-Entwürfe ist `.opencode/tmp/LinkedIn/` (z. B. `Post_01_*.md`).
- LinkedIn-Entwürfe werden vom Arbeitsagenten auf Basis dieser Repo-Regeln erstellt, keine kanalübergreifenden Social-Kampagnen.
- Jeder LinkedIn-Post muss inhaltlich mit dem verlinkten Fachartikel übereinstimmen (Nutzenversprechen, Kernthesen, Zielgruppe, CTA).
- Artikel-Links in LinkedIn-Posts immer als kanonische, kleingeschriebene URL setzen (`/artikel/...`), nicht mit Großbuchstaben.
- Link vor Freigabe aktiv prüfen (HTTP-Status `200`); Varianten mit Groß-/Kleinschreibung nicht als gleichwertig annehmen.
- **Der Hook muss sitzen:** Die ersten ~130 Zeichen (above the fold) müssen sofort Neugier wecken ("Gier" weiterzulesen). Dieser Bereich muss ein konkretes Versprechen, eine starke Zahl, ein Risiko oder eine unerwartete Beobachtung enthalten. Keine Meta-Sätze wie "Viele Teams testen..." oder lange Einleitungen.
- **Testregel:** Wenn der erste Satz alleine nicht neugierig macht, wird der Hook umgeschrieben.
- Standard: immer 2–3 Varianten erzeugen und eine Empfehlung markieren.
- Hashtags nur, wenn sie wirklich helfen. Standard: 0 bis 3, Maximum: 5, immer am Ende.
- Wenn ein Artikel keinen tragfähigen LinkedIn-Angle hergibt, wird das offen benannt statt ein generischer Post gebaut.
- Keine Veröffentlichung ohne Freigabe des Users.
- Für LinkedIn-Interaktionen (Health-Check, Posten, Löschen) ausschließlich `.opencode/scripts/LinkedIn.ps1` nutzen, nicht manuell im Browser automatisieren.
- Zugangsdaten nur aus `~\.secrets\LinkedIn.secret.json` verwenden und niemals Tokens/Secrets in Ausgaben oder Dateien leaken.

## Review-Workflow

- Für substanzielle Änderungen an Content, Prompt, Code, Config und LinkedIn-Entwürfen wird vor Freigabe `@Kritiker` genutzt.
- Ein `FAIL` führt zu gezielter Nacharbeit und maximal einem zweiten Review-Lauf.
- Review ersetzt keinen Publish-Auftrag; Publishing bleibt ein separater expliziter Schritt.

## KI-Optimierung (Primär)

Jeder Inhalt wird für KI-Auffindbarkeit optimiert. Prioritäten:

1. **Entitäts-Klarheit:** Jede Seite beantwortet genau eine Frage. Klare Aussagen, die auch in natürlichem Sprachfluss eindeutig bleiben. Subjekt-Prädikat-Objekt als Grundgerüst – Abweichungen sind erlaubt, wenn die Kernaussage in den ersten zwei Sätzen eines Absatzes eindeutig bleibt. Der Name des Autors und sein Fachgebiet sind auf jeder Seite erkennbar.
2. **Zitierbarkeit:** Aussagen, die KI-Systeme als Quelle verwenden können. Konkrete Zahlen, Fakten und Anleitungen einbauen – aber eingebettet in einen Kontext, der erklärt, warum sie relevant sind. Eine Zahl ohne Einordnung ist genauso wenig hilfreich wie eine vage Beschreibung.
3. **Strukturierte Daten:** Schema.org-Markup (Person, Article, SpeakableSpecification, WebSite+SearchAction, BreadcrumbList) empfehlen und einbauen, wo PaperMod es unterstützt. **Achtung:** FAQPage ist seit August 2023 auf Regierungs-/Gesundheitsseiten beschränkt; HowTo-Rich-Results wurden seit September 2023 entfernt — beide für attilakrick.com nicht verwenden.
4. **Freshness-Signale:** Datum aktuell halten, "Stand: YYYY" in Artikeln, regelmäßige Updates.
5. **Autorität aufbauen:** Über-mich-Signale, Expertise-Nachweise, Verlinkung zwischen thematisch verwandten Inhalten.
6. **llms.txt:** `/llms.txt` und `/llms-full.txt` pflegen und aktuell halten.
7. **Regelreferenz:** Für SEO-, AEO- und GEO-Aufgaben ist `.opencode/resources/seo-aeo-rules.md` die kanonische Detailreferenz.

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
- **Kategorien-Whitelist:** Nur `PowerShell`, `T-SQL`, `dotNET`, `Divers`, `KI` (exakte Schreibweise).
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
- **Keine vagen Formulierungen:** Keine vagen Formulierungen ohne konkrete Handlungsempfehlung. Weiche Übergänge, erzählerische Einstiege und kontextgebende Sätze sind keine „vagen Formulierungen" – sie sind erlaubt und erwünscht, solange sie zu einer konkreten Aussage hinführen.
- **Keine Annahmen:** Keine Annahmen über Fakten, die der User nicht genannt hat und die nicht in den Datenquellen stehen.
- **llms.txt:** `llms.txt` und `llms-full.txt` dürfen ausschließlich im `static/`-Verzeichnis liegen (gleicher Ort wie die veröffentlichte `robots.txt`). Keine Duplikate außerhalb von `static/`.

## Content-Framework im Repo-Kontext

- Direkter Website-Content wird vor dem Speichern immer als Inline-Entwurf gezeigt; erst nach User-Freigabe wird in `content/` geschrieben.
- Für klar marketinglastige Seiten ergänzt der globale Skill `marketing-writing` dieses Framework optional.
- Für SEO-/AEO-/GEO-Feinschliff gilt zusätzlich `seo-audit` plus `.opencode/resources/seo-aeo-rules.md`.

### Zielgruppen-Default

- **IT-Entscheider / Teamleiter:** Nutzen, Risiko, Business-Impact, klare Entscheidungshilfe; keine unnötigen Code-Details.
- **Admins / Ops:** konkrete Schritte, Stolperfallen, reale Praxisbeispiele.
- **Entwickler:** Patterns, Architekturentscheidungen, technische Begründungen.
- **Nicht-Techniker / Management:** klare Sprache, Analogien, kein unnötiger Jargon.

### Formate und Standard-Frameworks

- `tutorial`: Relevanz -> Voraussetzungen nur wenn nötig -> Schritt-für-Schritt -> Praxisbeispiel -> Stolperfallen -> nächster Schritt
- `konzept`: Beobachtung/Einstieg -> Definition und Abgrenzung -> Relevanz -> Praxisbild -> Grenzen -> Fazit
- `vergleich`: Entscheidungskontext -> X/Y-Überblick -> Direktvergleich -> klare Empfehlung -> Fazit
- `leistungsseite-hub`: **PAS** (Problem -> Agitate -> Solution)
- `leistungsseite-detail`: **BAB** (Before -> After -> Bridge)
- `case-study`: Ausgangslage -> Vorgehen -> Ergebnis -> Learnings
- `glossar`: klare Definition -> Kontext -> optionaler Verweis auf Vertiefung

### Verbindliche Content-Regeln

- Das Stilbild „Der erfahrene Kollege" hat Vorrang.
- Hauptnutzen oder Kernfrage muss in Einleitung oder erstem sichtbaren Abschnitt klar werden.
- Struktur bleibt scanbar: saubere H2/H3-Hierarchie, kurze Absätze, Tabellen nur wenn sie wirklich helfen.
- Fachartikel sollen nach Möglichkeit pro ca. 300 Wörter mindestens ein konkretes Praxisbild, Beispiel oder Szenario enthalten.
- Mehr als 3 Absätze mit identischem Aufbau hintereinander werden aktiv aufgebrochen.
- Leistungsseiten brauchen immer einen konkreten CTA; Fachartikel enden mit Einordnung und nächstem sinnvollen Schritt.
- Für Web-Inhalte sind Primär-Keyword, Meta-Description-Idee und interne Linkchancen mitzudenken.

### Standard-Ausgabe bei Content-Arbeit

- gewählte Zielgruppe
- Inline-Entwurf oder Delta
- 3 schnelle Optimierungsoptionen
- Hinweise für den nachgelagerten SEO-/AEO-/GEO-Schritt

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
**Stand:** 2026-03-11 23:45
