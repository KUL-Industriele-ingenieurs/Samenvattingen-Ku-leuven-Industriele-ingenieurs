#import "../../school-template.typ": *

= Absolute beweging

We hebben nu alles gedaan via de relatieve manier.
We kunnen dit nu ook doen op een *absolute* manier.

We hebben dan een *baancoördinaat* $s$ nodig om het punt op zijn baan de localiseren en een *oriëntatiehoek* $theta$ om de oriëntatie van de raaklijn te beschrijven. We kunnen dan ook heel simpel door af te leiden de snelheid en versnelling berekenen.

$ v = (d s) / (d t) $
$ a = (d v) / (d t) = (d^2 s) / (d t^2) $
$ omega = (d theta) / (d t) $
$ alpha = (d omega) / (d t) = (d^2 theta) / (d t^2) $

Met $v$ de snelheid en $a$ de versnelling


#figure(
  image("absolutemotion.png", width: 5cm),
  caption: [absolutemotion],
  label: <fig:absolutemotion>,
)
*Gegeven*\
$omega, alpha, r$

*Gevraagd*\
$v , a$

$ x = 2 r cos(theta) $

met kettingregel afleiden:

$ v = (d x) / (d t) = -2 r sin(theta) dot underbracket((d theta) / (d t), omega) = -2 r sin(theta) dot omega $
$arrow.b.double (d/(d t))$
$
  a = (d v) / (d t) = -2 r cos(theta) dot underbracket((d theta) / (d t), omega)^2 + 2 r sin(theta) dot underbracket((d^2 theta) / (d t^2), alpha)^2 = -2 r cos(theta) dot omega^2 + 2 r sin(theta) dot alpha^2
$

Deze formules beschrijven de absolute beweging van een punt.


== OR (Ogenblikkelijke rotatiepunt)
Een ogenblikkelijke rotatiepunt is een punt dat zich niet verplaatst. Dus als we dit punt kennen dan kunnen we rotatie en daarna snelheid van punten in relatie met dit OR berekenen.

In de vorige les zagen we deze formule voor relatieve beweging

$ v_B = v_A + omega times r_frac(A, B, style: "horizontal") $

Maar als zoeken eigenlijk het punt waarbij $v_A = 0$ zodat we minder moeten berekenen.

#voorbeeld(title: "voorbeeld OR")[

  #align(center)[
    #grid(
      columns: 2,
      rows: 1,
      figure(
        image("voorbeeld-OR-alt.png", width: 5.1cm),
        caption: [voorbeeld-OR-alt],
        label: <fig:voorbeeld-OR-alt>,
      ),
      figure(
        image("oplossingvoorbeeldOR.png", width: 3.5cm),
        caption: [oplossingvoorbeeldOR],
        label: <fig:oplossingvoorbeeldOR>,
      ),
    )
  ]
  *Gegeven*\

  $omega_(A B) = 9.81 ( r a d )/ s arrow.cw$\
  $arrow(v_B) = -4.25 m / s$\
  $arrow(v_A) = 2,45 m / s$\

  *Gevraagd*\
  $arrow(v_E)$\

  *Oplossing*\
  $ arrow(v_E) = arrow(v_B) + omega_(A B) crossproduct arrow(r_(frac(A, E, style: "horizontal"))) $
  $ arrow.b.double $
  $
    arrow(v_E) = -4.25 arrow(i) + underbracket((-9.81) arrow(k) crossproduct arrow(r_(frac(A, E, style: "horizontal"))) + 4.25 arrow(i), + 4.25 arrow(i))
  $
  $ arrow.b.double $
  $ v_E = 0 $

]


Je ziet dat $arrow(v_E)$ = $0$. Dit is ons OR. Dit punt gaat dus niet bewegen in onze omgeving. dit maakt onze formule hierboven veel makkelijker omdat een term wegvalt. Al de punten kunnen we aannemen dat ze een rotatie maken rond E.

Dit is alleen ogenblikkelijk geldig omdat punt E hierna terug gaat bewegen. Punt A en B gaan bewegen en dus de kruising van vectoren gaat ook verplaatsen.


== Manieren om OR te vinden
Hoe vindt je nu de OR?

#figure(
  image("Alle methodes OR.png", width: 6cm),
  caption: [Alle methodes OR],
  label: <fig:Alle-methodes-OR>,
)

Dit hangt af van oefening tot oefening maar alles hangt af van de vector van de snelheid en de rotatie. Onthoud dat rond een OR alle punten gaan roteren errond.


#TODO("Add oefening 1")\
#TODO("Add oefening 2")\
#TODO("Add oefening 3")\
#TODO("Add oefening 4")\

#examenbox("Het volgende is een examenvraag")\
#TODO("Examenvraag toevoegen")

