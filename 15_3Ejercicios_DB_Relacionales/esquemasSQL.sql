#DROP DATABASE prueba;

CREATE DATABASE IF NOT EXISTS prueba;

USE prueba;

CREATE TABLE IF NOT EXISTS contrasenias ( 
 id INT AUTO_INCREMENT,
 pass CHAR(50) NOT NULL,
 PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS personas ( 
 id INT AUTO_INCREMENT,
 dni CHAR(9) NOT NULL UNIQUE,
 nombre VARCHAR(100),
 apellidos VARCHAR(100) NOT NULL,
 fk_id_contrasenia INT,
 PRIMARY KEY(id),
 FOREIGN KEY (fk_id_contrasenia) REFERENCES contrasenias(id)
);



