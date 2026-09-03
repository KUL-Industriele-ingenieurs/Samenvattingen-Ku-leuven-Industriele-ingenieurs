#import "../../school-template.typ": *

= Main Circuits <ch:main-circuits>


Dit hoofdstuk gaat over kortsluitingen en veiligheid

== Kortsluit- en overbelastingsbeveiliging <sec:main-circuits-beveiliging>

#align(center)[_EN 60204:2016: Kortsluitstroom en Overbelastingsbeveiliging_]

=== Kortsluitstroom bepalen

De norm geeft aan dat de kortsluitstroom op drie manieren kan worden bepaald:
- Door het gebruik van standaard ontwerpregels
- Door kortsluitstroomberekeningen uit te voeren
- Door kortsluitingsproeven uit te voeren

=== Beginselen van kortsluitbeveiliging

Kortsluitbeveiliging beschermt eerst de #strong[bedrading]: is de prospectieve kortsluitstroom veel groter dan de nominale, dan raakt de bedrading beschadigd en kan er brand ontstaan. Daarom worden automaten en zekeringen beoordeeld op hun breekvermogen (AIC).

Voor de #strong[mens] helpt stroombegrenzing niet: $30 "mA" dot "s"$ kan al dodelijk zijn, terwijl industriële toestellen net hoge stromen nodig hebben. Bedrading en mens vragen dus elk hun eigen beveiliging.


+ *Residual Current Devices (RCD / Differentieelschakelaar)*

  Een RCD meet continu het verschil tussen de heengaande fasestroom en de terugkerende stroom via een ringkern-sommatietransformator.

  Vloeit er een lekstroom via een mens of de aarding weg ($Delta I > 30 "mA"$), dan verbreekt het ingebouwde relais binnen enkele milliseconden de voeding.

  #figure(
    image("assets/RDC.png", width: 15cm),
    caption: [Werking van een differentieelschakelaar (RCD) via een sommatietransformator.],
    label: <fig:RDC>,
  )

+ *Smeltzekeringen (Fuses)*

  Een smeltzekering biedt directe en snelle beveiliging tegen kortsluiting en zware overbelasting. Wanneer de stroomsterkte te hoog oploopt, smelt het interne draadelement door joule-opwarming en onderbreekt het de kring.

  _Eigenschap:_ Smeltzekeringen zijn goedkoop en hebben een zeer hoog breekvermogen (AIC), maar na aanspreken moeten ze handmatig vervangen worden voordat het circuit herstart kan worden.

+ *ECB (electronic circuit breaker)*

  Een ECB (Electronic Circuit Breaker) onderbreekt de stroom met elektronica in plaats van met een mechanisme. Je kan hem per toepassing instellen, hij reageert sneller dan een smeltzekering, en hij kan zijn toestand doorgeven aan de sturing.

+ *AFCI (arc fault circuit interrupter)*

  Een AFCI (arc fault circuit interrupter) detecteert een vlamboog waar dan ook in de kring en schakelt af. Vlambogen ontstaan door beschadigde bedrading, losse verbindingen of defecte apparaten, en geven brandgevaar.



=== Zekering, MCB en MCCB

Voor overstroombeveiliging zijn er drie families, met de codeletter `-F` volgens EN 81346-2.

#table(
  columns: (auto, 1fr, 1fr, 1fr),
  align: (left, left, left, left),
  stroke: none,
  inset: 6pt,
  table.hline(stroke: 1pt),
  table.header([], [*Smeltzekering*], [*MCB*], [*MCCB*]),
  table.hline(stroke: 0.5pt),
  [Voluit], [fuse], [Miniature Circuit Breaker], [Moulded Case Circuit Breaker],
  [Na uitschakelen], [vervangen], [herinschakelen], [herinschakelen],
  [Instelbaar], [nee, vast kaliber], [nee, vaste curve], [ja, thermisch instelbaar],
  [Stroombereik], [klein tot groot], [klein, tot ongeveer $125 "A"$], [groot, honderden A],
  [Toepassing], [aparte kringen, back-up], [verdeelkringen in de kast], [hoofdverdeling, grote vermogens],
  table.hline(stroke: 1pt),
)

#belangrijk[Het #keyterm[breekvermogen] of AIC (Amps Interrupting Capacity) is de tweede keuzeparameter, naast de nominale stroom]: de grootste kortsluitstroom die het toestel nog veilig kan onderbreken. Ligt de verwachte kortsluitstroom hoger, dan explodeert de beveiliging in plaats van te beveiligen. Dichter bij de transformator is die stroom groter, dus heb je daar een hogere AIC nodig.

#figure(
  image("assets/OIS_fuse_mcb_mccb_clean.png", width: 12cm),
  caption: [De drie vormen van kenletter $-F$ volgens EN 81346-2: links de smeltzekering in zijn houder, midden de MCB (Miniature Circuit Breaker), rechts de driepolige MCCB (Moulded Case Circuit Breaker).],
  label: <fig:fuse-mcb-mccb>,
)

== Overzicht van schakel- en beveiligingscomponenten <sec:overzicht-schakelcomponenten>

Overzicht van de voornaamste componenten in hoofd- en stuurkringen:

#table(
  columns: (auto, 1fr, 1.3fr, 1.3fr),
  align: (left, left, left, left),
  table.header([*Component*], [*Volledige naam*], [*Functie*], [*Waarom nodig?*]),

  [RCD],
  [Differentieelschakelaar (Residual Current Device)],
  [Beschermt personen tegen lekstromen naar aarde (elektrocutiebeveiliging).],
  [Voorkomt levensgevaar bij isolatiefouten of directe/indirecte aanraking ($30 "mA"$).],

  [MPCB / MBS],
  [Motorbeveiligingsschakelaar (Motor Protection Circuit Breaker)],
  [Beveiligt motoren tegen overbelasting, kortsluiting en fase-uitval.],
  [Volgt de thermische opwarming van de motorwikkelingen en schakelt kortsluitingen af.],

  [Contactor],
  [Elektromechanische vermogensschakelaar],
  [Schakelt de hoofdstroom naar de motor via een $24 "VDC"$ stuursignaal.],
  [Laat toe om grote stromen veilig, betrouwbaar en vanop afstand via de PLC te schakelen.],

  [Relais],
  [Hulpschakelaar / stuurrelais],
  [Schakelt stuursignalen en logica in laagspanningskringen.],
  [Signaalverwerking, potentiaalscheiding en versterking van PLC-uitgangen.],

  [Smeltzekering],
  [Smeltveiligheid (Fuse)],
  [Extreem snelle bescherming tegen zeer hoge kortsluitstromen.],
  [Beschermt leidingen en heeft een zeer hoog breekvermogen (AIC).],
)

De tabel scheidt *wie schakelt* (contactor, relais) van *wie beveiligt*, en bij die laatste ook *wat*: de RCD de mens, de MPCB de motor, de smeltzekering de bekabeling.

=== De vermogenscontactor in een motorkring

#wrap-figure(
  image("assets/Contactor-werking.png", width: 7.5cm),
  caption: [Werking van een contactor: bekrachtigde spoel trekt het anker aan tegen de veerkracht in.],
  label: <fig:Contactor-werking>,
)[
  Een vermogenscontactor schakelt de driefasige hoofdstroom naar de motor:
  - *Inschakelen*: Wanneer $24 "V"$ op de spoelaansluitingen (A1/A2) wordt gezet, wekt de stroom een magnetisch veld op in de gelamineerde weekijzeren kern. Zodra $F_"mag" > F_"veer"$, trekt het anker aan en sluiten de drie hoofdcontacten (1-2, 3-4, 5-6).
  - *Uitschakelen (Monostabiel)*: Zodra de stuurspanning wegvalt, duwt de terugstelveer het anker direct terug in ruststand.
]

#examenbox[
  *Monostabiel = fail-safe:* Bij stroomonderbreking of noodstop valt de contactor direct af. De motor kan nooit spontaan herstarten zonder een nieuw startcommando.
]

#wrap-figure(
  image("assets/contactor Nieuw vs oud.png", width: 6.5cm),
  caption: [Links een nieuw contact, rechts een versleten contact door vonkvorming bij inductieve uitschakeling.],
  label: <fig:contactor-Nieuw-vs-oud>,
)[
  Bij het onderbreken van een draaiende motor ontstaat een vlamboog tussen de contacten door de inductieve tegen-EMK. Dit veroorzaakt inbranden van het contactmateriaal (zilverlegering). Contactoren hebben daarom een mechanische levensduur van miljoenen cycli, maar een elektrische levensduur (onder volle belasting) die aanzienlijk lager ligt.
]

*AC-spoel en de spleetpool (shading ring):* Bij een AC-gevoede contactor daalt de flux tweemaal per periode naar nul ($100 "Hz"$ bij $50 "Hz"$). Zonder ingreep zakt de trekkracht onder de veerkracht en gaat het anker hevig klapperen. Een koperen kortsluitring, de #keyterm[spleetpool] (*shading ring*), verschuift een deel van de flux in tijd ($Delta phi$), zodat de resulterende aantrekkingskracht continu boven de veerkrachtlijn blijft (zie de detailgrafiek en afleiding in @fig:ac-contactor-spoelring op @sec:ac-contactoren).



== Driefasige asynchrone motoren <sec:3-phase-motors>

De driefasige asynchrone motor (inductiemotor of kooiankermotor) is hét werkpaard van de moderne industrie:
- *Waarom inductiemotoren?* Ze bevatten geen koolborstels of permanente magneten. Daardoor zijn ze goedkoop, uiterst robuust tegen trillingen en oververhitting, zelfstartend op het driefasenet en vergen ze minimaal onderhoud (enkel mechanische lagerslijtage).

=== Fysisch werkingsprincipe: het magnetisch draaiveld <sec:motor-werking>

#figure(
  image("assets/OIS_motor_draaiveld_3fasen.png", width: 11cm),
  caption: [Driefasig magnetisch draaiveld in de stator: de drie sinusstromen A, B en C wekken een resultante magnetische noord-zuid vector op die continu ronddraait in de ruimte.],
  label: <fig:motor-draaiveld>,
)

1. *Opwekking van het draaiveld*: De driefasige statorwikkelingen worden gevoed door een symmetrisch driefasensysteem ($3 times 400 "V"$, $50 "Hz"$). Doordat de fasen in de ruimte $120^compose$ verschoven liggen en in de tijd $120^compose$ naijlen, wekt de stator een roterend magnetisch veld op (#keyterm[draaiveld]) dat ronddraait met het *synchrone toerental* $n_s$:
   $ n_s = frac(120 dot f, p) = frac(60 dot f, p_"paren") quad ["rpm"] $
   (waarbij $f$ de netfrequentie is en $p$ het aantal polen; bij $50 "Hz"$ en $4$ polen is $n_s = 1500 "rpm"$).
2. *Inductie in de rotor*: De rotor bestaat uit kortgesloten koperen of aluminium staven (de "kooi"). Het ronddraaiende statorveld snijdt de stilstaande of trager draaiende rotorstaven, waardoor er volgens de inductiewet van Faraday een bronspanning $e$ in de rotor wordt opgewekt.
3. *Koppelontwikkeling*: Doordat de rotorkooi kortgesloten is, vloeien er zeer grote rotorstromen. Volgens de wet van Lenz wekken deze stromen een magnetisch tegenveld op dat de verandering tegenwerkt: de rotor wordt elektromagnetisch meegetrokken in de richting van het draaiveld $==>$ er ontstaat een mechanisch as-koppel $T$.
4. *De slip ($s$)*: De rotor kan nooit exact even snel draaien als het draaiveld ($n < n_s$). Zou $n = n_s$ zijn, dan snijden de veldlijnen de rotorstaven niet meer, valt de inductiespanning weg naar nul en verdwijnt elk koppel! Het relatieve snelheidsverschil heet de #keyterm[slip] $s$:
   $ s = frac(n_s - n, n_s) $
   - *Bij stilstand / start ($n = 0$)*: $s = 1$. De relatieve snelheid tussen veld en rotor is maximaal $==>$ maximale inductiespanning en zeer lage impedantie, waardoor de motor een enorme startstroom trekt ($6$ tot $10 I_n$!).
   - *In nominaal bedrijf*: $s approx #"0,02" - #"0,05"$ ($2 %$ tot $5 %$). De motor draait bij $n_s = 1500 "rpm"$ typisch op $n approx 1450 "rpm"$.
5. *Koppel-spanningsrelatie*: Het elektromagnetisch koppel $T$ schaalt *kwadratisch* met de effectieve klemspanning:
   $ T prop U^2 $
   Elke startmethode die de startstroom beperkt door de klemspanning te verlagen, verlaagt het koppel dus kwadratisch!

=== Motorefficiëntieklassen (IEC 60034-30-1) <sec:motor-efficiency>

#wrap-figure(
  image("assets/IE-klassen.png", width: 7.5cm),
  caption: [IE-efficiëntieklassen voor industriële elektromotoren.],
  label: <fig:IE-klassen>,
)[
  Omdat elektromotoren circa $45 %$ van het wereldwijde elektriciteitsverbruik vertegenwoordigen, legt de Europese Ecodesign-richtlijn strenge efficiëntieklassen op:
  - *IE1 (Standard Efficiency)*: Verouderd, in de EU niet meer toegelaten voor nieuwe installaties.
  - *IE2 (High Efficiency)*: Enkel nog toegestaan bij voeding via een frequentieregelaar (VFD).
  - *IE3 (Premium Efficiency)*: De huidige standaardminimumeis in de EU voor netgevoede motoren ($#"0,75" - 1000 "kW"$).
  - *IE4 (Super Premium Efficiency)*: Zeer hoog rendement (vaak synchrone reluctantiemotoren SynRM of permanentmagneetmotoren).
]

=== Aansturing in de vermogenskring: DOL vs. Omkeersturing (CW / CCW) <sec:cw-ccw>

In een industrieel elektrisch schema tekenen we altijd eerst de *vermogenskringen* (hoofdstroom) en pas daarna de *stuurkringen*. Voor het schakelen van de draairichting zijn er twee klassieke concepten:

#figure(
  image("assets/OIS_motor_hoofdcircuits_clean.png", width: 11cm),
  caption: [De twee hoofdcircuits uit de les: links traploze aansturing via VFD `-T1`, rechts omkeerschakeling met twee contactoren `-Q6` (CW) en `-Q7` (CCW).],
  label: <fig:motor-hoofdcircuits>,
)

1. *Enkelvoudige draairichting (Direct-On-Line start-stop)*:
   - Eén enkele driefasige contactor (`-Q1`) schakelt fasen L1, L2, L3 rechtstreeks door naar motorklemmen U1, V1, W1.
   - De motor draait in één vaste richting (standaard wijzerzin / CW).

2. *Omkeersturing (CW / CCW: Clockwise vs. Counter-Clockwise)*:
   - Om de asrichting van een asynchrone motor om te keren, moet het magnetisch draaiveld in de omgekeerde richting roteren.
   - *Fysische gouden regel*: #keyterm[Wissel twee willekeurige fasen om, en de draairichting keert om!]
   - *Uitvoering in het vermogenscircuit*: Twee parallelle contactoren:
     - Contactor `-Q6` (CW, wijzerzin): verbindt L1 met U1, L2 met V1, L3 met W1.
     - Contactor `-Q7` (CCW, tegenwijzerzin): verbindt L1 met W1, L2 met V1, L3 met U1 (*L1 en L3 zijn onderling gewisseld!*).

#waarschuwing[
  *Doodsluiting bij gelijktijdig inschakelen (Kortsluitgevaar!)* \
  Als `-Q6` en `-Q7` gelijktijdig zouden sluiten, verbindt `-Q6` fase L1 met klem U1, terwijl `-Q7` op diezelfde klem U1 fase L3 legt. Dit veroorzaakt een snoeiharde *fase-fase kortsluiting ($400 "V"$)* tussen L1 en L3!
  
  Daarom is een *dubbele vergrendeling (interlocking)* wettelijk en technisch strikt verplicht:
  - *Elektrische vergrendeling (stuurkring)*: In serie met de spoel van `-Q6` staat een N.C.-hulpcontact van `-Q7`. In serie met de spoel van `-Q7` staat een N.C.-hulpcontact van `-Q6`. Zodra de ene contactor bekrachtigd is, is de stuurkring van de andere fysiek onderbroken.
  - *Mechanische vergrendeling (vermogenskring)*: Een mechanisch wippertje tussen beide contactorbehuizingen blokkeert fysiek de beweging van het anker. Zelfs als iemand de contactor handmatig met een schroevendraaier forceert, kan het andere contactenblok nooit sluiten!
]

#figure(
  image("assets/OIS_omkeerschakeling_slide.png", width: 14.5cm),
  caption: [Volledig schema van de omkeerschakeling: links de stuurkring met startknoppen en kruislingse N.C.-vergrendeling; rechts het vermogenscircuit met gewisselde fasen over `-Q7`.],
  label: <fig:omkeerschakeling>,
)

=== Startmethodes voor kooiankermotoren <sec:motor-starten>

Omdat bij stilstand $s = 1$, trekt een kooiankermotor bij directe inschakeling een inschakelstroom van $6$ tot $10$ keer zijn nominale stroom ($I_"start" approx 6 - 10 I_n$). Dit veroorzaakt spanningsdippen op het fabrieksnet en zware mechanische schokken ($T prop U^2$) op tandwielen, riemen en koppelingen.

Er bestaan vier gestandaardiseerde startmethodes in de industrie:

+ *1. DOL (Direct-On-Line)*:
  De eenvoudigste methode: 1 contactor schakelt de motor rechtstreeks op volle netspanning.
  - *Voordeel*: Goedkoop, eenvoudig, vol aanloopkoppel ($100 %$).
  - *Nadeel*: Zeer hoge startstroom ($6 - 8 I_n$) en brute mechanische schok. Alleen toegelaten bij kleinere motoren of sterke voedingsnetten.

+ *2. Ster-driehoekstarter (Star-Delta $Y$-$Delta$)*:
  De motor start in *ster* ($Y$) en schakelt na enkele seconden via een timer om naar *driehoek* ($Delta$).
  - In ster staat over elke wikkeling de fasespanning $U_"fase" = U_"net" / sqrt(3)$ in plaats van $U_"net"$.
  - Daardoor dalen de startstroom én het startkoppel naar exact één derde ($33 %$):
    $ I_"ster" = 1/3 I_"driehoek", quad T_"ster" = 1/3 T_"driehoek" $
  - *Opbouw*: Vereist $3$ contactoren (hoofdcontactor, stercontactor, driehoekcontactor), een tijdrelais en een motor waarvan beide kanten van elke wikkeling naar de klemmenkast zijn uitgevoerd ($6$ aansluitklemmen: U1-V1-W1 en U2-V2-W2).
  - *Beperking*: Omdat ook het startkoppel met $67 %$ instort, kan deze methode enkel gebruikt worden voor belastingen die bij lage snelheid weinig tegenkoppel vragen (ventilatoren, centrifugaalpompen).

+ *3. Softstarter*:
  Bevat antiparallelle thyristors in elke fase die de sinusoïdale spanning aansnijden (faseaansnijding / phase-angle control). De klemspanning loopt over enkele seconden geleidelijk op van bv. $30 %$ naar $100 %$.
  - *Voordeel*: Traploze aanloop zonder mechanische schokken (geen waterslag in pompleidingen, geen slippende transportbanden).
  - *Let op*: De netfrequentie blijft vast op $50 "Hz"$. Omdat $T prop U^2$, daalt het startkoppel ook hier aanzienlijk bij lage spanning.

+ *4. Frequentieregelaar (VFD - Variable Frequency Drive)*:
  De meest geavanceerde oplossing: de drive stuurt de motor met een *variabele frequentie én variabele spanning* ($V/f = "constant"$).
  - *Cruciaal examenvoordeel*: #belangrijk[Alleen de VFD levert vol nominaal koppel bij een lage startstroom ($I_"start" approx #"0,5" - #"1,5" I_n$)!] Doordat de frequentie mee schaalt, blijft de slip klein en blijft de flux in de kern optimaal.
  - Maakt traploze snelheidsregeling, zacht stoppen, dynamisch remmen en softwarematige draairichtingomkering (CW/CCW zonder omkeercontactoren) mogelijk.

#table(
  columns: (auto, auto, auto, 1fr),
  inset: 7pt,
  align: horizon,
  stroke: none,
  fill: (x, y) => if y == 0 { gray.lighten(50%) },
  [*Methode*], [*Startstroom*], [*Startkoppel*], [*Typische toepassing*],
  [DOL], [$6$--$8 I_n$], [Vol ($100 %$)], [Kleine motoren ($< 5 "kW"$), lichte transportbanden],
  [Ster-driehoek], [$1\/3$ ($approx 2 - 3 I_n$)], [$1\/3$ ($33 %$)], [Pompen en ventilatoren die onbelast starten],
  [Softstarter], [Instelbaar ($2 - 4 I_n$)], [Verlaagd ($T prop U^2$)], [Pompstations (tegengaan waterslag), compressoren],
  [VFD], [Zeer laag ($#"0,5" - #"1,5" I_n$)], [Vol ($100 %$, ook bij 2 Hz)], [Kranen, liften, extruders, procesregelingen],
)

=== De interne architectuur van een VFD <sec:vfd-architectuur>

#figure(
  image("assets/VFD-schema.png", width: 100%),
  caption: [Interne architectuur van een VFD: gelijkrichter, DC-tussenkring en IGBT-inverterbrug.],
  label: <fig:VFD-schema>,
)

#waarschuwing[
  *Dit schema moet gekend zijn voor het examen!* Het toont exact hoe wisselspanning met vaste frequentie wordt omgezet naar een vrij instelbare frequentie en spanning.
]

De vermogensconversie verloopt strikt in drie opeenvolgende trappen van links naar rechts:
1. *AC input (L1, L2, L3)*: Het driefasige net met vaste spanning ($400 "V"$) en vaste frequentie ($50 "Hz"$).
2. *Gelijkrichter (Rectifier)*: Een zespuls diodegelijkrichter zet de 3-fasige wisselspanning om in een pulserende gelijkspanning (volgt de omhullende van de sinussen).
3. *DC-bus en smoorspoel (DC choke + DC bus)*: De smoorspoel (choke) dempt harmonische stroompieken; de zware condensatorbatterij vlakt de rimpelspanning af tot een stabiele, constante DC-tussenkringspanning ($U_"DC" approx sqrt(2) dot U_"lijn" approx 565 "V"$).
4. *Inverter (Wisselrichter)*: Zes snelle halfgeleiderschakelaars (IGBT's: Insulated-Gate Bipolar Transistors), twee per fase. Door de IGBT's met hoge frequentie ($2 - 16 "kHz"$) aan en uit te schakelen via #keyterm[PWM] (Pulse-Width Modulation), ontstaan blokvormige spanningspulsen met variabele breedte.
5. *Driefasige uitgang naar de motor*: Omdat de motorwikkelingen sterk inductief zijn, filtert de inductie van de motor de blokvormige spanningspulsen zelf uit tot een nagenoeg zuivere sinusvormige wisselstroom ("resulting sine wave").

=== EMI en de afscherming van de motorkabel <sec:vfd-emi>

Door het ultrasnelle schakelen van de IGBT's hebben de spanningspulsen extreem steile flanken (zeer korte stijgtijd $t_r$). Volgens de vuistregel voor spectrale inhoud:
$ f approx frac(#"0,35", t_r) $
bevatten deze flanken zeer hoge stoorfrequenties (tot tientallen megahertz). Bij deze frequenties werkt een gewone motorkabel als een zendantenne die elektromagnetische interferentie (EMI) uitstraalt naar naburige signaal- en datakabels.

*Verplichte installatievoorschriften voor VFD-motorkabels:*
1. *Afgeschermde kabel*: Gebruik altijd een symmetrische motorkabel met een gevlochten koperen afscherming (Faraday-kooi rond de vermogensaders).
2. *Ononderbroken scherm*: De kabel mag tussen drive en motor niet onderbroken worden door klemmenstroken; onderbrekingen doorbreken de afscherming.
3. *Aan beide uiteinden aarden*: #belangrijk[In tegenstelling tot analoge signaalkabels moet de afscherming van een VFD-motorkabel aan BEIDE kanten geaard worden!] Zowel in de stuurkast aan de aarderail als aan de motorklemmenkast via een EMC-wartel met $360^compose$-contact. Dit zorgt voor een impedantie-arm retourpad voor hoogfrequente zwerfstromen.

#figure(
  image("assets/OIS_vfd_kabel_afscherming_pigtail.png", width: 13cm),
  caption: [Aarding van de VFD-motorkabel: klembeugel of EMC-wartel met $360^compose$-contact (Goed) tegenover een getwist varkensstaartje / pigtail (Slecht: veroorzaakt hoge HF-impedantie en zware EMI-storing!).],
  label: <fig:vfd-pigtail>,
)

4. *Geen MPCB tussen VFD en motor*:
   #waarschuwing[
     Plaats *nooit* een thermische motorbeveiligingsschakelaar (MPCB/MBS) tussen de uitgang van een VFD en de motor! De VFD bewaakt zelf digitaal de motorstroom en motortemperatuur. Een mechanische MPCB zou door de PWM-schakelfrequenties vals trippen of de IGBT's vernielen door uitschakeling onder last. Vóór de VFD volstaat een gewone automaat (`-F5`).
   ]

=== Selectie van motorbeveiliging

Een motor trekt bij directe netinschakeling (DOL) een inschakelstroom van $6$ tot $8$ keer de nominale stroom ($I_"start" approx 6-8 I_n$). Een gewone distributie-automaat zou hierop direct magnetisch uitschakelen. Daarom gebruikt men aangepaste beveiligingen:
- *MPCB / MBS (`-Q`)*: Combineert een instelbaar thermisch element (bimetaal met motor-afkoelkarakteristiek) met een hoge magnetische drempel ($approx 12-14 I_n$) én fase-uitvalbeveiliging.
- *Thermisch overbelastingsrelais (OLR `-F`)*: Bevat enkel het thermische bimetaalelement. Het kan zelf geen vermogen onderbreken; bij overbelasting opent het een hulpcontact (95-96) dat de stuurstroom naar de contactorspoel verbreekt.
- *Bij een VFD*: De frequentieregelaar meet continu stroom en berekent het thermische motormodel digitaal; een aparte externe thermische beveiliging is dan niet nodig.

== Contactor versus SSR

Een #keyterm[SSR] (Solid State Relay) schakelt met halfgeleiders in plaats van met contacten. Leg je de stuurspanning aan de ingang, dan loopt er stroom door de interne optocoupler, en de uitgang daarvan bedient de schakelkring.

#belangrijk[Je kiest een SSR in plaats van een contactor zodra de schakelfrequentie hoog ligt.] Het typevoorbeeld uit de slides: een transistoruitgang van een PLC die een verwarmingselement stuurt met een variabele duty cycle. Bij een periode van $1$ seconde zijn dat al $100$ nuldoorgangen bij $50 "Hz"$ — dat overleeft geen enkel mechanisch contact.

De keerzijde:

- De halfgeleiders in een SSR produceren #strong[veel warmte]. Daarom heb je koelribben nodig.
- Een SSR voor AC schakelt vaak enkel #strong[bij de nuldoorgang] uit, om die warmteontwikkeling te beperken.
- Een SSR schakelt meestal maar één of drie fasen.

Een contactor daarentegen heeft nagenoeg geen spanningsval en geen warmteprobleem, maar zijn contacten slijten bij elke schakeling.

== Motorbescherming in detail <sec:motorbescherming-detail>

=== MPCB (Motor Protection Circuit Breaker)

De #keyterm[MPCB] (Motor Protection Circuit Breaker), in het Nederlands de #keyterm[MBS] (motorbeveiligingsschakelaar), krijgt volgens EN 81346-2 bij voorkeur de codeletter `-Q`, of `-QAB` en `-QAC` voor een elektronische uitvoering.

In een MPCB zitten #belangrijk[twee ontgrendelingen]:

+ een #strong[thermische] ontgrendeling met een bimetaal, die je moet instellen op de nominale motorstroom;
+ een #strong[elektromagnetische] ontgrendeling, die de kortsluitbeveiliging verzorgt.

Daaruit volgen de eigenschappen:

- MPCB = thermische #strong[én] magnetische beveiliging. Ze beschermt dus tegen overbelasting #strong[en] tegen kortsluitstromen.
- De thermische grens is instelbaar op $I_"nom"$; de magnetische grens ligt vast.
- Ze simuleert de warmteopbouw in de motor.
- De ruststand is #belangrijk[OFF]: je moet ze inschakelen.
- Ze heeft twee hulpcontacten: N.O. `13/14` opent bij een fout, N.C. `21/22` sluit bij een fout.

Sluit je een enkelfasige motor aan, dan moet je #strong[één fase twee keer] door de motorbeveiligingsschakelaar leiden, zodat de detectie klopt.

#figure(
  image("assets/OIS_MBS_foto_symbool.png", width: 10cm),
  caption: [De MPCB in het echt en als symbool: de draaiknop schakelt de drie hoofdcontacten, en de twee blokjes in het symbool zijn de thermische en de magnetische ontgrendeling.],
  label: <fig:mbs-symbool>,
)

#figure(
  image("assets/OIS_motorkring_mpcb_clean.png", width: 11cm),
  caption: [Motorsturing met noodstop en MPCB. De MPCB `-Q2` is altijd N.O., dus gebruik je het contact `13/14` in de stuurkring.],
  label: <fig:motorkring-mpcb>,
)

#belangrijk[Omdat de MPCB N.O. is, gebruik je `13/14` in de stuurkring.] Om te starten heb je de $24 "V SV"$ nodig én een druk op de startknop.

Een drive heeft meestal al een goede motorbeveiligingsfunctie ingebouwd. Dan hoef je geen MPCB of OLR toe te voegen, maar er moet wél een MCB stroomopwaarts staan.

=== Thermisch overbelastingsrelais (OLR)

Het #keyterm[thermisch overbelastingsrelais], OLR (Over Load Relay), in het Nederlands MBR (motorbeveiligingsrelais), werkt met een bimetaal dat opwarmt door de motorstroom. Zet dat bimetaal genoeg uit, dan kipt het mechanisme.

#belangrijk[Een OLR beveiligt alléén tegen overbelasting, niet tegen kortsluiting.] Daaruit volgt een harde regel:

#waarschuwing[
  Combineer een OLR #strong[altijd] met een kortsluitbeveiliging: smeltzekeringen of een magnetische beveiliging. De grenzen van de OLR bepalen mee het kaliber van die zekeringen.

  Kies je de zekeringen verkeerd, dan wordt de OLR bij een kortsluiting zelf vernield.
]

Verdere eigenschappen:

- instelbaar op $I_"nom"$ van de motor;
- twee hulpcontacten: N.C. `95/96` opent bij een fout, N.O. `97/98` sluit bij een fout;
- het N.O.-contact gebruik je om de fout te #strong[signaleren], het N.C.-contact om de #strong[contactor af te schakelen]. Zo'n N.C.-contact moet de spoel van de contactor rechtstreeks kunnen schakelen.
- De OLR onderbreekt zelf geen stroom. De eigenlijke onderbreker is de contactor.
- De kostprijs is nagenoeg onafhankelijk van de motorstroom. Daarom gebruik je hem vooral bij #strong[grote] motoren, waar het schakelmateriaal duur is.

#figure(
  image("assets/OIS_thermisch_relais_symbool.png", width: 9cm),
  caption: [Het OLR-symbool: drie hoofdcontacten `1/2`, `3/4`, `5/6` door de motorstroom, plus de twee hulpcontacten `95/96` (N.C.) en `97/98` (N.O.) rechts.],
  label: <fig:olr-symbool>,
)

=== OLR tegenover MPCB <sec:olr-vs-mpcb>

#belangrijk[Dit verschil is examenstof.]

- Een MPCB staat in rust op OFF en wordt #strong[ingeschakeld]. Ze is N.O., dus je gebruikt `13/14` in de stuurkring.
- Een OLR staat in rust op ON en wordt na een trip #strong[gereset], met de blauwe knop. Ze is N.C., dus je gebruikt `95/96` in de stuurkring.

#figure(
  image("assets/OIS_motorkring_olr_clean.png", width: 11cm),
  caption: [Motorsturing met noodstop en OLR. De OLR is altijd N.C., dus gebruik je `95/96` in de stuurkring.],
  label: <fig:motorkring-olr>,
)

Over de codeletter is de norm zelf niet consequent: volgens EN 81346-2 hoort een OLR `-B` (of `-BCB`) te krijgen, maar in de praktijk wordt bijna altijd `-F` gebruikt. De norm vermeldt het thermisch overbelastingsrelais namelijk óók onder `-FCC`.

=== Ingebouwde motorbescherming: thermistor (PTC)

*Het probleem.* Een motorwikkeling kan oververhitten #belangrijk[zonder dat de nominale stroom overschreden wordt]. Denk aan vuile ventilatiesleuven of een te hoge omgevingstemperatuur. Een OLR of MPCB meet stroom, dus die reageert dan niet.

*De oplossing.* Meet de temperatuur van de wikkeling rechtstreeks. Doe je dat, dan werkt de beveiliging voor #strong[elk] type motor, onafhankelijk van de stroom en van het aansluittype.

=== De PTC-thermistor <sec:ptc>

Thermistoren zijn kleine, niet-lineaire temperatuursensoren van metaaloxide of halfgeleidermateriaal. Je bouwt ze in de isolatie van de wikkeling in, zodat ze thermisch dicht bij de wikkeling zitten.

Het verband tussen weerstand en temperatuur is niet-lineair: rond het instelpunt verandert de weerstand #strong[sterk] bij een kleine temperatuurverandering. Bij een #keyterm[PTC] (Positive Temperature Coefficient) stijgt de weerstand met de temperatuur.

De sleutelparameter is de #keyterm[RRT] (Rated Response Temperature):

- onder de RRT is de weerstand laag en zo goed als constant;
- nadert en overschrijdt de temperatuur de RRT, dan schiet de weerstand steil omhoog.

#figure(
  image("assets/OIS_ptc_karakteristiek.png", width: 11cm),
  caption: [De door IEC vastgelegde weerstand-temperatuurgrenzen van een PTC. Rond de RRT stijgt de weerstand zeer steil.],
  label: <fig:ptc-karakteristiek>,
)

=== Het thermistorrelais (TPR) <sec:tpr>

Een #keyterm[TPR] (Thermistor Protection Relay) bewaakt die weerstand. Ziet het de steile sprong, dan bedient het een contact voor een alarm of een uitschakeling.

#belangrijk[Een TPR reageert ook op een open kring], in de kabel of in de sensor zelf. Dat maakt de beveiliging fail-safe. Moderne TPR's detecteren bovendien een kortsluiting in de sensor, wanneer de weerstand onder ongeveer $50 Omega$ zakt.

=== Voorwaarden en beperkingen <sec:ptc-beperkingen>

PTC's werken alleen goed als:

+ de RRT correct gekozen is voor de isolatieklasse van de wikkeling;
+ de thermistoren correct geplaatst zijn, dicht bij de thermisch kritische plaatsen;
+ de thermische weerstand tussen wikkeling en PTC laag is. Bij hoogspanningsmotoren is dat moeilijker, want daar moet de thermistor van hoge spanning geïsoleerd worden.

Je mag meerdere sensoren in serie zetten, zolang de totale weerstand bij omgevingstemperatuur onder $#"1,5" "k"Omega$ blijft. IEC beveelt maximaal #strong[zes] sensoren in serie aan.

#waarschuwing[
  De warmte moet eerst door het isolatiemedium naar de sensor. Daardoor is een PTC met TPR #belangrijk[te traag] voor kortsluitingen in motoren of transformatoren.

  Omdat de sensoren meestal in de #strong[stator] zitten, beschermen ze bovendien onvoldoende bij rotorkritische motoren, bij starten met hoge traagheid, of bij een geblokkeerde rotor.
]

=== Pt100 en Pt1000

Bij een PTC ligt de reactietemperatuur #strong[in de sensor] vast: de RRT bepaalt wanneer hij reageert. Bij een #keyterm[Pt100] of Pt1000 is dat anders.

#belangrijk[De reactietemperatuur van een Pt100 stel je vrij in op het uitschakeltoestel.] Je meet een echte temperatuurwaarde in plaats van één drempel te detecteren. Daardoor kan je elke gewenste temperatuur gebruiken voor:

- een voorwaarschuwing;
- een herstartblokkering;
- belastingsregeling.

=== Wat kost dat? <sec:pt100-kost>

De slides geven een concreet prijsvoorbeeld voor een SEW asynchrone motor IE3 van $#"1,5" "kW"$ (DRN90L4, isolatieklasse F, IP54):

#table(
  columns: (1fr, auto),
  align: (left, right),
  stroke: none,
  inset: 5pt,
  table.hline(stroke: 1pt),
  table.header([*Post*], [*Prijs*]),
  table.hline(stroke: 0.5pt),
  [Motor voor een industriële eindgebruiker], [$approx 400$ €],
  [Meerprijs PTC], [$85$ €],
  [Meerprijs Pt1000], [$85$ €],
  [Meerprijs incrementele encoder TTL/HTL], [$375$ €],
  table.hline(stroke: 1pt),
)

#belangrijk[PTC en Pt1000 kosten hier evenveel meer.] Bij gelijke prijs kies je dus de Pt1000, want die geeft je een echte meting in plaats van één vaste drempel. De encoder is een heel andere orde van grootte.

=== Functionele schema's <sec:functionele-schemas>

Een technieker vindt een fout niet altijd snel terug. Hij kan wel makkelijk de stroom meten tussen de PLC en de actuatoren, maar fouten bij de sensoren opsporen is lastiger. Een #keyterm[functioneel schema] lost dat op.

De werkwijze: zet #strong[per actuator] op één pagina alle componenten die bepalen of die actuator wel of niet actief wordt.

#belangrijk[Componenten mogen daarbij meerdere keren voorkomen.] Is één sensor verantwoordelijk voor het aansturen van tien motoren, dan staat die sensor ook op tien verschillende functionele tekeningen. Het schema is per actuator georganiseerd, niet per component.

Voor een motorkring betekent dat: de voeding, de MCB, de MPCB of OLR, de noodstopkring, de contactor en de PLC-uitgang staan samen op één blad, in de volgorde waarin ze de motor kunnen tegenhouden. Zo zie je in één oogopslag welke schakel de motor blokkeert.


// tweede deel van de les toevoegen
Het tweede deel van deze les (deck 4, slides 63-77 over de stuurkast) staat bij @ch:voorbeeld-diagram.

