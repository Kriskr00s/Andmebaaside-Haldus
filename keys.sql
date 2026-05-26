create database keys
use keys 
CREATE TABLE Tootajad (
    TootajaID INT PRIMARY KEY,
    Eesnimi VARCHAR(50),
    Perekonnanimi VARCHAR(50)
);

CREATE TABLE Tellimused (
    TellimusID INT PRIMARY KEY,
    Summa MONEY,
    TootajaID INT,
    FOREIGN KEY (TootajaID) REFERENCES Tootajad(TootajaID)
);

CREATE TABLE Kliendid (
    KlientID INT PRIMARY KEY,
    Nimi VARCHAR(100),
    Isikukood CHAR(11) UNIQUE
);

CREATE TABLE Raamatud (
    ISBN VARCHAR(13) PRIMARY KEY, -- Simple Key, kuna koosneb ühest veerust
    Pealkiri VARCHAR(150)
);


CREATE TABLE KursuseOsalemine (
    UliopilasID INT,
    KursuseID INT,
    Semester VARCHAR(10),
    PRIMARY KEY (UliopilasID, KursuseID) -- Liitvõti kahe veeru baasil
);


-- Eeldame, et tabelid 'Tootajad' ja 'Projektid' on juba olemas
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

CREATE TABLE Autod (
    Registrimark VARCHAR(10) PRIMARY KEY, -- See on Supervõti
    VinKood VARCHAR(17) UNIQUE,            -- See on Supervõti
    Varv VARCHAR(20)
    -- Supervõtmeks on ka kombinatsioon: (Registrimark, Varv)
);

CREATE TABLE Kasutajad (
    KasutajaID INT PRIMARY KEY, -- Valitud kandidaatvõti (Primary Key)
    Epost VARCHAR(100) UNIQUE,  -- Teine kandidaatvõti (Candidate Key)
    Telefon VARCHAR(20) UNIQUE   -- Kolmas kandidaatvõti (Candidate Key)
);

