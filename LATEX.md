# LaTeX Handleiding

Hier vind je alles wat je nodig hebt om met LaTeX aan de slag te gaan voor de samenvattingen.

---

## Installatie

### Benodigde software

Open een terminal en installeer de nodige programma's voor jouw systeem:

**Windows** (PowerShell):

```powershell
winget install --id Microsoft.VisualStudioCode --id Git.Git --id MiKTeX.MiKTeX
```

Officiële websites voor meer info of handmatige downloads:

- **VS Code:** [code.visualstudio.com](https://code.visualstudio.com/)
- **Git:** [git-scm.com](https://git-scm.com/)
- **Strawberry Perl:** [strawberryperl.com](https://strawberryperl.com/)
- **MiKTeX:** [miktex.org](https://miktex.org/)

**macOS** (Terminal):

```bash
brew install --cask visual-studio-code mactex && brew install git perl
```

**Linux** (Ubuntu/Debian):

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

## Hoe werk je met LaTeX?

### PDF bouwen en bekijken

| Actie          | Sneltoets        |
| -------------- | ---------------- |
| Build PDF      | `Ctrl + Alt + B` |
| View PDF       | `Ctrl + Alt + V` |
| Sync naar code | `Ctrl + Alt + J` |

> **Let op:** Compileer altijd twee keer achter elkaar als je zeker wilt zijn dat je formularium en symbolenlijst up-to-date zijn.

---

## Templates

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

## School-Macros

Dit is voor latex de tempalate woorddoor je alle box-omgevingen hebt en de font en styling krijgt.

Je kunt de omgeving leren in de template [macro_usage_guide.tex](latex_templates/macro_usage_guide.tex)

---

## Video's

- **[LaTeX voor Beginners](https://www.youtube.com/watch?v=UK8SMrS0G4Y)** – De basis van documenten schrijven.

---

## Problemen?

- Als de PDF niet wil bouwen, bekijk dan even **[Debugging-van-building.md](Debugging-van-building.md)**.
- Kom je er echt niet uit? Vraag het op de [Industria Discord](https://discord.gg/gsDzr5qhPe).
