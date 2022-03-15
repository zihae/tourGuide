-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: tour
-- ------------------------------------------------------
-- Server version	5.7.36-log

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
-- Table structure for table `place`
--

DROP TABLE IF EXISTS `place`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `place` (
  `sno` int(11) NOT NULL,
  `main_id` int(11) NOT NULL,
  `name` varchar(60) CHARACTER SET latin1 NOT NULL,
  `overview` varchar(4000) CHARACTER SET latin1 DEFAULT NULL,
  `tel` varchar(13) CHARACTER SET latin1 NOT NULL,
  `img` varchar(80) CHARACTER SET latin1 DEFAULT NULL,
  `homepage` varchar(80) CHARACTER SET latin1 DEFAULT NULL,
  `address1` varchar(80) CHARACTER SET latin1 NOT NULL,
  `address2` varchar(80) CHARACTER SET latin1 NOT NULL,
  `bus` varchar(4000) CHARACTER SET latin1 DEFAULT NULL,
  `localPub` varchar(4000) CHARACTER SET latin1 DEFAULT NULL,
  `train` varchar(4000) CHARACTER SET latin1 DEFAULT NULL,
  `openTime` int(11) DEFAULT NULL,
  `closeTime` int(11) DEFAULT NULL,
  `detail` varchar(4000) CHARACTER SET latin1 DEFAULT NULL,
  `area` int(11) NOT NULL,
  `sub_id` int(11) NOT NULL,
  PRIMARY KEY (`sno`,`main_id`),
  KEY `area` (`area`),
  KEY `sub_id` (`sub_id`),
  KEY `place_type_idx` (`main_id`),
  CONSTRAINT `area` FOREIGN KEY (`area`) REFERENCES `city` (`city_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `place_type` FOREIGN KEY (`main_id`) REFERENCES `main_category` (`main_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `sub_id` FOREIGN KEY (`sub_id`) REFERENCES `sub_category` (`sub_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `place`
--

LOCK TABLES `place` WRITE;
/*!40000 ALTER TABLE `place` DISABLE KEYS */;
/*!40000 ALTER TABLE `place` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-15 11:29:00
