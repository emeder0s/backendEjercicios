# Crea los triggers necesarios y las tablas necesarias para resolver lo siguiente:
# Cuando se produce una acción (inserción o borrado) en una tabla Clientes (que contiene id, nombre, telefono y DNI) 
# se pase la información a otra tabla que se va a llamar Copia_Clientes
#DROP DATABASE ejercicio1PLSQL;
CREATE DATABASE ejercicio1PLSQL;
USE ejercicio1PLSQL;

#DROP TABLE clientes;
CREATE TABLE clientes (
    id INT AUTO_INCREMENT,
    nombre VARCHAR(20),
    telefono CHAR(15),
    dni CHAR(9),
    PRIMARY KEY (id)
);

#DROP TABLE copia_clientes;
CREATE TABLE copia_clientes (
    id INT AUTO_INCREMENT,
    nombre VARCHAR(20),
    telefono CHAR(15),
    dni CHAR(9),
    accion VARCHAR(20),
    PRIMARY KEY (id)
);

DELIMITER //
CREATE TRIGGER copiaSeguridadInsert
AFTER INSERT ON clientes
FOR EACH ROW 
BEGIN	
	INSERT INTO copia_clientes VALUES (NULL, NEW.nombre, NEW.telefono, NEW.dni, "insert");
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER copiaSeguridadDelete
BEFORE DELETE ON clientes
FOR EACH ROW 
BEGIN	
	INSERT INTO copia_clientes VALUES (NULL, OLD.nombre, OLD.telefono, OLD.dni, "delete");
END //
DELIMITER ;

INSERT INTO clientes VALUES (NULL, "Elena", "686246095", "54058798N");
SELECT * FROM copia_clientes;
SELECT * FROM clientes;
#DROP TRIGGER copiaSeguridadInsert;

DELETE FROM clientes WHERE id=2;
SELECT * FROM copia_clientes;
SELECT * FROM clientes;

