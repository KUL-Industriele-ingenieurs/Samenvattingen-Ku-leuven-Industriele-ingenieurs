# School-Macros Quick Reference v2.0

> KU Leuven — Faculteit Industriële Ingenieurswetenschappen

## 🚀 Quick Start

```latex
\documentclass[a4paper,11pt]{article}
\usepackage{school-macros}

\begin{document}
\kuleuventitle{Titel}{Vak}{Naam}{Datum}

\section{Inhoud}
% Je tekst hier...

\appendix
\printsymbols
\printformularium
\end{document}
```

**⚠️ Compileer altijd tweemaal voor formularium en symbolenlijst!**

---

## 📄 Article vs Report

| Feature | `article` | `report` |
|---------|-----------|----------|
| Top level | `\section{}` | `\chapter{}` |
| Numbering | 1, 2, 3... | 1.1, 1.2, 2.1... |
| Page breaks | None | Chapter starts new page |
| Best for | 5-30 pages | 30+ pages |

**Note:** Formularium groups by **section** in both classes.

---

## 📦 Box Environments

| Environment | Color | Use For |
|------------|-------|---------|
| `conceptbox` | Blue | Definities, kernbegrippen |
| `theorieblok` | Purple | Theoretische uitleg |
| `oefenblok` | Green | Oefeningen met oplossingen |
| `voorbeeld` | Orange | Praktijkvoorbeelden |
| `warningbox` | Red | Waarschuwingen |
| `examenbox` | Inline | Korte examentips |

### Syntax
```latex
\begin{conceptbox}[title=Optionele Titel]
Inhoud van de box...
\end{conceptbox}
```

### Exam Box (compact)
```latex
\begin{examenbox}
Korte tip zonder titel
\end{examenbox}
```

---

## 📐 Formula System (`\frm`)

Auto-collects formulas for appendix formularium. Grouped by **section** (not chapter).

```latex
\frm{Label}{math}{description}
```

### Example
```latex
\frm{Kinetische Energie}{E_k = \frac{1}{2}mv^2}
    {waarbij $m$ de massa [\si{kg}] en $v$ de snelheid [\si{m/s}]}
```

### Print Formularium
```latex
\printformularium      % Two-column layout (default)
\printformulariumsingle  % Single-column (complex formulas)
```

---

## 🔤 Symbol System (`\sym`)

Shows explanation on first use, just symbol afterwards.

```latex
\sym{symbol}{description}{unit}
```

### Example
```latex
\sym{v_c}{Snijsnelheid}{m/min}  % First use: full box
\sym{v_c}{Snijsnelheid}{m/min}  % Later: just bold v_c
```

---

## 📏 Units with siunitx (REQUIRED!)

### Numbers with Units
| Code | Result |
|------|--------|
| `\SI{50}{km/h}` | 50 km/h |
| `\SI{9.81}{m/s^2}` | 9,81 m/s² |
| `\SI{20}{\degreeCelsius}` | 20 °C |
| `\SI{1.5}{kN}` | 1,5 kN |
| `\SI{3e8}{m/s}` | 3×10⁸ m/s |

### Numbers Only
| Code | Result |
|------|--------|
| `\num{1234567}` | 1 234 567 |
| `\num{3.14159}` | 3,14159 |
| `\ang{45}` | 45° |

### Unit Only (in equations)
```latex
$v = 100\,\si{m/s}$
```

---

## 🔢 Math Shortcuts

### Derivatives
| Macro | Output |
|-------|--------|
| `\dd{y}{x}` | dy/dx |
| `\ddn{y}{x}{2}` | d²y/dx² |
| `\pd{f}{x}` | ∂f/∂x |
| `\pdn{f}{x}{2}` | ∂²f/∂x² |

### Differentials
`\dx`, `\dy`, `\dt`, `\dV` → for integrals

### Vectors & Matrices
| Macro | Output |
|-------|--------|
| `\vec{v}` | **v** (bold) |
| `\uvec{n}` | **n̂** (unit) |
| `\mat{A}` | **A** (matrix) |

### Number Sets
`\RR`, `\NN`, `\ZZ`, `\QQ`, `\CC` → ℝ, ℕ, ℤ, ℚ, ℂ

### Auto-scaling Brackets
| Macro | Output |
|-------|--------|
| `\abs{x}` | \|x\| |
| `\norm{v}` | ‖v‖ |
| `\paren{...}` | (...) |
| `\bracket{...}` | [...] |
| `\avg{x}` | ⟨x⟩ |

### Quick Fractions
`\half`, `\third`, `\quarter` → ½, ⅓, ¼

---

## 🔗 Cross-References (cleveref)

### Modern Method (Recommended)
```latex
\cref{fig:label}     % → figuur 1
\Cref{fig:label}     % → Figuur 1 (start of sentence)
\cref{eq:a,eq:b}     % → vergelijkingen (1) en (2)
```

### Legacy (backward compatible)
`\figref{}`, `\tabref{}`, `\eqnref{}`, `\secref{}`

---

## 🎨 Text Emphasis

| Macro | Output | Use For |
|-------|--------|---------|
| `\concept{text}` | Blue bold | New concepts |
| `\belangrijk{text}` | Red bold | Important items |
| `\keyterm{text}` | Blue accent | Key terms |

---

## 📊 Figures

```latex
\fig[width]{path}{caption}{label}     % Full control
\autofig[width]{path}{caption}        % Auto label
\img{path}{caption}                   % Simplest
```

---

## 📋 Tables

```latex
\begin{table}[H]
\centering
\caption{Title}
\begin{tabular}{lcc}
\toprule
\textbf{Col1} & \textbf{Col2} & \textbf{Col3} \\
\midrule
Data & \num{123} & \SI{45}{kg} \\
\bottomrule
\end{tabular}
\end{table}
```

---

## 📈 Plots (PGFPlots)

```latex
\begin{tikzpicture}
\begin{axis}[
    xlabel={$x$}, ylabel={$f(x)$},
    grid=major
]
\addplot[blue, thick, domain=0:4] {x^2};
\end{axis}
\end{tikzpicture}
```

---

## 📁 Modular Documents

For large projects, split into multiple files:

```
project/
├── main.tex
└── chapters/
    ├── chapter1.tex
    └── chapter2.tex
```

### main.tex
```latex
\documentclass[a4paper,11pt]{report}
\usepackage{school-macros}

\begin{document}
\include{chapters/chapter1}
\include{chapters/chapter2}

\appendix
\printsymbols
\printformularium
\end{document}
```

See `latex_templates/modular_document/` for complete example.

---

## 📚 Zotero / BibLaTeX Integration

school-macros includes BibLaTeX for Zotero integration.

### Setup
1. Install **Better BibTeX** in Zotero
2. Export collection as **Better BibLaTeX** to `references.bib`
3. Enable "Keep updated" for auto-sync

### In Document
```latex
\documentclass{article}
\usepackage{school-macros}
\addbibresource{references.bib}

\begin{document}
According to \cite{einstein1905}...
\printbibliography
\end{document}
```

### Citation Commands
| Code | Result |
|------|--------|
| `\cite{key}` | [1] |
| `\parencite{key}` | (Einstein, 1905) |
| `\textcite{key}` | Einstein (1905) |
| `\footcite{key}` | Footnote |

### Compile Order
```bash
pdflatex doc.tex && biber doc && pdflatex doc.tex && pdflatex doc.tex
# Or just: latexmk -pdf doc.tex
```

---

## 🛠️ Utility Macros

```latex
\TODO{text}     % Red TODO marker
\FIXME{text}    % Red FIXME marker  
\NOTE{text}     % Orange NOTE marker
\citeme         % Citation needed marker
```

---

## 🎓 KU Leuven Title Page

```latex
\kuleuventitle
    {Document Titel}
    {Vaknaam --- Vakcode}
    {Jouw Naam}
    {Academiejaar 2025-2026}
```

---

## ❌ Common Mistakes

| Wrong | Correct |
|-------|---------|
| `$$ E = mc^2 $$` | `\[ E = mc^2 \]` |
| `50 m/s` | `\SI{50}{m/s}` |
| `\bf text` | `\textbf{text}` |
| `$sin(x)$` | `$\sin(x)$` |
| `figuur 1` | `\cref{fig:label}` |
| `eqnarray` | `align` |

---

## ⚡ Workflow Tips

1. **Start with template**: Copy `new_document_template.tex`
2. **Define symbols early**: Use `\sym{}` at first mention
3. **Register formulas**: Use `\frm{}` for important equations
4. **Compile twice**: For formularium and references
5. **Use VS Code**: LaTeX Workshop extension auto-compiles on save

---

## 📚 Files in This Package

| File | Description |
|------|-------------|
| `school-macros.sty` | Main package (root = canonical) |
| `new_document_template.tex` | Clean starting point |
| `macro_usage_guide.tex` | Full tutorial (compile to see examples) |
| `modular_document/` | Multi-file document example |

---

**Version 2.0** — January 2026  
Compatible with pdfLaTeX, includes siunitx, cleveref, mathtools
