# Remote Repositories in VS Code

Dit is een kleine aanvulling op de README. Hier lees je hoe je GitHub bestanden direct via VS Code beheert zonder dat je telkens de website in je browser hoeft te openen.

---

## Wat is een "Remote Repository"?

**Remote** betekent gewoon "op afstand" - in dit geval staan de bestanden op GitHub.

Simpelweg:

- **Local repository** = De versies van bestanden gewoon offline op je eigen laptop.
- **Remote repository** = De bestanden op GitHub in de cloud.

Git synchroniseert deze twee mappen constant. Hierdoor kan iedereen vlot samenwerken zonder bestanden te overschrijven.

---

## De GitHub Extensie in VS Code

VS Code heeft een heel handige extensie genaamd **"GitHub Pull Requests and Issues"** waarmee je zowat alles rechtstreeks in de editor regelt:

- Branches (zijtakken) wisselen en maken
- Pull Requests indienen
- Issues bekijken
- Alles syncen met de cloud

Grote kans dat je deze al hebt binnengehaald.

---

## Je GitHub Account Koppelen

De eerste keer dat je zoiets in VS Code wilt doen, zal hij vragen om in te loggen op GitHub.

### Stap 1: Klik op het account icoontje

Klik linksonder op het persoon-icoontje (dat zit in de hoek van VS Code).

### Stap 2: "Sign in with GitHub"

Klik op de "Sign in with GitHub" optie in dat menu.

### Stap 3: Toestemming geven

1. VS Code opent je internetbrowser.
2. GitHub vraagt ergens: "Authorize Visual Studio Code".
3. Klik "Authorize github".
4. Je bent nu gekoppeld.

Vanaf nu weet VS Code:

- Welke branches van jou zijn.
- Hoe hij nieuwe branches kan aanmaken.
- Hoe je Pull Requests kan opstellen.
- Naar waar hij je lokale commits moet pushen (uploaden).

---

## De GitHub knoppen in de VS Code interface

Aan je linker zijbalk vind je twee nieuwe snelle knoppen voor je workflow:

### Source Control (Het vertakkingssymbool)

Dit gebruik je constant voor:

- Je lokale wijzigingen op te slaan in een 'commit'.
- Je branches in de gaten te houden.
- Te uploaden (pushen) of downloaden (pullen).

### GitHub (Het kat- of megafoonsymbool)

Dit gebruik je voor:

- Aan openstaande taken (issues) te werken.
- De in te leveren Pull Requests te controleren.

---

## Hoe werkt dat Source Control tabblad?

Dit is eigenlijk de plek waar je al het dagelijkse upload werk doet.

### In dat overzicht zie je:

```
SOURCE CONTROL: Git

Branch: mijn-nieuwe-feature    ↓

CHANGES (2)
  samenvatting.tex
  school-macros.sty

Message box: [Hier typ je wat je exact veranderd of opgelost hebt]

[Vinkje / Commit]  [Vernieuwen]
```

Dat cijfer tussen de haakjes bij changes betekent gewoon: "je hebt 2 bestanden offline bewerkt maar ik heb ze nog niet opgeslagen als nieuwe blok of commit".

### Hoe neem je die veranderingen lokaal op (Commit)?

1. Typ een kort antwoord in je tekstvak. Bv: "Hoofdstuk 2 over thermodynamica toegevoegd".
2. Accepteer de veranderingen in de bestanden door ze te 'stagen' (klik op het plusje bij 'Changes').
3. Klik onderaan op het vinkje: 'Commit'.
4. Klaar! Zorg wel dat je nog online synct met GitHub (Sync = push + pull) zodat we het ook online hebben staan.

---

## Snel branches wisselen en aanmaken

### Wisselen naar een andere taak (Branch)

1. Klik linksonderaan naast je foutmeldingen of bij source control op je **branch naam** (meestal `main`).
2. Kies een bestaande andere naam uit de lijst.
3. Je editor springt meteen naar die code en tekst versie.

### Een verse eigen tak (Branch) maken

1. Klik weer op je **huidige branch**.
2. Kies "Create new branch from...".
3. Gebruik als basis altijd `main`.
4. Bedenk een goede naam (bv. wisselstroom-verbeteringen).
5. Je bestanden kopiëren zichzelf meteen lokaal in je eigen werkruimte waar niemand er aan kan sleutelen.

### Oude branches weggooien

1. Klik op je **branch naam**.
2. Rechts bij de lijst met namen zie je een prullenbak symbool.
3. Klik er op om je oude taken na merge weg te gooien.

---

## Snel Pushen en Pullen

### Upload je lokaal opgeslagen code naar GitHub (Push)

1. Klik in je source control tab bovenaan op de drie bolletjes (`...`) rechtsboven in de hoek van dat specifieke kader.
2. Kies "Push".
3. Hij laadt ze naar GitHub.

**Of via het snelle commando-menu:**

- Druk `Ctrl+Shift+P` (Command Palette)
- Typ `git push` en doe enter.

### Download al je teamgenoten hun nieuwe tekst en code (Pull)

Zorg dat je dit **altijd** doet vóór je begint te schrijven.

1. Klik in je source control tab op de drie puntjes (`...`).
2. Kies "Pull".

**Gelijk via het menu:**

- Druk `Ctrl+Shift+P`
- Typ `git pull` en doe enter.

---

## Alles tegelijk (Sync)

Een handige shortcut in VS Code die je zelf niet met 2 commando's aan het typen zet:

1. Ga in de source control naar de drie puntjes (`...`).
2. Kies "Sync".
3. Hij upload dan eerst lokaal opgeslagen bestanden naar boven, en vult je dan meteen veilig terug aan met wat online nieuw te rapen valt.

**Sneller:**
Typ `git sync` in de command palette (`Ctrl+Shift+P`).

---

## Issues & Pull Requests Beheren in je editor

Dankzij de extensie hoef je hiervoor niet meer naar GitHub te surfen in de browser.

### Issues lezen

1. Klik links in de zijbalk op het megafoon of GitHub icoon.
2. Daar laadt hij alle taken die wachten (Issues).
3. Klik erop om alle tekst erin te lezen en meteen online te commenten vanuit je bestand.

### De uiteindelijke Pull Request via je editor sturen

Je bent klaar met committen en pushen. Je theorie is klaar en mag naar de hoofdtak van je repo gezet worden:

1. In datzelfde GitHub overzicht (zijbalk) klik je helemaal bovenaan op het mapje om in te klappen.
2. Klik daar via je eigen branch instellingen op "Create Pull Request".
3. Vul gewoon snel de titel en omschrijving in zoals gewend.
4. Let er altijd scherp op dat je "Base branch: main" aanduidt.
5. Klik "Create".
   Nu komt de vraag toe op de GitHub server. Wijzigingen worden niet per ongeluk overschreven en de beheerders controleren wat je in de PR hebt gestoken.

---

## Waar meldt hij zich af?

In de vorm van gewone notificaties rechts beneden waarschuwt hij je als:

- Mensen je Pull request weigeren of becommentariëren.
- Je offline de 'Main' branch vergeet bent te updaten (pullen) terwijl er nieuw materiaal op de wolk staat.
- Je bestanden ruzie hebben met versiebeheer bestanden op een andere branch theorie-wise (Conflicts).

Hou dus het bel icoontje beneden rechts goed in de gaten.

---

## Enkele grote typische fouten (en hoe ze op te lossen)

### Fout 1: "Publish Branch" in de plaats van "Push" wat er staat

- **Probleem:** Je hebt offline net gekozen voor een nieuwe branch te maken, maar deze bestond nog niet online op de wolk (cloud repository). Je probeerde het door te sturen maar Git snapt niet waar naar toe.
- **Oplossing:** In het source tabblad in je VS Code zal hij vanzelf "Publish Branch" zetten, waarbij hij hem dan online en lokaal creëert op hetzelfde punt qua bestanden waarna hij automatisch verder met je push workflow kan doen voor al die tekst op dat ticket.

### Fout 2: Stilaan zitten werken op de 'main' branch in plaats van op een taak

- **Waarom is dit een ramp?** Omdat jij plots rechtstreeks lokaal bewerkingen inboekt op exact hetzelfde stuk papier als wat elke andere persoon live op dat eigenste moment uittrekt om zijn versie theorie uit de master repository the halen via zijn pull request! Eruit gegarandeerd conflicten en een dikke knoedel als er veel studenten tegelijk pushen en pullen. Nooit direct in de main committen of pushen!
- **Dit los je op gans in het begin:** Maak telkens een tak ("Create branch from..") en dan gaat git voor alles van je afschermen bij het opslaan en typen in je document bestanden.
- **En als ik toch te laat was?** Geen stress. Zolang je de VS Code knop pushen niet indrukte en alleen stiekem code lokaal typte heb je lokaal je offline text behouden en niks gemold. Dan forceer je nu "create new branch from..." te maken op en neemt hij alle tekst met zich mee in dat zijdokje. Ga later met "discard change" terug in main en haal lokaal opnieuw een pull file version fresh uit online cloud source. Daarna schakel opnieuw en stroom netjes door in je nieuwe branch die was aangemaakt om de document push/PR wel goed af te leggen.

### Fout 3: "Oeps, ik schreef de halve cursus theorie al, maar heb helemaal nog niet netjes gepulled bij de start."

- **Waarom problematisch?** Stel, klasgenoot Jonas en Jelle verwerken samen paragraaf 3 om half drie na de les over dat vak. Klasgenoot Jonas is snel en commit direct door. Om vier uur sluit klasgenoot Jelle af door netjes diezelfde paragrafen theorie over te schrijven en in een PR af te leggen met zijn bestanden. Git kijkt voor een pull van de online server code de dag erna met Jelle zijn bestanden. Jonas ziet theorie missen op die paragrafen lokaal. "Iemand heeft m'n alinea verwijderd?" Jelle trok zonder na eerst zijn document verleden correct up to date bij the houden offline wat de cloud hem zei van paragrafen! Als je bestanden voorheen fout lagen overschrijf je fout...
- **Oplossing:** Trek bij de opstart gewoon meteen via de command palette op sync/pull of gebruik de bolletjes van het version tree tabblad en pull.

### Fout 4: PR gemaakt, maar de doeltak klopt van geen kanten!

- **Waarom problematisch?** Stel dat je niet lette op 'main' toen je de PR opzette. Met gevolg kan er per onbedoeld theorie en code gestuurd zijn direct weggeschreven op het repo branch file van klasgenoot Jonas "Thermodynamica_wissel_tak_12_fiches" in de plaats van op het centrale platform en theorie samenvattingen mapjes structuur op de `main`. Het verdwijnt niet. Wel onvindbaar.
- **Opgelet met:** Kijk dubbel dat je als Basis vertakkings branch instelling "Main" kiest voordat in creatie te leggen.

---

## Samenvattend the basic daily flow

Als je niet weet waar je bestanden net steken moet beginnen. Loop dit pad de eerstkomende paar keren mee in je hoofd wanneer je start:

```
1. Open up VS Code in je map waar alles ingesteld zat na het download moment van repository offline kloning de eerste keer setup over je Fork.
   ↓
2. Ga in de linker menu control tabs en bevestig dat the main file versie up was door er van te kiezen als the source. "Switch branch -> Main".
   ↓
3. Druk the 3 puntjes onderaan over je version file of via (CTRL + SHIFT + P) `git pull`. Nu update je lokale structuur zichzelf als nieuwe data bij iemand doorstroomde en up and away.
   ↓
4. Meteen in datzelfde hoekje en tabs kies now: "Create new branch from..:". Benoem deze je taak naam (bv "Hoofdstuk 3 Elektronica start-to-make")
   ↓
5. Studeer. Schrijf code LaTeX of typst. Test je bestanden PDF rendering in tab. Sla op in document.
   ↓
6. Bij de eerste goede opsplitsing log je in het formulier the message tab met message title tekst de uitleg (bv:"toegevoegd alinea diode spanning berekenen theorie"). Commit het bestand met dat checkmark symbool in de control manager links bar.
   ↓
7. Voor het afsluiten: Gebruik de "Push/Sync" (In Command palette CTRL+SHIFT+P over the 3 bolletjes click-dropdowns op Git). Nu kopieer hij de save versie van je computer over de wolk in de eigen online map die de fork branch werd genoemd waar iedereen remote the theorie over code en log zag verplaatsen in het online file github interface structuren zonder main the wijzigen zelf offline en remote in de database master branch.
   ↓
8. En als ik the theorie definitief wil delen op de echte syllabus handleiding in main na uren van dagen van updates de hele week? Dan ga links naar je git extensions Pulls view: "Create PR". Nu bekijkt je project manager dit document review wijzigingen op errors na build van document PDF online action bot checks before accept the doc request.
```

## Bonus shortcut commands

Deze zal je via `CTRL + SHIFT + P` regelmatig vanzelf intypen in je command box om dat menu weg the klikken om vaart the maken:

- `git pull`
- `git push`
- `git sync`
- `git commit`
- `git branch` (om er mee over te switchen)
- `Ctrl+Shift+G` - Open het hele Source Control paneel

Zit je muurvast met rare waarschuwingen (issues of conflicts the code met "Accept current changes etc") bij het opslagen en je raakt er niet zomaar direct wijs over wat te accepteren op github in je tex of markdown, gooi de fout gerust ter commentaar de chat op onze faculteit discord met de klas in de server als ping met het file and de issue log error print of vraag Ruben ("@eggmansmile") er over het op the rapen online!
