---
draft: false
date: 2026-03-05T00:00:00+01:00
title: "IT-News vom 05. März 2026"
description: "Anthropic verdrängt OpenAI aus dem App Store nach Pentagon-Streit, Claude Code erhält Sprachsteuerung, und kritische Windows-Sicherheitslücken werden aktiv ausgenutzt."
categories:
  - Divers
tags:
  - News
  - KI
  - IT-Security
  - PowerShell
  - dotNET
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

### Topic-Cluster: Anthropic vs. OpenAI — Pentagon-Streit schreibt App-Store-Geschichte

Nachdem Anthropic monatelang einen Pentagon-Vertrag ablehnte, weil dieser militärische KI-Anwendungen ohne Safety-Auflagen zugelassen hätte, reagierte das US-Verteidigungsministerium mit einem faktischen Boykott. Das Ergebnis: Claude kletterte in der ersten März-Woche auf Platz 1 der kostenlosen Apps im US-Apple-App-Store und verdrängte ChatGPT. OpenAI gesteht nun öffentlich, die Deal-Ankündigung sei „schlampig" gewesen, und verhandelt den Vertrag nach — mit explizitem Verbot von Inlandsüberwachung. Anthropic-CEO Dario Amodei griff Sam Altman unterdessen öffentlich an und kritisierte das Loben im „Diktatoren-Stil". Investoren beider Unternehmen drängen auf Deeskalation.

Quellen: [borncity.com](https://borncity.com/news/openai-rudert-nach-pentagon-deal-zurueck/) · [handelsblatt.com](https://www.handelsblatt.com/technik/it-internet/silicon-valley-kein-lob-im-diktatoren-stil-anthropic-chef-greift-openai-an/100205654.html) · [heise.de](https://www.heise.de/news/Nach-Streit-mit-Pentagon-Claude-ueberholt-ChatGPT-in-App-Store-11197563.html) · [ad-hoc-news.de](https://www.ad-hoc-news.de/boerse/news/ueberblick/anthropic-us-regierung-boykottiert-ki-firma-wegen-ethischer-auflagen/68635550)

---

## KI

### [BullshitBench v2: Anthropic top, OpenAI und Google schwächeln](https://www.all-ai.de/news/beitrage2026/bullshit-bench-ki)

Der Benchmark BullshitBench v2 prüft, ob KI-Modelle bei unsinnigen oder fehlerhaften Eingaben widersprechen statt zu halluzinieren. Die Ergebnisse sind ernüchternd: Die meisten aktuellen Sprachmodelle erfinden selbstbewusst falsche Antworten, anstatt den Fehler im Prompt zu erkennen. Reasoning-Modelle schneiden dabei sogar schlechter ab, weil sie um jeden Preis eine Lösung berechnen wollen. Nur Anthropic (Claude) und Alibaba zeigen klare Verbesserungen.

*Quelle: all-ai.de · 04. März 2026*

---

### [GPT-5.3 Instant: OpenAI verbessert ChatGPT mit mehr Faktenpräzision](https://www.it-boltwise.de/openai-verbessert-chatgpt-mit-gpt-5-3-instant.html)

OpenAI hat GPT-5.3 Instant veröffentlicht, ein Update mit dem Ziel höherer Faktenpräzision und natürlicherer Dialoge. Das Modell soll vor allem bei sachlichen Antworten verlässlicher sein — ein direkter Reaktion auf Kritik nach dem Erfolg des BullshitBench-Tests.

*Quelle: it-boltwise.de · 04. März 2026*

---

### [Tech-Konzerne sagen Trump Selbstfinanzierung von KI-Strom zu](https://www.handelsblatt.com/technik/ki/kuenstliche-intelligenz-tech-konzerne-sagen-selbstfinanzierung-von-ki-strom-zu/100205626.html)

US-Präsident Trump hat eine Vereinbarung mit großen Technologieunternehmen unterzeichnet: Die Konzerne verpflichten sich, eigene Kraftwerke für die steigenden Energiebedarfe ihrer KI-Rechenzentren zu bauen, um steigende Strompreise für die Bevölkerung zu verhindern.

*Quelle: handelsblatt.com · 04. März 2026*

---

## Tools & Dev

### [Claude Code bekommt Sprachsteuerung](https://www.it-daily.net/shortnews/claude-code-bekommt-sprachsteuerung)

Anthropic rollt eine Sprachsteuerung für Claude Code aus. Mit dem Befehl `/voice` lässt sich der KI-Coding-Assistent per gesprochener Sprache steuern — das System setzt mündliche Anweisungen direkt in Code um. Aktuell wird die Funktion für ca. 5 % der Nutzer ausgerollt; Details zu Sprachpartnern (etwa ElevenLabs) hat Anthropic noch nicht kommuniziert.

*Quelle: it-daily.net · 04. März 2026*

→ Tiefer einsteigen: [GitHub Copilot Agent & KI-Tools in VS Code für PowerShell nutzen](/artikel/ki-vscode-github-copilot-agent-powershell-nutzen/)

---

### dotInsights März 2026: .NET-Community-Highlights (EN)

JetBrains hat die März-Ausgabe des dotInsights-Newsletters veröffentlicht. Empfehlenswert: Nick Chapsas erklärt eine massive Verbesserung bei `async`/`await` in .NET, Leomaris Reyes zeigt Grid-Layout-Vereinfachungen in .NET MAUI, und Chris Woodruff stellt das Lease Pattern als Alternative zu klassischen Locks vor.

*Quelle: [blog.jetbrains.com (EN)](https://blog.jetbrains.com/dotnet/2026/03/04/dotinsights-march-2026/) · 04. März 2026*

---

## PowerShell & Automation

### [Microsoft priorisiert 2026 Sicherheit für PowerShell und Windows OpenSSH](https://borncity.com/news/microsoft-stellt-2026-die-sicherheit-von-powershell-in-den-vordergrund/)

Microsoft hat angekündigt, PowerShell und Windows OpenSSH 2026 primär unter dem Sicherheitsaspekt weiterzuentwickeln. Statt neuer Features stehen Patches und ein härteres Standardverhalten im Vordergrund. Für Administratoren bedeutet das: Skripte und Konfigurationen sollten auf Kompatibilität mit kommenden Sicherheitsverschärfungen geprüft werden.

*Quelle: borncity.com · 03. März 2026*

→ Tiefer einsteigen: [PowerShell sicher einsetzen](/artikel/powershell-sicher-einsetzen/)

---

### Win11Debloat: 40.000-Sterne-PowerShell-Skript gegen Windows-Bloatware (EN)

Das Open-Source-PowerShell-Skript Win11Debloat hat auf GitHub 40.000 Sterne gesammelt. Es entfernt automatisch Bloatware, Telemetrie und ungewollte KI-Funktionen aus Windows 11 — und ist damit eines der meistgenutzten Community-Skripte für Windows-Härtung.

*Quelle: [darkwebinformer.com (EN)](https://darkwebinformer.com/win11debloat-a-40k-star-powershell-script-for-stripping-bloatware-telemetry-and-ai-features-from-windows/) · 04. März 2026*

---

## IT-Security

### Topic-Cluster: Windows unter Beschuss — Zero-Day und Admin-Center-Lücke

Zwei kritische Windows-Schwachstellen dominieren die Sicherheitslage: Die MSHTML-Lücke CVE-2026-21513 wird seit dem 3. März aktiv ausgenutzt — Sicherheitsforscher haben detaillierte Exploit-Details veröffentlicht. Parallel wurde im Windows Admin Center CVE-2026-26119 (EUVD-2026-7587) gepatcht, eine Lücke, die Angreifern bei erfolgreicher Ausnutzung weitreichende Rechte gewährt hätte. Microsoft hält sich zu technischen Details bedeckt.

Quellen: [security-insider.de](https://www.security-insider.de/windows-admin-center-cve-2026-26119-sicherheitsluecke-gepatcht-a-89d7d0dae37f67495d4fc9fbf75c159b/) · [ad-hoc-news.de](https://www.ad-hoc-news.de/boerse/news/ueberblick/microsoft-zero-day-attacken-und-laengere-windows-sicherheitsgarantien/68634079)

→ Tiefer einsteigen: [Wie viel PowerShell steckt in der Sicherheit?](/artikel/sicherheit-wie-viel-powershell/)

---

### [GTFire: Angreifer missbrauchen Google Translate und Firebase als Phishing-Waffe](https://borncity.com/news/gtfire-google-dienste-werden-zur-phishing-waffe/)

Die Phishing-Kampagne GTFire nutzt legitime Google-Dienste — konkret Google Translate und Firebase — um Login-Daten aus über 1.000 Organisationen zu stehlen. Da die Angriffe über vertrauenswürdige Google-Domains laufen, versagen klassische URL- und Reputationsfilter. Sicherheitsanalysten empfehlen eine verstärkte Verhaltensanalyse statt rein domainbasierter Filterung.

*Quelle: borncity.com · 03. März 2026*

---

### [Exploit-Kit Coruna: Bis zu 23 iOS-Exploits gegen iPhone-Nutzer](https://www.golem.de/news/exploit-kit-coruna-massig-iphone-nutzer-mit-bis-zu-23-ios-exploits-attackiert-2603-206074.html)

Sicherheitsforscher von Google und iVerify warnen vor dem Exploit-Kit Coruna, das gezielt iPhones mit älteren iOS-Versionen angreift und dabei auf ein Arsenal von bis zu 23 verketteten Exploits zurückgreift. iOS-Nutzer sollten umgehend auf die aktuelle Version aktualisieren.

*Quelle: golem.de · 04. März 2026*

---

## Besonders relevant

| Thema | Relevanz |
| :---- | :------- |
| Anthropic/OpenAI Pentagon-Streit | Hoch – verschiebt KI-Marktanteile und setzt neue Maßstäbe für ethische KI-Nutzung |
| MSHTML Zero-Day CVE-2026-21513 | Hoch – aktiv ausgenutzt, sofortiger Patch erforderlich |
| Claude Code Sprachsteuerung | Mittel – neue Interaktionsform für KI-Coding-Assistenten |
| Microsoft PowerShell Sicherheitsfokus 2026 | Mittel – relevant für alle PowerShell-Administratoren und Skripter |
| GTFire Phishing via Google-Dienste | Mittel – neue Angriffsmethode umgeht klassische Filter |

---

*11 Artikel · Quellen: borncity.com, heise.de, handelsblatt.com, it-daily.net, all-ai.de, it-boltwise.de, security-insider.de, golem.de, blog.jetbrains.com, ad-hoc-news.de, darkwebinformer.com · Stand: 05.03.2026 09:00 (Europe/Berlin)*
