# Andmebaasi võtmed (Keys)
| Teemad ja materjalid |
| :--- |
| [SELECT laused](select.md) |
| [Trigerid](trigerid.md) |
| [Andmebaasi võtmed](keys.md) |
| [Kasutajate haldus](kasutaja.md) |
| [Moodle testid ja küsimused](kysimused.md) |
| [Salvestatud protseduurid](Brand_Procedure.md) |
| [Andmebaasi vaated (Views)](vaade.md) |

Andmebaasi võtmed on atribuudid (veerud) või atribuutide kombinatsioonid, mida kasutatakse tabelis ridade unikaalseks tuvastamiseks, andmete tervikluse tagamiseks ja tabelitevaheliste seoste loomiseks.

---

## 1. Primary Key (Esmased võti)

* **Definitsioon:** Veerg või veergude kogum, mis tuvastab unikaalselt andmebaasi tabeli iga rea (kirje). See ei tohi sisaldada korduvaid väärtusi ega `NULL` (tühje) väärtusi.
* **Milleks kasutatakse:** Kasutatakse tabelis kirjete kiireks otsimiseks ja unikaalsuse tagamiseks. See on aluseks teiste tabelitega seoste loomisel.
* **Erinevus teistest:** Tabelis saab olla ainult **üks** Primary Key. Erinevalt Unique Key'st ei tohi see kunagi olla tühi (`NOT NULL`).

### SQL Näide:
```sql
CREATE TABLE Tootajad (
    TootajaID INT PRIMARY KEY,
    Eesnimi VARCHAR(50),
    Perekonnanimi VARCHAR(50)
);
```
<img width="212" height="270" alt="{230776B8-5046-4C5C-BE5A-8FF7E3F1BBE7}" src="https://github.com/user-attachments/assets/0dd746c1-6d08-482d-8eed-eeed86b0ce9f" />

2. Foreign Key (Välisvõti)
Definitsioon: Veerg või veergude kogum ühes tabelis, mis viitab teise tabeli esmasele võtmele (Primary Key) või unikaalsele võtmele.

Milleks kasutatakse: Kasutatakse tabelitevaheliste seoste (suhete) loomiseks ja andmete referentsiaalse tervikluse tagamiseks (et ei saaks luua seotud kirjet, mille peamist kirjet pole olemas).

Erinevus teistest: Erinevalt Primary Key'st võib Foreign Key sisaldada korduvaid väärtusi ja ka NULL väärtusi (kui seos on valikuline). Ühes tabelis võib olla mitu välisvõtit.

```sql
CREATE TABLE Tellimused (
    TellimusID INT PRIMARY KEY,
    Summa DECIMAL(10,2),
    TootajaID INT,
    FOREIGN KEY (TootajaID) REFERENCES Tootajad(TootajaID)
);
```
<img width="527" height="135" alt="{DD3B1AF0-21B5-42CE-8C7B-1723C9150AAD}" src="https://github.com/user-attachments/assets/335c7de3-a174-44d6-9956-c7dc62b7623d" />

3. Unique Key (Unikaalne võti)
Definitsioon: Veerg või veergude kombinatsioon, mis tagab, et kõik selles veerus olevad väärtused on unikaalsed (ei kordu).

Milleks kasutatakse: Kasutatakse andmete unikaalsuse nõude kehtestamiseks veergudele, mis ei ole tabeli peamised võtmed (näiteks isikukood, e-posti aadress, telefoninumber).

Erinevus teistest: Erinevalt Primary Key'st võib Unique Key sisaldada NULL väärtust (SQL Serveris lubatud ainult üks NULL väärtus veeru kohta). Ühes tabelis võib olla mitu unikaalset võtit.

```sql
CREATE TABLE Kliendid (
    KlientID INT PRIMARY KEY,
    Nimi VARCHAR(100),
    Isikukood CHAR(11) UNIQUE
);
```

4. Simple Key (Lihtne võti)
Definitsioon: Võti, mis koosneb ainult ühest ainukesest veerust.

Milleks kasutatakse: Kirjete unikaalseks tuvastamiseks või sidumiseks, kui ühe veeru andmetest piisab (kõige tavalisem ja puhtam viis andmebaasi disainimiseks).

Erinevus teistest: Peamine erinevus on veergude arv – see ei saa kunagi koosneda mitmest veerust (erinevalt Composite või Compound võtmetest).
```sql
CREATE TABLE Raamatud (
    ISBN VARCHAR(13) PRIMARY KEY, -- Simple Key, kuna koosneb ühest veerust
    Pealkiri VARCHAR(150)
);
```

5. Composite Key (Liitvõti)
Definitsioon: Võti, mis koosneb kahest või enamast veerust, et tagada ridade unikaalsus.

Milleks kasutatakse: Kasutatakse olukordades, kus ükski veerg eraldiseisvalt ei ole unikaalne, kuid nende kombinatsioon on alati kordumatu (tavaliselt vahetabelites ehk many-to-many seoste puhul).

Erinevus teistest: Erineb Simple Key'st selle poolest, et sisaldab mitut veergu. Erineb Compound Key'st teoreetiliselt selle poolest, et liitvõtme osad ei pruugi kõik iseseisvalt olla välisvõtmed.

```sql
CREATE TABLE KursuseOsalemine (
    UliopilasID INT,
    KursuseID INT,
    Semester VARCHAR(10),
    PRIMARY KEY (UliopilasID, KursuseID) -- Liitvõti kahe veeru baasil
);
```
6. Compound Key (Kombineeritud võti)
Definitsioon: Liitvõtme alaliik, mis koosneb mitmest veerust, kusjuures kõik võtme koosseisu kuuluvad veerud on eraldiseisvalt välisvõtmed (Foreign Key) teistes tabelites.

Milleks kasutatakse: Kasutatakse seosetabelites (bridge tables), et ühendada omavahel mitu erinevat olemust ja tagada, et sama seost ei sisestataks topelt.

Erinevus teistest: Kui tavalise Composite Key üks osa võib olla lihtsalt suvaline väli (nt kuupäev), siis Compound Key puhul peavad kõik osad viitama mõne teise tabeli võtmele.

```sql
CREATE TABLE Projektid (
    ProjektID INT PRIMARY KEY,
    Nimi VARCHAR(100)
);

CREATE TABLE TootajaProjekt (
    TootajaID INT,
    ProjektID INT,
    PRIMARY KEY (TootajaID, ProjektID), -- Compound Key: mõlemad on ühtlasi välisvõtmed
    FOREIGN KEY (TootajaID) REFERENCES Tootajad(TootajaID),
    FOREIGN KEY (ProjektID) REFERENCES Projektid(ProjektID)
);
```

7. Superkey (Supervõti)
Definitsioon: Ühe või mitme veeru kogum, mis võimaldab tabelis ridade unikaalset tuvastamist. Supervõti võib sisaldada ka "üleliigseid" veerge, mis pole unikaalsuseks rangelt vajalikud.

Milleks kasutatakse: See on teoreetiline kontseptsioon andmebaasi projekteerimisel, millest hakatakse tuletama asiseid kandidaatvõtmeid.

Erinevus teistest: Supervõti on kõige laiem mõiste. Näiteks kui TootajaID on unikaalne, siis kombinatsioon (TootajaID, Eesnimi) on samuti supervõti, kuigi Eesnimi on seal ülearune.

```sql
CREATE TABLE Autod (
    Registrimark VARCHAR(10) PRIMARY KEY, -- See on Supervõti
    VinKood VARCHAR(17) UNIQUE,            -- See on Supervõti
    Varv VARCHAR(20)
    -- Supervõtmeks on ka kombinatsioon: (Registrimark, Varv)
);
```

8. Candidate Key (Kandidaatvõti)
Definitsioon: Minimaalne võimalik Supervõti, millest on eemaldatud kõik üleliigsed veerud. See on veerg (või veergude kogum), mis on sobilik olema tabeli Primary Key.

Milleks kasutatakse: Kasutatakse andmebaasi disainimisel, et valida välja parim kandidaat, millest saab ametlik Primary Key.

Erinevus teistest: Erinevalt supervõtmest ei tohi siin olla ühtegi ülearust veergu. Tabelis võib olla mitu kandidaatvõtit (nt Isikukood ja Kasutajatunnus), millest ühe valib disainer Primary Key'ks.

```sql
CREATE TABLE Kasutajad (
    KasutajaID INT PRIMARY KEY, -- Valitud kandidaatvõti (Primary Key)
    Epost VARCHAR(100) UNIQUE,  -- Teine kandidaatvõti (Candidate Key)
    Telefon VARCHAR(20) UNIQUE   -- Kolmas kandidaatvõti (Candidate Key)
);
```

9. Alternate Key (Alternatiivne võti / Sekundaarne võti)
Definitsioon: Kandidaatvõti, mida ei valitud tabeli esmaseks võtmeks (Primary Key).

Milleks kasutatakse: Kasutatakse unikaalsuse tagamiseks ja alternatiivseks otsinguks (indekseerimiseks) tabelis. Tavaliselt realiseeritakse SQL-is UNIQUE piirangu abil.

Erinevus teistest: See on otseselt "hõbemedali omanik". Kui tabelis on kandidaadid KasutajaID ja Epost ning esimesest saab Primary Key, siis Epost on automaatselt Alternate Key.

```sql
select * From Autod
select * From Kasutajad
select * From Kliendid
select * From KursuseOsalemine
select * From Projektid
select * From Raamatud
select * From Tellimused
select * From Tootajad
select * From TootajaProjekt
```
<img width="302" height="724" alt="{60FCC19B-CAA6-4309-B499-032AB5383D88}" src="https://github.com/user-attachments/assets/43fa4c88-90ec-4168-b796-74e487c99fd7" />


<img width="770" height="487" alt="{8923AF72-9776-4573-BB85-24ABA5BCE79C}" src="https://github.com/user-attachments/assets/ea4e8f0a-c7c6-4fd6-ba0c-884755665b00" />

Kasutatud allikad
https://www.geeksforgeeks.org/
https://www.w3schools.com/sql/
https://gemini.google.com/app
