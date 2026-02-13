// chapter1_inleiding.typ
// Eerste hoofdstuk - Inleiding
// Dit bestand wordt geladen via #include "chapters/chapter1_inleiding.typ"

#import "../../school-template.typ": *

= Inleiding <ch:inleiding>

== Info vak Statistiek <sec:info-vak>
Dit vak is *flipped classroom* wat betekent dat je de theorie thuis bestudeert en in de les oefeningen maakt. De theorie is te vinden in de slides en de oefeningen zijn te vinden in de opdrachten. #belangrijk("Bekijk de planning om te zien wat je moet voorbereiden !WEES GOED VOORBEREID VOOR DE LES!").
#figure(
  image("Schedule2026.png"),
  label: "planning",
  caption: "Planning van het vak",
)

Je kunt oefeningen maken en je hebt nog info in Jupyterlab
#link(
  "https://jupyterhub.set.kuleuven.be/sdm-t2asd2/user/q1665834/git-pull?repo=https%3A%2F%2Fgitlab.kuleuven.be%2Fu0124139%2Fsdm&urlpath=lab%2Ftree%2Fsdm%2Fwelcome.ipynb&branch=main&targetPath=sdm",
)

Je hebt op toledo ook meerkeuzevragen om te oefenen.

== Examen

Op het examen krijg je een formularium _zie begin_ en alle code van de labo's. Je moet vooral leren de code begrijpen en kunnen toepassen. Je moet ook de theorie kennen en kunnen toepassen. De oefeningen die je in de les maakt zijn een goede voorbereiding op het examen.

= intro statistiek <ch:intro-statistiek>

Statistiek is een wiskundige discipline die zich bezighoudt met het analyseren en interpreteren van gegevens. Statistiek is een belangrijke tool voor het maken van beslissingen in vele velden, zoals wetenschap, economie, zorg en techniek.

Je hebt verschillende soorten statistiek:

#concept(title: "Soorten statistiek")[
  - *Beschrijvende statistiek*: Statistiek die zich bezighoudt met het beschrijven van gegevens
  #figure(
    image("beschrijvende statistiek.png", width: 5cm),
    caption: [beschrijvende statistiek],
  )
  - *Verklarende statistiek*: Data halen uit de populatie zoals _bv. Wat is de gemiddelde reactietijd tijdens het rijden_

  Dit beschrijft dan een populatie maar in een onderzoek is *Onzekerheid* door

]

#concept(title: "Fundamentele statistiek")[
  - *expertiment*: Een observatie van een object, persoon waar je dan een waarde uit kan halen
  - *Populatie*: De volledige groep waar je je experiment op doet
  - *veriable*: Een waarde die je kunt meten
  - *Steekproef*: Een subset van de populatie waar je je experiment op doet.
  - *Statische interferentie*: Welke omgevingsfactoren hebben een invloed op de variabele? Is onze steekproef aangetast door alleen mensen van een bepaalde populatie te gaan gebruiken? _bv.Veel medicatie werkt niet goed op mensen met een zwarte huidskleur omdat die minder in steekproeven zitten._
  - *Betrouwbaarheidsmeting*: Hoe betrouwbaar is een meting?
]

== collecting data <sec:collecting-data>

Je gaat een experiemnt opstellingen met een randomized controlled trail.

Zoals testen wat het effect is van asprin op hartaanvallen of herseninfractie. Je hebt een groep mensen die een asprin drinken en een groep mensen die geen asprin drinken, de *Controle groep*. Je gaat dan de hartaanvallen of herseninfractie tellen en de gemiddelde tellen.

== observational study <sec:observational-study>

Je gaat gewoon random rectuteren uit de populatie en je gaat die observeren op een bepaalde variabele. Zoals in een studie waar jongeren werden geobserveerd of ze een hartaandoening hadden.

*Aselecte steekproef:*Het is dus belangrijk dat we een goede steekproef hebben die random is genomen uit de populatie.
Dit is een aselecte steekproef.

= Hoofdstuk 2 Beschrijven van data <ch:hoofdstuk-2>

Dingen zoals pycharts en histrogrammen kunnen ons helpen om data
te *visualiseren*.

#figure(
  grid(
    columns: (1fr, 1fr),
    gutter: 1em,
    [
      #cetz.canvas({
        import cetz.draw: *
        // Pie Chart (Manual drawing as simple sectors)
        circle((0, 0), radius: 2, fill: schoolBlue.lighten(80%), stroke: none)
        // Sector 1
        arc((0, 0), radius: 2, start: 0deg, stop: 120deg, mode: "PIE", fill: schoolBlue)
        content((0.8, 0.8), [33%], text: white)
        // Sector 2
        arc((0, 0), radius: 2, start: 120deg, stop: 200deg, mode: "PIE", fill: schoolRed)
        content((-1, 0.5), [22%], text: white)
        // Sector 3
        arc((0, 0), radius: 2, start: 200deg, stop: 360deg, mode: "PIE", fill: schoolGreen)
        content((0, -1), [45%], text: white)
      })
      #align(center, [Pie Chart])
    ],
    [
      #cetz.canvas({
        import cetz.draw: *
        // plot is available from global import
        plot.plot(size: (5, 4), x-tick-step: none, y-tick-step: 10, {
          plot.add-bar(((0, 10), (1, 30), (2, 25), (3, 40), (4, 15)), style: (fill: schoolOrange))
        })
      })
      #align(center, [Histogram])
    ],
    // Row 2
    [
      #cetz.canvas({
        import cetz.draw: *
        // plot is available from global import
        plot.plot(size: (5, 4), axis-style: "school-book", {
          plot.add(
            ((0, 2), (1, 10), (2, 5), (3, 15), (4, 12), (5, 20)),
            style: (stroke: none, mark: (fill: schoolBlue, size: 3pt)),
            label: "Data Points",
          )
        })
      })
      #align(center, [Scatter Plot])
    ],
    [
      #cetz.canvas({
        import cetz.draw: *
        plot.plot(size: (5, 4), axis-style: "school-book", {
          plot.add(
            ((0, 5), (1, 8), (2, 16), (3, 12), (4, 25), (5, 22)),
            style: (stroke: schoolRed + 2pt),
            label: "Trend",
          )
        })
      })
      #align(center, [Line Chart])
    ],
    // Row 2
    [
      #cetz.canvas({
        import cetz.draw: *
        plot.plot(size: (5, 4), axis-style: "school-book", {
          plot.add(
            ((0, 2), (1, 10), (2, 5), (3, 15), (4, 12), (5, 20)),
            style: (stroke: none, mark: (fill: schoolBlue, size: 3pt)),
            label: "Data Points",
          )
        })
      })
      #align(center, [Scatter Plot])
    ],
    [
      #cetz.canvas({
        import cetz.draw: *
        plot.plot(size: (5, 4), axis-style: "school-book", {
          plot.add(
            ((0, 5), (1, 8), (2, 16), (3, 12), (4, 25), (5, 22)),
            style: (stroke: schoolRed + 2pt),
            label: "Trend",
          )
        })
      })
      #align(center, [Line Chart])
    ],
  ),
  caption: [Verschillende manieren om data te visualiseren],
)

#figure(
  image("variatie.png", width: 80%),
  caption: [variatie],
  label: <fig:variatie>,
)

#figure(
  image("central tendency.png", width: 80%),
  caption: [central tendency],
)

#frm("Steekproef gemiddelde", $overline(x) = (sum_(i=1)^n x_i) / n$, [
  met $x_i$ de waarden van de steekproef en $n$ de steekproefgrootte
])


#concept(title: "Belangrijke notatie")[

  $overline(x)$ is de steekproef gemiddelde
  $mu$ is is de populatie gemiddelde
  $n$ is de steekproefgrootte
  $N$ is de populatie grootte

  $M$ is de mediaan. Deze is minder gevoelig voor extreemwaarden dan de gemiddelde.

  #figure(
    image("locatie mediaan.png", width: 5cm),
    caption: [locatie mediaan],
  )

]

Afhankelijk van je data kan je mediaan en gemiddelde anders geplaats worden.

#figure(
  image("verschilmediaangemiddelde.png", width: 10cm),
  caption: [verschilmediaangemiddelde],
  label: <fig:verschilmediaangemiddelde>,
)

Afhankelijk van de uitschieters gaat er meer verschil zijn tussen de mediaan en gemiddelde.

== Spreiding

#concept(title: "Spreiding")[
  #figure(
    image("spreiding.png", width: 10cm),
    caption: [spreiding],
    label: <fig:spreiding>,
  )

  De linkse figuur is veel meer gespreid dan de rechter figuur.
  Maar de mediaan is hetzelfde voor beide figuren.

]

#frm("Variatie", $s^2 = (sum_(i=1)^n (x_i - (sum_(i=1)^n x_i) / n)^2) / n$, [
  met $x_i$ de waarden van de steekproef en $n$ de steekproefgrootte
])


#theorie(title: "alle symbolen")[
  $s^2$ is de variatie
  $s$ is de standaardafwijking
  $sigma^2$ is de populatie variatie
  $sigma$ is de populatie standaardafwijking
]

== Standaard afwijking

Als je data even gespreid is zijn er bepaalde relaties tussen de variatie en de standaardafwijking.

#figure(
  image("gespreid-data.png", width: 80%),
  caption: [gespreid-data],
  label: <fig:gespreid-data>,
)

$ overline(x)-s, overline(x)+s $ bevat ongeveer 68% van de data.
$ overline(x)-2s, overline(x)+2s $ bevat ongeveer 95% van de data.
$ overline(x)-3s, overline(x)+3s $ bevat ongeveer 99.7% van de data.

== Hoe ver wijkt een waarde af van de overage waarnemingen?

*%rankings*

Je scoort 80 op een examen.
Je hebt in de 90% van de klas een betere score.
je bent dan in het $90^(s t e)$ percentile van de klas.

#figure(
  image("90%.png", width: 80%),
  caption: [90%],
  label: <fig:90>,
)

#frm("Z-score", $ z = (x - mu) / sigma \\ z = (x - overline(x)) / s $, [
  met $x$ de waarde, $mu$ de gemiddelde en $s$ de standaardafwijking
])

De z-score geeft aan hoe ver een waarde afwijkt van de gemiddelde in termen van standaardafwijkingen. 1 z-score is 1 standaardafwijking.

Net zoals bij de standaardafwijking zie je afhankelijk van de Z-score verschillende percentages van de data.

$ z = 1 arrow.r.double 68% $
$ z = 2 arrow.r.double 95% $
$ z = 3 arrow.r.double 99.7% $

== Uitschieter detectie

#figure(
  image("boxplot.png", width: 80%),
  caption: [boxplot],
  label: <fig:boxplot>,
)

Bij een boxplot ga je de mediaan en de kwartielwaarden bepalen.
De kwartielwaarden zijn de 25%, 50% en 75% van de data.
Als er data buiten de kwartielwaarden valt is dat een *uitschieter*.

#frm("Boxplot uitschieter detectie", $Q_1 - 1.5(Q_3-Q_1) \\ Q_3 + 1.5(Q_3-Q_1)$, [
  met $Q_1$ de 25% en $Q_3$ de 75%
])

#oefening(title: "Z-score berekenen")[
  #figure(
    image("z-score-oefening.png", width: 80%),
    caption: [z-score-oefening],
    label: <fig:z-score-oefening>,
  )
  *Gegeven*: $overline(x) = €64.000$, $s = €2.000$, $x = €57.000$
  *Vraag*: Bereken de z-score is dit salaris discriminerend?.
  *Antwoord*:
  $z = (57.000 - 64.000) / 2.000 = -3.5$
  $z = -3.5 arrow.r.double 99.7%$
]



























