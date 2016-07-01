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
INSERT INTO `addition_item` VALUES ('8', '11', null, '规格', '1.2磅');
INSERT INTO `addition_item` VALUES ('25', '27', null, '规格', '2.2磅');

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
INSERT INTO `address` VALUES ('2', '南京大学', '18066080000', '2', '廖丹琪');
INSERT INTO `address` VALUES ('3', 'NJU', '18066080000', '3', 'Jane');
INSERT INTO `address` VALUES ('4', 'NJU', '18066080000', '4', 'Jane');
INSERT INTO `address` VALUES ('19', 'NJU', '18066083162', '1', 'Jane');
INSERT INTO `address` VALUES ('22', '南京大学', '18066083162', '1', '廖丹琪');
INSERT INTO `address` VALUES ('23', '南京大学', '18066083122', '5', 'Jane');
INSERT INTO `address` VALUES ('24', '1234567', '18066084444', '7', 'Jane');
INSERT INTO `address` VALUES ('25', 'NJU', '18066081212', '8', 'Jane');

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
INSERT INTO `dessert` VALUES ('6', '雪域大理石芝士蛋糕', '简约的几何、原始的色调，却是不平凡的杰作。德国包豪斯设计往往是简单而有力。如琴键黑白之间合拍的跃动，谱出一段段震撼的乐曲。空气凝止，余韵仍萦绕不去。', '188', null, '0', '2016-06-14');
INSERT INTO `dessert` VALUES ('7', '海盐乳酪芝士蛋糕', '充满回忆的味道，总令人难以忘怀。那是西西里岛的风味，充满渔夫自然不造作的热情， 与素未谋面的我，分享渔获，分享喜悦。', '188', null, '0', '2016-06-22');
INSERT INTO `dessert` VALUES ('8', '派对物语', '当阿尔卑斯峰顶的纯雪遇上鲜莓，无限的思念开始蔓延，酸甜如同初次的相遇，清新怡人，浓郁香醇则如同相熟后的情谊，一切都是幸福的味道。', '145', null, '0', '2016-06-22');
INSERT INTO `dessert` VALUES ('9', '芒果芒果蛋糕', '到东南亚，是为了追逐所有金黄色。阳光，一如以往的金黄。大海，折射着一片金黄色的清澄。沙滩，是金黄色的幼滑。空气，泛着金黄色自有的香甜。（鲜果因时令季节变化，会做适当调整）', '188', null, '0', '2016-06-22');
INSERT INTO `dessert` VALUES ('10', '繁星之吻', '这世界色彩太多快乐也变得无所适从，而纯味奶油与酸甜蓝莓的混搭却能治愈快乐缺乏症。点缀在蓝紫色奶油上的颗颗果肉，犹如星空成为了每个人心中最神秘的向往。', '188', null, '0', '2016-06-22');
INSERT INTO `dessert` VALUES ('11', '五重巧克力幻想蛋糕', '一口尝，脆、香、浓、软、滑，五种层次，如置身在一个巧克力的漩涡，愈往上游，愈沉迷不舍。经典的巧克力，经典的时尚图案，已经成为永恒的象征。', '218', null, '0', '2016-06-22');
INSERT INTO `dessert` VALUES ('12', '公主蛋糕', '童年是一段像棉花糖一样柔软的记忆，人总叹息时日匆匆，带走了纯真的心境，却忘了童真带来的勇气，带领孩子，寻找内心的乐园。', '188', null, '0', '2016-06-22');
INSERT INTO `dessert` VALUES ('13', '草莓拿破仑蛋糕', '盒子上娇艳欲滴的红宝石，令人无法移开目光。像潘多拉的盒子，吸引好奇的味蕾。清脆的声音，没有惊醒少女的梦。（鲜果因时令季节变化，会做适当调整）', '188', null, '0', '2016-06-22');
INSERT INTO `dessert` VALUES ('14', '芒果千层拿破仑蛋糕', '太阳花，从法国的南部开到花都。 欢迎盛夏。巴黎小街填满了阳光，像拿破仑蛋糕薄脆之间的浓滑奶油。这……是我爱上仲夏的理由。（鲜果因时令季节变化，会做适当调整）', '188', null, '0', '2016-06-22');
INSERT INTO `dessert` VALUES ('15', '环游世界·春夏季蛋糕', '惊喜，是任性送给我的礼物。随心、随性、随感觉到处游历，每次都有新发现。惊喜，不用刻意安排。又或者，上天早已安排， 怎样，都好，就随意一点，任性一次吧。', '218', null, '0', '2016-06-22');
INSERT INTO `dessert` VALUES ('16', '拿铁咖啡', '牛奶的温润调味,让原本甘苦的咖啡变得柔滑香甜，甘美浓郁,就连不习惯喝咖啡的人,也难敌拿铁芳美的滋味。', '32', null, '3', '2016-06-24');
INSERT INTO `dessert` VALUES ('17', '卡布奇诺', '特浓咖啡的浓郁口味，配以润滑的奶泡，颇有一些汲精敛露的意味；撒上了肉桂 粉的起沫牛奶，混以自下而上的意大利咖啡的香气，新一代咖啡族为此而心动不已。', '32', null, '3', '2016-06-24');
INSERT INTO `dessert` VALUES ('18', '全麦面包', '包含了所有麦类成分，使得全麦面包富含膳食纤维，营养价值极高，因此一直被奉为最健康的面包品种之一。这种面包质地较粗糙，有一股淡淡的谷香', '28', null, '1', '2016-06-25');
INSERT INTO `dessert` VALUES ('19', '白面包', '白面包（White Bread）仅由麦类最中心的胚乳部分做成，是最常见的面包之一。白面包质地较软，口感微甜，常搭配牛奶豆浆作为早餐食用，也可做主食', '28', null, '1', '2016-06-25');
INSERT INTO `dessert` VALUES ('20', '法式长棍', '法式长棍面包配方简单，营养丰富，麦香味浓郁，深受法国人及世界各地面包爱好者的喜爱', '32', null, '1', '2016-06-25');
INSERT INTO `dessert` VALUES ('21', '牛角包', '牛角面包（Croissant）状似牛角，外酥内软，是远近驰名的“维也纳甜面包”中最经典的面包。其造型来源众说纷纭，据说当年土耳其进攻维也纳时被连夜磨面粉的面包师发现，上报给了国王。当时维也纳为了纪念这个面包师，就把土耳其军队人手一把的“土耳其弯刀”做成了面包的模型。而对于基督徒而言，牛角面包象征的则是死亡与再生。在圣体仪式中，通常把象征“基督血液”的红酒搭配牛角面包一起祭奠，以表对基督的怀念与追思。', '32', null, '1', '2016-06-25');
INSERT INTO `dessert` VALUES ('22', '咖啡曲奇', '口感不干、不硬，酥松爽口，入口后，微苦清甜、香而不烈的云南小粒咖啡的味道立马弥漫舌尖，美滋滋的味蕾享受。', '28', null, '2', '2016-06-25');
INSERT INTO `dessert` VALUES ('23', '抹茶曲奇', '雪荞抹茶曲奇精选日本优质抹茶粉，茶粉细度高达1200目，人体更易吸收，清新茶香沁入心扉，如花如蜜，口感酥松细腻，美味丝滑。', '28', null, '2', '2016-06-25');
INSERT INTO `dessert` VALUES ('24', '雪荞芝麻曲奇', '芝麻曲奇是一款老少皆宜的糕点，清醇的芝麻香气，口感松软，入口即化，甜味适中。', '28', null, '2', '2016-06-25');
INSERT INTO `dessert` VALUES ('25', '巧克力巴菲蛋糕', '无法形容这款蛋糕的美妙滋味，也无法言语在炎夏吃到它时的惬意感觉。浓滑的巧克力芭菲与海绵蛋糕完美结合。', '28', null, '2', '2016-06-30');
INSERT INTO `dessert` VALUES ('26', '柠檬挞', '酸甜金黄色的挞馅，透着柠檬的清香、金黄色的挞壳被咬碎的一刹那，那满嘴的酥脆和酸甜混合的美味体验，一直让人难忘', '28', null, '2', '2016-06-30');
INSERT INTO `dessert` VALUES ('27', '提拉米苏', '提拉米苏之所以能成为一款经典甜点，不仅仅在于它有着浪漫的传说，还因为它独特的充满魅力的味道。', '26', null, '2', '2016-06-30');
INSERT INTO `dessert` VALUES ('28', '拿破仑', '食材组合新鲜及酥皮入口松化脆，外形设计讲究层次感及创意，令拿破仑蛋糕的形象焕然一新。', '28', null, '2', '2016-06-30');

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
INSERT INTO `member` VALUES ('1', 'V000001', '1', '3', '344', '1', '123456', '1234567822345678123', '14766.5', null, '2016-06-22 15:48:28');

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
INSERT INTO `payment` VALUES ('1', '1', '200.0', '2016-05-05 10:57:03');
INSERT INTO `payment` VALUES ('2', '2', '99999.0', '2016-06-21 15:33:27');
INSERT INTO `payment` VALUES ('3', '2', '999999.0', '2016-06-21 15:50:05');
INSERT INTO `payment` VALUES ('4', '1', '20000.0', '2016-06-22 15:48:30');

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
INSERT INTO `plan` VALUES ('1', '1', '2016-06-28', '1');
INSERT INTO `plan` VALUES ('2', '1', '2016-06-29', '1');
INSERT INTO `plan` VALUES ('3', '1', '2016-06-30', '1');
INSERT INTO `plan` VALUES ('4', '1', '2016-07-01', '1');
INSERT INTO `plan` VALUES ('5', '1', '2016-07-02', '1');
INSERT INTO `plan` VALUES ('6', '1', '2016-07-03', '1');
INSERT INTO `plan` VALUES ('7', '1', '2016-07-04', '1');
INSERT INTO `plan` VALUES ('8', '3', '2016-06-27', '1');
INSERT INTO `plan` VALUES ('9', '3', '2016-06-28', '1');
INSERT INTO `plan` VALUES ('10', '3', '2016-06-29', '1');
INSERT INTO `plan` VALUES ('11', '3', '2016-06-30', '1');
INSERT INTO `plan` VALUES ('12', '3', '2016-07-01', '1');
INSERT INTO `plan` VALUES ('13', '3', '2016-07-02', '1');
INSERT INTO `plan` VALUES ('14', '3', '2016-07-03', '1');

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
INSERT INTO `plan_item` VALUES ('1', '1', '1', '1', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('2', '1', '1', '2', '30', '218.00', '30');
INSERT INTO `plan_item` VALUES ('3', '1', '1', '3', '30', '128.00', '30');
INSERT INTO `plan_item` VALUES ('4', '1', '1', '4', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('5', '1', '1', '5', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('6', '1', '1', '6', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('7', '1', '1', '7', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('8', '1', '1', '8', '30', '145.00', '30');
INSERT INTO `plan_item` VALUES ('9', '1', '1', '9', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('10', '1', '1', '10', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('11', '1', '1', '11', '30', '218.00', '30');
INSERT INTO `plan_item` VALUES ('12', '1', '1', '12', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('13', '1', '1', '13', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('14', '1', '1', '14', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('15', '1', '1', '15', '30', '218.00', '30');
INSERT INTO `plan_item` VALUES ('16', '1', '1', '16', '30', '32.00', '30');
INSERT INTO `plan_item` VALUES ('17', '1', '1', '17', '30', '32.00', '30');
INSERT INTO `plan_item` VALUES ('18', '1', '1', '18', '30', '28.00', '30');
INSERT INTO `plan_item` VALUES ('19', '1', '1', '19', '30', '28.00', '30');
INSERT INTO `plan_item` VALUES ('20', '1', '1', '20', '30', '32.00', '30');
INSERT INTO `plan_item` VALUES ('21', '1', '1', '21', '30', '32.00', '30');
INSERT INTO `plan_item` VALUES ('22', '1', '1', '22', '30', '28.00', '30');
INSERT INTO `plan_item` VALUES ('23', '1', '1', '23', '30', '28.00', '30');
INSERT INTO `plan_item` VALUES ('24', '1', '1', '24', '30', '28.00', '30');
INSERT INTO `plan_item` VALUES ('25', '2', '1', '1', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('26', '2', '1', '2', '30', '218.00', '30');
INSERT INTO `plan_item` VALUES ('27', '2', '1', '3', '30', '128.00', '30');
INSERT INTO `plan_item` VALUES ('28', '2', '1', '4', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('29', '2', '1', '5', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('30', '2', '1', '6', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('31', '2', '1', '7', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('32', '2', '1', '8', '30', '145.00', '30');
INSERT INTO `plan_item` VALUES ('33', '2', '1', '9', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('34', '2', '1', '10', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('35', '2', '1', '11', '30', '218.00', '30');
INSERT INTO `plan_item` VALUES ('36', '2', '1', '12', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('37', '2', '1', '13', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('38', '2', '1', '14', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('39', '2', '1', '15', '30', '218.00', '30');
INSERT INTO `plan_item` VALUES ('40', '2', '1', '16', '30', '32.00', '30');
INSERT INTO `plan_item` VALUES ('41', '2', '1', '17', '30', '32.00', '30');
INSERT INTO `plan_item` VALUES ('42', '2', '1', '18', '30', '28.00', '30');
INSERT INTO `plan_item` VALUES ('43', '2', '1', '19', '30', '28.00', '30');
INSERT INTO `plan_item` VALUES ('44', '2', '1', '20', '30', '32.00', '30');
INSERT INTO `plan_item` VALUES ('45', '2', '1', '21', '30', '32.00', '30');
INSERT INTO `plan_item` VALUES ('46', '2', '1', '22', '30', '28.00', '30');
INSERT INTO `plan_item` VALUES ('47', '2', '1', '23', '30', '28.00', '30');
INSERT INTO `plan_item` VALUES ('48', '2', '1', '24', '30', '28.00', '30');
INSERT INTO `plan_item` VALUES ('49', '3', '1', '1', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('50', '3', '1', '2', '30', '218.00', '30');
INSERT INTO `plan_item` VALUES ('51', '3', '1', '3', '30', '128.00', '30');
INSERT INTO `plan_item` VALUES ('52', '3', '1', '4', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('53', '3', '1', '5', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('54', '3', '1', '6', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('55', '3', '1', '7', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('56', '3', '1', '8', '30', '145.00', '30');
INSERT INTO `plan_item` VALUES ('57', '3', '1', '9', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('58', '3', '1', '10', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('59', '3', '1', '11', '30', '218.00', '30');
INSERT INTO `plan_item` VALUES ('60', '3', '1', '12', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('61', '3', '1', '13', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('62', '3', '1', '14', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('63', '3', '1', '15', '30', '218.00', '30');
INSERT INTO `plan_item` VALUES ('64', '3', '1', '16', '30', '32.00', '30');
INSERT INTO `plan_item` VALUES ('65', '3', '1', '17', '30', '32.00', '30');
INSERT INTO `plan_item` VALUES ('66', '3', '1', '18', '30', '28.00', '30');
INSERT INTO `plan_item` VALUES ('67', '3', '1', '19', '30', '28.00', '30');
INSERT INTO `plan_item` VALUES ('68', '3', '1', '20', '30', '32.00', '30');
INSERT INTO `plan_item` VALUES ('69', '3', '1', '21', '30', '32.00', '30');
INSERT INTO `plan_item` VALUES ('70', '3', '1', '22', '30', '28.00', '30');
INSERT INTO `plan_item` VALUES ('71', '3', '1', '23', '30', '28.00', '30');
INSERT INTO `plan_item` VALUES ('72', '3', '1', '24', '30', '28.00', '30');
INSERT INTO `plan_item` VALUES ('73', '4', '1', '1', '30', '188.00', '28');
INSERT INTO `plan_item` VALUES ('74', '4', '1', '2', '30', '218.00', '30');
INSERT INTO `plan_item` VALUES ('75', '4', '1', '3', '30', '128.00', '30');
INSERT INTO `plan_item` VALUES ('76', '4', '1', '4', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('77', '4', '1', '5', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('78', '4', '1', '6', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('79', '4', '1', '7', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('80', '4', '1', '8', '30', '145.00', '30');
INSERT INTO `plan_item` VALUES ('81', '4', '1', '9', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('82', '4', '1', '10', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('83', '4', '1', '11', '30', '218.00', '30');
INSERT INTO `plan_item` VALUES ('84', '4', '1', '12', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('85', '4', '1', '13', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('86', '4', '1', '14', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('87', '4', '1', '15', '30', '218.00', '30');
INSERT INTO `plan_item` VALUES ('88', '4', '1', '16', '30', '32.00', '30');
INSERT INTO `plan_item` VALUES ('89', '4', '1', '17', '30', '32.00', '30');
INSERT INTO `plan_item` VALUES ('90', '4', '1', '18', '30', '28.00', '30');
INSERT INTO `plan_item` VALUES ('91', '4', '1', '19', '30', '28.00', '30');
INSERT INTO `plan_item` VALUES ('92', '4', '1', '20', '30', '32.00', '30');
INSERT INTO `plan_item` VALUES ('93', '4', '1', '21', '30', '32.00', '30');
INSERT INTO `plan_item` VALUES ('94', '4', '1', '22', '30', '28.00', '30');
INSERT INTO `plan_item` VALUES ('95', '4', '1', '23', '30', '28.00', '30');
INSERT INTO `plan_item` VALUES ('96', '4', '1', '24', '30', '28.00', '30');
INSERT INTO `plan_item` VALUES ('97', '5', '1', '1', '30', '188.00', '13');
INSERT INTO `plan_item` VALUES ('98', '5', '1', '2', '30', '218.00', '30');
INSERT INTO `plan_item` VALUES ('99', '5', '1', '3', '30', '128.00', '30');
INSERT INTO `plan_item` VALUES ('100', '5', '1', '4', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('101', '5', '1', '5', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('102', '5', '1', '6', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('103', '5', '1', '7', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('104', '5', '1', '8', '30', '145.00', '30');
INSERT INTO `plan_item` VALUES ('105', '5', '1', '9', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('106', '5', '1', '10', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('107', '5', '1', '11', '30', '218.00', '30');
INSERT INTO `plan_item` VALUES ('108', '5', '1', '12', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('109', '5', '1', '13', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('110', '5', '1', '14', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('111', '5', '1', '15', '30', '218.00', '30');
INSERT INTO `plan_item` VALUES ('112', '5', '1', '16', '30', '32.00', '30');
INSERT INTO `plan_item` VALUES ('113', '5', '1', '17', '30', '32.00', '30');
INSERT INTO `plan_item` VALUES ('114', '5', '1', '18', '30', '28.00', '30');
INSERT INTO `plan_item` VALUES ('115', '5', '1', '19', '30', '28.00', '30');
INSERT INTO `plan_item` VALUES ('116', '5', '1', '20', '30', '32.00', '30');
INSERT INTO `plan_item` VALUES ('117', '5', '1', '21', '30', '32.00', '30');
INSERT INTO `plan_item` VALUES ('118', '5', '1', '22', '30', '28.00', '30');
INSERT INTO `plan_item` VALUES ('119', '5', '1', '23', '30', '28.00', '30');
INSERT INTO `plan_item` VALUES ('120', '5', '1', '24', '30', '28.00', '30');
INSERT INTO `plan_item` VALUES ('121', '6', '1', '1', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('122', '6', '1', '2', '30', '218.00', '29');
INSERT INTO `plan_item` VALUES ('123', '6', '1', '3', '30', '128.00', '29');
INSERT INTO `plan_item` VALUES ('124', '6', '1', '4', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('125', '6', '1', '5', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('126', '6', '1', '6', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('127', '6', '1', '7', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('128', '6', '1', '8', '30', '145.00', '30');
INSERT INTO `plan_item` VALUES ('129', '6', '1', '9', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('130', '6', '1', '10', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('131', '6', '1', '11', '30', '218.00', '30');
INSERT INTO `plan_item` VALUES ('132', '6', '1', '12', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('133', '6', '1', '13', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('134', '6', '1', '14', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('135', '6', '1', '15', '30', '218.00', '30');
INSERT INTO `plan_item` VALUES ('136', '6', '1', '16', '30', '32.00', '30');
INSERT INTO `plan_item` VALUES ('137', '6', '1', '17', '30', '32.00', '30');
INSERT INTO `plan_item` VALUES ('138', '6', '1', '18', '30', '28.00', '30');
INSERT INTO `plan_item` VALUES ('139', '6', '1', '19', '30', '28.00', '30');
INSERT INTO `plan_item` VALUES ('140', '6', '1', '20', '30', '32.00', '30');
INSERT INTO `plan_item` VALUES ('141', '6', '1', '21', '30', '32.00', '30');
INSERT INTO `plan_item` VALUES ('142', '6', '1', '22', '30', '28.00', '30');
INSERT INTO `plan_item` VALUES ('143', '6', '1', '23', '30', '28.00', '30');
INSERT INTO `plan_item` VALUES ('144', '6', '1', '24', '30', '28.00', '30');
INSERT INTO `plan_item` VALUES ('145', '7', '1', '1', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('146', '7', '1', '2', '30', '218.00', '30');
INSERT INTO `plan_item` VALUES ('147', '7', '1', '3', '30', '128.00', '30');
INSERT INTO `plan_item` VALUES ('148', '7', '1', '4', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('149', '7', '1', '5', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('150', '7', '1', '6', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('151', '7', '1', '7', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('152', '7', '1', '8', '30', '145.00', '30');
INSERT INTO `plan_item` VALUES ('153', '7', '1', '9', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('154', '7', '1', '10', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('155', '7', '1', '11', '30', '218.00', '30');
INSERT INTO `plan_item` VALUES ('156', '7', '1', '12', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('157', '7', '1', '13', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('158', '7', '1', '14', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('159', '7', '1', '15', '30', '218.00', '30');
INSERT INTO `plan_item` VALUES ('160', '7', '1', '16', '30', '32.00', '30');
INSERT INTO `plan_item` VALUES ('161', '7', '1', '17', '30', '32.00', '30');
INSERT INTO `plan_item` VALUES ('162', '7', '1', '18', '30', '28.00', '30');
INSERT INTO `plan_item` VALUES ('163', '7', '1', '19', '30', '28.00', '30');
INSERT INTO `plan_item` VALUES ('164', '7', '1', '20', '30', '32.00', '30');
INSERT INTO `plan_item` VALUES ('165', '7', '1', '21', '30', '32.00', '30');
INSERT INTO `plan_item` VALUES ('166', '7', '1', '22', '30', '28.00', '30');
INSERT INTO `plan_item` VALUES ('167', '7', '1', '23', '30', '28.00', '30');
INSERT INTO `plan_item` VALUES ('168', '7', '1', '24', '30', '28.00', '30');
INSERT INTO `plan_item` VALUES ('169', '8', '3', '1', '40', '188.00', '40');
INSERT INTO `plan_item` VALUES ('170', '8', '3', '2', '30', '218.00', '30');
INSERT INTO `plan_item` VALUES ('171', '8', '3', '3', '30', '128.00', '30');
INSERT INTO `plan_item` VALUES ('172', '8', '3', '4', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('173', '8', '3', '5', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('174', '8', '3', '6', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('175', '8', '3', '7', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('176', '8', '3', '8', '30', '145.00', '30');
INSERT INTO `plan_item` VALUES ('177', '8', '3', '9', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('178', '8', '3', '10', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('179', '8', '3', '11', '30', '218.00', '30');
INSERT INTO `plan_item` VALUES ('180', '8', '3', '12', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('181', '8', '3', '13', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('182', '8', '3', '14', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('183', '8', '3', '15', '30', '218.00', '30');
INSERT INTO `plan_item` VALUES ('184', '8', '3', '16', '30', '32.00', '30');
INSERT INTO `plan_item` VALUES ('185', '8', '3', '17', '30', '32.00', '30');
INSERT INTO `plan_item` VALUES ('186', '8', '3', '18', '30', '28.00', '30');
INSERT INTO `plan_item` VALUES ('187', '8', '3', '19', '30', '28.00', '30');
INSERT INTO `plan_item` VALUES ('188', '8', '3', '20', '30', '32.00', '30');
INSERT INTO `plan_item` VALUES ('189', '8', '3', '21', '30', '32.00', '30');
INSERT INTO `plan_item` VALUES ('190', '8', '3', '22', '30', '28.00', '30');
INSERT INTO `plan_item` VALUES ('191', '8', '3', '23', '30', '28.00', '30');
INSERT INTO `plan_item` VALUES ('192', '8', '3', '24', '30', '28.00', '30');
INSERT INTO `plan_item` VALUES ('193', '9', '3', '1', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('194', '9', '3', '2', '30', '218.00', '30');
INSERT INTO `plan_item` VALUES ('195', '9', '3', '3', '30', '128.00', '30');
INSERT INTO `plan_item` VALUES ('196', '9', '3', '4', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('197', '9', '3', '5', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('198', '9', '3', '6', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('199', '9', '3', '7', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('200', '9', '3', '8', '30', '145.00', '30');
INSERT INTO `plan_item` VALUES ('201', '9', '3', '9', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('202', '9', '3', '10', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('203', '9', '3', '11', '30', '218.00', '30');
INSERT INTO `plan_item` VALUES ('204', '9', '3', '12', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('205', '9', '3', '13', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('206', '9', '3', '14', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('207', '9', '3', '15', '30', '218.00', '30');
INSERT INTO `plan_item` VALUES ('208', '9', '3', '16', '30', '32.00', '30');
INSERT INTO `plan_item` VALUES ('209', '9', '3', '17', '30', '32.00', '30');
INSERT INTO `plan_item` VALUES ('210', '9', '3', '18', '30', '28.00', '30');
INSERT INTO `plan_item` VALUES ('211', '9', '3', '19', '30', '28.00', '30');
INSERT INTO `plan_item` VALUES ('212', '9', '3', '20', '30', '32.00', '30');
INSERT INTO `plan_item` VALUES ('213', '9', '3', '21', '30', '32.00', '30');
INSERT INTO `plan_item` VALUES ('214', '9', '3', '22', '30', '28.00', '30');
INSERT INTO `plan_item` VALUES ('215', '9', '3', '23', '30', '28.00', '30');
INSERT INTO `plan_item` VALUES ('216', '9', '3', '24', '30', '28.00', '30');
INSERT INTO `plan_item` VALUES ('217', '10', '3', '1', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('218', '10', '3', '2', '30', '218.00', '30');
INSERT INTO `plan_item` VALUES ('219', '10', '3', '3', '30', '128.00', '30');
INSERT INTO `plan_item` VALUES ('220', '10', '3', '4', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('221', '10', '3', '5', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('222', '10', '3', '6', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('223', '10', '3', '7', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('224', '10', '3', '8', '30', '145.00', '30');
INSERT INTO `plan_item` VALUES ('225', '10', '3', '9', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('226', '10', '3', '10', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('227', '10', '3', '11', '30', '218.00', '30');
INSERT INTO `plan_item` VALUES ('228', '10', '3', '12', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('229', '10', '3', '13', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('230', '10', '3', '14', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('231', '10', '3', '15', '30', '218.00', '30');
INSERT INTO `plan_item` VALUES ('232', '10', '3', '16', '30', '32.00', '30');
INSERT INTO `plan_item` VALUES ('233', '10', '3', '17', '30', '32.00', '30');
INSERT INTO `plan_item` VALUES ('234', '10', '3', '18', '30', '28.00', '30');
INSERT INTO `plan_item` VALUES ('235', '10', '3', '19', '30', '28.00', '30');
INSERT INTO `plan_item` VALUES ('236', '10', '3', '20', '30', '32.00', '30');
INSERT INTO `plan_item` VALUES ('237', '10', '3', '21', '30', '32.00', '30');
INSERT INTO `plan_item` VALUES ('238', '10', '3', '22', '30', '28.00', '30');
INSERT INTO `plan_item` VALUES ('239', '10', '3', '23', '30', '28.00', '30');
INSERT INTO `plan_item` VALUES ('240', '10', '3', '24', '30', '28.00', '30');
INSERT INTO `plan_item` VALUES ('241', '11', '3', '1', '30', '188.00', '27');
INSERT INTO `plan_item` VALUES ('242', '11', '3', '2', '30', '218.00', '27');
INSERT INTO `plan_item` VALUES ('243', '11', '3', '3', '30', '128.00', '30');
INSERT INTO `plan_item` VALUES ('244', '11', '3', '4', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('245', '11', '3', '5', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('246', '11', '3', '6', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('247', '11', '3', '7', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('248', '11', '3', '8', '30', '145.00', '30');
INSERT INTO `plan_item` VALUES ('249', '11', '3', '9', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('250', '11', '3', '10', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('251', '11', '3', '11', '30', '218.00', '30');
INSERT INTO `plan_item` VALUES ('252', '11', '3', '12', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('253', '11', '3', '13', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('254', '11', '3', '14', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('255', '11', '3', '15', '30', '218.00', '30');
INSERT INTO `plan_item` VALUES ('256', '11', '3', '16', '30', '32.00', '30');
INSERT INTO `plan_item` VALUES ('257', '11', '3', '17', '30', '32.00', '30');
INSERT INTO `plan_item` VALUES ('258', '11', '3', '18', '30', '28.00', '27');
INSERT INTO `plan_item` VALUES ('259', '11', '3', '19', '30', '28.00', '29');
INSERT INTO `plan_item` VALUES ('260', '11', '3', '20', '30', '32.00', '30');
INSERT INTO `plan_item` VALUES ('261', '11', '3', '21', '30', '32.00', '30');
INSERT INTO `plan_item` VALUES ('262', '11', '3', '22', '30', '28.00', '30');
INSERT INTO `plan_item` VALUES ('263', '11', '3', '23', '30', '28.00', '27');
INSERT INTO `plan_item` VALUES ('264', '11', '3', '24', '30', '28.00', '30');
INSERT INTO `plan_item` VALUES ('265', '12', '3', '1', '30', '188.00', '29');
INSERT INTO `plan_item` VALUES ('266', '12', '3', '2', '30', '218.00', '30');
INSERT INTO `plan_item` VALUES ('267', '12', '3', '3', '30', '128.00', '30');
INSERT INTO `plan_item` VALUES ('268', '12', '3', '4', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('269', '12', '3', '5', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('270', '12', '3', '6', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('271', '12', '3', '7', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('272', '12', '3', '8', '30', '145.00', '30');
INSERT INTO `plan_item` VALUES ('273', '12', '3', '9', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('274', '12', '3', '10', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('275', '12', '3', '11', '30', '218.00', '30');
INSERT INTO `plan_item` VALUES ('276', '12', '3', '12', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('277', '12', '3', '13', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('278', '12', '3', '14', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('279', '12', '3', '15', '30', '218.00', '30');
INSERT INTO `plan_item` VALUES ('280', '12', '3', '16', '30', '32.00', '30');
INSERT INTO `plan_item` VALUES ('281', '12', '3', '17', '30', '32.00', '30');
INSERT INTO `plan_item` VALUES ('282', '12', '3', '18', '30', '28.00', '30');
INSERT INTO `plan_item` VALUES ('283', '12', '3', '19', '30', '28.00', '30');
INSERT INTO `plan_item` VALUES ('284', '12', '3', '20', '30', '32.00', '30');
INSERT INTO `plan_item` VALUES ('285', '12', '3', '21', '30', '32.00', '30');
INSERT INTO `plan_item` VALUES ('286', '12', '3', '22', '30', '28.00', '30');
INSERT INTO `plan_item` VALUES ('287', '12', '3', '23', '30', '28.00', '30');
INSERT INTO `plan_item` VALUES ('288', '12', '3', '24', '30', '28.00', '30');
INSERT INTO `plan_item` VALUES ('289', '13', '3', '1', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('290', '13', '3', '2', '30', '218.00', '30');
INSERT INTO `plan_item` VALUES ('291', '13', '3', '3', '30', '128.00', '30');
INSERT INTO `plan_item` VALUES ('292', '13', '3', '4', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('293', '13', '3', '5', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('294', '13', '3', '6', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('295', '13', '3', '7', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('296', '13', '3', '8', '30', '145.00', '30');
INSERT INTO `plan_item` VALUES ('297', '13', '3', '9', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('298', '13', '3', '10', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('299', '13', '3', '11', '30', '218.00', '30');
INSERT INTO `plan_item` VALUES ('300', '13', '3', '12', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('301', '13', '3', '13', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('302', '13', '3', '14', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('303', '13', '3', '15', '30', '218.00', '30');
INSERT INTO `plan_item` VALUES ('304', '13', '3', '16', '30', '32.00', '30');
INSERT INTO `plan_item` VALUES ('305', '13', '3', '17', '30', '32.00', '30');
INSERT INTO `plan_item` VALUES ('306', '13', '3', '18', '30', '28.00', '30');
INSERT INTO `plan_item` VALUES ('307', '13', '3', '19', '30', '28.00', '30');
INSERT INTO `plan_item` VALUES ('308', '13', '3', '20', '30', '32.00', '30');
INSERT INTO `plan_item` VALUES ('309', '13', '3', '21', '30', '32.00', '30');
INSERT INTO `plan_item` VALUES ('310', '13', '3', '22', '30', '28.00', '30');
INSERT INTO `plan_item` VALUES ('311', '13', '3', '23', '30', '28.00', '30');
INSERT INTO `plan_item` VALUES ('312', '13', '3', '24', '30', '28.00', '30');
INSERT INTO `plan_item` VALUES ('313', '14', '3', '1', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('314', '14', '3', '2', '30', '218.00', '30');
INSERT INTO `plan_item` VALUES ('315', '14', '3', '3', '30', '128.00', '30');
INSERT INTO `plan_item` VALUES ('316', '14', '3', '4', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('317', '14', '3', '5', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('318', '14', '3', '6', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('319', '14', '3', '7', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('320', '14', '3', '8', '30', '145.00', '30');
INSERT INTO `plan_item` VALUES ('321', '14', '3', '9', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('322', '14', '3', '10', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('323', '14', '3', '11', '30', '218.00', '30');
INSERT INTO `plan_item` VALUES ('324', '14', '3', '12', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('325', '14', '3', '13', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('326', '14', '3', '14', '30', '188.00', '30');
INSERT INTO `plan_item` VALUES ('327', '14', '3', '15', '30', '218.00', '30');
INSERT INTO `plan_item` VALUES ('328', '14', '3', '16', '30', '32.00', '30');
INSERT INTO `plan_item` VALUES ('329', '14', '3', '17', '30', '32.00', '30');
INSERT INTO `plan_item` VALUES ('330', '14', '3', '18', '30', '28.00', '30');
INSERT INTO `plan_item` VALUES ('331', '14', '3', '19', '30', '28.00', '30');
INSERT INTO `plan_item` VALUES ('332', '14', '3', '20', '30', '32.00', '30');
INSERT INTO `plan_item` VALUES ('333', '14', '3', '21', '30', '32.00', '30');
INSERT INTO `plan_item` VALUES ('334', '14', '3', '22', '30', '28.00', '30');
INSERT INTO `plan_item` VALUES ('335', '14', '3', '23', '30', '28.00', '30');
INSERT INTO `plan_item` VALUES ('336', '14', '3', '24', '30', '28.00', '30');

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
INSERT INTO `point` VALUES ('1', '1', '2.0', '0', '2016-06-22 15:49:36');
INSERT INTO `point` VALUES ('2', '1', '9.0', '0', '2016-06-27 13:16:11');
INSERT INTO `point` VALUES ('3', '1', '9.0', '0', '2016-06-29 19:43:43');
INSERT INTO `point` VALUES ('4', '1', '1.0', '0', '2016-06-29 19:59:31');
INSERT INTO `point` VALUES ('5', '1', '9.0', '0', '2016-06-29 20:05:13');
INSERT INTO `point` VALUES ('6', '1', '4.0', '0', '2016-06-29 20:07:26');
INSERT INTO `point` VALUES ('7', '1', '10.0', '0', '2016-06-29 20:08:09');
INSERT INTO `point` VALUES ('8', '1', '9.0', '0', '2016-06-29 20:09:00');
INSERT INTO `point` VALUES ('9', '1', '10.0', '0', '2016-06-29 20:09:37');
INSERT INTO `point` VALUES ('10', '1', '9.0', '0', '2016-06-29 20:10:19');
INSERT INTO `point` VALUES ('11', '1', '4.0', '0', '2016-06-29 20:57:53');
INSERT INTO `point` VALUES ('12', '1', '10.0', '0', '2016-06-29 21:43:45');
INSERT INTO `point` VALUES ('13', '1', '1.0', '0', '2016-07-01 00:28:13');
INSERT INTO `point` VALUES ('14', '1', '9.0', '0', '2016-07-01 14:31:50');
INSERT INTO `point` VALUES ('15', '1', '20.0', '0', '2016-07-01 19:25:58');
INSERT INTO `point` VALUES ('16', '1', '-15.0', '0', '2016-07-01 21:01:04');
INSERT INTO `point` VALUES ('17', '1', '-7.0', '0', '2016-07-01 21:06:41');
INSERT INTO `point` VALUES ('18', '1', '-1.0', '0', '2016-07-01 21:08:59');
INSERT INTO `point` VALUES ('19', '1', '10.0', '0', '2016-07-01 21:12:06');
INSERT INTO `point` VALUES ('20', '1', '15.0', '0', '2016-07-01 21:46:28');
INSERT INTO `point` VALUES ('21', '1', '9.0', '0', '2016-07-01 21:46:28');
INSERT INTO `point` VALUES ('22', '1', '-7.0', '0', '2016-07-01 21:48:14');
INSERT INTO `point` VALUES ('23', '1', '9.0', '0', '2016-07-01 23:25:47');
INSERT INTO `point` VALUES ('24', '1', '9.0', '0', '2016-07-01 23:29:42');
INSERT INTO `point` VALUES ('25', '1', '-7.0', '0', '2016-07-01 23:29:46');
INSERT INTO `point` VALUES ('26', '1', '9.0', '0', '2016-07-01 23:29:53');
INSERT INTO `point` VALUES ('27', '1', '9.0', '0', '2016-07-01 23:29:56');
INSERT INTO `point` VALUES ('28', '1', '9.0', '0', '2016-07-01 23:30:01');
INSERT INTO `point` VALUES ('29', '1', '9.0', '0', '2016-07-01 23:32:41');
INSERT INTO `point` VALUES ('30', '1', '9.0', '0', '2016-07-01 23:32:45');
INSERT INTO `point` VALUES ('31', '1', '9.0', '0', '2016-07-01 23:32:49');
INSERT INTO `point` VALUES ('32', '1', '9.0', '0', '2016-07-01 23:33:04');
INSERT INTO `point` VALUES ('33', '1', '9.0', '0', '2016-07-01 23:33:31');
INSERT INTO `point` VALUES ('34', '1', '9.0', '0', '2016-07-01 23:33:45');
INSERT INTO `point` VALUES ('35', '1', '9.0', '0', '2016-07-01 23:35:59');
INSERT INTO `point` VALUES ('36', '1', '9.0', '0', '2016-07-01 23:36:37');
INSERT INTO `point` VALUES ('37', '1', '9.0', '0', '2016-07-01 23:37:37');
INSERT INTO `point` VALUES ('38', '1', '9.0', '0', '2016-07-01 23:40:00');
INSERT INTO `point` VALUES ('39', '1', '9.0', '0', '2016-07-01 23:40:14');
INSERT INTO `point` VALUES ('40', '1', '9.0', '0', '2016-07-01 23:40:25');
INSERT INTO `point` VALUES ('41', '1', '9.0', '0', '2016-07-01 23:45:06');
INSERT INTO `point` VALUES ('42', '1', '9.0', '0', '2016-07-01 23:45:12');
INSERT INTO `point` VALUES ('43', '1', '9.0', '0', '2016-07-01 23:45:18');
INSERT INTO `point` VALUES ('44', '1', '9.0', '0', '2016-07-01 23:45:39');
INSERT INTO `point` VALUES ('45', '1', '42.0', '0', '2016-07-02 00:36:42');

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
INSERT INTO `user` VALUES ('1', '18066083162', 'LDQ', 'Jane', '1970-01-01', '0', '123456', '/Tian/upload/1.jpg', null, '2', '19');
