#import "../../school-template.typ": *
= 4.External en internal forced convection <ch:External-en-internal-forced-convection>

We gaan convectie forceren. Voor lucht via een turbine en voor een vloeistof via een pomp. We gaan de richting van convectie eigenlijk tegenwerken en zo warmte transporteren.

#concept(title: "vrije-stroming snelheid en upstream snelheid")[

  *vrije-stroming*\
  De snelheid van een vloeistof relativief tot een ondergedompeled vast object ver genoeg van het object. Geen effect van het object op de snelheid $v$7

  *upstream snelheid*\
  Is de snelheid van het vloeistof van voor het lichaam.

]

== Drag en warmteoverdracht external flow <sec:Drag-en-warmteoverdracht-external-flow>

Druk en frictie hebben grote impacten op de richting van convectie.

De veloctiy boundry layer en thermal boundry layer hebben beide een effect op convectie. Met de ratio de prandle nummer $P_r$

#keyterm[Drag] is de kracht tegen de beweging van het vloeistof.


#frm(
  "Drag coëfficient",
  [
    $ C_D = frac(F_D, 1/2 phi V^2 A) $
  ],
  [
    $F_D$: Drag force
    $phi$: Density
    $V$: Velocity
    $A$: Area
  ],
)

_Herhaling warmte en strmingen_

Bij lage Reynold nummers $R e$ gaan de meeste drag door frictie zijn. De frictie is evenredig met de oppervlakte $A$. Je krijgt achter het object een #keyterm("Wake region"), een lagere druk zone.


#figure(
  image("Wake-region.png", width: 8cm),
  caption: [Wake-region],
  label: <fig:Wake-region>,
)

=== Warmtestroming

- *Film temperatuur*: $T_f = (T_s + T_inf) / 2$
met: $T_s$: Oppervlakte temperatuur
$T_inf$: Vrije-stroming temperatuur

- *Algemene Nusselt number*: $C R e^m_L P_r^n$

Dit is de algemene nusselt number _vorige hoofdstuk_ de relatie tussen het Reynolds getal en het prandle getal. De constante $C$ en de exponenten $m$ en $n$ zijn afhankelijk van de geometrie van het object. Je kunt die op je formularium aflezen.

- *Heat transfer rate*: $dot(Q) = h A (T_s - T_inf)$
met: $dot(Q)$: Warmteoverdracht
$A$: Oppervlakte
$T_s$: Oppervlakte temperatuur
$T_inf$: Vrije-stroming temperatuur

- *Convectie coëfficient*: $h = frac(k Nu_L, L)$
met: $k$: Thermal conductivity
$Nu_L$: Nusselt number
$L$: Characteristic length

- *Average friction coefficient*: $C_f = 1/L integral_0^L C_(f,x) d x$
met: $C_(f,x)$: Local friction coefficient
$L$: Characteristic length

- *Average heat transfer coefficient*: $h_m = 1/L integral_0^L h_x d x$
met: $h_x$: Local heat transfer coefficient
$L$: Characteristic length
