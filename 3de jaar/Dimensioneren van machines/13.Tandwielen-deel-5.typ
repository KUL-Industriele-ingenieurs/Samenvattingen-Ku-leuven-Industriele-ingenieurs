#import "../../school-template.typ": *

= Tandwielen deel 5 <ch:tandwielen-5>

// Bron: Slides/13.DIMA_Lecture13_NL_v1.pdf (Roloff/Matek H20 & H21) + bordbewijs les 13

#TODO[Tandwielpaar: drukhoek en asafstand (slides 3–17)]

== Ingrijpquotiënt berekenen <sec:ingrijpquotient-berekenen>

Het ingrijpquotiënt $epsilon = |A E| slash p_b$ (@sec:normalisatie) hangt alleen af van $z_1$, $z_2$ en de drukhoek $alpha$. Je berekent $|A E|$ met rechthoekige driehoeken op de ingrijplijn $T_1 T_2$.

#figure(
  image("assets/L13-ingrijpquotient.png", width: 100%),
  caption: [Op schaal getekend met $z_1 = 16$, $z_2 = 24$ en $alpha = 20 degree$. Basiscirkel gestreept, steekcirkel streep-punt, kopcirkel gestippeld. Rood is de ingrijpweg $A E$, paars de basissteek $p_b$. Gemeten: $|A E| = 4.577 m$ en $p_b = 2.952 m$, dus $epsilon = 1.550$, net als met de formule.],
) <fig:L13-ingrijpquotient>

De ingrijplijn raakt de basiscirkels in $T_1$ en $T_2$ en gaat door de pool $C$. In $A$ snijdt de kopcirkel van wiel 2 de ingrijplijn en begint het contact. In $E$ snijdt de kopcirkel van wiel 1 de ingrijplijn en stopt het contact.

*1. $|A E|$ opsplitsen.* $T_1 E$ en $T_2 A$ overlappen precies over $A E$:

$ |A E| = |T_1 E| + |T_2 A| - |T_1 T_2| $

*2. $|T_1 E|$ met Pythagoras* in $triangle O_1 T_1 E$. De hoek in $T_1$ is recht, want de ingrijplijn raakt de basiscirkel. De schuine zijde is de kopstraal $r_(k 1) = m z_1 slash 2 + m$, want de kophoogte is $m$. De rechthoekszijde is de basisstraal $r_(b 1) = (m z_1 slash 2) cos alpha$:

$ |T_1 E| = sqrt(r_(k 1)^2 - r_(b 1)^2) = sqrt((m^2 z_1^2) / 4 + m^2 z_1 + m^2 - (m^2 z_1^2) / 4 cos^2 alpha) $

Met $1 - cos^2 alpha = sin^2 alpha$ en $m$ buiten de wortel:

$ |T_1 E| = m sqrt((z_1^2 sin^2 alpha) / 4 + z_1 + 1) $

*3. $|T_2 A|$* volgt op dezelfde manier uit $triangle O_2 T_2 A$:

$ |T_2 A| = m sqrt((z_2^2 sin^2 alpha) / 4 + z_2 + 1) $

*4. $|T_1 T_2|$ splitsen in $C$.* In $triangle O_1 T_1 C$ is $|O_1 C| = r_1$ en is de hoek in $O_1$ gelijk aan $alpha$. Dus $|T_1 C| = r_1 sin alpha$ en op dezelfde manier $|C T_2| = r_2 sin alpha$:

$ |T_1 T_2| = (r_1 + r_2) sin alpha = m (z_1 + z_2) / 2 sin alpha $

*5. Basissteek.* De ingrijplijn wikkelt af van de basiscirkel zoals een touw. Twee opeenvolgende flanken liggen daardoor op de ingrijplijn even ver uit elkaar als op de basiscirkel:

$ p_b = (pi d_(b 1)) / z_1 = pi m cos alpha $

*6. Samenvoegen.* Stap 2 tot 5 invullen in $epsilon = |A E| slash p_b$. De modulus $m$ valt weg:

#frm(
  "Ingrijpquotiënt uit de tandaantallen",
  $ epsilon = (sqrt((z_1^2 sin^2 alpha) / 4 + z_1 + 1) + sqrt((z_2^2 sin^2 alpha) / 4 + z_2 + 1) - (z_1 + z_2) / 2 sin alpha) / (pi cos alpha) $,
  [met: $z_1, z_2$ --- aantal tanden van wiel 1 en 2 [-], $alpha$ --- drukhoek, $20 degree$ volgens de norm [-]],
)

In diameters geeft dat dezelfde uitkomst. Die vorm geldt ook voor een inwendig tandwiel: daar is $z_2$ negatief, dus $z_2 slash |z_2| = -1$.

#frm(
  "Ingrijpquotiënt uit de diameters",
  $ epsilon = (1 / 2 (sqrt(d_(a 1)^2 - d_(b 1)^2) + z_2 / (|z_2|) sqrt(d_(a 2)^2 - d_(b 2)^2)) - a_d sin alpha) / (pi m cos alpha) $,
  [met: $d_a$ --- kopdiameter [mm], $d_b$ --- basisdiameter [mm], $a_d$ --- asafstand [mm], $m$ --- modulus [mm], $alpha$ --- drukhoek [-]],
)

== Eisen aan het ingrijpquotiënt <sec:eisen-ingrijpquotient>

Voor een zachte ingrijping grijpt de volgende tand al in voor de vorige loslaat. Daarvoor moet $epsilon > 1.1 dots 1.25$.

Een geheel getal ($epsilon = 2$ of $3$) geeft veel lawaai, omdat telkens meerdere tanden tegelijk beginnen in te grijpen.

== Ingrijping en ondersnijding <sec:ingrijping-ondersnijding>

Onder het grenstandaantal treedt ondersnijding op (zie ook @sec:normalisatie):

$ z_g = 2 / (sin^2 alpha) approx 17 $

In de praktijk aanvaardt men $z'_g = 14$. Bij te weinig tanden snijdt het gereedschap een stuk van het functionele evolvente profiel weg. De ingrijpweg wordt korter ($A' E -> A'' E$), het ingrijpquotiënt daalt en de tandvoet verzwakt.

#TODO[Verschuiving van het tandwiel, verschuiving en ondersnijding, effect op drukhoek, asafstand en ingrijpquotiënt (slides 26–einde)]
