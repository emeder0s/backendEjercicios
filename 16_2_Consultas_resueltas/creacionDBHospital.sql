#DROP DATABASE Hospital;
    CREATE DATABASE Hospital;

    USE Hospital;

    CREATE TABLE Camas(
        id_cama INT AUTO_INCREMENT,
        zona VARCHAR(50), 
        planta VARCHAR(50) NOT NULL,
        fechaCambioSabanas DATE NOT NULL, 
        PRIMARY KEY(id_cama)
    );

    INSERT INTO Camas VALUES(null, "pediatría", "Primera", "2020/01/29");
    INSERT INTO Camas VALUES(null, "cardiología", "Primera", "2020/01/30");
    INSERT INTO Camas VALUES(null, "traumatología", "Segunda", "2020/02/15");
    INSERT INTO Camas VALUES(null, "traumatología", "Segunda", "2021/02/16");
    INSERT INTO Camas VALUES(null, "obstetricia", "Tercera", "2019/01/29");
    INSERT INTO Camas VALUES(null, "ginecología", "Cuarta", "2020/01/29");

    CREATE TABLE Pacientes(
        id_paciente INT AUTO_INCREMENT,
        nombre VARCHAR(100),
        apellido1 VARCHAR(100),
        dni CHAR(9) NOT NULL,
        fechaIngreso DATE,
        fk_id_cama INT,
        PRIMARY KEY(id_paciente)
    );
    INSERT INTO Pacientes VALUES(null, "María", "Pérez", "11111111A", "2020/01/28", 1);
    INSERT INTO Pacientes VALUES(null, "María", "Pérez", "11111111A", "2020/02/14", 3);
    INSERT INTO Pacientes VALUES(null, "María", "Pérez", "11111111A", "2020/02/29", 2);
    INSERT INTO Pacientes VALUES(null, "José", "Ramirez", "22222222B", "2020/02/10", 3);
    INSERT INTO Pacientes VALUES(null, "Rafael", "Hernández", "33333333C", "2020/01/09", 4);
    INSERT INTO Pacientes VALUES(null, "Ana", "Rodríguez", "44444444D", "2020/01/26", 6);
    INSERT INTO Pacientes VALUES(null, "Ana", "Rodríguez", "44444444D", "2020/01/27", 5);

    CREATE TABLE Medicos(
        id_medico INT AUTO_INCREMENT,
        nombre VARCHAR(100),
        apellido1 VARCHAR(100),
        apellido2 VARCHAR(100),
        dni CHAR(9) UNIQUE NOT NULL,
        turno VARCHAR(50), 
        especialidad VARCHAR(100) NOT NULL, 
        PRIMARY KEY(id_medico) 
    );
    INSERT INTO Medicos VALUES(null, "Rosa", "Hernández", "Ruíz", "55555555A", "Mañana", "pediatría");
    INSERT INTO Medicos VALUES(null, "Juan", "Ruíz", "Ruíz", "55555555B", "Tarde", "pediatría");
    INSERT INTO Medicos VALUES(null, "Carlos", "Blanco", "Pérez", "55555555C", "Mañana", "cardiología");
    INSERT INTO Medicos VALUES(null, "Carlos", "Hernández", "Pérez", "55555555D", "Tarde", "cardiología");
    INSERT INTO Medicos VALUES(null, "Ana", "Ramirez", "Pérez", "55555555E", "Mañana", "traumatología");
    INSERT INTO Medicos VALUES(null, "Gabriela", "Betancort", "Seoane", "55555555F", "Tarde", "traumatología");
    INSERT INTO Medicos VALUES(null, "Juan", "Ramirez", "Seoane", "55555555G", "Mañana", "obstetricia");
    INSERT INTO Medicos VALUES(null, "David", "Díaz", "Pérez", "55555555H", "Tarde", "obstetricia");
    INSERT INTO Medicos VALUES(null, "Gabriela", "Martínez", "Seoane", "55555555I", "Mañana", "ginecología");
    INSERT INTO Medicos VALUES(null, "Óscar", "Martínez", "Pérez", "55555555J", "Tarde", "ginecología");


    CREATE TABLE Pacientes_Medicos(
        id_paciente_medico INT AUTO_INCREMENT,
        fk_id_paciente INT,
        fk_id_medico INT, 
        PRIMARY KEY(id_paciente_medico)
    );

    INSERT INTO Pacientes_Medicos VALUES(null, 1, 1);
    INSERT INTO Pacientes_Medicos VALUES(null, 1, 2);
    INSERT INTO Pacientes_Medicos VALUES(null, 2, 3);
    INSERT INTO Pacientes_Medicos VALUES(null, 3, 5);
    INSERT INTO Pacientes_Medicos VALUES(null, 4, 6);
    INSERT INTO Pacientes_Medicos VALUES(null, 5, 6);
    INSERT INTO Pacientes_Medicos VALUES(null, 5, 5);
    INSERT INTO Pacientes_Medicos VALUES(null, 6, 9);
    INSERT INTO Pacientes_Medicos VALUES(null, 6, 10);
    INSERT INTO Pacientes_Medicos VALUES(null, 7, 7);
    INSERT INTO Pacientes_Medicos VALUES(null, 7, 8);

    ALTER TABLE Pacientes
    ADD FOREIGN KEY (fk_id_cama) REFERENCES Camas (id_cama) ON UPDATE CASCADE ON DELETE SET NULL;

    ALTER TABLE Pacientes_Medicos
    ADD FOREIGN KEY (fk_id_paciente) REFERENCES Pacientes (id_paciente) ON UPDATE CASCADE ON DELETE SET NULL,
    ADD FOREIGN KEY (fk_id_medico) REFERENCES Medicos (id_medico) ON UPDATE CASCADE ON DELETE SET NULL;
