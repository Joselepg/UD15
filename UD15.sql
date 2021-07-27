-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: 192.168.1.159    Database: UD15Ejercicio1
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Current Database: `UD15Ejercicio1`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `UD15Ejercicio1` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `UD15Ejercicio1`;

--
-- Table structure for table `despachos`
--

DROP TABLE IF EXISTS `despachos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `despachos` (
  `numero` int NOT NULL,
  `capacidad` int DEFAULT NULL,
  PRIMARY KEY (`numero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `despachos`
--

LOCK TABLES `despachos` WRITE;
/*!40000 ALTER TABLE `despachos` DISABLE KEYS */;
INSERT INTO `despachos` VALUES (3,21),(4,78),(7,15),(8,69),(9,21),(12,59),(15,69),(72,59),(84,15),(90,46);
/*!40000 ALTER TABLE `despachos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directores`
--

DROP TABLE IF EXISTS `directores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directores` (
  `dni` varchar(8) NOT NULL,
  `nomapels` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `dnijefe` varchar(8) DEFAULT NULL,
  `despacho` int DEFAULT NULL,
  PRIMARY KEY (`dni`),
  KEY `dnijefe` (`dnijefe`),
  KEY `despacho` (`despacho`),
  CONSTRAINT `directores_ibfk_1` FOREIGN KEY (`dnijefe`) REFERENCES `directores` (`dni`),
  CONSTRAINT `directores_ibfk_2` FOREIGN KEY (`despacho`) REFERENCES `despachos` (`numero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directores`
--

LOCK TABLES `directores` WRITE;
/*!40000 ALTER TABLE `directores` DISABLE KEYS */;
INSERT INTO `directores` VALUES ('5932115A','nomapels',NULL,4),('5932115B','nomapels',NULL,4),('5932115C','nomapels','5932115A',4),('5932115D','nomapels','5932115B',3),('5932115H','nomapels',NULL,90),('5932115L','nomapels',NULL,90),('5932115Ñ','nomapels','5932115A',90),('5932115O','nomapels','5932115B',3),('5932115P','nomapels','5932115B',3);
/*!40000 ALTER TABLE `directores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'UD15Ejercicio1'
--

--
-- Current Database: `UD15Ejercicio3`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `UD15Ejercicio3` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `UD15Ejercicio3`;

--
-- Table structure for table `asignado_a`
--

DROP TABLE IF EXISTS `asignado_a`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asignado_a` (
  `proyecto` char(4) NOT NULL,
  `cientifico` varchar(8) NOT NULL,
  PRIMARY KEY (`proyecto`,`cientifico`),
  KEY `cientifico` (`cientifico`),
  CONSTRAINT `asignado_a_ibfk_1` FOREIGN KEY (`proyecto`) REFERENCES `proyecto` (`id`),
  CONSTRAINT `asignado_a_ibfk_2` FOREIGN KEY (`cientifico`) REFERENCES `cientificos` (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asignado_a`
--

LOCK TABLES `asignado_a` WRITE;
/*!40000 ALTER TABLE `asignado_a` DISABLE KEYS */;
INSERT INTO `asignado_a` VALUES ('AB02','2456987A'),('AB01','2456987H'),('AB03','2456987R'),('AB05','2456987W');
/*!40000 ALTER TABLE `asignado_a` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cientificos`
--

DROP TABLE IF EXISTS `cientificos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cientificos` (
  `dni` varchar(8) NOT NULL,
  `nomapels` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cientificos`
--

LOCK TABLES `cientificos` WRITE;
/*!40000 ALTER TABLE `cientificos` DISABLE KEYS */;
INSERT INTO `cientificos` VALUES ('2456987A','Paquito'),('2456987H','Paquito2'),('2456987R','Paquito4'),('2456987W','Paquito3');
/*!40000 ALTER TABLE `cientificos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proyecto`
--

DROP TABLE IF EXISTS `proyecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proyecto` (
  `id` char(4) NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `horas` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyecto`
--

LOCK TABLES `proyecto` WRITE;
/*!40000 ALTER TABLE `proyecto` DISABLE KEYS */;
INSERT INTO `proyecto` VALUES ('AB01','Proyecto',12),('AB02','Proyecto2',16),('AB03','Proyecto3',49),('AB05','Proyecto7',31),('AB07','Proyecto9',24);
/*!40000 ALTER TABLE `proyecto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'UD15Ejercicio3'
--

--
-- Current Database: `UD15Ejercicio4`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `UD15Ejercicio4` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `UD15Ejercicio4`;

--
-- Table structure for table `cajeros`
--

DROP TABLE IF EXISTS `cajeros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cajeros` (
  `codigo` int NOT NULL AUTO_INCREMENT,
  `nomaples` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cajeros`
--

LOCK TABLES `cajeros` WRITE;
/*!40000 ALTER TABLE `cajeros` DISABLE KEYS */;
INSERT INTO `cajeros` VALUES (1,'cajeros'),(2,'cajeros2'),(3,'cajeros3'),(4,'cajero4'),(5,'cajeros5');
/*!40000 ALTER TABLE `cajeros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maquinas_registradoras`
--

DROP TABLE IF EXISTS `maquinas_registradoras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `maquinas_registradoras` (
  `codigo` int NOT NULL AUTO_INCREMENT,
  `piso` int DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maquinas_registradoras`
--

LOCK TABLES `maquinas_registradoras` WRITE;
/*!40000 ALTER TABLE `maquinas_registradoras` DISABLE KEYS */;
INSERT INTO `maquinas_registradoras` VALUES (1,16),(2,95),(3,46),(4,28),(5,12);
/*!40000 ALTER TABLE `maquinas_registradoras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `codigo` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `precio` int DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'producto',12),(2,'producto2',11),(3,'producto3',19),(4,'product4',14),(5,'producto5',17);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta`
--

DROP TABLE IF EXISTS `venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venta` (
  `cajero` int NOT NULL,
  `maquina` int NOT NULL,
  `producto` int NOT NULL,
  PRIMARY KEY (`cajero`,`maquina`,`producto`),
  KEY `producto` (`producto`),
  KEY `maquina` (`maquina`),
  CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`cajero`) REFERENCES `cajeros` (`codigo`),
  CONSTRAINT `venta_ibfk_2` FOREIGN KEY (`producto`) REFERENCES `productos` (`codigo`),
  CONSTRAINT `venta_ibfk_3` FOREIGN KEY (`maquina`) REFERENCES `maquinas_registradoras` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta`
--

LOCK TABLES `venta` WRITE;
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
INSERT INTO `venta` VALUES (3,4,1),(5,3,1),(1,5,3),(2,1,4);
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'UD15Ejercicio4'
--

--
-- Current Database: `UD15Ejercicio2`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `UD15Ejercicio2` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `UD15Ejercicio2`;

--
-- Table structure for table `piezas`
--

DROP TABLE IF EXISTS `piezas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `piezas` (
  `codigo` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piezas`
--

LOCK TABLES `piezas` WRITE;
/*!40000 ALTER TABLE `piezas` DISABLE KEYS */;
INSERT INTO `piezas` VALUES (1,'pieza1'),(2,'pieza2'),(3,'pieza3'),(5,'pieza5'),(6,'pieza6'),(7,'pieza7'),(8,'pieza8'),(9,'pieza9'),(10,'pieza10');
/*!40000 ALTER TABLE `piezas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `id` char(4) NOT NULL,
  `nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES ('AB01','proveedor1'),('AB02','proveedor2'),('AB03','proveedor3'),('AB04','proveedor4'),('AB05','proveedor5'),('AB06','proveedor6'),('AB07','proveedor7'),('AB08','proveedor8'),('AB09','proveedor9'),('AB10','proveedor10');
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suministra`
--

DROP TABLE IF EXISTS `suministra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suministra` (
  `precio` int DEFAULT NULL,
  `codigopieza` int NOT NULL,
  `idproveedor` char(4) NOT NULL,
  PRIMARY KEY (`codigopieza`,`idproveedor`),
  KEY `idproveedor` (`idproveedor`),
  CONSTRAINT `suministra_ibfk_1` FOREIGN KEY (`codigopieza`) REFERENCES `piezas` (`codigo`),
  CONSTRAINT `suministra_ibfk_2` FOREIGN KEY (`idproveedor`) REFERENCES `proveedores` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suministra`
--

LOCK TABLES `suministra` WRITE;
/*!40000 ALTER TABLE `suministra` DISABLE KEYS */;
INSERT INTO `suministra` VALUES (12,1,'AB09'),(12,2,'AB04'),(12,3,'AB07'),(19,5,'AB05'),(19,5,'AB07'),(12,6,'AB02'),(12,7,'AB06'),(12,8,'AB08'),(12,9,'AB10'),(12,10,'AB04');
/*!40000 ALTER TABLE `suministra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'UD15Ejercicio2'
--

--
-- Current Database: `UD15Ejercicio5`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `UD15Ejercicio5` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `UD15Ejercicio5`;

--
-- Table structure for table `equipos`
--

DROP TABLE IF EXISTS `equipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipos` (
  `numserie` char(4) NOT NULL,
  `nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `facultad` int DEFAULT NULL,
  PRIMARY KEY (`numserie`),
  KEY `facultad` (`facultad`),
  CONSTRAINT `equipos_ibfk_1` FOREIGN KEY (`facultad`) REFERENCES `facultad` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipos`
--

LOCK TABLES `equipos` WRITE;
/*!40000 ALTER TABLE `equipos` DISABLE KEYS */;
INSERT INTO `equipos` VALUES ('SI01','equipo',2),('SI02','equipo2',3),('SI03','equipo3',3),('SI04','equipo4',4),('SI05','equipo5',1);
/*!40000 ALTER TABLE `equipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facultad`
--

DROP TABLE IF EXISTS `facultad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facultad` (
  `codigo` int NOT NULL,
  `nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facultad`
--

LOCK TABLES `facultad` WRITE;
/*!40000 ALTER TABLE `facultad` DISABLE KEYS */;
INSERT INTO `facultad` VALUES (1,'facultad'),(2,'facultad2'),(3,'facultad3'),(4,'facultad4'),(5,'facultad5');
/*!40000 ALTER TABLE `facultad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `investigadores`
--

DROP TABLE IF EXISTS `investigadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `investigadores` (
  `dni` varchar(8) NOT NULL,
  `nombreapels` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `facultad` int DEFAULT NULL,
  PRIMARY KEY (`dni`),
  KEY `facultad` (`facultad`),
  CONSTRAINT `investigadores_ibfk_1` FOREIGN KEY (`facultad`) REFERENCES `facultad` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `investigadores`
--

LOCK TABLES `investigadores` WRITE;
/*!40000 ALTER TABLE `investigadores` DISABLE KEYS */;
INSERT INTO `investigadores` VALUES ('4561931A','investigador',2),('4561931C','investigador2',3),('4561931H','investigador4',1),('4561931V','investigador3',2),('4561931X','investigador5',5);
/*!40000 ALTER TABLE `investigadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserva`
--

DROP TABLE IF EXISTS `reserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reserva` (
  `comienzo` datetime DEFAULT NULL,
  `fin` datetime DEFAULT NULL,
  `facultad` int DEFAULT NULL,
  `dni` varchar(8) NOT NULL,
  `numserie` char(4) NOT NULL,
  PRIMARY KEY (`dni`,`numserie`),
  KEY `numserie` (`numserie`),
  CONSTRAINT `reserva_ibfk_1` FOREIGN KEY (`numserie`) REFERENCES `equipos` (`numserie`),
  CONSTRAINT `reserva_ibfk_2` FOREIGN KEY (`dni`) REFERENCES `investigadores` (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserva`
--

LOCK TABLES `reserva` WRITE;
/*!40000 ALTER TABLE `reserva` DISABLE KEYS */;
INSERT INTO `reserva` VALUES ('2021-01-01 00:00:00','2021-03-06 00:00:00',NULL,'4561931A','SI01'),('2021-03-01 00:00:00','2021-03-06 00:00:00',NULL,'4561931A','SI02'),('2021-03-01 00:00:00','2021-03-06 00:00:00',NULL,'4561931H','SI02'),('2021-03-01 00:00:00','2021-03-06 00:00:00',NULL,'4561931V','SI04');
/*!40000 ALTER TABLE `reserva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'UD15Ejercicio5'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-27 13:51:17
