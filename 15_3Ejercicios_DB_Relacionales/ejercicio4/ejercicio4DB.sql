#DROP DATABASE ejercicio4;
CREATE DATABASE ejercicio4;
USE ejercicio4;

CREATE TABLE IF NOT EXISTS clientes ( 
 id INT AUTO_INCREMENT,
 nif CHAR(10) UNIQUE NOT NULL,
 nombre VARCHAR(300) NOT NULL,
 ciudad VARCHAR(200),
 direccion VARCHAR(255),
 telefono VARCHAR(20),
 PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS coches ( 
 id INT AUTO_INCREMENT,
 matricula CHAR(10) UNIQUE NOT NULL,
 marca VARCHAR(50) NOT NULL,
 modelo CHAR(9) NOT NULL,
 color VARCHAR(50),
 precio FLOAT,
 fk_id_cliente INT,
 PRIMARY KEY(id),
 FOREIGN KEY (fk_id_cliente) REFERENCES clientes(id)
);

CREATE TABLE IF NOT EXISTS revisiones ( 
 id INT AUTO_INCREMENT,
 cambio_filtro BOOLEAN,
 cambio_aceite BOOLEAN,
 cambio_frenos BOOLEAN,
 otros_cambios TEXT,
 fk_id_coche INT,
 PRIMARY KEY(id),
 FOREIGN KEY (fk_id_coche) REFERENCES coches(id)
);

