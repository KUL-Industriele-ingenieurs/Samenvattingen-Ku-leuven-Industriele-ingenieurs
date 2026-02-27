#import "../../school-template.typ": *

Het probleem met *free text field*:

Stel je wilt een categorie toevoegen aan een nieuw boek. Wat voeg je toe? Science, Scienc, Sci,

Er moet een beter manier zijn om dit op te lossen.


#codeblock(title: "Create final DB from .SQL file", lang: "sql")[

  ```sql
  CREATE TABLE IF NOT EXISTS `LibraryBranch` (
  `name` VARCHAR(50) NOT NULL PRIMARY KEY UNIQUE,
  `address` VARCHAR(50),
  `openinghours` VARCHAR(50) NOT NULL,
  `city` VARCHAR(50));
  INSERT INTO `LibraryBranch` VALUES ("LEU",'Rijschoolstraat 4, 3000 Leuven','10-18','Leuven’);
  INSERT INTO `LibraryBranch` VALUES ('HVL','Waversebaan 61, 3001 Leuven','14-17','Heverlee’);
  INSERT INTO `LibraryBranch` VALUES ('KLO','Stadionlaan 4, 3010 Leuven','15-18','Kessel-Lo’);
  CREATE TABLE IF NOT EXISTS `Member` (
  `number` INTEGER NOT NULL PRIMARY KEY UNIQUE,
  `name` VARCHAR(50) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `libBranchName` VARCHAR(50), FOREIGN KEY(`libBranchName`) REFERENCES`LibraryBranch`(`name`));
  INSERT INTO `Member` VALUES (1,'Sam Cox','sammeke@ hotmail.com','LEU’);
  INSERT INTO `Member` VALUES (2,'Bram Diels','bramdiels@ gmail.com','LEU’);
  ```
]


= SQL

SQl staat voor Structured Query Language. Gemaakt door IMB in 1976 voor databases.

Het bestaat uit 2 stukken:

- *DDL (Data Definition Language):* Definieert de structuur van de database.
- *DML (Data Manipulation Language):* Manipuleert de data in de database.

Verschillende met _Python, Java etc_ die #keyterm[imperative languages] zijn, is SQL een #keyterm[declarative language]. Je zegt wat je wilt, niet hoe je het moet doen.

imperative talen gaan je je focussen op een *algoritme* om het probleem op te lossen maar declarative talen ga je je op het doel focussen. Hoe het uit de databank gehaald wordt boeit ons niet

Een website kan bijvoorbeeld op verschillende manieren voor je login vragen. Maar het boeit ons niet hoe dat gedaan wordt (welke knoppen of menu's er zijn). Een databank heeft gewoon de data nodig en dan geeft die een output.

== Quary data van een databank, SQL introductie

General formaat van SQL

#codeblock(title: "General formaat van SQL", lang: "sql")[
  ```sql
  SELECT <list of attributes>
  FROM <list of tables>
  WHERE <condition>
  GROUP BY <list of attributes>
  HAVING <condition>
  ORDER BY <list of attributes>;
  ```
]

#voorbeeld(title: "Query data van 1 tabel")[


  #table(
    columns: (auto, auto, auto, auto, auto, auto),
    [*number*], [*ISBN*], [*title*], [*author*], [*nrOfPages*], [*category*],
    [1], [978-1-292-15904-1], [Objects First with Java], [Barnes & Kölling], [592], [software],
    [2], [978-1-430-21633-2], [Python3 for Absolute Beginners], [Hall], [300], [software],
    [3], [978-1-786-81340-4], [The Baby sitter], [Browne], [362], [crime],
    [4], [978-1-408-88833-9], [All the invisible things], [Collins], [752], [kids],
    [5], [978-1-526-60616-7], [Harry Potter and the Prisoner of Azkaban], [Rowling], [480], [fantasy],
    [6], [0-453-00269-2], [2001, A space odissey], [Clarke], [221], [science-fiction],
    [7], [978-014-136222-9], [The Jungle Book], [Kipling], [256], [kids],
    [8], [978-1-408-70420-2], [The casual vacancy], [Rowling], [503], [crime],
  )

  *SQL*

  ```sql
  SELECT *
  FROM Book;
  ```
  Gaat een select maken van bepaalde kolommen uit een tabel. De $ast.op$ betekent dat we alles willen. We kunnen ook specifieke kolommen selecteren door ze te benoemen.

  ```sql
  SELECT title, author
  FROM Book;
  ```
  Gaat alleen de title en author selecteren uit de tabel Book.

  Je kunt dan wel meedere keer dezelfde auteur hebben. Om dit te voorkomen kun je DISTINCT gebruiken.

  ```sql
  SELECT DISTINCT author
  FROM Book;
  ```
  Gaat alleen de author selecteren uit de tabel Book. DISTINCT zorgt ervoor dat we geen dubbele auteurs krijgen.

]

Dit blijft zo door gaan in de slides. Ik raad aan om er eens vlug door te gaan en de voorbeelden te bekijken. De slides zijn niet zo moeilijk en gaan vooral over de syntax van SQL.









