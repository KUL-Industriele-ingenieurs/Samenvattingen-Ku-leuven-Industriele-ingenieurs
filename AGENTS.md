# AGENTS.md

## Purpose
Help AI coding agents be immediately productive in this LaTeX repository for engineering lecture notes, exercises, and summaries in Dutch.

## Quick Start - Build Commands
- **Build single file (preferred)**: `pdflatex -interaction=nonstopmode -file-line-error "<filename>.tex"` (run twice for cross-references)
- **Build with latexmk**: `latexmk -pdf "<filename>.tex"` (handles multi-pass automatically)
- **Build with minted**: `latexmk -pdf -pdflatex="pdflatex -shell-escape -interaction=nonstopmode -file-line-error" "<filename>.tex"`
- **VS Code task**: Use **Build LaTeX (Active File)** or **Build LaTeX (latexmk - active file)**
- **CI builds**: Automated via `.github/workflows/latex-build.yml`

## Entry Points (Where to Look First)
- **Math exercises**: `math-systems/MATHSYS-Oefeningen-RubenRyckaert.tex` — canonical source with macros
- **Thermal/fluids**: `Warmte en stromingen/Warmte en stromingen Samenvatting Ruben Ryckaert.tex` — uses `assets/` and symbol registration
- **Production tech**: `Productietechnologie/ProductieTechnologie-Samenvatting-RubenRyckaert.tex` — with formula helpers
- **Engineering & economics**: `Ingenieur en economie oefeningen/Ingenieur&economie-Samenvatting-RubenRyckaert.tex`
- **Template examples**: `latex_templates/template_examples.tex` — snippets for siunitx, tcolorbox, pgfplots, etc.

## Repository Conventions & Patterns
### Encoding and Language
- UTF-8 encoding: `\usepackage[utf8]{inputenc}`
- Dutch language: `\usepackage[dutch]{babel}`
- **Always write content in Dutch** - preserve language when editing

### Custom Styling Macros
- **Exercise/theory boxes**: `\begin{oefenblok}[Title]` and `\begin{theorieblok}[Title]`
- **Emphasis**: Use `\concept{}`, `\belangrijk{}`, `\important{}` for consistent formatting
- **Formulas**: `\frm{Label}{math}{notes}` — registers and displays formulas for formularium
- **Figures**: `\fig[width]{path}{caption}{label}` — quick helper for images

### Symbol Registration (Warmte en stromingen)
- Use `\symS{<symbol>}{<name>}{<unit>}` or `\symW{...}` to introduce symbols
- Displays explanation and registers entry for formularium
- Avoid duplicating symbol entries

### Asset Management
- Images under `<folder>/assets/` (e.g., `assets/slides/`, `assets/wikipedia/`)
- **Quote paths with spaces** in shell commands
- PDFs included via `\includepdf{...}` — treat as binary assets

### Filenames
- Many files contain spaces and diacritics (`Warmte en stromingen Samenvatting Ruben Ryckaert.tex`)
- **Always quote paths** in scripts and commands

## Content Writing Guidelines
- **Purpose**: Course summaries for engineering students learning or revising for exams
- **Language**: Clear, straightforward Dutch for technical education
- **Tone**: Didactic and accessible - assume reader knows nothing or needs refresher
- **Structure**: 
  - Start with basic concepts and definitions
  - Build up complexity gradually
  - Use concrete examples to illustrate abstract concepts
  - Include step-by-step explanations for procedures and calculations
- **Engineering Focus**: 
  - Emphasize practical applications and real-world relevance
  - Include worked examples with full calculations
  - Provide formulas with clear variable definitions
  - Use SI units consistently
- **Clarity**: 
  - Short, clear sentences
  - Define technical terms when first introduced
  - Use visual aids (diagrams, tables) to support text
  - Break complex topics into manageable subsections

## Code Style Guidelines
- **Packages**: Required: tikz, amsmath, amssymb, geometry, enumitem, hyperref
- **Custom macros**: 
  - Formulas: `\frm{Label}{math}{notes}` 
  - Figures: `\fig[width]{path}{caption}{label}`
  - Symbols: `\symS{symbol}{name}{unit}` or `\symW{...}`
- **Exercise boxes**: `\begin{oefenblok}[Title]` and `\begin{theorieblok}[Title]`
- **Asset paths**: Images under `assets/` subfolders, quote paths with spaces
- **Formularium**: Automatic collection via `\frm` macro, requires double compile

## Common Examples

### Add a Symbol (Thermal)
```tex
\symW{T}{Temperatuur}{K}
% Shows symbol box on first use and registers for formularium
```

### Add an Exercise
```tex
\begin{oefenblok}[Oefening 3.4]
Bereken de drukval in de buis bij ...
\end{oefenblok}
```

### Add a Figure
```tex
\begin{figure}[ht]
  \centering
  \includegraphics[width=0.8\linewidth]{assets/slides/measurement.png}
  \caption{Differentiële manometer — bron: slides}
  \label{fig:manometer}
\end{figure}
```

### Register a Formula
```tex
\frm{Bernoulli}{P + \frac{1}{2}\rho v^2 + \rho gh = \text{constant}}{Bernoulli's vergelijking}
```

## Troubleshooting & Best Practices
- **Always search problems**: Use playwright to search for LaTeX errors and solutions online
- **Best practices source**: Consult context7 and playwright for current LaTeX best practices
- **Common Errors**: 
  - **"Float(s) lost"**: Check for floats (figure/table) inside minipage, parbox, or footnote
  - **Missing references**: Run latexmk twice or use `latexmk -pdf` for auto-handling
  - **Package conflicts**: Check package load order in preamble

## Editing Guidelines & Safe Changes
- **Keep changes small**: Fix typos, add images, add exercises/examples, add symbols
- **Do not change**: Global packages or document class without testing all main files
- **New images**: Place under `assets/` with descriptive filenames
- **Test builds**: Compile both MATHSYS and Warmte files before committing

## Local Dev & VS Code
- **Auto-build**: Set to `onSave` — saving triggers build
- **Tasks available**: 
  - Build LaTeX (Active File)
  - Build LaTeX (latexmk - active file)
  - Build main PDFs (latexmk)
  - Build Warmte PDF (latexmk)
- **Image pasting**: LaTeX Utilities extension (`Ctrl+Shift+V`) — pastes and inserts `\includegraphics`

## CI & Automated Builds
- GitHub Actions workflow: `.github/workflows/latex-build.yml`
- Runs on push/PR to `main`/`master`
- Builds main documents with `latexmk`
- Uploads PDFs as artifact `built-pdfs`

## AI Agent Tips
- Use `latex_templates/template_examples.tex` for code snippets
- Add packages with `tlmgr install <package>`
- For `minted`, include `-shell-escape` in pdflatex command
- When adding templates, update `README.md`
- Use guarded package loads: `\IfFileExists{...}{...}{...}`

## Repository Limitations
- **Language-specific**: Content is in Dutch
- **Filenames**: Contain spaces — always quote in commands
- **Build twice**: For cross-references and formularium

## When in Doubt
- Run VS Code LaTeX build task
- Test on both MATHSYS and Warmte files
- Ask repository owner before major layout changes
