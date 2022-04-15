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
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `course_id` int NOT NULL AUTO_INCREMENT,
  `course_title` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `course_write_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `duration` varchar(45) NOT NULL,
  `course_writer_id` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `option` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `course_mate` varchar(60) DEFAULT NULL,
  `recruit` varchar(10) DEFAULT 'N',
  `del` varchar(10) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`course_id`),
  KEY `FK_writer_id_idx` (`course_writer_id`),
  CONSTRAINT `FK_writer_id` FOREIGN KEY (`course_writer_id`) REFERENCES `member` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,'d','2022-04-14 12:07:27','2022-04-14 ~ 2022-04-14','qwe1','전체공개',NULL,'Y','N'),(2,'t','2022-04-14 12:31:58','2022-04-14 ~ 2022-04-16','qwe1','전체공개',NULL,'Y','N'),(3,'y','2022-04-14 12:38:10','2022-04-14 ~ 2022-04-14','qwe1','전체공개',NULL,'N','N'),(4,'q','2022-04-14 12:38:58','2022-04-14 ~ 2022-04-15','qwe1','전체공개',NULL,'N','N'),(5,'','2022-04-14 13:03:36','2022-04-14 ~ 2022-04-14','qwe1','전체공개',NULL,'N','N'),(6,'f','2022-04-14 13:06:07','2022-04-14 ~ 2022-04-14','qwe1','전체공개',NULL,'N','N'),(7,'f','2022-04-14 15:17:41','2022-04-14 ~ 2022-04-14','qwe1','전체공개',NULL,'Y','N'),(8,'date test','2022-04-14 16:20:00','2022-04-14 ~ 2022-04-16','qwe1','전체공개',NULL,'Y','N'),(9,'alert test','2022-04-14 17:14:29','2022-04-14 ~ 2022-04-16','qwe1','전체공개',NULL,'N','N'),(10,'d','2022-04-14 17:15:28','2022-04-14 ~ 2022-04-14','qwe1','전체공개',NULL,'N','N'),(11,'ggggg','2022-04-14 17:17:15','2022-04-14 ~ 2022-04-14','qwe1','전체공개',NULL,'N','N'),(12,'test1','2022-04-14 17:36:56','2022-04-14 ~ 2022-04-14','hana1','전체공개',NULL,'N','N'),(13,'t2','2022-04-14 17:37:45','2022-04-14 ~ 2022-04-14','hana1','비공개',NULL,'Y','N'),(14,'t','2022-04-15 12:55:19','2022-04-15 ~ 2022-04-15','qwe1','전체공개',NULL,'N','N'),(15,'','2022-04-15 12:56:38','2022-04-15 ~ 2022-04-15','hana1','전체공개',NULL,'N','N'),(16,'alert t','2022-04-15 13:01:30','2022-04-15 ~ 2022-04-15','hana1','전체공개',NULL,'N','N');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-15 13:08:33
