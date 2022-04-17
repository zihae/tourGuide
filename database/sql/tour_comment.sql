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
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `co_num` int NOT NULL AUTO_INCREMENT,
  `co_me_id` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `co_bd_num` int NOT NULL,
  `co_reg_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `co_del` varchar(2) NOT NULL DEFAULT 'N',
  `co_contents` longtext NOT NULL,
  `co_ori_num` int NOT NULL,
  PRIMARY KEY (`co_num`),
  KEY `user_id_idx` (`co_me_id`),
  KEY `co_bd_num_idx` (`co_bd_num`),
  CONSTRAINT `co_bd_num` FOREIGN KEY (`co_bd_num`) REFERENCES `review` (`review_id`),
  CONSTRAINT `user_id` FOREIGN KEY (`co_me_id`) REFERENCES `member` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (2,'test1',9,'2022-04-17 12:17:00','Y','테스트 댓글입니다',1),(3,'test1',9,'2022-04-17 13:32:33','Y','댓글 입력',3),(4,'test1',9,'2022-04-17 13:32:50','Y','테스트 댓글입니다\n',4),(5,'test1',9,'2022-04-17 13:35:09','Y','댓글',5),(6,'test1',9,'2022-04-17 13:38:36','Y','댓글\n',6),(7,'test1',9,'2022-04-17 13:39:35','Y','답글',6),(8,'test1',9,'2022-04-17 13:44:43','Y','댓글',8),(9,'test1',9,'2022-04-17 13:44:52','Y','댓글 ',9),(10,'test1',9,'2022-04-17 13:46:30','Y','ㅇ',10),(11,'test1',9,'2022-04-17 14:02:02','Y','ff',11),(12,'test1',9,'2022-04-17 14:03:17','Y','d',12),(13,'test1',9,'2022-04-17 14:03:38','Y','d',13),(14,'test1',9,'2022-04-17 14:50:04','Y','asd',14),(15,'test1',9,'2022-04-17 14:50:19','N','테스트 댓글입니다',15),(16,'qwe1',9,'2022-04-17 14:55:51','N','답글 테스트입니다',15);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
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
