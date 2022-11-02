#SET SQL_SAFE_UPDATES = 0;
#SET SQL_SAFE_UPDATES = 1;
# EJERCICIO 1 - Realiza dos inserts en las tablas de la BD del ejercicio del Instituto.

# EJERCICIO 2 - Actualiza la ciudad de los clientes con id 1 y 3 de la BD del ejercicio del Taller a Madrid
USE ejercicio4;
#TRUNCATE TABLE clientes;
#INSERT INTO clientes VALUES(NULL,"54058798N","Elena Mederos", "Madrid", "Calle San Andrés 12","686246095");
#INSERT INTO clientes VALUES(NULL,"54058798N","Ana Mederos", "Londres", "Street X","686264620");
#INSERT INTO clientes VALUES(NULL,"54058798N","Jorge Cañada", "Madrid", "Calle San Andrés 12","686246095");
#INSERT INTO clientes VALUES(NULL,"54058798N","Pedro", "Madrid", "Calle San Andrés 12","686246095");
SET SQL_SAFE_UPDATES = 0;
UPDATE clientes SET ciudad="Tenerife" WHERE id=1 OR id=3;
SET SQL_SAFE_UPDATES = 1;
SELECT * FROM clientes;

# EJERCICIO 3

# EJERCICIO 4 - Muestra toda la información de todas las tablas de la BD del ejercicio del Taller.
USE ejercicio4;
SELECT * FROM clientes;
SELECT * FROM coches;
SELECT * FROM revisiones;

# EJERCICIO 5 - Muestra el salario y la dirección de los camioneros de la BD del ejercicio de la Empresa de Transporte.
USE ejercicio2;
INSERT INTO camioneros VALUES(NULL,"Elena Mederos","54058798N","Calle San Andrés 12","686246095",3000);
SELECT salario, direccion FROM camioneros;