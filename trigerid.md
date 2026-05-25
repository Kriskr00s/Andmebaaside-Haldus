## Triger - trigger - päästik
### triger - andmebaasi objekt, mis käivitud automaatselt,  kui toimub teatud sündmus (nt INSERT, DELETE, UPDATE)
trigerite loomine automatiseerib protsessid SQL serveris

Eelvalimistus trigeriteks
```SQL
Create database trigerLOGITpe24

use trigerLOGITpe24;

CREATE TABLE linnad(
linnId int primary key identity(1,1),
linnanimi varchar(30) unique,
maakond varchar(50),
rahvaarv int);

select * from linnad;
INSERT INTO linnad(linnanimi, maakond, rahvaarv)
VALUES ('Tallinn', 'Harjumaa', 600000)

--tabel logi- tabel, mis täidab triger!!! Kui kasutaja täidab tabeli linnad
CREATE TABLE logi(
id int primary key identity(1,1),
kasutaja varchar(50),
aeg DATETIME,
andmed TEXT);
```

```SQL
--1. Triger lisatud andmete jälgimiseks tabelis linnad.
--jälgib andmete sisestusi

CREATE TRIGGER linnaLisamine
ON linnad --tabel, mida jälgitakse
FOR INSERT
AS
INSERT INTO logi(kasutaja, aeg, andmed)
SELECT 
SYSTEM_USER, -- sisselogitud kasutaja
GETDATE(),
CONCAT('lisatud:',inserted.linnanimi,', ', 
inserted.maakond,', ', 
inserted.rahvaarv)
FROM inserted;

--kontrollimiseks tuleb lisada midagi tabelisse
INSERT INTO linnad(linnanimi, maakond, rahvaarv)
VALUES ('Narva', 'Venelased', 257354);

SELECT * FROM linnad;
Select * from logi;
```

<img width="451" height="263" alt="{C69B615E-87DF-4F68-B750-91EA958C7E9E}" src="https://github.com/user-attachments/assets/4e7082ca-5ba3-482c-8875-9193efc8fb70" />
