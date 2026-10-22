#import "../../school-template.typ": *

= Introductie <ch:introductie>

// Bron: Slides/1.Inleiding.pdf, Slides/1.Stroming in leidingen/02. Stroming in leidingen.pdf (slides 2–3)

== Info vak <sec:info-vak>

Thermomechanische machines en installaties (T3OTM1) wordt gegeven door Dries Haeseldonckx en Maarten Vanierschot. Het doel is dat je vertrouwd raakt met de werking van thermomechanische machines, zowel theoretisch als praktisch, en dat je ze correct kan selecteren en dimensioneren:

- een correcte keuze maken tussen de verschillende uitvoeringsvormen, afhankelijk van de toepassing;
- de machines in een systeem implementeren en hun onderlinge wisselwerking begrijpen;
- relevante informatie opmeten en verwerken.

*Voorkennis*: fysica, wiskunde en basisthermodynamica.

=== Inhoud <sec:inhoud>

Volgens de studiewijzer behandelt het vak:

- stroming in leidingen / wet van Bernoulli (herhaling van Warmte en stromingen);
- pompen;
- compressoren en ventilatoren;
- vochtige lucht en HVAC;
- turbines;
- inwendige verbrandingsmotoren;
- thermodynamische cycli.

Stroming in leidingen wordt door een andere prof gegeven en staat los van de andere delen. De les is vooral een sterk ingekorte herhaling van stromingen. Ze behandelt de wet van Bernoulli, stromingsregimes, wrijvingsverliezen (major losses) en vormwrijvingsverliezen (minor losses).

=== Studiemateriaal en organisatie <sec:organisatie>

- Cursustekst, powerpoints en nota's; die vullen elkaar aan.
- Handboek (niet verplicht): Çengel, Cimbala & Turner, _Fundamentals of Thermal-Fluid Sciences_, 5e editie, hoofdstukken 9, 12 en 14.
- Hoorcolleges (28 u), oefenzittingen (6 × 2 u) en labo's (5 × 3 u): centrifugaalpompen, Peltonturbine + stroming in leidingen, inwendige verbrandingsmotor, koelmachine, compressor.

== Exameninfo <sec:exameninfo>

Het eindresultaat is het examenresultaat (hoorcollege + oefeningen) plus een bonus/malus van de labo's.

#table(
  columns: (auto, 1fr),
  stroke: 0.5pt + luma(180),
  inset: 6pt,
  table.header([*Onderdeel*], [*Inhoud*]),
  [Examen], [Schriftelijk, gesloten boek, met formularium en appendix (zie Toledo).],
  [Oefening (50 %)], [Eén oefening.],
  [Theorie (50 %)], [Open vraag (75 %) + meerkeuzevragen met giscorrectie (25 %).],
  [Labo's (−3/+3)], [Voorbereiding, medewerking en verslagen (50 %) + individuele schriftelijke test (50 %).],
)

#examenbox[
  De open theorievraag is één grote vraag. Bij turbines en motoren kan die een afleiding vragen. Bij stroming in leidingen moet je uitleggen *waarom* en tonen dat je het begrijpt: welke parameters spelen mee, welke marges en welke effecten.
]

Hoe bereid je je voor? Niet van buiten leren en je niet beperken tot het invullen van enkele basisformules. Wel:

- de werkingsprincipes begrijpen;
- de interactie tussen de verschillende onderdelen correct inschatten;
- het volledige systeem beschouwen;
- kritische zin en creativiteit tonen.

=== Waarom dit vak? <sec:nut>

Het gaat over alledaagse toestellen in de industrie. Je moet hun werkingsprincipe begrijpen, hoe ze op elkaar inwerken en welke impact ze op het hele systeem hebben. Dat is belangrijk in het energiedebat: efficiëntere componenten (pompen, stoom, perslucht) verhogen het gemiddelde rendement met 2–5 %, maar het hele systeem optimaliseren levert 20–30 % op, met een terugverdientijd onder twee jaar. Naar schatting is 75 % van de industriële pompen overgedimensioneerd, waardoor ze niet in hun ideale werkingspunt draaien. Daarom blijft de industrie zoeken naar een betere efficiëntie van alle onderdelen, ook van de leidingsystemen.

= Basisbegrippen <ch:basisbegrippen>

== Energie en eenheden <sec:eenheden>

Werk altijd in SI-eenheden: de meeste fouten in thermodynamica zijn eenheidsfouten.

#table(
  columns: (auto, auto, 1fr),
  stroke: 0.5pt + luma(180),
  inset: 6pt,
  table.header([*Grootheid*], [*Eenheid*], [*In basiseenheden*]),
  [Kracht], [$"N"$], [$"kg" dot "m" slash "s"^2$],
  [Energie, arbeid], [$"J" = "N" dot "m"$], [$"kg" dot "m"^2 slash "s"^2$],
  [Vermogen], [$"W" = "J" slash "s"$], [$"kg" dot "m"^2 slash "s"^3$],
  [Druk], [$"Pa" = "N" slash "m"^2$], [$"kg" slash ("m" dot "s"^2)$],
  [Specifieke energie], [$"J" slash "kg"$], [$"m"^2 slash "s"^2$],
)

Handig om te onthouden: $1 thin "kWh" = 3600 thin "kJ"$.
