#import "../../school-template.typ": *

= Diode Rectifiers <ch:diode-rectifiers>

== Herhaling Diodes

#figure(
  image("assets/Karaktiristieken van een diode.png", width: 12cm),
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
  image("assets/Single-phase half recertifier.png", width: 12cm),
  caption: [Single-phase half recertifier],
  label: <fig:Single-phase-half-recertifier>,
)

Door de diode gaan negatieve spanningen geblokkeerd worden.

Je diode gaat stoppen met stromen omdat de stroom nul wordt. Herinner je de voorwaarden dat de #keyterm[schakkelaar] dichtgaat als de stroom nul is en je moet dus terug een positieve spanning hebben om deze terug te laten geleiden.


Je gemiddelde uitput spanning is:

$ overline(U_0) = sqrt(2)/pi dot U_b $

=== Single Phase Full wave Rectifier

#figure(
  image("assets/Full-wave diode rectiefier.png", width: 12cm),
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
    image("assets/Pulse nummer.png", width: 5cm),
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
    image("assets/Oefening rectifier.png", width: 12cm),
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
  image("assets/Commutatie.png", width: 12cm),
  caption: [Commutatie],
  label: <fig:Commutatie>,
)

Dit is het ideale voorbeeld omdat er geen enkele verandering probleem is door #keyterm[spoelen of condensatoren].


We gaan een ideale batterij toevoegen aan de load. Deze gaat alleen stroom leveren als de spanning $v_s$ groter is dan de spanning over de batterij $v_b$.

$ v_s > v_b $

#figure(
  image("assets/Commutatie batterij alt.png", width: 12cm),
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
  image("assets/Inductieve-resitieve load.png", width: 5cm),
  caption: [Inductieve-resitieve load],
  label: <fig:Inductieve-resitieve-load>,
)

We gaan dit stap per stap aanpakken om het te begrijpen.

==== Half wave rectifier met inductieve belasting
Herinner je dat een spoel de voltage verschillen gaat tegengaan. Die doet dit door magnetische flux op te slaan en deze dan terug vrij te geven.


Je stroom $i_0$ gaat achterlopen op de spanning $v_s$ door de spoel.

#figure(
  image("assets/Half-wave rectifier met inductieve belasting.png", width: 12cm),
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
  image("assets/Full-wave rectifier met inductieve belasting.png", width: 12cm),
  caption: [Full-wave rectifier met inductieve belasting],
  label: <fig:Full-wave-rectifier-met-inductieve-belasting>,
)



==== Heel hoge inductieve belasting

#figure(
  image("assets/Heel hoge inductieve belasting met full wave rectifier.png", width: 12cm),
  caption: [Heel hoge inductieve belasting met full wave rectifier],
  label: <fig:Heel-hoge-inductieve-belasting-met-full-wave-rectifier>,
)

Omdat er een enorm grote inductatie $L$ is gaat de stroom $i_d$ bijna niet veranderen. Een spoelt wil namelijk geen enkele verandering die wilt altijd dat het magnetische veld in de spoel constant is.

De diodes gaat dan enorm hard schakelen omdat er direct 90° verandering is van de stroom. Dit kan in praktijk niet. Je krijgt nog een inductatie van de diodes. Die gaat die grote stroomveranderingen tegenhouden. Dit noemen we #keyterm[Net-inductantie]


#figure(
  image("assets/Net Inductantie.png", width: 15cm),
  caption: [Net Inductantie],
  label: <fig:Net-Inductantie>,
)
Je krijgt dan #keyterm[Overlapping] waarbij beide diodes tegelijkertijd geleiden. Stel diode 1 $D_1$ begint af te dalen en diode 3 $D_3$ begint te stijgen. Dan gaat D3, D1 #keyterm[Afknijpen].

Hierdoor wordt de spanning over de load $v_0$ tijdelijk 0. Dit komt omdat beide diodes gelijden gaan hun spanningen elkaar uitschakelen.

Dit noemt *diode commutatie overlap* waarbij beide diodes gaan geleiden. Het tijdsverschil waarbij de diodes tegelijkertijd geleiden is $mu$.

Dit is de reden dat diodes niet volledig efficient zijn. Dit phenoneem is in de grafieken overdreven maar deze kleine verschillen zorgen ervoor dat diodes bijvoorbeeld een efficientie hebben van 95%.

Hieronder is de figuur van de powerquality van een 3 fase systeem waar je duidelijk sprongen zien in je voltage door de diodes

#figure(
  image("assets/Power quality van diodes.png", width: 10cm),
  caption: [Power quality van diodes],
  label: <fig:Power-quality-van-diodes>,
)

=== Alles tesamen

Dus met alles te samen:
- lagging door inductieve load
- spoel door diodes die snelle switching tegengaan.

#figure(
  image("assets/Alles tesamen loads op diode rectifiers.png", width: 12cm),
  caption: [Alles tesamen loads op diode rectifiers],
  label: <fig:Alles-tesamen-loads-op-diode-rectifiers>,
)

- $v_s$ is de spanning van de sinusgolf
- $v_0$ is de spanning over de load
- $I_s$ de stroom van de sinusgolf door spoel van de diodes


De spanning en stroom zijn kleiner omdat de batterij een bepaalde voltage pas gaat geleiden. Er is een vertraging door de spoel. Door de overlapping is er een afknijping van de spanning.


== Capacitieve load

=== Halve golf rectifier met Capacitieve load

Als je de standaard AC input krijgt wordt die gesmooth door de capaciteit in parallel met de output. Je krijgt dan een *Smoothing* effect op je output.

Je ziet op de grafiek dat eerst alle negatieve spanningen worden tegengehouden door de diode. En daarna komt hij pas bij de output.

#figure(
  image("assets/Capacitieve load.png", width: 12cm),
  caption: [Capacitieve load],
  label: <fig:Capacitieve-load>,
)

Niks is perfect en er gaat dus een trade off zijn door dit te doen.

$ i = C (d v)/(d t) $

De stroom $i$ is afhankelijk van de veranderingen van de spanning. Dus als onze spanning daalt gaat onze stroom ook negatief is.

Laten we dit verder bekijken met terug onze *brug rectiefier*

=== Capacitieve load met brug rectiefier

#figure(
  image("assets/Capacitieve brug rectifier.png", width: 12cm),
  caption: [Capacitieve brug rectifier],
  label: <fig:Capacitieve-brug-rectifier>,
)


#wrap-figure(
  image("assets/Capicitieve stroom.png", width: 4cm),
  caption: [Capicitieve stroom],
  label: <fig:Capicitieve-stroom>,
)[
  We weten dat een brug rectifier onze voltage $v(t)$ gaat normaliseren zodat die constant is.

  Bij de daling van de spanning gaat de condensator stroom leveren naar de load. De load vraagt een bepaalde stroom dus na een punt gaat alle stroom geleverd worden door de capaciteit. De stroom in de diode gaat dan nul zijn en zoals we hiervoor gezien hebben betekent dat dat de diode stopt met geleiden en zijn poort terug open doet.


  Alles te samen wordt dit onze capacitieve netstroom:

  #figure(
    image("assets/Capicitieve netstroom.png", width: 10cm),
    caption: [Capicitieve netstroom],
    label: <fig:Capicitieve-netstroom>,
  )

  met:
  - #text(fill: schoolGreen)[*Groen:*] AC stroom
  - #text(fill: schoolBlue)[*Blauw:*] Negatieve stroom van capaciteit
  - #text(fill: amber)[*Geel:*] Spanning over load
  - #text(fill: brandblue)[*Licht blauw:*] stroom over load.
  - #text(fill: schoolRed)[*Rood*] Capacitiet

]


== Three-phase diode rectifiers <sec:three-phase:diode-rectifiers>

Dus nu hebben we terug rectiefiers maar nu willen we 3 fase systemen balanceren zodat we een constante stroom hebben.

#figure(
  image("assets/3 diode rectifiers.png", width: 10cm),
  caption: [3 diode rectifiers],
  label: <fig:3-diode-rectifiers>,
)

#wrap-figure(
  image("assets/3 Fase rectifier.png", width: 5cm),
  caption: [3 Fase rectifier],
  label: <fig:3-fase-rectifier>,
)[

  Deze ziet er zo uit. Hierbij gaat een voor een de diodes geleiden in de fases. Een belangrijk concept is het pulse nummer

  #concept(title: "Pulse nummer")[

    De hoeveelheid switches die gebeuren per periode. Hier is het pulse nummer 6 omdat er 3 diodes 2 keer switchen per periode.
  ]

  Nu wat er vreemd is aan een 3 fasige is dat je zelfs bij een volledig resistieve belasting dat je toch *Commutation* krijgt. Door de overlapping van de stroom van de diodes, het moment dat de stroom van de ene diode hoger is dan de vorige gaat de de diode afknijpen en stopt die met geleiden.

]

