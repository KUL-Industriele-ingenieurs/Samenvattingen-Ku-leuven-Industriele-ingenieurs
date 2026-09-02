#import "../../school-template.typ": *

= De stuurkast en het voorbeeldschema <ch:voorbeeld-diagram>

Dit hoofdstuk gaat over alles wat tussen het schema en de werkende machine zit: hoe je een stuurkast fysiek bouwt, welke draad je waar gebruikt, hoe je klemmen en potentialen benoemt, en hoe de noodstop in de voeding verweven zit.

== De stuurkast: praktische aspecten

- *Materiaal:* gepoederlakt staal, RVS of kunststof. #belangrijk[Metaal is meestal veiliger], onder meer omdat je het kan aarden en het als afscherming werkt.
- *Draad:* gebruik #strong[soepele] draad, VTBST of VOBST.
- *Wartels* (kabeldoorvoeren) voorzien, meestal aan de onderkant via een wartelplaat. De gaten daarvoor maak je met een #keyterm[knockout punch].
- *Hoofdschakelaar:* meestal op de zijkant. #belangrijk[Rood op een gele achtergrond als hij ook als noodstop kan dienen, anders zwart.] Voorzie een hangslotbevestiging als hij ook als scheider moet kunnen werken.
- *Werkschakelaars* bij de motoren, ook met hangslotbevestiging.
- *Labelen:* niet alleen de componenten, ook de kabels krijgen een label.
- *Aardrail:* onderaan in de kast loopt een koperen rail. Elk onderdeel groter dan $5 times 5$ cm moet daarop geaard zijn, en de metalen kast zelf ook.
- Niet-elektrische onderdelen (pneumatiek, hydrauliek, mechanica) horen #strong[niet] in een stuurkast.

#concept(title: "Drie soorten hulpmiddelen, niet door elkaar halen")[
  - / Elektrisch knooppunt maken: klemmenstrook en barenstel, ze verbinden draden op hetzelfde potentiaal.
  - / Bedrading geleiden: kabelgoot en polyesterkous, ze bepalen waar de draden fysiek lopen.
  - / Mechanisch ontkoppelen: wartel en trekontlasting, ze houden trekkracht weg van de klem.
]

#wrap-figure(
  image("assets/OIS_barenstel.png", width: 7.5cm),
  caption: [Barenstel, adereindhuls, aardingsrail en trekontlasting.],
  label: <fig:barenstel>,
)[
  Een #keyterm[barenstel] (busbar) is een set stroomrails waarmee je hoog AC-vermogen verdeelt over meerdere afgaande kringen, zonder dat je tien dikke draden op één klem moet krijgen.

  In hetzelfde rijtje horen nog drie praktische zaken thuis:
  - De #keyterm[adereindhuls], die je op soepele draad perst zodat losse adertjes netjes gebundeld blijven;
  - De #keyterm[aardingsrail] voor centrale potentiaalvereffening;
  - De #keyterm[kabeltrekontlasting], die de mechanische trekkracht van de kabel opvangt in plaats van de klem.
]

#figure(
  image("assets/OIS_barenstel_foto.png", width: 7.5cm),
  caption: [Een barenstel in het echt: massief koper met vaste aansluitpunten, voor stromen die een klemmenstrook niet aankan.],
  label: <fig:barenstel-foto>,
)

=== Bevestiging

- *Kabelgoot* voor de bedrading.
- *DIN-rail* van $35 "mm"$, in lage of hoge uitvoering.
- *Polyesterkous* waar je draadbundels wil beschermen.
- *Juist aanhaalmoment.* Ervaring is de snelste methode, eventueel met een slipkoppeling op de schroevendraaier.

#belangrijk[Te vast aandraaien beschadigt de klem, te los geeft een overgangsweerstand en dus warmte.] Dat laatste is een klassieke brandoorzaak in een kast.

*De draden naar de deur.* Drukknoppen, signaallampen en de HMI zitten op de deur, maar worden gevoed vanaf de montageplaat. Die draden moeten dus over de scharnierlijn. Lopen ze los langs het scharnier, dan worden ze bij het sluiten geplet en is de isolatie stuk.

De oplossing is een #keyterm[polyesterkous] rond alle deurdraden samen. Die bundel is te dik om nog tussen de scharnierdelen te passen, en je legt hem met een ruime lus zodat er bij openen en sluiten geen trek op de aders komt.

#figure(
  image("assets/OIS_stuurkast_deurbedrading_clean.png", width: 6cm),
  caption: [Links de correcte deurbedrading met een ruime lus in een kous, rechts de fout waarbij de draden tussen de scharnierdelen geraken.],
  label: <fig:stuurkast-deurbedrading>,
)

=== Ventilatie en condition monitoring

Elke component in de kast zet een deel van zijn vermogen om in warmte: voedingen, drives, contactoren, klemmen met overgangsweerstand. Zonder afvoer stijgt de binnentemperatuur, en dat verkort de levensduur van de elektronica.

Ventileren doe je met een filterventilator plus uitlaatrooster, of met een koelunit als de omgeving zelf te warm of te vuil is.

=== Condition monitoring <sec:condition-monitoring>

Met de data-analyse van Industrie 4.0 komt ook #keyterm[condition monitoring] van stuurkasten op. De slides noemen als voorbeeld het Turck IM18-CCM cabinet guard system.

#belangrijk[Hoe constanter de omstandigheden in de kast, hoe lager het risico op uitval.] Je bewaakt daarom typisch de temperatuur, de vochtigheid en de vervuiling van het filter.

=== Bouwvolgorde

De slides geven een vaste volgorde:

+ De montageplaat verwijderen.
+ Goten en componenten passen. Zorg voor genoeg ruimte om te monteren, en #belangrijk[denk aan de hoofdschakelaar]. Boorgaten aftekenen.
+ De plaat en de kast(deur) boren, tappen en ponsen.
+ Wartels monteren.
+ Goten en DIN-rails op de montageplaat monteren.
+ Componenten en klemmen bevestigen, en alles labelen.
+ De montageplaat bedraden, draadnummers aanbrengen, eventueel uittesten.

#belangrijk[De volgorde is niet willekeurig.] Je boort en ponst met de plaat uít de kast, want anders komen metaalspaanders tussen je componenten terecht. En je labelt vóór je bedraadt, want daarna kom je er niet meer bij.

== Draden en kabels

De maximale stroom door een geleider hangt af van drie dingen:

+ de maximale temperatuur die de isolatie aankan;
+ de omgevingstemperatuur;
+ de ventilatiemogelijkheden.

De stroom veroorzaakt verlies in de kabelweerstand, en dat verlies wordt warmte:

$ P_"verlies" = I^2 R, quad R = rho L / A $

met:
- $P_"verlies"$: gedissipeerd vermogen in de geleider [W]
- $I$: stroom door de geleider [A]
- $R$: weerstand van de geleider [$Omega$]
- $rho$: soortelijke weerstand van het geleidermateriaal [$Omega dot "m"$]
- $L$: lengte van de geleider [m]
- $A$: doorsnede van de geleider [m#super[2]]

Een dunnere kabel heeft een kleinere $A$, dus een grotere $R$ en meer warmte bij dezelfde stroom. Die warmte moet weg kunnen, en in een warme dicht bedrade kast lukt dat slechter. Daarom daalt de toegelaten stroom voor dezelfde doorsnede. In een stuurkast neem je meestal kabel van temperatuurklasse $75 degree"C"$. De sectie zelf haal je uit de tabellen van de norm.

#belangrijk[In een stuurkast gelden veel lagere waarden dan in het AREI.] De reden is precies punt 2 en 3: in een dichte kast, tussen andere warme componenten en in een gesloten kabelgoot, kan dezelfde draad veel minder stroom voeren dan in een woninginstallatie.

=== Draadkleuren

#examenbox[Deze kleurcodes moet je van buiten kennen, behalve wat in de slides cursief staat.]

De norm EN 60204:2016+A1:2021 legt vast:

#table(
  columns: (auto, 1fr),
  align: (left, left),
  stroke: none,
  inset: 5pt,
  table.hline(stroke: 1pt),
  table.header([*Kleur*], [*Gebruik*]),
  table.hline(stroke: 0.5pt),
  [GROEN/GEEL (tweekleurig)], [PE, de beschermingsgeleider],
  [ZWART], [AC- en DC-vermogenkringen],
  [LICHTBLAUW (RAL 5024)], [AC-nulgeleider N],
  [ROOD], [AC-stuurkringen],
  [BLAUW (RAL 5015)], [DC-stuurkringen],
  [ORANJE], [uitgezonderde kringen: #strong[niet] afgeschakeld door de hoofdschakelaar],
  table.hline(stroke: 1pt),
)

#belangrijk[Oranje betekent: hier staat mogelijk nog spanning op nadat je de hoofdschakelaar uitgezet hebt.] Dat is de gevaarlijkste draad in de kast. Klemmen en toestellen die de hoofdschakelaar niet uitschakelt, moeten gemarkeerd zijn met een zwarte bliksemschicht op een gele driehoek.

#wrap-figure(
  image("assets/OIS_draadkleuren_foto.png", width: 3.5cm),
  caption: [De aders in een kabel],
  label: <fig:draadkleuren-foto>,
)[
  Op @fig:draadkleuren-foto zie je de aders zoals je ze in een meeraderige kabel aantreft, van boven naar beneden: bruin (L1), grijs (L3), zwart (L2), lichtblauw (N) en geel-groen (PE).

  De drie fasen zijn dus bruin, zwart en grijs. De nulgeleider is #strong[licht]blauw, en niet zomaar blauw: donkerblauw mag je voor iets anders gebruiken. De beschermingsgeleider is altijd geel-groen, en die combinatie mag je voor niets anders inzetten.
]

=== De beschermingsgeleider <sec:pe-identificatie>

De PE moet altijd herkenbaar zijn aan zijn vorm, plaats, markering of kleur:

- Gebeurt de identificatie #strong[alleen] met kleur, dan moet de combinatie groen-geel over de #strong[volledige lengte] gebruikt worden.
- Is de geleider makkelijk te herkennen aan zijn vorm, positie of constructie, of is hij niet vlot bereikbaar of deel van een meeraderige kabel, dan is kleurcodering over de volledige lengte niet nodig.
- Is hij niet over zijn volledige lengte zichtbaar, dan moeten de #strong[uiteinden] of de bereikbare plaatsen duidelijk gemarkeerd zijn: met het grafische symbool, met de letters PE, of met groen-geel.

=== Bedrijfsstandaarden <sec:bedrijfskleuren>

Sommige bedrijven gebruiken bijkomend:

- *paars:* DC-signaaldraden;
- *wit:* alternatief voor $0 "V"$ in DC- en analoge kringen;
- *grijs:* analoge signalen;
- *geel:* soms voor veiligheidskringen.

Voor de aders #strong[in] een kabel geldt HD-308 S2, bijvoorbeeld bruin (L1), zwart (L2), grijs (L3), geel/groen (PE).

#figure(
  image("assets/OIS_en60204_kleuren.png", width: 15cm),
  caption: [Voorbeeld van de kleurcodering volgens EN 60204:2016+A1:2021.],
  label: <fig:en60204-kleuren>,
)

=== Draadnummers

#figure(
  image("assets/OIS_draadnummers_clean.png", width: 11cm),
  caption: [Draadnummering volgt het potentiaal],
  label: <fig:draadnummers>,
)
Draadnummers aanbrengen is #strong[niet verplicht], maar in de industriële praktijk sterk aanbevolen voor traceerbaarheid.

- *Basisregel*: Een draadnummer representeert een *potentiaal*. Het nummer verandert na elk schakelelement (schakelaar, relaiscontact, zekering), maar blijft gelijk doorheen klemmen en doorverbindingen.
- Kabels worden gelabeld met de codeletter `-W`. In het schema teken je de kabelmantel als een streepjeslijn rond de aders die erin lopen.

#figure(
  grid(
    columns: 2,
    column-gutter: 0.5cm,
    image("assets/OIS_spanningsrails_standaard.png", width: 8cm),
    image("assets/OIS_kabelaanduiding_W.png", width: 4.5cm),
  ),
  caption: [Links de rails in de vaste volgorde $24 "VVS"$, $24 "V"$, $0 "V"$, $0 "VVS"$; elke aftakking erft de naam van zijn rail. Rechts kabel `-W21` met twee aders naar klemmenstrook `-X30`.],
  label: <fig:spanningsrails>,
)


=== Kabels en kabelrupsen

Een #keyterm[cable carrier], ook drag chain, energy chain of kabelrups genoemd, houdt kabels en slangen binnen hun #strong[minimale buigradius] bij bewegende machinedelen.

#belangrijk[Een kabel beschermen tegen beschadiging is beter dan achteraf een beveiliging plaatsen die de schade moet opvangen.]

== Klemmen en stekkers <sec:klemmen>

Klemmenstroken en stekkers zijn verbindingsmiddelen. Ze krijgen de kenletter `X` en worden genummerd. De klemmen zelf nummer je met Arabische cijfers of met letters.

- #keyterm[Jumperbars] (bruggen) gebruik je om potentialen door te verbinden, typisch bij de verdeling van de voeding.
- #keyterm[Etageklemmen] zijn handig om bijvoorbeeld driedraadsensoren aan te sluiten. Meestal hoort per verdieping één potentiaal. #belangrijk[De $0 "V"$ sluit je typisch aan op de onderste etage.]

=== Klem- en potentiaalaanduidingen <sec:klem-potentiaal>

#examenbox[Deze tabel moet je van buiten kennen.]

#table(
  columns: (1fr, auto, auto),
  align: (left, center, center),
  stroke: none,
  inset: 5pt,
  table.hline(stroke: 1pt),
  table.header([*Geleider*], [*Potentiaal*], [*Klem*]),
  table.hline(stroke: 0.5pt),
  [AC lijn 1], [L1], [U],
  [AC lijn 2], [L2], [V],
  [AC lijn 3], [L3], [W],
  [Nulgeleider], [N], [N],
  [Beschermingsgeleider], [PE], [PE],
  [DC positief], [24 VDC], [$+$ (etageklem: b)],
  [DC negatief], [0 V], [$-$ (etageklem: b of c)],
  [Veilige spanning], [24 VVS of 24 VSV], [(etageklem: a)],
  table.hline(stroke: 1pt),
)

Bij een etageklem staat de PE #belangrijk[altijd onderaan].

=== Klemmen en potentialen


#figure(
  image("assets/OIS_klem_potentiaal_clean.png", width: 11cm),
  caption: [Klem- en potentiaalaanduidingen zoals ze in dit vak gebruikt worden.],
  label: <fig:klem-potentiaal>,
)
De volgorde waarin je potentialen op een schema voorstelt ligt vast, van boven naar onder en van links naar rechts: #strong[L1, L2, L3, N, PE].


=== Aanhaalkoppel <sec:torque>

Elke klem heeft een voorgeschreven kabeltype, draadsectie en aanhaalkoppel, afhankelijk van de steek (pitch) van de klemmenstrook, bijvoorbeeld $#"3,81" "mm"$ of $#"5,08" "mm"$. Die staan in de handleiding van de fabrikant.

=== Klemmen tegenover stekkers <sec:klemmen-stekkers>

- *Klemmen:* tijdrovend bij vervanging van een onderdeel, risico op fout aansluiten.
- *Stekkers:* sneller te vervangen en geen risico op foute aansluiting.

Volgens EN 60204:A1-2021 mag je twee of meer geleiders alleen op één klem aansluiten als die klem daarvoor ontworpen is. #belangrijk[Voor de beschermingsgeleider geldt: slechts één PE per aansluitpunt.]

== Differentiële signalering en afscherming <sec:differentiele-signalering>

Tot hier gebruikte je één gemeenschappelijke spanningsreferentie voor een reeks ingangen. Bij #keyterm[differentiële signalering] gebruik je #strong[twee] geleiders per ingang: de signaaldraad én een eigen referentie voor die ene ingang.

De referentiespanning zou je kunnen delen of aan $0 "V"$ hangen, #belangrijk[maar dan verlies je precies het voordeel van differentiële signalering]. Voor analoge signalen is dat onaanvaardbaar. Voor trage digitale signalen kan het soms wel.


#figure(
  image("assets/OIS_differentiele_signalering_clean.png", width: 12cm),
  caption: [Differentiële signalering: elke ingang krijgt zijn eigen signaaldraad én referentie, samengedraaid tot een twisted pair.],
  label: <fig:differentiele-signalering>,
)
Het voordeel zit in de #keyterm[twisted pair]: doordat de twee draden om elkaar gedraaid zijn, koppelt een storend veld even sterk in op beide draden. De ontvanger kijkt naar het #strong[verschil], en de storing valt weg.


=== Afscherming <sec:afscherming>

Geleiders voor communicatie- of meetsignalen dragen #strong[zwakke] signalen naar een #strong[hoogohmige] ingang. Lange geleiders gedragen zich dan als antenne. Om de ontvangst van storing te beperken gebruik je een afgeschermde kabel: een gevlochten metalen mantel rond de aders.

Daarom aard je de afscherming van een signaalkabel #strong[aan één kant], meestal aan de stuurkastzijde. Let op het contrast met de motorkabel van een VFD uit @sec:cw-ccw: die afscherming sluit je juist aan #strong[beide] kanten aan, want daar wil je de hoogfrequente stoorstroom net wél afvoeren.

#waarschuwing[
  Verbind je #belangrijk[beide] uiteinden van de mantel met de aarde, dan kan er een stroom door die mantel gaan lopen. Die stroom veroorzaakt wisselende spanningen op de mantel, en die koppelen capacitief in op het communicatie- of meetsignaal. Je hebt de storing dan zelf gemaakt.
]

== Kleurcodes en symbolen

Volgens EN 60204-1 gelden vaste kleurcodes voor de bedieningselementen en signaallampen aan de machine.

#belangrijk[De startknop is bij voorkeur wit, niet groen.] Rood is voorbehouden voor gevaar en de noodstop. Blauw betekent een verplichte handeling zoals reset, zwart en wit zijn voor normale bediening.

#table(
  columns: (auto, auto, 1fr, auto, auto),
  align: (left, left, left, left, left),
  stroke: none,
  inset: 4pt,
  table.hline(stroke: 1pt),
  table.header([*Drukknop*], [*Voorkeur*], [*Alternatief*], [*Lamp*], [*Voorkeur*]),
  table.hline(stroke: 0.5pt),
  [Start], [wit], [groen, grijs, zwart], [In, bevestiging], [wit],
  [Noodstop], [rood], [], [Uit, gevaar], [rood],
  [Stop], [zwart], [grijs, rood, wit], [Fout], [geel],
  [Reset], [blauw], [grijs, wit, zwart], [Ingrijpen], [blauw],
  table.hline(stroke: 1pt),
)

EN 60204:2016 voerde daarnaast een reeks nieuwe grafische symbolen in voor machineveiligheid.

== Veilige spanning

De IEC deelt spanning in drie bereiken in, elk met een eigen bepalend risico:

#table(
  columns: (1fr, auto, auto, auto),
  align: (left, center, center, left),
  stroke: none,
  inset: 5pt,
  table.hline(stroke: 1pt),
  table.header([*IEC-spanningsbereik*], [*AC (V, rms)*], [*DC (V)*], [*Bepalend risico*]),
  table.hline(stroke: 0.5pt),
  [Hoogspanning], [$> 1000$], [$> 1500$], [vlamboog],
  [Laagspanning], [$50$ -- $1000$], [$120$ -- $1500$], [elektrische schok],
  [Zeer lage spanning (ELV)], [$< 50$], [$< 120$], [laag risico],
  table.hline(stroke: 1pt),
)

- #keyterm[ELV] = Extra-Low Voltage, de veiligheidsspanning.
- #keyterm[PELV] = Protected Extra-Low Voltage.
- #keyterm[SELV] = Separated of Safety Extra-Low Voltage.

=== PELV tegenover SELV <sec:pelv-selv>

IEC 61140 definieert een PELV-systeem als een systeem waarin de spanning onder normale omstandigheden de ELV-grens niet kan overschrijden, en ook niet bij een enkelvoudige fout, behalve bij aardfouten in andere kringen.

Het verschil met SELV zit in de aarding:

- Een PELV-kring vereist alleen scheiding van alle kringen #strong[behalve] SELV en PELV. Ze mag dus verbonden zijn met andere PELV-systemen #belangrijk[en met de aarde].
- Een SELV-kring mag géén beschermende aardverbinding hebben.

Beide vereisen een ontwerp dat toevallig contact met een hogere spanning zo goed als uitsluit. Bij een transformator betekent dat: primaire en secundaire wikkeling gescheiden door versterkte isolatie, of door een geleidend scherm met aardverbinding, of een secundaire wikkeling met een geaarde klem, zodat een fout tussen primair en secundair automatisch afschakelt.

#belangrijk[Daarom werkt de stuurkring op $24 "VDC"$ met geaarde $0 "V"$: dat is een PELV.] Je zit onder de ELV-grens, dus het risico op een schok is laag, én je hebt een aardreferentie om mee te meten en storingsvrij te werken.

=== SMPS: schakelende voeding <sec:smps>

Je ontwerpt installaties volgens EN 60204. Behalve bij zeer kleine installaties gebruik je daarom altijd een stuurspanning die #strong[galvanisch gescheiden] is van het voedende net, en waarvan de $0 "V"$ geaard is. Bij voorkeur $24 "VDC"$, dus een PELV.

Vroeger deed je dat met een gewone transformator, eventueel gevolgd door een gelijkrichter en een afvlakcondensator. Vandaag gebruik je een #keyterm[SMPS] (Switched-Mode Power Supply).

=== Verliezen in een klassieke transformator <sec:trafo-verliezen>

Wervelstromen in de kern wekken een tegen-EMK op. Om die te beperken gebruik je:
- een #strong[gelamelleerde] zachtijzeren kern: lange stroompaden met weinig oppervlak;
- of een #strong[zacht ferriet], met een hoge elektrische weerstand.

Daarbij hoort de BH-curve. $H_c$ is de #keyterm[coërcitieve veldsterkte]: de veldsterkte die je moet aanleggen om de remanente flux $B_r$ weer op nul te krijgen. Hoe breder de lus, hoe hoger de coërciviteit en hoe groter het verlies per cyclus.

*Ferrieten* zijn harde, brosse keramieken met ijzeroxide. #belangrijk[Zachte ferrieten hebben een lage coërciviteit], en dus weinig verlies per magnetisatiecyclus. Dat maakt ze geschikt voor hoge frequenties.

=== Werking van een SMPS <sec:smps-werking>

+ Het net wordt gelijkgericht en voedt een DC-bus, dus een condensator.
+ Die spanning wordt op #strong[hoge frequentie] gehakt.
+ Het gehakte signaal gaat naar een transformator.
+ Aan de secundaire zijde wordt het opnieuw gelijkgericht, om een tweede DC-bus te voeden.
+ Een galvanisch gescheiden terugkoppeling naar de PWM-driver regelt de uitgangsspanning.

#figure(
  image("assets/OIS_smps_blokschema_clean.png", width: 15cm),
  caption: [Blokschema van een SMPS: gelijkrichten, DC-bus, hakken op hoge frequentie, transformator, opnieuw gelijkrichten, met een teruggekoppelde PWM-sturing.],
  label: <fig:smps-blokschema>,
)

=== Waarom hoge frequentie helpt <sec:smps-frequentie>

Gelijkgericht net van $50 "Hz"$ geeft een spanning van $100 "Hz"$ met een flinke rimpel. De afvlakcondensator moet de #strong[dalen] tussen de toppen opvullen.

- Bij $50 "Hz"$ zijn die dalen #strong[breed], dus heb je een #strong[grote] condensator nodig. Treedt er een kortsluiting op, dan ontlaadt die grote condensator zich plots en houdt hij een grote stroom in stand. Dat wil je niet.
- Bij een #strong[hogere] frequentie is er minder energie nodig om de dalen te vullen, dus volstaat een #strong[kleinere] condensator. Bij kortsluiting ontlaadt die minder energie in de fout.

Een SMPS werkt op $10 "kHz"$ tot zelfs $1 "MHz"$, tegenover $50 "Hz"$ voor het net.

In een transformator wordt vermogen overgedragen door de #strong[verandering] van de flux. Doordat de kern van een SMPS uit zacht ferriet bestaat, kan je die zeer hoge frequenties gebruiken zonder de verliezen die een zachtijzeren kern zou geven. #belangrijk[Zo transformeert een compacte kern veel vermogen.]

=== De voordelen op een rij <sec:smps-voordelen>

Vergeleken met een transformator met gelijkrichter en condensator is een SMPS:
- #strong[kortsluitvast];
- lage kortsluitstroom, dankzij de kleine secundaire condensator;
- stabiele en correcte spanning dankzij de terugkoppellus, onafhankelijk van de belasting;
- compact en licht;
- hoog rendement.

== Stop of noodstop?

#belangrijk[EN 60204: stop heeft altijd voorrang op andere bevelen.]

- *Stopknop* = een #strong[zachte stop] via de machinesturing, stopcategorie 2. Meestal een rode of zwarte drukknop.
- *Noodstop* = een #strong[harde stop] via het noodstoprelais, stopcategorie 0 of 1. Typisch een paddenstoeldrukknop die je door draaien of met een sleutel weer gebruiksklaar maakt.

In beide gevallen heb je minstens één N.C.-contact, soms met mechanisch gedwongen contacten.

De noodstop zelf is genormeerd in #keyterm[EN 13850].

=== Het 24 VVS-principe <sec:24vvs>

#wrap-figure(
  image("assets/OIS_noodstop_resetknop.png", width: 5cm),
  caption: [Noodstopkast: de rode paddenstoelknop op geel, met erboven de blauwe resettoets.],
  label: <fig:24vvs>,
)[
  De noodstopkring maakt een "veilige" voedingsspanning: de #keyterm[24 VVS] (ook 24 VSV geschreven).

  #belangrijk[Alle gevaarlijke bewegingen hangen af van die veilige spanning.] Valt ze weg, dan valt elke gevaarlijke actuator stil.

  Noodstoppen staan meestal #strong[in serie]: paddenstoeldrukknoppen, trekkoorden, lichtgordijnen, deurbeveiligingen, drukmatten, camerasystemen.

  Om de $24 "VVS"$ weer te activeren zijn er #belangrijk[altijd twee bewuste handelingen] nodig:
  + de noodstop ontgrendelen of loslaten;
  + daarna de resettoets indrukken, "sturing in", in het blauw.

  #wrap-figure(
  image("assets/OIS_hoofdschakelaar_rood_geel.png", width: 4cm),
  caption: [Hoofdschakelaar rood op geel],
  label: <fig:hoofdschakelaar-rood-geel>,
)[
  Een hoofdschakelaar #strong[rood op geel] heeft een secundaire noodstopfunctie. Zwart op grijs heeft die niet: dan is het een gewone hoofdschakelaar. Aan de kleur alleen zie je dus al of iemand hem in nood mag gebruiken.

  #belangrijk[Rood op geel mag alleen in combinatie met een gewone noodstopkring], zodat ook daar twee bewuste handelingen nodig zijn om te herstarten. Zonder die kring zou één draai aan de schakelaar de machine weer starten.
]
]

=== Lichtgordijn tegenover safety scanner <sec:lichtgordijn-scanner>

Een #keyterm[lichtgordijn] bewaakt een #strong[vlak]: een reeks lichtstralen tussen een zender en een ontvanger. Onderbreek je één straal, dan schakelt het uit.

Een #keyterm[safety scanner] bewaakt een #strong[oppervlak] met een roterende laser. Je kan er zones in programmeren, bijvoorbeeld een waarschuwingszone en een stopzone.

=== Niet alles uitschakelen <sec:noodstop-niet-alles>

#waarschuwing[
  Bij een noodstop schakel je #belangrijk[niet alles] uit. Enkele voorbeelden waarom:

  - de PLC moet actief blijven om te weten wat de toestand van de machine is, en om de fout te kunnen tonen;
  - een rem die actief gestuurd wordt mag je niet zomaar spanningsloos maken;
  - een verticale as kan naar beneden vallen als je de houdkracht wegneemt;
  - verlichting en signalisatie moeten blijven werken.

  Vergelijk met de "abort" uit @sec:machinebediening: dáár is de PLC de machine wél volledig kwijt, en dat is wat je met een goed ontworpen noodstop vermijdt.
]

== Het voorbeeldschema

Het voorbeeldschema uit bijlage B van de slides brengt alles uit dit hoofdstuk samen: de vermogenkringen bovenaan, daaronder de stuurkringen, met de PLC, de klemmenstroken, de noodstopkring en de $24 "VVS"$.

#figure(
  image("assets/OIS_voorbeeldschema_plc.png", width: 12cm),
  caption: [Het voorbeeldschema met PLC uit bijlage B van de slides.],
  label: <fig:voorbeeldschema-plc>,
)

Loop het schema na met de checklist uit dit hoofdstuk:

+ Staan de vermogenkringen vóór de stuurkringen?
+ Klopt de volgorde van de potentialen: L1, L2, L3, N, PE?
+ Heeft elke externe verbinding een klem, en klopt de klemnummering met de draadnummers?
+ Verandert elk draadnummer na een schakelaar, en niet na een klem?
+ Zijn de oranje draden, die de hoofdschakelaar niet afschakelt, als zodanig herkenbaar?
+ Hangen alle gevaarlijke bewegingen aan de $24 "VVS"$?

Voor het opsporen van fouten teken je daarnaast de #strong[functional drawings]: per actuator één blad met alle componenten die bepalen of die actuator werkt. Zie @sec:functionele-schemas.
