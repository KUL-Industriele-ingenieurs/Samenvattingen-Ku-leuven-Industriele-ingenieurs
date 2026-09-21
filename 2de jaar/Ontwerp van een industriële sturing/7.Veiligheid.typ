#import "../../school-template.typ": *

= Veiligheid <ch:veiligheid>


#belangrijk[Hangt de veiligheid van een machine af van het juist functioneren van een besturing, dan heet dat #keyterm[functionele veiligheid].] Dat legt bijzondere eisen op aan de beschikbaarheid van die veiligheidsfunctie: ze moet betrouwbaar werken, ook als er een component faalt.

== Lock-out Tag-out (LoTo)


Voor onderhoud volstaat het niet om een machine "uit" te zetten. Iemand anders kan hem weer inschakelen terwijl jij met je handen in de machine zit. Daarom vergrendel je hem #strong[fysiek]. Dat heet #keyterm[LoToTo]: Lock-out, Tag-out, Try-out.

De procedure, in volgorde:

+ Alle energiebronnen en bedieningselementen inventariseren, en instructies vastleggen voor hun isolatie.
+ Alle betrokkenen informeren over de nodige lock-out.
+ De operationele werkzaamheden aan de installatie laten staken.
+ Bepalen welke acties vanuit de centrale bedieningsruimte nodig zijn voor de lock-out.
+ De installatie stoppen volgens de normale procedure.
+ Op de energiecontrolepunten de energietoevoer #strong[isoleren]. Dus niet alleen de stroomtoevoer uitschakelen, maar ook leidingen legen en spoelen, steekflenzen plaatsen, enzovoort.
+ Alle #strong[resterende] energie laten wegvloeien: reststroom, restdruk, en zo verder.
+ *Lock-out en tag-out:* alle controlepunten vergrendelen in de uit-stand en ze markeren.
+ #belangrijk[Elke LoTo-geautoriseerde plaatst een eigen slot en een eigen label] met de vereiste gegevens erop.
+ *Try-out:* alle medewerkers veilig stellen en de installatie test-starten om te controleren dat ze inderdaad niet opstart.
+ De geplande werken aan de machine uitvoeren.
+ Nadien alle betrokkenen verwittigen van de geplande heropstart.
+ Elke LoTo-geautoriseerde verwijdert zijn #strong[eigen] slot en label en ruimt zijn gereedschap op.
+ Alle schakelaars, kleppen en bedieningen terug in de operationele stand plaatsen, en dan pas herstarten volgens de normale procedure.

De drie delen uit elkaar gehouden:
- *Lock-out:* het fysieke slot dat verhindert dat de scheider weer ingeschakeld wordt.
- *Tag-out:* het label dat zegt wie de vergrendeling plaatste en waarom.
- *Try-out:* de proef die aantoont dat de vergrendeling ook echt werkt.

#belangrijk[Zolang er één slot hangt, kan de machine niet starten.] Elke geautoriseerde plaatst er dus een eigen, zodat niemand de vergrendeling van een collega kan opheffen.

== Pictogrammen en veiligheidsstop

#wrap-figure(
  image("assets/OIS_pictogram_noodstop.png", width: 4cm),
  caption: [Pictogram voor de veiligheidsstop volgens ISO 7010.],
  label: <fig:pictogram-noodstop>,
)[
  #keyterm[ISO 7010] is de internationale norm voor veiligheidssymbolen. In 2011 registreerde ISO een nieuw symbool om de #strong[locatie] van noodstopknoppen aan te duiden: een groen vierkant met een wit noodstopsymbool (dezelfde categorie als brancards, nooddouches en nooduitgangen).
]

== EN 13849 en SRP/CS <sec:en13849>

#keyterm[EN 13849-1] legt de functionele veiligheidseisen vast voor de besturing van machines.

De onderdelen die de veiligheidsfunctie uitvoeren heten samen de #keyterm[SRP/CS] (Safety-Related Parts of a Control System). Deze keten omvat altijd drie schakels:

$ "Ingang (Trigger event)" arrow.r "Logica (Evaluatie)" arrow.r "Uitgang (Actor)" $

- *Ingang*: Noodstopknop, lichtgordijn, veiligheidsschakelaar;
- *Logica*: Veiligheidsrelais of safety-PLC;
- *Uitgang*: Vermogenscontactoren of de STO-ingang (Safe Torque Off) van een regelaar.

#figure(
  image("assets/OIS_srpcs_clean.png", width: 14cm),
  caption: [De SRP/CS-keten: trigger event, logica en actuatoren (EN 13849-1).],
  label: <fig:srpcs>,
)

=== Het eenkanaals voorbeeldschema <sec:veiligheid-voorbeeldschema>

In een basis eenkanaals sturing (Categorie 1 / B) schakelt één stopknop één contactor:

#figure(
  image("assets/OIS_noodstop_hoofdcircuit_clean.png", width: 12cm),
  caption: [Eenkanaals schema: één contact, één contactor. Gevaar voor SPoF (Single Point of Failure).],
  label: <fig:noodstop-voorbeeldschema>,
)

Blijft het contactorcontact door vonkerosie vastlassen, dan kan de stuurkring de motor niet meer stoppen! Dit gevaar heet een #keyterm[SPoF] (Single Point of Failure).

== Dubbelkanaalsarchitectuur (Dual Channel) en EDM <sec:dual-channel-waarom>

Voor Categorie 3 en 4 conform EN 13849-1 moet de veiligheidsfunctie behouden blijven bij een enkelvoudige fout. Dit vraagt redundantie in alle drie de schakels:

#figure(
  image("assets/OIS_categorie4_clean.png", width: 11cm),
  caption: [Categorie 3/4 architectuur: redundante ingangskanalen, cross-monitoring in de logica en terugkoppeling (EDM) van de uitgangen.],
  label: <fig:categorie3>,
)

De volledige werking van de veiligheidsketen verloopt in vijf logische stappen:

+ *Dual Channel Ingang*: Eén paddenstoelknop `-S4` bedient twee mechanisch gekoppelde N.C.-contacten. Het relais stuurt een eigen testsignaal uit op klem $S 11$ en verwacht dit terug op $S 12$ (kanaal 1); idem voor $S 21 arrow.r S 22$ (kanaal 2).
+ *Cross-monitoring*: Het veiligheidsrelais vergelijkt continu de toestand van beide kanalen. Schakelt één kanaal wel en het andere niet (asymmetrie door contactbreuk of vastlassen), dan schakelt het relais direct uit en gaat in *lock-out* (vergrendeling). Automatisch herstarten is onmogelijk tot de fout hersteld is.
+ *Redundante Uitgangen*: In de vermogenkring naar de motor staan *twee contactoren in serie* (`-Q1` en `-Q2`). Mocht één contactor vastlassen, dan onderbreekt de tweede alsnog betrouwbaar de motorstroom.

=== Werking van EDM (External Device Monitoring) <sec:edm>

+ *EDM-terugkoppeling*: Het relais moet vóór elke herstart verifiëren of beide contactoren werkelijk zijn afgevallen. Daarom worden twee N.C.-hulpcontacten van `-Q1` en `-Q2` in serie geschakeld in de resetkring ($Y 1 - Y 2$).
+ *Force-guided contacten (Gedwongen geleid)*: Om te verhinderen dat een contactor "liegt", zijn de N.O.-hoofdcontacten en het N.C.-hulpcontact mechanisch star gekoppeld. Als een N.O.-contact vastlast, dwingt het mechanisme het N.C.-hulpcontact om *open* te blijven $arrow.r.double$ de EDM-lus blijft onderbroken $arrow.r.double$ het relais kan niet resetten!

#figure(
  image("assets/OIS_edm_clean.png", width: 9.5cm),
  caption: [EDM-terugkoppeling: N.C.-hulpcontacten van contactoren `-Q1` en `-Q2` staan in serie met de resetknop.],
  label: <fig:edm>,
)
=== Vertraagd noodstopcontact <sec:vertraagd-estop>

#examenbox[Dit was een klassieke examenvraag in 2024-2025.]

#figure(
  image("assets/OIS_vertraagd_estop_contact.png", width: 12cm),
  caption: [Vertraagd noodstopcontact: één kleinere, later afvallende contactor geeft redundantie voor een hele reeks contactoren.],
  label: <fig:vertraagd-estop>,
)
  Een #keyterm[off-delay] noodstopcontact is nuttig wanneer je redundantie nodig hebt voor véél of zeer krachtige contactoren.

  De redenering uit de slides: heb je $30$ motoren met elk een contactor van $30 "A"$, dan zou een centrale redundante contactor vóór de hele groep $900 "A"$ moeten kunnen schakelen. Dat is onbetaalbaar groot en duur.

  #belangrijk[Eén redundante contactor van bijvoorbeeld $60 "A"$ volstaat, als hij een fractie #strong[later] afschakelt dan de individuele.] De andere zijn dan al open, dus schakelt hij stroomloos af, tenzij er één vastbakt: dan onderbreekt hij enkel díe ene motor.


=== STO op een drive <sec:sto-ingang>

De #keyterm[STO]-ingangen (Safe Torque Off) schakelen het vermogendeel van een VFD op een betrouwbare en redundante manier uit. Die ingangen kunnen gevoed worden vanuit de stuurkast, of vanuit de drive zelf.

#waarschuwing[
  De slides tonen expliciet dat je online veel foute schema's vindt. Twee voorbeelden:

  - contacten die als N.C. getekend staan terwijl ze #strong[N.O.] horen te zijn, ook al zullen ze meestal gesloten zijn;
  - schema's waarin de reset maar #strong[één] bewuste handeling vraagt in plaats van twee;
  - een contactor die als `K` benoemd wordt in plaats van `-Q`.
]

=== De tussenvorm: ½ channel <sec:half-channel>

Bij een #keyterm[½-channel] beveiliging schakelt er maar #strong[één] kanaal, maar dat wordt wél bewaakt: één relais onderbreekt het veiligheidssignaal, en feedbackcontacten controleren of dat relais nog correct werkt.

#belangrijk[Dat is veiliger dan puur éénkanaals, maar haalt de betrouwbaarheid van dual channel niet.] Bij dual channel zijn er twee onafhankelijke kringen; hier blijft er één punt over dat kan falen, alleen merk je het nu wel.

=== Wanneer is dual channel niet nodig?

#belangrijk[Dubbelkanaals is niet altijd nodig.] De risicoanalyse bepaalt welk niveau je moet halen, niet de gewoonte.

Het voorbeeld is een rem op een verticale as. Een éénkanaalsrem heeft geen redundantie, en de berekening volgens ISO 13849 wordt ingewikkeld. Een drive met SBC (Safe Brake Control) en SBT (Safe Brake Test) verhoogt de veiligheid #strong[zonder] dubbelkanaalsrem.

#figure(
  image("assets/OIS_srecs_single_channel.png", width: 12cm),
  caption: [Dezelfde keten in één kanaal: veiligheidsschakelaar, veiligheidscontroller en houdrem. Onderaan staat per schakel zijn MTTFd, waarmee je het bereikte veiligheidsniveau berekent.],
  label: <fig:srecs-single-channel>,
)

Elke schakel heeft een eigen betrouwbaarheidscijfer: #keyterm[MTTFd] (Mean Time To dangerous Failure) in jaren voor ingang en uitgang, #keyterm[PFH] (Probability of dangerous Failure per Hour) voor de controller. Samen geven ze het performance level van de keten.

De les: soms lost een slimmer component het probleem op waar anders een dubbele architectuur voor nodig was.

== Safety fieldbus

In plaats van elke veiligheidscomponent apart te bedraden, kan je de veiligheidssignalen over een #keyterm[safety fieldbus] sturen, bijvoorbeeld PROFIsafe.

Bij grote machines scheelt dat: één buskabel in plaats van tientallen dubbele draden, en diagnose per component in plaats van zoeken welk contact open staat. Een fout in de communicatie zelf, zoals een verloren of vertraagde boodschap, leidt ook naar de veilige toestand.

== EN 60204: stopcategorieën en STO

EN 60204:2016 definieert drie #keyterm[stopcategorieën]:

- *Stopcategorie 0:* bewegingen stoppen door #strong[meteen] de voeding af te schakelen.
- *Stopcategorie 1:* gecontroleerd tot stilstand brengen, bijvoorbeeld door te remmen, #strong[en daarna] de voeding afschakelen. Dat is gewenst bij lasten met een grote traagheid.
- *Stopcategorie 2:* gecontroleerd tot stilstand brengen, waarbij de voeding #strong[niet] wordt afgeschakeld.

#belangrijk[Voor een noodstopfunctie is alleen categorie 0 of 1 toegestaan.] Dat zijn precies de twee categorieën waarbij de voeding uiteindelijk wordt afgeschakeld. Categorie 2 is dus wel een geldige "stop", maar nooit een "noodstop".

#waarschuwing[
  Een #keyterm[STO] (Safe Torque Off) mag als categorie-0-stop gelden, maar garandeert alleen dat de motor #strong[geen koppel] meer levert: er kan nog spanning op de wikkelingen staan. Daarom komt er soms een extra contactor in de voeding van de frequentieomvormer bij, of een werkschakelaar als LoTo.

  Om onverwacht opstarten te verhinderen hoef je niet van het net te scheiden. Wil je aan de elektrische uitrusting #strong[werken], dan is een scheidingsinrichting wél verplicht.
]

Vergelijk met de stopknop uit @sec:24vvs: die werkt in categorie 2, via de machinesturing.

== EN 12100

#keyterm[EN 12100] legt de rangorde vast waarin je een gevaar aanpakt. Pak het aan #belangrijk[bij de bron]:

+ *Inherently safe design.* Kies het proces zelf zo dat het gevaar er niet is. Je selecteert het proces samen met de omgeving waarin de machine gebruikt wordt.
+ *Collectieve bescherming* (niveau 2A). Een afscherming die iedereen tegelijk beschermt.
+ *Individuele bescherming* (niveau 2B). Persoonlijke beschermingsmiddelen: labojas, veiligheidsbril.

#belangrijk[De volgorde is bindend.] Persoonlijke bescherming is het laatste redmiddel, niet het eerste.
