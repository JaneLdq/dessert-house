/*
Navicat MySQL Data Transfer

Source Server         : dessert
Source Server Version : 50712
Source Host           : localhost:3306
Source Database       : dessert

Target Server Type    : MYSQL
Target Server Version : 50712
File Encoding         : 65001

Date: 2016-07-02 00:47:29
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for addition_item
-- ----------------------------
DROP TABLE IF EXISTS `addition_item`;
CREATE TABLE `addition_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cart_id` int(11) DEFAULT NULL,
  `order_item_id` int(11) DEFAULT NULL,
  `keyword` varchar(255) DEFAULT NULL,
  `val` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of addition_item
-- ----------------------------

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) NOT NULL,
  `tel` varchar(45) NOT NULL,
  `uid` int(11) NOT NULL,
  `receiver` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of address
-- ----------------------------

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `dessert_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `date` date NOT NULL,
  `price` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cart_item` (`user_id`,`dessert_id`,`store_id`,`date`),
  KEY `store_id` (`store_id`),
  KEY `dessert_id` (`dessert_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of cart
-- ----------------------------

-- ----------------------------
-- Table structure for dessert
-- ----------------------------
DROP TABLE IF EXISTS `dessert`;
CREATE TABLE `dessert` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `desc` varchar(512) DEFAULT NULL,
  `price` int(11) NOT NULL DEFAULT '12',
  `picture` varchar(512) DEFAULT NULL,
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '0蛋糕，1面包，2甜点，3咖啡，4茶饮，5果汁',
  `onshelf` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dessert
-- ----------------------------
INSERT INTO `dessert` VALUES ('1', '雪域牛乳芝士蛋糕', '到过阿尔卑斯山脉勃朗峰才发现，白，其实就这么纯粹。雪花忽聚忽散，轻盈降落在地上，化为一片白。那个清晨，我踏上厚厚的初雪，出乎意料，是松软的触感。', '188', null, '0', '2016-05-02');
INSERT INTO `dessert` VALUES ('2', '提拉米苏乐脆蛋糕', '带我走。是Tiramisu意大利文的意思。意大利甜品师用它带走了法国女孩的心，还在巴黎开了一间小店，分享这幸福的味道。他，令人芳心暗许。', '218', null, '0', '2016-06-13');
INSERT INTO `dessert` VALUES ('3', '大尉蛋糕', '轻柔的抹茶芝士慕斯与浓郁抹茶芝士的双倍浓醇，汇聚成对宋欧巴最浓烈的情感；巧克力戚风的甜蜜有着恋爱般的幸福滋味，迷彩蛋糕胚更是完美还原宋欧巴的制服诱惑，让蛋糕在品味的同时更是还原追剧时的迷恋甜蜜感。', '128', null, '0', '2016-06-24');
INSERT INTO `dessert` VALUES ('4', '玫瑰雪域芝士蛋糕', '一片玫瑰的海洋，映衬着少男少女那纯净的心境。这么多朵玫瑰花，总像有数不清的芬芳思念，诉不尽的感恩眷恋，所有声音都在轻声呢喃着誓约长久。', '188', null, '0', '2016-06-08');
INSERT INTO `dessert` VALUES ('5', '双莓提拉米苏乐脆蛋糕', '包裹浪漫的红色巧克力喷砂，编织每一口滋味的梦幻；草莓与桑莓的酸甜果味碰撞，擦出清新甜蜜的纯真乐趣，交织酥香与芝士奶油的绵密浓郁，口口留香，唇齿缠绵。浪漫的爱情故事，在味蕾中浓情上演。', '188', null, '0', '2016-06-11');

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of member
-- ----------------------------

-- ----------------------------
-- Table structure for order_item
-- ----------------------------
DROP TABLE IF EXISTS `order_item`;
CREATE TABLE `order_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `dessert_id` int(11) NOT NULL,
  `quantity` int(255) DEFAULT '0',
  `price` double(10,1) DEFAULT '0.0',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `order_id` FOREIGN KEY (`order_id`) REFERENCES `sorder` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of order_item
-- ----------------------------

-- ----------------------------
-- Table structure for payment
-- ----------------------------
DROP TABLE IF EXISTS `payment`;
CREATE TABLE `payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `value` double(10,1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of payment
-- ----------------------------

-- ----------------------------
-- Table structure for plan
-- ----------------------------
DROP TABLE IF EXISTS `plan`;
CREATE TABLE `plan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `state` int(11) DEFAULT NULL COMMENT '0未审核，1已审核，2审核未通过',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of plan
-- ----------------------------

-- ----------------------------
-- Table structure for plan_item
-- ----------------------------
DROP TABLE IF EXISTS `plan_item`;
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
) ENGINE=InnoDB AUTO_INCREMENT=337 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of plan_item
-- ----------------------------

-- ----------------------------
-- Table structure for point
-- ----------------------------
DROP TABLE IF EXISTS `point`;
CREATE TABLE `point` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `value` double(10,1) DEFAULT '0.0',
  `type` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user` (`uid`),
  CONSTRAINT `user` FOREIGN KEY (`uid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of point
-- ----------------------------

-- ----------------------------
-- Table structure for sorder
-- ----------------------------
DROP TABLE IF EXISTS `sorder`;
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
  `remark` varchar(512) CHARACTER SET utf8 DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sorder
-- ----------------------------

-- ----------------------------
-- Table structure for staff
-- ----------------------------
DROP TABLE IF EXISTS `staff`;
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

-- ----------------------------
-- Records of staff
-- ----------------------------
INSERT INTO `staff` VALUES ('1', 'admin', 'admin', '12345567', 'admin', null, '0');
INSERT INTO `staff` VALUES ('2', 'M000001', 'Nick', '13345670000', '123456', null, '1');
INSERT INTO `staff` VALUES ('3', 'H000001', 'Amy', '13590110023', '123456', '1', '2');
INSERT INTO `staff` VALUES ('5', 'E000001', 'John', '12345678', '123456', '2', '3');
-- ----------------------------
-- Table structure for store
-- ----------------------------
DROP TABLE IF EXISTS `store`;
CREATE TABLE `store` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `tel` varchar(45) NOT NULL,
  `description` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of store
-- ----------------------------
INSERT INTO `store` VALUES ('1', '新街口店', '中山路37号', '80002234', '介绍一下呗');
INSERT INTO `store` VALUES ('2', '夫子庙店', '乌衣巷4号', '56749909', '哈哈哈');
INSERT INTO `store` VALUES ('3', '中山4号', '中山北路325号', '56743209', null);
INSERT INTO `store` VALUES ('4', '南京站5号店', '南京站负一层', '45623333', 'Desc');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
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
  `default_store` int(11) DEFAULT '1',
  `default_addr` int(11) DEFAULT NULL COMMENT '默认地址',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tel_UNIQUE` (`tel`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
