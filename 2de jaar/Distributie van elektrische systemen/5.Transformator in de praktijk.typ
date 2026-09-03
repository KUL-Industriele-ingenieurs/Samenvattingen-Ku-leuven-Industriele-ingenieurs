#import "../../school-template.typ": *


= Transformator in de praktijk <ch:transformator-praktijk>

In het vorige hoofdstuk hebben we het model van de reële transformator opgebouwd met al zijn verliezen. Nu gaan we dat model vereenvoudigen zodat we er makkelijk mee kunnen rekenen, en bekijken we hoe een transformator zich gedraagt in typische praktijksituaties: onder belasting, bij kortsluiting, en bij het aanzetten.

== Vereenvoudigde vervangingsschema's

We starten terug bij het equivalent schema van transformatoren (zie #ref(<ch:reële-transformatoren>)) waarbij we alle verliezen naar de #keyterm[Primaire kant] verplaatsen.

Herinner je nog dat we de verliezen kunnen overbrengen afhankelijk van de hoeveelheid windingen $N_1$ en $N_2$ en de verhouding tussen deze twee.

#figure(
  image("assets/Equivalent T-schema.png", width: 9cm),
  caption: [Equivalent T-schema],
  label: <fig:Equivalent-T-schema>,
)

Het doel is om het circuit stap voor stap te vereenvoudigen zodat we makkelijker $V_1$ en $I_1$ kunnen berekenen. We starten met een phasordiagram. We weten dat de stroom door de spoel $I_2'$ is en de stroom #keyterm[De excitatie stroom] door de parallelle weerstand $I_0$ is. Dus $I_1 = I_2' + I_0$. Als we $I_1$ hebben kunnen we $V_1$ berekenen met de wet van Ohm.

#figure(
  image("assets/Phasor equivalent schema.png", width: 8cm),
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
  image("assets/Cantilever phasor.png", width: 8cm),
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
  image("assets/Equivalent series circuit phasors.png", width: 8cm),
  caption: [Equivalent series circuit phasors],
  label: <fig:Equivalent-series-circuit-phasors>,
)

Dit is dan een overview van de verschillende equivalent schema's.

#figure(
  image("assets/Equivalent schema's overview.png", width: 10cm),
  caption: [Equivalent schema's overview],
  label: <fig:Equivalent-schemas-overview>,
)

Afhankelijk van welk circuit je neemt krijg je meer of minder info over je verliezen (zie #ref(<ch:reële-transformatoren>)). Het volledige T-schema bevat alles, het cantilever model is een goeie balans, en het seriecircuit is het simpelst maar je mist de kernverliezen.

== Bedrijfsmodi en parameterbepaling <sec:operatie-modussen>

Om het gedrag van een transformator onder verschillende netcondities te voorspellen en de parameters van het vervangingsschema ($R_("eq"), X_("eq"), R_(f e), X_m$) experimenteel te bepalen, onderscheiden we drie fundamentele bedrijfsmodi:

#figure(
  image("assets/Operatie modussen.png", width: 10cm),
  caption: [De drie operationele toestanden: onbelast (No-load), belast (Full-load) en kortgesloten (Short-circuit).],
  label: <fig:Operatie-modussen>,
)

- / 1. Nullast (No-load): De secundaire klemmen zijn open ($I_2 = 0$). Er vloeit enkel een minimale exciteringsstroom $I_0$ die de kernverliezen ($P_(f e)$) en de magnetiseringsflux bepaalt.
- / 2. Vollast (Full-load): De secundaire klemmen voeden een belasting ($I_2 = I_(2n)$). De koperverliezen en spanningsval bereiken hun nominale ontwerpwaarde.
- / 3. Kortsluiting (Short-circuit): De secundaire klemmen zijn direct doorverbonden ($V_2 = 0$). Bij nominale netspanning treedt een gevaarlijk grote stroom op; met een sterk gereduceerde testspanning meet men de wikkelingsparameters ($R_("eq"), X_("eq")$).

=== 1. Nullast-bedrijf (No-load) <sec:no-load>

Bij nullast is de secundaire zijde van de transformator open ($I_2 = 0$). Er wordt dus geen nuttig elektrisch vermogen aan een belasting geleverd ($P_2 = 0$).

#grid(
  columns: (1.2fr, 1fr),
  gutter: 0.8cm,
  align: horizon,
  figure(
    image("assets/No-Load-test.png", width: 6.5cm),
    caption: [Nullast-schakeling: secundair open ($I_2 = 0$), enkel nullaststroom $I_0$ vloeit.],
    label: <fig:No-Load-test>,
  ),
  figure(
    image("assets/Phasor no-load.png", width: 4.5cm),
    caption: [Fasordiagram bij nullast: $I_0$ is de vectoriële som van $I_c$ en $I_m$.],
    label: <fig:Phasor-no-load>,
  ),
)

*Fysische analyse van de nullaststroom ($I_0$ of $I_phi$):*
De primaire stroom bij nominale nullastspanning $V_1 = V_(1n)$ is de #keyterm[exciteringsstroom] $I_0$. Deze splitst zich op in de parallelle dwarstak:
+ *Actieve ijzerverliesstroom ($I_(f e)$ of $I_c$)*: Loopt exact *in fase* met de aangelegde spanning $V_1$. Deze stroom levert het actieve vermogen om de wervelstromen en de hysteresislus in de ijzerkern te overwinnen:
  $ I_(f e) = frac(V_1, R_(f e)) $
+ *Reactieve magnetisatiestroom ($I_m$)*: IJlt *90° na* op de spanning $V_1$ en loopt exact in fase met de magnetische flux $Phi$. Deze stroom is fysisch noodzakelijk om het magnetisch veld in de kern op te wekken tegen de reluctantie $cal(R)_c$ in:
  $ I_m = frac(V_1, X_m) $

De totale nullaststroom is de orthogonale vectorsom:
$ underline(I)_0 = I_(f e) - j I_m quad arrow.r.double quad I_0 = sqrt(I_(f e)^2 + I_m^2) $

#theorie(title: "Waarom meet de nullastproef zuiver ijzerverlies?")[
  In de praktijk is $I_m >> I_(f e)$, waardoor de nullaststroom $I_0$ zeer sterk inductief is en de nullast-arbeidsfactor extreem laag ligt ($cos phi_0 = P_0 / (V_1 I_0) approx #"0,1" - #"0,2"$).
  
  Bovendien bedraagt de magnitude van $I_0$ slechts $1 %$ tot $5 %$ van de nominale stroom $I_(1n)$. De primaire koperverliezen bij nullast bedragen daardoor:
  $ P_(c u,0) = I_0^2 R_1 prop (0.03 I_(1n))^2 R_1 approx 0.0009 P_(c u,n o m) < 0.1 % $
  De koperverliezen zijn dus volkomen verwaarloosbaar klein. Het gemeten nullastvermogen $P_0$ is bijgevolg *volledig toe te schrijven aan het ijzerverlies in de kern*:
  $ P_0 approx P_(f e) = P_("hysterese") + P_("wervelstroom") $
]

=== 2. Vollast-bedrijf (Full-load) <sec:full-load>

Vollast is de nominale bedrijfstoestand van de transformator. De secundaire zijde wordt aangesloten op een belasting $Z_L$, waardoor de nominale secundaire stroom $I_2 = I_(2n)$ vloeit bij nominale klemspanning $V_2 = V_(2n)$.

#figure(
  image("assets/Full Load.png", width: 13cm),
  caption: [Vollast-bedrijf: nominale stroom $I_(n o m)$ bij nominale spanning $V_(n o m)$.],
  label: <fig:Full-Load>,
)

*Het fysische compensatiemechanisme van de transformator:*
Zodra er secundaire stroom begint te vloeien, treedt een belangrijk zelfregulerend principe in werking:
+ *Demagnetiserende tegen-MMF*: De secundaire stroom $I_2$ wekt een magnetomotorische kracht $cal(F)_2 = N_2 I_2$ op. Volgens de wet van Lenz werkt dit veld de oorspronkelijke magnetische kernflux $Phi$ direct tegen.
+ *Automatische primaire stroomafname*: Als de kernflux $Phi$ zou dalen, daalt de tegen-EMK $E_1 = N_1 (dif Phi) / (dif t)$. Maar de primaire zijde hangt aan een vaste netspanning $V_1$. Het verschil $V_1 - E_1$ neemt direct toe, waardoor de primaire wikkeling automatisch een compenserende tegenstroom $I'_2$ uit het net trekt:
  $ I'_2 = frac(N_2, N_1) I_2 = 1/a I_2 $
+ *Fluxbehoud*: De extra primaire ampèrewindingen $N_1 I'_2$ heffen de ontmagnetiserende secundaire werking $N_2 I_2$ exact op ($N_1 I'_2 - N_2 I_2 = 0$). Hierdoor blijft de resulterende magnetische flux $Phi$ in de kern onder alle belastingscondities vrijwel exact constant!

De totale primaire stroom onder belasting is de vectoriële som:
$ underline(I)_1 = underline(I)_0 + underline(I)'_2 $

*Nominale kenplaatgegevens (Ratings) en thermische limieten:*
Op het kenplaatje (datasheet) van de transformator staan de nominale ontwerpwaarden vermeld:
- *Nominaal vermogen*: $S_(n o m) = V_(2n) dot I_(2n)$ (eenfasig) of $S_(n o m) = sqrt(3) dot V_(2n) dot I_(2n)$ (driefasig).
- *Thermische grens*: De nominale stroom wordt begrensd door de maximale opwarming van de koperwikkelingen ($I^2 R$) en de temperatuurbestendigheid van de transformatorolie (IEC-isolatieklasse).

=== 3. Kortsluitproef en kortsluitspanning $u_(s c)$ <sec:short-circuit>

De spanning die nodig is om bij kortgesloten secundaire wikkeling de nominale stroom te laten vloeien, heet de #keyterm[kortsluitspanning] $V_(s c)$. Uitgedrukt als percentage van de nominale spanning:

$ u_(s c) = frac(V_(s c), V_(1n)) dot 100 \% $

Bij een ongewilde kortsluiting onder volle netspanning bedraagt de kortsluitstroom:

$ I_(s c) = frac(I_(1n), u_(s c)) $

Bijvoorbeeld: met $u_(s c) = 5\% = #"0,05"$ bedraagt de kortsluitstroom $I_(s c) = 20 dot I_(1n)$. Relais, zekeringen en schakelaars moeten gedimensioneerd zijn om deze kortsluitstroom veilig te kunnen onderbreken.

=== Gestandaardiseerde transformatorproeven: NLP vs KSP <sec:proeven-vergelijking>

Om de parameters van het vervangingsschema experimenteel te bepalen zonder de transformator werkelijk onder vollast te hoeven testen, voert men twee gestandaardiseerde proeven uit:

#table(
  columns: (1.2fr, 1.4fr, 1.4fr),
  align: (left, left, left),
  stroke: none,
  inset: 6pt,
  table.hline(stroke: 1pt),
  table.header([*Kenmerk*], [*Nullastproef (NLP)*], [*Kortsluitproef (KSP)*]),
  table.hline(stroke: 0.5pt),
  [Secundaire klemmen], [OPEN ($i_2 = 0$)], [KORTGESLOTEN ($v_2 = 0$)],
  [Voedingszijde], [Meestal LS-zijde (veilig en vlot nominale spanning)], [Meestal HS-zijde (lagere nominale stroom nodig)],
  [Aangelegde spanning], [Nominaal: $V_1 = V_(1n)$], [Gereduceerd: $V_1 = V_(s c) = u_(s c) dot V_(1n)$ (typisch 3--8 %)],
  [Gemeten stroom], [Nullaststroom $I_0$ (zeer klein: 1--5 % van $I_n$)], [Nominale stroom: $I_1 = I_(1n)$],
  [Gemeten vermogen $P$], [$P_0 approx P_(f e)$ (ijzerverliezen in de kern)], [$P_(s c) approx P_(c u,n o m)$ (koperverliezen in wikkelingen)],
  [Verwaarlozing], [Koperverlies $I_0^2 R_1 approx 0$ (stroom te klein)], [Kernverlies $P_(f e) approx 0$ (flux minimaal door lage $V_(s c)$)],
  [Berekende parameters], [Dwarstak: $R_(f e)$ en $X_m$], [Serietak: $R_("eq")$ en $X_("eq")$],
  table.hline(stroke: 1pt),
)

#examenbox[
  *Waarom deze zijdes?*
  - De *NLP* doe je aan de *laagspanningszijde*: $230 "V"$ of $400 "V"$ nominale netspanning is overal beschikbaar; een voedingsbron van $20 "kV"$ is in een gewoon labo onpraktisch en gevaarlijk.
  - De *KSP* doe je aan de *hoogspanningszijde*: daar ligt de nominale stroom veel lager ($I = S / V$), waardoor de regelbare voeding en ampèremeters veel kleinere stromen hoeven te voeren.
]

== Voltage drop <sec:voltage-drop>

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


=== Spanningsregeling (Voltage Regulation VR) <sec:spanningsregeling>

De #keyterm[Spanningsregeling] ($V R$) is een maatstaf voor de stabiliteit van de secundaire spanning bij wisselende belasting. Het geeft aan hoeveel procent de secundaire klemspanning afwijkt van de nominale vollastspanning:

$ V R = frac(V_(2,0) - V_2, V_2) dot 100 \% $

met:
- $V_(2,0)$: secundaire klemspanning bij *No-load* (onbelast: $I_2 = 0$, $V_(2,0) = V_1 / a$);
- $V_2$: secundaire klemspanning bij *Full-load* (belast: $I_2 = I_(2n)$).

*Wiskundige berekening van de secundaire spanningsval ($Delta V_2$):*
Uit het vereenvoudigde serievervangingsschema volgt via fasorprojectie de benaderde formule van Kapp voor de spanningsval:

$ Delta V_2 = V_(2,0) - V_2 approx I_2 dot (R_("eq",2) cos phi_2 plus.minus X_("eq",2) sin phi_2) $

waarbij $phi_2$ de fasehoek is tussen de secundaire spanning en stroom.

#figure(
  image("assets/Spanningsregelaar.png", width: 7.5cm),
  caption: [Spanningsregeling $V R$ als functie van de belasting bij verschillende arbeidsfactoren.],
  label: <fig:Spanningsregelaar>,
)

Hoe lager de $V R$, hoe stijver en beter de transformator als spanningsbron functioneert. Het type belasting (#keyterm[Arbeidsfactor PF]) bepaalt het teken in de formule:

- *Lagging PF ($+$ teken, inductief - bijv. motoren)*: \
  Stroom ijlt na op de spanning. De lekreactantie en de weerstand tellen bij elkaar op ($R cos phi + X sin phi$). De secundaire klemspanning daalt altijd onder belasting ($V_2 < V_(2,0)$), wat leidt tot een *positieve spanningsregeling* ($V R > 0$). Dit is de standaardsituatie in industriële netten.
- *Unity PF (zuiver resistief - bijv. elektrische verwarming)*: \
  Omdat $cos phi_2 = 1$ en $sin phi_2 = 0$, ontstaat er een matige spanningsval die uitsluitend veroorzaakt wordt door de ohmse serieweerstand: $Delta V_2 approx I_2 R_("eq",2)$.
- *Leading PF ($-$ teken, capacitief - bijv. condensatorbanken of lange onbelaste kabels)*: \
  Stroom ijlt voor op de spanning. Als de belasting voldoende capacitief is, wordt de term $X_("eq",2) sin phi_2$ groter dan $R_("eq",2) cos phi_2$, waardoor de spanningsval *negatief* wordt:
  $ Delta V_2 < 0 quad arrow.r.double quad V_2 > V_(2,0) $
  De klemspanning onder belasting *stijgt* dus boven de nullastspanning uit, wat resulteert in een *negatieve spanningsregeling* ($V R < 0$)! Dit kan leiden tot gevaarlijke overspanningen op het net.


== Efficiëntie en Rendementskromme <sec:efficientie>

Het rendement $eta$ van een transformator is de verhouding tussen het nuttig geleverde actieve secundaire vermogen ($P_2$) en het totale opgenomen primaire vermogen ($P_1$):

$ eta = frac(P_2, P_1) = frac(P_2, P_2 + P_(c u) + P_(f e)) = frac(V_2 I_2 cos phi_2, V_2 I_2 cos phi_2 + P_(f e) + I_2^2 R_("eq",2)) $

met:
- $P_2 = V_2 I_2 cos phi_2$: nuttig vermogen aan de belasting [W];
- $P_(f e) = V_1^2 / R_(f e)$: ijzerverliezen in de kern [W] (constant, onafhankelijk van belasting $I_2$);
- $P_(c u) = I_2^2 R_("eq",2)$: koperverliezen in de wikkelingen [W] (kwadratisch met de stroom $I_2$).

#figure(
  image("assets/DEE_rendementscurve_verliezen.png", width: 14cm),
  caption: [Verloop van de vermogensverliezen (links) en de rendementscurve $eta(I)$ (rechts) in functie van de belastingsgraad $I/I_(n o m)$.],
  label: <fig:rendementscurve-verliezen>,
)

#theorie(title: "Wiskundige voorwaarde voor maximaal rendement")[
  Waarom verloopt de rendementscurve zoals in @fig:rendementscurve-verliezen?
  1. *Bij nullast ($I_2 = 0$)*: Er is geen nuttig uitgangsvermogen ($P_2 = 0$), maar de transformator verbruikt wél continu de vaste ijzerverliezen $P_(f e)$. Hierdoor start het rendement bij $eta = 0 %$.
  2. *Toename met belasting*: Naarmate $I_2$ stijgt, groeit het nuttige vermogen $P_2$ lineair, terwijl het vaste verlies $P_(f e)$ relatief gezien steeds kleiner wordt. Het rendement stijgt steil naar meer dan $95 %$.
  3. *Maximum efficiëntie*: Differentiëren we het rendement naar de stroom ($frac(dif eta, dif I_2) = 0$), dan vinden we de universele ontwerpeis:
     $ P_(c u)(I_2) = P_(f e) $
     Het rendement bereikt zijn absolute maximum exact wanneer de variabele koperverliezen gelijk zijn aan de constante ijzerverliezen! De optimale stroom bedraagt:
     $ I_(2,eta_("max")) = I_(2n) dot sqrt(frac(P_(f e), P_(c u,n o m))) $
  4. *Daling bij overbelasting*: Bij hoge belasting ($I > I_n$) groeien de koperverliezen kwadratisch ($prop I^2$). Ze overtreffen de ijzerverliezen en trekken het rendement langzaam weer omlaag.
]

#concept(title: "Dimensionering van nettransformatoren")[
  Distributietransformatoren in het elektriciteitsnet staan $24$ uur per dag ingeschakeld, maar draaien zelden continu op volle $100 %$ belasting. Fabrikanten ontwerpen de verhouding $P_(f e) / P_(c u,n o m)$ daarom typisch rond $0.5$ tot $0.6$. Hierdoor ligt de rendementspiek bewust rond *60% tot 80% van de nominale belasting*, exact waar het net de meeste uren per jaar opereert!
]

== Start-up <sec:start-up>

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
  image("assets/Parallel geschakelde transformatoren.png", width: 10cm),
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

De examenoefening op de kenplaat staat apart in @ch:oefeningen.

#oefening(title: "Verkeerde aftakking: kringstroom")[
  *Gegeven.* Twee identieke transformatoren A en B staan parallel, maar op een verschillende aftakking gezet: A geeft $10 "kV"\/230 "V"$, B geeft $10 "kV"\/220 "V"$. Beide hebben $Z_(s c) = #"0,05" Omega$ aan de secundaire zijde. Er hangt geen belasting aan.

  *Gevraagd.* De kringstroom $I_"circ"$, de gecombineerde primaire stroom $I_1$, en de uitgangsspanning $V_2$.

  *Denkstap.* De twee secundaire wikkelingen staan tegenover elkaar in een gesloten lus. Hun nullastspanningen verschillen, en dat verschil drijft een stroom door de twee kortsluitimpedanties in serie.

  *De kringstroom.*
  $ I_"circ" = (V_(2,A) - V_(2,B)) / (Z_(s c,A) + Z_(s c,B)) = (230 - 220)/(#"0,05" + #"0,05") = 100 "A" $

  *De uitgangsspanning.* De kringstroom veroorzaakt een val over elke impedantie. Vanuit A gerekend zakt de spanning, vanuit B stijgt ze, en beide komen op hetzelfde punt uit:
  $ V_2 = 230 - 100 dot #"0,05" = 225 "V" $
  $ V_2 = 220 + 100 dot #"0,05" = 225 "V" quad checkmark $

  *De primaire stroom.* Herleid de kringstroom via elke verhouding naar de primaire zijde:
  $ I_(1,A) = 100 dot 23/1000 = #"2,3" "A" quad quad I_(1,B) = 100 dot 22/1000 = #"2,2" "A" $

  A trekt die stroom uit het net, B duwt hem er weer in. Wat het net overhoudt is het verschil:
  $ I_1 = #"2,3" - #"2,2" = #"0,1" "A" $

  #belangrijk[Aan de primaire zijde zie je bijna niets, terwijl er secundair $100 "A"$ rondloopt.] Die stroom verwarmt beide transformatoren zonder één watt nuttig vermogen te leveren.
]

#oefening(title: "Lastverdeling bij gelijke kortsluitspanning")[
  *Gegeven.* A en B staan parallel op $10 "kV"\/400 "V"$. A is $100 "kVA"$ met $u_(s c) = 5 %$, B is $50 "kVA"$ met $u_(s c) = 5 %$.

  *Gevraagd.* Hoe verdeelt de totale belastingsstroom zich?

  *Denkstap.* De belasting verdeelt zich omgekeerd evenredig met de kortsluitimpedanties. Reken die eerst in ohm uit, want de percentages horen bij verschillende basisvermogens.

  $ Z_(s c) = u_(s c) dot V_2^2 / S_n $
  $ Z_(s c,A) = #"0,05" dot 400^2/(100 dot 10^3) = #"0,08" Omega quad quad Z_(s c,B) = #"0,05" dot 400^2/(50 dot 10^3) = #"0,16" Omega $

  B heeft dus de dubbele impedantie en neemt de halve stroom:
  $ I_A / I_B = Z_(s c,B) / Z_(s c,A) = 2 $

  A neemt $2\/3$ van de belasting, B neemt $1\/3$: de verhouding van hun nominale vermogens. Beide draaien dus op dezelfde belastingsgraad en samen halen ze de volle $150 "kVA"$.
]

#oefening(title: "Lastverdeling bij ongelijke kortsluitspanning")[
  *Gegeven.* Zelfde transformatoren, maar nu $u_(s c,A) = 10 %$ en $u_(s c,B) = 5 %$.

  $ Z_(s c,A) = #"0,10" dot 400^2/(100 dot 10^3) = #"0,16" Omega quad quad Z_(s c,B) = #"0,05" dot 400^2/(50 dot 10^3) = #"0,16" Omega $

  De impedanties zijn nu gelijk, dus #belangrijk[beide transformatoren voeren dezelfde stroom], en dus hetzelfde vermogen. B zit al op zijn $50 "kVA"$ terwijl A pas op de helft van zijn $100 "kVA"$ staat.

  Je kan de groep dus maar tot $2 times 50 = 100 "kVA"$ belasten in plaats van tot $150 "kVA"$, en de grootste blijft voor een derde onbenut. Vandaar de voorwaarde van gelijke $u_(s c)$.
]




