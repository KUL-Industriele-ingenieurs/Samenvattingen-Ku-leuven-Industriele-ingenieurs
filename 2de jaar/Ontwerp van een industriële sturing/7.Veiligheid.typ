#import "../../school-template.typ": *

= Veiligheid <ch:veiligheid>


Veiligheid is geen los hoofdstukje achteraan het ontwerp. #belangrijk[Hangt de veiligheid van een machine af van het juist functioneren van een besturing, dan heet dat #keyterm[functionele veiligheid].] Dat legt bijzondere eisen op aan de beschikbaarheid van die veiligheidsfunctie: ze moet werken, ook als er iets stukgaat.

== Het starten van een motor <sec:motor-starten>

Het probleem bij het starten is dat een stilstaande motor slip $s = 1$ heeft: de rotor staat stil ten opzichte van het draaiveld, de geïnduceerde rotorspanning is maximaal en de rotorimpedantie laag. Daardoor trekt de motor bij het aanzetten veel meer stroom dan nominaal. De vier startmethodes verschillen enkel in *hoeveel spanning je de motor geeft en wanneer*. Dat bepaalt meteen twee dingen tegelijk: de inschakelstroom en het aanloopkoppel.

$ T prop U^2 $

met:
- $T$ --- koppel van de asynchrone motor [N·m]
- $U$ --- spanning over één wikkeling [V]

Elke methode die de startstroom beperkt door de spanning te verlagen, verlaagt dus het koppel *kwadratisch*. Dat is de rode draad van deze sectie.

+ *DOL (Direct-On-Line)*

  De motor hangt rechtstreeks aan het net en krijgt meteen volle spanning. Goedkoop, maar de inschakelstroom loopt tot $6$ à $8 I_n$. Dat geeft een spanningsdip op het net en een schokkoppel op koppelingen en tandwielen.

+ *Ster-driehoek (star-delta)*

  De motor start in *ster* en schakelt daarna automatisch over naar *driehoek*. In ster staat over elke wikkeling $U_"net" \/ sqrt(3)$ in plaats van $U_"net"$, dus stroom en koppel vallen beide op één derde terug:

  $ I_"ster" = 1/3 I_"driehoek", quad T_"ster" = 1/3 T_"driehoek" $

  Dit kan dus alleen bij motoren die tijdens het opstarten niet veel koppel vragen --- een belasting die bij lage snelheid al zwaar trekt, komt in ster nooit op toeren.

+ *Softstarter*

  Thyristors ontsteken per halve periode later of vroeger, en bouwen zo de spanning geleidelijk op. Dat beperkt startstroom én startkoppel, dus de opstart verloopt zonder schok en de mechanica gaat langer mee. #belangrijk[De frequentie blijft wel die van het net.]

+ *VFD (Variable Frequency Drive)*

  Een VFD regelt de spanning #strong[én] de frequentie. Dat is het verschil met een softstarter: de synchrone snelheid $n_s = 120 f \/ p$ schaalt mee, dus de slip blijft klein en de motor houdt vol koppel bij lage snelheid. Duurder, maar je krijgt er snelheidsregeling en energiebesparing bij.

De netbeheerder kan het aan dat het grootste deel van de motoren in de industrie DOL start, maar je wordt hier wel voor beboet.

#table(
  columns: (auto, auto, auto, 1fr),
  inset: 7pt,
  align: horizon,
  stroke: none,
  fill: (x, y) => if y == 0 { gray.lighten(50%) },
  [*Methode*], [*Startstroom*], [*Startkoppel*], [*Wanneer*],
  [DOL], [$6$--$8 I_n$], [vol], [kleine motoren, net dat de dip aankan],
  [Ster-driehoek], [$1\/3$], [$1\/3$], [belasting die bij lage snelheid weinig koppel vraagt],
  [Softstarter], [regelbaar], [verlaagd], [mechanisch zachte start, netfrequentie blijft vast],
  [VFD], [klein], [vol, ook traag], [snelheidsregeling nodig, of vol koppel bij lage snelheid],
)

#belangrijk[Alleen de VFD houdt vol koppel bij een lage startstroom.] De andere drie verlagen de spanning, en $T prop U^2$ betekent dat het koppel dan altijd mee zakt. De VFD verlaagt de *frequentie* mee, zodat de slip klein blijft.

=== Het schema van een VFD

#figure(
  image("assets/VFD-schema.png", width: 100%),
  caption: [Schema van een VFD (Variable Frequency Drive): gelijkrichter, DC-bus en inverter],
  label: <fig:VFD-schema>,
)

#waarschuwing[
  Deze tekening moet gekend zijn. Ze vertelt namelijk hoe we deze component gaan schakelen.
]

Lees @fig:VFD-schema van links naar rechts; de logica is dat je van een net met *vaste* frequentie naar een uitgang met *vrij instelbare* frequentie wil, en dat lukt alleen door er eerst DC van te maken.

+ / AC input (L1, L2, L3): het driefasige net, vaste 50 Hz.

+ / Rectifier (gelijkrichter): een zespulsbrug van dioden zet de drie fasen om in een pulserende DC-spanning. De brug geleidt telkens via de hoogste en de laagste fase, dus de uitgang volgt de omhullende van de drie sinussen --- dat is de golvende lijn onderaan links in de figuur.

+ / DC choke + DC bus: de spoel (choke) beperkt stroompieken en harmonischen, de condensatoren vlakken de rimpel af tot een zo constant mogelijke DC-busspanning. Die bus is het energiebuffer waaruit de inverter put.

+ / Inverter: zes IGBT's (Insulated-Gate Bipolar Transistor), twee per uitgangsfase (T1, T2, T3). Door ze snel te schakelen wordt elke uitgangsklem afwisselend op de plus of de min van de DC-bus gelegd.

+ / Three-phase output: de uitgangsspanning bestaat dus uit *blokvormige spanningspulsen*, niet uit een sinus. Door de pulsbreedte te moduleren (PWM, Pulse-Width Modulation) is de *gemiddelde* waarde per periode wel sinusvormig, en omdat de motorwikkeling inductief is, filtert de motor zelf die pulsen uit tot een nagenoeg sinusvormige stroom. Dat is de "resulting sine wave" in de figuur.

#concept(title: "Waarom eerst gelijkrichten?")[
  Je kan de netfrequentie niet rechtstreeks veranderen. Door eerst alles naar DC te brengen, gooi je de netfrequentie weg; de inverter bepaalt daarna volledig zelf hoe snel hij schakelt, en dus zowel de frequentie als de amplitude van de uitgang. Vandaar de vaste volgorde: gelijkrichter $arrow.r$ DC-bus $arrow.r$ inverter.
]

Je moet de tekeningen *horizontaal* lezen: ze tonen wanneer wat gebeurt. Eerst komen de drie fasen binnen via de gelijkrichterbrug, gevolgd door de choke. Daarna hakken de IGBT's het signaal in stukken. De condensator kan die snelle spanningsveranderingen niet volgen en houdt de busspanning dus min of meer constant --- dat is net zijn functie: afvlakken.

=== EMI en de aardverbinding <sec:vfd-emi>

Het probleem zit in de *steile flanken* van die geschakelde spanning. Een snelle flank bevat hoge frequenties,

$ f approx (0.35) / t_r $

met:
- $f$ --- bovengrensfrequentie van de spectrale inhoud [Hz]
- $t_r$ --- stijgtijd van de spanningsflank [s]

Bij zulke frequenties gedragen de motorkabels zich als antennes en stralen ze elektromagnetische golven uit (EMI, Electro-Magnetic Interference). Dat willen we niet: naburige kabels en signaaldraden pikken die straling op en nemen de storing over.

De maatregelen volgen daaruit, in deze volgorde:

+ *Afgeschermde kabel*: de motorkabel krijgt een gevlochten scherm rond de aders, dat werkt als een kooi van Faraday. Het scherm hangt aan de aarde, zodat de opgevangen storing naar aarde wegvloeit in plaats van naar buiten te stralen.

+ *Scherm niet onderbreken*: een kooi van Faraday werkt alleen als hij gesloten is. Onderbreek je de afscherming, dan straalt de kabel op die plaats alsnog. Daarom vermijd je klemmen in het traject van een afgeschermde kabel.

+ *Aan beide kanten aarden*: bij de motorkabel van een VFD hang je het scherm aan #strong[allebei] de uiteinden aan de aarde, zodat het scherm overal op aardpotentiaal blijft en de hoogfrequente stoorstroom een korte weg terug naar de drive heeft. Dat is het omgekeerde van een analoge signaalkabel, die je aan #strong[één] kant aardt om een aardlus te vermijden. Zie @sec:afscherming.

+ *Geen aardlussen tussen drives*: staan er meerdere VFD's in dezelfde kast, aard ze dan allemaal rechtstreeks op #strong[dezelfde] aardklem. Aard je ze in ketting, dan vormt de lus die zo ontstaat zelf een antenne.

#waarschuwing[
  Bij een VFD is *geen motorbeveiligingsschakelaar* nodig, wel een gewone automaat. De drive bewaakt zelf de motorstroom en de thermische belasting; een MPCB ervoor zou op de geschakelde stroomvorm reageren en ongewenst afschakelen.
]

== Lock-out Tag-out (LoTo)

Voor onderhoud volstaat het niet om een machine "uit" te zetten. Iemand anders kan hem weer inschakelen terwijl jij met je handen in de machine zit. Daarom vergrendel je hem #strong[fysiek]. Dat heet #keyterm[LoToTo]: Lock-out, Tag-out, Try-out.

De procedure, in volgorde:

+ Alle energiebronnen en bedieningselementen inventariseren, en instructies vastleggen voor hun isolatie.
+ Alle betrokkenen informeren over de nodige lock-out.
+ De operationele werkzaamheden aan de installatie laten staken.
+ Bepalen welke acties vanuit de centrale bedieningsruimte nodig zijn voor de lock-out.
+ De installatie stoppen volgens de normale procedure.
+ Op de energiecontrolepunten de energietoevoer #strong[isoleren]. Dus niet alleen de stroomtoevoer uitschakelen, maar ook leidingen legen en spoelen, steekflenzen plaatsen, enzovoort.
+ Alle #strong[resterende] energie laten wegvloeien: reststroom, restdruk, en zo verder.
+ *Lock-out en tag-out:* alle controlepunten vergrendelen in de uit-stand en ze markeren.
+ #belangrijk[Elke LoTo-geautoriseerde plaatst een eigen slot en een eigen label] met de vereiste gegevens erop.
+ *Try-out:* alle medewerkers veilig stellen en de installatie test-starten om te controleren dat ze inderdaad niet opstart.
+ De geplande werken aan de machine uitvoeren.
+ Nadien alle betrokkenen verwittigen van de geplande heropstart.
+ Elke LoTo-geautoriseerde verwijdert zijn #strong[eigen] slot en label en ruimt zijn gereedschap op.
+ Alle schakelaars, kleppen en bedieningen terug in de operationele stand plaatsen, en dan pas herstarten volgens de normale procedure.

De drie delen uit elkaar gehouden:
- *Lock-out:* het fysieke slot dat verhindert dat de scheider weer ingeschakeld wordt.
- *Tag-out:* het label dat zegt wie de vergrendeling plaatste en waarom.
- *Try-out:* de proef die aantoont dat de vergrendeling ook echt werkt.

#belangrijk[Dat elke persoon zijn eigen slot plaatst is de kern.] Zolang er één slot hangt, kan de machine niet starten. Zo kan niemand de vergrendeling van een collega opheffen.

== Pictogrammen en veiligheidsstop

#wrap-figure(
  image("assets/OIS_pictogram_noodstop.png", width: 2.8cm),
  caption: [Pictogram voor de veiligheidsstop volgens ISO 7010.],
  label: <fig:pictogram-noodstop>,
)[
  #keyterm[ISO 7010] is de internationale norm voor veiligheidssymbolen. In 2011 registreerde ISO een nieuw symbool om de #strong[locatie] van noodstopknoppen aan te duiden, in het formaat "groen vierkant met wit symbool". Dat is het formaat voor bordjes die de plaats van veiligheidsuitrusting aangeven, dus dezelfde familie als brancards, oogdouches, nooddouches en nooduitgangen.
]

== EN 13849 en SRP/CS

=== Wat de norm regelt <sec:en13849>

#keyterm[EN 13849] gaat over functionele veiligheid: de eisen aan de beschikbaarheid van de veiligheidsfunctie wanneer die van een besturing afhangt.

#wrap-figure(
  image("assets/OIS_srpcs_clean.png", width: 10cm),
  caption: [De SRP/CS-keten: trigger event, logica en actuatoren.],
  label: <fig:srpcs>,
)[
  De onderdelen van de besturing die de veiligheidsfunctie uitvoeren heten samen de #keyterm[SRP/CS] (Safety-Related Parts of a Control System). Die keten loopt altijd van links naar rechts:

  $ "trigger event" arrow.r "logica" arrow.r "actuatoren" $

  Dus: de noodstopknop of het lichtgordijn, dan het noodstoprelais of de safety-PLC, en dan de contactoren of de STO-ingang van de drive. #belangrijk[Elk van die drie schakels hoort bij de SRP/CS], en elk van de drie kan de veiligheidsfunctie onderuithalen.
]

=== Het voorbeeldschema <sec:veiligheid-voorbeeldschema>

Het schema uit @ch:voorbeeld-diagram is bewust eenvoudig gehouden. De slides zetten er zelf de beperkingen bij:
- het is categorie 1 (B);
- er is maar #strong[één] veiligheidsfunctie. Normaal zijn er meer: noodstop, safe limited speed, enzovoort;
- er is maar #strong[één] trigger event. Normaal zijn er meer: lidar, lichtgordijnen;
- het is #strong[éénkanaals], en dus kwetsbaar voor een single point of failure.

#figure(
  image("assets/OIS_noodstop_hoofdcircuit_clean.png", width: 12cm),
  caption: [Het eenkanaals voorbeeldschema: links het hoofdcircuit met de contactor in de motorleiding, rechts de stuurkring met de noodstop `-S5` en de start `-S6`. Eén contact, één contactor: valt er iets vast, dan stopt de motor niet meer.],
  label: <fig:noodstop-voorbeeldschema>,
)

== Dual channel en EDM

=== Waarom twee kanalen <sec:dual-channel-waarom>

Componenten gaan stuk. Erger nog: ze kunnen #strong[foutief] falen, zodat hun veiligheidsfunctie niet meer werkt. Een contactor die na veel schakelen blijft plakken, bijvoorbeeld.

#belangrijk[Het hoofddoel van een dubbelkanaalsarchitectuur is het vermijden van een #keyterm[SPoF] (Single Point of Failure).] Daarom is elke component redundant:
- *Trigger events:* elke noodstopknop schakelt #strong[twee] N.C.-contacten. Een dubbelkanaals lichtgordijn schakelt eveneens twee uitgangen.
- *Uitgangstoestellen:* elke motor wordt door #strong[twee] contactoren afgeschakeld.

Maar wat als eerst het ene contact faalt en later het andere? Daarom worden de contacten met #keyterm[cross-monitoring] aangesloten. Beschrijven de twee kanalen niet dezelfde situatie, dan gaat het systeem naar de veilige toestand. #belangrijk[Ook na een reset herhaalt dat zich, tot het defecte contact vervangen is.]

Dubbelkanaals doe je #strong[altijd] met een speciaal noodstoprelais, of met een safety-PLC. De complexiteit en de valideerbaarheid laten niets anders toe.

=== Categorie 3 <sec:categorie3>

#wrap-figure(
  image("assets/OIS_categorie4_clean.png", width: 9cm),
  caption: [Categorie 3: redundante signaalpaden met cross-monitoring van de ingangen en terugkoppeling van de uitgangen.],
  label: <fig:categorie3>,
)[
  De aangewezen architectuur voor categorie 3 heeft:
  + redundante signaalpaden;
  + #strong[cross-monitoring] van de ingangssignalen;
  + een #strong[back-check]: de terugkoppeling van de uitgangen wordt vergeleken met de aangestuurde toestand.
]

=== External Device Monitoring <sec:edm>

#wrap-figure(
  image("assets/OIS_edm_clean.png", width: 8.5cm),
  caption: [EDM: de terugkoppeling van de contactoren zit in de resetvoorwaarde van het noodstoprelais.],
  label: <fig:edm>,
)[
  #keyterm[EDM] (External Device Monitoring) controleert of de externe toestellen die het veiligheidsmodule aanstuurt, bijvoorbeeld de contactoren, de veiligheidskring #strong[effectief] hebben onderbroken.

  Je implementeert dat door de terugkoppeling van die contactoren aan de #strong[resetvoorwaarde] van het noodstoprelais toe te voegen. De resetkring verhindert dan een reset zolang een gerelateerde component niet is afgevallen, bijvoorbeeld `-Q1` of `-Q2`.
]

#concept(title: "Force-guided contacts")[
  Om die redundantie echt te garanderen kies je bovendien voor #keyterm[force-guided contacts] (mechanisch gedwongen contacten). Daarbij is het mechanisch onmogelijk dat het N.O.-hoofdcontact en het N.C.-hulpcontact tegelijk gesloten zijn. Plakt het hoofdcontact, dan kán het hulpcontact niet sluiten, en dus blokkeert de reset.
]

=== Wat je nooit mag schakelen <sec:dual-channel-0v>

In gewone logica schakel je nooit de $0 "V"$. #belangrijk[Bij een dubbelkanaalsoplossing is dat soms toch de enige manier], namelijk om te vermijden dat een losgekomen $24 "V"$-draad die tegen een klem komt, de noodstop buiten werking stelt.

Bij een bistabiel ventiel is het doel dat het #strong[geen nieuwe beweging] start. Kan je uitsluiten dat de faalvormen van het ventiel zelf tot een onbedoelde beweging leiden, dan mag je het ventiel zonder voeding (afhankelijk van de gebruikte norm) buiten beschouwing laten.

=== Vertraagd noodstopcontact <sec:vertraagd-estop>

#examenbox[Dit was een klassieke examenvraag in 2024-2025.]

#wrap-figure(
  image("assets/OIS_vertraagd_estop_contact.png", width: 7.5cm),
  caption: [Vertraagd noodstopcontact: één kleinere, later afvallende contactor geeft redundantie voor een hele reeks contactoren.],
  label: <fig:vertraagd-estop>,
)[
  Een #keyterm[off-delay] noodstopcontact is nuttig wanneer je redundantie nodig hebt voor véél of zeer krachtige contactoren.

  De redenering uit de slides: heb je $30$ motoren met elk een contactor van $30 "A"$, dan zou een centrale redundante contactor vóór de hele groep $900 "A"$ moeten kunnen schakelen. Dat is onbetaalbaar groot en duur.

  #belangrijk[Eén redundante contactor van bijvoorbeeld $60 "A"$ volstaat, mits deze een fractie #strong[later] afschakelt dan de individuele contactoren.] Omdat de individuele contactoren al geopend zijn, schakelt de vertraagde centrale contactor stroomloos af, tenzij één individuele contactor vastbakt (in welk geval hij enkel de stroom van díe ene motor onderbreekt).
]

=== STO op een drive <sec:sto-ingang>

De #keyterm[STO]-ingangen (Safe Torque Off) schakelen het vermogendeel van een VFD op een betrouwbare en redundante manier uit. Die ingangen kunnen gevoed worden vanuit de stuurkast, of vanuit de drive zelf.

#waarschuwing[
  De slides tonen expliciet dat je online veel foute schema's vindt. Twee voorbeelden:

  - contacten die als N.C. getekend staan terwijl ze #strong[N.O.] horen te zijn, ook al zullen ze meestal gesloten zijn;
  - schema's waarin de reset maar #strong[één] bewuste handeling vraagt in plaats van twee;
  - een contactor die als `K` benoemd wordt in plaats van `-Q`.
]

=== De tussenvorm: ½ channel <sec:half-channel>

Tussen éénkanaals en tweekanaals zit nog een niveau. Bij een #keyterm[½-channel] beveiliging schakelt er maar #strong[één] kanaal, maar dat ene kanaal wordt wél bewaakt: je gebruikt bijvoorbeeld één relais om het veiligheidssignaal te onderbreken, en controleert met feedbackcontacten of een veiligheidsrelais of dat relais nog correct werkt.

#belangrijk[Dat is veiliger dan puur éénkanaals, maar haalt de betrouwbaarheid van dual channel niet.] Bij dual channel zijn er twee onafhankelijke kringen; hier blijft er één punt over dat kan falen, alleen merk je het nu wel.

=== Wanneer is dual channel niet nodig?

#belangrijk[Dubbelkanaals is niet altijd nodig.] De risicoanalyse bepaalt welk niveau je moet halen, niet de gewoonte.

Het voorbeeld uit de slides is een rem op een verticale as. Het probleem bij een éénkanaalsrem is dat er geen redundantie is, én dat de berekening van het veiligheidsniveau volgens ISO 13849 ingewikkeld wordt. Een drive met SBC (Safe Brake Control) en SBT (Safe Brake Test) verhoogt de veiligheid #strong[zonder] dat je een dubbelkanaalsrem nodig hebt.

De les: soms lost een slimmer component het probleem op waar anders een dubbele architectuur voor nodig was.

== Safety fieldbus

In plaats van elke veiligheidscomponent apart te bedraden, kan je de veiligheidssignalen over een #keyterm[safety fieldbus] sturen, bijvoorbeeld PROFIsafe.

Het voordeel is duidelijk bij grote machines: één buskabel in plaats van tientallen dubbel uitgevoerde draden, en diagnose per component in plaats van zoeken welk contact open staat. De bus zelf is dan zo opgebouwd dat een fout in de communicatie zelf, zoals een verloren of vertraagde boodschap, ook naar de veilige toestand leidt.

== EN 60204: stopcategorieën en STO

EN 60204:2016 definieert drie #keyterm[stopcategorieën]:

- *Stopcategorie 0:* bewegingen stoppen door #strong[meteen] de voeding af te schakelen.
- *Stopcategorie 1:* gecontroleerd tot stilstand brengen, bijvoorbeeld door te remmen, #strong[en daarna] de voeding afschakelen. Dat is gewenst bij lasten met een grote traagheid.
- *Stopcategorie 2:* gecontroleerd tot stilstand brengen, waarbij de voeding #strong[niet] wordt afgeschakeld.

#belangrijk[Voor een noodstopfunctie is alleen categorie 0 of 1 toegestaan.] Dat zijn precies de twee categorieën waarbij de voeding uiteindelijk wordt afgeschakeld. Categorie 2 is dus wel een geldige "stop", maar nooit een "noodstop".

#waarschuwing[
  Een #keyterm[STO] (Safe Torque Off) mag als categorie-0-stop gelden, maar garandeert alleen dat de motor #strong[geen koppel] meer levert: er kan nog spanning op de wikkelingen staan. Daarom komt er soms een extra contactor in de voeding van de frequentieomvormer bij, of een werkschakelaar als LoTo.

  Om onverwacht opstarten te verhinderen hoef je niet van het net te scheiden. Wil je aan de elektrische uitrusting #strong[werken], dan is een scheidingsinrichting wél verplicht.
]

Vergelijk met de stopknop uit @sec:24vvs: die werkt in categorie 2, via de machinesturing.

== EN 12100

#keyterm[EN 12100] legt de rangorde vast waarin je een gevaar aanpakt. Pak het aan #belangrijk[bij de bron]:

+ *Inherently safe design.* Kies het proces zelf zo dat het gevaar er niet is. Je selecteert het proces samen met de omgeving waarin de machine gebruikt wordt.
+ *Collectieve bescherming* (niveau 2A). Een afscherming die iedereen tegelijk beschermt.
+ *Individuele bescherming* (niveau 2B). Persoonlijke beschermingsmiddelen: labojas, veiligheidsbril.

#belangrijk[De volgorde is bindend.] Persoonlijke bescherming is het laatste redmiddel, niet het eerste.
