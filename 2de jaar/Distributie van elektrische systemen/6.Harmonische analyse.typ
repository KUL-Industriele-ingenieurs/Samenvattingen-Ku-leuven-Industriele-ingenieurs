#import "../../school-template.typ": *

= Harmonische analyse <ch:harmonische-analyse>

Een van de grootste problemen met de spanningskwaliteit zijn harmonischen. In dit hoofdstuk worden
allereerst harmonischen, de gevolgen voor de modellering van circuits en de definities van vermogens
beschreven. Daarna worden de oorzaken, gevolgen en oplossingen besproken.

== Introductie <sec:introductie>

Als we denken aan de voltage die we krijgen van een generator of van onze netspanning dan krijgen we een sinusvormige spanning. In de praktijk is dit echter niet altijd het geval. Er zijn verschillende effecten die impact hebben op de voltage die ervoor zorgen dat ze vervormt geraakt. Bijvoorbeeld:

- capaciteiten en inducties in de kabels
- diode rectifiers zie @ch:diode-rectifiers
- voltage dips of pieks zie meer in @ch:power-quality
- UPS
- transformator
- Printers, motors, computers, ...

Hoe gaan we dit nu modelleren zodat we de fout weten op ons net? We gaan fourierreekse toepassen om onze voltage grafiek om te zetten naar sinnussen en cosinussen.

$ u(t) = U $ //afmaken


met de eerste harmische functie (we vullen h = 1 in):

$ u_1 (t) = sqrt(2) space U_1 sin(2 pi f_1 t + a_1) $

Uiteindelijk komen we op dit type grafieken uit.

#figure(
  image("assets/Fourierreeks.png", width: 10cm),
  caption: [Fourierreeks],
  label: <fig:Fourierreeks>,
)

== Totale harmoniche vervorming (THD) <sec:thd>

//som van het effect van alle distorties

#figure(
  image("assets/THD voorbeeld.png", width: 10cm),
  caption: [THD voorbeeld],
  label: <fig:THD-voorbeeld>,
)

== Circuit modelleren met harmonischen <sec:circuit-modelleren>

alle voltage $V$ en stromen $I$ kunnen harmonische bevatten en dus moeten we daar ook rekening mee houden in ons circuit.

== Vermogen met harmonischen <sec:vermogen-met-harmonischen>

#figure(
  image("assets/Harmonic power definitions.png", width: 5cm),
  caption: [Harmonic power definitions],
  label: <fig:Harmonic-power-definitions>,
)


=== Phase shift distortie <sec:phase-shift-distortion>

== Concequences van harmonics <sec:consequences-of-harmonics>

== Oplossingen van harmonics <sec:solutions-of-harmonics>

