// chapter1_inleiding.typ
// Eerste hoofdstuk - Inleiding
// Dit bestand wordt geladen via #include "chapters/chapter1_inleiding.typ"

#import "../../school-template.typ": *

= Infomatie Transformatoren

*Interresante eigenschappen transformator*

+ Je kunt bij wisselstromen de spanning veranderen met behulp van magnetische inductie.
+ Er is geen verbinding tussen netwerken. Het wordt volledig via magnetische velden overgedragen

#wrap-figure(
  image("assets/transformer.png", width: 6cm),
  caption: [transformer],
  label: <fig:transformer>,
)[

  *Toepassingen*
  - Transmissie van elektrischiteit
  - Distributie van elektrischiteit
  - Elektrische toepassingen
  - Elektronica
]


*Voorbeeld Transformer*

#figure(
  image("assets/Power Transformer.png", width: 5cm),
  caption: [Power Transformer],
  label: <fig:PowerTransformer>,
)

High voltage (e.g. 300 kV) $arrow.r.double$ medium voltage (e.g. 33 kV)

#voorbeeld(title: "Transform voltage")[
  *Generated:* 240 MVA ($S = 240 "MVA" = sqrt(3) dot 33 "kV" dot 4.22 "kA"$) @ 33 kV \
  *Transmission:* 150 kV, distance 38 km \
  *Assumptions:*
  - $A = 616 "mm"^2$ ($d = 28 "mm"$)
  - $cos phi = 1$
  - $rho = 0.0175 (Omega "mm"^2)/"m" arrow.r.double R_"cable" = 1.08 Omega$

  *Calculate Joule losses:* \
  Line voltage = 150 kV $<->$ 33 kV \
  $I_"transp"$ = 924 A $<->$ 4199 A \
  $ P_"loss" = 3 dot R_"cable" dot I^2_"line" prop 1 / V_"line"^2 arrow.r.double 2.76 "MW" (1%) <-> 57 "MW" (24%) $ \
  $V_"phase_drop"$ = 998 V (1%) $<->$ 4535 V (24%)

  #figure(
    image("assets/tabeltransmissie150kv.png", width: 5cm),
    caption: [tabeltransmissie150kv],
    label: <fig:tabeltransmissie150kv>,
  )
  Je ziet bij hogere spanningen heb je veel minder verlies: $P_"loss" = 57 "MW" arrow.r.double 2.76 "MW"$.

  Je kunt ook de kabel dikker maken om de weerstand te verlagen maar je spreekt over kilometer kabel dus het is het meer waard om met een transformator de spanning te verhogen.
]

*Transformatoren hebben veel voordelen*
+ Veiliger
+ Efficiënter
+ Goedkoper
+ Compact
+ Betrouwbaar


*Toepassingen Transformatoren*
- Power supplies
- Ethernet
  #figure(
    image("assets/ethernet.png", width: 5cm),
    caption: [ethernet],
    label: <fig:ethernet>,
  )
- Lab apparatuur

== Constructie Transformatoren

#figure(
  image("assets/transformatie constructie.png", width: 10cm),
  caption: [transformatie constructie],
  label: <fig:transformatieconstructie>,
)


#wrap-figure(
  image("assets/laminated.png", width: 3cm),
  caption: [laminated],
  label: <fig:laminated>,
)[
  Een transformator zijn gelaagde metale steel cores.
  waarbij er koperen draden worden gewikkeld rond die cores
]

= Magnetische Circuits

== Magnetostatica
Dit stukje gaat over tijdinvariante dingen

=== Vlug herhaling

#figure(
  image("assets/currentflow.png", width: 5cm),
  caption: [currentflow],
  label: <fig:currentflow>,
)
Een punt ($dot$) betekent dat de stroom naar je toe stroomt (uit het blad), een kruis ($X$) betekent dat de stroom van je af stroomt (in het blad).



#frm(
  "Maxwell vergelijkingen",
  table(
    columns: (auto, auto),
    inset: 10pt,
    stroke: none,
    align: horizon,
    [Gauss \ electr.], [$ integral.cont vec(E) dot dif vec(A) = q_"netto" / epsilon_0 $],
    [Gauss \ magn.], [$ integral.cont vec(B) dot dif vec(A) = 0 $],
    [Ampère\*], [$ integral.cont vec(B) dot dif vec(l) = mu_0 N I $],
    [Faraday- \ Lenz], [$ integral.cont vec(E) dot dif vec(l) = - N (dif Phi_B)/(dif t) $],
    text(
      style: "italic",
    )[Maxwell modified Ampère's law: $ integral.cont vec(B) dot dif vec(l) = mu_0 N I + mu_0 epsilon_0 N (dif Phi_E)/(dif t) $],
  ),
  "In dit vak zullen we vooral de wetten van Gauss en Ampère gebruiken",
)

#frm(
  "Ampère's wet",
  $integral.cont_("loop") vec(B) dot dif vec(s) = mu_0 i_("encl") = mu_0 N i$,
  [
    Magnetic field $arrow.l.r.double$ electric current \
    Magnetic permeability (vacuum): $ mu_0 = 4 pi dot 10^(-7) "H/m" $
    $N$ het aantal windingen
  ],
)

#wrap-figure(
  image("assets/wet van ampere.png", width: 4cm),
  caption: [wet van ampere],
  label: <fig:wetvanampere>,
)[
  De wet van ampere zegt dat het magnetisch veld rond een stroomdraad evenredig is met de stroom die erdoor gaat. Dit is in een loop
]
#voorbeeld(title: "Voorbeeld vinden magnetisch veld")[
  Stel we willen het magnetisch veld $B$ vinden op een afstand $r$ van een lange rechte draad waar een stroom $I$ doorheen loopt.

  1. *Kies een Ampère-lus*:
    We kiezen een cirkelvormige lus met straal $r$ rond de draad, omdat het magnetisch veld symmetrisch is.

  2. *Pas de wet van Ampère toe*:
    $ integral.cont vec(B) dot dif vec(s) = mu_0 I_"encl" $

  3. *Bereken de integraal*:
    Langs de cirkel is $B$ constant en wijst in de richting van de raaklijn (volgens de rechterhandregel). Dus $vec(B) dot dif vec(s) = B dif s$.
    $ integral.cont B dif s = B integral.cont dif s = B (2 pi r) $

  4. *Stel gelijk aan de stroom*:
    De ingesloten stroom $I_"encl"$ is gewoon $I$.
    $ B (2 pi r) = mu_0 I $

  5. *Los op voor $B$*:
    $ B = (mu_0 I) / (2 pi r) $
]

=== Magnetisch materiaal

*In vacuum is:*
$ arrow(B_0) = arrow(B_0) $

*Magnetisch materiaal:*
$ arrow(B) = arrow(B_0) + arrow(B_m) = (1-X_m) arrow(B_0) = mu_r arrow(B_0) $


- $B_0$: Veld door macroscopische stroom.
- $B_M$: Veld door microscopische dipolen.
- $chi_m$: Magnetische susceptibiliteit.
- $mu_r$: Relatieve permeabiliteit (versterkingsfactor).
- $mu_r$ is vaak afhankelijk van $B_0$.

Het magnetisch veld wordt versterkt door het materiaal.


#concept(title: "H magnetische veld sterkt")[

  #figure(
    image("assets/magnetischmateriaalmu.png", width: 5cm),
    caption: [magnetischmateriaalmu],
    label: <fig:magnetischmateriaalmu>,
  )
  $ arrow(H) = frac(arrow(B_0), mu_0) = frac(arrow(B), mu_r mu_0) = frac(arrow(B), mu) $
]

Laten we dit invoegen in de wet van ampere:

$ integral.cont_("loop") vec(H) dot dif vec(s) = i_("encl") = N dot i $

De magnetische veldsterkte $H$ is dus onafhankelijk van het materiaal ($mu_r$) en wordt enkel bepaald door de aangelegde stroom en de geometrie (lus).

#theorie(title: "Vocabulaire")[
  #figure(
    image("assets/termen.png", width: 12cm),
    caption: [termen],
    label: <fig:termen>,
  )
]


== Magnetische circuits

#wrap-figure(
  image("assets/magnetische kring.png", width: 5cm),
  caption: [magnetische kring],
  label: <fig:magnetische-kring>,
)[

  * Materiaal*
  $ B = mu H = mu_r mu_0 H $
  al hiervoor gedefiniëerd

  $mu_0 <<<< mu$
  dus we laten $mu$ buiten beschouwing

  * Wet van ampere*

  $ H l_c = N i $
  met $l_c$ de lengte van de kern

  * Magnetische flux*

  $ Phi = B A_C $
  met $A_C$ de doorsnede van de kern

]

=== De wet van Hopkinson

De magnetisch motorische kracht:

$ F = N i $

De magnetische reluctance:

$ R_m = frac(l_c, mu A_C) $

Dus we hebben de wet van ohm maar voor magnetische velden

$ F = Phi R_m $

Dit is analoog aan de wet van Ohm voor elektrische circuits ($U = I R$), waarbij:
- De magnetomotorische kracht $F$ (of MMF) de drijvende kracht is (analoog aan spanning $U$).
- De magnetische flux $Phi$ de "stroom" is (analoog aan stroom $I$).
- De reluctantie $R_m$ de weerstand tegen de flux is (analoog aan weerstand $R$).

#frm(
  "Wet van Hopkinson",
  $ F = Phi R_m $,
  [
    Magnetische variant van de wet van Ohm. \
    $F = N I$: Magnetomotorische kracht ($"MMF"$) in Ampère-windingen ($"A"$). \
    $Phi$: Magnetische flux in Weber ($"Wb"$). \
    $R_m$: Reluctantie (magnetische weerstand) in $"A/Wb"$ of $"H"^(-1)$.
  ],
)


#figure(
  image("assets/hopkinsonsVSohm.png", width: 10cm),
  caption: [hopkinsonsVSohm],
  label: <fig:hopkinsonsVSohm>,
)

*Magnetische circuit met Air-gap*
#wrap-figure(
  image("assets/magnetisch circuit met air gap.png", width: 7cm),
  caption: [magnetisch circuit met air gap],
  label: <fig:magnetisch_circuit_met_air_gap>,
)[
  De air gap heeft zijn eigen reluctantie
  $ R_g = frac(g, mu_0 A_g) $
  $ R_c = frac(l_c, mu_r mu_0 A_c) $
  dus net zoals bij klassieke circuits ga je meerdere weerstanden in *serie* of *parallel* zetten

  met
  $g$: de lengte van de air gap
  $A_g$: de doorsnede van de air gap
  $l_c$: de lengte van de core
  $A_c$: de doorsnede van de core
  $mu_r$: de relatieve permeabiliteit
  $mu_0$: de permeabiliteit van het vacuüm
]

#frm(
  "Relucantie lucht en core",
  $ R_m = frac(l_c, mu_r mu_0 A_c) + frac(l_g, mu_0 A_g) $,
  [
    $l_c$: lengte van de core \
    $mu_r$: relatieve permeabiliteit \
    $mu_0$: permeabiliteit van het vacuüm \
    $A_c$: doorsnede van de core \
    $l_g$: lengte van de air gap \
    $A_g$: doorsnede van de air gap
  ],
)

#figure(
  image("assets/relucantieinserie.png", width: 5cm),
  caption: [relucantieinserie],
  label: <fig:relucantieinserie>,
)


De bron zijn dan de wikkelingen die op je transformer gezet worden.

$ F = phi dot R_c = N_1 I_1 + N_2 I_2 + ... + N_n I_n = $


#figure(
  image("assets/magnetisch circuit met meerdere windingen.png", width: 10cm),
  caption: [magnetisch circuit met meerdere windingen],
  label: <fig:magnetisch-circuit-met-meerdere-windingen>,
)

=== Gekoppelde Flux
#concept(title: "Gekoppelde Flux (Flux Linkage)")[
  *Definitie:* De totale flux die effectief omsloten wordt door een winding.

  Het symbool is $lambda$ (lambda).
  - Flux linkage $lambda$ relateert aan een *winding*.
  - Flux $phi$ relateert aan de *kern*.

  *Flux linkage in winding 1:*
  $
    lambda_1 & = N_1 phi \
             & = N_1 (phi_1 + phi_2) \
             & = N_1 phi_1 + N_1 phi_2 \
             & = lambda_11 + lambda_12
  $

  *Flux linkage in winding 2:*
  $
    lambda_2 & = N_2 phi \
             & = N_2 (phi_1 + phi_2) \
             & = N_2 phi_1 + N_2 phi_2 \
             & = lambda_21 + lambda_22
  $

  *Terminologie:*
  - $phi_1$: Flux geproduceerd door stroom $i_1$.
  - $phi_2$: Flux geproduceerd door stroom $i_2$.
  - $lambda_11$: Gekoppelde flux in winding 1 door $i_1$ (Zelfinductie).
  - $lambda_12$: Gekoppelde flux in winding 1 door $i_2$ (Wederkerige inductie).
  - $lambda_21$, $lambda_22$: Analoog voor winding 2.

  *Opmerking:* Gekoppelde flux is relevant voor geïnduceerde spanning door een tijdsveranderende flux _(zie Faraday-Lenz)_.
]




=== Inductie

$ lambda_1 = N_1 (phi_1 + phi_2) = lambda_11 + lambda_12 $

$ = N_1 (N_1 i_1 R_1 + N_2 i_2 R_2) = N_1^2 i_1 R_1 + N_1 N_2 i_2 R_2 $

$
  markhl(frac(N_1^2, R_c), tag: #<L1>) i_1 + markhl(frac(N_1 N_2, R_c), tag: #<M12>) i_2
  #annot(<L1>, pos: left)[Zelfinductantie $L_1$]
  #annot(<M12>, pos: top)[Mutuele inductantie $M_12$]
$

Dit zijn de *Zelfinductantie* en de *mutuele inductantie* termen

$ lambda_1 = L_1 i_1 + M_12 i_2 $


== Geïnduceerde spanningen

Een in de tijd variërende magnetische flux zal een spanning induceren in de windingen. Deze veranderende flux creëert dus een elektrisch veld.

$ "Magnetische flux" => "elektrische veld" $


$ E M F [V] = integral.cont arrow(E) dot d arrow(l) = - frac(d phi, d t) $


#wrap-figure(
  image("assets/induced emf in magnetic circuit.png", width: 5cm),
  caption: [induced emf in magnetic circuit],
  label: <fig:induced-emf-in-magnetic-circuit>,
)[
  Je ziet dat de spanning evenredig is met de verandering van de flux. Dus als de flux constant is dan is de spanning 0.

  $ v = "EMF" = N frac(d phi, d t) $
  $ = frac(d lambda, d t) = frac(d(l i), d t) = L dot frac(d i, d t) $
]

Je kunt dan door windingen langs een kant een spanning induceren in de andere kant. Dit is het principe van *de transformator*.

$ v_1 = N_1 frac(d phi, d t) = L_1 frac(d i_1, d t) + M_12 frac(d i_2, d t) $

$ v_2 = N_2 frac(d phi, d t) = L_2 frac(d i_2, d t) + M_21 frac(d i_1, d t) $

$arrow.b.double$

$ frac(v_1, v_2) = frac(N_1, N_2) $

#frm("Spanningsverhouding", $ frac(v_1, v_2) = frac(N_1, N_2) $, [
  $v_1$ [V]: spanning op de primaire wikkeling \
  $v_2$ [V]: spanning op de secundaire wikkeling \
  $N_1$ [-]: aantal windingen op de primaire wikkeling \
  $N_2$ [-]: aantal windingen op de secundaire wikkeling
])

Dan krijg je een fractie van de spanningen. Je verhoging of verlaging van spanning is dus afhankelijk van de verhouding van de windingen.



#voorbeeld(title: "Simpel voorbeeld")[
  *Gegeven:* $N_1 = 1000$ windingen, $N_2 = 100$

  *Gevraagd:* fractie van de spanningen

  *Oplossing:*
  $ frac(v_1, v_2) = frac(N_1, N_2) = frac(1000, 100) = markhl(10, tag: #<fractie>) $
  #annot(<fractie>, pos: right)[fractie van de spanningen]
]


#theorie(title: "Terminologie In het Nederlands")[
  #columns(2)[
    - *MMK*, $cal(F) = N i$
      - Magnetomotorische kracht
      - $[A dot "windingen"]$
    - $cal(R)$
      - Reluctantie
      - $[A dot "windingen" / "Wb"]$
    - $lambda = N phi$
      - Gekoppelde flux
      - Spoelflux
      - $["Wb", "Vs"]$

    #colbreak()

    - *EMK*, $e$
      - Elektromotorische Kracht
      - $[V]$, volt
    - $L = N phi \/ i$
      - (Zelf)Inductantie
      - $[H]$, henry
    - $M_12 = N_1 phi \/ i_2$
      - Mutuele Inductantie
      - $[H]$, Henry
  ]

  - $N$ *windingen* in 1 wikkeling of spoel
]
