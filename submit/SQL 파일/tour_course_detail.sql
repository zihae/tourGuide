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
-- Table structure for table `course_detail`
--

DROP TABLE IF EXISTS `course_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_detail` (
  `course_detail_date` int NOT NULL,
  `cd_course_id` int NOT NULL,
  `name` varchar(60) NOT NULL,
  `course_order` int NOT NULL,
  `cd_place_id` int NOT NULL,
  PRIMARY KEY (`course_detail_date`,`cd_course_id`,`course_order`),
  KEY `FK_course_TO_course_detail_1` (`cd_course_id`),
  KEY `FK_place_TO_course_detail_idx` (`cd_place_id`),
  CONSTRAINT `FK_course_TO_course_detail_1` FOREIGN KEY (`cd_course_id`) REFERENCES `course` (`course_id`),
  CONSTRAINT `FK_place_TO_course_detail` FOREIGN KEY (`cd_place_id`) REFERENCES `place` (`place_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_detail`
--

LOCK TABLES `course_detail` WRITE;
/*!40000 ALTER TABLE `course_detail` DISABLE KEYS */;
INSERT INTO `course_detail` VALUES (1,1,'백운목장',1,1),(1,2,'',1,628),(1,2,'',2,656),(1,3,'추억의 골목',1,752),(1,4,'함허정',1,651),(1,6,'태안사',1,666),(1,7,'하늘채',1,946),(1,8,'독도사진전시관',1,669),(1,8,'화순1경 화순적벽',2,929),(1,9,'홍가네흑염소가든',1,321),(1,10,'월출산 기찬랜드',1,843),(1,12,'곡성강빛마을펜션밸리홈',1,944),(1,13,'곡성성당(옥터성지)',1,667),(1,26,'곡성성당(옥터성지)',1,667),(1,26,'관음사',2,656),(1,27,'함허정',1,651),(1,29,'북경원',1,626),(1,30,'북경원',1,626),(1,37,'다산박물관',1,637),(1,37,'고려청자박물관',2,639),(1,37,'자유게스트하우스',3,937),(2,2,'',1,944),(2,2,'',2,985),(2,4,'관음사',1,656),(2,37,'한끼',1,344),(2,37,'함지박',2,345),(2,37,'석문정',3,27),(3,2,'',1,808),(3,2,'',2,585);
/*!40000 ALTER TABLE `course_detail` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-17 15:19:43
