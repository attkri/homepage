Das Geheimnis ist, das Diagramm **Schritt für Schritt zu beschreiben**. Hier ist eine Aufschlüsselung, wie du das angehen würdest, basierend auf dem Bild:

**Anleitung zum Erstellen des Prompts:**

1. **Lege den visuellen Stil fest:**
* Beschreibe den Look: "Ein professionelles, modernes Diagramm im UI-Stil".
* Definiere das Farbschema: "Dunkelblauer Hintergrund mit leuchtenden grünen und blauen Akzenten".
* Wähle die Formen: "Abgerundete Rechtecke" und "saubere, moderne Schriftart".


2. **Liste alle Elemente (Knoten) auf:**
* Schau dir das ASCII-Diagramm an und erstelle eine Liste der Boxen.
* **Orchestrator:** "Zentrale Box oben".
* **Planner:** "Darunter, ganz links".
* **Coder:** "Daneben, in der Mitte".
* **Reviewer:** "Daneben, ganz rechts".
* **Tester:** "Darunter, mittig-links".
* **Publisher:** "Darunter, mittig-rechts".


3. **Füge Icons und Text für jedes Element hinzu:**
* Gehe jeden Knoten durch und füge Details hinzu.
* *Beispiel Planner:* "Text: Code-Planner (Konzepte), Icon: ein technischer Bauplan mit Kompass".
* *Beispiel Coder:* "Text: Code-Coder (Umsetzung), Icon: eine Tastatur mit Code-Zeichen".
* *Beispiel Tester:* "Text: Code-Tester (XUnit-Tests), Icon: ein Klemmbrett mit Checkliste".
* ...und so weiter für alle.


4. **Verbinde die Elemente mit Pfeilen:**
* Dies ist der wichtigste Teil für die Logik. Beschreibe jeden Fluss.
* **Vertikaler Fluss:** "Vom Orchestrator gehen drei Pfeile nach unten: zu Planner, Coder und Reviewer."
* **Horizontaler Sequenzfluss:** "Ein Pfeil von Planner zu Coder. Ein Pfeil von Coder zu Reviewer."
* **Aktionsfluss:** "Ein Pfeil von Coder nach unten zu Tester. Ein Pfeil von Reviewer nach unten zu Publisher."
* **Horizontaler Abschlussfluss:** "Ein Pfeil von Tester zu Publisher."



**Das zusammengefasste Prompt würde dann ungefähr so aussehen (du kannst das kopieren und anpassen):**

> "Erstelle ein professionelles, modernes Diagramm im UI-Stil für einen Software-Entwicklungsprozess. Der Hintergrund soll dunkelblau sein, mit leuchtenden grünen und blauen Akzenten. Die Knoten sind abgerundete Rechtecke mit klarem, modernem Text und passenden Icons.
> **Top Level:**
> Eine zentrale Box ganz oben: **Code-Orchestrator** (mit Zahnrad- und Taktstock-Icon). Text darunter: 'Coordiniert, delegiert und steuert den Prozess'.
> **Middle Level:**
> Drei Boxen darunter:
> * Links: **Code-Planner** (Bauplan-Icon) – Text: '(Konzepte)'
> * Mitte: **Code-Coder** (Tastatur-Icon) – Text: '(Umsetzung)'
> * Rechts: **Code-Reviewer** (Lupen-Icon) – Text: '(Qualität)'
> 
> 
> **Bottom Level:**
> Zwei Boxen darunter:
> * Links-Mitte: **Code-Tester** (Checklisten-Icon) – Text: '(XUnit-Tests)'
> * Rechts-Mitte: **Code-Publisher** (Raketen-Icon) – Text: '(Release)'
> 
> 
> **Fluss:**
> 1. Pfeile vom Orchestrator nach unten zu Planner, Coder und Reviewer.
> 2. Ein Pfeil von Planner zu Coder.
> 3. Ein Pfeil von Coder zu Reviewer.
> 4. Ein Pfeil von Coder zu Tester.
> 5. Ein Pfeil von Reviewer zu Publisher.
> 6. Ein Pfeil von Tester zu Publisher.
> 
> 
> Stelle sicher, dass der gesamte Flow logisch und ästhetisch ansprechend ist."
