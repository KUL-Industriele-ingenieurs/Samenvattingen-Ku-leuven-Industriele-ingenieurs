# LaTeX Handleiding 📄

> Alles wat je nodig hebt om te beginnen met LaTeX voor dit project.

---

## 🛠️ Installatie

### Benodigde software

Open een terminal en voer de commando's uit voor jouw systeem:

**Windows** (PowerShell):

```powershell
winget install --id Microsoft.VisualStudioCode --id Git.Git --id MiKTeX.MiKTeX
```

### Officiële websites (downloads & info):

- 🌍 **VS Code:** [code.visualstudio.com](https://code.visualstudio.com/)
- 🌍 **Git:** [git-scm.com](https://git-scm.com/)
- 🌍 **Strawberry Perl:** [strawberryperl.com](https://strawberryperl.com/)
- 🌍 **MiKTeX:** [miktex.org](https://miktex.org/)

**macOS** (Terminal):

```bash
brew install --cask visual-studio-code mactex && brew install git perl
```

**Linux** (Ubuntu/Debian):

```bash
sudo apt install code git perl texlive-full
```

> ⚠️ **BELANGRIJK bij MiKTeX (Windows):** Kies tijdens de installatie bij **"Install missing packages on-the-fly"** voor **"Yes"**!
>
> 🔄 **Herstart je computer** nadat je alles hebt geïnstalleerd.

### VS Code extensies

Na het openen van het project in VS Code zal er rechtsonder gevraagd worden om de aanbevolen extensies te installeren. Klik op **Install**. De belangrijkste:

- **LaTeX Workshop** — Bouwt je PDF en toont live preview
- **LaTeX Utilities** — Afbeeldingen plakken, woordtelling
- **GitHub Pull Requests** — Issues en PRs beheren

---

## 📝 Hoe werk je met LaTeX?

### PDF bouwen en bekijken

| Actie          | Sneltoets        |
| -------------- | ---------------- |
| Build PDF      | `Ctrl + Alt + B` |
| View PDF       | `Ctrl + Alt + V` |
| Sync naar code | `Ctrl + Alt + J` |

> ⚠️ **Compileer altijd TWEEMAAL** voor correcte formularium en symbolenlijst!

---

## 📂 Templates

We hebben twee templates klaarstaan. Kopieer de juiste voor je document:

### Kort document (artikel)

📄 **[`latex_templates/Latex_template-kort-document.tex`](latex_templates/Latex_template-kort-document.tex)**

Gebruik voor: samenvattingen, oefenreeksen, korte documenten (5-30 pagina's).

```latex
\documentclass[a4paper,11pt]{article}
\usepackage{../school-macros}
```

Structuur: `\section` → `\subsection` → `\subsubsection`

### Lang document (rapport met hoofdstukken)

📄 **[`latex_templates/Latex_template-lang-document.tex`](latex_templates/Latex_template-lang-document.tex)**

Gebruik voor: thesis, grote samenvattingen, meerdere hoofdstukken (30+ pagina's).

```latex
\documentclass[a4paper,11pt]{report}
\usepackage{../school-macros}
```

Structuur: `\chapter` → `\section` → `\subsection`

Elk hoofdstuk zit in een apart bestand in de `chapters/` map:

```latex
\include{chapters/chapter1_inleiding}
\include{chapters/chapter2_theorie}
```

---

## 🎨 School-Macros (onze stijl)

Alle documenten gebruiken `school-macros.sty` — dit zorgt voor:

- **Professionele stijl**: Fira Sans (koppen) + Bitstream Charter (tekst) + Fira Mono (code)
- **Kleuren**: blauw, rood, groen, oranje thema
- **Box-omgevingen**: theorie, concepten, waarschuwingen, oefeningen
- **Formule-systeem**: automatisch formularium genereren
- **Symbolen-systeem**: automatisch symbolenlijst genereren

### Meest gebruikte commando's

```latex
% Boxes
\begin{theorie}[Titel]...\end{theorie}
\begin{conceptbox}[Titel]...\end{conceptbox}
\begin{waarschuwing}[Titel]...\end{waarschuwing}
\begin{oefenblok}[Oefening 1]...\end{oefenblok}
\begin{voorbeeld}[Titel]...\end{voorbeeld}

% Formules (worden automatisch verzameld in formularium)
\frm{Wet van Ohm}{U = I \cdot R}{$U$ = spanning, $I$ = stroomsterkte, $R$ = weerstand}

% Symbolen (eerste keer: uitleg — daarna: alleen symbool)
\sym{F}{Kracht}{N}

% Eenheden (altijd siunitx gebruiken!)
\SI{9.81}{m/s^2}

% Tekst-markers
\concept{belangrijke term}
\belangrijk{let op!}
\TODO{dit moet nog aangevuld}
```

> 📚 Uitgebreide referentie: **[MACRO_QUICK_REFERENCE.md](MACRO_QUICK_REFERENCE.md)**
>
> 📄 Volledige voorbeelden: **[`latex_templates/macro_usage_guide.tex`](latex_templates/macro_usage_guide.tex)**

---

## 🎬 Video

- 🎬 **[LaTeX voor Beginners](https://www.youtube.com/watch?v=UK8SMrS0G4Y)** – De basis van hoe je documenten schrijft.

---

## 🐛 Problemen?

- **PDF bouwt niet?** Kijk in **[Debugging-van-building.md](Debugging-van-building.md)**.
- **Hulp nodig?** Stuur een berichtje op de [Industria Discord](https://discord.gg/gsDzr5qhPe).
