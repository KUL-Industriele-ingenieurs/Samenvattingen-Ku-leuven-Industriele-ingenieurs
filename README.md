# School LaTeX Documents 🎓

Welkom bij de samenvattingen voor Industriële Ingenieurswetenschappen aan de KU Leuven! 

Deze repository is een **gezamenlijk project** waar studenten professionele samenvattingen maken die iedereen kan gebruiken. Jouw bijdrage - groot of klein - helpt medestudenten enorm. Bedankt dat je hier bent! 🙌

---

## 👋 Nieuw hier? Start hier!

**Nog nooit met Git of LaTeX gewerkt? Geen probleem!** Deze guide neemt je stap voor stap mee. Volg gewoon de instructies hieronder en je bent zo aan de slag.

Heb je vragen of loop je vast? Stuur gerust een berichtje naar **@eggmansmile** op Discord. Wil je graag vaker meewerken en collaborator worden? Laat het me weten! We kunnen altijd extra hulp gebruiken.
Join de industria discord waar je me zoiezo vindt. https://discord.gg/gsDzr5qhPe. Als je collabirator wilt worden (Je bekijkt af en toe eens veranderingen en kijkt of pull requests goed zijn) stuur me dan ook iets.

---

## 🤔 Wat is LaTeX eigenlijk?

Als je alleen Word kent, is LaTeX misschien even wennen - maar het is perfect voor technische documenten.

**Het belangrijkste verschil:**
- **Word:** Je "tekent" je document - je versleept dingen en kiest lettergroottes.
- **LaTeX:** Je "programmeert" je document - je schrijft tekst en commando's zoals `\section{Hoofdstuk 1}`, en LaTeX zorgt voor de opmaak.

**Waarom LaTeX gebruiken?**
- ✅ Perfecte wiskundige formules: \(\int_{0}^{\infty} e^{-x} dx\)
- ✅ Automatische nummering en inhoudsopgave
- ✅ Professionele layout zonder gedoe
- ✅ Geen verspringende afbeeldingen of kapotte opmaak
- ✅ Ideaal voor technische vakken

**Het resultaat:** Een strakke, professionele PDF die er altijd goed uitziet.

---

## 🛠️ Setup: Wat heb je nodig?

Je moet een paar programma's installeren voordat je kunt beginnen. Dit lijkt misschien veel, maar je doet het maar één keer!

### 📦 Overzicht: Wat installeren we?

1. **Visual Studio Code** - De editor waarin je werkt
2. **Git** - Om samen te werken en versies bij te houden
3. **LaTeX distributie** - De "compiler" die je code omzet naar PDF
4. **VS Code extensies** - Extra functies voor LaTeX

---

## 📥 Stap 1: Installeer Visual Studio Code en Git

### Visual Studio Code (VS Code)
Dit is de editor waarin je gaat typen. Download en installeer:
- 🌐 Website: [code.visualstudio.com](https://code.visualstudio.com/)
- Of via **Windows terminal** (PowerShell):
  ```powershell
  winget install --id Microsoft.VisualStudioCode
  ```

### Git
Git is het systeem waarmee we samenwerken en wijzigingen bijhouden.
- 🌐 Website: [git-scm.com/downloads](https://git-scm.com/downloads)
- Of via **Windows terminal** (PowerShell):
  ```powershell
  winget install --id Git.Git -e --source winget
  ```

**Tijdens installatie van Git:**
- Alle standaard opties zijn prima
- Je hoeft niets speciaals te kiezen

#### Optioneel: GitHub Desktop
Als je liever niet met commando's werkt, kun je ook [GitHub Desktop](https://desktop.github.com/) installeren. Dit geeft een visuele interface voor Git. Deze guide gebruikt wel de command line, omdat dat universeler is.



### 🌐 Remote Repositories in VS Code (beter voor samenwerken) 
Wil je alles rechtstreeks in VS Code doen zonder naar GitHub te gaan?  
Lees [Remote-Repos.md](Remote-Repos.md) - hier leer je de GitHub Extension gebruiken!
---



## 📝 Stap 2: Installeer een LaTeX Distributie

LaTeX heeft een "compiler" nodig om je `.tex` bestanden om te zetten naar een PDF. Kies het programma voor jouw besturingssysteem:

### Windows/Apple/linux: MiKTeX
1. Download [MiKTeX](https://miktex.org/download) (kies "Basic Installer")
2. Installeer het programma
3. **Belangrijk:** Bij de installatie, kies "**Always install missing packages on-the-fly**"
   - Dit zorgt dat extra pakketten automatisch worden geïnstalleerd
   - Anders moet je elk pakket handmatig goedkeuren 😅



## 🔌 Stap 3: Installeer VS Code Extensies

Extensies geven VS Code superkrachten voor LaTeX.

1. Open **Visual Studio Code**
2. Klik op het **Extensions** icoontje links (het blokjes-icoon) of druk `Ctrl+Shift+X`
3. Zoek en installeer deze extensies:

### ✅ LaTeX Workshop (VERPLICHT)
- 🔍 Zoek: `LaTeX Workshop`
- 👤 Auteur: James Yu
- ⭐ Dit is de belangrijkste! Hiermee kun je PDF's bouwen en bekijken.

### ✅ GitHub Pull Requests and Issues (Aangeraden)
- 🔍 Zoek: `GitHub Pull Requests and Issues`
- 👤 Auteur: GitHub
- 📌 Handig voor samenwerken

### ✅ LaTeX – LanguageTool (Optioneel maar handig)
- 🔍 Zoek: `LaTeX`
- 👤 Auteur: Julian Valentin
- 📝 Spellingscontrole en grammatica voor Nederlands

**Test of het werkt:**
- Na installatie van LaTeX Workshop verschijnt er een **TEX** icoontje in de linker sidebar

---
*(niet doen als je remote repo gaat gebruiken)*
## 📂 Stap 4: Clone dit Repository 

Nu gaan we de bestanden van dit project naar jouw computer downloaden.

### Wat is "clonen"?
Clonen betekent: een kopie maken van alle projectbestanden op jouw computer.

### Hoe doe je dat?

1. **Open Visual Studio Code**

2. **Open de Terminal:**
   - Ga naar: `Terminal → New Terminal`
   - Of druk: `Ctrl + ` ` (Ctrl + backtick)

3. **Navigeer naar je gewenste map** (bijvoorbeeld Documents):
   ```bash
   cd Documents
   ```
   *Op Windows kun je ook `cd C:\Users\JouwNaam\Documents` gebruiken*

4. **Clone het repository:**
   ```bash
   git clone https://github.com/Eggmansmile/Samenvattingen-Ku-leuven-Industriele-ingenieurs.git
   ```

5. **Wacht tot het klaar is** - je ziet "Cloning into..." en daarna "done"

---

## 📁 Stap 5: Open het Project in VS Code

Nu de bestanden op je computer staan, kunnen we ze openen:

1. In VS Code: ga naar **File → Open Folder...** (of `Ctrl+K Ctrl+O`)
2. Navigeer naar de map waar je het project hebt gecloned
3. Selecteer de map **Samenvattingen-Ku-leuven-Industriele-ingenieurs**
4. Klik **Open**

Je ziet nu alle projectbestanden in de linker sidebar! 🎉

---

## 🚀 Je eerste PDF bouwen

Laten we testen of alles werkt:

1. Open een `.tex` bestand in de linker sidebar (bijvoorbeeld een samenvatting)
2. Klik rechtsboven op de **groene play knop ▶️** (Build LaTeX project)
3. Wacht even... de eerste keer duurt wat langer
4. De PDF verschijnt rechts in beeld!

**Lukt het niet?** Kijk in [Debugging-van-building.md](Debugging-van-building.md) voor hulp.

---

## 🔄 Workflow: Hoe werk je samen aan dit project?

We werken met **branches** (takken). Denk eraan als verschillende versies van het project waar je veilig kunt experimenteren zonder het origineel te breken.

### 🌳 Wat zijn branches?

- **`main`** - De officiële, stabiele versie (raak deze NOOIT aan)
- **`alpha`** - De ontwikkelversie waar nieuwe dingen samenkomen
- **Jouw branch** - Jouw persoonlijke werkruimte

**De regel:** Je werkt altijd in je eigen branch, en vraagt daarna om je wijzigingen toe te voegen.

---

## 📝 Stap-voor-stap: Iets bijdragen

### Stap 1: Begin met een up-to-date versie

Voordat je begint, haal je de laatste wijzigingen op:

```bash
git checkout alpha
git pull origin alpha
```

**Wat doet dit?**
- `git checkout alpha` - Switch naar de alpha branch
- `git pull origin alpha` - Download de nieuwste wijzigingen

---

### Stap 2: Maak je eigen branch

Werk nooit direct in `alpha` of `main`! Maak je eigen werkruimte:

**Optie A: Via VS Code (makkelijkst)**
1. Klik **linksonder** op de branch naam (staat `alpha`)
2. Klik op **Create new branch...**
3. Geef een duidelijke naam:
   - ✅ Goed: `typo-fix-productie`, `hoofdstuk-3-mechanica`, `formule-verbetering`
   - ❌ Slecht: `test`, `branch1`, `nieuwe-dingen`

**Optie B: Via Terminal**
```bash
git checkout -b jouw-branch-naam
```

Je werkt nu in je eigen branch! 🎉

---

### Stap 3: Maak je wijzigingen

1. **Open een `.tex` bestand** dat je wilt aanpassen
2. **Maak je wijzigingen**
   - Voeg tekst toe
   - Verbeter formules
   - Fix typefouten
3. **Bekijk de macro's:** Lees [MACRO_QUICK_REFERENCE.md](MACRO_QUICK_REFERENCE.md) voor alle beschikbare commando's
   - `\conceptbox{...}` voor definities
   - `\frm{...}` voor formules
   - `\examplebox{...}` voor voorbeelden

**Tip:** Gebruik de commando's uit `school-macros.sty` - zo blijft alles consistent!

---

### Stap 4: Test je wijzigingen

Bouw de PDF om te zien hoe het eruitziet:

1. Klik op de **groene play knop ▶️** rechtsboven
2. Of druk `Ctrl+Alt+B`
3. Bekijk de PDF rechts

**Ziet het er goed uit?** Dan kun je door naar de volgende stap!

---

### Stap 5: Sla je wijzigingen op (Commit)

Nu gaan we je werk "committen" - dit betekent: een snapshot maken van je wijzigingen.

**Via VS Code (aangeraden):**

1. Klik op het **Source Control** icoontje links (vertakking-icoon)
2. Je ziet alle gewijzigde bestanden
3. Typ een **duidelijk bericht** in het tekstvak, bijvoorbeeld:
   - ✅ "Hoofdstuk 3 mechanica toegevoegd"
   - ✅ "Typefouten in productie samenvatting verbeterd"
   - ✅ "Formule voor traagheidsmoment gecorrigeerd"
   - ❌ "update"
   - ❌ "changes"
4. Klik op **✓ Commit**

**Via Terminal:**
```bash
git add .
git commit -m "Jouw duidelijke beschrijving"
```

---

### Stap 6: Upload je branch naar GitHub (Push)

Nu uploaden we je branch naar GitHub:

**Via VS Code:**
- Klik op **Publish Branch** (als het de eerste keer is)
- Of klik op **Sync Changes** (als je al eerder hebt gepushed)

**Via Terminal:**
```bash
git push origin jouw-branch-naam
```

---

### Stap 7: Maak een Pull Request (PR)

Nu vraag je of je wijzigingen mogen worden toegevoegd aan het project. Dit heet een "Pull Request" (PR).

1. **Ga naar GitHub:**
   - Open [github.com/Eggmansmile/Samenvattingen-Ku-leuven-Industriele-ingenieurs](https://github.com/Eggmansmile/Samenvattingen-Ku-leuven-Industriele-ingenieurs)

2. **Je ziet een gele banner:**
   - "Your recently pushed branches: jouw-branch-naam"
   - Klik op **Compare & pull request**

3. **Vul de PR in:**
   - **Belangrijk:** Zorg dat `base: alpha` is geselecteerd (NIET `main`!)
   - Beschrijf wat je hebt gedaan
   - Klik **Create pull request**

4. **Wacht op review:**
   - Een beheerder kijkt je werk na
   - Eventuele feedback wordt gegeven
   - Bij goedkeuring wordt je werk toegevoegd! 🎉

---

## 🎯 Quick Reference: Belangrijke Git Commando's

```bash
# Start altijd met:
git checkout alpha
git pull origin alpha

# Maak een nieuwe branch:
git checkout -b mijn-nieuwe-branch

# Bekijk welke branch je gebruikt:
git branch

# Bekijk wat je hebt gewijzigd:
git status

# Commit wijzigingen:
git add .
git commit -m "Beschrijving van wijzigingen"

# Upload naar GitHub:
git push origin mijn-branch-naam
```

---

## 📚 Nuttige Documenten

- **[MACRO_QUICK_REFERENCE.md](MACRO_QUICK_REFERENCE.md)** - Spiekbriefje voor alle LaTeX commando's (formules, kaders, figuren)
- **[Hoe-voeg-je-issues-toe.md](Hoe-voeg-je-issues-toe.md)** - Hoe je TODO's en fouten rapporteert
- **[Debugging-van-building.md](Debugging-van-building.md)** - Hulp als je PDF niet wil compileren

---

## 🐛 Foutje gevonden?

Super dat je meehelpt!

**Klein probleem (typefout, kleine correctie):**
- Fix het zelf via de workflow hierboven!

**Groot probleem of twijfel:**
1. **In de code:** Voeg een commentaar toe: `% @issue: Beschrijving van het probleem`
2. **Via GitHub:** Ga naar het tabblad "Issues" en klik "New Issue"

**Vragen of hulp nodig?**
- Stuur een berichtje naar **@eggmansmile** op Discord

---

## 🤝 Collaborator worden?

Werk je regelmatig mee en wil je meer mogelijkheden? Stuur een berichtje naar **@eggmansmile** op Discord en we maken je graag collaborator! Dan kun je:
- Direct branches beheren
- Pull requests reviewen
- Issues labelen en sluiten

---

## 🗺️ Roadmap

Waar werken we aan?

- ✅ **Setup documentatie** - Duidelijke installatie-instructies voor beginners
- 🔄 **Data acquisitie** - Verzamelen van oefenopgaven en samenvattingen
- 🔄 **Herwerking** - Oude documenten updaten naar de nieuwe stijl (`school-macros.sty`)
- 📋 **Automatisering** - Automatische PDF builds via GitHub Actions
- 📋 **Online preview** - Samenvattingen online kunnen bekijken zonder te downloaden

---

## 💪 Tips voor Succes

- **Begin klein:** Fix eerst een typefoutje voordat je een heel hoofdstuk toevoegt
- **Commit vaak:** Maak regelmatig commits, niet één grote aan het eind
- **Test je PDF:** Bouw altijd je PDF voordat je pusht
- **Duidelijke berichten:** Schrijf wat je hebt gedaan, niet "update" of "fix"
- **Vraag om hulp:** Loop je vast? Stuur gerust een bericht!

---

## 📜 Licentie

Dit project is vrijgegeven onder de **MIT License** - zie het `LICENSE` bestand voor details. Dat betekent: iedereen mag deze samenvattingen gebruiken, aanpassen en delen! 🎓

---

**Veel succes en bedankt voor je bijdrage! 🚀**

*Heb je deze guide doorlopen en werkt alles? Laat het weten in een issue of op Discord - we horen graag feedback om deze guide te verbeteren!*
