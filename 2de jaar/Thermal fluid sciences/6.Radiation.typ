#import "../../school-template.typ": *

= Radiatie <ch:radiatie>


#TODO[VORIGE LES 5 INVULLEN]


== Zwarte oppervlaktes

#wrap-figure(
  image("Black oppervlaktes radiatie.png", width: 6cm),
  caption: [Black oppervlaktes radiatie],
  label: <fig:black-oppervlaktes-radiatie>,
)[


  $dot(Q)_(1->2) = "Radiatie weg van oppervlakte 1 naar 2" - "Radiatie weg van oppervlakte 2 naar 1"$

  $ => A_1 dot E_(b 1) dot F_(1->2) - A_2 dot E_(b 2) dot F_(2->1 $

  $ A_1 dot F_(1->2) = A_2 dot F_(2->1 $ reciprociteitswet

  $ E_b = sigma T^4 $ emissiviteit

  $ dot(Q) = A_1F_(1->2) sigma (T_1^4 - T_2^4) $

  Nu dit is alleen voor twee lichamen maar als we nu alle radiatie nemen is het gewoon de som

  $ dot(Q) = sum_(j=1)^N dot(Q)_(i->j) = sum_(j=1)^N A_i F_(i->j) sigma (T_i^4 - T_j^4) quad [W] $

]

=== Diffuse en grijze oppervlaktes (aannames) <sec:diffuse-grijze-oppervlaktes>

De meeste praktische omhullingen bevatten niet-zwarte oppervlakken, wat aanleiding geeft tot meerdere reflecties. Om de radiatie-analyse werkbaar te houden, worden de volgende aannames gemaakt:

- *Eigenschappen oppervlak:* De oppervlakken worden verondersteld *opaak*, *diffuus* en *grijs* te zijn.
- *Temperatuur:* Elk oppervlak is *isotherm*. Dus elk oppervlakte is even warm.
- *Straling:* Zowel de inkomende als de uitgaande straling zijn *uniform* over elk oppervlak. Dus de straling is overal gelijk.



== Radiosity

#concept(title: "Radiosity")[
  #wrap-figure(
    image("Radiosity.png", width: 5cm),
    caption: [Radiosity],
    label: <fig:Radiosity>,
  )[
    De *Radiosity ($J$)* is de totale hoeveelheid energie die een oppervlak per seconde per m² verlaat. Dit is de som van de eigen emissie en de reflectie:

    $J_i = "Emissie" + "Reflectie" = epsilon_i sigma T_i^4 + rho_i G_i$ $[W/m^2]$
  ]
]

== Netto Radiatie en Elektrische Analogie

De netto warmteoverdracht ($dot(Q)_i$) van een oppervlak is het verschil tussen de uitgaande straling ($J_i$) en de invallende straling ($G_i$):

$dot(Q)_i = A_i (J_i - G_i) quad [W]$

=== Oppervlakteweerstand (Surface Resistance)
We kunnen dit modelleren als een elektrisch circuit waarbij de warmtestroom de "stroom" is, en het verschil tussen de ideale zwarte straling ($E_(b i)$) en de radiosity ($J_i$) het "potentiaalverschil":

#figure(
  image("Resitentie van oppervlakte tegenover radiatie.png", width: 5cm),
  caption: [Resitentie van oppervlakte tegenover radiatie],
  label: <fig:resitentie-van-oppervlakte-tegenover-radiatie>,
)

#frm("Netto Radiatie", $dot(Q)_i = (E_(b i) - J_i) / R_i$, [
  Met de oppervlakteweerstand: $R_i = (1 - epsilon_i) / (A_i epsilon_i)$
])

*Belangrijke gevallen:*
- *Zwart lichaam:* Heeft een emissiviteit $epsilon = 1$, waardoor de weerstand $R_i = 0$ is.
- *Reradiating surface:* Een adiabatisch oppervlak ($dot(Q)_i = 0$). Hierbij is $J_i = E_(b i) = sigma T_i^4$.



=== Net radiatie tussen twee oppervlaktes

#wrap-figure(
  image("Netto radiatie tussen twee oppervlaktes.png", width: 5cm),
  caption: [Netto radiatie tussen twee oppervlaktes],
  label: <fig:netto-radiatie-tussen-twee-oppervlaktes>,
)[

  Hierbij is de weerstand tussen de twee objecten de view factor

  #frm[View factor][
    $R_(i j) = 1 / (A_i F_(i->j))$
  ][ met $F_(i->j)$ de view factor]

  Deze factor is puur gebasseerd op #keyterm[geometrie].

  Die R is de #keyterm[Space-resistentie].

  Je zoekt deze factoren op in een tabel

]


Nu wat gebeurt er als je opnieuw meerdere oppervlaktes hebt? Dan heb je een netwerk van weerstanden. Dit is een #keyterm[elektrisch circuit].

$
  dot(Q_i) = sum_(j=1)^N dot(Q)_(i->j) = sum_(j=1)^N (J_i - J_j) / R_(i j) = sum_(j=1)^N (J_i - J_j) / (A_i F_(i->j)) [W]
$

#examenbox[Op het examen ga je nooit meedere lichamen moeten oplossen want dat is te moeilijk]

#figure(
  image("Meedere oppervlaktes radiatie.png", width: 6cm),
  caption: [Meerdere oppervlaktes radiatie],
  label: <fig:Meedere-oppervlaktes-radiatie>,
)


=== Radiatie tussen twee gesloten oppervlakte omhulsel <sec:radiatie-tussen-twee-gesloten-oppervlakte-omhulsel>

In dit geval is het anders. Want de warmte kan nergens naar toe.

#figure(
  image("Radiatie tussen twee omsloten oppervlaktes.png", width: 15cm),
  caption: [Radiatie tussen twee omsloten oppervlaktes],
  label: <fig:Radiatie-tussen-twee-omsloten-oppervlaktes>,
)

Je hebt dus nog steeds warmteoverdracht $dot(Q)$. Maar alle radiatie gaan alleen tussen twee objecten zijn. Omdat de oppervlakken een gesloten systeem vormen, staan de drie weerstanden (2x oppervlakte + 1x ruimte) simpelweg *in serie*:

#frm(
  "Netto radiatie tussen twee oppervlakken",
  $
    dot(Q)_12 = (sigma (T_1^4 - T_2^4)) / ((1-epsilon_1)/(A_1 epsilon_1) + 1/(A_1 F_12) + (1-epsilon_2)/(A_2 epsilon_2))
  $,
  [De warmtestroom is het verschil in emissie gedeeld door de totale weerstand: $R_(t o t) = R_1 + R_12 + R_2$],
)

#examenbox[Je moet niet deze lange formule vanbuiten kennen, maar snappen dat je de drie weerstanden in serie moet optellen.]


=== Radiatie tussen kleine objecten in een groote omhulsel <sec:radiatie-tussen-kleine-objecten-in-een-groote-omhulsel>

#wrap-figure(
  image("Radiatie kleine objecten groot caviteit.png", width: 4cm),
  caption: [Radiatie kleine objecten groot caviteit],
  label: <fig:Radiatie-kleine-objecten-groot-caviteit>,
)[

  Nu is het gewoon heel simpel de wet van Stefan-Boltzmann

  $dot(Q) = epsilon A sigma (T_s^4 - T_("surr")^4) quad [W]$


  Je kunt misschien denken wat van de #keyterm[lucht?]. Meestal gaan we in thermo lucht bezien als een #keyterm[vacuüm].

  #examenbox[Als een oefening spreekt dat je de surrounding termperatuur moet berekenen moet je waarschijnelijk de radiatie formule gebruiken]

]

#examenbox[Zorg dat je weet wanneer je welke formule moet uitleggen]



== Radiatie schilden en effect van radiatie <sec:radiatie-schilden-en-effect-van-radiatie>

In de ruimte is er veel radiatie. Op aarde hebben we het #keyterm[magnetisch veld], lucht en water om ons te beschermen maar in de ruimte niet. Dus moeten we ons beschermen met radiatie schilden.

Wat we doen is enorm *dunne hoog reflecterende folies* (lage emissiviteit $epsilon$) tussen de objecten plaatsen.

Hoe meer we tussen plaatsen hoe hoger de resitencie en dus hoe minder warmte er overgedragen wordt. _Nu meer betekent ook zwaarder_

- *Werking:* Een stralingsschild voegt extra *weerstanden* toe aan het netwerk. Hoe lager de emissiviteit van het schild, hoe groter de weerstand en hoe lager de warmteoverdracht.
- *Toepassingen:*
  - *Multilayer insulation (MLI):* Veel lagen folie met vacuüm ertussen (ruimtevaart/cryogenie).
  - *Temperatuursensoren:* Voorkomt meetfouten door straling van nabijgelegen warme of koude wanden.

Wat je kunt opmerken als je een radiatieblanket aandooet is dat je het warmer krijgt. Dit komt omdat de #keyterm[radiatie] van je eigen lichaam terugkaatst en #keyterm[forced convectie] en #keyterm[conductie] tegenwerkt.
=== Formules voor stralingsschilden

Wanneer we een schild (oppervlak 3) tussen oppervlak 1 en 2 plaatsen, voegen we extra weerstanden toe:

#frm(
  "Eén stralingsschild",
  $dot(Q)_(12, "1 schild") = (A sigma (T_1^4 - T_2^4)) / ((1/epsilon_1 + 1/epsilon_2 - 1) + (1/epsilon_(3,1) + 1/epsilon_(3,2) - 1))$,
  [De noemer is de som van de weerstand zonder schild en de weerstand van het schild zelf.],
)

Voor $N$ schilden wordt de formule uitgebreid met de weerstanden van alle schilden tussen 1 en 2.

#frm(
  "N stralingsschilden",
  $
    dot(Q)_(12, N " schilden") = (A sigma (T_1^4 - T_2^4)) / ((1/epsilon_1 + 1/epsilon_2 - 1) + sum_(i=1)^N (1/epsilon_(i,1) + 1/epsilon_(i,2) - 1)) quad [W]
  $,
  [Elk schild voegt een extra weerstandsterm toe aan de noemer.],
)

#belangrijk[Speciaal geval: Gelijke emissiviteit]
Als alle oppervlakken (inclusief de schilden) dezelfde emissiviteit $epsilon$ hebben, vereenvoudigt dit aanzienlijk:

#frm(
  "N stralingsschilden (gelijke emissiviteit)",
  $dot(Q)_(12, N " schilden") = 1 / (N + 1) dot(Q)_(12, "geen schild") quad [W]$,
  [De netto warmtestroom daalt met factor $(N+1)$.],
)

== Effect van Radiatie op temperatuursmetingen

#TODO[Toevoegen]


== Radiatie uitwisseling en emitting van absorberende gassen.

#TODO[Toevoegen]

