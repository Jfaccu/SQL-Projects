use Restaurant_bd;

 /* STORED PROCEDURE 1 */ -- Comparar Clientes de mayor gastos, ingresando por el id --
DROP PROCEDURE IF EXISTS SP_Cliente_Mas_Consum;
DELIMITER %%
CREATE PROCEDURE SP_Cliente_Mas_Consum (IN Pa_id_C VARCHAR(100),
										IN Pa2_id_C Varchar (100))
BEGIN
DECLARE CANT1 VARCHAR(100);
DECLARE CANT2 VARCHAR(100);
	SELECT 	SUM(monto_total) 
	INTO Cant1
	FROM ORDENES 
	WHERE id_C = Pa_id_C;
    
	SELECT 	SUM(monto_total)
	INTO Cant2
	FROM ORDENES 
	WHERE id_C = Pa2_id_C;
			
            IF Cant1 > Cant2 THEN 
			SELECT Pa_id_C, Cant1;
		
		ELSEIF Cant2 > Cant1 THEN
            SELECT Pa2_id_C, Cant2;
		ELSE 
			SELECT Pa_id_C AS ID_CLIENTE, Pa2_id_C AS ID_CLIENTE2, Cant1;
END IF;
END %%
DELIMITER ;

-- ----------------------------------- --
CALL SP_Cliente_Mas_Consum (10 , 1);
-- ----------------------------------- --



-- ------------------------------------------ --
 /* STORED PROCEDURE 2 */ -- INSERT de nuevos clientes --
 DROP PROCEDURE IF EXISTS SP_NewClients;
DELIMITER $$
CREATE PROCEDURE SP_NewClients (INOUT P_id_C int,
								INOUT P_Nonbre Varchar(100),
                                INOUT P_Apellido VARCHAR (100), 
                                INOUT P_Direccion VARCHAR (100),
                                INOUT P_Email VARCHAR (200)
								)
BEGIN
INSERT INTO Clientes (id_C, Nombre, Apellido, Direccion, Email)
VALUES (P_id_C, P_Nonbre, P_Apellido, P_Direccion, P_Email);
END $$
DELIMITER ;

SET @P_id_C = '17';
SET @P_Nonbre = 'Ana';
SET @P_Apellido = 'Fernandez';
SET @P_Direccion = 'Colacao 551';
SET @P_Email = 'Ana_Fe@gmail.com';

-- ------------------------------------------------------- --
CALL SP_NewClients (@P_id_C, @P_Nonbre, @P_Apellido, @P_Direccion, @P_Email);
-- ------------------------------------------------------- --
