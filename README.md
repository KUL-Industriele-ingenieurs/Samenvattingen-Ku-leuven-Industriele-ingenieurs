# School LaTeX Documents 🎓

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
![Language](https://img.shields.io/badge/Made%20with-LaTeX-47545E?logo=latex&logoColor=white)
![Language](https://img.shields.io/badge/Made%20with-Typst-239DAD?logo=typst&logoColor=white)
[![Discord](https://img.shields.io/badge/Discord-Join%20Server-5865F2?logo=discord&logoColor=white)](https://discord.gg/gsDzr5qhPe)
![VS Code](https://img.shields.io/badge/Editor-VS%20Code-007ACC?logo=visualstudiocode&logoColor=white)
![Git](https://img.shields.io/badge/Tool-Git-F05032?logo=git&logoColor=white)

Welkom bij de samenvattingen voor Industriële Ingenieurswetenschappen aan de KU Leuven!

Deze repository is een **gezamenlijk project** waar studenten professionele samenvattingen maken die iedereen kan gebruiken. Jouw bijdrage - groot of klein - helpt medestudenten enorm. Bedankt dat je hier bent! 🙌

---

## 👥 Wie werken hieraan mee? (Contact)

Heb je vragen of wil je gewoon even hallo zeggen? Dit zijn de mensen die dit project trekken:

- **Ruben Ryckaert** (@eggmansmile) - Project initiator

**Zelf iets toegevoegd?** Zet je eigen naam hieronder in je volgende Pull Request! Wees trots op je werk. 😎

- ... (jouw naam hier?)

---

## 📖 Wat is wat? (Eenvoudige uitleg)

Als je nieuw bent, kunnen sommige termen vreemd klinken. Hier is een korte uitleg:

*   **Repository (Repo):** De "map" op internet waar alle bestanden van dit project staan.
*   **Forken:** Een kopie van het project maken naar je eigen GitHub-account. Zie het als je eigen "kladblok" versie van het project.
*   **Clonen:** De bestanden van GitHub naar je eigen computer kopiëren zodat je er lokaal aan kunt werken.
*   **Commit:** Je wijzigingen opslaan met een kort berichtje over wat je hebt gedaan.
*   **Push:** Je opgeslagen wijzigingen van je computer terugsturen naar GitHub.
*   **Pull Request (PR):** Een verzoek sturen om jouw verbeteringen toe te voegen aan het officiële project.
*   **Branch:** Een zijtak van het project waar je veilig kunt werken zonder het hoofdproject (de 'main') te verstoren.

---

## 🤝 Zin om vaker mee te helpen?

Ben je van plan om vaker wat toe te voegen? Top! Je kunt lid worden van het GitHub-team.

**Waarom zou je dat doen?**
Dan hoef je niet telkens die "Fork" stap te doen. Je kunt dan gewoon direct in dit project werken, je eigen branches aanmaken en je wijzigingen pushen. Dat werkt een stuk vlotter en we kunnen makkelijker samen aan dezelfde bestanden sleutelen.

**Hoe word je lid?**
Stuur een berichtje naar een van de **organisatie-eigenaren** op GitHub of ping een **admin** op de Industria Discord. Geef je GitHub-gebruikersnaam door en we regelen het voor je. Dan kun je meteen knallen! 🚀

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
## 🛠️ Stap 1: Installatie

Volg deze stappen om alles klaar te zetten op je computer.

### Benodigde software

| Software            | Waarvoor?                                   | Download                                                |
| ------------------- | ------------------------------------------- | ------------------------------------------------------- |
| **VS Code**         | Het programma waarin we schrijven.          | [code.visualstudio.com](https://code.visualstudio.com/) |
| **Git**             | Regelt het samenwerken en versies.          | [git-scm.com/downloads](https://git-scm.com/downloads)  |
| **Strawberry Perl** | Nodig voor het maken van de PDF's.          | [strawberryperl.com](https://strawberryperl.com/)       |
| **MiKTeX**          | Het "brein" achter LaTeX.                   | [miktex.org/download](https://miktex.org/download)      |

> ⚠️ **BELANGRIJK bij MiKTeX:** Kies tijdens de installatie bij de vraag **"Install missing packages on-the-fly"** voor **"Yes"**!
>
> 🔄 **Herstart je computer** nadat je alles hebt geïnstalleerd.

---

## 📥 Stap 2: Het project opzetten (zonder typen!)

### 2.1 Maak een Fork (Je eigen kopie)
1. Ga naar de [originele pagina op GitHub](https://github.com/KUL-Industriele-ingenieurs/Samenvattingen-Ku-leuven-Industriele-ingenieurs).
2. Klik rechtsboven op de knop **Fork**.
3. Klik op **Create Fork**. Nu heb je een eigen kopie op jouw GitHub-account.

### 2.2 Openen in VS Code (Clonen)
1. Open **VS Code**.
2. Klik linksboven op het icoontje met de drie streepjes (Menu) -> **File** -> **New Window** (als er al iets open staat).
3. Klik op de knop **Clone Repository** op het startscherm (of via het 'Source Control' icoontje links, dat lijkt op een vertakking).
4. Kies **Clone from GitHub**. Log in als daar om gevraagd wordt.
5. Zoek in de lijst naar `Samenvattingen-Ku-leuven-Industriele-ingenieurs` (jouw fork) en klik erop.
6. Kies een map op je computer waar je het project wilt opslaan.
7. Klik op **Open** als VS Code vraagt of je de gekloonde repository wilt openen.

### 2.3 Extensies
VS Code zal rechtsonder vragen om "Recommended Extensions" te installeren. Klik op **Install**. Dit zorgt ervoor dat LaTeX goed werkt en je makkelijk kunt samenwerken.

---

## 🔄 Stap 3: Werken aan een samenvatting

### 1. Maak een nieuwe Branch (Je eigen werkplek)
Werk nooit direct in de 'main'. Maak altijd een nieuwe branch voor je wijzigingen:
1. Klik linksonder in de blauwe balk op **main**.
2. Er opent bovenaan een menuutje. Kies **Create new branch...**.
3. Typ een logische naam (bijv. `wisselstroom-hoofdstuk-1`) en druk op **Enter**.

### 2. Aanpassen en PDF bekijken
- Open een `.tex` bestand in de mappen (bijv. in `2de jaar`).
- Breng je wijzigingen aan.
- **PDF maken:** Druk op `Ctrl + Alt + B`.
- **PDF bekijken:** Druk op `Ctrl + Alt + V`.

---

## 🚀 Stap 4: Je werk delen

### 1. Opslaan (Commit)
1. Klik links in de zijbalk op het **Source Control** icoontje (het vertakkings-icoontje).
2. Je ziet daar je gewijzigde bestanden staan.
3. Klik op de **+** (plus) naast de bestanden die je wilt opslaan.
4. Typ bovenaan in het tekstvak een kort berichtje (bijv: "Uitleg over transformatoren toegevoegd").
5. Klik op de knop **Commit**.

### 2. Versturen naar GitHub (Push)
1. Klik op de knop **Publish Branch** (of op het kleine ronde pijltje linksonder in de blauwe balk). Dit stuurt je werk naar jouw GitHub-pagina.

### 3. Pull Request maken (Samenvoegen)
Nu staan je wijzigingen op *jouw* GitHub, maar nog niet in het *gezamenlijke* project.
1. Ga naar je fork op de GitHub-website.
2. Je ziet vaak een gele balk met de knop **Compare & pull request**. Klik hierop.
3. Controleer of de pijlen naar het originele project wijzen (`KUL-Industriele-ingenieurs/...`).
4. Klik op **Create Pull Request**. 
5. Een van de beheerders zal je werk nakijken en toevoegen!

---

## 🐛 Hulp nodig?

- **Gaat er iets mis met de PDF?** Kijk in **[Debugging-van-building.md](Debugging-van-building.md)**.
- **Vragen over LaTeX?** Kijk in de **[MACRO_QUICK_REFERENCE.md](MACRO_QUICK_REFERENCE.md)** voor handige codes.
- **Kom je er niet uit?** Stuur een berichtje op de [Industria Discord](https://discord.gg/gsDzr5qhPe) naar **@eggmansmile**.

---

## 📺 Handige Video's

Heb je liever dat iemand het even voordoet? Bekijk dan deze korte video's:

- 🎬 **[Git & GitHub in VS Code (Nederlands)](https://www.youtube.com/watch?v=hwP7WQkmECE)** – Hoe je samenwerkt zonder terminal.
- 🎬 **[LaTeX voor Beginners](https://www.youtube.com/watch?v=UK8SMrS0G4Y)** – De basis van hoe je documenten schrijft.

---

Bedankt voor je hulp! Samen maken we studeren een stukje makkelijker. 🚀