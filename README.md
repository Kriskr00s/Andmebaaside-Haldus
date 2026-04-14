# Andmebaaside-Haldus
Andmebaasidega seotud SQL kood ja konspektid

- SQL - Structured Query Language - strukteeritud päringukeel
- DDL - Data Definition Language - andmebaasi struktuuri loomiskes - CREATE, ALTER
- DML - Data Manipulation Language -andmete lisamine ja uuendamine tabelis - INSERT, UPDATE, DELETE


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

- mitu - mitmele (nt õpilane - õpetaja)
