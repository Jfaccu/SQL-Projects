SELECT @@autocommit;
SET @@autocommit = 1;
SET @@autocommit = 0;
-- TCL N°1
-- 1. Buscamos en la tabla los registos que elminaremos --	
SELECT * FROM ORDENES;						

-- 2. Iniciamos la transccion para borrar los registros de manera 'temporal' --
START TRANSACTION;			
-- 3. Deleteamos los registros --				
DELETE FROM ORDENES WHERE id_O = 102234 ;
DELETE FROM ORDENES WHERE id_O = 102235 ;


SELECT * FROM ORDENES;	    -- 

-- 4. Dejamos la sentencia Rollback para volver a los registos anteriores para cualquier error. Dejando el Autocommit en 0 
-- ROLLBACK;			
-- 5. Commit para asegurar y dar la confirmacion de la sentencia de delete 
-- COMMIT;					



-- ----------------------------------
SELECT @@autocommit;
SET @@autocommit = 1;
SET @@autocommit = 0;
-- TCL N°2
-- 1. Buscamos en la tabla los registos que elminaremos --	
SELECT * FROM CLIENTES;

-- 2. Iniciamos la transccion para borrar los registros de manera 'temporal' --
START TRANSACTION;

-- 3. Inserccion de los registros --
INSERT INTO Clientes ( Id_C, Nombre, Apellido, Direccion, Email)
VALUES ('22','Clara', 'Valls', 'Gaudalajara 511', 'Clarita@gmail.com');
INSERT INTO Clientes ( Id_C, Nombre, Apellido, Direccion, Email)
VALUES ('23','Orlando', 'Tomayo', 'tenerife 200', 'Tomayo2000@gmail.com');
INSERT INTO Clientes ( Id_C, Nombre, Apellido, Direccion, Email)
VALUES ('24','Oscar', 'Murcillo', 'Cucha Cucha 5221', 'OrcarMurr@gmail.com');
INSERT INTO Clientes ( Id_C, Nombre, Apellido, Direccion, Email)
VALUES ('25','Michelle', 'Ramirez', 'Evamontes 772', 'Michramirez@gmail.com');
Savepoint sp_1;

INSERT INTO Clientes ( Id_C, Nombre, Apellido, Direccion, Email)
VALUES ('26','Daniel', 'Montoriel', 'Gral Piran 1900', 'CaniMontoriel2@gmail.com');
INSERT INTO Clientes ( Id_C, Nombre, Apellido, Direccion, Email)
VALUES ('27','Stella', 'Maris', 'Reinalda 100', 'StellaMaris@gmail.com');
INSERT INTO Clientes ( Id_C, Nombre, Apellido, Direccion, Email)
VALUES ('28','Valentina', 'Fuccine', 'Cardenas 2150', 'ValuFuccine00@gmail.com');
INSERT INTO Clientes ( Id_C, Nombre, Apellido, Direccion, Email)
VALUES ('29','Anabella', 'Mileore', 'PastorLacasa 140', 'AnitaMileore@gmail.com');
Savepoint sp_2 ;

-- 4. Agrega la sentencia de eliminacion hacia el savepoint pronunciado --
-- ROLLBACK to sp_1 ;
-- COMMIT;
