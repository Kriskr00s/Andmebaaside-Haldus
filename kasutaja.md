## SQL Server – Kasutajate autentimine ja õiguste haldamine
 [Select laused](select.md) |
[Triqerid](trigerid.md) |
[Võtmed](keys.md) |
[Kasutaja](kasutaja.md) |
[Moodle test](kysimused.md) |
[Protseduurid](Brand_Procedure.md) |
Mis on autentimine SQL Serveris?
 ### Autentimine tähendab kasutaja tuvastamist ehk kontrollimist, kas kasutajal on õigus SQL Serverisse sisse logida.

**SQL Serveris kasutatakse kahte peamist autentimise tüüpi:**

1. Windows Authentication
Selle puhul kasutatakse samu kasutajaandmeid, millega logitakse sisse Windows operatsioonisüsteemi.

>Kasutajanimi ja parool on seotud Windowsiga.
>Turvalisem lahendus.
>Paroole haldab Windows.
>Kasutaja ei pea eraldi SQL Serveri parooli teadma

2. SQL Server Authentication
Selle puhul luuakse kasutaja otse SQL Serverisse.

Kasutaja ei ole seotud Windowsiga
Määratakse eraldi kasutajanimi ja parool
Sobib veebirakenduste jaoks

**Näide kasutajast: DirectorNimi Parool: director**

1. Serveritaseme kasutaja loomine (Login)
Sammud
Ava:

Security → Logins
Tee paremklikk ja vali:

New Login...

<img width="707" height="656" alt="{1EA27241-F189-4552-B02B-61DE7511D22E}" src="https://github.com/user-attachments/assets/fa59ce14-3089-4112-8be2-f938cba1b0c5" />

Harjutamiseks võib eemaldada linnukese:  User must change password at next login
Server Roles
Menüüst Server Roles saab määrata serveri üldised õigused.

Tavaliselt piisab rollist: public

<img width="113" height="169" alt="{EB40D8F0-8610-4543-8F77-E282F9222C8F}" src="https://github.com/user-attachments/assets/87ba1c89-a7c7-440f-b177-6939d6560921" />

<img width="699" height="386" alt="{AB29FD5D-B78B-4614-AA4B-D925D9D2E164}" src="https://github.com/user-attachments/assets/2b4ba37b-e805-4559-9978-23dbcc9792b6" />

2. Andmebaasi kasutaja loomine (User)
Ava:

Database → Security → Users
Tee paremklikk:  New User...

Seosta kasutaja loginiga
<img width="194" height="232" alt="{C5062817-C9BB-4C01-8EE5-37801C55485D}" src="https://github.com/user-attachments/assets/69f2e55c-6fb1-4292-95e8-14d773b119d5" />

Membership ja õigused
Menüüst Membership saab määrata kasutaja rollid.

db_datareader → võib lugeda SELECT
db_datawriter → võib kirjutada INSERT, UPDATE, DELETE



<img width="338" height="293" alt="{23699B70-0777-422A-8737-9DD40E5CFCC0}" src="https://github.com/user-attachments/assets/33b7494a-0df4-42b3-8119-c3490c1eb428" />

------------------------------------------------------------------
## Kasutaja õiguste kontroll

1. Tuleb sisse logida kasutajana directorKristofer. Connect--> Database Engine
   <img width="470" height="506" alt="{3374BAF3-9070-4DAC-8A92-8D9449A426EF}" src="https://github.com/user-attachments/assets/6ffb552d-af39-490d-9b76-c30fb6aa12e7" />

2. Saab tabeli sisu näha ja sisestada uus kiri
   <img width="698" height="295" alt="{18D82FDB-551C-4EBE-BEAB-62763853291A}" src="https://github.com/user-attachments/assets/b5d4497b-7bd4-4f77-8718-4dbc36a0747d" />

3. Kontrollime tegevus mis ei ole lubatud kasutajale, niteks tabeli loomine
   <img width="614" height="297" alt="{A6540736-499E-43B5-9A5C-EFF883F3A998}" src="https://github.com/user-attachments/assets/b45bd26c-49a4-4a7f-9b78-3cf48a681744" />



------------------------------------------------------------------
SQL Server Authentication Mode muutmine
Kui ilmub viga: Error 18456, siis on tavaliselt lubatud ainult Windows Authentication.
Lahendus
Server → Properties
Security
Vali: SQL Server and Windows Authentication mode
GRANT käsud õiguste jagamiseks
GRANT käsuga antakse kasutajale õigused.

```sql
--GRANT - õiguste määramine
--DENY - õiguste keelamine

--db_datareader -SELECT
--DB_datawriter - INSERT, DELETE, UPDATE

--anname kasutajale directorKristofer õigus
--ainult kustutada ja uuendada tabelit
--(DELETE, UPDATE, SELECT)
GRANT DELETE ON puhkus TO directorKristofer
GRANT UPDATE ON puhkus TO directorKristofer
GRANT SELECT ON puhkus TO directorKristofer

--keelame INSERT 
DENY INSERT ON puhkus TO directorKristofer
```

<img width="492" height="235" alt="{36A7A76C-316C-49B7-BE78-C817949DBB88}" src="https://github.com/user-attachments/assets/ca67f7a1-e19b-47be-b52e-5624d278f297" />


Käsk	Tähendus
SELECT	Lugemine
INSERT	Lisamine
UPDATE	Muutmine
DELETE	Kustutamine

<img width="531" height="574" alt="{4DAC0B32-8345-47DD-9693-A6FAECDDF121}" src="https://github.com/user-attachments/assets/abb4e8e9-ab7f-45f2-aee1-5ca1dc316faa" />
