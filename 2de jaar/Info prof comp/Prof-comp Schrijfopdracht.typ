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
  == Context (buiten woordtelling)

  Tijdens het IB1-project ontstond een conflict tussen twee teamgenoten. Persoon 1 raakte enorm gefrustreerd omdat Persoon 2 veel minder ervaren was omdat elke stap opnieuw en opnieuw moest worden uitgelegt en Persoon 2 duidelijk veel minder technische kennis. De motivatie van Persoon 2 was ook niet echt hoog.

  De docent en ik (teamleider) probeerden naar een oplossing te zoeken, maar de docent deed uiteindelijk niks en ik nam het grootste deel van het werk over.

  Als teamleider zocht ik samen met de docent naar een oplossing. De docent probeerde de vrede te bewaren en beloofde later in te grijpen, maar deed dit uiteindelijk niet. Dit zorgde voor extra frustratie in de hele groep. Om de deadline te halen heb ik het deel van Persoon 2 grotendeels zelf afgemaakt. Het project is gelukkig geslaagd, maar het conflict is nooit echt uitgesproken.

  We waren opgesplits in twee groepen. Het deel mechanica/bouwkunde en electronica/ict. Persoon 1 en 2 zaten samen in de groep electronica/ict. Ik zat in de groep mechanica/bouwkunde maar was ook teamleider.

  #align(center, block(
    width: 70%,
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
  ))] <no-wc>


== Stap 1: Ervaring & Observatie

Rond week 4, bij het maken van ons proof of concept, bleek dat Persoon 2 technisch flink achterstond. Van designen en lasercutten tot het aansluiten van de motor, alles moest stap voor stap uitgelegd worden. Ik merkte dat Persoon 2 hierdoor enorm onzeker was.


Persoon 1 was heel ervaren, had het eigen deel al af en wachtte tot Persoon 2 klaar was. Omdat dit niet vooruit ging, raakte Persoon 1 geërgerd samen met andere teamleden. In plaats van te helpen, begon Persoon 1 kritiek te leveren en uiteindelijk slecht te praten achter de rug van Persoon 2.

De docent had beide partijën en ik samengenomen om dit te bespreken en voor een oplossingen te zoeken (die er niet gekomen is).

Andere teamgenoten van electronica/ict waren ook soms uitgevallen, een door mentale problemenen en een andere die niet veel deed. Heel het deel ICT werd dus getrokken door twee mensen.

Ik heb daarna het deel van Persoon 2 grotendeels zelf afgemaakt om de deadline te halen. Het project is gelukkig geslaagd, maar het conflict is nooit echt uitgesproken.

== Stap 2 & Stap 3: Gedachten, gevoelens en behoeftes

#table(
  columns: (2.2fr, 1fr, 1fr, 1.2fr),
  align: left + horizon,
  fill: (col, row) => {
    if row == 0 or row == 2 {
      if col == 1 { rgb("ff9999") } else if col == 2 { rgb("ffb3b3") } else if col == 3 { rgb("ffdd77") }
    } else {
      if col > 0 { rgb("f2f2f2") }
    }
  },
  inset: 8pt,
  [*THOUGHTS*], [*FEELINGS (TOEN)*], [*FEELINGS (NU)*], [*NEEDS*],

  [
    _Het is soms lastig om als teamleider tussen de frustratie van Persoon 1 en de onzekerheid van Persoon 2 te staan. Ik zie dat Persoon 1 bijna ontploft van ongeduld omdat deze persoon denkt het alleen sneller te kunnen, maar teamgenoten afkraken helpt ons project niet vooruit. Persoon 2 moet actiever bijleren en initiatief tonen om de deadline te halen. Deze constante spanning zorgt voor veel stress. Ik wil uiteindelijk gewoon dat we die motor werkend krijgen en het project samen op tijd afronden._
  ],
  [
    Frustratie, Stress, Onmacht, Teleurstelling
  ],
  [
    Opgelucht (over het slagen), Teleurgesteld (over de groepsdynamiek)
  ],
  [
    Duidelijkheid, Samenwerking, Efficiëntie, Respect, Relaxatie
  ],

  [*THOUGHTS*], [*FEELINGS (TOEN)*], [*FEELINGS (NU)*], [*NEEDS*],

  [
    *Persoon 1:* "Ik kan het niet geloven. Waarom zit ik in een groep met iemand die geen motor aan een batterij kan aansluiten? Ik doe het project liever alleen af."\
    *Persoon 2:* "Ik weet dat ik minder ervaring heb, maar de sfeer in de groep helpt niet om mij op mijn gemak te laten voelen bij het bijleren."
  ],
  [
    *Persoon 1:* Gefrustreerd, Ongeduldig, Machteloos\
    *Persoon 2:* Onzeker, Geïntimideerd, Moedeloos
  ],
  [
    *Persoon 1:* Onverschillig, Verongelijkt\
    *Persoon 2:* Opgelucht, Terughoudend
  ],
  [
    *Persoon 1:* Voortgang, Deskundigheid, Efficiëntie\
    *Persoon 2:* Ondersteuning, Veiligheid, Erkenning
  ],
)


== Stap 4: Verbindende verzoeken

+ *Verzoek aan Persoon 1*: "Zou je bereid zijn om tijdens de volgende vergadering samen de taken te herbekijken? Als we de technische taken meer bij jou leggen, kun jij blijven doorwerken en hoef je minder tijd te steken in constante uitleg." \
  _Toelichting: Dit sluit aan bij de wens voor *efficiëntie*, *voortgang* en het halen van de deadline van deze persoon, terwijl het de spanning wegneemt rondom het begeleiden van anderen._

+ *Verzoek aan Persoon 2*: "Zorg dat je direct aangeeft wanneer een opdracht niet duidelijk is? Dan kunnen we kijken naar een taak die beter aansluit bij wat je nu wel goed kunt doen, of samen bepalen hoe we je beter kunnen ondersteunen zodat je wel actief kunt blijven bijleren." \
  _Toelichting: Dit geeft de nodige *veiligheid* en *ondersteuning*, maar motiveert deze persoon ook om zelf verantwoordelijkheid te nemen voor de eigen taken, zonder dat we de persoon onder de bus gooien._

+ *Verzoek aan de Docent*: "Kunt u ons helpen door een overleg te houden waarin we de rollen binnen het team duidelijker maken? We zouden hierdoor betere op de skills van de teamgenoten kunnen afstellen en hebben we een goed plan." \
  _Toelichting: Dit vraagt om de benodigde *duidelijkheid* (mijn eigen behoefte als teamleider) en professionele ondersteuning om de sfeer in de groep te herstellen._


== Stap 5: Voordelen en limitaties van verbindende communicatie

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

* Voorbeeld A (Project IB1)*: Verbindende communicatie had enorm kunnen helpen om de problemen open op tafel te leggen. Persoon 2 had eerlijker grenzen en onzekerheden kunnen uitspreken, zonder zich aangevallen te voelen. Persoon 1 had frustraties op een veilige manier kunnen delen, in plaats van achter iemands rug om te klagen. Hierdoor verschuift de focus van een persoonlijke ruzie naar een praktische taakverdeling. De docent had hierop kunnen inspelen door direct een oplossing te bieden in plaats van het uit te stellen.
De grote limitatie blijft wel de tijd: we communiceren dan misschien beter als team, maar het lost de technische achterstand en de naderende deadline niet magisch op. Het werk moet nog steeds gedaan worden.

* Voorbeeld B (Deadlines en onbereikbaarheid)*:
Stel dat in een ander project iemand teksten steeds te laat doorstuurt, wat zorgt voor stress bij degene die het verslag moet inleveren.

- *Zonder verbindende communicatie*: De groep valt uit: "Je bent altijd te laat en negeert ons, je verpest ons cijfer."

- *Met verbindende communicatie*: Je zegt: "Ik zie dat je stuk er nog niet is (observatie). Dat geeft me stress (gevoel), want ik heb tijd nodig om alles na te kijken voor de deadline (behoefte: rust). Is er iets aan de hand en moeten we even kijken hoe we de taken kunnen schuiven? (verzoek)."

Op deze manier kom je er misschien achter dat iemand privé in de knoop zit en zoek je samen een oplossing. Maar net als in Voorbeeld A is hier de limitatie dat de stress van de deadline blijft en de rest van de groep als nog het extra werk moet opvangen.

Er kan wel een betere grond voor respect gemaakt worden door elkaars problemen te begrijpen en hier rekening mee te houden.

#v(2em)
#line(length: 100%, stroke: 0.5pt + luma(200))
*Totaal aantal woorden (Stap 1-5):* #total-words
