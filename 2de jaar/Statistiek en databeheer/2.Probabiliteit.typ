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
    image("cancer-roker.png", width: 5cm),
    caption: [cancer-roker],
    label: <fig:cancer-roker>,
  )[

    *Gegeven:*
    $P(C) = 0.05$
    $P(R) = 0.10$
    $P(C^C) = 0.03$
    $P()$

    *Gevraagd:*
    - $P(C|R)$

    *Oplossing:*
    $P(C|R) = P(C inter R) / P(R) = 0.02 / 0.10 = markhl(0.2)$
  ]
]



