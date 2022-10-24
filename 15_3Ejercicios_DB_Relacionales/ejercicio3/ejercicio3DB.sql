#DROP DATABASE ejercicio3;
CREATE DATABASE ejercicio3;
USE ejercicio3;

CREATE TABLE IF NOT EXISTS profesores ( 
 id INT AUTO_INCREMENT,
 nombre VARCHAR(50) NOT NULL,
 apellido VARCHAR(50) NOT NULL,
 dni CHAR(9) NOT NULL,
 direccion VARCHAR(255),
 telefono VARCHAR(255),
 PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS modulos ( 
 id INT AUTO_INCREMENT,
 nombre VARCHAR(50) NOT NULL,
 fk_id_profesor INT,
 PRIMARY KEY(id),
 FOREIGN KEY (fk_id_profesor) REFERENCES profesores(id)
);

CREATE TABLE IF NOT EXISTS profesores_modulos ( 
 id INT AUTO_INCREMENT,
 fk_id_profesor INT NOT NULL,
 fk_id_modulo INT NOT NULL,
 PRIMARY KEY(id),
 FOREIGN KEY (fk_id_profesor) REFERENCES profesores(id),
 FOREIGN KEY (fk_id_modulo) REFERENCES modulos(id)
);

CREATE TABLE IF NOT EXISTS cursos (
  id INT AUTO_INCREMENT,
  nombre VARCHAR(50) NOT NULL,
  fk_id_alumno INT,
  FOREIGN KEY (fk_id_alumno) REFERENCES alumnos(id)
);

CREATE TABLE IF NOT EXISTS alumnos ( 
 id INT AUTO_INCREMENT,
 num_expediente VARCHAR(120) NOT NULL,
 nombre VARCHAR(50) NOT NULL,
 apellido VARCHAR(50) NOT NULL,
 fecha_nac DATE,
 fk_id_curso INT NOT NULL,
 PRIMARY KEY(id),
 FOREIGN KEY (fk_id_curso) REFERENCES cursos(id)
);

