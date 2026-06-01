# Andmebaaside halduse portfoolio

### Autor: Kristofer Valtin | Rühm: LOGITpe24

Andmebaasidega seotud SQL-koodid, praktilised näited ja teoreetilised konspektid.

---

## Peatükkide ja käskude jaotus

* **SQL** (*Structured Query Language*) — Struktureeritud päringukeel andmebaasidega suhtlemiseks.
* **DDL** (*Data Definition Language*) — Andmebaasi struktuuri loomiseks ja muutmiseks (`CREATE`, `ALTER`, `DROP`).
* **DML** (*Data Manipulation Language*) — Andmete lisamiseks, uuendamiseks ja kustutamiseks tabelites (`INSERT`, `UPDATE`, `DELETE`).

---

## Sisukord

| Teemad ja materjalid |
| :--- |
| [SELECT laused](select.md) |
| [Trigerid](trigerid.md) |
| [Andmebaasi võtmed](keys.md) |
| [Kasutajate haldus](kasutaja.md) |
| [Moodle testid ja küsimused](kysimused.md) |
| [Salvestatud protseduurid](Brand_Procedure.md) |
| [Andmebaasi vaated (Views)](vaade.md) |

---

## Kasutatavad andmebaasihaldussüsteemid

1. **SQL Server Management Studio (SSMS)** — Kasutatakse Microsoft SQL Serveri andmebaaside arendamiseks ja haldamiseks.
   
   <img width="400" height="450" alt="SQL Server Management Studio sisselogimine" src="https://github.com/user-attachments/assets/df5ea39f-3ed5-4d95-ad53-20ab4e6e1cd3" />

2. **XAMPP / phpMyAdmin** — Vabavaraline platvorm MariaDB/MySQL andmebaaside haldamiseks veebiliidese kaudu.

---

## Põhimõisted

* **Andmebaas** — Struktureeritud andmete kogum ühes kohas.
* **Tabel** — Olem (*entity*), mis koosneb ridadest ja veergudest.
* **Veerg** — Väli (*field*), mis kirjeldab kindlat andmetüübi ja omadust.
* **Rida** — Kirje (*record*), siin sisaldub üks terviklik andmeobjekt.
* **Primaarne võti (PK — Primary Key)** — Veerg (tavaliselt ID), mis tuvastab unikaalselt tabeli iga rea. Ei tohi korduda ega olla tühi (`NOT NULL`).
* **Välisvõti (FK — Foreign Key)** — Veerg, mis loob loogilise seose teise tabeli primaarse võtmega, tagades andmete tervikluse.

---

## Andmetüübid ja piirangud

### Levinumad andmetüübid:
* **Numbrilised:** `INT`, `FLOAT`, `DECIMAL(6,2)`
* **Tekst / sümbolid:** `VARCHAR(50)`, `CHAR(6)`
* **Loogilised:** `BOOLEAN`, `BOOL`, `BIT`
* **Aeg ja kuupäev:** `DATE`, `TIME`, `DATETIME`

### Andmebaasi piirangud (Constraints):
1. `PRIMARY KEY` — Unikaalne peavõti rea tuvastamiseks.
2. `FOREIGN KEY` — Viide teise tabeli võtmele.
3. `UNIQUE` — Tagab, et veeru väärtused ei kordu.
4. `NOT NULL` — Keelab tühjad väärtused veerus.
5. `CHECK` — Kontrollib, kas sisestatud andmed vastavad määratud tingimusele.

---

## Tabelivahelised seosed

* **Üks-ühele (`1:1`)** — Nt mees ja naine (või isik ja isikutunnistus).
* **Üks-mitmele (`1:M`)** — Nt õpilane käib erinevates õppeainetes või ühel kliendil on mitu tellimust.

  <img width="486" height="215" alt="Seose näide 1" src="https://github.com/user-attachments/assets/7818b5a7-def5-4714-8541-f3f6b9a28f2b" />
  <img width="468" height="144" alt="Seose näide 2" src="https://github.com/user-attachments/assets/1ae98d86-b36a-4185-b7ef-e27e6fbbbda2" />

* **Mitu-mitmele (`M:N`)** — Nt õpilased ja õpetajad (mitmel õpilasel on mitu õpetajat). Vajab vahetabelit.

---

## Salvestatud protseduurid (Stored Procedures)

Salvestatud protseduurid toimivad andmebaasis sarnaselt funktsioonidega programmeerimises. Need võimaldavad korduvkasutada koodiplokke andmete manipuleerimiseks (`INSERT`, `SELECT`, `UPDATE`, `DELETE`).

```sql
-- Kuvame algse tabeli sisu
SELECT * FROM categories;

-- 1. Protseduur, mis lisab tabelisse uue kategooria
CREATE PROCEDURE lisaKategooria
    @nimi VARCHAR(15)
AS
BEGIN
    INSERT INTO categories (category_name)
    VALUES (@nimi);
    
    SELECT * FROM categories;
END;

-- Protseduuri väljakutsumine
EXEC lisaKategooria 'test2';


-- 2. Protseduur, mis kustutab tabelist kirje ID alusel
CREATE PROCEDURE kustutaIdJargi
    @id INT
AS
BEGIN
    SELECT * FROM categories;
    DELETE FROM categories WHERE category_id = @id;
    SELECT * FROM categories;
END;

-- Protseduuri väljakutsumine
EXEC kustutaIdJargi 6;
<img width="699" height="341" alt="{74441263-F4A0-49CE-8385-38AF59141AFD}" src="https://github.com/user-attachments/assets/74f8c730-e374-45f6-b919-3c12ea29231c" />

  
