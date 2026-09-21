#import "../../school-template.typ": *

// ===========================================================================
// Boek: McClave & Sincich H9 | Slides: ppt_ch09_vs3.pdf (98 dia's)
// Beschikbare figuren: assets/ch9-*.png
// ===========================================================================

= Hoofdstuk 9: Inferentie op basis van twee steekproeven <ch:twee-steekproeven>

#concept(title: "Van één populatie naar een vergelijking")[
  #TODO[Motiveer. H7 en H8 keken naar één populatie. De praktijkvraag is bijna altijd een vergelijking: werkt dieet A beter dan dieet B, is machine 1 preciezer dan machine 2. De doelparameter wordt dus een verschil ($mu_1 - mu_2$, $p_1 - p_2$) of een verhouding ($sigma_1^2 \/ sigma_2^2$).]
]

== De doelparameter bepalen <sec:doelparameter-twee>

// slides 9.1 (dia 2-3)
#TODO[Overzichtstabel: datatype en opzet $arrow.r$ doelparameter $arrow.r$ toetsingsgrootheid. Dit hoofdstuk is vooral een kwestie van de juiste formule kiezen, dus deze tabel is het belangrijkste stuk van de samenvatting.]

== Twee gemiddelden vergelijken -- onafhankelijke steekproeven <sec:twee-gemiddelden-onafhankelijk>

// slides 9.2 (dia 4-32)
#TODO[Leid de steekproefverdeling van $overline(x)_1 - overline(x)_2$ af uit de regel voor lineaire combinaties (dia 8): $E(overline(x)_1 - overline(x)_2) = mu_1 - mu_2$ en de varianties tellen óp, ook al gaat het om een verschil. Dat laatste is contra-intuïtief -- besteed er een zin aan.]

=== Grote steekproeven ($z$) <sec:twee-gemiddelden-z>

// slides dia 6-21 | assets: ch9-steekproeverdeling-verschil.png, ch9-CI-grote-steekproef.png
#TODO[Betrouwbaarheidsinterval en toetsingsgrootheid met $sqrt(sigma_1^2 \/ n_1 + sigma_2^2 \/ n_2)$ in de noemer. Voorwaarde $n_1 >= 30$ en $n_2 >= 30$. Voorbeeld 9.2 (gewichtsverlies bij twee diëten) volledig uitwerken.]

=== Kleine steekproeven: de gepoolde variantie ($t$) <sec:gepoolde-variantie>

// slides dia 22-32 | assets: ch9-kleine-steekproef-pooled.png, ch9-t-toets-twee-steekproeven.png
#TODO[Formulekader voor $s_p^2 = ((n_1-1)s_1^2 + (n_2-1)s_2^2) \/ (n_1 + n_2 - 2)$. Leg uit wat "poolen" betekent: je gelooft dat beide populaties dezelfde $sigma$ hebben, dus gooi je beide steekproeven samen om die ene $sigma$ beter te schatten. Vrijheidsgraden $n_1 + n_2 - 2$.]

=== Aannames <sec:aannames-twee-steekproeven>

// slides dia 25
#TODO[De drie aannames uit figuur 9.5: beide populaties normaal, gelijke (maar onbekende) varianties, onafhankelijk getrokken steekproeven. Verwijs vooruit naar de F-toets in @sec:twee-varianties, waarmee je de tweede aanname effectief controleert.]

== Twee gemiddelden vergelijken -- gepaarde waarnemingen <sec:gepaarde-waarnemingen>

// slides 9.3 (dia 33-51) | assets: ch9-gepaarde-waarnemingen.png, ch9-procedure-gepaard.png
#TODO[Dit is het conceptueel belangrijkste stuk van het hoofdstuk. De slides doen het mooi: eerst de leestest-data fóút analyseren met de onafhankelijke $t$-toets (p-waarde 0,115, geen effect), dan correct als gepaarde data (wél effect). Neem die twee analyses naast elkaar over.]

=== Waarom de onafhankelijke toets hier faalt <sec:waarom-gepaard>

// slides dia 37-39
#TODO[De kern: bij paren zit een groot deel van de spreiding tússen de paren (verschil in IQ tussen leerlingen) en niet in de behandeling. Door met verschillen $d_i$ te werken valt die stoorbron weg en wordt de toets veel gevoeliger.]

=== Procedure voor gepaarde data <sec:procedure-gepaard>

#TODO[Herleid tot een toets op één steekproef: bereken $d_i = x_(1i) - x_(2i)$, en pas daar gewoon H7/H8 op toe met $overline(d)$, $s_d$ en $n_d - 1$ vrijheidsgraden. Benoem dat inzicht expliciet -- het scheelt een hoop formules van buiten leren.]

== Twee fracties vergelijken -- onafhankelijke steekproeven <sec:twee-fracties>

// slides 9.4 (dia 52-69) | assets: ch9-CI-twee-fracties.png
#TODO[Betrouwbaarheidsinterval met $sqrt(hat(p)_1 hat(q)_1 \/ n_1 + hat(p)_2 hat(q)_2 \/ n_2)$.]

#waarschuwing[
  #TODO[Zelfde valkuil als in H8, maar nu met een extra draai: bij de *toets* gebruik je de gepoolde fractie $hat(p) = (x_1 + x_2) \/ (n_1 + n_2)$ in de noemer, bij het *interval* de aparte $hat(p)_1$ en $hat(p)_2$. Leg uit waarom: onder $H_0: p_1 = p_2$ is er maar één gemeenschappelijke $p$ te schatten.]
]

== Bepalen van de steekproefomvang <sec:steekproefomvang-twee>

// slides 9.5 (dia 70-78)
#TODO[Analoog aan H7, maar met $n = n_1 = n_2$. Voorbeeld 9.8 (gewasopbrengst) en 9.9 (defectpercentages) uitwerken. Kort houden.]

== Twee varianties vergelijken -- de F-toets <sec:twee-varianties>

// slides 9.6 (dia 79-98) | assets: ch9-F-verdeling.png, ch9-F-toets-procedure.png
#TODO[Motiveer eerst waarom je varianties zou vergelijken (dia 82: twee meettoestellen, welk is preciezer?) en pas daarna waarom je ze móet vergelijken -- als controle van de gelijke-variantie-aanname bij de gepoolde $t$-toets.]

=== De F-verdeling <sec:f-verdeling>

// assets: ch9-F-verdeling.png
#TODO[Eigenschappen: niet symmetrisch, enkel positief, twee soorten vrijheidsgraden (teller $n_1 - 1$, noemer $n_2 - 1$). Toetsingsgrootheid $F = s_1^2 \/ s_2^2$.]

#waarschuwing[
  #TODO[Praktische regel uit dia 85 en 88: zet altijd de grootste steekproefvariantie in de teller. Anders lees je de tabel aan de verkeerde kant af.]
]

=== De aanname van gelijke varianties controleren <sec:controle-gelijke-varianties>

// slides dia 94-97
#TODO[Voorbeeld 12: de $t$-toets van @sec:gepoolde-variantie is enkel geldig als de F-toets $H_0: sigma_1^2 = sigma_2^2$ niet verwerpt. Werk die keten uit -- het is precies het soort meerstapsvraag dat op het examen komt.]

== Overzicht: beslisboom twee steekproeven <sec:overzicht-h9>

#TODO[Eén beslisboom voor het hele hoofdstuk: kwalitatief of kwantitatief $arrow.r$ gepaard of onafhankelijk $arrow.r$ groot of klein $arrow.r$ formule. Dit hoofdstuk heeft de meeste formules van het vak; zonder dit schema is het niet te overzien. Mermaid-diagram.]
