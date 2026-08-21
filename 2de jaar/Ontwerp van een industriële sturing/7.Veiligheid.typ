#import "../../school-template.typ": *

= Veiligheid <ch:veiligheid>


#TODO[Volledig hoofdstuk nog te schrijven. Bron: deck 6 "DICS 2026 7 EN safety", slides 1-27. Komt overeen met hoofdstuk 9.3 tot 9.6 van de rondgaande samenvatting.]

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

#TODO[Deck 6, slides 2-5. Waarom je een machine fysiek vergrendelt voor onderhoud, het verschil tussen lock-out, tag-out en try-out, en wie welk slot draagt.]

== Pictogrammen en veiligheidsstop

#TODO[Deck 6, slide 6. De pictogrammen voor de veiligheidsstop.]

== EN 13849 en SRP/CS

#TODO[Deck 6, slides 7-11. Wat de norm regelt, wat een SRP/CS (Safety-Related Part of a Control System) is, hoe je het vereiste performance level bepaalt, en waar de veiligheidscomponenten in het schema staan.]

== Dual channel en EDM

#TODO[Deck 6, slides 12-19. Twee onafhankelijke kanalen om een Single Point of Failure (SPoF) te vermijden, categorie 3, External Device Monitoring (EDM) om te controleren of de contactoren effectief afgevallen zijn, en het noodstoprelais met dubbel kanaal.]

=== Vertraagd noodstopcontact

#TODO[Deck 6, slide 23. Waarom je soms een vertraagd contact wil (eerst gecontroleerd afremmen, dan de vermogenkring openen).]

=== Wanneer is dual channel niet nodig?

#TODO[Deck 6, slide 24. De risicoanalyse beslist; niet elke machine heeft categorie 3 nodig.]

== Safety fieldbus

#TODO[Deck 6, slide 25. Veiligheid over een busverbinding in plaats van bedrade contacten.]

== EN 60204: stopcategorieën en STO

#TODO[Deck 6, slides 26-27. Stopcategorie 0, 1 en 2, en wat Safe Torque Off (STO) op een drive precies doet.]

== EN 12100

#TODO[Rondgaande samenvatting hoofdstuk 9.4. Risicobeoordeling en risicoreductie als algemeen ontwerpprincipe.]
