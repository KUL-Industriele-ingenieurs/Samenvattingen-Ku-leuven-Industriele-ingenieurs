#import "../../school-template.typ": *

// BRON: ENKEL SLIDES: data_interfacing_short.pdf (52 p, praktijkgericht)

= Data-interfacing <ch:interfacing>

== Sensorinterfaces op de Raspberry Pi <sec:pi-interfaces>

// TODO: GPIO: karakteristieken, modes, spanningsniveaus.
// TODO: Grove Base kit als concrete opstelling.

== I2C <sec:i2c>

// TODO: Databus, master/slave, half duplex, twee lijnen (SDA/SCL), pull-upweerstanden -- waarom open drain.
// TODO: Adressering en het verloop van een transactie.
// TODO: OEFENING: de i2c-oefening op p.25-26 van het deck.

== PWM <sec:pwm>

// TODO: FORMULE: duty cycle = t_aan / T. Gemiddelde spanning = D * V.
// TODO: Waarom PWM efficienter is dan een lineaire regeling.

== Hardwarebibliotheken <sec:libraries>

// TODO: MRAA, SMBUS2, UPM, Grove.py -- wat elk doet, met de Python-voorbeelden uit het deck.

== MQTT <sec:mqtt>

// TODO: Publish/subscribe, broker, topics.
// TODO: Waarom lightweight, event-georienteerd en asynchroon.

