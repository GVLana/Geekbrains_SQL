-- MySQL dump 10.13  Distrib 8.0.29, for Linux (x86_64)
--
-- Host: localhost    Database: kinopoisk
-- ------------------------------------------------------
-- Server version	8.0.29-0ubuntu0.20.04.3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `actors`
--

DROP TABLE IF EXISTS `actors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actors` (
  `actor_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(150) NOT NULL,
  `lastname` varchar(150) NOT NULL,
  `birthday` date NOT NULL,
  `country_id` int unsigned NOT NULL,
  PRIMARY KEY (`actor_id`),
  KEY `fk_actors_countries` (`country_id`),
  CONSTRAINT `fk_actors_countries` FOREIGN KEY (`country_id`) REFERENCES `countries` (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actors`
--

LOCK TABLES `actors` WRITE;
/*!40000 ALTER TABLE `actors` DISABLE KEYS */;
INSERT INTO `actors` VALUES (21,'Leonardo','DiCaprio','1974-11-11',23),(22,'Jhony','Depp','1963-06-09',23),(23,'Al','Pacino','1940-04-25',1),(24,'Gerard','Depardieu','1948-12-27',14),(25,'Antonio','Banderas','1960-08-10',20),(26,'Don','Cheadlr','1964-11-29',23),(27,'Tom','Cruise','1962-07-03',23),(28,'Dustin','Hoffman','1937-08-08',23),(29,'Constantin','Khabenskii','1972-01-11',19),(30,'Danila','Kozlovskii','1985-05-03',19);
/*!40000 ALTER TABLE `actors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actresses`
--

DROP TABLE IF EXISTS `actresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actresses` (
  `actress_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(150) NOT NULL,
  `lastname` varchar(150) NOT NULL,
  `birthday` date NOT NULL,
  `country_id` int unsigned NOT NULL,
  PRIMARY KEY (`actress_id`),
  KEY `fk_actresses_countries` (`country_id`),
  CONSTRAINT `fk_actresses_countries` FOREIGN KEY (`country_id`) REFERENCES `countries` (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actresses`
--

LOCK TABLES `actresses` WRITE;
/*!40000 ALTER TABLE `actresses` DISABLE KEYS */;
INSERT INTO `actresses` VALUES (1,'Susan','Sarandon','1946-10-04',23),(2,'Glenn','Close','1947-03-19',23),(3,'Julie','Andrews','1935-10-01',22),(4,'Helen','Mirren','1945-07-26',23),(5,'Viola','Davis','1965-08-11',23),(6,'Cate','Blanchett','1969-05-14',3),(7,'Meryl','Streep','1949-06-22',23),(8,'Ingrid','Bergman','1915-08-29',23),(9,'Svetlana','Khodchenkova','1983-01-21',19),(10,'Marina','Aleksandrova','1982-08-29',19);
/*!40000 ALTER TABLE `actresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `awards`
--

DROP TABLE IF EXISTS `awards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `awards` (
  `award_id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`award_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `awards`
--

LOCK TABLES `awards` WRITE;
/*!40000 ALTER TABLE `awards` DISABLE KEYS */;
INSERT INTO `awards` VALUES (6,'BAFTA Awards'),(8,'Cesar'),(2,'Ewwmy Awards'),(4,'Golden Globes'),(5,'MTV Movie Awards'),(3,'Nika'),(1,'Oscar'),(7,'Razzie Awards');
/*!40000 ALTER TABLE `awards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries` (
  `country_id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(130) NOT NULL,
  PRIMARY KEY (`country_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (2,'Argentina'),(3,'Australia'),(4,'Austria'),(5,'Belgium'),(6,'Botswana'),(7,'Brazil'),(8,'Canada'),(9,'Chile'),(10,'China'),(11,'Colombia'),(12,'Egypt'),(13,'Finland'),(14,'France'),(15,'Germany'),(16,'Israel'),(1,'Italy'),(17,'Japan'),(18,'Mexico'),(19,'Russia'),(20,'Spain'),(21,'Switzerland'),(22,'United Kingdom'),(23,'United States of America');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `film_awards`
--

DROP TABLE IF EXISTS `film_awards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `film_awards` (
  `award_id` int unsigned NOT NULL,
  `title_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`title_id`,`award_id`),
  KEY `film_awards_titles_idx` (`title_id`),
  KEY `film_awards_awards_idx` (`award_id`),
  CONSTRAINT `fk_film_awards_awards` FOREIGN KEY (`award_id`) REFERENCES `awards` (`award_id`),
  CONSTRAINT `fk_film_awards_titles` FOREIGN KEY (`title_id`) REFERENCES `titles` (`title_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `film_awards`
--

LOCK TABLES `film_awards` WRITE;
/*!40000 ALTER TABLE `film_awards` DISABLE KEYS */;
INSERT INTO `film_awards` VALUES (1,3),(1,4),(2,2),(6,1);
/*!40000 ALTER TABLE `film_awards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `film_genre`
--

DROP TABLE IF EXISTS `film_genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `film_genre` (
  `genre_id` int unsigned NOT NULL,
  `title_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`title_id`,`genre_id`),
  KEY `film_genre_titles_idx` (`title_id`),
  KEY `film_genre_types_idx` (`genre_id`),
  CONSTRAINT `fk_film_genre_genres` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`genre_id`),
  CONSTRAINT `fk_film_genre_titles` FOREIGN KEY (`title_id`) REFERENCES `titles` (`title_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `film_genre`
--

LOCK TABLES `film_genre` WRITE;
/*!40000 ALTER TABLE `film_genre` DISABLE KEYS */;
INSERT INTO `film_genre` VALUES (3,1),(3,2),(3,3),(3,4);
/*!40000 ALTER TABLE `film_genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `film_producer`
--

DROP TABLE IF EXISTS `film_producer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `film_producer` (
  `title_id` bigint unsigned NOT NULL,
  `producer_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`title_id`,`producer_id`),
  KEY `film_producer_titles_idx` (`title_id`),
  KEY `film_producer_producers_idx` (`producer_id`),
  CONSTRAINT `fk_film_producer_producers` FOREIGN KEY (`producer_id`) REFERENCES `producers` (`producer_id`),
  CONSTRAINT `fk_film_producer_titles` FOREIGN KEY (`title_id`) REFERENCES `titles` (`title_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `film_producer`
--

LOCK TABLES `film_producer` WRITE;
/*!40000 ALTER TABLE `film_producer` DISABLE KEYS */;
INSERT INTO `film_producer` VALUES (1,10),(2,9),(3,8),(4,9);
/*!40000 ALTER TABLE `film_producer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `film_staff`
--

DROP TABLE IF EXISTS `film_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `film_staff` (
  `title_id` bigint unsigned NOT NULL,
  `actor_id` bigint unsigned NOT NULL,
  `actress_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`title_id`),
  KEY `film_staff_titles_idx` (`title_id`),
  KEY `film_staff_actors_idx` (`actor_id`),
  KEY `film_staff_actresses_idx` (`actress_id`),
  CONSTRAINT `fk_film_staff_actors` FOREIGN KEY (`actor_id`) REFERENCES `actors` (`actor_id`),
  CONSTRAINT `fk_film_staff_actresses` FOREIGN KEY (`actress_id`) REFERENCES `actresses` (`actress_id`),
  CONSTRAINT `fk_film_staff_titles` FOREIGN KEY (`title_id`) REFERENCES `titles` (`title_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `film_staff`
--

LOCK TABLES `film_staff` WRITE;
/*!40000 ALTER TABLE `film_staff` DISABLE KEYS */;
INSERT INTO `film_staff` VALUES (1,21,6),(2,21,6),(3,23,3),(4,22,6);
/*!40000 ALTER TABLE `film_staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `film_types`
--

DROP TABLE IF EXISTS `film_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `film_types` (
  `title_id` bigint unsigned NOT NULL,
  `type_id` int unsigned NOT NULL,
  PRIMARY KEY (`title_id`,`type_id`),
  KEY `film_types_titles_idx` (`title_id`),
  KEY `film_types_types_idx` (`type_id`),
  CONSTRAINT `fk_film_types_titles` FOREIGN KEY (`title_id`) REFERENCES `titles` (`title_id`),
  CONSTRAINT `fk_film_types_types` FOREIGN KEY (`type_id`) REFERENCES `types` (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `film_types`
--

LOCK TABLES `film_types` WRITE;
/*!40000 ALTER TABLE `film_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `film_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genres` (
  `genre_id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`genre_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES (4,'Action'),(11,'Animation'),(2,'Comedy'),(1,'Documentary'),(5,'Drama'),(7,'Fantasy'),(8,'Historical'),(10,'Horror'),(6,'Romance'),(3,'Thriller'),(9,'Western');
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `grade`
--

DROP TABLE IF EXISTS `grade`;
/*!50001 DROP VIEW IF EXISTS `grade`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `grade` AS SELECT 
 1 AS `name`,
 1 AS `garde`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `languages` (
  `language_id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (1,'russian'),(2,'english'),(3,'french'),(4,'spanish'),(5,'italian'),(6,'german');
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likes` (
  `title_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `like_type` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`title_id`,`user_id`),
  KEY `title_idx` (`title_id`),
  KEY `user_idx` (`user_id`),
  CONSTRAINT `titles_likes_fk` FOREIGN KEY (`title_id`) REFERENCES `titles` (`title_id`),
  CONSTRAINT `users_likes_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (1,1,0),(1,3,1),(1,4,1),(1,6,1),(2,1,0),(2,8,0),(2,9,1),(2,10,1),(3,1,1),(3,2,0),(3,7,0),(4,1,1),(4,2,0),(4,5,0),(4,6,1),(4,7,1),(4,8,0),(4,10,1);
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `append_raiting_logs_from_likes` AFTER INSERT ON `likes` FOR EACH ROW BEGIN
	CALL append_raiting_logs(NEW.title_id, NEW.like_type);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `membership`
--

DROP TABLE IF EXISTS `membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `membership` (
  `membership_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `status` enum('active','inactive') NOT NULL,
  PRIMARY KEY (`membership_id`),
  KEY `fk_membership_users` (`user_id`),
  CONSTRAINT `fk_membership_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `membership`
--

LOCK TABLES `membership` WRITE;
/*!40000 ALTER TABLE `membership` DISABLE KEYS */;
INSERT INTO `membership` VALUES (1,2,'active'),(2,4,'active'),(3,8,'active');
/*!40000 ALTER TABLE `membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `membership_status`
--

DROP TABLE IF EXISTS `membership_status`;
/*!50001 DROP VIEW IF EXISTS `membership_status`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `membership_status` AS SELECT 
 1 AS `user`,
 1 AS `status`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `new_arrivals`
--

DROP TABLE IF EXISTS `new_arrivals`;
/*!50001 DROP VIEW IF EXISTS `new_arrivals`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `new_arrivals` AS SELECT 
 1 AS `title`,
 1 AS `about`,
 1 AS `release_year`,
 1 AS `languages`,
 1 AS `country`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `payment_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `status` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`payment_id`),
  KEY `user_idx` (`user_id`),
  CONSTRAINT `fk_payments_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (69,1,1,'2022-06-03 20:33:38'),(73,2,1,'2022-06-03 20:34:04'),(74,4,1,'2022-06-03 20:35:03'),(75,8,1,'2022-06-03 20:35:13');
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `append_membership_from_payments` AFTER INSERT ON `payments` FOR EACH ROW BEGIN
	CALL append_membership((SELECT user_id FROM payments WHERE created_at = NOW()), 'active');
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `photo`
--

DROP TABLE IF EXISTS `photo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `photo` (
  `photo_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `file_size` bigint DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`photo_id`),
  KEY `fk_photo_users` (`user_id`),
  CONSTRAINT `fk_photo_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photo`
--

LOCK TABLES `photo` WRITE;
/*!40000 ALTER TABLE `photo` DISABLE KEYS */;
INSERT INTO `photo` VALUES (1,1,256,'2022-06-04 13:28:07'),(2,3,135,'2022-06-04 13:28:07'),(3,4,155,'2022-06-04 13:28:07');
/*!40000 ALTER TABLE `photo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posters`
--

DROP TABLE IF EXISTS `posters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posters` (
  `poster_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) DEFAULT NULL,
  `owner_id` bigint unsigned NOT NULL,
  `file_size` bigint DEFAULT NULL,
  PRIMARY KEY (`poster_id`),
  UNIQUE KEY `poster_id` (`poster_id`),
  KEY `name` (`name`),
  KEY `owner_id` (`owner_id`),
  CONSTRAINT `posters_ibfk_1` FOREIGN KEY (`owner_id`) REFERENCES `titles` (`title_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posters`
--

LOCK TABLES `posters` WRITE;
/*!40000 ALTER TABLE `posters` DISABLE KEYS */;
INSERT INTO `posters` VALUES (1,'prestige.png',1,100),(2,'shutter_island.jpg',2,150),(3,'fight_club.jpg',3,150),(4,'departed.png',4,160);
/*!40000 ALTER TABLE `posters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producers`
--

DROP TABLE IF EXISTS `producers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producers` (
  `producer_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(150) NOT NULL,
  `lastname` varchar(150) NOT NULL,
  `birthday` date NOT NULL,
  `country_id` int unsigned NOT NULL,
  PRIMARY KEY (`producer_id`),
  KEY `fk_producers_countries` (`country_id`),
  CONSTRAINT `fk_producers_countries` FOREIGN KEY (`country_id`) REFERENCES `countries` (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producers`
--

LOCK TABLES `producers` WRITE;
/*!40000 ALTER TABLE `producers` DISABLE KEYS */;
INSERT INTO `producers` VALUES (1,'Brain','Grazer','1951-07-12',23),(2,'Steven','Spielberg','1946-12-18',23),(3,'Stanly','Kubrik','1928-07-26',23),(4,'Scott','Rudin','1958-07-14',23),(5,'Taylor','Hackford','1944-12-31',23),(6,'Kathleen','Kennedy','1953-06-05',23),(7,'Irwin','Winker','1931-05-28',23),(8,'David','Fincher','1962-08-28',23),(9,'Martin','Scorsese','1942-11-17',1),(10,'Christopher','Nolan','1970-07-30',23);
/*!40000 ALTER TABLE `producers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profiles` (
  `user_id` bigint unsigned NOT NULL,
  `gender` enum('f','m','x') NOT NULL,
  `birthday` date NOT NULL,
  `photo_id` bigint unsigned NOT NULL,
  `country_id` int unsigned NOT NULL,
  UNIQUE KEY `photo_id` (`photo_id`),
  KEY `fk_profiles_countries` (`country_id`),
  KEY `fk_profiles_users` (`user_id`),
  CONSTRAINT `fk_profiles_countries` FOREIGN KEY (`country_id`) REFERENCES `countries` (`country_id`),
  CONSTRAINT `fk_profiles_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (1,'f','1999-02-02',1,19),(2,'m','1989-02-12',2,19),(3,'x','1987-10-02',3,19),(4,'f','1989-03-14',4,19),(5,'f','2000-12-02',5,19),(6,'m','1998-05-02',6,19),(7,'m','1997-11-02',7,19),(8,'m','1996-08-02',8,19),(9,'m','1999-06-11',9,19),(10,'f','1999-01-01',10,19);
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `raiting`
--

DROP TABLE IF EXISTS `raiting`;
/*!50001 DROP VIEW IF EXISTS `raiting`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `raiting` AS SELECT 
 1 AS `title`,
 1 AS `raiting`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `raiting_logs`
--

DROP TABLE IF EXISTS `raiting_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `raiting_logs` (
  `title_id` bigint unsigned NOT NULL,
  `like_type` tinyint unsigned NOT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `raiting_logs`
--

LOCK TABLES `raiting_logs` WRITE;
/*!40000 ALTER TABLE `raiting_logs` DISABLE KEYS */;
INSERT INTO `raiting_logs` VALUES (4,1),(4,1),(1,0),(1,0),(1,0),(4,1),(1,0),(1,1),(1,1),(1,1),(2,0),(2,0),(2,1),(2,1),(3,1),(3,0),(3,0),(4,1),(4,0),(4,0),(4,0),(4,1),(4,1);
/*!40000 ALTER TABLE `raiting_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `titles`
--

DROP TABLE IF EXISTS `titles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `titles` (
  `title_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `language_id` int unsigned NOT NULL,
  `country_id` int unsigned NOT NULL,
  `description` text NOT NULL,
  `release_year` year NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`title_id`),
  UNIQUE KEY `name` (`name`),
  KEY `fk_titles_languages` (`language_id`),
  KEY `fk_titles_countries` (`country_id`),
  CONSTRAINT `fk_titles_countries` FOREIGN KEY (`country_id`) REFERENCES `countries` (`country_id`),
  CONSTRAINT `fk_titles_languages` FOREIGN KEY (`language_id`) REFERENCES `languages` (`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `titles`
--

LOCK TABLES `titles` WRITE;
/*!40000 ALTER TABLE `titles` DISABLE KEYS */;
INSERT INTO `titles` VALUES (1,'The Prestige',2,23,'opposition of magicians-illusionists',2006,'2022-06-02 22:40:47'),(2,'Shutter Island',2,23,'the bailiff becomes a hostage of the insane clinic',2009,'2022-06-02 22:40:47'),(3,'Fight Club',2,23,'insurance worker changes his life',1999,'2022-06-02 22:40:47'),(4,'The Departed',2,23,'two police academy graduates',2006,'2022-06-02 22:40:47');
/*!40000 ALTER TABLE `titles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trailers`
--

DROP TABLE IF EXISTS `trailers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trailers` (
  `trailer_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `owner_id` bigint unsigned NOT NULL,
  `file_size` bigint DEFAULT NULL,
  PRIMARY KEY (`trailer_id`),
  UNIQUE KEY `trailer_id` (`trailer_id`),
  KEY `name` (`name`),
  KEY `owner_id` (`owner_id`),
  CONSTRAINT `trailers_ibfk_1` FOREIGN KEY (`owner_id`) REFERENCES `titles` (`title_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trailers`
--

LOCK TABLES `trailers` WRITE;
/*!40000 ALTER TABLE `trailers` DISABLE KEYS */;
INSERT INTO `trailers` VALUES (1,'prestige',1,256),(2,'shutter_island',2,352),(3,'fight_club',3,256),(4,'departed',4,458);
/*!40000 ALTER TABLE `trailers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `types`
--

DROP TABLE IF EXISTS `types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `types` (
  `type_id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(130) NOT NULL,
  PRIMARY KEY (`type_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `types`
--

LOCK TABLES `types` WRITE;
/*!40000 ALTER TABLE `types` DISABLE KEYS */;
INSERT INTO `types` VALUES (4,'mini series'),(1,'movie'),(3,'podcast'),(2,'TV-show');
/*!40000 ALTER TABLE `types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(150) NOT NULL,
  `lastname` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `password_hash` char(65) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  CONSTRAINT `check_phone` CHECK (regexp_like(`phone`,_utf8mb4'^[0-9]{11}$'))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Anna','Pavlova','anna@gb.ru','89112325648',NULL,'2022-06-02 14:31:49'),(2,'Nikita','Drozdov','nikita@gb.ru','89112625648',NULL,'2022-06-02 14:31:49'),(3,'Dima','Gavrilov','dima@gb.ru','89112725648',NULL,'2022-06-02 14:31:49'),(4,'Alena','Ivanova','alena@gb.ru','89112825648',NULL,'2022-06-02 14:31:49'),(5,'Marina','Sidorova','marina@gb.ru','89112925648',NULL,'2022-06-02 14:31:49'),(6,'Pavel','Smirnov','pavel@gb.ru','89112335648',NULL,'2022-06-02 14:31:49'),(7,'Oleg','Tumanov','oleg@gb.ru','89112345648',NULL,'2022-06-02 14:31:49'),(8,'Ilya','Blokh','ilya@gb.ru','89112355648',NULL,'2022-06-02 14:31:49'),(9,'Anton','Pavlov','anton@gb.ru','89112365648',NULL,'2022-06-02 14:31:49'),(10,'Katya','Tutaeva','katya@gb.ru','89112385648',NULL,'2022-06-02 14:31:49');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `watched`
--

DROP TABLE IF EXISTS `watched`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `watched` (
  `title_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `watch_type` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`title_id`,`user_id`),
  KEY `title_idx` (`title_id`),
  KEY `user_idx` (`user_id`),
  CONSTRAINT `titles_watched_fk` FOREIGN KEY (`title_id`) REFERENCES `titles` (`title_id`),
  CONSTRAINT `users_watched_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `watched`
--

LOCK TABLES `watched` WRITE;
/*!40000 ALTER TABLE `watched` DISABLE KEYS */;
INSERT INTO `watched` VALUES (1,1,1),(1,2,0),(1,3,1),(1,4,1),(1,5,0),(1,6,1),(1,7,0),(1,8,0),(1,9,0),(2,1,1),(2,2,0),(2,3,0),(2,4,0),(2,5,0),(2,6,0),(2,7,0),(2,8,1),(2,9,1),(2,10,1),(3,1,1),(3,2,1),(3,3,0),(3,4,0),(3,5,0),(3,6,0),(3,7,1),(3,8,0),(3,9,0),(3,10,0),(4,1,1),(4,2,1),(4,3,0),(4,4,0),(4,5,1),(4,6,1),(4,7,1),(4,8,1),(4,9,0),(4,10,1);
/*!40000 ALTER TABLE `watched` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `grade`
--

/*!50001 DROP VIEW IF EXISTS `grade`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `grade` AS select `titles`.`name` AS `name`,(case when (`grade_of_title`(`titles`.`title_id`) >= 80) then 'хорошо' when ((`grade_of_title`(`titles`.`title_id`) < 80) and (`grade_of_title`(`titles`.`title_id`) >= 50)) then 'средне' else 'плохо' end) AS `garde` from `titles` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `membership_status`
--

/*!50001 DROP VIEW IF EXISTS `membership_status`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `membership_status` AS select concat(`u`.`firstname`,' ',`u`.`lastname`) AS `user`,(case when (`m`.`status` is null) then 'inactive' else `m`.`status` end) AS `status` from (`users` `u` left join `membership` `m` on((`u`.`id` = `m`.`user_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `new_arrivals`
--

/*!50001 DROP VIEW IF EXISTS `new_arrivals`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `new_arrivals` AS select `t`.`name` AS `title`,`t`.`description` AS `about`,`t`.`release_year` AS `release_year`,`l`.`name` AS `languages`,`c`.`name` AS `country` from ((`titles` `t` left join `languages` `l` on((`t`.`language_id` = `l`.`language_id`))) left join `countries` `c` on((`t`.`country_id` = `c`.`country_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `raiting`
--

/*!50001 DROP VIEW IF EXISTS `raiting`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `raiting` AS select `t`.`name` AS `title`,sum(`rl`.`like_type`) AS `raiting` from (`titles` `t` left join `raiting_logs` `rl` on((`t`.`title_id` = `rl`.`title_id`))) group by `t`.`title_id` order by `raiting` desc limit 200 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-04 13:41:38
