# School-Macros Quick Reference v4.0

> KU Leuven — Faculteit Industriële Ingenieurswetenschappen
> **Versie 4.0** (2026 Update)

## 🚀 Quick Start

```latex
\documentclass[a4paper,11pt]{article}
\usepackage{school-macros}

% Optioneel: Compact Mode voor één-pagina samenvattingen
% \enablecompactmode

\begin{document}
\kuleuventitle{Titel}{Vak}{Naam}{Datum}

\section{Inhoud}
\begintwocol
Links
\columnbreak
Rechts
\endtwocol

\appendix
\printsymbols
\printformularium
\end{document}
```

---

## 🎨 Box Environments

| Environment | Color | Icon | Gebruik |
|------------|-------|------|---------|
| `conceptbox` | Teal | 💡 | Definities |
| `theorieblok` | Blue | 📖 | Theorie & Stellingen |
| `oefenblok` | Green | ✒️ | Oefeningen |
| `voorbeeld` | Green | ✒️ | Praktijkvoorbeelden |
| `waarschuwing` | Red | ⚠️ | Belangrijke fouten |
| `theorembox` | DeepBlue | 📖 | Algemene stellingen (Vlak, strak) |

### Syntax
```latex
\begin{conceptbox}[title=Definitie]
Inhoud...
\end{conceptbox}
```

---

## 📐 Math Shortcuts (v4.0)

### Sets
`\N`, `\Z`, `\Q`, `\R`, `\C`, `\F` → ℕ, ℤ, ℚ, ℝ, ℂ, 𝔽

### Calculus (Physics Style)
| Macro | Output |
|-------|--------|
| `\dd{y}{x}` | dy/dx |
| `\ddn{y}{x}{2}` | d²y/dx² |
| `\pdv{f}{x}` | ∂f/∂x |
| `\pdv[2]{f}{x}` | ∂²f/∂x² |
| `\diff` | upright d |

### Operators
`\minimize`, `\maximize`, `\rank`, `\trace`

### Vectors & Matrices
| Macro | Output |
|-------|--------|
| `\vec{v}` | **v** (bold) |
| `\uvec{n}` | **n̂** (unit) |
| `\mat{1,2;3,4}` | Matrix (semicolon = row break) |
| `\norm{v}`, `\abs{x}` | Auto-scaling brackets |

---

## 🖼️ Layout & Figures (Nieuw)

### 2 Kolommen
```latex
\begintwocol
Tekst linkerkolom...
\columnbreak
Tekst rechterkolom...
\endtwocol
```

### Tekstomloop (Wrap Figure)
```latex
\wrapimg[0.4\linewidth]{plaatje.png}{Caption}
Tekst die naast de afbeelding loopt...
```

### Standaard Figuur
```latex
\fig[0.8\linewidth]{plaatje.png}{Caption}{label}
```

---

## 🔢 Units (siunitx)

| Code | Output |
|------|--------|
| `\SI{50}{km/h}` | 50 km/h |
| `\num{1.23e5}` | 1,23×10⁵ |
| `\si{m/s^2}` | m/s² |

**Pro Tip:** Gebruik altijd punt `.` in code (`1.5`), LaTeX maakt er een komma `,` van in de PDF.

---

## 🔗 Referenties

gebruik `\label{type:naam}` en verwijs er naar met:
- `\cref{type:naam}` → "figuur 1" (lowercase)
- `\Cref{type:naam}` → "Figuur 1" (sentence start)

---

## 📊 Plots (Engineering Style)

```latex
\begin{tikzpicture}
\begin{axis}[schoolEngineeringPlot, xlabel=$x$, ylabel=$y$]
    \addplot[blue] {x^2};
\end{axis}
\end{tikzpicture}
```
