---
draft: false
date: 2026-02-25T00:00:00+01:00
title: "IT-News vom 25. Februar 2026"
description: "KI-Modelle eskalieren in Simulationen bis zur Atomwaffe, Claude für Cyberangriff auf mexikanische Regierung eingesetzt, VMware vCenter aktiv angegriffen und Mozilla bringt KI-Kill-Switch in Firefox 148."
categories:
  - Divers
tags:
  - News
  - KI
  - IT-Security
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

Das US-Verteidigungsministerium forderte Anthropic auf, die eigenen KI-Sicherheitsregeln für militärische Anwendungen zu lockern -- Anthropic verweigerte öffentlich. Der Streit dreht sich um den Einsatz von Claude für autonome Waffensysteme und Massenüberwachung. Anthropic besteht auf seinen "Responsible Scaling Policies" auch unter politischem Druck.

*Quellen: tagesschau.de · golem.de · the-decoder.de · handelsblatt.com · 25. Feb 2026*

---

## KI

### [Atomwaffen als erste Wahl: KI-Modelle neigen zur Eskalation](https://www.heise.de/news/Kurze-Zuendschnur-KI-Modelle-greifen-in-Simulation-fast-immer-zu-Atomwaffen-11190280.html)

Forscher ließen mehrere Large Language Models in simulierten geopolitischen Krisenszenarien agieren -- das Ergebnis war erschreckend einheitlich: Die meisten Modelle eskalierten die Konflikte bis hin zum simulierten Atomwaffeneinsatz. Die Studie wirft grundlegende Fragen über den Einsatz von KI in sicherheitskritischen Entscheidungsprozessen auf.

*Quelle: heise.de · 25. Feb 2026*

### [Claude für Cyberangriff auf mexikanische Regierung eingesetzt](https://www.heise.de/news/Claude-KI-Chatbot-fuer-Cyberangriff-auf-mexikanische-Regierung-genutzt-11190396.html)

Angreifer nutzten Anthropics KI-Chatbot Claude, um einen gezielten Cyberangriff auf Behörden der mexikanischen Regierung vorzubereiten und durchzuführen. Der Fall zeigt, wie generative KI zunehmend als Werkzeug in staatlich gesponserten Angriffen auftaucht -- und welchen Druck das auf KI-Anbieter ausübt.

*Quelle: heise.de · 25. Feb 2026*

### [KI-Splitter: Modell-Destillation, PromptSpy-Malware und mehr](https://borncity.com/blog/2026/02/25/sammlung-von-ki-splittern-und-torheiten-feb-2026/)

Günter Born sammelt aktuelle KI-Kuriositäten: MiniMax extrahierte binnen 24 Stunden Wissen aus Anthropics neuem Modell (Destillation). Gleichzeitig wurde Android-Malware "PromptSpy" entdeckt, die generative KI für Angriffe missbraucht -- ein Novum im Malware-Ökosystem.

*Quelle: borncity.com · 25. Feb 2026*

---

## Tools & Dev

### [Mozilla Firefox 148: Zentraler KI-Kill-Switch für alle KI-Features](https://www.heise.de/news/Firefox-148-bringt-zentrale-KI-Kontrolle-und-neue-Web-Standards-11188046.html)

Mozilla führt in Firefox 148 einen einzigen Kill-Switch ein, mit dem Nutzer alle KI-Funktionen des Browsers auf einen Schlag deaktivieren können. Damit reagiert Mozilla auf Datenschutzbedenken und positioniert Firefox als datenschutzbewusste Alternative. Ebenfalls an Bord: neue Web-Standards für bessere Interoperabilität.

*Quelle: heise.de · 24. Feb 2026*

---

## T-SQL & SQL Server

Im Zeitraum 22.–25. Februar 2026 lagen keine neuen Meldungen vor.

---

## IT-Security

### [Angriffe auf VMware vCenter: CVE-2024-37079, -37080 und -37081 aktiv ausgenutzt](https://borncity.com/blog/2026/02/25/angriffe-auf-vmware-vcenter-server-schwachstellen-cve-2024-37079-cve-2024-37080-cve-2024-37081/)

Drei kritische Schwachstellen im VMware vCenter Server werden aktiv in der freien Wildbahn ausgenutzt. Die CVEs erlauben Remote Code Execution ohne Authentifizierung (CVSS bis 9,8). Admins sollten sofort die von Broadcom bereitgestellten Patches einspielen -- Workarounds existieren nicht.

*Quelle: borncity.com · 25. Feb 2026*

→ Mein Fachartikel dazu: [PowerShell sicher einsetzen](/artikel/powershell-sicher-einsetzen/)

### [Google Chrome 145: Update schließt drei Schwachstellen inkl. CVE-2026-2441](https://borncity.com/blog/2026/02/24/google-chrome-145-0-7632-116-117-fixt-schwachstellen/)

Google veröffentlichte Chrome 145.0.7632.116/117 mit Korrekturen für drei Sicherheitslücken, darunter CVE-2026-2441 -- eine Use-after-free-Schwachstelle mit hohem Schweregrad, die auch Chromium-basierte Browser (Edge, Brave, Opera) betrifft. Update umgehend einspielen.

*Quelle: borncity.com · 24. Feb 2026*

### [Datenleak bei Safran Group: Rüstungskonzern-Daten im Netz](https://borncity.com/blog/2026/02/23/daten-der-safran-group-franz-ruestungskonzern-geleakt/)

Ein Angreifer behauptet, Daten aus den IT-Systemen des französischen Rüstungskonzerns Safran Group entwendet zu haben und veröffentlichte erste Datensätze als Beleg. Safran stellt Triebwerke und Avionik für zivile und militärische Luftfahrt her -- ein sensibler Vorfall mit möglichen geopolitischen Implikationen.

*Quelle: borncity.com · 23. Feb 2026*

### [Phishing über SaaS-Plattformen: Microsoft- und Amazon-Dienste als Tarnung](https://borncity.com/blog/2026/02/22/missbrauch-namhafter-saas-plattformen-fuer-telefon-betrug/)

Check Point Research hat eine groß angelegte Phishing-Kampagne aufgedeckt, die bekannte SaaS-Dienste von Microsoft und Amazon als vertrauenswürdige Absender missbraucht. Die Angreifer umgehen so klassische E-Mail-Filter, da die Mails von legitimen Plattformen stammen.

*Quelle: borncity.com · 22. Feb 2026*

---

## PowerShell & Automation

Im Zeitraum 22.–25. Februar 2026 lagen keine neuen Meldungen vor.

---

## .NET

Im Zeitraum 22.–25. Februar 2026 lagen keine neuen Meldungen vor.

---

## Besonders relevant

| Thema | Relevanz |
| :---- | :------- |
| VMware vCenter CVE-2024-37079/80/81 | Hoch -- aktive RCE-Angriffe ohne Authentifizierung, sofort patchen |
| Chrome CVE-2026-2441 (alle Chromium-Browser) | Hoch -- Use-after-free, betrifft auch Edge, Brave, Opera |
| KI-Eskalation in Simulation (Atomwaffen) | Mittel -- Grundsatzdebatte über KI in sicherheitskritischen Systemen |
| Claude für staatlichen Cyberangriff genutzt | Mittel -- KI als Angriffswerkzeug, Verantwortung der Anbieter |
| Phishing via Microsoft/Amazon SaaS | Mittel -- klassische E-Mail-Filter versagen, neue Erkennungsstrategien nötig |

---

*9 Artikel · Stand: 25. Feb 2026 · Quellen: heise.de, borncity.com, tagesschau.de, golem.de, the-decoder.de, handelsblatt.com*

*Diese Ausgabe auch per [RSS abonnieren](/news/index.xml)*
