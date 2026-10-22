#import "../../school-template.typ": *
#import "examenvraag.typ": examenvraag

// BRON: Slides/8.hall.pdf | Samenvatting DAQ p.33-36 | examenvragen 2015, 2016, 2017, 25-26

= Hall-sensoren <ch:hall>

== Het Hall-effect <sec:hall-effect>

#concept(title: "Hall-effect")[
  Loopt er een stroom $I$ door een dun plaatje (geleider of halfgeleider) en staat er een magneetveld $B$ loodrecht op, dan ontstaat er een spanning $V_H$ dwars op zowel de stroom als het veld: de *Hall-spanning*.
]

De bewegende ladingsdragers worden door de Lorentzkracht opzij geduwd. Ze stapelen zich op aan één kant van het plaatje, tot het elektrische veld dat zo ontstaat de Lorentzkracht compenseert. Dat evenwicht geeft

#frm(
  "Hall-spanning",
  $V_H = (I B) / (n q t)$,
  [Evenredig met de stroom en met het magneetveld; groter bij een dun plaatje met weinig ladingsdragers (een halfgeleider).],
)

met:
- $I$ --- stroom door het plaatje [A]
- $B$ --- magnetische inductie loodrecht op het plaatje [T]
- $n$ --- dichtheid van de ladingsdragers [m$""^(-3)$]
- $q$ --- elementaire lading [C]
- $t$ --- dikte van het plaatje [m]

#grid(
  columns: (1.2fr, 1fr),
  gutter: 1em,
  align: horizon,
  figure(
    image("assets/L8-hall-effect.png", width: 100%),
    caption: [Hall-effect: stroom $I$, veld $B$, Hall-spanning $V_H$ (slide 2)],
    label: <fig:L8-hall-effect>,
  ),
  figure(
    image("assets/L8-vh-b.png", width: 100%),
    caption: [$V_H$ is lineair in $B$, ook vanaf $B = 0$ (slide 4)],
    label: <fig:L8-vh-b>,
  ),
)

Het belangrijkste verschil met een inductieve sensor: $V_H$ is evenredig met het *magneetveld zelf*, niet met de *verandering* van het veld ($d Phi \/ d t$). Een Hall-sensor geeft dus ook een signaal bij stilstand en werkt met DC en AC. Daarom is hij een betrouwbaardere sensor bij *lage snelheden* dan een inductieve opnemer.

#examenvraag("2017 vraag 3", [Een Hall-sensor ...],
  opties: (
    [werkt met DC en AC],
    [is gemaakt van piëzo-elektrisch materiaal],
    [werkt onafhankelijk van de grootte van het magnetisch veld],
  ),
  juist: "A",
)[In $V_H = I B \/ (n q t)$ staat geen afgeleide naar de tijd: een constant veld geeft een constante $V_H$. C is fout: $V_H$ is net evenredig met $B$. B is fout: het is een halfgeleider, gekozen omdat $n$ daar klein is en $V_H$ dus groot.]

== Tandwielsensoren <sec:hall-tandwiel>

Een Hall-sensor met een comparator met hysteresis maakt van een draaiende magneet of tandwiel een blokgolf: één puls per magneet of tand. Zo meet je toerental en positie.

#figure(
  image("assets/L8-rotatiesensor.png", width: 9cm),
  caption: [Hall-sensor als rotatiesensor: versterker en comparator met hysteresis geven een blokgolf (slide 5)],
  label: <fig:L8-rotatiesensor>,
)

=== Enkelvoudige tandwielsensor <sec:hall-enkelvoudig>

Een magneet op het tandwiel zetten is niet altijd mogelijk. Daarom zit de *permanente magneet in de sensor zelf*, achter het Hall-element. Een stalen tand die passeert concentreert de flux door het Hall-element (signaal laag of hoog), een tussenruimte niet. Zo volgt de uitgang de tanden.

#grid(
  columns: (1.4fr, 1fr),
  gutter: 1em,
  align: horizon,
  figure(
    image("assets/L8-tandwiel.png", width: 100%),
    caption: [Enkelvoudige tandwielsensor: magneet en Hall-element boven het tandwiel (slide 6)],
    label: <fig:L8-tandwiel>,
  ),
  figure(
    image("assets/L8-fluxconcentratie.png", width: 80%),
    caption: [Fluxconcentratie bij een tand en bij een tussenruimte (slide 7)],
    label: <fig:L8-fluxconcentratie>,
  ),
)

=== Differentiële tandwielsensor <sec:hall-differentieel>

Een *differentiële* Hall-sensor heeft twee Hall-elementen dicht naast elkaar, met één magneet. Terwijl het tandwiel draait, ziet het ene element een tand en het andere een tussenruimte. De sensor meet het *verschil*. Alles wat op beide elementen gelijk inwerkt, zoals temperatuurdrift, een uniform stoorveld of een variërende luchtspleet, valt weg. Het blijft wel een *incrementele* sensor: hij telt tanden en kent geen absolute hoek.

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  align: horizon,
  figure(
    image("assets/L8-differentieel.png", width: 100%),
    caption: [Differentiële Hall-sensor boven een tandwiel (slide 8)],
    label: <fig:L8-differentieel>,
  ),
  figure(
    image("assets/L8-differentieel-signalen.png", width: 100%),
    caption: [Veld bij element 1 en 2 en de differentiële uitgang (slide 8)],
    label: <fig:L8-differentieel-signalen>,
  ),
)

=== Draairichting bepalen <sec:hall-richting>

Eén differentiële sensor telt tanden, maar weet niet in welke richting het tandwiel draait. Daarvoor zijn er *twee* nodig, die in *kwadratuur* staan: hun signalen zijn $90 degree$ verschoven. Welk signaal eerst flankt, geeft de richting. Een D-flipflop doet dat in logica: klok het ene signaal in op de flank van het andere, en de uitgang is $1$ voor de ene draairichting en $0$ voor de andere (CW/CCW).

#figure(
  image("assets/L8-richting.png", width: 11cm),
  caption: [Twee differentiële Hall-sensoren en de richtingsuitgang van een D-flipflop (slide 9)],
  label: <fig:L8-richting>,
)

#figure(
  image("assets/L8-kwadratuur.png", width: 9cm),
  caption: [Kwadratuuruitgang van een commerciële sensor (Honeywell): kanaal A leidt, kanaal B volgt met $90 degree$ (slide 12)],
  label: <fig:L8-kwadratuur>,
)

#examenvraag("juni 2016 vraag 16, 2016 vraag 11", [Om de richting van een tandwiel te bepalen met differentiële Hall-sensoren, hebben we nodig ...],
  opties: ([1 Hall-sensor], [2 Hall-sensoren], [3 Hall-sensoren], [4 Hall-sensoren]),
  juist: "B",
)[Twee differentiële sensoren in kwadratuur ($90 degree$ verschoven). Uit welk signaal eerst flankt, volgt de draairichting.]

#examenvraag("2015 open vraag (7 punten)", [Differentiële Hall-sensor: tekening, werking, uitgangssignalen, waarom beter dan een gewone Hall-sensor, incrementeel of absoluut, toepassing, draairichting bepalen.])[
  - *Tekening en werking:* twee Hall-elementen naast elkaar met één permanente magneet erachter, boven een stalen tandwiel (@fig:L8-differentieel). Het ene element ziet een tand, het andere een tussenruimte; de sensor geeft het verschil.
  - *Uitgang:* een puls per tand (@fig:L8-differentieel-signalen).
  - *Beter:* gelijke storingen op beide elementen (temperatuur, stoorveld, luchtspleet) vallen weg in het verschil.
  - *Incrementeel:* hij telt tanden, kent geen absolute positie.
  - *Toepassing:* toerental en positie, bv. nokkenas of ABS-ring.
  - *Richting:* twee differentiële sensoren in kwadratuur en een D-flipflop (@fig:L8-richting).
]

#examenvraag("25-26 vraag 5, ook als voorbeeld op de laatste slide", [Een Hall-sensor gebruik je best ...],
  opties: (
    [wanneer je op betrouwbare manier de hoekpositie wenst op te meten],
    [wanneer je snel variërende ($> 100 "Hz"$) rotationele posities wenst op te meten],
    [wanneer je hoge rotatiesnelheden ($> 100 thin 000 "rpm"$) wenst op te meten],
    [wanneer je de hoekpositie met hoge nauwkeurigheid ($< 0.01 degree$) wenst op te meten],
  ),
  juist: "C",
)[Een Hall-sensor geeft een puls per tand of magneet, tot zeer hoge toerentallen, en werkt ook bij stilstand. Voor een *hoekpositie* met hoge nauwkeurigheid of betrouwbaarheid neem je een resolver of encoder (@sec:resolver).]

== Hoekmeting met Hall-sensoren <sec:hall-hoek>

=== Hall-hoekbrug <sec:hall-hoekbrug>

Bij een *angular Hall bridge sensor* (bv. AS5030) staan vier Hall-elementen $H_1$ tot $H_4$ in een vierkant onder een draaiende magneet. Twee verschilversterkers combineren de elementen en een ADC zet het resultaat om. Zo meet je de hoek én de draairichting, contactloos en met een resolutie tot ongeveer $0.05 degree$ (Samenvatting DAQ p.35).

#figure(
  image("assets/L8-hoekbrug.png", width: 8cm),
  caption: [Hall-hoekbrug: vier elementen, twee verschilversterkers, ADC (slide 10)],
  label: <fig:L8-hoekbrug>,
)

=== Multipolaire magneet <sec:hall-multipool>

Een *magnetische multipool-sensor* gebruikt een ring of strip met afwisselend N- en S-polen (een poolpaar is bv. $1.2$ tot $2 "mm"$ lang) boven een array van Hall-elementen. Dat geeft een sinusvormig signaal per poolpaar, dat de chip interpoleert tot kwadratuursignalen $A$, $B$ en een indexpuls. Met een ring meet je rotatie, met een strip lineaire verplaatsing.

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  align: horizon,
  figure(
    image("assets/L8-multipool.png", width: 70%),
    caption: [Multipolaire magneetring boven een Hall-array (AS5304) (slide 11)],
    label: <fig:L8-multipool>,
  ),
  figure(
    image("assets/L8-multipool-signalen.png", width: 80%),
    caption: [Sinus per poolpaar, geïnterpoleerd tot A, B en index (slide 11)],
    label: <fig:L8-multipool-signalen>,
  ),
)

== Ultrasone sensoren <sec:ultrasoon>

Een ultrasone sensor zendt met een *piëzo-elektrisch kristal* geluidspulsen uit (tot $40 "kHz"$, boven het menselijk gehoor) en meet hoe lang het duurt tot de echo terugkomt (looptijdmeting). Het geluid legt de afstand heen en terug af, vandaar de factor 2:

#frm(
  "Ultrasone afstandsmeting",
  $r = c t / 2$,
  [De slides rekenen met $c approx 300 "m/s"$ in lucht.],
)

met:
- $r$ --- afstand tot het voorwerp [m]
- $c$ --- geluidssnelheid in lucht [m/s]
- $t$ --- looptijd van zenden tot ontvangen echo [s]

#grid(
  columns: (1.6fr, 1fr),
  gutter: 1em,
  align: horizon,
  figure(
    image("assets/L8-ultrasoon-echo.png", width: 100%),
    caption: [Looptijdmeting: uitgezonden en teruggekaatste golf (slide 14)],
    label: <fig:L8-ultrasoon-echo>,
  ),
  figure(
    image("assets/L8-ultrasoon-bundel.png", width: 60%),
    caption: [Bundelpatroon van de zender (slide 14)],
    label: <fig:L8-ultrasoon-bundel>,
  ),
)

- De meting hangt af van de *hoek* en de *reflectie* van het oppervlak, van de *temperatuur* en de *vochtigheid* (die bepalen $c$).
- Ze wordt *niet* beïnvloed door trillingen of infrarood licht.
- Er zijn sensoren met één element (zender en ontvanger samen) of met twee aparte.
- Het signaal verzwakt met de afstand: $I = I_0 e^(-a x)$, met $a$ de dempingscoëfficiënt.
