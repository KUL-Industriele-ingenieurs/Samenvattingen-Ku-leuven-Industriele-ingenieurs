#import "../../school-template.typ": *


= De stuurkast <ch:de-stuurkast>

De stuurkast is de behuizing waarin alle elektrische componenten van een machine samenkomen: voeding, beveiliging, PLC (Programmable Logic Controller), relais, contactoren en de bedrading ertussen. Dit hoofdstuk gaat over de praktische regels: hoe je verbindt, hoe je bedrading geleidt en hoe je alles herkenbaar houdt.

== Praktische aspecten <sec:stuurkast-praktisch>

Onderaan in de kast zit meestal een koperen reel: dat is de aarding. Elke component groter dan $5 times 5$ cm moet geaard zijn, net als de metalen kast zelf. Volgens de conventie horen niet-elektrische componenten (pneumatiek, hydrauliek, mechanica) niet thuis in een stuurkast.

Draden die de kast in of uit gaan lopen door een *wartel*: een doorvoer in de kastwand die de opening afdicht en de scherpe plaatrand afschermt. Daarna gaat elke kabel door een *trekontlasting*: een klem die de kabel mechanisch vastzet op de kast. Zo komt mechanische trek op de kast terecht en niet op de aansluitklem van de component — anders trek je de ader los uit de klem.

Alle componenten in een stuurkast moeten gelabeld zijn.

#concept(title: "Drie soorten hulpmiddelen — niet door elkaar halen")[
  De begrippen in dit hoofdstuk vallen in drie groepen met elk een andere functie:

  - / Elektrisch knooppunt maken: klemmenstrook en barenstel --- ze verbinden draden die op hetzelfde potentiaal zitten.
  - / Bedrading geleiden: kabelgoot en kous/gein --- ze bepalen waar de draden fysiek lopen.
  - / Mechanisch ontkoppelen: wartel en trekontlasting --- ze houden krachten weg van de elektrische verbinding.
]

=== Klemmenstrook

Een *klemmenstrook* is een rij kleine doorverbindklemmen op een DIN-rail. Elke klem verbindt twee of meer draden die op hetzelfde potentiaal liggen. Je gebruikt ze voor stuurstroom en kleine vermogens: het contactoppervlak van zo'n klem is beperkt, dus de stroom die erdoor mag is dat ook.

=== Barenstel

Een *barenstel* (busbar) is een elektrisch goed geleidend stuk massief materiaal, meestal koper of messing, dat dezelfde functie doet als een klem — potentiaal verdelen — maar dan voor grote stromen. Zodra kleine bruggen in een klemmenstrook niet meer volstaan voor de stroom die erdoor moet, gebruik je een baar. De baren zijn voorzien van stevige klemmen waarmee je grote stromen kan vastmaken. Kabels sluit je aan met *adereindhulzen*, zodat alle draadjes van een soepele ader samen in de klem geperst worden.

#figure(
  image("assets/OIS_barenstel_foto.png", width: 8cm),
  caption: [Een barenstel: massief koper met vaste aansluitpunten, voor stromen die een klemmenstrook niet aankan.],
  label: <fig:barenstel-foto>,
)

#figure(
  image("assets/OIS_stuurkast_deurbedrading_clean.png", width: 6cm),
  caption: [Termen in de stuurkast: klemmenstrook en barenstel maken elektrische knooppunten, de kabelgoot geleidt de bedrading. Links de correcte deurbedrading (ruime lus in een kous), rechts de fout waarbij draden tussen de scharnierdelen geplet worden.],
  label: <fig:stuurkast-deurbedrading>,
)

== Bevestiging en kabelgeleiding <sec:stuurkast-bevestiging>

Om alle draden overzichtelijk te houden gebruik je een *kabelgoot*: een kunststof goot met sleuven waarin de bedrading gebundeld loopt. Zo blijft de kast traceerbaar en kan je een draad later terugvinden.

Een apart probleem zijn de draden naar de *deur*. Componenten op de deur (drukknoppen, signaallampen, HMI) moeten bedraad worden vanuit de kastbodem, dus die draden moeten over de scharnierlijn heen. Lopen ze los langs het scharnier, dan is de kans reëel dat ze bij het sluiten tussen de scharnierdelen geraken en geplet worden: isolatie stuk, dan kortsluiting.

De oplossing is een *gein* of *kous*: een flexibele mantel waarin alle deurdraden samen gebundeld worden. Die bundel is zo dik dat hij fysiek niet meer tussen de scharnieren van de deur past, en je legt hem met een ruime lus zodat er bij openen en sluiten geen trek op de aders komt. Zie @fig:stuurkast-deurbedrading.

#waarschuwing[
  De kabels zitten dus *niet* in de scharnieren --- ze moeten er net uit blijven. Het scharnier is enkel de plaats waar de bundel overheen moet, en de kous is de bescherming daartegen.
]

De PE-draad (Protective Earth) moet steeds op de voorgeschreven manier aangesloten worden, zodat de aardverbinding van de deur behouden blijft ook als je een component demonteert.

== Ventilatie en kabeldikte <sec:stuurkast-ventilatie>

Alle elektrische componenten zetten een deel van hun vermogen om in warmte. Om die warmte te beperken wordt er soms ventilatie voorzien in de stuurkast.

Als ingenieur moet je daarom ook nadenken over de *kabeldikte*. Dat kan je niet beantwoorden zonder context: je moet weten wat de omgevingstemperatuur is en hoeveel stroom er door de kabel gaat. De stroom veroorzaakt verlies in de kabelweerstand,

$ P_"verlies" = I^2 R, quad R = rho L / A $

met:
- $P_"verlies"$ --- gedissipeerd vermogen in de geleider [W]
- $I$ --- stroom door de geleider [A]
- $R$ --- weerstand van de geleider [$Omega$]
- $rho$ --- soortelijke weerstand van het geleidermateriaal [$Omega dot "m"$]
- $L$ --- lengte van de geleider [m]
- $A$ --- doorsnede van de geleider [m#super[2]]

Een dunnere kabel heeft een kleinere doorsnede $A$, dus een grotere $R$ en meer warmte bij dezelfde stroom. Die warmte moet weg kunnen; in een warme, dicht bedrade kast lukt dat slechter, dus daalt de toegelaten stroom voor eenzelfde doorsnede. Voor de meeste gevallen wordt in een stuurkast gekozen voor kabels met een temperatuurklasse van 75 °C, maar dat is dus niet altijd zo.

== Draadkleuren <sec:stuurkast-draadkleuren>

De kleurcodes moeten gekend zijn:

- / Stuurspanning AC: rood
- / Stuurspanning DC: (donker) blauw
- / Voeding AC: zwart
- / Nulgeleider AC: licht blauw
- / PE-geleider (Protective Earth): geel/groen
- / Permanente spanning: oranje draad of kabel

#figure(
  image("assets/OIS_draadkleuren_foto.png", width: 5cm),
  caption: [De vijf kleuren die je in een stuurkast tegenkomt, van boven naar onder: bruin, grijs, zwart, blauw en geel-groen.],
  label: <fig:draadkleuren-foto>,
)

Een oranje draad staat nog onder spanning als de hoofdschakelaar uit is. Klemmen en toestellen die de hoofdschakelaar niet uitschakelt, moeten gemarkeerd zijn met een zwarte bliksemschicht op een gele driehoek.

Koop je een kabel, dan zijn de aders gekleurd. Zitten er meer dan vijf aders in één kabel, dan worden ze genummerd in plaats van gekleurd, behalve de PE — die is er altijd als de kabel gelabeld is met de letter "G".

#examenbox[
  Onderbouw je een antwoord met een tekening op het examen, dan moeten alle essentiële onderdelen erbij staan: voeding, grond en 0 V. Let op: 0 V en grond zijn niet hetzelfde. 0 V is de referentie van je voedingskring, grond (PE) is de fysieke aardverbinding.
]

== Draadnummers <sec:stuurkast-draadnummers>

#examenbox[
  *Examenvraag:* hoe gaan we draden nummeren in een klemmenstrook?
]

In het schema staan de potentialen als horizontale rails onder elkaar, met de belangrijkste bovenaan. Elke aftakking krijgt de naam van zijn rail:

#figure(
  image("assets/OIS_spanningsrails_standaard.png", width: 11cm),
  caption: [De standaardvolgorde van de rails: $24 "VVS"$, $24 "V"$, $0 "V"$, $0 "VVS"$. Elke draad erft de naam van de rail waar hij aan hangt.],
  label: <fig:spanningsrails>,
)

Het nummer van een draad verandert niet zolang die zich op hetzelfde potentiaal bevindt. Laat je een draad door een verdeelblok of klem lopen, dan blijft het potentiaal gelijk, en dus mag je vóór en na die klem hetzelfde draadnummer gebruiken.

Bij componenten waar het potentiaal wél verschilt voor en na de component — een relaiscontact, een zekering, een schakelaar — moet je andere draadnummers gebruiken. Het criterium is dus niet "is er een component tussen", maar "verandert het potentiaal".

Een kabel krijgt een eigen aanduiding met de letter *W*. In het schema teken je de mantel als een streepjeslijn rond de aders die erin lopen:

#figure(
  image("assets/OIS_kabelaanduiding_W.png", width: 6cm),
  caption: [Kabel `-W21` met twee aders naar klemmenstrook `-X30`. De streepjeslijn is de kabelmantel, geen draad.],
  label: <fig:kabelaanduiding>,
)

De kabelkeuze zelf is sterk situatiegebonden. Denk aan een lift: daar hangt een centrale stalen kabel die de mechanische last draagt, met daarrond een koperen kabel die de stroom levert. Ook zijn sommige kabels beter beschermd tegen scherpe bochten dan andere; de maximale buigradius moet te allen tijde gerespecteerd worden.

== Belangrijke symbolen <sec:stuurkast-symbolen>

De terminal marking vind je terug bij componenten zoals motoren. De geleider heet L1, maar de klem op de motor is gemerkt met U:

#figure(
  image("assets/OIS_terminal_marking_clean.png", width: 11cm),
  caption: [Geleider, potentiaalnaam, klemmarkering en symbool voor de AC- en DC-geleiders.],
  label: <fig:terminal-marking>,
)

Dezelfde lijst in de notatie die wij in het schema gebruiken, met de veilige spanning erbij:

#figure(
  image("assets/OIS_klem_potentiaal_clean.png", width: 11cm),
  caption: [Potentialen en klemaanduidingen zoals ze in de Groep T-schema's staan. De PE-etageklem zit altijd onderaan.],
  label: <fig:klem-potentiaal-stuurkast>,
)
