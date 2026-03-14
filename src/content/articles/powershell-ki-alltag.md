---
title: "Warum PowerShell-Wissen im KI-Alltag wichtiger wird"
meta_title: "PowerShell und KI: Warum Fachwissen im Copilot-Zeitalter wichtiger wird"
description: "KI-Assistenten schreiben PowerShell-Code in Sekunden – aber oft falsch. Warum Kontext, Fachsprache und Toolverständnis den Unterschied machen zwischen brauchbaren Ergebnissen und plausiblem Unsinn."
date: 2026-03-14T14:35:00+01:00
cover_image: "/images/artikel/powershell-ki-alltag/cover.webp"
image: "/images/artikel/powershell-ki-alltag/cover.webp"
author: "Attila Krick"
author_image: "/images/legacy/site/portrait-attila-krick-300x300.webp"
draft: false
---

KI-Assistenten werden besser. Die Modelle werden leistungsfähiger, die Tools ausgereifter, die Ergebnisse auf den ersten Blick überzeugender. Da liegt ein Gedanke nahe: Zurücklehnen, die KI machen lassen, wird schon passen.

Und dann schreibt ein Kollege:

> Ich bin immer wieder verwundert, wie viele Fehler Copilot doch macht. Falsche Aussagen, Code mit logischen Fehlern, nicht gut strukturiert – und sehr beharrlich, wenn er falsch abgebogen ist, diesen Irrweg beizubehalten und drum herum zu programmieren.

Das deckt sich mit dem, was ich in Schulungen und Beratungen ständig höre. Die Werkzeuge werden besser – aber die Ergebnisse werden nur dann besser, wenn der Mensch davor weiß, was er will, wie er es formuliert und worauf er achten muss. Wer sich zurücklehnt, bekommt schnellere Ergebnisse, aber nicht bessere.

PowerShell lernen lohnt sich heute mehr als vor drei Jahren. Nicht obwohl es KI gibt – sondern weil das eigene Fachwissen darüber entscheidet, ob KI ein Multiplikator wird oder eine _Quelle für plausiblen Unsinn_.

## Wenn KI Code schreibt, der plausibel aussieht

Die meisten Probleme mit KI-generiertem PowerShell-Code entstehen nicht, weil das Modell schlecht ist. Sie entstehen, weil die Anweisung nicht gut genug war.

**Ein typischer Ablauf sieht so aus:** Jemand tippt _"Schreib mir ein Skript, das Duplikate findet"_, bekommt 80 Zeilen Code zurück, lässt es laufen – und wundert sich, warum Dateien verschwinden, die keine Duplikate waren. Oder warum das Skript beim zweiten Durchlauf alles nochmal verschiebt. Oder warum es auf einem Netzlaufwerk mit einer kryptischen Fehlermeldung abbricht.

**Die Reaktion ist dann oft:** "Das funktioniert nicht, fix es." Und die KI? Flickt drum herum, statt das eigentliche Problem zu verstehen. Genau das, was mein Kollege beschrieben hat.

Dabei würde man das von einem neuen Mitarbeiter auch nicht erwarten. Wer jemanden einstellt, der zehn Jahre Erfahrung mit Dateisystemen hat, und ihm nur sagt: "Räum mal die Duplikate auf" – selbst dieser erfahrene Kollege würde nachfragen: Was genau ist ein Duplikat? Gleicher Dateiname? Gleicher Inhalt? Was soll mit den Funden passieren? Gibt es Ausnahmen?

**Der Unterschied:** Ein erfahrener Mensch fragt nach. Eine KI liefert einfach irgendetwas Plausibles. Sie kann nicht in die Zukunft schauen, sie kann nicht hexen – sie kann nur mit dem arbeiten, was sie bekommt.

## Was gute Ergebnisse wirklich brauchen

Die Qualität von KI-generiertem Code hängt fast vollständig davon ab, was der Mensch vorher investiert. In meiner Praxis hat sich gezeigt, dass drei Dinge den Unterschied machen:

### Ein klares Ziel

Der Abstand zwischen "räum die Dateien auf" und einer präzisen Aufgabe ist enorm. Ein Beispiel aus einem meiner Workshops:

**Vage:**

```markdown
Schreib mir ein PowerShell-Skript, das Duplikate findet und aufräumt.
```

**Das Ergebnis:** Ein Skript, das Dateien nach Namen vergleicht, Duplikate sofort löscht und keine Sicherung anlegt. Technisch lauffähig, praktisch gefährlich.

**Präzise:**

```markdown
**Erstelle ein PowerShell-Skript (Core 7.x), das:**

1. Den Ordner `Archiv` rekursiv nach Dateien durchsucht.
2. Per SHA256-Hash Duplikate identifiziert.
3. Einen Ordner `Originale` erstellt (falls nicht vorhanden).
4. Pro Duplikat-Gruppe: eine Datei nach `Originale` verschiebt und an allen bisherigen Fundorten symbolische Verknüpfungen anlegt.
5. Idempotent ist: mehrfaches Ausführen darf nichts kaputt machen.
6. Vor dem Start prüft, ob Symlink-Rechte vorhanden sind.
```

**Das Ergebnis:** Ein Skript, das man tatsächlich in einer Produktivumgebung einsetzen kann. Gleiche KI, gleicher Tag – aber ein völlig anderes Ergebnis, weil die Aufgabenstellung das Richtige verlangt hat.

### Fachsprache und Architektur

Wer `Get-FileHash`, `New-Item -ItemType SymbolicLink` und `try/catch` kennt, kann der KI sagen, welche Bausteine sie verwenden soll. Wer `ErrorAction Stop` von `SilentlyContinue` unterscheiden kann, bekommt robustere Fehlerbehandlung. Wer weiß, dass PowerShell Objekte durch die Pipeline schickt und keine Textzeilen, bekommt sauberere Architektur.

Das klingt selbstverständlich, aber in der Praxis sehe ich regelmäßig das Gegenteil: KI-generierte Skripte, die `Write-Host` statt `Write-Output` verwenden, die Fehler mit `2>$null` unterdrücken statt sie zu behandeln, oder die Pfade als Strings zusammenstückeln statt `Join-Path` zu nutzen. Nicht weil die KI es nicht besser könnte – sondern weil niemand danach gefragt hat.

**Wer die Fachsprache kennt, steuert das Werkzeug.** Wer sie nicht kennt, hofft, dass es schon passen wird.

### Kontrollierbare Grenzen

"Teste das Skript" klingt vernünftig. Aber was genau soll geprüft werden? Ob es ohne roten Fehler durchläuft? Das ist der niedrigste Standard, den man anlegen kann.

In meinen Tests mit verschiedenen KI-Werkzeugen habe ich dasselbe Skript von fünf verschiedenen Systemen erstellen lassen. Nur eines hat beim Testen tatsächlich geprüft, ob die Symlinks auf die richtigen Dateien zeigen. Die anderen haben bestenfalls "Skript lief durch" gemeldet.

Wer aussagekräftige Ergebnisse will, muss aussagekräftige Testkriterien mitgeben:

```markdown
Prüfe nach der Ausführung:

1. Enthält der Ordner `Originale` genau die erwarteten Dateien?
2. Sind an den bisherigen Fundorten Symlinks statt Dateien?
3. Zeigen die Symlinks auf die korrekten Originale?
4. Läuft das Skript bei erneutem Ausführen ohne Änderungen durch?
```

**Genauso wie in der Zusammenarbeit mit Kollegen:** Wer _"teste das mal"_ sagt, bekommt _"läuft"_. Wer vier konkrete Prüfpunkte vorgibt, bekommt ein Ergebnis, mit dem man arbeiten kann.

Ziel, Fachsprache und Grenzen – das sind die Stellschrauben auf der inhaltlichen Seite. Aber es gibt noch eine weitere Dimension, die viele übersehen: Nicht jedes KI-Werkzeug arbeitet gleich. Und wer den Unterschied nicht kennt, verschenkt entweder Kontrolle oder Effizienz.

## Assistenz, Skill, Agent – drei Arbeitsweisen, ein Alltag

Im KI-Umfeld tauchen drei Konzepte immer wieder auf. Für den PowerShell-Alltag lohnt es sich, den Unterschied zu kennen – nicht als akademische Definition, sondern als praktische Orientierung, die bestimmt, wie viel Autonomie man der KI gibt und wie viel Fachwissen dafür nötig ist.

**KI-Assistenz** ist das, was die meisten bereits nutzen: Ich frage, die KI antwortet, ich entscheide und tippe. [Copilot](/artikel/ki-vscode-github-copilot-agent-powershell-nutzen/) schlägt eine Code-Zeile vor, ich drücke Tab oder nicht. ChatGPT liefert ein Skript, ich kopiere es in meinen Editor. Die Kontrolle bleibt vollständig bei mir – aber die Arbeit eben auch.

**Ein Skill** geht einen Schritt weiter: Eine wiederverwendbare Arbeitsanweisung, die der KI sagt, _wie_ sie an eine bestimmte Aufgabe herangehen soll. Das kann ein Satz von Regeln sein – etwa wie PowerShell-Skripte in einer bestimmten Umgebung strukturiert, getestet und dokumentiert werden sollen. Der Skill ersetzt kein Fachwissen. Er macht bestehendes Fachwissen für die KI nutzbar und sorgt dafür, dass dieselbe Aufgabe beim zehnten Mal genauso sauber gelöst wird wie beim ersten.

**Ein Agent** arbeitet eigenständig. Er liest Dateien, schreibt Code, führt ihn aus, erkennt Fehler, korrigiert sich und liefert ein Ergebnis. Das ist mächtig – aber ein Agent ist nur so gut wie die [Leitplanken, die jemand vorher gesetzt hat](/artikel/ki-agenten-guardrails-portabilitaet/). Wer einem Agenten sagt _"mach mal"_, bekommt genau das: irgendwas. Wer einem Agenten ein klares Ziel, saubere Grenzen und konkrete Testkriterien mitgibt, bekommt Ergebnisse, die man in der Praxis tatsächlich verwenden kann. Je mehr Autonomie das Werkzeug hat, desto mehr Vertrauen setzt es voraus – und desto wichtiger wird das eigene Fachwissen als Qualitätssicherung.

Wer sich für die [Orchestrierung mehrerer KI-Agenten](/artikel/orchestrierung-von-ki-agenten/) interessiert, findet dort eine Vertiefung. Für den Einstieg reicht die Erkenntnis: Alle drei Varianten profitieren davon, dass der Mensch davor sein Handwerk versteht.

## Warum Lernen gerade jetzt wichtiger wird

KI senkt die Einstiegshürde in PowerShell erheblich. Das ist eine gute Entwicklung. Wer noch nie ein Skript geschrieben hat, bekommt in Sekunden einen funktionierenden Entwurf. Aber genau hier liegt eine Falle, die ich in Schulungen inzwischen regelmäßig sehe.

_Der Entwurf sieht plausibel aus._ Er läuft vielleicht sogar durch. Die Variablennamen sind sauber, die Kommentare lesen sich professionell, die Struktur wirkt durchdacht. Aber ob das Skript das Richtige tut, ob es robust ist, ob es in der eigenen Umgebung sicher funktioniert, ob es bei Fehlern sauber abbricht statt leise weiterzumachen – das kann nur beurteilen, wer das Fachgebiet versteht.

Die KI ersetzt nicht das Verstehen. Sie verstärkt den Unterschied zwischen jemandem, der grob beschreibt was er will, und jemandem, der präzise sagen kann was er braucht.

Wer PowerShell versteht, nutzt KI als Multiplikator. Wer PowerShell nicht versteht, bekommt schnelleren Unsinn.

Das bedeutet nicht, dass man erst drei Jahre PowerShell studieren muss, bevor man Copilot öffnen darf. Es bedeutet, dass Lernen und KI-Nutzung sich gegenseitig verstärken. Jedes Konzept, das man versteht – Pipeline, Objekte, Fehlerbehandlung, Module – macht die nächste KI-Interaktion besser. Und jede KI-Interaktion zeigt einem, wo die eigenen Lücken liegen.

Die beste Investition ist nicht ein besseres KI-Tool. Es ist ein besseres Verständnis dessen, was man damit bauen will.

## Selbst erleben: kostenloser Vortrag am 21. April

Wie groß der Unterschied zwischen Assistenz und Agent in der Praxis wirklich ist, zeige ich am **21. April 2026** in einem kostenlosen Online-Vortrag bei der GFU: **[PowerShell & KI – Assistenz und Agenten im Admin-Alltag](https://www.gfu.net/s6408)**.

Dort löse ich dasselbe PowerShell-Problem live mit fünf verschiedenen KI-Werkzeugen – vom einfachen Chat über den Editor-Assistenten bis zum autonomen Agenten. Gleiche Aufgabe, unterschiedliche Ergebnisse, echter Code. Am Ende wird sichtbar, warum der Mensch davor den Unterschied macht – und wo die Grenzen jedes Werkzeugs liegen.

- **Wann:** 21.04.2026, 18:00–19:00 Uhr
- **Wo:** Online (Zoom)
- **Kosten:** Keine
- **Anmeldung:** [gfu.net/s6408](https://www.gfu.net/s6408)
