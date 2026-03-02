# Hugo (attilakrick.com)

## Kurzüberblick

## Aktuelle Situation

- Framework: Hugo (Static Site Generator)
- Theme: PaperMod
- GitHub Repo: `github.com/attkri/homepage`
- Content: `content/posts/<thema>/`
- Bilder: `/static/images/posts/<datei>.webp`

## Ziele und Entscheidungsstatus

## Chronologische Entwicklung

## Offene Punkte und nächste Schritte

## Quellen und Verweise

hugo server -D       # Lokale Vorschau (http://localhost:1313)

## Überführte Details

```yaml







---







draft: false







date: 2025-03-31







title: "Titel (max. ~580px Breite)"







description: "Beschreibung (max. ~1000px Breite, SEO)"







categories: ["PowerShell"]  # PowerShell | T-SQL | dotNET







tags: ["Tag1", "Tag2"]







author: "Attila Krick"















cover:







  image: "/images/posts/<datei>.webp"







  alt: "Alternativer Text"







  caption: "Untertitel"







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







```

- **Kein `---` vor Überschriften** verwenden.

- **Leerzeile vor und nach Codeblöcken** (` ```powershell ... ``` `).

- Mindestlänge pro Beitrag: **500 Wörter** (Inhalt ohne Frontmatter).

- Erste Überschrift: `## Überschrift` (H2).

- Bilder immer als `.webp` in `/static/images/posts/`.

| Datei | Titel | Coverbild |

|:------|:------|:----------|

| powershell-verstehen-teil1.md | PowerShell verstehen – Was ist das & warum brauchst du es? | PowerShell-Keep-calm-and-use-Get-Help.jpg |

| powershell-benutzen-teil2.md | PowerShell benutzen – Tools, VS Code und erste Schritte | VisualStudioCode-PowerShell-Beispiel-1.jpg |

| powershell-objekte-pipeline-teil3.md | Objekte, Pipeline & Cmdlets – So arbeitest du effizient | PowerShell-Pipelining-FlipChart-Vorschau.webp |

| powershell-cmdlet-finden-bonus1.md | Das richtige Cmdlet finden | PowerShell-Cmdlet-finden-Top10.webp |

| powershell-sicherheit-bonus2.md | PowerShell sicher einsetzen – Execution Policies | PowerShell-Sicherheit-die-Keywords.webp |

| powershell-sqlserver-bonus3.md | PowerShell & SQL Server – Automatisieren | PowerShell-SQL-Automation-Workflow.webp |

Alle Bilder: `/static/images/posts/PowerShell-*.webp`

- `/content/leistungen.md` (>500 Wörter, type: article, HideTags: true)

- Kunden: GFU AG, ComConsult GmbH, Bechtle AG

- Tätigkeitsbereiche: PowerShell, .NET (WPF/WebServices), SQL Server, Content/Dokumentation

```bash







hugo                 # Build







```
