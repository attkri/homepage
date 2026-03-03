---
draft: false
date: 2026-03-03T20:37:00+01:00
title: "Agent-as-a-Judge: Der Kritiker-Agent im KI-Workflow"
description: "Erfahre, wie ein Kritiker-Agent (Agent-as-a-Judge) die Qualität in KI-Workflows sichert. 3 konkrete Strategien für fehlerfreie Automatisierung."
categories:
  - Divers
tags:
  - KI
  - Agenten
  - Qualitätssicherung
  - OpenCode
author: "Attila Krick"
canonical: "/artikel/kritiker-agent-ki-workflows/"
cover:
  image: cover.webp
  alt: "Ein strenger, aber konstruktiver Prüfer in einer digitalen KI-Umgebung"
  caption: "Der Kritiker-Agent als Qualitäts-Gate"
  relative: false
showToc: true
TocOpen: false
comments: true
ShowReadingTime: true
ShowBreadCrumbs: true
ShowPostNavLinks: true
ShowShareButtons: true
ShowCodeCopyButtons: true
disableHLJS: true
---

**Stand: 2026**

Künstliche Intelligenz generiert Code, schreibt Texte und automatisiert Prozesse. Doch wer kontrolliert die KI? Der Trend entwickelt sich rasant vom simplen „LLM-as-a-Judge“ hin zu dedizierten Kritiker-Agenten. Als IT-Experte und Berater für Automatisierung zeige ich Entwicklern und IT-Teams in diesem Artikel, wie Sie mit dem Konzept „Agent-as-a-Judge“ verlässliche Qualitäts-Gates in Ihren KI-Workflows etablieren und warum eine automatisierte Kontrolle unerlässlich ist.

## Was ist ein Kritiker-Agent?

Ein Kritiker-Agent ist ein autonomes KI-System, das tief in den Workflow integriert ist und die Ergebnisse anderer Agenten anhand definierter Projektrichtlinien prüft, bewertet und bei Fehlern eigenständig zurückweist. Während ein herkömmliches LLM-as-a-Judge-Modell oft nur eine nachträgliche Bewertung (zum Beispiel eine Schulnote für einen Text) abgibt, besitzt ein Kritiker-Agent eigene Werkzeuge und die Befugnis, den Ersteller-Agenten zur Korrektur aufzufordern.

Dieser Ansatz verwandelt eine fehleranfällige Einbahnstraße in einen iterativen, sich selbst korrigierenden Prozess.

## Wie funktionieren Qualitäts-Gates in der Praxis?

Um die Qualität meiner Inhalte und Skripte sicherzustellen, setze ich in meiner OpenCode-Umgebung auf ein mehrstufiges System aus spezialisierten Prüfern. Drei konkrete Agenten übernehmen dabei die Rolle des „Judges“:

### 1. Der @Code-Critic für fehlerfreie Skripte

Wenn ein Entwickler-Agent ein neues PowerShell-Skript oder eine T-SQL-Abfrage schreibt, tritt der `@Code-Critic` auf den Plan. Er sucht gezielt nach Logikfehlern, Sicherheitslücken und Architekturbrüchen. Erst wenn er sein „Go“ gibt, wird der Code in das Projekt übernommen. Das verhindert, dass ungetesteter Code in die Produktion gelangt.

### 2. Der @Kritiker für inhaltliche Präzision

Bei der Erstellung von Konzepten oder Architekturentscheidungen prüft der `@Kritiker`, ob alle Randbedingungen bedacht wurden. Er hinterfragt Annahmen und erzwingt eine saubere Argumentation. Ein hervorragendes Beispiel ist das Memory-System (`Memory.Instruction.md`): Bevor eine neue Architekturentscheidung dauerhaft im Projektgedächtnis verankert wird, validiert der Kritiker-Agent die Begründung und die Konsequenzen. Fehlt eine logische Herleitung, wird der Eintrag abgelehnt.

### 3. Der @Critic für redaktionelle Standards

Jeder Fachartikel auf dieser Website durchläuft eine strenge Live-Überprüfung durch den `@Critic`-Agenten. Er prüft beispielsweise, ob das strikte Cookie-Verbot eingehalten wird, ob Umlaute korrekt im UTF-8-Format vorliegen und ob die Vorgaben zur KI-Auffindbarkeit (Entitäts-Klarheit, Zitierbarkeit) erfüllt sind. Selbst die Entstehung dieses Artikels wurde live von ihm überwacht und freigegeben.

## Welche Anwendungsfälle gibt es für Kritiker-Agenten?

Neben der Text- und Code-Prüfung bewähren sich Kritiker-Agenten in weiteren Szenarien:

- **Diagrammerstellung:** Wenn ein Agent ein Workflow-Diagramm generiert, prüft ein nachgeschalteter Kritiker, ob alle Prozessschritte logisch verknüpft sind und die visuelle Darstellung den Vorgaben entspricht.
- **Live-Überprüfung:** Der Agent-as-a-Judge agiert in Echtzeit. Er unterbricht fehlerhafte Prozesse sofort, anstatt am Ende eines langen Workflows einen unbrauchbaren Output zu bemängeln.
- **Pflege des Memory-Systems:** Das projektübergreifende Gedächtnis bleibt nur wertvoll, wenn es frei von Redundanzen und Widersprüchen ist. Der Kritiker-Agent fungiert hier als strenger Bibliothekar, der veraltete Einträge aussortiert und neue Fakten konsolidiert.

## Fazit: Keine Automatisierung ohne Kontrolle

Ein KI-Workflow ohne Kritiker-Agent ist wie ein Entwicklungsteam ohne Code-Review. Wenn Sie verlässliche, produktionsreife Ergebnisse erwarten, müssen Sie Qualitäts-Gates etablieren. Delegieren Sie nicht nur die Erstellung, sondern auch die Kontrolle an spezialisierte Agenten. Wie ein solches Setup in der Praxis aussieht, lesen Sie in meinem Erfahrungsbericht zur [Agenten-Orchestrierung](/artikel/orchestrierung-von-ki-agenten/). So stellen Sie sicher, dass Ihre Automatisierung nicht nur schnell, sondern auch fehlerfrei arbeitet.
