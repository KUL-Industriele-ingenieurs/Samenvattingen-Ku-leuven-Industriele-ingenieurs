#import "../../../school-template.typ": *

= Materialen en hun eigenschappen <ch:eigenschappen>

In dit deel bekijken we de eigenschappen van verschillende materialen.

== Families van engineering materialen <sec:families>

De materialen worden ingedeeld in zes families: metalen, keramiek, glas, polymeren, elastomeren en hybriden. Elke familie heeft voor- en nadelen. Soms moet je materialen combineren om de gevraagde functie te halen.

#figure(
  image("assets/Families-van-verschillende-engineering-materialen.png", width: 6cm),
  caption: [Families-van-verschillende-engineering-materialen],
  label: <fig:Families-van-verschillende-engineering-materialen>,
)

De leden van één familie hebben drie dingen gemeen:
+ hun *eigenschappen*;
+ de *processen* waarmee je ze vormgeeft;
+ hun *toepassingen*.

=== Metalen

- *Stijf.* De stijfheid $S = F slash delta$ is de kracht $F$ die nodig is per meter doorbuiging $delta$.
- *Relatief hoge elastische moduli*: zowel de elasticiteitsmodulus $E$ als de glijdingsmodulus $G$.
- *Ductiel* (vervormbaar). Je kunt ze makkelijk bewerken en smeden tot het gewenste profiel.
- *Slechte vermoeiingssterkte*: bij een cyclische belasting breken ze al bij een relatief lage spanning (zie @sec:mech-andere).
- *Breed dichtheidsbereik*: van lithium (530 kg/m³) tot osmium (22 600 kg/m³).
- *Het minst corrosiebestendig* van alle families. Verf, een warmtebehandeling of legeringselementen verbeteren dat.

#grid(
  columns: (1fr, 1fr),
  gutter: 10pt,
  figure(image("assets/Metalen-voorbeelden.png", width: 100%), caption: [Metalen: messing, aluminium, gietijzer, brons, staal, koper.]),
  figure(image("assets/Metalen-corrosie.png", width: 100%), caption: [Corrosie: metalen zijn het minst corrosiebestendig.]),
)


=== Keramiek

- *Hoge $E$*, *hard maar bros*. Een slag kan een breuk geven.
- *Breed bereik in sterkte.* In druk zijn ze *10 à 15 keer sterker* dan in trek.
- *Geen ductiliteit*, dus een lage tolerantie voor spanningsconcentraties. Een gat of (micro)scheur groeit makkelijk verder. De maat daarvoor is de *breuktaaiheid* $K_(1c)$.
- *Stijf, hard en slijtvast.* Daarom worden ze gebruikt voor snijgereedschap (een keramische coating op een hardmetalen insert) en voor lagers.
- *Moeilijker om mee te ontwerpen dan metalen*, omdat ze niet ductiel zijn.
- *Uitstekende eigenschappen bij hoge temperatuur en goede corrosiebestendigheid.* Een voorbeeld is de thermische barrière op een turbineschoep: een coating van zirkoniumdioxide van 0,1 tot 0,4 mm isoleert het hete gas van de koellucht.

#grid(
  columns: (1fr, 1fr),
  gutter: 10pt,
  figure(image("assets/Keramiek-bougie.png", width: 100%, height: 3cm), caption: [Bougie met keramische isolator.]),
  figure(image("assets/Keramiek-onderdelen.png", width: 100%, height: 3cm), caption: [Technische keramiek.]),
)
#figure(image("assets/Keramiek-thermische-barriere.png", width: 8cm), caption: [Thermische barrière (ZrO#sub[2]-coating) op een turbineschoep: de temperatuur zakt sterk over de coating.])


=== Glas

Glas lijkt op keramiek. Het verschil zit in de microstructuur: glas is een *niet-kristallijne, amorfe* vaste stof. Metalen zijn kristallijn.

#figure(
  image("assets/Kristallijn-vs-amorf.png", width: 6cm),
  caption: [Kristallijne en amorfe vaste stof.],
  label: <fig:kristallijn-amorf>,
)

Net als keramiek is glas *hard*, *bros* en *gevoelig voor spanningsconcentraties*.

#grid(
  columns: (1fr, 1fr),
  gutter: 10pt,
  figure(image("assets/Glas-lamp.png", width: 100%, height: 3cm), caption: [Glas in een halogeenlamp.]),
  figure(image("assets/Glas-flessen.png", width: 100%, height: 3cm), caption: [Glazen flessen.]),
)


=== Polymeren

*Amorf of semikristallijn.* Een polymeer is nooit 100 % amorf of 100 % kristallijn. Het is altijd een mengsel, en die verhouding bepaalt de eigenschappen. Amorfe ketens liggen door elkaar als spaghetti. In kristallijne zones liggen de ketens geordend.

#table(
  columns: (auto, 1fr, 1fr),
  stroke: (x, y) => if y == 0 { (bottom: 0.6pt) } else { (bottom: 0.3pt + luma(200)) },
  inset: (x: 5pt, y: 4pt),
  [], [*Amorf*], [*(Semi)kristallijn*],
  [Structuur], [ketens door elkaar ("spaghetti")], [ketens geordend],
  [Licht], [meestal transparant], [meestal opaak],
  [Mechanisch], [zacht, buigzaam, makkelijk te vormen], [harder en brosser],
  [Temperatuur], [glasovergangstemperatuur $T_g$], [smelttemperatuur $T_m$],
)

Een kristallijn materiaal heeft een echte *faseovergang* bij $T_m$: van vaste stof naar vloeistof. Een amorf materiaal heeft die niet. Onder $T_g$ is het *glasachtig* en rigide, boven $T_g$ *rubberachtig* en zacht. Op een grafiek van toegevoerde warmte tegenover temperatuur zie je bij $T_m$ een sprong en bij $T_g$ alleen een knik.

#figure(
  cetz.canvas(length: 0.9cm, {
    import cetz.draw: *
    let assen(x0, titel) = {
      line((x0, 0), (x0 + 4.4, 0), mark: (end: "stealth"))
      line((x0, 0), (x0, 3.4), mark: (end: "stealth"))
      content((x0 + 4.4, -0.35), [$T$])
      content((x0 - 0.35, 3.3), [$Q$])
      content((x0 + 2.2, 3.8), titel)
    }
    // kristallijn: sprong bij Tm
    assen(0, [*Kristallijn*])
    line((0, 0.2), (2, 1.0), (2, 2.2), (4, 3.0), stroke: 1.2pt + schoolBlue)
    line((2, 0), (2, 1.0), stroke: (dash: "dashed", paint: gray))
    content((2, -0.35), [$T_m$])
    content((1.0, 1.25), text(size: 8pt)[vast])
    content((3.1, 2.25), text(size: 8pt)[smelt])
    // amorf: knik bij Tg
    assen(6, [*Amorf*])
    line((6, 0.2), (8, 1.0), (10, 3.0), stroke: 1.2pt + schoolRed)
    line((8, 0), (8, 1.0), stroke: (dash: "dashed", paint: gray))
    content((8, -0.35), [$T_g$])
    content((6.9, 1.15), text(size: 8pt)[glasachtig])
    content((9.6, 1.5), text(size: 8pt)[rubberachtig])
  }),
  caption: [Toegevoerde warmte $Q$ tegenover temperatuur $T$: een echte faseovergang bij $T_m$, alleen een knik bij $T_g$ (bordtekening).],
  label: <fig:tm-tg>,
)

*Thermoplasten en thermosets*

#grid(
  columns: (1fr, 1fr),
  gutter: 8pt,
  figure(image("assets/Thermoplast-ketens.png", width: 4.5cm), caption: [Thermoplast: losse ketens.]),
  figure(image("assets/Thermoset-crosslinked.png", width: 4.5cm), caption: [Thermoset: ketens verbonden via knopen.]),
)

#table(
  columns: (auto, 1fr, 1fr),
  stroke: (x, y) => if y == 0 { (bottom: 0.6pt) } else { (bottom: 0.3pt + luma(200)) },
  inset: (x: 5pt, y: 4pt),
  [], [*Thermoplast*], [*Thermoset*],
  [Ketens], [niet crosslinked, vrij], [crosslinked via knopen],
  [Opnieuw smelten], [ja], [nee],
  [Mechanisch], [zachter], [sterker, harder, brosser],
  [Temperatuur], [gevoelig], [hogere thermische stabiliteit],
  [Chemicaliën], [minder bestendig], [goede chemische bestendigheid],
)

Verder geldt voor polymeren:
- *Lage elastische modulus*: gemiddeld 50 keer lager dan die van metalen. Ze rekken dus makkelijk in het elastische gebied.
- *Lage kruipweerstand.* *Kruip* is vervorming onder een constante last in de tijd. Een lage kruipweerstand betekent dat het materiaal sneller langer wordt.
- *Temperatuurgevoelig.* De eigenschappen veranderen met de temperatuur. Een thermoplast in de diepvries wordt bros, in de oven wordt hij zacht.
- *Corrosiebestendig*, met als toepassing verven.
- *Lage wrijvingscoëfficiënt*: polymeren glijden over elkaar zonder veel slijtage.
- *Makkelijk te vormen*, bv. met spuitgieten, zonder nabewerking. Zie _Manufacturing Technologies 2_.

#figure(image("assets/Polymeren-onderdelen.png", width: 6cm), caption: [Spuitgegoten polymeeronderdelen.])


#figure(
  cetz.canvas(length: 0.8cm, {
    import cetz.draw: *
    line((-0.5, 4), (9.5, 4), stroke: 1.2pt)
    for (i, (x, l, t)) in ((0.5, 2.0, [$t = 0$]), (4, 2.5, [1 dag]), (7.5, 3.0, [1 maand])).enumerate() {
      rect((x, 4), (x + 0.5, 4 - l), fill: luma(220))
      line((x + 0.25, 4 - l), (x + 0.25, 4 - l - 0.3))
      rect((x - 0.1, 4 - l - 0.3), (x + 0.6, 4 - l - 0.9), fill: luma(150))
      content((x + 0.25, 4 - l - 0.6), text(fill: white, size: 8pt)[$m$])
      content((x + 1.3, 4 - l / 2), [$L_#i$])
      content((x + 0.25, 4.4), t)
    }
  }),
  caption: [Kruipproef: dezelfde last, alleen de tijd verandert. $L_2 > L_1 > L_0$ (bordtekening).],
  label: <fig:kruip>,
)

=== Elastomeren

*Elastomeren* (rubbers) zijn *polymeren met lange, amorfe ketens*. Ze vormen een aparte familie omdat ze in de Ashby-grafieken (@sec:bar-property) een eigen ovaal hebben: lichtblauw, polymeren donkerblauw.

#figure(
  image("assets/Elastomeer-ketens.png", width: 4.5cm),
  caption: [Lange amorfe ketens van een elastomeer.],
  label: <fig:elastomeer>,
)

- Bij kamertemperatuur zacht en rubberachtig, want de kamertemperatuur ligt boven $T_g$.
- Net als thermosets kun je ze niet opnieuw smelten: ze verbranden.
- *Zeer lage $E$ en $G$*: ongeveer 100 000 keer lager dan bij metalen. Bij de meeste vaste stoffen daalt $E$ als de temperatuur stijgt; bij elastomeren stijgt $E$ juist.
- *Enorme elastische rek*.

#grid(
  columns: (1fr, 1fr),
  gutter: 10pt,
  figure(image("assets/Elastomeer-telefoonhoes.png", width: 100%, height: 3cm), caption: [Elastomeer: siliconen telefoonhoes.]),
  figure(image("assets/Elastomeer-zadel.png", width: 100%, height: 3cm), caption: [Elastomeer: fietszadel.]),
)


=== Hybride materialen

*Hybriden* combineren twee of meer materiaalfamilies, zodat je hun eigenschappen combineert. Voorbeelden zijn glasvezelversterkte kunststof in een tennisracket en koolstofvezelcomposiet in vliegtuigen.
- vezel- en deeltjescomposieten met een polymeermatrix (PMC), metaalmatrix (MMC) of keramische matrix (CMC);
- sandwichstructuren;
- schuimen;
- kabels;
- laminaten;
- natuurlijke materialen: hout, bot, huid, blad.

#grid(
  columns: (1fr, 1fr),
  gutter: 10pt,
  figure(image("assets/Hybride-CFRP.png", width: 100%, height: 3.5cm), caption: [Koolstofvezelcomposiet (CFRP).]),
  figure(image("assets/Hybride-metaalschuim.png", width: 100%, height: 3.5cm), caption: [Metaalschuim.]),
)


== Algemene eigenschappen <sec:algemene-eigenschappen>

=== Intensief en extensief <sec:intensief-extensief>

Een *intensieve* eigenschap hangt alleen af van het materiaal zelf, bv. de dichtheid $rho$ en de elasticiteitsmodulus $E$. Een *extensieve* eigenschap hangt ook af van de hoeveelheid materiaal en de vorm. Voorbeelden zijn de massa $m = rho V$, de stijfheid $S$ en de elektrische weerstand $R$.

#waarschuwing[
  $E$ is intensief, de stijfheid $S$ is extensief. Een I-balk is stijver dan een ronde staaf van hetzelfde materiaal en dezelfde massa. Dit onderscheid heb je nodig om een materiaalindex op te stellen (@sec:mi).
]

=== Dichtheid <sec:dichtheid>

De *dichtheid* $rho$ [kg/m³] hangt af van drie factoren:
+ de grootte van de atomen;
+ de pakking van de atomen (bv. de roosterstructuur);
+ het atoomgewicht.

#figure(image("assets/Bar-chart-dichtheid.png", width: 11cm), caption: [Bar chart van de dichtheid per materiaal (kleur = familie) en twee manieren van pakking.])

De grootte en de pakking verschillen weinig tussen materialen. Het atoomgewicht verschilt sterk: van 1 (waterstof) tot 238 (uranium). Het atoomgewicht bepaalt dus het meest de dichtheid.

=== Elasticiteitsmodulus <sec:e-modulus>

De *elasticiteitsmodulus* $E$ [GPa] hangt af van twee factoren:
+ de *bindingsstijfheid*: metaalbinding, ionaire of covalente binding, of secundaire bindingen (vanderwaals, waterstof);
+ de *bindingsdichtheid*: het aantal bindingen per volume. Hoe meer bindingen per volume, hoe hoger $E$.

#figure(image("assets/Bar-chart-E-modulus.png", width: 9cm), caption: [Bar chart van de elasticiteitsmodulus $E$ per familie.])


=== Overzicht per familie <sec:matrix>

De tabel vat samen waarom dichtheid, modulus en sterkte per familie verschillen. De waarden van de bindingsstijfheid hoef je niet van buiten te kennen.

#table(
  columns: (auto, 1fr, 1fr, 1fr),
  stroke: (x, y) => if y == 0 { (bottom: 0.6pt) } else { (bottom: 0.3pt + luma(200)) },
  inset: (x: 5pt, y: 4pt),
  [*Familie*], [*Dichtheid $rho$*], [*Modulus $E$*], [*Sterkte $sigma$*],
  [Metalen],
  [hoog: hoog atoomgewicht en dichte pakking],
  [hoog: metaalbinding (15–100 N/m) en hoge bindingsdichtheid],
  [$sigma_y$ bij 0,2 % rek. Puur metaal laag; hoger door legeren, koudvervormen en warmtebehandeling],
  [Polymeren en elastomeren],
  [laag: C (12) en H (1), open of halfopen pakking. Hoe meer kristallijn, hoe dichter],
  [breed bereik: covalente bindingen (20–200 N/m) én secundaire bindingen (0,5–2 N/m). Elastomeren laag: $T_g <$ kamertemperatuur, de secundaire bindingen zijn al "gesmolten"],
  [polymeren: $sigma_y$ bij *1 %* rek. Elastomeren: $sigma_(t s)$ (UTS), laag door de zwakke secundaire bindingen],
  [Keramiek en glas],
  [tussen polymeren en metalen: laag atoomgewicht (O, N, C) maar dichte pakking],
  [tussen polymeren en metalen: covalent en ionair (15–100 N/m), hoge bindingsdichtheid],
  [*modulus of rupture* (buigproef). Hoog: ionaire en covalente bindingen blokkeren dislocaties],
  [Hybriden (bv. schuimen)],
  [laag: polymeer met veel lucht],
  [zeer laag: de celwanden buigen makkelijk],
  [$sigma_(t s)$; vezelcomposieten: tensile tear strength van de vezels],
)

=== Spanning–rekcurve <sec:sigma-eps>

#figure(
  image("assets/Spanning-rek-ductiel-metaal.png", width: 9cm),
  caption: [Spanning–rekcurve van een ductiel metaal.],
  label: <fig:sigma-eps-metaal>,
)

- De helling in het elastische gebied is $E = sigma slash epsilon$ (wet van Hooke).
- De *vloeigrens* $sigma_y$ bij een metaal lees je af bij 0,2 % blijvende rek (0,2 % offset).
- De *treksterkte* $sigma_(t s)$ (UTS) is het maximum van de curve.
- De *ductiliteit* is de rek bij breuk $epsilon_f$.
- De *taaiheid* is de oppervlakte onder de curve: de energie die het materiaal opneemt tot breuk. Ze combineert sterkte en ductiliteit.
- Totale rek − elastische rek = plastische rek.

#figure(
  image("assets/Spanning-rek-polymeren.png", width: 8cm),
  caption: [Spanning–rekcurven van polymeren bij verschillende temperaturen.],
  label: <fig:sigma-eps-polymeer>,
)

Hoe de curve van een polymeer eruitziet, hangt af van de temperatuur ten opzichte van $T_g$:
- $T << T_g$ (bv. in de diepvries): brosse breuk;
- $T approx 0,8 T_g$: beperkte plasticiteit;
- $T = T_g$: *cold drawing*: na de vloeigrens richten de ketens zich en rekt het materiaal sterk uit bij een bijna constante spanning;
- $T >> T_g$: viskeuze stroming, de curve van een elastomeer: lage sterkte en zeer grote rek.

#figure(
  image("assets/Spanning-rek-keramiek.png", width: 8cm),
  caption: [Spanning–rekcurve van brosse keramiek in druk en trek.],
  label: <fig:sigma-eps-keramiek>,
)

Keramiek is in druk 10 à 15 keer sterker dan in trek ($sigma_c = 10 "à" 15 sigma_t$). In trek is er bijna geen plastische rek.

=== Sterkte <sec:sterkte>

De sterkte hangt af van de *familie* en van de *manier van belasten* (trek, druk of afschuiving).

#table(
  columns: (auto, auto, 1fr),
  stroke: (x, y) => if y == 0 { (bottom: 0.6pt) } else { (bottom: 0.3pt + luma(200)) },
  inset: (x: 5pt, y: 4pt),
  [*Familie*], [*Sterkte in de Ashby-grafiek*], [*Bindingen en opmerking*],
  [Metalen], [$sigma_y$ bij 0,2 % rek], [metaalbinding. Hoger door legeren, koudvervormen en warmtebehandeling],
  [Keramiek], [modulus of rupture], [ionair en covalent. Druksterkte 10–15 × treksterkte],
  [Polymeren], [$sigma_y$ bij *1 %* rek], [covalent en zwakke waterstofbindingen],
  [Elastomeren], [$sigma_(t s)$ (UTS)], [covalent en waterstofbindingen],
  [Composieten], [tensile failure strength], [druksterkte 30 % lager door het knikken van de vezels],
)

#waarschuwing[
  In een Ashby-grafiek met de sterkte op de as betekent $sigma$ bij een rood ovaal (metalen) de vloeigrens bij 0,2 % rek. Bij de blauwe ovalen (polymeren en elastomeren) is het de sterkte bij 1 % rek. In de quiz vergisten veel studenten zich hier.
]

#figure(
  image("assets/Modulus-of-rupture.png", width: 6cm),
  caption: [Modulus of rupture: driepuntsbuigproef op een keramische balk.],
  label: <fig:mor>,
)

Bij een meerassige belasting heeft elke familie een eigen vloeicriterium: *von Mises* voor metalen, een vloeifunctie met een drukterm voor polymeren, en de *wet van Coulomb* voor keramiek en glas.

=== Andere mechanische eigenschappen <sec:mech-andere>

Hieronder belijsten we nog de algemene mechanische eigenschappen die in alle materialen van toepassing zijn.

- *Vermoeiing*: bij cyclische belasting. De *endurance limit* $sigma_e$ is de spanningsamplitude waaronder er na $10^7$ cycli geen breuk optreedt. $10^7$ cycli geldt als oneindig.
- *Hardheid* $H$ (Vickers, Rockwell, Brinell): belangrijk bij drukbelasting en bij onderdelen die over elkaar schuiven. Voor metalen geldt $H approx 3 sigma_f$. Een hardheidsmeting is dus een bijna niet-destructieve schatting van de sterkte.
- *Breuktaaiheid* $K_(1c)$ [MPa·m#super[1/2]]: de weerstand tegen het groeien van een bestaande scheur. *Taaiheid* $G_(1c)$ [kJ/m²]: de energie per oppervlakte die nodig is om die scheur te laten groeien. Belangrijk bij impact, bv. het vizier van een helm dat een steen opvangt.
- *Verliescoëfficiënt* $eta$ [-]: hoeveel trillingsenergie een materiaal dissipeert ten opzichte van de opgeslagen energie.
- *Slijtagesnelheid* $W$: het afgesleten volume per afgelegde afstand als twee oppervlakken over elkaar schuiven. De echte materiaaleigenschap is de *constante van Archard* $k_a$.

#grid(
  columns: (1fr, 1fr),
  gutter: 10pt,
  figure(image("assets/Hardheid.png", width: 100%), caption: [Hardheid $H = F slash A$: Vickers, Rockwell, Brinell.]),
  figure(image("assets/Breuktaaiheid.png", width: 100%), caption: [Breuktaaiheid: scheur in een plaat onder trek.]),
)
#grid(
  columns: (1fr, 1fr),
  gutter: 10pt,
  figure(image("assets/Verliescoefficient.png", width: 100%), caption: [Verliescoëfficiënt: hysteresislus $Delta U$ tegenover $U_max$.]),
  figure(image("assets/Slijtage.png", width: 100%), caption: [Slijtage: afgesleten volume tegenover de glijafstand.]),
)


#figure(
  image("assets/Vermoeiing-endurance-limit.png", width: 7cm),
  caption: [Wöhlercurve met de endurance limit $sigma_e$.],
  label: <fig:vermoeiing>,
)

#frm("Breuktaaiheid", $K_(1c) = Y sigma^* sqrt(pi c) quad quad G_(1c) = K_(1c)^2 / (E (1 + nu))$, [met: $Y$ = geometriefactor [-], $sigma^*$ = spanning bij breuk [MPa], $c$ = scheurlengte [m], $nu$ = Poissonverhouding [-]])

#frm("Verliescoëfficiënt", $eta = (Delta U) / (2 pi U_max) quad "met" quad U_max = integral_0^(sigma_max) sigma dif epsilon approx 1/2 sigma_max^2 / E$, [met: $Delta U$ = gedissipeerde energie per cyclus, $U_max$ = maximaal opgeslagen elastische energie [J/m³]])

#frm("Slijtage (Archard)", $W = k_a F_n quad quad k_a = W / F_n = Omega / P$, [met: $W$ = slijtagesnelheid (afgesleten volume per afgelegde afstand) [m²], $k_a$ = constante van Archard [1/Pa], $F_n$ = normaalkracht [N], $Omega = W slash A_n$ = specifieke slijtagesnelheid [-], $A_n$ = nominaal contactoppervlak [m²], $P = F_n slash A_n$ = contactdruk [Pa]])

De formules hoef je niet van buiten te kennen: ze staan in het formularium van het examen.

=== Thermische eigenschappen <sec:thermisch>

- *Smelttemperatuur* $T_m$: scherp smeltpunt bij kristallijne vaste stoffen.
- *Glasovergangstemperatuur* $T_g$: bij amorfe polymeren, de overgang van een echte vaste stof naar een rubberachtige of viskeuze toestand.
- *Maximale gebruikstemperatuur* $T_max$: daarboven krijg je bv. oxidatie, een chemische verandering of te veel kruip.
- *Minimale gebruikstemperatuur* $T_min$: daaronder wordt het materiaal bros en onveilig (bv. op Antarctica).
- *Warmtecapaciteit* $c_p$ [J/kgK]: de energie om 1 kg materiaal 1 K op te warmen.
- *Warmtegeleidingscoëfficiënt* $lambda$ [W/mK]: hoe snel warmte door het materiaal geleid wordt, in stationaire toestand.
- *Thermische diffusiviteit* $a = lambda slash (rho c_p)$ [m²/s]: bij een temperatuur die in de tijd verandert. Het is het vermogen om warmte te geleiden ten opzichte van het vermogen om warmte op te slaan.
- *Uitzettingscoëfficiënt* $alpha$ [1/K]: hoeveel het materiaal uitzet of krimpt per graad. Belangrijk als het onderdeel niet mag uitzetten.

#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 10pt,
  figure(image("assets/Warmtecapaciteit.png", width: 100%), caption: [Warmtecapaciteit $c_p$.]),
  figure(image("assets/Warmtegeleiding.png", width: 100%), caption: [Warmtegeleiding $lambda$.]),
  figure(image("assets/Thermische-uitzetting.png", width: 100%), caption: [Uitzettingscoëfficiënt $alpha$.]),
)


=== Elektrische eigenschappen <sec:elektrisch>

- *Resistiviteit* $rho_e$ [Ωm] is intensief, de *weerstand* $R = rho_e L slash A$ is extensief. Het bereik is enorm: van $10^(-8)$ Ωm (goede geleiders) tot $10^(16)$ Ωm (goede isolatoren).
- *Diëlektrische constante* $epsilon_r$ [-]: hoe sterk een isolator polariseert in een elektrisch veld. Voor gassen ongeveer 1, voor goede isolatoren 2 tot 30.
- *Verliesfactor* $L = epsilon_r tan delta$: in een echt diëlektricum loopt de stroom niet exact 90° uit fase met de spanning. Het verschil $delta$ geeft energieverlies.

#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 10pt,
  figure(image("assets/Resistiviteit.png", width: 100%), caption: [Resistiviteit $rho_e$.]),
  figure(image("assets/Dielektrische-constante.png", width: 100%), caption: [Diëlektrische constante $epsilon_r$.]),
  figure(image("assets/Dielektrisch-verlies.png", width: 100%), caption: [Diëlektrisch verlies $tan delta$.]),
)


=== Optische en eco-eigenschappen <sec:optisch-eco>

- *Brekingsindex* $n = v_1 slash v_2 = sin theta_1 slash sin theta_2$ [-]. Licht gaat in elk materiaal trager dan in vacuüm.
- *Embodied energy* [MJ/kg]: de energie om 1 kg materiaal uit erts of grondstof te maken.
- *CO#sub[2]-voetafdruk* [kg/kg]: de massa CO#sub[2] die vrijkomt bij de productie van 1 kg materiaal.

#grid(
  columns: (1fr, 1fr),
  gutter: 10pt,
  figure(image("assets/Brekingsindex.png", width: 70%), caption: [Breking van licht: $n = sin theta_1 slash sin theta_2$.]),
  figure(image("assets/Eco-levenscyclus.png", width: 70%), caption: [Levenscyclus van een product: grondstoffen, energie en emissies.]),
)

