CREATE DATABASE  IF NOT EXISTS `lab8` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `lab8`;
-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: lab8
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `clase`
--

DROP TABLE IF EXISTS `clase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clase` (
  `idClase` int NOT NULL,
  `NombreClase` varchar(45) NOT NULL,
  PRIMARY KEY (`idClase`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clase`
--

LOCK TABLES `clase` WRITE;
/*!40000 ALTER TABLE `clase` DISABLE KEYS */;
INSERT INTO `clase` VALUES (1,'Dragon'),(2,'Fantasma'),(3,'Demonio'),(4,'Pez'),(5,'Humano'),(6,'Bestia'),(7,'Ave'),(8,'Otros');
/*!40000 ALTER TABLE `clase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clase_has_elementos`
--

DROP TABLE IF EXISTS `clase_has_elementos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clase_has_elementos` (
  `Clase_idClase` int NOT NULL,
  `Elementos_idElementos` int NOT NULL,
  `daño` float DEFAULT NULL,
  PRIMARY KEY (`Clase_idClase`,`Elementos_idElementos`),
  KEY `fk_Clase_has_Elementos_Elementos1_idx` (`Elementos_idElementos`),
  KEY `fk_Clase_has_Elementos_Clase1_idx` (`Clase_idClase`) /*!80000 INVISIBLE */,
  CONSTRAINT `fk_Clase_has_Elementos_Clase1` FOREIGN KEY (`Clase_idClase`) REFERENCES `clase` (`idClase`),
  CONSTRAINT `fk_Clase_has_Elementos_Elementos1` FOREIGN KEY (`Elementos_idElementos`) REFERENCES `elementos` (`idElementos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clase_has_elementos`
--

LOCK TABLES `clase_has_elementos` WRITE;
/*!40000 ALTER TABLE `clase_has_elementos` DISABLE KEYS */;
INSERT INTO `clase_has_elementos` VALUES (1,1,0.5),(1,2,0.8),(1,3,1.5),(1,4,1.2),(1,5,1),(2,1,NULL),(2,2,0.6),(2,3,0.7),(2,4,0.9),(2,5,0.5),(3,1,0.5),(3,2,0.8),(3,3,1.6),(3,4,1.2),(3,5,1),(4,1,2),(4,2,2),(4,3,0.1),(4,4,0.6),(4,5,1.1),(5,1,1.6),(5,2,1),(5,3,0.9),(5,4,0.8),(5,5,0.6),(6,1,1.1),(6,2,0.8),(6,3,1.3),(6,4,1.3),(6,5,0.7),(7,1,1.7),(7,2,NULL),(7,3,0.7),(7,4,0.8),(7,5,1.6),(8,1,1),(8,2,1),(8,3,1),(8,4,1),(8,5,NULL);
/*!40000 ALTER TABLE `clase_has_elementos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elementos`
--

DROP TABLE IF EXISTS `elementos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elementos` (
  `idElementos` int NOT NULL,
  `NombreElemento` varchar(45) NOT NULL,
  PRIMARY KEY (`idElementos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elementos`
--

LOCK TABLES `elementos` WRITE;
/*!40000 ALTER TABLE `elementos` DISABLE KEYS */;
INSERT INTO `elementos` VALUES (1,'Fuego'),(2,'Tierra'),(3,'Agua'),(4,'Viento'),(5,'Void');
/*!40000 ALTER TABLE `elementos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enemigos`
--

DROP TABLE IF EXISTS `enemigos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enemigos` (
  `idVillanos` int NOT NULL AUTO_INCREMENT,
  `Nombre` text NOT NULL,
  `Ataque` int NOT NULL,
  `Experiencia` int NOT NULL,
  `Objeto` text NOT NULL,
  `ProbabilidadObjeto` float NOT NULL,
  `Genero` varchar(1) DEFAULT NULL,
  `Clase_idClase` int NOT NULL,
  PRIMARY KEY (`idVillanos`),
  KEY `fk_Enemigos_Clase1_idx` (`Clase_idClase`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enemigos`
--

LOCK TABLES `enemigos` WRITE;
/*!40000 ALTER TABLE `enemigos` DISABLE KEYS */;
INSERT INTO `enemigos` VALUES (1,'Forond',3504,23,'Locion',58.9,'M',5),(2,'Gemma',4567,12,'Campana',79.8,'O',4),(3,'Dyana',2345,20,'Locion',65.7,'F',6),(4,'Melt',4563,16,'Pistola',70.9,'',5),(5,'Lizy',2132,21,'Piedra',63.4,'',8),(6,'Tolr',1245,19,'Bomba',67.9,'M',1),(7,'Emilt',2789,11,'Piedra',80.5,'M',2),(8,'Antoe',1674,5,'Espada',99.4,'O',5),(9,'Kya',3543,13,'Pistola',85.6,'F',3),(10,'Olti',2435,14,'Llave',82.4,'',7);
/*!40000 ALTER TABLE `enemigos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hechizos`
--

DROP TABLE IF EXISTS `hechizos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hechizos` (
  `idHechizos` int NOT NULL AUTO_INCREMENT,
  `NombreHechizos` varchar(15) NOT NULL,
  `Potencia` int NOT NULL,
  `accurate` int NOT NULL,
  `NivelAprendizaje` int DEFAULT NULL,
  `Heroes_idHeroes` int DEFAULT NULL,
  `Elementos_idElementos` int NOT NULL,
  `idHechizoBase` int DEFAULT NULL,
  PRIMARY KEY (`idHechizos`),
  KEY `fk_Hechizos_Heroes_idx` (`Heroes_idHeroes`),
  KEY `fk_Hechizos_Elementos1_idx` (`Elementos_idElementos`),
  KEY `fk_Hechizos_Hechizos1_idx` (`idHechizoBase`),
  CONSTRAINT `fk_Hechizos_Elementos1` FOREIGN KEY (`Elementos_idElementos`) REFERENCES `elementos` (`idElementos`),
  CONSTRAINT `fk_Hechizos_Hechizos1` FOREIGN KEY (`idHechizoBase`) REFERENCES `hechizos` (`idHechizos`),
  CONSTRAINT `fk_Hechizos_Heroes` FOREIGN KEY (`Heroes_idHeroes`) REFERENCES `heroes` (`idHeroes`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hechizos`
--

LOCK TABLES `hechizos` WRITE;
/*!40000 ALTER TABLE `hechizos` DISABLE KEYS */;
INSERT INTO `hechizos` VALUES (1,'Infierno',56,34,6,1,1,NULL),(2,'Combustion',47,56,4,6,1,1),(3,'Tornado',34,45,5,3,4,NULL),(4,'Maremoto',78,70,9,2,3,NULL),(5,'Huayco',80,65,7,1,2,NULL),(6,'Torbellino',45,34,9,6,4,3),(7,'Magia',40,67,3,4,5,NULL),(8,'Huracan',75,46,10,5,4,3),(9,'Tsunami',88,89,2,2,3,4),(10,'Terremoto',54,36,1,5,2,5);
/*!40000 ALTER TABLE `hechizos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `heroes`
--

DROP TABLE IF EXISTS `heroes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `heroes` (
  `idHeroes` int NOT NULL AUTO_INCREMENT,
  `Edad` int NOT NULL,
  `Nombre` varchar(10) NOT NULL,
  `Genero` varchar(1) NOT NULL,
  `Nivel` int NOT NULL,
  `Ataque` int NOT NULL,
  `Clase` varchar(50) NOT NULL,
  `idPareja` int DEFAULT NULL,
  `ExperienciaInicial` float NOT NULL,
  PRIMARY KEY (`idHeroes`),
  UNIQUE KEY `idHeroes_UNIQUE` (`idHeroes`),
  KEY `fk_Heroes_Heroes1_idx` (`idPareja`),
  CONSTRAINT `fk_Heroes_Heroes1` FOREIGN KEY (`idPareja`) REFERENCES `heroes` (`idHeroes`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `heroes`
--

LOCK TABLES `heroes` WRITE;
/*!40000 ALTER TABLE `heroes` DISABLE KEYS */;
INSERT INTO `heroes` VALUES (1,25,'Mold','M',27,4897,'Semidios',5,40.5),(2,30,'Erde','F',24,3890,'Semidiosa',4,30.2),(3,27,'Noctus','M',19,3560,'Soldado',6,12.9),(4,24,'Ravus','O',11,3717,'Mosquetero',2,27.9),(5,23,'Yuna','F',20,2033,'Invocadora',1,22.3),(6,25,'Cindy','F',23,3845,'Valquiria',3,15.8),(7,19,'Karl','O',25,4678,'Titan',NULL,12.9);
/*!40000 ALTER TABLE `heroes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `objetos`
--

DROP TABLE IF EXISTS `objetos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `objetos` (
  `idObjetos` int NOT NULL AUTO_INCREMENT,
  `Peso` float NOT NULL,
  `NombreObjeto` varchar(45) NOT NULL,
  `Efecto` text NOT NULL,
  `Usado` tinyint DEFAULT NULL,
  PRIMARY KEY (`idObjetos`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COMMENT='bjetos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `objetos`
--

LOCK TABLES `objetos` WRITE;
/*!40000 ALTER TABLE `objetos` DISABLE KEYS */;
INSERT INTO `objetos` VALUES (1,12,'Piedra','Espantar al enemigo',1),(2,1.2,'Pocion','Recuperar salud',0),(3,3.4,'Llave mistica','Abre puertas para obtener beneficios',1),(4,7,'Campana','Avisar a los heroes sobre un enemigo cerca',1),(5,6.8,'Nave','Pasar obstaculos sin preocupacion',1),(6,9.6,'Escalera','Subir muros muy altos',0),(7,15,'Pistola','Matar al enemigo',0),(8,2.4,'Bomba','Espantar al enemigo',1),(9,5.78,'Escudo','Protegerse del enemigo',0),(10,6.8,'Espada','Danio al oponente',1);
/*!40000 ALTER TABLE `objetos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `objetos_has_heroes`
--

DROP TABLE IF EXISTS `objetos_has_heroes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `objetos_has_heroes` (
  `Objetos_idObjetos` int NOT NULL,
  `Heroes_idHeroes` int NOT NULL,
  `Cantidad` int DEFAULT NULL,
  PRIMARY KEY (`Objetos_idObjetos`,`Heroes_idHeroes`),
  KEY `fk_Objetos_has_Heroes_Heroes1_idx` (`Heroes_idHeroes`),
  KEY `fk_Objetos_has_Heroes_Objetos1_idx` (`Objetos_idObjetos`),
  CONSTRAINT `fk_Objetos_has_Heroes_Heroes1` FOREIGN KEY (`Heroes_idHeroes`) REFERENCES `heroes` (`idHeroes`),
  CONSTRAINT `fk_Objetos_has_Heroes_Objetos1` FOREIGN KEY (`Objetos_idObjetos`) REFERENCES `objetos` (`idObjetos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `objetos_has_heroes`
--

LOCK TABLES `objetos_has_heroes` WRITE;
/*!40000 ALTER TABLE `objetos_has_heroes` DISABLE KEYS */;
INSERT INTO `objetos_has_heroes` VALUES (1,3,22),(1,5,10),(2,2,2),(3,4,5),(3,6,5),(4,1,18),(5,5,8),(5,6,12),(6,2,2),(6,3,9),(7,3,4),(8,5,6),(9,1,1),(9,6,5),(10,2,7),(10,4,3);
/*!40000 ALTER TABLE `objetos_has_heroes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-09  4:57:08