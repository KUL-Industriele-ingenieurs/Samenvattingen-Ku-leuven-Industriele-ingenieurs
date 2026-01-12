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
- **Git:** Versiebeheer tool om wijzigingen bij te houden.
Dit is de editor waarin je typt.
- Download: [code.visualstudio.com](https://code.visualstudio.com/)
- Download Git: [git-scm.com/downloads](https://git-scm.com/downloads)
of via de cmd line:
```
winget install --id Git.Git -e --source winget
```


### 2. Installeer een LaTeX Distributie
Latex gaat je pdf maken maar je moet een distributie installeren die de benodigde programma's en pakketten bevat.
- **Windows:** Installeer [MiKTeX](https://miktex.org/download) (kies "Basic Installer").
of gebruik de cmd line
```
winget install MiKTeX.MiKTeX
```
Zorg ervoor dat het automatisch updaten van pakketten aan staat.
- **Linux:** Installeer TeX Live via je pakketbeheerder, bv. voor Ubuntu:
```
sudo apt-get install texlive-full
```
- **Mac:** Installeer [MiKTeX](https://miktex.org/download).

### 3. Installeer VS Code Extensies
Open VS Code, ga naar het Extensions tabblad (vierkantjes links) en installeer:
- **LaTeX Workshop:** Dit zorgt ervoor dat je op "Play" kunt drukken om je PDF te zien.
- **GitHub Pull Requests and Issues:** Om samen te werken en issues te beheren.

### 4. Clone dit Repository
Open een terminal (cmd, PowerShell, of VS Code terminal) en voer uit:
```
git clone https://github.com/Eggmansmile/Samenvattingen-Ku-leuven-Industriele-ingenieurs/tree/Alpha-unreviewed
```
(Zorg dat je het zet in een map waar je makkelijk bij kunt, bv. `Documents/LaTeX-Projects`)
### 5. Open de map in VS Code
In VS Code, klik op **File → Open Folder...** en selecteer de map die je zojuist hebt gekloond.


---

## 🔄 Workflow: Hoe werk je mee?

We werken met een veilig systeem zodat we nooit per ongeluk de hoofdversie breken.

### Stap 1: Bewerken
Open het project in VS Code en maak je aanpassingen in de `.tex` bestanden.

### Stap 2: Branching (Bij grote wijzigingen)
Ga je een nieuw hoofdstuk schrijven of veel veranderen? Maak dan een eigen "branch" (een veilige kopie).
1. Klik linksonder in VS Code op de tak-naam (meestal `main` of `alpha`).
2. Kies **"Create new branch..."**.
3. Geef het een naam, bv. `nieuwe-oefeningen-wiskunde`.

### Stap 3: Pull Request naar 'Alpha'
Ben je klaar?
1. Commit en Push je wijzigingen naar GitHub.
2. Ga naar GitHub en maak een **Pull Request (PR)** aan.
(met een extensie zoals "GitHub Pull Requests and Issues" kan dit ook vanuit VS Code)
3. **Belangrijk:** Zet de bestemming (base) op **`alpha`**.
   - *De `alpha` branch is onze testversie waar we alles verzamelen.*

### Stap 4: Review & Release
1. Een admin kijkt je wijzigingen na.
2. Als alles goed is, wordt jouw werk geaccepteerd in `alpha`.
3. Periodiek verplaatst de admin alles van `alpha` naar **`main`** voor een officiële release.
5. **GitHub Issues integratie (OPTIONEEL, maar aanbevolen):**
   
   Voor het bijhouden van TODOs en issues in je code:
   
   - Installeer extensie: **GitHub Pull Requests and Issues** (`GitHub.vscode-pull-request-github`)
   - Authenticeer: `Ctrl+Shift+P` → "GitHub: Sign in"
   
   **Gebruik:**
   - Voeg `% @issue:` comments toe in je .tex files voor TODOs
   - Klik op de lightbulb 💡 of `Ctrl+.` om een GitHub issue te maken
   - Wanneer je klaar bent, **verwijder de `@issue` comment** of verander naar `% Done:`
   - Sluit het bijbehorende GitHub issue met een commit: "Fixes #123"
   
   📖 Meer info: zie [Hoe-voeg-je-issues-toe.md](Hoe-voeg-je-issues-toe.md)
---

## ✅ Voltooide documenten
- **Productietechnologie** — Voltooid
- **Ingenieur en economie** — Voltooid
- **Wisselstroom** — Voltooid

**Overige documenten:** Documenten moeten hermaakt worden.

## 🚩 Issues & Feedback

Heb je een suggestie of zie je een fout, maar wil je het niet direct zelf oplossen?

### 1. Gebruik `@issue` markers
Typ in een `.tex` bestand simpelweg een opmerking die begint met `% @issue`:
```latex
% @issue: Voorbeeld toevoegen voor de tweede wet van Newton
% Hier moet nog een rekenvoorbeeld komen met m=5kg.
```

### 2. VS Code Integratie
Met de "GitHub Pull Requests and Issues" extensie:
- Klik op het lampje (💡) bij de tekst of druk op `Ctrl+.`.
- Kies **"Create issue from comment"**.

### 3. Issues bekijken
Je kunt openstaande taken zien in de **Source Control** tab van VS Code onder de sectie **GITHUB**.

---

## 🗺️ Roadmap (korte termijn)
- **Data acquisitie** — verzamelen van oefenopgaven, slides en referentiemateriaal.
- **Objectgeoriënteerd programmeren (OOP)** — refactor scripts en voorbeelden naar OOP waar relevant.
- **Documenten herwerken** — herbouw van verouderde documenten (MATHSYS, Warmte, etc.).
- **CI & automatisering** — verbeterde GitHub Actions voor consistente builds en PDF-artifacts.
- **Tests & validatie** — automatische checks voor LaTeX-bouw en linting.
- **Contributing / Voorbeelden** — templates en guidelines voor bijdragers.

> Tip: Prioriteit is eerst data acquisitie en het herwerken van verouderde documenten; OOP-refactor en CI volgen.

## 📜 Licentie
Dit project is vrijgegeven onder de **MIT License** — zie het `LICENSE` bestand voor details.

