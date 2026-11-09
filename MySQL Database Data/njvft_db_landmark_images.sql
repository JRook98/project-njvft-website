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
  PRIMARY KEY (`image_id`),
  KEY `fk_images_landmarks` (`landmark_id`),
  CONSTRAINT `fk_images_landmarks` FOREIGN KEY (`landmark_id`) REFERENCES `landmarks` (`landmark_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `landmark_images`
--

LOCK TABLES `landmark_images` WRITE;
/*!40000 ALTER TABLE `landmark_images` DISABLE KEYS */;
INSERT INTO `landmark_images` VALUES (1,1,'https://uc.orez.io/f/09e80e39dcd147fd8c1c947132cc3e19'),(2,2,'https://eu-images.contentstack.com/v3/assets/blt8634bd701c67871e/blt6b13eec58fc185a0/67d811cb5ab3852b1ad6b875/main_image.jpeg'),(3,3,'https://visitnj.org/sites/default/files/Exterior%20edit%20June%2027.23%20001.JPG'),(4,4,'https://visitnj.org/sites/default/files/2022-01/20090508NEWJERSEY-0690_Cropped_0.jpg'),(5,5,'https://upload.wikimedia.org/wikipedia/commons/3/3c/MansionBatstoNJ.jpg?utm_source=en.wikipedia.org&utm_campaign=index&utm_content=original'),(6,6,'https://dep.nj.gov/wp-content/uploads/parksandforests//wl6.jpg'),(7,7,'https://visitnj.org/sites/default/files/dji_0627_52384695603_o.png'),(8,8,'https://dep.nj.gov/wp-content/uploads/parksandforests//ib4.jpg'),(9,9,'https://cdn.sanity.io/images/17r5u9ce/production/02a9fa3ab27351e5378834ee72f63c1c65d5022b-630x630.jpg?fit=max&auto=format'),(10,10,'https://images.ctfassets.net/7bug8zo4c05d/6gHSOFt1HgrWoHfUqzq30Q/86a77a57e9b02b0891f5e71c253bfa84/Tilt-LP-Tile-FamilyFriendly.jpg?fm=webp&q=80&w=411'),(11,11,'https://allairevillage.org/wp-content/uploads/2017/07/Row-House.jpg'),(12,12,'https://ucnj.org/wp-content/uploads/2024/02/1-Church-Store.jpg'),(13,13,'https://www.nps.gov/gate/planyourvisit/images/SAHO_Lighthouse_30Sept2018_DYun.jpg?maxwidth=1300&autorotate=false&quality=78&format=webp'),(14,14,'https://media-production.lp-cdn.com/cdn-cgi/image/format=auto,quality=85,fit=scale-down,width=1280/https://media-production.lp-cdn.com/media/e10523a4-e319-4420-b1ef-26943ba9d0ba'),(15,15,'https://media.artmuseum.princeton.edu/iiif/3/web_images/2025_06_11_JH_0007/full/1278,/0/default.webp'),(16,16,'https://www.groundsforsculpture.org/wp-content/uploads/2019/07/2249-Summer-2018-dmhphotography_1920x800_acf_cropped.jpg'),(17,17,'https://whitesbog.org/wp-content/uploads/2021/03/13723933_730633350412819_6187777398089743350_o-1024x678.jpeg'),(18,18,'https://visitnj.org/sites/default/files/inline-images/05_NJTT_05_24_AsburyPark_009.jpg'),(19,19,'https://battleshipnewjersey.org/wp-content/uploads/2025/11/battleship-about-us.jpg'),(20,20,'https://wildwoodsnj.com/wp-content/uploads/2022/03/BeachShot.jpg'),(21,21,'https://www.battlefields.org/sites/default/files/styles/wysiwyg_original/public/The-Old-Barracks-Museum%2C-Trenton%2C-NJ-WilliamMBrown.jpg.webp?itok=REN9ZJfO'),(22,22,'https://images.trvl-media.com/place/6080381/ba4ee374-4fd0-4caf-b2ee-eb2fe3f535ba.jpg');
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

-- Dump completed on 2026-11-08 20:35:54
