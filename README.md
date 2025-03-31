# 🏠 Attila Krick – Personal Website & Blog (Hugo + Markdown)

Willkommen im Repository meiner persönlichen Homepage! Diese Seite ist mit **[Hugo](https://gohugo.io/)** erstellt und dient als zentrale Plattform für:

- 🧠 **Wissenstransfer** zu PowerShell, .NET, SQL, T-SQL, WPF & GUI-Entwicklung
- 🎓 Informationen zu meinen **Seminaren & Schulungen**
- 🛠️ Praxisnahe **Blogartikel und Tutorials** für IT-Admins, Entwickler & Supporter
- 💬 Kontaktmöglichkeiten & Beratungsangebote

---

## 🔧 Technologien

- **Hugo** als statischer Site Generator
- **Markdown** für Inhalte (Blogartikel, Tutorials, Anleitungen)
- **GitHub** zur Versionskontrolle & Veröffentlichung
- **Visual Studio Code** für die tägliche Bearbeitung
- Deployment via GitHub Pages oder Netlify (optional)

---

## 📁 Projektstruktur

```bash
content/            # Blogposts, Seiten und Inhalte
  └── posts/
      └── powershell/   # Thematisch sortierte Beiträge
static/             # Statische Assets (Bilder, Downloads etc.)
themes/             # Hugo-Theme (z. B. PaperMod)
config.toml         # Konfigurationsdatei für Hugo
README.md           # Diese Datei 😄
```

---

## 🖊️ Eigene Beiträge schreiben

Neue Beiträge legst du unter `content/posts/<thema>/` an.
Jeder Beitrag beginnt mit einem **Front Matter Block** im YAML-Format:

```yaml
---
draft: false
date: 2025-03-31
title: "Mein Beitragstitel"
description: "Kurze prägnante Beschreibung für SEO und Social Media."
categories: ["PowerShell"]
tags: ["Tag1", "Tag2"]
author: "Attila Krick"
---
```

---

## 🧪 Lokale Vorschau starten

Installiere Hugo (falls noch nicht geschehen):
```bash
brew install hugo       # macOS
choco install hugo      # Windows
```

Starte die Seite lokal mit Live-Reload:
```bash
hugo server -D
```
Öffne dann: [http://localhost:1313](http://localhost:1313)

---

## 🤝 Mitwirken / Beiträge verbessern

Fehler gefunden oder Vorschlag für einen neuen Artikel?
Erstelle gerne ein Issue oder nutze die „EditPost“-Funktion im jeweiligen Blogartikel, um direkt einen Pull Request zu starten.

---

## 📬 Kontakt

Mehr über mich findest du auf der Seite [https://attilakrick.com](https://attilakrick.com)

Oder direkt kontaktieren: [https://attilakrick.com/kontakt](https://attilakrick.com/kontakt)

---

**Danke fürs Vorbeischauen! 🙌**

