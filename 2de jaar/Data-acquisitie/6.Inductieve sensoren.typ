#import "../../school-template.typ": *
#import "examenvraag.typ": examenvraag

// BRON: Slides/6.induction.pdf (slides 1-30; 31-36 = potentiometer-oefening, staat in H3)
//       Samenvatting DAQ p.18-24 | examenvragen 2016, 2017, 2019, 23-24, 25-26

= Inductieve sensoren <ch:inductief>

Een inductieve sensor meet een verplaatsing via een verandering van een spoel of van de koppeling tussen spoelen. De zelfinductie van een spoel hangt af van drie parameters:

#frm(
  "Zelfinductie van een spoel",
  $L = n^2 G mu$,
  [Elke parameter die verandert met de verplaatsing kan als meetprincipe dienen.],
)

met:
- $n$ --- aantal windingen [-]
- $G$ --- vormfactor (lengte en doorsnede van de spoel) [m]
- $mu$ --- permeabiliteit van het medium in de spoel [H/m]

Voor een lange spoel is dat concreet $L = mu N^2 A \/ l$, met $A$ de doorsnede en $l$ de lengte. De wet van Lenz koppelt $L$ aan de spanning over de spoel: $v(t) = L thin d i \/ d t$.

#figure(
  image("assets/L6-spoel.png", width: 6cm),
  caption: [Spoel met $N$ windingen, doorsnede $A$ en lengte $l$ (slide 3)],
  label: <fig:L6-spoel>,
)

== Zelfinductie <sec:zelfinductie>

Bij een *zelfinductiesensor* verandert de verplaatsing de inductantie $L$ van één spoel, bv. door een ijzeren kern die in en uit de spoel schuift (dan verandert $mu$).

- Voordelen: eenvoudig concept, zeer compact.
- Nadeel: $L = n^2 G mu$ is *niet lineair* met de verplaatsing.
- Toepassing: in telemetrie, waar de spoel deel uitmaakt van een *LC-oscillator*. Verandert $L$, dan verandert de resonantiefrequentie:

#frm(
  "Resonantiefrequentie LC-kring",
  $f_0 = 1 / (2 pi sqrt(L C))$,
  [Een verandering van $L$ of $C$ verschuift de frequentie; die kan je draadloos uitlezen.],
)

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  align: horizon,
  figure(
    image("assets/L6-lc.png", width: 60%),
    caption: [LC-kring (slide 5)],
    label: <fig:L6-lc>,
  ),
  figure(
    image("assets/L6-eddy.png", width: 100%),
    caption: [Inductieve naderingssensor met wervelstromen (slide 7)],
    label: <fig:L6-eddy>,
  ),
)

Een *inductieve naderingssensor* (proximity sensor) gebruikt een oscillator met een open spoel. Komt er een metalen voorwerp in het veld, dan ontstaan er wervelstromen (eddy currents) die de oscillator dempen. De sensor schakelt dan om: het is een aan/uit-detectie, geen nauwkeurige afstandsmeting. Een variant is de *ringsensor*, die metalen voorwerpen detecteert die door een ring vallen.

#examenvraag("25-26 vraag 2, ook als voorbeeld op de laatste slide", [Een LC-oscillator kan gebruikt worden om ...],
  opties: (
    [de afstand tussen een inductieve sensor en een voorwerp nauwkeurig op te meten],
    [de zelfinductantie te laten variëren in functie van de excitatiespanning],
    [de capacitieve waarde te laten variëren in functie van de excitatiespanning],
    [de aanwezigheid van een materiaal te meten en het resultaat draadloos door te geven],
  ),
  juist: "D",
)[Een naderend voorwerp verandert $L$ (of $C$) en dus de resonantiefrequentie, en die frequentie is een signaal dat je draadloos kan uitlezen (telemetrie). A is de verleiding: het verband is sterk niet-lineair, dus geen nauwkeurige afstandsmeting. B en C draaien oorzaak en gevolg om: de excitatiespanning verandert $L$ of $C$ niet.]

== Mutuele inductie <sec:mutueel>

Bij *mutuele inductie* zijn er twee spoelen: een primaire, gevoed met een sinus, en een secundaire. Een beweegbare kern bepaalt hoe sterk ze gekoppeld zijn. De geïnduceerde spanning in de secundaire spoel hangt af van de geometrie, de frequentie en amplitude van de stroom, en de positie van de kern.
- Er is *geen contact* tussen de spoelen en de kern: weinig slijtage.
- Het verband is *niet lineair*. Met één secundaire spoel is de uitgang *maximaal* als de kern in het midden staat.
- Om de uitgang te maximaliseren werkt men op de resonantiefrequentie van de secundaire spoel.

#figure(
  image("assets/L6-mutueel.png", width: 9cm),
  caption: [Mutuele inductie met één secundaire spoel: de uitgang $V_o$ (RMS) is maximaal met de kern in het midden (slide 9)],
  label: <fig:L6-mutueel>,
)

#examenvraag("2017 vraag 10", [Bij een mutuele-inductantiesensor met de kern centraal ...],
  opties: (
    [is de uitgangsspanning maximaal],
    [stijgt de uitgangsspanning als de kern naar rechts verschuift],
    [heeft de uitgangsspanning een lineair verloop],
  ),
  juist: "A",
)[Met één secundaire spoel is de koppeling maximaal als de kern centraal staat (@fig:L6-mutueel). Niet verwarren met de LVDT: daar staan twee secundairen tegengesteld en is het midden net de *nulpositie*. C klopt niet: het verloop is klokvormig.]

== De LVDT <sec:lvdt>

=== Werking <sec:lvdt-werking>

#concept(title: "LVDT (Linear Variable Differential Transformer)")[
  Eén primaire spoel tussen twee secundaire spoelen, die *tegengesteld in serie* geschakeld zijn. De uitgang is het *verschil* $V_(o 1) - V_(o 2)$ van de twee secundaire spanningen. Een beweegbare kern bepaalt hoe sterk elke secundaire gekoppeld is.
]

Staat de kern exact in het midden, dan zijn beide secundaire spanningen gelijk en is de uitgang *nul*. Schuift de kern naar één kant, dan wordt die secundaire sterker gekoppeld en groeit het verschil, lineair met de verplaatsing.

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  align: horizon,
  figure(
    image("assets/L6-lvdt.png", width: 70%),
    caption: [LVDT: primaire spoel $A$ in het midden, secundairen links en rechts, kern erdoor (slide 11)],
    label: <fig:L6-lvdt>,
  ),
  figure(
    image("assets/L6-lvdt-verschil.png", width: 100%),
    caption: [$V_(o 1)$, $V_(o 2)$ en hun verschil $V_(o 1) - V_(o 2)$ in functie van de kernpositie (slide 13)],
    label: <fig:L6-lvdt-verschil>,
  ),
)

=== Richting: de fase <sec:lvdt-fase>

Meet je alleen de *amplitude* van de uitgang, dan krijg je een V-vorm: even groot links als rechts van het midden. De richting zit in de *fase*: bij het passeren van het nulpunt draait de fase van de uitgang $180 degree$. Aan de ene kant is de uitgang in fase met de excitatie, aan de andere kant in tegenfase.

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  align: horizon,
  figure(
    image("assets/L6-lvdt-fase-signalen.png", width: 95%),
    caption: [Excitatie en uitgang voor drie kernposities; de onderste is $180 degree$ verschoven (slide 14)],
    label: <fig:L6-lvdt-fase-signalen>,
  ),
  figure(
    image("assets/L6-lvdt-fase.png", width: 100%),
    caption: [Na fasegevoelige detectie: een uitgang die van teken wisselt (slide 14)],
    label: <fig:L6-lvdt-fase>,
  ),
)

#concept(title: "Synchrone (fasegevoelige) detectie")[
  De *phase sensitive detector* (PSD) vermenigvuldigt het uitgangssignaal van de sensor met het excitatiesignaal en filtert het product laagdoorlaat. Wat overblijft is evenredig met de amplitude *maal* de cosinus van het faseverschil. Zo krijg je een uitgang die *positief of negatief* kan zijn.
]

Met een goniometrische formule zie je waarom:
$ sin(omega t) dot A sin(omega t + phi) = A / 2 [cos phi - cos(2 omega t + phi)] $
Het laagdoorlaatfilter haalt de term op $2 omega$ weg. Er blijft $A \/ 2 dot cos phi$: $+A\/2$ bij $phi = 0 degree$, $-A\/2$ bij $phi = 180 degree$. Een gewone gelijkrichter zou net dat teken weggooien.

#examenvraag("2017 vraag 18", [Synchrone detectie ...],
  opties: (
    [heeft 3 ingangssignalen],
    [kan zowel positief als negatief zijn],
    [kan nooit een output van constant 0 V hebben],
    [kan nooit negatief zijn],
  ),
  juist: "B",
)[Daarvoor gebruik je ze: de fase bepaalt het teken, en zo wordt de V-vormige amplitudecurve een signaal dat door nul gaat en van teken wisselt. C is fout: met de kern in het midden is de uitgang $0 "V"$.]

#examenvraag("juni 2016 vraag 5", [Synchrone detectie ...],
  opties: (
    [vergelijkt de fase van de excitatiespanning met die van de sensoruitgang],
    [heeft een uitgangsspanning die niet negatief kan zijn],
    [is een dubbelzijdige gelijkrichter],
    [vergelijkt de amplitudes],
  ),
  juist: "A",
)[Het vermenigvuldigen met de excitatie werkt als een fasevergelijking. Een (dubbelzijdige) gelijkrichter (C) verliest net het teken, en dus de richting.]

=== Detectiecircuit en ratiometrische meting <sec:lvdt-detectie>

Een kant-en-klare chip zoals de *AD598* doet alles: een oscillator voedt de primaire spoel, de chip meet de twee secundaire spanningen $V_A$ en $V_B$ apart en berekent

$ V_"uit" tilde (V_A - V_B) / (V_A + V_B) $

Beide spanningen zijn evenredig met de excitatie. Door het verschil te delen door de som valt de amplitude van de excitatie weg: een *ratiometrische* meting. Daarna volgen een filter (om de draaggolf weg te halen) en een versterker.

#figure(
  image("assets/L6-ad598.png", width: 9cm),
  caption: [Detectiecircuit met de AD598: oscillator, $(A - B) \/ (A + B)$, filter en versterker (slide 16)],
  label: <fig:L6-ad598>,
)

#examenvraag("23-24 vraag 5, 25-26 vraag 17, voorbeeldexamen 2024", [Je kan de uitgangsspanning van een LVDT ongevoelig maken voor de amplitude van de excitatiespanning door ...],
  opties: (
    [een stroomsturing te gebruiken voor de excitatie in plaats van een spanningssturing],
    [een volledige Wheatstonebrug (4 sensoren) te gebruiken],
    [de uitgangsspanning om te vormen tot $(A - B) \/ (A + B)$, met $A$ en $B$ de twee uitgangsspanningen van de LVDT],
    [een fasedetectieschakeling te gebruiken],
  ),
  juist: "C",
)[$A$ en $B$ zijn allebei evenredig met de excitatie. In de verhouding $(A - B) \/ (A + B)$ valt die factor weg. D is de valstrik: fasedetectie geeft de *richting* (het teken), niet de ongevoeligheid voor de amplitude. Een Wheatstonebrug (B) hoort bij weerstandssensoren.]

=== Eigenschappen <sec:lvdt-eigenschappen>

#table(
  columns: (1fr, 1fr),
  table.header([*Voordelen*], [*Nadelen*]),
  [lineair over een groot bereik ($0.25 %$) \ faseomkering in het nulpunt: verplaatsing in twee richtingen \ zeer gevoelig: $0.5$ tot $2 "mV"$ per $0.01 "mm"$ per volt excitatie (veel meer dan rekstroken) \ bereik $0.1$ tot $250 "mm"$ \ contactloos \ zeer hoge precisie, lange levensduur, kleine hysteresis],
  [AC-voeding nodig \ detectiecircuit nodig],
)

#examenvraag("juni 2016 vraag 11, 2016 vraag 4", [Een LVDT ...],
  opties: (
    [bestaat uit 2 excitatiespoelen en 1 detectiespoel],
    [verslijt niet omdat er amper wrijving is],
    [werkt zowel met wisselstroom als met gelijkstroom],
    [geen van de antwoorden is juist],
  ),
  juist: "B",
)[De kern raakt de spoelen niet, dus er is bijna geen wrijving en slijtage. A is net omgekeerd: één primaire (excitatie)spoel en twee secundaire (detectie)spoelen. C is fout: zonder wisselveld is er geen inductie.]

#examenvraag("2019 vraag 7", [LVDT: is de gemiddelde spanning of de amplitude het hoogst? Hoe verloopt de amplitude?])[De *amplitude* van de uitgang is nul met de kern in het midden en groeit naar beide kanten (V-vorm). Het teken (de richting) zit niet in de amplitude maar in de *fase*, die bij het nulpunt $180 degree$ omdraait. Pas na fasegevoelige detectie krijg je een uitgang die door nul gaat en van teken wisselt (@fig:L6-lvdt-fase).]

== Synchro's en resolvers <sec:resolver>

Voor *hoekmeting* gebruikt men roterende transformatoren: een rotorspoel, gevoed met $V sin(omega t)$, en statorspoelen die een spanning krijgen afhankelijk van de rotorhoek $theta$.

=== Synchro <sec:synchro>

Een *synchro* heeft drie statorspoelen onder $120 degree$ (in Y). De spanning tussen twee aansluitingen is de vectorsom van de statorspanningen:
$ V_(S 1 - S 3) = V sin(omega t) sin theta quad V_(S 3 - S 2) = V sin(omega t) sin(theta + 120 degree) quad V_(S 2 - S 1) = V sin(omega t) sin(theta + 240 degree) $
Synchro's worden *niet meer gebruikt*.

=== Resolver <sec:resolver-werking>

Een *resolver* heeft twee statorspoelen onder $90 degree$. Dat geeft een sinus- en een cosinusuitgang:

#frm(
  "Resolver",
  $V_(S 1 - S 3) = V sin(omega t) sin theta quad quad V_(S 4 - S 2) = V sin(omega t) cos theta$,
  [Samen bepalen de sinus en de cosinus de *absolute* hoek $theta$ van de rotor.],
)

Bij een *borstelloze resolver* wordt de rotor zelf gevoed via een roterende transformator, zodat er geen sleepcontacten nodig zijn.

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  align: horizon,
  figure(
    image("assets/L6-synchro.png", width: 90%),
    caption: [Synchro: drie statorspoelen in Y (slide 19)],
    label: <fig:L6-synchro>,
  ),
  figure(
    image("assets/L6-resolver.png", width: 100%),
    caption: [Resolver zonder borstelcontact (slide 20)],
    label: <fig:L6-resolver>,
  ),
)

*Resolver-to-digital converter* (RDC). Om de hoek digitaal te maken, vermenigvuldigt men de sinusuitgang met $cos phi$ en de cosinusuitgang met $sin phi$, waarbij $phi$ de huidige digitale schatting is. Het verschil is evenredig met $sin(theta - phi)$: de fout. Een integrator en een spanningsgestuurde oscillator (VCO, $f_"uit" = k V_"in"$) laten een up/down-teller lopen tot de fout nul is. Dan is $phi = theta plus.minus 1 "LSB"$. De integrator-uitgang is meteen de hoeksnelheid.

#figure(
  image("assets/L6-rdc.png", width: 11cm),
  caption: [Resolver-to-digital converter (slide 23)],
  label: <fig:L6-rdc>,
)

#table(
  columns: (1fr, 1fr),
  table.header([*Voordelen resolver*], [*Nadelen*]),
  [lange levensduur (hangt af van de lagers) \ absolute hoekmeting \ niet duur voor deze precisie (vergeleken met optische encoders) \ klein, zeer robuust \ standaard verwerkingselektronica beschikbaar],
  [elektronische verwerking nodig],
)

== Inductosyn <sec:inductosyn>

De *inductosyn* werkt als een resolver, maar dan *lineair*. Een vaste schaal met een meanderpatroon wordt gevoed met $V sin(omega t)$. Een glijder (slider) erboven heeft twee wikkelingen die een kwart periode verschoven zijn, en geeft een sinus- en een cosinusuitgang:

#frm(
  "Inductosyn",
  $V_"sin" = K V sin(omega t) sin((2 pi X) / S) quad quad V_"cos" = K V sin(omega t) cos((2 pi X) / S)$,
  [Binnen één spoed geeft de verhouding van beide de positie; het aantal doorlopen spoeden geeft de grove positie.],
)

met:
- $X$ --- verplaatsing van de glijder [m]
- $S$ --- spoed (pitch): afstand tussen de geleiders van de schaal [m]
- $V sin(omega t)$ --- excitatiespanning, met $V$ de amplitude en $omega$ de hoekfrequentie [V, rad/s]
- $K$ --- koppelfactor [-]

De signalen zijn klein (millivolt) en moeten versterkt worden. Door over veel spoeden te middelen haalt een lineaire inductosyn een resolutie tot $0.5 thin mu"m"$. Er bestaat ook een *roterende* inductosyn, met een rotor met een continue wikkeling en een gesegmenteerde stator. Een modern voorbeeld is de *Zettlex inductive encoder*.

#grid(
  columns: (1.4fr, 1fr),
  gutter: 1em,
  align: horizon,
  figure(
    image("assets/L6-inductosyn.png", width: 100%),
    caption: [Lineaire inductosyn: schaal en glijder met sinus- en cosinuswikkeling (slide 27)],
    label: <fig:L6-inductosyn>,
  ),
  figure(
    image("assets/L6-inductosyn-rot.png", width: 100%),
    caption: [Roterende inductosyn: rotor en stator (slide 29)],
    label: <fig:L6-inductosyn-rot>,
  ),
)

#examenvraag("2019 vraag 8, 2017 vraag 7", [$V_"out" = V sin(omega t) sin(2 pi X \/ S)$ is de formule van één van de uitgangsspanningen bij een lineaire inductosyn ...],
  opties: (
    [$V$ is de amplitude van de excitatie],
    [$X$ is de spoed van de sensor (pitch)],
    [$S$ is de verplaatsing],
    [de formule is fout],
  ),
  juist: "A",
)[$X$ is de verplaatsing en $S$ de spoed: B en C verwisselen ze net. De formule klopt.]

#examenvraag("juni 2016 vraag 1, 2016 vraag 2", [$V_"out" = V sin(omega t) sin(2 pi X \/ S)$, lineaire inductosyn ...],
  opties: (
    [$X$ is de totale lengte van de inductosyn],
    [$S$ is de verplaatsing],
    [de formule is fout],
    [$omega t$ hoort bij de frequentie van de excitatiespanning],
  ),
  juist: "D",
)[$omega$ is de (hoek)frequentie van de excitatie, $omega t$ de bijhorende fase. $X$ is de verplaatsing (niet de totale lengte) en $S$ de spoed.]
