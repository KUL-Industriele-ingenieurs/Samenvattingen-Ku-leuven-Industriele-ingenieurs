#import "../../school-template.typ": *

= Energy <ch:energy>

== Introductie <sec:introductie-energie>

Alles in onze maatschappij draait op energie: huizen, ziekenhuizen, scholen, voedselproductie en transport. Het grootste deel komt nog van fossiele brandstoffen. Die zijn eindig en hebben een grote impact op het klimaat.

We moeten dus overschakelen op andere bronnen, maar ook minder energie gebruiken en minder verliezen. De goedkoopste en duurzaamste kWh is de kWh die je niet moet produceren.

In deze module bekijken we de energiebronnen en hun kosten, daarna het transport, het verbruik en de opslag van energie. Als laatste kijken we naar energiemarkten en beleid.

=== Wat is energie <sec:wat-is-energie>

Bij een energietekort daalt ons comfort. Bij veel klassieke energieomzettingen komt CO#sub[2] vrij. Daarom willen we een *energietransitie*: een duurzaam energiesysteem dat ook betrouwbaar en betaalbaar blijft.

#theorie(title: "Wat is energie?")[

*Energie* is wat in fysische zin verandering veroorzaakt: arbeid verrichten, iets opwarmen of een chemische reactie op gang brengen. *Vermogen* is hoeveel energie per tijdseenheid wordt omgezet.

De vormen waarin we energie gebruiken heten *energievectoren*:
- warmte (warm water, stoom)
- elektriciteit
- chemische energie in brandstoffen (benzine, diesel, aardgas)

#table(
  columns: 3,
  table.header([*Grootheid*], [*Eenheid*], [*Opmerking*]),
  [Energie], [joule [J]], [],
  [Vermogen], [watt [W] = J/s], [],
  [Energie (praktisch)], [kilowattuur [kWh]], [1 kW gedurende 1 uur = 3,6 MJ],
)

Energie gaat nooit verloren en ontstaat niet uit het niets, ze wordt alleen omgezet in een andere vorm. Een deel van die omzetting is niet nuttig, bv. warmte door wrijving. Daarom is het *rendement* (conversion efficiency) van elke omzetting belangrijk.

]

Chemische energie kan je makkelijk opslaan, elektriciteit niet. Elektriciteit moet je eerst omzetten: een batterij slaat elektrische energie op als chemische energie.

Sommige omzettingen werken in twee richtingen, zoals een gsm-batterij die je oplaadt en ontlaadt. Andere maar in één richting: een verbrandingsmotor zet brandstof om in beweging, maar bij het remmen krijg je de brandstof niet terug.

Ingenieurs bekijken een *energiesysteem* met een *energiebalans*: de ingevoerde energie (elektriciteit, gas) is gelijk aan het verbruik (verlichting, verwarming) plus de verliezen. Voor een heel land zie je links de import (olie, gas, steenkool, elektriciteit over de grens) en rechts de sectoren die verbruiken. *Industrie*, *wonen* en *transport* zijn de grootste. @fig:Energie-balans-van-nederland toont dat voor Nederland. De balans van je eigen land vind je op de website van het International Energy Agency (IEA).

#figure(
  image("assets/Energie-balans-van-nederland.png", width: 12cm),
  caption: [Energiebalans van Nederland],
  label: <fig:Energie-balans-van-nederland>,
)

== Energiebronnen <sec:energiebronnen>

#concept(title: "Primaire vs secundaire energie")[

*Primaire energie* komt in stabiele vorm in de natuur voor: olie, steenkool, zonlicht.

*Secundaire energie* maken we zelf uit een primaire bron, bv. elektriciteit en waterstof. Ze bestaan soms in de natuur (bliksem), maar niet stabiel of geconcentreerd genoeg om te gebruiken.

]

*Hernieuwbare* bronnen zijn altijd beschikbaar in een min of meer constante stroom, ook in de verre toekomst. Zon en wind variëren sterk, maar raken niet op.

*Fossiele brandstoffen* (steenkool, olie, gas) zijn miljoenen jaren geleden ontstaan. Ze zijn eindig, en mogelijk zitten we al voorbij hun piekproductie. Ze bevatten koolstof die planten vroeger met fotosynthese uit de lucht haalden. Verbranden we ze nu, dan stijgt het CO#sub[2]-gehalte in de atmosfeer.

Duurzaamheid gaat over meer dan klimaat. Verbranding geeft ook fijn stof en stikstofoxiden (gezondheidsproblemen), er ontstaat afval en mijnbouw vernietigt landschappen.

Daarna moet de bron omgezet worden in een bruikbare vorm, zoals geraffineerde brandstof of elektriciteit. Hieronder de belangrijkste omzettingen met hun voor- en nadelen.

=== Thermische energiebronnen <sec:thermic-energy>

#figure(
  image("assets/Coal-Plant.png", width: 7cm),
  caption: [Principe van een thermische centrale],
  label: <fig:Coal-Plant>,
)

*Steenkoolcentrale.* Bruin- of zwartkool wordt verbrand in een grote ketel. De warmte kookt water tot stoom onder hoge druk. Die stoom drijft een turbine aan, en de turbine een generator. Er zijn drie omzettingen: chemisch → thermisch (met as en CO#sub[2]) → kinetisch → elektrisch. Elke omzetting heeft verliezen, dus het totale rendement is *minder dan 40%*. Het grootste deel van de energie wordt nutteloze warmte. Kolencentrales zijn grote machines die hun vermogen moeilijk kunnen aanpassen.

*Gascentrale (STEG, combined cycle).* Een moderne gascentrale heeft twee cycli. Eerst een gasturbine (compressor, verbrandingskamer, turbine, zoals een vliegtuigmotor) met een generator. De hete uitlaatgassen verwarmen daarna een ketel voor een stoomcyclus. Samen halen ze een rendement van *55 à 60%*. Gascentrales kunnen hun vermogen ook snel aanpassen.

*WKK (warmtekrachtkoppeling, combined heat and power, CHP).* Dezelfde gecombineerde cyclus, maar de restwarmte gaat naar een industrieel proces dat veel warmte op hoge temperatuur nodig heeft (voedings- of chemische industrie). Als de uitlaattemperatuur dicht bij de procestemperatuur ligt, is het totale rendement heel hoog.

*Soorten gas.* Klassiek wordt aardgas gebruikt: fossiel methaan uit gasvelden. Er zijn ook andere bronnen:
- *Schaliegas*: methaan uit gesteentelagen die men openbreekt en chemisch behandelt. Dat geeft grote milieuproblemen.
- *Biogas*: methaan uit vergisting van gewassen of organisch afval. In principe koolstofneutraal, want de planten namen kort ervoor evenveel CO#sub[2] op. Het probleem: om de gasvraag te dekken is enorm veel biomassa nodig, en die landbouwgrond is ook nodig voor voedsel.
- *Synthetisch gas*: chemisch gemaakt uit waterstof en een koolstofbron. Het probleem verschuift dan naar de productie van waterstof.

*Kernenergie.* Ook hier wordt warmte omgezet in elektriciteit via een stoomcyclus. Kernenergie stoot geen CO#sub[2] uit, maar is *niet hernieuwbaar*: uranium en thorium moeten ontgonnen worden en zijn eindig.
- *Kernsplijting (fission)*: een zwaar element zoals uranium splitst in lichtere elementen en geeft warmte. Er blijft radioactief afval over dat lang opgeslagen moet worden. Commerciële centrales zijn groot (honderden MW tot meer dan 1 GW) en weinig flexibel. Kleine, flexibele reactoren op uranium of thorium met minder afval zijn mogelijk, maar het duurt nog decennia voor ze commercieel zijn. Ze lossen het klimaatprobleem op korte termijn dus niet op.
- *Kernfusie (fusion)*: heel lichte elementen smelten samen tot zwaardere en geven warmte. Nog in onderzoek, nog decennia van commerciële werking verwijderd.

=== Hernieuwbare energiebronnen <sec:hernieuwbare-energie>

Deze bronnen maken elektriciteit rechtstreeks, zonder de verliesrijke thermodynamische omweg via stoom of gas.

- *Zonne-energie*: *fotovoltaïsche cellen (PV)* zijn halfgeleiders die direct of verstrooid zonlicht omzetten in gelijkstroom. Vermogenselektronica zet die om naar wisselstroom voor het net. Panelen liggen op daken, in velden, en nieuw: boven landbouwgrond en drijvend op water. Geen CO#sub[2]-uitstoot en hernieuwbaar, maar 's nachts is er geen productie.
- *Windenergie*: turbines met een ingebouwde generator. Geen CO#sub[2]-uitstoot en hernieuwbaar, maar het weer bepaalt de productie. Windparken op zee leveren een vrij constante en voorspelbare productie.
- *Waterkracht*: een dam houdt water tegen op een rivier of in de bergen. Het water stroomt door een turbine met generator. De productie hangt af van regen en smeltende sneeuw. Het grootste probleem: dammen en overstroomde valleien vernietigen natuur en mensen moeten verhuizen. Daarom geldt waterkracht niet als echt hernieuwbaar en kan ze weinig verder uitbreiden.

#table(
  columns: 5,
  align: (left, center, center, center, left),
  table.header([*Bron*], [*Rendement*], [*CO#sub[2]*], [*Hernieuwbaar*], [*Grootste nadeel*]),
  [Steenkool], [< 40%], [ja], [nee], [CO#sub[2], fijn stof, weinig flexibel],
  [Gas (STEG)], [55–60%], [ja], [nee], [dure brandstof],
  [Kernsplijting], [], [nee], [nee], [radioactief afval, weinig flexibel],
  [Kernfusie], [], [nee], [nee], [nog decennia onderzoek],
  [Zon (PV)], [], [nee], [ja], [geen productie 's nachts],
  [Wind], [], [nee], [ja], [weerafhankelijk (op zee stabieler)],
  [Waterkracht], [], [nee], [niet echt], [vernietigt landschap, weinig uitbreiding],
)

=== Kosten <sec:kosten-energie>

De kosten van elektriciteitsproductie vallen in twee groepen:
+ *investeringskosten*: de bouw van de installatie
+ *operationele kosten*: brandstof, systeemkosten, onderhoud, afvalverwerking

Een gascentrale is goedkoop om te bouwen maar heeft dure brandstof. Zon en wind kosten na de bouw bijna niets meer.

Om eerlijk te vergelijken gebruiken we de *levelized cost of electricity (LCOE)*: alle kosten over de hele levensduur, gedeeld door alle geproduceerde elektriciteit.

#frm(
  "Levelized cost of electricity",
  $"LCOE" = "totale kosten over de levensduur" / "totale geproduceerde energie over de levensduur"$,
  [met: LCOE in [€/kWh] of [\$/MWh]],
)

De meeste technologieën worden goedkoper naarmate ze rijper worden: de *leercurve*. Kernenergie is een uitzondering: strengere veiligheidseisen en afvalverwerking maakten ze duurder.

Zon en wind dalen het sterkst. De prijs van PV daalde met ongeveer een *factor 10 in tien jaar* door grootschalige productie en betere technologie. Zonne-energie is nu de goedkoopste vorm van elektriciteit. Daarom groeiden zon en wind de laatste jaren zo snel.

#figure(
  image("assets/Levelized-costs-of-energie-van-verschillende-technolgien.png", width: 11cm),
  caption: [LCOE per technologie, wereldwijd],
  label: <fig:Levelized-costs-of-energie-van-verschillende-technolgien>,
)

Op systeemniveau moeten productie en verbruik altijd in evenwicht zijn, op korte en op lange termijn. Met veel zonne-energie is er overdag een overschot en 's avonds een tekort. De overgang vraagt veel andere bronnen: batterijen, regelbare centrales of uitwisseling met buurlanden over het net. Dat toont de *duck curve* (@fig:System-load-en-time-of-day), zo genoemd omdat de curve op een eend lijkt.

Over meerdere dagen heb je ook bewolkte, windstille periodes: de *Dunkelflaute*. Ook daar is de oplossing een mix van technologieën en internationale uitwisseling.

#figure(
  image("assets/System-load-en-time-of-day.png", width: 9cm),
  caption: [Duck curve: netbelasting over een dag],
  label: <fig:System-load-en-time-of-day>,
)

=== Energienetwerken <sec:energie-network>

Energie moet naar de verbruiker via netwerken: elektriciteitsnetten, warmtenetten, gasnetten en ook datanetwerken. Die bestaan op elke schaal: continent, land, stad, straat en in je eigen huis.

==== Elektriciteitsnet <sec:elektriciteit-netwerken>

#figure(
  image("assets/Elektriciteit-grid.png", width: 12cm),
  caption: [Opbouw van het elektriciteitsnet],
  label: <fig:Elektriciteit-grid>,
)

#table(
  columns: 3,
  align: (left, left, left),
  table.header([*Niveau*], [*Uitvoering*], [*Topologie*]),
  [Transmissienet (hoogspanning)], [hoogspanningslijnen, ondergrondse kabels, zeekabels; honderden km], [*mazen*: elk onderstation via meerdere lijnen verbonden (betrouwbaarheid)],
  [Distributienet], [ondergrondse kabels onder de straten, meerdere spanningen], [*radiaal*],
  [Huisinstallatie], [transformator verlaagt naar veilige spanning; net stopt formeel aan de meter], [radiaal: van zekeringkast naar stopcontacten en PV],
)

Ondergrondse kabels zijn duurder en werken maar over een beperkte afstand, tenzij je *gelijkstroom (DC)* gebruikt in plaats van wisselstroom. Het transmissienet ligt vooral op land, maar breidt nu uit op zee om offshore windparken aan te sluiten.

==== Andere netwerken <sec:gas-netwerken>

Het *gasnet* heeft dezelfde opbouw: een transmissiedeel door het land en een lokaal distributiedeel. *Warmtenetten* bestaan alleen lokaal: ze verbinden een warmtebron (bv. restwarmte van een industrieel proces) met afnemers in de buurt.

Al die netten werken niet zonder digitale sturing en beveiliging. Een betrouwbaar communicatienetwerk is dus nodig. Het hele energiesysteem is een *system of systems*.

== Energiegebruik <sec:energiegebruik>

=== Efficiëntie <sec:efficiency>

In de meeste Europese landen gaat ongeveer *1/3 naar industrie*, *1/3 naar transport* en de rest naar de gebouwde omgeving (verwarming, verlichting).

Consumenten zuinig laten zijn is moeilijk. De meeste mensen kennen de hoeveelheden energie niet en weten niet wat hun verbruik in totaal kost. Verlichting toont hoe sterk het rendement kan stijgen:

#table(
  columns: 2,
  align: (left, left),
  table.header([*Technologie*], [*Verbruik voor hetzelfde licht*]),
  [Gloeilamp (Edison)], [rendement < 20%: 80% wordt warmte],
  [Spaarlamp (eind 20e eeuw)], [ongeveer 4× minder dan gloeilamp],
  [LED], [8 à 10× minder dan gloeilamp, en gaat veel langer mee],
)

Bij een aankoop, bv. een wasmachine, kijk je naar de prestaties en de prijs. Bijna niemand rekent de *terugverdientijd* van een zuiniger toestel uit. Daarom bestaan *energielabels* (@fig:Energielabel-EU): ze tonen kwalitatief (klasse A–G) en kwantitatief (kWh per 100 cycli) hoeveel het toestel verbruikt. Soms gaat de overheid verder en verbiedt ze een technologie: gloeilampen mogen niet meer verkocht worden.

#figure(
  image("assets/Energielabel-EU.png", width: 4cm),
  caption: [EU-energielabel van een wasmachine],
  label: <fig:Energielabel-EU>,
)

Een toestel dat 10× zuiniger is, geeft geen 10× lager verbruik. Dat komt door het *rebound-effect*:
- *Direct rebound*: mensen laten een zuinige LED langer branden. Dat compenseert ongeveer *20%* van de mogelijke besparing.
- *Indirect rebound*: het bespaarde geld gaat naar andere producten die energie verbruiken. Ongeveer *10%* van de besparing.

Het *prebound-effect*: veel mensen hebben een klein budget en kunnen zich nieuwe zuinige technologie niet veroorloven.

=== Energieconsumptie <sec:energieconsumptie>

Een gezin in België verbruikt ongeveer *4 MWh elektriciteit per jaar*. Voor verwarming (bv. met aardgas) is dat *3 à 4× meer*.

*Gebouwen.* Steeds meer daken krijgen PV-panelen. Overdag is niemand thuis en schijnt de zon op alle daken tegelijk, dus het overschot gaat naar het net. Dat kan het lokale net overbelasten. Oplossingen: verbruik op dat moment activeren of een thuisbatterij.

Gebouwen isoleren is altijd goed. Voor verwarming willen we weg van gas en olie. De beste technologie is de *warmtepomp*: een elektrisch aangedreven thermodynamische machine die warmte uit de omgeving opwaardeert. Ze verbruikt *3 à 5× minder energie* en stoot veel minder CO#sub[2] uit.

Waterstof in het gasnet in plaats van aardgas lijkt een optie, maar het rendement is slecht. De keten is lang:
+ duurzame waterstof maken met *elektrolyse* (elektriciteit splitst water in waterstof en zuurstof)
+ comprimeren en verdelen
+ thuis verbranden, of in een brandstofcel terug omzetten in elektriciteit

Elke stap heeft verliezen. De waterstofroute is daardoor *5 à 6× minder efficiënt* dan een warmtepomp.

*Transport.* Een batterij-elektrische auto rijdt ongeveer 400 km met 15 kWh. Zijn CO#sub[2]-uitstoot is *minstens 3× lager* dan die van een benzine- of dieselauto, en nul als de elektriciteit volledig duurzaam is. Hij is stiller en stoot geen stikstofoxiden of fijn stof uit. Met dezelfde primaire energie rijdt een elektrische auto *3 à 4× verder* dan een waterstofauto.

Voor lange afstanden (scheepvaart, vliegtuigen) blijft volledig elektrisch moeilijk. Daar komen waarschijnlijk *synthetische brandstoffen* op basis van waterstof: een *indirecte elektrificatie*.

*Industrie.* Ook daar vervangen elektrische processen fossiele. Maar niet alles kan direct elektrisch: chemische processen hebben koolstof en waterstof als bouwstenen nodig, die nu uit fossiele brandstof komen. Voor koolstof moet een circulaire bron komen, waterstof moet gemaakt worden met veel elektriciteit.

== Energieopslag <sec:energieopslag>

Opslag van elektriciteit is nodig voor de elektrische auto en de thuisbatterij. De *lithiumbatterij* maakt de energietransitie mogelijk. Door massaproductie daalde haar prijs met een *factor 10 in tien jaar*.

Moderne lithiumbatterijen:
+ kunnen honderden tot duizenden keren geladen en ontladen worden zonder veel capaciteit te verliezen
+ zijn compact: hoge energie- en vermogensdichtheid
+ bevatten geen kobalt meer (oudere types wel, en kobalt is giftig)
+ zijn volledig recycleerbaar

Batterijen balanceren productie en verbruik op *korte termijn*: binnen een dag of een week. Voor *lange termijn*, tussen seizoenen, zijn andere vormen nodig: *thermische opslag* of *pompcentrales* met grote waterbekkens.

== Energiebeleid <sec:energiebeleid>

=== Energiemarkten <sec:energiemarkten>

Sinds de eeuwwisseling is de Europese elektriciteits- en gasmarkt een *vrije markt*: vraag en aanbod bepalen de prijs, in plaats van een vaste prijs.

Vroeger betaalde je per verbruikte kWh, liter of m#super[3]. Zon en wind produceren bijna zonder kosten, dus de prijs hangt vooral af van de investeringen. Het net wordt ook zwaarder belast. Nieuwe tarieven volgen daarom de kapitaalkosten: van een factuur per kWh naar *capaciteitstarief*.

Om van dynamische tarieven te profiteren zijn nieuwe businessmodellen en *digitale meters* nodig. Elke Europese verbruiker krijgt binnenkort een digitale meter. Al die data beheren is een grote uitdaging.

=== Energiebeleid <sec:energiepolicy>

De transitie vraagt samenwerking tussen alle bestuursniveaus: Europa, land en lokaal bestuur. *Europese richtlijnen* (directives) leggen de basis van de energiemarkten en zetten doelen voor efficiëntie en decarbonisatie.

Een voorbeeld is het *Emission Trading System (ETS)*. Bedrijven krijgen verhandelbare rechten om CO#sub[2] uit te stoten, en het aantal rechten daalt sterk tegen het midden van de eeuw. Zo winnen de technologieën die CO#sub[2] het goedkoopst vermijden. In de praktijk werkt het als een *koolstoftaks* in de prijs van elektriciteit en industriële producten. Het ETS wordt waarschijnlijk uitgebreid naar transport en ander gebruik van fossiele brandstoffen.

== Bigger picture <sec:bigger-picture>

De energietransitie gebeurt geleidelijk, over generaties. De meeste technologie bestaat al en wordt betaalbaar via nieuwe businessmodellen. Volgens de cursus hoeven we niet in te leveren op comfort en wordt energie niet onbetaalbaar.

#figure(
  image("assets/Energie-Links-met-andere-challenges.png", width: 10cm),
  caption: [Links van energie met de andere challenges],
  label: <fig:Energie-Links-met-andere-challenges>,
)
