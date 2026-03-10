#import "../../school-template.typ": *


= Bescherming van laag voltage net <ch:bescherming-laag-voltage-net>
Dit hoofdstuk gaat over elektrische veiligheid. Het is een bijvulling van _electrical safety_ van wisselstroom.

=== Inhoud
- Gevaren van elektriciteit
- Elektrische materialen
- Bescherming tegen overstroom
- Bescherming van elektrische shocks
- Aarding systemen


_er is een nieuwe cursus van dit deel, er kunnen fouten in staan maar enorm goed studiemiddel_
== Gevaren van elektriciteit
Elektriciteit kan enorm schade veroorzaken als het niet goed gehandeld worden zoals *Brand* of *Elektrocutie*

Het gevaar van elektriciteit voor een mens wordt op stroom $I[A]$ uitgedrukt. Stromen van 30mA kan al heel gevaarlijk zijn. Dit komt omdat je lichaam een redelijk grote weerstand heeft en dus moet je wel wat voltage krijgen om je aan te tasten.

De tijd is ook belangrijk, Bij hogere stromen wordt de tijd voor mogelijke dood veel kleiner. Soms opslag.

Stroom is gevaarlijk omdat het je #keyterm[Spieren] en dus je #keyterm[Hart] kan doen stoppen.

als je beveiliging een lekstroom van 30mA detecteert gaat die direct uitgaan. Dit is zo ontworpen omdat 30mA net op de grens dit waar een hartstilstand kan optreden.

De dikte van het de huid bepaald je weerstand $R[Omega]$

#figure(
  image("Menselijk gevaar stroom.png", width: 8cm),
  caption: [Menselijk gevaar stroom],
  label: <fig:Menselijk-gevaar-stroom>,
)

Deze curves zijn wel niet zo handig want de stroom is volledig bepaald door de weerstand

$ V = I dot R $

De figuren zijn vertaald naar voltage curves.

#wrap-figure(
  image("Veiligheids curves.png", width: 6cm),
  caption: [Veiligheids curves],
  label: <fig:Veiligheids-curves>,
)[

  Deze zijn gemaakt met mensen in het achterhoofd. De impedantie van de mens is genomen en daaruit de voltage grenzen berekent.

  De code's _BB1, BB2, BB3_ zijn afhankelijk van je de toestand. Is je huid nat of droog. Volledig ondergedompeld of niet?

  #figure(
    image("grenzen-BB.png", width: 8cm),
    caption: [grenzen-BB],
    label: <fig:grenzen-BB>,
  )
]
=== Regulatie <sec:regulatie>

#wrap-figure(
  image("regulatie elektriciteit.png", width: 5cm),
  caption: [regulatie elektriciteit],
  label: <fig:regulatie-elektriciteit>,
)[
  Alles van elektrische systemen, stroomleidingen, motoren, basisgezien alles elektrisch wordt gereguleerd door deze organisaties en keurmerken.
  - IEC (International Electrotechnical Commission)
  - CEBEC
  - C C
  - UL

  De IEC en BEC zijn standaarden. zoals de frequentie $H z$ van het net of voltages rond producten.

  CEBEC, DVE zijn keur/kwaliteitsmerken. De fabricant met een goed merk gaan hun producten keuren.
]

=== Ip-nummers (index of prodection) <sec:ip-nummers>
Er zijn 3 cijfers _in dit vak vooral over 2_

#wrap-figure(
  image("IP-rating.png", width: 4cm),
  caption: [IP-rating],
  label: <fig:IP-rating>,
)[Het eerste number gaat over live aanraken van het elektriciteit. Is het stofbeschermend, is het veilig om met de vinger aan te raken? Hoe hoger hoe meer beschermt

  Het tweede number gaat over waterdichtheid.Hoe hoger het number hoe meer beschermt tegen water. ipx7 is volledig waterdicht. ]

#voorbeeld(title: "motoren ip-rating")[

  #wrap-figure(
    image("ip-motoren-oefening.png", width: 5cm),
    caption: [ip-motoren-oefening],
    label: <fig:ip-motoren-oefening>,
  )[Je wilt het grootste vermogen wat is de beste motor?
    $arrow.r.double$ je zou zeggen de tweede motor maar dat is niet zo want IP zegt niks over beste motor voor puur vermogen.

    Motor 1 IP23 is beter omdat je beter transport hebt van warmte omdat het minder gesloten is. $"Hoger" !="always better"$
  ]
]

Waarvoor is het wel belangrijk

=== Explosies <sec:explosies>
#wrap-figure(
  image("explosie2.png", width: 5cm),
  caption: [explosie2],
  label: <fig:explosie2>,
)[
  Een explosie is verschillend dan brand. Een explosie is een abrupte uitzetting van een volume.
  Je moet dus veiligheidsmaatregelen nemen bij explosieve materialen zodat schoken en zuurstof niet aanwezig zijn
]

De manier om dat de standardiseren zijn de *ATEX* codes.
#figure(
  image("atex-codes.png", width: 7cm),
  caption: [atex-codes],
  label: <fig:atex-codes>,
)

Dit zijn codes om vlambaarheid en explosiviteit te rankschikken zodat de juiste voorzorgmaatregelen kan genomen worden.


=== Isolatieklassen <sec:isolatieklassen>

Verschillende materialen kunnen elektriciteit isoleren. Hier heb je klasses is. Je moet wel zien want materialen kunnen afhankelijk van de temperatuur slechtere isolators worden en dat kan gevaardlijk worden. Ze hebben dus meestal een temperatuursgrens.

*Alle klassen*

#figure(
  image("isolatieklassen.png", width: 9cm),
  caption: [isolatieklassen],
  label: <fig:isolatieklassen>,
)

=== Werken aan elektriciteit <sec:werken-aan-elektriciteit>

#belangrijk[Nooit alleen werken aan een elektrische installatie]
Je weet nooit wat er mis kan gaan en je wilt niet alleen zijn als er iets misgaat en je moet gered worden.

De vitale vijf zijn de stappen die je moet volgen om de veiligheid van de net te garanderen.

+ *Cut off*: De stroom afzetten
+ *Lock out*: De stroom op slot zetten
+ *Verify no voltage*: met multimeter voltage meten
+ *Grounding*: Aard en short circuit de installatie
+ *Secure the area*: De omgeving beveiligen

#figure(
  image("Vitale vijf.png", width: 8cm),
  caption: [Vitale vijf],
  label: <fig:Vitale-vijf>,
)

=== Contact

*Direct contact*\
Hierbij ga je direct contact hebben met een #keyterm[Geleider]
$arrow.r.double$ zorg dat je deze niet kunt aanraken. Zet bescherming rond en waarschuwingen.

*Indirect contact*\
#wrap-figure(
  image("Indirect Contact.png", width: 6cm),
  caption: [Indirect Contact],
  label: <fig:Indirect-Contact>,
)[
  Vele accidenten gebeuren bij indirect contact. Een behuizing heeft geen enkele spanning en dus zou volledig ongevaarlijk moeten zijn. Jef zit op hetzelfde voltagepunt als de Nuldraad.

  $ arrow.b.double $
  Moest de motor kortsluiten of iets anders gebeuren kan de nulgeleider onder spanning komen te staan. Dan gaat Jef een schok krijgen. $arrow.r.double$ Je gaat een aarding ook op de behuizing plaatsen zodat het spanningsverschil over Jef 0 is.
]


== Electrische materialen

#figure(
  image("Conductor & Isolator.png", width: 12cm),
)

Je materiaal bepaald hoe resistief $R[Omega]$ het is. Hoe hoger de weerstand hoe beter het isoleert.


*Capaciteit met een dielectrum*\
de permitiviteit van een materiaal bepaald hoe de capaciteit gaat veranderen als je een materiaal invoegt.
#wrap-figure(
  image("Capaciteit met dielectric.png", width: 5cm),
  caption: [Capaciteit met dielectric],
  label: <fig:Capaciteit-met-dielectric>,
)[
  Waarom is dit interresant voor ons. Lange afstands kabels gaan namelijk capacitief zijn met de grond dat ervoor kan zorgen dat de efficientie afneemt.
  $ Q_0 = C_0 V_0 $

  $ Q = C V $

  $ C = epsilon_r C_0 = epsilon_r epsilon_0 A/d $

  $ U_0 = Q/C_0 = frac(C_0 V_0^2, 2) $
  $
    Delta U = frac(C V^2, 1) = 1/2 epsilon_r C_0 V^2/epsilon_r^2 =
    frac(U_0, epsilon_r)
  $
]

Het interessante is dat bij hogere spanningen dat je doorslag begint te krijgen. Lucht kan daardoor geleidend worden. Dit noemt men de #keyterm[Kritische veldsterkte]

#figure(
  image("elektrisch-breakdown.png", width: 10cm),
  caption: [elektrisch-breakdown],
  label: <fig:elektrisch-breakdown>,
)

== Bescherming tegen overstroom

Elektriciteitsdraden kunnen maar een beperkte stroom aan voordat ze te warm worden en doorbranden. We beschermen ze op twee manieren:

*1. Zekeringen (Smeltveiligheden)*
Dit is een draadje dat letterlijk doorsmelt als de stroom te hoog wordt. 
- *Voordeel:* Heel goedkoop en betrouwbaar (kan niet mechanisch falen).
- *Nadeel:* Je moet ze vervangen na gebruik.

*2. Installatieautomaten (Circuit breakers / Zekeringautomaat)*
Dit is een schakelaar die automatisch afslaat. Ze werken met twee mechanismen:
- *Thermisch (bimetaal):* Beschermt tegen langdurige, lichte overbelasting (b.v. te veel toestellen op één kring). Het metaal warmt op, buigt en schakelt af.
- *Magnetisch (spoel):* Beschermt tegen kortsluiting (enorme stroompiek). Dit reageert onmiddellijk.

#examenbox[Ken de uitschakelcurves! B-curve is voor standaard huishoudelijke kringen (slaat snel af bij pieken). C-curve en D-curve kunnen grotere startstromen aan en worden gebruikt voor motoren of zware machines.]

== Bescherming tegen lekstroom/shocks

*De differentieelschakelaar (Verliesstroomschakelaar / RCD)*
Deze schakelaar meet continu de stroom die *vertrekt* (via de fase) en de stroom die *terugkomt* (via de nulgeleider). 
Als deze twee niet exact gelijk zijn, stroomt er ergens stroom "weg" (bijvoorbeeld door Jef die een schok krijgt, of naar de aarding). 

- Voor vochtige ruimtes (badkamer) gebruiken we een gevoelige differentieel van *30mA* (zie begin van dit hoofdstuk: de grens voor hartstilstand).
- Voor de algemene installatie gebruiken we *300mA*.

== Aardingsnetten (Cruciaal!) <sec:aardingsnetten>

Hoe we het netwerk en de behuizingen aarden, bepaalt hoe we beveiligen. Je hebt de 3 letters:
1e letter (Bron): *T* = Terra (geaard), *I* = Geïsoleerd
2e letter (Verbruiker): *T* = Terra (lokaal geaard), *N* = Verbonden met de Nul van de bron

*1. TT-netwerk (Terra-Terra)*
- De bron is geaard.
- De behuizing van de consument heeft een *eigen, lokale aarding*.
- *Beveiliging:* Omdat de aardingsweerstand relatief hoog kan zijn, is de kortsluitstroom vaak niet hoog genoeg om een zekering te doen springen. Daarom is in een TT-net een *differentieelschakelaar verplicht*! Dit is het standaardnetwerk voor huizen in België.

*2. TN-netwerk (Terra-Neutral)*
- De bron is geaard.
- De behuizing van de consument is verbonden met de *nulgeleider (PEN of PE)* van de bron.
- Bij een fout op de behuizing ontstaat een keiharde kortsluiting (weinig weerstand). De stroom schiet enorm de hoogte in.
- *Beveiliging:* Een gewone zekering of automaat is voldoende om snel af te schakelen. Wordt veel in de industrie gebruikt.
  - *TN-C:* PE en N draad zijn gecombineerd (PEN).
  - *TN-S:* PE (aarding) en N (nuldraad) zijn gescheiden.

*3. IT-netwerk (Geïsoleerd-Terra)*
- De bron is *niet* geaard (of via een zeer hoge impedantie).
- De behuizing van de verbruiker is lokaal geaard.
- *Groot voordeel:* Bij een eerste fout (b.v. fase raakt behuizing) valt het net *niet* uit, omdat de stroom nergens heen kan (kring is niet gesloten). Dit is cruciaal voor ziekenhuizen (operatiekamers) of continue productieprocessen.
- *Beveiliging:* Een isolatiewachter detecteert de eerste fout en geeft een alarm, waarna men het kan fixen zonder downtime.







