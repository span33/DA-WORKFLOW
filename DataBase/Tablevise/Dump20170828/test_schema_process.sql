-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: test_schema
-- ------------------------------------------------------
-- Server version	5.7.18-log

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
-- Table structure for table `process`
--

DROP TABLE IF EXISTS `process`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `process` (
  `process_id` int(11) NOT NULL AUTO_INCREMENT,
  `process_name` varchar(45) DEFAULT NULL,
  `process_description` varchar(255) DEFAULT NULL,
  `process_owner` varchar(45) DEFAULT NULL,
  `process_type` varchar(45) DEFAULT NULL,
  `process_template_id` varchar(45) DEFAULT NULL,
  `process_level` varchar(45) DEFAULT NULL,
  `process_parent_id` varchar(45) DEFAULT NULL,
  `process_hasSibling` int(11) DEFAULT NULL,
  `process_task_mapping_process_task_mapping_id` int(11) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT 'admin',
  `updated_by` varchar(50) DEFAULT NULL,
  `dt_created` timestamp NULL DEFAULT NULL,
  `dt_updated` timestamp NULL DEFAULT NULL,
  `isLeaf` tinyint(4) DEFAULT '0',
  `expanded` tinyint(4) DEFAULT '0',
  `enabled` tinyint(4) DEFAULT '0',
  `doc_type` varchar(45) DEFAULT NULL,
  `group_id` varchar(45) DEFAULT NULL,
  `department_id` varchar(255) DEFAULT NULL,
  `process_act_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`process_id`),
  UNIQUE KEY `process_name_UNIQUE` (`process_name`),
  UNIQUE KEY `process_act_name_UNIQUE` (`process_act_name`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `process`
--

LOCK TABLES `process` WRITE;
/*!40000 ALTER TABLE `process` DISABLE KEYS */;
/*!40000 ALTER TABLE `process` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-08-28 13:18:42
