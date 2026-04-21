create database veebipood;
use veebipood;

--tabel brands

create table brands(
brand_id int primary key identity(1,1),
brand_name varchar(25) UNIQUE)

insert into brands
values ('Rolex')
select * from brands

--tabel categories

create table categories(
category_id int primary key identity(1,1),
category_name varchar(25) unique)

insert into categories
values ('Riided')
select * from categories

--tabel products

create table products(
product_id int primary key identity(1,1),
product_name varchar(25) unique,
brand_id int,
foreign key (brand_id) references brands(brand_id),
category_id int,
foreign key (category_id) references categories(category_id),
model_year int,
list_price money)

insert into products
values ('särk',1,3,2025,30.50)
select * from products

--tabel customers
create table customers(
customer_id int primary key identity(1,1),
first_name varchar(25) Not Null,
last_name varchar(25) Not Null,
phone char(13),
email varchar(25) Not Null,
street varchar(25),
city varchar(25),
state varchar(25),
zip_code char(5))

insert into customers
values ('Priit','Mets', '5638597', 'priit.mets@gamil.com','Kuuskmetsa tee', 'Tallinn', 'Eesti', '76583')
select * from customers

create table stores(
store_id int primary key identity(1,1),
store_name varchar(25) unique Not Null,
phone char(13),
email varchar(25) Not Null,
street varchar(25),
city varchar(25),
state varchar(25),
zip_code char(5))

insert into stores
values ('sportland', '5638597', 'sportland@gamil.com','Linnu tee', 'Tallinn', 'Eesti', '76583')
select * from stores

create table staff(
staff_id int primary key identity(1,1),
first_name varchar(25)  Not Null,
last_name varchar(25) Not Null,
email varchar(25) Not Null,
phone char(13),
active bit,
store_id int,
foreign key (store_id) references stores(store_id),
manager_id bit)


insert into staff
values ('Tanel', 'Padar', 'tanel.padar@gamil.com', 56547362, 1 , 1 , 0)

select * from staff
 
 
 --tabel stocks
create table stocks(
store_id int, 
product_id int,
primary key (store_id, product_id),
foreign key (store_id) references stores(store_id),
foreign key (product_id) references products(product_id),
quantity int)

select * from stores
select * from products

insert into stocks
values (1, 1, 100), (1, 2, 30)
select * from stocks

--tabel orders

create table orders(
order_id int primary key identity(1,1),
customer_id int,
foreign key (customer_id) references customers(customer_id),
order_status varchar(10) check(order_status = 'tehtud' or order_status = 'tegematta'),
order_date date,
required_date date,
shipped_date date,
store_id int, 
Foreign key(store_id) references stores(store_id),
staff_id int, 
Foreign key(staff_id) references staff(staff_id))

select * from orders
select * from stores
select * from staff
select * from customers

insert into orders
values (1, 'tehtud', '2026-04-21', '2026-05-10', '2026-05-01', 1, 1)

--tabel order_items

create table order_items(
order_id int,
Foreign key(order_id)references orders(order_id),
item_id int,
product_id int,
Foreign key(product_id)references products(product_id),
primary key(order_id, item_id),
quanity int,
list_price money,
discount int)

select * from order_items
select * from products
select * from orders

insert into order_items
values (1, 1, 2, 100, 100, 20)
