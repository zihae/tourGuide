CREATE DATABASE  IF NOT EXISTS `tour` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `tour`;
-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: tour
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `chat_content`
--

DROP TABLE IF EXISTS `chat_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat_content` (
  `content_id` int NOT NULL AUTO_INCREMENT,
  `content_room_id` int NOT NULL,
  `contents` varchar(5000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `member_id` int NOT NULL,
  `user_id` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `create_date` datetime NOT NULL,
  `read_count` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`content_id`),
  KEY `FK_room_TO_chat_content_1` (`content_room_id`),
  KEY `FK_member_TO_chat_content_1` (`member_id`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `FK_member_TO_chat_content_1` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`),
  CONSTRAINT `FK_room_TO_chat_content_1` FOREIGN KEY (`content_room_id`) REFERENCES `room` (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_content`
--

LOCK TABLES `chat_content` WRITE;
/*!40000 ALTER TABLE `chat_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `chat_content` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-29 14:44:11
