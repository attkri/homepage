---
draft: false
date: 2026-02-27T00:00:00+01:00
title: "IT-News vom 27. Februar 2026"
description: "Anthropic vs. Pentagon, GitHub Copilot CLI GA, Windows Admin Center CVE-2026-26119 und Azure SQL-Updates – die wichtigsten IT-News vom 27. Februar 2026."
categories:
  - Divers
tags:
  - News
  - KI
  - GitHub Copilot
  - VS Code
  - Azure SQL
  - IT-Security
author: "Attila Krick"
showToc: true
TocOpen: false
comments: false
ShowReadingTime: true
ShowBreadCrumbs: true
ShowPostNavLinks: true
ShowShareButtons: false
ShowCodeCopyButtons: false
disableHLJS: true
---

## Breaking News

### [Anthropic widersetzt sich dem Pentagon](https://www.tagesschau.de/wirtschaft/digitales/pentagon-anthropic-ki-militaer-streit-100.html)

Das US-Verteidigungsministerium forderte von Anthropic den uneingeschränkten Einsatz von Claude für militärische Zwecke – inklusive autonomer Waffen und Massenüberwachung. Anthropic besteht auf seinen Nutzungsrichtlinien und verweigert, trotz Drohungen des Pentagons.

Ein KI-Unternehmen hält seinen ethischen Leitplanken stand, obwohl ein staatlicher Großkunde Druck macht. Die Frage, wer am Ende nachgibt, bleibt offen.

*Quellen: [tagesschau.de](https://www.tagesschau.de/wirtschaft/digitales/pentagon-anthropic-ki-militaer-streit-100.html) · [golem.de](https://www.golem.de/news/streit-mit-kriegsministerium-anthropic-bleibt-seinen-ki-regeln-treu-2602-205925.html) · [the-decoder.de](https://the-decoder.de/ki-fuer-massenueberwachung-und-autonome-waffen-streit-zwischen-anthropic-und-pentagon-spitzt-sich-zu/) · [handelsblatt.com](https://www.handelsblatt.com/technik/it-internet/anthropic-ki-firma-widersetzt-sich-pentagon-bei-sicherheitsvorkehrungen/100203882.html) · [derstandard.de](https://www.derstandard.de/story/3000000310407/diese-drohungen-aendern-nichts-ki-firma-widersetzt-sich-us-verteidigungsministerium) · 25.–27. Feb 2026*

---

## KI

### [USA werfen China Diebstahl von KI-Forschung vor](https://de.euronews.com/next/2026/02/26/ki-konflikt-usa-werfen-chinas-techkonzernen-diebstahl-von-milliarden-an-forschung-vor)

Die US-Regierung beschuldigt chinesische Technologiekonzerne, milliardenschwere KI-Forschung gestohlen zu haben. Der Konflikt verschärft den geopolitischen Wettlauf um KI-Dominanz weiter.

*Quelle: euronews.com · 26. Feb 2026*

### [KI-Agenten brauchen noch Menschen](https://www.tagesschau.de/wissen/technologie/ki-agenten-100.html)

Trotz beeindruckender Demos sind autonome KI-Systeme im produktiven Einsatz noch stark auf menschliche Aufsicht angewiesen. Zuverlässigkeit und Fehlerkorrektur bleiben die größten Hürden.

*Quelle: tagesschau.de · 25. Feb 2026*

---

## Tools & Dev

### [GitHub Copilot CLI ist ab sofort allgemein verfügbar (GA)](https://github.blog/changelog/2026-02-25-github-copilot-cli-is-now-generally-available/)

GitHub hat die CLI-Integration von Copilot aus der Beta entlassen. Neu dabei: GitHub MCP ist standardmäßig aktiviert, dazu kommen neue Befehle wie `/plan`, `/plugin`, `/resume`, `/review`, `/yolo` und `/models`.

*Quelle: github.blog · 25. Feb 2026*

→ Mein Fachartikel dazu: [KI-Agenten mit GitHub Copilot und PowerShell nutzen](/artikel/ki_vscode_github_copilot_agent_powershell_nutzen/)

### [VS Code 1.110 Insiders: Native Browser-Integration im Chat](https://code.visualstudio.com/updates/v1_110)

VS Code Insiders 1.110 bringt native Browser-Steuerung direkt im Chat-Agenten – ohne externe Extensions. Außerdem lassen sich Agent Plugins jetzt aus privaten GitHub Repositories laden.

*Quellen: [visualstudiomagazine.com](https://visualstudiomagazine.com/articles/2026/02/25/vs-code-v1-110-insiders-ai-agents-gain-native-browser-access-and-global-instruction.aspx) · [code.visualstudio.com](https://code.visualstudio.com/updates/v1_110) · 25. Feb 2026*

→ Mein Fachartikel dazu: [VS Code für Einsteiger](/artikel/vscode_starter/)

### [GitHub Copilot Skills: Wiederverwendbare KI-Workflows für DevOps](https://dev.to/pwd9000/github-copilot-skills-reusable-ai-workflows-for-devops-and-sres-caf)

GitHub Copilot Skills ermöglichen wiederverwendbare KI-Workflows für DevOps und SREs – ähnlich wie Custom Instructions, aber strukturierter und teamfähig.

*Quelle: dev.to · ~24. Feb 2026*

---

## T-SQL & SQL Server

### [Azure SQL: Late-February 2026 Updates](https://azure.microsoft.com/updates?id=557517)

Microsoft liefert neue Features für Azure SQL und die VS Code MSSQL Extension: "Search Database Objects" ermöglicht eine schnelle Objektsuche direkt in der Extension, dazu kommt ein verbesserter SQL Projects Publish Dialog.

*Quellen: [azure.microsoft.com](https://azure.microsoft.com/updates?id=557517) · [azurelook.com](https://azurelook.com/azure-update/in-preview-public-preview-azure-sql-updates-for-mid-february-2026/) · ~25. Feb 2026*

→ Mein Fachartikel dazu: [SQL Server per KI und MCP abfragen](/artikel/ki_mcp_sql_server_db_abfrage/)

---

## IT-Security

### [Microsoft schließt kritische Privilege-Escalation-Lücke CVE-2026-26119](https://diesec.com/de/2026/02/top-5-cybersecurity-nachrichten-vom-27-februar-2026/)

Microsoft hat eine Privilege-Escalation-Schwachstelle (CVSS 8.8) im Windows Admin Center geschlossen. Ursache war eine fehlerhafte Authentifizierung, die einem angemeldeten Angreifer eine Rechteausweitung ermöglichte. Update sofort einspielen.

*Quelle: diesec.com · 27. Feb 2026*

### [BMFTR veröffentlicht Eckpunktepapier Cybersicherheit](https://it-production.com/news/maerkte-und-trends/bmftr-veroeffentlicht-eckpunktepapier-cybersicherheit/)

Das Bundesministerium für Forschung, Technologie und Raumfahrt hat ein Eckpunktepapier zur Cybersicherheit veröffentlicht – ein politisches Signal, das Sicherheitsanforderungen für Technologieprojekte weiter schärfen dürfte.

*Quelle: it-production.com · 26. Feb 2026*

### [NIS2 im Krankenhaus: IT-Sicherheit wird zur Führungsaufgabe](https://www.consileon.de/blog/2026/02/24/nis2-im-krankenhaus-it-sicherheit-wird-zur-fuehrungsaufgabe/)

Mit NIS2 sind nahezu alle Krankenhäuser in Deutschland betroffen. IT-Sicherheit ist damit keine rein technische Frage mehr, sondern wird zur Managementaufgabe – mit haftungsrechtlichen Konsequenzen für die Geschäftsführung.

*Quelle: consileon.de · 24. Feb 2026*

---

## PowerShell & Automation

Im Zeitraum 24.–27. Februar 2026 lagen keine neuen Meldungen vor.

---

## .NET

Im Zeitraum 24.–27. Februar 2026 lagen keine neuen Meldungen vor.

---

## Besonders relevant

| Thema | Relevanz |
| :---- | :------- |
| Anthropic vs. Pentagon | Hoch – KI-Ethik trifft Staatsmacht, Präzedenzfall für die gesamte Branche |
| GitHub Copilot CLI GA | Hoch – direkt einsetzbar, MCP out-of-the-box |
| CVE-2026-26119 Windows Admin Center | Hoch – CVSS 8.8, Update sofort einspielen |
| NIS2 im Krankenhaus | Mittel – relevant für alle, die KRITIS-nahe Systeme betreiben |
| VS Code 1.110 Insiders | Mittel – Browser-Steuerung im Chat-Agenten ist ein echter Sprung |

---

*10 Artikel · Stand: 27. Feb 2026 · Quellen: tagesschau.de, golem.de, github.blog, code.visualstudio.com, azure.microsoft.com, diesec.com, consileon.de u. a.*

*Diese Ausgabe auch per [RSS abonnieren](/news/index.xml)*
