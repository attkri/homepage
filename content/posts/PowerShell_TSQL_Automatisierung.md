---
draft: false
date: 2025-03-31
title: "PowerShell & SQL Server – Automatisieren mit T-SQL & .NET"
description: "PowerShell trifft SQL Server: Daten abfragen, exportieren & automatisieren mit T-SQL und .NET – praxisnah & kompakt."
categories: ["PowerShell"]
author: "Attila Krick"

cover:
  image: "/images/posts/PowerShell-SQL-Automation-Workflow.webp"
  alt: "PowerShell-Skript greift auf SQL Server zu"
  caption: "PowerShell und SQL Server – ein starkes Team für Automatisierung"
  relative: false

showToc: true
TocOpen: false
comments: true
ShowReadingTime: true
ShowBreadCrumbs: true
ShowPostNavLinks: true
ShowShareButtons: true
ShowCodeCopyButtons: true

assets:
  disableHLJS: true
---

## PowerShell & SQL Server – Automatisieren mit T-SQL & .NET

Du arbeitest mit SQL Server und möchtest Routineaufgaben automatisieren? Dann ist PowerShell dein bester Freund. In diesem Beitrag zeige ich dir, wie du mit PowerShell SQL-Daten abfragen, verarbeiten und exportieren kannst – inklusive TSQL, .NET-Zugriff und nützlicher Tipps für Admins, DBAs und **freie Softwareentwickler**.

### Warum PowerShell + SQL?

SQL Server ist robust – aber seine GUI-Tools (wie SSMS) sind oft schwerfällig, besonders bei wiederkehrenden Aufgaben. PowerShell hilft dir:

- regelmäßig Berichte zu ziehen (z. B. Logins, Speicher, Indizes)
- Datenbanken zu sichern oder zu vergleichen
- Skripte gegen mehrere Server auszuführen
- CSVs zu importieren/exportieren
- SQL-Jobs zu überwachen

Und das Beste: Du kannst alles **zeitgesteuert** oder per Klick im Skript erledigen.

### Zugriff auf SQL Server mit PowerShell

Für viele Anwendungsfälle brauchst du keine Zusatzmodule. Die .NET-Klasse `System.Data.SqlClient.SqlConnection` reicht völlig:

```powershell
# Verbindung aufbauen
$connectionString = "Server=SQL01;Database=master;Integrated Security=True;"
$connection = New-Object System.Data.SqlClient.SqlConnection $connectionString
$connection.Open()

# Abfrage vorbereiten
$command = $connection.CreateCommand()
$command.CommandText = "SELECT name FROM sys.databases"

# Ergebnis lesen
$reader = $command.ExecuteReader()
while ($reader.Read()) {
    $reader["name"]
}

$connection.Close()
```

> Achte auf Leerzeilen vor und nach Codeblöcken – für bessere Lesbarkeit.

### Alternativ: SqlServer-Modul verwenden

Für komplexere Szenarien nutzt du das Modul `SqlServer`, z. B. mit `Invoke-SqlCmd`:

```powershell
Install-Module -Name SqlServer -Scope CurrentUser

Invoke-Sqlcmd -ServerInstance "SQL01" -Database "master" -Query "SELECT name FROM sys.databases"
```

Vorteile:
- vereinfacht die Verbindung
- liefert sofort Objekte
- unterstützt Authentifizierungsoptionen & Variablen

> 💡 Auch mit Azure SQL oder benutzerdefinierten Ports nutzbar.

### Ergebnis exportieren – z. B. als CSV

Gerade für Audits oder Reporting lohnt sich die Weiterverarbeitung:

```powershell
Invoke-Sqlcmd -ServerInstance "SQL01" -Database "master" -Query "SELECT name, create_date FROM sys.databases" |
    Export-Csv -Path "$env:TEMP\datenbanken.csv" -NoTypeInformation -Encoding UTF8
```

So landen deine SQL-Daten direkt als CSV im Zielverzeichnis – fertig für Excel oder weitere Verarbeitung.

### Anwendungsszenarien aus der Praxis

- **Backup-Monitoring:** SQL-Backups auslesen & in HTML-Report verwandeln
- **Benutzerprüfung:** Abfrage aller Logins & deren Rechte
- **Tägliche Checks:** z. B. Datenbankgröße, Recovery-Modus, fehlende Indizes
- **DevOps Pipelines:** per PowerShell & SQL automatisch Testdaten laden

Gerade in Kombination mit geplanten Tasks oder CI/CD-Tools (z. B. Azure DevOps) ergeben sich endlose Möglichkeiten.

### Tipps für robuste Skripte

- nutze Try-Catch zum Abfangen von SQL-Fehlern
- prüfe Verbindungen mit `$connection.State`
- arbeite mit `Parameterized Queries` gegen SQL-Injections
- setze Timeouts bewusst (CommandTimeout)
- strukturiere deine Skripte modular & kommentiere großzügig

### Fazit

PowerShell ist ein extrem hilfreiches Werkzeug zur SQL-Automatisierung – ob für regelmäßige Checks, einmalige Reports oder dynamische Pipelines. Durch den Zugriff via .NET oder `Invoke-SqlCmd` bist du maximal flexibel und kannst auch große Umgebungen effizient verwalten.

👉 Mehr Praxis findest du in meinen [PowerShell & SQL Seminaren](https://attilakrick.com/powershell/powershell-seminare/)

**Noch Fragen oder eigene SQL-Automation im Kopf?**  
👉 [Meld dich gern!](https://attilakrick.com/kontakt)
