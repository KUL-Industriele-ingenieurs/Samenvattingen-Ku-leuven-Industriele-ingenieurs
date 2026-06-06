#import "../../school-template.typ": *


= Convectie <ch:convectie>

#wrap-figure(
  image("assets/convectieprincipe.png", width: 6cm),
  caption: [convectieprincipe],
  label: <fig:convectieprincipe>,
)[

  #keyterm[Convectie] is de warmteoverdracht tussen een vast lichaam en een bewegende vloeistof of gas.


  Warmteoverdracht door een fluïdum gebeurt via #keyterm[convectie] bij aanwezigheid van bulkstroming en via #keyterm[conductie] bij afwezigheid ervan.


  Convectie zorgt voor veel snellere warmteoverdracht dan conductie in dit geval omdat
  je constant warm fluïdum aan het oppervlak brengt. Hierdoor is er een constante warmteoverdracht. De limiterende factor is hier conductie.
]

#wrap-figure(
  image("assets/convectiestroom.png", width: 5cm),
  caption: [convectiestroom],
  label: <fig:convectiestroom>,
)[
  Conductie is niet enorm efficient omdat je gradierend warmte verliest aan de omgeving.
  Convectie gaat over de stroming van gas of een vloeistof en die stromingen zorgen voor veel meer interacite tussen de moneculen en dus snellere warmteoverdracht $[dot(Q)]$.]

$ dot(Q)_(c o n v) >> dot(Q)_(c o n d) $

De forumes hebben we hiervoor al gezien maarhaling is handig

== Convectie <sec:convectie>

Convectie hangt volledig af van de viscositeit $[mu]$, thermische conductiviteit $[lambda]$, dichtheid $[rho]$ en de warmtecapaciteit $[c_p]$ van de vloeistof. Dit zorgt voor de wrijving en dus de warmteoverdracht. De geometrie en ruwheid van het oppervlak spelen ook een rol en het type stroming (laminaire of turbulente stroming).

Convectie is dus complexer want die $h$ is niet zomaar te bepalen. We berusten op vorige ingenieurs die al die berekeningen al gedaan hebben. Je moet $h$ niet schrijven in term van 7 variabelen want dat is onmogelijk. We berusten op dimensieloze getallen.

#frm(
  "Netwon law of cooling",
  [ $"Heat flux" arrow.r.double dot(q) = h (T_s - T_infinity) space (W/m^2)$;

    $dot(Q) = h A (T_s - T_infinity) (W)$
  ],
  [
    Met $h$ de warmteoverdrachtscoëfficiënt. Deze is afhankelijk van de geometrie, de vloeistof en de stroming, $A$ de oppervlakte en $T_s$ en $T_infinity$ de temperatuur van het oppervlak en de omgeving.

  ],
)


*No slip conditie:* De vloeistof aan het oppervlak heeft dezelfde snelheid als het oppervlak en die is nul dus, $v_"fluid" = 0$.

#figure(
  image("assets/noslip.png", width: 7cm),
  caption: [noslip],
  label: <fig:noslip>,
)


*Boundary layer:*\
De temperatuur van de vloeistof aan het oppervlak is gelijk aan de temperatuur van het oppervlak.

De boundary layer is enorm belangrijk want die zorgt voor de warmteoverdracht. Hoe dikker de boundary layer hoe minder efficient de warmteoverdracht.

Deze komen door de viscositeit $[mu]$. Dit is belangrijk om het snappen over hoe fluïda zich om objecten gedragen. Fluïda met hoge viscositeit hebben een dikkere boundary layer. Ze gaan meer plakken en wrijving hebben aan het oppervlak en dus minder snel stromen of niet stromen _No-slip conditie_ en dus heb je minder #keyterm[convectie].


*H is niet constant*\
_zie slides voor uitwerking maar niet belangrijk om te kennen_

$ h = frac(1, A) integral_A h_(l o c a l) d A & h = frac(1, L) integral_0^L h_(x) d x $

Je kunt dus voor specifieke punten over bijvoorbeeld een electronica componenten een warmteoverdrachtscoëfficiënt berekenen. Deze forumes tonen dus het effect op h van de geometrie.


== Non dimensional quantities & Buchkingham pi theorema

We gebruiken vaan #keyterm[dimensieloze getallen] om de warmteoverdracht te beschrijven.
Pi is bijvoorbeeld een dimensieloos getal.


* Voorbeeld met een pendulum* _verdere info slides_\

#voorbeeld(title: "Een bekend voorbeeld")[
  GI Taylor was gevraagd om de output van een kernbom te voorspellen. Hij had geen tijd (of niet alle gegevens) om de volledige berekeningen te doen dus hij gebruikte dimensieloze getallen om de output te voorspellen. Dit was enorm accuraat.

  Hij wilde een relatie afleiden die beschreef hoe andere fysische grootheden schaalden met de straal van de explosie. Hij wist dat energie vrijkwam vanuit een klein volume en een schokgolf genereerde in een ruwweg sferische vorm.

  De variabelen en hun respectievelijke dimensies zijn:
  $ [R] = L, quad [t] = T, quad [rho] = M L^(-3) quad "en" quad [E] = M L^2 T^(-2) $

  Zijn resultaten van de opbrengst van de Trinity-test bleken zeer accuraat en overheden waren erg 'nieuwsgierig' hoe hij dit wist te berekenen. Hij zocht naar een dimensieloos getal $pi_1$:
  $ pi_1 = frac(E, R^q t^r rho^s) arrow.r [pi_1] = frac(L^(3s - q + 2), T^(r + 2) M^(s - 1)) $

  Uit de eis dat de machten van dimensies ($M$, $L$, $T$) nul moeten zijn:
  $ pi_1 = C = frac(E t^2, R^5 rho) $

  #figure(
    image("assets/kernbom.png", width: 5cm),
    caption: [kernbom],
    label: <fig:kernbom>,
  )
]



== Nusselt Number <sec:nusselt-number>

De nussel number is een #keyterm[dimensieloze getal] die de warmteoverdracht door convectie beschrijft. Het is de verhouding tussen de warmteoverdracht door convectie en de warmteoverdracht door conductie.

$ Nu = frac("convectie", "conductie") = frac(h L_c, k) => "halen we h uit" $


$L_c$ is de karakteristieke lengte. Deze is afhankelijk van de geometrie. Bij een cilinder is dit de diameter, bij een plaat de lengte, etc.


Het getal van Nusselt vertegenwoordigt de toename van warmteoverdracht door een vloeistoflaag als gevolg van convectie ten opzichte van geleiding (conductie) over diezelfde laag.

Hoe groter het getal van Nusselt $=>$hoe effectiever de convectie. Een Nusselt-getal van $Nu = 1$  betekent dat we puur conductie hebben.

#figure(
  image("assets/nusselnumber heattransfer.png", width: 6cm),
  caption: [nusselnumber heattransfer],
  label: <fig:nusselnumber-heattransfer>,
)

#frm(
  "Nusselt number",
  [
    Dimensionless convection heat transfer coefficient
    $ Nu = frac(h L_c, k) $
    $ dot(q)_"conv" = h Delta T $
    $ dot(q)_"cond" = k frac(Delta T, L) $
    $ frac(dot(q)_"conv", dot(q)_"cond") = frac(h Delta T, k (Delta T) / L) = frac(h L, k) = Nu $
  ],
  [
    $L_c$ is de karakteristieke lengte. Deze is afhankelijk van de geometrie. Bij een cilinder is dit de diameter, bij een plaat de lengte, etc.
  ],
)

== Klassificatie van fluid stromingen <sec:fluid-stromingen>

=== Viscous vs Inviscid regions of flow <sec:viscous-inviscid>


#figure(
  image("assets/viscious VS inviscid.png", width: 5cm),
  caption: [viscious VS inviscid],
  label: <fig:viscious-VS-inviscid>,
)
- *Viscous region:* De regio waar de viscositeit van de vloeistof significant is. $=>$ rekening houden met wrijvingsverliezen. Dit is meestal in de buurt van het oppervlak van het object.

- *Inviscid region:* De regio waar de viscositeit van de vloeistof verwaarloosbaar is. Dit is meestal ver van het oppervlak van het object.


=== Internal vs External flow <sec:internal-external-flow>

*External flow:* De vloeistof stroomt over een object. De boundary layer kan zich over het gehele object ontwikkelen.

*Internal flow:* De vloeistof stroomt door een object. De boundary layer kan zich over het gehele object ontwikkelen.

#figure(
  image("assets/tennisbal met turbulent wake region.png", width: 5cm),
  caption: [tennisbal met turbulent wake region],
  label: <fig:tennisbal-met-turbulent-wake-region>,
)

=== Compressible vs Incompressible flow <sec:compressible-incompressible-flow>

#wrap-figure(
  image("assets/Ma.png", width: 5cm),
  caption: [Ma],
  label: <fig:Ma>,
)[

  $ M a = frac(V, c) = frac("Snelheid van de vloeistof", "Snelheid van het geluid") $

  Met $c$ de geluidssnelheid (ongeveer 346 m/s in lucht op kamertemperatuur op zeeniveau).

  *Incompressible flow:* De dichtheid van de vloeistof blijft constant gedurende de stroming (bv. typische vloeistofstromen). Gassen kunnen ook als incompressibel worden beschouwd als hun dichtheidsverandering $< 5%$ is. Dit is het geval bij $M a < 0.3$ (ongeveer $V < 100$ m/s in lucht).

  *Compressible flow:* De dichtheid van de vloeistof verandert tijdens de stroming (bv. snelle gasstromen in raketten en ruimtevaartuigen). De stroming wordt vaak ingedeeld via het Mach-getal:

]



#highlight[Enorm hoge snelheden gaat lucht ook compressable worden maar we gaan niet in de regio dus we gaan aanmemen dat lucht incompressable is]

=== Laminar vs Turbulent flow <sec:laminar-turbulent-flow>
#wrap-figure(
  image("assets/soorten vloeistoffen.png", width: 5cm),
  caption: [soorten vloeistoffen],
  label: <fig:soorten-vloeistoffen>,
)[


  *Laminar flow:* De vloeistof stroomt in parallelle lagen. Er is geen menging tussen de lagen.

  $ arrow.b.double $

  *Transition flow:* Een tussentransitie laag tussen laminar en turbulent.

  $ arrow.b.double $

  *Turbulent flow:* De vloeistof stroomt in willekeurige patronen. Er is menging tussen de lagen.
]

=== Natural (Unforced) VS Forced (Driven) Convection <sec:natural-forced-convection>

*Natural (Unforced) Convection:* Natuurlijke convectie komt door het buoyency effect waarbij lucht #keyterm[opstijgt] door warmte en #keyterm[daalt] door koelte.

*Forced (Driven) Convection:* Een vloeistof waarbij een motor of andere mechanisme de vloeistof stroomt.
Je vloeistof wordt #keyterm[geforceerd] om te stromen langs een oppervlak.

=== Steady flow VS Unsteady flow <sec:steady-flow-unsteady-flow>

- De term *steady* (stationair) impliceert dat er op een bepaald punt geen verandering is in de tijd.
- Het tegenovergestelde van steady is *unsteady* (instationair).
- De term *uniform* impliceert dat er geen verandering is met de locatie over een gespecificeerd gebied.
- De term *periodiek* verwijst naar het type instationaire stroming waarbij de stroming oscilleert rond een stationair gemiddelde.
- Veel apparaten zoals turbines, compressoren, ketels, condensors en warmtewisselaars werken gedurende lange perioden onder dezelfde omstandigheden en worden geclassificeerd als *steady-flow* apparaten.


=== 1, 2 en 3 Dimensieflows <sec:1-2-3-dimensions>

#examenbox("In dit vak gaan we ons bezig houden met 1D en 2D stroming niet 3D")

#figure(
  image("assets/2D flow.png", width: 12cm),
  caption: [2D flow],
  label: <fig:2D-flow>,
)

In de figuur zie je dat de stroming van een uniforme stromingen naar een fully developed flow gaat.
Als dit gebeurt mogen we *1D stroming* beschouwen.


Je krijgt een gradient over je radius $r$
#figure(
  image("assets/gradientflow.png", width: 3cm),
  caption: [gradientflow],
  label: <fig:gradientflow>,
)

== Velocity Boundry Layer <sec:velocity-boundry-layer>

De velocity boundry layer is de laag waar de vloeistof een veel lagere snelheid heeft dan de vloeistof buiten de laag.

Afhankelijk van de type stroom (laminar of turbulent) kan de velocity boundry layer verschillen.

#figure(
  image("assets/boundrylayer.png", width: 12cm),
  caption: [boundrylayer],
  label: <fig:boundrylayer>,
)

lagere stromingen gaan een grotere velocity boundry layer (viscus region) hebben dan hoge stromingen omdat de vloeistoffen niet meegetrokken worden door de stroom. Als je buiten de #keyterm[velocity boundry layer] zit noemt dit de #keyterm[inviscus region].

Viscociteit is ook een groter factor. Grotere viscositeit $mu$ $arrow.r$ grotere velocity boundry layer.

=== Effect van temperatuur op viscositeit <sec:effect-temperature-viscositeit>

#wrap-figure(
  image("assets/viscocity temperature.png", width: 5cm),
  caption: [viscocity temperature],
  label: <fig:viscocity-temperature>,
)[

  *Vloeistoffen* hebben een lagere viscositeit $mu$ bij hogeren temperaturen en een grotere viscositeit $mu$ bij lagere temperaturen.

  *Gassen* zijn het omgekeerde van vloeistoffen.

  Meestal is viscositeit $mu$ constant voor onze gevallen maar het is belangrijk om de relaties te weten.

  #keyterm[De Wall shear stress] is de shear stress op de oppervlak van de vloeistof.

  $ tau_w = mu frac(d u, d y) |_{y=0} [N/m^2] $

  Deze formule is geldig voor #keyterm[Newtoniaanse vloeistoffen].
]

De kinematishce viscositeit is de viscositeit van de vloeistof in een onveranderlijke stroom.

$ nu = mu / rho $

== Thermal boundary layer <sec:thermal-boundry-layer>

Net zoals dat je een profiel hebt door snelheid krijg je dit ook voor temperaturen $T$.
Je kunt het bezien als een resistor. Een grotere boundry layer $arrow.r$ hogere resistencie.


#figure(
  image("assets/Thermal boundry layer.png", width: 8cm),
  caption: [Thermal boundry layer],
  label: <fig:Thermal-boundry-layer>,
)
Dit krijgen we als er een andere temperatuur is langs het oppervlakte dan het vloeistof.

$ T_s + 0.99 (T_infinity - T_s) $

met $T_s$ de temperatuur van het oppervlakte en $T_infinity$ de temperatuur van het vloeistof.

== Prandtl number <sec:prandtl-number>

#examenbox[Dit ga je vaak terug zien]



$ P r = frac("Moleculair diffusiteit van het momentum", "Moleculair diffusiteit van warmte") $

#frm(
  "Prandtl number",
  $P r = nu / alpha = (rho c_p) / K$,
  [Met $nu$ de kinematische viscositeit, $alpha$ de thermische diffusiviteit en $K$ de thermische geleidbaarheid.],
)

Het #keyterm[Prandtl-getal] beschrijft de verhouding tussen de relatieve dikte van de snelheids- ($delta$) en de thermische ($delta_t$) grenslaag:

$ delta / delta_t approx P r^(1/3) $

- *Gassen* ($P r approx 1$): Momentum en warmte diffunderen even snel. De thermische en snelheidsgrenslaag zijn ongeveer even dik ($delta approx delta_t$).
- *Vloeibare metalen* ($P r << 1$): Warmte diffundeert veel sneller dan momentum. De thermische grenslaag is veel dikker dan de snelheidsgrenslaag ($delta_t >> delta$).
- *Oliën* ($P r >> 1$): Warmte diffundeert zeer traag vergeleken met momentum. De thermische grenslaag is veel dunner ten opzichte van de snelheidsgrenslaag ($delta_t << delta$).

#figure(
  image("assets/Prandtl Number.png", width: 12cm),
  caption: [Prandtl Number],
  label: <fig:Prandtl-Number>,
)

Als $P r > 1$: toont een hoge hitte resistentie (lage diffusiteit) en een relatief dunne thermische boundary layer in vergelijking met de velocity boundary layer.

Als $P r < 1$: toont een lage hitte resistentie (hoge diffusiteit) en een dikke thermische boundary layer in vergelijking met de velocity boundary layer.

== Reynolds number <sec:reynolds-number>

Nog een dimensielooze number die de toont hoe turbilent een stroming is.

$ Re = frac("Inertial forces", "Viscositeit") $


#frm(
  "Reynolds number",
  [
    $ R e = (V_(a v g) dot D/nu) = rho V L / mu $,

  ],
  [Met $rho$ de dichtheid, $V$ de snelheid, $L$ de lengte en $mu$ de viscositeit.],
)


als $Re < 2300$: laminar flow
als $Re > 4000$: turbulent flow
als $2300 < Re < 4000$: transition flow

#examenbox[Op het examen gaat hij altijd duidelijk verschillen hebben of het laminar of turbulent is en niet tussen de 2.]


== Snelle herhaling

- *Re*: Reynolds number
$ R e = (V_(a v g) dot D/nu) = rho V L / mu $
- *Pr*: Prandtl number
$ P r = nu / alpha = (rho c_p) / K $
- *Nu*: Nusselt number
$ Nu = h L / k $

Je kunt de Reynolds en Prandtl number samenvoegen tot de Nusselt number.

$ Nu = f(R e, P r) = frac(h(L_c), h) $

In oefeningen ga je vaak oplossen met je gegevens naar *Re* en *Pr* $=>$ je kijkt dan in je formularium wat het Nusselt number is.



