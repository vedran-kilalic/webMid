-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: midterm-2023
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.20-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cap_table`
--

DROP TABLE IF EXISTS `cap_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cap_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `share_class_id` int(10) unsigned NOT NULL,
  `share_class_category_id` int(10) unsigned NOT NULL,
  `investor_id` int(10) unsigned NOT NULL,
  `diluted_shares` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cap_table`
--

LOCK TABLES `cap_table` WRITE;
/*!40000 ALTER TABLE `cap_table` DISABLE KEYS */;
INSERT INTO `cap_table` VALUES (1,1,1,1,50.00),(2,1,2,1,10.00),(3,2,3,1,89.00),(4,2,4,2,12.00),(5,1,2,2,13.00),(6,2,3,3,15.00),(7,1,1,4,11.00),(8,2,4,2,18.00);
/*!40000 ALTER TABLE `cap_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `investors`
--

DROP TABLE IF EXISTS `investors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `investors` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `investors`
--

LOCK TABLES `investors` WRITE;
/*!40000 ALTER TABLE `investors` DISABLE KEYS */;
INSERT INTO `investors` VALUES (1,'FIRST ','INVESTOR','first.investor@gmail.com','ONE','2023-04-06 07:25:16'),(2,'SECOND','INVESTOR','second.investor@gmail.com','TWO','2023-04-12 07:25:16'),(3,'THIRD','INVESTOR','third.investor@gmail.com','THREE','2023-04-18 07:25:16'),(4,'FOURTH','INVESTOR','fourth.investor@gmail.com','FOUR','2023-04-20 07:25:16');
/*!40000 ALTER TABLE `investors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `share_class_categories`
--

DROP TABLE IF EXISTS `share_class_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `share_class_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `share_class_id` int(10) unsigned NOT NULL,
  `description` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `share_class_categories`
--

LOCK TABLES `share_class_categories` WRITE;
/*!40000 ALTER TABLE `share_class_categories` DISABLE KEYS */;
INSERT INTO `share_class_categories` VALUES (1,1,'CATEGORY_1'),(2,1,'CATEGORY_2'),(3,2,'CATEGORY_3'),(4,2,'CATEGORY_4');
/*!40000 ALTER TABLE `share_class_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `share_classes`
--

DROP TABLE IF EXISTS `share_classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `share_classes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `equity_main_currency` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(10,6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `share_classes`
--

LOCK TABLES `share_classes` WRITE;
/*!40000 ALTER TABLE `share_classes` DISABLE KEYS */;
INSERT INTO `share_classes` VALUES (1,'FIRST_CLASS','USD',12.000000),(2,'SECOND_CLASS','USD',29.000000);
/*!40000 ALTER TABLE `share_classes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-22 17:29:42
