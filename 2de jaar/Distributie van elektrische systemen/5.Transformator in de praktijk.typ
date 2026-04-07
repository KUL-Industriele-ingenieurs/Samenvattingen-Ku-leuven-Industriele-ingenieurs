#import "../../school-template.typ": *


= Transformator in de praktijk <ch:transformator-praktijk>

We starten terug bij het equivalent schema van transformatoren waarbij we alle verliezen naar de #keyterm[Primaire kant] verplaatsen.

Herinner je nog dat we de verliezen kunnen overbrengen afhankelijk van de hoeveelheid windingein $N_1$ en $N_2$ en de verhouding tussen deze twee.

#figure(
  image("Equivalent T-schema.png", width: 8cm),
  caption: [Equivalent T-schema],
  label: <fig:Equivalent-T-schema>,
)

We maken een phasordiagram en we gaan $I_1$ zoeken. We weten dat de stroom door de spoel $I_2'$ is en de stroom #keyterm[De excitatie stroom] door de parallele weerstand $I_0$ is. Dus $I_1 = I_2' + I_0$. Als we $I_1$ hebben kunnen we $V_1$ berekenen met de wet van Ohm.

#figure(
  image("Phasor equivalent schema.png", width: 6cm),
  caption: [Phasor equivalent schema],
  label: <fig:Phasor-equivalent-schema>,
)

Nu kunnen we terug approximaties maken. Kijk naar het circuit van het onderste model

#figure(
  image("Approximatie Circuit cantilever Circuit.png", width: 8cm),
  caption: [Approximatie Circuit cantilever Circuit],
  label: <fig:Approximatie-Circuit-cantilever-Circuit>,
)

Dit is een benadering van het vorig equivalent schema waarbij de de weerstanden in #keyterm[Serie] samensetten

$R_[eq] = R_1 + R_2'$
$X_[eq] = X_1 + X_2'$

Dit is een approximatie want normaal mag je deze niet combineren omdat er een parallele weerstand tussen zit.

We maken nu terug opnieuw een phasordiagram met deze benadering.

#figure(
  image("Cantilever phasor.png", width: 6cm),
  caption: [Cantilever phasor],
  label: <fig:Cantilever-phasor>,
)

Nu we kunnen nog meer approximeren. We gaan de parallel weerstand helemaal verwaarlozen

#figure(
  image("Equivalent Serie Circuit.png", width: 8cm),
  caption: [Equivalent Serie Circuit],
  label: <fig:Equivalent-Serie-Circuit>,
)

Herhaling:
$ X_[eq] = X_1 + X_2' $
$ R_[eq] = R_1 + R_2' $

met:

$ X_2' = X_2 * (N_1 / N_2)^2 $
$ R_2' = R_2 * (N_1 / N_2)^2 $


$I_2'$ is dan gelijk aan $I_1$ want stroom in = stroom out.

#figure(
  image("Equivalent series circuit phasors.png", width: 6cm),
  caption: [Equivalent series circuit phasors],
  label: <fig:Equivalent-series-circuit-phasors>,
)

Dit is dan een overview van de verschillende equivalent schema's.

#figure(
  image("Equivalent schema's overview.png", width: 5cm),
  caption: [Equivalent schema's overview],
  label: <fig:Equivalent-schemas-overview>,
)

Afhankelijk van welk circuit je neemt krijg je meer of minder info van je verliezen. (soort verliezen gezien in vorig hoofstuk).

== Operatie modussen

Je kunt je transformator bekijken op verschillende modussen:

- / Full-load: Een load op het andere uiteinde van de transformator.
- / No-load: Geen load op het andere uiteinde van de transformator.
- / Short circuit: Een kortsluiting op het andere uiteinde van de transformator.

#figure(
  image("Operatie modussen.png", width: 8cm),
  caption: [Operatie modussen],
  label: <fig:Operatie-modussen>,
)











