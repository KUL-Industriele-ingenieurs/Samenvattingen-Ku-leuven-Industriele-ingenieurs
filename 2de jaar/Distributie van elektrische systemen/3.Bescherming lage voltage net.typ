#import "../../school-template.typ": *


= Bescherming van laag voltage net <ch:bescherming-laag-voltage-net>
Dit hoofdstuk gaat over elektrische veiligheid. Het is een bijvulling van _electrical safety_ van wisselstroom.

_er is een nieuwe cursus van dit deel, er kunnen fouten in staan maar enorm goed studiemiddel_
== Gevaren van elektriciteit
Elektriciteit kan enorm schade veroorzaken als het niet goed gehandeld worden zoals *Brand* of *Elektrocutie*

Het gevaar van elektriciteit voor een mens wordt op stroom $I[A]$ uitgedrukt. Stromen van 30mA kan al heel gevaarlijk zijn. Dit komt omdat je lichaam een redelijk grote weerstand heeft en dus moet je wel wat voltage krijgen om je aan te tasten.

De tijd is ook belangrijk, Bij hogere stromen wordt de tijd voor mogelijke dood veel kleiner. Soms opslag.

Stroom is gevaarlijk omdat het je #keyterm[Spieren] en dus je #keyterm[Hart] kan doen stoppen.

als je beveiliging een lekstroom van 30mA detecteert gaat die direct uitgaan. Dit is zo ontworpen omdat 30mA net op de grens dit waar een hartstilstand kan optreden.

De dikte van het de huid bepaald je weerstand $R[Omega]$

#figure(
  image("assets/Menselijk gevaar stroom.png", width: 8cm),
  caption: [Menselijk gevaar stroom],
  label: <fig:Menselijk-gevaar-stroom>,
)

Deze curves zijn wel niet zo handig want de stroom is volledig bepaald door de weerstand

$ V = I dot R $

De figuren zijn vertaald naar voltage curves.

#wrap-figure(
  image("assets/Veiligheids curves.png", width: 6cm),
  caption: [Veiligheids curves],
  label: <fig:Veiligheids-curves>,
)[

  Deze zijn gemaakt met mensen in het achterhoofd. De impedantie van de mens is genomen en daaruit de voltage grenzen berekent.

  De code's _BB1, BB2, BB3_ zijn afhankelijk van je de toestand. Is je huid nat of droog. Volledig ondergedompeld of niet?

  #figure(
    image("assets/grenzen-BB.png", width: 8cm),
    caption: [grenzen-BB],
    label: <fig:grenzen-BB>,
  )
]
=== Normen en keurmerken <sec:regulatie>

#wrap-figure(
  image("assets/regulatie elektriciteit.png", width: 5cm),
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

=== IP-code (Ingress Protection) <sec:ip-nummers>
Er zijn 3 cijfers _in dit vak vooral over 2_

#wrap-figure(
  image("assets/IP-rating.png", width: 4cm),
  caption: [IP-rating],
  label: <fig:IP-rating>,
)[
  De #keyterm[IP-code] (Ingress Protection) zegt in twee cijfers hoe goed een behuizing afgesloten is.

  Het #strong[eerste cijfer] gaat over vaste voorwerpen en aanraking: kan je er met een vinger of een draad bij de spanningvoerende delen, en houdt de behuizing stof tegen? Hoe hoger, hoe beter afgesloten.

  Het #strong[tweede cijfer] gaat over water, van druppels tot volledige onderdompeling. IPx7 blijft dicht onder water.

  Staat er een `x` in plaats van een cijfer, dan is dat aspect niet getest of niet gespecificeerd.
]

#voorbeeld(title: "motoren ip-rating")[

  #wrap-figure(
    image("assets/ip-motoren-oefening.png", width: 5cm),
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
  image("assets/explosie2.png", width: 5cm),
  caption: [explosie2],
  label: <fig:explosie2>,
)[
  Een explosie is verschillend dan brand. Een explosie is een abrupte uitzetting van een volume.
  Je moet dus veiligheidsmaatregelen nemen bij explosieve materialen zodat schoken en zuurstof niet aanwezig zijn
]

De manier om dat de standardiseren zijn de *ATEX* codes.
#figure(
  image("assets/atex-codes.png", width: 7cm),
  caption: [atex-codes],
  label: <fig:atex-codes>,
)

Dit zijn codes om vlambaarheid en explosiviteit te rankschikken zodat de juiste voorzorgmaatregelen kan genomen worden.


=== Isolatieklassen <sec:isolatieklassen>

Verschillende materialen kunnen elektriciteit isoleren. Hier heb je klasses is. Je moet wel zien want materialen kunnen afhankelijk van de temperatuur slechtere isolators worden en dat kan gevaardlijk worden. Ze hebben dus meestal een temperatuursgrens.

*Alle klassen*

#figure(
  image("assets/isolatieklassen.png", width: 9cm),
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
  image("assets/Vitale vijf.png", width: 8cm),
  caption: [Vitale vijf],
  label: <fig:Vitale-vijf>,
)

=== Contact

*Direct contact*\
Hierbij ga je direct contact hebben met een #keyterm[Geleider]
$arrow.r.double$ zorg dat je deze niet kunt aanraken. Zet bescherming rond en waarschuwingen.

*Indirect contact*\
#wrap-figure(
  image("assets/Indirect Contact.png", width: 6cm),
  caption: [Indirect Contact],
  label: <fig:Indirect-Contact>,
)[
  Vele accidenten gebeuren bij indirect contact. Een behuizing heeft geen enkele spanning en dus zou volledig ongevaarlijk moeten zijn. Jef zit op hetzelfde voltagepunt als de Nuldraad.

  $ arrow.b.double $
  Moest de motor kortsluiten of iets anders gebeuren kan de nulgeleider onder spanning komen te staan. Dan gaat Jef een schok krijgen. $arrow.r.double$ Je gaat een aarding ook op de behuizing plaatsen zodat het spanningsverschil over Jef 0 is.
]


== Elektrische materialen

#figure(
  image("assets/Conductor & Isolator.png", width: 12cm),
)

Je materiaal bepaald hoe resistief $R[Omega]$ het is. Hoe hoger de weerstand hoe beter het isoleert.


*Capaciteit met een dielectrum*\
de permitiviteit van een materiaal bepaald hoe de capaciteit gaat veranderen als je een materiaal invoegt.
#wrap-figure(
  image("assets/Capaciteit met dielectric.png", width: 5cm),
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
  image("assets/elektrisch-breakdown.png", width: 10cm),
  caption: [elektrisch-breakdown],
  label: <fig:elektrisch-breakdown>,
)

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

#theorie(title: "terminologie")[

  #figure(
    image("assets/circuit.png", width: 8cm),
    caption: [circuit],
    label: <fig:circuit>,
  )
  $i_n$: nominale stroom van de beveiliging\
  $i_z$: maximale stroom die de kabel aankan\
  $i_b$: maximale stroom die het apparaat aankan\
]

Nu wat gebeurt er als je een enorm grote stroomverandering hebt. Een spoel legt een spanning op afhankelijk van de verandering van de stoom
$ V = L frac(d i, d t) $

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

== Smeltzekeringen (fuses) <sec:fuses>

#figure(
  image("assets/Fuses.png", width: 5cm),
  caption: [Fuses],
  label: <fig:Fuses>,
)

#figure(
  image("assets/Fuses karakteristieken.png", width: 12cm),
  caption: [Fuses karakteristieken],
  label: <fig:Fuses-karakteristieken>,
)

Defuse hier toont de karastiristiek afhankelijk van de stroom. 20A gaat lang duren maar 200A gaat heel snel. Je wilt dus een fuse die snel genoeg is om de stroom te onderbreken voordat er schade ontstaat maar niet te snel zodat het niet onnodig aan gaat.

== Automaten (circuit breakers) <sec:circuit-breakers>


#figure(
  image("assets/Circuit breaker.png", width: 10cm),
  caption: [Circuit breaker],
  label: <fig:Circuit-breaker>,
)

We willen nu dat onze beveiliging niet niet breekt als er een probleem is.

$ "Short circuit" -> "Magnetisch" $
$ "Als het overload" -> "wordt warm" -> "bimetalen strip buigt" -> "schakelt uit."\ $

Je kunt die dan terug primen door de veer van binnen terug op te spannen en het circuit terug te connecteren. Deze veer helpt met de disconnectietijd. We willen dat deze zo kort mogelijk is en een beetje meganische energie in de veer steken zorgt ervoor dat de automaat snel genoeg is om de stroom te onderbreken voordat er schade ontstaat. Deze kan het doen rond de 10ms-30ms.

Nu dit is alleen voor kortsluitingen. Voor overbelastingen gaat er een bimetalen strip zijn die warm wordt en daardoor buigt en het circuit onderbreekt. Deze heeft een langere tijd nodig om te reageren omdat het afhankelijk is van de warmteontwikkeling. Dit kan variëren van enkele seconden tot enkele minuten, afhankelijk van de mate van overbelasting.

=== Karakteristieken van automaten <sec:mechanical-circuit-breakers-karakteristieken>

#figure(
  image("assets/MCB-karakteristieken.png", width: 15cm),
  caption: [MCB-karakteristieken],
  label: <fig:MCB-karakteristieken>,
)

== Vermogenschakelaars (power circuit breakers) <sec:power-circuit-breakers>

Dit zijn grotere circuit breakers die gebruikt worden in de industrie of in grote gebouwen. We spreken van stromen van 250A.

Het werkt gelijkaardig aan een circuit breaker waarbij je een schakelijk hebt zoals bij een MCB.


=== Karakteristiek van een vermogenschakelaar <sec:karakteristieken-van-een-power-circuit-breaker>

#wrap-figure(
  image("assets/Power-circuit breaker.png", width: 7cm),
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
  image("assets/Aanpasbaarheid Power-circuit-breaker.png", width: 5cm),
  caption: [Aanpasbaarheid Power-circuit-breaker],
  label: <fig:Aanpasbaarheid-Power-circuit-breaker>,
)


=== Schakelapparatuur <sec:extra-switches>

#wrap-figure(
  image("assets/Schakelaars.png", width: 6cm),
  caption: [De symbolen van de vijf schakeltoestellen. Het streepje bovenaan betekent zichtbare scheiding, het bolletje "breekt belastingsstroom", het kruisje "breekt kortsluitstroom".],
  label: <fig:Schakelaars>,
)[
  Vijf toestellen die er in een schema op lijken, maar elk iets anders kunnen. Wat ze onderscheidt, is #belangrijk[welke stroom ze mogen onderbreken].

  / Schakelaar: het algemene symbool. Schakelt de bedrijfsstroom, verder geen eisen.
  / Scheider (isolator, disconnector): mag #strong[niet] onder belasting bediend worden. Zijn taak is een zichtbare, betrouwbare onderbreking maken zodat er veilig aan de installatie gewerkt kan worden. Het streepje bovenaan het symbool staat voor die zichtbare scheiding.
  / Lastscheider (load-break switch): een scheider die je wél onder normale belasting mag openen. Een kortsluitstroom kan hij niet breken.
  / Vermogenschakelaar (circuit breaker): breekt de bedrijfsstroom én de kortsluitstroom. Daarvoor heeft hij een vlamboogblusinrichting nodig, en dat is het kruisje in het symbool.
  / Contactor: elektromagnetisch bediend, gemaakt om #strong[vaak] te schakelen. Hij beveiligt niet; daarvoor zet je er een zekering of automaat bij.

  #examenbox[
    "Wat doet een lastscheider, en vergelijk met een vermogenschakelaar" is als open vraag gesteld in juni 2023. Het antwoord zit in de laatste kolom: allebei schakelen ze onder belasting, maar alleen de vermogenschakelaar overleeft een kortsluiting.
  ]
]



=== Zekering tegenover automaat <sec:zekering-vs-automaat>

- / Smeltzekering: een draadje dat doorsmelt. Goedkoop en betrouwbaar, want er kan niets mechanisch falen. Je moet ze wel vervangen na gebruik.
- / Installatieautomaat: een schakelaar die vanzelf afslaat en die je opnieuw inschakelt. Ze werkt met twee mechanismen tegelijk: een bimetaal tegen langdurige lichte overbelasting, en een spoel die onmiddellijk reageert op een kortsluitpiek.

#examenbox[Ken de uitschakelcurves. De B-curve is voor gewone huishoudkringen en slaat snel af bij pieken; de C- en D-curve laten grotere startstromen toe en dienen voor motoren of zware machines.]

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

Aarden alleen volstaat niet altijd: er kan nog genoeg spanning overblijven om iemand te verwonden. Wel wint de installatie er tijd mee om af te schakelen.


=== De differentieelschakelaar (RCD) <sec:rcd>

Een #keyterm[RCD] (Residual Current Device, differentieel- of verliesstroomschakelaar) meet doorlopend de stroom die *vertrekt* via de fase en de stroom die *terugkomt* via de nulgeleider. Zijn die twee niet gelijk, dan loopt er ergens stroom weg, bijvoorbeeld door een mens of naar de aarding, en schakelt hij af.

- Voor vochtige ruimtes zoals een badkamer neem je een gevoelige RCD van $30 "mA"$, de grens waarboven een hartstilstand kan optreden.
- Voor de algemene installatie volstaat $300 "mA"$.

== Aardingsnetten <sec:aardingsnetten>

Hoe je de bron en de behuizingen aardt, bepaalt welke beveiliging werkt.

De code bestaat uit twee letters:

/ Eerste letter, de bron: *T* (terra) betekent dat het sterpunt geaard is, *I* dat het geïsoleerd is of via een hoge impedantie aan de aarde hangt.
/ Tweede letter, de verbruiker: *T* betekent dat de massa's een eigen lokale aarding hebben, *N* dat ze aan de nulgeleider van de bron hangen.

Bij TN volgt er nog een letter voor de manier waarop PE en N lopen: *C* voor gecombineerd (PEN), *S* voor gescheiden.

=== TT <sec:net-tt>

#figure(
  image("assets/DEE_net_TT.png", width: 13cm),
  caption: [TT: de bron is geaard, en elke verbruiker heeft zijn eigen aardelektrode. Er loopt geen geleider tussen beide aardingen.],
  label: <fig:net-tt>,
)

Bron en verbruiker zijn allebei geaard, maar los van elkaar. De foutstroom moet dus door de #belangrijk[grond] terug naar de bron, en die weg heeft een hoge weerstand.

$ I_"fout" approx U_f / (R_"aarde,verbruiker" + R_"aarde,net") $

met:
- $I_"fout"$: foutstroom bij een isolatiefout naar de massa [A]
- $U_f$: fasespanning [V]
- $R_"aarde,verbruiker"$, $R_"aarde,net"$: aardverspreidingsweerstand aan beide kanten [$Omega$]

De aanraakspanning die daaruit volgt, is $U_z = R_"aarde" dot I_"fout"$.

#belangrijk[Die foutstroom is te klein om een zekering of automaat te doen aanspreken.] Daarom is in een TT-net een #keyterm[RCD] verplicht: die meet het verschil tussen heen- en teruggaande stroom en heeft geen grote foutstroom nodig. TT is het standaardnet voor woningen in België.

=== TN-C <sec:net-tn-c>

#figure(
  image("assets/DEE_net_TN-C.png", width: 13cm),
  caption: [TN-C: PE en N zijn samengevoegd tot één #strong[PEN]-geleider, die zowel de bedrijfsstroom van de nulleider voert als de beschermingsfunctie vervult.],
  label: <fig:net-tn-c>,
)

De massa's hangen via de PEN-geleider aan het geaarde sterpunt van de bron. Een isolatiefout is daardoor een echte kortsluiting tussen fase en PEN, met een grote foutstroom als gevolg:

$ I_"fout" = (c dot U_f) / (R_"fase" + R_"PE" + R_"fout") $

met:
- $c$: correctiefactor voor de spanningsval in het net bij kortsluiting, typisch $#"0,8"$ [-]
- $R_"fase"$, $R_"PE"$: weerstand van de fase- en beschermingsgeleider [$Omega$]
- $R_"fout"$: overgangsweerstand op de foutplaats [$Omega$]

Die stroom is groot genoeg voor een gewone automaat of zekering, dus een RCD is hier niet nodig. De aanraakspanning volgt uit de spanningsdeler over de twee geleiders:

$ U_z = R_"PE" / (R_"PE" + R_"fase") dot c dot U_f $

#waarschuwing[
  De weerstand van een geleider is $rho_"Cu" ell \/ S$, dus de foutstroom daalt naarmate de leiding langer wordt. Vanaf een bepaalde lengte spreekt de beveiliging niet meer op tijd aan. Met $S_"PE" = S_"fase"$ geeft dat een #keyterm[maximale kabellengte]:

  $ ell_"max" = (c dot U_f dot S_"fase") / (2 rho_"Cu" I_"fout") $

  #belangrijk[Deze formule staat op het formularium], zie @sec:formularium-examen.
]

=== TN-S <sec:net-tn-s>

#figure(
  image("assets/DEE_net_TN-S.png", width: 13cm),
  caption: [TN-S: dezelfde aarding als TN-C, maar PE en N lopen als aparte geleiders over het hele net.],
  label: <fig:net-tn-s>,
)

Elektrisch gedraagt TN-S zich als TN-C, met dezelfde foutstroom en dezelfde beveiliging. Het verschil is dat de PE geen bedrijfsstroom voert. Daardoor staat er geen spanningsval op de beschermingsgeleider, en kan je er wél een RCD in zetten: die kan het verschil tussen fase en N nu zinvol meten.

=== TN-C-S <sec:net-tn-c-s>

#figure(
  image("assets/DEE_net_TN-C-S.png", width: 14cm),
  caption: [TN-C-S: eerst één PEN-geleider, verderop gesplitst in PE en N. De twee kruisjes tonen wat niet mag: opnieuw samenvoegen achter het splitspunt.],
  label: <fig:net-tn-c-s>,
)

In de praktijk combineer je de twee: over het aanvoergedeelte één PEN-geleider, en vanaf een bepaald punt gesplitst in PE en N.

#belangrijk[Eenmaal gesplitst, mag je PE en N nooit meer samenvoegen.] Verbind je ze verderop weer, dan gaat er bedrijfsstroom over de beschermingsgeleider lopen en verliest die zijn functie.

=== IT <sec:net-it>

#figure(
  image("assets/DEE_net_IT.png", width: 13cm),
  caption: [IT: het sterpunt hangt niet rechtstreeks aan de aarde maar via een hoge impedantie $Z$. De massa's zijn wel lokaal geaard.],
  label: <fig:net-it>,
)

Het sterpunt is geïsoleerd of hangt via een hoge impedantie $Z$ aan de aarde. Bij een #strong[eerste] isolatiefout is de kring dus niet gesloten: er loopt nauwelijks stroom en er is geen gevaar.

Een #keyterm[isolatiewachter] meldt die fout, zodat je ze kan opzoeken en herstellen terwijl de installatie doordraait. #belangrijk[Die bedrijfscontinuïteit is de reden om voor IT te kiezen], en daarom vind je het in operatiekwartieren en continue processen.

#waarschuwing[
  Bij een #strong[tweede] fout op een andere fase valt dat voordeel weg: het net herleidt zich tot een TN- of TT-systeem, afhankelijk van hoe de massa's geaard zijn.
]

=== De drie vergeleken <sec:netstelsels-vergelijking>

#table(
  columns: (auto, 1fr, 1fr, 1fr),
  align: (left, left, left, left),
  stroke: none,
  inset: 5pt,
  table.hline(stroke: 1pt),
  table.header([], [*TT*], [*TN*], [*IT*]),
  table.hline(stroke: 0.5pt),
  [Aarding], [massa's en net apart geaard], [massa's via de nulgeleider aan het net], [massa's geaard, net via impedantie],
  [Foutstroom], [klein], [groot], [zeer klein],
  [Waar], [woningnet], [industrieel net], [waar 100 % beschikbaarheid moet],
  [Kostprijs], [$130 %$], [$100 %$], [$120 %$],
  [Beveiliging indirect contact], [RCD], [overstroombeveiliging, eventueel RCD], [overstroombeveiliging, eventueel RCD],
  [Blijft werken], [tot de 1e fout], [tot de 1e fout], [tot de 2e fout],
  [Vakbekwaam personeel], [niet nodig], [bij het ontwerp], [permanente bewaking],
  [Voorwaarde], [goede aarding nodig], [goede aarding nodig], [goed isolatieniveau nodig],
  table.hline(stroke: 1pt),
)

#examenbox[
  De tekenvraag is elk jaar dezelfde drie stappen: teken het net met bron, de vier of vijf geleiders, twee verbruikers en de aardingen; verklaar wat elke letter betekent; en zeg per gevaar welke beveiliging je gebruikt. Vergeet de tweede helft niet, want daar zitten de punten: #strong[overstroom] met zekering of automaat, #strong[schokken] met een RCD in TT, met de overstroombeveiliging in TN, en met een isolatiewachter in IT.
]
