#import "../../school-template.typ": *

= Pneumatica <ch:intro-pneumatics>

== Wat is pneumatiek?

Pneumatiek is het gecontroleerd overbrengen van mechanische energie en beweging met samengeperste lucht (*perslucht*). Perslucht stuurt *cilinders en motoren* (actuatoren) aan. De richting, druk en snelheid van de luchtstromen worden geregeld met *pneumatische en elektro-pneumatische ventielen*, die op hun beurt aangestuurd worden door relaisschakelingen of PLC's.

Voordelen van pneumatiek in de industrie:
- *Hoge betrouwbaarheid en snelheid*: Eenvoudige mechanische opbouw met weinig onderdelen die kunnen falen.
- *Veiligheid*: Geen vonken of oververhittingsgevaar in explosiegevaarlijke (ATEX) of vochtige omgevingen.
- *Overbelastingsbeveiliging*: Een pneumatische cilinder kan tot stilstand geblokkeerd worden zonder motorschade.
- *Beschikbaarheid*: Lucht is overal aanwezig en kan na gebruik via dempers ontlucht worden naar de atmosfeer.


== Druk en vacuum

#concept(title: "Absolute en relatieve druk")[


  #wrap-figure(
    image("assets/absolutevsrelatievedruk.png", width: 7cm),
    caption: [Absolute druk telt vanaf het perfecte vacuüm, relatieve druk vanaf $1013$ mbar. Onder de streepjeslijn is de relatieve druk negatief: dat is vacuüm.],
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

Druk is niets anders dan moleculen die tegen een oppervlak botsen.
#figure(
  image("assets/magdeburg hemispheres.png", width: 5cm),
  caption: [De halve bollen van Maagdenburg: leeggepompt houdt de omgevingsdruk ze samen, en paardenspannen krijgen ze niet los.],
  label: <fig:magdeburg-hemispheres>,
)

Je ziet op de figuur dat er minder botsingen zijn aan de binnenkant dan aan de buitenkant. Waardoor het voelt dat er een kracht op het voorwerk zit.

In de industrie wordt er vaak een zuignap gebruikt om voorwerpen op te pakken.
Je zet de zuignap op het voorwerp en pompt de lucht eruit. Je vergroot dan terug het volume maar er komt geen lucht bij. Dus de druk daalt. Hierdoor wordt het voorwerp opgetild.


== Compressors en luchttoepassingen

#figure(
  image("assets/tools pneumatics.png", width: 5cm),
  caption: [Perslucht in de praktijk: een blaaspistool, een zuignap op een ejector en een slagmoersleutel.],
  label: <fig:tools-pneumatics>,
)

In de industrie wordt pneumatics veel gebruikt. Tandartsen, schroevendraaiers, spuitverf, etc.

=== Vacuum ejector <sec:vacuum-ejector>

#wrap-figure(
  image("assets/vacuum ejector.png", width: 8cm),
  caption: [De vacuümejector: perslucht versnelt door de vernauwing en zuigt via de zijpoort lucht aan (venturi-effect).],
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
    caption: [Een push-in koppeling: de slang klemt vast achter een ring en dicht af op een O-ring, zonder gereedschap.],
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

#wrap-figure(
  image("assets/pneumatische cilinder.png", width: 6.5cm),
  caption: [Doorsnede van een dubbelwerkende cilinder],
  label: <fig:pneumatische-cilinder>,
)[
  Een pneumatische cilinder zet persluchtenergie om in een lineaire mechanische kracht en verplaatsing:
  - *Bodemzijde (piston chamber)*: Toevoer van perslucht drukt het volledige zuigeroppervlak $A_1$ naar voren (uitschuiven, $+$-slag).
  - *Stangzijde (rod chamber)*: Toevoer van perslucht drukt tegen het ringoppervlak $A_2 = A_1 - A_"rod"$ (inschuiven, $-$-slag).
  - *Ontluchting*: De tegenoverliggende kamer moet tegelijkertijd drukloos kunnen ontluchten via het stuurventiel.
]

#wrap-figure(
  image("assets/pneumatische-cilinders-design.png", width: 7.5cm),
  caption: [Opbouw met regelbare eindposities en einddemping],
  label: <fig:pneumatische-cilinders-design>,
)[
  - *Slaglengte*: De afstand tussen de twee vaste mechanische eindposities (*full stroke*).
  - *Einddemping (cushioning)*: Pneumatische remming aan het einde van de slag om harde mechanische schokken en lawaai te dempen.
  - *Kracht vs. Snelheid*:
    - De *kracht* wordt bepaald door de effectieve druk: $F = p dot A$.
    - De *snelheid* wordt geregeld door smoring van de uitlaatlucht via een snelheidsregelventiel (FCV).
]

=== Soorten cilinders

De doorsnede in @fig:pneumatische-cilinder is een dubbelwerkende cilinder. Er bestaan twee basistypes:

- / Enkelwerkend (single-acting): één aansluiting. Perslucht stuurt uit, een ingebouwde veer trekt in. De veer neemt plaats in, dus de slag is beperkt, en bij drukverlies gaat de cilinder vanzelf naar zijn ruststand.
- / Dubbelwerkend (double-acting): twee aansluitingen. Beide slagen zijn pneumatisch aangedreven, dus ook de intrekkende slag levert kracht.

#wrap-figure(
  image("assets/guided-cilinders.png", width: 6cm),
  caption: [Geleide cilinder (Guided cylinder)],
  label: <fig:guided-cilinders>,
)[
  - *Geleide cilinder (Guided cylinder)*: Voorzien van externe geleidingsstangen om zijdelingse torsiekrachten en buigmomenten op te vangen.
]

#wrap-figure(
  image("assets/special-cilinders.png", width: 6cm),
  caption: [Speciale cilinders: dubbele stang en draaicilinder],
  label: <fig:special-cilinders>,
)[
  - *Doorlopende zuigerstang (Double rod)*: Heeft aan weerszijden een zuigerstang, waardoor het effectieve oppervlak en de kracht in beide richtingen exact gelijk zijn ($A_1 = A_2$).
  - *Draaicilinder (Rotary actuator)*: Zet lineaire zuigerverplaatsing om in een roterende asbeweging ($0"–"360 degree$).
]

#figure(
  image("assets/symbolen-cilinders.png", width: 12cm),
  caption: [ISO-standaardsymbolen voor pneumatische cilinders],
  label: <fig:symbolen-cilinders>,
)

== Cilinderkracht in statische toestand <sec:cilinderkracht>

#wrap-figure(
  image("assets/kracht-fullpressure.png", width: 6cm),
  caption: [Werkzame drukkrachten op een dubbelwerkende cilinder],
  label: <fig:kracht-fullpressure>,
)[
  Op de zuiger van een dubbelwerkende cilinder werken drie afzonderlijke drukkrachten:
  1. De bodemkracht: $F_1 = p_"1,rel" dot A_1$ met $A_1 = frac(pi D^2, 4)$
  2. De tegenkracht aan de stangzijde: $F_2 = p_"2,rel" dot A_2$ met $A_2 = frac(pi (D^2 - d^2), 4)$
  3. De kracht op de zuigerstang: $F_3 = p_"3,rel" dot A_"rod" = 0$ (omdat $p_"3,rel" = 0 "bar"$ in buitenlucht).
]

#examenbox[
  *Vuistregel:* Reken met *relatieve druk* ($p_"rel"$). Omdat de stang in open buitenlucht beweegt ($p_"atm"$), is $p_"3,rel" = 0 "bar"$ en valt $F_3 = 0 "N"$ direct weg!
]

De resulterende netto uitschuifkracht $F_"out"$ bedraagt:
$ F_"out" = F_1 - F_2 = p_"1,rel" dot frac(pi D^2, 4) - p_"2,rel" dot frac(pi (D^2 - d^2), 4) $

De resulterende netto inschuifkracht $F_"in"$ bedraagt:
$ F_"in" = F_2' - F_1' = p_"2,rel" dot frac(pi (D^2 - d^2), 4) - p_"1,rel" dot frac(pi D^2, 4) $

=== Rekenvoorbeeld: kracht bij volle druk

#oefening(
  title: "Kracht op full pressure",
)[Stel dat we de (statische) kracht berekenen tijdens een trage uitgaande slag voor een relatieve toevoerdruk van $6 "bar"$ en een tegendruk van bv. $1 "bar"$ relatief ($approx 2 "atm"$). Gegeven de diameters $D = 25 "mm"$ en $d = 8 "mm"$:

  $ F_1 = p_"1rel" dot A_1 = p_"1rel" dot (pi dot D^2)/4 = 6 dot 10^5 "Pa" dot (pi dot 0.025^2 "m"^2)/4 = 295 "N" $
  $
    F_2 = p_"2rel" dot A_2 = p_"2rel" dot (pi (D^2 - d^2))/4 = 1 dot 10^5 "Pa" dot (pi (0.025^2 - 0.008^2) "m"^2)/4 = 44 "N"
  $
  $ F_3 = 0 "N" $

  Aangezien deze zijde verbonden is met de atmosfeer ($0 "bar"$ relatief). De netto kracht bij de uitgaande slag is dus:
  $ F_"outward" = 295 "N" - 44 "N" = 251 "N" arrow.r $
]

We zouden de tegendruk (vent pressure) kunnen verlagen door een *quick release valve* te installeren, maar meestal is de hoge tegendruk een gevolg van de debietregeling (flow regulation).

Voor de kracht tijdens een trage *inwaartse slag* met dezelfde toevoer- en tegendrukwaarden bekomen we:
$ F_"inward" = 264 "N" - 49 "N" = 215 "N" arrow.l $

#examenbox[Tip voor het examen: gebruik relatieve druk, dan is $F_3 = 0$.]

#oefening(title: "Examenvraag: manometerdruk én absolute druk door elkaar")[
  Dit is de open vraag van 4 punten die elk jaar terugkomt. De val zit niet in de formule maar in de #belangrijk[eenheden]: de ene druk krijg je als manometerwaarde, de andere als absolute waarde.

  *Gegeven.* Binnendiameter $D = 12 "cm"$, stangdiameter $d = 2 "cm"$. Aan de compressorzijde leest een manometer $6 "bar"$. Aan de andere zijde meet je $2 "bar"$ #strong[absoluut].

  *Denkstap.* Een manometer toont altijd relatieve druk, dus $p_1 = 6 "bar"$ relatief. De $2 "bar"$ absoluut tel je terug naar de atmosfeer: $p_2 = 2 - 1 = 1 "bar"$ relatief. Reken alles verder in relatieve druk, want dan valt de kracht op de stang weg.

  *De oppervlakken.*
  $ A_1 = (pi D^2)/4 = (pi dot #"0,12"^2)/4 = #"1,131" dot 10^(-2) "m"^2 $
  $ A_2 = (pi (D^2 - d^2))/4 = (pi (#"0,12"^2 - #"0,02"^2))/4 = #"1,100" dot 10^(-2) "m"^2 $

  *Uitgaande slag.* De bodemzijde staat op $6 "bar"$, de stangzijde is de tegendruk van $1 "bar"$.
  $ F_"uit" = p_1 A_1 - p_2 A_2 = 6 dot 10^5 dot #"1,131" dot 10^(-2) - 1 dot 10^5 dot #"1,100" dot 10^(-2) $
  $ F_"uit" = 6786 - 1100 = 5686 "N" $

  *Ingaande slag.* Nu staat de stangzijde op $6 "bar"$ en is de bodemzijde de tegendruk.
  $ F_"in" = p_1 A_2 - p_2 A_1 = 6 dot 10^5 dot #"1,100" dot 10^(-2) - 1 dot 10^5 dot #"1,131" dot 10^(-2) $
  $ F_"in" = 6597 - 1131 = 5466 "N" $

  *Het verschil.* $5686 - 5466 = 220 "N"$. Dat verschil volgt ook rechtstreeks uit de stangdoorsnede:
  $ F_"uit" - F_"in" = (p_1 + p_2) dot A_"stang" = 7 dot 10^5 dot (pi dot #"0,02"^2)/4 = 220 "N" $

  De uitgaande slag is dus sterker, omdat de zuigerstang aan de intrekkende zijde oppervlak wegneemt.
]

== Lucht laten ontsnappen

+ / Uitlaatdemper: dempt de uitlaat van de cilinder. Minder geluid, maar ook een lager debiet $dot(V)$
+ / Milieufilter: filtert de lucht die uit de cilinder komt
  #figure(
    image("assets/Milileufilter.png", width: 3cm),
    caption: [Doorsnede van het omgevingsfilter op de uitlaat: de lucht loopt door het filterelement naar buiten en laat olie en vuil achter.],
    label: <fig:Milileufilter>,
  )
+ / Snelheidsregeling: regelt de snelheid van de cilinder


#wrap-figure(
  image("assets/snelheidsregeling.png", width: 3cm),
  caption: [Snelheidsregelventiel (FCV)],
  label: <fig:snelheidsregeling>,
)[
  We kunnen de snelheid van de cilinder regelen door de lucht te laten ontsnappen via een flow control valve.

  #examenbox("Examenvraag: Wat is een snelheidsregelventiel?")

  Een *Throttle valve* (smoorventiel) regelt de luchtstroom en werkt in beide richtingen. Vaak gebeurt dit via een conische naald die dieper in een opening (orifice) kan worden geschroefd.

  Een *Flow control valve* (FCV, One-way Throttle Valve, speed control valve) bestaat uit een combinatie van een smoorventiel en een terugslagklep (check valve) in parallel. Dit zorgt ervoor dat de flow slechts in *één richting gesmoord* wordt; in de andere richting stroomt de lucht vrij door via de terugslagklep.

  #belangrijk[Smoor op de uitlaat (*metered out*), niet op de inlaat.] De perslucht duwt de zuiger, en het gas aan de andere kant duwt terug. Smoor je dat terugduwende gas, dan heb je de snelheid in de hand.
]

#voorbeeld(title: "Speed control")[
  Stel: een cilinder tilt een last op met 6 bar, en daarna laat je die last weer zakken.

  Smoor je aan de *inlaatzijde*, dan duwt de last zelf de zuiger naar beneden en is er niets dat hem tegenhoudt: de last valt.

  Smoor je aan de *uitlaatzijde*, dan moet de lucht onder de zuiger traag naar buiten. Die lucht werkt als een kussen en de last zakt gecontroleerd.
]

#wrap-figure(
  image("assets/pompcircuit.png", width: 4.5cm),
  caption: [Meter-in geregeld pompcircuit],
  label: <fig:pompcircuit>,
)[
  *Metered in*: je regelt de lucht die *in* de cilinder stroomt. Dat is de verkeerde manier.

  Op @fig:pompcircuit zitten beide smoringen aan de toevoerkant. De zuiger krijgt zijn lucht dan met mondjesmaat, terwijl er aan de andere kant niets tegenhoudt. Het gevolg is een schokkende beweging: de zuiger blijft even staan, schiet dan door zodra er genoeg druk staat, en herhaalt dat.

  Monteer de snelheidsregeling zo dicht mogelijk bij de cilinder. Hoe langer de slang tussen ventiel en cilinder, hoe meer lucht er in die slang zit die je niet meer in de hand hebt. Je kan de regeling ook op het ventiel zetten: soms weegt bereikbaarheid voor het afstellen zwaarder dan die laatste slang.
]


*Het snelontluchtingsventiel* (quick exhaust valve) doet het omgekeerde van een smoring: het laat de cilinder zo #strong[snel] mogelijk leeglopen. Normaal moet de uitlaatlucht helemaal terug door de slang en het stuurventiel. Zet je een snelontluchter vlak aan de cilinderpoort, dan blaast die lucht meteen ter plaatse naar buiten, en dat scheelt een pak tijd bij een lange slang.

Je gebruikt hem vooral bij een #strong[enkelwerkende] cilinder, waar de veer de zuiger terugduwt en de uitstromende lucht dus alleen maar tegenwerkt.

#figure(
  image("assets/OIS_quick_exhaust.png", width: 6cm),
  caption: [Snelontluchtingsventiel: bij het vullen gaat de lucht van 1 naar 2, bij het ontluchten sluit het element de weg naar 1 af en gaat alles rechtstreeks naar buiten via 3.],
  label: <fig:quick-exhaust>,
)


== Schakelen met stuurventielen

Schakelen betekent in de pneumatiek dat je de richting van de luchtstroom omkeert, en zo de cilinder stuurt. Dat doe je met een *Directional Control Valve* (DCV), in het Nederlands een stuur- of wegventiel.

=== Ventielen (Valves)

Een ventiel is het component dat de doorgang van lucht controleert; het fungeert als een "deur" die lucht al dan niet doorlaat.

Een paar voorbeelden:
- Een *elektro-pneumatisch ventiel* is een elektrisch aangestuurde schakelaar voor pneumatische circuits.
- Een *elektro-hydraulisch ventiel* is een elektrisch aangestuurde schakelaar voor hydraulische circuits.

$arrow.r.double$ Een actuator zoals een pneumatische cilinder of hydraulische motor wordt verbonden met de uitgangspoorten (outlets) van het ventiel.

#theorie(title: "Eigenschappen van een ventiel")[
  - Een *supply poort* verbonden met de *hydraulische* of *pneumatische* (power) toevoer.
  - Een *exhaust poort* om druk af te laten naar de atmosfeer of terug naar de tank.
  - Kan *NO* (Normally Open) of *NC* (Normally Closed) zijn.
  - Een ventiel kan een *switch-over* hebben (overgang tussen de standen).
]


*Schakelen van perslucht*

Een controleventiel waarbij een (vaak analoog) signaal de debietstroom $[dot(Q)]$ bepaalt. We gebruiken hiervoor de term *Direction control valve* (DCV).

=== Directional Control Valve (DCV)

#examenbox("Op het examen krijg je deze symbolen gegeven. Je moet wel weten wat ze allemaal betekenen")

#figure(
  image("assets/Symbolen van een DCV.png", width: 5cm),
  caption: [Het aflezen van een stuurventielsymbool: elk hokje is één stand van dezelfde schuif, en het hokje dat vóór de aansluitingen ligt, geldt.],
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

== Mono- en bistabiele ventielen

- De klepspoel(en) zijn apparaten met een laag vermogen (bijv. 2 Watt), aangestuurd door een elektrisch regelcircuit, bijv. een relaiscircuit of een PLC. De nominale spanning van de spoel(en) kan bijv. 24 VDC of 230 VAC zijn.
- Een ventiel kan standschakelaars hebben: N.O. of N.C. hulpcontacten die de ventielstand detecteren. Meestal heeft het er geen.

=== Monostabiel tegenover bistabiel

#wrap-figure(
  image("assets/bistabiel.png", width: 7.5cm),
  caption: [Bistabiel ventiel met dubbele spoelbediening],
  label: <fig:bistabiel>,
)[
  - *Monostabiel x/2 ventiel*: Heeft één spoel en een mechanische/pneumatische terugstelveer. Zodra de stuurspanning wegvalt, keert het ventiel direct terug naar zijn ruststand (veilige fail-safe toestand).
  - *Bistabiel x/2 ventiel*: Heeft twee afzonderlijke spoelen (`14` en `12`) en geen terugstelveer. Het fungeert als een *geheugenelement* (vergelijkbaar met een RS-flipflop). Een korte puls op spoel `14` activeert de stand, waarna de spool blijft staan totdat spoel `12` bekrachtigd wordt.
  
  ➢ *Let op:* Wanneer je een machine met bistabiele ventielen opstart, kan het ventiel zich in een willekeurige toestand bevinden!
]

=== 5/3 ventielen en de drie middenposities

#wrap-figure(
  image("assets/diagram bistabiel.png", width: 5cm),
  caption: [Standen en overgangen van een 3-standen ventiel.],
  label: <fig:diagram-bistabiel>,
)[
  Een 5/3 ventiel is een *dubbel monostabiel ventiel* met 2 spoelen en een middenpositie (center position) waarnaar het door twee veren terugkeert wanneer géén van beide spoelen bekrachtigd is.

  *Wanneer gebruik je een 5/3 ventiel?*
  - / Tussenliggende positionering: Om de zuiger op een willekeurig punt van de slag te stoppen.
  - / "Inching" of kruipen: Om een cilinder stapsgewijs te positioneren.
  - / Veiligheid / Noodstop: Om cilinderkamers direct drukloos te maken.

  *De Drie Belangrijkste Middenposities:*
  - / Gesloten middenstand (closed center): Alle poorten zijn geblokkeerd. Wordt gebruikt om een cilinder op een tussenpositie te stoppen. Let op: door de samendrukbaarheid van lucht is dit *geen stijve vergrendeling*.
  - / Ontluchte middenstand (exhaust center): Beide cilinderkamers worden verbonden met de uitlaat (3 en 5). De cilinder is dan *krachteloos* en kan manueel bewogen worden.
  - / Druk middenstand (pressure center): Er staat gelijke werkdruk op beide kamers.
]

== RDS voor pneumatische componenten

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

== Gepiloteerde ventielen

#wrap-figure(
  image("assets/internal-pilot-bolletje.png", width: 7cm),
  caption: [Intern gepiloteerd ventiel. Het *bolletje* op de toevoerlijn (omcirkeld) zegt dat de stuurlucht intern wordt afgetakt van poort $1$],
  label: <fig:internal-pilot>,
  width: 7cm,
)[
  Een groot ventiel rechtstreeks met een spoel schakelen kost te veel kracht: die spoel zou log, duur en stroomvretend worden. Daarom zit er in zo'n ventiel een tweede, piepklein ventiel: de *pilot valve*.

  De spoel schakelt enkel dat kleine ventiel. Dat laat een beetje perslucht door, en _die lucht_ duwt de grote schuif om. Van buiten zie je gewoon één ventiel, maar intern doet een klein signaal het zware werk. Je hebt dus een pneumatische krachtversterking: klein elektrisch signaal $arrow$ kleine luchtstroom $arrow$ grote schuifkracht.

  Dat principe gebruik je vooral waar de druk hoog is of het debiet groot: zware pneumatiek en hydraulica.
]

Voordelen (vooral voor monostabiele ventielen):
- *Lager energieverbruik* (efficiënter) bij het aanhouden van de geactiveerde stand vergeleken met directe spoel-bediening.
- *Weinig elektriciteitsgebruik*: De stroom naar de spoel is vaak laag genoeg om direct op een digitale uitgang (transistor) van het besturingssysteem aan te sluiten. Dit bespaart kosten doordat een extra interfacerelais of snubbercircuit overbodig is.

Waar die stuurlucht _vandaan_ komt, is het hele verschil tussen de twee soorten:

#concept(title: "Internal pilot vs external pilot")[
  *Internal pilot* (ook *bleed piloted* genoemd) takt de stuurlucht intern af van de hoofdtoevoer (poort $1$) van het ventiel zelf. Geen extra slang nodig, dus goedkoop en simpel.
  _Nadeel_: als de persluchtdruk te laag is, bij een "soft start", of als de hoofdlucht uitgeschakeld is, kan dit ventiel niet schakelen.

  *External pilot*: de stuurlucht komt via een aparte poort binnen, gevoed door een onafhankelijk circuit. Kost een extra slang, maar de stuurkring staat altijd op volle druk.
]

#wrap-figure(
  image("assets/external-pilot-X.png", width: 5.5cm),
  caption: [Hetzelfde ventiel, nu extern gepiloteerd: de `X` links aan de gestippelde lijn. Geen bolletje op de toevoer, dus geen interne aftakking],
  label: <fig:external-pilot>,
  width: 5.5cm,
)[
  *Hoe je het uit het symbool leest.* Je hoeft het datablad niet te openen, het staat in de tekening:

  / Bolletje op de toevoerlijn: internal pilot. De stippellijn vertrekt vanuit de hoofdtoevoer zelf.
  / `X` aan de gestippelde lijn: external pilot. De `X` markeert de aparte poort waar de stuurlucht binnenkomt.
]

#examenbox[Hier valt de klassieke vraag. Zet je een *soft-startventiel* vóór een _intern_ gepiloteerd ventiel, dan bouwt de druk traag op, en dus ook de pilotdruk. De ventielen schakelen dan op onvoorspelbare momenten (afhankelijk van wrijving en smering) of blijven half hangen. Bij soft start moet je dus *external pilot* gebruiken, met de pilotleiding afgetakt _vóór_ het soft-startventiel: de stuurkring staat meteen op volle netdruk terwijl de vermogenskring rustig opbouwt.]

#wrap-figure(
  image("assets/symbolen pneumatische valves.png", width: 4cm),
  caption: [Bedieningen op een 3/2-ventiel],
  label: <fig:symbolen-pneumatische-valves>,
)[
  Naast elk ventielsymbool staat getekend #strong[hoe] je het bedient. Van boven naar beneden op @fig:symbolen-pneumatische-valves: een drukknop, een rol, een pedaal en een pneumatische pilot.

  Aan de andere kant staat telkens de veerretour. Die twee samen maken het ventiel #strong[monostabiel]: laat je de bediening los, dan duwt de veer de schuif terug.

  De bediening zegt niets over het aantal poorten of standen. Dat lees je uit het aantal hokjes en aansluitingen, los van wat er links en rechts tegenaan staat.

  #examenbox[Zorg dat je alle symbolen goed kent, dat zijn gratis punten op het examen.]
]

== Logische schakelingen met ventielen

We gaan onze logic circuit baseren op:
+ Safety
+ Energy efficiency

Voor eenvoudige circuits gebruiken we *pneumatische sturing*. Complexere systemen doen we met *elektro-pneumatische sturing*, dus met een PLC- of relaiscircuit.

We sturen de druk via logische circuits, en zo sturen we de cilinders.

A+ brengt ons van $A_0$ naar $A_1$\
A- brengt ons van $A_1$ naar $A_0$

$A_0$ en $A_1$ zijn de *toestanden*: alle standen waarin de cilinder stabiel kan blijven staan.

=== Ventielen in logische circuits <sec:pneum-logica>

Je kan alle logische functies met ventielen bouwen: AND, OR en NOT.

#belangrijk[Vergeet niet dat een logisch circuit ook drukvoeding én ontluchting nodig heeft.] Zonder ontluchting werkt de persluchtleiding als een drukvat: de functie schakelt niet meer uit, of pas nadat er genoeg lucht weggelekt is, intern zowel als extern.

De drie functies bouw je zo:

- *AND-functie.* Een #strong[serieschakeling] van twee ventielen volstaat: de lucht moet door beide. Er bestaan ook specifieke AND-componenten, maar die kosten extra.
- *NOT-functie.* Gebruik of bestel het ventiel in zijn #strong[normaal gesloten] uitvoering. De inverse zit dan al in het component zelf.
- *OR-functie.* #belangrijk[Een T-stuk gebruiken is fout.] Zie hieronder.

#belangrijk[Waarom een T-stuk geen OR is.] Het probleem zit niet in het inschakelen, maar in het #strong[uitschakelen]:

- de lucht die door het ene ventiel binnenkomt, ontsnapt langs het andere, niet-bediende ventiel;
- en laat je beide ventielen los, dan blijft de druk in de leiding gewoon staan, want er is geen weg naar buiten.

De leiding gedraagt zich dan als een klein drukvat: de functie schakelt niet uit, of pas nadat er genoeg lucht weggelekt is. Je circuit reset dus niet, en een tweede cyclus verloopt anders dan de eerste.

#wrap-figure(
  image("assets/OIS_pneum_logica_and_or_not_clean.png", width: 7.5cm),
  caption: [Ventielen in logische circuits: AND als serieschakeling, NOT als normaal gesloten ventiel, en OR met een wisselventiel in plaats van een T-stuk.],
  label: <fig:pneum-logica>,
)[
  Je hebt daarom twee dingen nodig: een #keyterm[wisselventiel] (shuttle valve) dat de niet-bediende ingang mechanisch afsluit, #strong[en] 3/2-ventielen in plaats van 2/2-ventielen, want een 3/2 heeft een derde poort om te ontluchten.

  Op de figuur staan de drie combinaties naast elkaar:
  - serieschakeling voor de EN-functie;
  - wisselventiel voor de OF-functie;
  - normaal gesloten 3/2-ventiel voor de NIET-functie.

  Het wisselventiel heeft twee ingangen en één uitgang. De hoogste druk duwt het binnenste element naar de andere kant, en sluit daarmee de niet-bediende ingang af. Zo kan de lucht niet meer via het uitlaatpoortje van het andere ventiel weglekken.
]

=== Componenten in een pneumatisch schema <sec:pneum-componentcodes>

In het voorbeeldschema van de slides herken je de codeletters volgens EN 81346:

#table(
  columns: (auto, 1fr),
  align: (left, left),
  stroke: none,
  inset: 5pt,
  table.hline(stroke: 1pt),
  table.header([*Code*], [*Component*]),
  table.hline(stroke: 0.5pt),
  [`-M1`], [actuator: dubbelwerkende cilinder],
  [`-Q1`], [5/2-ventiel],
  [`-K1`], [wisselventiel, dus de OR-functie],
  [`-S1`], [schakelaars],
  [`-B1`], [detecties],
  [`-S0`], [hoofdventiel],
  [`-R0`], [FRL-unit (Filter, Regulator, Lubricator), vaak ook `-A` genoemd],
  table.hline(stroke: 1pt),
)

#examenbox[
  In een pneumatisch schema teken je #belangrijk[alle componenten in hun werkelijke toestand], in een circuit dat klaar staat om te starten. In het voorbeeld zijn $a_0$ en $b_0$ bediend, en `K1` en `A+` ook, terwijl cilinder A nog niet bewogen heeft.

  Op het examen staan de grijze kaders die de bediende toestand aanduiden er #strong[misschien niet] bij. Je moet de toestand van een ventiel dus kunnen herkennen aan het symbool alleen.
]

In de circuits teken je alle cilinders in hun *startpositie*, niet in de rustpositie zoals bij een elektrisch schema.

#figure(
  image("assets/logic-circuit.png", width: 10cm),
  caption: [Volledig pneumatisch logisch circuit. Alle componenten staan getekend in hun *startpositie*, niet in rust.],
  label: <fig:logic-circuit>,
)

#examenbox[Op het examen moet je dit circuit kunnen lezen.]

== De Cascademethode <sec:cascade-pneumatisch>

Bij een langere sequentie krijgt een stuurventiel op een bepaald moment tegelijk het commando om te schakelen én om te resetten, en dan blokkeert het. Dat heet *signaaloverlapping*, en het is hetzelfde probleem als in @ch:3d-methode: dezelfde sensorstand hoort bij twee verschillende acties.

De *cascademethode* splitst de sequentie daarom in groepen, met als regel dat dezelfde cilinderletter binnen één groep nooit twee keer mag voorkomen. Het opsplitsen zelf staat uitgewerkt bij @sec:groepen.

Wat hier #strong[pneumatisch] is: elke groep krijgt een eigen persluchtleiding, de *cascadeleiding*, gevoed via een bistabiel omkeerventiel (het groepenventiel). Alleen de actieve groep krijgt lucht, dus de signalen van de inactieve groep zijn fysiek dood. In de elektrische versie doet het geheugen $K_1$ precies hetzelfde werk.

#figure(
  image("assets/cascade-methode.png", width: 12cm),
  caption: [Cascademethode: groepsomschakeling via cascadeleidingen ter voorkoming van signaaloverlapping],
  label: <fig:cascade-methode>,
)

== Schema's tekenen in het labo

- Leidingen die in rust onder druk staan, teken je vet of gemarkeerd.
- Voor het digitaal tekenen en simuleren gebruik je SMC PneuDraw of Festo FluidSIM.






