#DROP DATABASE ejercicio1;
CREATE DATABASE ejercicio1;
USE ejercicio1;

CREATE TABLE IF NOT EXISTS proveedores ( 
 id INT AUTO_INCREMENT,
 nif CHAR(9) NOT NULL,
 nombre CHAR(50) NOT NULL,
 direccion VARCHAR(255),
 PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS clientes ( 
 id INT AUTO_INCREMENT,
 dni CHAR(9),
 nombre CHAR(50) NOT NULL,
 apellidos CHAR(50) NOT NULL,
 direccion VARCHAR(255),
 fecha_nac DATE,
 PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS productos ( 
 id INT AUTO_INCREMENT,
 precio INT NOT NULL,
 nombre VARCHAR(100) NOT NULL,
 fk_id_proveedores INT,
 PRIMARY KEY(id),
 FOREIGN KEY (fk_id_proveedores) REFERENCES proveedores(id)
);

CREATE TABLE IF NOT EXISTS clientes_productos ( 
 id INT AUTO_INCREMENT,
 fk_id_clientes INT,
 fk_id_productos INT,
 PRIMARY KEY(id),
 FOREIGN KEY (fk_id_clientes) REFERENCES clientes(id),
 FOREIGN KEY (fk_id_productos) REFERENCES productos(id)
);