#1. CREAMOS LA BASE DE DATOS Y LAS TABLAS---------------------
#DROP DATABASE ejercicioDB;
CREATE DATABASE ejercicioDB;
USE ejercicioDB;

CREATE TABLE IF NOT EXISTS propietarios ( 
 id INT AUTO_INCREMENT,
 nombre VARCHAR(50) NOT NULL,
 telefono VARCHAR(15),
 PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS taxis ( 
 id INT AUTO_INCREMENT,
 matricula VARCHAR(10) NOT NULL,
 modelo VARCHAR(50),
 marca VARCHAR(50),
 fk_id_propietarios INT,
 PRIMARY KEY(id),
 FOREIGN KEY (fk_id_propietarios) REFERENCES propietarios(id) ON DELETE SET NULL #EJERCICIO 4 -añadida esta última parte
);

CREATE TABLE IF NOT EXISTS conductores ( 
 id INT AUTO_INCREMENT,
 nombre VARCHAR(50) NOT NULL,
 telefono VARCHAR(15),
 fk_id_taxis INT,
 PRIMARY KEY(id),
 FOREIGN KEY (fk_id_taxis) REFERENCES taxis(id) ON UPDATE CASCADE #EJERCICIO 4 -añadida esta última parte
);

#2. INSERTAMOS 3 REGISTROS POR TABLA
INSERT INTO propietarios VALUES(NULL, 'Pedro Pérez', '686246095');
INSERT INTO propietarios VALUES(NULL, 'Elena Mederos', '922263525');
INSERT INTO propietarios VALUES(NULL, 'Maria de lo O', '658124789');
#SELECT * FROM propietarios;

INSERT INTO taxis VALUES(NULL, '2093 GSB','','Ford',2);
INSERT INTO taxis VALUES(NULL, '2194 BZS','','Opel',2);
INSERT INTO taxis VALUES(NULL, '5489 YZG','','Tesla',3);
#SELECT * FROM taxis;

INSERT INTO conductores VALUES(NULL, 'Pedro Lopez', '659211602',1);
INSERT INTO conductores VALUES(NULL, 'Carlos Martín', '684526398',2);
INSERT INTO conductores VALUES(NULL, 'Estefanía García', '635554665',3);
#SELECT * FROM conductores;

#3. ACTUALIZAMOS EL TELEFONO DE UN PROPIETARIO FILTRADO POR ID
UPDATE propietarios SET telefono="659211602" WHERE id = 2;
#SELECT * FROM propietarios;
						
#4. Configura las FKs de manera que si se borra un propietario se ponga a NULL la FK que lo apunte (si la hubiera) y si se actualiza 
#un taxi, se actualice automáticamente la FK que lo apunte (si la hubiera). Deja pruebas de esto en el script de la entrega.