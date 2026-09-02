#import "../../school-template.typ": *

= Oefeningen 3D-methode <ch:3d-oefeningen>

De methode zelf staat in @ch:3d-methode. Hieronder zes uitgewerkte cycli, van combinatorisch naar twee geheugens. Werk ze eerst zelf uit met de drie vragen uit @sec:3d-examenvraag voor je de oplossing leest.

#table(
  columns: (auto, auto, 1fr),
  inset: 8pt, stroke: none, align: horizon,
  fill: (x, y) => if y == 0 { gray.lighten(50%) },
  [*Cyclus*], [*Geheugens*], [*Waarom*],
  [$A^+ B^+ C^+ A^- B^- C^-$], [0], [geen enkele sensorcombinatie herhaalt],
  [$A^+ C^+ B^+ A^- C^- B^-$], [0], [idem],
  [$B^+ A^+ C^+ B^- A^- C^-$], [0], [idem],
  [$A B C A B C$ bistabiel], [0], [het ventiel onthoudt zelf, dus geen hulprelais],
  [$A B C B C A$], [1], [op één sensortoestand moet de machine $A^+$ of $A^-$ doen],
  [$A B B C C A$], [2], [uit punt $a_1$ vertrekken drie takken],
)

== Uitgewerkt voorbeeld: de ABCABC-cyclus

We nemen $A^+ B^+ C^+ A^- B^- C^-$ met *monostabiele* ventielen.

#figure(
  image("assets/OIS_3D_methode_ABCABC.png", width: 15cm),
  caption: [De ABCABC-cyclus: kubuspad, de vlakken per sensor, en de resulterende rungs],
  label: <fig:3d-abcabc>,
)

Elke spoel volgt hetzelfde patroon: een *trigger* die hem aanzet, een *zelfhouding* op zijn eigen uit-sensor, en een *afschakelvoorwaarde* die hem lost.

$ A^+ = c_0 + a_1 dot overline(c_1) $

met:
- $c_0$: startvoorwaarde, N.O.-contact van de sensor C-in $[-]$
- $a_1$: overnamevoorwaarde, N.O.-contact van de sensor A-uit $[-]$
- $overline(c_1)$: afschakelvoorwaarde, N.C.-contact van de sensor C-uit $[-]$

$ B^+ = a_1 + b_1 dot overline(a_0) $

met:
- $a_1$: trigger, N.O.-contact van de sensor A-uit $[-]$
- $b_1$: overnamevoorwaarde, N.O.-contact van de sensor B-uit $[-]$
- $overline(a_0)$: afschakelvoorwaarde, N.C.-contact van de sensor A-in $[-]$

$ C^+ = b_1 + c_1 dot overline(b_0) $

met:
- $b_1$: trigger, N.O.-contact van de sensor B-uit $[-]$
- $c_1$: overnamevoorwaarde, N.O.-contact van de sensor C-uit $[-]$
- $overline(b_0)$: afschakelvoorwaarde, N.C.-contact van de sensor B-in $[-]$

== Oefening: pick en place $A^+ C^+ B^+ A^- C^- B^-$

Drie cilinders met *monostabiele* ventielen (veer terug). Gevraagd: teken het kubuspad, controleer op overlap, en schrijf de drie spoelvergelijkingen.

Werk de drie vragen af uit @sec:3d-examenvraag. Bij *monostabiele* ventielen los je enkel de "+"-spoelen op: de "−"-beweging doet de veer.

*Oplossing*

Geen enkele sensorcombinatie herhaalt, dus dit is combinatorisch en er is geen geheugen nodig.

$ A^+ = b_0 + a_1 dot overline(b_1) $

met:
- $b_0$: startvoorwaarde, B is in (N.O. van sensor B-in) $[-]$
- $a_1$: zelfhouding, A is uit (N.O. van sensor A-uit) $[-]$
- $overline(b_1)$: afschakelvoorwaarde, laat los zodra B uit is (N.C. van sensor B-uit) $[-]$

$ C^+ = a_1 + c_1 dot overline(a_0) $

met:
- $a_1$: trigger, A is uit (N.O. van sensor A-uit) $[-]$
- $c_1$: zelfhouding, C is uit (N.O. van sensor C-uit) $[-]$
- $overline(a_0)$: afschakelvoorwaarde, laat los zodra A weer in is (N.C. van sensor A-in) $[-]$

$ B^+ = c_1 + b_1 dot overline(c_0) $

met:
- $c_1$: trigger, C is uit (N.O. van sensor C-uit) $[-]$
- $b_1$: zelfhouding, B is uit (N.O. van sensor B-uit) $[-]$
- $overline(c_0)$: afschakelvoorwaarde, laat los zodra C weer in is (N.C. van sensor C-in) $[-]$

#figure(
  image("assets/OIS_3D_methode_oefening_ACBACB.png", width: 14cm),
  caption: [Eigen uitwerking: kubuspad en verplaatsings-stap-diagram voor $A^+ C^+ B^+ A^- C^- B^-$],
  label: <fig:3d-acbacb>,
)

#concept(title: "Key insight")[
  Het is een *estafette*: elke "+"-spoel start op de eindsensor van de vorige cilinder en houdt zichzelf vast tot de sensor die zijn eigen terugtrekking aftrapt. In het stap-diagram is de gekleurde balk net de periode dat de spoel bekrachtigd is, en de zelfhoudingsterm $x_1 dot overline("stop")$ houdt die balk hoog tot de stop-sensor schakelt.
]

== Oefening met gekleurde assen: $B^+ A^+ C^+ B^- A^- C^-$

Zelfde methode, maar nu met een kleur per cilinder (A rood, B blauw, C groen). Elk padsegment krijgt de kleur van de bewegende cilinder, en in het stap-diagram zie je per kleur wanneer die spoel aan staat.

#figure(
  image("assets/OIS_3D_methode_oefening_BACBAC.png", width: 14cm),
  caption: [Kubuspad en stap-diagram voor $B^+ A^+ C^+ B^- A^- C^-$, met een kleur per cilinder],
  label: <fig:3d-bacbac>,
)

Monostabiele ventielen, en geen enkele sensorcombinatie herhaalt, dus opnieuw combinatorisch.

$ B^+ = c_0 + b_1 dot overline(c_1) $

met:
- $c_0$: startvoorwaarde, C is in (N.O. van sensor C-in) $[-]$
- $b_1$: zelfhouding, B is uit (N.O. van sensor B-uit) $[-]$
- $overline(c_1)$: afschakelvoorwaarde, laat los zodra C uit is (N.C. van sensor C-uit) $[-]$

$ A^+ = b_1 + a_1 dot overline(b_0) $

met:
- $b_1$: trigger, B is uit (N.O. van sensor B-uit) $[-]$
- $a_1$: zelfhouding, A is uit (N.O. van sensor A-uit) $[-]$
- $overline(b_0)$: afschakelvoorwaarde, laat los zodra B weer in is (N.C. van sensor B-in) $[-]$

$ C^+ = a_1 + c_1 dot overline(a_0) $

met:
- $a_1$: trigger, A is uit (N.O. van sensor A-uit) $[-]$
- $c_1$: zelfhouding, C is uit (N.O. van sensor C-uit) $[-]$
- $overline(a_0)$: afschakelvoorwaarde, laat los zodra A weer in is (N.C. van sensor A-in) $[-]$

== De bistabiele oplossing van de kubus <sec:kubus-bistabiel>

#figure(
  image("assets/OIS_3D_kubus_bistabiel.png", width: 12cm),
  caption: [De bistabiele 3D-oplossing van de kubus $A B C A B C$, met de commando's `A+`, `B+` en `C+`.],
  label: <fig:kubus-bistabiel>,
)
  Naast de monostabiele uitwerking bestaat er van de kubus $A B C A B C$ ook een #strong[bistabiele] oplossing. Daarin stuur je per cilinder twee commando's, `A+` en `A-`, naar een bistabiel ventiel dat zijn stand onthoudt. Je hebt dan geen doorlopend signaal nodig om een stand vast te houden: één puls volstaat.


== Kubus 2: $A B C B C A$ <sec:kubus-abcbca>

#wrap-figure(
  image("assets/OIS_3D_kubus_ABCBCA.png", width: 10cm),
  caption: [Kubus $A B C B C A$ met het extra geheugen dat `A+` van `A-` onderscheidt.],
  label: <fig:kubus-abcbca>,
)[
  Deze cyclus is #belangrijk[duidelijk niet combinatorisch]. Je hebt dus een extra geheugen nodig.

  De redenering van de slides:
  + Het probleem is `A+` tegenover `A-`: op eenzelfde sensortoestand moet de machine de ene keer `A+` en de andere keer `A-` doen. Je lost dat op door een variabele te maken die in beide gevallen een #strong[verschillende] toestand heeft.
  + Er is maar #strong[één] punt vóór de probleempositie: het startpunt van de cyclus. Daar zet of reset je dus het geheugen.
  + Dat lijkt sterk op de #keyterm[cascademethode]. Ook hier gebruik je per netwerk zo weinig mogelijk condities.

  In de oplossing van de slides gebruiken `A+`, `B+` en `A-` het geheugen als conditie.
]

== Kubus 3: $A B B C C A$ <sec:kubus-abbcca>

#figure(
  image("assets/OIS_3D_kubus_ABBCCA.png", width: 15cm),
  caption: [Kubus $A B B C C A$: drie takken vertrekken uit $a_1$, dus zijn er twee geheugens nodig.],
  label: <fig:kubus-abbcca>,
)
Ook deze is niet combinatorisch, en hier heb je #strong[meerdere] geheugens nodig.

De telling die je moet kunnen maken:
+ In punt $a_1$ starten #strong[drie] verschillende takken.
+ Om drie situaties te onderscheiden heb je minstens #strong[twee] geheugens nodig. Met twee geheugens heb je vier mogelijkheden, waarvan er dus één ongebruikt blijft.
+ Je verandert de toestand van de geheugens in #strong[unieke] punten: $a_0$, $b_1$ en $c_1$.

#belangrijk[Zodra je die keuze gemaakt hebt, wordt de rest van de oplossing triviaal.] Steek je denkwerk dus in het kiezen van de geheugens en hun schakelpunten, niet in het uitwerken achteraf.

