create database koos_praktika;
use koos_praktika;

--Loome uus Category (idCategory, Category_Name)
CREATE TABLE Category(
idCategory int Primary Key identity(1,1),
Category_Name varchar(25) UNIQUE)

Insert into Category
values ('Auto'),('Jook'),('Toit')
SELECT *from Category;

--Loome uue Product (idProduct, Name, idCategory, Price)
Create table Product(
idProduct int Primary Key identity(1,1),
PName varchar(25),
idCategory int,
Foreign key (idCategory) References Category(idCategory),
Price money)

Insert into Product
values ('Kartul', 3, 0.5)
SELECT *from Product;

--Loome tabeli Sale (idSale, idProduct, idCustomer, Count_pr, Date_of_sale)
Create table Sale(
idSale int Primary Key identity(1,1),
idProduct int,
Foreign key (idProduct) References Product(idProduct),
idCustomer int,
count_pr int,
date_of_sale date)

--nüüd LISAN tabel Customer (idCustomer, Name, contact) ja seon tabeliga Sale.
create table Customer(
idCustomer int Primary Key identity(1,1),
Name varchar(25) UNIQUE,
Contact varchar(100))

alter table sale ADD foreign key (idCustomer) references Customer(idCustomer)
INSERT into Customer
values ('Kevin', '+547635'),('Robin', '+234436')
Select * from Customer;

INsert into Sale
values (1, 1, 5, '2026-04-15')


Select * from Product;
Select * from Customer;
Select * from Sale;
