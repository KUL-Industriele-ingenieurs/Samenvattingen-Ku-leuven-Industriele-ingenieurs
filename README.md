# School LaTeX Documents 🎓

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
![Language](https://img.shields.io/badge/Made%20with-LaTeX-47545E?logo=latex&logoColor=white)
[![Discord](https://img.shields.io/badge/Discord-Join%20Server-5865F2?logo=discord&logoColor=white)](https://discord.gg/gsDzr5qhPe)
![VS Code](https://img.shields.io/badge/Editor-VS%20Code-007ACC?logo=visualstudiocode&logoColor=white)
![Git](https://img.shields.io/badge/Tool-Git-F05032?logo=git&logoColor=white)

Welkom bij de samenvattingen voor Industriële Ingenieurswetenschappen aan de KU Leuven!

Deze repository is een **gezamenlijk project** waar studenten professionele samenvattingen maken die iedereen kan gebruiken. Jouw bijdrage - groot of klein - helpt medestudenten enorm. Bedankt dat je hier bent! 🙌

---

## Alle Auteurs (voeg je naam toe)

- **Ruben Ryckaert**

## 👋 Nieuw hier? Start hier!

**Nog nooit met Git of LaTeX gewerkt? Geen probleem!** Deze guide neemt je stap voor stap mee. Volg gewoon de instructies hieronder en je bent zo aan de slag.

Heb je vragen of loop je vast? Stuur gerust een berichtje naar **@eggmansmile** op Discord. Wil je graag vaker meewerken en collaborator worden (dit geef je write acces zodat je niet een fork moet bijhouden en je wijzigingen van andere kunt nakijken)? Laat het me weten! We kunnen altijd extra hulp gebruiken.
Join de industria discord waar je me zoiezo vindt. https://discord.gg/gsDzr5qhPe.
Deze documenten gaan je niet de garantie geven voor een goed examenresultaat. Ze zijn bedoeld als hulpmiddel bij je studie. Gebruik ze verstandig en combineer ze met andere studiematerialen.

- Studforum Cloud — examenvragen en samenvattingen (inloggen vereist): [Open Studforum Cloud](https://cloud.studforum.net/apps/files/?dir=/&fileid=857448)
- Studforum Wiki — aanvullende samenvattingen en bronnen en info over de vakken: [Open Studforum Wiki](https://wiki.studforum.net/start)

---

## 📋 Inhoudsopgave

1. [Installatie (lokaal)](#-stap-1-installatie-lokaal)
2. [Codespaces (geen installatie)](#-alternatief-github-codespaces)
3. [Project opzetten](#-stap-2-project-opzetten)
4. [Dagelijkse workflow](#-stap-3-dagelijkse-workflow)
5. [Issues & Feedback](#-issues--feedback)
6. [Debugging](#-debugging)
7. [VS Code Tasks](#-vs-code-tasks)
8. [Hulpbronnen](#-hulpbronnen)

---

## 🛠️ Stap 1: Installatie (lokaal)

> **Ongeveer 10-15 minuten** – volg deze stappen voor een volledig werkende setup.

### 1.1 Benodigde software

| #   | Software            | Download                                                | Opmerking             |
| --- | ------------------- | ------------------------------------------------------- | --------------------- |
| 1   | **VS Code**         | [code.visualstudio.com](https://code.visualstudio.com/) | Kies Windows versie   |
| 2   | **Git**             | [git-scm.com/downloads](https://git-scm.com/downloads)  | Klik overal op "Next" |
| 3   | **Strawberry Perl** | [strawberryperl.com](https://strawberryperl.com/)       | "Recommended" versie  |
| 4   | **MiKTeX**          | [miktex.org/download](https://miktex.org/download)      | Basic Installer       |

> ⚠️ **BELANGRIJK bij MiKTeX:** Zet **"Install missing packages on-the-fly"** op **"Yes"**!

### 1.2 Herstart nodig 🔄

Na installatie: **herstart je computer** zodat Windows de programma's herkent.

### 1.3 Git hooks (automatisch)

> ✅ **Geen actie nodig!** Git hooks worden automatisch geconfigureerd wanneer je de folder opent in VS Code. Dit zorgt dat gegenereerde PDFs niet per ongeluk worden gecommit.

---

## ☁️ Alternatief: GitHub Codespaces

**Geen installatie nodig!** Werk direct in je browser.

1. Maak eerst een **Fork** (zie Stap 2.1)
2. Ga naar jouw fork op GitHub
3. Klik op groene knop **<> Code** → tabblad **Codespaces**
4. Klik **Create codespace on main**

Je krijgt een volledige VS Code omgeving in je browser.

---

## ✨ Nieuw: Typst (Het moderne alternatief)

Naast LaTeX ondersteunen we nu ook **Typst**! 
Typst is sneller, makkelijker te leren en je hebt **geen zware installatie** nodig.

### Hoe begin je met Typst?

1.  Installeer de **[Tinymist](https://marketplace.visualstudio.com/items?itemName=myriad-dreamin.tinymist)** extensie in VS Code.
2.  Ga naar de map `typst_templates`.
3.  Open `main.typ` en begin met typen!
4.  Druk op het "Preview" knopje rechtsboven (oogje) om direct het resultaat te zien.

> **Waarom Typst?** De code is veel leesbaarder en je ziet je wijzigingen direct (live preview). Probeer het eens!

---

## 📥 Stap 2: Project opzetten

### 2.1 Maak een Fork

1. Ga naar de [originele repository](https://github.com/KUL-Industriele-ingenieurs/Samenvattingen-Ku-leuven-Industriele-ingenieurs)
2. Klik rechtsboven op **Fork** → **Create Fork**

### 2.2 Clone naar je PC

_Sla over bij Codespaces_

```bash
# In VS Code terminal (Ctrl + `)
git clone https://github.com/JOUW-GEBRUIKERSNAAM/Samenvattingen-Ku-leuven-Industriele-ingenieurs.git
```

Open daarna de map via _File > Open Folder_.

### 2.3 Link naar origineel (upstream)

```bash
git remote add upstream https://github.com/KUL-Industriele-ingenieurs/Samenvattingen-Ku-leuven-Industriele-ingenieurs.git
```

### 2.4 Extensies installeren

VS Code vraagt automatisch om aanbevolen extensies → Klik **Install**.

**Belangrijkste extensies:**

- **LaTeX Workshop** – PDF bouwen en bekijken
- **GitHub Pull Requests and Issues** – Issues en PRs beheren

---

## 🔄 Stap 3: Dagelijkse workflow

```
┌─────────────────────────────────────────────────────────┐
│  1. Sync/Pull     →  Klik ↻ Sync in Source Control      │
│  2. Nieuwe branch →  Klik branch naam → Create branch   │
│  3. Bewerken      →  Pas .tex bestanden aan             │
│  4. Build PDF     →  Ctrl+Alt+B                         │
│  5. Commit        →  Source Control → + → Commit        │
│  6. Push          →  Sync knop of Publish Branch        │
│  7. Pull Request  →  GitHub paneel → Create PR          │
└─────────────────────────────────────────────────────────┘
```

### Sync/Update

- **GitHub:** Jouw fork → **Sync Fork** → **Update branch**
- **VS Code:** Klik op **↻ Sync** icoontje bij Source Control

### Branch maken

1. Klik op de **branch naam** linksonder (bijv. `main`)
2. Kies **Create new branch...**
3. Typ een naam zoals `vaknaam-hoofdstuk-x`
4. Klaar! Je werkt nu in je eigen branch

> ⚠️ Werk **nooit** direct in `main`!

### PDF bouwen & bekijken

- **Bouwen:** `Ctrl+Alt+B` of groene ▶️ knop
- **Bekijken:** `Ctrl+Alt+V` of PDF icoontje

Zie **[Debugging-van-building.md](Debugging-van-building.md)** bij problemen.

### Pull Request maken

Na je commit en push, maak je een Pull Request (PR) om je wijzigingen voor te stellen:

1. Ga naar GitHub (je fork of originele repo)
2. Klik op **Compare & pull request** (gele balk)
3. **⚠️ BELANGRIJK:** Controleer de instellingen bovenaan:

```
base repository: Eggmansmile/Samenvattingen...  ← MOET dit zijn!
base: main

head repository: JouwNaam/Samenvattingen...     ← Jouw fork
compare: jouw-branch-naam
```

4. Schrijf een korte beschrijving van je wijzigingen
5. Klik **Create Pull Request**

> ⚠️ Als `base repository` op je **eigen** fork staat, gaat de PR naar jezelf in plaats van naar het originele project!

---

## 🐛 Issues & Feedback

### Issues maken via GitHub

1. Ga naar **Issues** tab
2. Klik **New Issue**
3. Beschrijf het probleem of voorstel

### Issues maken via code

Voeg een comment toe in je `.tex` bestand:

```latex
% @issue: Hier mist uitleg over formule X
% TODO: Afbeelding toevoegen
% FIXME: Fout in berekening
```

De 💡 lightbulb verschijnt → klik om direct een GitHub issue aan te maken.

Meer details: **[Hoe-voeg-je-issues-toe.md](Hoe-voeg-je-issues-toe.md)**

---

## 🔧 Debugging

### Build faalt?

1. **Output bekijken:** View → Output → "LaTeX Workshop"
2. **Clean build:** Command Palette (`Ctrl+Shift+P`) → `LaTeX Workshop: Clean up auxiliary files`
3. **Opnieuw bouwen**

### Veelvoorkomende problemen

| Probleem           | Oplossing                                                   |
| ------------------ | ----------------------------------------------------------- |
| Package mist       | MiKTeX installeert automatisch (als "on-the-fly" aan staat) |
| pdflatex not found | Herstart PC of check PATH                                   |
| Merge conflicts    | Kies "Accept Current" of "Accept Incoming" in VS Code       |

Uitgebreide hulp: **[Debugging-van-building.md](Debugging-van-building.md)**

---

## ⚡ VS Code Tasks

Handige taken beschikbaar via `Ctrl+Shift+P` → **Tasks: Run Task**:

| Task                     | Beschrijving                                        |
| ------------------------ | --------------------------------------------------- |
| Clean LaTeX aux files    | Verwijdert alle .aux, .log, .toc, etc. bestanden    |
| Update school-macros.sty | Kopieert macros naar alle mappen met .tex bestanden |

> 💡 **Tip:** Git hooks worden automatisch ingesteld bij folder open.

---

## 🌐 Git & GitHub in VS Code

De **GitHub Pull Requests and Issues** extensie laat je alles beheren zonder de website:

### Issues bekijken en oppakken

1. Open de **GitHub** sidebar (links, GitHub logo)
2. Onder **Issues** zie je alle open taken
3. Rechtsklik op een issue → **Start Working on Issue**
    - VS Code maakt automatisch een branch aan
    - De branch naam bevat het issue nummer

### Aan een issue werken

```
┌─────────────────────────────────────────────────────────┐
│  1. Start Working on Issue  →  Branch wordt aangemaakt  │
│  2. Maak je wijzigingen     →  Bewerk .tex bestanden    │
│  3. Commit & Push           →  Source Control → Sync    │
│  4. Create Pull Request     →  Knop verschijnt vanzelf  │
└─────────────────────────────────────────────────────────┘
```

### Pull Requests reviewen

Onder **Pull Requests** in de sidebar zie je:

- **Waiting For My Review** – PRs die op jouw review wachten
- **Assigned To Me** – PRs aan jou toegewezen
- **Created By Me** – Jouw eigen PRs

Klik op een PR om de wijzigingen direct in VS Code te bekijken en te reviewen.

### Quick Reference

| Actie           | Hoe                                   |
| --------------- | ------------------------------------- |
| Branch wisselen | Klik op branch naam linksonder        |
| Nieuwe branch   | Branch naam → Create new branch       |
| Commit          | Source Control → + → Type bericht → ✓ |
| Push/Pull       | 3 puntjes → Push/Pull/Sync            |
| Pull Request    | GitHub paneel → Create Pull Request   |
| Issues bekijken | GitHub paneel in sidebar              |

### Sneltoetsen

```
Ctrl+Shift+G    Source Control openen
Ctrl+Shift+P    Command Palette (alle commands)
Ctrl+`          Terminal openen
```

Uitgebreide handleiding: **[Remote-Repos.md](Remote-Repos.md)**

---

## 📚 Hulpbronnen

| Document                                                   | Beschrijving                             |
| ---------------------------------------------------------- | ---------------------------------------- |
| **[MACRO_QUICK_REFERENCE.md](MACRO_QUICK_REFERENCE.md)**   | LaTeX commando's voor kaders en formules |
| **[Debugging-van-building.md](Debugging-van-building.md)** | Hulp bij PDF build errors                |
| **[Hoe-voeg-je-issues-toe.md](Hoe-voeg-je-issues-toe.md)** | Issues aanmaken via code                 |
| **[Remote-Repos.md](Remote-Repos.md)**                     | Git & GitHub in VS Code                  |

### Contact

- **Discord:** [Industria server](https://discord.gg/gsDzr5qhPe) – contacteer **@eggmansmile**
- **Issues tab:** Stel je vraag op GitHub

---

Bedankt voor je bijdrage! Samen maken we de beste samenvattingen. 🚀
