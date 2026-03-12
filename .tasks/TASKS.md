# Aufgaben

## Aktiv

### Primäre Aufgaben

- NEWS: Entweder bild ausblenden oder ein passendes genierieren lassen

- Umschreiben von Hugo auf Astro: .opencode\agents\AKCNewsAgent.md

- SEO KI Optimiert

### Sekundäre Aufgaben

- Artikel für attilakrick.com verfassen – ähnlich einem praxisnahen Einführungsbeitrag. Referenz-Stil: [OpenCode Tutorial 2026](https://www.nxcode.io/resources/news/opencode-tutorial-2026).

- Orientierungstext zu KI-Sicherheit einbauen. Referenz-Inhalt: [KI-Sicherheit in der Praxis](https://www.it-daily.net/it-management/ki/ki-sicherheit-genai-risiken).

- Astro-Pflegeanleitung als eigene Datei unter `.tasks/Astro-Pflegeanleitung.md` pflegen.

- **Finale Home: redaktionellen Radar breiter ausbalancieren**
  - Kontext: Für die echte Startseite News-/Artikel-Module später gemischter aus PowerShell, SQL und KI kuratieren; nicht wieder zu KI-lastig werden.

- **Google Search Console Export Ende März 2026 erneut ausführen**
  - Kontext: Fälligkeit 2026-03-31, Export nach `.Analyses/YYYY-MM-DD/gsc-exports/`, Auswertung in `.Analyses/YYYY-MM-DD/GSC-Auswertung.md`.

- Neue Blog-Themen
  - Agent Skills
    - https://agentskills.io/home
    - https://github.com/anthropics/skills/tree/main/skills
    - https://github.com/microsoft/skills
    - https://github.com/vercel-labs/agent-skills
    - https://github.com/agentskills/agentskills

<!-- ## Mein Wertbeitrag

- KI verständlich erklären – ohne Buzzwords, auf Augenhöhe mit Nicht-Technikern.
- Einsatzmöglichkeiten und Mehrwerte aufzeigen (Zeit, Qualität, Risiko, Geschwindigkeit).
- Tool-Landschaft einordnen: Kategorien, Entscheidungskriterien, kein Produktvertrieb.
- Kostenarten transparent machen (Lizenz, Nutzung, Integration, Schulung, Betrieb).
- Datenschutz und Sicherheit: klare Leitplanken statt Angst.
- Roadmap entwickeln: von Quick Wins bis Agent-Betrieb, strukturiert und sicher.
- Cloud vs. On-Prem: Vor- und Nachteile, Entscheidungshilfen. -->

## Erledigt

- **SEO-/AEO-/GEO-Regeln in den globalen `seo-audit`-Skill konsolidiert**
  - Kontext: Die frühere Repo-Referenz wurde in den Skill überführt; kanonische Regelbasis läuft jetzt direkt über `seo-audit`.

- **Astro-Grundstruktur und Publish-Workflow kurz dokumentiert**
  - Kontext: Pflegeanleitung in `.tasks/TASKS.md` ergänzt; neue Inhalte laufen über `src/content/`, Livegang über `main` + GitHub Pages.

- **Logo im Header geschärft und angepasst**
  - Kontext: `public/images/logo.svg` und zentrale Logo-Ausgabe bereinigt.

- **IT-News von Porträtbild auf generische Grafik umgestellt**
  - Kontext: News-Karten nutzen jetzt generische Cover- und Badge-Grafiken statt Attila-Porträt.

- **Schema-Tests für neue Leistungsseiten durchführen**
  - Kontext: Service + FAQ in Rich Results Test und Schema Markup Validator prüfen für:
    - `https://attilakrick.com/leistung/sql-server-beratung/`
    - `https://attilakrick.com/leistung/sql-performance-tuning/`
    - `https://attilakrick.com/leistung/dotnet-code-review/`
    - `https://attilakrick.com/leistung/dotnet-beratung/`
    - `https://attilakrick.com/leistung/wpf-refactoring-beratung/`
    - `https://attilakrick.com/leistung/tsql-workshop/`

- **GSC URL-Prüfung und Indexierung für neue Leistungsseiten anstoßen**
  - Kontext: In Google Search Console für alle 6 `/leistung/...`-URLs "URL-Prüfung" und danach "Indexierung beantragen" ausführen.
