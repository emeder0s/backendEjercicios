USE prueba;

CREATE TABLE IF NOT EXISTS proveedores ( 
 id INT AUTO_INCREMENT,
 cif INT NOT NULL,
 nombre CHAR(50),
 PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS productos ( 
 id INT AUTO_INCREMENT,
 precio INT(9) NOT NULL,
 nombre VARCHAR(100) NOT NULL,
 fk_id_proveedores INT,
 PRIMARY KEY(id),
 FOREIGN KEY (fk_id_proveedores) REFERENCES proveedores(id)
);
