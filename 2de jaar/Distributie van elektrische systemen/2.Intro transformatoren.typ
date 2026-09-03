// chapter1_inleiding.typ
// Eerste hoofdstuk - Inleiding
// Dit bestand wordt geladen via #include "chapters/chapter1_inleiding.typ"

#import "../../school-template.typ": *

= Infomatie Transformatoren

*Interresante eigenschappen transformator*

+ Je kunt bij wisselstroom de spanning veranderen met magnetische inductie.
+ Er is geen verbinding tussen netwerken. Het wordt volledig via magnetische velden overgedragen

#wrap-figure(
  image("assets/transformer.png", width: 6cm),
  caption: [transformer],
  label: <fig:transformer>,
)[
  Een transformator koppelt twee wikkelingen magnetisch, zonder elektrische verbinding ertussen. Daarmee verander je het spanningsniveau, en dat is wat een elektriciteitsnet mogelijk maakt.

  *Waar je ze tegenkomt*
  - transmissie van elektriciteit;
  - distributie van elektriciteit;
  - elektrische toepassingen en elektronica.

  *Waarom transformeren:*
  - *Efficiënter transport*: Bij hogere spanning vloeit er minder stroom voor hetzelfde overgedragen vermogen ($I = S / (sqrt(3) U)$). De jouleverliezen in de kabel dalen kwadratisch met de spanning: $P_"verlies" prop 1 / U^2$.
  - *Koperbesparing*: Dunnere kabels volstaan, wat tonnen aan koper en lichtere hoogspanningsmasten oplevert.
  - *Veiligheid*: Transport gebeurt op gevaarlijk hoge spanning (bv. $150 "kV" - 380 "kV"$), maar wordt lokaal getransformeerd naar veilige laagspanning ($400 "V" / 230 "V"$).
  - *Galvanische scheiding*: Geen direct elektrisch contact tussen het primaire en secundaire netwerk.
]

#figure(
  image("assets/Power Transformer.png", width: 6.5cm),
  caption: [Vermogenstransformator in een hoogspanningssubstation (bv. $150 "kV" arrow.r 33 "kV"$).],
  label: <fig:PowerTransformer>,
)

#voorbeeld(title: "Rekenvoorbeeld: Jouleverliezen bij transport op 33 kV vs 150 kV")[
  Gegeven een generatorstation dat $S = 240 "MVA"$ levert over een afstand van $38 "km"$.
  - Geleiderdoorsnede: $A = 616 "mm"^2$ ($d = 28 "mm"$), soortelijke weerstand $rho = #"0,0175" (Omega "mm"^2)/"m"$;
  - Totale kabelweerstand per fase: $R_"kabel" = #"1,08" Omega$;
  - Arbeidsfactor: $cos phi = 1$.

  *Optie 1: Transport direct op generatorspanning ($33 "kV"$)*
  $ I_"lijn" = frac(S, sqrt(3) dot U) = frac(240 "MVA", sqrt(3) dot 33 "kV") = 4199 "A" $
  $ P_"verlies" = 3 dot R_"kabel" dot I_"lijn"^2 = 3 dot #"1,08" Omega dot (4199 "A")^2 approx 57 "MW" quad (24 % "van het vermogen!") $
  $ Delta U_"lijn" = sqrt(3) dot R_"kabel" dot I_"lijn" approx 7850 "V" quad ("onbruikbaar grote spanningsval") $

  *Optie 2: Transport na opstaptransformatie naar $150 "kV"$*
  $ I_"lijn" = frac(240 "MVA", sqrt(3) dot 150 "kV") = 924 "A" $
  $ P_"verlies" = 3 dot #"1,08" Omega dot (924 "A")^2 approx #"2,76" "MW" quad (1.1 % "verlies") $

  #figure(
    image("assets/tabeltransmissie150kv.png", width: 6.5cm),
    caption: [Vergelijking van stroom en vermogensverlies bij $33 "kV"$ versus $150 "kV"$ transport.],
    label: <fig:tabeltransmissie150kv>,
  )

  Door de spanning met een factor $4.5$ te verhogen, dalen de transportverliezen met een factor $4.5^2 approx 20$!

  *Toepassingsgebieden van transformatoren:*
  - Energievoorziening: generatortransformatoren, transmissie ($380 "kV"$), distributietransformatoren ($10 "kV" / 400 "V"$);
  - Elektronica: geschakelde voedingen, netadapters;
  - Signaal- en datatransmissie: pulstransformatoren in ethernetinterfaces voor galvanische scheiding ($1.5 "kV"$ isolatiebarrière);
  - Meettechniek: stroom- en spanningstransformatoren (CT en PT).
]

#figure(
  image("assets/ethernet.png", width: 5cm),
  caption: [Ethernet pulstransformator voor galvanische ontkoppeling.],
  label: <fig:ethernet>,
)

== Constructie Transformatoren

#figure(
  image("assets/transformatie constructie.png", width: 10cm),
  caption: [Constructie van een transformator: gelamineerde ijzerkern met primaire en secundaire wikkelingen.],
  label: <fig:transformatieconstructie>,
)


#wrap-figure(
  image("assets/laminated.png", width: 3cm),
  caption: [laminated],
  label: <fig:laminated>,
)[
  De kern van een transformator bestaat uit dunne, onderling geïsoleerde staalplaatjes, met koperdraad eromheen gewikkeld.

  Die gelaagde opbouw is geen toeval. Een massief blok ijzer zou in de wisselende flux grote #keyterm[wervelstromen] (eddy currents) rond laten lopen, en die verwarmen de kern zonder iets nuttigs te doen. Door de kern in plaatjes te snijden en die van elkaar te isoleren, krijgen de wervelstromen geen groot rondgaand pad meer. Zie @sec:eddy-currents.
]

= Magnetische Circuits

== Magnetostatica
Dit stukje gaat over tijdinvariante dingen

=== Herhaling

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
  De wet van Ampère zegt dat het magnetisch veld rond een stroomdraad evenredig is met de stroom die erdoor loopt.

  Je berekent dat veld door een gesloten lus rond de draad te kiezen en $vec(B)$ langs die lus te integreren. Wat aan de rechterkant staat, is enkel de stroom die #strong[door] die lus heen gaat.

  De vorm van de lus kies je zelf. Neem er een waarlangs $B$ constant is, dan valt de integraal uiteen in $B$ maal de omtrek en kan je meteen naar $B$ oplossen.
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

=== De drie fundamentele magnetische grootheden: H, B en $Phi$

De werking van elk magnetisch circuit steunt op drie grootheden die elk een specifieke rol spelen:

+ *Magnetische veldsterkte $vec(H)$ [A/m]*: \
  Dit is de *oorzaak* van het magnetisme. Volgens de wet van Ampère wordt $vec(H)$ uitsluitend opgewekt door de elektrische stroom door de windingen:
  $ integral.cont_("lus") vec(H) dot dif vec(s) = I_"ingesloten" = N dot I $
  De veldsterkte $vec(H)$ is dus *onafhankelijk van het materiaal*.

+ *Magnetische fluxdichtheid $vec(B)$ [T] of [$"Wb/m"^2$]*: \
  Dit is het *fysische gevolg* in het medium.
  - In vacuüm: $vec(B)_0 = mu_0 vec(H)$ met $mu_0 = 4 pi dot 10^(-7) "H/m"$.
  - In een ferromagnetisch materiaal richten de microscopische atomaire dipolen (Weiss-domeinen) zich uit, waardoor het veld enorm wordt versterkt:
    $ vec(B) = mu_r mu_0 vec(H) = mu vec(H) $
  - Voor silicium-transformatorstaal geldt $mu_r >> 1$ (typisch $2000$ tot $5000$). Hierdoor dwingt de kern bijna alle magnetische veldlijnen om binnen het ijzer te blijven en is lekflux door de lucht minimaal.

#figure(
  image("assets/magnetischmateriaalmu.png", width: 6cm),
  caption: [Verband tussen veldsterkte $H$ (oorzaak) en fluxdichtheid $B$ (gevolg) via permeabiliteit $mu$.],
  label: <fig:magnetischmateriaalmu>,
)

+ *Totale magnetische flux $Phi$ [Wb] of [$"Vs"$]*: \
  De totale hoeveelheid veldlijnen die door de kernoppervlakte $A_c$ stroomt:
  $ Phi = integral_A vec(B) dot dif vec(A) = B dot A_c $

#figure(
  image("assets/termen.png", width: 12cm),
  caption: [Overzicht van magnetische grootheden, eenheden en wetmatigheden.],
  label: <fig:termen>,
)


== Magnetische circuits

#figure(
  image("assets/magnetische kring.png", width: 8cm),
  caption: [magnetische kring],
  label: <fig:magnetische-kring>,
)

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

  Wikkel je nu een tweede spoel rond dezelfde kern, dan ziet die dezelfde veranderende flux en wordt er ook in die spoel een spanning geïnduceerd. Dat is het principe van *de transformator*.
]

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
