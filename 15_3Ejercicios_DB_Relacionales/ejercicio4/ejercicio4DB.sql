#DROP DATABASE ejercicio4;
CREATE DATABASE ejercicio4;
USE ejercicio4;

CREATE TABLE IF NOT EXISTS clientes ( 
 id INT AUTO_INCREMENT,
 nif CHAR(10) NOT NULL,
 nombre CHAR(50) NOT NULL,
 ciudad VARCHAR(50),
 direccion VARCHAR(255),
 telefono VARCHAR(50),
 PRIMARY KEY(id)
);


CREATE TABLE IF NOT EXISTS coches ( 
 id INT AUTO_INCREMENT,
 matricula VARCHAR(50) NOT NULL,
 marca VARCHAR(50) NOT NULL,
 modelo CHAR(9) NOT NULL,
 precio VARCHAR(255),
 fk_id_cliente INT,
 PRIMARY KEY(id),
 FOREIGN KEY (fk_id_cliente) REFERENCES clientes(id)
);

CREATE TABLE IF NOT EXISTS revisiones ( 
 id INT AUTO_INCREMENT,
 cambio_filtro BOOLEAN,
 cambio_aceite BOOLEAN,
 cambio_frenos BOOLEAN,
 otros_cambios VARCHAR (255),
 fk_id_coche INT,
 PRIMARY KEY(id),
 FOREIGN KEY (fk_id_coche) REFERENCES coches(id)
);

