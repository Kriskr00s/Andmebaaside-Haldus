# Andmebaaside-Haldus porfoolio LOGITpe24
Andmebaasidega seotud SQL kood ja konspektid

- SQL - Structured Query Language - strukteeritud päringukeel
- DDL - Data Definition Language - andmebaasi struktuuri loomiskes - CREATE, ALTER
- DML - Data Manipulation Language -andmete lisamine ja uuendamine tabelis - INSERT, UPDATE, DELETE

  ## Sisukord
 [Select laused](select.md) 
[Triqerid](trigerid.md) 
[Võtmed](keys.md) 
[Kasutaja](kasutaja.md) 
[testi küsimused](kysimused.md) 


 
 - [andmebaasihaldussüsteemid](#-andmebaasihaldussüsteemid)
 - [Põhimõisted](#-Põhimõisted)
  - [Andmetüübid](#-Andmetüübid)
  - [Piirangud](#-Piirangud)
  - [Tabelivahelised Seosed](#-tabelivahelised-Seosed)


### tunnis me kasutame andmebaasihaldussüsteemid:
1. SQL Server Managment Stuudio (SQL Serveri haldamiseks)<img width="400" height="450" alt="{C73DCDCC-4A3D-400B-86F1-9237B6A77B63}" src="https://github.com/user-attachments/assets/df5ea39f-3ed5-4d95-ad53-20ab4e6e1cd3" />

2. XAMPP -phypmyAdmin (mariaDB andmebaas) -vabavara

  ## Põhimõisted

- Andmebaas - strukteeritud andmete kogum
- Tabel - olem (entity)
- veerg - väli (field)
- rida - kirje (record)
- primaarne võti -PK-Primary Key - veerg (tavaliselt nimega id) unikaalse identifikaatoriga, mis eristab iga kirjet
- Välisvõti (võõrvõti) -FK Foreign Key - veerg, mis loob seose teise tabeli primaarvõtmega.

  ## Andmetüübid
  - INT, float, decimal(6,2) - numbrilised
  - varchar(50), char(6) - tekst/sümbolid
  - boolean, bool, bit - loogiline tüüp
  - date, time, datetime - kuupäeva

## Piirangud
```
1. Primary Key
2. Foreign Key
3. Unique
4. Not Null
5. Check
```

## Tabelivahelised Seosed
- üks - ühele (nt mees --naine)
- üks -mitmele (õpilane käib erinevates õppeainetes)
  <img width="486" height="215" alt="{39FE7350-E233-450B-B521-76A263E421A5}" src="https://github.com/user-attachments/assets/7818b5a7-def5-4714-8541-f3f6b9a28f2b" />
<img width="468" height="144" alt="{FD4D2182-1A07-42FA-8E1D-2BD59928FECF}" src="https://github.com/user-attachments/assets/1ae98d86-b36a-4185-b7ef-e27e6fbbbda2" />

- mitu - mitmele (nt õpilane - õpetaja)

## Stored procedure
  Salvestatud protsetuurid - sama mis on funktsioonid programeerimises - mingid tegevused mida saab automaatselt teha (INSERT, SELECT, UPDATE, DELETE)
```sql
select * from categories;
--protseduur, mis täidab tabeli
CREATE PROCEDURE lisaKategooria
@nimi varchar(15)
AS
BEGIN
	INSERT INTO categories
	VALUES (@nimi);
	SELECT * FROM categories;
END
--kutse
EXEC lisaKategooria 'test2'

--protseduur, mis kustutab tabelist id järgi
Create procedure kustutaIdJärgi
@id int
AS
BEGIN
	SELECT * FROM categories;
	DELETE FROM categories WHERE category_id=@id;
	SELECT * FROM categories;
END
--kutse
EXEC kustutaIdjärgi 6;
```

<img width="699" height="341" alt="{74441263-F4A0-49CE-8385-38AF59141AFD}" src="https://github.com/user-attachments/assets/74f8c730-e374-45f6-b919-3c12ea29231c" />

  
