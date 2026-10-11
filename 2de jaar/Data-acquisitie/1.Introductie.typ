#import "../../school-template.typ": *

// BRON: Samenvatting p.3-4 | DAQ_introductie.pdf

= Introductie <ch:introductie>

Het vak data acquisitie gaat over hoe we met elektronica informatie opnemen en verwerken van de fysieke wereld.

Dit behoudt sensoren, hoe we de data van de sensoren gaan eruit halen, verwerking van het signaal en dan bruikbaar maken in een systeem.

Het is echt de basis van automatisering

#figure(
  image("assets/Management-Piramide.png", width: 5cm),
  caption: [Management-Piramide],
  label: <fig:Management-Piramide>,
)



== Structuur van een meetsysteem <sec:meetsysteem>

#figure(
  image("assets/Structuur-van-een-meetsysteem.png", width: 5cm),
  caption: [Structuur-van-een-meetsysteem],
  label: <fig:Structuur-van-een-meetsysteem>,
)

#figure(
  image("assets/Fysieke-voorbeelden-van-elke-structuur.png", width: 5cm),
  caption: [Fysieke-voorbeelden-van-elke-structuur],
  label: <fig:Fysieke-voorbeelden-van-elke-structuur>,
)

=== Sensing element <sec:sensing-element>

=== Signal conditioning element <sec:signal-conditioning>

=== Signal processing element <sec:signal-processing>

=== Data representation element <sec:data-representation>


#figure(
  image("assets/Voorbeelden-meetsysteem.png", width: 5cm),
  caption: [Voorbeelden-meetsysteem],
  label: <fig:Voorbeelden-meetsysteem>,
)

// TODO: De 4 bouwblokken: meetelement, signaalconditionering, signaalverwerking, datapresentatie.
// TODO: Sensor vs transducer -- definitie en het verschil (een sensor kan meerdere transducers bevatten).
// TODO: Voorbeeld speaker: elektrisch -> magnetisch veld -> trilling.

== Classificatie van meetelementen <sec:classificatie>

=== Transductor vs Sensor <sec:transductor-vs-sensor>

Een transducer is een toestel dat
geactiveerd wordt door energie in een
systeem en deze energie omzet in een
andere vorm voor een ander systeem

UIT SLIDE

Denk aan een motor, zet elektrische energie om in mechanische energie

Een sensor is een toestel dat een signaal
of stimulus ontvangt en omzet naar een
elektrisch signaal.

Denk aan een thermometer.


Wij hebben het in deze cursur alleen over sensoren.

== Passief vs actief <sec:passief-vs-actief>

Een passieve sensor werkt zonder dat er een externe energie moet aan toegevoegd worden. Het genereert zelf een signaal. Een voorbeeld is een thermokoppel, fotodiode of piezo. Dit zijn meestal weerstanden die zich aanpassen afhankelijk van een omgevingsfactor (temperatuur, licht, druk, ...).

Een actieve sensor heeft een externe energiebron nodig om te werken. Een voorbeeld is een RTD of rekstrook.

#figure(
  image("assets/Actief-Passief.png", width: 12cm),
  caption: [Actief-Passief],
  label: <fig:Actief-Passief>,
)

meer info over al deze sensoren later.

=== Sensoren in een regellus <sec:sensoren-regellus>

#figure(
  image("assets/Sensoren-in-een-regellus.png", width: 5cm),
  caption: [Sensoren-in-een-regellus],
  label: <fig:Sensoren-in-een-regellus>,
)


// TODO: Actief vs passief: actief heeft een bronspanning nodig (RTD, rekstrook), passief genereert zelf spanning (thermokoppel, fotodiode, piezo).
// TODO: Slimme sensoren: A/D + microcontroller op de sensor -> kalibratie en linearisatie aan boord.



