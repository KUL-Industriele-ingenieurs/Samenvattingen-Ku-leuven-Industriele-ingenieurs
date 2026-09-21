#import "../../school-template.typ": *

// ============================================================================
//  Hoofdstuk 2 — Signalen: basissignalen en bewerkingen
//  Deel 2: Wiskundige technieken
//  Inhoud deels overgezet uit _OLD/chapters/3_Inleiding systemen.tex
//  Uitgewerkt met MATHSYS_slides_02_NL_basissignalen_bewerkingen_25
// ============================================================================

= Signalen --- basissignalen en bewerkingen <ch:signalen>

== Wat is een signaal? <sec:wat-is-een-signaal>

// TODO: definitie signaal, continu vs. discreet, periodiek vs. aperiodiek,
// even/oneven, energie- vs. vermogensignalen

== Basissignalen <sec:basissignalen>

Bijna elk signaal dat je in dit vak tegenkomt, bouw je op uit een handvol
bouwstenen: de *stap*, de *puls*, de *helling* en de *impuls*. Ze hangen
bovendien met elkaar samen via afleiden en integreren, dus als je er één kent,
ken je ze eigenlijk alle vier.

=== Stapfunctie (Heaviside-functie) <sec:stapfunctie>

Een schakelaar die je op één bepaald moment omzet: daarvoor is er niets, daarna
is er een constante waarde. Dat is precies wat de stapfunctie $u(t)$ beschrijft.
Ze is het wiskundige model van "aanzetten op $t = 0$".

$ u(t) = cases(
  0 quad & t < 0,
  0.5 quad & t = 0,
  1 quad & t > 0,
) $

met:
- $t$ --- tijd [s]
- $u(t)$ --- amplitude, dimensieloos [-]

De waarde $0.5$ in $t = 0$ is een afspraak: ze ligt halverwege de sprong. Voor
integralen maakt dat niets uit --- één enkel punt heeft oppervlakte nul --- dus
in de praktijk gebruik je gewoon $u(t) = 0$ vóór de sprong en $u(t) = 1$ erna.

Wil je de sprong op een ander tijdstip $t_0$ leggen, dan verschuif je het
argument. Overal waar vroeger $t$ stond, staat nu $t - t_0$:

$ u(t - t_0) = cases(
  0 quad & t < t_0,
  1 quad & t > t_0,
) $

met:
- $t_0$ --- tijdstip van de sprong [s]

#figure(
  cetz.canvas({
    import cetz.draw: *
    // assen
    line((-1, 0), (4, 0), mark: (end: "straight"), name: "x")
    content((4.2, 0), $t$)
    line((0, -0.5), (0, 2), mark: (end: "straight"))
    content((0, 2.3), $u(t - t_0)$)
    // ticks
    line((2, 0.1), (2, -0.1))
    content((2, -0.4), $t_0$)
    line((0.1, 1), (-0.1, 1))
    content((-0.35, 1), $1$)
    // functie
    line((-1, 0), (2, 0), stroke: schoolBlue + 1.5pt)
    line((2, 1), (4, 1), stroke: schoolBlue + 1.5pt)
    line((2, 0), (2, 1), stroke: (dash: "dashed", paint: gray))
    // punten
    circle((2, 0), radius: 0.07, fill: white, stroke: schoolBlue + 1pt)
    circle((2, 1), radius: 0.07, fill: schoolBlue, stroke: schoolBlue)
  }),
  caption: [Stapfunctie $u(t - t_0)$: de sprong verschuift mee met $t_0$],
) <fig:heaviside>

*Signalen met eindige duur.*

De stapfunctie is niet alleen nuttig om iets aan te zetten. Trek je twee
stappen van elkaar af, dan krijg je een *venster*: een functie die 1 is tussen
$0$ en $t_0$ en overal elders 0. Vermenigvuldig je een signaal met dat venster,
dan knip je er een stuk uit. Zo stel je een signaal met *eindige duur* voor.

$ x(t) = sin(omega t) dot [u(t) - u(t - t_0)] $

met:
- $omega$ --- pulsatie (hoekfrequentie) [rad/s]
- $u(t) - u(t - t_0)$ --- het venster: 1 voor $0 < t < t_0$, elders 0

#figure(
  cetz.canvas({
    import cetz.draw: *
    let A = 0.9
    let T = 1.2
    let t0 = 3.6
    // assen
    line((-1, 0), (5, 0), mark: (end: "straight"))
    content((5.2, 0), $t$)
    line((0, -1.4), (0, 1.4), mark: (end: "straight"))
    content((0.55, 1.5), $x(t)$)
    // omhullende (stippellijn) = het venster
    line((0, A), (t0, A), stroke: (dash: "dotted", paint: schoolGray))
    line((0, -A), (t0, -A), stroke: (dash: "dotted", paint: schoolGray))
    line((t0, -A), (t0, A), stroke: (dash: "dashed", paint: schoolGray))
    // nul buiten het venster
    line((-1, 0), (0, 0), stroke: schoolBlue + 1.5pt)
    line((t0, 0), (5, 0), stroke: schoolBlue + 1.5pt)
    // sinus binnen het venster
    let pts = range(0, 145).map(i => {
      let t = i * t0 / 144
      (t, A * calc.sin(2 * calc.pi * t / T))
    })
    line(..pts, stroke: schoolBlue + 1.5pt)
    // labels
    content((-0.25, -0.3), $0$)
    content((t0, -1.2), $t_0$)
  }),
  caption: [Een sinus met eindige duur: $sin(omega t)$ vermenigvuldigd met het
    venster $u(t) - u(t - t_0)$],
) <fig:venster>

=== Blokpuls <sec:blokpuls>

Dat venster van hierboven is op zich al een basissignaal. Geef je het een
amplitude $A$ in plaats van 1, dan heet het een *puls* met breedte $t_0$ en
amplitude $A$.

$ x(t) = A (u(t) - u(t - t_0)) $

met:
- $A$ --- amplitude van de puls (eenheid van het signaal)
- $t_0$ --- breedte (duur) van de puls [s]

#figure(
  cetz.canvas({
    import cetz.draw: *
    line((-1.2, 0), (4.5, 0), mark: (end: "straight"))
    content((4.7, 0), $t$)
    line((0, -0.5), (0, 2), mark: (end: "straight"))
    content((0.5, 2.1), $x(t)$)
    // puls
    line((-1.2, 0), (0, 0), stroke: schoolBlue + 1.5pt)
    line((0, 0), (0, 1.4), stroke: schoolBlue + 1.5pt)
    line((0, 1.4), (2.6, 1.4), stroke: schoolBlue + 1.5pt)
    line((2.6, 1.4), (2.6, 0), stroke: schoolBlue + 1.5pt)
    line((2.6, 0), (4.5, 0), stroke: schoolBlue + 1.5pt)
    // labels
    line((0.1, 1.4), (-0.1, 1.4))
    content((-0.35, 1.4), $A$)
    content((2.6, -0.4), $t_0$)
    content((1.3, 0.7), text(size: 0.85em, fill: schoolGray)[opp. $A t_0$])
  }),
  caption: [Blokpuls met amplitude $A$ en breedte $t_0$],
) <fig:blokpuls>

De oppervlakte onder de puls is $A t_0$. Onthoud dat: als je die oppervlakte
constant houdt op 1 en de breedte naar nul laat gaan, kom je bij de
deltafunctie uit (@sec:dirac).

=== Hellingsfunctie (ramp) <sec:ramp>

De stap zet iets ineens aan. Soms wil je een grootheid die vanaf een bepaald
moment *lineair blijft aangroeien* --- denk aan een as die met constante snelheid
verdraait, of een tank die met constant debiet volloopt. Dat is de
*hellingsfunctie* of *ramp* $r(t)$, en ze is niets anders dan de integraal van
de stapfunctie.

*Stap 1 --- de integraal opschrijven:*
$ r(t) = integral_(-oo)^(t) u(tau) dif tau $

*Stap 2 --- geval $t < 0$: de integrand is overal nul:*
$ r(t) = integral_(-oo)^(t) 0 dif tau = 0 $

*Stap 3 --- geval $t > 0$: pas vanaf $tau = 0$ is de integrand 1:*
$ r(t) = integral_(0)^(t) 1 dif tau = [tau]_0^t = t $

*Resultaat:*
$ r(t) = cases(
  0 quad & t < 0,
  t quad & t > 0,
) quad = quad t dot u(t) $

met:
- $tau$ --- integratievariabele [s]
- $r(t)$ --- hellingsfunctie; groeit met helling 1 per seconde

De verschoven versie $r(t - t_0)$ blijft nul tot $t_0$ en klimt daarna met
dezelfde helling.

#figure(
  grid(
    columns: (1fr, 1fr),
    gutter: 1.5em,
    cetz.canvas({
      import cetz.draw: *
      line((-1.2, 0), (3.2, 0), mark: (end: "straight"))
      content((3.4, 0), $t$)
      line((0, -0.4), (0, 2.2), mark: (end: "straight"))
      content((0.45, 2.3), $r(t)$)
      line((-1.2, 0), (0, 0), stroke: schoolBlue + 1.5pt)
      line((0, 0), (2.4, 1.9), stroke: schoolBlue + 1.5pt)
      content((-0.25, -0.3), $0$)
    }),
    cetz.canvas({
      import cetz.draw: *
      line((-1.2, 0), (3.2, 0), mark: (end: "straight"))
      content((3.4, 0), $t$)
      line((0, -0.4), (0, 2.2), mark: (end: "straight"))
      content((0.65, 2.3), $r(t - t_0)$)
      line((-1.2, 0), (1, 0), stroke: schoolBlue + 1.5pt)
      line((1, 0), (2.8, 1.45), stroke: schoolBlue + 1.5pt)
      line((1, 0), (1, 1.45), stroke: (dash: "dashed", paint: schoolGray))
      content((1, -0.4), $t_0$)
    }),
  ),
  caption: [Hellingsfunctie $r(t)$ (links) en de verschoven versie
    $r(t - t_0)$ (rechts)],
) <fig:ramp>

*De ladder helling --- stap --- impuls.*

De drie functies zijn één familie: telkens je afleidt, ga je een trede omlaag;
telkens je integreert, een trede omhoog.

#figure(
  cetz.canvas({
    import cetz.draw: *
    let node(x, lbl) = {
      rect((x - 0.85, -0.45), (x + 0.85, 0.45),
        radius: 0.12, stroke: schoolBlue + 1pt, fill: schoolBlue.lighten(90%))
      content((x, 0), lbl)
    }
    node(0, $r(t)$)
    node(3.6, $u(t)$)
    node(7.2, $delta(t)$)
    // afleiden (boven, naar rechts)
    line((0.95, 0.28), (2.65, 0.28), mark: (end: "straight"), stroke: schoolRed + 1pt)
    line((4.55, 0.28), (6.25, 0.28), mark: (end: "straight"), stroke: schoolRed + 1pt)
    content((1.8, 0.7), text(size: 0.8em, fill: schoolRed)[afleiden])
    content((5.4, 0.7), text(size: 0.8em, fill: schoolRed)[afleiden])
    // integreren (onder, naar links)
    line((2.65, -0.28), (0.95, -0.28), mark: (end: "straight"), stroke: schoolGreen + 1pt)
    line((6.25, -0.28), (4.55, -0.28), mark: (end: "straight"), stroke: schoolGreen + 1pt)
    content((1.8, -0.72), text(size: 0.8em, fill: schoolGreen)[integreren])
    content((5.4, -0.72), text(size: 0.8em, fill: schoolGreen)[integreren])
  }),
  caption: [Rood = afleiden, groen = integreren. Ken je één van de drie, dan ken
    je ze alle drie.],
) <fig:ladder-signalen>

=== Dirac-deltafunctie <sec:dirac>

De deltafunctie $delta(t)$ modelleert een signaal dat zich *ogenblikkelijk*
voordoet en even snel weer verdwijnt: een tik met een hamer, een blikseminslag,
een spanningspiek. Ze is de afgeleide van de stapfunctie --- op het moment van
de sprong is de helling oneindig, overal elders nul.

$ delta(t): quad cases(
  delta(t) = 0 quad & t != 0,
  integral_(-oo)^(+oo) delta(t) dif t = 1 quad & #[]
) $

met:
- $delta(t)$ --- impulsfunctie; nul overal behalve in $t = 0$
- de tweede regel --- de oppervlakte onder de impuls is precies 1

Voor een verschoven impuls $delta(t - t_0)$ ligt de piek in $t = t_0$.

*Interpretatie als een steeds smallere puls.*

Waar komt "oneindig hoog met oppervlakte 1" vandaan? Neem de blokpuls uit
@sec:blokpuls met breedte $a$ en hoogte $1\/a$. De oppervlakte is dan
$a dot 1\/a = 1$, ongeacht hoe klein je $a$ kiest. Laat je $a arrow.r 0$ gaan,
dan wordt de puls oneindig smal en oneindig hoog, maar blijft de oppervlakte 1.
Die limiet is $delta(t)$.

#figure(
  cetz.canvas({
    import cetz.draw: *
    let panel(dx, w, h, lbl) = {
      line((dx - 1.3, 0), (dx + 1.3, 0), stroke: 0.7pt)
      if w > 0 {
        line((dx, -0.15), (dx, h + 0.45), stroke: 0.7pt)
        rect((dx - w / 2, 0), (dx + w / 2, h),
          stroke: schoolBlue + 1.2pt, fill: schoolBlue.lighten(85%))
        // breedte-aanduiding
        line((dx - w / 2, -0.3), (dx + w / 2, -0.3),
          mark: (start: "straight", end: "straight"), stroke: schoolGray + 0.6pt)
      } else {
        line((dx, 0), (dx, h), stroke: schoolBlue + 1.6pt, mark: (end: "stealth"))
      }
      content((dx, -0.75), text(size: 0.85em)[#lbl])
    }
    panel(0, 1.6, 0.7, $a = 1$)
    panel(3.9, 0.64, 1.75, $a = 0.4$)
    panel(7.8, 0, 2.0, $a arrow.r 0$)
    content((7.8 + 0.5, 2.0), text(size: 0.9em)[$delta(t)$])
    line((1.6, 0.9), (2.3, 0.9), mark: (end: "straight"), stroke: schoolGray + 1pt)
    line((5.5, 0.9), (6.2, 0.9), mark: (end: "straight"), stroke: schoolGray + 1pt)
    content((3.9, 2.6), text(size: 0.85em, fill: schoolGray)[oppervlakte blijft 1])
  }),
  caption: [De deltafunctie als limiet van een blokpuls met breedte $a$ en
    hoogte $1\/a$],
) <fig:delta-limiet>

*Eigenschappen van de deltafunctie.*

+ *Afgeleide van de stap.* De impuls is wat er overblijft als je de sprong
  afleidt:
  $ u'(t) = delta(t) $

+ *Eenheidsoppervlakte.* Hoe smal de piek ook is, de oppervlakte is 1:
  $ integral_(-oo)^(+oo) delta(t) dif t = 1 $

+ *Bemonsteringseigenschap.* Vermenigvuldig je een signaal met een impuls, dan
  blijft alleen de waarde van dat signaal op het tijdstip van de impuls over:
  $ x(t) dot delta(t - t_0) = x(t_0) dot delta(t - t_0) $
  Buiten $t_0$ is $delta$ toch nul, dus daar valt het product weg. In $t_0$ zelf
  is $x(t)$ gewoon het getal $x(t_0)$, en dat mag je vóór de impuls zetten.

+ *Zeefeigenschap.* Integreer je dat product, dan houd je één getal over:
  $ integral_(-oo)^(+oo) delta(t - t_0) f(t) dif t = f(t_0) $
  De impuls "zeeft" als het ware de waarde $f(t_0)$ uit de hele functie. Dit
  volgt meteen uit de vorige twee eigenschappen: haal $f(t_0)$ buiten de
  integraal, en wat overblijft is $integral delta(t - t_0) dif t = 1$.

met:
- $x(t), f(t)$ --- willekeurig continu signaal
- $t_0$ --- tijdstip waar de impuls staat [s]

#concept(title: "Waarom de delta zo belangrijk is")[
  De deltafunctie is de "kortst mogelijke tik" die je een systeem kunt geven.
  De respons daarop --- de *impulsresponsie* $h(t)$ --- is de vingerafdruk van
  een LTC-systeem: ken je $h(t)$, dan ken je de respons op *elk* ingangssignaal
  via de convolutie (@sec:convolutie).
]

#waarschuwing[
  $delta(t)$ is strikt genomen geen gewone functie: er bestaat geen functie die
  overal nul is en toch oppervlakte 1 heeft. Ze is een *distributie*, en heeft
  pas betekenis *binnen een integraal*. Schrijf dus nooit "$delta(0) = oo$" als
  een getal --- gebruik de zeefeigenschap.
]

=== Impulstrein en bemonstering <sec:impulstrein>

Eén impuls geeft je de waarde van een signaal op één tijdstip. Herhaal je die
impuls periodiek, dan krijg je de waarden op een hele reeks tijdstippen --- en
dat is precies wat een analoog-naar-digitaal-omzetter doet. Zo'n periodieke
herhaling van impulsen heet een *impulstrein* $delta_T (t)$.

$ delta_T (t) = sum_(k = -oo)^(+oo) delta(t - k T) $

met:
- $T$ --- bemonsteringsperiode, de tijd tussen twee impulsen [s]
- $k$ --- geheel getal, $k in ZZ$ (nummer van de impuls)
- $1\/T$ --- bemonsteringsfrequentie [Hz]

#figure(
  cetz.canvas({
    import cetz.draw: *
    line((-2.6, 0), (4.4, 0), stroke: 0.8pt)
    content((4.6, 0), $t$)
    for k in range(-2, 4) {
      let x = k * 1.2
      line((x, 0), (x, 1.3), stroke: schoolBlue + 1.3pt, mark: (end: "straight"))
    }
    content((-1.2, -0.4), $-T$)
    content((0, -0.4), $0$)
    content((1.2, -0.4), $T$)
    content((2.4, -0.4), $2T$)
    content((0.6, 1.95), text(size: 0.85em, fill: schoolGray)[afstand $T$])
    line((0.05, 1.6), (1.15, 1.6), mark: (start: "straight", end: "straight"), stroke: schoolGray + 0.7pt)
  }),
  caption: [Impulstrein $delta_T (t)$: dezelfde impuls, om de $T$ seconden
    herhaald],
) <fig:impulstrein>

*Bemonstering.* Bemonsteren (samplen) is niets anders dan het continue-tijd
(= analoge) signaal $x(t)$ *vermenigvuldigen* met de impulstrein. Pas daarna de
bemonsteringseigenschap toe op elke term:

*Stap 1 --- vermenigvuldig met de impulstrein:*
$ x(t) delta_T (t) = x(t) sum_(k = -oo)^(+oo) delta(t - k T) $

*Stap 2 --- breng $x(t)$ binnen de som (die is lineair):*
$ = sum_(k = -oo)^(+oo) x(t) delta(t - k T) $

*Stap 3 --- bemonsteringseigenschap per term, met $t_0 = k T$:*
$ = sum_(k = -oo)^(+oo) x(k T) delta(t - k T) $

met:
- $x(k T)$ --- de monsterwaarde (sample) op tijdstip $k T$
- $x(t) delta_T (t)$ --- het bemonsterde signaal: een rij impulsen waarvan de
  oppervlaktes de meetwaarden zijn

#figure(
  cetz.canvas({
    import cetz.draw: *
    let f(t) = 1.7 * calc.exp(-calc.pow(t - 2.4, 2) / 2.6)
    // assen
    line((-0.5, 0), (5.6, 0), mark: (end: "straight"), stroke: 0.8pt)
    content((5.8, 0), $t$)
    line((0, -0.3), (0, 2.3), mark: (end: "straight"), stroke: 0.8pt)
    // analoog signaal
    let pts = range(0, 111).map(i => {
      let t = i * 5.2 / 110
      (t, f(t))
    })
    line(..pts, stroke: (paint: schoolGray, thickness: 1pt, dash: "dashed"))
    content((4.9, 1.0), text(size: 0.85em, fill: schoolGray)[$x(t)$])
    // monsters (te kleine impulsen weglaten, die vallen samen met de as)
    for k in range(0, 14) {
      let t = k * 0.4
      if f(t) > 0.15 {
        line((t, 0), (t, f(t)), stroke: schoolRed + 1.1pt, mark: (end: "straight"))
      }
    }
    content((1.9, 2.15), text(size: 0.85em, fill: schoolRed)[$x(k T) dot delta(t - k T)$])
    // periode T
    line((2.0, -0.45), (2.4, -0.45), mark: (start: "straight", end: "straight"), stroke: schoolGray + 0.7pt)
    line((2.0, -0.3), (2.0, 0), stroke: (dash: "dotted", paint: schoolGray))
    line((2.4, -0.3), (2.4, 0), stroke: (dash: "dotted", paint: schoolGray))
    content((2.2, -0.8), text(size: 0.8em, fill: schoolGray)[$T$])
  }),
  caption: [Bemonstering: de hoogte van elke impuls is de waarde $x(k T)$ van
    het analoge signaal op dat tijdstip],
) <fig:bemonstering>

#concept(title: "Eerste stap in A/D-omzetting")[
  Bemonstering is de *eerste* stap in een analoog-naar-digitaal-omzetting
  (A/D, Analog-to-Digital). Je legt de tijd-as vast op discrete tijdstippen
  $k T$. Daarna volgt nog *kwantisatie* (de amplitude afronden op een eindig
  aantal niveaus) en *codering* (er bits van maken). Hoe klein $T$ moet zijn om
  het signaal nadien nog te kunnen reconstrueren, volgt uit het
  bemonsteringstheorema van Nyquist-Shannon (@ch:fouriertransformatie).
]

=== Verschuiven en herhalen met impulsen <sec:impuls-verschuiven>

Tot hiertoe *vermenigvuldigden* we met de impulstrein. Doe je met diezelfde
impulstrein een *convolutie*, dan gebeurt er iets totaal anders: je verschuift
en herhaalt het signaal in plaats van het te bemonsteren. Dat maakt van de
impuls het handigste gereedschap om grafieken te verplaatsen op de tijd-as.

*Een impuls verschuift een signaal.*

Vertrek van de definitie van de convolutie (@sec:convolutie) en vul $delta$ in
als tweede functie.

*Stap 1 --- convolutie-integraal opschrijven:*
$ x(t) * delta(t - t_0) = integral_(-oo)^(+oo) x(tau) delta(t - t_0 - tau) dif tau $

*Stap 2 --- de impuls is even ($delta(-u) = delta(u)$), dus mag je het argument
omkeren:*
$ = integral_(-oo)^(+oo) x(tau) delta(tau - (t - t_0)) dif tau $

*Stap 3 --- zeefeigenschap toepassen, met de piek op $tau = t - t_0$:*
$ = x(t - t_0) $

*Resultaat:*
$ x(t) * delta(t - t_0) = x(t - t_0) $

met:
- $t_0$ --- de plaats van de impuls; ook precies de verschuiving die je krijgt [s]
- $x(t - t_0)$ --- het originele signaal, ongewijzigd van vorm, $t_0$ naar rechts

De vorm van $x(t)$ verandert dus niet: convolueren met een impuls *verplaatst*
de grafiek alleen. Staat de impuls op $t_0 > 0$, dan schuift de grafiek naar
rechts (later); staat ze op $t_0 < 0$, dan naar links (vroeger). Voor $t_0 = 0$
krijg je $x(t) * delta(t) = x(t)$: de deltafunctie is het *neutrale element* van
de convolutie, net zoals $1$ dat is voor de vermenigvuldiging.

*Een impulstrein herhaalt een signaal.*

Een impulstrein is een som van impulsen, en convolutie is lineair. Je mag dus
term per term werken, en elke term levert één verschoven kopie op.

*Stap 1 --- impulstrein invullen:*
$ x(t) * delta_T (t) = x(t) * sum_(k = -oo)^(+oo) delta(t - k T) $

*Stap 2 --- convolutie is lineair, dus binnen de som:*
$ = sum_(k = -oo)^(+oo) x(t) * delta(t - k T) $

*Stap 3 --- elke term verschuift over $k T$:*
$ = sum_(k = -oo)^(+oo) x(t - k T) $

met:
- $k T$ --- verschuiving van de $k$-de kopie [s]
- $T$ --- de periode waarmee het resultaat zich herhaalt [s]

Je krijgt dus een oneindige rij kopieën van $x(t)$, om de $T$ seconden herhaald:
het signaal is *periodiek gemaakt* met periode $T$.

#figure(
  cetz.canvas({
    import cetz.draw: *
    let T = 1.9
    let x0 = 4.8
    let shape = ((0, 0), (0.35, 1.0), (0.62, 0.5), (0.82, 0.75), (1.05, 0))
    let sx = 1.35
    let sy = 0.95
    let sig(sx0, y0, col, th) = {
      line((sx0 - 0.9, y0), (sx0, y0), stroke: col + th)
      line(..shape.map(p => (sx0 + p.at(0) * sx, y0 + p.at(1) * sy)), stroke: col + th)
      line((sx0 + 1.05 * sx, y0), (sx0 + 1.05 * sx + 0.4, y0), stroke: col + th)
    }
    // scheidingslijn met de rijlabels
    line((-0.6, -0.9), (-0.6, 6.0), stroke: schoolGray + 0.8pt)
    // ---- rij 1: het signaal
    line((-0.2, 4.7), (9.9, 4.7), stroke: 0.8pt)
    line((x0, 4.7), (x0, 5.7), stroke: schoolGray + 0.6pt)
    sig(x0, 4.7, schoolBlue, 1.3pt)
    content((7.3, 5.4), text(size: 0.85em)[$x(t)$])
    // ---- rij 2: de impulstrein
    line((-0.2, 2.6), (9.9, 2.6), stroke: 0.8pt)
    for k in range(-2, 3) {
      let px = x0 + k * T
      line((px, 2.6), (px, 3.55), stroke: schoolRed + 1.2pt, mark: (end: "straight"))
    }
    content((x0, 2.3), text(size: 0.85em)[$0$])
    line((x0, 3.75), (x0 + T, 3.75),
      mark: (start: "straight", end: "straight"), stroke: schoolGray + 0.6pt)
    content((x0 + T / 2, 4.05), text(size: 0.8em, fill: schoolGray)[$T$])
    // ---- rij 3: de periodieke herhaling
    line((-0.2, 0.35), (9.9, 0.35), stroke: 0.8pt)
    line((x0, 0.35), (x0, 1.45), stroke: schoolGray + 0.6pt)
    for k in range(-2, 3) {
      let px = x0 + k * T
      if k == 0 {
        sig(px, 0.35, schoolBlue, 1.3pt)
      } else {
        sig(px, 0.35, schoolGray, 1pt)
      }
    }
    let lbls = ($x(t + 2T)$, $x(t + T)$, $x(t)$, $x(t - T)$, $x(t - 2T)$)
    for k in range(0, 5) {
      let px = x0 + (k - 2) * T + 0.7
      content((px, -0.1), text(size: 0.72em)[#lbls.at(k)])
    }
    // ---- rijlabels links
    content((-2.0, 5.1), text(size: 0.8em)[signaal $x(t)$])
    content((-2.0, 4.0), text(size: 1.0em)[$*$])
    content((-2.0, 3.0), text(size: 0.8em)[impulstrein $delta_T (t)$])
    content((-2.0, 1.9), text(size: 1.0em)[$=$])
    content((-2.0, 0.75), text(size: 0.8em)[$x(t) * delta_T (t)$])
  }),
  caption: [Convolutie met een impulstrein: elke impuls levert één verschoven
    kopie van $x(t)$ op (blauw = het origineel, grijs = de kopieën)],
) <fig:conv-impulstrein>

#concept(title: "Vermenigvuldigen versus convolueren met dezelfde impulstrein")[
  Dezelfde $delta_T (t)$, twee heel verschillende resultaten:
  - *Vermenigvuldigen* $x(t) dot delta_T (t)$ --- je *knipt monsters uit* het
    signaal en houdt alleen de waarden $x(k T)$ over. Dat is *bemonsteren*.
  - *Convolueren* $x(t) * delta_T (t)$ --- je *plakt kopieën* van het hele
    signaal om de $T$ seconden achter elkaar. Dat is *periodiek herhalen*.

  Vuistregel: vermenigvuldigen met een impuls *selecteert* één tijdstip,
  convolueren met een impuls *verplaatst* het hele signaal naar dat tijdstip.
]

#waarschuwing[
  De kopieën overlappen elkaar als $x(t)$ langer duurt dan $T$. Je kunt het
  origineel dan niet meer uit de herhaling terughalen. Kies $T$ dus altijd
  groter dan de duur van $x(t)$.
]

// TODO: overige basissignalen — driehoekpuls, sinc, complexe exponentiële
// $e^(j omega t)$

== Bewerkingen op signalen <sec:bewerkingen>

// TODO: tijdsverschuiving, tijdsschaling, tijdsomkering, optellen,
// vermenigvuldigen

=== Convolutie <sec:convolutie>

Een convolutie is het schuiven van een functie over een andere functie.

$ (f * g)(t) = integral_(-oo)^(+oo) f(tau) g(t - tau) dif tau $

met:
- $f, g$ --- de twee signalen die geconvolueerd worden
- $tau$ --- integratievariabele (schuifparameter) [s]
- $t$ --- tijdstip waarop de convolutie geëvalueerd wordt [s]
- $*$ --- het symbool van de bewerking convolutie

Het belangrijkste rekenvoorbeeld ken je al: convolueren met een impuls
verschuift een signaal, en convolueren met een impulstrein herhaalt het
(@sec:impuls-verschuiven).

// TODO: grafische interpretatie (spiegelen → verschuiven → vermenigvuldigen →
// integreren), eigenschappen (commutatief, associatief, distributief)

== Filters <sec:filters>

// TODO: laag-, hoog-, band-doorlaat en bandsper; ideaal vs. realiseerbaar
// (wordt verder uitgewerkt bij de Fouriertransformatie, @sec:filters-fourier)
