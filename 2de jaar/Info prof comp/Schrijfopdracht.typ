#import "../../school-template.typ": *
#import "@preview/wordometer:0.1.5": total-words, word-count

#show: word-count.with(exclude: <no-wc>)


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

#[
  == Context

  Tijdens het IB1-project ontstond een conflict tussen twee teamgenoten. Persoon 1 raakte enorm gefrustreerd omdat Persoon 2 veel minder ervaren was. Omdat elke stap opnieuw uitgelegd moest worden, hield dit de progressie van het project flink tegen.



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
  )] <no-wc>




== Ervaring & Observatie (Stap 1)

Rond week 4, bij het maken van ons proof of concept, bleek dat Persoon 2 technisch flink achterstond. Van designen en lasercutten tot het aansluiten van de motor, alles moest stap voor stap uitgelegd worden. Ik merkte dat Persoon 2 hierdoor enorm onzeker was.

Persoon 1 was juist heel ervaren, had het eigen deel al af en wachtte tot de rest klaar was. Omdat dit niet vooruit ging, raakte Persoon 1 geërgerd samen met andere teamleden. In plaats van te helpen, begon Persoon 1 kritiek te leveren en uiteindelijk slecht te praten achter de rug van Persoon 2.

Als teamleider zocht ik samen met de docent naar een oplossing. De docent probeerde de vrede te bewaren en beloofde later in te grijpen, maar deed dit uiteindelijk niet. Dit zorgde voor extra frustratie in de hele groep. Om de deadline te halen heb ik het deel van Persoon 2 grotendeels zelf afgemaakt. Het project is gelukkig geslaagd, maar het conflict is nooit echt uitgesproken.



== Gedachten en gevoelens (Stap 2+ 3)

#table(
  columns: (0.8fr, 2.2fr, 1.3fr, 1.3fr),
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
    _Het is soms lastig om als teamleider tussen de frustratie van Persoon 1 en de onzekerheid van Persoon 2 te staan. Ik zie dat Persoon 1 bijna ontploft van ongeduld omdat deze persoon denkt het alleen sneller te kunnen, maar teamgenoten afkraken helpt ons project niet vooruit. Tegelijkertijd moet Persoon 2 echt actiever bijleren en initiatief tonen om de deadline te halen. Deze constante spanning zorgt voor veel stress; ik wil uiteindelijk gewoon dat we die motor werkend krijgen en het project samen op tijd afronden._
  ],
  [
    Frustratie, Stress, Onmacht, Teleurstelling,
  ],
  [
    Duidelijkheid, Samenwerking, Efficiëntie, Respect, Relaxatie
  ],

  [], [*THOUGHTS*], [*FEELINGS*], [*NEEDS*],

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
  _Toelichting_: Dit sluit aan bij de wens voor *efficiëntie* en het halen van de deadline van deze persoon, terwijl het de spanning wegneemt rondom het begeleiden van anderen.

+ *Verzoek aan Persoon 2*: "Zou je voortaan direct willen aangeven wanneer een instructie niet duidelijk is? Dan kunnen we kijken naar een taak die beter aansluit bij jouw kennis, of samen bepalen hoe we je beter kunnen ondersteunen zodat je wel actief kunt blijven bijleren." \
  _Toelichting_: Dit biedt de nodige veiligheid en ondersteuning, maar motiveert deze persoon ook om zelf verantwoordelijkheid te nemen voor de eigen groei, zonder dat het klinkt als een verwijt.

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
    fill: (col, row) => if row == 0 { if col == 0 { schoolGreen } else { schoolOrange } } else if calc.even(row) {
      luma(250)
    },
    table.header(
      align(center, text(fill: white, weight: "bold")[Voordelen]),
      align(center, text(fill: white, weight: "bold")[Limitaties]),
    ),
    [Het zorgt ervoor dat problemen (zoals de motor die niet werkt) eerlijker besproken worden.],
    [Het overleg vraagt veel tijd, wat lastig is bij een naderende deadline.],

    [De sfeer in het team blijft werkbaar omdat we behoeftes uitspreken in plaats van verwijten.],
    [Het werkt alleen als iedereen, ook Persoon 1, bereid is om op een andere manier te praten.],

    [Het helpt Persoon 2 om sneller te groeien door een veiligere leeromgeving.],
    [Het lost de technische kennisachterstand niet direct op. Het maakt het enkel bespreekbaar.],
  ),
)

*Voorbeeld A (Project IB1)*: Verbindende communicatie had enorm kunnen helpen om de problemen open op tafel te leggen. Persoon 2 had eerlijk grenzen en onzekerheden kunnen uitspreken, zonder zich aangevallen te voelen. Persoon 1 had frustraties op een veilige manier kunnen delen, in plaats van achter iemands rug om te klagen. Hierdoor verschuift de focus van een persoonlijke ruzie naar een praktische taakverdeling. De docent had hierop kunnen inspelen door direct een oplossing te bieden in plaats van het uit te stellen.
De grote limitatie blijft wel de tijd: we communiceren dan misschien beter als team, maar het lost de technische achterstand en de naderende deadline niet magisch op. Het werk moet nog steeds gedaan worden.

*Voorbeeld B (Deadlines en onbereikbaarheid)*:
Stel dat in een ander project iemand teksten steeds te laat doorstuurt, wat zorgt voor stress bij degene die het verslag moet inleveren.

- *Zonder verbindende communicatie*: De groep valt uit: "Je bent altijd te laat en negeert ons, je verpest ons cijfer." De persoon klapt dicht of wordt boos.

- *Met verbindende communicatie*: Je zegt: "Ik zie dat je stuk er nog niet is (observatie). Dat geeft me stress (gevoel), want ik heb tijd nodig om alles na te kijken voor de deadline (behoefte). Is er iets aan de hand en moeten we even kijken hoe we de taken kunnen schuiven? (verzoek)."
Op deze manier kom je er misschien achter dat iemand privé in de knoop zit en zoek je samen een oplossing. Maar net als in Voorbeeld A is hier de limitatie dat de stress van de deadline blijft en de rest van de groep alsnog het extra werk moet opvangen.

#v(2em)
#line(length: 100%, stroke: 0.5pt + luma(200))
*Totaal aantal woorden (Stap 1-5):* #total-words
