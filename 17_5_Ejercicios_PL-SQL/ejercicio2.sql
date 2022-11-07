DELIMITER //
CREATE PROCEDURE operaciones (IN operacion CHAR(3), IN num1 INT, IN num2 INT)
BEGIN
	DECLARE saludo VARCHAR(100);
	SET saludo = "Hola";
	SELECT saludo;
END 
//
DELIMITER ;