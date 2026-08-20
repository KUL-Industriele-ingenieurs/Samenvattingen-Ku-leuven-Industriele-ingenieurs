// chapter1_inleiding.typ
// Eerste hoofdstuk - Inleiding
// Dit bestand wordt geladen via #include "chapters/chapter1_inleiding.typ"

#import "../../school-template.typ": *

= Imports en Exports <chap:imports>


In een land heb is een mens producties als ze
*exports* creeren. Dit wordt ervoor dat geld binnenkomt in het land.
Voor dingen buiten het land te gebruiken ga je dingen *importeren*.

Je hebt eigenlijk maar een kleine hoeveelheid mensen die echt productief zijn voor
exports want mensen zoals
- medische personeel
- leerkrachten
- politie
- brandweer
- ambtenaren
- ...

Dragen niet bij aan *exports*. _wel essensiteel maar economisch gezien dragen ze niet bij direct, wel indirect. Zoals medisch personeel die mensen gezond en werkend houd etc etc._

Onze lonen zijn ook hoog vergeleken met andere landen. Het is dus heel moeilijk om
competitief te zijn met andere landen. Als we spreken over *automatiseren*
neem dat misschien een job af maar het zorgt ervoor dat we competitief kunnen blijven met andere landen.

#figure(
  image("assets/importexport.png", width: 8cm),
  caption: [import en export],
  label: <fig:importexport>,
)

#wrap-figure(
  image("assets/Geld binnen en buiten.png", width: 6cm),
  caption: [Geld binnen en buiten],
  label: <fig:geldbinnenenbuiten>,
)[
  De hoogte van de pijl toont de waarde van het product.
  Je neem raw materials binnen en je verhoogt de waarde door productie.
  Het enige dat dus geld binnenbrengt is *Productie*.

  Je kunt productie dus niet stoppen want het is uiteindelijk de motor van het bedrijf.

  Een industriële ingenieur moet ervoor zorgen dat de productielijn gestandardiseerd is.
  Documentatie, gestandaardiseerde componenten, ...

  Als een ingenieur 20-jaar na jou het syteem beheert moet die weten wat het allemaal betekent. In dit vak leer je *standardisering* van de productielijn.
]

#concept(title: "IT en OT")[
  OT = Operational Technology
  IT = Information Technology

  In de OT mag het niet stilvallen. Het mag niet de oorzaak zijn dat iets stilvalt
  In de IT valt dingen wel stil. Websites, services zoals netflix kunnen soms gewoon platliggen.

  In OT spreken we vna operation time van 20-30 jaar.
]

== Ontwerp doelstellingen

Natuurlijk kunnen deze vereisten variëren afhankelijk van de betrokken industrie of installatie.

- *Betrouwbaarheid in een industriële omgeving*: Betrouwbare componenten, robuuste constructie, EMC, IP, ...
- *Ontwerp voor systeemondersteuning op lange termijn*: Onderdelen (van de fabrikant, Unis, ...) EN (nieuw) personeel (opleiding), die gedurende 20 jaar beschikbaar zullen zijn (op korte termijn, onderdelen geleverd < 2u). Beheer documentatie.
- *Ontwerp voor snelle herstelling*: Gebruik standaardcomponenten, methodologie en programmeertaal (LAD) over verschillende machines heen. Gebruik hetzelfde type componenten (insteekbaar/socket) over de machines heen. _bv. Relays hebben kun bewegende delen die snel vervangen kunnen worden_
- *Lage engineeringkosten & flexibiliteit*: Verminder de engineeringtijd: Gebruik kant-en-klare componenten en oplossingen, focus de engineeringinspanning op klant-specifieke vereisten. Een hogere componentkost is vaak acceptabel. Gebruik modulaire componenten voor flexibele oplossingen, wijzigingen in de vereisten zijn te verwachten.

== Basis diagram geautomatiseerd systeem.

#figure(
  image("assets/basisdiagram.png", width: 15cm),
  caption: [basisdiagram],
  label: <fig:basisdiagram>,
)

Elk geautomatiseerd systeem heeft twee soorten aansluitingen op de controller:

- / Inputs van het controlesysteem: De _controle-ingangen_ (bv. knoppen en schakelaars bediend door de operator) en de _sensorsignalen_ (bv. eindschakelaars, druksensoren). Ze vertellen de controller wat er in de machine of het proces gaande is.
- / Outputs van het controlesysteem: De _actuatoren_ (bv. motoren, kleppen, cilinders) die de machine fysiek laten bewegen, en de _visualisatie_ (bv. pilot lamps, HMI-schermen) die de operator feedback geven over de toestand van het systeem.

=== Logic Control Systemen (on/off-besturing)

Logic control systemen (bv. PLC, relais) werken met *discrete, digitale signalen*: een signaal is ofwel aan (1) ofwel uit (0). Dit maakt ze ideaal voor aan/uit-sturing van machines.

- / Veel digitale signalen: Drukknopen, eindschakelaars, lampen, relais, contactors, kleppen (valves), ... Elk van deze componenten heeft slechts twee toestanden.
- / 24 VDC als standaardspanning: In industriële omgevingen is 24 V gelijkstroom de standaard voor bekabeling van digitale I/O. Dit is veilig voor operators en compatibel met de meeste PLC-modules.
- / Hardwareplatformen: PLC's, relaisschakelingen en (elektro-)pneumatische systemen zijn typische realisaties van logische besturing.
- / Sequenties: De logica is vaak sequentieel — stap na stap wordt een actie uitgevoerd afhankelijk van resultaten van vorige stappen. Denk aan een machine die eerst klem, dan boor, dan loslaatbeweging uitvoert.

=== Regeltechniek (PID-controllers)

PID-controllers werken niet met aan/uit-signalen, maar met *continue, analoge signalen*. Ze meten een proceswaarde en sturen continu bij om een gewenste setpoint te bereiken (bv. temperatuurregeling).

- / Één analoge ingang, één analoge uitgang: De controller leest één meetwaarde (bv. temperatuur) en stuurt één actuator (bv. verwarmingselement) aan. Dit in tegenstelling tot logische besturing waarbij je tientallen digitale signalen beheert.
- / Standaard signaalbereiken: Analoge signalen in de industrie hebben gestandaardiseerde bereiken: $0"–"20"mA"$, $4"–"20"mA"$ (meest gebruikt, want 0 mA wijst op een kabelfout), $0"–"10"V$ en $-10"–"+10"V$.
- / Temperatuursensoren: *Pt100* en *Pt1000* (weerstandsthermometers, nauwkeurig voor lage temperaturen) en *thermokoppels* (voor hoge temperaturen, bv. in ovens).
- / Temperatuurregelaar: Een dedicated *temperature controller* — een klein apparaat dat de PID-logica zelf uitvoert zonder PLC, typisch voor enkelvoudige regelkringen.

#wrap-figure(
  image("assets/automatisering pyramide.png", width: 8cm),
  caption: [automatisering pyramide],
  label: <fig:automatiseringpyramide>,
)[
  PLC zijn de bijna de grond van heel het automatisering. Zij zijn de dingen die connecteren aan de sensor en de basic logic doen. Alles dat meerdere stappen moet volgen, langduration moet werken en makkelijk vervangbaar moet zijn, wordt meestal gedaan met een PLC.
]

== Een goed controle systeem kiezen

+ *Specifieke controllers, CNC, robot controllers, ...*
+ *Labview:* Een systeem waarmee je sensoren kunt controlleren vanaf een pc. Goede voor een labo omgeving.
+ *Pneumatische controllers*
  #figure(
    image("assets/pneumatische controller.png", width: 5cm),
    caption: [pneumatische controller],
    label: <fig:pneumatischecontroller>,
  )
+ *Relays:* Heeft de simpleste logica nog simpler dan een PLC. Alleen bruikbaar voor simpele logica.
  #figure(
    image("assets/relats.png", width: 5cm),
    caption: [relays],
    label: <fig:relays>,
  )
+ *PLC:* Programmable Logic Controller. Geeft meer controle in productiesystemen. Je kunt het bezien als een simpele computer die je gaat programmeren gelijkaardig aan een arduino of microcontroller. Maar deze is toegepast in automatisering voor zijn betrouwbaarheid.
+ *Mechanische automatisering/CAM operated controls*: Enorm betrouwbaar, de beste oplossingen voor simpele producten _bv. bouten, moeren, ..._
  #figure(
    image("assets/mechanicaltoolrelays.png", width: 5cm),
    caption: [mechanicaltoolrelays],
    label: <fig:mechanicaltoolrelays>,
  )
+ *Programmeerbare Relays:*
+ *IPC's*: Industrial PC, wordt meestal nog aangestuurd door een PLC maar is goed voor complexe software.
+ *SCADA*: Supervisory Control And Data Acquisition. Je bekijkt digitaal al je controle systemen om beter overzicht te krijgen.
  #figure(
    image("assets/Scada.png", width: 5cm),
    caption: [Scada],
    label: <fig:Scada>,
  )
  #figure(
    image("assets/scada2.png", width: 5cm),
    caption: [scada2],
    label: <fig:scada2>,
  )
+ *DCS*: Distributed Control System, Inplaats dat alles centraal wordt gestuurd zorgt DCS dat systemen niet afhankelijk zijn van 1 centrale controller. Dus als er iets misgaat met 1 controller valt de rest van het systeem niet stil. Dit wordt veel gebruikt in de chemische industrie.
+ *Mechatronics*: Een vage term die meerdere dingen kan betekenen, PID, PLC, Cyber-Physical Systems, ... Het gaat algemeen over dingen die door elektronica worden gecontrolleerd worden *Mechatronics* genoemd.


== Industrie 4.0

+ Eerste industrie revolutie: Mechanisatie door water en stoomkracht.
+ Tweede industrie revolutie: Massaproductie door elektriciteit.
+ Derde industrie revolutie: Automatisering door computers en IT _PLC, PID-controllers, sensoren_.
+ Vierde industrie revolutie: Cyber-Physical Systems, IoT, AI, ...


== RDS Reference Designation System, Hoe ga je componten benoemen?


#figure(
  image("assets/klassesRDS.png", width: 15cm),
  caption: [klassesRDS],
  label: <fig:klassesRDS>,
)

Je defineert je component in klasses. Dit is de *een letter code* die de functie van het component beschrijft. Voor elk aspect wordt een letter geven _Bv. EN 81346_

#oefening(
  title: "klassen RDS",
)[

  Als schakelbord =N-A1 een stroomonderbreker -Q1 bevat, dan is de volledige aanduiding van de stroomonderbreker =N1-A1-Q1 (of eenvoudiger =N-A1Q1, of =N-A1.Q1). Als diezelfde stroomonderbreker een relais -K12 bevat, is de volledige referentie =N-A1.Q1.K12.

  - +C1+A3+B6 (of +C1.A3.B6): Locatie B6 maakt deel uit van A3 maakt deel uit van C1
  - =A1=B1 (of =A1.B1): Subsysteemfunctie B1 maakt deel uit van systeemfunctie A1
  - -G1-M5 (of –G1.M5): Motor 5 maakt deel uit van systeem G1


  - 147K1 is de eerste relay K die je vindt op pagina 147
]

Een paar belangrijke letters:
- $K$: Relays, een elektromagnetische schakelaar die een circuit opent of sluit.
- $S$: Schakelaar, knoppen en schakelaars die acties uitvoeren.
- $P$: Meetinstrument, weergave-apparaat of testapparaat (bijv. Lamp).
- $Q$: Stroomonderbreker of hoofdschakelaar.

= Logic control

De eerste ontwerpregel is simpel: bestaat er al een component dat specifiek gemaakt is voor een bepaalde functie, gebruik dat dan in plaats van zelf iets te bouwen dat uiteindelijk hetzelfde doet. Heb je een timer nodig, neem dan een standaard timercomponent en ga niet knutselen met tellers en omwegen. Beperk daarnaast het aantal fysieke verbindingen zoveel mogelijk: elke draad is een kans op een fout.

#concept(title: "Drie soorten logische problemen")[
  / Combinatorisch: de uitgang volgt rechtstreeks uit de *huidige* waarden aan de ingang. Bv. een AND-functie.
  / Geheugenschakeling (binair geheugen): de uitgang hangt niet alleen af van de huidige ingang, maar ook van de toestand *voorheen*. Bv. Start/Stop.
  / Sequentie: een reeks opeenvolgende stappen die het systeem doorloopt om een taak uit te voeren. Elke stap volgt logisch uit de vorige, op basis van sensorinput, tijd of voltooide acties. Bv. een pick-and-place robot: grijpen $arrow.r$ bewegen $arrow.r$ lossen. Dat programmeer je met een PLC via een sequentiële functiegrafiek (SFC).
]

Geheugens maken een systeem snel complex: toestanden worden over het hoofd gezien en het gedrag na een noodstop is moeilijk te overzien. Voeg er in een elektrisch diagram dus *zo weinig mogelijk* toe, net genoeg om alle noodzakelijke condities te beschrijven als combinaties van ingangen en geheugentoestanden.

== Knoppen en schakelaars <sec:knoppen-schakelaars>

Alles begint bij de bediening. De letters volgen de RDS-afspraak: `Q` voor de hoofdschakelaar, `S` voor bedieningsknoppen, `K` voor relais, `P` voor een signaallamp en `E` voor gewone verlichting.

De contactnummering is gestandaardiseerd: *hoofdcontacten* krijgen de nummers 1 tot 10 (of een letter), alle andere (*hulp*)contacten beginnen vanaf 11.

#table(
  columns: (1fr, 1.3fr, 1.2fr),
  inset: 8pt,
  align: horizon,
  stroke: none,
  fill: (x, y) => if y == 0 { gray.lighten(50%) },
  [*Contacttype*], [*Nummers*], [*Ezelsbrug*],
  [Normaal open (N.O.)], [3/4, 13/14, 23/24], [altijd de combinatie 3 & 4],
  [Normaal gesloten (N.C.)], [1/2, 11/12, 21/22], [altijd de combinatie 1 & 2],
)

#figure(
  image("assets/sort of buttons and switched.png", width: 13cm),
  caption: [Soorten bedieningen: drukknop, detent, keuzeschakelaar en signaallamp],
  label: <fig:sortofbuttons>,
)

/ Push button (momentary): je drukt en laat los, zoals een deurbel. Zit meestal in een beschermende kraag zodat hij niet zomaar ingedrukt kan worden.
/ Detent switch (latching): gelijkaardig, maar je moet nogmaals duwen om hem te lossen.
/ Keuze- of draaischakelaar: draait naar een stand en blijft daar staan, tijdelijk of vergrendeld. _Ezelsbrug: het symbool lijkt op pedalen, en een coureur schakelt zijn fiets._
/ Pilot lamp: de terugkoppeling naar de operator, bv. "staat de machine aan?"

#wrap-figure(
  image("assets/hoofdschakelaar-Q1.png", width: 4.5cm),
  caption: [Hoofdschakelaar `-Q1`: één bediening, meerdere draden],
  label: <fig:hoofdschakelaar-Q1>,
  width: 4.5cm,
)[
  Een symbool dat je constant tegenkomt is de *hoofdschakelaar*. Aan één bediening (het "pedaal") hangen verschillende draden die allemaal gelijktijdig schakelen, en die samen één naam dragen: `-Q1`.

  In de industriële omgeving verkiezen we *knoppen boven schakelaars*. Een schakelaar kan namelijk in een onveilige stand achtergelaten worden, een knop niet. Stel: de stroom valt 's middags uit, iedereen gaat naar huis, en 's nachts komt de spanning terug. Een verkeerd staande schakelaar start dan de machine opnieuw op. Bij een knop hangt het starten aan een bewuste menselijke actie. De combinatie komt vaak voor: eerst de schakelaars goed zetten, dan op een knop duwen.
]

#wrap-figure(
  image("assets/Voorbeeld circuit.png", width: 3.5cm),
  caption: [Twee N.O.-schakelaars in serie],
  label: <fig:voorbeeldcircuit>,
  width: 3.5cm,
)[
  Hoe je de schakeling tekent, bepaalt haar functie. In @fig:voorbeeldcircuit staan twee schakelaars `-S1` en `-S2` die beide normaal open zijn, in serie met de lamp `-P1`. Beide moeten dus gesloten zijn voor de lamp brandt: dat is een AND-functie in hardware.
]

Een *volt-free contact* (potentiaalvrij contact) levert zelf geen stroom of spanning: het opent of sluit enkel een verbinding tussen twee draden. Een gewone lichtschakelaar is zo'n contact.

== Contactoren <sec:contactoren>

Tot nu toe schakelden we signalen. Maar wat als je *vermogen* moet schakelen, zoals een driefasige motor of een verwarmingskring? Daarvoor gebruik je een *contactor*: een elektrisch gestuurd schakelelement dat ontworpen is om hoge stromen en inductieve belastingen in of uit te schakelen. In essentie is het een krachtigere variant van een relais.

#examenbox[
  Verwar de letters niet: `K` is een *relais* (stuurstroom, logica), `Q` is een *contactor* of hoofdschakelaar (vermogen).
]

=== Pole en throw

#wrap-figure(
  image("assets/spdt-break-make.png", width: 4.5cm),
  caption: [Break before make en make before break],
  label: <fig:spdt-break-make>,
  width: 4.5cm,
)[
  Een contactor is opgebouwd uit één of meerdere *polen*, wat verwijst naar het aantal schakelcontacten dat hij bevat. Het aantal geleidende standen noemen we *throw* of *way*.

  Stel dat je een lamp wil verbinden met stroombron A óf stroombron B, maar nooit met beide tegelijk. Je schakelt dan één onafhankelijk circuit (*Single Pole*, 1P) tussen twee standen (*Double Throw*, 2T). Dat is dus een *SPDT*-schakelaar.

  De volgorde waarin dat gebeurt, maakt uit. Bij *break before make* wordt het oude contact eerst verbroken voor het nieuwe sluit: de twee bronnen worden nooit even met elkaar verbonden. Bij *make before break* is het omgekeerd, wat je gebruikt wanneer de kring nooit onderbroken mag worden.
]

=== Hoofdcontacten en hulpcontacten

#wrap-figure(
  image("assets/contactor-symbool.jpeg", width: 6.5cm),
  caption: [Contactor `-Q`: spoel A1/A2, drie hoofdcontacten (1/2, 3/4, 5/6) en twee hulpcontacten (11/12 N.C., 23/24 N.O.)],
  label: <fig:contactor-symbool>,
  width: 6.5cm,
)[
  Meestal heeft een contactor *drie hoofdcontacten*, zodat hij de drie fasen van het net in één keer schakelt. Die zijn zo goed als altijd normaal open (N.O.) en geleiden dus enkel wanneer de spoel bekrachtigd is. Ze zijn bestand tegen zware belasting en uitgerust met voorzieningen om overspanning en vonkvorming onder controle te houden: een contactor breekt bovendien op *twee punten* tegelijk, waardoor het tussenstuk spanningsloos "zweeft" en de vlamboog sneller dooft.

  Daarnaast bevat een contactor bijna altijd één of meer *hulpcontacten* (auxiliary contacts), herkenbaar aan de nummering *boven de 10*. Die schakelen géén grote stromen; ze dienen in de besturingslogica om de toestand van de contactor te *signaleren*, bv. voor een zelfhoudschakeling, een terugmelding naar de PLC of een signaallamp. Ze kunnen zowel N.O. als N.C. zijn.
]

Een contactor is *monostabiel*: valt de spanning op de spoel weg, dan valt hij af. De spoelspanning staat volledig los van de contactspanningen. Een spoel van 24 VDC kan perfect hoofdcontacten van 400 VAC en hulpcontacten van 110 VDC aansturen.

=== Opletten bij inductieve belastingen

Een contactor schakelt meestal *inductieve* belastingen (motoren, spoelen), en daar zitten twee valkuilen.

+ Bij het *inschakelen* trekt een asynchrone motor een inschakelstroom $I$ die een veelvoud is van zijn nominale stroom. De contactor moet die piek aankunnen: je dimensioneert hem dus op de belasting die hij schakelt, niet enkel op het nominale vermogen.
+ Bij het *uitschakelen* wil de stroom door een spoel niet plots stoppen ($u = L (Delta I) / (Delta t)$). Er wordt een vlamboog getrokken tussen de contactpunten, en die brandt de contacten weg. Dat is de belangrijkste slijtageoorzaak van een contactor.

=== AC-contactoren: wervelstromen en brommen <sec:ac-contactoren>

Contactoren kunnen op DC én op AC werken, maar in de praktijk zie je vooral AC. Dat geeft twee bijkomende problemen.

*Wervelstromen.* Bij een wisselende spanning verandert de flux voortdurend, en die veranderende flux wekt *wervelstromen* (eddy currents) op in het massieve ijzer van de kern. Die stromen verwarmen de kern en kosten energie. De oplossing is een *gelamineerde* kern: opgebouwd uit dunne, onderling geïsoleerde staalplaatjes, zodat de wervelstromen geen groot rondgaand pad meer vinden. Dit is de klassieke examenvraag over AC-contactoren.

#figure(
  image("assets/ac-contactor-spoelring-flux.jpeg", width: 12cm),
  caption: [AC-contactor met kortsluitring. Geel is de kracht zonder ring (zakt tot nul), blauw en oranje zijn de twee fasenverschoven fluxen, grijs is hun som, en de horizontale lijn is de veerkracht.],
  label: <fig:ac-contactor-spoelring>,
)

*Brommen.* De aantrekkingskracht van een elektromagneet is evenredig met het *kwadraat* van de flux, dus $F prop Phi^2$. Bij AC gaat de flux twee keer per periode door nul, en dus zakt ook de kracht twee keer per periode naar nul. Telkens de kracht onder de veerkracht van de terugstelveer duikt, laat het anker even los en slaat het opnieuw aan. Bij 50 Hz gebeurt dat 100 keer per seconde, en dat hoor je als een brom. Het kost bovendien extra slijtage.

De oplossing is een kleine *geleidende ring* (kortsluitring of spoelring) rond een deel van het poolvlak. De veranderende flux induceert een stroom in die ring, en die stroom gaat de *verandering* van de flux tegen (wet van Lenz). Daardoor loopt de flux door dat deel van de pool in fase achter op de hoofdflux. Op @fig:ac-contactor-spoelring zie je die twee gesplitste fluxen; hun som (de grijze kromme) zakt nooit meer tot nul en blijft altijd boven de veerkracht. Het anker blijft aangetrokken en de brom verdwijnt.

_Let op: de rondgaande samenvatting schrijft de brom toe aan de vlambogen tussen de contactpunten, en linkt de laminatie aan het brommen. Dat klopt niet. De brom is het anker dat 100 keer per seconde lostrilt, en laminatie lost de wervelstromen op: twee aparte problemen met twee aparte oplossingen._

== Relais <sec:relais>

#wrap-figure(
  image("assets/Relay.png", width: 7cm),
  caption: [Doorsnede van een relais],
  label: <fig:Relay>,
  width: 7cm,
)[
  Een *relais* (letter `K`) werkt op hetzelfde principe als een contactor, maar dan voor *signalen* in plaats van vermogen. Het is het meest fundamentele element in logic control: een elektromagnetische schakelaar die door knoppen, schakelaars en sensoren aangestuurd wordt.

  Vloeit er een stroom $I$ door de spoel (aangesloten op de klemmen A1 en A2), dan wordt er een magnetisch veld $B$ opgewekt. Die spoel is gewikkeld rond een kern van ferromagnetisch materiaal, meestal zacht ijzer. De stroom veroorzaakt een *magnetomotorische kracht* (mmf) die een magnetische flux $Phi$ opwekt. Die flux zoekt het pad met de kleinste magnetische weerstand (*reluctantie*), dus door het ijzer en niet door de lucht.

  Waar de flux toch een luchtspleet moet oversteken, ontstaan tegengestelde magnetische polen. Die trekken de bewegende *armatuur* naar het vaste deel, en zo veranderen de contacten van positie. Omdat er een bewegend deel in zit, is een relais niet geschikt voor hoge schakelfrequenties.
]

#wrap-figure(
  image("assets/nc-relais-symbool.png", width: 4cm),
  caption: [Relais met wisselcontact: spoel A1/A2, contact 11-12 (N.C.) en 11-14 (N.O.)],
  label: <fig:nc-relais-symbool>,
  width: 4cm,
  align: left,
)[
  De contacten van een relais kunnen zowel N.O. als N.C. zijn. Op de figuur zie je de streepjeslijn die de spoel mechanisch verbindt met het contact: dat is de manier waarop je in een schema ziet welk contact bij welke spoel hoort.

  Er bestaan uitzonderingen op de monostabiele werking: *latching relais* of *teleruptoren* behouden hun positie zonder dat de spoel continu bekrachtigd blijft.
]

#table(
  columns: (0.8fr, 1.2fr, 1.2fr),
  inset: 8pt,
  align: horizon,
  stroke: none,
  fill: (x, y) => if y == 0 { gray.lighten(50%) },
  [], [*Relais `K`*], [*Contactor `Q`*],
  [Schakelt], [signalen, kleine stromen], [vermogen, grote en inductieve stromen],
  [Contacten], [N.O. en N.C. naar keuze], [meestal 3 hoofdcontacten N.O. + hulpcontacten],
  [Zit in], [de besturingslogica], [het hoofdcircuit],
)

#examenbox[
  Op het examen moet je van een fabrikant een bepaald relais kunnen achterhalen en de N.C.- en N.O.-schakelingen kunnen herkennen. Zo moet je een start-stopschakeling correct kunnen aansluiten.
]

== Signal time Diagram


Zoals gezien in elektronica kun je diagrammen maken om het gedrag van signalen over tijd te visualiseren.
#figure(
  image("assets/Time-diagram.png", width: 15cm),
  caption: [Time-diagram],
  label: <fig:Time-diagram>,
)



== Timer en Timing Relays

#concept(title: "Timers")[

  Timers gaan pas na een bepaalde tijd af of aan na een verandering in signaal.

  Je kunt twee soorten timers hebben:
  / On delay timer (TON): De output gaat pas na een bepaalde tijd actief.
  / Off delay timer (TOF): De output gaat pas na een bepaalde tijd inactief.

  Hiervoor bestaan *Speciale relays: Timing relays*.
]
#wrap-figure(
  image("assets/Timing relays.png", width: 3cm),
  caption: [Timing relays],
  label: "fig:timingrelays",
)[
  Timing relays geven ons controle over een tijdsinterval of het signaal af gaat of aan gaat.

  De timers gaan als volgt:
  - / TON (Timer On Delay): *TON(timer) KT1* met de input *A1* en output *A2*. Het moment dat *A1* actief wordt, start de timer en na de ingestelde tijd gaat *A2* actief. Het is de timer met het kruis $X$.
  - / TOF (Timer Off Delay): *TOF(timer) KT1* met de input *A1* en output *A2*. Het moment dat *A1* inactief wordt, start de timer en na de ingestelde tijd gaat *A2* inactief. Het symbool is de timer met een volledige ingevulde blok.

  #examenbox[Deze symbolen kennen, je moet ze kunnen snappen op het examen]
]

== PLC introductie

PLC is een heel basis introductie tot computers.
Hoe connecteren machines met elkaar? Inputs en outputs, IO.

#concept(title: "PLC (Programmable Logic Controller)")[
  Dit is gespecialiseerde mini-computer die geen scherm, toetsenbord of muis heeft, maar wel een aantal ingangen en uitgangen.
  Deze worden gebruikt in industriële omgevingen om machines en processen te automatiseren.
]

#wrap-figure(
  image("assets/PLC2.png", width: 5cm),
  caption: [PLC],
  label: <fig:PLC2>,
)[
  Een PLC heeft een *CPU* en input en output *I/O*.
  IO is niet persee deel van de PLC maar kan ook andere modules zijn.
  IO heb je ook op je eigen computer, HDMI, USB, ...

  Je hebt dan *Digital I/O* en *Analog I/O*.
  Digital I/O is een binaire input of output, bijvoorbeeld een schakelaar die aan of uit is.
  Analog I/O is een continue waarde, bijvoorbeeld een temperatuur sensor die een waarde tussen 0 en 100 graden geeft.

  Een PLC kan bijvoorbeeld de airco harder zetten in een kamer als die kamer te warm is.
  Dit kan van op afstand gebeuren, bijvoorbeeld via een netwerk, een app, sensor, ...

  Je krijgt inputs van sensoren of knoppen. Deze worden via logic verwerkt en geven een output.
]

Een PLC is *programmeerbaar*, wat betekent dat je
een programma kunt schrijven dat bepaalt hoe de PLC reageert op verschillende inputs
en hoe het de outputs aanstuurt.

Je connecteert aan een PLC met bijvoorbeeld een laptop via een seriële kabel, USB, of netwerkverbinding.
Je schrijft een programma op je laptop en uploadt dat naar de PLC, waarna de PLC het
programma uitvoert en de machines aanstuurt op basis van de logica die je hebt geprogrammeerd.

#wrap-figure(
  image("assets/image1.png", width: 8cm),
  caption: [Controle systeem voorbeeld],
  label: <fig:image1>,
)[
  We leggen deze figuur uit met een eenvoudig voorbeeld.
  Je hebt een doodgewone knop die je kan indrukken.
  Jij als *operator* geef controle inputs aan de knop,
  bijvoorbeeld door hem in te drukken.

  *De logic controller (PLC)* ontvangt deze input en
  verwerkt deze volgens een vooraf gedefinieerd programma.

  De knop krijgt info door sensors die bijvoorbeeld info geven of
  de knop al dan niet is ingedrukt van de machine.

  Als de knop is ingedrukt gaat er een *logic action* gebeuren waarbij de *machine* een actie uitvoert,
  bijvoorbeeld een motor starten of een lamp laten branden.
  De *operator* krijgt feedback van de *machine*, bijvoorbeeld door een lamp die gaat branden of een geluidssignaal.
]

== Relay VS PLC — Waarom kiezen we voor PLC's?

Relay-systemen werken, maar worden snel complex en moeilijk te onderhouden. Een PLC vervangt klassieke relay-logica door software.

Je gaat dan *Ladder logic* toepassen zodat je sequentiële logica kunt programmeren. _zie meer in je labo_

#figure(
  image("assets/relayvsPLC.png", width: 16cm),
  caption: [Relay VS PLC],
  label: <fig:relayvsPLC>,
)

Een relay is een fysiek systeem maar met een PLC met een LAD implementatie _zie figuur @fig:relayvsPLC _is dit
een vervanging van klassieke relays.

=== Ladder logic


#wrap-figure(
  image("assets/Ladder logic.png", width: 4cm),
  caption: [Ladder logic],
  label: <fig:Ladder-logic>,
)[
  Ladder logic is de manier hoe je sequentiele operaties gaat programmeren. Hierbij ga je stap voor stap logica bouwen. Je gaat pas naar de volgende stap als je condities voor die stap *True* zijn.

  Je bepaald eerst je begin condities (memory M0.0, sensoren, knoppen, etc.). _De labo's gaan hier meer op in. Herbekijk kort de slides voor voorbeelden en uitwerking en TIA portal._
]

== Logic control met PLC

=== PLC naam variabele


In een bedrijf wordt vaak een standaard gebruikt voor het benoemen van programmablokken en variabelen. Deze zijn vaak verschillend, maar gebaseerd op een aantal principes die internationaal gebruikelijk zijn. We leggen hier een standaard vast gebaseerd op `plcopen_coding_guidelines_version_1.0.pdf`.

+ *Algemene vorm*: `EerstePrefix_TweedePrefix_UniekeVariabeleBeschrijving`
+ Variabele- en bloknamen zijn in het Engels.
+ We gebruiken `UpperCamelCasing` om spaties te vermijden.
+ We gebruiken underscores om zones (prefixes) te scheiden.
+ In de eerste zone geven we het formaat van de variabele aan in kleine letters (~SystemHungarian), bv. `x` staat voor een bool. Soms verkiezen we hier de Simatic-nomenclatuur.
+ In de tweede zone geven we het geheugentype aan.
+ Ten slotte beschrijven we in de laatste zone de variabele zo correct mogelijk met een unieke naam. Als de variabele verwijst naar een component in de stroomschema's, beginnen we de naam met de referentie-aanduiding (RDS).
+ Voor de leesbaarheid zijn alle prefixes in kleine letters. Meestal is dit slechts één letter, en door `UpperCamelCasing` is het volgende karakter een hoofdletter, wat anders tot verwarring zou leiden.


*Scan cycle*
#wrap-figure(
  image("assets/scancycle.png", width: 2cm),
  caption: [scancycle],
  label: <fig:scancycle>,
)[
  Een PLC gaat de inputs lezen PII, gaat het process uitvoeren OB1 en dan de outputs schrijven PIQ.

  Zo een scan duurt *1-30ms.*
]









