# School LaTeX Documents 🎓

Dit project bevat professionele samenvattingen voor de opleiding Industriële Ingenieurswetenschappen aan de KU Leuven.

## 🤔 Wat is LaTeX?

Zie LaTeX niet als een tekstverwerker zoals Word, maar als een manier om documenten te "bouwen".
- **Je schrijft code:** In plaats van te slepen met marges, typ je platte tekst met commando's (bijv. `\section{Titel}`).
- **Het resultaat:** LaTeX zorgt automatisch voor de opmaak, inhoudstafels en prachtige wiskundige formules. Het resultaat is altijd een strakke, professionele PDF.
- **Waarom?:** Geen frustraties meer met verspringende afbeeldingen of kapotte nummering in Word.

---

## 🛠️ Installatie & Setup

Om aan deze documenten te werken heb je een paar tools nodig. Volg deze stappen:

### 1. Installeer Visual Studio Code (VS Code) en Git
Dit is de editor waarin je typt en het systeem om versies bij te houden.
- **VS Code:** Download via [code.visualstudio.com](https://code.visualstudio.com/)
- **Git:** Download via [git-scm.com/downloads](https://git-scm.com/downloads)

Of installeer via de terminal (Windows):
```powershell
winget install --id Microsoft.VisualStudioCode
winget install --id Git.Git -e --source winget
```

*(Optioneel) GitHub Desktop: Als je liever een grafische interface voor Git gebruikt, download dan [GitHub Desktop](https://desktop.github.com/).*

### 2. Installeer een LaTeX Distributie
LaTeX heeft een compiler nodig om je code om te zetten naar een PDF.
- **Windows, Mac, linux:** Installeer [MiKTeX](https://miktex.org/download) (Kies de "Basic Installer").

*Tip: Zorg dat je instelt dat MiKTeX pakketten automatisch mag installeren ("Always install missing packages on-the-fly").*

### 3. Installeer VS Code Extensies
Open VS Code, ga naar het Extensions tabblad (blokjes-icoon links) en zoek naar:
- **LaTeX Workshop:** De allerbelangrijkste. Hiermee kun je bouwen en previewen.
- **GitHub Pull Requests and Issues:** Om samen te werken zonder de editor te verlaten.
- **LTeX – LanguageTool:** Voor spellingscontrole en grammatica.

### 4. Clone dit Repository
Open de terminal in VS Code (`Ctrl + \``) of een andere terminal:
```bash
git clone https://github.com/Eggmansmile/Samenvattingen-Ku-leuven-Industriele-ingenieurs.git
```
*Opmerking: Zorg dat je in de map staat waar je het project wilt opslaan (bv. `Documents`).*

### 5. Open de map in VS Code
In VS Code: **File → Open Folder...** en selecteer de map `Samenvattingen-Ku-leuven-Industriele-ingenieurs`.

---

## 🔄 Workflow: Hoe werk je mee?

We werken met een veilig systeem zodat we nooit per ongeluk de hoofdversie breken. Volg deze stappen als je iets wilt aanpassen.

### Stap 1: Zorg dat je up-to-date bent
Voordat je begint, haal je de laatste versie op.
```bash
git checkout alpha
git pull origin alpha
```

### Stap 2: Maak een nieuwe "Branch"
Werk nooit direct in `alpha` of `main`. Maak een eigen takje aan.
- Klik linksonder in VS Code op de tak-naam (bv. `alpha`).
- Kies **Create new branch...**
- Geef een duidelijke naam, bv. `fix-typo-productie` of `hoofdstuk-3-wiskunde`.

### Stap 3: Bewerken & Bouwen
1. Open het `.tex` bestand dat je wilt aanpassen.
2. Gebruik de juiste commando's!
   - Zie **[MACRO_QUICK_REFERENCE.md](MACRO_QUICK_REFERENCE.md)** voor alle beschikbare blokken (`\conceptbox`, `\frm`, etc.).
3. **Bouwen (PDF Maken):**
   - Druk op de "Play" knop ▶️ rechtsboven (bij LaTeX Workshop).
   - Of gebruik de sneltoets (standaard vaak `Ctrl+Alt+B`).
   - Bekijk de PDF in het rechter tabblad.

### Stap 4: Commit & Push
Klaar met je werk? Sla het op in de geschiedenis.
1. Ga naar het **Source Control** tabblad in VS Code (vertakking-icoon).
2. Typ een bericht in het tekstvak, bv. "Hoofdstuk 3 samenvatting toegevoegd".
3. Klik op **Commit**.
4. Klik op **Publish Branch** (of **Sync Changes**).

### Stap 5: Maak een Pull Request (PR)
Dit is het moment dat je vraagt om jouw wijzigingen toe te voegen aan het project.
1. Ga naar de GitHub pagina van dit project.
2. Je ziet vaak een gele balk: "Compare & pull request". Klik daarop.
3. **Belangrijk:** Zorg dat `base: alpha` is geselecteerd (niet `main`!).
4. Beschrijf kort wat je hebt gedaan en klik op **Create pull request**.

Een beheerder zal je werk nakijken en goedkeuren!

---

## ✅ Nuttige Documenten & Links

- **[MACRO_QUICK_REFERENCE.md](MACRO_QUICK_REFERENCE.md)** — Een spiekbriefje voor alle commando's (formules, kaders, figuren).
- **[Hoe-voeg-je-issues-toe.md](Hoe-voeg-je-issues-toe.md)** — Uitleg over hoe je TODO's en fouten rapporteert in de code.
- **[Debugging-van-building.md](Debugging-van-building.md)** — Hulp als je PDF niet wil compileren.

---

## 🚩 Issues & Feedback

Zie je een foutje?
- **Klein:** Verbeter het zelf via bovenstaande workflow!
- **Groot/Onzeker:** Maak een Issue aan.
  - In de code: Typ `% @issue: Jouw opmerking`
  - Via GitHub: Ga naar het tabblad "Issues" en klik "New Issue".

---

## 🗺️ Roadmap
- **Data acquisitie** — Verzamelen van oefenopgaven en samenvattingen.
- **Herwerking** — Oude documenten updaten naar de nieuwe stijl (`school-macros.sty`).
- **Automatisering** — Automatische PDF builds via GitHub Actions.

## 📜 Licentie
Dit project is vrijgegeven onder de **MIT License** — zie het `LICENSE` bestand voor details.
