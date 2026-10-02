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
-- Table structure for table `landmarks`
--

DROP TABLE IF EXISTS `landmarks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `landmarks` (
  `landmark_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `description` text NOT NULL,
  `fact` varchar(500) DEFAULT NULL,
  `latitude` decimal(10,8) NOT NULL,
  `longitude` decimal(11,8) NOT NULL,
  `official_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`landmark_id`),
  KEY `fk_landmarks_categories` (`category_id`),
  CONSTRAINT `fk_landmarks_categories` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `landmarks`
--

LOCK TABLES `landmarks` WRITE;
/*!40000 ALTER TABLE `landmarks` DISABLE KEYS */;
INSERT INTO `landmarks` VALUES (1,2,'Ocean City','An 8 mile long coastline with a boardwalk, music pier, and a downtown filled with unique boutiques, cafes, and local shops.','Alcohol has been legally banned within city limits since the town was founded in 1879.',39.27760000,-74.57460000,'https://www.ocnj.us','2026-09-24 02:25:28'),(2,2,'Atlantic City','A 5 mile long coastline with a boardwalk, casinos like Hard Rock, and lots of historic attractions like Lucy the Elephant.','The classic Monopoly board game was inspired by Atlantic City\'s streets and properties.',39.36430000,-74.43390000,'https://www.acnj.gov','2026-09-24 02:30:48'),(3,1,'New Jersey State Museum','A historic, publicly funded educational and cultural institution with a focus on science and nature, history and anthropology, and the fine arts.','This museum holds more than 190 original national, state, and regimental banners that were actually carried into battle by New Jersey volunteer regiments during the American Civil War.',40.22106000,-74.77310000,'https://www.nj.gov/state/museum/','2026-10-01 23:19:27'),(5,1,'Liberty Science Center','An interactive science museum featuring hands-on exhibits and live animal displays.','This museum houses the largest planetarium in the Western Hemisphere, and the second largest in the world.',40.70830000,-74.05420000,'https://lsc.org','2026-10-01 23:25:53'),(6,3,'Batsto Village','A meticulously preserved 18th- and 19th-century industrial and farming community located in the heart of the New Jersey Pine Barrens within Wharton State Forest.','This village manufactured supplies for the Continental Army during the Revolutionary War.',39.64178440,-74.64765730,'https://batstovillage.org','2026-10-01 23:29:55'),(7,3,'Waterloo Village Historic Site','A 19th-century canal town with three centuries of regional industrial and cultural development. Today, it serves as a scenic state park, a living history education site, and a prominent wedding and event venue.','This village features a fully functioning, 250-year-old water-powered Gristmil, powerful enough to grind up to 25,000 bushels of grain per year.',40.91650000,-74.75540000,'https://dep.nj.gov/parksandforests/state-park/waterloo-village/','2026-10-01 23:38:47');
/*!40000 ALTER TABLE `landmarks` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-02  0:13:13
