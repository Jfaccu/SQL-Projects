		/* FUNCIONES */
USE RESTAURANT_BD;
		/* FUNCTION NUMBER ONE */
DROP FUNCTION IF EXISTS FN_NombresSegunIDCliente;
Delimiter //
CREATE FUNCTION FN_NombresSegunIDCliente (IDparCliente int)
RETURNS VARCHAR (150)
DETERMINISTIC
BEGIN
DECLARE var VARCHAR(150);
SET var = (
		SELECT CONCAT(nombre,' ', apellido) 
		FROM Clientes
		WHERE id_C = IDparCliente
           );
RETURN var;
END //
DELIMITER ;
-- -------------------------- --
SELECT FN_NombresSegunIDCliente (1) AS CLIENTE;
-- -------------------------- --


-- ------------------- --
/* FUNCTION NUMBER TWO */

DROP FUNCTION IF EXISTS FN_IvaCalcPorIdCliente;
Delimiter $$
CREATE FUNCTION FN_IvaCalcPorIdCliente (IdParCliente int)
RETURNS Varchar (50)
DETERMINISTIC
BEGIN
DECLARE Iva_Res Varchar(50);
DECLARE Total_Client Varchar(50);
SET Total_Client = (
	SELECT
			SUM(monto_total)
	FROM ordenes
    WHERE id_C = IdParCliente
     ) ;
SET Iva_Res = CONCAT('El valor del iva es de: ', Total_Client * 0.21);
RETURN iva_Res;
End $$
delimiter ;
-- -------------------- --
SELECT FN_IvaCalcPorIdCliente (4) AS IVA;
-- -------------------- --