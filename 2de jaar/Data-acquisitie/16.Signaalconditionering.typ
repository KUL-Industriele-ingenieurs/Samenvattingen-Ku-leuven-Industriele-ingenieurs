#import "../../school-template.typ": *

// BRON: ENKEL SLIDES: Signal_conditioning.pdf (45 p)

= Signaalconditionering <ch:signaalconditionering>

== Types signaalconditionering <sec:sc-types>

// TODO: Overzicht: excitatie, versterking, bekabeling, filtering, lineariseren, isolatie, transmitters.

== Excitatie: bron en brug <sec:sc-excitatie>

// TODO: Spanningsbron vs stroombron voor de Wheatstonebrug -- wat elk doet met de lineariteit.
// TODO: AC-excitatie van de brug en waarom (1/f-ruis en offsetdrift wegwerken).

== Versterking <sec:sc-versterking>

// TODO: Differentiaalversterker en instrumentatieversterker.
// TODO: COMMON MODE en CMRR (Common Mode Rejection Ratio): FORMULE CMRR = 20 log(A_d/A_cm) dB.
// TODO: Waarom een brugsignaal van enkele mV een hoge CMRR vereist.

== Bekabeling <sec:sc-bekabeling>

// TODO: Twee-, drie- en vierdraadsmeting -- zelfde redenering als bij de Pt100.
// TODO: Afscherming en aarding; waarom je maar op een punt aardt.

== Filtering en ruis <sec:sc-filtering>

// TODO: Ruisbronnen: 50 Hz net, thermische ruis, EMI.
// TODO: ANTI-ALIASINGFILTER: waarom die VOOR de ADC moet en niet erna. Link naar hoofdstuk 19.
// TODO: Bodediagram van het filter; afweging tussen orde, kantelfrequentie en faseverdraaiing.

== Transmitters <sec:sc-transmitters>

// TODO: 4-20 mA stroomlus: waarom stroom en niet spanning, en waarom de nul op 4 mA ligt (breukdetectie).
// TODO: Twee-, drie- en vierdraadstransmitters; smart transmitters (HART).

