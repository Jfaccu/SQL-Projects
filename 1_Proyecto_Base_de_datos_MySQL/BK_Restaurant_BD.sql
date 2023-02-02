-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: restaurant_bd
-- ------------------------------------------------------
-- Server version	8.0.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id_C` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) NOT NULL,
  `Apellido` varchar(50) NOT NULL,
  `Direccion` varchar(75) NOT NULL,
  `Email` varchar(100) NOT NULL,
  PRIMARY KEY (`id_C`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Luciano','Espinazola','Arieta 5011','LucianoEspinazola15@gmail.com'),(2,'Ariana','Bianchetti','Ana Maria 2500','ArianaBian150@gmail.com'),(3,'Adriana','Estevez','Autralia 5221','AdriEstevez@gmail.com'),(4,'Ramiro','Silva','Bebilaqua 772','RamiroS10@gmail.com'),(5,'Solana','Fernandez','Champion 1998','SolFernandez@gmail.com'),(6,'Horacio','Burlone','Nazar 1100','Horacio4550@gmail.com'),(7,'Exequiuel','Gomez','Lino Lagos 150','ExequielGomez12@gmail.com'),(8,'Florencia','Quinquel','Derragueira 2140','FlorQuinquel@gmail.com'),(9,'Amaya','Moran','Gral Piran 2700','AmayaMoran1@gmail.com'),(10,'Lina','Barea','Pilcomayo 100','LinaBarea@gmail.com'),(11,'Felipe','Megias','Defensa 1200','FeliMegias@gmail.com'),(12,'Paulina','Vegas','Honduras 1200','PauVegas100@gmail.com'),(13,'Hilario','Cobo','Australia 2000','HilarioCobo10@gmail.com'),(14,'Ariel','Caro','Sarandi 1900','ArielCaro@live.com.ar'),(15,'Maximiliano','Baeza','Guanella 1500','MaxiBaeza@gmail.com');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamentos`
--

DROP TABLE IF EXISTS `departamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamentos` (
  `id_D` int NOT NULL AUTO_INCREMENT,
  `Sector` tinytext NOT NULL,
  `Descripcion` text NOT NULL,
  PRIMARY KEY (`id_D`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamentos`
--

LOCK TABLES `departamentos` WRITE;
/*!40000 ALTER TABLE `departamentos` DISABLE KEYS */;
INSERT INTO `departamentos` VALUES (1,'Camarero de Mesa','Servicio que atiende en las mesas, empleados mas cercanos al cliente.'),(2,'Camarero de Barra','Atencion a los clientes de la barra, es el encargado de tener surtidas las neveras y las bebidas bien refrigeradas.'),(3,'Encargado de Caja','Gestionan todo lo referente a la caja Deben asegurarse de tener suficiente efectivo como para poder devolver el cambio al cliente.'),(4,'Recepcionista','Brindan atencion al personal interno y externo en sus requerimientos de informacion'),(5,'Sumiller','Experto en vino que se encarga, en todos los aspectos, de todo lo relacionado con el vino en un restaurante.'),(6,'Cheff Ejecutivo','Planificar y dirigir la preparación de la comida y actividades culinarias.'),(7,'Cocinero','Encargado de elaborar los alimentos para la venta');
/*!40000 ALTER TABLE `departamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `id_OTE` int NOT NULL AUTO_INCREMENT,
  `Nombre` tinytext NOT NULL,
  `Apellido` tinytext NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Contraseña` varchar(20) NOT NULL,
  `Telefono` varchar(20) NOT NULL,
  `Salario` decimal(10,2) NOT NULL,
  `id_OTG` int NOT NULL,
  `id_D` int NOT NULL,
  PRIMARY KEY (`id_OTE`,`Telefono`),
  KEY `id_OTG` (`id_OTG`),
  KEY `id_D` (`id_D`),
  CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`id_OTG`) REFERENCES `gerentes` (`id_OTG`),
  CONSTRAINT `empleados_ibfk_2` FOREIGN KEY (`id_D`) REFERENCES `departamentos` (`id_D`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (1,'Teo','Marrero','TeoMarrero@gmail.com','8F&1QBwtMH4E','(011) 5007-4551',58240.80,606025,7),(2,'Mariano','Pachecho','MariPacheco12@gmail.com','G48SN5eQ6Y','(011) 7560-1245',58240.80,606026,7),(3,'Brian','Mateo','Brian155@gmail.com','d1MFkG4Or4','(011) 6567-8001',58240.80,606027,7),(4,'Mia','Del Campo','MiaCampo10@gamil.com','i9w5My7wMg','(011) 3209-8711',58240.80,606028,7),(5,'Alfredo','Vega','AlfredVega100@gmail.com','992tzwEA8y','(011) 5517-4218',58240.80,606029,7),(6,'Mariana','Alcaide','Marianalca@gmail.com','w7YF700JhZ','(011) 1454-0024',58240.80,606030,7),(7,'Teo','Marrero','TeoMarrero@gmail.com','8F&1QBwtMH4E','(011) 5007-4551',58240.80,606031,7),(8,'Brian','Mateo','Brian155@gmail.com','d1MFkG4Or4','(011) 6567-8001',58240.80,606032,7),(9,'Rodrigo','Pineiro','RodrigoPine@gmail.com','3Oe25o567V','(011) 6466-1100',52900.80,606033,4),(10,'Viviana','Ortiz','ViviOrtiz1@gmail.com','lu0GV0T4K7','(011) 1551-7677',52900.80,606034,4),(11,'Monica','Rodriguez','MoniRodriguez@gmail.com','Px3r0Zk75h','(011) 4289-0204',95400.20,606035,6),(12,'Andres','Mayo','Andresito200@gmail.com','7t3iq63C6k','(011) 4462-1608',95400.20,606036,6),(13,'Mariano','Pachecho','MariPacheco12@gmail.com','G48SN5eQ6Y','(011) 7560-1245',58240.80,606037,7),(14,'Brian','Mateo','Brian155@gmail.com','d1MFkG4Or4','(011) 6567-8001',58240.80,606038,7),(15,'Mia','Del Campo','MiaCampo10@gamil.com','i9w5My7wMg','(011) 3209-8711',58240.80,606039,7),(16,'Alfredo','Vega','AlfredVega100@gmail.com','992tzwEA8y','(011) 5517-4218',58240.80,606040,7),(17,'Mariana','Alcaide','Marianalca@gmail.com','w7YF700JhZ','(011) 1454-0024',58240.80,606041,7),(18,'Brian','Mateo','Brian155@gmail.com','d1MFkG4Or4','(011) 6567-8001',58240.80,606042,7),(19,'Rodrigo','Pineiro','RodrigoPine@gmail.com','3Oe25o567V','(011) 6466-1100',52900.80,606043,4),(20,'Viviana','Ortiz','ViviOrtiz1@gmail.com','lu0GV0T4K7','(011) 1551-7677',52900.80,606044,4),(21,'Monica','Rodriguez','MoniRodriguez@gmail.com','Px3r0Zk75h','(011) 4289-0204',95400.20,606045,6),(22,'Andres','Mayo','Andresito200@gmail.com','7t3iq63C6k','(011) 4462-1608',95400.20,606046,6),(23,'Mariano','Pachecho','MariPacheco12@gmail.com','G48SN5eQ6Y','(011) 7560-1245',58240.80,606047,7),(24,'Alfredo','Vega','AlfredVega100@gmail.com','992tzwEA8y','(011) 5517-4218',58240.80,606048,7),(25,'Mariana','Alcaide','Marianalca@gmail.com','w7YF700JhZ','(011) 1454-0024',58240.80,606049,7),(26,'Brian','Mateo','Brian155@gmail.com','d1MFkG4Or4','(011) 6567-8001',58240.80,606050,7),(27,'Mia','Del Campo','MiaCampo10@gamil.com','i9w5My7wMg','(011) 3209-8711',58240.80,606051,7);
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facturacion`
--

DROP TABLE IF EXISTS `facturacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facturacion` (
  `id_F` int NOT NULL AUTO_INCREMENT,
  `Fecha_Hora` datetime NOT NULL,
  `Monto` decimal(10,2) NOT NULL,
  `id_OTE` int NOT NULL,
  `id_C` int NOT NULL,
  `id_TP` int NOT NULL,
  PRIMARY KEY (`id_F`),
  KEY `id_OTE` (`id_OTE`),
  KEY `id_TP` (`id_TP`),
  KEY `id_C` (`id_C`),
  CONSTRAINT `facturacion_ibfk_1` FOREIGN KEY (`id_OTE`) REFERENCES `empleados` (`id_OTE`),
  CONSTRAINT `facturacion_ibfk_2` FOREIGN KEY (`id_TP`) REFERENCES `tipo_pedido` (`id_TP`),
  CONSTRAINT `facturacion_ibfk_3` FOREIGN KEY (`id_C`) REFERENCES `clientes` (`id_C`)
) ENGINE=InnoDB AUTO_INCREMENT=1066 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturacion`
--

LOCK TABLES `facturacion` WRITE;
/*!40000 ALTER TABLE `facturacion` DISABLE KEYS */;
INSERT INTO `facturacion` VALUES (1050,'2022-07-12 23:55:10',3500.00,2,1,1),(1051,'2022-07-12 23:44:50',2250.00,1,4,2),(1052,'2022-07-12 23:56:23',2400.00,3,3,3),(1053,'2022-07-14 23:58:12',4100.00,4,10,3),(1054,'2022-07-14 23:39:25',2400.00,5,12,2),(1055,'2022-07-14 23:49:25',4000.00,6,9,3),(1056,'2022-07-15 23:52:12',2400.00,4,10,1),(1057,'2022-07-16 23:32:14',1950.00,8,2,3),(1058,'2022-07-16 23:40:52',3200.00,9,5,3),(1059,'2022-07-16 23:48:20',2400.00,10,7,2),(1060,'2022-07-17 23:52:50',2400.00,11,11,1),(1061,'2022-07-18 23:58:12',2250.00,12,6,2),(1062,'2022-07-18 23:35:21',3200.00,13,15,2),(1063,'2022-07-19 23:44:54',2100.00,14,8,3),(1064,'2022-07-19 23:31:02',3100.00,15,13,3);
/*!40000 ALTER TABLE `facturacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gerentes`
--

DROP TABLE IF EXISTS `gerentes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gerentes` (
  `id_OTG` int NOT NULL AUTO_INCREMENT,
  `Nombre` tinytext NOT NULL,
  `Apellido` tinytext NOT NULL,
  `Email` varchar(75) NOT NULL,
  `Contraseña` varchar(50) NOT NULL,
  `Telefono` varchar(55) NOT NULL,
  `id_O` int NOT NULL,
  PRIMARY KEY (`id_OTG`,`Telefono`),
  KEY `id_O` (`id_O`),
  CONSTRAINT `gerentes_ibfk_1` FOREIGN KEY (`id_O`) REFERENCES `ordenes` (`id_O`)
) ENGINE=InnoDB AUTO_INCREMENT=606053 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gerentes`
--

LOCK TABLES `gerentes` WRITE;
/*!40000 ALTER TABLE `gerentes` DISABLE KEYS */;
INSERT INTO `gerentes` VALUES (606025,'Aurelio','Benitez','AurelioBen@gmail.com','4K5tC6eb9W','(011) 5117-3633',102205),(606026,'Andres','Ruiz','AndresRuiz11@gmail.com','9x4Rvr4g1C','(011) 3452-1608',102206),(606027,'Noelia','Alcala','NoeAlcala@live.com.ar','1Ca92fBpAt','(011) 9911-6576',102207),(606028,'Alessandro','Urbano','AleUrbano12@gmail.com','21e5e4IL0V','(011) 2354-7780',102208),(606029,'Teodora','Rosello','TeodoraRos1@gmail.com','3BTlZxl25W','(011) 4598-0195',102209),(606030,'Andres','Ruiz','AndresRuiz11@gmail.com','9x4Rvr4g1C','(011) 3452-1608',102210),(606031,'Alessandro','Urbano','AleUrbano12@gmail.com','21e5e4IL0V','(011) 2354-7780',102211),(606032,'Aurelio','Benitez','AurelioBen@gmail.com','4K5tC6eb9W','(011) 5117-3633',102212),(606033,'Noelia','Alcala','NoeAlcala@live.com.ar','1Ca92fBpAt','(011) 9911-6576',102213),(606034,'Teodora','Rosello','TeodoraRos1@gmail.com','3BTlZxl25W','(011) 4598-0195',102214),(606035,'Andres','Ruiz','AndresRuiz11@gmail.com','9x4Rvr4g1C','(011) 3452-1608',102215),(606036,'Alessandro','Urbano','AleUrbano12@gmail.com','21e5e4IL0V','(011) 2354-7780',102216),(606037,'Aurelio','Benitez','AurelioBen@gmail.com','4K5tC6eb9W','(011) 5117-3633',102217),(606038,'Teodora','Rosello','TeodoraRos1@gmail.com','3BTlZxl25W','(011) 4598-0195',102218),(606039,'Alessandro','Urbano','AleUrbano12@gmail.com','21e5e4IL0V','(011) 2354-7780',102219),(606040,'Noelia','Alcala','NoeAlcala@live.com.ar','1Ca92fBpAt','(011) 9911-6576',102220),(606041,'Noelia','Alcala','NoeAlcala@live.com.ar','1Ca92fBpAt','(011) 9911-6576',102221),(606042,'Andres','Ruiz','AndresRuiz11@gmail.com','9x4Rvr4g1C','(011) 3452-1608',102222),(606043,'Teodora','Rosello','TeodoraRos1@gmail.com','3BTlZxl25W','(011) 4598-0195',102223),(606044,'Aurelio','Benitez','AurelioBen@gmail.com','4K5tC6eb9W','(011) 5117-3633',102224),(606045,'Alessandro','Urbano','AleUrbano12@gmail.com','21e5e4IL0V','(011) 2354-7780',102225),(606046,'Alessandro','Urbano','AleUrbano12@gmail.com','21e5e4IL0V','(011) 2354-7780',102226),(606047,'Andres','Ruiz','AndresRuiz11@gmail.com','9x4Rvr4g1C','(011) 3452-1608',102227),(606048,'Noelia','Alcala','NoeAlcala@live.com.ar','1Ca92fBpAt','(011) 9911-6576',102228),(606049,'Teodora','Rosello','TeodoraRos1@gmail.com','3BTlZxl25W','(011) 4598-0195',102229),(606050,'Teodora','Rosello','TeodoraRos1@gmail.com','3BTlZxl25W','(011) 4598-0195',102230),(606051,'Noelia','Alcala','NoeAlcala@live.com.ar','1Ca92fBpAt','(011) 9911-6576',102231);
/*!40000 ALTER TABLE `gerentes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_aud_clientes`
--

DROP TABLE IF EXISTS `log_aud_clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_aud_clientes` (
  `Id_Log_C` int NOT NULL AUTO_INCREMENT,
  `Id_C` int DEFAULT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Apellido` varchar(100) NOT NULL,
  `Email` varchar(150) NOT NULL,
  `Nombre_Accion` varchar(100) NOT NULL,
  `Nombre_Tabla` varchar(100) NOT NULL,
  `CamNuevo_CamAnterior` varchar(255) DEFAULT NULL,
  `Usuario` varchar(100) DEFAULT NULL,
  `Date_Upd_Ins` datetime DEFAULT NULL,
  PRIMARY KEY (`Id_Log_C`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_aud_clientes`
--

LOCK TABLES `log_aud_clientes` WRITE;
/*!40000 ALTER TABLE `log_aud_clientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_aud_clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_aud_ordenes`
--

DROP TABLE IF EXISTS `log_aud_ordenes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_aud_ordenes` (
  `Id_Log` int NOT NULL AUTO_INCREMENT,
  `id_C` int NOT NULL,
  `Monto_Total` int DEFAULT NULL,
  `Nombre_Accion` varchar(100) NOT NULL,
  `Nombre_Tabla` varchar(100) NOT NULL,
  `CamNuevo_CamAnterior` varchar(255) DEFAULT NULL,
  `Usuario` varchar(100) DEFAULT NULL,
  `Date_Upd_Ins` date DEFAULT NULL,
  PRIMARY KEY (`Id_Log`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_aud_ordenes`
--

LOCK TABLES `log_aud_ordenes` WRITE;
/*!40000 ALTER TABLE `log_aud_ordenes` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_aud_ordenes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordenes`
--

DROP TABLE IF EXISTS `ordenes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordenes` (
  `id_O` int NOT NULL AUTO_INCREMENT,
  `Fecha_Hora` datetime NOT NULL,
  `Monto_Total` decimal(10,2) NOT NULL,
  `id_C` int NOT NULL,
  `id_P` int NOT NULL,
  PRIMARY KEY (`id_O`),
  KEY `id_C` (`id_C`),
  KEY `id_P` (`id_P`),
  CONSTRAINT `ordenes_ibfk_1` FOREIGN KEY (`id_C`) REFERENCES `clientes` (`id_C`),
  CONSTRAINT `ordenes_ibfk_2` FOREIGN KEY (`id_P`) REFERENCES `productos` (`id_P`)
) ENGINE=InnoDB AUTO_INCREMENT=102233 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordenes`
--

LOCK TABLES `ordenes` WRITE;
/*!40000 ALTER TABLE `ordenes` DISABLE KEYS */;
INSERT INTO `ordenes` VALUES (102205,'2022-07-12 20:36:22',2250.00,4,6),(102206,'2022-07-12 20:56:55',3500.00,1,19),(102207,'2022-07-12 21:01:11',2400.00,3,14),(102208,'2022-07-14 21:06:24',4100.00,10,16),(102209,'2022-07-14 21:12:09',2400.00,12,13),(102210,'2022-07-14 21:20:20',4000.00,9,18),(102211,'2022-07-15 21:25:01',2400.00,10,13),(102212,'2022-07-16 21:32:14',1950.00,2,1),(102213,'2022-07-16 21:40:52',3200.00,5,3),(102214,'2022-07-16 21:48:20',2400.00,7,10),(102215,'2022-07-17 21:52:50',2400.00,11,8),(102216,'2022-07-18 21:58:12',2250.00,6,7),(102217,'2022-07-18 22:05:21',3200.00,15,3),(102218,'2022-07-19 22:14:54',2100.00,8,5),(102219,'2022-07-19 22:21:02',3100.00,13,17),(102220,'2022-07-20 22:26:12',3650.00,14,15),(102221,'2022-07-20 22:29:22',2400.00,4,9),(102222,'2022-07-20 22:35:41',2250.00,6,2),(102223,'2022-07-21 22:42:12',1950.00,12,4),(102224,'2022-07-21 22:48:12',2400.00,3,12),(102225,'2022-07-14 23:01:11',1050.00,9,22),(102226,'2022-07-12 23:09:52',1050.00,1,20),(102227,'2022-07-18 23:13:34',1050.00,15,21),(102228,'2022-07-16 23:19:09',1050.00,7,23),(102229,'2022-07-16 23:22:51',1050.00,5,22),(102230,'2022-07-20 23:30:46',1050.00,14,20),(102231,'2022-07-19 23:39:22',1050.00,8,23);
/*!40000 ALTER TABLE `ordenes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id_P` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) NOT NULL,
  `Precio_Unitario` decimal(10,2) NOT NULL,
  `Descripcion` varchar(150) NOT NULL,
  `Ingredientes` varchar(150) NOT NULL,
  PRIMARY KEY (`id_P`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'Berenjena Parmesano',1950.00,'Berenjenas gratinadas con parmesano y pomodoro','Berenjenas-Parmesano-Tomate-Ajo-Albahaca'),(2,'Burrata con Jamon',2250.00,'Burratas con jamon crudo estilo italiano','Burrata-Jamon Crudo-Nueces-Rucula'),(3,'Camarones a la milanesa',3200.00,'Langostinos empanados, envueltos en mozzarella acompañados con salsa pomodoro y mayonesa de verduras','Langostinos-Muzzarella-Tomate-Mayonesa-Perejil-Ajo'),(4,'Burratina Frita',1950.00,'Burrata pasada en pan y frito, acompañado con salsa de tomate y albahaca','Burrata-Pan Rallado-Tomate-Albahaca'),(5,'Ensalada Cesar',2100.00,'Salsa caesar, lechuga, parmesano, crouton y pollo','Lechuga-Parmesano-Crouton-Pollo-Salsa Cesar'),(6,'Emiliana',2250.00,'Rucula, jamon crudo, cherry, parmesano, aceitunas negras y verdes sobre croutons de focaccia','Rucula-Tomate-Jamon-Aceitunas-Coutons-Espinaca-Nueces'),(7,'Camembert del campo',2250.00,'Rucula, peras, queso camembert gratinado, almendras y vinegreta de mostaza y miel','Rucula-Pera-Queso Camembert-Almendras-Vinagre-Miel'),(8,'Fettuccine a la Bolognesa',2400.00,'Fettuccine con salsa a base de tomate y carne de ternera','Fettuccine-Salsa Tomate-Carne'),(9,'Gnocci de patata a la Bolognesa',2400.00,'Gnocci con salsa a base de tomate y carne de ternera','Gnocci-Salsa Tomate-Carne'),(10,'Lasagna de Verduras',2400.00,'Lasagna de verduras mixtas, calabaza zuchini, berenjenas, papas y mozzarella','Lasagna-Calabaza-Zuchini-Berenjena-Papa-Mozzarella'),(11,'Sorrentinos Gran Caruso',2400.00,'Rellenos de mozzarella y jamon cocido, gratinados con crema, jamon cocido, champignon, ave y pomodoro fresco','Sorrentino-Mozzarella-Jamon-Crema-Champignon-Ave-Salsa Tomate'),(12,'Malfatti de Salsa Rosa con Espinaca',2400.00,'Relleno de espinaca y ricota gratinado con crema, pomodoro y parmesano','Malfatti-Espinaca-Ricota-Queso-Crema-Salsa Tomate-Parmesano'),(13,'Ravioles Verdes de Scarparo',2400.00,'Rellenos de espinaca y ricota, salsa a base de oliva, verdeo, pesto, ajo, tomate seco y pomodoro fresco','Raviol-Espinaca-Ricota-Verdeo-Pesto-Ajo-Tomate-Jamon-Salsa-Tomate-Oliva'),(14,'Ravioles con Champignon',2400.00,'Relleno con carne braseada y salsa a base de hongos de pino, perejil y crema','Raviol-Carne-Champignon-Perejil-Crema-Queso'),(15,'Risotto de Mariscos',3650.00,'Almejas, mejillones, langostinos, vieiras, chipirones y calamares','Arroz-Almejas-Mejillones-Langostinos-Vieiras-Chipirones-Calamares'),(16,'Carne de Res en Rodajas',4100.00,'Acompañado con rucula, grana y cherry','Carne-Rucula-Grana-Cherry-Parmesano'),(17,'Milanesa de Ternera',3100.00,'Milanesa de ternera con salsa de pomodoro y mozzarella fundida. Acompañado con papines','Carne-Salsa Tomate-Muzzarella-Papa'),(18,'Salmon Rosado Grillado',4000.00,'Salmon Rosado a la parrilla, acompañado con papines','Salmon-Manteca-Papa'),(19,'Pollo a la Fiorentina',3500.00,'Pollo a la plancha con salsa de espinacas y crema, acompañado de papines','Pollo-Espinaca-Crema-Manteca-Cebolla-Ajo'),(20,'Flan de Claras',1050.00,'Flan de claras con confitura de naranja, yogur de vainilla, granola y almendras','Claras-Naranja-Yogur-Granola-Almendras'),(21,'Seduccion de Chocolate',1050.00,'Volcan de chocolate con helado de vainilla','Chocolate-Azucar Impalpable-Helado Vainilla'),(22,'Tiramisu',1050.00,'Clasico tiramisu con Mascarpone','Mascarpone-Vainilla-Crema-Cafe-Azucar-Chocolate'),(23,'Panna Cotta a la Maracuya',1050.00,'Panna Cotta con pulpa de maracuya, salsa de frutilla y mango','Crema-Azucar-Queso Crema-Maracuya-Mango-Salsa Frutilla');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_pedido`
--

DROP TABLE IF EXISTS `tipo_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_pedido` (
  `id_TP` int NOT NULL AUTO_INCREMENT,
  `Nombre_Tipo` varchar(20) NOT NULL,
  `Descripcion` varchar(150) NOT NULL,
  PRIMARY KEY (`id_TP`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_pedido`
--

LOCK TABLES `tipo_pedido` WRITE;
/*!40000 ALTER TABLE `tipo_pedido` DISABLE KEYS */;
INSERT INTO `tipo_pedido` VALUES (1,'Delivery','Entregas a domicilio de los productos.'),(2,'Take-Away','Preparar comida en nuestro restaurante, para que el cliente se la lleve.'),(3,'Local','Preparar comida que se consume en el lugar');
/*!40000 ALTER TABLE `tipo_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_cant_compras_client`
--

DROP TABLE IF EXISTS `vw_cant_compras_client`;
/*!50001 DROP VIEW IF EXISTS `vw_cant_compras_client`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_cant_compras_client` AS SELECT 
 1 AS `CLIENTE`,
 1 AS `CANTIDAD_COMPRAS`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_cliente_gasto_total`
--

DROP TABLE IF EXISTS `vw_cliente_gasto_total`;
/*!50001 DROP VIEW IF EXISTS `vw_cliente_gasto_total`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_cliente_gasto_total` AS SELECT 
 1 AS `CLIENTE`,
 1 AS `SUMA_TOTAL`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_empleado_sec`
--

DROP TABLE IF EXISTS `vw_empleado_sec`;
/*!50001 DROP VIEW IF EXISTS `vw_empleado_sec`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_empleado_sec` AS SELECT 
 1 AS `EMPLEADO`,
 1 AS `SECTOR`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_facturacion_dias`
--

DROP TABLE IF EXISTS `vw_facturacion_dias`;
/*!50001 DROP VIEW IF EXISTS `vw_facturacion_dias`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_facturacion_dias` AS SELECT 
 1 AS `FECHA`,
 1 AS `TOTAL_REC`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_recaudacion_tp`
--

DROP TABLE IF EXISTS `vw_recaudacion_tp`;
/*!50001 DROP VIEW IF EXISTS `vw_recaudacion_tp`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_recaudacion_tp` AS SELECT 
 1 AS `TOTAL`,
 1 AS `PEDIDO`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_cant_compras_client`
--

/*!50001 DROP VIEW IF EXISTS `vw_cant_compras_client`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_cant_compras_client` AS select concat(`c`.`Nombre`,' ',`c`.`Apellido`) AS `CLIENTE`,count(`o`.`id_C`) AS `CANTIDAD_COMPRAS` from (`ordenes` `o` left join `clientes` `c` on((`o`.`id_C` = `c`.`id_C`))) group by `o`.`id_C` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_cliente_gasto_total`
--

/*!50001 DROP VIEW IF EXISTS `vw_cliente_gasto_total`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_cliente_gasto_total` AS select concat(`c`.`Nombre`,' ',`c`.`Apellido`) AS `CLIENTE`,sum(`o`.`Monto_Total`) AS `SUMA_TOTAL` from (`ordenes` `o` left join `clientes` `c` on((`o`.`id_C` = `c`.`id_C`))) group by concat(`c`.`Nombre`,' ',`c`.`Apellido`) having (`SUMA_TOTAL` >= 2500) order by `SUMA_TOTAL` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_empleado_sec`
--

/*!50001 DROP VIEW IF EXISTS `vw_empleado_sec`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_empleado_sec` AS select concat(`e`.`Nombre`,' ',`e`.`Apellido`) AS `EMPLEADO`,`d`.`Sector` AS `SECTOR` from (`empleados` `e` join `departamentos` `d` on((`e`.`id_D` = `d`.`id_D`))) group by `EMPLEADO` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_facturacion_dias`
--

/*!50001 DROP VIEW IF EXISTS `vw_facturacion_dias`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_facturacion_dias` AS select date_format(`ordenes`.`Fecha_Hora`,'%y-%m-%d') AS `FECHA`,sum(`ordenes`.`Monto_Total`) AS `TOTAL_REC` from `ordenes` group by `FECHA` order by `FECHA` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_recaudacion_tp`
--

/*!50001 DROP VIEW IF EXISTS `vw_recaudacion_tp`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_recaudacion_tp` AS select sum(`f`.`Monto`) AS `TOTAL`,`tp`.`Nombre_Tipo` AS `PEDIDO` from (`facturacion` `f` left join `tipo_pedido` `tp` on((`f`.`id_TP` = `tp`.`id_TP`))) group by `PEDIDO` order by `TOTAL` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-19 19:22:54
