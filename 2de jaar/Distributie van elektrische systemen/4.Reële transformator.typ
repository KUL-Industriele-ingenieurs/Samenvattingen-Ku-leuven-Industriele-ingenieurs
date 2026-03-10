#import "../../school-template.typ": *

= Reële transformatoren.

== Inhoud
- Non-ideale transformatoren
- equivalent schema
- metingen

== Non-ideale transformatoren <sec:non-ideale-transformatoren>

Een ideale transformator _vorig hoofdstuk_ heeft een paar aannamens:
- *Infinite permeabiliteit van het kernmateriaal:*   er is geen magnetische weerstand, dus er is geen magnetische flux die verloren gaat in de kern.
- *Geen conductiviteit van de wikkelingen:* er is geen weerstand in de wikkelingen, dus er is geen warmteverlies.
- *Oneindig wikkelingsverhouding:* er is geen lekflux, dus alle magnetische flux die door de primaire wikkeling gaat, gaat ook door de secundaire wikkeling.
- *Coupling 100%:* er is geen lekflux, dus alle magnetische flux die door de primaire wikkeling gaat, gaat ook door de secundaire wikkeling.


In de realiteit is dit natuurlijk niet het geval en we moeten voor elk van deze effecten rekenening houden. In dit hoofdstuk gaan we stap voor stap elk van deze effecten modelleren.

== finite permeabiliteit van het kernmateriaal <sec:finite-permeabiliteit-van-het-kernmateriaal>
Gemanitiseerde stroom. In het vorig hoofdstuk hebben we *Reluctantie* geïntroduceerd als een maat voor de magnetische weerstand van de kern. 

#figure(
  image("Relucantie.png", width: 5cm),
  caption: [Relucantie],
  label: <fig:Relucantie>,
)

$ N_1 i_1 - N_2 i_2 = phi R_c $

met $R_c$ de reluctantie van de kern, $phi$ de magnetische flux en $N_1$ en $N_2$ het aantal windingen van respectievelijk de primaire en secundaire wikkeling.

$ arrow.r.double i_1 = underbrace( N_2/N_1 i_2),"ideale transformator" + underbrace((phi R_c) / N_1),"Stroom verlies" i_m $

$phi$ hebben we vorig hoofdstuk gezien en is de flux doorheen de kern. 

#figure(
  image("Fluxherhaling.png", width: 5cm),
  caption: [Fluxherhaling],
  label: <fig:Fluxherhaling>,
)

$ phi = frac(V_1, omega N_1) $

We zien dat de magnetisatiestroom $i_m$ in fase is met de flux $phi$. We kunnen $i_m$ herschrijven door $phi$ te substitueren:

$ i_m = frac(R_c phi, N_1) $

Vul $phi = frac(V_1, omega N_1)$ in:

$ i_m = frac(R_c V_1, omega N_1^2) $

$L_m = frac(N_1^2, R_c)$. Als we dit invullen ($R_c/N_1^2 = 1/L_m$), krijgen we de wet van Ohm voor een spoel:

$ i_m = frac(V_1, omega L_m) $

$L_m$ is de hoofdinductantie van de transformator en is gelijk aan $frac(N_1^2, R_c)$

We krijgen hierdoor een geüpdate model van onze transformator:
#figure(
  image("Hoofdinductantie.png", width: 10cm),
  caption: [Hoofdinductantie],
  label: <fig:Hoofdinductantie>,
)

== BH curve

De BH curve gaat de distrotie en het verlies van hystereses modelleren. We gaan dit doen inplaats van de formule $B = mu dot H$




