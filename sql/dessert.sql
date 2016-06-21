-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: dessert
-- ------------------------------------------------------
-- Server version	5.7.12-log

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(45) NOT NULL,
  `tel` varchar(45) NOT NULL,
  `uid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `dessert_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cart_item` (`user_id`,`dessert_id`,`store_id`,`date`),
  KEY `store_id` (`store_id`),
  KEY `dessert_id` (`dessert_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1,1,1,27,1,'2016-06-24');
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dessert`
--

DROP TABLE IF EXISTS `dessert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dessert` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `desc` varchar(512) DEFAULT NULL,
  `price` int(11) NOT NULL DEFAULT '12',
  `picture` varchar(512) DEFAULT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `onshelf` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dessert`
--

LOCK TABLES `dessert` WRITE;
/*!40000 ALTER TABLE `dessert` DISABLE KEYS */;
INSERT INTO `dessert` VALUES (1,'黑森林','它融合了樱桃的酸、奶油的甜、樱桃酒的醇香。完美的黑森林蛋糕经得起各种口味的挑剔。',16,NULL,0,NULL),(2,'蜂蜜柚子茶','清爽的颜色，浓郁的茶香，它的回味,清新,悠远,不华丽,却让人不能忘记,是留在唇齿之间的那段绵绵回忆。',18,NULL,1,NULL),(3,'抹茶慕斯','清爽的颜色，浓郁的茶香，它的回味,清新,悠远,不华丽,却让人不能忘记,是留在唇齿之间的那段绵绵回忆。',18,NULL,0,NULL),(4,'甜品4','好吃',16,NULL,0,NULL),(5,'饮品2','好喝',20,NULL,1,NULL),(6,'甜品5','真的很好吃哦',20,NULL,0,NULL);
/*!40000 ALTER TABLE `dessert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` varchar(16) NOT NULL,
  `uid` int(11) NOT NULL,
  `level` int(11) DEFAULT '0',
  `point` int(11) DEFAULT '0',
  `state` int(11) DEFAULT '0' COMMENT '0未激活，1正常，2暂停，3停止',
  `payword` varchar(6) NOT NULL,
  `bank_card` varchar(45) NOT NULL,
  `balance` double(10,1) DEFAULT '0.0',
  `suspend_time` datetime DEFAULT NULL,
  `active_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid_idx` (`uid`),
  CONSTRAINT `uid` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (1,'V000001',1,0,2,1,'123456','1234567822345678',152.0,NULL,'2016-05-05 10:57:03'),(2,'V000002',2,3,0,1,'950630','6222024301078685555',1099972.5,NULL,'2016-06-21 15:33:27');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_item`
--

DROP TABLE IF EXISTS `order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `dessert_id` int(11) NOT NULL,
  `quantity` int(255) DEFAULT '0',
  `price` double(10,1) DEFAULT '0.0',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `order_id` FOREIGN KEY (`order_id`) REFERENCES `sorder` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_item`
--

LOCK TABLES `order_item` WRITE;
/*!40000 ALTER TABLE `order_item` DISABLE KEYS */;
INSERT INTO `order_item` VALUES (1,1,1,3,16.0),(2,2,1,1,16.0),(3,2,2,1,18.0);
/*!40000 ALTER TABLE `order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `value` double(10,1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,1,200.0,'2016-05-05 02:57:03'),(2,2,99999.0,'2016-06-21 07:33:27'),(3,2,999999.0,'2016-06-21 07:50:05');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plan`
--

DROP TABLE IF EXISTS `plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `state` int(11) DEFAULT NULL COMMENT '0未审核，1已审核，2审核未通过',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan`
--

LOCK TABLES `plan` WRITE;
/*!40000 ALTER TABLE `plan` DISABLE KEYS */;
INSERT INTO `plan` VALUES (1,1,'2016-05-06',1),(2,1,'2016-05-07',1),(3,1,'2016-05-08',1),(4,1,'2016-05-09',1),(5,1,'2016-05-10',1),(6,1,'2016-05-11',1),(7,1,'2016-05-12',1),(8,1,'2016-05-13',1),(9,1,'2016-05-14',1),(10,1,'2016-05-15',1),(11,1,'2016-05-16',1),(12,1,'2016-05-17',1),(13,1,'2016-05-18',1),(14,1,'2016-05-19',1),(15,1,'2016-05-20',1),(16,1,'2016-05-21',1),(17,1,'2016-05-22',1),(18,1,'2016-05-23',1),(19,1,'2016-05-24',1),(20,1,'2016-05-25',1),(21,1,'2016-05-26',1),(22,1,'2016-06-20',1),(23,1,'2016-06-21',1),(24,1,'2016-06-22',1),(25,1,'2016-06-23',1),(26,1,'2016-06-24',1),(27,1,'2016-06-25',1),(28,1,'2016-06-26',1);
/*!40000 ALTER TABLE `plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plan_item`
--

DROP TABLE IF EXISTS `plan_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plan_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plan_id` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `dessert_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` double(10,2) DEFAULT NULL,
  `remain` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `plan` (`plan_id`),
  KEY `dessert` (`dessert_id`),
  KEY `store` (`store_id`),
  CONSTRAINT `dessert` FOREIGN KEY (`dessert_id`) REFERENCES `dessert` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `plan` FOREIGN KEY (`plan_id`) REFERENCES `plan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `store` FOREIGN KEY (`store_id`) REFERENCES `store` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan_item`
--

LOCK TABLES `plan_item` WRITE;
/*!40000 ALTER TABLE `plan_item` DISABLE KEYS */;
INSERT INTO `plan_item` VALUES (1,1,1,1,36,16.00,33),(2,1,1,2,24,20.00,24),(3,1,1,3,30,18.00,30),(4,1,1,4,30,16.00,30),(5,2,1,1,30,16.00,30),(6,2,1,2,30,18.00,30),(7,2,1,3,30,18.00,30),(8,2,1,4,30,16.00,30),(9,3,1,1,30,16.00,30),(10,3,1,2,30,18.00,30),(11,3,1,3,30,18.00,30),(12,3,1,4,30,16.00,30),(13,4,1,1,30,16.00,30),(14,4,1,2,30,18.00,30),(15,4,1,3,30,18.00,30),(16,4,1,4,30,16.00,30),(17,5,1,1,30,16.00,30),(18,5,1,2,30,18.00,30),(19,5,1,3,30,18.00,30),(20,5,1,4,30,16.00,30),(21,6,1,1,30,16.00,30),(22,6,1,2,30,18.00,30),(23,6,1,3,30,18.00,30),(24,6,1,4,30,16.00,30),(25,7,1,1,30,16.00,30),(26,7,1,2,30,18.00,30),(27,7,1,3,30,18.00,30),(28,7,1,4,30,16.00,30),(29,8,1,1,30,16.00,30),(30,8,1,2,30,18.00,30),(31,8,1,3,30,18.00,30),(32,8,1,4,30,16.00,30),(33,9,1,1,30,16.00,30),(34,9,1,2,30,18.00,30),(35,9,1,3,30,18.00,30),(36,9,1,4,30,16.00,30),(37,10,1,1,30,16.00,30),(38,10,1,2,30,18.00,30),(39,10,1,3,30,18.00,30),(40,10,1,4,30,16.00,30),(41,11,1,1,30,16.00,30),(42,11,1,2,30,18.00,30),(43,11,1,3,30,18.00,30),(44,11,1,4,30,16.00,30),(45,12,1,1,30,16.00,30),(46,12,1,2,30,18.00,30),(47,12,1,3,30,18.00,30),(48,12,1,4,30,16.00,30),(49,13,1,1,30,16.00,30),(50,13,1,2,30,18.00,30),(51,13,1,3,30,18.00,30),(52,13,1,4,30,16.00,30),(53,14,1,1,30,16.00,30),(54,14,1,2,30,18.00,30),(55,14,1,3,30,18.00,30),(56,14,1,4,30,16.00,30),(57,15,1,1,30,16.00,30),(58,15,1,2,30,18.00,30),(59,15,1,3,30,18.00,30),(60,15,1,4,30,16.00,30),(61,16,1,1,30,16.00,30),(62,16,1,2,30,18.00,30),(63,16,1,3,30,18.00,30),(64,16,1,4,30,16.00,30),(65,17,1,1,30,16.00,30),(66,17,1,2,30,18.00,30),(67,17,1,3,30,18.00,30),(68,17,1,4,30,16.00,30),(69,18,1,1,30,16.00,30),(70,18,1,2,30,18.00,30),(71,18,1,3,30,18.00,30),(72,18,1,4,30,16.00,30),(73,19,1,1,30,16.00,30),(74,19,1,2,30,18.00,30),(75,19,1,3,30,18.00,30),(76,19,1,4,30,16.00,30),(77,20,1,1,30,16.00,30),(78,20,1,2,30,18.00,30),(79,20,1,3,30,18.00,30),(80,20,1,4,30,16.00,30),(81,21,1,1,30,16.00,30),(82,21,1,2,30,18.00,30),(83,21,1,3,30,18.00,30),(84,21,1,4,30,16.00,30),(85,22,1,1,30,16.00,30),(86,22,1,2,30,18.00,30),(87,22,1,3,30,18.00,30),(88,22,1,4,30,16.00,30),(89,23,1,1,30,16.00,30),(90,23,1,2,30,18.00,30),(91,23,1,3,30,18.00,30),(92,23,1,4,30,16.00,30),(93,24,1,1,30,16.00,29),(94,24,1,2,30,18.00,29),(95,24,1,3,30,18.00,30),(96,24,1,4,30,16.00,30),(97,25,1,1,30,16.00,30),(98,25,1,2,30,18.00,30),(99,25,1,3,30,18.00,30),(100,25,1,4,30,16.00,30),(101,26,1,1,30,16.00,30),(102,26,1,2,30,18.00,30),(103,26,1,3,30,18.00,30),(104,26,1,4,30,16.00,30),(105,27,1,1,30,16.00,30),(106,27,1,2,30,18.00,30),(107,27,1,3,30,18.00,30),(108,27,1,4,30,16.00,30),(109,28,1,1,30,16.00,30),(110,28,1,2,30,18.00,30),(111,28,1,3,30,18.00,30),(112,28,1,4,30,16.00,30);
/*!40000 ALTER TABLE `plan_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `point`
--

DROP TABLE IF EXISTS `point`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `point` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `value` double(10,1) DEFAULT '0.0',
  `type` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user` (`uid`),
  CONSTRAINT `user` FOREIGN KEY (`uid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `point`
--

LOCK TABLES `point` WRITE;
/*!40000 ALTER TABLE `point` DISABLE KEYS */;
INSERT INTO `point` VALUES (1,1,2.0,0,'2016-05-05 10:59:57'),(2,2,1.0,0,'2016-06-21 15:45:21'),(3,2,1.0,1,'2016-06-21 15:49:19');
/*!40000 ALTER TABLE `point` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sorder`
--

DROP TABLE IF EXISTS `sorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sorder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `type` int(11) DEFAULT NULL,
  `send_date` date NOT NULL,
  `total` double(10,1) NOT NULL DEFAULT '0.0',
  `discount` double(10,1) NOT NULL DEFAULT '0.0',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `store_id` int(11) DEFAULT NULL,
  `send_type` int(11) DEFAULT NULL COMMENT '自提/送货上门',
  `address_id` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL COMMENT '等待配送/配送中/完成之类',
  `saleman_id` int(11) DEFAULT NULL COMMENT '销售员id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sorder`
--

LOCK TABLES `sorder` WRITE;
/*!40000 ALTER TABLE `sorder` DISABLE KEYS */;
INSERT INTO `sorder` VALUES (1,1,1,'2016-05-06',48.0,0.0,'2016-05-05 10:59:56',1,NULL,NULL,NULL,NULL),(2,2,1,'2016-06-22',25.5,8.5,'2016-06-21 15:45:20',1,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sid` varchar(16) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,'admin','admin','12345567','admin',NULL,0),(2,'M000001','Nick','13345670000','123456',NULL,1),(3,'H000001','Amy','13590110023','123456',1,2),(5,'E000001','John','12345678','123456',2,3),(7,'H000002','Bob','111111','123456',1,3),(8,'E000002','V','222222','123456',6,3);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store`
--

DROP TABLE IF EXISTS `store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `tel` varchar(45) NOT NULL,
  `description` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store`
--

LOCK TABLES `store` WRITE;
/*!40000 ALTER TABLE `store` DISABLE KEYS */;
INSERT INTO `store` VALUES (1,'新街口店','中山路37号','80002234','介绍一下呗'),(2,'夫子庙店','乌衣巷4号','56749909','哈哈哈'),(3,'中山4号','中山北路325号','56743209',NULL),(4,'南京站5号店','南京站负一层','45623333','Desc'),(5,'新百3号','新百负一层','1234456','11111'),(6,'德基1号','德基B1层','123456','111');
/*!40000 ALTER TABLE `store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tel` varchar(45) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `nickname` varchar(45) DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `sex` int(11) DEFAULT '0',
  `password` varchar(32) NOT NULL,
  `avatar` varchar(512) DEFAULT NULL,
  `vip_id` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tel_UNIQUE` (`tel`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'18066083162','Jane','Jane','1995-08-16',0,'qazwsx',NULL,NULL),(2,'18020135373','王振聪','vboar','1995-06-30',1,'1995630','/Tian/upload/2.png',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-06-21 16:37:07
