#import "../../school-template.typ": *

= Wrijving <ch:wrijving>

In dit hoofdstuk zien we wrijving.

#figure(
  image("assets/Wrijving.png", width: 10cm),
  caption: [Wrijving],
  label: <fig:Wrijving>,
)

Je ziet 3 stappen.

In de eerste stap is er geen beweging omdat de kracht $F$ nog niet groot genoeg is. We zien daarna de statische wrijvingskracht $F_s$ die gaat groeien lineair met de kracht $F$ totdat we het maximum bereiken. Hierna zien we dat de beweging begint en de wrijvingskracht constant blijft. De kinetische wrijvingskracht is kleiner dan de maximale statische wrijvingskracht.

#figure(
  image("assets/Wrijving-kinetische&statische.excalidraw.svg", width: 8cm),
  caption: [Wrijving overgang statisch naar kinetisch],
  label: <fig:Statisch-tot-kinetisch>,
)



We kunnen onze statisch wrijving niet bepalen waar hij op de grafiek is en is dus een *onbekende*.

Onze kinetisch wrijving is wel gekend:
#frm[Kinetische wrijving][$F_(f k ) = mu_k dot N_A$][waarbij $mu_k$ de wrijvingscoëfficiënt is en $N_A$ de normaalkracht.]

De statische wrijving is niet gekend, de formule gaat als volgt
#frm[Statische wrijving][$F_(f s ) < mu_s dot N_A$][waarbij $mu_s$ de statische wrijvingscoëfficiënt is en $N_A$ de normaalkracht.]

Je moet bij een wrijvingsprobleem dus eerst zien of je een statisch of kinetisch wrijvingsprobleem hebt. Meestal test je eerst of het statisch is want dan is $F_s$ niet gekent en heb je een onbekende of je hebt een kinetisch wrijvingsprobleem en dan is $F_k$ gekend met formule $F_k = mu_k N_A$ en kan je verder rekenen.
