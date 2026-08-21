#import "../../school-template.typ": *

// ===========================================================================
// Boek: McClave & Sincich H11 | Slides: ppt_ch11vs3.pdf (63 dia's)
// Slides gaan t/m 11.5. Boek 11.6 (predictie-intervallen) en 11.7 komen
// niet in de slides voor.
// Beschikbare figuren: assets/ch11-*.png
// ===========================================================================

= Hoofdstuk 11: Enkelvoudige lineaire regressie <ch:lineaire-regressie>

#concept(title: "Van beschrijven naar voorspellen")[
  #TODO[Motiveer. Tot nu ging elk hoofdstuk over één variabele per keer. Hier koppelen we twee kwantitatieve variabelen aan elkaar: hoe verandert $y$ als $x$ verandert, en hoe hard mogen we die relatie geloven. Gebruik het slidevoorbeeld (reactietijd $y$ tegenover percentage medicijn in het bloed $x$) als rode draad.]
]

== Probabilistische modellen <sec:probabilistisch-model>

// slides 11.1 (dia 4-10) | assets: ch11-regressielijn-model.png
#TODO[Zet deterministisch tegenover probabilistisch model. Kern: $y = beta_0 + beta_1 x + epsilon$, waarbij $beta_0 + beta_1 x$ de "line of means" is en $epsilon$ de willekeurige afwijking. Figuur 11.1 (vijf mogelijke reactietijden per $x$-waarde) maakt dat meteen zichtbaar.]

#TODO[Onderscheid de populatieparameters $beta_0$ en $beta_1$ van hun schatters $hat(beta)_0$ en $hat(beta)_1$. Consequent hoedjes gebruiken vanaf hier -- dat onderscheid is de hele rest van het hoofdstuk.]

== Het model fitten: kleinste kwadraten <sec:kleinste-kwadraten>

// slides 11.2 (dia 11-25)
#TODO[Volg de stappen van de slides: scatterplot maken, rechte veronderstellen, parameters schatten. Definieer de voorspelfout (residu) $y_i - hat(y)_i$ en de te minimaliseren som $"SSE" = sum (y_i - hat(y)_i)^2$. Leg uit waarom je kwadrateert en niet gewoon optelt.]

=== De kwadratensommen $"SS"_(x x)$, $"SS"_(y y)$ en $"SS"_(x y)$ <sec:kwadratensommen>

// slides dia 18 | assets: ch11-kleinste-kwadraten-formule.png
#TODO[Formulekader met de drie sommen en hun rekenvriendelijke vorm. Deze drie getallen bereken je één keer en gebruik je daarna overal: voor $hat(beta)_1$, voor $r$, voor $r^2$ en voor $s$. Zeg dat expliciet -- het scheelt tijd op het examen.]

=== De schatters $hat(beta)_1$ en $hat(beta)_0$ <sec:schatters-beta>

// slides dia 16-22
#TODO[Formulekader: $hat(beta)_1 = "SS"_(x y) \/ "SS"_(x x)$ en $hat(beta)_0 = overline(y) - hat(beta)_1 overline(x)$. Vermeld dat de afleiding via minimalisatie op Toledo staat (dia 17) en of ze op het examen gevraagd wordt.]

=== Interpretatie van de parameters <sec:interpretatie-parameters>

// slides dia 24 | assets: ch11-interpretatie-parameters.png
#TODO[$hat(beta)_1$ = verandering in $y$ per eenheid $x$. $hat(beta)_0$ = waarde van $y$ bij $x = 0$, en dat is vaak betekenisloos -- de slides maken dat punt met een negatieve reactietijd. Behandel meteen het gevaar van extrapolatie buiten het waargenomen $x$-bereik.]

== Modelaannames <sec:modelaannames>

// slides 11.3 (dia 26-32) | assets: ch11-modelaannames.png
#TODO[De vier aannames over $epsilon$: gemiddelde nul, constante variantie $sigma^2$, normaal verdeeld, onderling onafhankelijk. Figuur 11.7 toont de verdeling van $epsilon$ rond de lijn.]

=== $s^2$ als schatter van $sigma^2$ <sec:s-kwadraat>

// slides dia 30-31
#TODO[$s^2 = "SSE" \/ (n-2)$ met $"SSE" = "SS"_(y y) - hat(beta)_1 "SS"_(x y)$. Leg de $n-2$ uit: twee vrijheidsgraden gaan op aan het schatten van $beta_0$ en $beta_1$. Vergelijk met de $n-1$ uit H2 en de $n-k$ uit H10 -- dat maakt het patroon duidelijk.]

== Bruikbaarheid van het model: inferentie over de helling <sec:inferentie-helling>

// slides 11.4 (dia 33-46)
#TODO[Waarom toets je juist $beta_1$? Als $beta_1 = 0$ verandert $E(y)$ niet met $x$ en draagt $x$ dus geen informatie bij. Figuur 11.9 (vlakke lijn) toont dat. Dit is de kernvraag van het hoofdstuk.]

=== t-toets voor $beta_1$ <sec:t-toets-helling>

// slides dia 37-43 | assets: ch11-t-toets-helling.png
#TODO[Formulekader: $t = hat(beta)_1 sqrt("SS"_(x x)) \/ s$, met $n-2$ vrijheidsgraden, en $H_0: beta_1 = 0$. Voorbeeld 3 uit de slides volledig uitwerken volgens denkstappen $arrow.r$ oplossing $arrow.r$ kerninzicht.]

=== Betrouwbaarheidsinterval voor $beta_1$ <sec:ci-helling>

// slides dia 44-45 | assets: ch11-CI-helling.png
#TODO[$hat(beta)_1 plus.minus t_(alpha\/2) s \/ sqrt("SS"_(x x))$. Merk op dat een interval dat 0 níet bevat, dezelfde conclusie geeft als een verworpen toets -- opnieuw twee formuleringen van dezelfde beslissing.]

== Correlatie- en determinatiecoefficient <sec:correlatie-determinatie>

// slides 11.5 (dia 47-63)

=== Correlatiecoefficient $r$ <sec:correlatiecoefficient>

// slides dia 48-55 | assets: ch11-correlatiecoefficient.png
#TODO[Formulekader: $r = "SS"_(x y) \/ sqrt("SS"_(x x) "SS"_(y y))$, ook wel de Pearson-correlatiecoefficient. Eigenschappen uit dia 49: $-1 <= r <= 1$, teken volgt dat van $hat(beta)_1$, en $r = 0$ is equivalent met $hat(beta)_1 = 0$. Neem figuur 11.14 over met de reeks scatterplots bij verschillende $r$-waarden.]

#waarschuwing[
  #TODO[Correlatie is geen causaliteit, én $r$ meet alleen een *lineair* verband -- een duidelijk kwadratisch verband kan $r approx 0$ geven. Voorbeeld 4 uit de slides (criminaliteitscijfer tegenover werkgelegenheid in casino's) is precies zo'n val.]
]

=== Determinatiecoefficient $r^2$ <sec:determinatiecoefficient>

// slides dia 56-63 | assets: ch11-determinatiecoefficient.png
#TODO[Bouw $r^2 = ("SS"_(y y) - "SSE") \/ "SS"_(y y)$ op vanuit de redenering van dia 57-58: zonder $x$ voorspel je alles met $overline(y)$ en maak je fout $"SS"_(y y)$; met $x$ maak je fout $"SSE"$; het verschil is de verklaarde variatie. Interpretatie in woorden oefenen -- "82 % van de variatie in reactietijd wordt verklaard door het medicijnpercentage" is letterlijk examenstof.]

== Niet gezien in dit vak <sec:regressie-buiten-scope>

#NOTE("Boek 11.6 (het model gebruiken voor schatting en predictie, met predictie-intervallen) en 11.7 (volledig uitgewerkt voorbeeld) komen niet voor in ppt_ch11vs3.pdf. Nakijken op Toledo of ze toch examenstof zijn voor ze definitief geschrapt worden.")
