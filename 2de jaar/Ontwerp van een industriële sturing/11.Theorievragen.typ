#import "../../school-template.typ": *

= Theorievragen <ch:theorievragen>

De 25 open vragen uit `DICS updated learning outcomes`, in de volgorde van de prof, met per vraag het antwoord in kernpunten.

== 1. Bespreek de hoofdvereisten van een industriële automatiseringsoplossing

- / Betrouwbaarheid: componenten moeten veel schakelcycli en industriële omstandigheden aankunnen.
- / Beschikbaarheid: stilstand kost productie. Kies standaardcomponenten die jaren leverbaar blijven.
- / Onderhoudbaarheid: alles gelabeld, gedocumenteerd, via klemmenstroken bedraad en insteekbaar.
- / Veiligheid: hoofdschakelaar, zekeringen, automaten, RCD, motorbeveiliging, noodstopkring, STO, veiligheidsrelais en pneumatische veiligheidsventielen.
- / Correcte interfaces: elk signaal heeft een spanningsreferentie. Sourcing, sinking, PNP, NPN, potentiaalvrije contacten, analoge lussen en afgeschermde kabel.
- / Modulariteit: sensoren, actuatoren, PLC, HMI, drives en I/O apart te vervangen en te testen.
- / Kostprijs: standaardoplossingen, tenzij veiligheid of prestatie iets anders verantwoordt.

Uitgewerkt bij @sec:doel en @chap:imports.

== 2. Welke termen koppel je aan Industrie 4.0?

Interconnectie, informatietransparantie, technische assistentie, decentrale besluitvorming, cyber-fysieke systemen (CPS), IoT, digital twin, cloud, flexibele modulaire productie.

Uitgewerkt bij @sec:industrie40.

== 3. Overzicht van de industriële controlesystemen uit dit vak

Mechanische sturing (nokkenschijf), pneumatische logica, hardwired relaislogica, programmeerbaar relais, PLC, IPC, SCADA, PCS, DCS, en specifieke controllers (CNC, robot, temperatuur).

#belangrijk[Vanaf ongeveer vier stappen in een sequentie kies je een PLC.] Uitgewerkt bij @sec:controlesysteem-kiezen.

== 4. De Simatic PLC: geheugengebieden, onderdelen, interfaces, en de basisintegratie

Onderdelen: CPU, voedingsmodule, digitale in- en uitgangsmodules, analoge modules, communicatiemodules.

#table(
  columns: (auto, 1fr),
  align: (left, left),
  stroke: none,
  inset: 5pt,
  table.hline(stroke: 1pt),
  table.header([*Gebied*], [*Inhoud*]),
  table.hline(stroke: 0.5pt),
  [`I`], [ingangen],
  [`Q`], [uitgangen],
  [`M`], [merkers],
  [`DB`], [datablokken],
  [`T` / `C`], [timers en tellers],
  [`OB`], [organisatieblokken],
  [`FB`], [functieblokken, met geheugen in een instance-DB],
  [`FC`], [functies, zonder geheugen],
  table.hline(stroke: 1pt),
)

Interfaces: PROFINET, PROFIBUS, Ethernet, digitale en analoge I/O, HMI, remote I/O, drive- en encoderinterfaces.

De tekening die je moet kunnen maken: de stopknop `-S1` als N.C. op een ingang, de sensor `-B1` als N.O. op een tweede ingang, en de contactor `-Q1` op een uitgang. #belangrijk[In de ladderlogica wordt die N.C.-stopknop een N.O.-contact], zie @sec:nc-hardware-software. Uitgewerkt bij @sec:plc-introductie en @sec:lad-basisregel.

== 5. Twee verschillende toepassingen van klemmenstroken

+ *Veldbedrading:* alle kabels die de kast in of uit gaan, komen op klemmen bij de wartelplaat.
+ *Potentiaalverdeling:* klemmen verdelen $24 "V"$, $0 "V"$, $24 "VSV"$, $0 "VSV"$ en PE over meerdere componenten.

Je gebruikt een aparte strook per locatie en per functie, bijvoorbeeld `-X1` inkomende voeding, `-X2` verdeling $24 "V"$, `-X3` PLC-ingangen, `-X4` PLC-uitgangen. Nummering loopt door: `-X4:1`, `-X4:2`.

Types en toebehoren: doorvoerklem, PE-klem, zekeringklem, scheidingsklem, sensor-actorklem, etageklem, eindplaat, eindsteun, kambrug, markeerstrip en meetstekker.

#belangrijk[Twee geleiders op één klem mag alleen als de klem daarvoor ontworpen is, en voor PE nooit.] Uitgewerkt bij @sec:klemmen.

== 6. Drie methodes voor kringbeveiliging, en bescherming van de mens

#table(
  columns: (auto, 1fr),
  align: (left, left),
  stroke: none,
  inset: 5pt,
  table.hline(stroke: 1pt),
  table.header([*Methode*], [*Wanneer*]),
  table.hline(stroke: 0.5pt),
  [Smeltzekering], [goedkoop, hoog breekvermogen, vervangen na aanspreken],
  [MCB / MCCB], [herinschakelbaar; kies nominale stroom én breekvermogen (AIC)],
  [RCD], [lekstroom, beschermt de mens; vervangt geen overstroombeveiliging],
  table.hline(stroke: 1pt),
)

In combinatie met een motorbeveiliging: de zekering of automaat dekt de kortsluiting, de OLR of MPCB dekt de thermische overbelasting. Beide zijn nodig, want een gewone automaat schakelt af op de aanloopstroom van de motor.

De mens bescherm je met aarding, equipotentiaalverbinding, isolatie, de juiste IP-graad, RCD's, veiligheidszeer lage spanning, de hoofdschakelaar en LoToTo. Uitgewerkt bij @sec:main-circuits-beveiliging.

== 7. SMPS in de diepte, en kortsluiting op de secundaire zijde

Een SMPS gelijkricht de netspanning, hakt de DC op hoge frequentie, transformeert over een ferrietkern, gelijkricht opnieuw, en regelt de uitgang met een teruggekoppelde PWM. De optocoupler brengt die terugkoppeling over de isolatiebarrière.

Voordelen: hoog rendement, klein, weinig warmte, stabiele $24 "VDC"$, breed ingangsbereik, en op industriële modellen een diagnosecontact.

Plaatsing: na de inkomende beveiliging en de hoofdschakelaar, PE aangesloten, en $24 "V"$ en $0 "V"$ via klemmen verdeeld. Houd de gewone $24 "V"$ gescheiden van de $24 "VSV"$.

#waarschuwing[
  *Kortsluiting secundair.* De SMPS detecteert de te hoge uitgangsstroom en begrenst ze. De uitgangsspanning zakt in, want $24 "V"$ handhaven én de stroom begrenzen kan niet samen. Afhankelijk van het ontwerp blijft hij in stroombegrenzing, gaat hij in foldback, of in hiccup, tot de fout weg is. Door de hoge schakelfrequentie zijn de uitgangscondensatoren klein, dus zakt de spanning snel weg.
]

Uitgewerkt bij @sec:smps.

== 8. Tekening: inkomende voeding en het maken van 24 VSV

Teken van boven naar beneden: netaansluiting $arrow.r$ `-X1` klemmenstrook $arrow.r$ `-Q1` hoofdschakelaar $arrow.r$ `-F1` beveiliging $arrow.r$ `-T1` SMPS $arrow.r$ `-X2` verdeling $24 "V"$ en $0 "V"$ $arrow.r$ `-K1` noodstoprelais $arrow.r$ `-X3` verdeling $24 "VSV"$.

- / Enkelkanaals: één veiligheidscontact schakelt de $24 "V"$. Eén noodstop op de ingang van het relais.
- / Dubbelkanaals: twee onafhankelijke contacten schakelen twee paden, en het veiligheidsrelais vergelijkt ze. Op een PNOZ herken je dat aan twee aparte kringen (`S11-S12` en `S13-S10`).

#belangrijk[Het doel van dubbelkanaals is dat geen enkele losse fout de veiligheidsfunctie mag uitschakelen.] Uitgewerkt bij @sec:dual-channel-waarom.

== 9. E-stoprelais, 24 VSV, ½ kanaal, SPoF, EDM, redundantie, STO, force-guided

- / E-stoprelais: bewaakt de noodstopingangen en schakelt de veiligheidsuitgangen.
- / 24 VSV: de veilig geschakelde $24 "V"$ voor alles wat na een noodstop spanningloos moet zijn.
- / ½ kanaal: één schakelend pad, maar wél bewaakt met terugkoppeling. Zie @sec:half-channel.
- / SPoF: één vastgelast contact of één draadbreuk mag de veiligheidsfunctie niet uitschakelen.
- / EDM: het relais leest de N.C.-terugkoppeling van de contactoren vóór het een herstart toelaat.
- / STO: veiligheidsingang van de drive, haalt het koppel weg zonder noodzakelijk het net te scheiden.
- / Force-guided contact: N.O. en N.C. mechanisch gekoppeld, zodat een vastgelast hoofdcontact het hulpcontact blokkeert.
- / Hoofdcontact tegenover hulpcontact: vermogen tegenover terugmelding.

*Wanneer een apart relais in plaats van een contact van het noodstoprelais?* Als je meer contacten nodig hebt, als de stroom te hoog is, als je galvanische scheiding wil, of als je een andere spanning moet koppelen.

*EDM bij een VFD (2026): waarom wel, waarom niet?* Niet nodig, want de drive kruiscontroleert beide STO-kanalen intern en gaat zelf in fout. Toch getekend, omdat het de interfacing aanleert en omdat het opnieuw een SPoF wegneemt.

*Vertraagd contact.* Eén redundante contactor die een fractie later afvalt, vervangt een redundante contactor per motor. Uitgewerkt bij @sec:vertraagd-estop.

== 10. Vier schakelcomponenten voor stuur- en vermogenskringen

#table(
  columns: (auto, 1fr, 1.2fr),
  align: (left, left, left),
  stroke: none,
  inset: 5pt,
  table.hline(stroke: 1pt),
  table.header([*Component*], [*Waarvoor*], [*Werkingsprincipe*]),
  table.hline(stroke: 0.5pt),
  [Relais], [kleine stuurstromen, spanningsinterface], [spoel maakt een magnetisch veld en verplaatst de contacten],
  [Contactor], [vermogen, bv. motoren], [zwaardere elektromagnetische schakelaar met hoofdcontacten],
  [SSR], [snel of vaak schakelen van vermogen], [optocoupler voor de scheiding, schakelt vaak op de nuldoorgang; heeft koeling nodig],
  [Optocoupler], [signaalscheiding, snel en laag vermogen], [LED en fototransistor dragen het signaal optisch over],
  table.hline(stroke: 1pt),
)

De keuzetabel staat bij @fig:different-voltages-wanneer: laag of hoog frequent tegen lage of hoge stroom.

Begrippen: *shading coil* (kortsluitring, @sec:ac-contactoren), *force-guided contact*, *hoofdcontact*, *hulpcontact*, *volt-free contact* (potentiaalvrij, levert zelf geen spanning), *PNP* (sourcing) en *NPN* (sinking, @sec:waarom-pnp).

De elektromagnetische werking, van stroom tot kracht, staat stap voor stap bij @sec:krachtketen.

== 11. De twee componenten voor CW/CCW van een driefasige asynchrone motor

+ *Omkeerschakeling met twee contactoren.* Twee fasen wisselen. Mechanische én elektrische vergrendeling is verplicht, anders sluiten beide contactoren tegelijk en heb je een kortsluiting. In de PLC doe je dat met cross-protect, @sec:cross-protect.
+ *VFD.* Richting via digitale ingangen, veldbus of PLC-commando, plus toerentalregeling, ramps, remmen en diagnose.

Uitgewerkt bij @sec:3-phase-motors.

== 12. Vier methodes voor motorbeveiliging

#table(
  columns: (auto, 1fr, 1fr),
  align: (left, left, left),
  stroke: none,
  inset: 5pt,
  table.hline(stroke: 1pt),
  table.header([*Methode*], [*Wat ze doet*], [*Aanbevolen wanneer*]),
  table.hline(stroke: 0.5pt),
  [OLR], [thermische overbelasting; opent de #strong[stuurkring] van de contactor, codeletter `-B`], [bij een bestaande contactor, met aparte kortsluitbeveiliging],
  [MPCB], [kortsluiting, overbelasting én handbediening in één], [de standaardkeuze voor een directe motorafgang],
  [VFD], [bewaakt stroom, overbelasting en fasefout; kan STO gebruiken], [als er toch al een drive staat, dan is een aparte MPCB overbodig],
  [Pt100 / Pt1000 / thermistor], [meet de wikkelingstemperatuur zelf], [als de opwarming niet alleen uit de stroom volgt: traag draaien, slechte koeling],
  table.hline(stroke: 1pt),
)

#belangrijk[Een OLR schakelt niets rechtstreeks af.] Hij opent de stuurkring, waarna de contactor afvalt. Uitgewerkt bij @sec:motorbescherming-detail.

== 13. VFD in de diepte, en de kabel aan de secundaire zijde

De drive gelijkricht het net, houdt een DC-bus, en maakt met een omvormer opnieuw AC op een instelbare frequentie. Daarmee krijg je toerental, aanloop- en uitlooprampen, remmen, koppelregeling, richting en diagnose.

Aan de motorzijde gebruik je een #belangrijk[afgeschermde motorkabel]. De omvormer levert steile spanningsflanken met hoogfrequente inhoud; het scherm houdt die storing binnen. Sluit het scherm rondom aan (360°, EMC-wartel), #belangrijk[nooit met een pigtail], en aan beide uiteinden op PE. Onderbreek de kabel niet nodeloos met contactoren.

Uitgewerkt bij @sec:vfd-emi.

== 14. Wanneer afgeschermde kabel, en hoe sluit je het scherm aan?

Gebruiken bij: motorkabels van een VFD, encoderkabels, analoge signalen, snelle digitale signalen, communicatiekabels, en lange kabels in een storende omgeving.

#table(
  columns: (auto, 1fr),
  align: (left, left),
  stroke: none,
  inset: 5pt,
  table.hline(stroke: 1pt),
  table.header([*Kabel*], [*Scherm aarden*]),
  table.hline(stroke: 0.5pt),
  [VFD-motorkabel], [aan #strong[beide] uiteinden, want de stoorstroom moet terug naar de drive],
  [analoge signaalkabel], [aan #strong[één] kant, anders loopt er stroom door de mantel en maak je de storing zelf],
  table.hline(stroke: 1pt),
)

Uitgewerkt bij @sec:afscherming.

== 15. Zes naderingsschakelaars, en de twee bedradingsmethodes

#table(
  columns: (auto, 1fr),
  align: (left, left),
  stroke: none,
  inset: 5pt,
  table.hline(stroke: 1pt),
  table.header([*Type*], [*Principe en toepassing*]),
  table.hline(stroke: 0.5pt),
  [Inductief], [wervelstromen in metaal dempen een spoel; korte afstand, alleen metaal],
  [Capacitief], [verandering van capaciteit; ook kunststof, vloeistof, poeder en glas, maar gevoelig voor vocht],
  [Optisch], [LED en fotodiode; door-de-straal, met reflector, of diffuus op het object zelf],
  [Ultrasoon], [afstand uit de looptijd van geluid; universeel maar het duurst],
  [Reedcontact], [magnetisch veld sluit twee lamellen; traag, goedkoop, op cilinders],
  [Hall-sensor], [magnetisch veld verandert een halfgeleiderspanning; sneller dan een reed],
  table.hline(stroke: 1pt),
)

De twee bedradingsmethodes: een *3-draadssensor* met eigen voeding en één schakeluitgang (PNP of NPN), of een *potentiaalvrij contact*, oftewel een 2-draadssensor in serie met de ingang.

Uitgewerkt bij @sec:discrete-sensoren.

== 16. N.O. of N.C. in deze toepassing? Of vind de ontwerpfout

De regel: #belangrijk[een draadbreuk moet de veilige toestand opleveren.] Dus N.C. voor stop, noodstop, veiligheidsdeuren, eindaanslagen en foutdetectie; N.O. voor start en gewone detectie.

*Waarom soms een discrete sensor naast de analoge?* Omdat de discrete een onafhankelijk grenssignaal geeft. Een analoge niveaumeting kan verkeerd geschaald zijn of uitvallen; de aparte hoogniveauschakelaar verhindert dan nog altijd het overlopen. Dat is redundantie tegen een SPoF.

Uitgewerkt bij @sec:no-nc-keuze, met de tankoefening.

== 17. Pt100, 4--20 mA en 0--10 V aansluiten

- / Pt100: op een RTD-ingang, in 2-, 3- of 4-draadsuitvoering.
- / 4--20 mA: in een stroomlus met transmitter, voeding en stroomingang.
- / 0--10 V: signaal en referentie op een spanningsingang.

*Single-ended tegenover differentieel.* Single-ended meet tegenover één gemeenschappelijke referentie, differentieel meet tussen twee klemmen en onderdrukt daardoor common-mode storing. Voor digitale I/O volstaat single-ended, want die signalen hebben een ruime spanningsmarge en hoeven alleen hoog of laag te zijn.

*Waarom 4--20 mA betrouwbaarder is dan 0--10 V.* De stroom is dezelfde over de hele lus, dus spanningsval in een lange kabel doet er niet toe. En omdat nul overeenkomt met $4 "mA"$, betekent $0 "mA"$ een kabelbreuk in plaats van een meetwaarde.

*Pt100-aansluitingen.* Gemeten weerstand $R_"gemeten" = R_"Pt100" + R_"draad1" + R_"draad2"$. De 2-draadsaansluiting telt de draadweerstand dus mee. De 3-draads compenseert ze als beide draden even lang zijn. De 4-draads is het nauwkeurigst, want meetstroom en spanningsmeting lopen over aparte draden.

*Waarom een thermowell en een transmitter?* De thermowell beschermt de voeler en laat vervanging toe zonder het proces te openen. De transmitter zet het zwakke sensorsignaal ter plaatse om in $4"–"20 "mA"$, zodat het over lange afstand ongestoord aankomt.

Uitgewerkt bij @ch:analoge-signalen.

== 18. Lucht is gratis: is perslucht goedkoper dan elektrisch aandrijven?

Nee. Lucht is gratis, perslucht niet: comprimeren, koelen, drogen, filteren en verdelen kosten energie, en lekken en drukvallen kosten er nog meer.

#belangrijk[Over de levensduur van een compressor is ongeveer $79%$ van de kosten elektriciteit, $15%$ de aankoop en $6%$ het onderhoud.]

Kies perslucht dus om zijn sterktes: eenvoud, snelheid, overbelastbaar, geschikt voor grijpen en vacuüm, en vonkvrij in een ATEX-omgeving. Uitgewerkt bij @sec:perslucht-rendement.

== 19. FAD, PDP, de droger, en primaire tegenover secundaire luchtbehandeling

- / FAD (Free Air Delivery): het compressordebiet teruggerekend naar de begindruk en -temperatuur, zodat je compressoren kan vergelijken.
- / PDP (Pressure Dew Point): de temperatuur waarbij water begint te condenseren bij de werkdruk. Lager dauwpunt betekent drogere lucht.

Een droger is nodig omdat afscheiden alleen niet volstaat: na het afscheiden is de lucht nog altijd verzadigd, dus een kleine afkoeling geeft opnieuw condensatie. Types: koeldroger, adsorptiedroger met droogmiddel, en membraandroger.

- / Primair: centraal na de compressor. Koeler, separator, drukvat, condensaatafvoer, hoofdfilter, droger.
- / Secundair: lokaal aan de machine. De FRL-unit, met filter, drukregelaar en eventueel smering.

Uitgewerkt bij @sec:persluchtsysteem.

== 20. Wat is een FRL-unit, en waar hoort de L-functie?

Filter, Regulator, Lubricator. De filter verwijdert deeltjes en waterdruppels, de regelaar zet de lokale werkdruk, de smeerinrichting brengt olienevel aan waar componenten dat nodig hebben.

#belangrijk[De L hoort alleen in de tak waar gesmeerd moet worden, zo dicht mogelijk bij die componenten.] Je hebt de olie er net uit gehaald bij het comprimeren; ze weer over de hele installatie verdelen is verspilling.

Uitgewerkt bij @sec:frl-symbool.

== 21. Types elektro-pneumatische ventielen

Een *poort* is een aansluitopening. ISO-nummering: `1` toevoer, `2` en `4` werkpoorten, `3` en `5` uitlaat, `12` en `14` stuursignalen. `=M1-Q1.R1` betekent: de geluiddemper `R1` die in ventiel `Q1` van cilinder `=M1` geïntegreerd zit.

#table(
  columns: (auto, 1fr),
  align: (left, left),
  stroke: none,
  inset: 5pt,
  table.hline(stroke: 1pt),
  table.header([*Ventiel*], [*Waarvoor*]),
  table.hline(stroke: 0.5pt),
  [2/2], [afsluiten of doorlaten],
  [3/2], [enkelwerkende cilinder of stuursignaal],
  [5/2], [dubbelwerkende cilinder],
  [5/3], [dubbelwerkend met een middenstand: closed, exhaust of pressure center],
  table.hline(stroke: 1pt),
)

Verder: *direct werkend* tegenover *gepiloteerd*, en *monostabiel* tegenover *bistabiel*.

*Openen alle ventielen vóór ze sluiten?* Nee. Zittingventielen (poppet) openen meestal vóór ze sluiten, schuifventielen sluiten meestal vóór ze openen.

*FO, FC, FL* zijn fail open, fail closed en fail last: de stand waarin het ventiel valt als de sturing wegvalt. #belangrijk[Kies op veiligheid eerst, op energieverbruik daarna.]

Uitgewerkt bij @sec:soorten-ventielen.

== 22. Veiligheidscomponenten voor pneumatische systemen

Afsluitventiel, dumpventiel, soft-startventiel, gemonitord veiligheidsventiel, snelontluchter, druksensor, standdetectie op het ventiel, redundante ventielen, externe stuurlucht, en vergrendelingen op de cilinder.

*Waarom een gemonitord veiligheidsventiel met EDM?* Omdat de veiligheidsfunctie erop steunt dat de lucht werkelijk weg is of geblokkeerd. De spoeldetectie meldt aan het veiligheidsrelais dat het ventiel de veilige stand echt bereikt heeft, vóór een herstart mag.

Uitgewerkt bij @sec:gemonitorde-ventielen.

== 23. Soft-startventiel gecombineerd met direct werkende of gepiloteerde ventielen

Een soft-startventiel bouwt de druk traag op om plotse bewegingen bij het opstarten te vermijden.

#belangrijk[Combineer het niet met intern gepiloteerde ventielen.] Die halen hun stuurlucht uit diezelfde traag stijgende toevoer, dus tijdens het opstarten is de stuurdruk te laag om betrouwbaar te schakelen. Bij een pneumatische veer is ook de veerkracht dan te zwak. Het gevolg zijn onvoorspelbare bewegingen.

Met *direct werkende* ventielen valt dat probleem weg, want de spoel beweegt het mechanisme rechtstreeks. Met *externe stuurlucht*, afgetakt vóór het soft-startventiel, staat de stuurkring meteen op volle druk terwijl de werkdruk rustig opbouwt.

Uitgewerkt bij @sec:soft-start.

== 24. Mag je het wisselventiel weglaten bij twee parallelle condities?

Nee, niet altijd. Sluit je twee 3/2-ventielen gewoon parallel, dan ontsnapt de lucht van de ene tak via de uitlaat van de andere. En laat je beide los, dan blijft de druk in de leiding staan, want er is geen weg naar buiten: de leiding werkt dan als een klein drukvat en je circuit reset niet.

Weglaten mag alleen als de gebruikte componenten de takken zelf al scheiden.

Uitgewerkt bij @sec:pneum-logica.

== 25. Een cilinder en een vacuümzuignap toevoegen aan een bestaand systeem

*Voor de cilinder:* een stuurventiel (5/2 monostabiel of bistabiel voor dubbelwerkend, 5/3 als je een middenstand nodig hebt, 3/2 voor enkelwerkend), snelheidsregelventielen, geluiddempers, slang en koppelingen, eindsensoren, en een PLC-uitgang per spoel.

*Voor de zuignap:* een vacuümejector of vacuümpomp, de zuignap zelf, een filter, een vacuümsensor of drukschakelaar, een afblaasventiel als het loslaten snel moet gaan, en de bijhorende PLC-I/O.

Een ejectormodule met geïntegreerde toevoer, vacuümopwekking, afblaas en detectie dekt dat in één component.

Uitgewerkt bij @sec:vacuum-ejector en @sec:soorten-ventielen.

== De oefeningen

De vijf oefeningtypes uit de leeruitkomsten:

+ *3D-methode en cascade.* Ontwerp een circuit met zo weinig mogelijk condities, met mono- of bistabiele ventielen. Zie @ch:3d-methode en de oefeningen in @ch:3d-oefeningen.
+ *Cilinderkracht statisch berekenen*, wrijving verwaarloosd, met relatieve druk. Dit is de open vraag van 4 punten. #belangrijk[Let op dat de ene druk als manometerwaarde en de andere als absolute waarde gegeven wordt.] Zie de uitgewerkte oefeningen bij @sec:cilinderkracht.
+ *PLC: programmeermethode, sequentie, FB/FC, wat zou je veranderen.* Zie @sec:sequentie-delen.
+ *`MOVE` van `16#xxxx`, `2#xxxx xxxx` of een decimaal getal naar `Qx.x`, `QB`, `QW` of `QD`:* welke componenten worden actief? Reken het getal om naar bits en lees per uitgang af welke bit hoog staat.
+ *Schema's lezen en aanpassen:* wat gebeurt er als ik op start duw, wat is de vijfde beweging, componenten toevoegen of verplaatsen en correct benoemen, en wat zou je aan het getoonde schema veranderen om het conform te maken.

#waarschuwing[
  Bij oefeningtype 1 vraagt de prof ook: #emph[hoeveel en welke alternatieven bestaan er met hetzelfde aantal condities?] Wat hij daar precies mee bedoelt, staat in geen van de bronnen uitgelegd. Vraag het na in de les in plaats van erop te gokken.
]
== Wat er op de meerkeuze terugkwam

Uit de meldingen op Studforum over de zittingen 2024 en 2025, als checklist:

- symbool herkennen: smeltzekering `-F`, MBS, inductieve schakelaar, SMPS, FRL-unit, 4/2-ventiel tussen andere ventielen;
- een 5/2 monostabiel ventiel met externe pilot en pneumatische veer: duid #strong[alle] kenmerken aan;
- de beste definitie kiezen van een contactor, een relais tegenover een contactor, een SSR, een optocoupler, of een soft-startventiel;
- betekenis van N.C. bij een relais, en waarvoor een oranje draad dient;
- een stuurkring met een TON of TOF: wat gebeurt er als je de startknop $5 "s"$ ingedrukt houdt? Teken het signaal-tijddiagram, dan zie je het meteen;
- welke tak of welk component uit een gegeven schema weg kan zonder de werking te veranderen, of welke fout de #strong[belangrijkste] is;
- `MOVE` van een getal naar `QB`: reken om naar bits en lees per uitgang af;
- bij een noodstop: welk component onderbreekt uiteindelijk de motorstroom (de contactor, niet het relais of de knop);
- veel spanning verdelen: etageklem, barenstel of jumperbar;
- waarom men $4"–"20 "mA"$ verkiest boven een PNP-ingang (draadbreukdetectie);
- drie vragen over de 3D-methode, van het type: "in $A^+$ gebruiken we $c_0$ al, wat hebben we nog nodig?"
