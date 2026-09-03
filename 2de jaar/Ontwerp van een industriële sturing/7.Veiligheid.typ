#import "../../school-template.typ": *

= Veiligheid <ch:veiligheid>


#belangrijk[Hangt de veiligheid van een machine af van het juist functioneren van een besturing, dan heet dat #keyterm[functionele veiligheid].] Dat legt bijzondere eisen op aan de beschikbaarheid van die veiligheidsfunctie: ze moet werken, ook als er iets stukgaat.

== Het starten van een motor <sec:motor-starten>

Een stilstaande motor heeft slip $s = 1$: de rotor staat stil ten opzichte van het draaiveld, de geïnduceerde rotorspanning is maximaal en de rotorimpedantie laag. Daardoor trekt hij bij het aanzetten veel meer stroom dan nominaal. De vier startmethodes verschillen enkel in *hoeveel spanning je de motor geeft en wanneer*. Dat bepaalt meteen twee dingen tegelijk: de inschakelstroom en het aanloopkoppel.

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

  Een VFD regelt de spanning #strong[én] de frequentie. Daardoor schaalt de synchrone snelheid $n_s = 120 f \/ p$ mee, blijft de slip klein en houdt de motor vol koppel bij lage snelheid. Duurder dan een softstarter, maar met snelheidsregeling en energiebesparing erbij.

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
  De netfrequentie kan je niet rechtstreeks veranderen. Door eerst naar DC te gaan gooi je ze weg, en bepaalt de inverter zelf de frequentie én de amplitude van de uitgang. Vandaar de vaste volgorde: gelijkrichter $arrow.r$ DC-bus $arrow.r$ inverter.
]

Je moet de tekeningen *horizontaal*. Eerst komen de drie fasen binnen via de gelijkrichterbrug en de choke, daarna hakken de IGBT's het signaal in stukken. De condensator kan die snelle veranderingen niet volgen en houdt de busspanning min of meer constant --- dat is net zijn functie: afvlakken.

=== EMI en de aarding van de motorkabel <sec:vfd-emi>

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

#belangrijk[Zolang er één slot hangt, kan de machine niet starten.] Elke geautoriseerde plaatst er dus een eigen, zodat niemand de vergrendeling van een collega kan opheffen.

== Pictogrammen en veiligheidsstop

#wrap-figure(
  image("assets/OIS_pictogram_noodstop.png", width: 4cm),
  caption: [Pictogram voor de veiligheidsstop volgens ISO 7010.],
  label: <fig:pictogram-noodstop>,
)[
  #keyterm[ISO 7010] is de internationale norm voor veiligheidssymbolen. In 2011 registreerde ISO een nieuw symbool om de #strong[locatie] van noodstopknoppen aan te duiden: een groen vierkant met een wit noodstopsymbool (dezelfde categorie als brancards, nooddouches en nooduitgangen).
]

== EN 13849 en SRP/CS <sec:en13849>

#keyterm[EN 13849-1] legt de functionele veiligheidseisen vast voor de besturing van machines.

De onderdelen die de veiligheidsfunctie uitvoeren heten samen de #keyterm[SRP/CS] (Safety-Related Parts of a Control System). Deze keten omvat altijd drie schakels:

$ "Ingang (Trigger event)" arrow.r "Logica (Evaluatie)" arrow.r "Uitgang (Actor)" $

- *Ingang*: Noodstopknop, lichtgordijn, veiligheidsschakelaar;
- *Logica*: Veiligheidsrelais of safety-PLC;
- *Uitgang*: Vermogenscontactoren of de STO-ingang (Safe Torque Off) van een regelaar.

#figure(
  image("assets/OIS_srpcs_clean.png", width: 14cm),
  caption: [De SRP/CS-keten: trigger event, logica en actuatoren (EN 13849-1).],
  label: <fig:srpcs>,
)

=== Het eenkanaals voorbeeldschema <sec:veiligheid-voorbeeldschema>

In een basis eenkanaals sturing (Categorie 1 / B) schakelt één stopknop één contactor:

#figure(
  image("assets/OIS_noodstop_hoofdcircuit_clean.png", width: 12cm),
  caption: [Eenkanaals schema: één contact, één contactor. Gevaar voor SPoF (Single Point of Failure).],
  label: <fig:noodstop-voorbeeldschema>,
)

Blijft het contactorcontact door vonkerosie vastlassen, dan kan de stuurkring de motor niet meer stoppen! Dit gevaar heet een #keyterm[SPoF] (Single Point of Failure).

== Dubbelkanaalsarchitectuur (Dual Channel) en EDM <sec:dual-channel-waarom>

Voor Categorie 3 en 4 conform EN 13849-1 moet de veiligheidsfunctie behouden blijven bij een enkelvoudige fout. Dit vraagt redundantie in alle drie de schakels:

#figure(
  image("assets/OIS_categorie4_clean.png", width: 11cm),
  caption: [Categorie 3/4 architectuur: redundante ingangskanalen, cross-monitoring in de logica en terugkoppeling (EDM) van de uitgangen.],
  label: <fig:categorie3>,
)

De volledige werking van de veiligheidsketen verloopt in vijf logische stappen:

+ *Dual Channel Ingang*: Eén paddenstoelknop `-S4` bedient twee mechanisch gekoppelde N.C.-contacten. Het relais stuurt een eigen testsignaal uit op klem $S 11$ en verwacht dit terug op $S 12$ (kanaal 1); idem voor $S 21 arrow.r S 22$ (kanaal 2).
+ *Cross-monitoring*: Het veiligheidsrelais vergelijkt continu de toestand van beide kanalen. Schakelt één kanaal wel en het andere niet (asymmetrie door contactbreuk of vastlassen), dan schakelt het relais direct uit en gaat in *lock-out* (vergrendeling). Automatisch herstarten is onmogelijk tot de fout hersteld is.
+ *Redundante Uitgangen*: In de vermogenkring naar de motor staan *twee contactoren in serie* (`-Q1` en `-Q2`). Mocht één contactor vastlassen, dan onderbreekt de tweede alsnog betrouwbaar de motorstroom.

=== Werking van EDM (External Device Monitoring) <sec:edm>

+ *EDM-terugkoppeling*: Het relais moet vóór elke herstart verifiëren of beide contactoren werkelijk zijn afgevallen. Daarom worden twee N.C.-hulpcontacten van `-Q1` en `-Q2` in serie geschakeld in de resetkring ($Y 1 - Y 2$).
+ *Force-guided contacten (Gedwongen geleid)*: Om te verhinderen dat een contactor "liegt", zijn de N.O.-hoofdcontacten en het N.C.-hulpcontact mechanisch star gekoppeld. Als een N.O.-contact vastlast, dwingt het mechanisme het N.C.-hulpcontact om *open* te blijven $arrow.r.double$ de EDM-lus blijft onderbroken $arrow.r.double$ het relais kan niet resetten!

#figure(
  image("assets/OIS_edm_clean.png", width: 9.5cm),
  caption: [EDM-terugkoppeling: N.C.-hulpcontacten van contactoren `-Q1` en `-Q2` staan in serie met de resetknop.],
  label: <fig:edm>,
)
=== Vertraagd noodstopcontact <sec:vertraagd-estop>

#examenbox[Dit was een klassieke examenvraag in 2024-2025.]

#figure(
  image("assets/OIS_vertraagd_estop_contact.png", width: 12cm),
  caption: [Vertraagd noodstopcontact: één kleinere, later afvallende contactor geeft redundantie voor een hele reeks contactoren.],
  label: <fig:vertraagd-estop>,
)
  Een #keyterm[off-delay] noodstopcontact is nuttig wanneer je redundantie nodig hebt voor véél of zeer krachtige contactoren.

  De redenering uit de slides: heb je $30$ motoren met elk een contactor van $30 "A"$, dan zou een centrale redundante contactor vóór de hele groep $900 "A"$ moeten kunnen schakelen. Dat is onbetaalbaar groot en duur.

  #belangrijk[Eén redundante contactor van bijvoorbeeld $60 "A"$ volstaat, als hij een fractie #strong[later] afschakelt dan de individuele.] De andere zijn dan al open, dus schakelt hij stroomloos af, tenzij er één vastbakt: dan onderbreekt hij enkel díe ene motor.


=== STO op een drive <sec:sto-ingang>

De #keyterm[STO]-ingangen (Safe Torque Off) schakelen het vermogendeel van een VFD op een betrouwbare en redundante manier uit. Die ingangen kunnen gevoed worden vanuit de stuurkast, of vanuit de drive zelf.

#waarschuwing[
  De slides tonen expliciet dat je online veel foute schema's vindt. Twee voorbeelden:

  - contacten die als N.C. getekend staan terwijl ze #strong[N.O.] horen te zijn, ook al zullen ze meestal gesloten zijn;
  - schema's waarin de reset maar #strong[één] bewuste handeling vraagt in plaats van twee;
  - een contactor die als `K` benoemd wordt in plaats van `-Q`.
]

=== De tussenvorm: ½ channel <sec:half-channel>

Bij een #keyterm[½-channel] beveiliging schakelt er maar #strong[één] kanaal, maar dat wordt wél bewaakt: één relais onderbreekt het veiligheidssignaal, en feedbackcontacten controleren of dat relais nog correct werkt.

#belangrijk[Dat is veiliger dan puur éénkanaals, maar haalt de betrouwbaarheid van dual channel niet.] Bij dual channel zijn er twee onafhankelijke kringen; hier blijft er één punt over dat kan falen, alleen merk je het nu wel.

=== Wanneer is dual channel niet nodig?

#belangrijk[Dubbelkanaals is niet altijd nodig.] De risicoanalyse bepaalt welk niveau je moet halen, niet de gewoonte.

Het voorbeeld is een rem op een verticale as. Een éénkanaalsrem heeft geen redundantie, en de berekening volgens ISO 13849 wordt ingewikkeld. Een drive met SBC (Safe Brake Control) en SBT (Safe Brake Test) verhoogt de veiligheid #strong[zonder] dubbelkanaalsrem.

#figure(
  image("assets/OIS_srecs_single_channel.png", width: 12cm),
  caption: [Dezelfde keten in één kanaal: veiligheidsschakelaar, veiligheidscontroller en houdrem. Onderaan staat per schakel zijn MTTFd, waarmee je het bereikte veiligheidsniveau berekent.],
  label: <fig:srecs-single-channel>,
)

Elke schakel heeft een eigen betrouwbaarheidscijfer: #keyterm[MTTFd] (Mean Time To dangerous Failure) in jaren voor ingang en uitgang, #keyterm[PFH] (Probability of dangerous Failure per Hour) voor de controller. Samen geven ze het performance level van de keten.

De les: soms lost een slimmer component het probleem op waar anders een dubbele architectuur voor nodig was.

== Safety fieldbus

In plaats van elke veiligheidscomponent apart te bedraden, kan je de veiligheidssignalen over een #keyterm[safety fieldbus] sturen, bijvoorbeeld PROFIsafe.

Bij grote machines scheelt dat: één buskabel in plaats van tientallen dubbele draden, en diagnose per component in plaats van zoeken welk contact open staat. Een fout in de communicatie zelf, zoals een verloren of vertraagde boodschap, leidt ook naar de veilige toestand.

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
