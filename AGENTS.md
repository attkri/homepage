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
  - `astro`
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
- src/
  - pages/                # File-based Routing für Seiten und Routen
  - content/              # Markdown-/MDX-Inhalte für Artikel, News, Seiten und Sektionen
  - layouts/              # Layouts, Seitentemplates und Strukturbausteine
  - config/               # Zentrale Website-Konfiguration
  - icons/                # Eigene SVG-Icons
  - styles/               # Globale Styles
- public/                 # Statische Dateien, die 1:1 ausgeliefert werden
- .ALT/                   # Archivierter alter Hugo-Stand, nicht mehr produktiv

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

### Astro-Website

- **Generator:** [Astro](https://astro.build/), **Version:** `6.0.2`
- **Content-Modell:** Astro Content Collections über `src/content.config.ts`
- **Sprache:** `de-DE`
- **Base-URL:** `https://attilakrick.com/`
- Für technische Astro-Arbeit wie `src/pages/`, Layouts, dynamische Routen, `getStaticPaths()`, Content Collections, Build-Diagnose oder Seitenstruktur ist primär der globale Skill `astro` vorgesehen.
- `web-frontend-builder` ergänzt Astro-Arbeit nur dann, wenn die Aufgabe zusätzlich ein klares visuelles, layout- oder komponentenorientiertes Ziel hat.
- Bei Mischfällen gilt: zuerst `astro`, `web-frontend-builder` nur ergänzend.
- **Hosting:** GitHub Pages per Action `deploy-astro-pages.yml` (dieses GitHub-Repository ist gleichzeitig Quellcode-Repository und Hoster der Website)
- **Navigation / Menü:** Start, Artikel, Kategorien, Leistungen, News, Kontakt, Impressum, Suchen
- **Suche:** Fuse.js (clientseitig)
- **Cookie-Policy:** Die Website ist technisch **100% cookie-frei**. Funktionen mit Cookies sind ausnahmslos verboten.
- **DSGVO:** Google Analytics deaktiviert; Drittanbieter nur ohne Cookies

### Build-Artefakte und Cache

- `.astro/` ist lokaler Astro-Cache und gehört nicht zu den Quellinhalten der Website.
- `dist/` ist generierte Build-Ausgabe und wird nicht committed.
- Agenten sollen lokale Build-Artefakte nur bei Bedarf bereinigen, wenn unnötiges Git-Rauschen entsteht.
- Zulässige Bereinigung: lokales Löschen von `.astro/` oder `dist/`.

### Astro-Technik

- Projektseitige Anpassungen erfolgen über `src/pages/`, `src/layouts/`, `src/content/`, `src/config/`, `src/styles/` und `public/`.
- Maßgeblicher technischer Release-Check ist `npm run build`.
- `npm run dev` ist nur für Vorschau und Fehlersuche gedacht, nicht als Abnahmeersatz.

### Astro Frontmatter

#### Artikel

Alle Artikel verwenden dieses Schema:

```yaml
---
title: "<Titel>"                    # max. 580px Breite
meta_title: "<Meta Title>"          # falls abweichend vom Titel
description: "<Beschreibung>"       # max. 1000px Breite
date: YYYY-MM-DDTHH:mm:ss+02:00      # Immer mit aktueller System-Zeit (inkl. Uhrzeit) angeben
cover_image: "/images/artikel/<slug>/cover.webp"
image: "/images/artikel/<slug>/cover.webp"
author: "Attila Krick"
author_image: "/images/legacy/site/portrait-attila-krick-300x300.webp"
draft: false
---

## Mit zwei Hashtags beginnt die erste Überschrift
```

**Hinweis zu Datumsangaben (`date`):**

- **Neue Artikel:** Das `date`-Feld muss immer mit einer konkreten Uhrzeit (z.B. `T12:23:00+02:00`) gesetzt werden, damit sie in der Sortierung korrekt erfasst werden.
- **Kleinere Änderungen / SEO-Updates:** Das `date`-Feld bleibt zwingend unverändert.
- **Komplette Überarbeitungen (Major Rewrites):** Nur in diesem Fall wird das `date`-Feld auf das neue Datum (inkl. Uhrzeit) aktualisiert.

Hinweis zu Artikelbildern:

- `cover_image` und `image` sind **optional**, aber für Artikel in der Praxis meist sinnvoll.
- Wenn kein inhaltlich passendes Bild vorhanden ist, wird **kein Default-Cover** gesetzt.
- Keine Platzhalter- oder Portrait-Standardbilder als Ersatz verwenden.

Optionale Front-Matter-Felder (nicht im Standard-Schema, aber gültig):

- `canonical` – Kanonische URL, falls abweichend von der Standard-URL. Wird bei Duplikat-Risiko oder abweichender Standard-URL gesetzt.

#### Statische Seiten

Für Seiten ohne Artikelcharakter (Leistung, Kontakt, etc.):

```yaml
---
title: "<Titel>"
description: "<Beschreibung>"
meta_title: "<Meta Title>"         # optional
image: "<OG-Bild>"                 # optional
draft: false
---
```

### Content-Konventionen

- Überschriften ab `##` (H2) -- `#` (H1) ist der Titel aus dem Front Matter
- Kategorien: `PowerShell`, `T-SQL`, `dotNET`, `Divers`, `KI` (exakte Schreibweise)
- Aufzählungen ausschließlich mit `-`
- Tabellen für Vergleiche und Übersichten
- Bilder für Artikel und Seiten liegen standardmäßig unter `public/images/...`; für Artikel bevorzugt unter `public/images/artikel/<slug>/...`.
- Neue Artikelbilder bevorzugt als WebP anlegen; Ausnahmen nur, wenn PNG oder SVG fachlich sinnvoller ist.
- Wenn kein passendes Cover vorhanden ist: `cover_image` und `image` im Front Matter weglassen (kein Default-Cover einsetzen).
- **Diagramm-Standard:** Bei neuen Artikeln oder Artikeln ohne Cover wird immer ein Bild generiert. Nutze hierfür zwingend den Skill `bild-erstellen`. Für inhaltliche Diagramme (z. B. Flowcharts, Workflows) muss ebenfalls der Skill `bild-erstellen` genutzt werden. Das generierte Bild wird nach WebP konvertiert und unter `public/images/artikel/<slug>/...` oder einem fachlich passenden Bildpfad abgelegt.
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
- Datum immer `T00:00:00+01:00` im Frontmatter setzen, damit Tagesausgaben stabil und eindeutig datiert sind
- **Betrieb:** Vollautomatisch – ein externer Scheduler triggert `PublishNew_AKC` täglich. Der Agent führt alle Schritte 1–11 ohne Rückfragen aus, inklusive Commit & Push.
- **Quellensprache:** Primär Deutsch. Bei fehlenden DE-Quellen: englische Quellen suchen, Titel und Zusammenfassung auf Deutsch übersetzen, Quelle als `(EN)` kennzeichnen. Leere Kategorien existieren nicht.
- **Fehlerfall:** Bei Git-Fehler 1x wiederholen, dann `"JobStatus": "FAILED"` im JSON zurückgeben.
- **Struktur:** `src/content/news/` mit Datumsdateien wie `src/content/news/YYYY-MM-DD.md`

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
3. **Strukturierte Daten:** Schema.org-Markup (Person, Article, SpeakableSpecification, WebSite+SearchAction, BreadcrumbList) empfehlen und einbauen, wo die Astro-Struktur es sinnvoll unterstützt. **Achtung:** FAQPage ist seit August 2023 auf Regierungs-/Gesundheitsseiten beschränkt; HowTo-Rich-Results wurden seit September 2023 entfernt — beide für attilakrick.com nicht verwenden.
4. **Freshness-Signale:** Datum aktuell halten, "Stand: YYYY" in Artikeln, regelmäßige Updates.
5. **Autorität aufbauen:** Über-mich-Signale, Expertise-Nachweise, Verlinkung zwischen thematisch verwandten Inhalten.
6. **llms.txt:** `/llms.txt` und `/llms-full.txt` pflegen und aktuell halten.
7. **Regelreferenz:** Für SEO-, AEO- und GEO-Aufgaben ist `.opencode/resources/seo-aeo-rules.md` die kanonische Detailreferenz.

## SEO-Optimierung (Sekundär)

- Title-Tags und Meta-Descriptions (innerhalb der Astro-Frontmatter-Felder `title`, `meta_title` und `description`)
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
- **Bildpfade:** Neue Bilder standardmäßig unter `public/images/` ablegen; für Artikel bevorzugt unter `public/images/artikel/<slug>/`. Keine neuen Bilder in alten Legacy-Pfaden anlegen.
- **Build-Artefakte:** `.astro/` und `dist/` sind Build-Artefakte und werden nicht committed.
- **H1-Verbot:** Kein `#` (H1) im Artikeltext – H1 kommt aus dem Front-Matter-Titel.
- **llms.txt:** Ausschließlich in `public/` – keine Duplikate außerhalb.

## Regeln (unverhandelbar)

- **Global:** Verbindlich soweit noch nicht eingelesen sind die `<GLOBAL_CONFIG_DIR>\Rules\*.md` Regeln.
- **Anti-Cookie:** Es dürfen **nie** Funktionen, Skripte oder Dienste eingesetzt werden, die Cookies setzen, lesen oder voraussetzen.
  - Die Website bleibt dauerhaft **100% cookie-frei**.
  - Es werden **keine** Cookie-Banner, Cookie-Consent-Tools oder Cookie-Disclaimer eingesetzt.
  - Drittanbieter-Integrationen sind nur erlaubt, wenn sie nachweislich ohne Cookies funktionieren.
- **Freigabe:** Nur Änderungen am **direkten Website-Inhalt** brauchen vor dem Speichern die Freigabe durch den User.
- **Keine vagen Formulierungen:** Keine vagen Formulierungen ohne konkrete Handlungsempfehlung. Weiche Übergänge, erzählerische Einstiege und kontextgebende Sätze sind keine „vagen Formulierungen" – sie sind erlaubt und erwünscht, solange sie zu einer konkreten Aussage hinführen.
- **Keine Annahmen:** Keine Annahmen über Fakten, die der User nicht genannt hat und die nicht in den Datenquellen stehen.
- **llms.txt:** `llms.txt` und `llms-full.txt` dürfen ausschließlich im `public/`-Verzeichnis liegen (gleicher Ort wie die veröffentlichte `robots.txt`). Keine Duplikate außerhalb von `public/`.

## Content-Framework im Repo-Kontext

- Direkter Website-Content wird vor dem Speichern immer als Inline-Entwurf gezeigt; erst nach User-Freigabe wird in `src/content/` geschrieben.
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
