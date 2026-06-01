# Andmebaasi vaated (Views)
| Teemad ja materjalid |
| :--- |
| [SELECT laused](select.md) |
| [Trigerid](trigerid.md) |
| [Andmebaasi võtmed](keys.md) |
| [Kasutajate haldus](kasutaja.md) |
| [Moodle testid ja küsimused](kysimused.md) |
| [Salvestatud protseduurid](Brand_Procedure.md) |
| [Andmebaasi vaated (Views)](vaade.md) |

Vaade (View) on virtuaalne tabel, mille sisu põhineb SQL-päringu (SELECT) tulemusel. Vaade ei sisalda füüsiliselt andmeid, vaid kuvab reaalajas andmeid teistest tabelitest.

---

## Miks ja millal vaateid kasutatakse?

* **Keerukuse vähendamine:** Kui sul on vaja tihti teha päringut, mis ühendab 3-4 erinevat tabelit (JOIN), saab selle koodi salvestada vaatena. Edaspidi saab teha lihtsa päringu: `SELECT * FROM vaate_nimi;`.
* **Andmeturve (Security):** Kasutajale saab anda õiguse vaadata ainult kindlat vaadet, peites ära tabeli ülejäänud veergud (näiteks palgaandmed või isikukoodid).
* **Andmete konsistents:** Kui äriloogika muutub, tuleb muuta ainult vaate tagust päringut, mitte kõiki rakendusi, mis andmebaasi kasutavad.

---

## SQL Vaate loomise süntaks

Vaate loomiseks kasutatakse käsku `CREATE VIEW`:

```sql
CREATE VIEW vaate_nimi AS
SELECT veerg1, veerg2
FROM tabeli_nimi
WHERE tingimus;
```

Praktiline näide
Loome vaate nimega v_TootajateTellimused, mis ühendab tabelid Tootajad ja Tellimused. See vaade näitab, milline töötaja millise tellimuse vormistas ja mis summas, ilma et me peaksime iga kord JOIN lauset uuesti kirjutama.
see näide on minu keys.md faili ülesandega näide

1. Vaate loomise kood (SQL Server):
   
```SQL
CREATE VIEW v_TootajateTellimused AS
SELECT 
    t.TootajaID,
    CONCAT(t.Eesnimi, ' ', t.Perekonnanimi) AS [Töötaja Nimi],
    tel.TellimusID,
    tel.Summa
FROM Tootajad t
INNER JOIN Tellimused tel ON t.TootajaID = tel.TootajaID;
```
2. Vaate väljakutsumine (Käivitamine):
Kui vaade on loodud, saab selle sisu vaadata täpselt nii, nagu see oleks tavaline tabel:
```SQL
SELECT * FROM v_TootajateTellimused;
```
<img width="355" height="145" alt="{986B2F0D-089A-459A-B67D-71371F460598}" src="https://github.com/user-attachments/assets/bea3b56d-eca3-424d-bb2b-7e2ae23bd485" />

Vaate kustutamine
Kui vaadet pole enam vaja, saab selle andmebaasist eemaldada järgmise käsuga:

SQL
DROP VIEW v_TootajateTellimused;
Kasutatud allikad
W3Schools: SQL CREATE VIEW Statement. Kättesaadav: https://www.w3schools.com/sql/sql_view.asp

Microsoft Learn: Views (Database Engine). Kättesaadav: https://learn.microsoft.com/en-us/sql/relational-databases/views/views
