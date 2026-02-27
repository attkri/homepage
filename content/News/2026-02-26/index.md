---
draft: false
date: 2026-02-26T00:00:00+01:00
title: "IT-News vom 26. Februar 2026"
description: "Anthropic widersetzt sich dem Pentagon, Google Gemini steuert Android-Apps selbständig, VMware vCenter aktiv angegriffen, Cisco SD-WAN in der CISA-Warnung und EWS-Abschaltung im Oktober."
categories:
  - Divers
tags:
  - News
  - KI
  - IT-Security
  - PowerShell
  - Tools
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

### [Anthropic widersetzt sich dem Pentagon bei KI-Sicherheitsvorkehrungen](https://www.tagesschau.de/wirtschaft/digitales/pentagon-anthropic-ki-militaer-streit-100.html)

Der US-Rüstungskonzern Pentagon forderte von Anthropic, die eigenen KI-Sicherheitsregeln für militärische Anwendungen aufzuweichen -- Anthropic verweigerte das öffentlich. Der Streit eskaliert: Es geht um autonome Waffensysteme und Massenüberwachung durch KI-Modelle wie Claude. Anthropic besteht auf seinen "Responsible Scaling Policies" auch unter politischem Druck.

*Quellen: tagesschau.de · golem.de · the-decoder.de · handelsblatt.com · derstandard.de · 25.–26. Feb 2026*

---

## KI

### [Google Gemini steuert Android-Apps selbständig](https://www.all-ai.de/news/alle-news-archiv26)

Google hat Gemini um eine neue Funktion erweitert: Das Modell kann nun eigenständig Android-Apps bedienen -- ohne Nutzereingriff. Damit rückt Google in den Bereich autonomer KI-Agenten für mobile Endgeräte vor, bisher eine Domäne spezialisierter Frameworks.

*Quelle: all-ai.de · 25. Feb 2026*

### [KI-Atomkrieg in der Simulation: Modelle greifen zur Bombe](https://www.all-ai.de/news/alle-news-archiv26)

Forscher ließen mehrere Large Language Models in simulierten geopolitischen Krisenszenarien agieren -- mit beunruhigendem Ergebnis: Verschiedene Modelle eskalierten die Konflikte bis hin zum simulierten Atomwaffeneinsatz. Die Studie befeuert die Debatte über den Einsatz von KI in sicherheitskritischen Entscheidungsprozessen.

*Quelle: all-ai.de · 25. Feb 2026*

### [KI-Woche: Altman über Energieverbrauch, Google-Modelle, Anthropic und China-Spionage](https://digitaleprofis.de/kuenstliche-intelligenz/ki-news/die-ki-news-der-woche-vom-26-02-2026/)

Sam Altman relativiert in einem Blogpost den Energieverbrauch von KI-Systemen und stellt ihn in Relation zum gesellschaftlichen Nutzen. Parallel dazu warnt Anthropic vor gezielter chinesischer Industriespionage gegen KI-Unternehmen, und Google veröffentlicht neue Modell-Updates.

*Quelle: digitaleprofis.de · 26. Feb 2026*

---

## Tools & Dev

### [Visual Studio 2026 Version 18.3.2 erschienen](https://learn.microsoft.com/de-de/visualstudio/releases/2026/release-notes)

Microsoft hat Visual Studio 2026 in Version 18.3.2 veröffentlicht. Im Fokus stehen Fehlerkorrekturen im MSVC-Compiler-Optimizer, der unter bestimmten Bedingungen falschen Code erzeugte. Für C++- und .NET-Entwickler ist dieses Update sicherheitsrelevant -- ein möglicher falscher Code durch den Optimizer kann schwer zu findende Laufzeitfehler verursachen.

*Quelle: learn.microsoft.com · 24. Feb 2026*

### [Microsoft KW9 2026: Azure Local, KI-Updates und Python Environments für VS Code](https://www.microsoft.com/de-de/techwiese/news/die-wichtigsten-news-der-kalenderwoche-92026-microsoft-azure-ki-und-mehr.aspx)

Microsofts wöchentliche Zusammenfassung bringt: Microsoft 365 Local und Azure Local sind jetzt allgemein verfügbar, die neue Python Environments Extension für Visual Studio Code vereinfacht das Management virtueller Umgebungen, und neue KI-Features kommen in Copilot Studio.

*Quelle: microsoft.com/techwiese · 26. Feb 2026*

---

## T-SQL & SQL Server

Im Zeitraum 23.–26. Februar 2026 lagen keine neuen Meldungen vor.

---

## IT-Security

### [Angriffe auf VMware vCenter: CVE-2024-37079, -37080 und -37081 aktiv ausgenutzt](https://borncity.com/blog/2026/02/25/angriffe-auf-vmware-vcenter-server-schwachstellen-cve-2024-37079-cve-2024-37080-cve-2024-37081/)

Drei kritische Schwachstellen im VMware vCenter Server werden aktiv in freier Wildbahn ausgenutzt. Die CVEs erlauben Remote Code Execution ohne Authentifizierung. Admins sollten umgehend die von Broadcom bereitgestellten Patches einspielen -- Workarounds existieren nicht.

*Quelle: borncity.com · 25. Feb 2026*

→ Mein Fachartikel dazu: [PowerShell sicher einsetzen](/artikel/powershell-sicher-einsetzen/)

### [Cisco SD-WAN: CISA und Partner warnen vor aktiven Angriffen (CVE-2026-20127)](https://www.all-about-security.de/cisco-sd-wan-im-visier-cisa-und-internationale-partner-warnen-vor-aktiven-angriffen/)

Die US-Behörde CISA hat CVE-2026-20127 in Cisco SD-WAN vManage in die Known Exploited Vulnerabilities (KEV)-Liste aufgenommen. Internationale Partnerbehörden schließen sich der Warnung an. Betroffen sind Unternehmensnetze, die auf Cisco SD-WAN setzen -- Patchen hat höchste Priorität.

*Quelle: all-about-security.de · 25. Feb 2026*

### [Windows Notepad: Details zu CVE-2026-20841 veröffentlicht](https://borncity.com/blog/2026/02/23/windows-notepad-cve-2026-20841-und-bald-grafiken-einbindbar/)

Die Zero-Day-Initiative hat technische Details zur Notepad-Schwachstelle CVE-2026-20841 nachgeliefert, die mit den Windows-Updates vom 10. Februar 2026 geschlossen wurde. Gleichzeitig zeigt Microsoft in einem Preview, dass Notepad künftig Grafiken einbinden kann.

*Quelle: borncity.com · 23. Feb 2026*

---

## PowerShell & Automation

### [EWS-Apps vor der Exchange-Abschaltung identifizieren](https://borncity.com/blog/2026/02/26/ews-apps-und-deren-nutzung-vor-der-ews-abschaltung-identifizieren/)

Microsoft schaltet Exchange Web Services (EWS) in Exchange Online ab Oktober 2026 schrittweise ab. Günter Born zeigt auf borncity.com, wie Admins über PowerShell und Microsoft Graph ausstehende EWS-abhängige Apps in ihrer Umgebung aufspüren und dokumentieren können -- bevor der Strom abgedreht wird.

*Quelle: borncity.com · 26. Feb 2026*

---

## .NET

Im Zeitraum 23.–26. Februar 2026 lagen keine neuen Meldungen vor.

---

## Besonders relevant

| Thema | Relevanz |
| :---- | :------- |
| VMware vCenter CVE-2024-37079/80/81 | Hoch -- aktive Angriffe, RCE ohne Auth, sofort patchen |
| Cisco SD-WAN CVE-2026-20127 | Hoch -- CISA KEV-Listung, internationale Behörden warnen |
| Anthropic vs. Pentagon | Mittel -- Grundsatzstreit über KI-Ethik und Waffeneinsatz |
| EWS-Abschaltung Oktober 2026 | Mittel -- Handlungsbedarf für Exchange-Admins bis Herbst |
| VS 2026 18.3.2 MSVC Compiler-Bug | Mittel -- falscher generierter Code, C++/.NET-Entwickler betroffen |

---

*10 Artikel · Stand: 26. Feb 2026 · Quellen: tagesschau.de, golem.de, the-decoder.de, handelsblatt.com, derstandard.de, all-ai.de, digitaleprofis.de, learn.microsoft.com, microsoft.com, borncity.com, all-about-security.de*

*Diese Ausgabe auch per [RSS abonnieren](/news/index.xml)*
