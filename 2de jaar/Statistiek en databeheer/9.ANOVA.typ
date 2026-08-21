#import "../../school-template.typ": *

// ===========================================================================
// Boek: McClave & Sincich H10 | Slides: ppt_ch10vs2.pdf (52 dia's)
// Enkel 10.1-10.3 gezien. 10.4 (randomized block) en 10.5 (factorieel)
// staan in de slides als "beyond the scope of the course".
// Beschikbare figuren: assets/ch10-*.png
// ===========================================================================

= Hoofdstuk 10: Variantieanalyse (ANOVA) <ch:anova>

#concept(title: "Waarom niet gewoon alle paren met een t-toets?")[
  #TODO[Dit is de motivatie waar het hele hoofdstuk op steunt. Bij $k$ groepen zijn er $k(k-1)\/2$ paren. Elke toets op $alpha = 0,05$ heeft 5 % kans op vals alarm, dus over alle paren samen loopt die kans hard op. ANOVA (Analysis of Variance, variantieanalyse) toetst alles in één keer met één $alpha$. Reken het cijfervoorbeeld met $k = 3$ door zoals op dia 46.]
]

== Elementen van een ontworpen studie <sec:elementen-ontwerp>

// slides 10.1 (dia 2-9) | assets: ch10-anova-begrippen.png
#TODO[Definieer de begrippen op het golfbalvoorbeeld van de slides: responsvariabele (afgelegde afstand), factor (merk), factorniveaus (A, B, C, D), behandeling (treatment), experimentele eenheid (de golfbal). Eén tabel met term, betekenis en het voorbeeld ernaast volstaat.]

#TODO[Onderscheid één-factor van twee-factor (dia 8-9). Alleen het één-factorontwerp wordt verder uitgewerkt, maar zeg dat er expliciet bij.]

== Volledig gerandomiseerd ontwerp -- één factor <sec:volledig-gerandomiseerd>

// slides 10.2 (dia 10-42)
#TODO[Definieer het volledig gerandomiseerde ontwerp (completely randomized design) en formuleer de hypothesen: $H_0: mu_1 = mu_2 = ... = mu_k$ tegenover $H_a$: minstens twee behandelingsgemiddelden verschillen. Benadruk dat $H_a$ níet zegt wélke -- daarvoor dient @sec:meervoudige-vergelijkingen.]

=== De kernidee: variatie tussen tegenover variatie binnen groepen <sec:variatie-tussen-binnen>

// slides dia 12-14 | assets: ch10-variabiliteit-tussen-groepen.png
#TODO[Het intuïtieve hart van ANOVA, vóór alle formules. Gebruik de twee dot plots met SAT-scores (dia 14): dezelfde afstand tussen de groepsgemiddelden leidt tot een andere conclusie, afhankelijk van hoe verspreid de punten binnen elke groep liggen. Wie dit plaatje snapt, snapt de F-toets.]

=== Kwadratensommen SST en SSE <sec:sst-sse>

// slides dia 15-16
#TODO[Formulekaders voor $"SST" = sum n_i (overline(x)_i - overline(x))^2$ (variatie tussen behandelingen) en $"SSE" = sum sum (x_(i j) - overline(x)_i)^2$ (variatie binnen behandelingen), met symbolenlijst. Vermeld dat $"SST" + "SSE" = "SS"("Total")$ -- de totale variatie wordt exact opgesplitst.]

=== Gemiddelde kwadraten MST en MSE <sec:mst-mse>

// slides dia 17 | assets: ch10-MST-MSE.png
#TODO[$"MST" = "SST" \/ (k-1)$ en $"MSE" = "SSE" \/ (n-k)$. Leg de vrijheidsgraden uit: waarom $k-1$ en waarom $n-k$. Merk op dat $"MSE"$ eigenlijk de gepoolde variantie uit H9 is, uitgebreid naar $k$ groepen -- die link maakt het minder abstract.]

=== De F-toets <sec:anova-f-toets>

// slides dia 18-21
#TODO[$F = "MST" \/ "MSE"$. Redeneer waarom $F approx 1$ betekent dat $H_0$ klopt en waarom de toets altijd éénzijdig rechts is. Vrijheidsgraden: teller $k-1$, noemer $n-k$.]

=== De ANOVA-tabel <sec:anova-tabel>

// slides dia 23, 27 | assets: ch10-anova-tabel.png
#TODO[De standaardtabel (bron, df, SS, MS, F). Leer ze lezen én invullen: op het examen krijg je vaak een tabel met gaten die je moet aanvullen. Voeg een oefening toe waarin je uit twee gegeven cellen de rest reconstrueert.]

=== Aannames <sec:anova-aannames>

// slides dia 28, 38-40 | assets: ch10-anova-procedure.png
#TODO[Drie aannames: normaal verdeelde populaties, gelijke varianties, onafhankelijke aselecte steekproeven. Hoe controleer je ze -- histogram en boxplot per groep (dia 39-40).]

=== Verband met de t-toets bij $k = 2$ <sec:anova-vs-t>

// slides dia 29-30
#TODO[Bij twee groepen zijn de F-toets en de tweezijdige gepoolde $t$-toets equivalent, met $F = t^2$. Leuk inzicht en een makkelijke examenvraag.]

== Meervoudige vergelijkingen van gemiddelden <sec:meervoudige-vergelijkingen>

// slides 10.3 (dia 43-52)
#TODO[ANOVA zegt "er is een verschil", niet "wélk". Dit is de vervolgstap. Maak duidelijk dat je hier pas aan begint nádat de F-toets $H_0$ verworpen heeft.]

=== Experiment-wise error rate <sec:experimentwise-error>

// slides dia 45-47
#TODO[Definieer de family-wise error rate en reken door hoe die oploopt bij $c$ vergelijkingen. Dit is dezelfde redenering als in de openingsbox -- verwijs terug in plaats van ze te herhalen.]

=== Bonferroni-procedure <sec:bonferroni>

// slides dia 48-51 | assets: ch10-bonferroni-procedure.png
#TODO[Formulekader: $overline(x)_i - overline(x)_j plus.minus t_(alpha\/(2c)) s sqrt(1\/n_i + 1\/n_j)$ met $c$ het aantal paren, $s = sqrt("MSE")$ en $n-k$ vrijheidsgraden. De truc in één zin: verdeel $alpha$ over het aantal vergelijkingen. Werk voorbeeld 10.6 (rangschikken van de golfbalmerken) uit.]

== Niet gezien in dit vak <sec:anova-buiten-scope>

#NOTE("De slides markeren het gerandomiseerde blokontwerp (boek 10.4) en factoriele experimenten (boek 10.5) als 'beyond the scope of the course'. Niet uitwerken, wel hier vermelden zodat duidelijk is dat het bewust ontbreekt.")
