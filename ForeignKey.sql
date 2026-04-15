CREATE TABLE opilaneTunnis(
opilaneTunnisId int Primary Key identity(1,1),
kuupäev date not Null,
opilaneId int, 
Foreign Key (opilaneId) References opilane(opilaneId), --tabel(PK veerg)
oppeaine varchar(25),
hinne int)
Select * from opilane;
Select * from opilaneTunnis;

--lisame Andmeid opilanetunnis tabelisse
INSERT INTO opilaneTunnis
VALUES ('2025-04-14', 2, 'keemia', 4);

--testTabel
Create table testTabel(
id int primary key);
--tabeli kustutamine
DROP Table testTabel;
DROP Database Mihhailenko;

--tabelirida kustutamine
select * from opilane
DELETE FROM opilane WHERE opilaneId=4;
