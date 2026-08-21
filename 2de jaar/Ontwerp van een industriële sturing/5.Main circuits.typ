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


+ *Residual current devices (RCDs)*

  #figure(
    image("assets/RDC.png", width: 5cm),
    caption: [RDC],
    label: <fig:RDC>,
  )

  Een RDC detecteert lekstroom. In de figuur raakt de mens het circuit aan en die gaat dan terug naar via de grond terug naar de box en niet via de draad. Dit kan dodelijk zijn. Een RDC detecteert dit verschil met de stroom die aankomt en de stroom die teruggaat. Als er een verschil is, onderbreekt de RDC de stroomtoevoer. Dit is ongeveer 30ma wat de grens is van wat een mens kort kan verdragen _zie distributie van elektrische energie_.

+ *Fuses*

  #wrap-figure(
    image("assets/Fuses.png", width: 5cm),
    caption: [Fuses],
    label: <fig:Fuses>,
  )[
    een fuse is een direct protection. Het is de meest goedkope manier om het circuit te beschermen. Wanneer een fuse een kortsluiting detecteert, *smelt¨* het element binnenin en onderbreekt het de stroomtoevoer. Fuses zijn eenvoudig, betrouwbaar en snel. Het probleem is dat na dat het smelt dat je het circuit niet meer kan gebruiken tot je het vervangt.

    Het wordt dus niet overal toegepast omdat je dan veel fuses moet bijhouden om ze te vervangen.
  ]

+ *ECB (electronic circuit breaker)*

  Een ECB (Electronic Circuit Breaker) onderbreekt de stroom met elektronica in plaats van met een mechanisme. Je kan hem per toepassing instellen, hij reageert sneller dan een smeltzekering, en hij kan zijn toestand doorgeven aan de sturing.

+ *AFCI (arc fault circuit interrupter)*

  Een AFCI (arc fault circuit interrupter) gaat een vlamboog overal in het circuit detecteren. Een vlamboog kan ontstaan door beschadigde bedrading, losse verbindingen of defecte apparaten, en kan leiden tot brandgevaar. AFCI's zijn ontworpen om deze gevaarlijke situaties te voorkomen door de stroomtoevoer te onderbreken wanneer een vlamboog wordt gedetecteerd.



=== Zekering, MCB en MCCB

#TODO[Deck 4, slide 8. Het verschil tussen een smeltzekering (-F), een MCB (Miniature Circuit Breaker) en een MCCB (Moulded Case Circuit Breaker): karakteristiek, breekvermogen (AIC) en wanneer je wat kiest.]

== 3 Phase asycronous motors <sec:3-phase-motors>

=== Waarom Driefase Asynchrone Motoren

De driefase asynchrone motor is de meest gebruikte motor in industriële toepassingen. De voornaamste redenen zijn:

- *Kosteneffectief*: Geen permanente magneten nodig, dus veel goedkoper dan gelijkstroommotoren of synchrone motoren
- *Lage onderhoudskosten*: Slechts de lagers slijten, wat onvermijdelijk is in elk bewegend apparaat
- *Betrouwbaarheid en robuustheid*: Ontworpen voor zware industriële omgevingen met minimale storingen
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

Wanneer de motor niet door een VFD wordt beheerd, moet het circuit worden voorzien van *motorbeveiliging*. Dit kan op twee manieren:

- *MPCB (Motor Protection Circuit Breaker)*: Een gespecialiseerde automaat die thermische overbelasting, kortsluiting en onderspanning kan detecteren
- *OLR (Over-Load Relay)*: Een separaat relais dat thermische overbelasting specifiek detecteert en de motor uitschakelt voordat schade optreedt

Motorbeveiliging is nodig omdat een motor bij het starten veel meer stroom trekt dan tijdens normaal bedrijf (inrushstroom). Een gewone beveiliging zou daarop afschakelen terwijl er niets mis is.

=== Het starten van een motor

De startmethodes (DOL, ster-driehoek, softstarter, VFD) en het schema van een VFD staan bij @sec:motor-starten in het hoofdstuk Veiligheid.

=== Drives, EMI en de aardverbinding

Zie @sec:vfd-emi in het hoofdstuk Veiligheid: waarom een VFD elektromagnetische storing (EMI) maakt, de rol van de afgeschermde motorkabel en de aarding op één punt.

=== Motor efficentie <sec:motor-efficiency>

internationale efficienty classen (IE classen)
#figure(
  image("assets/IE-klassen.png", width: 8cm),
  caption: [IE-klassen],
  label: <fig:IE-klassen>,
)

Faculty of Engineering Technology
• The current EU Directive IEC 60034-30-1 IE classes :
• IE1 (Standard Efficiency)
• IE2 (High Efficiency)
• IE3 (Premium Efficiency)
• IE4 (Super Premium Efficiency)


== Overzicht van schakel- en beveiligingscomponenten <sec:overzicht-schakelcomponenten>

Hier is nog een overzicht van alle schakele en beveilingscompontenten, hun functie en wanneer ze toegepast worden.

#table(
  columns: (auto, 1fr, 1.3fr, 1.3fr),
  align: (left, left, left, left),
  table.header([*Component*], [*Volledige naam*], [*Functie*], [*Waarom nodig?*]),

  [RCD],
  [Differentieelschakelaar (Residual Current Device)],
  [Beschermt personen tegen lekstromen naar aarde (elektrocutiebeveiliging).],
  [Voorkomt levensgevaar bij isolatiefouten of aanraking van defecte toestellen.],

  [MBS],
  [Motorbeveiligingsschakelaar (MPCB, Motor Protection Circuit Breaker)],
  [Beveiligt motoren tegen overbelasting en kortsluiting.],
  [Beschermt de motor tegen schade door te hoge stroom.],

  [Contactor],
  [Elektromechanisch schakelsysteem],
  [Schakelt de belasting (bv. motor) via een laagspanningssturing.],
  [Laat toe om de belasting automatisch of op afstand te schakelen.],

  [Relais],
  [Hulpschakelaar],
  [Stuurt bijvoorbeeld de contactorspoel aan op basis van een signaal.],
  [Verwerkt logica of signalen (bv. van een PLC) voor schakeling.],

  [Smeltzekering],
  [(Optioneel) smeltveiligheid],
  [Snelle bescherming tegen zeer hoge kortsluitstromen.],
  [Extra beveiliging voor bekabeling of bovenliggende componenten zoals de MBS.],
)

Let op het onderscheid dat deze tabel maakt: *wie schakelt* (contactor, relais) tegenover *wie beveiligt* (RCD, MBS, smeltzekering), en bij de beveiligers *wat* er beschermd wordt --- de RCD beschermt de mens, de MBS de motor, de smeltzekering de bekabeling.

== Contactors

#figure(
  image("assets/contactor Nieuw vs oud.png", width: 8cm),
  caption: [contactor Nieuw vs oud],
  label: <fig:contactor-Nieuw-vs-oud>,
)

De volledige uitleg over contactoren staat bij de besturingslogica: polen en throws, hoofd- en hulpcontacten, de losse spanningswaarden van spoel en contacten, en het gedrag op AC vind je in @sec:contactoren. Hier kijken we naar wat er specifiek bij een *motorkring* komt kijken.

=== Hoe werkt een contactor?

#figure(
  image("assets/Contactor-werking.png", width: 12cm),
  caption: [Contactor-werking],
  label: <fig:Contactor-werking>,
)


// todo korte uitleg toevoegen contactor werking
#TODO[Contactor werking uitleggen]



#examenbox[Dit moet je kennen op het examen. Geef een uitleg als ingenieur: leg uit dat je een kracht opwekt.]


== AC-contacts

Wervelstromen in de kern (opgelost met laminatie) en het brommen van een AC-contactor (opgelost met een kortsluitring) zijn behandeld in @sec:ac-contactoren.


== Start-stop async motors

#TODO[Deck 4, slides 28-31. De start-stopkring van een asynchrone motor: hoofdcircuit plus stuurcircuit, en de omkeerschakeling CW/CCW met twee contactoren en de nodige vergrendeling.]

== Contactor versus SSR

#TODO[Deck 4, slides 32-33. Solid State Relay tegenover contactor: schakelfrequentie, slijtage, warmteontwikkeling en spanningsval.]

== Motorbescherming in detail

=== MPCB (Motor Protection Circuit Breaker)

#TODO[Deck 4, slides 42-47. Wat de MPCB precies detecteert, hoe je hem instelt, en de plaats in het schema samen met de noodstop.]

=== Thermisch overbelastingsrelais (OLR)

#TODO[Deck 4, slides 48-52. Werking van het bimetaal, de instelbare stroomwaarde, handmatige versus automatische reset, en de motorkring met noodstop en OLR.]

=== Ingebouwde motorbescherming: thermistor (PTC)

#TODO[Deck 4, slides 53-60. Een PTC in de wikkeling meet de werkelijke wikkelingstemperatuur in plaats van de stroom. Waarom dat beter is bij slechte koeling of veel starts.]

=== Pt100 en Pt1000

#TODO[Deck 4, slides 61-62. Verschil met de PTC: een Pt100 geeft een echte temperatuurmeting in plaats van een drempel. Wat kost dat extra en wanneer is het de moeite.]

=== Functionele schema's

#TODO[Rondgaande samenvatting hoofdstuk 11.3. Hoe je een motorkring als functioneel schema tekent.]


// tweede deel van de les toevoegen
Het tweede deel van deze les (deck 4, slides 63-77 over de stuurkast) staat bij @ch:voorbeeld-diagram.

