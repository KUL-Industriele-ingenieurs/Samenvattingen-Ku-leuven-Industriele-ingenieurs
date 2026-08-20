# Gebruik van AI in dit project

AI is een enorm handige tool en je mag ze zeker gebruiken als je meehelpt aan de
samenvattingen. Ik gebruik zelf ook AI. Maar het is belangrijk dat we hier geen
**AI-slop** beginnen te maken, en daarom staan hieronder een paar regels en
richtlijnen. De bedoeling is niet om AI te verbieden, wel om te vermijden dat
alles zomaar door een model geschreven wordt.

---

## Waar AI wel voor mag dienen

Dit zijn allemaal dingen waar ik AI zelf ook voor gebruik. Ze maken de
samenvattingen net overzichtelijker.

### Taal

- **Spellingchecker.** Nota's die je tijdens de les typt zitten nu eenmaal vol
  tikfouten. Laat een model daar gerust over gaan.
- **Zinsconstructie-checker.** Kromme of veel te lange zinnen laten rechttrekken,
  zonder dat de inhoud verandert.
- **Stijladviseur.** Wat zet je vetgedrukt, waar hoort een kader, hoe deel je een
  lap tekst op in secties. Opmaak dus, niet de inhoud.

### Figuren

- **Figuren maken** met de Typst- en LaTeX-packages: `cetz`, `tikzpicture`,
  `pgfplots`, matplotlib, ... Zo'n tekening zelf uitschrijven kost veel tijd, en
  een model komt daar snel mee weg.
- **Tekst uit een figuur overnemen**, of een oefening die op een slide uitgewerkt
  staat omzetten naar tekst in de samenvatting.

### Inhoud nakijken

- **Kenniscontroleur.** Laat je uitleg nalezen op fouten.
  > **Wijs het model wel naar de bronnen van het vak.** AI schrijft soms dingen
  > die op zich kloppen, maar niets te maken hebben met hoe het in dit vak
  > gegeven wordt. Geef dus de slides, de cursus of je eigen nota's mee.
- **Oefeningchecker.** Je uitwerking laten controleren en laten aanwijzen waar je
  fout loopt.

### Structuur en project

- **Plaatsingshulp.** Je hebt een stuk tekst maar je weet niet waar het hoort of
  waarmee je het moet linken. AI kan helpen zoeken waar het past in de bestaande
  structuur en welke verwijzingen erbij horen.
- **Projectcontroller.** Issues aanmaken en opschonen, helpen met git, commits
  schrijven en pull requests opstellen.

---

## Wat je altijd zelf nakijkt

Ook bij het toegelaten gebruik hierboven blijven er drie dingen die je niet aan
een model kunt overlaten.

### 1. Laat nooit iets verzinnen

Een model vult moeiteloos een getal, een normnummer of een figuur aan die
helemaal niet in de slides staat. Dat is het gevaarlijkste soort fout, want het
leest perfect en je merkt het pas op het examen.

**Regel:** elk getal, elke norm en elke formule moet terug te vinden zijn in het
cursusmateriaal. Vind je het niet terug, dan gaat het eruit of zet je er een
`#TODO` bij.

### 2. Gebruik de notatie van het vak

Modellen schrijven graag $G(s)$ en $H(s)$ waar het vak $T_{cl}$ of $K_c$
gebruikt. Sluit aan bij de notatie van de prof, anders herken je je eigen
samenvatting niet meer naast de slides.

### 3. Compileren is niet hetzelfde als kloppen

Zeker bij figuren: je krijgt vaak Typst- of LaTeX-code die netjes compileert maar
een verkeerde tekening oplevert. Bekijk dus altijd de PDF voor je pusht, niet
enkel de output van de compiler.

---

## Waar AI niet voor dient

**AI mag je schrijven niet overnemen.** Niet als jij daardoor geen beslissingen
meer neemt over wat er in de tekst staat.

Een mens brengt een idee en een gedachtegang veel beter over dan een model,
omdat een mens de problemen kent en weet waarom een bepaalde oplossing werkt.
Dat is precies wat een goede samenvatting doet: uitleggen *waarom* iets zo is,
niet enkel *dat* het zo is.

> **Ik accepteer geen vibe-schrijven.**

Je blijft dus zelf verantwoordelijk voor wat je pusht. Wat er in een pull request
staat, is jouw tekst — ook de stukken waar een model aan meegeholpen heeft.
