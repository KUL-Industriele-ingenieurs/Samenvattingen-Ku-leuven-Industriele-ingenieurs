#import "../../school-template.typ": *

// BRON: Samenvatting p.49-54 | 6_force.pdf

= Kracht- en torsiesensoren <ch:kracht>

== Meetprincipes <sec:kracht-principes>

// TODO: Kracht wordt altijd indirect gemeten: via vervorming van een bekend elastisch element.
// TODO: Load cell met rekstroken in volle brug -- link naar hoofdstuk 4.

== Force transducers <sec:force-transducers>

// TODO: Met LVDT, piezo-elektrisch, impedance head, force sensitive resistor (FSR).
// TODO: Waarom een piezo-krachtsensor wel een klap maar geen gewicht meet.

== Torque transducers <sec:torque>

// TODO: Rekstroken onder 45 graden op een as -- waarom net 45 graden.
// TODO: Contactloze uitlezing (sleepringen vs telemetrie).

== Piëzo-elektrische krachtsensoren <sec:piezo>

// Komt uit het oude hoofdstuk Piëzo (Samenvatting p.28-29). In de slides: 13.force, 10.accel, 12.pressure.

=== Piezo-elektrisch effect <sec:piezo-effect>

// TODO: Ladingsverplaatsing in een kristalrooster onder mechanische spanning; direct en omgekeerd effect.
// TODO: FORMULE: q = K x (of q = d F). Materialen: kwarts, PZT, PVDF.

=== Equivalent circuit <sec:piezo-circuit>

// TODO: Het kristal = ladingsbron parallel met zijn eigen capaciteit C_p; kabel en versterker voegen C_c toe.
// TODO: FORMULE: K_s = K / C_T met C_T = C_p + C_c -- langere kabel = minder gevoeligheid.
// TODO: FORMULE: f_0 = 1/(2 pi R C_T). De ingangsweerstand vormt een hoogdoorlaat.
// TODO: KERNPUNT: daarom kan een piezo GEEN statische kracht meten.
// TODO: Ladingsversterker: virtuele massa maakt C_c onschadelijk, v_out = -q/C_f.
// TODO: FIGUUR: Assets/piezo-ladingsbron-hoogdoorlaat-ladingsversterker.png (staat al in de vault).

