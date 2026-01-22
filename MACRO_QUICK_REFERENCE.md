# LaTeX Quick Reference & School-Macros v4.0

> KU Leuven — Faculteit Industriële Ingenieurswetenschappen
> **Versie 4.0** (2026 Update)

## 📋 Inhoudsopgave

1. [Basis LaTeX Syntax](#-basis-latex-syntax)
2. [Tekstopmaak](#-tekstopmaak)
3. [Document Structuur](#-document-structuur)
4. [Speciale Tekens](#-speciale-tekens)
5. [Lijsten](#-lijsten)
6. [Wiskunde](#-wiskunde)
7. [Box Omgevingen](#-box-omgevingen)
8. [Formules & Symbolen](#-formules--symbolen)
9. [Figuren & Afbeeldingen](#-figuren--afbeeldingen)
10. [Tabellen](#-tabellen)
11. [VS Code Tips](#-vs-code-tips)

---

## 🚀 Quick Start

```latex
\documentclass[a4paper,11pt]{article}
\usepackage{school-macros}

% Optioneel: Compact Mode voor één-pagina samenvattingen
% \enablecompactmode

\title{Mijn Samenvatting}
\author{Jouw Naam}
\date{\today}

\begin{document}
\maketitle
\tableofcontents
\newpage

\section{Inleiding}
Hier begint je inhoud...

\appendix
\printsymbols
\printformularium
\end{document}
```

> ⚠️ **Belangrijk:** Compileer **tweemaal** voor correcte werking van formularium en symbolenlijst!

---

## ✏️ Basis LaTeX Syntax

### Nieuwe regels en alinea's

| Wat je wilt   | Hoe                | Voorbeeld                   |
| ------------- | ------------------ | --------------------------- |
| Nieuwe alinea | Lege regel in code | `Tekst...\n\nNieuwe alinea` |
| Harde enter   | `\\`               | `Regel 1\\Regel 2`          |
| Nieuwe pagina | `\newpage`         | `\newpage`                  |

### Commentaar

```latex
Dit komt in de PDF.
% Dit is commentaar, dit komt NIET in de PDF.
Hier gaat de tekst verder.
```

---

## 🎨 Tekstopmaak

| Effect              | Code                     | Resultaat    |
| ------------------- | ------------------------ | ------------ |
| **Vetgedrukt**      | `\textbf{tekst}`         | **tekst**    |
| _Cursief_           | `\textit{tekst}`         | _tekst_      |
| Onderstreept        | `\underline{tekst}`      | <u>tekst</u> |
| Nadruk              | `\emph{tekst}`           | _tekst_      |
| `Monospace`         | `\texttt{tekst}`         | `tekst`      |
| KLEINE HOOFDLETTERS | `\textsc{tekst}`         | Sᴍᴀʟʟ Cᴀᴘs   |
| Gekleurd            | `\textcolor{red}{tekst}` | 🔴 tekst     |

---

## 📚 Document Structuur

### Koppen (hiërarchie)

```latex
\chapter{Hoofdstuk}        % Alleen in report class
\section{Sectie}
\subsection{Subsectie}
\subsubsection{Subsubsectie}
\paragraph{Paragraaf}
```

### Document classes

| Class     | Gebruik                     | Hoogste niveau |
| --------- | --------------------------- | -------------- |
| `article` | Korte documenten (5-30 pag) | `\section{}`   |
| `report`  | Lange documenten (30+ pag)  | `\chapter{}`   |

---

## 🔣 Speciale Tekens

Deze tekens hebben speciale betekenis in LaTeX. Gebruik `\` ervoor:

| Teken | Code               |
| ----- | ------------------ |
| %     | `\%`               |
| $     | `\$`               |
| &     | `\&`               |
| \_    | `\_`               |
| #     | `\#`               |
| { }   | `\{ \}`            |
| ~     | `\textasciitilde`  |
| ^     | `\textasciicircum` |
| \     | `\textbackslash`   |

---

## 📝 Lijsten

### Ongeordend (bolletjes)

```latex
\begin{itemize}
    \item Eerste punt
    \item Tweede punt
\end{itemize}
```

### Geordend (nummers)

```latex
\begin{enumerate}
    \item Stap 1
    \item Stap 2
\end{enumerate}
```

### Beschrijvingen

```latex
\begin{description}
    \item[Term] Uitleg van de term
    \item[Ander] Andere uitleg
\end{description}
```

---

## 📐 Wiskunde

### Inline vs Display

| Type    | Code             | Gebruik                      |
| ------- | ---------------- | ---------------------------- |
| Inline  | `$E = mc^2$`     | In tekst: $E = mc^2$         |
| Display | `\[ E = mc^2 \]` | Op aparte regel, gecentreerd |

> ⚠️ Gebruik **nooit** `$$ ... $$` — dit is verouderd!

### Griekse letters

| Code       | Letter | Code     | Letter |
| ---------- | ------ | -------- | ------ |
| `\alpha`   | α      | `\beta`  | β      |
| `\gamma`   | γ      | `\delta` | δ      |
| `\epsilon` | ε      | `\theta` | θ      |
| `\lambda`  | λ      | `\mu`    | μ      |
| `\pi`      | π      | `\rho`   | ρ      |
| `\sigma`   | σ      | `\omega` | ω      |
| `\Delta`   | Δ      | `\Omega` | Ω      |

### Operatoren & Symbolen

| Beschrijving          | Code                | Symbool |
| --------------------- | ------------------- | ------- |
| Vermenigvuldigen      | `\times` of `\cdot` | × of ·  |
| Kleiner/groter gelijk | `\leq` / `\geq`     | ≤ / ≥   |
| Ongeveer              | `\approx`           | ≈       |
| Niet gelijk           | `\neq`              | ≠       |
| Oneindig              | `\infty`            | ∞       |
| Evenredig             | `\propto`           | ∝       |
| Nabla                 | `\nabla`            | ∇       |
| Partieel              | `\partial`          | ∂       |
| Som                   | `\sum`              | Σ       |
| Integraal             | `\int`              | ∫       |

### Pijlen

| Code                    | Symbool |
| ----------------------- | ------- |
| `\to` of `\rightarrow`  | →       |
| `\gets` of `\leftarrow` | ←       |
| `\leftrightarrow`       | ↔       |
| `\implies`              | ⟹       |
| `\iff`                  | ⟺       |
| `\Rightarrow`           | ⇒       |

### Verzamelingen (school-macros shortcuts)

| Code | Symbool                  |
| ---- | ------------------------ |
| `\N` | ℕ (Natuurlijke getallen) |
| `\Z` | ℤ (Gehele getallen)      |
| `\Q` | ℚ (Rationale getallen)   |
| `\R` | ℝ (Reële getallen)       |
| `\C` | ℂ (Complexe getallen)    |

### Afgeleiden (Physics Style)

| Macro           | Resultaat |
| --------------- | --------- |
| `\dd{y}{x}`     | dy/dx     |
| `\ddn{y}{x}{2}` | d²y/dx²   |
| `\pdv{f}{x}`    | ∂f/∂x     |
| `\pdv[2]{f}{x}` | ∂²f/∂x²   |

### Vectoren & Matrices

| Macro           | Resultaat               |
| --------------- | ----------------------- |
| `\vec{v}`       | **v** (bold)            |
| `\uvec{n}`      | **n̂** (eenheidsvector)  |
| `\mat{1,2;3,4}` | Matrix                  |
| `\abs{x}`       | \|x\| (absolute waarde) |
| `\norm{v}`      | ‖v‖ (norm)              |

### Breuken & Wortels

```latex
\frac{a}{b}       % breuk a/b
\sqrt{x}          % wortel
\sqrt[3]{x}       % derdemachtswortel
```

---

## 🎨 Box Omgevingen

### Overzicht

| Omgeving       | Kleur | Gebruik                    |
| -------------- | ----- | -------------------------- |
| `conceptbox`   | Teal  | Definities                 |
| `theorie`      | Blauw | Theorie & Stellingen       |
| `oefenblok`    | Groen | Oefeningen                 |
| `voorbeeld`    | Groen | Praktijkvoorbeelden        |
| `waarschuwing` | Rood  | Belangrijke waarschuwingen |
| `examenbox`    | Goud  | Examenstof                 |

### Syntax

```latex
\begin{conceptbox}[Titel]
Inhoud van de box...
\end{conceptbox}

% Of zonder titel:
\begin{theorie}
Inhoud...
\end{theorie}
```

---

## 🔢 Formules & Symbolen

### Formule met automatisch formularium

```latex
\frm{Kinetische Energie}{E_k = \frac{1}{2}mv^2}
    {met \sym{m}{massa}{\si{kg}} \sym{v}{snelheid}{\si{m/s}}}
```

### Symbool introduceren

```latex
\sym{F}{Kracht}{N}
```

Bij eerste gebruik: volledige uitleg. Daarna: alleen symbool.

---

## 🔬 Eenheden (siunitx)

**Gebruik altijd siunitx!** Nooit handmatig `m/s` typen.

| Code                      | Resultaat |
| ------------------------- | --------- |
| `\SI{50}{km/h}`           | 50 km/h   |
| `\SI{9.81}{m/s^2}`        | 9,81 m/s² |
| `\SI{20}{\degreeCelsius}` | 20 °C     |
| `\SI{3e8}{m/s}`           | 3×10⁸ m/s |
| `\num{1234567}`           | 1 234 567 |
| `\ang{45}`                | 45°       |

> 💡 **Tip:** Gebruik punt `.` in code (`1.5`), LaTeX maakt er een komma `,` van.

---

## 🖼️ Figuren & Afbeeldingen

### Snelle figuur

```latex
\fig[0.8\linewidth]{plaatje.png}{Onderschrift}{fig:label}
```

### Figuur zonder label

```latex
\autofig[0.5\linewidth]{afbeelding.png}{Onderschrift}
```

### Tekstomloop (wrap)

```latex
\wrapimg[0.4\linewidth]{afbeelding.png}{Onderschrift}
Hier komt tekst die naast de afbeelding loopt...
```

> ⚠️ Gebruik `\wrapimg` alleen met genoeg tekst, anders overlappen elementen!

---

## 📊 Tabellen

### Engineering tabel (met stijl)

```latex
\begin{table}[H]
\centering
\caption{Materiaaleigenschappen}
\begin{engtable}{colspec = {l c c}}
    Materiaal & Dichtheid & E-modulus \\
    Staal & 7850 & 210 \\
    Aluminium & 2700 & 70 \\
\end{engtable}
\end{table}
```

### Simpele tabel

```latex
\begin{tabular}{l c r}
\toprule
Links & Midden & Rechts \\
\midrule
A & B & C \\
\bottomrule
\end{tabular}
```

---

## 📈 Plots

### Engineering plot stijl

```latex
\begin{tikzpicture}
\begin{axis}[schoolEngineeringPlot, xlabel=$x$, ylabel=$y$]
    \addplot[blue, thick] {x^2};
    \addlegendentry{$f(x) = x^2$}
\end{axis}
\end{tikzpicture}
```

### Data uit CSV

```latex
\plotdata[xlabel={Tijd}, ylabel={Spanning}]
    {x=Time, y=Voltage}{data.csv}
```

---

## 🔗 Cross-References

```latex
\label{sec:intro}           % Label maken
\cref{sec:intro}            % "sectie 1" (lowercase)
\Cref{sec:intro}            % "Sectie 1" (start zin)
\cref{fig:label,tab:label}  % Meerdere referenties
```

---

## 📖 Bronvermelding (Zotero)

### Citeren

| Code                      | Resultaat        |
| ------------------------- | ---------------- |
| `\autocite{einstein1905}` | [Einstien, 1905] |
| `\textcite{knuth1984}`    | Knuth (1984)     |

### Setup

```latex
\addbibresource{references.bib}  % In preamble

\printbibliography               % Aan het einde
```

---

## 🛠️ Utility Macro's

### Workflow markers

```latex
\TODO{Dit moet nog worden aangevuld}
\FIXME{Dit is fout}
\NOTE{Notitie}
```

### Kolommen

```latex
\begintwocol
Linkerkolom tekst...
\columnbreak
Rechterkolom tekst...
\endtwocol
```

### KU Leuven Titelpagina

```latex
\kuleuventitle
    {Titel van het Document}
    {Vaknaam --- Vakcode}
    {Jouw Naam}
    {Academiejaar 2025-2026}
```

### Compact Mode

```latex
\enablecompactmode  % In preamble voor cheatsheets
```

---

## 💻 VS Code Tips

### Sneltoetsen

| Actie              | Sneltoets                      |
| ------------------ | ------------------------------ |
| Build PDF          | `Ctrl+Alt+B`                   |
| View PDF           | `Ctrl+Alt+V`                   |
| Sync PDF→LaTeX     | `Ctrl+Alt+J`                   |
| Afbeelding plakken | `Ctrl+Alt+V` (LaTeX Utilities) |

### Handige extensies

- **LaTeX Workshop** — Builder en previewer
- **LaTeX Utilities** — Image paste, word count
- **GitHub Pull Requests** — Issues en PRs

### Toolbar

Gebruik de toolbar rechtsboven voor snelle opmaak (bold, italic, etc.)

---

## ⚠️ Veelgemaakte Fouten

| ❌ Fout                  | ✅ Correct                              |
| ------------------------ | --------------------------------------- |
| `$$ E = mc^2 $$`         | `\[ E = mc^2 \]`                        |
| `50 m/s`                 | `\SI{50}{m/s}`                          |
| `\bf tekst`              | `\textbf{tekst}`                        |
| Punt als decimaal in PDF | Gebruik `.` in code, LaTeX doet de rest |

---

> 📚 Voor uitgebreide voorbeelden, zie `latex_templates/macro_usage_guide.tex`
