# School LaTeX Documents 🎓

Welkom bij de samenvattingen voor Industriële Ingenieurswetenschappen aan de KU Leuven! 

Dit is een **open-source project** door en voor studenten. Iedereen kan deze samenvattingen gebruiken en verbeteren. Samen zorgen we voor betere studiematerialen! 🙌

---

## 🤝 Wil je direct meewerken? (Collaborator worden)

Standaard moet je een "omweg" gebruiken (forken) om iets aan te passen. Wil je echter vaker helpen, branches direct in dit project aanmaken en Pull Requests reviewen?

**Word Collaborator!** 🚀
Stuur een berichtje naar **@eggmansmile** op Discord of join de **Industria Discord** (https://discord.gg/gsDzr5qhPe). We voegen je graag toe aan het team!

---

## 🛠️ Hoe draag ik bij? (Voor iedereen)

Omdat je (nog) geen schrijfrechten hebt op deze repository, werk je via een **Fork**. Dit is jouw eigen kopie van het project waar je alles mee mag doen wat je wilt.

### Het "Forking" Proces in het kort:
1.  **Fork** dit project (maak een kopie op jouw account).
2.  **Clone** jouw fork naar je computer.
3.  **Branch** & **Edit** in jouw eigen versie.
4.  **Push** naar jouw fork.
5.  **Pull Request** naar ons originele project.

Hieronder leggen we dit stap voor stap uit! 👇

---

## 🚀 Stap 1: Setup (Eenmalig)

### 1. Maak een Fork
Klik rechtsboven op deze pagina op de knop **Fork**.
*GitHub maakt nu een exacte kopie van dit project onder jouw eigen naam (bijv. `JouwNaam/Samenvattingen...`).*

### 2. Installeer de nodige software
Heb je dit al? Sla dit over.
*   **Visual Studio Code:** [Download](https://code.visualstudio.com/)
*   **Git:** [Download](https://git-scm.com/downloads)
*   **LaTeX (MiKTeX):** [Download](https://miktex.org/download) (Kies "Always install missing packages on-the-fly" tijdens installatie!)
*   **Strawberry Perl:** [Download](http://strawberryperl.com/) (Nodig voor de VS Code extensie)

### 3. Clone JOUW Fork
Open VS Code, open een terminal (`Ctrl + `) en typ:

```bash
# Vervang 'JouwNaam' door jouw GitHub gebruikersnaam!
git clone https://github.com/JouwNaam/Samenvattingen-Ku-leuven-Industriele-ingenieurs.git
```

### 4. Installeer VS Code Extensies
Open het project in VS Code. Ga naar het Extensions tabblad (Links) en installeer:
*   ✅ **LaTeX Workshop** (James Yu) - *Cruciaal voor het bouwen van PDF's.*
*   ✅ **GitHub Pull Requests and Issues** - *Maakt samenwerken makkelijker.*

---

## 🔄 Stap 2: Je dagelijkse workflow

Elke keer als je iets wilt aanpassen, volg je deze stappen.

### 1. Zorg dat je up-to-date bent
Omdat andere studenten ook dingen aanpassen, moet je zorgen dat jouw fork bijblijft met het origineel.

**Via GitHub Website (Makkelijkst):**
Ga naar jouw Fork op GitHub. Als er staat *"This branch is out of date"*, klik dan op **Sync Fork**.

**Via Terminal:**
```bash
git pull
```

### 2. Maak een nieuwe Branch
Werk nooit direct in de `main` of `alpha` branch. Maak een nieuwe tak voor jouw wijziging.

```bash
git checkout alpha
git checkout -b fix-hoofdstuk-3
```

### 3. Bewerken & Testen (LaTeX)
Open de `.tex` bestanden en maak je aanpassingen.
*   **Bouw PDF:** Klik op het groene ▶️ icoontje rechtsboven of druk `Ctrl+Alt+B`.
*   **Bekijk PDF:** Klik op het PDF icoontje of druk `Ctrl+Alt+V`.

> **💡 LaTeX Tips:**
> *   Afbeelding invoegen? Kopieer afbeelding -> `Ctrl + Alt + V` in VS Code.
> *   Nieuwe formule? Gebruik `\frm{...}`.
> *   Definitie? Gebruik `\conceptbox{...}`.
> *   Meer info in [MACRO_QUICK_REFERENCE.md](MACRO_QUICK_REFERENCE.md).

### 4. Opslaan (Commit) & Uploaden (Push)
Klaar met je wijzigingen? Sla ze op in jouw fork.

```bash
git add .
git commit -m "Hoofdstuk 3 mechanica toegevoegd"
git push origin fix-hoofdstuk-3
```

### 5. Maak een Pull Request (PR)
Nu stuur je jouw werk naar ons terug.
1.  Ga naar de **originele repository** (deze pagina).
2.  Je ziet vaak automatisch een gele balk: *"Compare & pull request"*.
3.  Klik erop.
4.  Controleer dat de "base" op **alpha** staat (niet main!).
5.  Beschrijf wat je hebt gedaan en klik op **Create Pull Request**.

Gefeliciteerd! 🎉 Een collaborator zal je werk nakijken en samenvoegen.

---

## 📚 Hulpbronnen

*   **[MACRO_QUICK_REFERENCE.md](MACRO_QUICK_REFERENCE.md)**: Alle commando's voor formules, kaders en figuren.
*   **[Debugging-van-building.md](Debugging-van-building.md)**: Hulp als je PDF niet wil compileren.
*   **[Remote-Repos.md](Remote-Repos.md)**: Hoe je VS Code koppelt aan GitHub.

---

## ❓ Hulp nodig?

Loop je vast? Is Git verwarrend?
*   Stuur een berichtje in de **Issues** tab.
*   Contacteer **@eggmansmile** op Discord.

Bedankt voor je bijdrage! Samen maken we de beste samenvattingen. 🚀