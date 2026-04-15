create database Valtin;
use Valtin;
--tabeli Loomine
CREATE TABLE opilane(
opilaneId int Primary Key identity(1,1),
eesnimi varchar(25),
perekonnanimi varchar(30) not null,
synniaeg date,
pohitoetus bit,
aadress TEXT,
keskmineHinne decimal(2, 1))

SELECT * FROM opilane;

--andmete lisamine tabelisse
INSERT INTO opilane(perekonnanimi, eesnimi, synniaeg)
VAlUES ('Valge', 'Sall', '2003-10-23'),
('Roheline', 'Sall', '2001-10-1')

--uuendame tabeliandmeid
UPDATE opilane SET aadress='Tallinn, Eesti'
UPDATE opilane SET pohitoetus=1 --1 on true
UPDATE opilane SET keskmineHinne=4.5;
--kui soovime kõik veerud täita - ei pea need nimetama
INSERT INTO opilane
VAlUES ('Nimi', 'Perenimi', '2003-10-23', 0, 'Tartu, Eesti', 3.5)
