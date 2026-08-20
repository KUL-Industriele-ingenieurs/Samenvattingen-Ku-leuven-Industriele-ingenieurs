# LaTeX Handleiding

Hier vind je alles wat je nodig hebt om met LaTeX aan de slag te gaan voor de samenvattingen.

---

## <img src="https://api.iconify.design/material-symbols/install-desktop.svg?color=gray" height="20"> Installatie

### Benodigde software

Open een terminal en installeer de nodige programma's voor jouw systeem:

<img src="https://api.iconify.design/simple-icons/windows.svg?color=gray" height="14"> **Windows** (PowerShell):

```powershell
winget install --id Microsoft.VisualStudioCode --id Git.Git --id MiKTeX.MiKTeX
```

Officiële websites voor meer info of handmatige downloads:

- **VS Code:** [code.visualstudio.com](https://code.visualstudio.com/)
- **Git:** [git-scm.com](https://git-scm.com/)
- **Strawberry Perl:** [strawberryperl.com](https://strawberryperl.com/)
- **MiKTeX:** [miktex.org](https://miktex.org/)

<img src="https://api.iconify.design/simple-icons/apple.svg?color=gray" height="14"> **macOS** (Terminal):

```bash
brew install --cask visual-studio-code mactex && brew install git perl
```

<img src="https://api.iconify.design/simple-icons/linux.svg?color=gray" height="14"> **Linux** (Ubuntu/Debian):

```bash
sudo apt install code git perl texlive-full
```

> **Belangrijk bij MiKTeX op Windows:** Kies tijdens de installatie bij "Install missing packages on-the-fly" voor "Yes"! Anders moet je later steeds handmatig packages goedkeuren.
>
> **Herstart je computer** als je alles geïnstalleerd hebt.

### VS Code extensies

Als je het project in VS Code opent, zal het programma rechtsonder vragen om een paar aanbevolen extensies te installeren. Klik op **Install**. De belangrijkste zijn:

- **LaTeX Workshop** — Deze bouwt je PDF en zorgt voor de live preview.
- **LaTeX Utilities** — Handig om snel afbeeldingen te plakken en woorden te tellen.
- **GitHub Pull Requests** — Om issues en PRs direct in VS Code te regelen.

---

## <img src="https://api.iconify.design/material-symbols/rocket-launch-outline.svg?color=gray" height="20"> Hoe werk je met LaTeX?

### PDF bouwen en bekijken

| Actie          | Sneltoets        |
| -------------- | ---------------- |
| Build PDF      | `Ctrl + Alt + B` |
| View PDF       | `Ctrl + Alt + V` |
| Sync naar code | `Ctrl + Alt + J` |

> **Let op:** Compileer altijd twee keer achter elkaar als je zeker wilt zijn dat je formularium en symbolenlijst up-to-date zijn.

---

## <img src="https://api.iconify.design/material-symbols/keyboard-outline.svg?color=gray" height="20"> Snippets (Sneltoetsen)

Om sneller te kunnen typen in LaTeX, zijn er VS Code snippets toegevoegd aan deze repository. Typ het trefwoord en druk op `Tab` om het volledige blok in te voegen:

| Trefwoord   | Resultaat                             | Gebruik                                   |
| ----------- | ------------------------------------- | ----------------------------------------- |
| `todo`      | `\TODO{...}`                          | Voor taken die nog moeten gebeuren        |
| `oe` / `oe` | `\begin{oefening} ... \end{oefening}` | Een kader voor een oefening               |
| `frm`       | `\frm{Titel}{Formule}{Uitleg}`        | Een formule die in het overzicht komt     |
| `theorie`   | `\begin{theorie} ... \end{theorie}`   | Een blauw theoriekader                    |
| `voorbeeld` | `\begin{voorbeeld} ... \end{voorbeeld}` | Een groen voorbeeldkader                  |
| `fig`       | `\begin{figure} ... \end{figure}`     | Een afbeelding met caption en label       |
| `wrapfig`   | `\begin{wrapfigure} ... \end{wrapfigure}` | Een afbeelding waar tekst omheen vloeit   |
| `keyterm`   | `\keyterm{...}`                       | Belangrijke term in het blauw             |
| `bel`       | `\belangrijk{...}`                    | Belangrijke term in het rood              |

---

## <img src="https://api.iconify.design/material-symbols/description-outline.svg?color=gray" height="20"> Templates

We hebben al twee templates voor je klaargezet. Gebruik de juiste voor je vak:

### Kort document (artikel)

**[`latex_templates/Latex_template-kort-document.tex`](latex_templates/Latex_template-kort-document.tex)**

Ideaal voor gewone samenvattingen, korte documenten en oefeningen.

Hier gebruik je de structuur: `\section` → `\subsection` → `\subsubsection`

### Lang document (rapport met losse hoofdstukken)

**[`latex_templates/Latex_template-lang-document.tex`](latex_templates/Latex_template-lang-document.tex)**

Beter voor een thesis of samenvattingen van meer dan 30 pagina's, waarbij je bestanden wilt opsplitsen.

Structuur: `\chapter` → `\section` → `\subsection`

Ideaal is om elk hoofdstuk in een eigen bestand in de `chapters/` map te zetten, en ze in het hoofddocument op te roepen:

---

## <img src="https://api.iconify.design/material-symbols/code.svg?color=gray" height="20"> School-Macros

Dit is voor latex de tempalate woorddoor je alle box-omgevingen hebt en de font en styling krijgt.

Je kunt de omgeving leren in de template [macro_usage_guide.tex](latex_templates/macro_usage_guide.tex)

---

## <img src="https://api.iconify.design/material-symbols/smart-display-outline.svg?color=gray" height="20"> Video's

- **[LaTeX voor Beginners](https://www.youtube.com/watch?v=UK8SMrS0G4Y)** – De basis van documenten schrijven.

---

## <img src="https://api.iconify.design/material-symbols/help-outline.svg?color=gray" height="20"> Problemen?

- Als de PDF niet wil bouwen, bekijk dan even **[Debugging-van-building.md](Debugging-van-building.md)**.
- Kom je er echt niet uit? Vraag het op de [Industria Discord](https://discord.gg/gsDzr5qhPe).
