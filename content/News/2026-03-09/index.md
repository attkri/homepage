---
draft: false
date: 2026-03-09T00:00:00+01:00
title: "IT-News vom 09. März 2026"
description: "Microsoft und OpenAI geraten durch Sicherheits-, Haftungs- und Militärfragen weiter unter Druck, KI-Agenten rücken in Unternehmen zur Infrastruktur auf, und neue Schutzmechanismen landen in Teams und selbst gehosteten Plattformen."
categories:
  - Divers
tags:
  - News
  - KI
  - Security
  - Microsoft
  - OpenAI
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

### Topic-Cluster: OpenAI, Anthropic und Microsoft geraten in einen offenen Governance-Stresstest

Die Pentagon-Affäre wächst sich weiter zu einem Grundsatzkonflikt über Macht, Ethik und Lieferketten in der KI-Branche aus. Während OpenAI nach dem umstrittenen Militärdeal bereits den Abgang seiner Robotik-Chefin verkraften muss, stellen Microsoft und OpenAI zugleich ihre Partnerschaft öffentlich gegen rechtliche und ethische Risiken. Parallel beruhigen Amazon, Google und Microsoft ihre Kunden, dass Anthropic für zivile Projekte weiter verfügbar bleibt -- trotz Pentagon-Einstufung als Lieferkettenrisiko.

Community-Reaktion: In der Debatte verschiebt sich der Fokus spürbar weg von Modell-Rankings hin zu Governance-Fragen. Diskutiert wird weniger, welches Modell gerade vorne liegt, sondern welcher Anbieter unter politischem, juristischem und moralischem Druck noch verlässlich planbar bleibt.

Quellen: [heise online](https://www.heise.de/news/OpenAI-verliert-Robotik-Chefin-nach-umstrittenem-Pentagon-Deal-11203174.html) · [BornCity](https://borncity.com/news/microsoft-und-openai-partnerschaft-unter-druck/) · [heise online](https://www.heise.de/news/Amazon-Google-und-Microsoft-staerken-Anthropic-den-Ruecken-11203033.html)

-> Tiefer einsteigen: [KI-Agenten im Alltag: Ihr digitaler Mitarbeiter](/artikel/ki-agenten-guardrails-portabilitaet/)

---

## KI

### [KI-Agenten werden zur kritischen Unternehmensinfrastruktur](https://borncity.com/news/ki-agenten-werden-zur-kritischen-unternehmensinfrastruktur/)

Innerhalb weniger Tage ist aus dem Thema „KI-Agenten“ ein Infrastrukturthema geworden. BornCity bündelt die Signale sauber: GPT-5.4, Claude Opus 4.6, neue Orchestrierungsframeworks und der Druck auf Unternehmen, autonome Systeme nicht mehr als Spielerei, sondern als dauerhaften Betriebsbaustein zu behandeln. Entscheidend wird damit nicht nur Intelligenz, sondern vor allem Ausdauer, Governance und sichere Einbettung in reale Prozesse.

*Quelle: borncity.com · 08. Mär 2026*

-> Tiefer einsteigen: [Agenten-Orchestrierung in der Praxis: Wenn KI den Code bis zum Release steuert](/artikel/orchestrierung-von-ki-agenten/)

---

### [Microsoft und OpenAI: Partnerschaft unter Druck](https://borncity.com/news/microsoft-und-openai-partnerschaft-unter-druck/)

Die Partnerschaft zwischen Microsoft und OpenAI bleibt zwar finanziell stabil, steht aber operativ und juristisch stärker unter Beobachtung. Im Fokus stehen eine neue Produkthaftungsklage rund um psychische Schäden durch GPT-4o, die Rolle von Azure als Lieferweg für sensible Einsätze und die Frage, wie belastbar gemeinsame Sicherheitsleitplanken in Hochrisiko-Szenarien wirklich sind.

*Quelle: borncity.com · 08. Mär 2026*

---

## Tools & Dev

### [Release v1.0 of the official MCP C# SDK](https://devblogs.microsoft.com/dotnet/release-v10-of-the-official-mcp-csharp-sdk/)

Das MCP C# SDK bleibt auch heute eines der wichtigsten technischen Themen für Teams, die Agenten nicht lose anbinden, sondern kontrolliert in Anwendungen integrieren wollen. Die Version 1.0 bringt stabilere Autorisierung, reichhaltigere Metadaten und belastbare Muster für Tool-Calling und lang laufende Anfragen. Für .NET-Projekte wird damit aus Experiment ein tragfähiger Unterbau.

*Quelle: devblogs.microsoft.com · 05. Mär 2026*

-> Tiefer einsteigen: [MCP und SQL Server: KI-Abfragen kontrolliert und sicher einsetzen](/artikel/ki-mcp-sql-server-db-abfrage/)

---

### [Microsoft Teams bekommt Bot-Erkennung](https://www.heise.de/news/Microsoft-Teams-bekommt-Bot-Erkennung-11203470.html)

Microsoft markiert künftig externe Drittanbieter-Bots deutlicher, wenn sie in der Lobby eines Teams-Meetings warten. Organisatoren müssen diese Bots dann ausdrücklich zulassen. Das klingt klein, ist aber ein wichtiger Governance-Schritt: Wenn Agenten und Bots immer tiefer in Meetings und Arbeitsabläufe eindringen, muss Sichtbarkeit vor Bequemlichkeit kommen.

*Quelle: heise.de · 09. Mär 2026*

-> Tiefer einsteigen: [GitHub Copilot Agent in VS Code: PowerShell schneller und sicherer entwickeln](/artikel/ki-vscode-github-copilot-agent-powershell-nutzen/)

---

## IT-Security

### [Microsoft und Google im Visier von Cyberangriffen](https://borncity.com/news/microsoft-und-google-im-visier-von-cyberangriffen/)

Ein neuer Bericht der Google Threat Intelligence Group zeigt, wie stark sich Zero-Day-Angriffe inzwischen auf Unternehmenssoftware und Perimeter-Systeme verlagern. Microsoft lag 2025 mit 25 aktiv ausgenutzten Zero-Days vorne, Google folgt mit 11. Parallel laufen Notfall-Updates für Chrome, Android und Windows-nahe Komponenten. Die Botschaft ist klar: Die Angriffsfläche sitzt heute tiefer im Unternehmensstack als viele Patch-Pläne abbilden.

*Quelle: borncity.com · 09. Mär 2026*

-> Tiefer einsteigen: [Wie viel PowerShell braucht moderne IT-Sicherheit?](/artikel/sicherheit-wie-viel-powershell/)

---

### [Nextcloud: Codeschmuggel durch Lücke in Flow möglich](https://www.heise.de/news/Nextcloud-Codeschmuggel-durch-Luecke-in-Flow-moeglich-11203404.html)

In Nextcloud Flow wurde eine gravierende Sicherheitslücke publik, über die nicht authentifizierte Angreifer eine Instanz kompromittieren können. Betroffen ist das Windmill-Framework im Hintergrund; die Lücke kann bis zur Ausführung von Schadcode als root im Container führen. Wer Nextcloud Flow produktiv einsetzt, sollte spätestens jetzt auf Version 1.3.0 aktualisieren oder die Flow-Komponente deaktivieren.

*Quelle: heise.de · 09. Mär 2026*

---

## .NET

### [Release v1.0 of the official MCP C# SDK](https://devblogs.microsoft.com/dotnet/release-v10-of-the-official-mcp-csharp-sdk/)

Das MCP C# SDK ist auch aus .NET-Sicht die relevanteste Meldung im aktuellen Zeitfenster. Mit Version 1.0 stehen für C#-Teams belastbare Patterns für Autorisierung, Tool-Aufrufe und lang laufende Agentenprozesse bereit. Wer KI-Funktionen in bestehende Anwendungen einbauen will, bekommt damit endlich eine stabilere technische Basis statt nur Vorschau-Charakter.

*Quelle: devblogs.microsoft.com · 05. Mär 2026*

-> Tiefer einsteigen: [Entity Framework Grundlagen verständlich erklärt](/artikel/dotnet-entityframework-grundlagen/)

---

## T-SQL & SQL Server

### [MCP C# SDK v1.0 stärkt kontrollierte SQL- und Daten-Workflows](https://devblogs.microsoft.com/dotnet/release-v10-of-the-official-mcp-csharp-sdk/)

Für SQL-nahe Automatisierung ist das MCP-Release ebenfalls relevant, weil kontrollierte Tool- und Datenzugriffe damit robuster aus .NET-Anwendungen heraus modelliert werden können. Gerade dort, wo Agenten nicht frei formulierte SQLs feuern sollen, sondern über definierte Werkzeuge laufen müssen, wird das SDK praktisch interessant.

*Quelle: devblogs.microsoft.com · 05. Mär 2026*

-> Tiefer einsteigen: [PowerShell und SQL Server automatisieren: robuste Workflows für den Betrieb](/artikel/powershell-tsql-automatisierung/)

---

## PowerShell & Automation

### [PowerShell 7.5.4 enthält ein .NET SDK mit gemeldeter High-Schwachstelle](https://github.com/powershell/powershell/issues/26943)

Das offene GitHub-Issue zur PowerShell 7.5.4 bleibt relevant, weil viele Teams die Version bereits produktiv einsetzen. Diskutiert wird, dass das enthaltene .NET SDK 9.0.306 von CVE-2026-21218 betroffen ist. Solange kein Fix nachgezogen wurde, gehört das Thema in jedes saubere Upgrade- und Risiko-Tracking.

*Quelle: github.com/PowerShell (EN) · 06. Mär 2026*

-> Tiefer einsteigen: [Neuerungen in PowerShell 7.5: Upgrade-Check für Teams](/artikel/neuerungen-powershell-75/)

---

## Besonders relevant

| Thema | Relevanz |
| :--- | :--- |
| OpenAI, Microsoft und Anthropic im Governance-Stresstest | Hoch -- Das Thema verschiebt sich von Modellleistung zu Verlässlichkeit, Ethik und Plattformrisiko |
| KI-Agenten als Unternehmensinfrastruktur | Hoch -- Direkt relevant für Strategie, Betriebsmodell und Sicherheitsarchitektur |
| Microsoft und Google im Visier von Zero-Day-Angriffen | Hoch -- Konkrete Auswirkungen auf Patch-Management und Priorisierung in Unternehmensumgebungen |
| Teams-Bot-Erkennung | Mittel -- Kleines Feature mit großer Governance-Wirkung in kollaborativen Umgebungen |

---

*9 Artikel · Quellen: heise.de, borncity.com, devblogs.microsoft.com, github.com · Stand: 09.03.2026 11:05 (Europe/Berlin)*
