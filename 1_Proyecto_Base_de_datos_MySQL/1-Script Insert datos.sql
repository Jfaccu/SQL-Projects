USE restaurant_bd;
-- --------------- --
-- INSERT CLIENTES --
INSERT INTO Clientes ( Id_C, Nombre, Apellido, Direccion, Email)
VALUES (NULL,'Luciano', 'Espinazola', 'Arieta 5011', 'LucianoEspinazola15@gmail.com'),
(NULL,'Ariana', 'Bianchetti', 'Ana Maria 2500', 'ArianaBian150@gmail.com'),
(NULL,'Adriana', 'Estevez', 'Autralia 5221', 'AdriEstevez@gmail.com'),
(NULL,'Ramiro', 'Silva', 'Bebilaqua 772', 'RamiroS10@gmail.com'),
(NULL,'Solana', 'Fernandez', 'Champion 1998', 'SolFernandez@gmail.com'),
(NULL,'Horacio', 'Burlone', 'Nazar 1100', 'Horacio4550@gmail.com'),
(NULL,'Exequiuel', 'Gomez', 'Lino Lagos 150', 'ExequielGomez12@gmail.com'),
(NULL,'Florencia', 'Quinquel', 'Derragueira 2140', 'FlorQuinquel@gmail.com'),
(NULL,'Amaya', 'Moran', 'Gral Piran 2700', 'AmayaMoran1@gmail.com'),
(NULL,'Lina', 'Barea', 'Pilcomayo 100', 'LinaBarea@gmail.com'),
(NULL,'Felipe', 'Megias', 'Defensa 1200', 'FeliMegias@gmail.com'),
(NULL,'Paulina', 'Vegas', 'Honduras 1200', 'PauVegas100@gmail.com'),
(NULL,'Hilario', 'Cobo', 'Australia 2000', 'HilarioCobo10@gmail.com'),
(NULL,'Ariel', 'Caro', 'Sarandi 1900', 'ArielCaro@live.com.ar'),
(NULL,'Maximiliano', 'Baeza', 'Guanella 1500', 'MaxiBaeza@gmail.com')
;


-- -------------------- --
-- INSERT DEPARTAMENTOS --

INSERT INTO Departamentos (id_D, Sector, Descripcion)
VALUES ( NULL, 'Camarero de Mesa', 'Servicio que atiende en las mesas, empleados mas cercanos al cliente.'),
(NULL, 'Camarero de Barra', 'Atencion a los clientes de la barra, es el encargado de tener surtidas las neveras y las bebidas bien refrigeradas.'),
(NULL, 'Encargado de Caja', 'Gestionan todo lo referente a la caja Deben asegurarse de tener suficiente efectivo como para poder devolver el cambio al cliente.'),
(NULL, 'Recepcionista', 'Brindan atencion al personal interno y externo en sus requerimientos de informacion'),
(NULL, 'Sumiller', 'Experto en vino que se encarga, en todos los aspectos, de todo lo relacionado con el vino en un restaurante.'),
(NULL, 'Cheff Ejecutivo' , 'Planificar y dirigir la preparación de la comida y actividades culinarias.'),
(NULL, 'Cocinero', 'Encargado de elaborar los alimentos para la venta')
;

-- ---------------- --
-- INSERT PRODUCTOS --

INSERT INTO PRODUCTOS (id_P, nombre, Precio_unitario, Descripcion, Ingredientes)
VALUES (NULL, 'Berenjena Parmesano', '1950', 'Berenjenas gratinadas con parmesano y pomodoro', 'Berenjenas-Parmesano-Tomate-Ajo-Albahaca'),
(NULL, 'Burrata con Jamon', '2250', 'Burratas con jamon crudo estilo italiano', 'Burrata-Jamon Crudo-Nueces-Rucula'),
(NULL, 'Camarones a la milanesa','3200', 'Langostinos empanados, envueltos en mozzarella acompañados con salsa pomodoro y mayonesa de verduras', 'Langostinos-Muzzarella-Tomate-Mayonesa-Perejil-Ajo'),
(NULL, 'Burratina Frita','1950','Burrata pasada en pan y frito, acompañado con salsa de tomate y albahaca', 'Burrata-Pan Rallado-Tomate-Albahaca'),
(NULL, 'Ensalada Cesar', '2100','Salsa caesar, lechuga, parmesano, crouton y pollo', 'Lechuga-Parmesano-Crouton-Pollo-Salsa Cesar'),
(NULL, 'Emiliana', '2250', 'Rucula, jamon crudo, cherry, parmesano, aceitunas negras y verdes sobre croutons de focaccia', 'Rucula-Tomate-Jamon-Aceitunas-Coutons-Espinaca-Nueces'),
(NULL, 'Camembert del campo', '2250',  'Rucula, peras, queso camembert gratinado, almendras y vinegreta de mostaza y miel', 'Rucula-Pera-Queso Camembert-Almendras-Vinagre-Miel'),
(NULL, 'Fettuccine a la Bolognesa', '2400',  'Fettuccine con salsa a base de tomate y carne de ternera', 'Fettuccine-Salsa Tomate-Carne'),
(NULL, 'Gnocci de patata a la Bolognesa', '2400',  'Gnocci con salsa a base de tomate y carne de ternera', 'Gnocci-Salsa Tomate-Carne'),
(NULL, 'Lasagna de Verduras', '2400','Lasagna de verduras mixtas, calabaza zuchini, berenjenas, papas y mozzarella', 'Lasagna-Calabaza-Zuchini-Berenjena-Papa-Mozzarella'),
(NULL, 'Sorrentinos Gran Caruso', '2400', 'Rellenos de mozzarella y jamon cocido, gratinados con crema, jamon cocido, champignon, ave y pomodoro fresco', 'Sorrentino-Mozzarella-Jamon-Crema-Champignon-Ave-Salsa Tomate'),
(NULL, 'Malfatti de Salsa Rosa con Espinaca','2400', 'Relleno de espinaca y ricota gratinado con crema, pomodoro y parmesano', 'Malfatti-Espinaca-Ricota-Queso-Crema-Salsa Tomate-Parmesano'),
(NULL, 'Ravioles Verdes de Scarparo', '2400','Rellenos de espinaca y ricota, salsa a base de oliva, verdeo, pesto, ajo, tomate seco y pomodoro fresco', 'Raviol-Espinaca-Ricota-Verdeo-Pesto-Ajo-Tomate-Jamon-Salsa-Tomate-Oliva'),
(NULL, 'Ravioles con Champignon', '2400','Relleno con carne braseada y salsa a base de hongos de pino, perejil y crema', 'Raviol-Carne-Champignon-Perejil-Crema-Queso'),
(NULL, 'Risotto de Mariscos', '3650','Almejas, mejillones, langostinos, vieiras, chipirones y calamares', 'Arroz-Almejas-Mejillones-Langostinos-Vieiras-Chipirones-Calamares'),
(NULL, 'Carne de Res en Rodajas', '4100','Acompañado con rucula, grana y cherry', 'Carne-Rucula-Grana-Cherry-Parmesano'),
(NULL, 'Milanesa de Ternera', '3100', 'Milanesa de ternera con salsa de pomodoro y mozzarella fundida. Acompañado con papines', 'Carne-Salsa Tomate-Muzzarella-Papa'),
(NULL, 'Salmon Rosado Grillado', '4000','Salmon Rosado a la parrilla, acompañado con papines', 'Salmon-Manteca-Papa'),
(NULL, 'Pollo a la Fiorentina', '3500','Pollo a la plancha con salsa de espinacas y crema, acompañado de papines', 'Pollo-Espinaca-Crema-Manteca-Cebolla-Ajo'),
(NULL, 'Flan de Claras', '1050','Flan de claras con confitura de naranja, yogur de vainilla, granola y almendras', 'Claras-Naranja-Yogur-Granola-Almendras'),
(NULL, 'Seduccion de Chocolate', '1050','Volcan de chocolate con helado de vainilla', 'Chocolate-Azucar Impalpable-Helado Vainilla'),
(NULL, 'Tiramisu', '1050','Clasico tiramisu con Mascarpone','Mascarpone-Vainilla-Crema-Cafe-Azucar-Chocolate'),
(NULL, 'Panna Cotta a la Maracuya', '1050','Panna Cotta con pulpa de maracuya, salsa de frutilla y mango', 'Crema-Azucar-Queso Crema-Maracuya-Mango-Salsa Frutilla')
;

-- -------------- --
-- INSERT ORDENES --

INSERT INTO Ordenes (id_O, Fecha_Hora, Monto_Total, id_C, id_P)
VALUES ('102205', '2022-07-12 20:36:22', '2250', '4', '6'),
(NULL, '2022-07-12 20:56:55', '3500', '1', '19'),
(NULL, '2022-07-12 21:01:11', '2400', '3', '14'),
(NULL, '2022-07-14 21:06:24', '4100', '10', '16'),
(NULL, '2022-07-14 21:12:09', '2400', '12', '13'),
(NULL, '2022-07-14 21:20:20', '4000', '9', '18'),
(NULL, '2022-07-15 21:25:01', '2400', '10', '13'),
(NULL, '2022-07-16 21:32:14', '1950', '2', '1'),
(NULL, '2022-07-16 21:40:52', '3200', '5', '3'),
(NULL, '2022-07-16 21:48:20', '2400', '7', '10'),
(NULL, '2022-07-17 21:52:50', '2400', '11', '8'),
(NULL, '2022-07-18 21:58:12', '2250', '6', '7'),
(NULL, '2022-07-18 22:05:21', '3200', '15', '3'),
(NULL, '2022-07-19 22:14:54', '2100', '8', '5'),
(NULL, '2022-07-19 22:21:02', '3100', '13', '17'),
(NULL, '2022-07-20 22:26:12', '3650', '14', '15'),
(NULL, '2022-07-20 22:29:22', '2400', '4', '9'),
(NULL, '2022-07-20 22:35:41', '2250', '6', '2'),
(NULL, '2022-07-21 22:42:12', '1950', '12', '4'),
(NULL, '2022-07-21 22:48:12', '2400', '3', '12'),
(NULL, '2022-07-14 23:01:11', '1050', '9', '22'),
(NULL, '2022-07-12 23:09:52', '1050', '1', '20'),
(NULL, '2022-07-18 23:13:34', '1050', '15', '21'),
(NULL, '2022-07-16 23:19:09', '1050', '7', '23'),
(NULL, '2022-07-16 23:22:51', '1050', '5', '22'),
(NULL, '2022-07-20 23:30:46', '1050', '14', '20'),
(NULL, '2022-07-19 23:39:22', '1050', '8', '23')
;

-- ----------------- --
-- INSERT GENERENTES --

INSERT INTO Gerentes (id_OTG, Nombre, Apellido, Email, Contraseña, Telefono, id_O)
VALUES ('606025', 'Aurelio', 'Benitez', 'AurelioBen@gmail.com','4K5tC6eb9W', '(011) 5117-3633', '102205'),
( NULL, 'Andres', 'Ruiz', 'AndresRuiz11@gmail.com', '9x4Rvr4g1C', '(011) 3452-1608', '102206'),
(NULL, 'Noelia', 'Alcala', 'NoeAlcala@live.com.ar', '1Ca92fBpAt', '(011) 9911-6576', '102207'),
(NULL, 'Alessandro', 'Urbano', 'AleUrbano12@gmail.com','21e5e4IL0V', '(011) 2354-7780', '102208'),
(NULL, 'Teodora', 'Rosello', 'TeodoraRos1@gmail.com', '3BTlZxl25W', '(011) 4598-0195' , '102209'),
(NULL, 'Andres', 'Ruiz', 'AndresRuiz11@gmail.com', '9x4Rvr4g1C', '(011) 3452-1608', '102210'),
(NULL, 'Alessandro', 'Urbano', 'AleUrbano12@gmail.com','21e5e4IL0V', '(011) 2354-7780', '102211'),
(NULL, 'Aurelio', 'Benitez', 'AurelioBen@gmail.com','4K5tC6eb9W', '(011) 5117-3633', '102212'),
(NULL, 'Noelia', 'Alcala', 'NoeAlcala@live.com.ar', '1Ca92fBpAt', '(011) 9911-6576', '102213'),
(NULL, 'Teodora', 'Rosello', 'TeodoraRos1@gmail.com', '3BTlZxl25W', '(011) 4598-0195' , '102214'),
(NULL, 'Andres', 'Ruiz', 'AndresRuiz11@gmail.com', '9x4Rvr4g1C', '(011) 3452-1608', '102215'),
(NULL, 'Alessandro', 'Urbano', 'AleUrbano12@gmail.com','21e5e4IL0V', '(011) 2354-7780', '102216'),
(NULL, 'Aurelio', 'Benitez', 'AurelioBen@gmail.com','4K5tC6eb9W', '(011) 5117-3633', '102217'),
(NULL, 'Teodora', 'Rosello', 'TeodoraRos1@gmail.com', '3BTlZxl25W', '(011) 4598-0195' , '102218'),
(NULL, 'Alessandro', 'Urbano', 'AleUrbano12@gmail.com','21e5e4IL0V', '(011) 2354-7780', '102219'),
(NULL, 'Noelia', 'Alcala', 'NoeAlcala@live.com.ar', '1Ca92fBpAt', '(011) 9911-6576', '102220'),
(NULL, 'Noelia', 'Alcala', 'NoeAlcala@live.com.ar', '1Ca92fBpAt', '(011) 9911-6576', '102221'),
(NULL, 'Andres', 'Ruiz', 'AndresRuiz11@gmail.com', '9x4Rvr4g1C', '(011) 3452-1608', '102222'),
(NULL, 'Teodora', 'Rosello', 'TeodoraRos1@gmail.com', '3BTlZxl25W', '(011) 4598-0195' , '102223'),
(NULL, 'Aurelio', 'Benitez', 'AurelioBen@gmail.com','4K5tC6eb9W', '(011) 5117-3633', '102224'),
(NULL, 'Alessandro', 'Urbano', 'AleUrbano12@gmail.com','21e5e4IL0V', '(011) 2354-7780', '102225'),
(NULL, 'Alessandro', 'Urbano', 'AleUrbano12@gmail.com','21e5e4IL0V', '(011) 2354-7780', '102226'),
(NULL, 'Andres', 'Ruiz', 'AndresRuiz11@gmail.com', '9x4Rvr4g1C', '(011) 3452-1608', '102227'),
(NULL, 'Noelia', 'Alcala', 'NoeAlcala@live.com.ar', '1Ca92fBpAt', '(011) 9911-6576', '102228'),
(NULL, 'Teodora', 'Rosello', 'TeodoraRos1@gmail.com', '3BTlZxl25W', '(011) 4598-0195' , '102229'),
(NULL, 'Teodora', 'Rosello', 'TeodoraRos1@gmail.com', '3BTlZxl25W', '(011) 4598-0195' , '102230'),
(NULL, 'Noelia', 'Alcala', 'NoeAlcala@live.com.ar', '1Ca92fBpAt', '(011) 9911-6576', '102231')
;

-- --------------- --
-- Insert Empleados --

INSERT INTO EMPLEADOS (id_OTE, nombre, apellido, email, contraseña, telefono, salario, id_OTG, id_D)
VALUES ('0001', 'Teo', 'Marrero', 'TeoMarrero@gmail.com', '8F&1QBwtMH4E', '(011) 5007-4551', '58240.80', '606025','7'),
(NULL, 'Mariano', 'Pachecho', 'MariPacheco12@gmail.com', 'G48SN5eQ6Y', '(011) 7560-1245', '58240.80', '606026', '7'),
(NULL, 'Brian', 'Mateo', 'Brian155@gmail.com', 'd1MFkG4Or4', '(011) 6567-8001', '58240.80','606027', '7'),
(NULL, 'Mia', 'Del Campo', 'MiaCampo10@gamil.com', 'i9w5My7wMg', '(011) 3209-8711','58240.80', '606028', '7'),
(NULL, 'Alfredo', 'Vega', 'AlfredVega100@gmail.com', '992tzwEA8y', '(011) 5517-4218', '58240.80','606029', '7'),
(NULL, 'Mariana', 'Alcaide', 'Marianalca@gmail.com', 'w7YF700JhZ', '(011) 1454-0024', '58240.80','606030', '7'),
(NULL, 'Teo', 'Marrero', 'TeoMarrero@gmail.com', '8F&1QBwtMH4E', '(011) 5007-4551', '58240.80','606031', '7'),
(NULL, 'Brian', 'Mateo', 'Brian155@gmail.com', 'd1MFkG4Or4', '(011) 6567-8001' , '58240.80','606032', '7'),
(NULL, 'Rodrigo', 'Pineiro', 'RodrigoPine@gmail.com', '3Oe25o567V', '(011) 6466-1100', '52900.80', '606033', '4'),
(NULL, 'Viviana', 'Ortiz', 'ViviOrtiz1@gmail.com', 'lu0GV0T4K7', '(011) 1551-7677', '52900.80', '606034', '4'),
(NULL, 'Monica', 'Rodriguez', 'MoniRodriguez@gmail.com', 'Px3r0Zk75h', '(011) 4289-0204', '95400.20', '606035', '6'),
(NULL, 'Andres', 'Mayo', 'Andresito200@gmail.com', '7t3iq63C6k', '(011) 4462-1608', '95400.20', '606036', '6'),
(NULL, 'Mariano', 'Pachecho', 'MariPacheco12@gmail.com', 'G48SN5eQ6Y', '(011) 7560-1245', '58240.80', '606037', '7'),
(NULL, 'Brian', 'Mateo', 'Brian155@gmail.com', 'd1MFkG4Or4', '(011) 6567-8001', '58240.80','606038', '7'),
(NULL, 'Mia', 'Del Campo', 'MiaCampo10@gamil.com', 'i9w5My7wMg', '(011) 3209-8711','58240.80', '606039', '7'),
(NULL, 'Alfredo', 'Vega', 'AlfredVega100@gmail.com', '992tzwEA8y', '(011) 5517-4218', '58240.80','606040', '7'),
(NULL, 'Mariana', 'Alcaide', 'Marianalca@gmail.com', 'w7YF700JhZ', '(011) 1454-0024', '58240.80','606041', '7'),
(NULL, 'Brian', 'Mateo', 'Brian155@gmail.com', 'd1MFkG4Or4', '(011) 6567-8001' , '58240.80','606042', '7'),
(NULL, 'Rodrigo', 'Pineiro', 'RodrigoPine@gmail.com', '3Oe25o567V', '(011) 6466-1100', '52900.80', '606043', '4'),
(NULL, 'Viviana', 'Ortiz', 'ViviOrtiz1@gmail.com', 'lu0GV0T4K7', '(011) 1551-7677', '52900.80', '606044', '4'),
(NULL, 'Monica', 'Rodriguez', 'MoniRodriguez@gmail.com', 'Px3r0Zk75h', '(011) 4289-0204', '95400.20', '606045', '6'),
(NULL, 'Andres', 'Mayo', 'Andresito200@gmail.com', '7t3iq63C6k', '(011) 4462-1608', '95400.20', '606046', '6'),
(NULL, 'Mariano', 'Pachecho', 'MariPacheco12@gmail.com', 'G48SN5eQ6Y', '(011) 7560-1245', '58240.80', '606047', '7'),
(NULL, 'Alfredo', 'Vega', 'AlfredVega100@gmail.com', '992tzwEA8y', '(011) 5517-4218', '58240.80','606048', '7'),
(NULL, 'Mariana', 'Alcaide', 'Marianalca@gmail.com', 'w7YF700JhZ', '(011) 1454-0024', '58240.80','606049', '7'),
(NULL, 'Brian', 'Mateo', 'Brian155@gmail.com', 'd1MFkG4Or4', '(011) 6567-8001', '58240.80','606050', '7'),
(NULL, 'Mia', 'Del Campo', 'MiaCampo10@gamil.com', 'i9w5My7wMg', '(011) 3209-8711','58240.80', '606051', '7')
;


-- ------------------ --
-- INSERT TIPO_PEDIDO --

INSERT INTO Tipo_Pedido (id_TP, Nombre_tipo, Descripcion)
VALUE (NULL, 'Delivery', 'Entregas a domicilio de los productos.'),
(NULL, 'Take-Away', 'Preparar comida en nuestro restaurante, para que el cliente se la lleve.'),
(NULL, 'Local', 'Preparar comida que se consume en el lugar')
;

-- ------------------ --
-- INSERT FACTURACION --

INSERT INTO Facturacion (id_F, Fecha_Hora, Monto, id_OTE, id_C, id_TP)
VALUES ('1050', '2022-07-12 23:55:10', '3500.00', '2', '1', '1'),
(NULL, '2022-07-12 23:44:50', '2250.00', '1', '4', '2'),
(NULL, '2022-07-12 23:56:23', '2400.00', '3', '3', '3'),
(NULL, '2022-07-14 23:58:12', '4100.00', '4', '10', '3'),
(NULL, '2022-07-14 23:39:25', '2400.00', '5', '12', '2'),
(NULL, '2022-07-14 23:49:25', '4000.00', '6', '9', '3'),
(NULL, '2022-07-15 23:52:12', '2400.00', '4', '10', '1'),
(NULL, '2022-07-16 23:32:14', '1950.00', '8', '2', '3'),
(NULL, '2022-07-16 23:40:52', '3200.00', '9', '5', '3'),
(NULL, '2022-07-16 23:48:20', '2400.00', '10', '7', '2'),
(NULL, '2022-07-17 23:52:50', '2400.00', '11', '11', '1'),
(NULL, '2022-07-18 23:58:12', '2250.00', '12', '6', '2'),
(NULL, '2022-07-18 23:35:21', '3200.00', '13', '15', '2'),
(NULL, '2022-07-19 23:44:54', '2100.00', '14', '8', '3'),
(NULL, '2022-07-19 23:31:02', '3100.00', '15', '13', '3')
;


