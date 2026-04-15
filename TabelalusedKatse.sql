--TEST koht

CREATE TABLE opetaja(
opetajaId int Primary Key identity(1,1),
nimi varchar(25),
ruum varchar(25),)

INSERT INTO opetaja
VAlUES ('Nimi', 213);

CREATE TABLE opetamine(
opetamineId int Primary Key identity(1,1),
opetajaID int,
Foreign Key (opetajaID) References opetaja(opetajaID),
oppeaine varchar(25),
maht int)

INSERT INTO opetamine
VALUES ( 1, 'keemia', 15);

Select * from opetaja;
Select * from opetamine;
