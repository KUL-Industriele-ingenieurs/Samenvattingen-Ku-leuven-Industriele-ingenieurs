#import "../../school-template.typ": *

= Main Circuits <ch:main-circuits>

#chapter-outline()

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

Echter, voor menselijke veiligheid is stroombeperking doorgaans niet effectief. Zelfs gering stroomcontact via het menselijk lichaam kan dodelijk zijn (bijvoorbeeld 30 mA·s). Aangezien industriële apparaten voor hun normale bedrijf relatief hoge stromen nodig hebben, kunnen we niet simpelweg alle stromen beperken. Hier ontstaat de kern van het beveiligingsvraagstuk: hoe beschermen we zowel de circuitinfrastructuur als de menselijke operator?


+ *Residual current devices (RCDs)*

  #figure(
    image("RDC.png", width: 5cm),
    caption: [RDC],
    label: <fig:RDC>,
  )

  Een RDC detecteert lekstroom. In de figuur raakt de mens het circuit aan en die gaat dan terug naar via de grond terug naar de box en niet via de draad. Dit kan dodelijk zijn. Een RDC detecteert dit verschil met de stroom die aankomt en de stroom die teruggaat. Als er een verschil is, onderbreekt de RDC de stroomtoevoer. Dit is ongeveer 30ma wat de grens is van wat een mens kort kan verdragen _zie distributie van elektrische energie_.

+ *Fuses*

  #wrap-figure(
    image("Fuses.png", width: 5cm),
    caption: [Fuses],
    label: <fig:Fuses>,
  )[
    een fuse is een direct protection. Het is de meest goedkope manier om het circuit te beschermen. Wanneer een fuse een kortsluiting detecteert, *smelt¨* het element binnenin en onderbreekt het de stroomtoevoer. Fuses zijn eenvoudig, betrouwbaar en snel. Het probleem is dat na dat het smelt dat je het circuit niet meer kan gebruiken tot je het vervangt.

    Het wordt dus niet overal toegepast omdat je dan veel fuses moet bijhouden om ze te vervangen.
  ]

+ *ECB (electronic circuit breaker)*

  Een ECB (electronic circuit breaker) is een geavanceerde beveiligingsoplossing die elektronische componenten gebruikt om de stroomtoevoer te onderbreken bij detectie van een fout. In tegenstelling tot traditionele mechanische zekeringen, kunnen ECB's worden geprogrammeerd voor specifieke toepassingen en bieden ze vaak snellere reactietijden. Ze kunnen ook worden uitgerust met functies zoals zelfdiagnose en communicatie met andere systemen voor verbeterde veiligheid en efficiëntie.

+ *AFCI (arc fault circuit interrupter)*

  Een AFCI (arc fault circuit interrupter) gaat een vlamboog overal in het circuit detecteren. Een vlamboog kan ontstaan door beschadigde bedrading, losse verbindingen of defecte apparaten, en kan leiden tot brandgevaar. AFCI's zijn ontworpen om deze gevaarlijke situaties te voorkomen door de stroomtoevoer te onderbreken wanneer een vlamboog wordt gedetecteerd.



== 3 Phase asycronous motors <sec:3-phase-motors>

=== Waarom Driefase Asynchrone Motoren

De driefase asynchrone motor is de meest gebruikte motor in industriële toepassingen. De voornaamste redenen zijn:

- *Kosteneffectief*: Geen permanente magneten nodig, dus aanzienlijk goedkoper dan gelijkstroommotoren of synchrone motoren
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
Als we ook de rotatiesnelheid willen veranderen, hebben we een meer geavanceerde inrichting nodig: een VFD (Variable Frequency Drive). Een VFD biedt:
- Verandering van de rotatierichting
- Nauwkeurige snelheidsregeling (door de frequentie aan te passen)
- Controle over het koppel
- Geavanceerde beveiligings- en diagnostische functies

=== Motorbeveiliging

Wanneer de motor niet door een VFD wordt beheerd, moet het circuit worden voorzien van *motorbeveiliging*. Dit kan op twee manieren:

- *MPCB (Motor Protection Circuit Breaker)*: Een gespecialiseerde automaat die thermische overbelasting, kortsluiting en onderspanning kan detecteren
- *OLR (Over-Load Relay)*: Een separaat relais dat thermische overbelasting specifiek detecteert en de motor uitschakelt voordat schade optreedt

Deze motorbeveiliging is essentieel omdat de opstartcondities van motoren anders zijn dan bij passieve belastingen. Een motor kan bij het starten een hoger stroomtrekken (inrushstroom) dan tijdens normaal bedrijf, dus standaard beveiligingen zouden onjuist kunnen activeren.

=== Motor efficentie <sec:motor-efficiency>

internationale efficienty classen (IE classen)
#figure(
  image("IE-klassen.png", width: 8cm),
  caption: [IE-klassen],
  label: <fig:IE-klassen>,
)

Faculty of Engineering Technology
• The current EU Directive IEC 60034-30-1 IE classes :
• IE1 (Standard Efficiency)
• IE2 (High Efficiency)
• IE3 (Premium Efficiency)
• IE4 (Super Premium Efficiency)


== Contactors

#figure(
  image("contactor Nieuw vs oud.png", width: 8cm),
  caption: [contactor Nieuw vs oud],
  label: <fig:contactor-Nieuw-vs-oud>,
)

=== Wat is een Contactor?

Een contactor is een mono-stable, multi-pool elektronisch bediende schakelaar voor hoofdstroomkringen (power circuits). Het verschil met een gewone schakelaar is dat het via een laagvermogen spoeltje (coil) wordt bediend, niet rechtstreeks door hand.

*Werkingsprincipe:*
- Als we stroom naar de spoeltje sturen (tussen A1-A2), wordt de contactor *ingeschakeld*
- Als we de stroomtoevoer naar de spoeltje onderbreken, wordt de contactor *uitgeschakeld* door een terugstelveering
- Dus: *mono-stable* betekent dat zonder stroomtoevoer naar de coil, de contactor altijd uit is

*Hoofdcontacten*\
Een contactor heeft meerdere *hoofdcontacten* (1-6 in de figuur) die de sterke stroomtoevoer schakelen. Typisch heeft een contactor drie hoofdcontacten — één voor elke fase van het driefasenetwerk. Dit stelt ons in staat om alle drie fasen met één enkele contactor in of uit te schakelen.

*Belangrijke eigenschap:* Bijna alle hoofdcontacten zijn NO (Normally Open) — ze geleiden niet wanneer de contactor uit is. Contactoren met NC (Normally Closed) hoofdcontacten bestaan, maar zijn uiterst zeldzaam en worden vrijwel nooit gebruikt.

*Hulpcontacten*\

Naast de hoofdcontacten kan een contactor veel *hulpcontacten* hebben (typisch 11-24 in de figuur). Deze kunnen elke combinatie van NO en NC contacten zijn.

*Belangrijk verschil:* Hulpcontacten kunnen NIET gebruikt worden voor het schakelen van hoofdstromen — zij zijn laagvermogencontacten. Hun doel is om in de controleschakeling informatie over de toestand van de contactor te geven. Bijvoorbeeld, een hulpcontact kan aan een PLC (Programmable Logic Controller) aangeven of de contactor ingeschakeld is, zodat andere logica hierop kan reageren.

*Spanningswaarden*\

Een cruciaal detail: de spanningswaarden van de spoel (A1-A2), de hoofdcontacten (1…6) en de hulpcontacten (11…24) zijn *anders*. Bijvoorbeeld:
- De spoel kan op 24 VDC (laagspanning, veilig) werken
- De hoofdcontacten kunnen 400 VAC (driefasetoevoer) schakelen
- De hulpcontacten kunnen 110 VDC schakelen

Dit ontwerp biedt veiligheid: de operator kan via een veilige laagspanningsspoel een krachtige hoofdstroomkring bedienen zonder direct gevaar.


=== Hoe werkt een contactor?

#figure(
  image("Contactor-werking.png", width: 12cm),
  caption: [Contactor-werking],
  label: <fig:Contactor-werking>,
)


// todo korte uitleg toevoegen contactor werking
#TODO[Contactor werking uitleggen]



#examenbox[Wordt verwacht dat je kent op het examem! Zorg dat je een ingenieurs uitleg geeft. Leg uit dat je een kracht opzet!]


== AC-contacts

// uitleg toevoegen
#TODO[AC-contacts uitleggen]


== Start-stop async motors
// uitleg toevoegen
#TODO[Start-stop async motors uitleggen]


// tweede deel van de les toevoegen
#TODO[Tweede deel van de les toevoegen]

