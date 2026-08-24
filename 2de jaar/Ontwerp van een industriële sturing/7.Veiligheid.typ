#import "../../school-template.typ": *

= Veiligheid <ch:veiligheid>


Veiligheid is geen los hoofdstukje achteraan het ontwerp. #belangrijk[Hangt de veiligheid van een machine af van het juist functioneren van een besturing, dan heet dat #keyterm[functionele veiligheid].] Dat legt bijzondere eisen op aan de beschikbaarheid van die veiligheidsfunctie: ze moet werken, ook als er iets stukgaat.

== Het starten van een motor <sec:motor-starten>

Het probleem bij het starten is dat een stilstaande motor slip $s = 1$ heeft: de rotor staat stil ten opzichte van het draaiveld, de geïnduceerde rotorspanning is maximaal en de rotorimpedantie laag. Daardoor trekt de motor bij het aanzetten veel meer stroom dan nominaal. De vier startmethodes verschillen enkel in *hoeveel spanning je de motor geeft en wanneer*, en dat bepaalt meteen zowel de inschakelstroom als het aanloopkoppel:

$ T prop U^2 $

met:
- $T$ --- koppel van de asynchrone motor [N·m]
- $U$ --- spanning over één wikkeling [V]

Elke methode die de startstroom beperkt door de spanning te verlagen, verlaagt dus het koppel *kwadratisch*. Dat is de rode draad van deze sectie.

+ *DOL (Direct-On-Line)*

  De eenvoudigste en goedkoopste methode: de motor wordt rechtstreeks op het net aangesloten en krijgt direct zijn volledige spanning. Het nadeel is een zeer hoge inschakelstroom, vaak tot 6 à 8 keer de nominale stroom, wat belastend is voor het net (spanningsdip) en voor de mechanica (schokkoppel op koppelingen en tandwielen).

+ *Ster-driehoek (star-delta)*

  De motor start in twee stappen. Eerst draait hij in *sterconfiguratie*, waarbij elke wikkeling een lagere spanning krijgt, wat resulteert in een lager koppel en een lagere inschakelstroom. Daarna schakelt het systeem automatisch over naar *driehoekconfiguratie*, waarbij de motor op volle spanning draait.

  In ster staat over elke wikkeling $U_"net" \/ sqrt(3)$ in plaats van $U_"net"$, dus stroom en koppel vallen beide op één derde terug:

  $ I_"ster" = 1/3 I_"driehoek", quad T_"ster" = 1/3 T_"driehoek" $

  Dit kan dus alleen bij motoren die tijdens het opstarten niet veel koppel vragen --- een belasting die bij lage snelheid al zwaar trekt, komt in ster nooit op toeren.

+ *Softstarter*

  Een softstarter werkt elektronisch en bouwt de spanning naar de motor geleidelijk op tijdens het starten (met thyristors die per halve periode later of vroeger ontsteken). Hierdoor wordt zowel het startkoppel als de inschakelstroom beperkt, wat leidt tot een vlotte, mechanisch vriendelijke opstart zonder abrupte belasting. Dat verlengt de levensduur van mechanische onderdelen zoals koppelingen en tandwielen. De frequentie blijft wel die van het net.

+ *VFD (Variable Frequency Drive)*

  Een VFD regelt niet alleen de spanning, maar ook de *frequentie* van de voeding naar de motor. Dat is het essentiële verschil met een softstarter: omdat de synchrone snelheid $n_s = 120 f \/ p$ meeschaalt met de frequentie, blijft de slip klein en houdt de motor vol koppel bij lage snelheid. Dit geeft de meest nauwkeurige en efficiënte controle, met de bijkomende mogelijkheid tot energiebesparing. VFD's zijn duurder, maar bieden veruit de meeste functionaliteit.

De netbeheerder kan het aan dat het grootste deel van de motoren in de industrie DOL start, maar je wordt hier wel voor beboet.

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

+ *Aarden op één punt*: voor de meeste signalen wordt het scherm op twee plaatsen geaard. Voor AC-uitgangssignalen --- dus de vermogenschakelingen --- aard je slechts op één punt. Aard je daar aan beide kanten, dan hangt het scherm tussen twee punten met een verschillend potentiaal en gaat er stroom door de afscherming vloeien (aardlus). Die stroom is zelf weer een storingsbron.

#waarschuwing[
  Bij een VFD is *geen motorbeveiligingsschakelaar* nodig, wel een gewone automaat. De drive bewaakt zelf de motorstroom en de thermische belasting; een MPCB ervoor zou op de geschakelde stroomvorm reageren en ongewenst afschakelen.
]

== Lock-out Tag-out (LoTo)

Voor onderhoud volstaat het niet om een machine "uit" te zetten. Iemand anders kan hem weer inschakelen terwijl jij met je handen in de machine zit. Daarom vergrendel je hem #strong[fysiek]. Dat heet #keyterm[LoToTo]: Lock-out, Tag-out, Try-out.

De procedure uit de slides, in volgorde:

+ Alle energiebronnen en bedieningselementen inventariseren, en instructies vastleggen voor hun isolatie.
+ Alle betrokkenen informeren over de nodige lock-out.
+ De operationele werkzaamheden aan de installatie laten staken.
+ Bepalen welke acties vanuit de centrale bedieningsruimte nodig zijn voor de lock-out.
+ De installatie stoppen volgens de normale procedure.
+ Op de energiecontrolepunten de energietoevoer #strong[isoleren]. Dus niet alleen de stroomtoevoer uitschakelen, maar ook leidingen legen en spoelen, steekflenzen plaatsen, enzovoort.
+ Alle #strong[resterende] energie laten wegvloeien: reststroom, restdruk, en zo verder.
+ *Lock-out en tag-out:* alle controlepunten vergrendelen in de uit-stand en ze markeren.
+ #belangrijk[Elke LoTo-geautoriseerde plaatst een eigen slot en een eigen label] met de vereiste gegevens erop.
+ *Try-out:* controleren dat de machine effectief niet meer kan starten.

De drie delen uit elkaar gehouden:

- *Lock-out:* het fysieke slot dat verhindert dat de scheider weer ingeschakeld wordt.
- *Tag-out:* het label dat zegt wie de vergrendeling plaatste en waarom.
- *Try-out:* de proef die aantoont dat de vergrendeling ook echt werkt.

#belangrijk[Dat elke persoon zijn eigen slot plaatst is de kern.] Zolang er één slot hangt, kan de machine niet starten. Zo kan niemand de vergrendeling van een collega opheffen.

#figure(
  image("assets/OIS_loto.png", width: 10cm),
  caption: [Lock-out, tag-out: elke geautoriseerde persoon hangt een eigen slot en label aan het energiecontrolepunt.],
  label: <fig:loto>,
)

== Pictogrammen en veiligheidsstop

#keyterm[ISO 7010] is de internationale norm voor veiligheidssymbolen.

In 2011 registreerde ISO een nieuw symbool om de #strong[locatie] van noodstopknoppen aan te duiden. Dat symbool gebruikt het formaat "groen vierkant met wit symbool", het formaat voor bordjes die de plaats van veiligheidsuitrusting aangeven. Daardoor hoort het in dezelfde familie als de bordjes voor brancards, oogdouches, nooddouches en nooduitgangen.

#figure(
  image("assets/OIS_pictogram_noodstop.png", width: 10cm),
  caption: [Pictogrammen voor de veiligheidsstop volgens ISO 7010.],
  label: <fig:pictogram-noodstop>,
)

== EN 13849 en SRP/CS

=== Wat de norm regelt <sec:en13849>

#keyterm[EN 13849] gaat over functionele veiligheid: de eisen aan de beschikbaarheid van de veiligheidsfunctie wanneer die van een besturing afhangt.

De onderdelen van de besturing die de veiligheidsfunctie uitvoeren heten samen de #keyterm[SRP/CS] (Safety-Related Parts of a Control System). Die keten loopt altijd van links naar rechts:

$ "trigger event" arrow.r "logica" arrow.r "actuatoren" $

Dus: de noodstopknop of het lichtgordijn, dan het noodstoprelais of de safety-PLC, en dan de contactoren of de STO-ingang van de drive. #belangrijk[Elk van die drie schakels hoort bij de SRP/CS], en elk van de drie kan de veiligheidsfunctie onderuithalen.

#figure(
  image("assets/OIS_srpcs.png", width: 11cm),
  caption: [De SRP/CS-keten: trigger event, logica en actuatoren.],
  label: <fig:srpcs>,
)

=== Het voorbeeldschema <sec:veiligheid-voorbeeldschema>

Het schema uit @ch:voorbeeld-diagram is bewust eenvoudig gehouden. De slides zetten er zelf de beperkingen bij:

- het is categorie 1 (B);
- er is maar #strong[één] veiligheidsfunctie. Normaal zijn er meer: noodstop, safe limited speed, enzovoort;
- er is maar #strong[één] trigger event. Normaal zijn er meer: lidar, lichtgordijnen;
- het is #strong[éénkanaals], en dus kwetsbaar voor een single point of failure.

== Dual channel en EDM

=== Waarom twee kanalen <sec:dual-channel-waarom>

Componenten gaan stuk. Erger nog: ze kunnen #strong[foutief] falen, zodat hun veiligheidsfunctie niet meer werkt. Een contactor die na veel schakelen blijft plakken, bijvoorbeeld.

#belangrijk[Het hoofddoel van een dubbelkanaalsarchitectuur is het vermijden van een #keyterm[SPoF] (Single Point of Failure).] Daarom is elke component redundant:

- *Trigger events:* elke noodstopknop schakelt #strong[twee] N.C.-contacten. Een dubbelkanaals lichtgordijn schakelt eveneens twee uitgangen.
- *Uitgangstoestellen:* elke motor wordt door #strong[twee] contactoren afgeschakeld.

Maar wat als eerst het ene contact faalt en later het andere? Daarom worden de contacten met #keyterm[cross-monitoring] aangesloten. Beschrijven de twee kanalen niet dezelfde situatie, dan gaat het systeem naar de veilige toestand. #belangrijk[Ook na een reset herhaalt dat zich, tot het defecte contact vervangen is.]

Dubbelkanaals doe je #strong[altijd] met een speciaal noodstoprelais, of met een safety-PLC. De complexiteit en de valideerbaarheid laten niets anders toe.

=== Categorie 3 <sec:categorie3>

De aangewezen architectuur voor categorie 3 heeft:

+ redundante signaalpaden;
+ #strong[cross-monitoring] van de ingangssignalen;
+ een #strong[back-check]: de terugkoppeling van de uitgangen wordt vergeleken met de aangestuurde toestand.

#figure(
  image("assets/OIS_categorie3.png", width: 11cm),
  caption: [Categorie 3: redundante signaalpaden met cross-monitoring van de ingangen en terugkoppeling van de uitgangen.],
  label: <fig:categorie3>,
)

=== External Device Monitoring <sec:edm>

#keyterm[EDM] (External Device Monitoring) controleert of de externe toestellen die het veiligheidsmodule aanstuurt, bijvoorbeeld de contactoren, de veiligheidskring #strong[effectief] hebben onderbroken.

Je implementeert dat door de terugkoppeling van die contactoren aan de #strong[resetvoorwaarde] van het noodstoprelais toe te voegen. De resetkring verhindert dan een reset zolang een gerelateerde component niet is afgevallen, bijvoorbeeld `-Q1` of `-Q2`.

#examenbox[
  Dit moet je op het examen kunnen tekenen: van elke contactor een N.C.-contact terug naar het noodstoprelais.

  Om die redundantie echt te garanderen kies je bovendien voor #keyterm[force-guided contacts] (mechanisch gedwongen contacten). Daarbij is het mechanisch onmogelijk dat het N.O.-hoofdcontact en het N.C.-hulpcontact tegelijk gesloten zijn. Plakt het hoofdcontact, dan kán het hulpcontact niet sluiten, en dus blokkeert de reset.
]

#figure(
  image("assets/OIS_edm.png", width: 11cm),
  caption: [EDM: de terugkoppeling van de contactoren zit in de resetvoorwaarde van het noodstoprelais.],
  label: <fig:edm>,
)

=== Wat je nooit mag schakelen <sec:dual-channel-0v>

In gewone logica schakel je nooit de $0 "V"$. #belangrijk[Bij een dubbelkanaalsoplossing is dat soms toch de enige manier], namelijk om te vermijden dat een losgekomen $24 "V"$-draad die tegen een klem komt, de noodstop buiten werking stelt.

Bij een bistabiel ventiel is het doel dat het #strong[geen nieuwe beweging] start. Kan je uitsluiten dat de faalvormen van het ventiel zelf tot een onbedoelde beweging leiden, dan mag je het ventiel zonder voeding (afhankelijk van de gebruikte norm) buiten beschouwing laten.

=== STO op een drive <sec:sto-ingang>

De #keyterm[STO]-ingangen (Safe Torque Off) schakelen het vermogendeel van een VFD op een betrouwbare en redundante manier uit. Die ingangen kunnen gevoed worden vanuit de stuurkast, of vanuit de drive zelf.

#waarschuwing[
  De slides tonen expliciet dat je online veel foute schema's vindt. Twee voorbeelden:

  - contacten die als N.C. getekend staan terwijl ze #strong[N.O.] horen te zijn, ook al zullen ze meestal gesloten zijn;
  - schema's waarin de reset maar #strong[één] bewuste handeling vraagt in plaats van twee;
  - een contactor die als `K` benoemd wordt in plaats van `-Q`.
]

=== Vertraagd noodstopcontact

#examenbox[Dit was een examenvraag in 2025.]

Een #keyterm[off-delay] noodstopcontact is nuttig wanneer je redundantie nodig hebt voor véél of zeer krachtige contactoren.

De redenering uit de slides: heb je $30$ contactoren van $30 "A"$, dan zou je voor redundantie een contactor van $900 "A"$ nodig hebben, die dan ook nog eens iets vroeger zou moeten afschakelen dan de dertig andere. Dat is onbetaalbaar.

#belangrijk[Eén redundante contactor van bijvoorbeeld $60 "A"$ volstaat, als je zorgt dat die iets #strong[later] afschakelt dan de andere.] Je gaat er dan van uit dat niet alle andere contactoren tegelijk zullen falen: valt er één weg, dan neemt de vertraagde contactor het over.

#figure(
  image("assets/OIS_vertraagd_estop_contact.png", width: 11cm),
  caption: [Vertraagd noodstopcontact: één kleinere, later afvallende contactor geeft redundantie voor een hele reeks contactoren.],
  label: <fig:vertraagd-estop>,
)

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

Vergelijk met de stopknop uit @sec:24vvs: die werkt in categorie 2, via de machinesturing.

== EN 12100

#keyterm[EN 12100] legt uit hoe je een machine veilig bouwt. Het uitgangspunt: pak het gevaar aan #belangrijk[bij de bron].

De norm kent een duidelijke rangorde in beschermingsmaatregelen:

+ *Inherently safe design.* Kies het proces zelf zo dat het gevaar er niet is. Wil je een plank doorzagen, dan denk je meteen aan een cirkelzaag. Maar gaat het om een omgeving met peuters, dan kies je beter een figuurzaag. #belangrijk[Je selecteert het proces samen met de veiligheidssituatie waarin de machine gebruikt wordt.]
+ *Collectieve bescherming* (niveau 2A). Een afscherming die iedereen tegelijk beschermt, zoals de omheining in een dierentuin.
+ *Individuele bescherming* (niveau 2B). Persoonlijke beschermingsmiddelen: labojas, veiligheidsbril.

#belangrijk[De volgorde is bindend.] Persoonlijke bescherming is het laatste redmiddel, niet het eerste. Een veiligheidsbril lost een slecht ontworpen machine niet op.
