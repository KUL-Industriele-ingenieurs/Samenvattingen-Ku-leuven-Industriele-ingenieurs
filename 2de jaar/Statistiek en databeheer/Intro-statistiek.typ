// chapter1_inleiding.typ
// Eerste hoofdstuk - Inleiding
// Dit bestand wordt geladen via #include "chapters/chapter1_inleiding.typ"

#import "../../school-template.typ": *

= Inleiding <ch:inleiding>

== Info vak Statistiek <sec:info-vak>
Dit vak is *flipped classroom* wat betekent dat je de theorie thuis bestudeert en in de les oefeningen maakt. De theorie is te vinden in de slides en de oefeningen zijn te vinden in de opdrachten. #belangrijk("Bekijk de planning om te zien wat je moet voorbereiden !WEES GOED VOORBEREID VOOR DE LES!").
#figure(
  image("Schedule2026.png"),
  caption: "Planning van het vak",
  label: <fig:planning>,
)


Je kunt oefeningen maken en je hebt nog info in #link("https://jupyterhub.set.kuleuven.be/sdm-t2asd2/user/q1665834/git-pull?repo=https%3A%2F%2Fgitlab.kuleuven.be%2Fu0124139%2Fsdm&urlpath=lab%2Ftree%2Fsdm%2Fwelcome.ipynb&branch=main&targetPath=sdm")[Jupyterlab].


Je hebt op toledo ook meerkeuzevragen om te oefenen.

== Examen

Op het examen krijg je een formularium _zie begin_ en alle code van de labo's. Je moet vooral leren de code begrijpen en kunnen toepassen. Je moet ook de theorie kennen en kunnen toepassen. De oefeningen die je in de les maakt zijn een goede voorbereiding op het examen.

= Hoofdstuk 1: Introductie tot Statistiek <ch:intro-statistiek>

Statistiek is een wiskundige discipline die zich bezighoudt met het analyseren en interpreteren van gegevens. Statistiek is een belangrijke tool voor het maken van beslissingen in vele velden, zoals wetenschap, economie, zorg en techniek.

Je hebt verschillende soorten statistiek:

#concept(title: "Soorten statistiek")[
  - *Beschrijvende statistiek*: Statistiek die zich bezighoudt met het beschrijven van gegevens
  #wrap-figure(
    image("beschrijvende statistiek.png", width: 5.5cm),
    caption: [beschrijvende statistiek],
  )[
    - *Verklarende statistiek*: Data halen uit de populatie zoals _bv. Wat is de gemiddelde reactietijd tijdens het rijden_. Dit beschrijft dan een populatie maar in een onderzoek is er *onzekerheid*.
  ]

]

#concept(title: "Fundamentele statistiek")[
  - *Experiment*: Een observatie van een object, persoon waar je dan een waarde uit kan halen
  - *Populatie*: De volledige groep waar je je experiment op doet
  - *Veriable*: Een waarde die je kunt meten
  - *Steekproef*: Een subset van de populatie waar je je experiment op doet.
  - *Statische interferentie*: Welke omgevingsfactoren hebben een invloed op de variabele? Is onze steekproef aangetast door alleen mensen van een bepaalde populatie te gaan gebruiken? _bv. Veel medicatie werkt niet goed op mensen met een zwarte huidskleur omdat die minder in steekproeven zitten._
  - *Betrouwbaarheidsmeting*: Hoe betrouwbaar is een meting?
]

== Collecting data <sec:collecting-data>

Je gaat een experiemnt opstellingen met een randomized controlled trail.

Zoals testen wat het effect is van asprin op hartaanvallen of herseninfractie. Je hebt een groep mensen die een asprin drinken en een groep mensen die geen asprin drinken, de *Controle groep*. Je gaat dan de hartaanvallen of herseninfractie tellen en de gemiddelde tellen.

== Observational study <sec:observational-study>

Je gaat gewoon random rectuteren uit de populatie en je gaat die observeren op een bepaalde variabele. Zoals in een studie waar jongeren werden geobserveerd of ze een hartaandoening hadden.

*Aselecte steekproef:* Het is dus belangrijk dat we een goede steekproef hebben die random is genomen uit de populatie.
Dit is een aselecte steekproef.

= Hoofdstuk 2: Beschrijven van data <ch:hoofdstuk-2>

Dingen zoals pycharts en histrogrammen kunnen ons helpen om data
te *visualiseren*.

#figure(
  grid(
    columns: (1fr, 1fr),
    gutter: 2cm,
    cetz.canvas({
      import cetz.draw: *
      let data = (([A], 30), ([B], 40), ([C], 20), ([D], 10))
      let colors = gradient.linear(schoolBlue.lighten(20%), schoolBlue.darken(20%))
      chart.piechart(
        data,
        value-key: 1,
        label-key: 0,
        radius: 1.5,
        slice-style: colors,
        inner-radius: 0.5,
        outset: 1.5,
        stroke: none,
        inner-label: (content: (value, label) => text(white, str(value)), radius: 110%),
      )
    }),
    cetz.canvas({
      import cetz.draw: *
      plot.plot(
        size: (5, 3),
        x-label: "Klasse",
        y-label: "Freq",
        y-min: 0,
        y-grid: true,
        {
          let data = ((1, 5), (2, 10), (3, 7), (4, 3))
          let bar-style = (stroke: none, fill: gradient.linear(schoolRed.lighten(20%), schoolRed.darken(20%)))
          plot.add-bar(data, bar-width: 0.9, style: bar-style)
        },
      )
    }),
  ),
  caption: [Voorbeeld: Pie Chart en Histogram],
)

#figure(
  grid(
    columns: (1fr, 1fr),
    gutter: 4cm,
    cetz.canvas({
      import cetz.draw: *
      plot.plot(
        size: (5, 3),
        x-label: "Score",
        y-label: "Frequentie",
        {
          plot.add-bar(
            ((10, 2), (12, 5), (14, 8), (16, 12), (18, 5), (20, 3)),
            bar-width: 1.5,
            style: (stroke: none, fill: schoolBlue),
          )
        },
      )
    }),
    cetz.canvas({
      import cetz.draw: *
      plot.plot(
        size: (5, 3),
        x-label: $z$,
        y-label: $f(z)$,
        x-tick-step: 1,
        y-min: 0,
        {
          plot.add(
            domain: (-4, 4),
            samples: 100,
            label: "Normale Verdeling",
            style: (stroke: 2pt + schoolRed),
            x => 1 / calc.sqrt(2 * calc.pi) * calc.exp(-0.5 * x * x),
          )
        },
      )
    }),
  ),
  caption: "Resultaten van de Toets & Standaard Normale Verdeling",
)


*Variatie*: De spreiding van de data. Hoe ver zijn de data van elkaar?

*Central tendency*: De tendentie van de data. Hoe ver zijn de data van elkaar?
#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  figure(
    image("variatie.png", width: 8cm),
    caption: [Variatie],
    label: <fig:variatie>,
  ),
  figure(
    image("central tendency.png", width: 8cm),
    caption: [Central tendency],
  ),
)

#frm("Steekproef gemiddelde", $overline(x) = (sum_(i=1)^n x_i) / n$, [
  met $x_i$ de waarden van de steekproef en $n$ de steekproefgrootte
])

#frm("Populatie gemiddelde", $mu = (sum_(i=1)^N x_i) / N$, [
  met $x_i$ de waarden van de steekproef en $N$ de steekproefgrootte
])


#concept(title: "Belangrijke notatie")[


  #wrap-figure(
    image("locatie mediaan.png", width: 5cm),
    caption: [locatie mediaan],
  )[

    $overline(x)$ is de steekproef gemiddelde
    $mu$ is is de populatie gemiddelde
    $n$ is de steekproefgrootte
    $N$ is de populatie grootte

    $M$ is de mediaan. Deze is minder gevoelig voor extreemwaarden dan de gemiddelde.


  ]

]

#wrap-figure(
  image("verschilmediaangemiddelde.png", width: 6cm),
  caption: [Verschil mediaan en gemiddelde],
  label: <fig:verschilmediaangemiddelde>,
)[
  Bij een *symmetrische verdeling* liggen het gemiddelde en de mediaan dicht bij elkaar.

  Bij een *scheve verdeling* (zoals in de figuur) of bij aanwezigheid van *uitschieters*, wordt het *gemiddelde* sterk beïnvloed en naar de staart getrokken.

  De *mediaan* daarentegen is *resistent* (robuust) tegen uitschieters en blijft beter het midden representeren. Daarom gebruiken we bij scheve data vaak liever de mediaan.
  Afhankelijk van de uitschieters gaat er meer verschil zijn tussen de mediaan en gemiddelde.
]

== Spreiding

#concept(title: "Spreiding")[
  #figure(
    image("spreiding.png", width: 10cm),
    caption: [Spreiding],
    label: <fig:spreiding>,
  )

  De linkse figuur is veel meer gespreid dan de rechter figuur.
  Maar de mediaan is hetzelfde voor beide figuren.

]

#frm(
  "Variatie",
  [$ s^2 = (sum_(i=1)^n (x_i - (sum_(i=1)^n x_i) / n)^2) / n $
    $ sigma^2 = (sum_(i=1)^n (x_i - (sum_(i=1)^n mu) / n)^2) / n $],
  [
    met $x_i$ de waarden van de steekproef, $overline(x)$ de steekproef gemiddelde, $mu$ de populatie gemiddelde, $sigma^2$ de populatie variatie, $s^2$ de steekproef variatie en $n$ de steekproefgrootte
  ],
)


#theorie(title: "alle symbolen")[
  $s^2$ is de variatie
  $s$ is de standaardafwijking
  $sigma^2$ is de populatie variatie
  $sigma$ is de populatie standaardafwijking
]

== Standaard afwijking


#wrap-figure(
  align: right,
  image("gespreid-data.png", width: 6cm),
  caption: [gespreid-data],
  label: <fig:gespreid-data>,
)[

  Als je data even gespreid is zijn er bepaalde relaties tussen de variatie en de standaardafwijking.

  $ overline(x)-s, overline(x)+s $ bevat ongeveer 68% van de data.
  $ overline(x)-2s, overline(x)+2s $ bevat ongeveer 95% van de data.
  $ overline(x)-3s, overline(x)+3s $ bevat ongeveer 99.7% van de data.

]

== Hoe ver wijkt een waarde af van de overage waarnemingen?
=== Percent rankings

#wrap-figure(
  image("90%.png", width: 6cm),
  caption: [90%],
  label: <fig:90>,
)[

  Je scoort 80 op een examen.
  Je hebt in de 90% van de klas een betere score.
  je bent dan in het $90^(s t e)$ percentile van de klas.

]

#frm(
  "Z-score",
  [$ z = (x - mu) / sigma $
    $ z = (x - overline(x)) / s $],
  [
    met $x$ de waarde, $mu$ de gemiddelde, $sigma$ de populatie standaardafwijking, $overline(x)$ de steekproef gemiddelde, $s$ de steekproef standaardafwijking
  ],
)

De z-score geeft aan hoe ver een waarde afwijkt van de gemiddelde in termen van standaardafwijkingen. 1 z-score is 1 standaardafwijking.
Net zoals bij de standaardafwijking zie je afhankelijk van de Z-score verschillende percentages van de data.

$ z = 1 arrow.r.double 68% $
$ z = 2 arrow.r.double 95% $
$ z = 3 arrow.r.double 99.7% $

== Uitschieter detectie

#wrap-figure(
  image("boxplot.png", width: 10cm),
  caption: [boxplot],
  label: <fig:boxplot>,
)[
  Bij een boxplot ga je de mediaan en de
  kwartielwaarden bepalen.
  De kwartielwaarden zijn de 25%, 50% en 75% van de data.
  Als er data buiten de kwartielwaarden valt is dat een *uitschieter*.
]

#frm(
  "Boxplot uitschieter detectie",
  [$ U i t s c h i e t e r < Q_1 - 1.5(Q_3-Q_1) $
    $U i t s c h i e t e r > Q_3 + 1.5(Q_3-Q_1)$],
  [
    met $Q_1$ de 25% en $Q_3$ de 75%
  ],
)

#oefening(title: "Z-score berekenen")[
  #figure(
    image("z-score-oefening.png", width: 80%),
    caption: [z-score-oefening],
    label: <fig:z-score-oefening>,
  )
  *Gegeven*: $overline(x) = €64.000$, $s = €2.000$, $x = €57.000$\
  *Vraag*: Bereken de z-score en is dit salaris discriminerend?.\
  *Antwoord*:
  $ z = (57.000 - 64.000) / 2.000 = -3.5 $
  $ z = -3.5 arrow.r.double 99.7% $\
  Ja, dit salaris is discriminerend.
  Je zou nu een studie kunnen doen en kijken naar andere salarissen van vrouwen en mannen en zien of er merkbare verschillen zijn in rekening houdend met de salaris van de functie
]



























