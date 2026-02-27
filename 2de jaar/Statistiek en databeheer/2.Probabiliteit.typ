#import "../../school-template.typ": *

#concept(title: "Experiment")[
  Een experiment is een process die één uitkomst heeft die niet verwacht kan worden.

  Een #keyterm("sample point") is het meest basic mogelijke resultaat van een experiment.

  Een #keyterm("sample space") is de verzameling van alle mogelijke sample points.
]

Een sample space kan op verschillende manieren weergegeven worden:
- Een venn diagram: een rechthoek met daarin de mogelijke sample points
- S = {sample point 1, sample point 2, ...}

_ Een munt heeft S = {kop, munt} als sample space._

== Probabiliteit regels

#theorie(title: "Probabiliteits regels")[
  + De probabiliteit van een gebeurtenis is altijd groter dan of gelijk aan 0 en kleiner dan of gelijk aan 1.
    $0 <= P_i <= 1$
  + De probabiliteit van de sample space _alle mogelijke uitkomsten_ is altijd gelijk aan 1.
    $sum_(i=1)^n P_i = P(S) = 1$
  + De probabiliteit van de lege verzameling is altijd gelijk aan 0.
    $P({}) = 0$
  + De probabiliteit van de unie van twee gebeurtenissen is gelijk aan de som van hun probabiliteiten min de probabiliteit van hun intersectie.
    $P(A union B) = P(A) + P(B) - P(A inter B)$
  + De probabiliteit van de complementaire gebeurtenis van A is gelijk aan 1 min de probabiliteit van A.
    $P(A') = 1 - P(A)$


  Een munt opgooien:
  - S = {kop, munt}
  - P(kop) = 0.5
  - P(munt) = 0.5

  Een dobbelsteen opgooien:
  - S = {1, 2, 3, 4, 5, 6}
  - P(1) = 1/6
  - P(2) = 1/6
  - P(3) = 1/6
  - P(4) = 1/6
  - P(5) = 1/6
  - P(6) = 1/6
]

#concept(title: "Event")[
  Een #keyterm("event") is een verzameling van sample points.

  _Je kunt een dobbelsteen 3 keer opgooien. Je krijgt {1,5,4}. Dit is een event._

  _Wat is nu de kans dat je deze samen krijgt?_
]

#voorbeeld(title: "Voorbeeld dat je 3 keer een 6 gooit")[
  $P(6,6,6) = P(6) * P(6) * P(6) = 1/6 * 1/6 * 1/6 = markhl(1/216)$

]

#voorbeeld(title: "Kans dat je even getal gooit")[
  $P(e v e n) = P(2) + P(4) + P(6) = 1/6 + 1/6 + 1/6 = 3/6 = markhl(1/2)$
]

== Union & inter


#wrap-figure(
  image("union and intersection.png", width: 8cm),
  caption: [union and intersection],
  label: <fig:union-and-intersection>,
)[Een #keyterm("union") is een combinatie van twee of meer events.
  $A union B$


  Hieronder een figuur van een union en een intersection.
  weeggegeven in een *venn diagram*.

  Een #keyterm("intersection") is de overlap van twee of meer events.
  $A inter B$

]

== Complement

Het complement zijn alle sample points die niet in de event zitten.
$ A^c = S - A $

We weten dan met de vorige regel dat:
$ P(A) + P(A^c) = 1 $

== Additieve probabiliteitsregel

De additieve probabiliteitsregel is de regel voor de probabiliteit van de unie van twee gebeurtenissen.

Dit zegt gewoon dat de union of A & B gelijk is aan de som van hun probabiliteiten min de probabiliteit van hun intersectie.
Dit is logisch want als je beide optelt ga je twee keer de intersectie tellen. Dus je moet die nog aftrekken.
$ P(A union B) = P(A) + P(B) - P(A inter B) $

#oefening(title: "Ziekenhuis study")[
  *Gegeven:*
  events: operatie (OP), obsteric behandeling (OB).
  $P(O P) = 0.12$
  $P(O B) = 0.16$
  $P(O P inter O B) = 0.02$

  *Gevraagd:*
  - $P(O P union O B)$

  *Oplossing:*
  $P(O P union O B) = P(O P) + P(O B) - P(O P inter O B) = 0.12 + 0.16 - 0.02 = markhl(0.26)$
]

Een #keyterm("Mutueel exclusieve gebeurtenissen") zijn gebeurtenissen die niet tegelijkertijd kunnen plaatsvinden.
$A inter B = 0$

Laten we de additieve probabiliteitsregel toepassen op mutueel exclusieve gebeurtenissen.
$P(A union B) = P(A) + P(B) - P(A inter B) = P(A) + P(B) - 0 = P(A) + P(B)$


#oefening(title: "2 munten")[
  #figure(
    image("munten met meerdere events.png", width: 5cm),
    caption: [munten met meerdere events],
    label: <fig:munten-met-meerdere-events>,
  )

  *Gegeven:*
  P(A) = tenminste 1 kop
  P(B) = exact 1 kop
  P(C) = 2 koppen

  $P(A) = P(B) + P(C) - P(B inter C)$
  $$P(A) = 2/4 + 1/4 - 0 = markhl(3/4)$$

]

#figure(
  image("samenvatting kansrekenen.png", width: 10cm),
  caption: [samenvatting kansrekenen],
  label: <fig:samenvatting-kansrekenen>,
)

== Conditionele probabiliteit
Dit is een belangrijk deel van de kansrekening. Het gaat over de probabiliteit van een gebeurtenis gegeven dat een andere gebeurtenis al heeft plaatsgevonden.

We nemen terug het voorbeeld van de dobbelsteen.\
We hebben weer twee events:
A = Even getal
B = Je gooit een number <= 3

#wrap-figure(
  image("oefeningdie.png", width: 5cm),
  caption: [oefening die],
  label: <fig:oefening-die>,
)[
  Wat is nu de kans dat A en B gebeuren?
  $ P(A inter B) = 1/6 $
  $P(A) = 3/6 = 1/2$
  $P(B) = 3/6 = 1/2$

  $ P(A|B) = markhl(1/3) $

  We zien dat meer info een impact heeft over een event.
  $P(A) = 1/2$
  $P(A|B) = 1/3$

  $ P(A|B) = P(A inter B) / P(B) $

  We vullen de oefening in met deze formule:
  $ P(A|B) = (1/6) / (3/6) = markhl(1/3) $
]

#oefening(title: "Cancer en roken")[

  #wrap-figure(
    image("cancer-roker.png", width: 7cm),
    caption: [cancer-roker],
    label: <fig:cancer-roker>,
  )[

    *Gegeven:*
    A: roker
    B: Kanker
    Alle sample points gegeven:
    - $P(A inter B) =0.05$
    - $P(A^c inter B) = 0.03$
    - $P(A inter B^c) = 0.0.20$
    - $P(A^c inter B^c) = 0.72$

    *Gevraagd:*
    - $P(B|A)$ Wat is de kans dat iemand roker is gegeven dat hij kanker heeft?
    - $P(B|A^c)$ Wat is de kans dat iemand roker is gegeven dat hij geen kanker heeft?

    *Oplossing:*
    $P(B|A) = P(A inter B) / P(A) = 0.05 / 0.10 = markhl(0.2)$
    $P(B|A^c) = P(A^c inter B) / P(A^c) = 0.03 / (0.03 + 0.72) = markhl(0.04)$

    Je ziet dus dat met deze data dat roken de kans op kanker vergroot met 5X.
  ]
]

== Multiplicatie regel & Bayes regel

=== Multiplicatie regel

#frm(
  "multiplicatie regel",
  [
    $ P(A|B) = frac(P(A inter B), P(B)) $

    $ P(A inter B) = P(A|B) * P(B) = P(B|A) * P(A) $
  ],
  [
    Met P(A) en P(B) zijn de onconditionele probabiliteiten.
    En P(A|B) en P(B|A) zijn de conditionele probabiliteiten.
  ],
)

#voorbeeld(title: "Engineer study")[


  Een ingenieur bekijkt 2 machines random.
  3 van de 10 machines zijn defect.
  *Wat is de kans dat beide machines defect zijn?*

  In de lijst hebben we 7 machines die niet defect zijn en 3 machines die defect zijn.

  Alle sample points staan in de figuur met N: geen defect, K: defect.
  #figure(
    image("samplepointingenieuroefening.png", width: 10cm),
    caption: [samplepointingenieuroefening],
    label: <fig:samplepointingenieuroefening>,
  )

  We krijgen 90 sample points die even waarschijnlijk zijn.

  We zien dat er 6 sample points zijn waar beide machines defect zijn.

  P(A) de eerste machine is defect.

  P(B) de tweede machine is defect.

  $ P(A inter B) = 6/90 = markhl(1/15) $

  We kunnen nu een boomdiagram maken #keyterm[In statistiek maak je altijd best boomdiagrammen als je met meerdere events werkt]

  #figure(
    image("boomdiagram.png", width: 10cm),
    caption: [boomdiagram],
    label: <fig:boomdiagram>,
  )

  Hou in rekening dat bij de tweede keuze dat je minder machines hebt om uit te kiezen dus een andere kans.

  $P(A) = frac(3, 10)$\
  $P(B|A) = frac(2, 9)$ De kans dat B gebeurt als A gebeurt is.

  Wat is nu de kans dat A & B gebeuren (multiplicatie regel)
  $markhl(P(A inter B) = P(B|A) dot P(A))$

]


#concept(title: "Onafhankelijke en afhankelijke gebeurtenissen")[
  *Onafhankelijke gebeurtenissen*\
  Twee gebeurtenissen A en B zijn onafhankelijk als de realisatie van de ene gebeurtenis geen invloed heeft op de probabiliteit van de andere gebeurtenis.
  $P(A|B) = P(A)$ De kans dat A gebeurt als B gebeurt is moet gelijk zijn aan de kans van A
  $P(B|A) = P(B)$ De kans dat B gebeurt als A gebeurt is moet gelijk zijn aan de kans van B

  De twee gebeurtenissen hebben geen enkele invloed op elkaar in term van gebeurtenissen.
  In de oefening heeft de status van de eerste machine geen invloed op de status van de tweede machine.

  *Afhankelijke gebeurtenissen*\
  Twee gebeurtenissen A en B zijn afhankelijk als de realisatie van de ene gebeurtenis wel invloed heeft op de probabiliteit van de andere gebeurtenis.

  #markhl($P(A|B) != P(A)$) De kans dat A gebeurt als B gebeurt is moet ongelijk zijn aan de kans van A

  #markhl($P(B|A) != P(B)$) De kans dat B gebeurt als A gebeurt is moet ongelijk zijn aan de kans van B

  De twee gebeurtenissen hebben wel invloed op elkaar in term van gebeurtenissen.
  In de oefening heeft de status van de eerste machine wel invloed op de status van de tweede machine.
]

=== Bayes regel

#oefening(title: "Detectie systeem")[

  #wrap-figure(
    image("detection system.png", width: 7cm),
    caption: [detection system],
    label: <fig:detection-system>,
  )[

    Een onbemand monitoringsysteem maakt gebruik van hoogwaardige videoapparatuur en microprocessors om indringers te detecteren. Een prototypesysteem is ontwikkeld en wordt buiten gebruikt bij een munitiefabriek. Het systeem is ontworpen om indringers te detecteren met een probabiliteit van 0,90. De ontwerpers verwachten echter dat deze probabiliteit varieert met het weer. Het systeem registreert automatisch de weersomstandigheden telkens wanneer een indringer wordt gedetecteerd. Op basis van een reeks gecontroleerde tests waarbij een indringer werd losgelaten bij de fabriek onder verschillende weersomstandigheden, is de volgende informatie beschikbaar: Gegeven dat de indringer daadwerkelijk door het systeem werd gedetecteerd, was het weer 75% van de tijd helder, 20% bewolkt en 5% regenachtig. Wanneer het systeem de indringer niet detecteerde, was 60% van de dagen helder, 30% bewolkt en 10% regenachtig. Gebruik deze informatie om de probabiliteit te vinden van het detecteren van een indringer, gegeven regenachtig weer. (Stel dat er een indringer is losgelaten bij de fabriek.)

    *Gegeven:*
    - $P(D) = 0.90$, $P(D^c) = 0.10$
    - $P("Rain"|D) = 0.05$
    - $P("Rain"|D^c) = 0.10$

    *Gevraagd:* $P(D|"Rain")$

    *Oplossing:*
    $ P(D inter "Rain") = P(D|"Rain") dot P("Rain") = P("Rain"|D) dot P(D) $

    De kans dat het regent zijn alle kansen op regen met detectie en zonder detectie maal de kans dat de detectie gebeurt.

    _dit is wel logisch want de kans dat iets singulier gebeurt en je hebt alleen de kans van de detecitie dan #markhl("moet je de kans van regen en detectie + de kans op regen en geen detectie doen")_

    $ P("Rain") = P("Rain"|D) dot P(D) + P("Rain"|D^c) dot P(D^c) $


    $ P("Rain") = 0.05 dot 0.90 + 0.10 dot 0.10 = 0.045 + 0.010 = 0.055 $


    De kans dat er een detectie gebeurt als het regent is de kans dat er een detectie gebeurt en dat het regent maal de kans op detectie gedeelt door de kans dat het regent.





    $
      P(D|"Rain") = frac(P("Rain"|D) dot P(D), P("Rain")) = frac(0.05 dot 0.90, 0.055) = frac(0.045, 0.055) = frac(45, 55) = markhl(9/11) approx markhl(0.818)
    $

    #figure(
      image("boomdiagram-detectiesysteem2.png", width: 15cm),
      caption: [boomdiagram-detectiesysteem2],
      label: <fig:boomdiagram-detectiesysteem2>,
    )


  ]
]

De Bayes regelt zegt dat de kans op een event A als B is gebeurt gelijk is aan de kans op A en B gedeelt door de kans op B.

Met daarbij de kans dat A en B gebeuren is gelijk aan de kans dat A gebeurt maal de kans dat B gebeurt als A gebeurt.

#frm(
  "Bayes regel",
  [
    $ P(A|B) = frac(P(A inter B), P(B)) $

    $ P(A inter B) = P(A|B) dot P(B) = P(B|A) dot P(A) $
  ],
  [
    $P(A inter B)$ de kans dat A en B gebeuren.
    $P(A|B)$ de kans dat A gebeurt als B gebeurt.
    $P(B|A)$ de kans dat B gebeurt als A gebeurt.
  ],
)


== Overzicht Week 2


#figure(
  image("overview.png", width: 16cm),
  caption: [overview],
  label: <fig:overview>,
)

