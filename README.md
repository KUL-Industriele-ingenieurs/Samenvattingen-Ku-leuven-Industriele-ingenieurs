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
2.  Download **"Click here to download"** voor Windows.
3.  Installeer het (je mag bij alle schermen gewoon op **"Next"** klikken).

### 3. Strawberry Perl (Nodig voor de achtergrond)
Onze tools hebben Perl nodig om alles correct te laten werken.
1.  Ga naar [strawberryperl.com](https://strawberryperl.com/).
2.  Download de "Recommended" versie (MSI installer) en installeer het.

### 4. MiKTeX (De LaTeX Motor)
Dit is de motor die jouw code omzet naar een mooie PDF.
1.  Ga naar [miktex.org/download](https://miktex.org/download).
2.  Download de **Basic Installer** en start de installatie.
3.  **⚠️ ZEER BELANGRIJK:**
    Je krijgt een scherm "Settings" met "Preferred paper" en "Install missing packages on-the-fly".
    *   Zet **"Install missing packages on-the-fly"** op **"Yes"**.
    *   *Doe je dit niet? Dan krijg je honderden pop-ups tijdens het werken.*
4.  Rond de installatie af.

### 5. Herstart je computer 🔄
Windows moet even weten dat al deze nieuwe programma's bestaan.

---

## ☁️ Alternatief: GitHub Codespaces (Geen installatie)

Wil je **niets installeren** of werk je op een andere computer? Gebruik dan de online versie.
*   **Voordeel:** Je kunt direct beginnen in je browser.
*   **Nadeel:** Je hebt altijd internet nodig en het is soms iets trager.

**Hoe?**
1.  Volg Stap 2 (Forken) hieronder.
2.  Op de pagina van **JOUW fork**: Klik op de groene knop **<> Code**.
3.  Ga naar tabblad **Codespaces** en klik op **Create codespace on alpha**.

---

## 📥 Stap 2: Het project opzetten

### 1. Maak een Fork (Op GitHub)
1.  Ga naar de bovenkant van deze pagina.
2.  Klik rechtsboven op de knop **Fork**.
3.  Klik op **Create Fork**.
*Nu heb je je eigen kopie van de samenvattingen op jouw profiel.*

### 2. Clone JOUW Fork (Op je PC)
*Sla dit over als je Codespaces gebruikt.*

1.  Open **Visual Studio Code**.
2.  Open een Terminal (`Ctrl + ``).
3.  Typ het volgende commando:

```bash
# VERVANG 'JouwNaam' door jouw GitHub gebruikersnaam!
git clone https://github.com/JouwNaam/Samenvattingen-Ku-leuven-Industriele-ingenieurs.git
```

4.  Ga via *File > Open Folder* naar de map die je net hebt binnengehaald.

### 3. Link naar het originele project (Upstream)
*Enkel nodig voor lokale installatie.* Dit zorgt dat je updates van ons kunt binnenhalen.
Typ in de VS Code terminal:
```bash
git remote add upstream https://github.com/Eggmansmile/Samenvattingen-Ku-leuven-Industriele-ingenieurs.git
```

### 4. Extensies
VS Code vraagt rechtsonder: *"Do you want to install the recommended extensions?"* -> Klik **Install**.
(Vooral **LaTeX Workshop** en **GitHub Pull Requests** zijn nodig).

---

## 🔄 Stap 3: Je dagelijkse workflow

Elke keer als je iets wilt aanpassen, volg je deze routine.

### 1. Zorg dat je up-to-date bent (Sync)
Voordat je begint, moet je jouw fork synchroniseren met het origineel.

*   **Via GitHub:** Ga naar jouw fork, klik **Sync Fork** > **Update branch**.
*   **Daarna in VS Code:** Klik op het **Sync** icoontje (cirkelpijltjes) bij Source Control (links).

### 2. Maak een nieuwe Branch
Werk nooit direct in `alpha`. Maak een tak voor jouw taak:
```bash
git checkout alpha
git checkout -b vaknaam-hoofdstuk-x
```

### 3. Bewerken & Testen
Open de `.tex` bestanden en pas aan.
*   **Bouw PDF:** Klik op de groene ▶️ knop rechtsboven (`Ctrl+Alt+B`).
*   **Bekijk PDF:** Klik op het PDF icoontje (`Ctrl+Alt+V`).

> **💡 Tips:**
> *   Afbeelding invoegen? Kopiëren -> `Ctrl + Alt + V`.
> *   Meer info? Zie [MACRO_QUICK_REFERENCE.md](MACRO_QUICK_REFERENCE.md).

### 4. Opslaan & Uploaden
1.  Ga naar **Source Control** (links).
2.  Klik op **+** bij je bestanden, typ een bericht en klik op **Commit**.
3.  Klik op **Publish Branch** (of Sync).

### 5. Maak een Pull Request (PR)
1.  Ga naar de **originele repository** (deze pagina).
2.  Klik op de gele balk **Compare & pull request**.
3.  **BELANGRIJK:** Kies `base: alpha` (niet main!).
4.  Klik op **Create Pull Request**.

---

## ❓ Hulp nodig?

*   **[Debugging-van-building.md](Debugging-van-building.md)**: Hulp bij errors.
*   **Issues tab:** Stel je vraag hier op GitHub.
*   **Discord:** Stuur een berichtje naar **@eggmansmile**.

Bedankt voor je bijdrage! 🚀