CREATE DATABASE  IF NOT EXISTS `redsocial` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `redsocial`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: redsocial
-- ------------------------------------------------------
-- Server version	5.6.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `alumno`
--

DROP TABLE IF EXISTS `alumno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alumno` (
  `idalumno` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `dni` varchar(45) DEFAULT NULL,
  `correo` varchar(45) DEFAULT NULL,
  `fechaNacimiento` date DEFAULT NULL,
  PRIMARY KEY (`idalumno`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumno`
--

LOCK TABLES `alumno` WRITE;
/*!40000 ALTER TABLE `alumno` DISABLE KEYS */;
INSERT INTO `alumno` VALUES (1,'Jorge','40228588','jorgejacinto@gmail.com','1995-10-02');
/*!40000 ALTER TABLE `alumno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria` (
  `idcategoria` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idcategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Vip'),(2,'Premium'),(3,'Super Vip'),(4,'Platinium');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `idcliente` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `dni` varchar(45) DEFAULT NULL,
  `fechaNacimiento` date DEFAULT NULL,
  `idcategoria` int(11) DEFAULT NULL,
  PRIMARY KEY (`idcliente`),
  KEY `fkcategoria_idx` (`idcategoria`),
  CONSTRAINT `fkcategoria` FOREIGN KEY (`idcategoria`) REFERENCES `categoria` (`idcategoria`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Luis','87548754','2020-06-18',1),(2,'Luis','87548754','2020-07-10',3);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concurso`
--

DROP TABLE IF EXISTS `concurso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concurso` (
  `idconcurso` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `fechaInicio` date DEFAULT NULL,
  `fechaFin` date DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idconcurso`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concurso`
--

LOCK TABLES `concurso` WRITE;
/*!40000 ALTER TABLE `concurso` DISABLE KEYS */;
INSERT INTO `concurso` VALUES (1,'Concurso 207_2','2010-10-10','2016-10-10','Activo'),(2,'Concurso 207_2','2011-10-10','2018-10-10','Inactivo'),(3,'Sede Norte','2010-10-13','2016-10-12','Activo'),(4,'Sede Miraflores','2010-10-10','2016-10-10','Activo');
/*!40000 ALTER TABLE `concurso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deporte`
--

DROP TABLE IF EXISTS `deporte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deporte` (
  `iddeporte` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`iddeporte`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deporte`
--

LOCK TABLES `deporte` WRITE;
/*!40000 ALTER TABLE `deporte` DISABLE KEYS */;
INSERT INTO `deporte` VALUES (1,'Futbol'),(2,'Voley'),(3,'Pinpong');
/*!40000 ALTER TABLE `deporte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicamento`
--

DROP TABLE IF EXISTS `medicamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medicamento` (
  `idmedicamento` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` text,
  `precio` double DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `laboratorio` text,
  PRIMARY KEY (`idmedicamento`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicamento`
--

LOCK TABLES `medicamento` WRITE;
/*!40000 ALTER TABLE `medicamento` DISABLE KEYS */;
INSERT INTO `medicamento` VALUES (1,'Altalgina',2,500,'Bayer'),(2,'Antobiotico',5,300,'Bayer'),(3,'Vics',1,100,'Abbott'),(4,'Pastilla azul',10,1000,'Bayer');
/*!40000 ALTER TABLE `medicamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modalidad`
--

DROP TABLE IF EXISTS `modalidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modalidad` (
  `idmodalidad` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `numHombres` varchar(45) DEFAULT NULL,
  `numMujeres` varchar(45) DEFAULT NULL,
  `edadMaxima` varchar(45) DEFAULT NULL,
  `edadMinima` varchar(45) DEFAULT NULL,
  `idDeporte` int(11) DEFAULT NULL,
  PRIMARY KEY (`idmodalidad`),
  KEY `fk_deporte_idx` (`idDeporte`),
  CONSTRAINT `fk_deporte` FOREIGN KEY (`idDeporte`) REFERENCES `deporte` (`iddeporte`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modalidad`
--

LOCK TABLES `modalidad` WRITE;
/*!40000 ALTER TABLE `modalidad` DISABLE KEYS */;
INSERT INTO `modalidad` VALUES (1,'Mixto futbol','3','3','30','22',1),(2,'Mixto Voley','3','3','30','20',2);
/*!40000 ALTER TABLE `modalidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'redsocial'
--

--
-- Dumping routines for database 'redsocial'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-18 22:07:06
