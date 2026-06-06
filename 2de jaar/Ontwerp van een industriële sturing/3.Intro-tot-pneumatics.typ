#import "../../school-template.typ": *

= Pneumatica <ch:intro-pneumatics>

#chapter-outline()

== Wat is pneumatiek?

Pneumatica is het controlleren van #keyterm[Cilinders en pistons] met behulp van #keyterm[Lucht]. We gaan deze kunnen bedienen met behulp van #keyterm[Valves]. We gebruiken onze #keyterm[Relays] en #keyterm[PLC's] om deze te bedienen.

Voor het labo moet je meer weten over pneumatiek.
Zorg dat je alles dit nog deftig doorneemt voor je aan de labo's begint.

== Contents

+ Basis van pneumatiek in video's  _Deze video's zijn niet altijd academsich goed, maar geven wel een goed beeld van de basisprincipes_
+ Druk en vacuum
+ Compressors en luchttoepassingen
+ Releasing Air
+ Switches
+ Logic circuits
+ Labo equipment


== Basis van pneumatiek in video's

Excellent electro-pneumatics overview(later lecture): Compressor, FRL, (PLC), valve, cylinder:
https://www.youtube.com/watch?v=lBARBZNLxQI
• Single acting cylinder: https://www.youtube.com/watch?v=B8z8veo1FfA
• Single acting cylinder, manual 3/2 valve: https://www.youtube.com/watch?v=8rTFzeBMJhg
• Double acting cylinder, correct illustration of metered out flow control valves:
https://www.youtube.com/watch?v=9uPtNkWjtQE
• 5/2 monostable direct acting directional control valve, double acting cylinder, valve symbol basics:
https://www.youtube.com/watch?v=bXXL-0sf8gs At the beginning of the video they suggest that
“spool” valve is used as a synonym for “hydraulic” valve, something we don’t do in this course!
We will discuss (the differences between) disc valves, spool valves and poppet valves later


== Druk en vacuum

#concept(title: "Absolute en relatieve druk")[


  #wrap-figure(
    image("assets/absolutevsrelatievedruk.png", width: 7cm),
    caption: [absolutevsrelatievedruk],
    label: <fig:absolutevsrelatievedruk>,
  )[
    Druk is de kracht van molecules over een oppervlakte [F/A]

    *Absolute druk* is de druk ten opzichte van het vacuüm.

    *Relatieve druk* is de druk ten opzichte van de atmosferische druk.
    Bij een absoluut vacuüm zijn er geen enkele botsingen van moleculen.

    Als we *pressure guages* aflezen zijn we relatieve druk aan het aflezen.
    De druk tegenover de atmosferische druk is 0 bar.

    Een atmosferische druk is ongeveer 1 bar = 100 000 Pa = 100 kPa.
  ]
]

In de industrie kun je hoge druk van lucht vergelijken met een veer.
Als je er minder druk op zet gaat het terug uitzetten en omgekeerd.

$ F = k dot Delta x $


=== Vacuüm

Druk is uiteindelijk botsingen van moleculen tegen een oppervlakte.
#figure(
  image("assets/magdeburg hemispheres.png", width: 5cm),
  caption: [magdeburg hemispheres],
  label: <fig:magdeburg-hemispheres>,
)

Je ziet op de figuur dat er minder botsingen zijn aan de binnenkant dan aan de buitenkant. Waardoor het voelt dat er een kracht op het voorwerk zit.

In de industrie wordt er vaak een zuignap gebruikt om voorwerpen op te pakken.
Je zet de zuignap op het voorwerp en pompt de lucht eruit. Je vergroot dan terug het volume maar er komt geen lucht bij. Dus de druk daalt. Hierdoor wordt het voorwerp opgetild.


== Compressors en luchttoepassingen

#figure(
  image("assets/tools pneumatics.png", width: 5cm),
  caption: [Tools pneumatics],
  label: <fig:tools-pneumatics>,
)

In de industrie wordt pneumatics veel gebruikt. Tandartsen, schroevendraaiers, spuitverf, etc.

=== Vacuum ejector

#wrap-figure(
  image("assets/vacuum ejector.png", width: 5cm),
  caption: [vacuum ejector],
  label: <fig:vacuum-ejector>,
)[

  - Wanneer lokale vacuümdruk vereist is (bijv. voor een zuignap), wordt perslucht continu door een Venturi geblazen, zolang het vacuüm nodig is.
  - Ondanks de geluiddemper op de uitlaat is dit vrij luidruchtig.
  - Regeling gebeurt meestal door smoring op de persluchttoevoerlijn.
]

/ Een vacuum netwerk: In sommige industriëne heb je constant toegang nodig tot perslucht of vacuum. _Denk aan elektronica workshops die dingen moet wegblazen etc_ Hiervoor worden netwerken gemaakt net zoals elektriciteit of water.

Om dingen tight te houden zodat lucht niet lekt worden gasdichte connecties gebruikt. Deze worden ook toegepast op andere hoge druk systemen zoals water en zelf in de luchtvaart en ruimtevaart.
#concept(title: "Gasdichte connecties")[
  Hoe ga je nu dingen gasdicht houden?
  Je wilt geen druk verliezen door lekken.
  #figure(
    image("assets/gasdicht.png", width: 5cm),
    caption: [gasdicht],
    label: <fig:gasdicht>,
  )

  Dit werkt met O-rings. Dit zijn rubberen ringen die in een groef worden geplaatst.

  • Bijvoorbeeld G1/8, mogelijk met Teflon
  • Bijvoorbeeld M5 met platte dichting (figuur)
  • NPT, taps toelopende schroefdraad, …
  • Snelkoppelingen (plug-in koppelingen, figuur)
  • 4, 6, 8, 10 mm buitendiameter slang
]

=== Pneumatische cilinders

#examenbox(
  "Zorg dat je niet verward geraakt met pompen in industriele sturing en anderre soort pompen in de thermodynamica",
)

We zetten een hoge druk aan de linkerkant. Hierdoor wordt de zuiger naar rechts geduwd. Daarna wordt deze hoge druk losgelaten door de return flow. De druk is nu ineens weg en gaat de zuiger terug naar links.


We werken met relatieve druk want als we de druk niet groter zetten als de atmosferische druk, dan gaat de zuiger niet naar rechts omdat er druk is aan de staafkant die de zuiger tegenhoudt.

#figure(
  image("assets/pneumatische cilinder.png", width: 8cm),
  caption: [pneumatische cilinder],
  label: <fig:pneumatische-cilinder>,
)

Wanneer de zuiger beweegt tussen de twee eindposities (volledig in- of uitgeschoven) spreken we van een #keyterm("Full-stroke") of een *volledige slag*. De afstand die de zuiger hierbij aflegt is de *slaglengte*. In industriële sturingen worden pneumatische cilinders meestal binair gebruikt: ze bevinden zich ofwel in de beginpositie, ofwel in de eindpositie.

Meestal gebruiken we *Full pressure*: we proberen niet zuinig te zijn met lucht om de efficiëntie te vergroten, aangezien energie-recuperatie bij pneumatiek meestal niet mogelijk is. De kamer die niet onder druk staat, moet altijd worden *ontlucht* naar de atmosfeer.

De meeste cilinders zijn *dubbelwerkend* (double acting) en hebben dus twee aansluitingen. De kracht in beide richtingen is echter vaak niet gelijk. Dit komt door de *zuigerstang* (piston rod): aan de stangzijde is het effectieve oppervlak kleiner dan aan de bodemzijde, waardoor de uitgaande slag krachtiger is dan de ingaande slag bij dezelfde druk.

Veel pneumatische cilinders zijn uitgerust met #keyterm("Einddemping") (end cushioning). Dit voorkomt dat de zuiger hard tegen de eindkappen slaat. De demping kan vaak handmatig worden ingesteld met een regelschroef op de cilinder zelf.


#figure(
  image("assets/pneumatische-cilinders-design.png", width: 12cm),
  caption: [pneumatische-cilinders-design],
  label: <fig:pneumatische-cilinders-design>,
)

Kracht wordt gereguleerd door de druk.

$ F = p dot A $

*Snelheid control* is mogelijk door #keyterm("Throttling") met een flow control valve.
Je gaat je uitlaat of inlaat controlleren zodat je controle hebt over de snelheid



=== Soorten cilinders

+ *Single acting cylinder*: heeft één aansluiting en gebruikt een veer om terug te keren naar de beginpositie. _Zie vorige figuur_
+ *Double acting cylinder*: heeft twee aansluitingen en kan zowel vooruit als achteruit worden bewogen door luchtdruk. De ingang is geen pomp maar een compressor. Je ingang en uitgang verwisselen dus van plaats tijdens een *Stroke*.
  #figure(
    image("assets/double acting cilinder.png", width: 8cm),
    caption: [double acting cilinder],
    label: <fig:double-acting-cilinder>,
  )
+ *Guided cylinder*: heeft een geleiding om te voorkomen dat de zuiger zijdelings beweegt.
  #figure(
    image("assets/guided-cilinders.png", width: 8cm),
    caption: [guided-cilinders],
    label: <fig:guided-cilinders>,
  )
+ *Speciale cilinders*: Een double rod cylinder heeft twee zuigerstangen. Hierdoor kan je de zuiger in beide richtingen bewegen met dezelfde kracht. Een rotating cilinder kan de zuiger 360 graden draaien.
  #figure(
    image("assets/special-cilinders.png", width: 8cm),
    caption: [special-cilinders],
    label: <fig:special-cilinders>,
  )

#examenbox("Op het examen krijg je alle symbolen gegeven voor het examen. Je moet ze niet vanbuiten leren.")

#figure(
  image("assets/symbolen-cilinders.png", width: 12cm),
  caption: [symbolen-cilinders],
  label: <fig:symbolen-cilinders>,
)


== Kracht op full pressure


Wat is de kracht op een cilinder op full pressure. Er zijn drie krachten die inspelen hierop. Dat zijn de krachtne op de piston, op de rod en ini de chamber.

#examenbox("Deze vragen worden vaak fout opgelost dus let op")
#figure(
  image("assets/kracht-fullpressure.png", width: 7cm),
  caption: [kracht-fullpressure],
  label: <fig:kracht-fullpressure>,
)


We gaan eerst alle krachten bepalen van de cilinder.

$ F_1 = p_(1r e l) dot A_1 = p_(1r e l) dot frac(pi dot D^2, 4) $

$ F_2 = p_(2r e l) dot A_2 = p_(2r e l) dot frac(pi dot (D^2-d^2), 4) $

$ F_3 = p_(3r e l) dot A_(r o d) = p_(3r e l) dot frac(pi dot d^2, 4) $

Gebruik relatieve druk zodat je $F_3$ niet moet berekenen.

=== Rekenvoorbeeld: Kracht op full pressure

#oefening(
  title: "Kracht op full pressure",
)[Stel dat we de (statische) kracht berekenen tijdens een trage uitgaande slag voor een relatieve toevoerdruk van $6 "bar"$ en een tegendruk van bv. $1 "bar"$ relatief ($approx 2 "atm"$). Gegeven de diameters $D = 25 "mm"$ en $d = 8 "mm"$:

  $ F_1 = p_"1rel" dot A_1 = p_"1rel" dot (pi dot D^2)/4 = 6 dot 10^5 "Pa" dot (pi dot 0.025^2 "m"^2)/4 = 295 "N" $
  $
    F_2 = p_"2rel" dot A_2 = p_"2rel" dot (pi (D^2 - d^2))/4 = 1 dot 10^5 "Pa" dot (pi (0.025^2 - 0.008^2) "m"^2)/4 = 44 "N"
  $
  $ F_3 = 0 "N" $

  Aangezien deze zijde verbonden is met de atmosfeer ($0 "bar"$ relatief). De netto kracht bij de uitgaande slag is dus:
  $ F_"outward" = 295 "N" - 44 "N" = 251 "N" $
]

We zouden de tegendruk (vent pressure) kunnen verlagen door een *quick release valve* te installeren, maar meestal is de hoge tegendruk een gevolg van de debietregeling (flow regulation).

Voor de kracht tijdens een trage *inwaartse slag* met dezelfde toevoer- en tegendrukwaarden bekomen we:
$ F_"inward" = 264 "N" - 49 "N" = 215 "N" $

#examenbox("Tip voor het examen: Gebruik relative druk zodat je $F_3 = 0$")

== Lucht laten ontsnappen

+ / Uitlaatdemper: Dempt de uitlaat van de cilinder, minder geluid en verlaagt de flowrate $dot(V)$
+ / Millieufilte: Filter de lucht die uit de cilinder komt
  #figure(
    image("assets/Milileufilter.png", width: 3cm),
    caption: [Milileufilter],
    label: <fig:Milileufilter>,
  )
+ / Snelheidsregeling: Regelt de snelheid van de cilinder

#wrap-figure(
  image("assets/snelheidsregeling.png", width: 5cm),
  caption: [snelheidsregeling],
  label: <fig:snelheidsregeling>,
)[
  We kunnen de snelheid van de cilinder regelen door de lucht te laten ontsnappen via een flow control valve.

  #examenbox("Examenvraag: Wat is een snelheidsregelventiel?")

  Een #keyterm("Throttle valve") (smoorventiel) regelt de luchtstroom en werkt in beide richtingen. Vaak gebeurt dit via een conische naald die dieper in een opening (orifice) kan worden geschroefd.

  Een #keyterm("Flow control valve") (FCV, One-way Throttle Valve, speed control valve) bestaat uit een combinatie van een smoorventiel en een terugslagklep (check valve) in parallel. Dit zorgt ervoor dat de flow slechts in *één richting gesmoord* wordt; in de andere richting stroomt de lucht vrij door via de terugslagklep.

  *Metered out* (smoren op de uitlaat):
  In een cilinder werkt de kracht van de perslucht tegen de kracht van het gas aan de andere kant van de zuiger. Het smoren van deze *uitlaatlucht* is een goede en vaak de juiste manier om de snelheid van een zuiger te regelen.
]

*Metered uit*
Regelen over de uitstromende lucht van je *Cilinder*
Dit is *de juiste manier* voor speed control te doen

#voorbeeld(title: "Speed control")[

  Stel je hebt een cilinder die 6 bar een last optilt.
  Dan laten we die last zakken.
]

*Metered in*
Regelen over de inkomende lucht van je *Cilinder*
Dit is de *verkeerde* manier voor speed control te doen


#figure(
  image("assets/pompcircuit.png", width: 4cm),
  caption: [pompcircuit],
  label: <fig:pompcircuit>,
)

Snelheidsregeling monteer je op de cilinder. Je smoortap zo dicht mogelijk bij de cilinder plaatsen. Maar je kunt het ook op de ventiel zetten.
Berijkbaarheid is soms belangrijker.


Daarbuiten heb je nog een quick relief ventiel. Een quick relief valve wordt gebruikt om snel de druk van een systeem te verlagen. #link("https://www.youtube.com/watch?v=BTNiZhbrLNg")


== Switching

In dit deel bekijken we hoe "switching" (schakelen) gebeurt in pneumatische systemen. Switching betekent dat je de richting van de luchtstroom verandert om zo de beweging van cilinders te controleren. Dit gebeurt met behulp van #keyterm[Directional Control Valves] (DCV), ook wel stuurventielen of wegventielen genoemd.

=== Ventielen (Valves)

Een ventiel is het component dat de doorgang van lucht controleert; het fungeert als een "deur" die lucht al dan niet doorlaat.

Een paar voorbeelden:
- Een *elektro-pneumatisch ventiel* is een elektrisch aangestuurde schakelaar voor pneumatische circuits.
- Een *elektro-hydraulisch ventiel* is een elektrisch aangestuurde schakelaar voor hydraulische circuits.

$arrow.r.double$ Een actuator zoals een pneumatische cilinder of hydraulische motor wordt verbonden met de uitgangspoorten (outlets) van het ventiel.

#theorie(title: "Eigenschappen van een ventiel")[
  - Een *supply poort* verbonden met de #keyterm[hydraulische] of #keyterm[pneumatische] (power) toevoer.
  - Een *exhaust poort* om druk af te laten naar de atmosfeer of terug naar de tank.
  - Kan #keyterm[NO] (Normally Open) of #keyterm[NC] (Normally Closed) zijn.
  - Een ventiel kan een *switch-over* hebben (overgang tussen de standen).
]


*Schakelen van perslucht*

Een controleventiel waarbij een (vaak analoog) signaal de debietstroom $[dot(Q)]$ bepaalt. We gebruiken hiervoor de term #keyterm("Direction control valve") (DCV).

=== Direction control valve (DCV)

#examenbox("Op het examen krijg je deze symbolen gegeven. Je moet wel weten wat ze allemaal betekenen")

#figure(
  image("assets/Symbolen van een DCV.png", width: 5cm),
  caption: [Symbolen van een DCV],
  label: <fig:Symbolen-van-een-DCV>,
)


In de figuur zie je de links zie dat dat een cilinder geconnecteerd is aan een 5/3 ventiel. Want het heeft 5 ingangen en heeft 3 hokjes.

Een valve wordt aangeduid met twee nummers: *aantal poorten / aantal schakelstanden* (bv. 5/2). In de labo's gebruiken we meestal 3/2 ventielen.

*Eigenschappen & Symbolen*
- *Standen* teken je als vierkanten (rustpositie rechts of midden). Pijlen tonen stromingsrichting, een "T" betekent geblokkeerd.
  - *Bistabiel (x/2 of x/3)*: Spoel aan beide kanten. Zal altijd of naar links of naar rechts gaan. Kan niet vast geraken tussenin.
  - *Monostabiel (x/2)*: Spoel aan één kant, veer aan de andere. Keert terug naar rustpositie bij signaalverlies.
  - *Middenstand*: x/3 ventielen zijn dubbel monostabiel met een stabiele *center position*.
  -
- *Toestanden*: Worden aangeduid als N.O. (Normally Open) / N.C. (Normally Closed), fail-open of fail-close.

== Mono en bi stabiele valves

- De klepspoel(en) zijn apparaten met een laag vermogen (bijv. 2 Watt), aangestuurd door een elektrisch regelcircuit, bijv. een relaiscircuit of een PLC. De nominale spanning van de spoel(en) kan bijv. 24 VDC of 230 VAC zijn.
- Een ventiel kan standschakelaars hebben: N.O. of N.C. hulpcontacten die de ventielstand detecteren. Meestal heeft het er geen.

=== Monostabiel x/2 ventiel
Een monostabiel x/2 ventiel heeft slechts één spoel:
- In de besturingslogica kunnen we de spoel van het monostabiele ventiel activeren om het in te schakelen (activeren).
- Als we de stroom naar de spoel uitschakelen, deactiveren we het monostabiele ventiel. Automatische reset bij opstarten (keert terug naar rustpositie door een veer).

=== Bistabiel x/2 ventiel
Een bistabiel x/2 ventiel heeft twee spoelen:
- In de besturingslogica kunnen we de ene spoel bekrachtigen om het ventiel te "activeren", of we kunnen de andere spoel bekrachtigen om het ventiel te "deactiveren".
- Het is een **geheugenfunctie**, vergelijkbaar met een flip-flop.
- Als we de stroom naar beide spoelen uitschakelen, blijft het bistabiele ventiel in de huidige positie staan.
- Hetzelfde zou waar moeten zijn als we beide spoelen activeren, maar deze situatie moet worden vermeden.
- "Activeren" en "deactiveren" kunnen willekeurig zijn, aangezien het een bistabiel ventiel is.
- ➢ Wanneer je een bistabiel ventiel installeert, kan het zich in elke (start)positie bevinden.

#figure(
  image("assets/bistabiel.png", width: 10cm),
  caption: [bistabiel],
  label: <fig:bistabiel>,
)

#figure(
  image("assets/diagram bistabiel.png", width: 5cm),
  caption: [diagram bistabiel],
  label: <fig:diagram-bistabiel>,
)

=== x/3 ventielen
- x/3 ventielen zijn *dubbel monostabiele ventielen* (2 spoelen).
- Zonder bekrachtiging keren ze terug naar de *middenpositie* (center position).
- In pneumatica heb je dus 5 poorten en 3 standen bij een 5/3 ventiel. (N.O. / N.C. / Middenstand).
- 5/3 ventielen kunnen gevaarlijk zijn omdat je nu 3 standen hebt.

*Wanneer gebruik je een 5/3 ventiel?*
- / Tussenliggende positionering: Wanneer de zuiger op elk punt van zijn slag gestopt moet kunnen worden.
- / "Inching" of kruipen: Wanneer je de cilinder in kleine, gecontroleerde stappen moet verplaatsen.
- / Positie behouden: Wanneer de cilinder op zijn plaats moet blijven zonder dat er actief luchtdruk aan één zijde wordt toegevoerd (vooral bij "gesloten middenstand").
- / Veiligheid/Noodstop: Om de cilinder te ontluchten of te laten "zweven" in een veilige toestand tijdens een stroomstoring of noodstop, waardoor onverwachte bewegingen worden voorkomen.
- / Impact voorkomen: Een 5/3 ventiel met "ontluchte middenstand" kan druk aflaten, wat de impact op de cilinder bij het stoppen vermindert en apparatuur beschermt.

*Soorten middenstanden (Center positions)*
De middenstand bepaalt de toestand van de cilinder wanneer geen van beide spoelen bekrachtigd is:
- / Gesloten middenstand (Closed Center - CC): Alle poorten zijn geblokkeerd. De cilinder behoudt zijn laatste positie (meest gebruikelijk voor het vasthouden van lasten).
- / Ontluchte middenstand (Exhaust Center - COE): De cilinderpoorten zijn verbonden met de uitlaat. De cilinder is vrij om te bewegen ("zweeft").
- / Druk middenstand (Pressure Center - COP): Er wordt druk uitgeoefend op beide cilinderpoorten. Wordt gebruikt voor het handhaven van constante druk.

5/3 ventielen maken doorgaans gebruik van dubbele spoelen en worden vaak ingezet bij complexe automatisering, zoals bij klem-, pers- of positioneringstoepassingen waar een 5/2 ventiel onvoldoende controle biedt.


== Reference designation system (RDS)

Hoe gaan we onze pneumatica cilinders en componenten benamen? Hiervoor gebruiken we RDS (Reference Designation System). Moderne elektro-pneumatische of elektro-hydraulische systemen gebruiken vaak een combinatie van standaarden in hetzelfde schema:
- *ISO 1219-2* voor de symbolen.
- *IEC 81346-2* voor de identificatiecodes van componenten.

*Specifieke Aanduidingen*
- De RDS-code voor een ventiel hangt af van het doel, bv. `-Q`, `-K` of `-F`.
- Voor de individuele spoelen (solenoids) gebruikt men `-M`. Een spoel kan immers afzonderlijk op een ventiel worden gemonteerd en fungeert als de motor voor de beweging van het ventiel.
  _Voorbeeld_: Bij een bistabiel ventiel `-Q1` worden de spoelen aangeduid als `-Q1.M1` en `-Q1.M2`.

*Bedrijfsstandaard (Motion name)*
De bedrijfsstandaard van de prof gebruikt een volledige RDS gebaseerd op de naam van de beweging. Stel, cilinder `=M10` wordt gestuurd door een bistabiel ventiel `-Q1`:
- De cilinder blijft `=M10`.
- Het sturende ventiel met zijn spoelen wordt: `=M10-Q1.M1` en `=M10-Q1.M2`.

*Geluiddempers en Snelheidsregelaars (FCV)*
- Een aparte geluiddemper in dit circuit zou `=M10-R1` heten.
- Als de demper *geïntegreerd* is in het ventiel, wordt dit `=M10-Q1.R1`.
- Analoog voor een Flow Control Valve (FCV, `-R2`): Gemonteerd op de cilinder wordt dit `=M10-R2`. Gemonteerd in het ventiel wordt dit `=M10-Q1.R2`.

_Bij het ontwerpen van logica gebruiken we letters alfabetisch (zie latere slides)._




== Pilot valve

Een #keyterm("Pilot valve") is een elektro-pneumatische actuator die een pneumatisch gestuurd ventiel bedient. De elektrische spoel (solenoid) opent enkel het toegangspad voor de perslucht. Deze lucht levert de kracht om het grote ventiel te bewegen, wat zorgt voor een pneumatische krachtversterking.

Voordelen (vooral voor monostabiele ventielen):
- *Lager energieverbruik* (efficiënter) bij het aanhouden van de geactiveerde stand vergeleken met directe spoel-bediening.
- *Weinig elektriciteitsgebruik*: De stroom naar de spoel is vaak laag genoeg om direct op een digitale uitgang (transistor) van het besturingssysteem aan te sluiten. Dit bespaart kosten doordat een extra interfacelai of snubber circuit overbodig is.

#concept(title: "Internal pilot vs external pilot")[
  *Internal pilot* (ook *bleed piloted* genoemd) gebruikt de inkomende hoofdluchttoevoer (main supply) van het ventiel zelf om voldoende kracht te genereren om te schakelen.
  _Nadeel_: Dit kan problemen veroorzaken! Als de persluchtdruk te laag is, bij een "soft start", of als de hoofdlucht is uitgeschakeld, zal dit ventiel niet kunnen schakelen.

  *External pilot*: De stuurlucht om te schakelen (*pilot air*) wordt geleverd via een aparte poort en gecontroleerd door een ander, onafhankelijk circuit.
]


#figure(
  image("assets/symbolen pneumatische valves.png", width: 4cm),
  caption: [symbolen pneumatische valves],
  label: <fig:symbolen-pneumatische-valves>,
)

#examenbox("Zorg dat je alle symbolen goed kent voor het examen gratis punten")


== Logic circuits met ventielen

We gaan onze logic circuit baseren op:
+ Safety
+ Energy efficiency

We gebruiken #keyterm[Pneumatische controls] voor simpele circuits.
En meer complexe systemen met #keyterm[Electro-pneumatische controls] (PLC or relay circuits).

We gaan onze druk controlleren via logic circuits om cilinders te controlleren.

A+ brengt ons van $A_0$ naar $A_1$\
A- brengt ons van $A_1$ naar $A_0$

de $A_0$ en $A_1$ zijn de #keyterm("States"). Ze zijn alle punten dat de cilinder stabiel in kan zijn.

=== Ventielen in logische circuits

Alle soorten functies:
- AND:
- NOT:
- OR:

In de circuits ga je alle cilinders in het startpositie zetten.
Niet in de rustpositie zoals elektrische circuit.

#figure(
  image("assets/logic-circuit.png", width: 10cm),
  caption: [Voorbeeld Logic-circuit],
  label: <fig:logic-circuit>,
)

#examenbox("Op het examen dit circuit kunnen begrijpen")

== Cascade methode
Hoe gaan we ons circuit oplossen. We hebben een idee maar hoe gaan we dat in een logisch circuit omzetten?

De cascade methode is een methode om een complexe circuit te ontwerpen door het circuit te splitsen in eenvoudige delen.

_BV. ABC | CB A: A beweegt naar $A_1$ $=>$  B beweegt naar $B_1$ $=>$ C beweegt naar $C_1$._

Hierna zet je het circuit over naar de tweede groep

_ CB | A: C beweegt naar $C_0$ $=>$ B beweegt naar $B_0$ $=>$ A beweegt naar $A_0$._

Een daarna schaklet die terug naar circuit 1.

#figure(
  image("assets/cascade-methode.png", width: 12cm),
  caption: [cascade-methode],
  label: <fig:cascade-methode>,
)


== Pneumatische Labo

Je kunt circuits tekenen via PneuDraw #link("https://etools.smc.at/pneudraw/index.html?id=pd218b10a8-6398-48de-an23lqjhw1km0giemmtgz", "PneuDraw")

Zorg dat je dit gezien hebt voor je labo's hebt hier over.






