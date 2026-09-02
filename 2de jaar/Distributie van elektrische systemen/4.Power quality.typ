#import "../../school-template.typ": *

= Power quality <ch:power-quality>

De term #keyterm[power quality] beschrijft niet-stationaire storingen in het net. Het is een grote oorzaak van ongeplande stilstand, van slecht werkende apparatuur en van vroegtijdige schade. Op je elektriciteitsfactuur zie je die problemen niet staan, maar financieel wegen ze wel zwaar door.

Power quality is een deelgebied van #keyterm[EMC] (Electromagnetic Compatibility). Goede power quality vraagt twee dingen tegelijk: een goede *beschikbaarheid* van de voeding (@sec:beschikbaarheid) en een goede *spanningskwaliteit* (@sec:spanningskwaliteit).

== Elektromagnetische compatibiliteit <sec:emc>

EMC is het vermogen van elektrische of elektronische apparatuur om zonder problemen te werken binnen een elektromagnetische omgeving. Omgekeerd mag die apparatuur de toestellen in haar buurt zelf niet storen. EMC is ook de naam van het vakgebied dat die co-existentie probeert te verbeteren.

EMC is dus geen puur negatief begrip. Het gaat om het evenwicht tussen twee marges:

- *Immuniteitsmarge:* welke variaties op het net een toestel mag ondervinden zonder zelf te storen.
- *Emissiemarge:* hoeveel een toestel maximaal mag afwijken zonder de andere toestellen te storen.

Een net van $230 "V"$ mag bijvoorbeeld tot $207 "V"$ zakken. Blijft elk toestel binnen zijn emissiemarge en verdraagt elk toestel zijn immuniteitsmarge, dan kunnen ze naast elkaar werken.

=== EMC-koppeling <sec:emc-koppeling>

Een storing plant zich op twee manieren voort:

- *Geleiding*, via draden en kabels. De cursus splitst dit in drie wegen:
  - aarding,
  - signaalin- en uitgangen,
  - de voeding (power supply).
- *Straling*, in de vorm van elektromagnetische golven.

#figure(
  image("assets/DEE_PQ_emc_koppeling.png", width: 11cm),
  caption: [EMC-koppeling volgens de slides: geleiding via aarding, signaalin- en uitgangen en de voeding, tegenover straling. Power quality is de tak "power supply".],
  label: <fig:emc-koppeling>,
)

#belangrijk[Power quality is precies één tak van die boom: EMC-problemen die via de *voeding* geleid worden.] Gestraalde emissies en emissies via signaalbekabeling of aarding vallen buiten dit vak.

=== Vier factoren die de EMC bepalen <sec:emc-factoren>

+ *Aarding.* Een correcte aarding voert ongewenste spanningen en storingen af. Een slechte aarding geeft aardlussen en dus EMI (Electromagnetic Interference) in gevoelige apparatuur.
+ *Signaal in- en uitgangen.* Signaal- en datalijnen zenden ruis uit én vangen ze op. Onvoldoende afscherming of filtering geeft storing in communicatie- en besturingssystemen. Afgeschermde kabels en differentiële signalering helpen.
+ *Spanningsbron.* Een bron met spanningsfluctuaties, harmonischen of ruis stoort de elektronica erachter. Netfilters en spanningsregelaars beperken dat.
+ *Radiatie.* Straling van toestellen verstoort andere systemen. Dat gebeurt door slechte afscherming, door lange kabels die als antenne werken, of door hoge schakelstromen.

== Beschikbaarheid van de voeding <sec:beschikbaarheid>

De beschikbaarheid is de kans dat een installatie effectief vermogen kan leveren. Je drukt ze uit met de gemiddelde bedrijfstijd en de gemiddelde stilstandtijd, of met de gemiddelde tijd tussen storingen en de gemiddelde hersteltijd.

#frm(
  "Beschikbaarheid",
  $ "Availability" = "MUT"/("MUT" + "MDT") = "MTBF"/("MTBF" + "MTTR") $,
  [met: $"MUT"$ = mean uptime, de gemiddelde tijd dat de installatie werkt [h]; $"MDT"$ = mean downtime, de gemiddelde tijd dat ze door een storing stilligt [h]; $"MTBF"$ = mean time between failures [h]; $"MTTR"$ = mean time to recovery, de gemiddelde hersteltijd [h].],
)

#figure(
  image("assets/DEE_PQ_beschikbaarheid.png", width: 11cm),
  caption: [Definitie van de beschikbaarheid uit de slides, met MTBF en MTTR op een tijdlijn.],
  label: <fig:beschikbaarheid>,
)

#belangrijk[Niet alleen de beschikbaarheid telt, ook het *aantal* onderbrekingen.] Veel korte onderbrekingen richten vaak meer schade aan dan één lange. Eén uur uitval om de tien jaar is dus beter dan één seconde uitval per dag, ook al is de beschikbaarheid in het tweede geval hoger.

Om de beschikbaarheid te verhogen moet je zowel de componenten als de *architectuur* van de installatie optimaliseren. Architecturale oplossingen zijn bijvoorbeeld meerdere voedingsbronnen gebruiken, load shedding toepassen, een IT-aardingsstelsel plaatsen, of de selectiviteit van de beveiligingen goed kiezen en instellen.

== Spanningskwaliteit <sec:spanningskwaliteit>

In een ideaal driefasig net hebben de spanningen de nominale grootte en frequentie, zijn ze perfect symmetrisch, en hebben ze een perfecte sinusvorm. Elke afwijking op één van die vier parameters --- grootte, frequentie, golfvorm of symmetrie --- is een power-qualityprobleem.

De cursus onderscheidt zeven fenomenen:

+ frequentievariaties,
+ langzame spanningsfluctuaties,
+ flicker,
+ spanningsdippen en korte onderbrekingen,
+ harmonischen,
+ transiënten,
+ onevenwicht (unbalance).

Onderbrekingen splits je nog op in *lange* onderbrekingen, die een beschikbaarheidsprobleem zijn, en *korte* onderbrekingen. Die korte onderbrekingen horen qua oorzaak, gevolg en oplossing bij de spanningsdippen.

#belangrijk[Een slechte arbeidsfactor is officieel géén power-qualityprobleem.] Vanuit de eindgebruiker verlaagt hij wel de kwaliteit van de voeding.

De drie belangrijkste problemen zijn spanningsdippen, transiënten en harmonischen. Dippen en transiënten zijn kortstondige afwijkingen van de ideale spanning; die behandelt dit hoofdstuk. Harmonischen beschrijven een vervormde golfvorm en komen in @ch:harmonische-analyse aan bod. Veel dippen zijn bovendien onevenwichtig, en onevenwicht vraagt een eigen methode: zie @ch:unbalance.

=== Frequentievariaties <sec:frequentievariaties>

De netfrequentie, $50 "Hz"$ in Europa, moet stabiel blijven. Variaties ontstaan door onbalans tussen vraag en aanbod van elektriciteit. Ze geven problemen in gevoelige apparatuur zoals motoren en klokken.

=== Langzame spanningsfluctuaties <sec:spanningsfluctuaties>

Dit zijn geleidelijke veranderingen van de netspanning door een variërende belasting. Ze leiden tot inefficiënt werkende toestellen en tot spanningsverlies over lange afstanden.

=== Flicker <sec:flicker>

Flikkering is een snelle, herhaalde variatie van de netspanning. Je ziet ze letterlijk als knipperende lampen. De oorzaak zijn grote, plotse belastingveranderingen, zoals industriële machines of inductieovens.

#examenbox[*Wanneer komt het flikkerfenomeen voor?* Flicker treedt op wanneer er snelle spanningsschommelingen op het net zijn. Die worden meestal veroorzaakt door wisselende of pulserende belastingen die relatief groot zijn ten opzichte van de sterkte van het net.]

Let op de formulering: het gaat om de belasting *ten opzichte van de sterkte van het net*. Dezelfde lasmachine geeft op een sterk net geen flicker en op een zwak net wel.

== Spanningsdippen en korte onderbrekingen <sec:spanningsdippen>

=== Definitie <sec:dip-definitie>

Een #keyterm[spanningsdip] is een kortstondige maar aanzienlijke daling van de spanning. De cursus legt drie grenzen vast:

- de spanning daalt met *minstens $10%$*;
- de daling duurt *minstens een halve periode* van de netfrequentie;
- ze duurt *hoogstens $1$ minuut*.

Een #keyterm[korte onderbreking] duurt maximaal $3$ minuten.

#figure(
  image("assets/DEE_PQ_dip_definitie.png", width: 11cm),
  caption: [Golfvorm van een spanningsdip en van een korte onderbreking (CT199 §2.2).],
  label: <fig:dip-definitie>,
)

=== Oorzaken <sec:dip-oorzaken>

De hoofdoorzaak van een dip zijn *grote stromen die kortstondig door het net lopen*, zoals kortsluitstromen of aanloopstromen. Die stromen geven een grotere spanningsval over de netimpedantie dan waarop het net ontworpen is. Zodra de overstroom verdwijnt, herstelt de oorspronkelijke spanning zich.

$ underline(U)_"load" = underline(U)_"grid" - underline(Z)_"grid" dot underline(I) $

met: $underline(U)_"load"$ = spanning bij de verbruiker [V]; $underline(U)_"grid"$ = netspanning [V]; $underline(Z)_"grid"$ = netimpedantie tot aan het aansluitpunt [$Omega$]; $underline(I)$ = de storende stroom [A].

Hier zie je meteen waarom een *zwak* net, met een grote $underline(Z)_"grid"$, gevoeliger is voor dippen: dezelfde stroom veroorzaakt er een grotere spanningsval.

#figure(
  image("assets/DEE_PQ_dip_oorzaken.png", width: 11cm),
  caption: [Oorzaken en gevolgen van een spanningsdip. Links de netimpedantie $Z_"grid"$ waarover de grote stroom een spanningsval geeft, rechts het verschuivende werkpunt op de koppel-toerentalkarakteristiek.],
  label: <fig:dip-oorzaken>,
)

=== Gevolgen <sec:dip-gevolgen>

Motoren, actuatoren, verlichting en elektronica ondervinden allemaal gevolgen van een dip:

- *Draaiende machines:* het toerental daalt of de machine valt stil. Het koppel dat de motor kan leveren zakt mee met de spanning, waardoor het werkpunt met de belastingskarakteristiek verschuift.
- *Drive systems:* frequentieregelaars reageren op de onderspanning.
- *Elektronica en verlichting:* die vertonen storingen.

#belangrijk[Het echte, economische probleem zijn de secundaire gevolgen.] Een gewijzigd toerental of een ongewenste schakeling kan betekenen dat je een volledige productielijn moet herstarten. In de casestudies uit de cursus loopt de kost per dip op tot in de orde van honderdduizenden euro's, afhankelijk van de sector.

=== Oplossingen <sec:dip-remedies>

De cursus splitst de oplossingen in preventie en mitigatie.

*Preventie*, dus de dip zelf vermijden:
- grote stromen vermijden;
- de netimpedantie verlagen.

*Mitigatie*, dus de gevolgen beperken:
- de instellingen van de contactoren aanpassen;
- de besturing goed programmeren;
- flying start-up;
- kinetische buffering;
- immunisatietoestellen, zoals een UPS.

#belangrijk[Dure immunisatie is niet altijd nodig.] Aangepaste contactorinstellingen of een doordacht besturingsprogramma vermijden al veel van de secundaire gevolgen, en dat kost bijna niets.

== Transiënten <sec:transienten>

#keyterm[Transiënten] verschillen van spanningsdippen doordat ze *groter in amplitude* zijn en *korter in duur*. Het zijn plotse spanningsveranderingen die zelfs in laagspanningsnetten duizenden volt kunnen bereiken. De duur gaat van microseconden tot hoogstens een halve periode van de netfrequentie. Ze kunnen frequenties tot $5 "MHz"$ bevatten.

=== Oorzaken <sec:transient-oorzaken>

Een transiënt ontstaat door het *plots vrijkomen van opgeslagen energie*. Dat gebeurt bij blikseminslag, bij ongefilterde apparatuur, bij contactdender en bij vlambogen. Ook het schakelen van condensatorbatterijen voor arbeidsfactorcorrectie of het inschakelen van generatoren op het net geeft transiënten.

Eén grote gebeurtenis zoals bliksem kan honderdduizenden volt bereiken en meteen of met tussenpozen tot uitval leiden. Toch is de verdeling verrassend:

- *bliksem en netanomalieën: $20%$* van de transiënten;
- *intern opgewekt: de overige $80%$*.

Die interne transiënten zijn kleiner in amplitude, maar ze komen veel vaker voor. Door die voortdurende blootstelling tasten ze gevoelige elektronica geleidelijk aan.

=== Bescherming <sec:transient-bescherming>

Elektrische apparatuur wordt zo gedimensioneerd dat ze een bepaalde hoeveelheid transiënten kan verdragen, volgens de norm *IEC 60204-1*. Daarnaast kan je #keyterm[surge protection devices] plaatsen. Die blokkeren de stroom of sluiten hem kort, zodat de spanning onder een veilige drempel blijft.

== UPS (Uninterruptible Power Supply) <sec:ups>

#examenbox[*Verklaar UPS in één zin.* Een UPS (Uninterruptible Power Supply) is een noodstroomvoorziening die bij stroomuitval tijdelijk elektriciteit levert aan de aangesloten apparaten, zodat die correct kunnen blijven werken of veilig kunnen worden uitgeschakeld.]

#belangrijk[Een UPS is niet hetzelfde als een noodgroep.] Een noodgroep (emergency unit) start pas op na de uitval en overbrugt een lange onderbreking; een UPS overbrugt de onderbreking meteen, maar slechts tijdelijk.

De opbouw is altijd dezelfde keten:

$ "NET" arrow.r "omvormer" arrow.r "energieopslag" arrow.r "omvormer" arrow.r "BELASTING" $

met een sturing die het geheel regelt. De energieopslag is meestal een batterij.

#figure(
  image("assets/DEE_PQ_ups_blokschema.png", width: 11cm),
  caption: [Algemeen blokschema van een UPS: net, omvormer, energieopslag, omvormer, belasting, met een sturing erover.],
  label: <fig:ups-blokschema>,
)

De cursus deelt UPS'en in volgens drie assen:

- *online of offline:* hangt de belasting altijd achter de omvormer, of pas na omschakeling?
- *serie of parallel:* staat de UPS in de hoofdstroomweg of ernaast?
- *statisch of dynamisch:* halfgeleiders, of een draaiende massa als energieopslag?

== Bronnen van dit hoofdstuk <sec:pq-bronnen>

De cursustekst verwijst expliciet door naar de volgende bronnen, die op Toledo staan:

- *Definitie EMC:* ABB, _Technical guide No. 3, EMC compliant installation and configuration for a power drive system_, 2012, p. 10.
- *EMC-achtergrond:* Schneider Electric, _Electrical Installation Guide_, 2018, hoofdstuk R.
- *Definitie beschikbaarheid:* Schneider Electric, _Electrical Installation Guide_, 2018, p. D12.
- *Introductie power quality:* Schneider Electric, _A Framework for Implementing Continuous, Iterative Power Quality Management_, mei 2015, p. 2-3.
- *Overzicht van de problemen, oorzaken, gevolgen en oplossingen:* Schneider Electric, _Cahier technique 199: Power Quality_, november 2001, p. 6-26.
- *UPS:* Schneider Electric, _Electrical Installation Guide_, 2018, p. N11-N23.
