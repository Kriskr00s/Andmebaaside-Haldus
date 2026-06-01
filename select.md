## Select laused

| Teemad ja materjalid |
| :--- |
| [SELECT laused](select.md) |
| [Trigerid](trigerid.md) |
| [Andmebaasi võtmed](keys.md) |
| [Kasutajate haldus](kasutaja.md) |
| [Moodle testid ja küsimused](kysimused.md) |
| [Salvestatud protseduurid](Brand_Procedure.md) |
| [Andmebaasi vaated (Views)](vaade.md) |


<img width="816" height="360" alt="{AD209C1C-81BE-4420-A2F9-37169B96C125}" src="https://github.com/user-attachments/assets/81893103-6e9e-4ca6-82dc-22f1e6ef7d97" />

```sql
create database selectValtin;
use selectValtin;
create table auto(
autonumber char(6) primary key,
mark varchar(30),
mudel varchar(50),
aasta int,
varv varchar(50),
hind money);

Select * from auto;
--mockaroo.com -- kasutame andmete genereerimiseks
insert into auto (autonumber, mark, mudel, aasta, varv, hind) values ('363Iq9', 'Mitsubishi', 'Raider', 2008, 'Purple', '€8633,34');
insert into auto (autonumber, mark, mudel, aasta, varv, hind) values ('649MoU', 'BMW', 'X5', 2002, 'Aquamarine', '€4028,28');
insert into auto (autonumber, mark, mudel, aasta, varv, hind) values ('053dDC', 'Buick', 'Skylark', 1992, 'Goldenrod', '€2071,13');
insert into auto (autonumber, mark, mudel, aasta, varv, hind) values ('322KQM', 'Cadillac', 'Escalade', 2003, 'Khaki', '€7740,52');
insert into auto (autonumber, mark, mudel, aasta, varv, hind) values ('502aRl', 'Cadillac', 'Escalade', 2003, 'Indigo', '€8318,64');
insert into auto (autonumber, mark, mudel, aasta, varv, hind) values ('386xeb', 'Toyota', 'MR2', 1994, 'Maroon', '€3584,48');
insert into auto (autonumber, mark, mudel, aasta, varv, hind) values ('291dP7', 'Pontiac', 'Tempest', 1961, 'Indigo', '€265,39');
insert into auto (autonumber, mark, mudel, aasta, varv, hind) values ('818ogR', 'Pontiac', 'Safari', 1986, 'Violet', '€7897,74');
insert into auto (autonumber, mark, mudel, aasta, varv, hind) values ('828x8H', 'Volkswagen', 'Jetta', 1989, 'Pink', '€7904,67');
insert into auto (autonumber, mark, mudel, aasta, varv, hind) values ('100Uml', 'Chrysler', 'Pacifica', 2004, 'Crimson', '€6379,25');
insert into auto (autonumber, mark, mudel, aasta, varv, hind) values ('007Uak', 'Toyota', 'Prius', 2008, 'Blue', '€1774,23');
insert into auto (autonumber, mark, mudel, aasta, varv, hind) values ('892GQ8', 'Volvo', 'V70', 2001, 'Violet', '€2743,04');
insert into auto (autonumber, mark, mudel, aasta, varv, hind) values ('168T1v', 'GMC', 'Sierra 1500', 2002, 'Green', '€3813,64');
insert into auto (autonumber, mark, mudel, aasta, varv, hind) values ('344VIh', 'Chevrolet', 'Corvette', 1959, 'Teal', '€8265,45');
insert into auto (autonumber, mark, mudel, aasta, varv, hind) values ('642tow', 'Mercedes-Benz', 'R-Class', 2010, 'Puce', '€2427,01');
insert into auto (autonumber, mark, mudel, aasta, varv, hind) values ('408uzK', 'Volvo', '960', 1994, 'Goldenrod', '€4434,66');
insert into auto (autonumber, mark, mudel, aasta, varv, hind) values ('351W0j', 'Hyundai', 'Tiburon', 2000, 'Pink', '€1286,69');
insert into auto (autonumber, mark, mudel, aasta, varv, hind) values ('4054Ov', 'Infiniti', 'G37', 2009, 'Fuscia', '€3348,50');
insert into auto (autonumber, mark, mudel, aasta, varv, hind) values ('861V08', 'Ford', 'Mustang', 1964, 'Maroon', '€1293,20');
insert into auto (autonumber, mark, mudel, aasta, varv, hind) values ('167zou', 'Mercedes-Benz', 'C-Class', 2003, 'Blue', '€1444,92');
insert into auto (autonumber, mark, mudel, aasta, varv, hind) values ('409ZbG', 'Volvo', 'C70', 2009, 'Blue', '€5187,99');
insert into auto (autonumber, mark, mudel, aasta, varv, hind) values ('303dk6', 'Dodge', 'Stratus', 1998, 'Maroon', '€6522,68');
insert into auto (autonumber, mark, mudel, aasta, varv, hind) values ('292ttT', 'Jeep', 'Grand Cherokee', 2003, 'Blue', '€2424,81');
insert into auto (autonumber, mark, mudel, aasta, varv, hind) values ('733RYA', 'Studebaker', 'Avanti', 1962, 'Purple', '€6458,29');
insert into auto (autonumber, mark, mudel, aasta, varv, hind) values ('670Sto', 'GMC', 'Sierra 2500', 2005, 'Violet', '€6714,79');
insert into auto (autonumber, mark, mudel, aasta, varv, hind) values ('9749rI', 'Jeep', 'Grand Cherokee', 1997, 'Pink', '€1954,34');
insert into auto (autonumber, mark, mudel, aasta, varv, hind) values ('809tbR', 'Volvo', 'S60', 2007, 'Red', '€8208,58');
insert into auto (autonumber, mark, mudel, aasta, varv, hind) values ('236ACF', 'Lexus', 'GS', 1993, 'Goldenrod', '€1646,58');
insert into auto (autonumber, mark, mudel, aasta, varv, hind) values ('623jEj', 'Isuzu', 'Amigo', 1998, 'Maroon', '€1815,41');
insert into auto (autonumber, mark, mudel, aasta, varv, hind) values ('6066ww', 'Land Rover', 'Range Rover', 2007, 'Indigo', '€38,38');
insert into auto (autonumber, mark, mudel, aasta, varv, hind) values ('6088dU', 'Aston Martin', 'V12 Vantage', 2012, 'Green', '€9562,14');
insert into auto (autonumber, mark, mudel, aasta, varv, hind) values ('423m0v', 'Infiniti', 'Q', 1995, 'Green', '€5872,61');
insert into auto (autonumber, mark, mudel, aasta, varv, hind) values ('495Uoc', 'Suzuki', 'Sidekick', 1996, 'Aquamarine', '€4799,78');
insert into auto (autonumber, mark, mudel, aasta, varv, hind) values ('569McM', 'Mitsubishi', 'Mighty Max', 1992, 'Blue', '€9861,69');
insert into auto (autonumber, mark, mudel, aasta, varv, hind) values ('186YYl', 'Hyundai', 'Elantra', 1993, 'Green', '€9817,67');
insert into auto (autonumber, mark, mudel, aasta, varv, hind) values ('935LXw', 'BMW', '5 Series', 1995, 'Teal', '€5134,54');
insert into auto (autonumber, mark, mudel, aasta, varv, hind) values ('453uEp', 'Cadillac', 'Escalade', 2010, 'Maroon', '€3382,48');
insert into auto (autonumber, mark, mudel, aasta, varv, hind) values ('433g5J', 'Porsche', 'Boxster', 2005, 'Orange', '€2172,46');
insert into auto (autonumber, mark, mudel, aasta, varv, hind) values ('121fYo', 'Mercedes-Benz', 'S-Class', 2011, 'Indigo', '€9279,36');
insert into auto (autonumber, mark, mudel, aasta, varv, hind) values ('6599RT', 'BMW', '3 Series', 1993, 'Teal', '€667,04');
insert into auto (autonumber, mark, mudel, aasta, varv, hind) values ('058mTw', 'Volkswagen', 'Rabbit', 2009, 'Khaki', '€5948,14');
insert into auto (autonumber, mark, mudel, aasta, varv, hind) values ('965Z6n', 'Mazda', 'Miata MX-5', 2001, 'Turquoise', '€1183,42');
insert into auto (autonumber, mark, mudel, aasta, varv, hind) values ('414Fbp', 'Chrysler', 'Imperial', 1992, 'Blue', '€5621,20');
insert into auto (autonumber, mark, mudel, aasta, varv, hind) values ('037BOU', 'Toyota', 'Tacoma', 2011, 'Pink', '€248,33');
insert into auto (autonumber, mark, mudel, aasta, varv, hind) values ('255E7X', 'Ford', 'F250', 1997, 'Maroon', '€502,38');
insert into auto (autonumber, mark, mudel, aasta, varv, hind) values ('273X6z', 'MG', 'MGB', 1977, 'Aquamarine', '€697,43');
insert into auto (autonumber, mark, mudel, aasta, varv, hind) values ('228I6C', 'Buick', 'Century', 1994, 'Fuscia', '€9777,35');
insert into auto (autonumber, mark, mudel, aasta, varv, hind) values ('302XIj', 'GMC', 'Sierra 2500', 2012, 'Indigo', '€3244,44');
insert into auto (autonumber, mark, mudel, aasta, varv, hind) values ('979iAu', 'Mercury', 'Topaz', 1991, 'Violet', '€5373,51');
insert into auto (autonumber, mark, mudel, aasta, varv, hind) values ('467zLJ', 'Mercedes-Benz', 'S-Class', 2010, 'Yellow', '€2070,10');
```

