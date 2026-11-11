#import "../../school-template.typ": *
#import "examenvraag.typ": examenvraag

// BRON: ENKEL SLIDES: data_interfacing_short.pdf (52 p, praktijkgericht) | examenvragen (MQTT, E12, E13)

= Data-interfacing <ch:interfacing>

Data-interfacing verbindt sensor en software. In de meetketen van de slides meet een NTC een temperatuur, een versterker en een ADC zetten die om naar een digitaal getal, en een Raspberry Pi leest dat getal via i2c. De Pi stuurt het resultaat door via i2c, PWM, MQTT of naar een LCD.

== Sensorinterfaces op de Raspberry Pi <sec:pi-interfaces>

Een *interface* is een gedeelde grens waarover twee onderdelen gegevens uitwisselen. De Raspberry Pi heeft drie soorten sensorbus: *GPIO*, *I2C* en *PWM*. Elk daarvan heeft een eigen pagina in dit hoofdstuk.

#figure(
  image("assets/L20-lagen.png", width: 70%),
  caption: [Lagen van de interfacing op de Pi: user application, Grove.py, hardwarebibliotheken (MRAA, UPM, SMBUS2), de GPIO/I2C/PWM-hardware en de Grove-modules (slide 11).],
  label: <fig:L20-lagen>,
)

Als opstelling gebruiken de slides de *Grove Base kit* voor de Raspberry Pi. Daarop sluit je Grove-modules aan, zoals de temperatuur- en vochtigheidssensor in @sec:libraries.

=== GPIO <sec:gpio>

*GPIO* (general purpose input/output) is een pin zonder vaste functie. Je stelt zelf in wat de pin doet.

- De pin is ingang of uitgang.
- De pin is ingeschakeld of uitgeschakeld.
- De pin is hoog of laag.

#figure(
  image("assets/L20-gpio-modes.png", width: 85%),
  caption: [GPIO-modes: push-pull en open drain voor WRITE, input voor READ, en de pull-upweerstand (slide 13).],
  label: <fig:L20-gpio-modes>,
)

Een uitgang schrijft (WRITE) op twee manieren:
- *Push-pull:* de pin wordt actief hoog (PMOS naar $V_"DD"$) of actief laag (NMOS naar massa). De uitgang is 1 of 0.
- *Open drain:* de pin kan alleen naar massa trekken. Hoog komt van een externe *pull-upweerstand*.

Een ingang leest (READ) de spanning op de pin.

== I2C <sec:i2c>

*I2C* is een databus waarmee meerdere toestellen over twee draden communiceren. Philips maakte het in de jaren 1980 en gebruikte het voor het eerst in de MAB8400B.

Een *databus* is een vereenvoudigde manier waarop veel toestellen met elkaar praten. De bus heeft een *bus master* en een of meer *slaves*. De master is het programma, in een microprocessor of een aparte I/O-controller, dat het verkeer op de bus bestuurt. Een slave antwoordt op een vraag van de master.

#figure(
  image("assets/L20-i2c-bus.png", width: 85%),
  caption: [I2C-bus met een master, drie slaves, SDA, SCL en twee pull-upweerstanden $R_p$ (slide 17).],
  label: <fig:L20-i2c-bus>,
)

I2C is *half duplex*. Simplex is communicatie in één richting. Half duplex laat beide richtingen toe, maar niet tegelijk. Full duplex laat beide richtingen tegelijk toe. I2C gebruikt twee lijnen:
- *SDA* voor de data.
- *SCL* voor de klok.

SPI heeft ter vergelijking vier draden.

=== Pull-upweerstanden <sec:i2c-pullup>

I2C heeft op SDA en SCL een pull-upweerstand naar de voedingsspanning nodig. De uitgangen van de toestellen zijn open drain. Een toestel kan de lijn dus laag trekken, maar niet hoog duwen. De pull-upweerstand brengt de lijn hoog zodra niemand haar laag trekt.

#figure(
  image("assets/L20-pullup.png", width: 85%),
  caption: [Pull-upweerstand bij een knop en bij de I2C-bus (slide 20).],
  label: <fig:L20-pullup>,
)

Bij een knop met een pull-upweerstand $R_1$ en een ingangsweerstand $R_2$ geldt voor $R_2 >> R_1$:

#frm(
  "Pull-upweerstand",
  $V_"input" = R_2 / (R_1 + R_2) V_"cc" approx V_"cc" quad "(knop open)", quad V_"input" = 0 quad "(knop dicht)"$,
  [Zonder druk op de knop leest de ingang hoog, met druk laag.],
)

met:
- $V_"input"$ --- spanning op de ingangspin [V]
- $V_"cc"$ --- voedingsspanning [V]
- $R_1$ --- pull-upweerstand [$Omega$]
- $R_2$ --- ingangsweerstand van de microcontroller [$Omega$]

#examenvraag("oefenvraag E12", [Waarom heeft een I#super[2]C-bus pull-upweerstanden nodig?],
  opties: (
    [om de spanning te begrenzen],
    [omdat de uitgangen open-drain zijn: ze kunnen de lijn alleen laag trekken, niet hoog],
    [om reflecties te dempen],
    [om de bus te voeden],
  ),
  juist: "B",
)[Elk toestel kan de lijn alleen naar massa trekken. Zou een toestel de lijn ook actief hoog kunnen duwen, dan sluit het kort met een toestel dat dezelfde lijn laag trekt. Bij open drain wint degene die laag trekt, en dat maakt de bus veilig met meerdere deelnemers. De opgaande flank komt van de pull-upweerstand die de buscapaciteit oplaadt met tijdconstante $tau = R_p C_"bus"$. Daarom is I2C trager dan een bus met actieve uitgangen. A, C en D zijn geen reden die de slides geven.]

=== Verloop van een transactie <sec:i2c-transactie>

Een transactie bestaat uit groepen van 8 bits, elk gevolgd door een *ACK* (acknowledge). De master begint met een start bit en sluit af met een stop condition van 1 bit.

#figure(
  image("assets/L20-i2c-frame.png", width: 95%),
  caption: [I2C-frame: start, 7-bit device address met R/W, ACK, 8-bit register address, ACK, data, ACK, stop (slide 24).],
  label: <fig:L20-i2c-frame>,
)

De volgorde:
+ *Master:* start bit.
+ *Master:* 7-bit device address plus een R/W-bit (samen 8 bits).
+ *Slave:* ACK.
+ *Master:* 8-bit adres van het interne register.
+ *Slave:* ACK.
+ *Slave of master:* 8 bits data.
+ *Ontvanger:* ACK.
+ *Master:* stop condition.

Het device address staat in de platforminformatie. Het registeradres staat in de datasheet van het toestel.

#oefening(title: "I2C-frame aflezen")[
  *Gegeven:* het I2C-signaal van slide 25. Het blauwe signaal op SDA bevat het device address, de R/W-bit en het registeradres (slide 26).

  *Gevraagd:* wat de master verstuurt op de blauwe lijn.

  *Oplossing:*
  - *Stap 1, device address:* de eerste 7 bits na het start bit zijn $0101001$, gelezen vanaf de MSB. Dat is $29_"hex"$.
  - *Stap 2, R/W:* de volgende bit is $1$. De master wil dus *lezen*.
  - *Stap 3, ACK:* de slave bevestigt na deze 8 bits.
  - *Stap 4, registeradres:* de volgende 8 bits zijn $00110010$, ofwel $32_"hex"$. Dit adres komt uit de datasheet van het toestel.
  - *Check:* het device address telt 7 bits en de R/W-bit komt er als achtste achter.
]

#figure(
  image("assets/L20-i2c-oplossing.png", width: 85%),
  caption: [Oplossing van de oefening: device address $0101001$, read $= 1$, registeradres $00110010$ (slide 26).],
  label: <fig:L20-i2c-oplossing>,
)

== PWM <sec:pwm>

*PWM* (pulse width modulation) verlaagt het gemiddelde vermogen van een signaal door het in pulsen te hakken. De breedte van de pulsen bepaalt hoeveel vermogen de belasting krijgt. Toepassingen zijn een DC-motor, een LED en audio.

#frm(
  "Duty cycle",
  $D = t_"aan" / T quad arrow.r.double quad overline(V) = D dot V$,
  [De duty cycle is de pulsbreedte gedeeld door de periode. Het gemiddelde is de duty cycle maal de piekspanning.],
)

met:
- $D$ --- duty cycle [-] (of in %)
- $t_"aan"$ --- pulsbreedte [s]
- $T$ --- periode van het signaal [s]
- $overline(V)$ --- gemiddelde spanning [V]
- $V$ --- spanning tijdens de puls [V]

#figure(
  image("assets/L20-duty-cycles.png", width: 70%),
  caption: [Signalen met duty cycle 100 %, 75 %, 50 % en 25 % bij 5 V. 50 % is de ideale blokgolf (slide 29).],
  label: <fig:L20-duty-cycles>,
)

=== Waarom PWM <sec:pwm-voordelen>

Bij een lineaire regeling zet een variabele weerstand het vermogen om in warmte. Een PWM-schakelaar staat volledig aan of volledig uit. Aan heeft de schakelaar bijna geen spanning over zich, uit loopt er geen stroom. Het vermogen $P = U I$ over de schakelaar is dus in beide standen bijna nul.

Voordelen volgens de slides: laag vermogenverbruik en ongevoelig voor ruis. Nadelen: de pulsflanken geven elektromagnetische ruis (spikes) en de schakeling kost meer.

#examenvraag("oefenvraag E13", [Een PWM-signaal van 24 V met een duty cycle van 30 %. Wat is de gemiddelde spanning, en waarom is PWM efficiënter dan een lineaire regeling?],
  opties: (
    [7,2 V; de schakelaar staat altijd volledig aan of volledig uit, dus er is nauwelijks dissipatie],
    [7,2 V; het rendement is gelijk aan dat van een lineaire regeling],
    [16,8 V; PWM is niet efficiënter],
    [12 V; het gemiddelde is altijd de helft],
  ),
  juist: "A",
)[$overline(V) = D dot V = 0{,}3 times 24 = 7{,}2 "V"$. Bij "aan" is de spanning over de schakelaar bijna nul, bij "uit" is de stroom nul, dus er is in beide standen bijna geen verlies. Een lineaire regelaar laat het verschil van $24 - 7{,}2 = 16{,}8 "V"$ over zichzelf vallen en zet dat om in warmte. B beweert het tegenovergestelde van A. C is $0{,}7 times 24$, de gemiddelde spanning bij 70 %. D geldt alleen bij 50 %.]

== Hardwarebibliotheken <sec:libraries>

Een hardwarebibliotheek laat je met Python of C de pinnen en bussen van de Pi aansturen zonder de registers zelf te schrijven. De slides bespreken vier bibliotheken. @fig:L20-lagen toont hoe ze op elkaar steunen.

=== MRAA <sec:mraa>

*MRAA* is een C/C++ bibliotheek met bindings naar Python, Javascript en Java. Ze koppelt de sensoren aan de I/O van de hardware.

```python
import mraa as m           # importeer de mraa-bibliotheek
x = m.I2c(0)               # initialiseer i2c bus 0
x.address(0x77)            # kies het slave-adres
x.writeReg(0xf4, 0x2e)     # schrijf 0x2e naar register 0xf4
```

Hier is `0x77` = 0111 0111 en `0xf4` = 1111 0100 in binair.

=== SMBUS2 <sec:smbus2>

*SMBUS2* is een pure Python-implementatie van het pakket `smbus`. Je vervangt `smbus` er direct mee.

```python
from smbus2 import SMBus
bus = SMBus(0)                          # open i2c bus 0
bus.write_byte_data(0x77, 0xf4, 0x2e)   # adres, register, data
```

=== UPM <sec:upm>

*UPM* is een bibliotheek met softwaredrivers voor veelgebruikte sensoren en actuatoren. Ze draait bovenop MRAA, zodat je niet zelf het i2c-protocol schrijft.

```python
from upm import pyupm_temperature as upm
temp = upm.Temperature(0)    # sensor op kanaal 0
T = temp.read()              # lees de temperatuur
del temp                     # geef de sensor vrij
```

=== Grove.py <sec:grove>

*Grove.py* is een Python-bibliotheek voor Grove-devices van Seeed Studio op embedded Linux. Ze hangt af van mraa, smbus2 en rpi.gpio.

```python
from grove.grove_temperature_humidity_sensor import DHT
sensor = DHT('11', 5)          # DHT11 op pin 5
humi, temp = sensor.read()     # vochtigheid en temperatuur
```

== MQTT <sec:mqtt>

*MQTT* (Message Queue Telemetry Transport) is een lichtgewicht, event- en berichtgeoriënteerd protocol voor asynchrone communicatie tussen toestellen en externe systemen over netwerken met beperkte capaciteit. In de slides staat het als user application bovenop de Pi.

Andy Stanford-Clark (IBM) en Arlen Nipper bedachten MQTT in 1999. Ze zochten een protocol met minimaal batterijverlies en minimale bandbreedte voor olieleidingen die via satelliet communiceren.

=== Light weight <sec:mqtt-light>

Een MQTT-pakket heeft een vaste overhead van 1 tot 4 bytes. De payload loopt van 127 B tot 256 MB. Weinig overhead betekent weinig data per bericht. Dat spaart batterij en bandbreedte.

#figure(
  image("assets/L20-mqtt-pakket.png", width: 85%),
  caption: [MQTT-pakketstructuur met beperkte vaste overhead (slide 49).],
  label: <fig:L20-mqtt-pakket>,
)

=== Event- en berichtgeoriënteerd <sec:mqtt-broker>

MQTT werkt met een client-servermodel. De server is een *broker*. Clients die berichten willen ontvangen, zijn *subscribers*. Clients die berichten sturen, zijn *publishers*. De publisher stuurt een bericht naar de broker over een *topic*, een virtueel kanaal. De broker stuurt het door naar de subscribers van dat topic. Een alternatief model is producer-consumer, met een blocking queue tussen producers en consumers.

#figure(
  image("assets/L20-mqtt-broker.png", width: 85%),
  caption: [MQTT-model met een broker tussen publishers en subscribers (slide 50).],
  label: <fig:L20-mqtt-broker>,
)

=== Asynchroon <sec:mqtt-async>

MQTT gebruikt publish-subscribe. Zenders en ontvangers staan los van elkaar in synchronicity, tijd en ruimte. Eén bericht bereikt zo meerdere ontvangers (one-to-many).

#figure(
  image("assets/L20-mqtt-async.png", width: 85%),
  caption: [Asynchrone communicatie via publish-subscribe, ontkoppeld in tijd, ruimte en synchronicity (slide 51).],
  label: <fig:L20-mqtt-async>,
)

#examenvraag("23-24 vraag 7 / 25-26 vraag 1 / voorbeeldexamen vraag 8", [MQTT wordt omschreven als "light weight" omdat ...],
  opties: (
    [de overhead in het datapakket veel kleiner is dan bij andere protocollen],
    [publish-subscribe zorgt voor een beperkt aantal datapakketten],
    [een asynchrone datastroom een beperkte impact op het netwerk heeft],
    [een broker slechts een beperkte impact op het netwerk heeft],
  ),
  juist: "A",
)[Een MQTT-pakket heeft een vaste overhead van 1 tot 4 bytes (slide 49). "Light weight" slaat dus op het formaat van het pakket. B, C en D zijn eigenschappen van MQTT, maar ze gaan over het aantal pakketten of de netwerkbelasting en verklaren de term niet.]
