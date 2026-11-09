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
  `city` varchar(500) DEFAULT NULL,
  `description` text NOT NULL,
  `fact` varchar(500) DEFAULT NULL,
  `latitude` decimal(10,8) NOT NULL,
  `longitude` decimal(11,8) NOT NULL,
  `official_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`landmark_id`),
  KEY `fk_landmarks_categories` (`category_id`),
  CONSTRAINT `fk_landmarks_categories` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `landmarks`
--

LOCK TABLES `landmarks` WRITE;
/*!40000 ALTER TABLE `landmarks` DISABLE KEYS */;
INSERT INTO `landmarks` VALUES (1,2,'Ocean City','Cape May County','An 8 mile long coastline with a boardwalk, music pier, and a downtown filled with unique boutiques, cafes, and local shops.','Alcohol has been legally banned within city limits since the town was founded in 1879.',39.27760000,-74.57460000,'https://www.ocnj.us','2026-09-24 02:25:28'),(2,2,'Atlantic City','Atlantic County','A 5 mile long coastline with a boardwalk, casinos like Hard Rock, and lots of historic attractions like Lucy the Elephant.','The classic Monopoly board game was inspired by Atlantic City\'s streets and properties.',39.36430000,-74.43390000,'https://www.acnj.gov','2026-09-24 02:30:48'),(3,1,'New Jersey State Museum','Trenton','A historic, publicly funded educational and cultural institution with a focus on science and nature, history and anthropology, and the fine arts.','This museum holds more than 190 original national, state, and regimental banners that were actually carried into battle by New Jersey volunteer regiments during the American Civil War.',40.22106000,-74.77310000,'https://www.nj.gov/state/museum/','2026-10-01 23:19:27'),(4,1,'Liberty Science Center','Jersey City','An interactive science museum featuring hands-on exhibits and live animal displays.','This museum houses the largest planetarium in the Western Hemisphere, and the second largest in the world.',40.70830000,-74.05420000,'https://lsc.org','2026-10-01 23:25:53'),(5,3,'Batsto Village','Hammonton','A meticulously preserved 18th- and 19th-century industrial and farming community located in the heart of the New Jersey Pine Barrens within Wharton State Forest.','This village manufactured supplies for the Continental Army during the Revolutionary War.',39.64178440,-74.64765730,'https://batstovillage.org','2026-10-01 23:29:55'),(6,3,'Waterloo Village Historic Site','Stanhope','A 19th-century canal town with three centuries of regional industrial and cultural development. Today, it serves as a scenic state park, a living history education site, and a prominent wedding and event venue.','This village features a fully functioning, 250-year-old water-powered Gristmil, powerful enough to grind up to 25,000 bushels of grain per year.',40.91650000,-74.75540000,'https://dep.nj.gov/parksandforests/state-park/waterloo-village/','2026-10-01 23:38:47'),(7,2,'Cape May Beach','Cape May County','Cape May sits at the southern tip of New Jersey and is one of the oldest beach resorts in the country. People know it for its colorful Victorian houses, wide sandy beaches, and great bird-watching. It faces south, so you can watch the sun rise and set over the water.','South Cape May used to be a resort town right next door. It had hotels, a boardwalk, and a giant wooden elephant you could walk inside. Erosion and big storms in 1936 and 1944 wrecked the town, and it was dissolved in 1945. Today, the land is a nature preserve, and parts of the old streets are under the ocean.',38.93160290,-74.87253140,'https://www.capemaycity.com/','2026-11-09 00:24:51'),(8,2,'Island Beach State Park','Ocean County','A 10-mile barrier island between the Atlantic Ocean and Barnegate Bay, Featuring sandy beaches, dunes, maritime forests, and tidal marshes.','The park is home to New Jersey’s largest osprey colony.',39.90527200,-74.08143100,'https://dep.nj.gov/parksandforests/state-park/island-beach-state-park/','2026-11-09 00:24:51'),(9,1,'Edelman Fossil Park & Museum','Mantua Township','A museum that sits on a 65-acre former quarry, and visitors can dig for real 66-million-year-old fossils in the Quarry Dig. Inside, the museum has full-scale dinosaur sculptures, free-roaming virtual reality, live animals in Critter Cove, and a lab where you can watch paleontologists preserve real fossils.','The park sits on a thin bone bed, about 6 inches thick, that dates to around 66 million years ago, the same era as the asteroid strike that wiped out the dinosaurs. That’s also why the museum’s address is 66 Million Mosasaur Way.',39.76285300,-75.12735950,'https://www.efm.org/','2026-11-09 00:24:51'),(10,1,'TiLT Museum','East Rutherford','An interactive 3D art museum inside the American Dream complex. It was created by 3D street artist Tracy Lee Stum. Visitors step into giant hand-painted murals and pose to look like they’re climbing the Statue of Liberty, running from a giant praying mantis or floating in space.','The paintings look stretched and warped to the naked eye. They only “pop” into 3D when you stand on the marked spot and look through a camera. The trick is called anamorphic perspective.',40.80916790,-74.06882230,'https://www.americandream.com/venue/tilt','2026-11-09 00:24:51'),(11,3,'Allaire Village','Wall Township','This restored 1830s ironworks town sits in Allaire State Park. You can explore historic buildings like the blacksmith shop, bakery and general store, where costumed volunteers bring 19th-century village life to life.','The property was initially a Native American ceremonial ground prior to 1650.',40.16216790,-74.13129880,'https://allairevillage.org/','2026-11-09 00:24:51'),(12,3,'The Deserted Village of Feltville/Glenside Park','Berkeley Heights','This 1840s mill town is hidden in the Watchung Reservation. David Felt, a New York stationer, built it for the workers at his paper mill. It later became a summer resort called Glenside Park. Today you can walk among the original houses, church and store from dawn to dusk.','Feltville was abandoned twice! The mill town emptied out after Felt sold it around 1860, and the Glenside Park resort closed in 1916, which earned it the nickname “the Deserted Village.”',40.67885460,-74.38904470,'https://ucnj.org/parks-recreation/deserted-village/','2026-11-09 00:24:51'),(13,2,'Sandy Hook Beach','Highlands','A 7-mile barrier peninsula at the northern tip of the Jersey Shore and part of the Gateway National Recreation Area. It has wide sandy beaches, dunes, bike paths and holly forests. On clear days you can see the New York City skyline across the bay.','The Sandy Hook Lighthouse was built in 1764, and it’s the oldest working lighthouse in the United States.',40.42836000,-73.98337510,'https://visitnj.org/city/sandy-hook','2026-11-09 00:24:51'),(14,2,'Beach Haven Beach','Ocean County','A sandy Atlantic Ocean beach on Long Beach Island, with seasonal lifeguards and nearby shops, restaurants, and family attractions.','Beach Haven is nicknamed the “Queen City” of Long Beach Island.',39.55977900,-74.23805200,'https://beachhaven-nj.gov/departments/recreation/beach-information/','2026-11-09 00:24:51'),(15,1,'Princeton University Art Museum','Princeton','An academic and public art museum established in 1882, containing more than 117,000 works of art spanning more than 5,000 years of global history.','Its outdoor sculpture collection is largely the result of an anonymous donation  named for John B. Putnam Jr., a World War II fighter pilot who died in a plane crash in 1944.',40.34742400,-74.65817100,'https://artmuseum.princeton.edu/','2026-11-09 00:24:51'),(16,1,'Grounds For Sculpture','Hamilton Township','A 42-acre sculpture park, museum, and arboretum featuring contemporary outdoor sculptures, landscaped gardens, and indoor art exhibitions.','Founded by artist Seward Johnson, it opened in 1992 on the former New Jersey State Fairgrounds.',40.23568889,-74.71761111,'https://www.groundsforsculpture.org/','2026-11-09 00:24:51'),(17,3,'Whitesbog Historic Village','Browns Mills','A preserved 19th-century agricultural company town located within the Pine Barrens. Founded in 1857, it grew to become the state\'s largest cranberry farm with 3,000 acres of cranberry bogs, reservoirs, and hiking trails.','It is known as the birthplace of the first commercially cultivated highbush blueberry, developed by Elizabeth Coleman White and Dr. Frederick V. Coville 1916.',39.95982100,-74.50964400,'https://whitesbog.org/','2026-11-09 00:24:51'),(18,2,'Asbury Park Beach','Monmouth County','A wide, mile-long stretch of sand on the coast, backed by a boardwalk, the historic 1920’s Convention Hall and Paramount Theater.','Asbury Park is known for its ties to Bruce Springsteen, which inspired his 1973 debut album Greetings from Asbury Park, N.J.',40.22503800,-73.99758500,'https://www.cityofasburypark.com/185/Beach-Boardwalk','2026-11-09 00:24:51'),(19,1,'Battleship New Jersey Museum & Memorial','Camden','A floating naval museum on the Delaware River where visitors explore a historic battleship’s decks, gun turrets, and living quarters.','USS New Jersey was commissioned into the U.S. Navy on May 23, 1943.',39.94619700,-75.12374400,'https://battleshipnewjersey.org/','2026-11-09 00:24:51'),(20,2,'Wildwood Beach','Wildwood','A wide Atlantic Ocean beach beside a lively boardwalk featuring amusement rides, water parks, restaurants, and arcades.','Wildwood is part of the Wildwoods’ five-mile stretch of beaches that do not require beach tags.',38.98557000,-74.80932000,'https://wildwoodsnj.com/visitor-information/beach-information/','2026-11-09 00:24:51'),(21,1,'Old Barracks Museum','Trenton','A museum that preserves the history of a building constructed in 1758 as a French and Indian War military barracks, used as winter quarters for British soldiers.','This museum is the last remaining original 18th-century British barracks in North America.',40.22090000,-74.76950000,'https://www.barracks.org','2026-11-09 00:24:51'),(22,2,'Seaside Heights Beach','Seaside Heights','A beach that features amusement rides, an energetic boardwalk, arcades, restaurants, and beautiful summer attractions.','The MTV reality show Jersey Shore featured the Seaside Heights Beach and its famous boardwalk.',39.94320000,-74.07210000,'https://www.seaside-heightsnj.org','2026-11-09 00:24:51');
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

-- Dump completed on 2026-11-08 20:35:54
