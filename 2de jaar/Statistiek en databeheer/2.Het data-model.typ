#import "../../school-template.typ": *

= Relationele databanken (ERD)

== ERB basis

#figure(
  image("ERD.png", width: 15cm),
  caption: [ERD],
  label: <fig:ERD>,
)

Dit is een voorbeeld van een ERD (entity-relationship diagram).

#concept(title: "Entiteit, Attribuut, waarde")[
  Een stad is een *entiteit* en een *waarde* is een deel van die entiteit. _Bv. De stad Leuven is een waarde in de entiteit stad_

  Een *attribuut* zijn de eigenschappen die bij een entiteit horen. Attributen zijn uniek aan de entiteit.
  Als je ziet dat je attributen meerdere keren voorkomen over verschillende entiteiten maak je best een nieuwe entiteit. _Bv. Adres komt voor bij stad en bij student, dus maak je een nieuwe entiteit adres_

  $arrow.r$ In een *student* Kunnen er meerdere attributen zijn. _Bv. Naam, punten, adres, telefoonnummer, etc._

]

*oefening*:\
_The library has several branch libraries scattered over the city, each
with their own opening hours.
...
A member may be enrolled in one of the branches and must be known
with full name and e-mail address to permit checking where the books
are and to be able to send warnings.
...
When a book is borrowed, the date is registered. When the book is
returned this return-date is stored too. These can be used for
calculating the fines
...
_

*Wat is nu handig om op te slaan?*
- Alle bibliotheken
- Boeken
- Members

*Wat bouwt deze entiteiten op, welke data moeten die hebben?*
- Bibliotheken: naam, adres, openingsuren
- Boeken: titel, auteur, ISBN, beschikbaarheid, categorie, nummer
- Members: naam, adres, e-mailadres
#figure(
  image("oplossing erb bibliotheek.png", width: 10cm),
  caption: [oplossing erb bibliotheek],
  label: <fig:oplossing-erb-bibliotheek>,
)


Dit is een typisch voorbeeld van een ERD. Je ziet dat er verschillende entiteiten zijn en dat er relaties tussen die entiteiten zijn.

== Relaties

#concept(title: "Relaties")[
  Een relatie is een verbinding tussen twee entiteiten. _Bv. Een student kan een boek lenen van een bibliotheek_

  Meestal kun je relatie beschrijven door een *werkwoord* te gebruiken. _Bv. lenen_

]

In onze oefening zie je dat je veel werkwoorden hebt dus je hebt daar ook relaties.

_The library $markhl("has")$ several branch libraries $markhl("scattered over the city")$, each
with their own opening hours.
...
A member $markhl("may be enrolled in")$ one of the branches and $markhl("must be known")$
with full name and e-mail address to permit checking where the books
are and to be able to send warnings.
...
When a book $markhl("is borrowed")$, the date $markhl("is registered")$. When the book is
$markhl("returned")$ this return-date is stored too. These can be used for
$markhl("calculating the fines")$
...
_


In een relatie ga je altijd de optionaliteit en de cardinaliteit moeten bepalen.

#concept(title: "Optionaliteit en Cardinaliteit")[
  *Optionaliteit (minimum)*: Moet de entiteit deelnemen aan de relatie?
  - `0`: Neen, optioneel.
  - `1`: Ja, verplicht.

  *Cardinaliteit (maximum)*: Hoe vaak kan de entiteit deelnemen?
  - `1`: Maximaal 1 keer.
  - `n` of `m`: Meerdere keren.

  *Notatie lezen (kruiselings*):
  De getallen `(Optionaliteit : Cardinaliteit)` staan aan het *uiteinde* van de relatie ("Notation at the endpoint").
  $arrow.r$ De cijfers vlakbij Entiteit B vertellen de regels voor *Entiteit A*!

  _Voorbeeld_:
  #align(center)[
    #v(1em)
    $
      "Student" -- markhl("(1:1)", tag: #<a1>) -- chevron.l "has" chevron.r -- markhl("(0:n)", tag: #<a2>) -- "Bike"
      #annot(<a1>, pos: bottom)[Slaat op "Bike": Exact 1 student per fiets.]
      #annot(<a2>, pos: top)[Slaat op "Student": Tussen 0 en n fietsen per student.]
    $
    #v(1em)
  ]

  Dit zijn logische relaties. Een fiets is maar van een student maar een student kan meerdere fietsen hebben.
]

#figure(
  image("relatiesynthax.png", width: 5cm),
  caption: [relatiesynthax],
  label: <fig:relatiesynthax>,
)

#figure(
  image("soorten relaties.png", width: 5cm),
  caption: [soorten relaties],
  label: <fig:soorten-relaties>,
)

Met relaties ingevoegd krijgen we deze *Oplossing:*

#figure(
  image("oplossing oefening.png", width: 10cm),
  caption: [oplossing oefening],
  label: <fig:oplossing-oefening>,
)


Nu wanneer wordt het boek geleend. Wanneer wordt die geleend en terug gebracht. Deze attributen horen niet echt bij een *entiteit* maar bij een *relatie*. Als je dit doet krijg je een *associatieve entiteit*.

#figure(
  image("assosiatieve entiteit.png", width: 5cm),
  caption: [assosiatieve entiteit],
  label: <fig:assosiatieve-entiteit>,
)


Er is nu wel een probleem. Stel ke voor dat je meedere dezelfde boeken hebt. Met de huidige entiteit *Boek* weet je niet welk van de verschillende boeken nu uitgeleend is.
Je maakt een nieuwe entiteit *BookCopy* met een data genaamt *copynr* zodat je meerdere boeken kunt hebben met zijn nummer zodat je weet welke van de meerdere boeken uitgeleend wordt.
Je hebt dan een relaite *Copy of* tussen *Book* en *BookCopy*.
Dit is logisch want je leent een copy van het boek en niet perse het idee van het boek.

#figure(
  image("final diagram.png", width: 10cm),
  caption: [final diagram],
  label: <fig:final-diagram>,
)

Dit type diagram is het moeilijkste. Als dit gemaakt is en je toont het aan de klant kunnen zij zeggen of het klopt of niet en als het klopt kunnen databank designers deze beginnen maken.

= ERB -> Databank tabellen

- Entiteiten worden tabellen
- Attributen worden kolommen
- Relaties
  - een-op-een relaties: de primaire sleutel van de ene tabel wordt ook opgeslagen in de andere tabel en wordt daar een vreemde sleutel genoemd. Kopieer de sleutel die resulteert in het laagste aantal NULL-waarden.
  - een-op-veel relaties: de primaire sleutel van de "één"-tabel wordt ook opgeslagen in de "veel"-tabel en wordt daar een vreemde sleutel genoemd.
  - veel-op-veel relaties: er wordt een associatieve entiteit toegevoegd die de primaire sleutel van beide entiteiten van de relatie bevat.


  Als we dit toepassen op onze oefening krijgen we:

  #figure(
    image("relaties-oefening-library.png", width: 10cm),
    caption: [relaties-oefening-library],
    label: <fig:relaties-oefening-library>,
  )

*Stap 1*: Maak tabellen van de entiteiten
$arrow.r$ maak een nieuwe kolom voor elk attribuut $arrow.r$ assign je primaire sleutel

#codeblock(title: "Tabellen (Primary Keys)")[
  LIBRARYBRANCH (#underline[name], address, openingHours, city) \
  MEMBER (name, email, #underline[number]) \
  BOOKCOPY (#underline[copyNr]) \
  BOOK (title, #underline[number], ISBN, author, nrOfPages, category)
]

*Stap 2*: one:one en one:many relaties
$arrow.r$ Voeg relaties toe door foreign keys toe te voegen aan de tabellen ("many"-kant)

#codeblock(title: "Foreign Keys toevoegen")[
  LIBRARYBRANCH (#underline[name], address, openingHours, city) \
  MEMBER (name, email, #underline[number], libBranchName) \
  BOOKCOPY (#underline[copyNr], nameLibBranch, bookNr) \
  BOOK (title, #underline[number], ISBN, author, nrOfPages, category)
]

*Stap 3*: many:many relaties
$arrow.r$ nieuwe associatieve entiteiten met de primaire sleutels van beide tabellen

#codeblock(title: "Associatieve Entiteit")[
  LIBRARYBRANCH (#underline[name], address, openingHours, city) \
  MEMBER (name, email, #underline[number], libBranchName) \
  BOOKCOPY (#underline[copyNr], nameLibBranch, bookNr) \
  BOOK (title, #underline[number], ISBN, author, nrOfPages, category) \
  BORROWS (#underline[memberNumber], #underline[bookCopyNr], dateIn, dateOut)
]
