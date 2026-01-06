# School-Macros Quick Reference

## 📦 Box Macros

### Exam Tips
```latex
\begin{examenbox}
Korte examentip zonder titel parameter
\end{examenbox}
```

### Concept Definitions
```latex
\begin{conceptbox}[title=Definitie]
Uitleg van een belangrijk concept.
Grijze achtergrond met blauwe accent links.
\end{conceptbox}
```

### Warnings
```latex
\begin{warningbox}
Zonder titel parameter (geen titel-balk)
\end{warningbox}

\begin{warningbox}[title=Custom]
Met aangepaste titel
\end{warningbox}
```

### Exercises
```latex
\begin{oefenblok}
Zonder titel parameter (geen titel-balk)
\end{oefenblok}

\begin{oefenblok}[title=Custom Oefening]
Met aangepaste titel (net als conceptbox)
\end{oefenblok}
```

## 📐 Formulas

### Formula Box (auto-formularium)
```latex
\frm{Label}{math}{notes}
```
Voegt automatisch toe aan formularium.

### Boxed Equation
```latex
\[ \boxed{E = mc^2} \]
\[ \eqbox{F = ma} \]
```

## 🔢 Math Shortcuts

### Derivatives
- `\dd{y}{x}` → dy/dx
- `\ddn{y}{x}{2}` → d²y/dx²
- `\pd{f}{x}` → ∂f/∂x  
- `\pdn{f}{x}{2}` → ∂²f/∂x²
- `\dx, \dy, \dt, \dv` → Differential elements

### Vectors & Matrices
- `\vec{v}` → **v** (bold vector)
- `\uvec{n}` → **n̂** (unit vector)
- `\mat{A}` → **A** (matrix)

### Brackets (auto-scaling)
- `\abs{x}` → |x|
- `\norm{v}` → ‖v‖
- `\paren{...}` → (...)
- `\bracket{...}` → [...]
- `\curlybrace{...}` → {...}
- `\avg{x}` → ⟨x⟩

### Quick Fractions
- `\half, \third, \quarter` → ½, ⅓, ¼
- `\ifrac{1}{3}` → 1/3 (inline text)

### Number Sets
- `\RR, \NN, \ZZ, \QQ, \CC` → ℝ, ℕ, ℤ, ℚ, ℂ

## 🎨 Text Emphasis
- `\concept{text}` → Blue bold (new concepts)
- `\belangrijk{text}` → Red bold (important items)
- `\keyterm{text}` → Blue accent (key terms)

## 📊 Figures
```latex
\fig[width]{path}{caption}{label}
\autofig[width]{path}{caption}  % auto-label
\img{path}{caption}             % simplest
```

## 🔤 Symbols
```latex
\sym{v_c}{Snijsnelheid}{m/min}
```
First use: shows full explanation box  
Later: just the symbol

## 🔗 Cross-References (Dutch)
- `\eqnref{eq:label}` / `\Eqnref{eq:label}` → vergelijking (1)
- `\figref{fig:label}` / `\Figref{fig:label}` → figuur 1
- `\tabref{tab:label}` / `\Tabref{tab:label}` → tabel 1
- `\secref{sec:label}` / `\Secref{sec:label}` → sectie 1.2

## 🛠️ Utility
- `\TODO{text}` → Red TODO marker
- `\FIXME{text}` → Red FIXME marker
- `\NOTE{text}` → Orange NOTE marker
- `\degree` → ° (degree symbol)

## 📋 Lists

### Bullet List
```latex
\begin{itemize}
    \item First
    \item Second
\end{itemize}
```

### Numbered List
```latex
\begin{enumerate}
    \item First
    \item Second
\end{enumerate}
```

### Description List
```latex
\begin{description}
    \item[Term] Definition
    \item[Another] Description
\end{description}
```

## 📊 Tables

### Standard Table
```latex
\begin{table}[H]
\centering
\caption{Title}
\begin{tabular}{lcc}
\toprule
\textbf{Col1} & \textbf{Col2} & \textbf{Col3} \\
\midrule
Data & Data & Data \\
\bottomrule
\end{tabular}
\end{table}
```

### Full-width with Text Wrap
```latex
\begin{tabularx}{\linewidth}{l X}
\toprule
\textbf{Term} & \textbf{Long text wraps automatically} \\
\midrule
... & ... \\
\bottomrule
\end{tabularx}
```

## 📈 Graphs (TikZ/PGFPlots)

### Function Plot
```latex
\begin{tikzpicture}
\begin{axis}[xlabel={$x$}, ylabel={$f(x)$}, grid=major]
\addplot[blue, thick, domain=0:4] {x^2};
\addlegendentry{$f(x) = x^2$}
\end{axis}
\end{tikzpicture}
```

### Data Plot
```latex
\begin{axis}[...]
\addplot[mark=*] coordinates {
    (0,0) (1,2) (2,4) (3,6)
};
\end{axis}
```

## 📄 Document Template

```latex
\documentclass[a4paper,11pt]{article}
\usepackage{school-macros}

\title{Document Title}
\author{Your Name}
\date{\today}

\begin{document}
\maketitle
\tableofcontents
\newpage

\section{Introduction}
% Content here

\appendix
\printsymbols
\printformularium
\end{document}
```

## ⚡ Workflow Tips

1. **Compile twice** for formularium & symbol list
2. Use `\frm` for all important formulas
3. Use `\sym` at first mention of symbols
4. Check `macro_usage_guide.tex` for complete examples
5. Use `new_document_template.tex` as starting point
\end{axis}
\end{tikzpicture}
```

### Data Plot
```latex
\begin{tikzpicture}
\begin{axis}[
    xlabel={Time [s]},
    ylabel={Speed [m/s]}
]
\addplot[mark=*, blue] coordinates {
    (0,0) (1,2) (2,4) (3,6)
};
\end{axis}
\end{tikzpicture}
```

### Simple Diagram
```latex
\begin{tikzpicture}
\draw[thick] (0,0) rectangle (2,1);
\draw[thick, fill=blue!20] (3,0.5) circle (0.5);
\draw[->, thick] (2,0.5) -- (2.5,0.5);
\end{tikzpicture}
```

## 🎯 Typical Workflow

```latex
\documentclass[a4paper,11pt]{report}
\usepackage{school-macros}
\usepackage{siunitx}

\begin{document}

\chapter{Chapter Title}

\frm{Energy}{E = mc^2}{Energy-mass equivalence}
\sym{v}{Velocity}{m/s}

\begin{examenbox}
Important exam tip...
\end{examenbox}

\begin{oefenblok}
Exercise content...
\end{oefenblok}

\appendix
\printsymbols
\printformularium

\end{document}
```

## ⚡ Remember
1. **Compile twice** for formularium and symbol list
2. Use `\frm` for all important formulas
3. Use `\sym` on first mention of symbols
4. Always use `\SI{value}{unit}` for units

---
**That's it! Simple, clean, effective.**
