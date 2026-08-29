#import "../../school-template.typ": *

= Main Circuits <ch:main-circuits>


Dit hoofdstuk gaat over kortsluitingen en veiligheid

== Kortsluitstroom en Overbelastingsbeveiliging

#align(center)[_EN 60204:2016: Kortsluitstroom en Overbelastingsbeveiliging_]

=== Bepalen van Kortsluitweerstand

De norm geeft aan dat de kortsluitstroom op drie manieren kan worden bepaald:
- Door het gebruik van standaard ontwerpregels
- Door kortsluitstroomberekeningen uit te voeren
- Door kortsluitingsproeven uit te voeren

=== Toepassing van IEC-Normen

Bij toepassing van IEC 61439-1 (norm voor laagspanningsverdeling) op elektrische installaties van machines volgens IEC 60204-1:
- IEC 60204-1 is de primaire norm die alle relevante aspecten van elektrische installaties in machines dekt
- IEC 60204-1 is over het algemeen voldoende en vereist niet noodzakelijk IEC 61439-1
- Voor bepaling van kortsluitweerstand kan IEC 61439-1 nog steeds als van toepassing zijnde norm worden geraadpleegd

=== Beveiliging van Frequentieomvormers

De bijgewerkte norm vereist dat frequentieomvormers zijn voorzien van een beveiligingsinrichting die automatisch de uitgaande stroomtoevoer onderbreekt wanneer een fout wordt gedetecteerd. Als een frequentieomvormer deze mogelijkheid niet bezit, moet de fabrikant in de gebruiksaanwijzing aangeven welke aanvullende veiligheidsmaatregelen de gebruiker moet treffen.

=== Beginselen van Kortsluitbeveiliging

Kortsluitbeveiliging speelt twee kritieke rollen in industriële installaties. Allereerst beschermt het de bedrading zelf: wanneer de prospectieve kortsluitstroom vele malen groter is dan de nominale stroom, kan de bedrading ernstig beschadigd raken en brand veroorzaken. Dit is waarom automaten en zekeringen worden beoordeeld op hun kortsluitingsbrekend vermogen (AIC) — het maximale vermogen dat zij veilig kunnen onderbreken zonder te falen.

Voor de veiligheid van mensen helpt stroombeperking meestal niet. Een kleine stroom door het lichaam kan al dodelijk zijn, ongeveer 30 mA·s. Industriële toestellen hebben voor hun normale werking net hoge stromen nodig, dus je kan niet zomaar alles begrenzen. Je moet daarom twee dingen apart beschermen: de bedrading en de mens.


+ *Residual Current Devices (RCD / Differentieelschakelaar)*

  #wrap-figure(
    image("assets/RDC.png", width: 9cm),
    caption: [Werking van een differentieelschakelaar (RCD) via een sommatietransformator.],
    label: <fig:RDC>,
  )[
    Een RCD meet continu het verschil tussen de heengaande fasestroom en de terugkerende stroom via een ringkern-sommatietransformator.

    Vloeit er een lekstroom via een mens of de aarding weg ($Delta I > 30 "mA"$), dan verbreekt het ingebouwde relais onmiddellijk binnen enkele milliseconden de voeding om dodelijke elektrocutie te voorkomen.
  ]

+ *Smeltzekeringen (Fuses)*

  Een smeltzekering biedt directe en snelle beveiliging tegen kortsluiting en zware overbelasting. Wanneer de stroomsterkte te hoog oploopt, smelt het interne draadelement door joule-opwarming en onderbreekt het de kring.
  
  _Eigenschap:_ Smeltzekeringen zijn goedkoop en hebben een zeer hoog breekvermogen (AIC), maar na aanspreken moeten ze handmatig vervangen worden voordat het circuit herstart kan worden.

+ *ECB (electronic circuit breaker)*

  Een ECB (Electronic Circuit Breaker) onderbreekt de stroom met elektronica in plaats van met een mechanisme. Je kan hem per toepassing instellen, hij reageert sneller dan een smeltzekering, en hij kan zijn toestand doorgeven aan de sturing.

+ *AFCI (arc fault circuit interrupter)*

  Een AFCI (arc fault circuit interrupter) gaat een vlamboog overal in het circuit detecteren. Een vlamboog kan ontstaan door beschadigde bedrading, losse verbindingen of defecte apparaten, en kan leiden tot brandgevaar. AFCI's zijn ontworpen om deze gevaarlijke situaties te voorkomen door de stroomtoevoer te onderbreken wanneer een vlamboog wordt gedetecteerd.



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

#belangrijk[Het #keyterm[breekvermogen] of AIC (Amps Interrupting Capacity) is de tweede keuzeparameter, naast de nominale stroom.] Dat is de grootste kortsluitstroom die het toestel nog veilig kan onderbreken. Ligt de te verwachten kortsluitstroom op die plaats hoger dan de AIC, dan explodeert de beveiliging in plaats van te beveiligen. Dichter bij de transformator is de kortsluitstroom groter, dus heb je daar een hogere AIC nodig.

#figure(
  image("assets/OIS_fuse_mcb_mccb_clean.png", width: 12cm),
  caption: [De drie vormen van kenletter $-F$ volgens EN 81346-2: links de smeltzekering in zijn houder, midden de MCB (Miniature Circuit Breaker), rechts de driepolige MCCB (Moulded Case Circuit Breaker).],
  label: <fig:fuse-mcb-mccb>,
)

== 3 Phase asycronous motors <sec:3-phase-motors>

=== Waarom Driefase Asynchrone Motoren

De driefase asynchrone motor is de meest gebruikte motor in industriële toepassingen. De voornaamste redenen zijn:

- *Kosteneffectief*: Geen permanente magneten nodig, dus veel goedkoper dan gelijkstroommotoren of synchrone motoren
- *Lage onderhoudskosten*: Slechts de lagers slijten, wat onvermijdelijk is in elk bewegend apparaat
- *Betrouwbaarheid*: gebouwd voor zware industriële omgevingen, met weinig storingen
- *Zelfstarter*: Start automatisch wanneer spanning wordt aangelegd
- *Brede beschikbaarheid*: Standaardproducten in alle vermogensklassen

=== Rotatie en Snelheidsregeling

*Veranderen van Rotatierichting:*
Om de rotatierichting te wijzigen (van rechtsom naar linksom of omgekeerd), kunnen we eenvoudigweg twee willekeurige van de drie faseleiders omwisselen. Dit stelt ons in staat om:
- Één contactor te gebruiken voor tegen-kloksgewijze rotatie (CCW)
- Een andere contactor te gebruiken voor kloksgewijze rotatie (CW)

*Veranderen van Rotatiefrequentie:*
Als we ook de rotatiesnelheid willen veranderen, hebben we een VFD (Variable Frequency Drive) nodig. Die kan:
- Verandering van de rotatierichting
- Nauwkeurige snelheidsregeling (door de frequentie aan te passen)
- Controle over het koppel
- Beveiligen en fouten diagnosticeren

=== Motorbeveiliging

Een motor trekt bij het starten een veelvoud van zijn nominale stroom. Een gewone automaat zou daarop afschakelen terwijl er niets mis is, dus heb je een beveiliging nodig die de #strong[warmteopbouw] volgt in plaats van de momentane stroom. Dat is de MPCB of de OLR, uitgewerkt in @sec:motorbescherming-detail.

Stuurt een VFD de motor, dan neemt de drive die taak over en heb je geen aparte motorbeveiliging nodig.

=== Het starten van een motor

De startmethodes (DOL, ster-driehoek, softstarter, VFD) en het schema van een VFD staan bij @sec:motor-starten in het hoofdstuk Veiligheid.

=== Drives, EMI en de aardverbinding

Zie @sec:vfd-emi in het hoofdstuk Veiligheid: waarom een VFD elektromagnetische storing (EMI) maakt, de rol van de afgeschermde motorkabel en de aarding op één punt.

=== Motorefficiëntieklassen (IEC 60034-30-1) <sec:motor-efficiency>

#wrap-figure(
  image("assets/IE-klassen.png", width: 6.5cm),
  caption: [IE-efficiëntieklassen voor industriële motoren],
  label: <fig:IE-klassen>,
)[
  Volgens de Europese richtlijn en de internationale norm IEC 60034-30-1 worden asynchrone laagspanningsmotoren ingedeeld in vier efficiëntieklassen:

  - *IE1 (Standard Efficiency)*: Oudere basisstandaard, nauwelijks nog toegestaan.
  - *IE2 (High Efficiency)*: Enkel nog toegelaten in combinatie met een VFD.
  - *IE3 (Premium Efficiency)*: De huidige standaardminimumeis in de EU ($0.75 "kW" - 1000 "kW"$).
  - *IE4 (Super Premium Efficiency)*: Zeer hoog rendement (bv. synchrone reluctantie- of geavanceerde inductiemotoren).
]

== Overzicht van schakel- en beveiligingscomponenten <sec:overzicht-schakelcomponenten>

Overzicht van de voornaamste componenten in hoofd- en stuurkringen:

#table(
  columns: (auto, 1fr, 1.3fr, 1.3fr),
  align: (left, left, left, left),
  table.header([*Component*], [*Volledige naam*], [*Functie*], [*Waarom nodig?*]),

  [RCD],
  [Differentieelschakelaar (Residual Current Device)],
  [Beschermt personen tegen lekstromen naar aarde (elektrocutiebeveiliging).],
  [Voorkomt levensgevaar bij isolatiefouten of aanraking van defecte toestellen.],

  [MBS / MPCB],
  [Motorbeveiligingsschakelaar (Motor Protection Circuit Breaker)],
  [Beveiligt motoren tegen overbelasting, kortsluiting en fase-uitval.],
  [Beschermt de motorwikkelingen tegen thermische oververhitting en schakelt kortsluitingen af.],

  [Contactor],
  [Elektromechanische vermogensschakelaar],
  [Schakelt de hoofdstroom naar de motor via een laagspanningsstuursignaal.],
  [Laat toe om grote stromen veilig en vanop afstand (bv. via PLC) te schakelen.],

  [Relais],
  [Hulpschakelaar / stuurrelais],
  [Schakelt stuursignalen en logica in laagspanningskringen.],
  [Signaalverwerking, potentiaalscheiding en versterking van PLC-uitgangen.],

  [Smeltzekering],
  [Smeltveiligheid (Fuse)],
  [Extreem snelle bescherming tegen zeer hoge kortsluitstromen.],
  [Beschermt leidingen en heeft een zeer hoog breekvermogen (AIC).],
)

Let op het onderscheid dat deze tabel maakt: *wie schakelt* (contactor, relais) tegenover *wie beveiligt* (RCD, MBS, smeltzekering), en bij de beveiligers *wat* er beschermd wordt --- de RCD beschermt de mens, de MBS de motor, de smeltzekering de bekabeling.

== Contactors

#wrap-figure(
  image("assets/contactor Nieuw vs oud.png", width: 6.5cm),
  caption: [Moderne compacte contactor vs. klassieke uitvoering],
  label: <fig:contactor-Nieuw-vs-oud>,
)[
  De volledige uitleg over contactoren staat bij de besturingslogica: polen en throws, hoofd- en hulpcontacten, de losse spanningswaarden van spoel en contacten, en het gedrag op AC vind je in @sec:contactoren. Hier kijken we naar wat er specifiek bij een *motorkring* komt kijken.
]

=== Werking van een vermogenscontactor

#wrap-figure(
  image("assets/Contactor-werking.png", width: 7.5cm),
  caption: [Werking van een contactor: bekrachtigde spoel trekt het anker aan],
  label: <fig:Contactor-werking>,
)[
De krachtketen van stroom naar aantrekkende armatuur is afgeleid in @sec:krachtketen. Kort samengevat voor een vermogenscontactor:
  - *Inschakelen*: Wanneer stuurspanning op de spoelaansluitingen (A1/A2) wordt gezet, wekt de stroom een magnetisch veld op in de gelamineerde weekijzeren kern. Zodra $F_"mag" > F_"veer"$, trekt het anker aan en sluiten de hoofdcontacten (1-2, 3-4, 5-6).
  - *Uitschakelen (Monostabiel)*: Valt de stuurspanning weg, dan duwt de terugstelveer het anker direct terug.
]

#examenbox[
  *Monostabiel = fail-safe:* Bij een stroomonderbreking valt de contactor direct af. De motor kan nooit spontaan herstarten zonder nieuw startcommando.
]


== AC-contacts

Wervelstromen in de kern (opgelost met laminatie) en het brommen van een AC-contactor (opgelost met een kortsluitring) zijn behandeld in @sec:ac-contactoren.


== Start-stop async motors

#belangrijk[In een elektrisch schema teken je altijd eerst de vermogenkringen, en pas daarna de stuurkringen.]

Er zijn twee manieren om een asynchrone motor aan te sturen:

- *Met een VFD* (`-T1`), beveiligd door een MCB (`-F5`). De afscherming van de motorkabel sluit je #strong[aan beide uiteinden] aan op de beschermingsaarde.
- *Met twee contactoren* (`-Q4` en `-Q5`) voor rechtsom en linksom. Die motor beveilig je met een MPCB (`-Q2`). De motorkabel wordt onderbroken door klemmenstrook `-X3`.

De stuurkringen voor de VFD en voor de contactoren teken je #strong[niet] in het vermogendeel van het schema.

#figure(
  image("assets/OIS_motor_hoofdcircuits_clean.png", width: 11cm),
  caption: [De twee hoofdcircuits voor een asynchrone motor: links via een VFD, rechts via twee contactoren voor CW en CCW.],
  label: <fig:motor-hoofdcircuits>,
)

=== Draairichting omkeren <sec:cw-ccw>

CW staat voor clockwise, CCW voor counter-clockwise. #belangrijk[De motor draait CW als je de fasen in de volgorde L1, L2, L3 aansluit op respectievelijk U1, V1, W1.] Wissel je twee fasen om, dan draait hij de andere kant op.

Dat is precies wat de tweede contactor doet: hij sluit dezelfde motor aan met twee verwisselde fasen. Beide contactoren mogen daarom #strong[nooit] tegelijk aantrekken, want dan sluit je twee fasen rechtstreeks kort. Zie de cross-protect uit @sec:cross-protect: één actieve contactor blokkeert de andere, zowel in de bedrading als in de software.

#figure(
  image("assets/OIS_motor_omkeerschakeling.png", width: 10cm),
  caption: [Omkeerschakeling: `-Q4` sluit L1-L2-L3 aan op U1-V1-W1, `-Q5` verwisselt twee fasen. De kruisverbinding tussen beide contactoren is meteen de reden dat ze nooit samen mogen sluiten.],
  label: <fig:omkeerschakeling>,
)

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

Je mag meerdere sensoren in serie zetten, zolang de totale weerstand bij omgevingstemperatuur onder $1,5 "k"Omega$ blijft. IEC beveelt maximaal #strong[zes] sensoren in serie aan.

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

De slides geven een concreet prijsvoorbeeld voor een SEW asynchrone motor IE3 van $1,5 "kW"$ (DRN90L4, isolatieklasse F, IP54):

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

#belangrijk[Componenten mogen daarbij meerdere keren voorkomen.] Is één sensor verantwoordelijk voor het aansturen van tien motoren, dan staat die sensor ook op tien verschillende functionele tekeningen. Dat is geen fout: het schema is per actuator georganiseerd, niet per component.

Voor een motorkring betekent dat: de voeding, de MCB, de MPCB of OLR, de noodstopkring, de contactor en de PLC-uitgang staan samen op één blad, in de volgorde waarin ze de motor kunnen tegenhouden. Zo zie je in één oogopslag welke schakel de motor blokkeert.


// tweede deel van de les toevoegen
Het tweede deel van deze les (deck 4, slides 63-77 over de stuurkast) staat bij @ch:voorbeeld-diagram.

