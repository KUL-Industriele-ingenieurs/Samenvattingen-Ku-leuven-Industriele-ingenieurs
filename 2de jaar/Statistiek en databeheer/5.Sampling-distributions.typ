#import "../../school-template.typ": *

// ===========================================================================
// Boek: McClave & Sincich H6 "Sampling Distributions"
// Geen aparte slidedeck (ppt_ch06 ontbreekt); behandeld in SDM-sessie 8.
// Beschikbare figuren: assets/ch6-*.png
// ===========================================================================

= Hoofdstuk 6: Verdeling van steekproefgrootheden <ch:steekproefverdelingen>

#concept(title: "Waarom dit hoofdstuk het scharnierpunt is")[
  #TODO[Motiveer de overgang. H1--H5 beschreven de *populatie*, met $mu$ en $sigma$ als gekende getallen. Vanaf hier kennen we die niet en hebben we enkel een steekproef. De brug tussen die twee werelden is de steekproefverdeling. Zonder dit hoofdstuk zijn H7 (betrouwbaarheidsintervallen) en H8 (toetsen) niet uit te leggen.]
]

== Wat is een steekproefverdeling? <sec:steekproefverdeling-concept>

// boek 6.1
#TODO[Definieer de steekproefgrootheid (sample statistic) als een random variabele: elke nieuwe steekproef geeft een andere waarde van $overline(x)$. De verdeling van die waarden over álle mogelijke steekproeven is de steekproefverdeling. Zet het contrast scherp -- populatieverdeling van $x$ tegenover steekproefverdeling van $overline(x)$ -- want die twee worden constant door elkaar gehaald.]

== Eigenschappen: zuiverheid en minimale variantie <sec:zuiverheid-minimale-variantie>

// boek 6.2 | assets: ch6-sampling-dist-eigenschappen.png
#TODO[Zuivere schatter (unbiased estimator): $E(overline(x)) = mu$. Toon met ch6-sampling-dist-eigenschappen.png waarom je van twee zuivere schatters die met de kleinste variantie kiest. Verwijs terug naar H2: $s^2$ deelt door $n-1$ net om zuiver te zijn.]

== Steekproefverdeling van $overline(x)$ en de centrale limietstelling <sec:clt>

// boek 6.3 | assets: ch6-centrale-limietstelling.png, ch6-clt-verschillende-populaties.png
#TODO[Kern van het hoofdstuk. Formuleer de centrale limietstelling (CLT): voor voldoende grote $n$ is $overline(x)$ bij benadering normaal verdeeld, ongeacht de vorm van de populatieverdeling. Gebruik ch6-clt-verschillende-populaties.png om te tonen dat dit ook voor scheve en uniforme populaties opgaat.]

#TODO[Formulekader met $mu_(overline(x)) = mu$ en $sigma_(overline(x)) = sigma \/ sqrt(n)$, met symbolenlijst eronder.]

=== Standaardfout van het gemiddelde <sec:standaardfout>

// assets: ch6-standaardfout-daalt.png, ch6-standaardfout-correctie.png
#TODO[Leg uit waarom $sigma_(overline(x))$ daalt met $sqrt(n)$ en niet met $n$: vier keer zoveel metingen halveert de spreiding maar. Behandel ook de eindige-populatiecorrectie uit ch6-standaardfout-correctie.png.]

=== Wanneer is $n$ groot genoeg? <sec:n-groot-genoeg>

// assets: ch6-grote-n-vraag.png
#TODO[De vuistregel $n >= 30$, en wanneer ze niet volstaat (sterk scheve populatie). Dit is exact het criterium dat in H7 en H8 bepaalt of je $z$ of $t$ gebruikt -- maak die link expliciet.]

== Steekproefverdeling van de steekproeffractie <sec:steekproefverdeling-proportie>

// boek 6.4
#TODO[Steekproeffractie $hat(p) = x \/ n$, met $mu_(hat(p)) = p$ en $sigma_(hat(p)) = sqrt((p q) \/ n)$. Voorwaarde voor de normale benadering: $n p >= 15$ en $n q >= 15$ -- dat is de voorwaarde die in het formularium bij elk fractie-interval terugkomt. Link terug naar de binomiale verdeling in H4.]
