---
draft: false
date: 2026-02-08T00:00:00+02:00
title: "Entity Framework Grundlagen für .NET-Projekte"
description: "Entity Framework Grundlagen auf Deutsch: Modelle, Abfragen und Praxisbeispiele für saubere .NET-Datenzugriffe."
categories:
  - dotNET
  - T-SQL
tags:
  - entity-framework-core
  - dotnet
  - sql-server
  - migrationen
author: "Attila Krick"
cover:
  image: cover.webp
  alt: "Entity Framework Core Grundlagen in .NET"
  caption: "EF Core: vom ersten Modell bis zur Migration"
  relative: true
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

## Worum geht es in diesem Artikel?

Dieser Artikel beantwortet eine konkrete Frage: **Wie setzt du Entity Framework Core in einem .NET-Projekt so auf, dass das Setup in der Praxis tragfähig ist?**

> Stand: 2026-02  
> Getestet mit: den in diesem Beitrag gezeigten EF-Core-Basisbausteinen (DbContext, Migrationen, LINQ-Abfragen) in aktuellen .NET-Projekten.

## Warum Entity Framework Core?

Entity Framework Core (EF Core) ist das bevorzugte **Object-Relational Mapping (ORM)-Framework** für .NET-Entwickler. Es ermöglicht eine einfache und effiziente Interaktion mit relationalen Datenbanken, ohne direkt SQL schreiben zu müssen.

Vorteile von EF Core:

- **Plattformübergreifend** - Unterstützt Windows, Linux und macOS.
- **Leistungsstark & flexibel** - Unterstützt verschiedene Datenbankanbieter (SQL Server, PostgreSQL, SQLite etc.).
- **Code First & Database First** - Ermöglicht flexible Entwicklungsmethoden.
- **Integriertes Change Tracking** - Automatische Verwaltung von Änderungen an Datenbankeinträgen.
- **Migrationen & Modellvalidierung** - Versionierung der Datenbankstruktur direkt im Code.

## Entity Framework Tutorial: Der strukturierte Einstieg

## Installation in einem neuen Projekt

EF Core wird als NuGet-Paket installiert. Für SQL Server brauchst du in der Regel mindestens diese Pakete:

### Installation mit .NET CLI

```powershell
# Basis-Paket für EF Core
dotnet add package Microsoft.EntityFrameworkCore

# Paket für die SQL Server-Unterstützung
dotnet add package Microsoft.EntityFrameworkCore.SqlServer

# Paket für Migrationen
dotnet add package Microsoft.EntityFrameworkCore.Tools
```

### Optional: Installation über Visual Studio

Falls du Visual Studio verwendest, kannst du die Pakete auch über die *NuGet-Paketverwaltung* hinzufügen:

- Visual Studio öffnen
- Projekt laden
- Tools -> NuGet-Paket-Manager -> Paketverwaltung für Lösung
- Microsoft.EntityFrameworkCore suchen und installieren

## Saubere Basis: Modell und DbContext

Um EF Core in einem Projekt zu nutzen, erstelle eine `DbContext`-Klasse und definiere deine Modelle.

### Beispiel: Eine einfache `Product`-Entität

```csharp
public class Product
{
    public int Id { get; set; }
    public string Name { get; set; } = string.Empty;
    public decimal Price { get; set; }
}
```

### Beispiel: DbContext

Die **DbContext-Klasse** verwaltet die Verbindung zur Datenbank:

```csharp
public class AppDbContext : DbContext
{
    public AppDbContext(DbContextOptions<AppDbContext> options) : base(options)
    {
    }

    public DbSet<Product> Products { get; set; }
}
```

In produktiven Projekten gehört die Connection-String-Konfiguration in `appsettings.json` oder sichere Umgebungsvariablen, nicht hart in den Code.

## Migrationen und Datenbankversionierung

EF Core ermöglicht eine einfache Verwaltung der Datenbankstruktur mit **Migrationen**.

### Migration erstellen

```powershell
dotnet ef migrations add InitialCreate
```

### Migration anwenden

```powershell
dotnet ef database update
```

### Was du damit erreichst

- Datenbankstruktur bleibt versioniert und nachvollziehbar.
- Schemaänderungen laufen reproduzierbar über Entwicklungs- und Testumgebungen.
- Rollouts werden planbarer, weil Änderungen dokumentiert sind.

## Abfragen mit LINQ

EF Core nutzt **LINQ (Language Integrated Query)**, um Datenbankabfragen direkt in C# zu formulieren.

### Beispiel: Daten abrufen

```csharp
var options = new DbContextOptionsBuilder<AppDbContext>()
    .UseSqlServer("Server=.;Database=MyAppDb;Trusted_Connection=True;TrustServerCertificate=True")
    .Options;

using (var context = new AppDbContext(options))
{
    var products = context.Products.Where(p => p.Price > 50).ToList();
    foreach (var product in products)
    {
        Console.WriteLine($"{product.Name}: {product.Price} EUR");
    }
}
```

### Beispiel: Einfügen eines neuen Produkts

```csharp
var options = new DbContextOptionsBuilder<AppDbContext>()
    .UseSqlServer("Server=.;Database=MyAppDb;Trusted_Connection=True;TrustServerCertificate=True")
    .Options;

using (var context = new AppDbContext(options))
{
    var newProduct = new Product { Name = "Laptop", Price = 999.99M };
    context.Products.Add(newProduct);
    context.SaveChanges();
}
```

### Leselast optimieren mit AsNoTracking

```csharp
var options = new DbContextOptionsBuilder<AppDbContext>()
    .UseSqlServer("Server=.;Database=MyAppDb;Trusted_Connection=True;TrustServerCertificate=True")
    .Options;

using (var context = new AppDbContext(options))
{
    var products = context.Products
        .AsNoTracking()
        .Where(p => p.Price > 50)
        .ToList();
}
```

## Typische Fehler im Alltag

- Migrationen werden lokal erstellt, aber nicht versioniert eingecheckt.
- Connection Strings landen versehentlich im Quellcode.
- LINQ-Abfragen werden nicht auf SQL-Auswirkung geprüft.
- Bei reinen Leseabfragen wird `AsNoTracking()` nicht genutzt.

## Checkliste für den produktiven Einsatz

- Projektpakete und Provider gezielt festlegen.
- DbContext per DI konfigurieren.
- Migrationen als festen Bestandteil des Deployments behandeln.
- Kritische Abfragen messen und bei Bedarf SQL-Plan analysieren.
- Sicherheit der Verbindungsdaten technisch absichern.

## Weiterführende Inhalte

- [T-SQL JOIN verstehen und korrekt einsetzen]({{< relref "/Artikel/T-SQL_JOIN/index.md" >}})
- [PowerShell und T-SQL automatisieren]({{< relref "/Artikel/PowerShell_TSQL_Automatisierung/index.md" >}})
- [.NET Beratung](/leistung/dotnet-beratung/)
- [.NET Code Review](/leistung/dotnet-code-review/)
- [Leistungen]({{< relref "/Leistung/index.md" >}})
- [Kontakt]({{< relref "/Kontakt/index.md" >}})

## Fazit

Entity Framework Core ist ein starker Beschleuniger, wenn du das Setup von Anfang an sauber aufsetzt: klare Modellierung, versionierte Migrationen, kontrollierte Abfragen und sichere Konfiguration. Genau diese vier Punkte entscheiden im Alltag über Stabilität und Wartbarkeit.
