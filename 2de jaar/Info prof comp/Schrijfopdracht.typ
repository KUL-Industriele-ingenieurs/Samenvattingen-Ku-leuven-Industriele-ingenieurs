#import "../../school-template.typ": *


#show: project.with(
  title: "Schrijfopdracht Professionele communicatie",
  course: "Ingenieurswetenschappen",
  authors: ("Ruben Ryckaert",),
  academic_year: "2025-2026",
  show_disclaimer: false,
  show_outline: false,
  short_title: true,
)


= Opdracht

== Context

Tijdens het IB1 project was er een conflict tussen twee teamgenoten. Tijdens het project was iemand enorm gefrustreerd geraakt omdat een andere teamgenoot veel minder ervaren was en eigenlijk niet veel kon helpen met het project. Er moest constant elke stap en elk ding moest uitgelegd worden en het hield de progressie van het project achter.



#block(
  width: 100%,
  stroke: 0.5pt + luma(200),
  radius: 6pt,
  clip: true,
  table(
    columns: (auto, 1fr),
    inset: 10pt,
    align: left + horizon,
    stroke: none,
    fill: (col, row) => if row == 0 { schoolBlue } else if calc.even(row) { luma(250) },
    table.header(
      text(fill: white, weight: "bold")[Persoon / Groep], text(fill: white, weight: "bold")[Rol / Beschrijving]
    ),
    [Ik], [Teamleider],
    [Persoon 1], [Ervaren persoon],
    [Persoon 2], [Minder ervaren persoon],
    [Andere teamleden], [Teamleden die minder een probleem hadden maar ook gefrustreerd waren met Persoon 2],
    [Docent], [Probeerde samen met de teamleider naar oplossingen te zoeken voor het conflict.],
  ),
)



== Ervaring & Observatie (Stap 1)


- Persoon 1 was duidelijk gefrustreerd en wilde niet meer samenwerken en het gewoon zelf afmaken
- Persoon 2 was niet meer gemotiveerd maar deed hun best om het conflict op te lossen
- Persoon 2 kon niet technisch mee en het ging niet in de tijd van het project opgelost geraken (kon geen motor aan een batterij schakelen).
- Persoon 1 kon het niet geloven dat iemand zo technisch achter kon staan
- Ik was teamleider en probeerde samen met de docent voor een oplossingen te zoeken
- Andere mensen van het team hadden minder een probleem maar waren ook gefrustreerd met Persoon 2
- Persoon 1 zei slechte dingen over Persoon 2 achter hun rug.
- De docent was niet enorm hulpzaam. Probeerde wat vrede te creëren maar kon niet helpen met het echt probleem in het project.
- Persoon 2 was niet heel gemotiveerd om snel bij te leren. De situatie en kritiek hielp ook niet veel.
- De docent beloofde om later een oplossing te voorzien _Is er niet gekomen_. Dit zorgde voor extra frustratie bij mij en de rest van het team.



== Gedachten en gevoelens (Stap 2+ 3)

#table(
  columns: (auto, 2.2fr, 1.1fr, 1.1fr),
  align: left + horizon,
  fill: (col, row) => {
    if row == 0 or row == 2 {
      if col == 2 { rgb("ff9999") } else if col == 3 { rgb("ffdd77") }
    } else {
      if col > 0 { rgb("f2f2f2") }
    }
  },
  inset: 10pt,
  [], [*THOUGHTS*], [*FEELINGS*], [*NEEDS*],

  [*ABOUT YOU*],
  [
    _Het is soms lastig om als teamleider tussen de frustratie van Persoon 1 en de onzekerheid van Persoon 2 te staan. Ik zie dat Persoon 1 bijna ontploft van ongeduld omdat hij denkt dat hij het alleen sneller kan, maar teamgenoten afkraken helpt ons project niet vooruit. Tegelijkertijd moet Persoon 2 echt actiever bijleren en initiatief tonen om de deadline te halen. Deze constante spanning zorgt voor veel stress; ik wil uiteindelijk gewoon dat we die motor werkend krijgen en het project samen op tijd afronden._
  ],
  [
    Frustratie, Stress, Onmacht, Teleurstelling,
  ],
  [
    Duidelijkheid, Samenwerking, Efficiëntie, Respect, Relaxatie
  ],

  [], [*THOUGHTS (?)*], [*FEELINGS (?)*], [*NEEDS (?)*],

  [*ABOUT THE\ OTHER(S)*],
  [
    *Persoon 1:* "Ik kan het niet geloven. Waarom zit ik in een groep met iemand die geen motor aan een batterij kan aansluiten? Ik doe het project liever alleen af."\
    *Persoon 2:* "Ik weet dat ik minder ervaring heb, maar de sfeer in de groep helpt niet om mij op mijn gemak te laten voelen bij het bijleren."\
    *Andere teamleden:* "Het is frustrerend dat Persoon 2 de technische kennis mist, maar de manier waarop Persoon 1 daarop reageert, verpest de sfeer voor ons ook."\
    *Docent:* "Ik wil de studenten de kans geven om dit zelf op te lossen, maar ik zie dat de technische kloof wel erg groot is."\
  ],
  [
    *Persoon 1:* Gefrustreerd, Ongeduldig, Machteloos\
    *Persoon 2:* Onzeker, Geïntimideerd, Moedeloos\
    *Andere teamleden:* Ambivalent, Onrustig\
    *Docent:* Afwachtend, Neutraal, Onvrij
  ],
  [
    *Persoon 1:* Voortgang, Deskundigheid, Efficiëntie\
    *Persoon 2:* Ondersteuning, Veiligheid, Erkenning\
    *Andere teamleden:* Harmonie, Duidelijkheid, Cohesie\
    *Docent:* Zelfredzaamheid van studenten, Overzicht
  ],
)



+ *Verzoek aan Persoon 1*: "Zou je bereid zijn om tijdens de volgende vergadering samen de taken te herbekijken? Als we de kritieke technische taken meer bij jou leggen, kun jij de gewenste snelheid aanhouden en hoef je minder tijd te steken in constante uitleg." \
  _Toelichting_: Dit sluit aan bij zijn wens voor *efficiëntie* en het halen van de deadline, terwijl het de spanning wegneemt rondom het begeleiden van anderen.

+ *Verzoek aan Persoon 2*: "Zou je voortaan direct willen aangeven wanneer een technische instructie niet volstaat, zodat we samen kunnen zoeken naar een deeltaak die beter aansluit bij jouw huidige kennisniveau? Je moet je wel actief inzetten om bij te leren dus probeer van acties en beslissingen van andere mensen te leren zodat je bij kunt." \
  _Toelichting_: Hiermee wordt tegemoet gekomen aan de behoefte aan *veiligheid* en ondersteuning, maar wordt ook de verantwoordelijkheid voor groei bij hem neergelegd.

+ *Verzoek aan de Docent*: "Kunt u ons helpen door een overleg te faciliteren waarin we de rollen binnen het team expliciet maken? Dit zou ons helpen om de technische blokkade om te zetten in een werkbaar plan." \
  _Toelichting_: Dit vraagt om de benodigde *duidelijkheid* en professionele ondersteuning om de harmonie in de groep te herstellen.





== Voordelen en limitaties van verbindende communicatie (Stap 5)

#block(
  width: 100%,
  stroke: 0.5pt + luma(200),
  radius: 6pt,
  clip: true,
  table(
    columns: (1fr, 1fr),
    inset: 10pt,
    stroke: none,
    fill: (col, row) => if row == 0 { schoolBlue } else if calc.even(row) { luma(250) },
    table.header(
      text(fill: white, weight: "bold")[Mogelijkheden (Possibilities)],
      text(fill: white, weight: "bold")[Limitaties (Limitations)],
    ),
    [Het zorgt ervoor dat problemen (zoals de motor die niet werkt) eerlijker besproken worden.],
    [Het overleg vraagt veel tijd, wat lastig is bij een naderende deadline.],

    [De sfeer in het team blijft werkbaar omdat we behoeftes uitspreken in plaats van verwijten.],
    [Het werkt alleen als iedereen, ook Persoon 1, bereid is om op een andere manier te praten.],

    [Het helpt Persoon 2 om sneller te groeien door een veiligere leeromgeving.],
    [Het lost de technische kennisachterstand niet direct op; het maakt het enkel bespreekbaar.],
  ),
)

*Voorbeeld A (Project IB1)*: Als we in het heetst van de strijd verbindende communicatie hadden gebruikt, had ik als teamleider eerlijker kunnen uitspreken dat ik de controle wilde behouden zonder Persoon 2 te ontmoedigen. De limitatie was echter dat de motor nog steeds niet aangesloten was. Communicatie loste de technische realiteit niet op, maar had de escalatie tussen Persoon 1 en 2 kunnen voorkomen.

*Voorbeeld B (Toekomstige werkplek)*: Stel dat een ontwerp later in een fabriek faalt. In plaats van een collega de schuld te geven, kan ik uiten dat ik nood heb aan *betrouwbaarheid* van gegevens. Dit bespaart een ruzie, maar de machine is nog steeds kapot en moet nog steeds mechanisch hersteld worden door iemand met de juiste kennis.
