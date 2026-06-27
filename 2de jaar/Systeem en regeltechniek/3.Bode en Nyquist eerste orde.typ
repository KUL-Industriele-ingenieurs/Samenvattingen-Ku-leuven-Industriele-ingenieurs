#import "../../school-template.typ": *

// ============================================================================
//  W4 (SYS) — Bode- en Nyquistplots voor eerste-orde systemen
//  Slides: 3.SIGSYS_slides_03_NL_Bode_Nyquist_plots
//  Structuur-skelet. Oude versie: _OLD/3.Bode & Nyquist Plots.typ
// ============================================================================

= Bode- en Nyquistplots voor eerste-orde systemen <ch:bode-nyquist-eerste-orde>

In dit hoofdstuk leren we over Bode- en Nyquistplots voor eerste-orde systemen. Op het einde van de les moet je weten wat een bode plot is, hoe je die kan analyseren en kan tekenen van een gegeven transferfunctie $H(s)$. Daarna gaan we verder in op Nyquistplots

_(deze worden niet zoveel gevraagd en zijn eigenlijk herhaling van bode plots maar je moet wel weten hoe je die wou kunnen opstellen)_.

== Wat is een Bode-plot? <sec:bode-plot>


// uitleg bode plot bestaat uit twee delen amplitude en freauentie gedeelte met daarna meer uitleg over hoe we die wiskundig opstellen en daarna tekenen.


=== Waarom een Bode-plot? <sec:waarom-bode-plot>

Het probleem met

=== Bode-plot: amplitude <sec:bode-plot-amplitude>


=== Bode-plot: fase <sec:bode-plot-fase>


== Eerste orde bode plots <sec:eerste-orde-bode-plots>

// we gaan eerste orde systeemen bekijken en zien hoe hun bode plot eruit ziet en hoe we dit zelf kunnen tekenen.


// 1. pool of zero bij origin 2. all pole systeem 3. pole-zero systeem 4. all zero systeem 5. pole-zero systeem


== Tweede orde bode plots <sec:tweede-orde-bode-plots>

// we gaan tweede orde systeemen bekijken en zien hoe hun bode plot eruit ziet en hoe we dit zelf kunnen tekenen.

// 1. pool of zero bij origin 2. all pole systeem 3. pole-zero systeem 4. all zero systeem 5. pole-zero systeem


== Nyquist plots <sec:nyquist-plots>

Een Nyquist plot doet eigenlijk exact hetzelfde als een bode plot waarbij we de amplitude $|H(j omega)|$ en de fase $angle H(j omega)$ als functie van de frequentie $omega$ tekenen.

Het verschil zit in de *voorstelling*. Voor elke frequentie $omega$ is $H(j omega)$
een *complex getal*. Een Bode-plot zet de twee kenmerken van dat getal — grootte
en hoek — apart uit tegen $omega$. Een Nyquist-plot tekent datzelfde complexe
getal als één *punt* in het complexe vlak, en verbindt al die punten tot één
kromme. De pijl van de oorsprong naar dat punt is dus precies wat de Bode-plot
beschrijft:

$ underbrace(|H(j omega)|, "lengte vector") = "amplitude (Bode)" quad quad underbrace(angle H(j omega), "hoek vector") = "fase (Bode)" $

#figure(
  cetz.canvas({
    import cetz.draw: *
    let s = 4.5
    let R = 0.5 * s // straal = K/2
    let cx = 0.5 * s // middelpunt op Re-as = K/2

    // assen
    line((-0.45 * s, 0), (1.3 * s, 0), mark: (end: ">"))
    line((0, -0.95 * s), (0, 0.3 * s), mark: (end: ">"))
    content((1.33 * s, 0), text(size: 9pt)[ℜe], anchor: "west")
    content((0, 0.32 * s), text(size: 9pt)[ℑm], anchor: "south")

    // Nyquist-kromme: onderste halve cirkel, middelpunt (K/2,0), straal K/2
    let curve = ()
    for i in range(0, 73) {
      let phi = -i / 72 * calc.pi
      curve.push((cx + R * calc.cos(phi), R * calc.sin(phi)))
    }
    line(..curve, stroke: black + 1.2pt)

    // looprichting-pijltjes (van omega=0 naar omega=oo)
    let arrow-at(phi) = {
      let a = (cx + R * calc.cos(phi + 0.05), R * calc.sin(phi + 0.05))
      let b = (cx + R * calc.cos(phi), R * calc.sin(phi))
      line(a, b, stroke: black + 1.2pt, mark: (end: ">"))
    }
    arrow-at(-0.5 * calc.pi)
    arrow-at(-0.88 * calc.pi)

    // stippellijn van oorsprong naar omega = 1/tau  (hoek -45 graden)
    line((0, 0), (cx, -R), stroke: (paint: black, dash: "dotted", thickness: 1pt))

    // fase-boog phi = -45 graden bij de oorsprong
    let arc = ()
    for i in range(0, 16) {
      let a = -i / 15 * 45deg
      arc.push((0.42 * s * calc.cos(a), 0.42 * s * calc.sin(a)))
    }
    line(..arc, stroke: black + 0.7pt)
    content((0.5 * s, -0.2 * s), text(size: 9pt)[$phi = -45 degree$], anchor: "west")

    // ticks K en K/2
    line((0.5 * s, -0.05 * s), (0.5 * s, 0.05 * s), stroke: black + 0.8pt) // K/2 op Re-as
    content((0.5 * s, 0.07 * s), text(size: 9pt)[$K slash 2$], anchor: "south")
    content((1.0 * s, 0.07 * s), text(size: 9pt)[$K$], anchor: "south")
    line((-0.05 * s, -R), (0.05 * s, -R), stroke: black + 0.8pt) // K/2 op Im-as
    content((-0.08 * s, -R), text(size: 9pt)[$K slash 2$], anchor: "east")

    // markante punten
    let dot(p) = circle(p, radius: 0.045 * s, fill: black, stroke: none)
    dot((1.0 * s, 0)) // omega = 0
    dot((0, 0)) // omega = oo
    dot((cx, -R)) // omega = 1/tau

    // frequentie-labels (zonder overlap)
    content((1.0 * s, -0.02 * s), text(size: 9pt)[$omega = 0$], anchor: "north-west", padding: 0.25)
    content((-0.07 * s, 0.02 * s), text(size: 9pt)[$omega = infinity$], anchor: "south-east", padding: 0.1)
    content((cx, -R - 0.05 * s), text(size: 9pt)[$omega = 1 slash tau$], anchor: "north", padding: 0.2)
  }),
  caption: [Nyquist-plot van een eerste-orde systeem $H(j omega) = K / (1 + j omega tau)$. Elk punt hoort bij één frequentie $omega$; de *lengte* van de vector vanuit de oorsprong is de amplitude $|H(j omega)|$ en de *hoek* is de fase $angle H(j omega)$ — exact de twee grootheden die de Bode-plot apart uitzet. Bij $omega = 1 slash tau$ is de fase $-45 degree$.],
) <fig:nyquist-vs-bode>

Een Bode-plot "ontvouwt" deze vectoren dus: hij plot de *lengte* en de *hoek*
elk apart als functie van $omega$. Loop je de Nyquist-kromme af van $omega = 0$
($H = 1$, hoek $0 degree$) naar $omega arrow.r infinity$ ($H = 0$, hoek
$-90 degree$), dan zie je de amplitude krimpen en de fase draaien — net zoals in
de twee Bode-grafieken.


== Hoger orde bode plots <sec:hoger-orde-bode-plots>

// kort gedeeltde over hoe meedere orde bode plots eruit zien waarbij we polen en nullen hun effecten op bode plot met elkaar combineren. We gaan ook kijken naar hoe we een bode plot kunnen tekenen van een gegeven transferfunctie met polen en nullen.

