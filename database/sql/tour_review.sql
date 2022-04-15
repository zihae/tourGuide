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
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `review_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(60) NOT NULL,
  `review_member_id` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `contents` longtext NOT NULL,
  `create_date` datetime NOT NULL,
  `modify_date` datetime DEFAULT NULL,
  `views` int NOT NULL DEFAULT '0',
  `del` varchar(2) DEFAULT NULL,
  `del_date` datetime DEFAULT NULL,
  `board_type` varchar(10) DEFAULT 'review',
  PRIMARY KEY (`review_id`),
  KEY `review_member_id_idx` (`review_member_id`),
  CONSTRAINT `review_user_id` FOREIGN KEY (`review_member_id`) REFERENCES `member` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (1,'test','qwe1','test','2022-04-05 15:33:59',NULL,0,'N',NULL,'review'),(2,'test2','qwe1','연습','2022-04-05 15:35:28',NULL,0,'N',NULL,'review'),(3,'3','qwe1','3','2022-04-05 15:37:47',NULL,0,'Y','2022-04-06 12:37:18','review'),(4,'테스트','qwe1','<p>ㅇㅇ</p>','2022-04-05 17:17:32',NULL,0,'N',NULL,'review'),(5,'delete','qwe1','<p>test</p>','2022-04-05 17:36:53',NULL,0,'Y','2022-04-06 12:36:01','review'),(6,'test','qwe1','<p>t</p>','2022-04-06 10:33:46',NULL,3,'N',NULL,'review'),(7,'INDEX TEST','qwe1','<p>수정gh</p>','2022-04-06 12:37:51','2022-04-06 17:40:48',9,'N',NULL,'review'),(8,'d','qwe1','<p>dhghgjh</p>','2022-04-06 17:51:33','2022-04-09 13:03:57',54,'Y','2022-04-09 13:04:01','review');
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-15 13:08:35
