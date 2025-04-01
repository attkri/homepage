---
title: "T-SQL JOINs für Einsteiger – So verknüpfst du deine Daten richtig"
date: 2025-03-29
description: "Verstehe INNER JOIN, LEFT JOIN & Co. mit praxisnahen Beispielen für Kunden, Bestellungen und Produkte – ideal für Business-Analysten und Power-User."
categories: ["T-SQL"]
tags: ["T-SQL"]
draft: false
cover:
  image: "/images/posts/tsql_joins_cover_1200x300.webp"
  alt: "JOIN-Typen in T-SQL einfach erklärt"
---

## T-SQL JOINs für Einsteiger: So verknüpfst du deine Daten richtig

Du willst endlich verstehen, was INNER JOIN, LEFT JOIN & Co. in T-SQL wirklich machen? Perfekt! In diesem Blogbeitrag nehmen wir dich Schritt für Schritt mit in die Welt der Tabellenverknüpfungen. Zielgruppe sind Business-Analysten und Power-User, die mit Azure Data Studio arbeiten und häufig mit relationalen Datenmodellen zu tun haben.

### Was sind JOINs und warum brauchst du sie?

In relationalen Datenbanken wie SQL Server werden Daten logisch getrennt in Tabellen gespeichert. JOINs sind die Brücken zwischen diesen Tabellen. Du kannst damit z. B. Kundendaten mit den zugehörigen Bestellungen verknüpfen oder für jedes Produkt anzeigen, wie oft es bestellt wurde.

Statt alles in eine riesige Tabelle zu stopfen, bleibst du flexibel und effizient – JOINs holen sich genau die Infos, die du brauchst.

### Unser Praxisbeispiel: Kunden, Bestellungen und Produkte

Wir arbeiten mit drei Tabellen:

- **Kunden** (`Kunden`)
- **Bestellungen** (`Bestellungen`)
- **Produkte** (`Produkte`)

#### Tabellenstruktur (vereinfacht)

```sql
-- Kunden
KundenID | Name       
---------|------------
1        | Müller GmbH
2        | Schulz AG

-- Bestellungen
BestellID | KundenID | ProduktID | Menge
----------|----------|-----------|------
1001      | 1        | 501       | 2
1002      | 2        | 502       | 1
1003      | 1        | 503       | 5

-- Produkte
ProduktID | Produktname   | Preis
----------|---------------|------
501       | Laptop        | 1200
502       | Monitor       | 300
503       | Maus          | 25
```

### Tabellenbeziehungen erklärt

- **KundenID** in `Bestellungen` ist ein **Fremdschlüssel**, der auf `Kunden` zeigt.
- **ProduktID** in `Bestellungen` zeigt auf `Produkte`.

Damit ist klar: Eine Bestellung ist einem Kunden zugeordnet und enthält ein Produkt.

### JOIN-Typen im Überblick (mit Visualisierung)

Hier siehst du die wichtigsten JOINs als vereinfachte Darstellung (Legende: ⬤ = Ergebnismenge):

#### INNER JOIN – Nur was zusammenpasst

Zeigt nur Zeilen, bei denen in beiden Tabellen ein passender Eintrag existiert.

```text
Kunden           Bestellungen
  □                 □
    \             /
     ⬤  INNER JOIN
```

```sql
SELECT K.Name, B.ProduktID
FROM Kunden K
INNER JOIN Bestellungen B ON K.KundenID = B.KundenID;
```

#### LEFT JOIN – Alle Kunden, auch ohne Bestellung

Nimm alle Kunden, und falls Bestellungen existieren, zeig sie.

```text
Kunden           Bestellungen
  □                 □
   |\             /
   |⬤ LEFT JOIN
```

```sql
SELECT K.Name, B.ProduktID
FROM Kunden K
LEFT JOIN Bestellungen B ON K.KundenID = B.KundenID;
```

#### RIGHT JOIN – Alle Bestellungen, auch ohne Kunden (selten sinnvoll)

Gegenteil von LEFT JOIN. Wird selten verwendet, weil "verwaiste Bestellungen" meist Datenfehler sind.

```sql
SELECT K.Name, B.ProduktID
FROM Kunden K
RIGHT JOIN Bestellungen B ON K.KundenID = B.KundenID;
```

#### FULL OUTER JOIN – Alles zeigen, was da ist

Nimm alles aus beiden Tabellen, egal ob passend oder nicht.

```sql
SELECT K.Name, B.ProduktID
FROM Kunden K
FULL OUTER JOIN Bestellungen B ON K.KundenID = B.KundenID;
```

### BONUS: Drei Tabellen verknüpfen

```sql
SELECT K.Name, P.Produktname, B.Menge
FROM Bestellungen B
JOIN Kunden K ON B.KundenID = K.KundenID
JOIN Produkte P ON B.ProduktID = P.ProduktID;
```

Das ergibt z. B.:

```text
Name        | Produktname | Menge
------------|-------------|------
Müller GmbH | Laptop      | 2
Schulz AG   | Monitor     | 1
Müller GmbH | Maus        | 5
```

### Performance Tipp

Wenn zwischen 2 Tabellen eine Beziehung eingerichtet wurde sind diese Join Abfragen schneller. Daher nie abkürzen sondern auch dazwischen liegende Tabellen mit in die Verknüpfung einbeziehen. Auch wenn aus dieser mittleren Tabelle keine Daten benötigt werden ist die Abfrage wesentlich schneller.

### Zusammenfassung

- JOINs sind essenziell, um Daten aus mehreren Tabellen sinnvoll zu kombinieren.
- INNER JOIN zeigt nur Treffer, LEFT JOIN nimmt alles links mit, FULL OUTER JOIN zeigt alles.
- Für Business-Analysten und Power-User in Azure Data Studio ist das Verständnis von JOINs entscheidend für gute Reports.

### Neugierig auf mehr?

Du willst noch tiefer in **TSQL** einsteigen oder JOINs anhand deiner eigenen Datenbankstruktur trainieren? Dann melde dich gerne für ein individuelles **Seminar** oder eine **Beratungssession** mit mir! Auch **freie Softwareentwickler** profitieren von strukturierten SQL-Trainings für ihre Kundenprojekte.

**[Jetzt Kontakt aufnehmen](/kontakt/)**
