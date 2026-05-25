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

```SQL
--2. DELETE triger - jälgib kustutamist

CREATE TRIGGER linnaKustutamine
ON linnad --tabel, mida jälgitakse
FOR DELETE
AS
INSERT INTO logi(kasutaja, aeg, andmed)
SELECT 
SYSTEM_USER, -- sisselogitud kasutaja
GETDATE(),
CONCAT('kustutatud:',deleted.linnanimi,', ', 
deleted.maakond,', ', 
deleted.rahvaarv)
FROM deleted;

--kontroll
DELETE FROM linnad WHERE linnId=2;
```

<img width="470" height="265" alt="{3DF2B907-228B-4168-AA94-816B4A2AE7AF}" src="https://github.com/user-attachments/assets/5fdee3e3-bb26-4cdb-8b9a-ac3dd3fd3a38" />

```SQL
--3. Trigger mis kontrollib uuendusi

CREATE TRIGGER linnaUpdate
ON linnad --tabel, mida jälgitakse
FOR UPDATE
AS
INSERT INTO logi(kasutaja, aeg, andmed)
SELECT 
SYSTEM_USER, -- sisselogitud kasutaja
GETDATE(),
CONCAT('vana andmed : ',
deleted.linnanimi,', ', deleted.maakond,', ', deleted.rahvaarv,
'||| uued andmed: ',
inserted.linnanimi,', ', inserted.maakond,', ', inserted.rahvaarv)
FROM deleted INNER JOIN inserted
ON deleted.linnId=inserted.linnId;

--kontroll
UPDATE linnad SET linnanimi='Tallinn_v2', rahvaarv=700000
WHERE linnId=1;
```
<img width="545" height="276" alt="{096A45FC-0A52-4704-B565-74076ABC4A66}" src="https://github.com/user-attachments/assets/709c2cbc-7550-4115-8af3-faf9889fb38a" />

```SQL
--triger sisse/välja lülitamine
Disable Trigger linnaLisamine ON linnad;
Disable Trigger linnaKustutamine ON linnad;
Enable Trigger linnaUpdate ON linnad;

--Ühine triger mis jägib kas lisab või kustutab
CREATE TRIGGER linnaLisamineKustamine
ON linnad --tabel, mida jälgitakse
FOR INSERT, DELETE
AS
BEGIN
SET NOCOUNT ON;
	INSERT INTO logi(kasutaja, aeg, andmed)
	SELECT 
	SYSTEM_USER, -- sisselogitud kasutaja
	GETDATE(),
	CONCAT('lisatud:',inserted.linnanimi,', ', 
	inserted.maakond,', ', 
	inserted.rahvaarv)
	FROM inserted

	UNION ALL

	SELECT 
	SYSTEM_USER, -- sisselogitud kasutaja
	GETDATE(),
	CONCAT('kustutadud:',deleted.linnanimi,', ', 
	deleted.maakond,', ', 
	deleted.rahvaarv)
	FROM deleted;
END;


DELETE FROM linnad WHERE linnId=5;

--kontrollimiseks tuleb lisada midagi tabelisse
INSERT INTO linnad(linnanimi, maakond, rahvaarv)
VALUES ('Narva', 'Venelased', 257354);
```
<img width="547" height="347" alt="{7685E480-2A09-443D-ADB6-867B4487E39D}" src="https://github.com/user-attachments/assets/e026d009-54da-439c-8271-d27dd046da99" />

```SQL
--teeme kasutaja sekretarValtin -õigustega linnaLisamine, kustutamine, uuendamine ja ei näe tabeli logi ning ei saa trigereid muuta
--security--NEW login

GRANT SELECT, INSERT, DELETE ON linnad To sekretarValtin;
DENY SELECT oN logi to sekretarValtin;


--SELECT permission was denied on the object 'logi' 
SELECT * from logi;

SELECT * from linnad;
DELETE FROM linnad WHERE linnId=6;

--kontrollimiseks tuleb lisada midagi tabelisse
INSERT INTO linnad(linnanimi, maakond, rahvaarv)
VALUES ('Narva', 'Venelased', 257354);
```
<img width="546" height="231" alt="{F38DAFBA-343E-4582-93A8-4FCE9BB42F98}" src="https://github.com/user-attachments/assets/6f54ea87-c9ff-44e1-904c-e86ab03ec61b" />



