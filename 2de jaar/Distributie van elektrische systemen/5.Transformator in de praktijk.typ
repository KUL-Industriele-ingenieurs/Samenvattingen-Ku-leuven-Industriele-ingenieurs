#import "../../school-template.typ": *


= Transformator in de praktijk <ch:transformator-praktijk>

In het vorige hoofdstuk hebben we het model van de reële transformator opgebouwd met al zijn verliezen. Nu gaan we dat model vereenvoudigen zodat we er makkelijk mee kunnen rekenen, en bekijken we hoe een transformator zich gedraagt in typische praktijksituaties: onder belasting, bij kortsluiting, en bij het aanzetten.

== Vereenvoudigde vervangingsschema's

We starten terug bij het equivalent schema van transformatoren (zie #ref(<ch:reële-transformatoren>)) waarbij we alle verliezen naar de #keyterm[Primaire kant] verplaatsen.

Herinner je nog dat we de verliezen kunnen overbrengen afhankelijk van de hoeveelheid windingen $N_1$ en $N_2$ en de verhouding tussen deze twee.

#figure(
  image("assets/Equivalent T-schema.png", width: 8cm),
  caption: [Equivalent T-schema],
  label: <fig:Equivalent-T-schema>,
)

Het doel is om het circuit stap voor stap te vereenvoudigen zodat we makkelijker $V_1$ en $I_1$ kunnen berekenen. We starten met een phasordiagram. We weten dat de stroom door de spoel $I_2'$ is en de stroom #keyterm[De excitatie stroom] door de parallelle weerstand $I_0$ is. Dus $I_1 = I_2' + I_0$. Als we $I_1$ hebben kunnen we $V_1$ berekenen met de wet van Ohm.

#figure(
  image("assets/Phasor equivalent schema.png", width: 6cm),
  caption: [Phasor equivalent schema],
  label: <fig:Phasor-equivalent-schema>,
)

Nu kunnen we het circuit verder vereenvoudigen. In het #keyterm[Cantilever model] verplaatsen we de parallelle tak ($R_(F e)$ en $X_m$) naar de ingang en vatten we de serieweerstanden samen:

#figure(
  image("assets/Approximatie Circuit cantilever Circuit.png", width: 8cm),
  caption: [Approximatie Circuit cantilever Circuit],
  label: <fig:Approximatie-Circuit-cantilever-Circuit>,
)

Dit is een benadering van het vorig equivalent schema waarbij we de weerstanden in #keyterm[Serie] samenvoegen

$ R_"eq" = R_1 + R_2' $
$ X_"eq" = X_1 + X_2' $

Dit is een approximatie want normaal mag je deze niet combineren omdat er een parallelle weerstand tussen zit. In de praktijk is $I_0$ maar een paar procent van $I_1$, dus de fout is klein.

We maken nu terug opnieuw een phasordiagram met deze benadering.

#figure(
  image("assets/Cantilever phasor.png", width: 6cm),
  caption: [Cantilever phasor],
  label: <fig:Cantilever-phasor>,
)

We kunnen nog een stap verder gaan: de parallelle tak ($R_(F e)$ en $X_m$) helemaal weglaten. We verliezen dan alle info over de kernverliezen, maar houden een simpel seriecircuit over dat heel handig is voor snelle berekeningen.

#figure(
  image("assets/Equivalent Serie Circuit.png", width: 6cm),
  caption: [Equivalent Serie Circuit],
  label: <fig:Equivalent-Serie-Circuit>,
)

Herhaling:
$ X_"eq" = X_1 + X_2' $
$ R_"eq" = R_1 + R_2' $

met:

$ X_2' = X_2 dot (N_1 / N_2)^2 $
$ R_2' = R_2 dot (N_1 / N_2)^2 $


Zonder de parallelle tak is er geen aftakking meer voor $I_0$, dus $I_2'$ is nu gelijk aan $I_1$ (stroom in = stroom out).

#figure(
  image("assets/Equivalent series circuit phasors.png", width: 6cm),
  caption: [Equivalent series circuit phasors],
  label: <fig:Equivalent-series-circuit-phasors>,
)

Dit is dan een overview van de verschillende equivalent schema's.

#figure(
  image("assets/Equivalent schema's overview.png", width: 8cm),
  caption: [Equivalent schema's overview],
  label: <fig:Equivalent-schemas-overview>,
)

Afhankelijk van welk circuit je neemt krijg je meer of minder info over je verliezen (zie #ref(<ch:reële-transformatoren>)). Het volledige T-schema bevat alles, het cantilever model is een goeie balans, en het seriecircuit is het simpelst maar je mist de kernverliezen.

== Bedrijfsmodi <sec:operatie-modussen>

Nu we ons vereenvoudigd model hebben, willen we de parameters ($R_("eq"), X_("eq"), R_(F e), X_m$) ook effectief kunnen bepalen. Dat doen we via gestandaardiseerde testen. Er zijn drie operatie modussen die elk andere informatie opleveren:

- / No-load: Geen load op het andere uiteinde van de transformator (open circuit). Hiermee bepalen we de *kernverliezen*.
- / Short circuit: Een kortsluiting op het andere uiteinde van de transformator. Hiermee bepalen we de *wikkelingsverliezen*.
- / Full-load: Een load op het andere uiteinde van de transformator. Dit is de normale werking.

#figure(
  image("assets/Operatie modussen.png", width: 10cm),
  caption: [Operatie modussen],
  label: <fig:Operatie-modussen>,
)

=== Nullast <sec:no-load>

#figure(
  image("assets/No-Load-test.png", width: 10cm),
  caption: [No-Load-test],
  label: <fig:No-Load-test>,
)

Bij de no-load test staat de secundaire kant open. Omdat er geen stroom langs de secundaire kan vloeien, is de enige stroom de excitatie stroom $I_0$ door de parallelle tak.

Dit betekent dat alle gemeten verliezen ($P_0$) in deze test de *kernverliezen* ($P_(F e)$) zijn. We kunnen hiermee $R_(F e)$ en $X_m$ bepalen.


=== Kortsluiting <sec:short-circuit>

#figure(
  image("assets/Kortsluitingstest.png", width: 10cm),
  caption: [Kortsluitingstest],
  label: <fig:Kortsluitingstest>,
)

Bij de kortsluitingstest sluiten we de secundaire kant kort en voeden we de primaire kant met een *lage spanning* totdat de nominale stroom $I_(n o m)$ vloeit. Die spanning die we daarvoor nodig hebben noemen we de #keyterm[Kortsluitingsspanning] $V_(s c)$.

De verhouding van die spanning tot de nominale spanning noemen we $u_(s c)$ (uitgedrukt als percentage):

$ u_(s c) = frac(V_(s c), V_(n o m)) dot 100 \% $

Bij een echte kortsluiting (met volle spanning) wordt de kortsluitingsstroom dan:

$ I_(s c) = I_(n o m) / u_(s c) $

Bijvoorbeeld: als $u_(s c) = 5\%$, dan is de kortsluitingsstroom $20 times I_(n o m)$. Daarom is het belangrijk om $u_(s c)$ te kennen — relays en zekeringen moeten gedimensioneerd zijn om deze stroom te kunnen onderbreken.

Omdat de spanning bij deze test zo laag is, zijn de kernverliezen verwaarloosbaar. Alle gemeten verliezen zijn dus *koperverliezen* ($P_(c u)$), waarmee we $R_("eq")$ en $X_("eq")$ kunnen bepalen.

=== Vollast <sec:full-load>

Na het bepalen van de parameters via de no-load en short circuit test kunnen we de transformator onder normale belasting analyseren. De #keyterm[Full-load] bepaalt de maximale stroom en voltage die op de transformator mag komen voor normale operaties.

De $V_(n o m)$ is de nominale voltage en de $I_(n o m)$ is de nominale stroom. Dit zijn de maximale waarden die op de transformator mogen komen. Deze vind je altijd terug op de #keyterm[Datasheet] van de transformator.

#figure(
  image("assets/Full Load.png", width: 10cm),
  caption: [Full Load],
  label: <fig:Full-Load>,
)

De #keyterm[Rating] van een transformator wordt bepaald door de vollast van de transformator:

$ S_(n o m) = V_(n o m) dot I_(n o m) $

Dit is voor een ideale transformator maar in de realiteit gaan de stromen en voltages aan de secundaire kant iets lager en verschoven zijn door de spoel- en weerstandsverliezen in de transformator. Zie #ref(<ch:reële-transformatoren>).

Meestal moet je hier niet teveel rekening mee houden omdat de maker van de transformator rekening houdt met de verliezen.

In oefeningen gaat er altijd vermeld worden als je verliezen in rekening moet houden.

== Spanningsval <sec:voltage-drop>

Een transformator is geen perfecte spanningsbron: door de interne weerstand en reactantie gaat er spanning verloren. Hoe meer stroom de belasting trekt, hoe groter die spanningsval. We gaan nu berekenen hoeveel spanning we verliezen over ons vereenvoudigd model.

#grid(
  columns: (1fr, auto),
  gutter: 2em,
  align: horizon,
  [
    Onze nominale voltage $u_1 = V_1$, nominale stroom $i$ en de phase hoek $phi$ $=>$ we gaan deze in het equivalent schema steken en kijken wat de voltage drop is $u_2 = V_2$ en een phasordiagram tekenen.
  ],
  grid(
    columns: 3,
    align: horizon,
    gutter: 0.5em,
    stack(
      spacing: 0.8em,
      [• nominal #text(fill: rgb("#4CAF50"))[$u_1$]],
      [• nominal #text(fill: rgb("#F44336"))[$i$]],
      [• Phase angle $phi$],
    ),
    $\}$,
    $=> #text(fill: rgb("#2196F3"))[$u_2$]$,
  ),
)

#figure(
  image("assets/Voltage-Drop.png", width: 8cm),
  caption: [Voltage-Drop],
  label: <fig:Voltage-Drop>,
)



Onze totale voltage drop $Delta V$ wordt bepaald door $r dot I$ in fase met $I$ want het is een weerstand [$Omega$] en $x dot I$ 90° met $I$ want het is een spoel [$H$].

_Dit hebben we al veel hiervoor gezien: de impedantie heeft een reëel deel (weerstand, in fase met de stroom) en een imaginair deel (reactantie, 90° op de stroom)._

#figure(
  image("assets/Soorten voltage drops.png", width: 10cm),
  caption: [Soorten voltage drops],
  label: <fig:Soorten-voltage-drops>,
)

=== Spanningsregeling

De voltage drop is niet altijd even groot — het hangt af van hoeveel stroom er vloeit en wat voor type belasting er op staat. Om dit te kwantificeren gebruiken we de spanningsregeling.

#wrap-figure(
  image("assets/Spanningsregelaar.png", width: 8cm),
  caption: [Spanningsregelaar],
  label: <fig:Spanningsregelaar>,
)[

  De #keyterm[Spanningsregeling] ($V R$) is een maatstaf voor de stabiliteit van de secundaire spanning bij wisselende belasting. Het geeft aan hoeveel procent van de spanning "verloren" gaat in de transformator zelf.

  $ V R = frac(V_2.0 - V_2, V_2) dot 100 \% $

  met:
  - $V_2.0$: secundaire spanning bij *No-load* (onbelast).
  - $V_2$: secundaire spanning bij *Full-load* (belast).

  Hoe lager de $V R$, hoe beter de spanningsbron. De spanningsval wordt sterk beïnvloed door het type belasting (#keyterm[Arbeidsfactor PF]):

  - *Lagging PF (Inductief - bijv. motoren)*: De spanning daalt aanzienlijk. Dit is de "worst-case" en meest voorkomende situatie. Meestal wordt een $V R$ opgegeven voor een $P F = 0.8$ inductief.
  - *Unity PF (Resistief - bijv. verwarming)*: Er is een matige spanningsval door de interne weerstand.
  - *Leading PF (Capacitief - bijv. condensatoren)*: De spanning kan juist *stijgen* ($V_2 > V_2.0$), wat resulteert in een negatieve $V R$.
]

== Efficiëntie

Naast de spanningsval willen we weten hoeveel vermogen er in de transformator verloren gaat. De verliezen zelf staan in #ref(<ch:reële-transformatoren>); hier vatten we ze samen in één getal.

#wrap-figure(
  image("assets/Efficienty.png", width: 8cm),
  caption: [Efficiëntie],
  label: <fig:Efficienty>,
)[

  #frm[Efficiency][ $eta = frac(P_2, P_1) = frac(P_2, P_2 + P_C u + P_(F e))$][
    met: $P_1$: primaire vermogen, $P_2$: secundaire vermogen, $eta$: efficiency, $P_(F e)$: ijzer verliezen, $P_(c u)$: koper verliezen
  ]

  De serie-componenten $R_1, X_1, R_2, X_2$ vertegenwoordigen onze wikkelingsverliezen en lekflux. De parallelle tak ($X_m, R_(F e)$) vertegenwoordigt onze kernverliezen.

  $ P_(c u) = I^2_1 R_1 + I^2_2´ R_2´ $

  $ P_(F e) = P_C = P_0 = frac(E_1^2, R_(F e)) $
  met $E_1$ de spanning over de parallel weerstand.

]

== Inschakelen <sec:start-up>

Tot nu toe hebben we gekeken naar de transformator in #keyterm[Steady state]: alles draait al en de stromen en spanningen zijn stabiele sinusgolven. Maar wat gebeurt er op het moment dat we de transformator *aanzetten*? Daarvoor moeten we even terug naar het tijdsdomein (in plaats van phasors).

=== Herhaling: relaties in het tijdsdomein

#wrap-figure(
  image("assets/Transformator-startup.png", width: 6.5cm),
  caption: [Transformator-startup],
  label: <fig:Transformator-startup>,
)[

  $ v_1 = V_1 sin(omega t + theta_0) = N_1 (d phi) / (d t) $

  Herhaling: We weten dat de flux door onze core gelijk is aan:

  $ phi = 1/N_1 integral(v_1 d t) $

  _Integraal dus 90° verschuiving tegenover de spanning_

  Met deze extra relaties

  $ lambda_1 = N_1 phi $

  $ phi = hat(v_1)/(omega N_1) sin(omega t - pi/2) + phi_(D C) $

  Nu tijdens #keyterm[Startup] en dus niet in #keyterm[Steady state] is er een DC component in de flux. Dit zorgt voor een *extra stroom* die door de transformator gaat. Dit is de zogenaamde #keyterm[Inschakelstroom].

  Dus het moment dat we onze transformator aan zetten gaat dit een impact hebben.
]

=== Aanzetten van de transformator $omega t = 0$

Het moment waarop we de schakelaar dichtklappen bepaalt hoeveel DC-component er in de flux zit. Er zijn twee extreme gevallen:

#figure(
  image("assets/Aanzetten omega t = 0.png", width: 13cm),
  caption: [Inschakelen bij $omega t = 0$: de flux valt meteen in zijn normale sinusvorm.],
  label: <fig:Aanzetten-omega-t-0>,
)

*Best case ($phi_(D C) = 0$):* schakel je in op het juiste moment, dan valt de flux meteen in zijn normale sinusvorm. Er is geen DC-component en dus geen inschakelpiek.


=== Aanzetten van de transformator $omega t = pi/2$

*Worst case ($phi_(D C) = hat(phi)$):* Als we op het verkeerde moment aanzetten, moet de flux vanuit nul starten terwijl hij eigenlijk ergens anders zou moeten zijn. Dat verschil wordt opgevangen door een DC-component.

#wrap-figure(
  image("assets/Aanzetten omega t = phi.2.png", width: 11cm),
  caption: [Aanzetten omega t = phi.2],
  label: <fig:Aanzetten-omega-t-phi-2>,
)[
  We starten met de initiële conditie dat de flux nul is op het inschakelmoment:

  $ phi(w t) = 0 $

  We vullen de initiële condities in:

  $ phi(-pi/2) = 0 $

  En we vullen dit in in onze formule:

  $ phi = hat(phi) sin(omega t - pi/2) + phi_(D C) $
  $ phi = hat(V_1)/(omega N_1) sin(omega t) - hat(V_1)/(omega N_1) $

  Door de $phi_(D C)$ verschuift de volledige fluxgrafiek omhoog, waardoor de maximale flux bijna *verdubbelt* ($2 hat(phi)$).
]

=== De fysica achter de inschakelstroom <sec:inschakelstroom>

#wrap-figure(
  image("assets/Fenomeen inschakelstroom.png", width: 5.5cm),
  caption: [Verzadiging bij het inschakelen],
  label: <fig:Fenomeen-inschakelstroom>,
)[
  De transformator-kern is ontworpen om net onder het verzadigingspunt te werken. Een flux van $2 hat(phi)$ jaagt de kern diep in #keyterm[Kernverzadiging] (Saturation).

  1. *Verzadiging:* De magnetische weerstand stijgt enorm.
  2. *Inductiedaling:* De inductiviteit $L$ van de spoel keldert (de kern kan geen extra flux meer opnemen).
  3. *Stroompiek:* Omdat de tegenwerkende kracht van de inductie wegvalt, ontstaat er een gigantisch grote #keyterm[Inschakelstroom] (tot 10x de nominale stroom) om de flux te handhaven.

  Deze stroom vervalt langzaam (over ongeveer 100 cycli) naarmate de verliezen in de wikkelingen de DC-component wegwerken.
]

#figure(
  image("assets/Inschakelstroom.png", width: 12cm),
  caption: [De inschakelstroom in de tijd: een scherpe piek bij het inschakelen, die over ongeveer honderd perioden uitdempt.],
  label: <fig:Inschakelstroom>,
)

== Transformatoren parallel schakelen <sec:parallel-connecties>

In de praktijk heb je niet altijd genoeg aan één transformator. Soms wil je meer vermogen, of wil je een backup voor als er eentje uitvalt. Dan schakelen we transformatoren in parallel.

#wrap-figure(
  image("assets/Parallel geschakelde transformatoren.png", width: 8cm),
  caption: [Parallel geschakelde transformatoren],
  label: <fig:Parallel-geschakelde-transformatoren>,
)[

  Waarom zou je dit doen in plaats van gewoon een grotere transformator te nemen?

  - / Upgraden van een bestaande installatie: een kleinere transformator kan bijgeplaatst worden om het totale vermogen te verhogen. Dit is makkelijker dan een nieuwe transformator te installeren.
  - / Redundantie en backup: valt er één uit, dan neemt de andere de belasting over. Daarom vind je dit bij installaties die niet mogen stilvallen.
  - / Flexibiliteit: Bij grote veranderingen van load moet je niet altijd je grote transformator gebruiken en kan je makkelijk switchen tussen de transformatoren.
]

Let op: bij een kortsluiting levert *elke* parallelle transformator zijn eigen kortsluitingsstroom. Die stromen tellen op, dus de totale $I_(s c)$ door de kortgesloten draad is veel groter dan bij één transformator. De circuit breaker (CBP) moet gedimensioneerd zijn om deze totale stroom te kunnen onderbreken.

=== Voorwaarden voor parallelschakeling <sec:condities-parallel-connecties>

Je kunt niet zomaar twee willekeurige transformatoren in parallel zetten. Er zijn een aantal condities waar je rekening mee moet houden:

- / Matching transformatie verhoudingen: $n_1 = n_2$. Als de transformatieverhoudingen verschillen, ontstaat er een circulerende stroom tussen de transformatoren — zelfs zonder belasting.
- / Matching $u_(s c)$: De kortsluitingsspanning (zie #ref(<sec:short-circuit>)) moet ongeveer gelijk zijn. Als $u_(s c)$ verschilt, neemt de transformator met de kleinste $u_(s c)$ het meeste stroom op, terwijl de andere onderbelast is. Dit zorgt voor een ongelijke verdeling van de load.

We willen dat als we meerdere transformatoren in parallel hebben, de load over de transformatoren verdeeld wordt.

#figure(
  image("assets/Parallel transformers.png", width: 12cm),
  caption: [Parallel transformers met load M],
  label: <fig:Parallel-transformers>,
)

- / Matching kloknummer: de faseverschuiving tussen primaire en secundaire moet in alle eenheden dezelfde zijn. Bij driefasige transformatoren is dit de eerste voorwaarde; staan de secundaire spanningen niet in fase, dan staat er permanent een spanningsverschil over de parallelverbinding.
- / Ongeveer gelijke kVA-waarde: bij gelijke $u_(s c)$ verdeelt de belasting zich vanzelf evenredig met het nominale vermogen. #belangrijk[Bij een verhouding van de kVA-waarden groter dan 2 wordt parallelbedrijf afgeraden.]

#examenbox[
  Als meerkeuzevraag komt dit terug als "welke vier voorwaarden?". Het antwoord: kloknummer, wikkelingsverhouding, nominale spanning en kortsluitspanning.
]

== Oefeningen transformatoren uit de les in de praktijk

De drie oefeningen die de slides bij dit hoofdstuk stellen. De examenoefening op de kenplaat staat apart in @ch:oefeningen.

#oefening(title: "Verkeerde aftakking: kringstroom")[
  *Gegeven.* Twee identieke transformatoren A en B staan parallel, maar op een verschillende aftakking gezet: A geeft $10 "kV"\/230 "V"$, B geeft $10 "kV"\/220 "V"$. Beide hebben $Z_(s c) = #"0,05" Omega$ aan de secundaire zijde. Er hangt geen belasting aan.

  *Gevraagd.* De kringstroom $I_"circ"$, de gecombineerde primaire stroom $I_1$, en de uitgangsspanning $V_2$.

  *Denkstap.* De twee secundaire wikkelingen staan tegenover elkaar in een gesloten lus. Hun nullastspanningen verschillen, en dat verschil drijft een stroom door de twee kortsluitimpedanties in serie. Er is geen belasting nodig om die stroom te laten lopen.

  *De kringstroom.*
  $ I_"circ" = (V_(2,A) - V_(2,B)) / (Z_(s c,A) + Z_(s c,B)) = (230 - 220)/(#"0,05" + #"0,05") = 100 "A" $

  *De uitgangsspanning.* De kringstroom veroorzaakt een val over elke impedantie. Vanuit A gerekend zakt de spanning, vanuit B stijgt ze, en beide komen op hetzelfde punt uit:
  $ V_2 = 230 - 100 dot #"0,05" = 225 "V" $
  $ V_2 = 220 + 100 dot #"0,05" = 225 "V" quad checkmark $

  *De primaire stroom.* Herleid de kringstroom via elke verhouding naar de primaire zijde:
  $ I_(1,A) = 100 dot 23/1000 = #"2,3" "A" quad quad I_(1,B) = 100 dot 22/1000 = #"2,2" "A" $

  A trekt die stroom uit het net, B duwt hem er weer in. Wat het net overhoudt is het verschil:
  $ I_1 = #"2,3" - #"2,2" = #"0,1" "A" $

  #belangrijk[Aan de primaire zijde zie je bijna niets, terwijl er secundair $100 "A"$ rondloopt.] Die stroom verwarmt beide transformatoren zonder één watt nuttig vermogen te leveren, en je merkt hem niet aan de netzijde.
]

#oefening(title: "Lastverdeling bij gelijke kortsluitspanning")[
  *Gegeven.* A en B staan parallel op $10 "kV"\/400 "V"$. A is $100 "kVA"$ met $u_(s c) = 5 %$, B is $50 "kVA"$ met $u_(s c) = 5 %$.

  *Gevraagd.* Hoe verdeelt de totale belastingsstroom zich?

  *Denkstap.* De belasting verdeelt zich omgekeerd evenredig met de kortsluitimpedanties. Reken die eerst in ohm uit, want de percentages horen bij verschillende basisvermogens.

  $ Z_(s c) = u_(s c) dot V_2^2 / S_n $
  $ Z_(s c,A) = #"0,05" dot 400^2/(100 dot 10^3) = #"0,08" Omega quad quad Z_(s c,B) = #"0,05" dot 400^2/(50 dot 10^3) = #"0,16" Omega $

  B heeft dus de dubbele impedantie en neemt de halve stroom:
  $ I_A / I_B = Z_(s c,B) / Z_(s c,A) = 2 $

  A neemt $2\/3$ van de belasting, B neemt $1\/3$. Dat is precies de verhouding van hun nominale vermogens, dus beide draaien op dezelfde belastingsgraad en samen halen ze de volle $150 "kVA"$.
]

#oefening(title: "Lastverdeling bij ongelijke kortsluitspanning")[
  *Gegeven.* Zelfde transformatoren, maar nu $u_(s c,A) = 10 %$ en $u_(s c,B) = 5 %$.

  $ Z_(s c,A) = #"0,10" dot 400^2/(100 dot 10^3) = #"0,16" Omega quad quad Z_(s c,B) = #"0,05" dot 400^2/(50 dot 10^3) = #"0,16" Omega $

  De impedanties zijn nu gelijk, dus #belangrijk[beide transformatoren voeren dezelfde stroom], en dus hetzelfde vermogen. B zit al op zijn $50 "kVA"$ terwijl A pas op de helft van zijn $100 "kVA"$ staat.

  Je kan de groep dus maar tot $2 times 50 = 100 "kVA"$ belasten in plaats van tot $150 "kVA"$. De grootste transformator blijft voor een derde onbenut. Dat is de reden achter de voorwaarde van gelijke $u_(s c)$.
]




