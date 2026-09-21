#import "../../school-template.typ": *

// ===========================================================================
// Boek: McClave & Sincich H8 | Slides: ppt_ch08_vs4.pdf (76 dia's)
// LET OP: de slides zetten p-waarden in 8.4, het boek in 8.3. Hier volgen we
// de slidevolgorde, want dat is de volgorde van het vak.
// Beschikbare figuren: assets/ch8-*.png
// ===========================================================================

= Hoofdstuk 8: Hypothesetoetsen op basis van één steekproef <ch:hypothesetoetsen>

#concept(title: "Schatten tegenover beslissen")[
  #TODO[Motiveer het verschil met H7. Een betrouwbaarheidsinterval antwoordt op "welke waarden zijn plausibel voor $mu$?". Een hypothesetoets antwoordt op "is er genoeg bewijs tégen deze ene voorgestelde waarde?". Zelfde machinerie, andere vraag. Gebruik het betonvoorbeeld uit de slides (drukvasthei 2400 kPa) als rode draad door het hele hoofdstuk.]
]

== De elementen van een hypothesetoets <sec:elementen-toets>

// slides 8.1 (dia 4-19)
#TODO[Overzichtssectie: som de vijf onderdelen op (nulhypothese, alternatieve hypothese, toetsingsgrootheid, kritiek gebied, conclusie) en werk ze daarna één voor één uit in de subsecties hieronder.]

=== Nulhypothese $H_0$ en alternatieve hypothese $H_a$ <sec:h0-ha>

// slides dia 5-6
#TODO[$H_0$ is wat je aanneemt tot het tegendeel blijkt; $H_a$ is wat je wil aantonen. Benadruk de asymmetrie: je verwerpt $H_0$ of je verwerpt ze niet, je "aanvaardt" ze nooit. Leg uit waarom (dia 14).]

=== Toetsingsgrootheid en kritiek gebied <sec:toetsingsgrootheid>

// slides dia 7-8, 11-13
#TODO[Toetsingsgrootheid (test statistic) = hoeveel standaardfouten ligt je meting van de veronderstelde waarde? Kritiek gebied (rejection region) = de waarden die zó onwaarschijnlijk zijn onder $H_0$ dat je ze niet meer gelooft. Werk de twee slidevoorbeelden uit die dezelfde $overline(x)$ tot een andere conclusie leiden.]

=== Fout van de eerste en de tweede soort <sec:type-1-type-2>

// slides dia 9, 14-16 | assets: ch8-type1-type2-errors.png
#TODO[Bouw de 2 $times$ 2 tabel op ($H_0$ waar/vals tegenover verwerpen/niet verwerpen) met $alpha$ en $beta$ erin. De slides koppelen dit aan TP/FP/TN/FN -- neem dat mee, het maakt het concreet. Kies één analogie (rechtszaak of medische test) en hou ze consequent vol.]

== Hypothesen opstellen en het kritiek gebied bepalen <sec:opstellen-hypothesen>

// slides 8.2 (dia 20-24) | assets: ch8-eenzijdig-tweezijdig.png
#TODO[Recept om van een tekstopgave naar $H_0$ en $H_a$ te gaan. Dit is exact waar op het examen punten verloren gaan, dus maak er een expliciete stappenlijst van.]

=== Eenzijdig tegenover tweezijdig toetsen <sec:eenzijdig-tweezijdig>

// assets: ch8-eenzijdig-tweezijdig.png
#TODO[Wanneer $alpha$ en wanneer $alpha \/ 2$ in de staart? Teken het onderscheid; ch8-eenzijdig-tweezijdig.png toont de drie kritieke gebieden naast elkaar.]

== Toets over $mu$ -- grote steekproef ($z$) <sec:toets-mu-z>

// slides 8.3 (dia 25-33) | assets: ch8-z-toets-procedure.png, ch8-procedure-stappen.png
#TODO[Toetsingsgrootheid $z = sqrt(n) (overline(x) - mu_0) \/ sigma$ in een formulekader, met symbolenlijst. Daarna een volledig uitgewerkt voorbeeld volgens denkstappen $arrow.r$ oplossing $arrow.r$ kerninzicht (voorbeeld 8.3--8.4, reactietijd bij ratten).]

#waarschuwing[
  #TODO[$alpha$ leg je vást vóór je de steekproef trekt. Dia 33 laat zien hoe verleidelijk het is om $alpha$ achteraf te verlagen omdat $z = -3$ toevallig mooi uitkomt -- en waarom dat de toets waardeloos maakt.]
]

== De p-waarde (overschrijdingskans) <sec:p-waarde>

// slides 8.4 (dia 34-40) | assets: ch8-pwaarde-rechtszijdig.png
#TODO[Definieer de p-waarde als de kans, ónder $H_0$, op een uitkomst minstens zo extreem als de waargenomen. Behandel alle drie de gevallen: rechtszijdig, linkszijdig, en tweezijdig (waar je $times 2$ doet). Zeg er expliciet bij wat de p-waarde *niet* is: niet de kans dat $H_0$ waar is.]

#TODO[Beslisregel: verwerp $H_0$ als p-waarde $<= alpha$. Koppel dit terug aan het kritiek gebied -- het zijn twee formuleringen van dezelfde beslissing.]

== Toets over $mu$ -- kleine steekproef ($t$) <sec:toets-mu-t>

// slides 8.5 (dia 41-53) | assets: ch8-t-toets-procedure.png
#TODO[Zelfde structuur als de $z$-toets, met $t = sqrt(n) (overline(x) - mu_0) \/ s$ en $n - 1$ vrijheidsgraden. Vermeld de aanname (normale populatie) en hoe je ze controleert (histogram, normal probability plot). Voorbeeld 8.7 over motoruitstoot is een goed examenvoorbeeld.]

== Toets over een fractie $p$ -- grote steekproef <sec:toets-proportie>

// slides 8.6 (dia 54-61) | assets: ch8-proportie-toets-procedure.png
#TODO[Toetsingsgrootheid $z = (hat(p) - p_0) \/ sqrt(p_0 q_0 \/ n)$.]

#waarschuwing[
  #TODO[Val op het detail dat dia 56 benadrukt: in de noemer staat $p_0 q_0$ (de waarde ónder $H_0$), niet $hat(p) hat(q)$ zoals bij het betrouwbaarheidsinterval. Leg uit waarom -- bij een toets reken je alles door alsof $H_0$ waar is.]
]

== Fout van de tweede soort $beta$ en het onderscheidingsvermogen <sec:beta-power>

// slides 8.7 (dia 62-76) | assets: ch8-eigenschappen-alpha-beta.png
#TODO[Hoe bereken je $beta$? Volg de slidemethode: bepaal eerst de grenswaarde $overline(x)_0$ van het kritiek gebied, en zoek dan de oppervlakte in het aanvaardingsgebied onder de álternatieve verdeling.]

=== Onderscheidingsvermogen (power) <sec:power>

#TODO[Power $= 1 - beta$ = de kans dat je een echt verschil ook detecteert. Werk voorbeeld 11 uit: power 22 % bij $mu_a = 2425$ maar 84 % bij $mu_a = 2475$ -- dat maakt meteen duidelijk dat power afhangt van hoe groot het verschil is.]

=== Verband tussen $alpha$, $beta$ en $n$ <sec:alpha-beta-n>

// assets: ch8-eigenschappen-alpha-beta.png
#TODO[De drie eigenschappen van dia 74-75: bij vaste $alpha$ daalt $beta$ als $n$ stijgt; $alpha$ verlagen doet $beta$ stijgen; alleen een grotere $n$ verbetert beide tegelijk. Dit is een klassieke examenvraag.]

== Overzicht: welke toets wanneer? <sec:overzicht-h8>

// assets: ch8-procedure-stappen.png
#TODO[Beslisboom naar analogie met die van H7, plus de vaste stappenlijst die je op het examen afwerkt: $H_0$/$H_a$ $arrow.r$ $alpha$ $arrow.r$ toetsingsgrootheid kiezen $arrow.r$ kritiek gebied $arrow.r$ rekenen $arrow.r$ conclusie in woorden.]
