#import "../../school-template.typ": *

// ===========================================================================
// Boek: McClave & Sincich H7 | Slides: ppt_ch07_vs9.pdf (47 dia's)
// Beschikbare figuren: assets/ch7-*.png
// ===========================================================================

= Hoofdstuk 7: Betrouwbaarheidsintervallen op basis van één steekproef <ch:betrouwbaarheidsintervallen>

#concept(title: "Van steekproef naar uitspraak over de populatie")[
  #TODO[Motiveer. H6 gaf de verdeling van $overline(x)$ rond het onbekende $mu$. Draai die redenering om: als je weet hoe ver $overline(x)$ typisch van $mu$ ligt, kun je rond een gemeten $overline(x)$ een interval leggen dat $mu$ met een gekende zekerheid bevat.]
]

== Doelparameter, puntschatter en intervalschatter <sec:doelparameter>

// slides 7.1 (dia 2-4)
#TODO[Definieer doelparameter (target parameter), puntschatter (point estimator) en intervalschatter. Maak de tabel die zegt welke doelparameter bij welk datatype hoort: $mu$ bij kwantitatieve data, $p$ bij kwalitatieve data met twee uitkomsten. Die tabel stuurt de rest van het vak.]

== Betrouwbaarheidsinterval voor $mu$ -- grote steekproef ($z$) <sec:ci-mu-z>

// slides 7.2 (dia 5-13) | assets: ch7-sampling-dist-xbar.png, ch7-procedure-ci-z.png, ch7-z-waarden-tabel.png
#TODO[Leid het interval af uit de CLT: vertrek van $P(-z_(alpha\/2) < (overline(x) - mu) \/ (sigma \/ sqrt(n)) < z_(alpha\/2)) = 1 - alpha$ en herschrijf naar $overline(x) plus.minus z_(alpha\/2) sigma \/ sqrt(n)$. Stap voor stap, elke stap een eigen vergelijking met de reden erbij.]

#TODO[Formulekader met het interval en een symbolenlijst. Voeg de tabel met courante $z_(alpha\/2)$-waarden toe (ch7-z-waarden-tabel.png): 90 % $arrow.r$ 1,645; 95 % $arrow.r$ 1,96; 99 % $arrow.r$ 2,575.]

=== Betrouwbaarheidscoefficient en betrouwbaarheidsniveau <sec:betrouwbaarheidsniveau>

// slides dia 12 | assets: ch7-betrouwbaarheidsinterval-concept.png
#waarschuwing[
  #TODO[De klassieke misinterpretatie. Correct: van alle intervallen die je met deze procedure maakt, bevat 95 % de echte $mu$. Fout: "er is 95 % kans dat $mu$ in dít interval ligt". Gebruik ch7-betrouwbaarheidsinterval-concept.png -- tien steekproeven, waarvan enkele intervallen $mu$ missen.]
]

== Betrouwbaarheidsinterval voor $mu$ -- kleine steekproef ($t$) <sec:ci-mu-t>

// slides 7.3 (dia 14-23) | assets: ch7-t-vs-z-verdeling.png, ch7-procedure-ci-t.png
#TODO[Waarom faalt $z$ bij kleine $n$? Scheid de twee redenen. Eén: de CLT geldt niet meer, dus de populatie zélf moet normaal zijn. Twee: $s$ is een onnauwkeurige schatting van $sigma$, en die extra onzekerheid maakt de staarten dikker, wat de $t$-verdeling oplevert.]

=== De $t$-verdeling en vrijheidsgraden <sec:t-verdeling>

// assets: ch7-t-vs-z-verdeling.png
#TODO[Eigenschappen: symmetrisch rond 0, dikkere staarten dan $z$, nadert $z$ voor grote $n$. Vrijheidsgraden $n - 1$ -- leg uit waaróm er één vrijheidsgraad verloren gaat aan het schatten van $overline(x)$.]

#TODO[Formulekader: $overline(x) plus.minus t_(alpha\/2) s \/ sqrt(n)$ met $n - 1$ vrijheidsgraden.]

== Betrouwbaarheidsinterval voor een fractie $p$ <sec:ci-proportie>

// slides 7.4 (dia 24-34) | assets: ch7-procedure-ci-proportie.png
#TODO[Afleiding via de normale benadering van de binomiale verdeling; dia 26 werkt dit in vier herschrijfstappen uit. Voorwaarde: $n hat(p) >= 15$ en $n hat(q) >= 15$.]

#TODO[Formulekader: $hat(p) plus.minus z_(alpha\/2) sqrt((hat(p) hat(q)) \/ n)$.]

=== Wilson-correctie bij een kleine steekproef <sec:wilson>

// slides dia 32-34
#TODO[Kort houden: wat je doet als het aantal successen kleiner is dan 15 (twee successen en twee mislukkingen bijtellen). Het formularium vermeldt dit expliciet als "not discussed", de slides behandelen het wél -- nakijken wat het examen verwacht.]

== Bepalen van de steekproefomvang <sec:steekproefomvang>

// slides 7.5 (dia 35-45)
#TODO[Draai de intervalformule om: je legt de gewenste halve breedte op (de sampling error $"SE"$) en lost op naar $n$.]

=== Steekproefomvang voor $mu$ <sec:steekproefomvang-mu>

// assets: ch7-procedure-steekproefomvang-mu.png
#TODO[$n = (z_(alpha\/2) sigma \/ "SE")^2$. Neem de twee praktische trucs uit de slides mee: $sigma approx R \/ 4$ als $sigma$ onbekend is, altijd naar boven afronden, en als er $n < 30$ uitkomt zet je $n = 30$.]

=== Steekproefomvang voor $p$ <sec:steekproefomvang-p>

// assets: ch7-procedure-steekproefomvang-p.png
#TODO[$n = (z_(alpha\/2))^2 p q \/ "SE"^2$. Worst case $p = 0,5$ als $p$ onbekend is -- leg uit waarom $p q$ daar maximaal is.]

== Overzicht: welk interval wanneer? <sec:overzicht-h7>

// assets: ch7-overzicht-formules.png
#TODO[Beslisboom: kwalitatief of kwantitatief $arrow.r$ $n >= 30$ of niet $arrow.r$ $sigma$ bekend of niet $arrow.r$ $z$ of $t$. Dit is het schema dat je op het examen als eerste opschrijft. Een Mermaid-diagram werkt hier goed.]
