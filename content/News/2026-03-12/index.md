---
draft: false
date: 2026-03-12T00:00:00+01:00
title: "IT-News vom 12. März 2026"
description: "Microsoft schiebt Copilot Cowork, Agent 365 und E7 Richtung Enterprise-Rollout, der März-Patchday zieht Secure-Boot- und Office-Folgen nach sich, und GitHub Copilot bekommt spürbar mehr Agenten-Funktionen."
categories:
  - Divers
tags:
  - News
  - KI
  - Microsoft
  - Copilot
  - Security
  - PowerShell
  - SQL Server
  - GitHub
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

### Topic-Cluster: Microsoft macht aus Copilot einen steuerbaren Office-Agenten und verkauft Governance gleich mit

Microsoft verknüpft Copilot Cowork mit Anthropics Cowork-Prinzipien und ergänzt das Ganze mit Agent 365 sowie der neuen E7-Lizenz. Technisch spannend ist weniger die Marketing-Schicht als der Plattformwechsel: Copilot soll nicht mehr nur antworten, sondern Aufgaben mit Plan, Checkpoints und Governance im Microsoft-365-Kontext ausführen.

Community-Reaktion: In den sichtbaren Reaktionen aus Fachmedien und Foren dominieren drei Fragen zugleich: ob der E7-Preis realistisch ist, wie ernst Unternehmen die neue Governance-Schicht für Agenten nehmen müssen und ob Microsoft mit dem Anthropic-Baustein sinnvoll diversifiziert oder nur zusätzliche Komplexität einkauft.

Quellen: [The Decoder](https://the-decoder.de/microsoft-integriert-anthropics-claude-cowork-technologie-in-copilot-fuer-eigenstaendigere-bueroarbeit/) · [BornCity: Copilot Cowork](https://borncity.com/news/microsoft-copilot-cowork-ki-wird-zum-autonomen-kollegen/) · [BornCity: Microsoft 365 E7](https://borncity.com/news/microsoft-365-e7-ki-wird-zur-kernplattform-fuer-unternehmen/) · [VentureBeat (EN)](https://venturebeat.com/technology/microsoft-says-ungoverned-ai-agents-could-become-corporate-double-agents-its/) · [The Register (EN)](https://www.theregister.com/2026/03/09/microsoft_taps_claude_copilot_cowork/) · [TechRadar (EN)](https://www.techradar.com/pro/the-era-of-copilot-execution-is-here-microsofts-copilot-cowork-is-here-with-anthropic-ai-to-conquer-all-your-biggest-work-tasks) · [Reddit: sysadmin (EN)](https://www.reddit.com/r/sysadmin/comments/1rp1rzu/microsoft_announces_microsoft_365_e7_with_new/) · [Reddit: vibecoding (EN)](https://www.reddit.com/r/vibecoding/comments/1rp4fin/microsoft_just_launched_copilot_cowork/)

→ Tiefer einsteigen: [Agenten-Orchestrierung in der Praxis: Wenn KI den Code bis zum Release steuert](/artikel/orchestrierung-von-ki-agenten/)

---

## KI

### [Anthropic: KI-Assistent Claude stürzt nach Pentagon-Streit ab](https://borncity.com/news/anthropic-ki-assistent-claude-stuerzt-nach-pentagon-streit-ab/)

Der Ausfall zeigt, wie schnell politische Konflikte in operative Probleme umschlagen können. Anthropic meldet Authentifizierungs- und Lastprobleme nach stark gestiegenem Zulauf; für Teams, die Claude Code produktiv nutzen, ist das ein nüchterner Hinweis auf Plattformrisiko und Notfallpfade.

*Quelle: borncity.com · 12. Mär 2026*

→ Tiefer einsteigen: [KI-Agenten im Alltag: Ihr digitaler Mitarbeiter](/artikel/ki-agenten-guardrails-portabilitaet/)

---

## Tools & Dev

### Topic-Cluster: GitHub Copilot zieht Web, CLI und JetBrains näher an echte Agenten-Workflows

GitHub baut Copilot an drei Fronten aus: Reviews lassen sich direkt aus der CLI anfordern, JetBrains bekommt reifere Agenten-Funktionen inklusive MCP-Auto-Approve und AGENTS.md-Unterstützung, und im Web-Chat lässt sich die Repo-Struktur jetzt direkt mitsamt Referenzen durchsuchen. Zusammen ergibt das keinen einzelnen Knalleffekt, aber einen klaren Trend: Copilot wird weniger Chatfenster und mehr Arbeitsoberfläche.

Quellen: [GitHub CLI Review (EN)](https://github.blog/changelog/2026-03-11-request-copilot-code-review-from-github-cli/) · [JetBrains Agentic Improvements (EN)](https://github.blog/changelog/2026-03-11-major-agentic-capabilities-improvements-in-github-copilot-for-jetbrains-ides/) · [Repo Explore on the Web (EN)](https://github.blog/changelog/2026-03-11-explore-a-repository-using-copilot-on-the-web/)

→ Tiefer einsteigen: [GitHub Copilot Agent in VS Code: PowerShell schneller und sicherer entwickeln](/artikel/ki-vscode-github-copilot-agent-powershell-nutzen/)

---

## IT-Security

### Topic-Cluster: Der März-Patchday zieht Office-RCEs und Secure-Boot-Folgen bis in den Alltag

Nach den ersten Meldungen vom Vortag wird klarer, was operativ hängen bleibt: Office schließt mehrere RCE-Schwachstellen in Excel und Word, während Windows 10 und 11 zugleich den gestaffelten Secure-Boot-Zertifikatswechsel verbreitern. Für Admin-Teams wird daraus kein reiner Patch-Zyklus, sondern ein Rollout mit Reboot-, Firmware- und Vertrauensketten-Folgen.

Quellen: [heise online](https://www.heise.de/news/Microsoft-Patchday-Zwei-Zero-Days-und-insgesamt-83-neue-Luecken-gestopft-11206553.html) · [Borns IT- und Windows-Blog: Office-Updates](https://borncity.com/blog/2026/03/12/patchday-microsoft-office-updates-10-maerz-2026/) · [Borns IT- und Windows-Blog: Windows 10/11-Updates](https://borncity.com/blog/2026/03/11/patchday-windows-10-11-updates-10-maerz-2026/)

→ Tiefer einsteigen: [PowerShell Sicherheit: Execution Policy, Signierung, Hardening](/artikel/powershell-sicher-einsetzen/)

---

## PowerShell & Automation

### [Windows-Updates bringen neue PowerShell-Hilfen für den Secure-Boot-Rollout](https://borncity.com/blog/2026/03/11/patchday-windows-10-11-updates-10-maerz-2026/)

Mit `Get-SecureBootUEFI -Decoded` und dem neuen `Get-SecureBootSVN` liefert Microsoft genau die Art von Prüfwerkzeug nach, die im laufenden Zertifikatswechsel gefehlt hat. Für Automatisierungsteams ist das praktisch, weil sich der Reifegrad von UEFI- und Bootloader-Stand jetzt besser skriptbar prüfen lässt, statt nur auf einen allgemeinen Update-Status zu schauen.

*Quelle: borncity.com · 11. Mär 2026*

→ Tiefer einsteigen: [Neuerungen in PowerShell 7.5: Upgrade-Check für Teams](/artikel/neuerungen-powershell-75/)

---

## .NET

### [.NET- und .NET-Framework-Servicing-Updates für März 2026](https://devblogs.microsoft.com/dotnet/dotnet-and-dotnet-framework-march-2026-servicing-updates/)

Microsoft liefert für .NET 10.0.4, 9.0.14 und 8.0.25 gleich mehrere Security-Fixes aus, darunter drei Security-Feature-Bypass-Schwachstellen. Für Teams heißt das: Nicht nur Runtime und ASP.NET Core nachziehen, sondern auch Container-Images und Linux-Pakete in denselben Patch-Zyklus aufnehmen.

*Quelle: devblogs.microsoft.com (EN) · 10. Mär 2026*

→ Tiefer einsteigen: [Entity Framework Grundlagen für .NET-Projekte](/artikel/dotnet-entityframework-grundlagen/)

---

## T-SQL & SQL Server

### [KB5077466: Beschreibung des Sicherheitsupdates für SQL Server 2025 CU2: 10. März 2026](https://support.microsoft.com/de-de/topic/kb5077466-beschreibung-des-sicherheitsupdates-f%C3%BCr-sql-server-2025-cu2-10-m%C3%A4rz-2026-e09ecd69-b429-47e8-835c-3bcd107330e5)

SQL Server 2025 CU2 schließt nicht nur mehrere Rechteerweiterungs-Schwachstellen, sondern behebt auch konkrete Sicherheitsprobleme in internen Prozeduren, Mergereplikation und `ALTER USER`-Pfaden. Wer Windows- und Linux-Instanzen parallel betreibt, sollte das Update nicht als bloßes KB abhaken, sondern als sicherheitsrelevantes CU in den regulären Betriebsablauf übernehmen.

*Quelle: support.microsoft.com · 10. Mär 2026*

→ Tiefer einsteigen: [PowerShell und SQL Server automatisieren: robuste Workflows für den Betrieb](/artikel/powershell-tsql-automatisierung/)

---

## Besonders relevant

| Thema | Relevanz |
| :--- | :--- |
| Copilot Cowork, Agent 365 und Microsoft 365 E7 | Hoch -- Microsoft verschiebt KI vom Assistenzmodus in kontrollierte Workflow-Automation |
| März-Patchday mit Office- und Secure-Boot-Folgen | Hoch -- Relevanz für Windows-, Office- und Sicherheitsbetrieb gleichzeitig |
| GitHub Copilot als Agenten-Plattform | Mittel -- Praktisch wichtig für Teams, die IDE, Web und CLI konsistent nutzen wollen |
| SQL Server 2025 CU2 und .NET-Servicing | Mittel -- Klare Pflicht für alle, die Microsoft-Stack produktiv patchen müssen |

---

*7 Artikel · Quellen: the-decoder.de, borncity.com, venturebeat.com, theregister.com, techradar.com, heise.de, github.blog, devblogs.microsoft.com, support.microsoft.com · Stand: 12.03.2026 09:34 (Europe/Berlin)*
