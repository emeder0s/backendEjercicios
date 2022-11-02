#drop DATABASE ejercicio1;

CREATE DATABASE ejercicio1;

USE ejercicio1;

CREATE TABLE tabla0(
	id_tabla0 INT AUTO_INCREMENT, 
    campo0 VARCHAR(100), 
    PRIMARY KEY(id_tabla0)
);

CREATE TABLE tabla1(
	id_tabla1 INT AUTO_INCREMENT,
    campo1 VARCHAR(100),
    id_tabla0 INT,
    PRIMARY KEY(id_tabla1),
    FOREIGN KEY(id_tabla0)
    REFERENCES tabla0(id_tabla0)
    ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE tabla2(
    id_tabla0 INT AUTO_INCREMENT, 
    campo0 VARCHAR(100), 
    PRIMARY KEY(id_tabla0)
); 

INSERT INTO tabla0 VALUES(NULL, "Valor 1 campo 0");
INSERT INTO tabla0 VALUES(NULL, "Valor 2 campo 0");

DELIMITER //
CREATE TRIGGER ejemploAntesActualizar
BEFORE UPDATE ON tabla0
FOR EACH ROW 
BEGIN
	
	INSERT INTO tabla2 VALUES (NULL, CONCAT("Valor insertado desde el trigger ejemploAntes de actualizar", OLD.id_tabla0));
    
END //
DELIMITER ;

UPDATE tabla0 SET campo0 = "pruebaTriggerActualizar " WHERE id_tabla0 = 1;

SELECT * FROM tabla0;
SELECT * FROM tabla2;