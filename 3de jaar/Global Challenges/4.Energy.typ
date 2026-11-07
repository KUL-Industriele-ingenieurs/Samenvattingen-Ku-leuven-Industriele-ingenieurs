#import "../../school-template.typ": *

= Energy <ch:energy>

== Introductie <sec:introductie-energie>

Energie is een groot deel van onze maatschappij, alle kritische infrastructuur zoals ziekenhuizen, transport en communicatie zijn afhankelijk van energie. De meeste van deze energie komt wel van fossiele brandstoffen dat een impact heeft op klimaat

We moeten dus alternatieven zoeken of efficienter omgaan met energie zodat we minder gebruiken. In deze module bekijken we alle soorten energiebronnen en de impact en kosten ervan, daarna kijken we hoe energie getransport wordt en hoe we energie kunnen opslaan, dan bekijken we hoe we deze energiebronnen kunnen optimaliseren

Als laatste kijken we nog naar energiemarken en policies.

=== Wat is energie <sec:wat-is-energie>

Onze manier van leven heeft is afhankelijk van energie, maar dat heeft ook impact op de omgeving. We proberen hierdoor een energietransistie te doen om minder impact te hebben op het milieu. Maar wat is energie eigenlijk? Energie is de mogelijkheid om arbeid te verrichten, dit kan in verschillende vormen zoals warmte, licht, elektriciteit, mechanische energie, chemische energie en kernenergie.

#theorie(title: "Wat is energie?")[

Energie is de mogelijkheid om arbeid te verrichten, dit kan in verschillende vormen zoals warmte, licht, elektriciteit, mechanische energie, chemische energie en kernenergie.

We noemen verschillende energievormen een energievector. De energievectoren zijn:

+ Warmte
+ elektriciteit
+ chemische Energie zoals gas.

Er zijn meerdere units zoals Joule [J] Watt [W] en kilowattuur [kWh]

Energie kan niet vernietigd worden het wordt alleen in een andere vorm omgezet. Nuttige energie kan wel verloren gaan bijvoorbeeld warmte door wrijving kunnen we niet gebruiken. Als we spreken over energie omzetten spreken we over rendement of energie conversion 

]

ER MIST HEEL VEEL HIER MAAR MAAK HET NIET TE COMPLEX


#figure(
  image("assets/Energie-balans-van-nederland.png", width: 5cm),
  caption: [Energie-balans-van-nederland],
  label: <fig:Energie-balans-van-nederland>,
)

== Energiebronnen <sec:energiebronnen>

#concept(title: "Primaire vs secundaire type energie")[

Primaire energie zijn energiebronnen die stabiel in de natuur gevonden worden

Secundaire energie zijn energiebronnen die we zelf maken uit primaire energiebronnen zoals elektriciteit en waterstof. 

]
Hernieuwbare energie is energie dat een constante energiestroming heeft en dat ook heeft voor de quasi eeuwigheid. Voorbeelden zijn wind, zon en waterkracht.

Fossiele brandstoff zijn niet hernieuwbaar omdat ze miljoenen jaren nodig hebben om te vormen. Voorbeelden zijn aardolie, aardgas en steenkool. 

Sustainability is niet alleen rond klimaat, fossiele brandstoffen beschadegen ook het land en de lucht. Voorbeelden zijn olievervuiling, luchtvervuiling en ontbossing.

De volgende stap is de energie gebruiken om arbeid te verrichten. We bekijken verschillende soorten energie en vergelijken de pros en cons

=== Thermic energy <sec:thermic-energy>

+ Coal Power plant
  #figure(
  image("assets/Coal-Plant.png", width: 5cm),
  caption: [Coal-Plant],
  label: <fig:Coal-Plant>,
)

  Coal wordt verbrand om warmte te produceren, deze warmte wordt gebruikt om water te verwarmen en stoom te produceren. Deze stoom drijft een turbine aan die elektriciteit produceert. 

  Elk van deze conversion processen heeft een rendement en hoe meer processen hoe langer het rendement en dus voor dit process is het rendement van een kolencentrale is ongeveer 35-40%. 

+ Gas Power plant: IDK VOEG TOE
+ CHP (Combined Heat and Power Systems): 
+ Methane:  
  -
  - 
  - 

+ Synthetic gas:
+ Nuclear energie producetion
  + Fission:
  + Fusion:

=== Hernieuwbare energie <sec:hernieuwbare-energie>

+ * Zonne energie: Met PV (Photovoltaic)* panelen kunnen we zonlicht omzetten in elektriciteit. Power electronics worden dan gebruikt om DC naar AC om te zetten. Dit process is hernieuwbaar en heeft geen impact op het milieu. Het nadeel is dat het niet aanwezig is snachts.
+ *Wind energie*: Wind turbines zetten kinetische energie van de wind om in elektriciteit. Het is hernieuwbaar en heeft geen impact op het milieu. De energieoutput is wel niet constant en hangt af van het weer, op zee is dit wel beter en is er meer constante output. 
+ *Hydropower*: Waterkrachtcentrales zetten de kinetische energie van stromend water om in elektriciteit met een generator en turbine. De output is variable afhankelijk van waterstroom tijdens verschillende seizoenen en regenperiodes. De grootste probleem is dat het impact heeft op de omgeving en ecosystemen omdat het regios overstroomt. Het is dus niet helemaal hernieuwbaar en expansiemogelijkheden zijn beperkt.

=== Kosten

Kosten zijn afhankelijk van welk type power je gebruikt. Energie heeft twe soorten kosten:
+ Investment capitaal
+ Operationele kosten

Gas power plats zijn goedkoop om te bouwen maar duur om te runnen, zonnepanelen zijn duurder om te bouwen maar hebben heel weinig maintance

Daarom gebruiken we een levelized cost of energy (LCOE) om de kosten te vergelijken. LCOE is de totale kosten van een energiebron gedeeld door de totale energie output over de levensduur van de installatie.

Meeste technologieen worden goedkoper naarmate de technologie verbetert buiten nucleaire doordat er hardere safety standards zijn.

#figure(
  image("assets/Levelized-costs-of-energie-van-verschillende-technolgien.png", width: 5cm),
  caption: [Levelized-costs-of-energie-van-verschillende-technolgien],
  label: <fig:Levelized-costs-of-energie-van-verschillende-technolgien>,
)

Je ziet dat wind en solar enorm gedaald zijn met 10x goedkoper dan 10 jaar geleden.

Als je energieproductie op systeem bekijkt dan zie je dat long term er verandering is over de dag en of week waarbij batterijen of energie over het internationaal net moet geschakeld worden. Je moet ook rekening houden met windstille of bewolke dagen waarbij er minder energieproductie is.

We tonen dit in de Duck curve omdat de curve lijkt op een eend.
#figure(
  image("assets/System-load-en-time-of-day.png", width: 5cm),
  caption: [System-load-en-time-of-day],
  label: <fig:System-load-en-time-of-day>,
)

=== Energie network <sec:energie-network>

Om energie te verspreidien heb je natuurlijk netwerks nodig, elektricitet, heat netwerks, gas netwerks, data netwerks. 

==== Elektriciteit netwerken <sec:elektriciteit-netwerken>

We verspreiden elektriciteit via meerdere niveau van powerplant tot je huis.
+ High voltage transmission lines: 400kV, 220kV, 150kV, 110kV of underground cables: Hoge voltages worden gebruikt om rendement en reliability van het net te verhogen, ondergrondse kabels kosten veel meer en hebben limited range, werken beter met DC in plaats van AC. 
+ Local distribution lines: 10kV, 0.4kV: Lagere voltages kabels meestal ondergrond.
+ Stepdown transformers: 400V, 230V: Transformatoren worden gebruikt om voltage te verlagen zodat het veilig is voor huishoudens en bedrijven.

In je eigen huis heb je ook een netwerk van axial en radial kabels die je huis van elektriciteit voorzien.

#figure(
  image("assets/Elektriciteit-grid.png", width: 5cm),
  caption: [Elektriciteit-grid],
  label: <fig:Elektriciteit-grid>,
)

==== Andere type netwerken <sec:gas-netwerken>
Andere netwerken hebben heel gelijkaardige structuur met meer high throughput lijnen tot dan minder efficiente maar ondergrondse distributie lijnen. Gas netwerken zijn meestal ondergronds en hebben een hogere druk dan elektriciteit netwerken. Heat netwerken zijn meestal boven grond en hebben een lagere druk dan gas netwerken.
Vandaag de dag kan dit allemaal niet zonder digitale tools en heb je een system of systems.


== Energiegebruik <sec:energiegebruik>

=== efficientie <sec:efficiency>

=== Energieconsumptie <sec:energieconsumptie>

== Energieopslag <sec:energieopslag>


== Energiebeleid <sec:energiebeleid>









