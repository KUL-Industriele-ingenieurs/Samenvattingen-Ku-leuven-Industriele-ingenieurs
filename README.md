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

Heb je vragen of loop je vast? Stuur gerust een berichtje naar **@eggmansmile** op Discord. Wil je graag vaker meewerken en collaborator worden? Laat het me weten! We kunnen altijd extra hulp gebruiken.
Join de industria discord waar je me zoiezo vindt. https://discord.gg/gsDzr5qhPe. Als je collabirator wilt worden (Je bekijkt af en toe eens veranderingen en kijkt of pull requests goed zijn) stuur me dan ook iets.

Deze documenten gaan je niet de garantie geven voor een goed examenresultaat. Ze zijn bedoeld als hulpmiddel bij je studie. Gebruik ze verstandig en combineer ze met andere studiematerialen.
- Studforum Cloud — examenvragen en samenvattingen (inloggen vereist): [Open Studforum Cloud](https://cloud.studforum.net/apps/files/?dir=/&fileid=857448)  
- Studforum Wiki — aanvullende samenvattingen en bronnen en info over de vakken: [Open Studforum Wiki](https://wiki.studforum.net/start)

---

## 🛠️ Hoe draag ik bij? (Voor iedereen)

Omdat je (standaard) geen schrijfrechten hebt op deze repository, werk je via een **Fork**. Dit is jouw eigen kopie van het project waar je veilig kunt experimenteren.

**Het proces in het kort:**
1.  **Fork** dit project.
2.  **Installeer** de software (of gebruik Codespaces).
3.  **Branch** & **Edit** in jouw eigen versie.
4.  **Pull Request** naar ons originele project.

---

## 🚀 Stap 1: Installatie (Aangeraden)

Om optimaal te werken, raden we aan om alles lokaal op je eigen laptop te installeren. Volg deze stappen nauwkeurig, dan ben je in 10-15 minuten klaar.

### 1. Visual Studio Code (De Editor)
Hierin ga je typen en je PDF's bekijken.
1.  Ga naar [code.visualstudio.com](https://code.visualstudio.com/).
2.  Download de **Windows** versie en installeer het.

### 2. Git (Versiebeheer)
Dit programma houdt alle wijzigingen bij en zorgt dat je kunt samenwerken.
1.  Ga naar [git-scm.com/downloads](https://git-scm.com/downloads).
2.  Download **"Click here to download"** voor Windows en installeer het (je mag bij alle schermen op **"Next"** klikken).

### 3. Strawberry Perl (Nodig voor de achtergrond)
Onze tools hebben Perl nodig om alles correct te laten werken op de achtergrond.
1.  Ga naar [strawberryperl.com](https://strawberryperl.com/) en installeer de "Recommended" versie.

### 4. MiKTeX (De LaTeX Motor)
Dit is de motor die jouw code omzet naar een mooie PDF.
1.  Ga naar [miktex.org/download](https://miktex.org/download) en download de **Basic Installer**.
2.  **⚠️ ZEER BELANGRIJK:** Zet tijdens de installatie **"Install missing packages on-the-fly"** op **"Yes"**. 

### 5. Herstart je computer 🔄
Windows moet even weten dat al deze nieuwe programma's bestaan.

---

## ☁️ Alternatief: GitHub Codespaces (Geen installatie)

Wil je **niets installeren** of ben je op een andere computer? Gebruik dan de online versie in je browser.
1.  Volg Stap 2 (Forken) hieronder.
2.  Op de pagina van **JOUW fork**: Klik op de groene knop **<> Code**.
3.  Ga naar tabblad **Codespaces** en klik op **Create codespace on main**.

---

## 📥 Stap 2: Het project opzetten

### 1. Maak een Fork (Op GitHub)
Klik rechtsboven op de knop **Fork** en dan op **Create Fork**. Nu heb je je eigen kopie van de samenvattingen op jouw profiel.

### 2. Clone JOUW Fork (Op je PC)
*Sla dit over als je Codespaces gebruikt.*
1.  Open **Visual Studio Code**.
2.  Open een Terminal (`Ctrl + ``).
3.  Typ het volgende commando (vervang 'JouwNaam' door jouw GitHub gebruikersnaam!):
    ```bash
    git clone https://github.com/JouwNaam/Samenvattingen-Ku-leuven-Industriele-ingenieurs.git
    ```
4.  Ga via *File > Open Folder* naar de gedownloade map.

### 3. Link naar het originele project (Upstream)
Typ in de VS Code terminal om updates te kunnen ontvangen:
```bash
git remote add upstream https://github.com/Eggmansmile/Samenvattingen-Ku-leuven-Industriele-ingenieurs.git
```

### 4. Extensies
VS Code vraagt rechtsonder om aanbevolen extensies te installeren -> Klik **Install**. (Vooral **LaTeX Workshop** is nodig).

---

## 🔄 Stap 3: Je dagelijkse workflow

### 1. Zorg dat je up-to-date bent (Sync)
*   **Via GitHub:** Ga naar jouw fork, klik **Sync Fork** > **Update branch**.
*   **In VS Code:** Klik op het **Sync** icoontje (cirkelpijltjes) bij Source Control (links).

### 2. Maak een nieuwe Branch
Werk nooit direct in `main`. Maak een tak voor jouw taak:
```bash
git checkout main
git checkout -b vaknaam-hoofdstuk-x
```

### 3. Bewerken & Testen
Open de `.tex` bestanden en pas aan.
*   **Bouw PDF:** Klik op de groene ▶️ knop rechtsboven (`Ctrl+Alt+B`).
*   **Bekijk PDF:** Klik op het PDF icoontje (`Ctrl+Alt+V`).

### 4. Opslaan & Uploaden
1.  Ga naar **Source Control** (links).
2.  Klik op **+** bij je bestanden, typ een bericht en klik op **Commit**.
3.  Klik op **Publish Branch** (of de Sync knop) om het naar GitHub te sturen.

### 5. Maak een Pull Request (PR)
1.  Ga naar de **originele repository** (deze pagina).
2.  Klik op de gele balk **Compare & pull request**.
4.  Klik op **Create Pull Request**.

---

## Hoe voeg je issues toe?

Op github kun je issues toevoegen of verbeteringen voorstellen.
Je kunt ook in de code issues toevoegen door % @TODO of @issue: ...

Bekijk **[Hoe-voeg-je-issues-toe.md](Hoe-voeg-je-issues-toe.md)** voor meer info.

## 📚 Hulpbronnen & Hulp

*   **[MACRO_QUICK_REFERENCE.md](MACRO_QUICK_REFERENCE.md)**: Alle LaTeX commando's voor kaders en formules.
*   **[Debugging-van-building.md](Debugging-van-building.md)**: Hulp bij PDF errors.
*   **Issues tab:** Stel je vraag hier op GitHub.
*   **Discord:** Contacteer **@eggmansmile**.

Bedankt voor je bijdrage! Samen maken we de beste samenvattingen. 🚀
