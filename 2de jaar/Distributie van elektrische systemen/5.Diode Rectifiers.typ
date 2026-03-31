#import "../../school-template.typ": *

= Diode Rectifiers

== Herhaling Diodes

#figure(
  image("Karaktiristieken van een diode.png", width: 12cm),
  caption: [Karaktiristieken van een diode],
  label: <fig:Karaktiristieken-van-een-diode>,
)


Een diode gelijd van #keyterm[Anode] naar #keyterm[Kathode].
Je krijgt een spanningsval van ongeveer #keyterm[0.7V] over de diode als deze geleid.

Wat merk je op de grafiek -> vanaf dat de diode opengaat laat het alle stroom door in theorie. Die 0.7V laten we weg in onze berekeningen maar onhoudt dat die er nog steeds is. Bijvoorbeeld als je een grote wattage gaat op zetten gaat je diode opwarmen door die 0.7V. Je moet dus oppassen dat je diode niet kapot gaat door de warmteontwikkeling.

We bezien de diode als een schakelaar. die alleen stroom doorlaat van Anode naar Kathode. We nemen aan dat er geen voltage is.

Als je negatieve spanning op de diode zet kun je uiteindelijk #keyterm[Doorslag] krijgen. Dan gaat de diode geleiden in de andere richting. Dit is niet goed voor de diode en kan deze kapot maken.


- *Start met geleide als $V_D > 0$*
- *Stop met geleide als de stroom 0 is $I = 0$*


Je diode kan dus tegenstromen hebben.


=== Single Phase Half Wave Rectifier

#figure(
  image("Single-phase half recertifier.png", width: 12cm),
  caption: [Single-phase half recertifier],
  label: <fig:Single-phase-half-recertifier>,
)

Door de diode gaan negatieve spanningen geblokkeerd worden.

Je diode gaat stoppen met stromen omdat de stroom nul wordt. Herinner je de voorwaarden dat de #keyterm[schakkelaar] dichtgaat als de stroom nul is en je moet dus terug een positieve spanning hebben om deze terug te laten geleiden.


Je gemiddelde uitput spanning is:

$ overline(U_0) = sqrt(2)/pi dot U_b $

=== Single Phase Full wave Rectifier

#figure(
  image("Full-wave diode rectiefier.png", width: 12cm),
  caption: [Full-wave diode rectiefier],
  label: <fig:Full-wave-diode-rectiefier>,
)

Je ziet een alternerende spanning $V_(A C)$. Je ziet door de Full-wave-diode-rectiefier dat de spanningen altijd positief gaan zijn.

*Tijdens het positieve deel gaat het door diode $D_1$ en $D_2$*

*Tijdens het negatieve deel gaat het door diode $D_3$ en $D_4$* $=>$ Waardoor de stroom in een andere richting gaat maar de spanning over de belasting blijft positief.

Het gemiddelde uitgangsspanning is:

#frm[Gemiddelde uitgangsspanning][$overline(U_0) = frac(2sqrt(2), pi) dot U_b$][met $U_0$ de gemiddelde spanning, $U_b$ de spanning van de sinusgolf]

#concept(title: "Pulse nummer")[


  #figure(
    image("Pulse nummer.png", width: 5cm),
    caption: [Pulse nummer],
    label: <fig:Pulse-nummer>,
  )

  Het pulse nummber is het aantal pulsen per periode.

  Je moet een andere single wave rectiefier maken om de ripple te verminderen.

  $ n = f_("ripple") / f_("ac") $
]


#voorbeeld(title: "Oefening rectifier")[

  Zet de juiste diodes afhankelijk van het gegeven circuit:

  #figure(
    image("Oefening rectifier.png", width: 5cm),
    caption: [Oefening rectifier],
    label: <fig:Oefening-rectifier>,
  )
]

#examenbox[Je gaat op het examen een schema krijgen en je moet de grafiek kunnen tekenen hoe het zich gaat gedragen]


== Communcatie

#concept(title: "Communcatie")[

  Communcatie is het plotse verschil van spanning en switching van de diodes. Ideaal word dit plots gedaan maar in de praktijk is dit niet zo.

  Het moment dat er spoelen, capaciteiten of batterijen in de circuit zitten gaat de commutatie niet meer perfect zijn.

]

We nemen terug een full-wave rectifier maar nu met een weerstand als load $R$

#figure(
  image("Commutatie.png", width: 12cm),
  caption: [Commutatie],
  label: <fig:Commutatie>,
)

Dit is het ideale voorbeeld omdat er geen enkele verandering probleem is door #keyterm[spoelen of condensatoren].


We gaan een ideale batterij toevoegen aan de load. Deze gaat alleen stroom leveren als de spanning $v_s$ groter is dan de spanning over de batterij $v_b$.

$ v_s > v_b $

#figure(
  image("Commutatie batterij alt.png", width: 12cm),
  caption: [Commutatie batterij alt],
  label: <fig:Commutatie-batterij-alt>,
)

Er gaat alleen een stroom lopen als de spanning $v_s$ groter is dan de spanning over de batterij $v_b$.
Alleen dan gaat er stroom lopen en een spanning over de weerstand gaan $v_r$.

$v_0$ is de totale spanning over de batterij en de weerstand.

$ v_0 = v_b + v_r $


Wat gaat er nu gebeuren als je inductieve belasting toevoegt?

=== Inductieve belasting

#figure(
  image("Inductieve-resitieve load.png", width: 5cm),
  caption: [Inductieve-resitieve load],
  label: <fig:Inductieve-resitieve-load>,
)

We gaan dit stap per stap aanpakken om het te begrijpen.

==== Half wave rectifier met inductieve belasting
Herinner je dat een spoel de voltage verschillen gaat tegengaan. Die doet dit door magnetische flux op te slaan en deze dan terug vrij te geven.


Je stroom $i_0$ gaat achterlopen op de spanning $v_s$ door de spoel.

#figure(
  image("Half-wave rectifier met inductieve belasting.png", width: 5cm),
  caption: [Half-wave rectifier met inductieve belasting],
  label: <fig:Half-wave-rectifier-met-inductieve-belasting>,
)

$ v(s)(t) = V_s sin(omega t) = R i_0(t) + L (d i_0(t))/(d t) $


Je krijg eigenlijk een verschijving van de spanning $v_s$ naar rechts en dit wordt $v_0$

$v_l$ is dit geval wordt gecreëert door de verandering van stroom door de spoel. Deze wordt opgeslagen in het begin en dan terug vrij gegeven.

Dus zelfs na dat de spanning $v_s = 0$ wordt er nog steeds magnetische flux energie (weber [Wb]) vrij gegeven. Dit zorgt ervoor dat de spanning $v_0$ niet direct naar 0 gaat.


$ v_l = L (d i) / (d t) $


==== Full-wave rectifier met inductieve belasting

Net zoals bij de half-wave rectifier gaat de stroom $i_0$ achterlopen op de spanning $v_s$ door de spoel. Maar je krijgt nu een soort uitsmering van de spanning omdat de voltage $v_0$ niet helemaal nul wordt.

#figure(
  image("Full-wave rectifier met inductieve belasting.png", width: 12cm),
  caption: [Full-wave rectifier met inductieve belasting],
  label: <fig:Full-wave-rectifier-met-inductieve-belasting>,
)



==== Heel hoge inductieve belasting

#figure(
  image("Heel hoge inductieve belasting met full wave rectifier.png", width: 12cm),
  caption: [Heel hoge inductieve belasting met full wave rectifier],
  label: <fig:Heel-hoge-inductieve-belasting-met-full-wave-rectifier>,
)

Omdat er een enorm grote inductatie $L$ is gaat de stroom $i_d$ bijna niet veranderen.

De diodes gaat dan enorm hard schakelen omdat er direct 90° verandering is van de stroom. Dit kan in praktijk niet. Je krijgt nog een inductatie van de diodes. Die gaat die grote stroomveranderingen tegenhouden.Dit noemen we #keyterm[Grid-inductantie]


#figure(
  image("Grid inductatie.png", width: 5cm),
  caption: [Grid inductatie],
  label: <fig:Grid-inductatie>,
)

Je krijgt dan #keyterm[Overlapping] waarbij beide diodes tegelijkertijd geleiden. Stel diode 1 $D_1$ begint af te dalen en diode 3 $D_3$ begint te stijgen. Dan gaat D3, D1 #keyterm[Afknijpen].

Hierdoor wordt de spanning over de load $v_0$ tijdelijk 0. Dit komt omdat beide diodes gelijden gaan hun spanningen elkaar uitschakelen.

Het tijdsverschil waarbij de diodes tegelijkertijd geleiden is $mu$.


=== Alles tesamen

Dus met alles te samen:
- lagging door inductieve load
- spoel door diodes die snelle switching tegengaan.

#figure(
  image("Alles tesamen loads op diode rectifiers.png", width: 12cm),
  caption: [Alles tesamen loads op diode rectifiers],
  label: <fig:Alles-tesamen-loads-op-diode-rectifiers>,
)

- $v_s$ is de spanning van de sinusgolf
- $v_0$ is de spanning over de load
- $I_s$ de stroom van de sinusgolf door spoel van de diodes


We kunnen nu deze grafiek uitleggen:
#figure(
  image("Batterij met series inductatie.png", width: 5cm),
  caption: [Batterij met series inductatie],
  label: <fig:Batterij-met-series-inductatie>,
)

De spanning en stroom zijn kleiner omdat de batterij een bepaalde voltage pas gaat geleiden. Er is een vertraging door de spoel. Door de overlapping is er een afknijping van de spanning.


== Capacitieve load



#TODO[NA DE PAASVAKANTIE]
