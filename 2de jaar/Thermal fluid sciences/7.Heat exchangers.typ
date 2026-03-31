#import "../../school-template.typ": *

= Heat exchangers <ch:heat-exchangers>

#wrap-figure(
  image("Heat exchanger.png", width: 8cm),
  caption: [Heat exchanger],
  label: <fig:heat-exchanger>,
)[



  Een heat exchanger is een manier om warmte over te dragen tussen twee fluïda.

  Je gaat een warmt en koud fluïdum laten apart stromen door een buis en het contactoppervlakte ertussen zal warmte $dot(Q)$ uitwisselen.

  Je hebt twee soorten heat exchanger:
  - / Parallel flow: De flow van het warm en koud fluïdum is in dezelfde richting. Best voor temperatuurs $T$ controle.
  - / Counter flow: De flow van het warm en koud fluïdum is in tegengestelde richting. Snellere warmteoverdracht $dot(Q)$.

  Counter flow is altijd sneller omdat de temperatuurverschil altijd groter is. Waarom zou je dan ooit parallel gebruiken? $=>$ Parallel geeft betere controle van het outgaanstemperatuur $T_("out")$. Ze hebben dus beide hun nut.
]


In dit deel gaan we ons vooral bezig houden met #keyterm[Counter-flow heat exchangers].

== Classificatie van Heat Exchangers

=== Compact heat exchangers
Een warmtewisselaar wordt als *compact* geclassificeerd als deze een zeer grote oppervlakte-dichtheid ($beta$) heeft per volume-eenheid:
#concept(title: "Compact criterium")[
  $beta > 700 m^2/m^3$
]

Een #keyterm[radiator] is een bekend voorbeeld waarbij het oppervlakte gemaximaliseerd wordt door vinnen.

#figure(
  image("Radiator.png", width: 5cm),
  caption: [Radiator: een typische compacte warmtewisselaar.],
  label: <fig:Radiator>,
)

=== Cross-flow
Bij cross-flow bewegen de twee fluïda *loodrecht* op elkaar. Dit wordt verder onderverdeeld in:
- *Unmixed flow:* Het fluïdum zit in aparte kanaaltjes (vinnen) en kan niet zijdelings mengen.
- *Mixed flow:* Het fluïdum kan vrij rond de buizen stromen en zich mengen in de breedte.

=== Printed Circuit Heat Exchanger (PCHE)
Dit is een extreem compacte vorm ($beta > 2500 m^2/m^3$) waarbij kanaaltjes van 1-3 mm chemisch worden geëtst in platen. De platen worden daarna op elkaar gestapeld en verbonden via *diffusion bonding*.

#figure(
  image("3D-print heat exchanger.png", width: 5cm),
  caption: [Core sectie van een PCHE.],
  label: <fig:3D-print-heat-exchanger>,
)

- *Voordelen:* 4 tot 6 keer kleiner en lichter dan normale heat exchangers. Zeer hoge druk (tot 500 bar), groot temperatuurbereik ($-250 degree C$ tot $900 degree C$).
- *Nadeel:* Hoog drukverlies en gevoelig voor verstoppingen (vereist zeer zuivere fluïda om de kanaaltjes van 0.5-2 mm open te houden).

=== Shell-and-tube heat exchangers

De meeste gebruikte heat exchanger in de industrie is de #keyterm[shell-and-tube heat exchanger].

#wrap-figure(
  image("Shell en tube heat exchanger.png", width: 8cm),
  caption: [Shell en tube heat exchanger],
  label: <fig:Shell-en-tube-heat-exchanger>,
)[
  Deze bevatten een groot aantal buizen (soms honderden) die in een *shell* (mantel) zijn geplaatst, met hun assen parallel aan die van de shell.

  De warmteoverdracht vindt plaats doordat de ene vloeistof door de buizen stroomt, terwijl de andere vloeistof buiten de buizen door de shell stroomt.
]


#wrap-figure(
  image("Verschillende types heat exchangers.png", width: 5cm),
  caption: [Verschillende types heat exchangers],
  label: <fig:Verschillende-types-heat-exchangers>,
)[

  Je hebt ook nog specifieke types warmtewisselaars voor bijzondere toepassingen:

  - *Regeneratieve warmtewisselaars:* Hierbij stromen het warme en koude fluïdum afwisselend door hetzelfde stroomgebied.
  - *Dynamic-type regenerator:* Maakt gebruik van een roterende trommel. Delen van de trommel passeren periodiek door de hete stroom (waarbij warmte wordt opgeslagen) en vervolgens door de koude stroom (waarbij de warmte weer wordt afgegeven).
  - *Condensor:* Een van de fluïda wordt afgekoeld en condenseert terwijl het door de warmtewisselaar stroomt.
  - *Boiler (Verdamper):* Een van de fluïda absorbeert warmte en verdampt volledig tijdens het proces.
]

=== Plate and frame heat Exchangers


#figure(
  image("Plate and frame heat exchanger.png", width: 5cm),
  caption: [Plate and frame heat exchanger],
  label: <fig:Plate-and-frame-heat-exchanger>,
)


Dat zijn ongeveer alle soorten warmtewisselaars. Maar hoe kunnen we nu de performance van deze berekenen. Herinner je dat de fluida volledig afgesloten zijn van elkaar.


== Heat transfer coëfficiënt


#wrap-figure(
  image("Heat transfer coefficient.png", width: 5cm),
  caption: [Heat transfer coefficient],
  label: <fig:Heat-transfer-coefficient>,
)[
  Eerst wordt de warmte aan de muur overgegeven via #keyterm[convectie] en daarna door de muur via #keyterm[conductie].

  _Radiate wordt in de coëfficienten van convectie gestoken_


  $ R = R_("total") = R_i + R_("wall") + R_o = 1/(h_i A_i) + frac(ln(D_o/D_i), 2 pi k L) + 1/(h_o A_o) $

  We kunnen dit herleiden naar een totale coëfficiënt $U$:

  $ dot(Q) = (Delta T) / R = U A Delta T $
]

#concept(title: "Dominante weerstand")[
  De totale warmteoverdrachtscoëfficiënt $U$ wordt altijd *gedomineerd door de kleinste convectiecoëfficiënt*.

  Als bijvoorbeeld $h_i << h_o$, dan is $1/h_i >> 1/h_o$. De thermische weerstand aan de binnenzijde is dan veel groter, waardoor $U approx h_i$.
]

Dit fenomeen zie je vaak bij warmtewisselaars tussen een *gas* en een *vloeistof*. Omdat gassen een veel lagere $h$ hebben dan vloeistoffen, vormen zij de beperkende factor.

#belangrijk[Gebruik van vinnen (fins)]
Om de warmteoverdracht te verbeteren, worden *vinnen* geplaatst aan de zijde met de kleinste $h$ (meestal de gas-zijde). Dit vergroot het oppervlak $A$, waardoor het product $U A$ (en dus de totale $dot(Q)$) toeneemt.


#figure(
  image("Heat transfer coëfficient uitgelegt.png", width: 12cm),
  caption: [Heat transfer coëfficient uitgelegd],
  label: <fig:Heat-transfer-coëfficient-uitgelegt>,
)



#examenbox[Bekijk de voorbeelden in de slides voor extra uitleg.]



== Corrossie

De rede dat je parallel flow zou willen gebruiken is #keyterm[corrossie]. Corrosie gaat meer weerstand geven en dus de warmteoverdracht $dot(Q)$ verlagen.

We noemen corrosie die opbouwt in heat exchangers #keyterm[fouling].


== Analyse van Heat exchanger
We hebben nu wat info over de coëfficient maar hoe gaan we nu heat exchangers #keyterm[designen?]


Er zijn een paar belangrijke factoren:

- warmte capaciteit $C = m dot(c_p)$


Uiteindelijk komen we deze formule uit

#frm[warmteoverdracht van een heat exchanger][
  $ dot(Q) = dot(m_c) c_p (T_("c,out") - T_("c,in")) = dot(m_h) c_p (T_("h,in") - T_("h,out")) $

  $ dot(Q) = C_C (T_("h,in") - T_("c,in")) = C_h (T_("h,in") - T_("c,in")) $
][

  met $dot(m)$ de massaflow, $c_p$ de soortelijke warmte, $T_("out")$ de uitgaande temperatuur en $T_("in")$ de ingaande temperatuur.
  c: cold en h: hot.
]


#figure(
  image("Warmteoverdracht.png", width: 5cm),
  caption: [Warmteoverdracht],
  label: <fig:Warmteoverdracht>,
)


Nu wat is de warmteoverdracht $dot(Q)$ voor condenserende of verdampende fluïda?

$ dot(Q) = dot(m)dot h_(f g) $
$h_(f g)$ kun je in een tabel vinden.

Nu wat is het gemiddelde warmteoverdracht want het verschilt zoveel afhankelijk van de waar in de heat exchanger dat je zit. We gaan dus een gemiddelde nemen. Dit noemen we de #keyterm[Log Mean Temperature Difference (LMTD)].

== Log Mean Temperature Difference (LMTD)

Met deze methode gaan we de warmteoverdracht berekenen door een gemiddelde te nemen van de temperatuurverschillen aan de in en uitgang van de heat exchanger.

#TODO[Info slides toevoegen]


