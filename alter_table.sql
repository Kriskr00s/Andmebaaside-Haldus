--Tabeli struktuuri muutmine

--uues veeru lisamine
ALTER TABLE opilane ADD telefon varchar(1);

--tabeli struktuuri muutmine -veeru kustutamine
ALTER TABLE opilane DROP COLUMN telefon;

--tabeli muutmine - veeru andmetüübi vahetamine
ALTER TABLE opilane ALTER COLUMN telefon varchar(13);

--store pocedure help, mis näitab tabeli struktuuri ja nende veergude vahet
sp_help ryhm;

drop table ryhm;
--Piirangud, Constraints

CREATE TABLE ryhm(
ryhmID int NOT NULL,
ryhmNimi varchar(10));

Select * from ryhm
--muudame tabeli ryhm ja lisame Primary Key
ALTER TABLE ryhm ADD CONSTRAINT pk_ryhm Primary Key(ryhmID);

--muudame tabeli ryhm ja teeme ryhmNimi unikaalskes UNIQUE
ALTER TABLE ryhm ADD CONSTRAINT un_ryhm UNIQUE(ryhmNimi);

--täidame tabeli rühm
INSERT INTO ryhm(ryhmID, ryhmNimi)
Values (3, 'LOGITpe24'),(4, 'TITpe24')
SELECT * FROM ryhm;
SELECT * FROM opilane;
--FOREIGN KEY --opilane tabelis
--lisame opilane tabelisse uus veerg
ALTER TABLE opilane ADD ryhmID int;

--lisame ryhmID foreign key
Alter TABLE opilane ADD CONSTRAINT fk_ryhm
FOREIGN KEY (ryhmID) REFERENCES ryhm(ryhmID) --link tabel(PK veerg)

--kontrollimiseks täidame tabeli opilane
INSERT INTO opilane
VAlUES ('Kevin', 'Allik', '2003-10-23', 0, 'Tartu, Eesti', 3.5, '+35555', 4)
