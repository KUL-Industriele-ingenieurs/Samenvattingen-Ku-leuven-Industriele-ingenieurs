# School Samenvattingen 🎓

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
![Language](https://img.shields.io/badge/Made%20with-LaTeX-47545E?logo=latex&logoColor=white)
![Language](https://img.shields.io/badge/Made%20with-Typst-239DAD?logo=typst&logoColor=white)
[![Discord](https://img.shields.io/badge/Discord-Join%20Server-5865F2?logo=discord&logoColor=white)](https://discord.gg/gsDzr5qhPe)
![VS Code](https://img.shields.io/badge/Editor-VS%20Code-007ACC?logo=visualstudiocode&logoColor=white)
![Git](https://img.shields.io/badge/Tool-Git-F05032?logo=git&logoColor=white)

Welkom bij de samenvattingen voor Industriële Ingenieurswetenschappen aan de KU Leuven!

Deze repository is een **gezamenlijk project** waar studenten professionele samenvattingen maken die iedereen kan gebruiken. Jouw bijdrage - groot of klein - helpt medestudenten enorm. Bedankt dat je hier bent! 🙌

---

## 📝 Kies je tool: LaTeX of Typst

We ondersteunen twee systemen. **Kies er één en volg de handleiding:**

<table>
<tr>
<td width="50%" align="center">

### 📄 LaTeX

De **standaard** voor wetenschappelijke documenten. Krachtig, maar met een steile leercurve.

- 🔧 Installatie: MiKTeX + Perl (~2 GB)
- ⏱️ Compileren duurt een paar seconden
- 📚 Enorm veel packages beschikbaar
- 🎓 Meest gebruikt in de academische wereld

**👉 [Ik kies LaTeX → LATEX.md](LATEX.md)**

</td>
<td width="50%" align="center">

### ⚡ Typst _(Aanbevolen voor beginners)_

Het **moderne alternatief**. Sneller, simpeler, en makkelijker te leren.

- 🔧 Installatie: één commando (~50 MB)
- ⚡ Live preview — direct resultaat
- 📖 Veel leesbaardere code
- 🆕 Nieuwer, maar groeiend ecosysteem

**👉 [Ik kies Typst → TYPST.md](TYPST.md)**

</td>
</tr>
</table>

> 💡 Beide systemen gebruiken dezelfde stijl (kleuren, boxes, lettertypes). Je kunt later altijd switchen!

---

## 👥 Wie werken hieraan mee? (Contact)

Heb je vragen of wil je gewoon even hallo zeggen? Dit zijn de mensen die dit project trekken:

- **Ruben Ryckaert** (@eggmansmile) - Project initiator

**Zelf iets toegevoegd?** Zet je eigen naam hieronder in je volgende Pull Request! Wees trots op je werk. 😎

- ... (jouw naam hier?)

---

## 🛠️ Stap 1: Software installeren

Je hebt in elk geval **VS Code** en **Git** nodig. Open een terminal en voer uit:

**Windows** (PowerShell):

```powershell
winget install --id Microsoft.VisualStudioCode --id Git.Git
```

**macOS** (Terminal):

```bash
brew install --cask visual-studio-code && brew install git
```

**Linux** (Ubuntu/Debian):

```bash
sudo apt install code git
```

Daarna installeer je **LaTeX** of **Typst** (of beide). Volg de stappen in:

- 📄 **[LATEX.md](LATEX.md)** — LaTeX installeren & gebruiken
- 📄 **[TYPST.md](TYPST.md)** — Typst installeren & gebruiken

> 🔄 **Herstart je computer** nadat je alles hebt geïnstalleerd.

---

## Wat is wat? (Git-termen uitgelegd)

Als je nog nooit met Git of GitHub hebt gewerkt, geen panic! Hier zijn de belangrijkste woorden:

| Term                  | Wat het betekent                                                                                      |
| --------------------- | ----------------------------------------------------------------------------------------------------- |
| **Repository (Repo)** | De "map" op internet waar alle bestanden van dit project staan.                                       |
| **Forken**            | Een kopie van het project maken naar je eigen GitHub-account. Zie het als je eigen "kladblok" versie. |
| **Clonen**            | De bestanden van GitHub naar je eigen computer kopiëren zodat je er lokaal aan kunt werken.           |
| **Branch**            | Een zijtak waar je veilig kunt werken zonder het hoofdproject ('main') te verstoren.                  |
| **Commit**            | Je wijzigingen opslaan met een kort berichtje over wat je hebt gedaan.                                |
| **Push**              | Je opgeslagen wijzigingen van je computer terugsturen naar GitHub.                                    |
| **Pull Request (PR)** | Een verzoek sturen om jouw verbeteringen toe te voegen aan het officiële project.                     |

---

## 📥 Stap 2: Project opzetten

### 2.1 Maak een Fork (Je eigen kopie)

1. Ga naar de [originele pagina op GitHub](https://github.com/KUL-Industriele-ingenieurs/Samenvattingen-Ku-leuven-Industriele-ingenieurs).
2. Klik rechtsboven op de knop **Fork**.
3. Klik op **Create Fork**. Nu heb je een eigen kopie op jouw GitHub-account.

### 2.2 Openen in VS Code (Clonen)

1. Open **VS Code**.
2. Klik linksboven op het icoontje met de drie streepjes (Menu) -> **File** -> **New Window**.
3. Klik op de knop **Clone Repository** op het startscherm (of via het 'Source Control' icoontje links).
4. Kies **Clone from GitHub**. Log in als daar om gevraagd wordt.
5. Zoek in de lijst naar `Samenvattingen-Ku-leuven-Industriele-ingenieurs` (jouw fork) en klik erop.
6. Kies een map op je computer waar je het project wilt opslaan.
7. Klik op **Open** als VS Code vraagt of je de gekloonde repository wilt openen.

### 2.3 Extensies

VS Code zal rechtsonder vragen om "Recommended Extensions" te installeren. Klik op **Install**.

---

## 🔄 Stap 3: Werken aan een samenvatting

### 1. Maak een nieuwe Branch

Werk nooit direct in de 'main'. Maak altijd een nieuwe branch:

1. Klik linksonder in de blauwe balk op **main**.
2. Kies **Create new branch...**.
3. Typ een logische naam (bijv. `wisselstroom-hoofdstuk-1`) en druk op **Enter**.

### 2. Bewerken

- Open een `.tex` of `.typ` bestand.
- Breng je wijzigingen aan.
- **LaTeX PDF maken:** `Ctrl + Alt + B`, bekijken: `Ctrl + Alt + V`
- **Typst preview:** Klik op het oogje (👁) rechtsboven

---

## 🚀 Stap 4: Je werk delen

### 1. Opslaan (Commit)

1. Klik links op het **Source Control** icoontje (vertakking).
2. Klik op de **+** naast je gewijzigde bestanden.
3. Typ een kort berichtje (bijv. "Uitleg over transformatoren toegevoegd").
4. Klik op **Commit**.

### 2. Versturen naar GitHub (Push)

1. Klik op **Publish Branch** (of het pijltje linksonder in de blauwe balk).

### 3. Pull Request maken

1. Ga naar je fork op de GitHub-website.
2. Klik op de gele balk **Compare & pull request**.
3. Controleer dat de pijlen naar `KUL-Industriele-ingenieurs/...` wijzen.
4. Klik op **Create Pull Request**.
5. Een beheerder zal je werk nakijken en toevoegen!

---

## 🤝 Zin om vaker mee te helpen?

Ben je van plan om vaker bij te dragen? Word dan lid van het GitHub-team!

**Voordeel:** Geen fork nodig — je kunt direct branches maken en pushen.

**Hoe?** Stuur een berichtje naar een **organisatie-eigenaar** op GitHub of ping een **admin** op de [Industria Discord](https://discord.gg/gsDzr5qhPe).

---

## 🐛 Hulp nodig?

- 📄 **[LATEX.md](LATEX.md)** — LaTeX installatie & handleiding
- 📄 **[TYPST.md](TYPST.md)** — Typst installatie & handleiding
- 📄 **[MACRO_QUICK_REFERENCE.md](MACRO_QUICK_REFERENCE.md)** — LaTeX commando's cheatsheet
- 📄 **[Debugging-van-building.md](Debugging-van-building.md)** — PDF bouwfouten oplossen
- 💬 **[Industria Discord](https://discord.gg/gsDzr5qhPe)** — Stel je vraag aan **@eggmansmile**

---

## 📺 Handige Video's

- 🎬 **[Git & GitHub in VS Code (Nederlands)](https://www.youtube.com/watch?v=hwP7WQkmECE)** – Hoe je samenwerkt zonder terminal.
- 🎬 **[LaTeX voor Beginners](https://www.youtube.com/watch?v=UK8SMrS0G4Y)** – De basis van hoe je documenten schrijft.
- 🎬 **[Typst voor Beginners](https://www.youtube.com/watch?v=NTGkb4FCLhM)** – De basis van hoe je documenten schrijft.

---

Bedankt voor je hulp! Samen maken we studeren een stukje makkelijker. 🚀
