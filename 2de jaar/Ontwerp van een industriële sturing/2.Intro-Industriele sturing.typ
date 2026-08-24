// chapter1_inleiding.typ
// Eerste hoofdstuk - Inleiding
// Dit bestand wordt geladen via #include "chapters/chapter1_inleiding.typ"

#import "../../school-template.typ": *

= Imports en Exports <chap:imports>


Een land verdient geld door te *exporteren*: je maakt iets en verkoopt het buiten de landsgrenzen. Wat je zelf niet maakt, moet je *importeren*.

Maar slechts een klein deel van de bevolking draagt rechtstreeks bij aan die export. Denk aan
- medische personeel
- leerkrachten
- politie
- brandweer
- ambtenaren
- ...

Die beroepen dragen niet *rechtstreeks* bij aan de export. _Ze zijn wel essentieel, en hun bijdrage is indirect: medisch personeel houdt mensen gezond en aan het werk._

Onze lonen liggen hoog vergeleken met andere landen, dus het is moeilijk om concurrentieel te blijven. *Automatiseren* kost misschien een job, maar het is net wat ons toelaat om mee te blijven.

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
  De hoogte van de pijl toont de waarde van het product. Je haalt grondstoffen binnen en verhoogt hun waarde door productie. *Productie* is dus het enige dat geld binnenbrengt, en daarom kan je ze niet stilleggen.

  Een industrieel ingenieur zorgt ervoor dat de productielijn *gestandaardiseerd* is: documentatie, standaardcomponenten, vaste werkwijzen. Wie het systeem twintig jaar na jou beheert, moet er nog aan uit kunnen. Dat standaardiseren is waar dit vak over gaat.
]

#concept(title: "IT en OT")[
  OT = Operational Technology
  IT = Information Technology

  In de OT mag niets stilvallen: de sturing mag nooit de oorzaak zijn van een stilstand. In de IT is dat anders, daar mag een website of een dienst zoals Netflix al eens platliggen.

  In de OT rekenen we bovendien op een levensduur van 20 tot 30 jaar.
]

== Ontwerp doelstellingen

Natuurlijk kunnen deze vereisten variëren afhankelijk van de betrokken industrie of installatie.

- *Betrouwbaarheid in een industriële omgeving*: Betrouwbare componenten, robuuste constructie, EMC, IP, ...
- *Ontwerp voor systeemondersteuning op lange termijn*: Onderdelen (van de fabrikant, Unis, ...) EN (nieuw) personeel (opleiding), die gedurende 20 jaar beschikbaar zullen zijn (op korte termijn, onderdelen geleverd < 2u). Beheer documentatie.
- *Ontwerp voor snelle herstelling*: Gebruik standaardcomponenten, methodologie en programmeertaal (LAD) over verschillende machines heen. Gebruik hetzelfde type componenten (insteekbaar/socket) over de machines heen. _bv. een relais op een socket wissel je zo om wanneer de bewegende delen versleten zijn._
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
  PLC's vormen de basis van de hele automatisering. Zij hangen rechtstreeks aan de sensoren en doen de eenvoudige logica. Alles wat meerdere stappen moet doorlopen, jarenlang moet blijven werken en makkelijk vervangbaar moet zijn, doe je meestal met een PLC.
]

== Een goed controle systeem kiezen

+ *Specifieke controllers, CNC, robot controllers, ...*
+ *LabVIEW:* hiermee stuur je sensoren aan vanaf een pc. Goed voor een labo-omgeving.
+ *Pneumatische controllers*
  #figure(
    image("assets/pneumatische controller.png", width: 8cm),
    caption: [pneumatische controller],
    label: <fig:pneumatischecontroller>,
  )
+ *Relais:* de eenvoudigste logica die er is, nog eenvoudiger dan een PLC. Enkel bruikbaar voor simpele schakelingen.
  #figure(
    image("assets/relats.png", width: 5cm),
    caption: [relays],
    label: <fig:relays>,
  )
+ *PLC:* Programmable Logic Controller. Geeft meer controle in productiesystemen. Je kan het zien als een eenvoudige computer die je programmeert, vergelijkbaar met een Arduino of microcontroller, maar gebouwd voor de betrouwbaarheid die automatisering vraagt.
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
+ *DCS*: Distributed Control System. In plaats van alles centraal te sturen, maakt een DCS de systemen onafhankelijk van één centrale controller. Dus als er iets misgaat met 1 controller valt de rest van het systeem niet stil. Dit wordt veel gebruikt in de chemische industrie.
+ *Mechatronica*: een vage term die van alles kan dekken: PID, PLC, Cyber-Physical Systems, ... In het algemeen valt alles wat door elektronica aangestuurd wordt eronder.


== Industrie 4.0

+ Eerste industrie revolutie: Mechanisatie door water en stoomkracht.
+ Tweede industrie revolutie: Massaproductie door elektriciteit.
+ Derde industrie revolutie: Automatisering door computers en IT _PLC, PID-controllers, sensoren_.
+ Vierde industrie revolutie: Cyber-Physical Systems, IoT, AI, ...

#examenbox[Een examenvraag kan zijn: Wat zijn alle eigenschappen en karakteristieken van Industrie 4.0]


== RDS Reference Designation System: hoe benoem je componenten?


#figure(
  image("assets/klassesRDS.png", width: 15cm),
  caption: [klassesRDS],
  label: <fig:klassesRDS>,
)

Je deelt je componenten in *klassen* in. Elke klasse heeft een letter die zegt welke functie het component vervult, en per aspect krijg je zo'n letter. _Bv. EN 81346._

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

De eerste ontwerpregel is simpel: bestaat er al een component dat specifiek gemaakt is voor een bepaalde functie, gebruik dat dan in plaats van zelf iets te bouwen dat hetzelfde doet. Heb je een timer nodig, neem dan een standaard timercomponent en ga niet knutselen met tellers en omwegen. Beperk ook het aantal verbindingen: elke draad is een kans op een fout.

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
  image("assets/Voorbeeld circuit.png", width: 5cm),
  caption: [Twee N.O.-schakelaars in serie],
  label: <fig:voorbeeldcircuit>,
  width: 3.5cm,
  align: left,
)[
  Hoe je de schakeling tekent, bepaalt haar functie. In @fig:voorbeeldcircuit staan twee schakelaars `-S1` en `-S2` die beide normaal open zijn, in serie met de lamp `-P1`. Beide moeten dus gesloten zijn voor de lamp brandt: dat is een AND-functie in hardware.

  Een *volt-free contact* (potentiaalvrij contact) levert zelf geen stroom of spanning: het opent of sluit enkel een verbinding tussen twee draden. Een gewone lichtschakelaar is zo'n contact.

]


== Contactoren <sec:contactoren>

Tot nu toe schakelden we signalen. Maar wat als je *vermogen* moet schakelen, zoals een driefasige motor of een verwarmingskring? Daarvoor gebruik je een *contactor*: een elektrisch gestuurd schakelelement dat ontworpen is om hoge stromen en inductieve belastingen in of uit te schakelen. Het is een zwaardere versie van een relais.

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

  Vloeit er een stroom $I$ door de spoel (aangesloten op de klemmen A1 en A2), dan wordt er een magnetisch veld $B$ opgewekt. Die spoel is gewikkeld rond een kern van ferromagnetisch materiaal, meestal zacht ijzer. De stroom veroorzaakt een *magnetomotorische kracht* (mmf) die een magnetische flux $Phi$ opwekt. Die flux loopt bijna volledig langs het pad met de kleinste magnetische weerstand (*reluctantie*), dus door het ijzer en niet door de lucht.

  Waar de flux toch een luchtspleet moet oversteken, ontstaan tegengestelde magnetische polen. Die trekken de bewegende *armatuur* naar het vaste deel, en zo veranderen de contacten van positie. Omdat er een bewegend deel in zit, is een relais niet geschikt voor hoge schakelfrequenties.
]

=== Van stroom tot contact: de krachtketen

Waarom trekt de armatuur aan? De ketting loopt van stroom naar kracht, en elke schakel heeft zijn eigen formule.

#figure(
    cetz.canvas(length: 1.05cm, {
      import cetz.draw: *

      let ijzer = rgb(110, 110, 110)
      let ijzerv = rgb(219, 219, 224)
      let koper = rgb(176, 104, 42)
      let fluxk = rgb(126, 66, 168)
      let krachtk = rgb(200, 60, 50)
      let veerk = rgb(45, 110, 180)
      let klein = txt => text(size: 7.5pt, txt)
      let mini = txt => text(size: 6.5pt, txt)

      // ---------------- kern (C-vorm) ----------------
      rect((0, 0), (1.0, 5.0), fill: ijzerv, stroke: ijzer)      // juk
      rect((1.0, 0), (6.0, 1.0), fill: ijzerv, stroke: ijzer)    // onderbeen
      rect((1.0, 4.0), (6.0, 5.0), fill: ijzerv, stroke: ijzer)  // bovenbeen
      content((3.5, 0.76), mini[zacht ijzer])

      // ---------------- armatuur ----------------
      rect((6.5, 0), (7.5, 5.0), fill: ijzerv, stroke: ijzer)
      content((7.7, 1.7), anchor: "west", mini[armatuur])

      // ---------------- spoel om het juk ----------------
      for i in range(7) {
        circle((0.5, 1.35 + i * 0.39), radius: (0.98, 0.19), stroke: (paint: koper, thickness: 1.1pt))
      }
      content((-1.35, 2.75), angle: 90deg, klein(text(fill: koper)[$N$ windingen]))

      // klemmen A1 / A2
      line((-0.35, 3.9), (-2.1, 3.9), stroke: (paint: koper, thickness: 1.1pt))
      line((-0.35, 1.15), (-2.1, 1.15), stroke: (paint: koper, thickness: 1.1pt))
      circle((-2.1, 3.9), radius: 0.12, stroke: koper)
      circle((-2.1, 1.15), radius: 0.12, stroke: koper)
      content((-2.35, 3.9), anchor: "east", klein[A1])
      content((-2.35, 1.15), anchor: "east", klein[A2])
      line((-1.55, 4.2), (-0.95, 4.2), mark: (end: ">"), stroke: (paint: koper, thickness: 1pt))
      content((-1.25, 4.55), klein(text(fill: koper)[$I$]))

      // ---------------- fluxlus ----------------
      let fs = (paint: fluxk, thickness: 1pt, dash: "dashed")
      line((0.5, 0.5), (0.5, 4.5), (7.0, 4.5), (7.0, 0.5), close: true, stroke: fs)
      line((0.5, 2.2), (0.5, 3.0), mark: (end: ">"), stroke: (paint: fluxk, thickness: 1.4pt))
      line((3.2, 4.5), (4.0, 4.5), mark: (end: ">"), stroke: (paint: fluxk, thickness: 1.4pt))
      line((7.0, 3.0), (7.0, 2.2), mark: (end: ">"), stroke: (paint: fluxk, thickness: 1.4pt))
      line((4.0, 0.5), (3.2, 0.5), mark: (end: ">"), stroke: (paint: fluxk, thickness: 1.4pt))
      content((1.9, 3.55), klein(text(fill: fluxk)[$Phi$]))
      content((3.6, 2.5), klein(text(fill: koper)[mmf  $cal(F) = N dot I$]))
      content((5.6, 3.45), anchor: "east", mini[luchtspleet: grootste $cal(R)$])
      line((5.72, 3.5), (6.2, 4.25), stroke: (paint: rgb(150, 150, 150), thickness: 0.5pt))

      // ---------------- luchtspleten ----------------
      line((6.0, 0), (6.0, -0.6), stroke: 0.5pt)
      line((6.5, 0), (6.5, -0.6), stroke: 0.5pt)
      line((5.35, -0.35), (6.0, -0.35), mark: (end: ">"), stroke: 0.5pt)
      line((7.15, -0.35), (6.5, -0.35), mark: (end: ">"), stroke: 0.5pt)
      content((6.25, -0.82), klein[$delta$])
      content((5.25, -0.35), anchor: "east", mini[luchtspleet])
      content((5.75, 4.5), mini[N])
      content((6.75, 4.5), mini[Z])
      content((6.75, 0.5), mini[N])
      content((5.75, 0.5), mini[Z])

      // ---------------- krachten ----------------
      line((8.7, 4.5), (7.7, 4.5), mark: (end: ">"), stroke: (paint: krachtk, thickness: 1.7pt))
      line((8.7, 0.5), (7.7, 0.5), mark: (end: ">"), stroke: (paint: krachtk, thickness: 1.7pt))
      content((8.85, 4.5), anchor: "west", klein(text(fill: krachtk)[$F_"mag"$]))
      content((8.85, 0.5), anchor: "west", klein(text(fill: krachtk)[$F_"mag"$]))

      // veer + muur
      let yv = 2.5
      line((7.5, yv), (7.75, yv + 0.3), (8.15, yv - 0.3), (8.55, yv + 0.3), (8.95, yv - 0.3), (9.25, yv),
        (9.6, yv), stroke: (paint: veerk, thickness: 1pt))
      line((9.6, 1.85), (9.6, 3.15), stroke: (paint: veerk, thickness: 1.2pt))
      for i in range(5) {
        line((9.6, 1.9 + i * 0.3), (9.95, 2.15 + i * 0.3), stroke: (paint: veerk, thickness: 0.6pt))
      }
      line((7.8, yv + 0.75), (8.8, yv + 0.75), mark: (end: ">"), stroke: (paint: veerk, thickness: 1.5pt))
      content((8.3, yv + 1.1), klein(text(fill: veerk)[$F_"veer"$]))

      // ---------------- stoter en contacten ----------------
      rect((6.85, 5.0), (7.15, 6.1), fill: rgb(245, 240, 225), stroke: 0.6pt)
      content((7.55, 5.55), anchor: "west", mini[isolerende stoter])

      // blad 11 in rust
      line((7.0, 6.1), (7.28, 7.3), stroke: 1.6pt)
      circle((7.28, 7.3), radius: 0.09, fill: black)
      content((7.4, 6.45), anchor: "west", klein[11])
      // blad bekrachtigd (spookpositie)
      line((6.5, 6.1), (6.78, 7.3), stroke: (thickness: 1pt, dash: "dashed", paint: krachtk))
      // vaste contacten
      circle((6.78, 7.3), radius: 0.09, fill: black)
      line((6.78, 7.3), (6.15, 7.95), stroke: 1.2pt)
      content((6.0, 8.1), anchor: "east", klein[14 (N.O.)])
      line((7.28, 7.3), (7.95, 7.95), stroke: 1.2pt)
      content((8.1, 8.1), anchor: "west", klein[12 (N.C.)])
      line((6.2, 6.75), (5.6, 6.75), mark: (end: ">"), stroke: (paint: krachtk, thickness: 1.2pt))
      content((5.45, 6.75), anchor: "east", mini(text(fill: krachtk)[bij bekrachtiging]))
    }),
  caption: [Doorsnede van een relais met de volledige krachtketen: de spoel maakt de mmf $cal(F)$, die drijft de flux $Phi$ door het ijzer, over de luchtspleet ontstaan de polen, en de aantrekkingskracht $F_"mag"$ werkt tegen de veerkracht $F_"veer"$ in],
  label: <fig:relais-krachten>,
)

*Stap 1: de stroom maakt een magnetomotorische kracht.* De spoel is de bron van het hele verhaal. Niet de stroom alleen telt, maar de stroom maal het aantal keren dat de draad rond de kern gaat.

$ cal(F) = N dot I $

met:
- $cal(F)$: magnetomotorische kracht (mmf), soms genoteerd als $Theta$ $["A"]$, in de praktijk "ampèrewindingen"
- $N$: aantal windingen van de spoel $[-]$
- $I$: stroom door de spoel, tussen de klemmen A1 en A2 $["A"]$

*Stap 2: de mmf drijft een flux.* Dit is de *wet van Hopkinson*, de magnetische tegenhanger van de wet van Ohm: de mmf speelt de rol van spanning, de flux die van stroom, en de reluctantie die van weerstand.

$ Phi = frac(cal(F), cal(R)) $

met:
- $Phi$: magnetische flux door het circuit $["Wb"]$
- $cal(R)$: reluctantie, de magnetische weerstand van het volledige pad $["A/Wb"]$

*Stap 3: de luchtspleet bepaalt die reluctantie.*

$ cal(R) = frac(l, mu A) $

met:
- $l$: lengte van het beschouwde stuk pad $["m"]$
- $mu = mu_r dot mu_0$: permeabiliteit van het materiaal $["H/m"]$
- $A$: doorsnede van het pad $["m"^2]$

Zacht ijzer heeft een relatieve permeabiliteit $mu_r$ van enkele duizenden, lucht heeft $mu_r = 1$. Een luchtspleet van een halve millimeter weegt dus zwaarder door dan enkele centimeters ijzer. Daarom loopt de flux zo goed als volledig door het ijzer, en is de spleet het knelpunt van het circuit.

*Stap 4: de flux over de spleet levert de kracht.* Waar de flux de spleet oversteekt, ontstaan tegengestelde polen aan weerszijden, en die trekken elkaar aan.

$ F_"mag" = frac(Phi^2, 2 mu_0 A) = frac(B^2 A, 2 mu_0) $

met:
- $B = Phi slash A$: magnetische inductie in de luchtspleet $["T"]$
- $A$: oppervlakte van één poolvlak $["m"^2]$
- $mu_0 = 4 pi dot 10^(-7)$: permeabiliteit van het vacuüm $["H/m"]$

Dat is de kracht *per poolvlak*. In @fig:relais-krachten zijn er twee spleten, dus telt de kracht dubbel.

*Stap 5: kracht tegen veerkracht.* De armatuur beweegt pas wanneer de magnetische kracht de terugstelveer overwint:

$ F_"mag" > F_"veer" = k dot x $

met:
- $k$: veerconstante $["N/m"]$
- $x$: indrukking van de veer $["m"]$

Zodra dat het geval is, trekt de armatuur aan, duwt de isolerende stoter het contactblad `11` mee, opent het N.C.-contact `11-12` en sluit het N.O.-contact `11-14`.

#concept(title: "Key insight")[
  Twee gevolgen van $F prop Phi^2$ die je moet kunnen uitleggen:

  + *Het relais klapt dicht.* Wordt de spleet kleiner, dan daalt $cal(R)$, stijgt $Phi$, en stijgt $F$ kwadratisch. De kracht versterkt dus zichzelf tijdens het aantrekken. Daarom schakelt een relais met een snelle klik, en daarom ligt de *afvalstroom lager dan de aantrekstroom*: eenmaal dicht heeft hij veel minder stroom nodig om dicht te blijven.
  + *Bij wisselstroom bromt het.* Omdat $F$ evenredig is met het *kwadraat* van de flux, pulseert de kracht aan het dubbele van de netfrequentie en zakt ze twee keer per periode naar nul. Dat is precies het brommen uit @sec:ac-contactoren, en de reden voor de kortsluitring.
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

== Start-stopschakeling en zelfhouding

Een relais is goedkoop en simpel, en daarom bouw je er vaak logica mee. De bekendste schakeling is de #keyterm[start-stopschakeling]. Die zit in bijna elke machine, soms als relais, soms als PLC-code.

#belangrijk[Dit is de basisschakeling van de industriële automatisering.] Het is een geheugenfunctie, gebouwd met een monostabiele component.

=== Hoe de zelfhouding werkt <sec:zelfhouding>

Kijk naar de linkertak van @fig:startstop-schema. Van de $24 "V"$-rail naar beneden staan twee takken parallel:

- de startknop `-S2`, een N.O.-drukknop;
- een hulpcontact `-K1` van het relais zelf, ook N.O.

Die twee komen samen en gaan via de stopknop `-S3` (N.C.) naar de spoel `-K1`, en dan naar $0 "V"$.

De werking volgt daaruit:

+ *In rust* is `-S2` open en `-K1` niet bekrachtigd, dus zijn hulpcontact staat open. De spoel krijgt geen spanning.
+ *Druk je op start*, dan sluit `-S2` en trekt de spoel aan. Daardoor sluit meteen ook het hulpcontact `-K1`.
+ *Laat je start los*, dan blijft de spoel bekrachtigd via haar eigen hulpcontact. Dat is de #keyterm[zelfhouding]: de schakeling onthoudt dat ze aan staat.
+ *Druk je op stop*, dan onderbreekt `-S3` de tak. De spoel valt af, het hulpcontact opent, en de schakeling blijft uit ook nadat je stop loslaat.

De rechtertak is de signaallamp `-P1`, gestuurd door een tweede N.O.-contact van `-K1`. Zo weet de operator dat de machine aan staat.

#figure(
  image("assets/OIS_startstop_schema.png", width: 12cm),
  caption: [De start-stopschakeling met signaallamp. Startknop `-S2` en het hulpcontact `-K1` staan parallel, in serie met de N.C.-stopknop `-S3` en de spoel `-K1`.],
  label: <fig:startstop-schema>,
)

#belangrijk[Elke goede oplossing keert terug naar de begintoestand.] Alleen dan geeft een tweede doorloop hetzelfde resultaat.

=== De vier regels die je moet kennen <sec:startstop-regels>

+ *Het voorkomt automatisch herstarten na spanningsuitval.* Valt de $24 "V"$ weg, dan valt de spoel af en gaat de zelfhouding open. Komt de spanning terug, dan blijft de machine uit tot iemand opnieuw op start duwt.
+ *Je kan het als noodstopkring gebruiken*, precies om die reden.
+ *Je schakelt altijd de $24 "V"$, nooit de $0 "V"$.*
+ #belangrijk[Stop heeft altijd voorrang, en een stopcontact is altijd N.C.] Duw je op start en stop tegelijk, dan wint stop. Bovendien is een N.C.-stopknop fail-safe: breekt de draad naar de stopknop, dan valt de machine stil in plaats van onstuurbaar door te draaien.

#figure(
  image("assets/OIS_startstop_11pins.png", width: 11cm),
  caption: [Praktische uitvoering met een 11-pins relais. Dezelfde logica, maar nu met de echte pennummers van het relais.],
  label: <fig:startstop-11pins>,
)

Dezelfde schakeling bouw je ook met een MY4-relais. De logica blijft identiek; alleen de klemmennummering verschilt.

#waarschuwing[
  *Zwevende spanningen.* Druk je op de stopknop, dan is het knooppunt boven die knop nergens meer mee verbonden. Dat stuk heeft dan geen referentie meer: de spanning erop is #keyterm[zwevend].

  Zo'n zwevende spanning heeft geen echte waarde. Er zitten bovendien maar weinig ladingen op, zodat die bij het meten meteen door je meettoestel weglopen. Je kan dat stuk dus niet zinvol meten.
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
  In ladder logic bouw je de logica stap voor stap op. Je gaat pas naar de volgende stap wanneer de condities van die stap *True* zijn.

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

=== N.O. en N.C. aan een PLC-ingang

Voor je begint te programmeren stel je één vraag: heeft de uitgang geheugen nodig of niet?

- *Combinatorische schakeling:* de uitgang hangt #strong[alleen] af van de huidige toestand van de ingangen. Een AND-functie bijvoorbeeld.
- *Geheugenschakeling:* de uitgang hangt óók af van wat er eerder gebeurde. De start-stopschakeling is het schoolvoorbeeld.

#belangrijk[Gebruik zo weinig mogelijk geheugens.] Neem er net genoeg om alle nodige condities te kunnen uitdrukken als combinaties van ingangen en geheugentoestanden. De reden is praktisch:

- in complexere systemen vergeet je makkelijk een toestand;
- je hebt beperkte mogelijkheden om het gedrag ná een noodstop vast te leggen;
- de oplossing wordt razendsnel te ingewikkeld.

=== Hardware N.C. tegenover software N.O. <sec:nc-hardware-software>

Neem een netwerk met twee N.O.-contacten in serie, gevolgd door een toekenning aan een uitgangsspoel. Die toekenning schrijft het #keyterm[RLO] (Result of Logic Operation) weg naar een variabele. Dat mag een uitgang of een interne merker zijn, #strong[nooit] een ingang: de toestand van een ingang wordt van buitenaf opgelegd door de drukknop die eraan hangt.

Nu de valkuil. De stopknop is in de #strong[hardware] N.C. Die variabele is dus "true" zolang je #strong[niet] duwt. Gevolg: dit netwerk geeft een actieve uitgang als je op geen enkele knop duwt, en de uitgang valt weg zodra je op één van beide knoppen duwt.

#belangrijk[Een N.C.-knop in de hardware wordt dus een N.O.-contact in je programma.] Leer dat niet vanbuiten, maar redeneer telkens opnieuw: wat staat er op de klem als niemand iets doet?

=== Start/stop als flip-flop

Dezelfde start-stopschakeling bouw je in LAD na. Twee vragen komen daarbij altijd terug.

*Waarom staat de stopknop als N.C. geconfigureerd?* Zie @sec:nc-hardware-software. Redeneer, leer het niet vanbuiten.

*Waarom zet je de uitgang niet meteen in netwerk 1?* Omdat je de logica en de uitgang gescheiden houdt. Ken het resultaat eerst toe aan een merker, de #keyterm[logische toestand van de machine]. Pas later koppel je de fysieke PLC-uitgang aan die toestand. Dat is de basisregel uit @sec:lad-basisregel.

=== De RS-flipflop opbouwen: methode 1 <sec:rs-methode1>

De directe aanpak volgt drie stappen:

+ Is #strong[set] waar, dan is de uitgang altijd waar. Aan die tak raak je daarna nooit meer.
+ Om een geheugen te maken heb je een #strong[parallelle tak] nodig die de uitgang terugkoppelt wanneer je niet aan het setten bent.
+ Om het geheugen te kunnen wissen zet je de #strong[reset] in die terugkoppeltak, zonder regel 1 te schenden.

#figure(
  image("assets/OIS_rs_flipflop_methode1.png", width: 11cm),
  caption: [De RS-flipflop via de directe aanpak: set in de eerste tak, terugkoppeling met reset in de parallelle tak.],
  label: <fig:rs-flipflop-methode1>,
)

=== De tweede oplossing: van waarheidstabel naar schema <sec:rs-methode2>

Je kan ook vertrekken van de waarheidstabel en die uitvouwen naar een schema. Let op: dat geeft een implementatie in #strong[negatieve logica].

Zo'n uitgevouwen schema is nooit meteen de eindvorm. Je vereenvoudigt in twee stappen:

+ *Duplicaten en tegengestelden wegwerken.* Termen die twee keer voorkomen, of die elkaars tegengestelde zijn, kan je samennemen.
+ *Onnodige condities schrappen.* Set activeert de uitgang sowieso, dus hoef je set niet nog eens uit te sluiten in de eerste tak.

Werk je beide stappen af, dan kom je uit op #strong[dezelfde] oplossing als met methode 1. Dat is meteen je controle: twee verschillende wegen die op hetzelfde schema uitkomen.

=== LAD-conventies en de basisregel

=== LAD-conventies <sec:lad-conventies>

- Het #keyterm[RLO] (Result of Logic Operation) is het tussenresultaat van de logische condities in een netwerk: N.O.-contact, flankdetectie, timer, enzovoort. Het is waar of niet waar.
- #belangrijk[Elk RLO moet uiteindelijk door een instructie gebruikt worden], anders breekt de compilatie af. Alle netwerken en alle parallelle takken moeten dus afgesloten zijn.
- Zet je de software in #strong[monitor], dan zie je het RLO live: een groene lijn betekent "hier is het RLO waar".
- Sommige instructies zijn #strong[voorwaardelijk] en worden alleen uitgevoerd als het RLO waar is, zoals `set` en `reset`. Een uitgangsspoel daarentegen kent de waarde van het RLO #strong[continu] toe aan de variabele.

=== De basisregel: I $arrow.r$ M $arrow.r$ Q <sec:lad-basisregel>

#belangrijk[Splits je software in twee delen.]

+ *I $arrow.r$ M.* Eerst leg je de #keyterm[logische toestanden van de machine] vast. Je koppelt de ingangen en andere logische toestanden aan variabelen, meestal merkers. Bij een sequentie doe je dat heel expliciet, maar het is altijd goede praktijk.
+ *M $arrow.r$ Q.* Pas daarna bepaal je de toestand van elke uitgang.

Meerdere toestanden mogen naar dezelfde uitgang verwijzen, dat is geen probleem. Er mogen zelfs meerdere sequenties dezelfde uitgangen gebruiken.

#belangrijk[Schrijf elke uitgang op precies één plaats in je programma.] Programmeer de uitgangen bovendien in de numerieke volgorde waarin de kabels aangesloten zijn. Zo kan je onmogelijk twee keer dezelfde uitgang aansturen zonder het te merken.

=== Combinatorische en geheugencircuits programmeren

De vraag is hoe je de logische toestanden van de machine programmeert. De werkwijze:

+ Analyseer de opdracht en herken wat er geprogrammeerd moet worden. #belangrijk[Splits de opdracht op in de kleinst mogelijke stukken.]
+ Formuleer elk stuk als een #strong[ja/nee-vraag] in het commentaarveld van het netwerk. De code in dat netwerk geeft dan het antwoord op die vraag.
+ Zo valt de oplossing vanzelf uiteen in kleine, leesbare netwerken.

Het voordeel: je software is meteen gedocumenteerd. Je hoeft achteraf geen commentaar meer toe te voegen, en documentatie verhoogt de waarde van je product.

=== De standaardnetwerken <sec:standaardnetwerken>

Je bouwt logica bijna altijd met dezelfde blokken:

- combinatorische schakelingen, soms met flankdetectie;
- de SR-flipflop (RS en het impulsrelais zijn zeldzaam);
- de IEC TON-timer, soms als oscillator: de uitgang wordt als N.C.-conditie teruggekoppeld, waardoor de timer zichzelf na één scan uitschakelt en in de volgende scan herstart;
- de IEC-teller, met flankdetectie al ingebouwd achter de telingangen;
- waarde-instructies: math, compare, convert, move. Let op dat math-instructies vaak een flankdetectie ervóór nodig hebben.

#oefening(title: "Voorbeeldopdracht uit de slides")[
  *Opdracht 1.* Een machine wordt bediend met twee drukknoppen, start en stop. De machine moet starten wanneer iemand de startknop #strong[minstens twee seconden] ingedrukt houdt. Wordt stop gedrukt, dan stopt de machine onmiddellijk, wat er ook aan de hand is. Er is één uitgang: de signaallamp die toont dat de machine aan staat.

  *Denkstap.* Splits op in ja/nee-vragen:
  - "Is de startknop lang genoeg ingedrukt?" $arrow.r$ TON-timer op de startingang.
  - "Moet de machine aan staan?" $arrow.r$ SR-flipflop, met de timeruitgang als set en de stopknop als reset. Reset krijgt voorrang, want stop moet altijd winnen.
  - "Welke uitgang hoort daarbij?" $arrow.r$ apart netwerk, merker naar signaallamp.

  Denk eraan hoe je een stopknop simuleert: in de hardware N.C., dus in je programma een N.O.-contact.

  *Opdracht 2.* Zelfde opdracht, maar operatoren saboteren de startknop door hem met een balletje en tape ingedrukt te houden. Je moet dus detecteren dat de knop #strong[opnieuw] ingedrukt wordt in plaats van gewoon ingedrukt #strong[staat]. Daarvoor gebruik je flankdetectie.
]

== Sequenties programmeren

Een #keyterm[sequentie] is de manier om een programma te schrijven dat cyclisch verloopt. Denk aan een robot die telkens een plaat optilt en hoger neerlegt.

#belangrijk[De eerste vraag bij elk programma is: "is er een sequentie?"] Is het antwoord ja, dan gebruik je de sequentiemethode. Is het nee, dan programmeer je combinatorische en geheugencircuits zoals hierboven.

=== De vier vaste delen <sec:sequentie-delen>

Elke sequentie heeft dezelfde opbouw:

+ *Initialisatie.* Je zet alles op de juiste waarde. Meestal betekent dat: alle merkerwoorden die de sequentie gebruikt op nul zetten met een `MOVE`-instructie, en de hoofdsequentie starten met een `set` naar stap 0.
+ *Hulpmerkers.* Hier zet je de timers en counters, en alles wat de hoofdsequentie nodig heeft. Het doel is de sequentie #strong[leesbaar] houden: moeten er veel logische toestanden nagekeken worden, zet die dan hier.
+ *Sequentie.* Het hoofddeel. Je definieert elke stap aan de hand van de logische toestand van de machine.
+ *Uitgangen.* Je koppelt elke uitgang aan de stappen waarin ze actief moet zijn.

=== Stappen <sec:sequentie-stappen>

#belangrijk[Een stap is het kleinst mogelijke stuk van het proces.] Teken eerst met de hand een SFC op papier, nummer en benoem de stappen, en #strong[vermijd daarbij uitgangsnamen] als stapnaam. Een stap is een toestand van de machine, geen uitgang.

Elke stap krijgt een SR-flipflop. Aan de set-ingang staat de sensor die aangeeft dat de vorige stap klaar is; de volgende stap reset de huidige. Zo hang je de stappen aan elkaar volgens het patroon #strong[vorige / huidige / volgende]. De structuur loopt van stap 0 tot een bepaalde stap en dan terug naar stap 0.

De eerste doorloop is bijzonder. Dan sla je stap 0 over, want je moet op een andere manier controleren of de machine wel in de juiste logische toestand staat. Dat kan op twee manieren:

+ *Initialisatiesequentie:* je kijkt alles na en zet dan `MWx.0` hoog. Dat betekent dat stap 0 uitgevoerd is en stap 1 mag beginnen.
+ *Variabelen nakijken:* hetzelfde idee, maar buiten de sequentie. Meestal kijk je dan naar meer variabelen, bijvoorbeeld ook naar de startknop.

Werk het voorbeeld uit de slides zo strikt mogelijk na, en maak je netwerken met copy-paste zodat de structuur overal identiek blijft. Vergeet de initiële stap niet toe te voegen.

=== Uitgangen programmeren <sec:sequentie-uitgangen>

#belangrijk[Een uitgang is altijd een som van logische toestanden.] Wil je meerdere stappen optellen, dan gebruik je een OR-netwerk. Er zijn drie gevallen:

- de uitgang is actief tijdens #strong[opeenvolgende] stappen;
- de uitgang is actief in #strong[niet-opeenvolgende] stappen;
- de uitgang is actief in #strong[één enkele] stap.

=== Cross-protect op Q <sec:cross-protect>

Sommige uitgangen mogen absoluut niet tegelijk actief zijn. Het klassieke voorbeeld: de contactor voor rechtsom en die voor linksom. Trekken die samen aan, dan heb je een kortsluiting.

In zo'n geval zet je vlak vóór de spoel een extra conditie. Is de ene uitgang actief, dan blokkeert die de andere. Dat heet #keyterm[cross-protect].

#figure(
  image("assets/OIS_cross_protect.png", width: 11cm),
  caption: [Cross-protect op de uitgangen: een extra conditie vlak voor de spoel verhindert dat twee uitgangen die elkaar uitsluiten samen actief worden.],
  label: <fig:cross-protect>,
)

#waarschuwing[
  *Een stap kan één scan duren.* Is de conditie voor de volgende stap al waar op het moment dat de huidige stap actief wordt, dan worden ze samen geactiveerd. De huidige stap is dan maar één scan actief, dus typisch $2$ tot $20 "ms"$.

  Soms wil je dat de uitgang toch even actief wordt: programmeer dan de stap als conditie voor die uitgang. Soms wil je ze juist overslaan, bijvoorbeeld om slijtage te vermijden.
]

=== De ADD-sequentie <sec:add-sequentie>

Naast de SR-implementatie bestaat er een variant die met een `ADD`-instructie werkt. De opbouw in netwerken:

- *Netwerk 1:* hulpmerkers, meestal meerdere netwerken.
- *Netwerk 2:* de `ADD` zelf, die het stapnummer ophoogt.
- *Netwerk 3:* de sequentie starten.
- *Netwerk 4:* de sequentie vrijgeven, oftewel de idle-stap zetten. De laatste stap $+ 1$ hernummer je als $255$.
- *Netwerk 5:* de sequentie wissen of blokkeren. De fysieke knop is N.C., dus staat hier ook een N.C.-contact.
- *Netwerk 6 en verder:* de uitgangen, per geval zoals hierboven.

*Waarom `ADD` en niet de counter-instructie?* Omdat de start in een apart netwerk staat, blijft de hoofdsequentie schoon en leesbaar.

Vaak bouw je er een standaard tijdvertraging in die synchroon loopt met de stapovergangen.

=== Clear, enable en start <sec:clear-enable-start>

Drie begrippen die je uit elkaar moet houden:

- *Clear:* de machine is schoon en kan niet gestart worden. Alle sensoringangen worden genegeerd.
- *Enabled:* klaar om gestart te worden.
- *Start:* de sequentie loopt.

=== Reactie op de bedieningsknoppen <sec:machinebediening>

De slides zetten de typische machinetoestanden op een rij:

- *Abort:* de machinesturing valt plots weg, bijvoorbeeld door spanningsuitval, de hoofdschakelaar uit, of een slecht ontworpen noodstop. #belangrijk[De PLC heeft de machine dan niet meer onder controle.]
- *E-stop:* categorie 0, of categorie 1 met eerst gecontroleerd afremmen. Het vermogen wordt onmiddellijk van de machine gehaald. De PLC is wél nog actief, maar de meeste actuatoren zijn uitgeschakeld.

Het verschil telt: bij een abort weet je niets meer over de toestand van de machine, bij een noodstop weet je dat nog wel.

== Functies (FC) en functieblokken (FB)

=== De norm IEC 61131-3 <sec:iec61131>

IEC 61131-3 is de norm voor het programmeren van PLC's. Ze beschrijft:

- de #keyterm[POU]'s (Program Organization Units): OB, FC en FB;
- de talen: LAD, FBD, STL (IL), SCL (ST) en SFC;
- de mogelijke datatypes;
- de standaardfuncties zoals de IEC-timer en de IEC-counter;
- de softwaremodellen: de opdeling in configuratie (bv. de machine), resource (de PLC) en task (cyclische verwerking). Tasks bestaan uit POU's, en objectgeoriënteerd programmeren is toegelaten.

=== Gepartitioneerd tegenover gestructureerd <sec:gepartitioneerd-gestructureerd>

Een functie (FC of FB) is een verzameling logische netwerken. Er zijn twee manieren om ze te gebruiken:

- *Gepartitioneerd:* je roept het blok #strong[één keer] op en werkt met globale variabelen. Je gebruikt de functie dan puur om je programma op te delen.
- *Gestructureerd:* je roept het blok #strong[meerdere keren] op, met lokale variabelen en parameters. Dat volgt het OOP-principe van inkapseling: hetzelfde blok, andere gegevens.

=== FC tegenover FB <sec:fc-vs-fb>

#table(
  columns: (auto, 1fr, 1fr),
  align: (left, left, left),
  stroke: none,
  inset: 6pt,
  table.hline(stroke: 1pt),
  table.header([], [*Functie (FC)*], [*Functieblok (FB)*]),
  table.hline(stroke: 0.5pt),
  [Geheugen], [#strong[geen], enkel temps en constanten], [#strong[wel], opgeslagen in een instance-DB],
  [Beginwaarden], [niet mogelijk], [mogelijk],
  [Parameters], [onbeperkt in-, uit- en in/uitgangen], [onbeperkt in-, uit- en in/uitgangen],
  [Gedrag], [zelfde ingangen geven altijd zelfde uitgang], [uitgang hangt ook van de opgeslagen toestand af],
  table.hline(stroke: 1pt),
)

Volg je de norm strikt, dan gebruik je in een FC #strong[geen] globale variabelen en geen absolute operanden. Dat is precies wat een FC voorspelbaar maakt: dezelfde ingangen leveren altijd hetzelfde resultaat.

=== Formele parameters <sec:formele-parameters>

De lokale variabelen van een FC of FB heten #keyterm[formele parameters]. De variabelen die je bij het oproepen meegeeft zijn de #keyterm[actuele parameters].

- *IN:* vóór de code in het blok uitgevoerd wordt, wordt de waarde van de actuele parameter ingelezen en toegekend aan de formele parameter. #belangrijk[Schrijf nooit naar een IN.]
- *OUT:* ná het uitvoeren van de code worden de waarden van de OUT-parameters weggeschreven naar de gekoppelde actuele parameters. Let op: de data in die gekoppelde variabele wordt #strong[altijd] overschreven met wat er binnen het blok beschikbaar was.

=== Timers en counters in een FC of FB <sec:timer-datatypes>

Volgens EN 61131 gebruik je #belangrijk[geen geheugen of timers in een FC]. Wil je toch een timer, dan heb je twee opties: hem als IN definiëren, of, beter, een eigen instance-DB per timer aanmaken.

In een FB kan dat ook, maar het is niet verstandig. #belangrijk[De beste praktijk in een FB is timers als static in de instance-DB zetten], als multi-instance.

Als datatype gebruik je `IEC_timer`, of gewoon de naam van de instructie, bijvoorbeeld `TON`. TIA kent nog andere types, maar die vallen buiten dit vak. In de PLC zelf werk je met `Time` en `DWord`.

#waarschuwing[
  *Rekenen met tijdswaarden.* Wil je bijvoorbeeld een toerental uit een periodetijd halen, dan sla je de actuele tijd op in een static en vermenigvuldig je het aantal perioden met $60000$ om rpm te krijgen. Grotere waarden geven een nauwkeuriger resultaat.

  Denk eraan dat een flankdetectie een #strong[statische] merkerbit nodig heeft. In een FC bestaat die niet, dus daar werkt flankdetectie niet zonder instance-DB.
]
