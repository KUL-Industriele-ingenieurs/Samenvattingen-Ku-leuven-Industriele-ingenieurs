# School LaTeX Documents 🎓

Welkom bij de samenvattingen voor Industriële Ingenieurswetenschappen aan de KU Leuven! 

Dit is een **open-source project** door en voor studenten. Iedereen kan deze samenvattingen gebruiken en verbeteren. Samen zorgen we voor betere studiematerialen! 🙌

---

## 🤝 Wil je direct meewerken? (Collaborator worden)

Standaard moet je een "omweg" gebruiken (forken) om iets aan te passen. Wil je echter vaker helpen, branches direct in dit project aanmaken en Pull Requests reviewen?

**Word Collaborator!** 🚀
Stuur een berichtje naar **@eggmansmile** on Discord of join de **Industria Discord** (https://discord.gg/gsDzr5qhPe). We voegen je graag toe aan het team!

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

## 🚀 Stap 1: De Grote Installatie Guide (Eenmalig)

Om met LaTeX en Git te werken, heb je een paar tools nodig. Volg deze stappen nauwkeurig, dan ben je in 10-15 minuten klaar.

### 1. Visual Studio Code (De Editor)
Hierin ga je typen en je PDF's bekijken.
1.  Ga naar [code.visualstudio.com](https://code.visualstudio.com/).
2.  Download de **Windows** versie.
3.  Installeer het programma (klik gewoon op "Next" bij alle opties).

### 2. Git (Versiebeheer)
Dit programma houdt alle wijzigingen bij en zorgt dat je kunt samenwerken.
1.  Ga naar [git-scm.com/downloads](https://git-scm.com/downloads).
2.  Download **"Click here to download"** voor Windows.
3.  Start de installatie.
4.  **Let op:** Je krijgt heel veel schermen. Je mag overal gewoon op **"Next"** klikken, de standaard instellingen zijn prima.

### 3. Strawberry Perl (Nodig voor de "Magic")
Onze tools hebben Perl nodig om alles correct te laten werken op de achtergrond.
1.  Ga naar [strawberryperl.com](https://strawberryperl.com/).
2.  Download de "Recommended" versie (MSI installer).
3.  Installeer het.

### 4. MiKTeX (De LaTeX Motor)
Dit is het belangrijkste onderdeel: de motor die jouw code omzet naar een mooie PDF.
1.  Ga naar [miktex.org/download](https://miktex.org/download).
2.  Klik op de blauwe **Download** knop (Basic Installer).
3.  Start de installatie en accepteer de voorwaarden.
4.  **⚠️ ZEER BELANGRIJK SCHERM:**
    Je krijgt een scherm "Settings" met "Preferred paper" en "Install missing packages on-the-fly".
    *   Zet **"Install missing packages on-the-fly"** op **"Yes"**. (Niet op "Ask me first"!).
    *   *Waarom?* Als je dit vergeet, krijg je tijdens het werken honderden pop-ups om pakketjes te installeren.
5.  Rond de installatie af.

### 5. Herstart je computer 🔄
Serieus, doe dit even. Windows moet even weten dat al deze nieuwe programma's (Git, Perl, MiKTeX) bestaan.

---

## 📥 Stap 2: Het project binnenhalen

Nu je computer er klaar voor is, gaan we het project opzetten.

### 1. Maak een Fork (Op GitHub)
1.  Ga naar de bovenkant van deze pagina.
2.  Klik rechtsboven op de knop **Fork**.
3.  Klik op **Create Fork**.
*GitHub maakt nu een exacte kopie van dit project onder jouw eigen naam (bijv. `JouwNaam/Samenvattingen...`).*

### 2. Clone JOUW Fork (Op je PC)
1.  Open **Visual Studio Code**.
2.  Open een Terminal: druk op `` Ctrl + ` `` (Control en backtick/accent grave) of ga naar menu *Terminal > New Terminal*.
3.  Typ het volgende commando (kopieer en plak):

```bash
# VERVANG 'JouwNaam' door jouw GitHub gebruikersnaam!
git clone https://github.com/JouwNaam/Samenvattingen-Ku-leuven-Industriele-ingenieurs.git
```

4.  Ga in VS Code naar *File > Open Folder* en open de map `Samenvattingen-Ku-leuven-Industriele-ingenieurs` die je net hebt gedownload.

### 3. Link naar het originele project (Upstream)
Dit is een extra stap zodat je later makkelijk wijzigingen van anderen kunt ophalen direct in VS Code.
1.  Open de terminal in VS Code.
2.  Typ dit commando:
```bash
git remote add upstream https://github.com/Eggmansmile/Samenvattingen-Ku-leuven-Industriele-ingenieurs.git
```
*Nu weet jouw computer waar het "echte" project staat.*

### 4. Installeer VS Code Extensies
VS Code zal waarschijnlijk rechtsonder een pop-up tonen: *"Do you want to install the recommended extensions?"*. Klik op **Install**.

Zie je die niet?
1.  Klik links op de blokjes (Extensions).
2.  Installeer: **LaTeX Workshop** (van James Yu).
3.  Installeer: **GitHub Pull Requests and Issues**.

---

## 🔄 Stap 3: Je dagelijkse workflow

Elke keer als je iets wilt aanpassen, volg je deze stappen.

### 1. Zorg dat je up-to-date bent (Sync)
Omdat andere studenten ook dingen aanpassen, moet je zorgen dat jouw fork bijblijft met het origineel.

**Optie A: Via VS Code (Aangeraden na stap 2.3):**
1.  Open de **Source Control** tab (het icoontje met de vertakking links).
2.  Klik op de **3 puntjes (...)** bovenaan het paneel.
3.  Kies **Pull from...**
4.  Selecteer **upstream** en dan **alpha**.
*Nu haalt VS Code de nieuwste wijzigingen van het officiële project op en zet ze in jouw code.*

**Optie B: Via GitHub Website:**
1.  Ga naar jouw Fork op GitHub.
2.  Als er staat *"This branch is out of date"*, klik op **Sync Fork** en dan **Update branch**.
3.  Ga daarna in VS Code naar Source Control en klik op het **Sync** icoontje (de cirkelvormige pijltjes) om je lokale computer weer gelijk te zetten met je online fork.

---

### 2. Maak een nieuwe Branch
Werk nooit direct in de `main` of `alpha` branch. Maak een nieuwe tak voor jouw wijziging.

```bash
git checkout alpha
git checkout -b vaknaam-hoofdstuk-3
```
*(Gebruik een logische naam: `naam-van-het-vak-hoofdstuk-x`)*

---

### 3. Bewerken & Testen (LaTeX)
Open de `.tex` bestanden en maak je aanpassingen.
*   **Bouw PDF:** Klik op het groene ▶️ icoontje rechtsboven of druk `Ctrl+Alt+B`.
*   **Bekijk PDF:** Klik op het PDF icoontje of druk `Ctrl+Alt+V`.

---

### 4. Opslaan (Commit) & Uploaden (Push)
Klaar met je wijzigingen? Sla ze op in jouw fork.

1.  Ga naar **Source Control** (links).
2.  Klik op het **+** teken naast je gewijzigde bestanden.
3.  Typ een bericht in het vak (bijv. "Hoofdstuk 3 toegevoegd").
4.  Klik op **Commit**.
5.  Klik op **Publish Branch** (of de Sync knop) om het naar GitHub te sturen.

---

### 5. Maak een Pull Request (PR)
Nu stuur je jouw werk naar ons terug.
1.  Ga naar de **originele repository** (deze pagina).
2.  Je ziet vaak automatisch een gele balk: *"Compare & pull request"*. Klik erop.
3.  **BELANGRIJK:** Controleer dat de "base" op **alpha** staat (niet main!).
4.  Beschrijf wat je hebt gedaan en klik op **Create Pull Request**.

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