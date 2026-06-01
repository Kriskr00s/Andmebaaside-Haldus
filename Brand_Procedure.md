## Iseseisvalt 3 protseduuri
 [Select laused](select.md) |
[Triqerid](trigerid.md) |
[Võtmed](keys.md) |
[Kasutaja](kasutaja.md) |
[Moodle test](kysimused.md) |
[Protseduurid](Brand_Procedure.md) |
```sql
CREATE PROCEDURE BrandLisa

@brand_name varchar(25)
AS
BEGIN
	SELECT * FROM brands
	INSERT INTO brands
	VALUES (@brand_name);
	SELECT * FROM brands;
END
--kutse
EXEC BrandLisa'testbrand2'
```
```sql
Create procedure kustutaIdBrand
@id int
AS
BEGIN
	SELECT * FROM brands;
	DELETE FROM brands WHERE brand_id=@id;
	SELECT * FROM brands;
END
--kutse
EXEC kustutaIdBrand 5;
```

```sql
CREATE PROCEDURE otsing1brandtaht
@taht char(1)
AS
BEGIN
	SELECT brand_name FROM brands
	WHERE brand_name LIKE @taht + '%';
	SELECT brand_name FROM brands
END
--kutse
SELECT * FROM brands
EXEC otsing1brandtaht 'R'
```
