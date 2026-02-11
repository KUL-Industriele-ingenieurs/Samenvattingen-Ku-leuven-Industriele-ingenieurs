# Typst Handleiding 📄

> Alles wat je nodig hebt om te beginnen met Typst — het moderne alternatief voor LaTeX.

---

## ✨ Waarom Typst?

- ⚡ **Supersnel** — Live preview, geen wachttijden
- 📖 **Leesbare code** — Veel simpeler dan LaTeX syntax
- 🛠️ **Lichte installatie** — Geen MiKTeX of Perl nodig
- 🎨 **Zelfde stijl** — Onze template gebruikt dezelfde kleuren en boxes als de LaTeX-versie

---

## 🛠️ Installatie

### 1. Typst installeren

Open een terminal en voer uit:

**Windows** (PowerShell):

```powershell
winget install --id Typst.Typst
```

**macOS** (Terminal):

```bash
brew install typst
```

**Linux** (Ubuntu/Debian):

```bash
# Download van GitHub Releases: https://github.com/typst/typst/releases
# Of via Cargo:
cargo install typst-cli
```

**Arch Linux:**

```bash
sudo pacman -S typst
```

### Officiële websites (downloads & info):

- 🌍 **Typst:** [typst.app](https://typst.app/)
- 🌍 **VS Code:** [code.visualstudio.com](https://code.visualstudio.com/)

### 2. VS Code extensie

Installeer de **[Tinymist](https://marketplace.visualstudio.com/items?itemName=myriad-dreamin.tinymist)** extensie in VS Code. Dit geeft je:

- Live preview (druk op het oogje 👁 rechtsboven)
- Syntax highlighting
- Autocompletion

- Autocompletion

### 3. Fonts installeren

De basis fonts (Fira Sans, Fira Mono, NewCM) zitten al in de map `typst_templates/fonts/`.

#### 🅰️ Optionele Fonts (Aanbevolen)

Voor de **beste ervaring** (en om Fira Math te gebruiken), download en installeer deze fonts:

1.  **Fira Math**: [Download van GitHub](https://github.com/firamath/firamath/releases) (Kies `FiraMath-Regular.otf`)
2.  **Fira Code**: [Download van GitHub](https://github.com/tonsky/FiraCode/releases) (Kies `Fira_Code_v6.2.zip` > `ttf` map)

Installeer ze door te dubbelklikken op de bestanden en op "Installeren" te drukken.

#### 🅱️ Basis Fonts (in deze map)

Als je de optionele fonts niet wilt, installeer dan minstens deze uit `typst_templates/fonts/`:

| Font                    | Bestanden       | Gebruik    |
| ----------------------- | --------------- | ---------- |
| **Fira Sans**           | FiraSans-\*.ttf | Koppen     |
| **Fira Mono**           | FiraMono-\*.ttf | Code       |
| **New Computer Modern** | NewCM10-\*.otf  | Broodtekst |

---

## 📝 Hoe werk je met Typst?

### Preview bekijken

Open een `.typ` bestand en druk op het **Preview** knopje (oogje 👁) rechtsboven in VS Code. De preview update automatisch terwijl je typt!

### Compileren via terminal (optioneel)

```
typst compile mijn-document.typ
```

---

## 📂 Templates

We hebben twee templates klaarstaan:

### Kort document

📄 **[`typst_templates/Typst_template-kort-document.typ`](typst_templates/Typst_template-kort-document.typ)**

Gebruik voor: samenvattingen, oefenreeksen, korte documenten.

```typ
#import "../school-template.typ": *

#show: project.with(
  title: "Naam van het Vak",
  course: "Ingenieurswetenschappen",
  authors: ("Jouw Naam",),
  academic_year: "2025-2026",
)

= Eerste Hoofdstuk
Hier begint je inhoud...

== Subsectie
Meer inhoud...
```

### Lang document (met aparte hoofdstukken)

📄 **[`typst_templates/Typst_template-lang-document.typ`](typst_templates/Typst_template-lang-document.typ)**

Gebruik voor: thesis, grote samenvattingen met meerdere hoofdstukken.

```typ
#import "../school-template.typ": *

#show: project.with(
  title: "Modulair Document",
  course: "Voorbeeldvak",
  authors: ("Jouw Naam",),
  academic_year: "2025-2026",
)

#include "chapters/chapter1_inleiding.typ"
#include "chapters/chapter2_theorie.typ"
```

Elk hoofdstuk in `chapters/` begint gewoon met een kop:

```typ
#import "../../school-template.typ": *

= Inleiding
Hier begint het hoofdstuk...
```

---

## 🎨 School-Template (onze stijl)

De template `school-template.typ` biedt dezelfde functionaliteit als de LaTeX `school-macros.sty`:

### Boxes

```typ
#theorie(title: "De Basis")[
  Uitleg over het onderwerp...
]

#concept(title: "Definitie")[
  Belangrijke definitie hier...
]

#waarschuwing[
  Let op bij deze berekening!
]

#voorbeeld(title: "Voorbeeld 1")[
  Uitgewerkt voorbeeld...
]

#oefening(title: "Oefening 1")[
  Bereken de kracht...
]

#examenbox[Vergeet niet de eenheden!]
```

### Formules (automatisch formularium)

```typ
#frm("Wet van Ohm", $U = I dot R$, [
  $U$ = spanning (V), $I$ = stroomsterkte (A), $R$ = weerstand (Ω)
])

// Aan het einde van je document:
#printformularium()
```

### Symbolen (automatisch symbolenlijst)

```typ
#sym($F$, "Kracht", "N")      // Eerste keer: toont uitleg
#sym($F$, "Kracht", "N")      // Daarna: alleen symbool

// Aan het einde van je document:
#printsymbols()
```

### Code blokken (VS Code stijl)

```typ
#codeblock(lang: "python", title: "berekening.py")[
  def hallo():
      print("Hallo Ingenieurs!")
]
```

### Tekst-markers

```typ
#term[belangrijke term]        // Blauw + bold
#belangrijk[let op!]           // Rood + bold
#TODO("dit moet nog aangevuld")
#NOTE("opmerking")
```

---

## 🔢 Typst vs LaTeX — Snelle vergelijking

| Wat        | LaTeX                         | Typst                       |
| ---------- | ----------------------------- | --------------------------- |
| Kop        | `\section{Titel}`             | `= Titel`                   |
| Subkop     | `\subsection{Titel}`          | `== Titel`                  |
| Vet        | `\textbf{tekst}`              | `*tekst*`                   |
| Cursief    | `\textit{tekst}`              | `_tekst_`                   |
| Wiskunde   | `$E = mc^2$`                  | `$E = m c^2$`               |
| Breuk      | `\frac{a}{b}`                 | `$a / b$` of `$frac(a, b)$` |
| Lijst      | `\begin{itemize}...\end{...}` | `- item`                    |
| Genummerd  | `\begin{enumerate}...`        | `+ item`                    |
| Commentaar | `% commentaar`                | `// commentaar`             |
| Afbeelding | `\includegraphics{}`          | `#image("bestand.png")`     |

---

## 📦 Externe packages

De template importeert deze packages automatisch:

| Package                    | Wat het doet                    | LaTeX equivalent |
| -------------------------- | ------------------------------- | ---------------- |
| `@preview/unify:0.7.1`     | Eenheden: `#qty(9.81, "m/s^2")` | `siunitx`        |
| `@preview/physica:0.9.5`   | Afgeleiden, brakets             | `physics`        |
| `@preview/cetz:0.4.2`      | Tekeningen                      | `tikz`           |
| `@preview/cetz-plot:0.1.3` | Plots                           | `pgfplots`       |

---

## 🎬 Video

- 🎬 **[Typst voor Beginners](https://www.youtube.com/watch?v=NTGkb4FCLhM)** – De basis van hoe je documenten schrijft.

---

## 🐛 Problemen?

- **Fonts niet gevonden?** Zorg dat je stap 3 van de installatie hebt gedaan (fonts installeren).
- **Hulp nodig?** Stuur een berichtje op de [Industria Discord](https://discord.gg/gsDzr5qhPe).
