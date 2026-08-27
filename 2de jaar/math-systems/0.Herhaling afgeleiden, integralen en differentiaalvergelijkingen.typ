#import "../../school-template.typ": *

// ============================================================================
//  Deel 0 — Herhaling afgeleiden, integralen en differentiaalvergelijkingen
//  Voorkennis. Staat niet in de vakinhoud-slide, maar je hebt het nodig vanaf
//  Deel 2, dus het staat vooraan en niet als appendix achteraan.
//  Inhoud overgezet uit _OLD/chapters/2_Herhaling afgeleiden, integralen
//  en diff verglijkingen.tex
// ============================================================================

= Herhaling: afgeleiden, integralen en differentiaalvergelijkingen <ch:herhaling>

== Afgeleiden <sec:afgeleiden>

*Differentiatie.*

Differentiatie is het proces waarbij men de afgeleide van een gegeven functie
$f(x)$ berekent t.o.v. de onafhankelijke variabele $x$. In de context van
signalen en systemen is die onafhankelijke variabele doorgaans de tijd $t$,
genoteerd als $f(t)$.

De afgeleide $(dif f(t)) / (dif t)$ of $f'(t)$ is de snelheid waarmee de
functie verandert op tijdstip $t$. Meetkundig is dit de *helling van de
raaklijn*.

Hieronder zie je visueel dat de rechtse functie de snelheid voorstelt waarmee
de linkse functie verandert.

#figure(
  grid(
    columns: (1fr, 1fr),
    gutter: 1em,
    cetz.canvas({
      import cetz.draw: *
      cetz-plot.plot.plot(
        size: (5, 4),
        axis-style: "school-book",
        x-label: $t$,
        y-label: $f(t)$,
        x-tick-step: none,
        y-tick-step: none,
        {
          cetz-plot.plot.add(
            domain: (-2.5, 2.5),
            samples: 100,
            style: (stroke: schoolBlue + 1.2pt),
            t => calc.pow(t, 3) / 3 - t,
          )
        },
      )
    }),
    cetz.canvas({
      import cetz.draw: *
      cetz-plot.plot.plot(
        size: (5, 4),
        axis-style: "school-book",
        x-label: $t$,
        y-label: $f'(t)$,
        x-tick-step: none,
        y-tick-step: none,
        {
          cetz-plot.plot.add(
            domain: (-2.5, 2.5),
            samples: 100,
            style: (stroke: schoolGreen + 1.2pt),
            t => t * t - 1,
          )
        },
      )
    }),
  ),
  caption: [Links de functie $f(t) = t^3 \/ 3 - t$, rechts haar afgeleide
    $f'(t) = t^2 - 1$ (de snelheid waarmee $f$ verandert)],
) <fig:afgeleide-visueel>

*Rekenregels afgeleiden.*

*Vier fundamentele afgeleiden:*
+ Machtsfunctie: $(t^n)' = n t^(n-1)$
+ Sinusfunctie: $(sin t)' = cos t$
+ Cosinusfunctie: $(cos t)' = -sin t$
+ Exponentiële functie: $(e^t)' = e^t$

*Zes differentiatie-eigenschappen* (als $f, g$ afleidbaar zijn):
+ Constante: $c' = 0$
+ Som: $(f + g)'(t) = f'(t) + g'(t)$
+ Product: $(f g)'(t) = f'(t) g(t) + f(t) g'(t)$
+ Quotiënt ($g(t) != 0$): $ (f/g)'(t) = (f'(t) g(t) - f(t) g'(t)) / (g^2 (t)) $
+ *Kettingregel* (samengestelde functie): $(f compose g)'(t) = f'(g(t)) dot g'(t)$
+ Inverse functie: $(f^(-1))'(t) = 1 / (f'(f^(-1)(t)))$

*Afgeleide berekenen.*

Bereken de afgeleide van $f(t) = e^(-4t) cos 3t$.

*Stap 1 --- productregel:*
$ f'(t) = (e^(-4t))' cos 3t + e^(-4t) (cos 3t)' $

*Stap 2 --- kettingregel:*
- $(e^(-4t))' = e^(-4t) dot (-4t)' = -4 e^(-4t)$
- $(cos 3t)' = -sin 3t dot (3t)' = -3 sin 3t$

*Resultaat:*
$ f'(t) = -4 e^(-4t) cos 3t - 3 e^(-4t) sin 3t = -e^(-4t) (4 cos 3t + 3 sin 3t) $

*Quotiëntregel.*

Bereken de afgeleide van $f(t) = (sin t) / t^2$.

Met $u(t) = sin t$ en $v(t) = t^2$ geldt $(u/v)' = (u' v - u v') / v^2$:
- $u'(t) = cos t$
- $v'(t) = 2t$

Invullen:
$
  f'(t) = ((cos t) t^2 - (sin t) 2t) / (t^2)^2
  = (t^2 cos t - 2t sin t) / t^4
  = (t cos t - 2 sin t) / t^3
$

*Dubbele kettingregel.*

Bereken de afgeleide van $f(t) = sin^3 (4t) = (sin(4t))^3$.

Dit is een kettingregel in een kettingregel: $h(g(k(t)))$ met $x^3$, $sin x$
en $4t$.
+ Buitenste macht afleiden: $3 (sin(4t))^2 dot (sin(4t))'$
+ Sinus afleiden: $3 sin^2 (4t) dot cos(4t) dot (4t)'$
+ Binnenste lineaire functie afleiden: $3 sin^2 (4t) cos(4t) dot 4$

*Resultaat:*
$ f'(t) = 12 sin^2 (4t) cos(4t) $

== Integratie <sec:integratie>

*Primitieve functie & onbepaalde integraal.*

Als $F'(t) = f(t)$, dan noemen we $F(t)$ een *primitieve functie* van $f(t)$.
De *onbepaalde integraal* is de verzameling van alle primitieve functies:
$ integral f(t) dif t = F(t) + c, quad forall c in RR $

*Rekenregels integralen.*

*Lineariteit:*
$
  integral [a f_1 (t) + b f_2 (t)] dif t
  = a integral f_1 (t) dif t + b integral f_2 (t) dif t
$

*Integratie door substitutie:* als $f(t) = g'(t) h(g(t))$, stel dan $u = g(t)$,
waardoor $dif u = g'(t) dif t$:
$ integral f(t) dif t = integral h(u) dif u $

*Substitutie.*

Bereken $integral (e^(1\/t^2)) / t^3 dif t$.

Herschrijf de integrand als $1/t^3 e^(t^(-2))$. Stel $u = t^(-2)$, dan is
$dif u = -2 t^(-3) dif t$, dus $-1/2 dif u = t^(-3) dif t$.

*Resultaat:*
$ integral e^u (-1/2) dif u = -1/2 e^u + c = -1/2 e^(1\/t^2) + c $

*Partiële integratie.*

Bereken $integral t e^t dif t$.

We gebruiken $integral u dif v = u dot v - integral v dif u$:
- Stel $u = t$, dus $dif u = dif t$
- Stel $dif v = e^t dif t$, dus $v = e^t$

*Resultaat:*
$ integral t e^t dif t = t e^t - integral e^t dif t = t e^t - e^t + c = e^t (t - 1) + c $

*Partieelbreuksplitsing.*

Bereken $integral 1 / (t^2 - 1) dif t$.

We splitsen de breuk:
$ 1 / (t^2 - 1) = 1 / ((t-1)(t+1)) = A / (t-1) + B / (t+1) $
- Tellers gelijkstellen: $1 = A(t+1) + B(t-1)$
- Kies $t = 1$: $1 = 2A$, dus $A = 1\/2$
- Kies $t = -1$: $1 = -2B$, dus $B = -1\/2$

*Resultaat:*
$
  integral ((1\/2) / (t-1) - (1\/2) / (t+1)) dif t
  = 1/2 ln |t-1| - 1/2 ln |t+1| + c
  = 1/2 ln abs((t-1) / (t+1)) + c
$

*Bepaalde integraal (oppervlakte).*

De bepaalde integraal $integral_(t_1)^(t_2) f(t) dif t$ komt overeen met de
oppervlakte onder de curve $f(t)$ tussen $t_1$ en $t_2$. Ligt de curve onder
de $t$-as, dan is die bijdrage *negatief*.

=== Stap-voor-stap oefeningen <sec:integratie-oefeningen-uitgewerkt>

*Kettingregel.*

*Opgave:* bereken de afgeleide van $f(t) = sin(cos(2t - 5))$.

*Stap 1 --- analyseer de structuur.* Dit is een samengestelde functie van de
vorm $f(g(h(t)))$:
- Buitenste functie: $sin(dot.c)$
- Middelste functie: $cos(dot.c)$
- Binnenste functie: $2t - 5$

*Stap 2 --- pas de kettingregel toe (van buiten naar binnen).* De afgeleide
van de sinus is de cosinus; laat de inhoud ongemoeid, maar vermenigvuldig met
de afgeleide van die inhoud.
$ f'(t) = cos(cos(2t - 5)) dot [cos(2t - 5)]' $

*Stap 3 --- differentieer de volgende laag.* De afgeleide van de cosinus is
de min-sinus.
$ [cos(2t - 5)]' = -sin(2t - 5) dot (2t - 5)' $

*Stap 4 --- differentieer de binnenste functie.* $(2t - 5)' = 2$

*Stap 5 --- combineer alles.*
$ f'(t) = -2 sin(2t - 5) cos(cos(2t - 5)) $

*Afgeleide van een wortel.*

*Opgave:* bereken de afgeleide van $f(t) = sqrt(1 + cos^2 t)$.

*Stap 1 --- analyse.* Samengestelde functie $g(h(k(t)))$ met:
- Buitenste: $sqrt(u) = u^(1\/2)$
- Middelste: $1 + v^2$ (waarbij $v = cos t$)
- Binnenste: $cos t$

*Stap 2 --- differentieer de wortel.*
$ f'(t) = 1 / (2 sqrt(1 + cos^2 t)) dot (1 + cos^2 t)' $

*Stap 3 --- differentieer de inhoud.* De afgeleide van 1 is 0; die van
$cos^2 t$ vraagt opnieuw de kettingregel:
$ (cos^2 t)' = 2 cos t dot (cos t)' = 2 cos t dot (-sin t) = -2 sin t cos t $

*Stap 4 --- combineer.*
$
  f'(t) = 1 / (2 sqrt(1 + cos^2 t)) dot (-2 sin t cos t)
  = (-sin t cos t) / sqrt(1 + cos^2 t)
$

*Oneigenlijke integraal.*

*Opgave:* bereken $integral_0^(+oo) e^(-t\/2) dif t$.

*Stap 1 --- definitie oneigenlijke integraal.* Vervang de bovengrens $+oo$
door een variabele $R$ en neem de limiet.
$ lim_(R -> +oo) integral_0^R e^(-t\/2) dif t $

*Stap 2 --- primitieve zoeken (substitutie).* Stel $u = -t\/2$, dan
$dif u = -1\/2 dif t$, dus $dif t = -2 dif u$.
$ integral e^u (-2) dif u = -2 e^u = -2 e^(-t\/2) $

*Stap 3 --- vul de grenzen in.*
$ [-2 e^(-t\/2)]_0^R = (-2 e^(-R\/2)) - (-2 e^0) = -2 e^(-R\/2) + 2 $

*Stap 4 --- bereken de limiet.*
$ lim_(R -> +oo) (-2 e^(-R\/2) + 2) = -2 dot 0 + 2 = 2 $

*Oneigenlijke integraal met substitutie.*

*Opgave:* bereken $integral_(-oo)^(+oo) (2t) / (t^2 + 1)^2 dif t$.

*Stap 1 --- primitieve zoeken.* Substitutie $u = t^2 + 1$, dus
$dif u = 2t dif t$.
$ integral 1/u^2 dif u = integral u^(-2) dif u = -u^(-1) = -1 / (t^2 + 1) $

*Stap 2 --- bereken de grenzen (limieten).*
$
  lim_(R -> +oo) [-1 / (t^2 + 1)]_(-R)^R
  = lim_(R -> +oo) ((-1 / (R^2 + 1)) - (-1 / ((-R)^2 + 1)))
$

*Stap 3 --- conclusie.* Beide termen gaan naar 0 als $R -> oo$, dus de
integraal is $0$.

*Key insight:* dit is logisch, want de integrand is een *oneven* functie over
een symmetrisch interval.

=== Oefeningen <sec:integratie-oefeningen>

+ Bereken de afgeleide $f'(t)$:
  + $f(t) = tan t$
  + $f(t) = t^2 cos t$
  + $f(t) = sin t tan t$
  + $f(t) = t^3 sin t cos t$
  + $f(t) = tan(5 - sin 2t)$
  + $f(t) = (1 - 2t)^(-3)$
  + $f(t) = sin(cos(2t - 5))$
  + $f(t) = sqrt(1 + cos^2 t)$

+ Bereken de onbepaalde integraal $integral f(t) dif t$:
  + $f(t) = (t^3 + t)^5 (3t^2 + 1)$
  + $f(t) = sqrt(2t + 1)$
  + $f(t) = t^2 cos t^3$
  + $f(t) = (1 + sqrt(t))^(1\/3) \/ sqrt(t)$
  + $f(t) = (1 - cos t/2)^2 sin t/2$
  + $f(t) = 1/t^2 sin 1/t cos 1/t$

+ Bereken de bepaalde integralen:
  + $integral_(-1)^1 3t^2 sqrt(t^3 + 1) dif t$
  + $integral_(pi\/4)^(pi\/2) cot t csc^2 t dif t$
  + $integral_0^(pi\/2) (2 sin t cos t) / (1 + sin^2 t)^3 dif t$
  + $integral_0^(+oo) e^(-t\/2) dif t$
  + $integral_(-oo)^(+oo) 1 / (1 + t^2) dif t$
  + $integral_(-oo)^(+oo) (2t) / (t^2 + 1)^2 dif t$
  + $integral_(-oo)^(+oo) 2t e^(-t^2) dif t$
  + $integral_(-oo)^0 e^(-abs(t)) dif t$

== Differentiaalvergelijkingen <sec:differentiaalvergelijkingen>

=== Eerste-orde differentiaalvergelijkingen <sec:eerste-orde-ldv>

Een *eerste-orde* differentiaalvergelijking bevat alleen een eerste afgeleide.
Om er een op te lossen, herschrijf je hem eerst naar een vaste *standaardvorm*,
met de coëfficiënt vóór de afgeleide gelijk aan 1:

$ y'(t) = k y(t) + f(t) $

met:
- $y(t)$ --- de onbekende uitgangsfunctie (het systeemantwoord, bv. $v(t)$)
- $k$ --- constante die het systeem karakteriseert; voor een stabiel,
  dempend systeem is $k < 0$
- $f(t)$ --- de ingang: alles in de vergelijking dat niet evenredig is met
  $y(t)$ zelf (mag constant zijn, of tijdsafhankelijk)

*Algemene oplossing.* Deze standaardvorm heeft een vaste oplossingsformule.
Je leidt ze één keer af (@sec:afleiding-integrerende-factor) en herbruikt ze
daarna telkens, zonder de afleiding te herhalen:

#[
  // Enige genummerde vergelijking in de tekst: nummering is nodig om er met
  // @eq:algemene-oplossing-eerste-orde naar te kunnen verwijzen.
  #set math.equation(numbering: n => numbering("(1.1)", counter(heading).get().first(), n))
  $
    y(t) = underbrace(K e^(k t), "homogene oplossing")
    + underbrace(integral_0^t f(tau) e^(k(t-tau)) dif tau, "particuliere oplossing")
  $ <eq:algemene-oplossing-eerste-orde>
]

met:
- $K = y(0)$ --- volgt rechtstreeks uit de beginvoorwaarde
- de eerste term --- de respons van het systeem als er *geen* ingang was
  ($f equiv 0$): hoe de starttoestand uitdooft
- de tweede term --- de respons die *enkel* door de ingang $f(t)$
  veroorzaakt wordt

=== Waar komt de eerste-orde formule vandaan? <sec:afleiding-integrerende-factor>

De afleiding moet je niet kennen maar is het handig om te weten.

Doel: herschrijf de linkerkant $y'(t) - k y(t)$ als één afgeleide van iets,
zodat je meteen kan integreren in plaats van te gokken naar een oplossing.

*Stap 1 --- vermenigvuldig met een hulpfunctie $mu(t)$.* De productregel geeft:
$ (dif) / (dif t) [mu(t) y(t)] = mu(t) y'(t) + mu'(t) y(t) $
Vergelijk dit met de vermenigvuldigde ODE-linkerkant
$mu(t) y'(t) - k mu(t) y(t)$: dit is enkel gelijk als
$mu'(t) = -k mu(t)$.

*Stap 2 --- los die voorwaarde op* (scheiding van variabelen):
$
  (dif mu) / mu = -k dif t quad => quad ln|mu| = -k t + C
  quad => quad mu(t) = e^(-k t)
$
(de constante $C$ mag je op 0 zetten --- $mu$ dient enkel als
vermenigvuldigfactor en die constante valt er later toch weer uit)

*Stap 3 --- vermenigvuldig de volledige ODE met $mu(t) = e^(-k t)$:*
$ e^(-k t) y'(t) - k e^(-k t) y(t) = e^(-k t) f(t) $

*Stap 4 --- herken de linkerkant als een exacte afgeleide:*
$ (dif) / (dif t) [e^(-k t) y(t)] = e^(-k t) f(t) $

*Stap 5 --- integreer beide kanten van $0$ tot $t$:*
$ e^(-k t) y(t) - y(0) = integral_0^t e^(-k tau) f(tau) dif tau $

*Stap 6 --- deel door $e^(-k t)$ om $y(t)$ vrij te maken:*
$
  y(t) = e^(k t) y(0) + integral_0^t e^(k t) e^(-k tau) f(tau) dif tau
  = K e^(k t) + integral_0^t f(tau) e^(k(t-tau)) dif tau
$

Dat is exact @eq:algemene-oplossing-eerste-orde. Vanaf hier moet je deze
afleiding nooit meer herhalen: je herkent gewoon je eigen $k$ en $f(t)$ in
een nieuwe ODE en vult in. Toegepast op een echt systeem zie je dat in
@sec:eerste-orde-systemen.

=== Tweede orde: particuliere en homogene oplossing <sec:ldv-uitleg>

In de oefenzittingen zien we ter herhaling hoe we met differentiaalvergelijkingen
omgaan: we gaan een particuliere en een homogene oplossing zoeken van onze
differentiaalvergelijking, en die dan bij elkaar optellen.

$ y_h (t) + y_p (t) = y(t) $

Deze methode gebruiken we vooral voor *tweede-orde* differentiaalvergelijkingen,
lineair en met constante coëfficiënten. Daar kun je heel wat fysische systemen
mee beschrijven, en de standaardvorm ziet er zo uit:

$ y''(t) + a_1 y'(t) + a_0 y(t) = x(t) $

met:
- $y(t)$ --- uitgangssignaal (respons)
- $x(t)$ --- ingangssignaal (excitatie)
- $a_0, a_1$ --- constante coëfficiënten van het systeem

Maar waarom mag je die twee zomaar optellen? Eerst leg ik nog eens de opstelling
uit, en daarna leg ik uit waarom dit mag.

*Voor de homogene* ga je de uitkomst gelijkstellen aan nul, en dan geef je
afhankelijk van de graad van de afgeleiden een factor: $y' -> lambda$,
$y'' -> lambda^2$, $y -> 1$. Je gaat dan oplossen naar $lambda$. Wat je
overhoudt is de karakteristieke vergelijking:

$ lambda^2 + a_1 lambda + a_0 = 0 $

Welke vorm $y_h (t)$ krijgt, hangt af van de discriminant $D = a_1^2 - 4 a_0$:

+ *Twee reële wortels* ($lambda_1 != lambda_2$):
  $ y_h (t) = C_1 e^(lambda_1 t) + C_2 e^(lambda_2 t) $
+ *Eén reële wortel* ($lambda_1 = lambda_2 = lambda$):
  $ y_h (t) = C_1 e^(lambda t) + C_2 t e^(lambda t) $
+ *Complexe wortels* ($lambda_(1,2) = alpha plus.minus j beta$):
  $ y_h (t) = e^(alpha t) (C_1 cos beta t + C_2 sin beta t) $

Je kunt dan met de beginvoorwaarden in te vullen $C_1$ en $C_2$ vinden.

*Voor je particuliere* ga je afhankelijk van de uitkomst *gokken* naar de vorm
van de oplossing. Die gok is niet blind: je kiest een vorm waarvan de afgeleiden
hetzelfde soort functie opleveren als het rechterlid. Bij $sin(omega t)$ gok je
dus $A cos(omega t) + B sin(omega t)$, omdat de afgeleiden van goniometrische
functies weer cosinussen en sinussen gaan zijn. Formeel heet dat de methode van
de *onbepaalde coëfficiënten*.

#figure(
  table(
    columns: (1fr, 1fr),
    inset: 0.5em,
    align: (left + horizon, left + horizon),
    stroke: 0.6pt + rgb("d9d9d9"),
    fill: (_, row) => if row == 0 { rgb("1f4e79") } else { none },
    table.header(text(fill: white)[*Rechterlid $x(t)$*], text(fill: white)[*Voorstel $y_p (t)$*]),
    [$C$ (constante)], [$A$],
    [$C t^n$ (veelterm)], [$A_n t^n + dots + A_1 t + A_0$],
    [$C e^(k t)$], [$A e^(k t)$],
    [$C cos(omega t)$ of $C sin(omega t)$], [$A cos(omega t) + B sin(omega t)$],
    [$C e^(k t) sin(omega t)$], [$e^(k t) (A cos(omega t) + B sin(omega t))$],
  ),
  caption: [Keuze van $y_p (t)$ op basis van het rechterlid],
) <fig:yp-keuze>

Daarna ga je deze afleiden en terugsteken in de opgave, en uitwerken naar $A$
en $B$.

*Let op bij resonantie.* Als een term in je voorstel voor $y_p (t)$ al voorkomt
in de homogene oplossing $y_h (t)$, vermenigvuldig je voorstel dan met $t$ (of
met $t^2$ indien nodig).

*En waarom mag je ze dan optellen?* Omdat de vergelijking *lineair* is. Steek
$y_h + y_p$ in het linkerlid en splits het in twee stukken:

$ underbrace((y_h '' + a_1 y_h ' + a_0 y_h), = 0) + underbrace((y_p '' + a_1 y_p ' + a_0 y_p), = x(t)) = x(t) $

Het stuk van $y_h$ geeft nul --- zo heb je $y_h$ net gedefinieerd --- en het
stuk van $y_p$ geeft $x(t)$. Samen kom je dus precies op het rechterlid uit. Dat
is het principe van *superpositie*: denk aan een massa aan een veer, waarbij
$y_h$ beschrijft hoe het systeem uit zichzelf uitdempt na een duw, en $y_p$ hoe
het reageert op een externe kracht. De totale beweging is de som van die twee.
Bij een niet-lineaire vergelijking gaat die splitsing niet op.

=== Wat zijn die nu eigenlijk <sec:ldv-betekenis>

#wrap-figure(
  cetz.canvas({
    plot.plot(
      size: (4.4, 2.6),
      axis-style: "school-book",
      x-min: 0,
      x-max: 4,
      y-min: 0,
      y-max: 1.15,
      x-tick-step: 1,
      y-tick-step: 0.5,
      x-label: $t$,
      y-label: none,
      {
        plot.add(
          domain: (0, 4),
          samples: 140,
          style: (stroke: schoolBlue + 1.4pt),
          t => calc.exp(-t),
        )
      },
    )
  }),
  caption: [$e^(-t)$ vergaat over de tijd],
  label: <fig:ldv-uitdoving>,
  width: 6.2cm,
)[
  De homogene is de *begintoestand* van onze functie. Elk systeem heeft een
  rustfase, en we modelleren dit met de homogene oplossing. Daarom hebben we
  ook iets van $e^(-lambda t)$, zodat dit effect vergaat over de tijd.

  De particuliere is de reactie van het systeem op de input die gegeven is.
  Daarom staat die er ook nog steeds in als de rest is uitgedoofd.
]

Deze methode gaan we op grotere differentiaalvergelijkingen niet meer toepassen,
omdat het dan veel rekenwerk wordt. Dan gaan we omzetten naar Laplace
(@ch:laplace) om zo onze vergelijkingen te krijgen. Maar ook hier kunnen we onze
antwoorden opsplitsen, in de *transiënte respons* en de *stationaire respons* ---
dat zijn net onze $y_h$ en $y_p$.

*Voorbeeld.*

*Opgave:* los op: $y' + 2y = 4$, met $y(0) = 0$.

*Homogeen.* Uitkomst op nul, afgeleide vervangen: $lambda + 2 = 0$, dus
$lambda = -2$ en $y_h (t) = C e^(-2t)$.

*Particulier.* Het rechterlid is een constante, dus gokken we $y_p = A$. Dan
is $y_p ' = 0$ en wordt de vergelijking $2A = 4$, dus $y_p = 2$.

*Samen.* $y(t) = C e^(-2t) + 2$, en uit $y(0) = 0$ volgt $C = -2$:
$ y(t) = underbrace(-2 e^(-2t), y_h) + underbrace(2, y_p) $

*Dezelfde oefening met Laplace.* Ter vergelijking, want verderop
(@ch:laplace) lossen we dit soort vergelijkingen zo op. Transformeer beide
leden, met $cal(L){y'} = s Y(s) - y(0)$ en $y(0) = 0$:

$ s Y(s) + 2 Y(s) = 4/s quad => quad Y(s) = 4/(s(s+2)) $

Splits die breuk op in partieelbreuken:

$ 4/(s(s+2)) = A/s + B/(s+2), quad A(s+2) + B s = 4 $

Met $s = 0$ krijg je $2A = 4$, dus $A = 2$; met $s = -2$ krijg je $-2B = 4$,
dus $B = -2$. Terugtransformeren geeft:

$ Y(s) = 2/s - 2/(s+2) quad => quad y(t) = 2 - 2 e^(-2t) $

Exact dezelfde uitkomst als hierboven. En let op wat er gebeurt bij het
opsplitsen: de term $2\/s$ wordt de constante $2$ --- onze $y_p$, de
stationaire respons --- en $-2\/(s+2)$ wordt $-2e^(-2t)$, onze $y_h$, de
transiënte respons. De opsplitsing die we hier met de hand maken, valt daar
dus vanzelf uit de partieelbreuken.

In een grafiek zie je het meteen: je vertrekt van de beginwaarde $y(0) = 0$, de
transiënt dooft uit, en wat overblijft is de respons op de input.

#figure(
  cetz.canvas({
    plot.plot(
      size: (11, 4.4),
      x-min: 0,
      x-max: 3,
      y-min: -2.6,
      y-max: 3.0,
      x-tick-step: 0.5,
      y-tick-step: 1,
      x-label: $t$,
      y-label: $y$,
      legend: "south",
      legend-style: (orientation: ltr, spacing: 0.6, item: (spacing: 0.3)),
      {
        plot.add(
          domain: (0, 3),
          samples: 160,
          style: (stroke: (paint: schoolGray, thickness: 1pt, dash: "dashed")),
          label: [$y_p = 2$ (stationair)],
          t => 2,
        )
        plot.add(
          domain: (0, 3),
          samples: 160,
          style: (stroke: schoolRed + 1.2pt),
          label: [$y_h = -2 e^(-2t)$ (transiënt)],
          t => -2 * calc.exp(-2 * t),
        )
        plot.add(
          domain: (0, 3),
          samples: 160,
          style: (stroke: schoolBlue + 1.8pt),
          label: [$y = y_h + y_p$],
          t => 2 - 2 * calc.exp(-2 * t),
        )
        plot.add(
          ((0, 0),),
          style: (stroke: none),
          mark: "o",
          mark-style: (fill: schoolBlue, stroke: white + 0.6pt),
          mark-size: 0.17,
        )
        plot.annotate({
          cetz.draw.content(
            (0.32, 0.42),
            text(size: 8pt, fill: schoolBlue)[$y(0) = 0$],
            anchor: "west",
          )
          cetz.draw.content(
            (2.55, 2.4),
            text(size: 8pt, fill: schoolGray)[dooft uit naar $y_p$],
            anchor: "east",
          )
        })
      },
    )
  }),
  caption: [$y' + 2y = 4$ met $y(0) = 0$: de transiënt dooft uit, de
    stationaire respons blijft],
) <fig:ldv-respons>

=== Stap-voor-stap oefeningen <sec:ldv-oefeningen-uitgewerkt>

*LDV oplossen.*

*Opgave:* los op: $y'' + 7y' + 10y = 4 sin 3t$.

*Stap 1 --- homogene oplossing.* Karakteristieke vergelijking:
$lambda^2 + 7 lambda + 10 = 0$. Discriminant $D = 49 - 40 = 9$, wortels
$lambda_(1,2) = (-7 plus.minus 3) \/ 2$, dus $-2$ en $-5$.
$ y_h (t) = C_1 e^(-2t) + C_2 e^(-5t) $

*Stap 2 --- particuliere oplossing.* Het rechterlid is goniometrisch
($sin 3t$). $omega = 3$ komt niet voor bij de $lambda$'s, dus geen resonantie.
Voorstel: $y_p (t) = A cos 3t + B sin 3t$, met afgeleiden
$ y_p' = -3A sin 3t + 3B cos 3t, quad y_p'' = -9A cos 3t - 9B sin 3t $

Invullen in de DV en sinus/cosinus groeperen:
$ cos 3t (A + 21B) + sin 3t (B - 21A) = 4 sin 3t $

Stelsel oplossen:
$
  cases(
    A + 21B = 0 => A = -21B,
    -21A + B = 4 => 442B = 4 => B = 2\/221,
  )
$
Dus $A = -42\/221$ en
$ y_p (t) = -42/221 cos 3t + 2/221 sin 3t $

*Stap 3 --- algemene oplossing.*
$ y(t) = C_1 e^(-2t) + C_2 e^(-5t) - 42/221 cos 3t + 2/221 sin 3t $

*Resonantie.*

*Opgave:* los op: $y'' + 16y = 8 sin 4t$, met $y(0) = 4$ en $y'(0) = 0$.

*Stap 1 --- homogene oplossing.* $lambda^2 + 16 = 0$, dus
$lambda = plus.minus 4j$.
$ y_h (t) = C_1 cos 4t + C_2 sin 4t $

*Stap 2 --- particuliere oplossing (resonantie!).* Het rechterlid is
$8 sin 4t$ met $omega = 4$, en dat komt al voor in $y_h (t)$. Het voorstel
moet dus met $t$ vermenigvuldigd worden:
$ y_p (t) = t(A cos 4t + B sin 4t) = A t cos 4t + B t sin 4t $

Afgeleiden bepalen met de productregel geeft
$ y_p'' = -8A sin 4t - 16 A t cos 4t + 8B cos 4t - 16 B t sin 4t $

Invullen in $y'' + 16y$: de termen met $t$ vallen weg tegen $16 y_p$ (check
dit!). Wat overblijft:
$ -8A sin 4t + 8B cos 4t = 8 sin 4t $
Coëfficiënten vergelijken: $-8A = 8 => A = -1$ en $8B = 0 => B = 0$, dus
$y_p (t) = -t cos 4t$.

*Stap 3 --- algemene oplossing en beginvoorwaarden.*
$ y(t) = C_1 cos 4t + C_2 sin 4t - t cos 4t $
- $y(0) = C_1 = 4$
- $y'(t) = -4 C_1 sin 4t + 4 C_2 cos 4t - (cos 4t - 4t sin 4t)$, dus
  $y'(0) = 4 C_2 - 1 = 0 => C_2 = 1\/4$

*Eindoplossing:*
$ y(t) = 4 cos 4t + 1/4 sin 4t - t cos 4t $

*Key insight:* bij resonantie groeit de respons lineair in de tijd
(de term $-t cos 4t$) --- het systeem wordt aangedreven op precies zijn
eigen frequentie.

=== Oefeningen <sec:ldv-oefeningen>

Los de volgende differentiaalvergelijkingen op:

+ $y'' + 6y' + 5y = 0$, met $y(0) = 4$, $y'(0) = 0$
+ $y'' + 6y' + 25y = 0$, met $y(0) = 4$, $y'(0) = 0$
+ $y'' + 6y' + 9y = 0$, met $y(0) = 2$, $y'(0) = 0$
+ $y' + 3y = 4 e^(-t)$, met $y(0) = 1$
+ $y'' + 16y = 8 sin 2t$, met $y(0) = 4$, $y'(0) = 0$
+ $y'' + 16y = 8 sin 4t$, met $y(0) = 4$, $y'(0) = 0$ (let op: resonantie!)
+ $y'' + 6y' + 25y = 689 sin(20t)$, met $y(0) = 2$, $y'(0) = 1$
+ $y'' + 6y' + 9y = 30 sin(3t)$, met $y(0) = 1$, $y'(0) = 0$
+ $y''' + 6y' = t$, met nul-beginvoorwaarden
