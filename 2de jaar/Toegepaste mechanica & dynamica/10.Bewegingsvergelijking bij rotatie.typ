#import "../../school-template.typ": *

= Bewegingsvergelijking bij rotatie rond vaste as <ch:beweging-bij-rotatie-vaste-as>


== Rotatie rond een vaste as

We hebben vorig hoofdstuk de formule gezien van de algemene rotatie vergelijking.

$ sum M_G = I_G alpha $

De som van alle momenten is gelijk aan het traagheidsmoment maal de hoekversnelling.

Bekijk de figuur hieronder:

#figure(
  image("assets/Rotatie rond O.png", width: 6cm),
  caption: [Rotatie rond O],
  label: <fig:Rotatie-rond-O>,
)

Wat is nu de rotatie van dit lichaam rond het vaste punt $O$?

We vertrekken van de algemene momentenvergelijking rond punt $O$ (uit vorig hoofdstuk):
$ sum M_O = -overline(y) m (a_G)_x + overline(x) m (a_G)_y + I_G alpha $

Aangezien het lichaam roteert rond de *vaste as* door $O$, beweegt het massamiddelpunt $G$ op een cirkel met straal $r_G$. De versnelling $arrow(a)_G$ heeft twee componenten:
- *Tangentiële* component: $r_G alpha$ (loodrecht op $arrow(r)_(G\/O)$)
- *Normale* component: $r_G omega^2$ (gericht naar $O$)

De normale component gaat *door* $O$, dus die levert geen moment op rond $O$. Enkel de tangentiële component draagt bij:
$
  sum M_O = I_G alpha + m dot underbrace(r_G alpha, a_"tangentieel") dot underbrace(r_G, "momentarm") = I_G alpha + m r_G^2 alpha
$

Nu passen we de #keyterm[stelling van Steiner] toe ($I_O = I_G + m r_G^2$):

$ sum M_O = I_G alpha + m r_G^2 alpha = (I_G + m r_G^2) alpha = I_O alpha $

#concept(title: "Waarom mag dit met Steiner?")[
  De stelling van Steiner zegt dat het traagheidsmoment rond een willekeurige as gelijk is aan het traagheidsmoment rond een *parallelle* as door het massamiddelpunt, plus $m d^2$:
  $ I_O = I_G + m r_G^2 $
  Hier is $r_G$ de afstand van $O$ tot $G$. Omdat de rotatie-as door $O$ parallel is aan de as door $G$ (beide loodrecht op het vlak), mogen we deze stelling toepassen. Dit laat ons toe de twee termen ($I_G alpha$ en $m r_G^2 alpha$) samen te voegen tot één enkel traagheidsmoment $I_O$.
]

We kunnen nu ook de momenten opstellen rond het punt $O$, maar alleen als $O$ een *vaste as* is:

#frm(
  "Rotatie rond vaste as",
  [
    $ sum M_O = I_O alpha $
  ],
  [
    waarbij $I_O$ het traagheidsmoment is rond de vaste rotatie-as door $O$, en $alpha$ de hoekversnelling.
  ],
)

Als je $M_G$ vindt kun je daarna $M_O$ berekenen.

== Translatievergelijkingen <sec:translatievergelijkingen-rotatie>

Stel je nu terug de translatievergelijkingen op voor het lichaam dat rond een vaste as roteert:

$ sum F_x = m (a_G)_x $
$ sum F_y = m (a_G)_y $

De versnelling van het massamiddelpunt is in dit geval (zoals we hierboven al zagen).

Inplaats van de vectoriele vergelijkingen op de x en y as de projecteren gaan we dat doen op de n (normale) en t (tangentiële) as.

$ sum F_n = m (a_G)_n = m r_G omega^2 $
$ sum F_t = m (a_G)_t = m r_G alpha $

Op deze manier projecteren we de krachten op assen die meedraaien met de rotatie. De assen zijn niet constant.

_Dit geef niet meer informatie gewoon een andere manier om te projecteren_

Waarom zou je dit doen? Bij een rotatiebeweging gaat het massacentrum ook draaien rond O dus het is soms handiger om G te projecteren op de n en t assen.
