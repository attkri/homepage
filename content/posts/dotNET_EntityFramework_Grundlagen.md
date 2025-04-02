---
title: "Entity Framework Core Grundlagen"
date: 2024-10-18
description: "Ein Überblick über Entity Framework Core, seine Vorteile und Best Practices für .NET-Entwickler."
categories: ["dotNET", "T-SQL"]
draft: false
cover:
  image: "/images/posts/Entity_Framework.webp"
  alt: "Entity Framework Core - Einführung"
---

## Warum Entity Framework Core nutzen?

Dieser Artikel vermittelt dir die Grundlagen von Entity Framework Core – einem modernen ORM für .NET-Anwendungen.

Entity Framework Core (EF Core) ist das bevorzugte **Object-Relational Mapping (ORM)-Framework** für .NET-Entwickler. Es ermöglicht eine einfache und effiziente Interaktion mit relationalen Datenbanken, ohne direkt SQL schreiben zu müssen.

Vorteile von EF Core:

- **Plattformübergreifend** - Unterstützt Windows, Linux und macOS.
- **Leistungsstark & flexibel** - Unterstützt verschiedene Datenbankanbieter (SQL Server, PostgreSQL, SQLite etc.).
- **Code First & Database First** - Ermöglicht flexible Entwicklungsmethoden.
- **Integriertes Change Tracking** - Automatische Verwaltung von Änderungen an Datenbankeinträgen.
- **Migrationen & Modellvalidierung** - Versionierung der Datenbankstruktur direkt im Code.

## Installation von Entity Framework Core

EF Core wird als NuGet-Paket installiert. Um EF Core zu nutzen, füge die Pakete zu deinem .NET-Projekt hinzu:

### Installation mit .NET CLI

```powershell
# Basis-Paket für EF Core
dotnet add package Microsoft.EntityFrameworkCore

# Paket für die SQL Server-Unterstützung
dotnet add package Microsoft.EntityFrameworkCore.SqlServer

# Paket für Migrationen
dotnet add package Microsoft.EntityFrameworkCore.Tools
```

### Installation mit Package Manager

Falls du Visual Studio verwendest, kannst du die Pakete auch über die *NuGet-Paketverwaltung* hinzufügen:

1. Visual Studio öffnen
2. Projekt laden
3. Tools -> NuGet-Paket-Manager -> Paketverwaltung für Lösung
4. Microsoft.EntityFrameworkCore suchen und installieren

## Erste Schritte mit EF Core

Um EF Core in einem Projekt zu nutzen, erstelle eine `DbContext`-Klasse und definiere deine Modelle.

### Beispiel: Eine einfache `Product`-Entität

```csharp
public class Product
{
    public int Id { get; set; }
    public string Name { get; set; }
    public decimal Price { get; set; }
}
```

### DbContext erstellen

Die **DbContext-Klasse** verwaltet die Verbindung zur Datenbank:

```csharp
public class AppDbContext : DbContext
{
    public DbSet<Product> Products { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder options)
    {
        options.UseSqlServer("Server=.;Database=MyAppDB;Trusted_Connection=True;");
    }
}
```

## Migrationen und Datenbankverwaltung

EF Core ermöglicht eine einfache Verwaltung der Datenbankstruktur mit **Migrationen**.

### Migration erstellen

```powershell
dotnet ef migrations add InitialCreate
```

### Migration anwenden

```powershell
dotnet ef database update
```

## Abfragen mit LINQ

EF Core nutzt **LINQ (Language Integrated Query)**, um Datenbankabfragen direkt in C# zu formulieren.

### Beispiel: Daten abrufen

```csharp
using (var context = new AppDbContext())
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
using (var context = new AppDbContext())
{
    var newProduct = new Product { Name = "Laptop", Price = 999.99M };
    context.Products.Add(newProduct);
    context.SaveChanges();
}
```

## Tipps für den produktiven Einsatz von EF Core

- **Verwende AsNoTracking()**, wenn Daten nur gelesen werden, um Performance zu verbessern.
- **Nutze Lazy Loading sparsam**, um unerwartete Datenbankaufrufe zu vermeiden.
- **Verwalte Verbindungen richtig**, um Speicherlecks zu vermeiden.
- **Nutze Migrations sauber**, um Probleme bei der Datenbankversionierung zu verhindern.

## Fazit

Entity Framework Core erleichtert die Arbeit mit Datenbanken erheblich und bietet viele nützliche Funktionen für .NET-Entwickler. Mit der richtigen Konfiguration und Best Practices kannst du das volle Potenzial von EF Core ausschöpfen und performante Anwendungen entwickeln.
