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


== Beschermen tegen overstroom
Een overstroom is wanneer er meer stroom door een kabel of apparaat gaat dan dat het aankan. Je hebt twee soorten:
- *Overload current (overbelasting stroom):* Dit is voor kleine Als er teveel stroom door gaat dan
gaat het apparaat of kabel oververhitten en dat kan leiden tot brand of schade aan het apparaat. Dit komt omdat de koolstof verbindingen in de kabels kunnen smelten en dat kan leiden tot een kortsluiting. 
De doorslagvastheid van de kabel verlaagt dan ook door dat smelten, je isolatiemateriaal gaat dan snel achteruit. 
- *Short circuit current (kortsluitingsstroom):* 
Dit gebeurt wanneer er een directe verbinding ontstaat tussen fase en nul (of aarde). 
Oorzaken: beschadiging aan kabels of apparaatfouten.
Gevolg: enorme stroom veroorzaakt brand of apparaatschade.

Hoe beschermen we tegen deze overstroom?
We kunnen dit doen met:
- *Fuses*
- *Circuit breakers*

#theorie(title:"terminologie")[

  #figure(
  image("circuit.png", width: 8cm),
  caption: [circuit],
  label: <fig:circuit>,
)
  $i_n$: nominale stroom van de beveiliging\
  $i_z$: maximale stroom die de kabel aankan\
  $i_b$: maximale stroom die het apparaat aankan\
]

Nu wat gebeurt er als je een enorm grote stroomverandering hebt. Een spoel legt een spanning op afhankelijk van de verandering van de stoom 
$ V = L frac( d i, d t) $

De stroom die door de spoel gecreëert worden is de $i_(c u)$. Je gaat eigenlijk een soort lassing krijgen door de grote stroom. Je schakelaar kan dan beschadigd worden. Je wilt dus een beveiliging die snel genoeg is om deze stroom te onderbreken voordat er schade ontstaat.

Je mag dus niet constant je beveileging gebruiken want die creëren die grote stroomverandering en dat kan leiden tot schade.

#figure(
  cetz.canvas({
    import cetz.draw: *

    // Draw the main line with arrow
    line((0, 0), (13, 0), stroke: 1pt, mark: (end: ">"))

    // Draw tick marks and labels for each threshold
    let positions = (
      (0, $0$),
      (2, $I_b$),
      (3.5, $I_n$),
      (5, $I_(n f)$),
      (6.5, $I_f$),
      (8.5, $I_z$),
      (11, $I_(c u)$),
    )

    for (x, label) in positions {
      line((x, -0.1), (x, 0.1), stroke: 0.5pt)
      content((x, -0.35), label, anchor: "north")
    }
  }),
  caption: [Stroomdrempels voor beveiliging en apparaatbeveiliging],
  label: <fig:stroom-drempels>,
)


Je wilt dat: $I_b$ < $I_n$ < $I_z$ < $I_(c u)$

$I_b$ is de veilig stroom van het apparaat, $I_n$ is de nominale stroom van de beveiliging, $I_z$ is de maximale stroom die de kabel aankan en $I_(c u)$ is de stroom die ontstaat door de spoel bij een grote verandering van stroom. Je wilt dat $I_n$ groter is dan $I_b$ anders gaat de beveiliging aan terwijl je veilig bent. $I_z$ is de maximale stroom die de kabel aankan en die moet groter zijn den $I_n$ omdat anders de kabel kan beschadigd worden voordat de beveiliging aan gaat.

== Fuses (smeltzekering) <sec:fuses>

#figure(
  image("Fuses.png", width: 5cm),
  caption: [Fuses],
  label: <fig:Fuses>,
)

#figure(
  image("Fuses karakteristieken.png", width: 12cm),
  caption: [Fuses karakteristieken],
  label: <fig:Fuses-karakteristieken>,
)

Defuse hier toont de karastiristiek afhankelijk van de stroom. 20A gaat lang duren maar 200A gaat heel snel. Je wilt dus een fuse die snel genoeg is om de stroom te onderbreken voordat er schade ontstaat maar niet te snel zodat het niet onnodig aan gaat.

== Circuit breakers (automatische zekering) <sec:circuit-breakers>


#figure(
  image("Circuit breaker.png", width: 10cm),
  caption: [Circuit breaker],
  label: <fig:Circuit-breaker>,
)

We willen nu dat onze beveiliging niet niet breekt als er een probleem is.

$ "Short circuit" -> "Magnetisch" $
$ "Als het overload" -> "wordt warm" -> "bimetalen strip buigt" -> "schakelt uit."\ $

Je kunt die dan terug primen door de veer van binnen terug op te spannen en het circuit terug te connecteren. Deze veer helpt met de disconnectietijd. We willen dat deze zo kort mogelijk is en een beetje meganische energie in de veer steken zorgt ervoor dat de automaat snel genoeg is om de stroom te onderbreken voordat er schade ontstaat. Deze kan het doen rond de 10ms-30ms. 

Nu dit is alleen voor kortsluitingen. Voor overbelastingen gaat er een bimetalen strip zijn die warm wordt en daardoor buigt en het circuit onderbreekt. Deze heeft een langere tijd nodig om te reageren omdat het afhankelijk is van de warmteontwikkeling. Dit kan variëren van enkele seconden tot enkele minuten, afhankelijk van de mate van overbelasting.

=== Mechanical circuit breakers karakteristieken <sec:mechanical-circuit-breakers-karakteristieken>

#figure(
  image("MCB-karakteristieken.png", width: 12cm),
  caption: [MCB-karakteristieken],
  label: <fig:MCB-karakteristieken>,
)

== Power circuit breakers <sec:power-circuit-breakers>

Dit zijn grotere circuit breakers die gebruikt worden in de industrie of in grote gebouwen. We spreken van stromen van 250A.

Het werkt gelijkaardig aan een circuit breaker waarbij je een schakelijk hebt zoals bij een MCB.


=== Karakteristieken van een power circuit breaker <sec:karakteristieken-van-een-power-circuit-breaker>

#wrap-figure(
  image("Power-circuit breaker.png", width: 7cm),
  caption: [Power-circuit breaker karakteristieken],
  label: <fig:Power-circuit-breaker>,
)[
  De power circuit is gelijkaardig aan de MCB.

  $ "Short circuit" -> "Magnetisch" $
  $ "Overload" -> "Warmte" -> "Bimetaal" -> "Uit" $

  Maar het verschil is dat we ook afhankelijk van de $I_m$, $I_(c u), I_r, I_(l i)$ kunnen we aanpassingen maken aan de tijd dat het gaat trippen en dus uitgaan. $I_m$ is de magnetische drempel, $I_(c u)$ is de breaking capaciteit, $I_r$ is de overload stroom en $I_(l i)$ is de onmiddelijke stroom. 

  Dit geeft ons controle en laat ons selectief zijn. Stel je bent iets aan het leren in het labo en je creëert een short circuit. Dan kan een power circuit als wachtende staat als een andere circuit breaker in het systeem een kortsluiting detecteert en uitgaat. Dit is handig omdat je niet wilt dat het hele systeem uitvalt als er een probleem is in een deel van het systeem. Je wilt dat alleen het deel waar het probleem is uitvalt en de rest van het systeem blijft werken.
]


#figure(
  image("Aanpasbaarheid Power-circuit-breaker.png", width: 5cm),
  caption: [Aanpasbaarheid Power-circuit-breaker],
  label: <fig:Aanpasbaarheid-Power-circuit-breaker>,
)


=== Extra switches <sec:extra-switches>

#wrap-figure(
  image("Schakelaars.png", width: 5cm),
  caption: [Schakelaars],
  label: <fig:Schakelaars>,
)[
- *Schakelaar*
- *Scheider:* 
- *Lastscheider*
- *Vermogenschakelaar*
- *Contactor*
]


== Bescherming tegen schokken

We gaan nu niet alleen ons circuit beschermen maar ook voor schokken tegen mensen.

We hebben twee soorten aanrakingen:
- *Direct contact:* Hierbij ga je direct contact hebben met een #keyterm[Geleider]
We kunnen isoleren, casing, obstakel, waarschuwingen, enzovoort gebruiken om dit te voorkomen.

- *Indirect contact:* Hierbij ga je contact hebben met een #keyterm[Behuizing]. Behuizing is meestal niet gevaarlijk maar als er een fout gebeurt in het circuit kan de behuizing onder spanning komen te staan. Als een persoon dit aanraakt terwijl hij geconnecteerd is met de grond kan dit leiden tot een schok. 

We kunnen de behuizing connecteren aan de grond via een aarding zodat als een persoon dit aanraakt dat er een lagere spanning is over de persoon. De kabel heeft namelijk wel nog een weerstand dus je mag niet kortsluiting aannemen met de grond. 

*Zonder aarding* — de mens is het enige pad naar de grond:

Bij een fout staat de behuizing onder spanning. De lekstroom ($I = 100 "mA"$) vloeit volledig door de mens naar de grond:

$
V_"mens" = I dot R_"mens" = 100 "mA" times 1 k Omega = 100 V quad arrow.r.double "gevaarlijk!"
$

*Met aarding* — de aardkabel biedt een parallelpad:

De aardkabel ($R_1 = 10 Omega$) en de mens ($R_2 = 1 k Omega$) staan *parallel* tussen de behuizing en de grond. Omdat $R_1 < R_2$ vloeit bijna alle stroom door de kabel en niet door de mens.

$
R_"eq" = frac(R_1 dot R_2, R_1 + R_2) = frac(10 Omega times 1 k Omega, 10 Omega + 1 k Omega) approx 9.9 Omega
$

$
V_"mens" = I dot R_"eq" = 100 "mA" times 9.9 Omega approx 1 V quad arrow.r.double "veilig!"
$

De spanning over de mens daalt van 100V naar ≈ 1V dankzij de aarding. Dit is nu een simpel voorbeeld maar aardig is niet altijd veilig. Soms is er nog genoeg spanning om een mensen te schaden.

*Maar een aardig geeft ons meer tijd om te reageren:*







== Aarding systemen


