-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: njvft_db
-- ------------------------------------------------------
-- Server version	5.7.24

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
-- Table structure for table `landmark_images`
--

DROP TABLE IF EXISTS `landmark_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `landmark_images` (
  `image_id` int(11) NOT NULL AUTO_INCREMENT,
  `landmark_id` int(11) NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `is_primary` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`image_id`),
  KEY `fk_images_landmarks` (`landmark_id`),
  CONSTRAINT `fk_images_landmarks` FOREIGN KEY (`landmark_id`) REFERENCES `landmarks` (`landmark_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `landmark_images`
--

LOCK TABLES `landmark_images` WRITE;
/*!40000 ALTER TABLE `landmark_images` DISABLE KEYS */;
INSERT INTO `landmark_images` VALUES (1,1,'https://uc.orez.io/f/09e80e39dcd147fd8c1c947132cc3e19',NULL,0),(2,2,'https://eu-images.contentstack.com/v3/assets/blt8634bd701c67871e/blt6b13eec58fc185a0/67d811cb5ab3852b1ad6b875/main_image.jpeg',NULL,0);
/*!40000 ALTER TABLE `landmark_images` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-23 22:48:05
