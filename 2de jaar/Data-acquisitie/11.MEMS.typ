#import "../../school-template.typ": *
#import "examenvraag.typ": examenvraag

// BRON: Slides/11.mems.pdf (slide 2-18) | Samenvatting DAQ p.45-48 | examenvragen 2019, oefenvraag E20

= MEMS <ch:mems>

MEMS (Micro-Electro-Mechanical Systems) zijn mechanische en elektrische onderdelen van enkele micrometer groot op één siliciumchip. Ze worden gemaakt door micromachining: silicium wordt bewerkt tot kleine mechanische structuren. Zo ontstaan sensoren en actuatoren die vaak als één component zijn verpakt.

Een condensator kan veel kleiner gemaakt worden dan een weerstand of een spoel. Daarom is de capacitieve uitlezing in MEMS het gebruikelijkst.

== Capacitieve MEMS-accelerometer <sec:mems-cap>

Een capacitieve MEMS-accelerometer meet versnelling met een differentiële condensator van enkele micrometer groot. Het is de seismische massa-veer-demper uit hoofdstuk @ch:versnelling, nu uit silicium. De massa heeft vingers die tussen vaste vingers (de platen van de condensator) grijpen. Elk paar vingers vormt een condensator, en de massa hangt aan veren.

#grid(
  columns: (1.2fr, 1fr),
  gutter: 1em,
  align: horizon,
  figure(
    image("assets/L11-kam-rust.png", width: 100%),
    caption: [Kamstructuur in rust en onder versnelling: de massa verschuift ten opzichte van de vaste platen (slide 2)],
    label: <fig:L11-kam-rust>,
  ),
  figure(
    image("assets/L11-kam-structuur.png", width: 100%),
    caption: [Seismische massa, veren, ankers en sensing fingers (slide 3)],
    label: <fig:L11-kam-structuur>,
  ),
)

Bij een versnelling blijft de massa achter. Elke bewegende vinger komt dan dichter bij de ene vaste plaat en verder van de andere. Daardoor stijgt de ene capaciteit $C_1$ en daalt de andere $C_2$. De ratiometrische uitlezing is

#frm(
  "Differentiële capacitieve uitlezing",
  $ (C_1 - C_2) / (C_1 + C_2) = (Delta d) / d_0 $,
  [De verhouding van het verschil en de som van beide capaciteiten is evenredig met de uitwijking van de massa.],
)

met:
- $C_1$, $C_2$ --- capaciteit van de twee condensatoren [F]
- $Delta d$ --- verschuiving van de massa [m]
- $d_0$ --- plaatafstand in rust [m]

Deze uitlezing is dezelfde als bij de differentiële capacitieve sensor (hoofdstuk @ch:capacitief). Een capacitieve MEMS-accelerometer meet ook een constante versnelling, want een stabiele uitwijking geeft een stabiele capaciteit. De platen bewegen slechts enkele micrometers, dus de meting vraagt een nauwkeurige elektronica en een terugkoppeling.

#figure(
  image("assets/L11-cap-doorsnede.png", width: 11cm),
  caption: [Doorsnede met $C_1$ en $C_2$ rond de seismische massa tussen twee elektroden (slide 9)],
  label: <fig:L11-cap-doorsnede>,
)

*Voorbeeld ADXL50.* De chip meet $500 times 625$ $mu$m. Hij heeft 42 siliciumvingers van 100 $mu$m lang met een spleet van 2 $mu$m, samen 0,1 pF. De resolutiegrens van de versterker is $20 times 10^(-18)$ pF. Daarmee meet hij een verplaatsing van $20 times 10^(-12)$ m. Het bereik is 50 g tot 500 g, met instelbare filterbandbreedte (100 tot 800 Hz), en hij wordt gebruikt voor crashdetectie (airbags). Een tweede generatie meet twee assen. De massa beweegt in het midden, in twee richtingen, afhankelijk van de versnelling.

#figure(
  image("assets/L11-2as.png", width: 6cm),
  caption: [Tweede generatie: accelerometer met twee assen (slide 8)],
  label: <fig:L11-2as>,
)

#examenvraag("2019 vraag 1", [Tekening van een capacitieve accelerometer. Wat is dit?],
  opties: (
    [geen van onderstaande],
    [accelerometer],
    [snelheidsmeter],
  ),
  juist: "B",
)[Een seismische massa hangt aan veren tussen twee sets vaste vingers. Versnelt de behuizing, dan blijft de massa achter en verandert de spleet: $C_1$ stijgt terwijl $C_2$ daalt. Dat is een differentiële condensator, die versnelling meet. C is fout: een snelheidsmeter heeft geen seismische massa met veren en kamvingers.]

== Piezoresistieve MEMS-accelerometer <sec:mems-piezoresistief>

Een piëzoresistieve MEMS-accelerometer meet de versnelling met een rekstrook op een micro-veerbalk. De balk buigt door de traagheid van de massa. De massa hangt met balken aan een frame. Een piëzoresistief element op de balk verandert zijn weerstand met de rek, zoals een rekstrook (hoofdstuk @ch:rekstroken-1).

#figure(
  image("assets/L11-piezoresistief.png", width: 9cm),
  caption: [Piëzoresistieve MEMS-accelerometer: frame, balken, seismische massa en piëzoresistief element (slide 10)],
  label: <fig:L11-piezoresistief>,
)

Er zijn vier piëzoresistieve elementen. Als ze allemaal dezelfde weerstandsverandering hebben, geeft een Wheatstonebrug geen uitgangsspanning. Daarom zijn twee elementen van het n-type en twee van het p-type. Hun weerstand verandert dan tegengesteld.

*Vibratiesensor.* Een vibratiesensor meet het overlappende oppervlak van de vingers. Door de voorgespannen kam (pre-stress comb drive) te verplaatsen, verander je de gevoeligheid elektrisch, via software. Een hogere gevoeligheid geeft een kleiner werkgebied.

#figure(
  image("assets/L11-vibratie.png", width: 5cm),
  caption: [Vibratiesensor: voorgespannen kam, afstelbare veer en sensing-elektroden (slide 11)],
  label: <fig:L11-vibratie>,
)

== MEMS-gyroscoop en MEMS-druksensor <sec:mems-gyro-druk>

=== MEMS-gyroscoop <sec:mems-gyro>

Een MEMS-gyroscoop meet de hoeksnelheid met de Corioliskracht op een trillende massa. Draait de sensor om zijn gevoelige as, dan beweegt de massa door de Corioliskracht in een andere richting dan de trilling.

#frm(
  "Corioliskracht",
  $F_C = 2 m (v times omega)$,
  [De kracht staat loodrecht op de snelheid van de massa en op de rotatie-as.],
)

met:
- $F_C$ --- Corioliskracht [N]
- $m$ --- massa [kg]
- $v$ --- snelheid van de massa in het draaiende frame [m/s]
- $omega$ --- hoeksnelheid van het frame [rad/s]

Door $F_C$ te meten volgt de hoeksnelheid. Er moet een snelheid $v$ zijn, anders is er geen kracht. De massa trilt, dus $v$ wisselt van richting. Lagers en roterende delen zijn op micrometerschaal niet te maken, dus een draaiende massa kan niet.

#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 0.8em,
  align: horizon,
  figure(
    image("assets/L11-gyro-coriolis.png", width: 100%),
    caption: [Snelheid $v_"rad"$ in een draaiend vlak geeft een kracht $F_C$ opzij (slide 13)],
    label: <fig:L11-gyro-coriolis>,
  ),
  figure(
    image("assets/L11-gyro-frame.png", width: 100%),
    caption: [Drive frame met veren en sensing fingers (slide 15)],
    label: <fig:L11-gyro-frame>,
  ),
  figure(
    image("assets/L11-gyro-vork.png", width: 70%),
    caption: [Stemvork met aandrijf- en sensorelektroden (slide 16)],
    label: <fig:L11-gyro-vork>,
  ),
)

Bij het type met een *drive frame* trilt het frame in één richting. De sensing fingers meten de uitwijking loodrecht daarop capacitief, opnieuw met een differentiële condensator. Een tweede type gebruikt een *tuning fork*: twee trillende tanden met piëzo-elektrische elektroden. De slides noemen drie mogelijke types: een opgehangen massa, een draaiende plaat en een tuning fork.

#examenvraag("oefenvraag E20", [Waarom heeft een MEMS-gyroscoop een trillende en geen draaiende massa?],
  opties: (
    [omdat draaien te veel energie kost],
    [omdat de corioliskracht alleen een snelheid nodig heeft, en een trillende massa die op een chip haalbaar maakt],
    [omdat een draaiende massa niet nauwkeurig genoeg is],
    [omdat het goedkoper is],
  ),
  juist: "B",
)[$F_C = 2 m (v times omega)$: er moet een snelheid $v$ zijn ten opzichte van het draaiende frame. Een trillende massa heeft die snelheid afwisselend in twee richtingen. Lagers en roterende delen zijn op micrometerschaal niet te maken. De uitwijking loodrecht op de trilling wordt capacitief uitgelezen. A, C en D noemen een eigenschap die niet de reden is.]

=== MEMS-druksensor <sec:mems-druk>

Een MEMS-druksensor meet de druk met een dun siliciummembraan boven een referentieholte. De druk buigt het membraan door. Twee uitlezingen zijn mogelijk.

- *Capacitief*: het membraan en een vaste elektrode vormen een condensator. Duwt de druk het membraan naar binnen, dan verandert de capaciteit. Dit is een absolute meting. Die hangt af van de temperatuur en andere factoren en heeft geen referentie, dus een relatieve meting is beter.
- *Piëzoresistief*: weerstanden op het membraan vormen een brug. Buigt het membraan, dan worden $R_1$ en $R_2$ groter en $R_3$ en $R_4$ kleiner. Zo krijg je een brugspanning die de druk meet. Met een referentiedruk achter het membraan is dit een relatieve meting.

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  align: horizon,
  figure(
    image("assets/L11-druk-cap.png", width: 100%),
    caption: [Capacitieve MEMS-druksensor met glas, spacer, Si-membraan en substraat (slide 17)],
    label: <fig:L11-druk-cap>,
  ),
  figure(
    image("assets/L11-druk-piezo.png", width: 100%),
    caption: [Piëzoresistieve druksensor: membraan, weerstanden $R_1$ tot $R_4$ in een brug (slide 18)],
    label: <fig:L11-druk-piezo>,
  ),
)

Hoofdstuk @ch:druk behandelt druksensoren verder.
