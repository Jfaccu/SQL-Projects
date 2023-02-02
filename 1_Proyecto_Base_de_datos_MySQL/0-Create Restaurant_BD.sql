CREATE SCHEMA Restaurant_BD;
Drop SCHEMA Restaurant_BD;
-- ---------------------- --
-- Creation of the Tables --
-- ---------------------- --
USE Restaurant_BD;
CREATE TABLE if not exists CLIENTES (
id_C int PRIMARY KEY NOT NULL AUTO_INCREMENT,
Nombre varchar(50) NOT NULL,
Apellido varchar(50) NOT NULL,
Direccion varchar(75) NOT NULL,
Email varchar(100) NOT NULL
);

CREATE TABLE if not exists PRODUCTOS (
id_P int PRIMARY KEY NOT NULL AUTO_INCREMENT,
Nombre varchar(50) NOT NULL,
Precio_Unitario DECIMAL(10,2) NOT NULL,
Descripcion varchar(150) NOT NULL,
Ingredientes VARCHAR(150) NOT NULL
);

CREATE TABLE if not exists DEPARTAMENTOS (
id_D int PRIMARY KEY NOT NULL AUTO_INCREMENT,
Sector text(50) NOT NULL,
Descripcion text(150) NOT NULL
);

CREATE TABLE if not exists ORDENES (
id_O int PRIMARY KEY NOT NULL AUTO_INCREMENT,
Fecha_Hora datetime NOT NULL,
Monto_Total DECIMAL(10,2) NOT NULL,
id_C int NOT NULL,
id_P int NOT NULL
);

CREATE TABLE if not exists GERENTES (
id_OTG int NOT NULL AUTO_INCREMENT,
Nombre text(25) NOT NULL,
Apellido text(25) NOT NULL,
Email varchar(75) NOT NULL,
Contraseña varchar(50) NOT NULL,
Telefono varchar(55) NOT NULL,
id_O int NOT NULL,
PRIMARY KEY(id_OTG, telefono)
);

CREATE TABLE if not exists TIPO_PEDIDO (
id_TP int PRIMARY KEY NOT NULL AUTO_INCREMENT,
Nombre_Tipo varchar(20) NOT NULL,
Descripcion varchar(150) NOT NULL
);

CREATE TABLE if not exists EMPLEADOS (
id_OTE int NOT NULL AUTO_INCREMENT,
Nombre text(25) NOT NULL,
Apellido text(25) NOT NULL,
Email varchar(50) NOT NULL,
Contraseña varchar(20) NOT NULL,
Telefono varchar(20) NOT NULL,
Salario DECIMAL(10,2) NOT NULL,
id_OTG int NOT NULL,
id_D int NOT NULL,
PRIMARY KEY (id_OTE, Telefono)
);

CREATE TABLE if not exists FACTURACION (
id_F int PRIMARY KEY NOT NULL AUTO_INCREMENT,
Fecha_Hora datetime NOT NULL,
Monto DECIMAL(10,2) NOT NULL,
id_OTE int NOT NULL,
id_C int NOT NULL,
id_TP int NOT NULL
);

-- -------------------------- --
-- Assignament of foreign key --
-- -------------------------- --
USE Restaurant_BD;
ALTER TABLE ORDENES
ADD FOREIGN KEY (id_C) 
REFERENCES CLIENTES(id_C)
;
ALTER TABLE GERENTES 
ADD FOREIGN KEY (id_O)
REFERENCES ORDENES(id_O)
;
ALTER TABLE EMPLEADOS 
ADD FOREIGN KEY (id_OTG)
REFERENCES GERENTES(id_OTG)
;
ALTER TABLE EMPLEADOS
ADD FOREIGN KEY (id_D)
REFERENCES DEPARTAMENTOS(id_D)
;
ALTER TABLE FACTURACION 
ADD FOREIGN KEY (id_OTE)
REFERENCES EMPLEADOS (id_OTE)
;
ALTER TABLE FACTURACION
ADD FOREIGN KEY (id_TP)
REFERENCES TIPO_PEDIDO(id_TP)
;
ALTER TABLE FACTURACION 
ADD FOREIGN KEY  (id_C)
REFERENCES CLIENTES(id_C)
;
ALTER TABLE ORDENES
ADD FOREIGN KEY (id_P)
REFERENCES PRODUCTOS (id_P)
;

