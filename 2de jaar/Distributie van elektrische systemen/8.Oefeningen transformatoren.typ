#import "../../school-template.typ": *

= Oefeningen transformatoren <ch:oefeningen>

Een derde van het examen bestaat uit oefeningen op transformatoren, en het is elk jaar dezelfde opbouw: uit de kenplaat en de twee proeven haal je het vervangingsschema, daarna belast je de transformator en bereken je $U_2$, het rendement en de fasoren. Er staat geen enkele transformatorformule op het formularium, zie @sec:formularium-examen.

== De basisgrootheden uit de kenplaat <sec:kenplaat-basis>

Alles vertrekt van twee getallen die je zelf moet afleiden: de nominale stroom en de basisimpedantie aan de primaire zijde.

$ I_(1n) = S_n / V_(1n) $

$ Z_"basis" = V_(1n) / I_(1n) = V_(1n)^2 / S_n $

met:
- $S_n$: nominaal schijnbaar vermogen [VA]
- $V_(1n)$: nominale primaire spanning [V]
- $I_(1n)$: nominale primaire stroom [A]
- $Z_"basis"$: basisimpedantie aan de primaire zijde [$Omega$]

De kortsluitspanning $u_"sc"$ en de nullaststroom $i_0$ staan op de kenplaat in procent. Die procenten zijn telkens een fractie van de nominale waarde: $V_"sc" = u_"sc" dot V_(1n)$ en $I_0 = i_0 dot I_(1n)$.

== Uitgewerkt: vervangingsschema uit de kenplaat <sec:oef-vervangingsschema>

#oefening(title: "Enkelfasige transformator, alle drie de modellen")[
  *Gegeven.* Een enkelfasige transformator met kenplaat:

  #table(
    columns: (auto, auto, auto, auto),
    align: (left, left, left, left),
    stroke: none,
    inset: 5pt,
    table.hline(stroke: 1pt),
    [$S_n = #"333,333" "kVA"$], [$#"14,434" "kV" \/ #"360,84" "V"$], [$f = 50 "Hz"$], [],
    [$i_0 = #"0,80" %$], [$P_0 = 950 "W"$], [$u_"sc" = #"3,5" %$], [$P_"sc" = 2700 "W"$],
    table.hline(stroke: 1pt),
  )

  *Gevraagd.* Het serie-, cantilever- en T-schema, herleid naar de primaire zijde.

  *Stap 1: de nominale stroom.* Zonder dit getal kan je geen enkele proef omrekenen.
  $ I_(1n) = S_n / V_(1n) = (333 333)/(14 434) = #"23,09" "A" $

  *Stap 2: de kortsluitproef geeft de serietak.* Bij de kortsluitproef is de secundaire kortgesloten en voer je de spanning op tot de nominale stroom loopt. De magnetisatietak valt dan weg, want er staat maar $#"3,5" %$ van de spanning op de kern. Wat je meet, is dus de volledige serie-impedantie.

  Het gemeten vermogen is puur koperverlies, dus daaruit volgt de weerstand:
  $ R_"eq" = P_"sc" / I_(1n)^2 = 2700/(#"23,09"^2) = #"5,06" Omega $

  De aangelegde spanning geeft de impedantiemodulus:
  $ Z_"eq" = V_"sc" / I_(1n) = (#"0,035" dot 14 434)/(#"23,09") = #"21,88" Omega $

  En met Pythagoras de reactantie:
  $ X_"eq" = sqrt(Z_"eq"^2 - R_"eq"^2) = #"21,28" Omega $
  $ L_"eq" = X_"eq"/(2 pi f) = #"21,28"/#"314,16" = #"67,7" "mH" $

  *Stap 3: de nullastproef geeft de dwarstak.* Nu staat de secundaire open en leg je de nominale spanning aan. Er loopt bijna geen stroom, dus het koperverlies is verwaarloosbaar en het gemeten vermogen is puur ijzerverlies.
  $ R_c = V_(1n)^2 / P_0 = 219 "k"Omega $

  De nullaststroom splitst in een verliescomponent in fase met de spanning, en een magnetiserende component $90 degree$ erachter:
  $ I_0 = i_0 dot I_(1n) = #"0,008" dot #"23,09" = #"0,1848" "A" $
  $ I_c = P_0 / V_(1n) = 950/(14 434) = #"0,0658" "A" $
  $ I_m = sqrt(I_0^2 - I_c^2) = #"0,1726" "A" $
  $ X_m = V_(1n) / I_m = (14 434)/(#"0,1726") = #"83,6" "k"Omega quad arrow.r quad L_m = 266 "H" $

  *Stap 4: de drie modellen invullen.*

  #table(
    columns: (auto, 1fr),
    align: (left, left),
    stroke: none,
    inset: 5pt,
    table.hline(stroke: 1pt),
    table.header([*Model*], [*Componenten*]),
    table.hline(stroke: 0.5pt),
    [Serie], [$R_"eq" = #"5,06" Omega$, $L_"eq" = #"67,7" "mH"$. Geen dwarstak.],
    [Cantilever], [Serietak zoals hierboven, plus $R_c = 219 "k"Omega$ en $L_m = 266 "H"$ vooraan.],
    [T], [De serietak in twee gelijke helften gesplitst: $R_1 = R'_2 = #"2,53" Omega$ en $L_(sigma 1) = L'_(sigma 2) = #"33,9" "mH"$, met de dwarstak ertussen.],
    table.hline(stroke: 1pt),
  )

  *Stap 5: terug naar de werkelijke secundaire waarden.* De transformatieverhouding is
  $ k = V_(1n)/V_(2n) = (14 434)/(#"360,84") = 40 $

  Herleide impedanties deel je door $k^2$:
  $ R_2 = R'_2 / k^2 = #"2,53"/1600 = #"1,58" "m"Omega quad quad L_(sigma 2) = (#"33,9" "mH")/1600 = #"21,2" mu"H" $
]

#waarschuwing[
  De splitsing $R_1 = R'_2 = R_"eq"\/2$ in het T-schema is een #belangrijk[afspraak], geen meting. De twee proeven geven je alleen de som. Zonder extra informatie verdeel je gelijk.
]

== Uitgewerkt: van driefasig naar het eenfasig equivalent <sec:oef-driefasig>

#oefening(title: "Driefasige transformator")[
  *Gegeven.* $S_n = 1000 "kVA"$, $25 "kV" \/ 625 "V"$, $50 "Hz"$, $i_0 = #"0,8" %$, $u_"sc" = #"3,5" %$, $P_0 = 2850 "W"$, verlies bij volle last $P_"FL" = 10 950 "W"$.

  *Gevraagd.* Het eenfasig vervangingsschema, en welke $V_1$ en $V_2$ je daarin invult.

  *Denkstap.* Bij een evenwichtige belasting reken je elke driefasige transformator als één fase. Je hoeft de wikkelingsconfiguratie niet te kennen, zolang je de verhouding $V_1 : V_2$ hebt. Je deelt het vermogen door drie en de lijnspanning door $sqrt(3)$:

  $ S_(n,"1f") = S_n/3 = #"333,333" "kVA" quad quad V_(1,"1f") = (25 "kV")/sqrt(3) = #"14,434" "kV" $
  $ V_(2,"1f") = (625 "V")/sqrt(3) = #"360,84" "V" $

  De verliezen deel je ook door drie:
  $ P_(0,"1f") = 2850/3 = 950 "W" $
  $ P_"sc" = (P_"FL" - P_0)/3 = (10 950 - 2850)/3 = 2700 "W" $

  Dat zijn exact de gegevens van de oefening hierboven, dus het eenfasig schema is identiek.

  #belangrijk[Dat betekent niet dat de driefasige transformator fysiek uit drie enkelfasige bestaat.] Het kan, maar het mag evengoed een andere driefasige constructie zijn.
]

== Uitgewerkt: belasten, spanningsval en rendement <sec:oef-belasten>

Dit is het tweede deel van de examenvraag: dezelfde transformator wordt belast, en je moet de secundaire spanning en het rendement geven.

#oefening(title: "Nominale belasting met capacitieve arbeidsfactor")[
  *Gegeven.* De transformator uit @sec:oef-vervangingsschema, belast op nominale stroom, met nominale spanning aan de primaire zijde. De arbeidsfactor is $cos phi = #"0,9"$ #strong[capacitief].

  *Gevraagd.* Koperverliezen, ijzerverliezen, $U_2$, rendement, fasordiagram.

  *Stap 1: de verliezen.* Bij nominale stroom zijn de koperverliezen precies wat de kortsluitproef mat, en bij nominale spanning zijn de ijzerverliezen wat de nullastproef mat.
  $ P_"Cu" = P_"sc" = 2700 "W" quad quad P_"Fe" = P_0 = 950 "W" $

  *Stap 2: het nuttig vermogen.*
  $ P_"uit" = S_n dot cos phi = 333 333 dot #"0,9" = 300 "kW" $

  *Stap 3: het rendement.*
  $ eta = P_"uit"/(P_"uit" + P_"Cu" + P_"Fe") = (300 000)/(300 000 + 2700 + 950) = #"98,8" % $

  *Stap 4: de spanningsval.* Neem $underline(V)_1 = 14 434 angle 0 degree$ als referentie. Een #strong[capacitieve] belasting laat de stroom vóórlopen, dus $phi = +#"25,84" degree$ met $cos phi = #"0,9"$.
  $ underline(I)_1 = #"23,09" angle #"25,84" degree "A" $
  $ underline(Z)_"eq" = #"5,06" + j #"21,28" = #"21,88" angle #"76,62" degree Omega $

  De val over de serie-impedantie:
  $ underline(I)_1 underline(Z)_"eq" = #"23,09" dot #"21,88" angle (#"25,84" + #"76,62") degree = 505 angle #"102,5" degree = -108 + j 493 $

  En dus:
  $ underline(V)'_2 = underline(V)_1 - underline(I)_1 underline(Z)_"eq" = 14 434 - (-108 + j 493) = 14 542 - j 493 $
  $ |underline(V)'_2| = 14 552 "V" $

  Terug naar de werkelijke secundaire zijde:
  $ U_2 = (14 552)/k = (14 552)/40 = #"363,8" "V" $

  #belangrijk[$U_2 = #"363,8" "V"$ ligt hóger dan de nominale $#"360,84" "V"$.] Dat is geen rekenfout. Bij een capacitieve belasting loopt de stroom voor, en dan werkt de val over $X_"eq"$ de bronspanning niet tegen maar mee. Bij een inductieve belasting zou $U_2$ juist zakken.

  *Stap 5: het fasordiagram.* Teken $underline(V)_1$ horizontaal, $underline(I)_1$ eronder in de eerste kwadrant met $+#"25,84" degree$, en zet de twee valcomponenten in de kop van $underline(V)'_2$: $underline(I)_1 R_"eq"$ evenwijdig met $underline(I)_1$, en $j underline(I)_1 X_"eq"$ daar loodrecht op. Het diagram hoeft niet op schaal, maar #belangrijk[voorlopend tegenover naijlend en evenwijdig tegenover loodrecht moeten duidelijk zijn.]
]

#examenbox[
  In de zittingen van juni 2026 en augustus 2026 was de belasting een #keyterm[PV-bron] (fotovoltaïsche cel) aan de secundaire zijde in plaats van een gewone last. De stroom loopt dan het net ín, dus $underline(I)_1$ en $underline(I)_2$ wijzen in dezelfde zin en je telt de val op in plaats van ze af te trekken. De methode blijft verder dezelfde.
]

== Rendement bij deellast <sec:oef-max-rendement>

De ijzerverliezen hangen aan de spanning en blijven dus zo goed als constant; de koperverliezen gaan met het kwadraat van de stroom. Belast je op een fractie $x$ van de nominale stroom, dan geldt

$ eta = (x S_n cos phi)/(x S_n cos phi + P_"Fe" + x^2 P_"Cu,n") $

met:
- $x$: belastingsgraad, $x = I \/ I_n$ [-]
- $P_"Cu,n"$: koperverlies bij nominale stroom, gelijk aan $P_"sc"$ [W]
- $P_"Fe"$: ijzerverlies, gelijk aan $P_0$ [W]

Het rendement is maximaal wanneer beide verliezen even groot zijn:

$ P_"Fe" = x^2 P_"Cu,n" quad arrow.r.double quad x = sqrt(P_"Fe" \/ P_"Cu,n") $

#oefening(title: "Stroom bij maximaal rendement")[
  *Gegeven.* $S = 400 "kVA"$, $10 "kV" \/ 400 "V"$, $P_"Fe" = 1000 "W"$, $P_"Cu,n" = 3000 "W"$. Deze vraag stond op het examen van 27/06/2022.

  *Gevraagd.* De primaire stroom bij maximaal rendement.

  $ x = sqrt(P_"Fe"/P_"Cu,n") = sqrt(1/3) = #"0,577" $
  $ I_(1n) = S/V_1 = (400 000)/(10 000) = 40 "A" $
  $ I_1 = x dot I_(1n) = #"0,577" dot 40 = #"23,1" "A" $
]

== Parallelschakeling <sec:oef-parallel>

Een terugkerende meerkeuzevraag: welke voorwaarden moeten twee transformatoren vervullen om ze parallel te mogen schakelen?

+ hetzelfde #strong[kloknummer], anders staan de secundaire spanningen niet in fase;
+ dezelfde #strong[wikkelingsverhouding], anders loopt er een kringstroom zonder belasting;
+ dezelfde #strong[nominale spanning];
+ dezelfde #strong[kortsluitspanning] $u_"sc"$, anders verdeelt de belasting zich niet evenredig met het vermogen.
