USE hospital;

# Obtener el nombre de todos los pacientes no llamados María

SELECT nombre 
FROM Pacientes
WHERE nombre<>"María";

# Obtener la zona y planta de las camas a las que no se les ha cambiado sábanas el 16 de febrero de 2021

SELECT zona,planta
FROM Camas
WHERE NOT (fechaCambioSabanas="2021-02-16");

# Obtener el id_paciente del paciente que no tengan el DNI 33333333C

SELECT id_paciente
FROM Pacientes
WHERE dni<>"33333333C";

# Obtener turno, nombre y especialidad de los médicos con id_medico diferentes de 2, 4 y 5

SELECT turno,nombre,especialidad
FROM Medicos
WHERE id_medico<>2 AND id_medico<>4 AND id_medico<>5;


# Medicos con especialidad que no sea cardiología

SELECT *
FROM Medicos
WHERE especialidad<>"Cardiología";

# id Médicos que no han atendido al paciente 2

SELECT fk_id_medico
FROM Pacientes_Medicos
WHERE fk_id_paciente<>2;

# ids médicos no han atendido a ningún paciente 

SELECT id_medico
FROM Medicos
WHERE id_medico NOT IN (SELECT fk_id_medico FROM Pacientes_Medicos);

# Pacientes atendidos por médicos que no sean los de id 7 y 9

SELECT fk_id_paciente
FROM Pacientes_Medicos
WHERE fk_id_medico<>7 AND fk_id_medico<>9;
# WHERE NOT (fk_id_medico=7 OR fk_id_medico=9);


# DISTINCT, SUM, COUNT, AVG

SELECT DISTINCT (fk_id_medico)
FROM Pacientes_Medicos;

SELECT SUM(id_medico)
FROM Medicos;

SELECT COUNT(*) AS CUANTAS_MARIAS
FROM Pacientes
WHERE nombre="María";

SELECT AVG(id_medico)
FROM Medicos;

# Nombre de todos los médicos que han atendido pacientes

SELECT nombre
FROM Medicos
WHERE id_medico IN (SELECT fk_id_medico FROM Pacientes_Medicos);

# Zona de las camas en las que han estado pacientes:

SELECT DISTINCT(zona)
FROM Camas
WHERE id_cama IN (SELECT fk_id_cama FROM Pacientes);

# Nombre del médico y nombre del paciente en cada atención;

SELECT Medicos.nombre,Pacientes.nombre
FROM Medicos,Pacientes
WHERE (id_medico, id_paciente) IN (SELECT fk_id_medico, fk_id_paciente FROM Pacientes_Medicos);

# DNI y especialidad de los médicos que han atendido a pacientes que se apellidan Pérez

SELECT dni,especialidad
FROM Medicos
WHERE id_medico IN (SELECT fk_id_medico 
					FROM Pacientes_Medicos 
					WHERE fk_id_paciente IN 
						(SELECT id_paciente 
						FROM Pacientes 
						WHERE apellido1="Pérez"));
						
# Pacientes atendidos por médicos de pediatría;

SELECT *
FROM Pacientes
WHERE id_paciente IN(SELECT fk_id_paciente 
					FROM Pacientes_Medicos 
					WHERE fk_id_medico IN
						(SELECT id_medico
						FROM Medicos
						WHERE especialidad="pediatría"));
						
# Obtener la cantidad de veces que aparece el paciente con id 1 en la tabla Pacientes;

SELECT COUNT(id_paciente)
FROM Pacientes
WHERE id_paciente=1;

# Obtener la suma los ids de los médicos que se llaman Carlos;

SELECT SUM(id_medico)
FROM Medicos
WHERE nombre="Carlos";

# Obtener los apellidos que hay en la tabla Pacientes sin repetir;

SELECT DISTINCT apellido1
FROM Pacientes;

# Obtener la suma, cantidad y media de los ids de las camas;

SELECT SUM(id_cama),COUNT(id_cama),AVG(id_cama)
FROM Camas;

# Obtener los médicos que no han atendido a la paciente María Pérez, ni a Ana Rodríguez

SELECT *
FROM Medicos
WHERE id_medico IN(SELECT fk_id_medico FROM Pacientes_Medicos WHERE fk_id_paciente IN 
						(SELECT id_paciente FROM Pacientes WHERE (nombre<>"María" AND apellido1<>"Pérez") OR (nombre<>"Ana" AND apellido1<>"Rodríguez")));
						
						
SELECT * FROM pACIENTES;
SELECT * FROM Pacientes_medicos;


SELECT id_medico
FROM Medicos
WHERE id_medico IN(SELECT fk_id_medico FROM Pacientes_Medicos WHERE fk_id_paciente IN 
						(SELECT id_paciente FROM Pacientes WHERE nombre<>"Ana" AND apellido1<>"Rodríguez"));
						
# Actualizar el nombre y apellido de los pacientes atendidos por Gabriela Martínez Seoane a Marta Ramírez
SET SQL_SAFE_UPDATES = 0;
UPDATE Pacientes
SET nombre="Marta", apellido1="Ramírez"
WHERE id_paciente IN (SELECT fk_id_paciente FROM Pacientes_Medicos WHERE fk_id_medico IN
						(SELECT  id_medico FROM Medicos WHERE nombre="Gabriela" AND apellido1="Martínez" AND apellido2="Seoane"));  
SET SQL_SAFE_UPDATES = 1;						
SELECT *
FROM Pacientes;                        