#DROP DATABASE ejercicio2;
CREATE DATABASE ejercicio2;
USE ejercicio2;

CREATE TABLE IF NOT EXISTS camiones ( 
 id INT AUTO_INCREMENT,
 matricula VARCHAR(10) NOT NULL,
 modelo VARCHAR(50) NOT NULL,
 tipo VARCHAR(255),
 potencia VARCHAR(255),
 PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS camioneros ( 
 id INT AUTO_INCREMENT,
 nombre VARCHAR(50) NOT NULL,
 dni CHAR(9) NOT NULL,
 direccion VARCHAR(255),
 telefono VARCHAR(255),
 salario INT,
 PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS camiones_camioneros ( 
 id INT AUTO_INCREMENT,
 fk_id_camion INT NOT NULL,
 fk_id_camionero INT NOT NULL,
 fecha DATE,
 PRIMARY KEY(id),
 FOREIGN KEY (fk_id_camion) REFERENCES camiones(id),
 FOREIGN KEY (fk_id_camionero) REFERENCES camioneros(id)
);

CREATE TABLE IF NOT EXISTS provincias ( 
 id INT AUTO_INCREMENT,
 nombre VARCHAR(255) NOT NULL,
 PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS paquetes ( 
 id INT AUTO_INCREMENT,
 destinatario VARCHAR(50),
 dir_destinatario VARCHAR(255) NOT NULL,
 fk_id_provincia INT NOT NULL,
 fk_id_camionero INT NOT NULL,
 PRIMARY KEY(id),
  FOREIGN KEY (fk_id_provincia) REFERENCES provincias(id),
 FOREIGN KEY (fk_id_camionero) REFERENCES camioneros(id)
);