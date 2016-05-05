/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50709
Source Host           : localhost:3306
Source Database       : dessert

Target Server Type    : MYSQL
Target Server Version : 50709
File Encoding         : 65001

Date: 2016-05-05 11:06:22
*/

SET FOREIGN_KEY_CHECKS=0;

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
  PRIMARY KEY (`id`),
  UNIQUE KEY `cart_item` (`user_id`,`dessert_id`,`store_id`,`date`),
  KEY `store_id` (`store_id`),
  KEY `dessert_id` (`dessert_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

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
  `type` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dessert
-- ----------------------------
INSERT INTO `dessert` VALUES ('1', '黑森林', '它融合了樱桃的酸、奶油的甜、樱桃酒的醇香。完美的黑森林蛋糕经得起各种口味的挑剔。', '16', null, '0');
INSERT INTO `dessert` VALUES ('2', '蜂蜜柚子茶', '清爽的颜色，浓郁的茶香，它的回味,清新,悠远,不华丽,却让人不能忘记,是留在唇齿之间的那段绵绵回忆。', '18', null, '1');
INSERT INTO `dessert` VALUES ('3', '抹茶慕斯', '清爽的颜色，浓郁的茶香，它的回味,清新,悠远,不华丽,却让人不能忘记,是留在唇齿之间的那段绵绵回忆。', '18', null, '0');
INSERT INTO `dessert` VALUES ('4', '甜品4', '好吃', '16', null, '0');

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
  `payword` varchar(6) NOT NULL,
  `bank_card` varchar(45) NOT NULL,
  `balance` double(10,1) DEFAULT '0.0',
  `suspend_time` datetime DEFAULT NULL,
  `active_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid_idx` (`uid`),
  CONSTRAINT `uid` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES ('1', 'V000001', '1', '0', '2', '1', '123456', '1234567822345678', '152.0', null, '2016-05-05 10:57:03');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of order_item
-- ----------------------------
INSERT INTO `order_item` VALUES ('1', '1', '1', '3', '16.0');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of payment
-- ----------------------------
INSERT INTO `payment` VALUES ('1', '1', '200.0', '2016-05-05 10:57:03');

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of plan
-- ----------------------------
INSERT INTO `plan` VALUES ('1', '1', '2016-05-06', '1');
INSERT INTO `plan` VALUES ('2', '1', '2016-05-07', '1');
INSERT INTO `plan` VALUES ('3', '1', '2016-05-08', '1');
INSERT INTO `plan` VALUES ('4', '1', '2016-05-09', '1');
INSERT INTO `plan` VALUES ('5', '1', '2016-05-10', '1');
INSERT INTO `plan` VALUES ('6', '1', '2016-05-11', '1');
INSERT INTO `plan` VALUES ('7', '1', '2016-05-12', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of plan_item
-- ----------------------------
INSERT INTO `plan_item` VALUES ('1', '1', '1', '1', '36', '16.00', '33');
INSERT INTO `plan_item` VALUES ('2', '1', '1', '2', '24', '20.00', '24');
INSERT INTO `plan_item` VALUES ('3', '1', '1', '3', '30', '18.00', '30');
INSERT INTO `plan_item` VALUES ('4', '1', '1', '4', '30', '16.00', '30');
INSERT INTO `plan_item` VALUES ('5', '2', '1', '1', '30', '16.00', '30');
INSERT INTO `plan_item` VALUES ('6', '2', '1', '2', '30', '18.00', '30');
INSERT INTO `plan_item` VALUES ('7', '2', '1', '3', '30', '18.00', '30');
INSERT INTO `plan_item` VALUES ('8', '2', '1', '4', '30', '16.00', '30');
INSERT INTO `plan_item` VALUES ('9', '3', '1', '1', '30', '16.00', '30');
INSERT INTO `plan_item` VALUES ('10', '3', '1', '2', '30', '18.00', '30');
INSERT INTO `plan_item` VALUES ('11', '3', '1', '3', '30', '18.00', '30');
INSERT INTO `plan_item` VALUES ('12', '3', '1', '4', '30', '16.00', '30');
INSERT INTO `plan_item` VALUES ('13', '4', '1', '1', '30', '16.00', '30');
INSERT INTO `plan_item` VALUES ('14', '4', '1', '2', '30', '18.00', '30');
INSERT INTO `plan_item` VALUES ('15', '4', '1', '3', '30', '18.00', '30');
INSERT INTO `plan_item` VALUES ('16', '4', '1', '4', '30', '16.00', '30');
INSERT INTO `plan_item` VALUES ('17', '5', '1', '1', '30', '16.00', '30');
INSERT INTO `plan_item` VALUES ('18', '5', '1', '2', '30', '18.00', '30');
INSERT INTO `plan_item` VALUES ('19', '5', '1', '3', '30', '18.00', '30');
INSERT INTO `plan_item` VALUES ('20', '5', '1', '4', '30', '16.00', '30');
INSERT INTO `plan_item` VALUES ('21', '6', '1', '1', '30', '16.00', '30');
INSERT INTO `plan_item` VALUES ('22', '6', '1', '2', '30', '18.00', '30');
INSERT INTO `plan_item` VALUES ('23', '6', '1', '3', '30', '18.00', '30');
INSERT INTO `plan_item` VALUES ('24', '6', '1', '4', '30', '16.00', '30');
INSERT INTO `plan_item` VALUES ('25', '7', '1', '1', '30', '16.00', '30');
INSERT INTO `plan_item` VALUES ('26', '7', '1', '2', '30', '18.00', '30');
INSERT INTO `plan_item` VALUES ('27', '7', '1', '3', '30', '18.00', '30');
INSERT INTO `plan_item` VALUES ('28', '7', '1', '4', '30', '16.00', '30');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of point
-- ----------------------------
INSERT INTO `point` VALUES ('1', '1', '2.0', '0', '2016-05-05 10:59:57');

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sorder
-- ----------------------------
INSERT INTO `sorder` VALUES ('1', '1', '1', '2016-05-06', '48.0', '0.0', '2016-05-05 10:59:56', '1');

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
INSERT INTO `staff` VALUES ('7', 'H000002', 'Bob', '111111', '123456', '1', '3');
INSERT INTO `staff` VALUES ('8', 'E000002', 'V', '222222', '123456', '6', '3');

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
INSERT INTO `store` VALUES ('5', '新百3号', '新百负一层', '1234456', '11111');
INSERT INTO `store` VALUES ('6', '德基1号', '德基B1层', '123456', '111');

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
  `address` varchar(256) DEFAULT NULL,
  `password` varchar(32) NOT NULL,
  `email` varchar(256) DEFAULT NULL,
  `avatar` varchar(512) DEFAULT NULL,
  `vip_id` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tel_UNIQUE` (`tel`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '18066083162', 'Jane', 'Jane', '1995-08-16', '0', 'Nanjing University SE', 'qazwsx', '', null, null);
