---
draft: false
date: 2026-02-27T00:00:00+01:00
title: "Glossar: IT-Fachbegriffe & Slang"
description: "Kompaktes Nachschlagewerk mit Erklärungen zu Fachbegriffen aus KI, MCP, PowerShell und IT."
comments: false
HideTags: true
showToc: true
TocOpen: true
searchHidden: false
hidemeta: true
disableShare: true
---

Erklärungen zu Fachbegriffen, Abkürzungen und Slang rund um KI, MCP, PowerShell und IT.
Verlinkungen aus Artikeln führen direkt zum jeweiligen Begriff.

[A](#a) · B · [C](#c) · [D](#d) · [E](#e) · F · [G](#g) · [H](#h) · [I](#i) · [J](#j) · [K](#k) · [L](#l) · [M](#m) · [N](#n) · [O](#o) · [P](#p) · Q · [R](#r) · [S](#s) · [T](#t) · U · V · [W](#w) · X · Y · Z

## A

### Active Directory (AD)

**Bereich:** IT

Verzeichnisdienst von Microsoft zur Verwaltung von Nutzern, Computern und Gruppenrichtlinien in Unternehmensnetzwerken. Zentrale Komponente für Authentifizierung, Rechtevergabe und Richtlinienverteilung in Windows-Umgebungen (→ [GPO](#gpo-group-policy-object)).

---

### Agent Mode

**Bereich:** KI

Betriebsmodus eines KI-Assistenten, in dem er eigenständig Tools aufruft, Dateien liest und schreibt, Tests ausführt und mehrere Schritte plant – z. B. in VS Code mit GitHub Copilot (→ [Agentisches Coding](#agentisches-coding)).

---

### Agentisches Coding

**Bereich:** KI

KI-gestütztes Arbeiten, bei dem das Modell eigenständig mehrere Schritte plant und ausführt, um komplexe Aufgaben zu lösen – z. B. Code schreiben, testen und korrigieren ohne manuellen Eingriff.

---

### API

**Bereich:** IT

Programmierschnittstelle, über die Software kontrolliert mit anderen Diensten spricht – ohne die interne Implementierung kennen zu müssen.

---

### Attention / Transformer

**Bereich:** KI

Mechanismus und Architektur hinter modernen Sprachmodellen. Attention gewichtet, welche Teile des Kontexts für die aktuelle Vorhersage relevant sind. Transformer ist die Netzwerkarchitektur, die Attention als zentrales Bauelement nutzt.

---

### Audit-Trail

**Bereich:** IT

Lückenlose, chronologisch geordnete Protokollierung von Zugriffen, Aktionen und Änderungen in einem System – unerlässlich für Compliance, Forensik und Nachvollziehbarkeit.

---

### Ausführungsplan (Execution Plan)

**Bereich:** T-SQL

Vom SQL-Server generierter Plan, der beschreibt, wie eine Abfrage intern ausgeführt wird – welche Indizes genutzt, welche Join-Strategien gewählt und wie die Kosten geschätzt werden. Zentrales Werkzeug für Performance-Tuning (→ [Index](#index-datenbankindex)).

---

## C

### Capabilities (MCP)

**Bereich:** MCP

Vom Server angebotene Fähigkeiten, die ein Client nutzen kann – zum Beispiel Tools (ausführbare Aktionen), Resources (lesbare Daten) oder Prompts (vordefinierte Anweisungen).

---

### CD (Continuous Deployment)

**Bereich:** IT

Automatisierte Bereitstellung von Softwareänderungen direkt in die Produktionsumgebung – ohne manuellen Release-Schritt. KI-Tools können bei der Automatisierung von Tests, Code-Reviews und Rollouts unterstützen (→ [CI](#ci-continuous-integration)).

---

### CI (Continuous Integration)

**Bereich:** IT

Praxis, Codeänderungen regelmäßig in ein gemeinsames Repository zu integrieren und automatisch zu testen. KI-Tools können bei Code-Analyse, Fehlererkennung und Testgenerierung helfen (→ [CD](#cd-continuous-deployment)).

---

### Cmdlet

**Bereich:** PowerShell

Der grundlegende Befehlstyp in PowerShell, benannt nach dem Schema Verb-Nomen (z. B. `Get-Process`, `Set-Item`). Cmdlets geben .NET-Objekte zurück und sind die Bausteine aller PowerShell-Skripte und Pipelines (→ [Pipeline](#pipeline)).

---

### Code Review

**Bereich:** IT

Systematische Prüfung von Quellcode durch Kollegen oder Tools, bevor Änderungen in die Codebasis übernommen werden. Ziel ist die Qualitätssicherung, Fehlerfrüherkennung und Wissensverteilung im Team.

---

### Compliance

**Bereich:** KI

Einhaltung von rechtlichen, ethischen und unternehmensinternen Richtlinien bei der Nutzung von KI-Tools – z. B. Datenschutz, Urheberrecht, interne Freigabeprozesse.

---

### Confidence

**Bereich:** KI

Wie sicher oder überzeugend eine Antwort wirkt – das ist kein Wahrheitsbeweis. Ein Modell kann hochkonfident falsch liegen (→ [Halluzination](#halluzination)).

---

### Constrained Language Mode

**Bereich:** PowerShell

Sicherheitsmodus in PowerShell, der die verfügbaren .NET-Typen, COM-Objekte und Sprachkonstrukte stark einschränkt. Wird in sicherheitskritischen Umgebungen eingesetzt, um Angriffsflächen zu minimieren (→ [JEA](#jea-just-enough-administration)).

---

### Context Window

**Bereich:** KI

Wie viel Text die KI während einer Antwort gleichzeitig berücksichtigen kann – vergleichbar mit dem Kurzzeitgedächtnis eines Menschen. Alles außerhalb des Fensters ist für das Modell unsichtbar (→ [Kontextlänge](#kontextlänge)).

---

### Cutoff

**Bereich:** KI

Wissensstichtag: der Zeitpunkt, bis zu dem Trainingsdaten ins Basismodell eingeflossen sind. Ereignisse nach diesem Datum sind dem Modell unbekannt – außer sie werden über den Kontext mitgeliefert.

---

## D

### DbContext

**Bereich:** dotNET

Zentrale Klasse in Entity Framework Core, die den Datenbankzugriff kapselt. Sie repräsentiert eine Sitzung mit der Datenbank und koordiniert Abfragen, Änderungen und Transaktionen (→ [ORM](#orm-object-relational-mapper)).

---

### Debugging

**Bereich:** IT

Systematisches Suchen und Beheben von Fehlern in Code – in VS Code z. B. mit Breakpoints, Schritt-für-Schritt-Ausführung und der Anzeige von Variablenwerten zur Laufzeit.

---

### Drift

**Bereich:** KI

Schleichende Verschlechterung von Modellverhalten oder Datenpassung über die Zeit – zum Beispiel weil sich die Realwelt verändert, das Modell aber nicht nachtrainiert wird.

---

## E

### Embedding

**Bereich:** KI

Numerische Vektordarstellung von Tokens, damit das Modell mit Text rechnen kann. Ähnliche Begriffe liegen im Vektorraum nah beieinander.

---

### Execution Policy

**Bereich:** PowerShell

Sicherheitsmechanismus, der kontrolliert, welche PowerShell-Skripte ausgeführt werden dürfen (`Restricted`, `RemoteSigned`, `Unrestricted` usw.). Kein vollständiger Schutz vor bösartigem Code, aber eine erste wichtige Sicherheitsebene.

---

## G

### GitHub Copilot

**Bereich:** KI

KI-gestützter Code-Assistent von GitHub (Microsoft/OpenAI), integriert in VS Code und andere IDEs. Bietet Codevervollständigung, Erklärungen, Chat und – im Agent Mode – eigenständige Multi-Schritt-Aufgaben (→ [Agent Mode](#agent-mode)).

---

### GPO (Group Policy Object)

**Bereich:** IT

Richtlinienobjekte in Windows-Domänen, über die Einstellungen für Benutzer und Computer zentral verteilt werden – z. B. Sicherheitseinstellungen, Softwareverteilung oder PowerShell-Ausführungsrichtlinien (→ [Active Directory](#active-directory-ad)).

---

## H

### Halluzination

**Bereich:** KI

Die KI erfindet Details – Fakten, Quellen, Zitate –, obwohl die Antwort überzeugend klingt. Der wichtigste Grund, Ausgaben kritisch zu prüfen (→ [Confidence](#confidence)).

---

## I

### Index (Datenbankindex)

**Bereich:** T-SQL

Datenstruktur, die den schnellen Zugriff auf Tabellenzeilen ermöglicht, ohne alle Zeilen scannen zu müssen. Ein fehlender oder falscher Index ist häufig die Ursache langsamer SQL-Abfragen (→ [Ausführungsplan](#ausführungsplan-execution-plan)).

---

### IntelliSense

**Bereich:** IT

Code-Vervollständigung und kontextsensitive Hilfe in Editoren wie VS Code – zeigt verfügbare Methoden, Parameter und Typinformationen direkt beim Schreiben an.

---

### ISO 27001

**Bereich:** IT

Internationale Norm für Informationssicherheits-Managementsysteme (ISMS). Definiert Anforderungen an Richtlinien, Prozesse und Kontrollen, um Informationssicherheit systematisch zu managen und nachzuweisen.

---

## J

### JEA (Just Enough Administration)

**Bereich:** PowerShell

PowerShell-Sicherheitskonzept, das Benutzern nur genau die Berechtigungen gibt, die sie für eine bestimmte Aufgabe benötigen – keine dauerhaften Adminrechte, sondern begrenzte, protokollierte Sitzungen (→ [Constrained Language Mode](#constrained-language-mode)).

---

### Jailbreak

**Bereich:** KI

Prompt-Technik, mit der Sicherheitsregeln eines Modells ausgehebelt werden sollen – etwa durch Rollenspiele, verschlüsselte Anweisungen oder indirekte Umgehungsstrategien (→ [Prompt-Injection](#prompt-injection)).

---

## K

### KI (Künstliche Intelligenz)

**Bereich:** KI

Sammelbegriff für Technologien, die menschenähnliche Aufgaben ausführen – kein Zauberstab, sondern ein Werkzeug mit Stärken und Schwächen.

---

### Kontextlänge

**Bereich:** KI

Die maximale Anzahl von [Token](#token), die ein Modell in einem Durchlauf verarbeiten kann. Je größer die Kontextlänge, desto mehr Vorgeschichte, Dokumente oder Code kann gleichzeitig einbezogen werden (→ [Context Window](#context-window)).

---

## L

### LINQ (Language Integrated Query)

**Bereich:** dotNET

Abfragesprache, die direkt in C# (und andere .NET-Sprachen) integriert ist – ermöglicht es, Collections, Datenbanken oder XML-Daten mit einheitlicher Syntax zu filtern, sortieren und transformieren (→ [ORM](#orm-object-relational-mapper)).

---

### Living off the Land

**Bereich:** PowerShell

Angriffstechnik, bei der Angreifer ausschließlich auf bereits vorhandene Systemwerkzeuge setzen – z. B. PowerShell, WMI oder `certutil` – um Sicherheitslösungen zu umgehen, die externe Malware erkennen würden.

---

### LLM (Large Language Model)

**Bereich:** KI

Ein großes Sprachmodell, das auf Basis von Milliarden Textbeispielen trainiert wurde, um das nächste Token vorherzusagen – und dadurch zusammenhängenden Text erzeugt.

---

### Logits

**Bereich:** KI

Rohwerte, die ein Modell für jeden möglichen nächsten Token ausgibt – noch vor der Umrechnung in Wahrscheinlichkeiten (→ [Softmax](#softmax)).

---

### LTS (Long Term Support)

**Bereich:** IT

Versionsstrategie, bei der bestimmte Releases über mehrere Jahre mit Sicherheits- und Bugfixes gepflegt werden. PowerShell 7.4 ist eine LTS-Version – besonders relevant für Unternehmensumgebungen.

---

## M

### MCP (Model Context Protocol)

**Bereich:** MCP

Offener Standard, damit KI-Modelle kontrolliert mit externen Tools und Diensten sprechen können – Dateien, Datenbanken, APIs. Definiert Client, Server, [Capabilities](#capabilities-mcp) und [Resources](#resource-mcp).

---

### Moderation / Guardrails

**Bereich:** KI

Filter und Regeln, die riskante Eingaben oder Ausgaben begrenzen – auf Ebene des Modells, der API oder der Anwendungsschicht.

---

### Monitoring

**Bereich:** KI

Laufende Überwachung von Qualität, Sicherheit, Kosten und Stabilität eines KI-Systems im Betrieb.

---

### Multimodal

**Bereich:** KI

Fähigkeit eines Modells, verschiedene Arten von Eingaben zu verstehen und zu verarbeiten – z. B. Text, Code, Bilder oder Dokumente in einem einzigen Modell.

---

## N

### Next-Token-Prediction

**Bereich:** KI

Das zentrale Lernziel von Sprachmodellen: Aus dem bisherigen Kontext das wahrscheinlichste nächste Token vorhersagen. Alles andere – Zusammenfassen, Übersetzen, Coden – ist ein Nebenprodukt dieses einen Ziels.

---

### NuGet

**Bereich:** dotNET

Paketmanager für das .NET-Ökosystem – ermöglicht das Einbinden von Bibliotheken und Frameworks (z. B. Entity Framework Core) direkt in Projekte über `dotnet add package`.

---

## O

### ORM (Object-Relational Mapper)

**Bereich:** dotNET

Abstraktionsschicht zwischen Objektmodell und relationaler Datenbank. Anstatt SQL von Hand zu schreiben, arbeitet man mit Klassen und LINQ-Abfragen – der ORM übernimmt die Übersetzung (→ [LINQ](#linq-language-integrated-query)).

---

## P

### Pester

**Bereich:** PowerShell

Das Standard-Testframework für PowerShell. Ermöglicht Unit-, Integrations- und Akzeptanztests für Skripte und Module – integrierbar in CI/CD-Pipelines.

---

### Pipeline

**Bereich:** PowerShell

Verkettung von Befehlen mit dem `|`-Operator. Objekte (keine reinen Texte) fließen dabei von einem Cmdlet zum nächsten, ohne Zwischendateien.

```powershell
Get-Process | Where-Object CPU -gt 10 | Sort-Object CPU -Descending
```

---

### Policy

**Bereich:** KI

Regelwerk, das festlegt, welche Inhalte und Aktionen erlaubt, eingeschränkt oder verboten sind – auf Modell-, Plattform- oder Unternehmensebene.

---

### Polyglotte Modelle

**Bereich:** KI

Modelle, die mehrere Programmiersprachen oder natürliche Sprachen verstehen und verarbeiten können – ohne separate Modelle für jede Sprache.

---

### PowerShell Gallery

**Bereich:** PowerShell

Das offizielle Online-Repository für PowerShell-Module und -Skripte – vergleichbar mit NuGet für .NET. Module werden per `Install-Module` heruntergeladen und installiert.

---

### Prompt

**Bereich:** KI

Die Eingabe oder Anweisung an die KI: eine Frage, ein Auftrag, Beispiele, Formatvorgaben oder eine Kombination davon. Die Qualität des Prompts bestimmt maßgeblich die Qualität der Antwort.

---

### Prompt Engineering

**Bereich:** KI

Gezieltes Formulieren und Strukturieren von Eingaben an ein KI-Modell, um bessere, zuverlässigere Ausgaben zu erhalten – z. B. durch klare Rollenvorgaben, Beispiele (Few-Shot) oder Chain-of-Thought-Anweisungen (→ [Prompt](#prompt)).

---

### Prompt-Injection

**Bereich:** KI

Manipulationsversuch über externe Inhalte (z. B. Webseitentext, E-Mails, Dateiinhalte), um Regeln oder Tool-Zugriffe des Modells zu umgehen (→ [Jailbreak](#jailbreak)).

---

## R

### Red-Teaming

**Bereich:** KI

Gezielte Sicherheitstests, bei denen Angriffs- und Missbrauchsszenarien systematisch durchgespielt werden, um Schwachstellen in einem KI-System zu finden.

---

### Resource (MCP)

**Bereich:** MCP

Strukturierte Datenquelle, die ein MCP-Client lesen kann – zum Beispiel Dateien, Datenbankeinträge oder API-Antworten (→ [MCP](#mcp-model-context-protocol)).

---

### RLAIF

**Bereich:** KI

*Reinforcement Learning from AI Feedback* – Nachtraining, bei dem ein anderes KI-Modell Bewertungen liefert, anstatt menschliche Bewerter einzusetzen (→ [RLHF](#rlhf)).

---

### RLHF

**Bereich:** KI

*Reinforcement Learning from Human Feedback* – Nachtraining, bei dem menschliche Bewerter Antworten bewerten und das Modell daraus lernt, hilfreicher und sicherer zu werden.

---

## S

### Sampling

**Bereich:** KI

Verfahren zur Auswahl des nächsten Tokens aus mehreren möglichen Kandidaten – beeinflusst durch [Temperatur](#temperatur), [Top-k / Top-p](#top-k--top-p) und andere Parameter.

---

### ScriptBlock Logging

**Bereich:** PowerShell

Windows-Sicherheitsfunktion, die den Inhalt ausgeführter PowerShell-Skripte protokolliert – auch obfuskierten Code, der erst zur Laufzeit entschlüsselt wird. Zentrales Werkzeug für forensische Analysen und SIEM-Integration (→ [SIEM](#siem-security-information-and-event-management)).

---

### Self-Attention

**Bereich:** KI

Spezialform der [Attention](#attention--transformer) innerhalb eines Textes: Jedes Token bewertet seine Relevanz gegenüber allen anderen Tokens im selben Kontext.

---

### SIEM (Security Information and Event Management)

**Bereich:** IT

Plattform zur zentralen Sammlung, Korrelation und Analyse von Sicherheitsereignissen aus verschiedenen Quellen – Logs, Netzwerkdaten, Endpunkte. Grundlage für Bedrohungserkennung und Incident Response in Unternehmen.

---

### Skript-Block

**Bereich:** PowerShell

Eine wiederverwendbare Code-Einheit in PowerShell (`{ ... }`). Kann als Parameter übergeben, mit `&` aufgerufen oder als Event-Handler registriert werden.

```powershell
$greet = { param($name) "Hallo, $name!" }
& $greet "Welt"
```

---

### Softmax

**Bereich:** KI

Mathematische Funktion, die aus den rohen [Logits](#logits) eines Modells Wahrscheinlichkeiten macht – alle Werte liegen zwischen 0 und 1, ihre Summe ergibt 1.

---

### Stored Procedure

**Bereich:** T-SQL

Vorgespeicherter und benannter SQL-Code in der Datenbank, der als Einheit aufgerufen wird. Verbessert die Performance durch Ausführungsplan-Caching und erhöht die Sicherheit durch kontrollierten Datenzugriff.

---

## T

### Temperatur

**Bereich:** KI

Regler für das Antwortverhalten: Niedrig (→ 0) = fokussiert und vorhersehbar, hoch (→ 2) = variabel und kreativ. Beeinflusst direkt das [Sampling](#sampling).

---

### Token

**Bereich:** KI

Die kleinste Verarbeitungseinheit eines Sprachmodells – oft Teile von Wörtern, Zahlen oder Zeichen; grob 1 Token ≈ ¾ Wort. Kosten und Limits werden in der Regel pro Million Token angegeben (→ [Kontextlänge](#kontextlänge)).

---

### Top-k / Top-p

**Bereich:** KI

Zwei [Sampling](#sampling)-Methoden: *Top-k* begrenzt die Auswahl auf die k wahrscheinlichsten Tokens, *Top-p* wählt aus den Tokens, deren kumulierte Wahrscheinlichkeit p nicht überschreitet.

---

## W

### Web3

**Bereich:** IT

Sammelbegriff für Technologien und Konzepte rund um Dezentralisierung, Blockchain und tokenbasierte Ökonomien. KI-Tools mit Web3-Fokus bieten oft Funktionen wie Token-Staking, dezentrale Identität oder Integration in Web3-Ökosysteme.

---

### WSL (Windows Subsystem for Linux)

**Bereich:** IT

Kompatibilitätsschicht in Windows, die das Ausführen einer Linux-Umgebung direkt unter Windows ermöglicht – ohne virtuelle Maschine. Nützlich für Entwickler, die Windows- und Linux-Tools parallel nutzen wollen.

---
