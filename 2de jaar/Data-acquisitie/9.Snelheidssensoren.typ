#import "../../school-template.typ": *
#import "examenvraag.typ": examenvraag

// BRON: Slides/9.velocity.pdf (slide 2-13) | Samenvatting DAQ p.37-39 | examenvragen 2016, 2017, 25-26

= Snelheidssensoren <ch:snelheid>

Snelheid is de verandering van positie in de tijd, lineair [m/s] of hoekmatig [rad/s]. Welk type sensor past, hangt af van de bandbreedte van de snelheid zelf.

#table(
  columns: (auto, auto, auto),
  align: left,
  table.header[*Snelheid*][*Bandbreedte*][*Sensortype*],
  [Langzaam (snelle versnellingen vallen weg)], [$< 1$ Hz], [verplaatsingssensor],
  [Gemiddeld], [$< 1$ kHz], [snelheidssensor],
  [Snel (goed voor snelle versnellingen)], [$> 1$ kHz], [versnellingssensor],
)

== Afgeleide van een verplaatsingssignaal <sec:differentiatie>

Een snelheid volgt uit een verplaatsingssignaal door te differentiëren.

#frm(
  "Relatieve snelheid",
  $v = (d x) / (d t)$,
  [Snelheid is de afgeleide van de positie naar de tijd.],
)

met:
- $v$ --- snelheid [m/s]
- $x$ --- positie [m]
- $t$ --- tijd [s]

Differentiëren versterkt hoogfrequente ruis. Een ruiscomponent met amplitude $n$ en pulsatie $omega_"ruis"$ geeft na differentiatie een component met amplitude $n omega_"ruis"$. Een snel trillend stoorsignaal met een kleine amplitude in $x$ kan dus een grote fout in $v$ geven. Daarnaast heb je een nauwkeurige tijdsreferentie nodig en krijg je geen snelheid in real time.

== Directe meting <sec:directe-meting>

Veel snelheidssensoren meten de snelheid rechtstreeks, zonder dat een verplaatsingssignaal moet worden afgeleid. Ze gebruiken allemaal dezelfde inductiewet: een draad die met snelheid $v$ door een magneetveld beweegt, wekt een spanning op.

#frm(
  "Geïnduceerde spanning in een bewegende draad",
  $e = B l v$,
  [De spanning is evenredig met de snelheid van de draad.],
)

met:
- $e$ --- uitgangsspanning [V]
- $B$ --- magnetische inductie [T]
- $l$ --- lengte van de draad in het veld [m]
- $v$ --- snelheid van de draad [m/s]

#figure(
  image("assets/L9-blv.png", width: 7cm),
  caption: [Een draad met snelheid $v$ in het veld $B$ wekt de spanning $e = B l v$ op (slide 4)],
  label: <fig:L9-blv>,
)

=== Tachometers <sec:tachometers>

Een *DC-tachometer* is een kleine DC-generator. De rotor draait tussen twee permanente magneten. Een commutator met borstels geeft een gelijkspanning af die evenredig is met het toerental. Verandert de draairichting, dan verandert de polariteit van de uitgang.

#frm(
  "DC-tachometer",
  $V = k omega$,
  [De uitgangsspanning is evenredig met de hoeksnelheid.],
)

met:
- $V$ --- uitgangsspanning [V]
- $k$ --- tachometerconstante [V/(rad/s)]
- $omega$ --- hoeksnelheid [rad/s]

Een typische waarde is 7 V per 1000 rpm bij 5000 rpm, met een nauwkeurigheid van 0,07 %. Speciale uitvoeringen met hoge gevoeligheid halen 500 V tot 30 000 V per 1000 rpm.

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  align: horizon,
  figure(
    image("assets/L9-dc-tacho.png", width: 100%),
    caption: [DC-tachometer: magneten, commutator met borstels en voltmeter (slide 5)],
    label: <fig:L9-dc-tacho>,
  ),
  figure(
    image("assets/L9-ac-tacho.png", width: 100%),
    caption: [AC-tachometer: excitatie $e("ex AC")$ op de ene fase, uitgang $e("out")$ op de andere (slide 7)],
    label: <fig:L9-ac-tacho>,
  ),
)

Een *AC-tachometer* heeft twee spoelen of fasen. De ene fase krijgt een wisselspanning als excitatie. In de tweede fase ontstaat een spanning met dezelfde frequentie. De amplitude is nul bij stilstand en groeit met de hoeksnelheid.

Bij omgekeerde draairichting draait de fase van de uitgang $180 degree$. Daarom is *fasegevoelige demodulatie* nodig om de richting te bepalen. De frequentierespons is beperkt tot $1/10$ à $1/5$ van de excitatiefrequentie.

=== Variabele-reluctantiesensor <sec:vr-sensor>

Een variabele-reluctantiesensor (VR-sensor) is een spoel rond een permanente magneet die een spanning geeft zodra een metalen tand voorbijkomt. Staat de tand dicht bij de sensor, dan is de flux door de spoel maximaal. Draait het tandwiel verder, dan zakt de flux weer. Die tijdsafhankelijke flux induceert een spanning in de spoel. Je krijgt één golf per tand. Het aantal golven per seconde geeft het toerental.

$ e = -N (d Phi) / (d t) $

met:
- $e$ --- geïnduceerde spanning [V]
- $N$ --- aantal windingen [-]
- $Phi$ --- magnetische flux door de spoel [Wb]

Er staat een afgeleide in de formule. Bij stilstand verandert de flux niet en is $e = 0$, ook als er een tand voor de sensor staat. Draait het wiel sneller, dan verandert de flux sneller en stijgt de amplitude. Daarom meet de sensor snelheid.

#figure(
  image("assets/L9-vr.png", width: 11cm),
  caption: [VR-sensor: doel, spoel met magneet, signaalverwerking tot digitale uitgang (slide 8)],
  label: <fig:L9-vr>,
)

Voordelen:
- passief: geen excitatie nodig
- goedkoop, behalve de elektronica
- bruikbaar tot 300 °C
- bestand tegen vuil en olie

Nadelen:
- werkt niet bij lage snelheid, want het signaal wordt te klein
- de amplitude hangt van de snelheid af, dus de detectiedrempel moet meebewegen
- niet bruikbaar voor positiebepaling, want bij stilstand is er geen signaal

Een Hall-sensor (hoofdstuk @ch:hall) meet het veld zelf en werkt ook bij stilstand. Daarom gebruikt een ABS-systeem dat tot 0 km/u moet meten een Hall-sensor.

#examenvraag("2017 vraag 4", [Een variabele-reluctantiesensor ...],
  opties: (
    [meet snelheid],
    [meet temperatuur],
    [is duur],
  ),
  juist: "a",
)[In $e = -N d Phi \/ d t$ staat de afgeleide van de flux. Een sneller draaiend wiel geeft een grotere spanning, dus de sensor meet snelheid. B is fout: hij meet geen temperatuur. C is fout: hij is net goedkoop, want het is een spoel met een magneet.]

#examenvraag("25-26 vraag 23", [Een variabele-reluctantiesensor ...],
  opties: (
    [is gevoelig voor de aardversnelling],
    [meet statische magnetische velden],
    [kan gebruikt worden als snelheidssensor],
    [kan gebruikt worden om statische afstanden te meten],
  ),
  juist: "C",
)[De spanning groeit met de snelheid, dus het is een snelheidssensor. B en D zijn fout: zonder beweging is er geen fluxverandering en dus geen signaal. A is fout: een spoel met magneet reageert niet op de aardversnelling, dat doet een accelerometer.]

=== Gemiddelde snelheid uit $Delta x$ en $Delta t$ <sec:gemiddelde-snelheid>

Je kunt ook de tijd meten die een object nodig heeft om twee nauwkeurig bepaalde punten te passeren, bijvoorbeeld met een Hall-sensor of een optische encoder.

#frm(
  "Gemiddelde snelheid",
  $macron(v) = (Delta x) / (Delta t)$,
  [De afstand tussen twee detectiepunten gedeeld door de tijd die het object ertussen nodig heeft.],
)

met:
- $macron(v)$ --- gemiddelde snelheid over het interval [m/s]
- $Delta x$ --- afstand tussen de twee punten [m]
- $Delta t$ --- gemeten passeertijd [s]

Bij constante snelheid mag $Delta x$ willekeurig zijn. Bij veranderlijke snelheid moet $Delta x$ klein zijn, anders middel je over een te lang interval. Een kleine $Delta x$ geeft wel een korte $Delta t$, dus de tijdmeting moet nauwkeurig zijn. ABS-systemen gebruiken dit principe om het wiel te detecteren.

#figure(
  image("assets/L9-abs.png", width: 7cm),
  caption: [Wieldetectie bij ABS: tandring en sensor (slide 10)],
  label: <fig:L9-abs>,
)

== Gyroscoop <sec:gyroscoop>

Een gyroscoop meet de *absolute hoeksnelheid* van een voorwerp in de ruimte. Hij heeft geen vaste referentie nodig, in tegenstelling tot de relatieve snelheidssensoren hierboven.

Het signaal is de hoeksnelheid. De hoek volg je door te integreren, waarbij de drift oploopt. Hij meet de rotatie rond de X-as (roll), de Y-as (pitch) en de Z-as (yaw). Vroeger waren gyroscopen enkelassig. Sinds de dual-axis uitvoeringen meet één sensor twee assen. X- en Y-gyroscopen worden vaak gebruikt voor beeldstabilisatie en trillingsmeting. Z-as-gyroscopen zijn minder gebruikelijk omdat het ontwerp complexer en duurder is.

Een gyroscoop werkt met de *Corioliskracht*: een massa die beweegt in een draaiend frame ondervindt een kracht loodrecht op haar snelheid en op de rotatie-as. In MEMS-technologie, zoals in digitale camera's, wordt dit met een trillende massa gedaan. Hoofdstuk @ch:mems werkt dat uit. De slides tonen twee gyroscopen van 800 tot 1 200 euro en van 5 000 tot 15 000 euro.

#figure(
  image("assets/L9-gyro-assen.png", width: 10cm),
  caption: [Rotatieassen: pitch, yaw en roll (slide 11)],
  label: <fig:L9-gyro-assen>,
)

#examenvraag("2016 (17/06) vraag 13", [Een gyroscoop ...],
  opties: (
    [meet de rechtstreekse hoekverplaatsing],
    [meet de rechtstreekse versnelling zonder gravitatie],
    [baseert op corioliskrachten en heeft daarom altijd een ronddraaiende massa],
    [meet de rechtstreekse hoeksnelheid van een voorwerp in de ruimte],
  ),
  juist: "D",
)[Een gyroscoop geeft de hoeksnelheid rechtstreeks. A is fout: de hoek krijg je pas door te integreren. B is fout: hij meet geen versnelling. C is bijna juist: een MEMS-gyroscoop gebruikt de Corioliskracht, maar met een trillende massa, en niet met een ronddraaiende.]

#examenvraag("2016 (januari) vraag 14", [Wat meet je met een gyroscoop?])[De hoeksnelheid. Voor de hoek moet je integreren, en dan loopt de drift op. Voor een versnelling heb je een accelerometer nodig.]
