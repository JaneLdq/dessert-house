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
  `receiver` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'南京大学','18066083162',1,'');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1,1,1,2,1,'2016-06-24');
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
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '0蛋糕，1面包，2甜点，3咖啡，4茶饮，5果汁',
  `onshelf` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dessert`
--

LOCK TABLES `dessert` WRITE;
/*!40000 ALTER TABLE `dessert` DISABLE KEYS */;
INSERT INTO `dessert` VALUES (1,'雪域牛乳芝士蛋糕','到过阿尔卑斯山脉勃朗峰才发现，白，其实就这么纯粹。雪花忽聚忽散，轻盈降落在地上，化为一片白。那个清晨，我踏上厚厚的初雪，出乎意料，是松软的触感。',188,NULL,0,'2016-05-02'),(2,'提拉米苏乐脆蛋糕','带我走。是Tiramisu意大利文的意思。意大利甜品师用它带走了法国女孩的心，还在巴黎开了一间小店，分享这幸福的味道。他，令人芳心暗许。',218,NULL,0,'2016-06-13'),(3,'大尉蛋糕','轻柔的抹茶芝士慕斯与浓郁抹茶芝士的双倍浓醇，汇聚成对宋欧巴最浓烈的情感；巧克力戚风的甜蜜有着恋爱般的幸福滋味，迷彩蛋糕胚更是完美还原宋欧巴的制服诱惑，让蛋糕在品味的同时更是还原追剧时的迷恋甜蜜感。',128,NULL,0,'2016-06-24'),(4,'玫瑰雪域芝士蛋糕','一片玫瑰的海洋，映衬着少男少女那纯净的心境。这么多朵玫瑰花，总像有数不清的芬芳思念，诉不尽的感恩眷恋，所有声音都在轻声呢喃着誓约长久。',188,NULL,0,'2016-06-08'),(5,'双莓提拉米苏乐脆蛋糕','包裹浪漫的红色巧克力喷砂，编织每一口滋味的梦幻；草莓与桑莓的酸甜果味碰撞，擦出清新甜蜜的纯真乐趣，交织酥香与芝士奶油的绵密浓郁，口口留香，唇齿缠绵。浪漫的爱情故事，在味蕾中浓情上演。',188,NULL,0,'2016-06-11'),(6,'雪域大理石芝士蛋糕','简约的几何、原始的色调，却是不平凡的杰作。德国包豪斯设计往往是简单而有力。如琴键黑白之间合拍的跃动，谱出一段段震撼的乐曲。空气凝止，余韵仍萦绕不去。',188,NULL,0,'2016-06-14'),(7,'海盐乳酪芝士蛋糕','充满回忆的味道，总令人难以忘怀。那是西西里岛的风味，充满渔夫自然不造作的热情， 与素未谋面的我，分享渔获，分享喜悦。',188,NULL,0,'2016-06-22'),(8,'派对物语','当阿尔卑斯峰顶的纯雪遇上鲜莓，无限的思念开始蔓延，酸甜如同初次的相遇，清新怡人，浓郁香醇则如同相熟后的情谊，一切都是幸福的味道。',145,NULL,0,'2016-06-22'),(9,'芒果芒果蛋糕','到东南亚，是为了追逐所有金黄色。阳光，一如以往的金黄。大海，折射着一片金黄色的清澄。沙滩，是金黄色的幼滑。空气，泛着金黄色自有的香甜。（鲜果因时令季节变化，会做适当调整）',188,NULL,0,'2016-06-22'),(10,'繁星之吻','这世界色彩太多快乐也变得无所适从，而纯味奶油与酸甜蓝莓的混搭却能治愈快乐缺乏症。点缀在蓝紫色奶油上的颗颗果肉，犹如星空成为了每个人心中最神秘的向往。',188,NULL,0,'2016-06-22'),(11,'五重巧克力幻想蛋糕','一口尝，脆、香、浓、软、滑，五种层次，如置身在一个巧克力的漩涡，愈往上游，愈沉迷不舍。经典的巧克力，经典的时尚图案，已经成为永恒的象征。',218,NULL,0,'2016-06-22'),(12,'公主蛋糕','童年是一段像棉花糖一样柔软的记忆，人总叹息时日匆匆，带走了纯真的心境，却忘了童真带来的勇气，带领孩子，寻找内心的乐园。',188,NULL,0,'2016-06-22'),(13,'草莓拿破仑蛋糕','盒子上娇艳欲滴的红宝石，令人无法移开目光。像潘多拉的盒子，吸引好奇的味蕾。清脆的声音，没有惊醒少女的梦。（鲜果因时令季节变化，会做适当调整）',188,NULL,0,'2016-06-22'),(14,'芒果千层拿破仑蛋糕','太阳花，从法国的南部开到花都。 欢迎盛夏。巴黎小街填满了阳光，像拿破仑蛋糕薄脆之间的浓滑奶油。这……是我爱上仲夏的理由。（鲜果因时令季节变化，会做适当调整）',188,NULL,0,'2016-06-22'),(15,'环游世界·春夏季蛋糕','惊喜，是任性送给我的礼物。随心、随性、随感觉到处游历，每次都有新发现。惊喜，不用刻意安排。又或者，上天早已安排， 怎样，都好，就随意一点，任性一次吧。',218,NULL,0,'2016-06-22'),(16,'拿铁咖啡','牛奶的温润调味,让原本甘苦的咖啡变得柔滑香甜，甘美浓郁,就连不习惯喝咖啡的人,也难敌拿铁芳美的滋味。',32,NULL,3,'2016-06-24'),(17,'卡布奇诺','特浓咖啡的浓郁口味，配以润滑的奶泡，颇有一些汲精敛露的意味；撒上了肉桂 粉的起沫牛奶，混以自下而上的意大利咖啡的香气，新一代咖啡族为此而心动不已。',32,NULL,3,'2016-06-24');
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
  `payword` varchar(6) DEFAULT NULL,
  `bank_card` varchar(45) DEFAULT NULL,
  `balance` double(10,1) DEFAULT '0.0',
  `suspend_time` datetime DEFAULT NULL,
  `active_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid_idx` (`uid`),
  CONSTRAINT `uid` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (1,'V000001',1,3,2,1,'123456','1234567822345678123',19964.0,NULL,'2016-06-22 15:48:28');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_item`
--

LOCK TABLES `order_item` WRITE;
/*!40000 ALTER TABLE `order_item` DISABLE KEYS */;
INSERT INTO `order_item` VALUES (1,1,1,3,16.0);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,1,200.0,'2016-05-05 02:57:03'),(2,2,99999.0,'2016-06-21 07:33:27'),(3,2,999999.0,'2016-06-21 07:50:05'),(4,1,20000.0,'2016-06-22 07:48:30');
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
INSERT INTO `plan_item` VALUES (1,1,1,1,36,16.00,33),(2,1,1,2,24,20.00,24),(3,1,1,3,30,18.00,30),(4,1,1,4,30,16.00,30),(5,2,1,1,30,16.00,30),(6,2,1,2,30,18.00,30),(7,2,1,3,30,18.00,30),(8,2,1,4,30,16.00,30),(9,3,1,1,30,16.00,30),(10,3,1,2,30,18.00,30),(11,3,1,3,30,18.00,30),(12,3,1,4,30,16.00,30),(13,4,1,1,30,16.00,30),(14,4,1,2,30,18.00,30),(15,4,1,3,30,18.00,30),(16,4,1,4,30,16.00,30),(17,5,1,1,30,16.00,30),(18,5,1,2,30,18.00,30),(19,5,1,3,30,18.00,30),(20,5,1,4,30,16.00,30),(21,6,1,1,30,16.00,30),(22,6,1,2,30,18.00,30),(23,6,1,3,30,18.00,30),(24,6,1,4,30,16.00,30),(25,7,1,1,30,16.00,30),(26,7,1,2,30,18.00,30),(27,7,1,3,30,18.00,30),(28,7,1,4,30,16.00,30),(29,8,1,1,30,16.00,30),(30,8,1,2,30,18.00,30),(31,8,1,3,30,18.00,30),(32,8,1,4,30,16.00,30),(33,9,1,1,30,16.00,30),(34,9,1,2,30,18.00,30),(35,9,1,3,30,18.00,30),(36,9,1,4,30,16.00,30),(37,10,1,1,30,16.00,30),(38,10,1,2,30,18.00,30),(39,10,1,3,30,18.00,30),(40,10,1,4,30,16.00,30),(41,11,1,1,30,16.00,30),(42,11,1,2,30,18.00,30),(43,11,1,3,30,18.00,30),(44,11,1,4,30,16.00,30),(45,12,1,1,30,16.00,30),(46,12,1,2,30,18.00,30),(47,12,1,3,30,18.00,30),(48,12,1,4,30,16.00,30),(49,13,1,1,30,16.00,30),(50,13,1,2,30,18.00,30),(51,13,1,3,30,18.00,30),(52,13,1,4,30,16.00,30),(53,14,1,1,30,16.00,30),(54,14,1,2,30,18.00,30),(55,14,1,3,30,18.00,30),(56,14,1,4,30,16.00,30),(57,15,1,1,30,16.00,30),(58,15,1,2,30,18.00,30),(59,15,1,3,30,18.00,30),(60,15,1,4,30,16.00,30),(61,16,1,1,30,16.00,30),(62,16,1,2,30,18.00,30),(63,16,1,3,30,18.00,30),(64,16,1,4,30,16.00,30),(65,17,1,1,30,16.00,30),(66,17,1,2,30,18.00,30),(67,17,1,3,30,18.00,30),(68,17,1,4,30,16.00,30),(69,18,1,1,30,16.00,30),(70,18,1,2,30,18.00,30),(71,18,1,3,30,18.00,30),(72,18,1,4,30,16.00,30),(73,19,1,1,30,16.00,30),(74,19,1,2,30,18.00,30),(75,19,1,3,30,18.00,30),(76,19,1,4,30,16.00,30),(77,20,1,1,30,16.00,30),(78,20,1,2,30,18.00,30),(79,20,1,3,30,18.00,30),(80,20,1,4,30,16.00,30),(81,21,1,1,30,16.00,30),(82,21,1,2,30,18.00,30),(83,21,1,3,30,18.00,30),(84,21,1,4,30,16.00,30),(85,22,1,1,30,16.00,30),(86,22,1,2,30,18.00,30),(87,22,1,3,30,18.00,30),(88,22,1,4,30,16.00,30),(89,23,1,1,30,16.00,30),(90,23,1,2,30,18.00,30),(91,23,1,3,30,18.00,30),(92,23,1,4,30,16.00,30),(93,24,1,1,30,16.00,29),(94,24,1,2,30,18.00,29),(95,24,1,3,30,18.00,30),(96,24,1,4,30,16.00,30),(97,25,1,1,30,16.00,27),(98,25,1,2,30,18.00,30),(99,25,1,3,30,18.00,30),(100,25,1,4,30,16.00,30),(101,26,1,1,30,16.00,30),(102,26,1,2,30,18.00,30),(103,26,1,3,30,18.00,30),(104,26,1,4,30,16.00,30),(105,27,1,1,30,16.00,30),(106,27,1,2,30,18.00,30),(107,27,1,3,30,18.00,30),(108,27,1,4,30,16.00,30),(109,28,1,1,30,16.00,30),(110,28,1,2,30,18.00,30),(111,28,1,3,30,18.00,30),(112,28,1,4,30,16.00,30);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `point`
--

LOCK TABLES `point` WRITE;
/*!40000 ALTER TABLE `point` DISABLE KEYS */;
INSERT INTO `point` VALUES (1,1,2.0,0,'2016-06-22 15:49:36');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sorder`
--

LOCK TABLES `sorder` WRITE;
/*!40000 ALTER TABLE `sorder` DISABLE KEYS */;
INSERT INTO `sorder` VALUES (1,1,1,'2016-06-23',36.0,12.0,'2016-06-22 15:49:34',1,0,0,0,0);
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
  `avatar` varchar(512) DEFAULT '/Tian/img/avatar.jpg',
  `vip_id` varchar(16) DEFAULT NULL,
  `default_store` int(11) DEFAULT '1',
  `default_addr` int(11) DEFAULT NULL COMMENT '默认地址',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tel_UNIQUE` (`tel`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'18066083162','LDQ','Jane','1970-01-01',0,'123456','/Tian/upload/1.jpg',NULL,NULL,1);
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

-- Dump completed on 2016-06-24 16:36:59
