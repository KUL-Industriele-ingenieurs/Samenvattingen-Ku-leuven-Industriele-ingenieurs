#import "../../school-template.typ": *

// ============================================================================
//  Hoofdstuk 7 — Eigenwaarden en eigenvectoren
//  Deel 3: Wiskundige systeemtheorie
//  Inhoud overgezet uit _OLD/chapters/8_Eigenwaarden-eigenvectoren.tex
// ============================================================================

= Eigenwaarden en eigenvectoren <ch:eigenwaarden>

== Wat zijn eigenwaarden en eigenvectoren? <sec:wat-zijn-eigenwaarden>

Stel je een vector $arrow(v)$ voor, een matrix $A$ en een constante $lambda$:

$ A arrow(v) = lambda arrow(v) $

met:
- $A$ --- vierkante matrix $n times n$
- $arrow(v)$ --- eigenvector, $arrow(v) != arrow(0)$
- $lambda$ --- eigenwaarde bij die eigenvector [-]

Als een matrixvermenigvuldiging van een vector resulteert in een vector die een
*veelvoud* is van de originele vector, dan noemen we die vector een
*eigenvector* van de matrix $A$, en de constante $lambda$ de *eigenwaarde* van
$A$.

#concept(title: "Intuïtie")[
  Voor een eigenvector heeft de matrixvermenigvuldiging *hetzelfde effect als
  het schalen* van die vector met de factor $lambda$: de richting blijft
  behouden, alleen de lengte verandert. Alle andere vectoren worden door $A$
  ook nog eens gedraaid.
]

#voorbeeld(title: "Eigenwaarden en eigenvectoren berekenen")[
  // TODO: uitgewerkt voorbeeld — karakteristieke vergelijking
  // $det(A - lambda I) = 0$ oplossen, daarna eigenvectoren bepalen
]

== Karakteristieke vergelijking <sec:karakteristieke-vergelijking>

// TODO: $det(A - lambda I) = 0$, algebraïsche vs. meetkundige multipliciteit

== Diagonalisatie <sec:diagonalisatie>

// TODO: $A = P D P^(-1)$, wanneer diagonaliseerbaar, machten van $A$

== Toepassing op systemen <sec:eigenwaarden-systemen>

// TODO: eigenwaarden van de toestandsmatrix = polen van het systeem;
// verband met stabiliteit en met @sec:polen-nulpunten
