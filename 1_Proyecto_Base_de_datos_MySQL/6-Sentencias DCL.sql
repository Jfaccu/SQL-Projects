USE mysql;
select * from user;

			-- -------------- --
-- DCL N°1	-- PRIMER USUARIO --
DROP USER IF EXISTS 'FR_DCL'@'LocalHost';
		/* Nombre de usuario y su contaseña */
CREATE USER IF NOT EXISTS 'FR_DCL'@'LocalHost' identified by 'security0209' ;

		/* Le daremos permiso al usuario para que haga las acciones de Lectura de la base de datos */
GRANT SELECT ON restaurant_bd.Clientes TO 'FR_DCL'@'LocalHost' ;
GRANT SELECT ON restaurant_bd.departamentos TO 'FR_DCL'@'LocalHost' ;
GRANT SELECT ON restaurant_bd.empleados TO 'FR_DCL'@'LocalHost' ;
GRANT SELECT ON restaurant_bd.facturacion TO 'FR_DCL'@'LocalHost' ;
GRANT SELECT ON restaurant_bd.gerentes TO 'FR_DCL'@'LocalHost' ;
GRANT SELECT ON restaurant_bd.ordenes TO 'FR_DCL'@'LocalHost' ;
GRANT SELECT ON restaurant_bd.productos TO 'FR_DCL'@'LocalHost' ;
GRANT SELECT ON restaurant_bd.tipo_pedido TO 'FR_DCL'@'LocalHost' ;

Flush privileges;
Show Grants for 'FR_DCL'@'LocalHost';


			-- -------------- --
-- DCL N°2	-- SEGUNDO USUARIO --
DROP USER IF EXISTS 'FR_DCL'@'LocalHost';

			/* Nombre de usuario y su contaseña */
CREATE USER IF NOT EXISTS 'User_LE'@'LocalHost' identified by 'security1020A';  

			/* Le daremos permiso al usuario para que haga las acciones de Lectura, 
				inserccion de nuevos datos y sus modificaciones */
GRANT SELECT, INSERT, UPDATE ON restaurant_bd.Clientes TO 'User_LE'@'LocalHost' ;
GRANT SELECT, INSERT, UPDATE ON restaurant_bd.departamentos TO 'User_LE'@'LocalHost' ;
GRANT SELECT, INSERT, UPDATE ON restaurant_bd.empleados TO 'User_LE'@'LocalHost' ;
GRANT SELECT, INSERT, UPDATE ON restaurant_bd.facturacion TO 'User_LE'@'LocalHost' ;
GRANT SELECT, INSERT, UPDATE ON restaurant_bd.gerentes TO 'User_LE'@'LocalHost' ;
GRANT SELECT, INSERT, UPDATE ON restaurant_bd.ordenes TO 'User_LE'@'LocalHost' ;
GRANT SELECT, INSERT, UPDATE ON restaurant_bd.productos TO 'User_LE'@'LocalHost' ;
GRANT SELECT, INSERT, UPDATE ON restaurant_bd.tipo_pedido TO 'User_LE'@'LocalHost' ;

Flush privileges;
Show Grants for 'User_LE'@'LocalHost';
