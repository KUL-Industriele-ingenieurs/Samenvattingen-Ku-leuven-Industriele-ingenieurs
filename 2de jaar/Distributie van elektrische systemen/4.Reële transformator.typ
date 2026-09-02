#import "../../school-template.typ": *

= Reële transformatoren. <ch:reële-transformatoren>

== Inhoud
- Non-ideale transformatoren
- equivalent schema
- metingen

== Non-ideale transformatoren <sec:non-ideale-transformatoren>

Een ideale transformator _vorig hoofdstuk_ heeft een paar aannames:
- *Infinite permeabiliteit van het kernmateriaal:*   er is geen magnetische weerstand, dus er is geen magnetische flux die verloren gaat in de kern.
- *Geen conductiviteit van de wikkelingen:* er is geen weerstand in de wikkelingen, dus er is geen warmteverlies.
- *Oneindig wikkelingsverhouding:* er is geen lekflux, dus alle magnetische flux die door de primaire wikkeling gaat, gaat ook door de secundaire wikkeling.
- *Coupling 100%:* er is geen lekflux, dus alle magnetische flux die door de primaire wikkeling gaat, gaat ook door de secundaire wikkeling.


In werkelijkheid treedt elk van die effecten wél op. Hieronder krijgt elk effect zijn eigen component in het vervangingsschema.

== Eindige permeabiliteit van het kernmateriaal <sec:finite-permeabiliteit-van-het-kernmateriaal>
Magnetisatiestroom. In het vorig hoofdstuk hebben we *Reluctantie* geïntroduceerd als een maat voor de magnetische weerstand van de kern.

#figure(
  image("assets/Relucantie.png", width: 5cm),
  caption: [Relucantie],
  label: <fig:Relucantie>,
)

$ N_1 i_1 - N_2 i_2 = phi R_c $

met $R_c$ de reluctantie van de kern, $phi$ de magnetische flux en $N_1$ en $N_2$ het aantal windingen van respectievelijk de primaire en secundaire wikkeling.

$
  arrow.r.double i_1 = underbrace(N_2/N_1 i_2),"ideale transformator" + underbrace((phi R_c) / N_1),"Stroom verlies" i_m
$

$phi$ hebben we vorig hoofdstuk gezien en is de flux doorheen de kern.

#figure(
  image("assets/Fluxherhaling.png", width: 5cm),
  caption: [Fluxherhaling],
  label: <fig:Fluxherhaling>,
)

$ phi = frac(V_1, omega N_1) $

We zien dat de magnetisatiestroom $i_m$ in fase is met de flux $phi$. We kunnen $i_m$ herschrijven door $phi$ te substitueren:

$ i_m = frac(R_c phi, N_1) $

Vul $phi = frac(V_1, omega N_1)$ in:

$ i_m = frac(R_c V_1, omega N_1^2) $

$L_m = frac(N_1^2, R_c)$. Als we dit invullen ($R_c/N_1^2 = 1/L_m$), krijgen we de wet van Ohm voor een spoel:

$ i_m = frac(V_1, omega L_m) $

$L_m$ is de hoofdinductantie van de transformator en is gelijk aan $frac(N_1^2, R_c)$

We krijgen hierdoor een geüpdate model van onze transformator:
#figure(
  image("assets/Hoofdinductantie.png", width: 6cm),
  caption: [Hoofdinductantie],
  label: <fig:Hoofdinductantie>,
)

== B-H-curve <sec:BH-curve>
=== B-H-karakteristiek <sec:BH-karakteristiek>

#wrap-figure(
  image("assets/BH-curve.png", width: 7cm),
  caption: [BH-curve],
  label: <fig:BH-curve>,
)[
  De BH curve gaat de vervorming en het verlies van hystereses modelleren.
  We gaan dit doen in plaats van de formule $B = mu dot H$
  Dit is een perfect lineair model maar opnieuw het universum zet ons tegen.
  Uiteindelijk gaat onze kern verzadigd raken en kunnen we niet meer zeggen dat $B$
  evenredig is met $H$. Dit is een BH curve.

  Dit komt omdat een magneet allemaal gemaakt is van kleine magnetische
  atomen die dezelfde richting hebben en zo een magnetisch veld opwikkelen.
  Maar uiteindelijk gaan alle richtingen gelijk staan en is er geen verschil als je er nog meer magnetische veld opzet.
  Dit is het verzadigingspunt van de kern.
]

ampere's wet:

$ H l_C = N i $
$ H = (N I)/ l_C $

en
$ phi = B A_c $
$ B = phi/A_c $

Dit verandert onze BH-curve naar dit:

#figure(
  image("assets/Flux-MMF.png", width: 5cm),
  caption: [Flux-MMF],
  label: <fig:Flux-MMF>,
)

=== Vervorming

In een echt elektriciteitsnet is de *spanning* sinusvormig $v(t) = hat(V) cos(omega t)$. Omdat de spanning de afgeleide is van de flux (wet van Faraday), wordt de flux hierdoor gedwongen om ook sinusvormig te zijn.

$ v_1(t) = hat(V) cos(omega t) underbrace(arrow.r.double, d/(d t)) phi(t) = hat(Phi) sin(omega t) $

Echter, door de niet-lineaire BH-curve van het kernmateriaal is de relatie tussen flux ($phi$) en stroom ($i_m$) niet constant. Wanneer de kern in de buurt van *verzadiging* komt (het "kniepunt" van de BH-curve), daalt de permeabiliteit ($mu$) drastisch.

* => Gevolg:* om de flux sinusvormig te houden op de toppen, is er een onevenredig grote toename van de veldsterkte ($H$) en dus de magnetisatiestroom ($i_m$) nodig. Dit resulteert in een *gepiekte (niet-sinusvormige) stroom*.

#figure(
  image("assets/BH-non lineair.png", width: 12cm),
  caption: [Distortie van de magnetisatiestroom door verzadiging van de kern. De sinusvormige flux (blauw) vereist een gepiekte stroom (rood) door de afvlakkende BH-karakteristiek.],
  label: <fig:BH-non-lineair>,
)

==== Harmonische analyse
Omdat de stroom periodiek maar niet-sinusvormig is, kunnen we deze via *Fourier-analyse* wiskundig ontleden in verschillende sinusvormige componenten _We gaan de vreemde sinusvormige curve opzetten in verschillende sinussen_:

- *Fundamentele component ($f_1$):* Dit is de sinusvormige stroom op de basisnetfrequentie. Het vertegenwoordigt het grootste deel van de magnetisatiestroom en is wat we zouden zien als de kern perfect lineair zou zijn.
- *Harmonische componenten ($f_3, f_5, ...$):* Dit zijn sinussen met een frequentie die een geheel veelvoud is van de fundamentele (bijv. 3 of 5 keer zo snel). Ze ontstaan puur door de niet-lineariteit van de kern en zijn de "correcties" die nodig zijn om de afwijking van een perfecte sinus te beschrijven.

1. *3de Harmonische:* Dit is de meest dominante component (vaak 30-40% van de totale stroom). Zoals te zien in @fig:fundamentaal-harmonisch, valt de piek van de 3de harmonische precies samen met de piek van de fundamentele component. Deze *constructieve interferentie* zorgt ervoor dat de resulterende stroomgolf "gepiekt" wordt: de top wordt scherper en de flanken worden steiler.
2. *5de Harmonische:* Ook aanwezig, maar met een kleinere amplitude. Deze helpt de vorm verder te verfijnen naar de werkelijke magnetisatiestroom.
3. *Oneven karakter:* Omdat de stroomvervorming symmetrisch is voor de positieve en negatieve helft van de cyclus, bevat de stroom enkel oneven harmonischen. Even harmonischen zouden de golfvorm asymmetrisch maken, wat hier niet het geval is.

#figure(
  image("assets/fundamentaal+harmonisch.png", width: 12cm),
  caption: [Constructieve interferentie: De som van de fundamentele component (blauw) en de 3de harmonische (groen) vormt de typische gepiekte magnetisatiestroom (rood).],
  label: <fig:fundamentaal-harmonisch>,
)

Deze harmonischen zijn ongewenst in het net omdat ze kunnen leiden tot extra opwarming van transformatoren en interferentie met elektronica. In driefasige systemen worden deze vaak opgevangen door een *delta-verbinding* ($Delta$), waarin de 3de harmonischen kunnen rondstromen zonder het net te vervuilen.

//Sessie 4 24min

== B-H-hysterese <sec:BH-hysterese>

#wrap-figure(
  image("assets/Hysteresis.png", width: 5cm),
  caption: [Hysteresis],
  label: <fig:Hysteresis>,
)[

  Nu hebben we nog een fenomeen. Onze curve is niet alleen #keyterm[Non-lineair], maar ook #keyterm[Hysteretisch].

  Dus onze BH-curve hangt ook af van wat er daarvoor gebeurde. Ons materiaal heeft een #keyterm[geheugen] van de magnetische veldsterkte.

  Het oppervlakte in de hysterese-lus toont onze energieverliezen $P_(l o s s) ~ f$

  Dus de snelheid van onze verandering _frequentie_ $f$ heeft een rechtstreekse invloed op onze verliezen. Hoe sneller we veranderen, hoe groter onze verliezen.

  Verliezen => opwarming van de kern

  Het veld dat gecreëerd wordt als $H$ nul is dan noemt met #keyterm[remanentie] $B_r$

  De veldsterkte die nodig is om de kern te ontmagnetiseren (om $B$ terug naar nul te brengen) noemen we #keyterm[coerciviteit] $H_c$.
]

== Hysterese bij verschillende materialen <sec:hysteresis-effect-op-verschillende-materialen>
#wrap-figure(
  image("assets/Hard VS soft met hystereiss.png", width: 8cm),
  caption: [Hard VS soft met hysteresis],
  label: <fig:Hard-VS-soft-met-hystereiss>,
)[

  Afhankelijk van het materiaal ga je een sterker of zwakker hysterese-effect hebben. Zache metalen hebben een smalle hysterese-lus, wat betekent dat ze minder energie verliezen bij elke magnetisatiecyclus.

  $=>$ ideaal voor transformatoren en elektromagneten die continu worden gebruikt, omdat ze efficiënter zijn en minder warmte genereren.
]

Afhankelijk van het type materiaal dat je gebruikt zijn er ook veranderingen.

+ *Carbon steel:* sterke staal carbon infused.
+ *Silicon steel:* staal met een beetje siliconen erin, wat de elektrische weerstand verhoogt en de verliezen vermindert.

== Alles samen: het vervangingsschema <sec:alles-samen-equivalent-schema>

#wrap-figure(
  image("assets/Equivalent schema.png", width: 10cm),
  caption: [Equivalent schema],
  label: <fig:Equivalent-schema>,
)[

  Je ziet dat je vreemde pieks krijgt in de stroom $i_phi$.

  Dit komt door:
  - Hysterese
  - Verzadiging van de kern


  Dus deze pieks zijn een gevolg van de niet-ideale eigenschappen van de transformator, met name de niet-lineaire BH-curve en het hysterese-effect van het kernmateriaal.

  Herinner je wanneer we actief power hebben

  $ P = V dot I cos(phi_V - phi_I) $

  Nu in de figuur zie je dat de stroom een faseverschuiving heeft ten opzichte van de spanning.
  Een ideale transformator zou een faseverschuiving van 0 graden hebben waarbij $v(t)$ in sync (of in fase) is met $i(t)$ Dat noemt de #keyterm[Fundamentele component] van de stroom.

]
Je ziet het hier getekend in gestreept blauw.
#figure(
  image("assets/fundamenteel component.png", width: 7cm),
  caption: [fundamenteel component],
  label: <fig:fundamenteel-component>,
)

== Excitatiestroom en impedantie <sec:exciting-current-en-impedantie>

#wrap-figure(
  image("assets/Transformator-reël circuit.png", width: 7cm),
  caption: [Transformator-reël circuit],
  label: <fig:Transformator-reël-circuit>,
)[

  Nu herinner je dat we om onze losses voor te stellen dat we in parallel met onze ideale transformator een weerstand $R_c$ en $L_m$ hebben gezet. Het probleem is dat zoals gezien in de vorige figuur dat $I_phi$ moeilijk is om te modelleren dus we gaan het opsplitsen in $I_m$ en $I_c$.

  We gaan die vinden door:
  - meten van $P_(l o s s) => R_c$
  - meten van de RMS _average_ van $I_phi$ => $L_m$


]

*Phasor diagram van de exciting current $I_phi$*

#figure(
  image("assets/Phasor excitising current.png", width: 7cm),
  caption: [Phasor excitising current],
  label: <fig:Phasor-excitising-current>,
)
Met:

$I_c$ *Core-verlies stroom:* de component die de hysteresis en eddy-current (wervelstroom) verliezen in de kern vertegenwoordigt. Deze staat in fase met de spanning $V_1$. $I_c = frac(V_1, R_c)$

$I_m$ *Magnetisatiestroom:* de component die nodig is om de magnetische flux in de kern op te wekken (door de finite permeabiliteit). Deze ijlt $90^circle$ na op de spanning $V_1$. $I_m = frac(V_1, omega L_m)$

== Wervelstromen <sec:eddy-currents>

Eddy currents hebben we al deels gezien in _elektriciteit_
Het is de stroom die ontstaat wanneer een geleider in een veranderlijk magnetisch veld wordt geplaatst.

#figure(
  image("assets/eddy-current.png", width: 5cm),
  caption: [Eddy current],
  label: <fig:eddy-current>,
)

$ P_("loss") = integral_v arrow(j) dot arrow(E) d v ~ E^2 ~ B^2 f^2 $

Met $arrow(j) = sigma arrow(E)$

=== Wervelstroomrem <sec:eddy-current-break>



#wrap-figure(
  image("assets/Eddy-current breaks.png", width: 5cm),
  caption: [Eddy-current breaks],
  label: <fig:Eddy-current-breaks>,
)[

  Hoe een elektrisch veld geïnduceerd wordt in een geleider. Een geleider wilt geen veranderingen in zijn status rond een magnetisch veld $arrow(B)$. Het is de verandering die een magnetisch veld gaan induceren in de Omgekeerde richting van het veranderend magnetisch veld $arrow(B)$.
]



Om dit magnetisch veld te induceren moet er een stroom $I$ gaan lopen in de geleider. Deze stroom noemen we de Eddy current. Door deze stroom krijgen we *Losses* $P_("loss") = I^2 R$

Hieronder een voorbeeld door de losses afhankelijk van het magnetische veld $B$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    plot.plot(
      size: (6, 4),
      x-label: [$B$ (T)],
      y-label: [Specific iron loss (W/kg)],
      x-tick-step: 0.5,
      y-tick-step: 0.2,
      x-min: 0,
      x-max: 2,
      y-min: 0,
      y-max: 2,
      x-grid: true,
      y-grid: true,
      {
        plot.add(
          label: [M-5 steel],
          style: (stroke: schoolBlue + 1.5pt),
          mark: "o",
          mark-size: 0.1,
          (
            (0, 0),
            (0.2, 0.03),
            (0.4, 0.08),
            (0.6, 0.15),
            (0.8, 0.25),
            (1.0, 0.38),
            (1.2, 0.55),
            (1.4, 0.78),
            (1.6, 1.05),
            (1.8, 1.55),
            (1.9, 1.92),
          ),
        )
        plot.add(
          label: [23ZDKH90 steel],
          style: (stroke: schoolRed + 1.5pt),
          mark: "s",
          mark-size: 0.1,
          (
            (0, 0),
            (0.2, 0.01),
            (0.4, 0.05),
            (0.6, 0.1),
            (0.8, 0.18),
            (1.0, 0.28),
            (1.2, 0.42),
            (1.4, 0.58),
            (1.6, 0.78),
            (1.8, 1.05),
            (1.9, 1.35),
          ),
        )
      },
    )
  })
]

== Wikkelingsverliezen <sec:windingen-verliezen>


Nu hebben we alle niet ideale delen van de transformator core gedaan. Nu gaan we over naar alle *Niet-ideale delen van de windingen*.

=== Lekflux <sec:leakage>

We nemen aan dat alle magnetische flux $phi$ binnen de kern blijft maar nu gaan we aannemen dat niet alle magnetische flux $phi$ door de windingen gaat.

Dan krijg je lekking van je windingen en dit veroorzaakt een extra verlies in de transformator.

#figure(
  image("assets/Winding losses.png", width: 7cm),
  caption: [Flux-verliezen],
  label: <fig:Winding-losses>,
)

Dit noemen we #keyterm[Leakage flux] $phi_(sigma, 1)$.

We gaan onze flux $phi$ opsplitsen in twee delen. Een #keyterm[Main flux] en een #keyterm[Lek flux]. Deze flux wordt niet doorgegeven aan de andere windingen.

#figure(
  image("assets/Leakage flux.png", width: 12cm),
  caption: [Leakage flux],
  label: <fig:Leakage-flux>,
)

=== Serieweerstanden

#wrap-figure(
  image("assets/Series resisitentie.png", width: 7cm),
  caption: [Series resistentie],
  label: <fig:Series-resistentie>,
)[
  Niet alleen de flux lekt: ook de geleider zelf is niet perfect. De wikkelingen zijn meestal van koper, en koper heeft weerstand.

  Modelleren doe je dat met één extra weerstand per wikkeling: $R_1$ aan de primaire en $R_2$ aan de secundaire zijde.

  Die weerstanden veroorzaken de #keyterm[koperverliezen] $I^2 R$. Ze lopen op met het kwadraat van de stroom, dus ze hangen aan de #strong[belasting] en niet aan de spanning. Dat is waarom de kortsluitproef ze meet en de nullastproef niet.
]

=== Totale serie-impedantie <sec:totale-series-impedantie>
Als we ze allemaal samenvoegen krijgen we onze totale series impedantie.

#figure(
  image("assets/Totale-series impedantie.png", width: 8cm),
  caption: [Totale-series impedantie],
  label: <fig:Totale-series-impedantie>,
)

Dus onze $V_1$ en $V_2$ worden dan:
$ V_1 = R_1 dot I_1 + j omega L_1 + E_1 $
$ V_2 = R_2 dot I_2 + j omega L_2 + E_2 $

Met E de spanning over de ideale transformator, met de ratio's tussen $E_1$ en $E_2$ gegeven door de winding verhouding $N_1$ en $N_2$.

$ E_1 / E_2 = N_1 / N_2 $

=== De volledige reële transformator <sec:full-reële-transformator>
We kunnen nu alles samensteken. Dus all onze verliezen van onze core en onze windingen.

Dit is:

- *Core-verliezen* (Parallel tak)
  - Flux verliezen door hysteresis en eddy currents in de kern => $R_c$
  - Magnetisatiestroom nodig voor de opbouw van de flux (finite permeabiliteit) => $L_m$
- *Winding verliezen* (Serie tak)
  - Ohmse verliezen door de weerstand van de wikkelingen => $R_1$ en $R_2$
  - Lekverliezen door flux die niet beide wikkelingen koppelt (lek-inductanties) => $L_1$ en $L_2$


#figure(
  image("assets/full reële transformer.png", width: 12cm),
  caption: [full reële transformer],
  label: <fig:full-reële-transformer>,
)

Je krijg met alle phasors samen dan dit phasor diagram:

#figure(
  image("assets/Phasor diagram total reël transformator.png", width: 8cm),
  caption: [Phasor diagram total reël transformator],
  label: <fig:Phasor-diagram-total-reël-transformator>,
)

=== Vervangingsschema <sec:equivalent-schema>

Nu hebben we een reël schema gemaakt die alle verliezen tonen van de transformator.

Als laatste willen we nog graag ons symbool van de transformator wegdoen.

==== Primary side <sec:primary-side>

We weten van het deel *Ideale transformator* dat we de secundaire _Rechter kant_ kunnen linken aan de primaire _Linker kant_.

We brengen eigenlijk de secundaire kant naar de primaire kant door de fouten van de weerstanden en inducties naar de primaire kant te transformeren.
De fracties tussen $N_1$ en $N_2$ komen dan terug in het spel.


#concept(title: "Linking van weerstanden, impedantie en voltage")[

  $ R'_2 = (N_1/N_2)^2 R_2 $
  $ L'_2 = (N_1/N_2)^2 L_2 $
  $ V'_2 = (N_1/N_2) V_2 $

  De ' zegt dat we de primaire kant linken met de secundaire kant.

  #figure(
    image("assets/Getransformeerde schema met transformator.png", width: 10cm),
  )
  $ arrow.b.triple $

  #figure(
    image("assets/gesimplificeerd circuit.png", width: 10cm),
  )

  #examenbox[Dit ga je veel toepassen in oefeningen, vergeet niet je weerstanden en inducties te transformeren!]

  Exact hetzelfde kan gedaan worden voor de secundaire kant waarbij de weerstanden en inducties worden getransformeerd naar de secundaire kant.

  De core verliezen van hysteresis $R_c$ en de BH-curve $L_m$ worden ook getransformeerd => $R''_c$ en $L''_m$

  We tonen de getransformeerde impedanties met ''

  $ R''_1 = (N_2/N_1)^2 R_1 $
  $ L''_1 = (N_2/N_1)^2 L_1 $
  $ R''_c = (N_2/N_1)^2 R_c $
  $ L''_m = (N_2/N_1)^2 L_m $

  #figure(
    image("assets/Secundaire kant.png", width: 10cm),
  )

  #figure(
    image("assets/gesimplificeerd circuit secundair.png", width: 10cm),
  )
]

=== Metingen <sec:metingen>

Dit zijn metingen die we maken en testen die we doen op transformator circuits.

==== Nullastproef <sec:no-load-test>

Bij deze test gaat de stroom naar de ideale transformator gelijk zijn aan nul

$ I'_2 = 0 $
Dat betekent geen spanningval over de impedantie van de secundaire kant en dus is

$ E'_1 = V'_1 $

Als we dan zeggen dat onze weerstand in parallel veel groter is dan de weerstanden in serie $L_1$ en $R_1$:

$ Z_phi >> |R_1 + j X_1_sigma,1| $

#markhl[Dan is de ideale voltage $E_1 approx V_1$]


#figure(
  image("assets/No-Load test.png", width: 10cm),
  caption: [No-Load test],
  label: <fig:No-Load-test>,
)

nu Wat zijn dan onze waarden van $R_c$ en $L_m$?

Dit is de *Null-last proef*

#wrap-figure(
  image("assets/Nullast proef.png", width: 8cm),
  caption: [Nullast proef],
  label: <fig:Nullast-proef>,
)[

  We gaan deze meestal toepassen aan de lage voltage kant -> primaire kant.

  We willen drie dingen:
  - $V_1$ de voltage op de primaire kant
  - $I_0$ _No load current_ de excitation current $I_phi + I_1$ maar $I_1 approx 0$ dus $I_0 approx I_phi$
  - $P_0$ dan kunnen we de hoek $cos(phi_0) = P_0 / (V_1 dot I_0)$ berekenen

  We meten de voltage, de stroom en de wat met een wattmeter.
]

#align(center)[
  #grid(
    columns: 2,
    gutter: 1cm,
    figure(
      image("assets/Circuit no-lod.png", width: 6cm),
      caption: [Meetschema van de nullastproef],
      label: <fig:Circuit-no-load>,
    ),
    figure(
      image("assets/Phasor no-load.png", width: 5cm),
      caption: [Fasordiagram: $I_c$ in fase met $V_1$, $I_m$ er $90 degree$ achter],
      label: <fig:Phasor-no-load>,
    ),
  )
]

Uit de twee meetwaarden volgen de twee dwarstakelementen.

Het gemeten vermogen is puur ijzerverlies, want er loopt nauwelijks stroom door de wikkelingen. Daaruit haal je $R_c$:

$ P_0 = V_1^2 / R_c quad arrow.r.double quad R_c = V_1^2 / P_0 $

De gemeten stroom $I_0$ splitst in een verliescomponent $I_c$ in fase met de spanning, en een magnetiserende component $I_m$ die er $90 degree$ op achterloopt. Met Pythagoras haal je $I_m$ eruit, en daarmee $L_m$:

$ I_m = sqrt(I_0^2 - I_c^2) quad arrow.r.double quad omega L_m = V_1 / I_m $

met:
- $P_0$: gemeten vermogen bij nullast [W]
- $V_1$: aangelegde nominale spanning [V]
- $I_0$: gemeten nullaststroom [A]
- $I_c$: verliescomponent, $I_c = P_0 \/ V_1$ [A]
- $I_m$: magnetiserende component [A]

== Kortsluitproef <sec:short-circuit-test>
Deze test wordt gebruikt om de *serie-elementen* van het equivalent schema te bepalen ($R_(e q)$ en $X_(e q)$).

*Methodiek:*
- De *lage spanning (LV) zijde* wordt kortgesloten.
- De metingen gebeuren aan de *hoge spanning (HV) zijde* (omdat de stroom daar lager en dus makkelijker te meten is).
- Met een variac wordt de spanning $V_(s c)$ langzaam verhoogd totdat de *nominale stroom* ($I_(1,n o m)$) door de wikkelingen loopt.

*Aannames:*
1. *Core-verliezen zijn verwaarloosbaar:* Omdat $V_(s c)$ veel kleiner is dan de nominale spanning (vaak slechts 2% tot 10%), is de magnetische flux in de kern zeer laag. De core-verliezen ($P_c$) in $R_c$ zijn daardoor zo klein dat we ze negeren.
2. *Parallelle tak wordt genegeerd:* $Z_phi$ is veel groter dan de serie-impedantie bij deze lage spanning.
  $ => I_1 approx I'_2 $

#figure(
  image("assets/Short-circuit test.png", width: 12cm),
  caption: [Short-circuit test schema],
  label: <fig:Short-circuit-test>,
)

#wrap-figure(
  image("assets/Process resultaat.png", width: 6cm),
  caption: [Resultaat van de meting],
  label: <fig:Process-resultaat>,
)[
  We meten drie waarden: $V_(s c)$, $I_(n o m)$ en $P_(s c)$.
  - $P_(s c)$ staat gelijk aan de *Winding verliezen* (Ohmse verliezen) bij vollast.

  *Berekeningen:*
  $ R_(e q) = P_(s c) / I_(1,n o m)^2 $
  $ Z_(e q) = V_(s c) / I_(1,n o m) $
  $ X_(e q) = sqrt(Z_(e q)^2 - R_(e q)^2) $

  Vaak wordt aangenomen dat de lekreactantie gelijk verdeeld is over de primaire en secundaire kant:
  $ X_1 approx X'_2 approx X_(e q) / 2 $
]

Deze test is zo belangrijk en je ziet het vaak terug op datasheets van een transformator.

$ u_(s c) "of" u_(k) "voor K kortsluiting" $
$ => Z_(s c) = frac(v_(1,"nom"), i_(1,"nom")) dot u_(s c) $

#voorbeeld(title: "Wat betekenen deze waarden in de praktijk?")[
  De kortsluitproef helpt ons twee kritieke dingen te begrijpen:

  1. *Interne Impedantie:* $V_{s c}$ (of $u_{s c}$) is de spanning die nodig is om de *nominale* stroom te laten lopen door de interne weerstand van de spoelen. Hoe lager deze waarde, hoe "beter" (efficiënter) de transformator, maar hoe hoger de foutstroom zal zijn.
  2. *Foutstroom ($I_(s c)$):* Dit is de stroom die effectief gaat lopen als er een échte kortsluiting optreedt terwijl de transformator op volle netspanning staat.

  *Gegeven*\
  $u_(s c) = 5%$ (De transformator heeft 5% van zijn spanning nodig om zijn nominale stroom te bereiken bij kortsluiting).\
  $V_(1,"nom") = 400 V$\
  $I_(1,"nom") = 10 A$

  *Gevraagd: Wat is de maximale stroom bij een fout?*\
  $ I_(s c) = frac(I_(1,"nom"), u_(s c)) = frac(10 A, 0.05) = 200 A $

  *Conclusie:*
  - De *test* gebeurt bij een lage spanning ($V_(s c) = 20 V$) om veilig de nominale stroom ($10 A$) te meten.
  - De *werkelijkheid* bij een fout is dat er $200 A$ (20x de nominale stroom!) gaat lopen omdat de bron $400 V$ blijft leveren. Je beveiliging (zekering) moet dus deze $200 A$ kunnen afschakelen.
]


#voorbeeld(title: "Berekening Kortsluitimpedantie")[
  *Gegeven: Rating van een transformator*\
  - $V_1 / V_2 = 10 "kV" / 400 V$
  - $S = 100 "kVA"$
  - $u_(s c) = 5%$

  *Gevraagd 1: Schat de gecombineerde spanningsval over de serie-elementen ($R_1, X_(sigma,1), R'_2, X'_(sigma,2)$) bij nominale condities.*\
  *Oplossing:*\
  De nominale primaire stroom is:
  $ I_(1,"nom") = S / V_1 = (100.000 "VA") / (10.000 V) = 10 A $
  De spanningsval bij nominale stroom is $V_(s c)$:
  $ V_(s c) = u_(s c) dot V_(1,"nom") = #"0,05" dot 10.000 V = 500 V $
  De totale serie-impedantie $Z$ is dan:
  $ Z = V_(s c) / I_(1,"nom") = (500 V) / (10 A) = 50 Omega $

  *Gevraagd 2: Wat is de primaire stroom bij een effectieve kortsluiting op de secundaire kant (bij nominale primaire spanning)?*\
  *Oplossing:*\
  $ I_(s c) = I_(1,"nom") / u_(s c) = (10 A) / #"0,05" = 200 A $
]

== Samenvatting symbolen <sec:samenvatting-symbolen>

#theorie(title: "Overzicht van de gebruikte symbolen")[
  In oefeningen en datasheets worden vaak verschillende namen gebruikt voor dezelfde grootheden:

  - *Stroom:*
    - $I_phi, I_0$: Bekrachtigingsstroom / Nullaststroom (Exciting / No-load current)
    - $I_m$: Magnetisatiestroom (Magnetizing current)
    - $I_c, I_(F e)$: Ijzerverliesstroom (Core-loss / Iron-loss component)

  - *Vermogen:*
    - $P_c, P_(F e), P_0$: Ijzerverliezen / Nullastverliezen (Core / Iron / No-load losses)

  - *Impedantie:*
    - $R_(s,1), R_1$: (Primaire) serieweerstand (Series resistance)
    - $X_(sigma,1), X_(s,1), X_1$: (Primaire) lekreactantie (Leakage reactance)
    - $Z_(s c), Z_(e q)$: Kortsluitimpedantie (Short-circuit impedance)

  - *Spanning:*
    - $V_k, V_(s c)$: Kortsluitspanning in Volt $[V]$
    - $u_k, u_(s c)$: Kortsluitspanning in procent $[%]$
]

















