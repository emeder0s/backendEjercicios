#USE hospital;
# Obtener turno, nombre y especialidad de los médicos con id_medico diferentes de 2, 4 y 5 y que hayan atendido a María Pérez
SELECT turno,nombre,especialidad
    FROM Medicos
    WHERE id_medico<>2 AND id_medico<>4 AND id_medico<>5 
    AND id_medico IN (SELECT fk_id_medico 
					  FROM pacientes_medicos 
					  WHERE fk_id_paciente IN (SELECT id_paciente 
											   FROM pacientes
											   WHERE nombre="María" AND apellido1="Pérez"));


# Medicos con especialidad que no sea cardiología y que no hayan atendido a pacientes que hayan estado en la cama 2
SELECT *
    FROM Medicos
    WHERE especialidad<>"Cardiología"
    AND id_medico NOT IN (SELECT fk_id_medico 
						  FROM pacientes_medicos 
                          WHERE fk_id_paciente IN (SELECT id_paciente 
										         FROM pacientes 
                                                 WHERE fk_id_cama = 2));