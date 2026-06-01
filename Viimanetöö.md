## Admin kasutaja
```sql
create database viimanetoo
use viimanetoo
--2
CREATE TABLE Lennujaam(
    LennujaamID INT primary key,
    LennujaamNimi VARCHAR(50),
    Linn VARCHAR(50)
);

CREATE TABLE Lend(
    LendID INT primary key,
    LennuNumber VARCHAR(20),
    Väljumisaeg DATETIME,
    FK_LennujaamID INT,
    Foreign key (FK_LennujaamID) references Lennujaam(LennujaamID)
	);

CREATE TABLE Reisija(
    ReisijaID INT primary key,
    Nimi VARCHAR(50),
    Piletinumber VARCHAR(30),
    FK_LendID INT,
    Foreign key (FK_LendID) references Lend(LendID)
	);
--sisendid
INSERT INTO Lennujaam (LennujaamID, LennujaamNimi, Linn)
VALUES (1, 'Tallinna Lennujaam', 'Tallinn'), (2, 'Helsinki Vantaa', 'Helsinki'), (3, 'Riga Airport', 'Riia');
INSERT INTO Lend (LendID, LennuNumber, Väljumisaeg, FK_LennujaamID)
VALUES (15, 'A-101', '2026-08-24 10:00:00', 1), (20, 'BT-452', '2026-09-12 15:30:00', 3), (30, 'AY-721', '2026-10-05 08:15:00', 2);
INSERT INTO Reisija (ReisijaID, Nimi, Piletinumber, FK_LendID)
VALUES (100, 'Kristofer Tamm', 'TLL-112233', 10), (200, 'Mari Maasikas', 'RIX-445566', 20), (300, 'Jüri Juurikas', 'HEL-778899', 30);
--1,4,5
GRANT CREATE TABLE TO reisijaKristofer;
GRANT SELECT TO reisijaKristofer;
GRANT INSERT, DELETE ON Reisija TO reisijaKristofer;
GRANT INSERT, DELETE ON Lend TO reisijaKristofer;
DENY SELECT ON logi TO reisijaKristofer;
--6
CREATE TABLE logi (
    id INT PRIMARY KEY IDENTITY(1,1),
    kasutaja VARCHAR(100),
    aeg DATETIME,
    toiming VARCHAR(100),
    andmed TEXT
	);
--7
ALTER TRIGGER lendKustutamine
ON Lend
FOR DELETE
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO logi(kasutaja, aeg, toiming, andmed)
    SELECT
        SYSTEM_USER, 
        GETDATE(),
        'on tehtud DELETE', 
        CONCAT('Kustutatud Number: ', deleted.LennuNumber, ', Väljumisaeg: ', deleted.Väljumisaeg, 
		', Lennujaamast: ', Lennujaam.LennujaamNimi, ' (', Lennujaam.Linn, ')'
        )
    FROM deleted
    INNER JOIN Lennujaam ON deleted.FK_LennujaamID = Lennujaam.LennujaamID;
END;
--Kustutatud Number: A-101, Väljumisaeg: Aug 24 2026 10:00AM, Lennujaamast: Tallinna Lennujaam (Tallinn)
--8
CREATE TRIGGER lendLisamine
ON Lend
FOR INSERT
AS
INSERT INTO logi(kasutaja, aeg, toiming, andmed)
SELECT
    SYSTEM_USER, 
    GETDATE(),    
    'on tehtud INSERT', 
    CONCAT('Lisatud Number: ', inserted.LennuNumber, ', Väljumisaeg: ', inserted.Väljumisaeg) 
FROM inserted;

--11
CREATE PROCEDURE ReisijaLisa
    @id INT,
    @nimi VARCHAR(50),
    @pilet VARCHAR(30),
    @lend_id INT
AS
BEGIN
    SELECT * FROM Reisija;
    
    INSERT INTO Reisija (ReisijaID, Nimi, Piletinumber, FK_LendID)
    VALUES (@id, @nimi, @pilet, @lend_id);
    
    SELECT * FROM Reisija;
END;
EXEC ReisijaLisa 400, 'Kati Karu', 'TLL-998877', 10;


CREATE PROCEDURE kustutaIdLend
    @id INT
AS
BEGIN
    SELECT * FROM Lend;
    
    DELETE FROM Lend WHERE LendID = @id;
    
    SELECT * FROM Lend;
END;
EXEC kustutaIdLend 1;

CREATE PROCEDURE otsing1reisijataht
    @taht CHAR(1)
AS
BEGIN
    SELECT Nimi FROM Reisija
    WHERE Nimi LIKE @taht + '%';
    
    SELECT Nimi FROM Reisija;
END;
EXEC otsing1reisijataht 'K';
--12

CREATE VIEW v_LendudeInfo AS
SELECT 
    LendID,
    LennuNumber,
    Väljumisaeg,
    LennujaamNimi AS [Lennujaama Nimi],
    Linn 
FROM Lend
INNER JOIN Lennujaam ON Lend.FK_LennujaamID = Lennujaam.LennujaamID;
SELECT * FROM v_LendudeInfo;

CREATE VIEW v_ReisijateLennud AS
SELECT 
    ReisijaID,
    Nimi AS [Reisija Nimi],
    Piletinumber,
    LennuNumber
FROM Reisija
INNER JOIN Lend ON Reisija.FK_LendID = Lend.LendID;
SELECT * FROM v_ReisijateLennud;

CREATE VIEW v_TallinnaLennud AS
SELECT 
    LennuNumber,
    Väljumisaeg,
    LennujaamNimi,
    Linn
FROM Lend
INNER JOIN Lennujaam ON Lend.FK_LennujaamID = Lennujaam.LennujaamID
WHERE Linn = 'Tallinn';
SELECT * FROM v_TallinnaLennud;

SELECT * FROM Lennujaam;
SELECT * FROM Lend;
SELECT * FROM Reisija;
SELECT * FROM logi;
SELECT * FROM v_LendudeInfo;
SELECT * FROM v_ReisijateLennud;
SELECT * FROM v_TallinnaLennud;
SELECT * FROM v_TulevikuLennud;
--13
--Mis see on?
--See on vaade, mis filtreerib tabelist välja vanad (juba toimunud) lennud.
--Miks see kasulik on? 
--Lennujaama lendudetabel ei tohi näidata eile toimunud lende.
CREATE VIEW v_TulevikuLennud AS
SELECT 
    LennuNumber,
    Väljumisaeg
FROM Lend
WHERE Väljumisaeg >= GETDATE();
SELECT * FROM v_TulevikuLennud;
```

## Kasutaja reisijaKristofer
```sql
--5
--ja
SELECT * FROM Lennujaam;
SELECT * FROM Lend;
SELECT * FROM Reisija;
SELECT * FROM logi
--ja
INSERT INTO Lend (LendID, LennuNumber, Väljumisaeg, FK_LennujaamID) 
VALUES (999, 'TEST-123', '2026-06-01 12:00:00', NULL);

--ja
DELETE FROM Lend WHERE LendID = 15;

--ei
INSERT INTO Lennujaam (LennujaamID, LennujaamNimi, Linn) VALUES (999, 'Keelatud', 'Test');

--ei
ALTER TABLE Lend ADD TestVeerg INT;


--10
INSERT INTO Lend (LendID, LennuNumber, Väljumisaeg, FK_LennujaamID)
VALUES (40, 'TRIG-777', '2026-11-20 18:00:00', 1);

DELETE FROM Lend 
WHERE LendID = 40;
```

<img width="830" height="158" alt="{C3A11BE9-7E23-4B2C-B0DC-3EC5C29AB764}" src="https://github.com/user-attachments/assets/c86cd564-8bc7-4f96-8f26-37ef160b2d00" />
