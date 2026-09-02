// chapter1_inleiding.typ
// Eerste hoofdstuk - Inleiding
// Dit bestand wordt geladen via #include "chapters/chapter1_inleiding.typ"

#import "../../school-template.typ": *

= Imports en Exports <chap:imports>

Een land haalt zijn welvaart uit *export*: produceren en verkopen buiten de landsgrenzen. Wat je zelf niet maakt, moet je importeren. Maar slechts een deel van de beroepsbevolking draagt daar rechtstreeks aan bij; zorg, onderwijs en overheid houden het systeem draaiend zonder zelf te exporteren.

Een land haalt zijn welvaart uit *export*. Loonkosten liggen in West-Europa hoog, dus is *automatisering* de enige manier om lokaal te blijven produceren tegen een concurrerende prijs.

#wrap-figure(
  image("assets/Geld binnen en buiten.png", width: 10cm),
  caption: [De pijlhoogte is de waarde van het product: grondstoffen komen laag binnen en gaan hoog buiten. Dat verschil is het enige dat geld binnenbrengt.],
  label: <fig:geldbinnenenbuiten>,
)[
  Je haalt grondstoffen binnen en verhoogt hun waarde door productie. *Productie* is dus het enige dat geld binnenbrengt, en daarom kan je ze niet stilleggen.

  Een industrieel ingenieur *standaardiseert* die lijn: documentatie, standaardcomponenten, vaste werkwijzen. Wie het systeem twintig jaar later beheert, moet er nog aan uit kunnen.


#concept(title: "IT en OT")[
  OT = Operational Technology
  IT = Information Technology

  In de OT mag niets stilvallen en rekenen we op een levensduur van 20 tot 30 jaar. In de IT mag een website al eens platliggen.
]
]
== NIS2 <sec:nis2>

#keyterm[NIS2] (richtlijn EU 2022/2555) verplicht middelgrote en grote bedrijven in kritieke sectoren --- energie, transport, productie --- tot strengere beveiligings- en meldingsmaatregelen tegen cyberaanvallen.

De OT hangt intussen aan het netwerk en is dus aanvalbaar. Na een aanval is maar $35 %$ van de bedrijven binnen een week weer operationeel, en $34 %$ heeft na een maand nog problemen. De aanvalsvlakken: het maakproces zelf (diefstal van intellectuele eigendom, manipulatie van betalingen) en de cloudkant (op afstand ingrijpen).

== Ontwerp doelstellingen

Vier doelen sturen elke keuze in dit vak:

- / Betrouwbaar: robuuste componenten, stevige constructie, aandacht voor EMC en IP-graad.
- / Twintig jaar te ondersteunen: componenten die de fabrikant lang blijft leveren, plus bijgehouden documentatie.
- / Snel te herstellen: één type component, één methodiek, één taal (LAD) over al je machines. Insteekbare componenten, en onderdelen binnen twee uur leverbaar.
- / Goedkoop en flexibel: kant-en-klare oplossingen, tijd in wat klantspecifiek is, modulair werken.

== Basisdiagram van een geautomatiseerd systeem

#figure(
  image("assets/basisdiagram.png", width: 15cm),
  caption: [Het basisdiagram van elke geautomatiseerde machine. Links de operator, rechts de machine, in het midden de controller. De operator geeft commando's en krijgt informatie terug; de machine levert sensorsignalen en ontvangt actuatorcommando's.],
  label: <fig:basisdiagram>,
)

Elk geautomatiseerd systeem heeft twee soorten aansluitingen op de controller:

- / Inputs: _controle-ingangen_ (knoppen, schakelaars) en _sensorsignalen_ (eindschakelaars, druksensoren).
- / Outputs: _actuatoren_ (motoren, kleppen, cilinders) en _visualisatie_ (pilot lamps, HMI-schermen).

=== Logische sturing (aan/uit)

Logic control werkt met *discrete signalen*: aan (1) of uit (0).

- / Veel digitale signalen: drukknoppen, eindschakelaars, lampen, relais, contactoren, ventielen. Elk heeft twee toestanden.
- / $24 "VDC"$ als standaard voor digitale I/O: veilig voor de operator, compatibel met de meeste PLC-modules.
- / Hardware: PLC's, relaisschakelingen en (elektro-)pneumatische systemen.
- / Sequenties: stap na stap, elke stap afhankelijk van de vorige. Klemmen, boren, loslaten.

=== Regeltechniek (PID-controllers)

Een PID-controller werkt met *continue, analoge signalen*: hij meet een proceswaarde en stuurt bij naar een setpoint.

- / Eén analoge in- en uitgang: één meetwaarde, één actuator. Tegenover tientallen digitale signalen bij logic control.
- / Signaalbereiken: $0"–"20"mA"$, $4"–"20"mA"$ (meest gebruikt, want $0 "mA"$ wijst op een kabelfout), $0"–"10"V"$ en $-10"–"+10"V"$.
- / Temperatuursensoren: *Pt100* en *Pt1000* voor lage temperaturen, *thermokoppels* voor hoge.
- / Temperatuurregelaar: doet de PID-logica zelf, zonder PLC.

#wrap-figure(
  image("assets/automatisering pyramide.png", width: 10cm),
  caption: [De automatiseringspiramide. Onderaan het veld met sensoren en actuatoren, daarboven de PLC, dan SCADA voor visualisatie, en bovenaan MES en ERP voor planning.],
  label: <fig:automatiseringpyramide>,
)[
  De PLC hangt rechtstreeks aan de sensoren en doet de logica. Alles wat meerdere stappen doorloopt, jarenlang moet werken en vervangbaar moet zijn, doe je met een PLC.


== Een geschikt controlesysteem kiezen <sec:controlesysteem-kiezen>

Applicatie, omgeving en complexiteit bepalen de keuze:

- *Mechanische sturing (nokkenschijf, CAM)*: betrouwbaar en snel voor een vast repetitief patroon, bv. bouten en schroeven.
- *Pneumatische logica*: vonkvrij, dus voor ATEX-zones of natte omgevingen.
]

  #figure(
    image("assets/pneumatische controller.png", width: 8cm),
    caption: [Een zuiver pneumatische controller: de logica zit in de ventielen zelf, dus er is nergens een vonk.],
    label: <fig:pneumatischecontroller>,
  )
- *Hardwired relaislogica*: voor eenvoudige schakelingen. Boven 3 à 4 stappen zakt de betrouwbaarheid door het aantal contacten en bedradingspunten.
  #figure(
    image("assets/mechanicaltoolrelays.png", width: 8cm),
    caption: [Machine tool relaispaneel: klassieke sequentiële hardwired relaislogica.],
    label: <fig:mechanicaltoolrelays>,
  )
- *Programmeerbaar relais*: kleinschalig, bv. poortsturing en verlichting.
- *PLC*: de industriële standaard. Vanaf $4$ stappen de aangewezen keuze, zie @sec:relais-vs-plc.
- *IPC*: real-time besturing plus zwaardere dataverwerking, vision en database.
- *CNC- en robotcontrollers*: meer-assige interpolatie en trajectplanning.
- *LabVIEW*: labo- en testopstellingen.
- *SCADA*: visualisatielaag boven meerdere PLC's; verzamelt trends en logt alarmen.
  #figure(
    image("assets/Scada.png", width: 7cm),
    caption: [SCADA-systeem: centrale procesvisualisatie en data-acquisitie],
    label: <fig:Scada>,
  )
- *PCS (Process Control System)*: Softwareomgeving die de sturing van een hele fabriek als één geheel beheert, met één centrale tagdatabase. Het is meteen ook een SCADA-systeem.
- *DCS (Decentralized Control System)*: Een PCS dat op #strong[gedecentraliseerde] controllers steunt, bijvoorbeeld PLC's, zodat één enkel faalpunt niet de hele fabriek stillegt. Bij voorkeur is het redundant, met verdubbelde controllers; na vervanging synchroniseert het DCS de software en neemt de controller zijn rol weer op.


== Industrie 4.0 <sec:industrie40>

De vier industriële revoluties:

+ *Industrie 1.0*: Mechanisatie door water- en stoomkracht.
+ *Industrie 2.0*: Massaproductie en lopende band via elektrische energie.
+ *Industrie 3.0*: Automatisering door elektronica, computers, PLC's en IT.
+ *Industrie 4.0*: Cyber-Physical Systems (CPS), Internet of Things (IoT), cloud computing, digital twins en AI.

#concept(title: "De vier ontwerpprincipes van Industrie 4.0")[
  - *Interconnectie*: machines, sensoren en mensen communiceren via industriële netwerken en IoT.
  - *Informatietransparantie*: digital twins en real-time sensordata geven een actueel beeld van de productie.
  - *Technische assistentie*: dashboards en augmented reality voor de operator, robots voor het zware werk.
  - *Decentrale besluitvorming*: cyber-fysieke systemen beslissen zelf; de mens komt er alleen bij uitzonderingen aan te pas.
]

#examenbox[Ken de vier ontwerpprincipes, en hoe een digital twin bijdraagt aan de informatietransparantie.]


== RDS Reference Designation System: hoe benoem je componenten?


#figure(
  image("assets/klassesRDS.png", width: 15cm),
  caption: [De RDS-klassecodes uit ISO/IEC 81346-2: elke letter staat voor wat het component *doet*, bijvoorbeeld `Q` voor schakelen van een energiestroom en `S` voor het omzetten van een menselijke handeling in een signaal.],
  label: <fig:klassesRDS>,
)

Je deelt componenten in *klassen* in. Elke klasse heeft een letter die zegt welke functie het component vervult, één per aspect (EN 81346).

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

Bestaat er een component voor een functie, gebruik dat dan in plaats van het zelf te bouwen: heb je een timer nodig, neem een timer, geen teller met omwegen. Beperk ook het aantal verbindingen, want elke draad is een kans op een fout.

#concept(title: "Drie soorten logische problemen")[
  / Combinatorisch: de uitgang volgt rechtstreeks uit de *huidige* waarden aan de ingang. Bv. een AND-functie.
  / Geheugenschakeling (binair geheugen): de uitgang hangt niet alleen af van de huidige ingang, maar ook van de toestand *voorheen*. Bv. Start/Stop.
  / Sequentie: opeenvolgende stappen, elke stap volgend uit de vorige op basis van sensorinput, tijd of voltooide acties. Bv. pick-and-place: grijpen $arrow.r$ bewegen $arrow.r$ lossen.
]

Geheugens maken een systeem snel complex: je vergeet toestanden en het gedrag na een noodstop wordt onoverzichtelijk. Voeg er dus *zo weinig mogelijk* toe.

== Knoppen en schakelaars <sec:knoppen-schakelaars>

De letters volgen de RDS-afspraak: `Q` voor de hoofdschakelaar, `S` voor bedieningsknoppen, `K` voor relais, `P` voor een signaallamp en `E` voor gewone verlichting.

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

/ Push button (momentary): drukken en loslaten. Zit meestal in een beschermende kraag.
/ Detent switch (latching): blijft ingedrukt tot je opnieuw duwt.
/ Keuze- of draaischakelaar: blijft in zijn stand staan, tijdelijk of vergrendeld.
/ Pilot lamp: terugkoppeling naar de operator.

#wrap-figure(
  image("assets/hoofdschakelaar-Q1.png", width: 4.5cm),
  caption: [Hoofdschakelaar `-Q1`: één bediening, meerdere draden],
  label: <fig:hoofdschakelaar-Q1>,
  width: 4.5cm,
)[
  Bij de *hoofdschakelaar* hangen aan één bediening verschillende draden die gelijktijdig schakelen, samen onder één naam: `-Q1`.

  In de industrie verkies je *knoppen boven schakelaars*. Een schakelaar kan in een onveilige stand blijven staan: valt de stroom uit en komt hij 's nachts terug, dan start een verkeerd staande schakelaar de machine opnieuw. Een knop vraagt een bewuste handeling. De combinatie is gebruikelijk: eerst de schakelaars zetten, dan op de knop duwen.
]

#wrap-figure(
  image("assets/Voorbeeld circuit.png", width: 5cm),
  caption: [Twee N.O.-schakelaars in serie],
  label: <fig:voorbeeldcircuit>,
  width: 3.5cm,
  align: left,
)[
  Hoe je tekent, bepaalt de functie. Op @fig:voorbeeldcircuit staan `-S1` en `-S2`, beide N.O., in serie met lamp `-P1`: beide moeten sluiten, dus een EN-functie in hardware. #strong[Parallel] wordt het een OF, en een N.C.-uitvoering geeft de NIET.

  Een *volt-free contact* levert zelf geen stroom of spanning; het opent of sluit enkel een verbinding. Een gewone lichtschakelaar is er zo een.

  #belangrijk[Onthouden wat er eerder gebeurde lukt niet met contacten alleen]; daarvoor is de zelfhoudschakeling uit @sec:zelfhouding nodig.

  De nummering verraadt het type: `3-4` is N.O., `1-2` is N.C.
]


== Contactoren <sec:contactoren>

Voor *vermogen* — een driefasige motor, een verwarmingskring — gebruik je een *contactor*: een elektrisch gestuurd schakelelement voor hoge en inductieve stromen. Een zwaardere versie van een relais.

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
  *Polen* is het aantal schakelcontacten, *throw* of *way* het aantal geleidende standen. Eén lamp die je tussen bron A óf B schakelt is één circuit (*Single Pole*) met twee standen (*Double Throw*): een *SPDT*.

  De volgorde telt. Bij *break before make* verbreekt het oude contact eerst, dus zijn de twee bronnen nooit verbonden. *Make before break* doet het omgekeerd, voor een kring die nooit onderbroken mag worden.
]

=== Hoofdcontacten en hulpcontacten

#wrap-figure(
  image("assets/contactor-symbool.jpeg", width: 6.5cm),
  caption: [Contactor `-Q`: spoel A1/A2, drie hoofdcontacten (1/2, 3/4, 5/6) en twee hulpcontacten (11/12 N.C., 23/24 N.O.)],
  label: <fig:contactor-symbool>,
  width: 6.5cm,
)[
  Een contactor heeft meestal *drie hoofdcontacten* voor de drie fasen, zo goed als altijd N.O. Ze zijn bestand tegen zware belasting en breken op *twee punten* tegelijk, zodat het tussenstuk spanningsloos zweeft en de vlamboog sneller dooft.

  Daarnaast zitten er *hulpcontacten* op, herkenbaar aan de nummering *boven de 10*. Die schakelen geen vermogen maar *signaleren* de toestand van de contactor: zelfhouding, terugmelding naar de PLC, signaallamp. N.O. of N.C.
]

Een contactor is *monostabiel*: valt de spoelspanning weg, dan valt hij af. De spoelspanning staat los van de contactspanningen: een spoel van $24 "VDC"$ stuurt gerust hoofdcontacten van $400 "VAC"$ aan.

=== Opletten bij inductieve belastingen

Een contactor schakelt meestal *inductieve* belastingen, en daar zitten twee valkuilen.

+ *Inschakelen*: een asynchrone motor trekt een veelvoud van zijn nominale stroom. Dimensioneer de contactor op de belasting die hij schakelt, niet op het nominale vermogen.
+ *Uitschakelen*: de stroom door een spoel stopt niet plots ($u = L (Delta I) \/ (Delta t)$). Er wordt een vlamboog getrokken die de contacten wegbrandt, de belangrijkste slijtageoorzaak.

=== Spanningspieken op de stuurzijde <sec:snubbers>

Bij het openen van het contact moet de spoel haar magnetische energie kwijt, en volgens

$ v = L (dif i) / (dif t) $

met:
- $v$: geïnduceerde spanning over de spoel [V]
- $L$: zelfinductie van de spoel [H]
- $(dif i) / (dif t)$: snelheid waarmee de stroom verandert [A/s]

loopt die spanning hoog op zodra $dif t$ naar nul gaat. Relais en contactoren geven daardoor #keyterm[spanningspieken] aan de stuurzijde, en vlambogen en dender aan de contactzijde. Een SSR of optocoupler (@sec:ssr-optocoupler) heeft geen bewegend deel en dus geen van beide.


=== AC-contactoren: wervelstromen en brommen <sec:ac-contactoren>

In de praktijk zie je vooral AC-contactoren, en die hebben twee bijkomende problemen.

*Wervelstromen.* De wisselende flux wekt *wervelstromen* op in het massieve ijzer van de kern, die de kern verwarmen en energie kosten. Oplossing: een *gelamineerde* kern van dunne, onderling geïsoleerde staalplaatjes, zodat de wervelstromen geen rondgaand pad meer vinden.

#figure(
  image("assets/ac-contactor-spoelring-flux.jpeg", width: 12cm),
  caption: [AC-contactor met kortsluitring. Geel is de kracht zonder ring (zakt tot nul), blauw en oranje zijn de twee fasenverschoven fluxen, grijs is hun som, en de horizontale lijn is de veerkracht.],
  label: <fig:ac-contactor-spoelring>,
)

*Brommen.* De aantrekkingskracht is evenredig met $Phi^2$. Bij AC gaat de flux twee keer per periode door nul, dus zakt ook de kracht twee keer per periode naar nul. Duikt ze onder de veerkracht, dan laat het anker los en slaat opnieuw aan: bij $50 "Hz"$ honderd keer per seconde. Dat hoor je, en het brandt de contacten in.

De oplossing is een *kortsluitring* rond een deel van het poolvlak. De veranderende flux induceert er een stroom in die de fluxverandering tegenwerkt (wet van Lenz), waardoor de flux door dat deel achterloopt op de hoofdflux. Op @fig:ac-contactor-spoelring zakt hun som (grijs) nooit meer tot nul.

_Laminatie lost de wervelstromen op, de kortsluitring het lostrillen. Twee problemen, twee oplossingen._

== Relais <sec:relais>

#wrap-figure(
  image("assets/Relay.png", width: 7cm),
  caption: [Doorsnede van een relais],
  label: <fig:Relay>,
  width: 7cm,
)[
  Een *relais* (letter `K`) werkt als een contactor, maar voor *signalen* in plaats van vermogen.

  Een stroom $I$ door de spoel (klemmen A1 en A2) wekt een *magnetomotorische kracht* (mmf) op, en die drijft een flux $Phi$ door de zachtijzeren kern. Die flux volgt het pad met de kleinste *reluctantie*, dus het ijzer en niet de lucht.

  Waar de flux een luchtspleet oversteekt, ontstaan tegengestelde polen die de bewegende *armatuur* aantrekken en de contacten omzetten. Door dat bewegende deel is een relais niet geschikt voor hoge schakelfrequenties.
]

=== Van stroom tot contact: de krachtketen <sec:krachtketen>

Van stroom naar kracht, elke schakel met zijn eigen formule.

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

*Stap 1: de stroom maakt een magnetomotorische kracht.* Niet de stroom alleen telt, maar de stroom maal het aantal windingen.

$ cal(F) = N dot I $

met:
- $cal(F)$: magnetomotorische kracht (mmf), soms genoteerd als $Theta$ $["A"]$, in de praktijk "ampèrewindingen"
- $N$: aantal windingen van de spoel $[-]$
- $I$: stroom door de spoel, tussen de klemmen A1 en A2 $["A"]$

*Stap 2: de mmf drijft een flux.* De *wet van Hopkinson*, de magnetische tegenhanger van Ohm: mmf als spanning, flux als stroom, reluctantie als weerstand.

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

Zacht ijzer heeft $mu_r$ van enkele duizenden, lucht $mu_r = 1$. Een spleet van een halve millimeter weegt dus zwaarder dan centimeters ijzer: de spleet is het knelpunt.

*Stap 4: de flux over de spleet levert de kracht.* Aan weerszijden van de spleet ontstaan tegengestelde polen die elkaar aantrekken.

$ F_"mag" = frac(Phi^2, 2 mu_0 A) = frac(B^2 A, 2 mu_0) $

met:
- $B = Phi slash A$: magnetische inductie in de luchtspleet $["T"]$
- $A$: oppervlakte van één poolvlak $["m"^2]$
- $mu_0 = 4 pi dot 10^(-7)$: permeabiliteit van het vacuüm $["H/m"]$

Dat is de kracht *per poolvlak*; op @fig:relais-krachten zijn er twee spleten, dus telt ze dubbel.

*Stap 5: kracht tegen veerkracht.* De armatuur beweegt pas wanneer de magnetische kracht de terugstelveer overwint:

$ F_"mag" > F_"veer" = k dot x $

met:
- $k$: veerconstante $["N/m"]$
- $x$: indrukking van de veer $["m"]$

De armatuur trekt dan aan, de isolerende stoter duwt contactblad `11` mee, `11-12` (N.C.) opent en `11-14` (N.O.) sluit.

#concept(title: "Twee gevolgen van $F prop Phi^2$")[
  + *Het relais klapt dicht.* Kleinere spleet $arrow.r$ lagere $cal(R)$ $arrow.r$ hogere $Phi$ $arrow.r$ kwadratisch hogere $F$. De kracht versterkt zichzelf tijdens het aantrekken, vandaar de klik. Daarom ligt de *afvalstroom lager dan de aantrekstroom*.
  + *Bij wisselstroom bromt het.* De kracht pulseert aan het dubbele van de netfrequentie en zakt twee keer per periode naar nul: het brommen uit @sec:ac-contactoren.
]

#wrap-figure(
  image("assets/nc-relais-symbool.png", width: 4cm),
  caption: [Relais met wisselcontact: spoel A1/A2, contact 11-12 (N.C.) en 11-14 (N.O.)],
  label: <fig:nc-relais-symbool>,
  width: 4cm,
  align: left,
)[
  De contacten kunnen N.O. of N.C. zijn. De streepjeslijn verbindt de spoel mechanisch met het contact: zo zie je in een schema welk contact bij welke spoel hoort.

  Uitzondering op de monostabiele werking: *latching relais* of *teleruptoren* houden hun stand zonder dat de spoel bekrachtigd blijft.
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

#examenbox[Je moet uit een fabrikantsblad het juiste relais kunnen halen, N.C. en N.O. herkennen, en daarmee een start-stopschakeling aansluiten.]

== Start-stopschakeling en zelfhouding

#belangrijk[De #keyterm[start-stopschakeling] is de basisschakeling van de industriële automatisering]: een geheugenfunctie, gebouwd met een monostabiele component. Ze zit in bijna elke machine, soms als relais, soms als PLC-code.

=== Hoe de zelfhouding werkt <sec:zelfhouding>

Kijk naar de linkertak van @fig:startstop-schema. Van de $24 "V"$-rail naar beneden staan twee takken parallel:

- de startknop `-S2`, een N.O.-drukknop;
- een hulpcontact `-K1` van het relais zelf, ook N.O.

Die twee komen samen en gaan via de stopknop `-S3` (N.C.) naar de spoel `-K1`, en dan naar $0 "V"$.

De werking volgt daaruit:

#wrap-figure(
  image("assets/OIS_startstop_schema.png", width: 7cm),
  caption: [Klassieke start-stopschakeling met zelfhouding en signaallamp],
  label: <fig:startstop-schema>,
)[
  + *In rust*: `-S2` open en spoel `-K1` stroomloos. Hulpcontact `-K1` staat open.
  + *Starten*: Drukken op startknop `-S2` bekrachtigt spoel `-K1`. Het N.O.-hulpcontact sluit direct.
  + *Zelfhouding*: Bij het loslaten van `-S2` blijft `-K1` bekrachtigd via zijn eigen hulpcontact parallel aan `-S2`.
  + *Stoppen*: Drukken op N.C.-stopknop `-S3` onderbreekt de stroomkring; `-K1` valt af en de zelfhouding opent.
  + De rechtertak stuurt signaallamp `-P1` via een tweede N.O.-contact.
]

=== De vier basisregels van de start-stopkring <sec:startstop-regels>

#wrap-figure(
  image("assets/OIS_startstop_11pins.png", width: 6.5cm),
  caption: [Praktische bedrading met een 11-pins industrieel relais],
  label: <fig:startstop-11pins>,
)[
  + *Onderspanningsbeveiliging*: Valt de stuurspanning ($24 "V"$) weg, dan valt het relais af. Bij terugkeer van de spanning herstart het systeem nooit automatisch.
  + *Geschikt voor veiligheidskringen*: Fail-safe werking bij spanningsuitval.
  + *Polariteit*: Schakel altijd de $+24 "VDC"$-zijde, nooit de $0 "VDC"$.
  + *Voorrang voor stop*: Stopknop `-S3` is altijd Normaal Gesloten (N.C.) en staat in serie vóór de starttak (draadbreuk = veilige stilstand).
]

Met een MY4-relais blijft de logica identiek; alleen de klemmennummering verschilt.

#waarschuwing[
  *Zwevende spanningen.* Druk je op de stopknop, dan hangt het knooppunt erboven nergens meer aan: de spanning is #keyterm[zwevend] en heeft geen echte waarde. Er zitten zo weinig ladingen op dat ze bij het meten meteen door je meettoestel weglopen, dus meten heeft geen zin.
]

== Signaal-tijddiagram


Een signaal-tijddiagram zet alle signalen van een machine op dezelfde tijdas.
#figure(
  image("assets/Time-diagram.png", width: 15cm),
  caption: [Signaal-tijddiagram: startknop, de twee eindsensoren, de ventielspoel en onderaan de cilinderpositie, allemaal op dezelfde tijdas.],
  label: <fig:Time-diagram>,
)



== Timers en tijdrelais

#wrap-figure(
  image("assets/Timing relays.png", width: 3cm),
  caption: [Timing relays: TON (kruis) en TOF (ingevuld blok)],
  label: <fig:timingrelays>,
)[
  Een tijdrelais vertraagt het in- of uitschakelen van een contact:

  - / TON (Timer On Delay): Vertraagt het *inschakelen*. Zodra de spoel bekrachtigd wordt, start de tijdmeting $T$. Pas na $T$ schakelen de contacten om. Symbool: kruis $times$ in het vertragingsblok.
  - / TOF (Timer Off Delay): Vertraagt het *uitschakelen*. Zodra de spoel spanningloos wordt, blijft het contact nog gedurende tijd $T$ actief vooraleer het afvalt. Symbool: volledig ingevuld zwart blok.

  #examenbox[Ken het verschil tussen TON en TOF en herken de standaardsymbolen op elektrische schema's.]

]
#oefening(title: "TON en TOF: de gasbrander uit de slides")[
  Twee opgaven over dezelfde machine, met de vertraging aan een andere kant.

  *TON.* Bij het starten moet de ventilator eerst genoeg luchtstroom opbouwen vóór het gas open mag. Zet een TON op het startsignaal: de ventilator loopt meteen, en pas na tijd $T$ trekt de gasklep aan. De ventilator is dus de directe uitgang, het gas de vertraagde.

  *TOF.* Bij het stoppen moet het gas #strong[onmiddellijk] dicht, maar de ventilator moet nog even doorlopen om restgas af te voeren. Zet nu een TOF: bij het wegvallen van het signaal valt de gasklep meteen af, terwijl de ventilator nog tijd $T$ blijft draaien.

  *De denkstap.* Vraag je per uitgang af aan welke kant de vertraging zit. Vertraagd #strong[aantrekken] is een TON, vertraagd #strong[afvallen] is een TOF.

  #belangrijk[Gebruik alleen een andere timer dan de TON als de opgave voor $100 %$ met die functie overeenkomt.] Anders bouw je de vertraging liever met een TON en wat logica eromheen, want dan blijft het gedrag voorspelbaar.

  #waarschuwing[
    Een off-delay timer krijgt zijn voeding vaak apart van zijn stuuringang. Anders zou hij mee uitvallen op het moment dat hij net moet beginnen aftellen.
  ]
]

== PLC Introductie <sec:plc-introductie>

Een *PLC (Programmable Logic Controller)* is een industriële computer zonder beeldscherm of toetsenbord, speciaal ontworpen voor betrouwbare 24/7 besturing in zware industriële omgevingen.

#concept(title: "Hardware-opbouw van een PLC")[
  - *CPU (Central Processing Unit)*: Voert het besturingsprogramma cyclisch uit en beheert het geheugen.
  - *Voedingsmodule (Power Supply)*: Zet de netspanning om naar de interne systeemspanningen en $24 "VDC"$.
  - *Digitale I/O-modules*:
    - *DI (Digital Input)*: Leest binaire signalen ($0"–"24 "VDC"$) van drukknoppen, eindschakelaars en sensoren.
    - *DO (Digital Output)*: Stuurt actuatoren aan ($24 "VDC"$), zoals relaisspoelen, signaallampen en ventielen.
  - *Analoge I/O-modules*:
    - *AI (Analog Input)*: Converteert continue meetwaarden ($0"–"10 "V"$, $4"–"20 "mA"$) via een ADC naar digitale getallen.
    - *AO (Analog Output)*: Stuurt regelbare stuurwaarden uit naar bv. frequentieregelaars of regelkleppen.
  - *Communicatie-interfaces*: Industriële veldbussen zoals PROFINET, Modbus TCP, EtherCAT en Ethernet/IP voor koppeling met HMI, SCADA en andere controllers.
]

#wrap-figure(
  image("assets/PLC2.png", width: 5cm),
  caption: [Modulaire PLC: links de CPU, rechts de I/O-klemmen die je per stuk bijsteekt],
  label: <fig:PLC2>,
)[
  In het blokschema van @fig:basisdiagram is de PLC het middelste blok. Hij leest de knoppen van de operator én de sensoren van de machine, past zijn logica toe, en stuurt daarmee de actuatoren aan plus de terugmelding naar de operator.

  Modulair betekent dat je die I/O per klem uitbreidt: te weinig digitale ingangen, dan klik je er een module bij.
]

== Relais versus PLC: waarom kiezen we voor een PLC? <sec:relais-vs-plc>

In eenvoudige schakelingen met 1 tot 3 stappen kan een relaisschakeling volstaan. Zodra een systeem echter complexer wordt, biedt een PLC doorslaggevende voordelen:

#table(
  columns: (1fr, 1.2fr, 1.2fr),
  inset: 6pt,
  align: horizon,
  table.header([*Criterium*], [*Relaisschakeling*], [*PLC-besturing*]),
  [Flexibiliteit & wijzigingen], [Herbedrading en fysieke componenten toevoegen], [Softwarematig aanpassen in het programma],
  [Betrouwbaarheid bij grote sequenties], [Daalt snel door vele mechanische contacten], [Zeer hoog (geen mechanische slijtage in de logica)],
  [Benodigde kastruimte], [Groot bij complexe schakelingen], [Compact en modulair uitbreidbaar],
  [Diagnostiek & monitoring], [Moeilijk storingzoeken met multimeter], [Real-time statusmonitoring en foutmeldingen],
  [Kosten bij kleine schakelingen], [Goedkoop], [Hogere initiële basiskost],
)

#figure(
  image("assets/relayvsPLC.png", width: 15cm),
  caption: [Vergelijking tussen hardwired relaislogica en softwarematige Ladder Diagram (LAD) implementatie in een PLC],
  label: <fig:relayvsPLC>,
)

=== Ladder Logic (LAD)

#wrap-figure(
  image("assets/Ladder logic.png", width: 4cm),
  caption: [Ladder Logic rung met condities en uitgangsspoel],
  label: <fig:Ladder-logic>,
)[
  *Ladder Logic (LAD)* is een grafische taal conform IEC 61131-3 die op een relaisschema lijkt. Je bouwt per *rung* tussen de linker- en rechtervoedingsrail; de spoel trekt aan zodra er een gesloten pad is.

  Lees een rung van links naar rechts: #strong[serie] is EN, #strong[parallel] is OF, en een N.C.-contact is de inverse van zijn variabele.

  Rechts staat altijd een instructie die het resultaat gebruikt, meestal een uitgangsspoel. Elk netwerk moet zo afgesloten zijn, anders compileert het programma niet.


== Logische sturing met een PLC

=== Variabelen- en bloknaamgevingsconventie

PLCOpen geeft een naamgevingsstandaard:

+ *Structuur*: `PrefixType_PrefixGeheugen_UniekeNaam`, bv. `xI_Q1_Feedback`. Namen in het Engels, `UpperCamelCasing`, prefixen gescheiden door underscores.
+ *Typeprefix*:
  - `x`: Boolean (`xStart`, `xEmergencyStop`)
  - `i`: Integer (`iCycleCount`)
  - `r`: Real / Floating point (`rTemperature`)
  - `t`: Time (`tDelay`)
+ *Geheugen-/locatieprefix*:
  - `I` of `E`: Fysieke ingang (Input / Eingang)
  - `Q` of `A`: Fysieke uitgang (Output / Ausgang)
  - `M`: Merker / intern geheugenbit (Memory marker)
  - `DB`: Data Block variabele
+ *RDS-koppeling*: hoort de variabele bij een component uit het schema, dan start de naam met de RDS-code (`-S1`, `-Q2`).
]
=== De PLC-Scancyclus

#wrap-figure(
  image("assets/scancycle.png", width: 2.5cm),
  caption: [De drie fasen van de PLC-scancyclus],
  label: <fig:scancycle>,
)[
  De PLC draait cyclisch in drie vaste fasen, samen typisch enkele milliseconden:

  1. *PII*: alle ingangen worden in één keer ingelezen als momentopname.
  2. *Programma* (bv. `OB1`): de CPU werkt het programma af op dat PII-geheugen.
  3. *PIQ*: de berekende uitgangen gaan in één keer naar de uitgangsmodules.

  Binnen één cyclus ziet je programma een #strong[bevroren] beeld van de ingangen: verandert een sensor halverwege, dan merk je dat pas de volgende scan. Een puls korter dan één scan is dus onzichtbaar; wil je die vangen, gebruik dan flankdetectie of een snelle teller.

  De uitgangen worden pas op het einde in één keer weggeschreven, dus een uitgang die je tussendoor aan en weer uit zet, komt nooit op de klem.
]

=== Combinatorisch of met geheugen? <sec:combinatorisch-geheugen>

Voor je begint te programmeren stel je één vraag: heeft de uitgang geheugen nodig of niet? De drie soorten logische problemen van bij het begin van dit hoofdstuk komen hier terug, nu als programmeerkeuze.

Dezelfde vraag komt terug bij de 3D-methode: daar is "heb ik een geheugen nodig?" precies de eerste examenvraag. Zie @sec:3d-examenvraag.

=== Hardware N.C. tegenover software N.O. <sec:nc-hardware-software>

Neem twee N.O.-contacten in serie met een toekenning aan een uitgangsspoel. Die schrijft het #keyterm[RLO] (Result of Logic Operation) weg naar een uitgang of merker, #strong[nooit] naar een ingang: die wordt van buitenaf opgelegd.

De valkuil: de stopknop is in de #strong[hardware] N.C., dus die variabele is "true" zolang je *niet* duwt. Het netwerk geeft dus een actieve uitgang als niemand duwt, en valt weg zodra je één knop indrukt.

#belangrijk[Een N.C.-knop in de hardware wordt dus een N.O.-contact in je programma.] Leer dat niet vanbuiten, maar redeneer telkens opnieuw: wat staat er op de klem als niemand iets doet?

Dit gaat over de vertaling hardware $arrow.r$ software. Welk type je in het veld moet *bestellen* is een andere vraag, zie @sec:no-nc-keuze.

=== Start/stop als flip-flop

Twee vragen komen altijd terug.

*Waarom staat de stopknop als N.C.?* Zie @sec:nc-hardware-software. Redeneer, leer het niet vanbuiten.

*Waarom zet je de uitgang niet meteen in netwerk 1?* Omdat je de logica en de uitgang gescheiden houdt. Ken het resultaat eerst toe aan een merker, de #keyterm[logische toestand van de machine]. Pas later koppel je de fysieke PLC-uitgang aan die toestand. Dat is de basisregel uit @sec:lad-basisregel.

=== De RS-flipflop opbouwen: methode 1 <sec:rs-methode1>

De directe aanpak volgt drie stappen:

+ Is #strong[set] waar, dan is de uitgang altijd waar. Aan die tak raak je daarna nooit meer.
+ Om een geheugen te maken heb je een #strong[parallelle tak] nodig die de uitgang terugkoppelt wanneer je niet aan het setten bent.
+ Om het geheugen te kunnen wissen zet je de #strong[reset] in die terugkoppeltak, zonder regel 1 te schenden.

#figure(
  image("assets/OIS_rs_flipflop_methode1.png", width: 17cm),
  caption: [De RS-flipflop via de directe aanpak: set in de eerste tak, terugkoppeling met reset in de parallelle tak.],
  label: <fig:rs-flipflop-methode1>,
)


=== De tweede oplossing: van waarheidstabel naar schema <sec:rs-methode2>

Je kan ook vertrekken van de waarheidstabel en die uitvouwen naar een schema, in #strong[negatieve logica]. Vereenvoudig daarna in twee stappen:

+ *Duplicaten en tegengestelden wegwerken.* Termen die twee keer voorkomen, of die elkaars tegengestelde zijn, kan je samennemen.
+ *Onnodige condities schrappen.* Set activeert de uitgang sowieso, dus hoef je set niet nog eens uit te sluiten in de eerste tak.

Je komt uit op #strong[dezelfde] oplossing als met methode 1: twee wegen, hetzelfde schema.

=== LAD-conventies <sec:lad-conventies>

- Het #keyterm[RLO] (Result of Logic Operation) is het tussenresultaat van de condities in een netwerk: waar of niet waar.
- #belangrijk[Elk RLO moet uiteindelijk door een instructie gebruikt worden], anders breekt de compilatie af. Alle netwerken en alle parallelle takken moeten dus afgesloten zijn.
- Zet je de software in #strong[monitor], dan zie je het RLO live: een groene lijn betekent "hier is het RLO waar".
- `set` en `reset` zijn #strong[voorwaardelijk]: ze voeren alleen uit als het RLO waar is. Een uitgangsspoel kent het RLO #strong[continu] toe.

=== De basisregel: I $arrow.r$ M $arrow.r$ Q <sec:lad-basisregel>

#belangrijk[Splits je software in twee delen.]

+ *I $arrow.r$ M.* Eerst de #keyterm[logische toestanden van de machine] vastleggen in merkers.
+ *M $arrow.r$ Q.* Pas daarna de toestand van elke uitgang bepalen.

Meerdere toestanden, en zelfs meerdere sequenties, mogen naar dezelfde uitgang verwijzen.

#figure(
  scale(52%, reflow: true, merman.mermaid(
    ```
    flowchart LR
      I["Ingangen I"] --> L["Logica"] --> M["Merkers M: logische toestanden"]
      M --> O["Uitgangen Q: som van toestanden"] --> C["Cross-protect"]
    ```,
    theme: (fontSize: "30px"),
  )),
  caption: [De basisregel: eerst de ingangen naar logische toestanden, pas daarna die toestanden naar de uitgangen.],
  label: <fig:i-m-q>,
)

#belangrijk[Schrijf elke uitgang op precies één plaats in je programma.] Programmeer de uitgangen bovendien in de numerieke volgorde waarin de kabels aangesloten zijn. Zo kan je onmogelijk twee keer dezelfde uitgang aansturen zonder het te merken.

=== Combinatorische en geheugencircuits programmeren

De werkwijze:

+ #belangrijk[Splits de opdracht op in de kleinst mogelijke stukken.]
+ Formuleer elk stuk als een #strong[ja/nee-vraag] in het commentaarveld van het netwerk; de code eronder geeft het antwoord.

Zo valt de oplossing uiteen in kleine, leesbare netwerken, en is je software meteen gedocumenteerd.

=== De standaardnetwerken <sec:standaardnetwerken>

Bijna altijd dezelfde blokken:

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

=== MOVE naar een uitgangsbyte <sec:move-uitgangen>

Een vast oefeningtype: je schrijft met één `MOVE`-instructie een getal naar een uitgang, en je moet zeggen welke componenten in het schema daardoor actief worden.

Eerst welk adres hoeveel uitgangen beslaat:

#table(
  columns: (auto, 1fr, auto),
  align: (left, left, left),
  stroke: none,
  inset: 5pt,
  table.hline(stroke: 1pt),
  table.header([*Adres*], [*Betekenis*], [*Bereik*]),
  table.hline(stroke: 0.5pt),
  [`Qx.x`], [één uitgangsbit], [1 uitgang],
  [`QBn`], [uitgangsbyte], [8 uitgangen, `QB0` = `Q0.0` t/m `Q0.7`],
  [`QWn`], [uitgangswoord], [16 uitgangen, `QW0` = `Q0.0` t/m `Q1.7`],
  [`QDn`], [dubbel woord], [32 uitgangen, `QD0` = `Q0.0` t/m `Q3.7`],
  table.hline(stroke: 1pt),
)

Je zet het getal binair en legt het #belangrijk[van rechts naar links] op de uitgangen: de laagste bit gaat naar `Q0.0`.

#oefening(title: "MOVE 222 naar QB0")[
  *Gegeven.* Er is één instructie geprogrammeerd: `MOVE 222` naar `QB0`. De voedingen staan aan en de PLC draait in RUN.

  *Gevraagd.* Welke uitgangen worden hoog?

  *Stap 1: decimaal naar binair.* Trek de machten van twee af, van groot naar klein. Bij een byte zijn dat $128, 64, 32, 16, 8, 4, 2, 1$.
  $ 222 = 128 + 64 + 16 + 8 + 4 + 2 $

  Er zit geen $32$ en geen $1$ in, dus:
  $ 222 = #"2#1101 1110" $

  *Stap 2: bits op de uitgangen leggen.* De rechtse bit is `Q0.0`.

  #table(
    columns: (auto, auto, auto, auto, auto, auto, auto, auto, auto),
    align: center,
    stroke: none,
    inset: 5pt,
    table.hline(stroke: 1pt),
    table.header([*Uitgang*], [`Q0.7`], [`Q0.6`], [`Q0.5`], [`Q0.4`], [`Q0.3`], [`Q0.2`], [`Q0.1`], [`Q0.0`]),
    table.hline(stroke: 0.5pt),
    [Waarde], [128], [64], [32], [16], [8], [4], [2], [1],
    [Bit], [1], [1], [0], [1], [1], [1], [1], [0],
    table.hline(stroke: 1pt),
  )

  *Antwoord.* Actief zijn `Q0.1`, `Q0.2`, `Q0.3`, `Q0.4`, `Q0.6` en `Q0.7`. Laag blijven `Q0.0` en `Q0.5`. De componenten die aan die zes uitgangen hangen, trekken aan.
]

#concept(title: "Hexadecimale, binair en decimaal")[
  / Hexadecimaal (`16#xx`): splits het getal in losse cijfers, want elk hexcijfer is precies vier bits. Zo wordt `16#15` $arrow.r$ `1` en `5` $arrow.r$ `0001` en `0101` $arrow.r$ `2#0001 0101`. Letters tellen door vanaf $A = 10$, dus `16#0A` is `2#0000 1010`.
  / Binair (`2#xxxx`): niets om te rekenen, de bits staan er al.
  / Decimaal: ontbind in machten van twee, zoals in de oefening hierboven.
]

== Sequenties programmeren

Een #keyterm[sequentie] is een cyclisch verlopend programma, bv. een robot die telkens een plaat optilt en hoger neerlegt.

#belangrijk[De eerste vraag bij elk programma is: "is er een sequentie?"] Is het antwoord ja, dan gebruik je de sequentiemethode. Is het nee, dan programmeer je combinatorische en geheugencircuits zoals hierboven.

=== De vier vaste delen <sec:sequentie-delen>

Elke sequentie heeft dezelfde opbouw:

+ *Initialisatie.* Alle merkerwoorden van de sequentie op nul met een `MOVE`, en de hoofdsequentie starten met een `set` naar stap 0.
+ *Hulpmerkers.* Timers, counters en alles wat de hoofdsequentie nodig heeft. Zet hier wat de sequentie anders onleesbaar maakt.
+ *Sequentie.* Het hoofddeel. Je definieert elke stap met de logische toestand van de machine.
+ *Uitgangen.* Je koppelt elke uitgang aan de stappen waarin ze actief moet zijn.

=== Stappen <sec:sequentie-stappen>

#belangrijk[Een stap is het kleinst mogelijke stuk van het proces.] Teken eerst met de hand een SFC op papier, nummer en benoem de stappen, en #strong[vermijd daarbij uitgangsnamen] als stapnaam. Een stap is een toestand van de machine, geen uitgang.

Elke stap krijgt een SR-flipflop. Aan de set-ingang staat de sensor die aangeeft dat de vorige stap klaar is; de volgende stap reset de huidige. Zo hang je de stappen aan elkaar volgens het patroon #strong[vorige / huidige / volgende]. De structuur loopt van stap 0 tot een bepaalde stap en dan terug naar stap 0.

De eerste doorloop is bijzonder. Dan sla je stap 0 over, want je moet op een andere manier controleren of de machine wel in de juiste logische toestand staat. Dat kan op twee manieren:

+ *Initialisatiesequentie:* je kijkt alles na en zet dan `MWx.0` hoog. Dat betekent dat stap 0 uitgevoerd is en stap 1 mag beginnen.
+ *Variabelen nakijken:* hetzelfde idee, maar buiten de sequentie. Meestal kijk je dan naar meer variabelen, bijvoorbeeld ook naar de startknop.

Maak je netwerken met copy-paste, zodat de structuur overal identiek blijft.

=== Uitgangen programmeren <sec:sequentie-uitgangen>

#belangrijk[Een uitgang is altijd een som van logische toestanden.] Wil je meerdere stappen optellen, dan gebruik je een OR-netwerk. Er zijn drie gevallen:

- de uitgang is actief tijdens #strong[opeenvolgende] stappen;
- de uitgang is actief in #strong[niet-opeenvolgende] stappen;
- de uitgang is actief in #strong[één enkele] stap.

=== Cross-protect op Q <sec:cross-protect>

Twee uitgangen mogen soms nooit samen actief zijn, zoals de contactoren voor rechtsom en linksom: samen geeft dat een kortsluiting.

#wrap-figure(
  image("assets/OIS_cross_protect.png", width: 7.5cm),
  caption: [Cross-protect: een N.C.-conditie van de tegengestelde uitgang vlak voor de spoel.],
  label: <fig:cross-protect>,
)[
  In zo'n geval zet je vlak vóór de spoel een extra conditie: een N.C.-contact van de tegengestelde uitgang. Is de ene uitgang actief, dan blokkeert die de andere. Dat heet #keyterm[cross-protect].

  Zet die conditie zo dicht mogelijk bij de spoel, niet ergens hogerop in de logica. Alleen dan dekt ze élk pad dat die uitgang kan aansturen, ook een pad dat je er later bijprogrammeert.

  Vergrendel dezelfde twee contactoren bovendien #strong[mechanisch] in de kast. De PLC-logica beschermt niet tegen een contactor die vastbakt.
]

#waarschuwing[
  *Een stap kan één scan duren.* Is de conditie voor de volgende stap al waar wanneer de huidige actief wordt, dan lopen ze samen en is de huidige maar één scan actief, typisch $2$ tot $20 "ms"$. Wil je de uitgang toch even zien schakelen, programmeer de stap dan als conditie voor die uitgang; wil je ze overslaan, laat ze weg.
]

=== De ADD-sequentie <sec:add-sequentie>

Een variant op de SR-implementatie werkt met een `ADD`. De opbouw in netwerken:

- *Netwerk 1:* hulpmerkers, meestal meerdere netwerken.
- *Netwerk 2:* de `ADD` zelf, die het stapnummer ophoogt.
- *Netwerk 3:* de sequentie starten.
- *Netwerk 4:* de sequentie vrijgeven, oftewel de idle-stap zetten. De laatste stap $+ 1$ hernummer je als $255$.
- *Netwerk 5:* de sequentie wissen of blokkeren. De fysieke knop is N.C., dus staat hier ook een N.C.-contact.
- *Netwerk 6 en verder:* de uitgangen, per geval zoals hierboven.

*Waarom `ADD` en niet de counter-instructie?* Met de start in een apart netwerk blijft de hoofdsequentie leesbaar. Vaak bouw je er een tijdvertraging in die synchroon loopt met de stapovergangen.

=== Clear, enable en start <sec:clear-enable-start>

Drie begrippen die je uit elkaar moet houden:

- *Clear:* de machine is schoon en kan niet gestart worden. Alle sensoringangen worden genegeerd.
- *Enabled:* klaar om gestart te worden.
- *Start:* de sequentie loopt.

=== Reactie op de bedieningsknoppen <sec:machinebediening>

- *Abort:* de sturing valt plots weg door spanningsuitval, de hoofdschakelaar of een slecht ontworpen noodstop. #belangrijk[De PLC heeft de machine dan niet meer onder controle.]
- *E-stop:* categorie 0, of categorie 1 met eerst gecontroleerd afremmen. Het vermogen gaat eraf, maar de PLC blijft draaien.

Het verschil: na een abort weet je niets meer over de toestand van de machine, na een noodstop wel.

== Functies (FC) en functieblokken (FB)

=== De norm IEC 61131-3 <sec:iec61131>

IEC 61131-3 is de norm voor het programmeren van PLC's. Ze beschrijft:

- de #keyterm[POU]'s (Program Organization Units): OB, FC en FB;
- de talen: LAD, FBD, STL (IL), SCL (ST) en SFC;
- de mogelijke datatypes;
- de standaardfuncties zoals de IEC-timer en de IEC-counter;
- de softwaremodellen: de opdeling in configuratie (bv. de machine), resource (de PLC) en task (cyclische verwerking). Tasks bestaan uit POU's, en objectgeoriënteerd programmeren is toegelaten.

=== Gepartitioneerd tegenover gestructureerd <sec:gepartitioneerd-gestructureerd>

Een FC of FB is een verzameling logische netwerken, op twee manieren te gebruiken:

- *Gepartitioneerd:* je roept het blok #strong[één keer] op met globale variabelen, puur om je programma op te delen.
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

Volg je de norm strikt, dan gebruik je in een FC #strong[geen] globale variabelen en geen absolute operanden. Dat is wat een FC voorspelbaar maakt: dezelfde ingangen leveren altijd hetzelfde resultaat.

=== Formele parameters <sec:formele-parameters>

De lokale variabelen van een FC of FB heten #keyterm[formele parameters]. De variabelen die je bij het oproepen meegeeft zijn de #keyterm[actuele parameters].

- *IN:* vóór de code in het blok uitgevoerd wordt, wordt de waarde van de actuele parameter ingelezen en toegekend aan de formele parameter. #belangrijk[Schrijf nooit naar een IN.]
- *OUT:* ná het uitvoeren van de code worden de waarden van de OUT-parameters weggeschreven naar de gekoppelde actuele parameters. Let op: de data in die gekoppelde variabele wordt #strong[altijd] overschreven met wat er binnen het blok beschikbaar was.

=== Timers en tellers in een FC of FB <sec:timer-datatypes>

Volgens EN 61131 gebruik je #belangrijk[geen geheugen of timers in een FC]. Wil je toch een timer, dan heb je twee opties: hem als IN definiëren, of, beter, een eigen instance-DB per timer aanmaken.

In een FB kan dat ook, maar het is niet verstandig. #belangrijk[De beste praktijk in een FB is timers als static in de instance-DB zetten], als multi-instance.

Als datatype gebruik je `IEC_timer`, of gewoon de naam van de instructie, bijvoorbeeld `TON`. TIA kent nog andere types, maar die vallen buiten dit vak. In de PLC zelf werk je met `Time` en `DWord`.

#waarschuwing[
  *Rekenen met tijdswaarden.* Wil je bijvoorbeeld een toerental uit een periodetijd halen, dan sla je de actuele tijd op in een static en vermenigvuldig je het aantal perioden met $60000$ om rpm te krijgen. Grotere waarden geven een nauwkeuriger resultaat.

  Denk eraan dat een flankdetectie een #strong[statische] merkerbit nodig heeft. In een FC bestaat die niet, dus daar werkt flankdetectie niet zonder instance-DB.
]
