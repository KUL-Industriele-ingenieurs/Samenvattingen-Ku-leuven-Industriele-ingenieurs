#import "../../school-template.typ": *

= Introductie Databeheer
Dit vak gaat over databanken en hoe je databanken
kunt maken en gebruiken.


#figure(
  image("Visuele DB.png", width: 5cm),
  caption: [Visuele DB],
)

Deze figuur toont hoe databank relaties opgesteld worden. Dit gaat over een student en welke cursussen hij volgt.

Databanken werken met code genaamt *SQL*

*Voorbeeld code*

#codeblock(title: "introductie.sql", lang: "sql")[
  ```sql
  CREATE DATABASE,
  CREATE TABLE,
  INSERT INTO,
  SELECT,
  UPDATE,
  DELETE

  INSERT INTO cursussen (naam, code,ECTS)
  VALUES ('Statistiek en Databeheer', 'Statistiek en Databeheer', 6)

  SELECT * FROM cursussen;
  ```
]

== Wat is data?

#wrap-figure(
  image("groeiendedata.png", width: 8cm),
  caption: [groeiendedata],
  label: <fig:groeiendedata>,
)[
  Data wordt in verschillende vormen opgeslaan.
  Je hebt deze al gezien. Al je bestanden op je
  computer zijn data en hebben dan een formaat

  - text .txt
  - image .png
  - video .mp4
  - audio .mp3
  - Json .json
  - XML .xml
  - csv .csv
  - etc.


  Alle data in de wereld is enorm aan het groeien en we zitten vandaag de dag met meer als 175 zetabyte data. Dat is $175 dot 10^{21}$ bytes

]

== NO SQL databases


#wrap-figure(
  image("nosqldatabank.png", width: 5cm),
  caption: [nosqldatabank],
  label: <fig:nosqldatabank>,
)[
  No SQL databases zijn niet relationele databanken. Bij gigantische datasets kun je niet
  altijd SQL of *relationele databanken* gebruiken.

]

== Waarom data?
Waarom is al deze data nu belangrijk?
Alle grote bedrijven willen data zodat ze kunnen *advertenties* geven.

+ Hoe meer data ze hebben, hoe beter ze kunnen *advertenties* geven. Als je dus een _gratis_ app gebruikt ben je eigenlijk aan het betalen met je data.

+ Proberen catastrofes te voorkomen. Vorige data kan je helpen om het weer, overstromingen, etc te voorspellen.

+ *Gezondheidzorg*: In Groep T hebben ze een robotje gemaakt die oudere mensen helpt om oefeningen te doen die de risico op vallen verminderd. Die robot geeft dan realtime feedback en data over de fitness van de ouderen.

+ *Chatgpt & AI*: Alle AI hebben data nodig om te kunnen schrijven. Ze voorspellen uiteindelijk gewoon het volgende woord in een zin. Data is nodig om AI te kunnen trainen.

= Info over de cursus
Het bestaat uit twee delen
+ *Databanken*: Leren met databanken werken
+ *Visuele data*: Leren hoe je data kan visualiseren

== Overview


*Overview*:
- RelationalDatabases
  - Data modeling: EntityRelationshipDiagram
  - Convertingthe diagram todatabase design
  - Interactingwiththe database –SQL queries
  - DBMS
  - Training “from ER to CREATE TABLE queries”
- Visualisationof data
- Legal aspects(data privacy)
- Data manipulation: compression& encryption
- Intro Machine Learning
- Data

Er is een boek via limo als je daar meer info wilt halen.
#link("https://limo.libis.be/primo-explore/search?vid=KULeuven")

== Examen
In het examen moet je een databank moeten kunnen opstellen dus #belangrijk("Code kunnen schrijven"), je krijgt meerkeuzevragen en je moet ook een datavisualisatie kunnen maken.














