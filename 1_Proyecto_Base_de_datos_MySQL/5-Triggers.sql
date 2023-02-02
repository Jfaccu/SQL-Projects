 /* CREAMOS LAS TABLAS BITACORAS PARA SU AUDITORIA CORRESPONDIENTE */ -- /* TABLA CLIENTES */ --
-- ----------------------------------- --
/* PRIMERA TABLA DE AUDITORIA */
-- ----------------------------------- --
DROP TABLE IF EXISTS LOG_AUD_CLIENTES;

CREATE TABLE IF NOT EXISTS LOG_AUD_CLIENTES (
Id_Log_C INT AUTO_INCREMENT,
Id_C INT,
Nombre VARCHAR(100) NOT NULL,
Apellido VARCHAR(100) NOT NULL,
Email VARCHAR(150) NOT NULL,
Nombre_Accion VARCHAR(100) NOT NULL,
Nombre_Tabla VARCHAR(100) NOT NULL,
CamNuevo_CamAnterior VARCHAR(255),
Usuario VARCHAR (100),
Date_Upd_Ins DateTime, 
PRIMARY KEY (Id_Log_C)
)
;


-- --------------------------- -- 
-- CREATE TRIGGERS N°1 CLIENTES --
DROP TRIGGER TR_LOG_CLIENTES;
DELIMITER %%
CREATE TRIGGER TR_LOG_CLIENTES AFTER INSERT ON restaurant_bd.clientes
FOR EACH ROW
BEGIN 
INSERT INTO LOG_AUD_CLIENTES (id_C, 
					          Nombre, 
                              Apellido, 
                              Email, 
                              Nombre_Accion, 
                              Nombre_Tabla, 
                              CamNuevo_CamAnterior, 
                              Usuario, 
                              Date_Upd_Ins
                              )
VALUES (NEW.id_C, 
		NEW.Nombre, 
		NEW.Apellido,
        NEW.Email, 
        'INSERT', 
        'CLIENTES', 
        ' ', 
        Current_User(), 
        current_timestamp()
        );
END %%
DELIMITER ;

-- GENERAMOS LOS NUEVOS INSERTS PARA QUE QUEDEN REGISTRADOS EN LA TABLA PARA AUDITAR --
Use restaurant_bd;
INSERT INTO CLIENTES ( Id_C, Nombre, Apellido, Direccion, Email)
VALUES ('18','Soledad', 'Palomares', 'Maciel 200', 'SolPalo@gmail.com');
INSERT INTO CLIENTES ( Id_C, Nombre, Apellido, Direccion, Email)
VALUES ('19','Franco', 'Palacios', 'Jose alico 1100', 'FrancoPala@gmail.com');
INSERT INTO CLIENTES ( Id_C, Nombre, Apellido, Direccion, Email)
VALUES ('20','Juan', 'Casemiro', 'España 800', 'CasemiroJuan@live.com.ar');
INSERT INTO CLIENTES ( Id_C, Nombre, Apellido, Direccion, Email)
VALUE  ('21','Guido', 'Lopiano', 'Catolica 1000', 'GuiLopiano@gmail.com');

-- ----------------------------------- --
-- CONFIRMAMOS LOS REGISTROS GENERADOS --
SELECT * FROM LOG_AUD_CLIENTES;


-- -------------------- --
-- TRIGGER N°2 CLIENTES --
DROP TRIGGER TR_LOG_CLIENTES_UPD;
DELIMITER %%
CREATE TRIGGER TR_LOG_CLIENTES_UPD BEFORE UPDATE ON restaurant_bd.clientes
FOR EACH ROW
BEGIN 
INSERT INTO LOG_AUD_CLIENTES (id_C, 
					          Nombre, 
                              Apellido, 
                              Email, 
                              Nombre_Accion, 
                              Nombre_Tabla, 
                              CamNuevo_CamAnterior, 
                              Usuario, 
                              Date_Upd_Ins
                              )
VALUES (NEW.id_C, 
		NEW.Nombre, 
		NEW.Apellido,
        NEW.Email, 
        'UPDATE', 
        'CLIENTES', 
         CONCAT('CampoNuevo: ',NEW.Email,' ','CampoAnterior: ', OLD.Email), 
        Current_User(), 
        current_timestamp()
        );
END %%
DELIMITER ;

-- -------------------------------------------------------------- --
-- REALIZAMOS UNA ACTULIZACION DE DATOS PARA VERIFICAR EL TRIGGER --
UPDATE CLIENTES
SET direccion ='Humahuaca 520'
WHERE id_C = 3
;
UPDATE CLIENTES
SET email ='LinaB10@gmail.com'
WHERE id_C = 10
;
-- ----------------------------------- --
-- CONFIRMAMOS LOS REGISTROS GENERADOS --
SELECT * FROM LOG_AUD_CLIENTES;



-- ---------------------------------- --
 /* CREAMOS LAS TABLAS BITACORAS PARA SU AUDITORIA CORRESPONDIENTE */ -- /* TABLA ORDENES */ --
-- ----------------------------------- --
/* SEGUNDA TABLA DE AUDITORIA */
-- ----------------------------------- --

DROP TABLE IF EXISTS LOG_AUD_ORDENES;
CREATE TABLE IF NOT EXISTS LOG_AUD_ORDENES (
Id_Log INT AUTO_INCREMENT,
id_C INT NOT NULL,
Monto_Total INT,
Nombre_Accion VARCHAR(100) NOT NULL,
Nombre_Tabla VARCHAR(100) NOT NULL,
CamNuevo_CamAnterior VARCHAR(255),
Usuario VARCHAR (100),
Date_Upd_Ins DATE,
PRIMARY KEY (id_Log)
) 
;


-- --------------------------- -- 
-- CREATE TRIGGERS N°1 ORDENES --
DROP TRIGGER TR_LOG_ORDENES;
DELIMITER %%
CREATE TRIGGER TR_LOG_ORDENES AFTER INSERT ON restaurant_bd.Ordenes 
FOR EACH ROW																		
BEGIN
INSERT INTO LOG_AUD_ORDENES (id_C, 
							 Monto_Total, 
                             Nombre_Accion, 
                             Nombre_Tabla, 
                             CamNuevo_CamAnterior, 
                             Usuario, 
                             Date_Upd_Ins
                             )
VALUES (NEW.id_C, 
		NEW.Monto_Total,
        'INSERT', 
        'ORDENES', 
        ' ', 
        Current_User(), 
        Current_Date()
        )
;
END %%
DELIMITER ;

-- GENERAMOS LOS NUEVOS INSERTS PARA QUE QUEDEN REGISTRADOS EN LA TABLA PARA AUDITAR --
Use restaurant_bd;
INSERT INTO ordenes ( id_O, Fecha_Hora, Monto_Total, id_C, id_P)
VALUES ('102233', '2022-07-25 21:12:08', 2400, 4, 8);
INSERT INTO ordenes ( id_O, Fecha_Hora, Monto_Total, id_C, id_P)
VALUES ('102234', '2022-07-25 22:42:12', 3650, 1, 15);
INSERT INTO ordenes ( id_O, Fecha_Hora, Monto_Total, id_C, id_P)
VALUES ('102235', '2022-07-25 23:15:58', 1050, 14, 23);
	
-- ----------------------------------- --
-- CONFIRMAMOS LOS REGISTROS GENERADOS --
SELECT * FROM LOG_AUD_ORDENES;   
       
-- --------------------------- -- 
-- CREATE TRIGGERS N°2 ORDENES --
DROP TRIGGER TR_LOG_ORDENES_2;
DELIMITER %%
CREATE TRIGGER TR_LOG_ORDENES_2 BEFORE UPDATE ON restaurant_bd.Ordenes 
FOR EACH ROW													
BEGIN
INSERT INTO LOG_AUD_ORDENES (id_C, 
							Monto_Total, 
                            Nombre_Accion, 
                            Nombre_Tabla, 
                            CamNuevo_CamAnterior, 
                            Usuario, 
                            Date_Upd_Ins)
                            
VALUES (NEW.id_C, 
	    NEW.Monto_Total,
        'UPDATE', 
        'ORDENES', 
        CONCAT('CampoNuevo: ',NEW.Monto_Total,' ','CampoAnterior: ', OLD.Monto_Total), 
        Current_User(), 
        Current_Date()
        )
;
END %%
DELIMITER ;

-- -------------------------------------------------------------- --
-- REALIZAMOS UNA ACTULIZACION DE DATOS PARA VERIFICAR EL TRIGGER --
UPDATE ORDENES 
SET Monto_Total = 2250,
id_P = 2
WHERE id_C = 11
;
       
-- ----------------------------------- --
-- CONFIRMAMOS LOS REGISTROS GENERADOS --
SELECT * FROM LOG_AUD_ORDENES;


