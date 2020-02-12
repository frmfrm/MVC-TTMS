/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50716
 Source Host           : localhost:3306
 Source Schema         : ttmsshu

 Target Server Type    : MySQL
 Target Server Version : 50716
 File Encoding         : 65001

 Date: 25/06/2019 21:46:23
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for data_dict
-- ----------------------------
DROP TABLE IF EXISTS `data_dict`;
CREATE TABLE `data_dict`  (
  `dict_id` int(11) NOT NULL AUTO_INCREMENT,
  `dict_parent_id` int(11) NULL DEFAULT NULL,
  `dict_index` int(11) NULL DEFAULT NULL,
  `dict_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dict_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`dict_id`) USING BTREE,
  INDEX `FK_super_child_dict`(`dict_parent_id`) USING BTREE,
  CONSTRAINT `FK_super_child_dict` FOREIGN KEY (`dict_parent_id`) REFERENCES `data_dict` (`dict_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of data_dict
-- ----------------------------
INSERT INTO `data_dict` VALUES (1, 1, 1, '数据字典', '根');
INSERT INTO `data_dict` VALUES (2, 1, 1, 'primary', '影片类型');
INSERT INTO `data_dict` VALUES (3, 1, 2, 'primary', '影片语言');
INSERT INTO `data_dict` VALUES (4, 1, 3, '锁失效时间', '5');
INSERT INTO `data_dict` VALUES (5, 2, 1, 'costume drama', '古装剧');
INSERT INTO `data_dict` VALUES (6, 2, 2, 'Time_Travel', '穿越剧');
INSERT INTO `data_dict` VALUES (7, 2, 3, 'life drama', '生活剧');
INSERT INTO `data_dict` VALUES (8, 2, 4, 'love drama', '爱情片');
INSERT INTO `data_dict` VALUES (9, 3, 1, 'chinese', '汉语');
INSERT INTO `data_dict` VALUES (10, 3, 2, 'eglish', '英语');
INSERT INTO `data_dict` VALUES (11, 2, 5, 'science fiction', '科幻片');
INSERT INTO `data_dict` VALUES (12, 2, 6, 'cartoon', '动画片');

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_no` char(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `emp_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `emp_telNum` char(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `address` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `bankcarid` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `paypwd` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `user_pwd` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE,
  CONSTRAINT `FKK` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES (2, '1', 'jingli', '123457', 'shenyang', '67890', '123', 3, '222');
INSERT INTO `employee` VALUES (3, '1', 'shoupiao', '123456', 'xian', '67898', '234', 4, '333');
INSERT INTO `employee` VALUES (5, '1', 'guke1', 'null', 'null', 'null', 'null', 2, '555');

-- ----------------------------
-- Table structure for play
-- ----------------------------
DROP TABLE IF EXISTS `play`;
CREATE TABLE `play`  (
  `play_id` int(11) NOT NULL AUTO_INCREMENT,
  `play_type_id` int(11) NULL DEFAULT NULL,
  `play_lang_id` int(11) NULL DEFAULT NULL,
  `play_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `play_introduction` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `play_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `play_length` int(11) NULL DEFAULT NULL,
  `play_ticket_price` decimal(10, 2) NULL DEFAULT NULL,
  `play_status` smallint(6) NULL DEFAULT NULL COMMENT '取值含义：\r\n            0：待安排演出\r\n            1：已安排演出\r\n            -1：下线',
  `play_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`play_id`) USING BTREE,
  INDEX `FK_dict_lan_play`(`play_lang_id`) USING BTREE,
  INDEX `FK_dict_type_play`(`play_type_id`) USING BTREE,
  CONSTRAINT `FK_dict_lan_play` FOREIGN KEY (`play_lang_id`) REFERENCES `data_dict` (`dict_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_dict_type_play` FOREIGN KEY (`play_type_id`) REFERENCES `data_dict` (`dict_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of play
-- ----------------------------
INSERT INTO `play` VALUES (1, 8, 10, '泰坦尼克号', '关于爱与生命', '11', 151, 40.00, 1, '爱情片');
INSERT INTO `play` VALUES (2, 11, 10, '火星救援', '拯救只在两亿两千五百万公里以外的天空', '12', 135, 35.00, 1, '科幻片');
INSERT INTO `play` VALUES (3, 8, 10, '罗马假日', '因为一个人爱上一座城', '13', 140, 30.00, 1, '爱情片');
INSERT INTO `play` VALUES (4, 12, 9, '多啦a梦不舍天真', '我会永远陪在你身边', '14', 135, 34.00, 1, '动画片');
INSERT INTO `play` VALUES (5, 11, 10, '星际穿越', '当我归来，你已垂暮，我一次呼吸划过了你一辈子的岁月', '16', 125, 32.00, 1, '科幻片');
INSERT INTO `play` VALUES (7, NULL, NULL, '火星救援2', 'sddfdfg', '12', 150, 55.00, 1, '科幻');
INSERT INTO `play` VALUES (11, NULL, NULL, 'duola', 'ddddd', '14', 134, 40.00, 1, '动画');

-- ----------------------------
-- Table structure for playdetail
-- ----------------------------
DROP TABLE IF EXISTS `playdetail`;
CREATE TABLE `playdetail`  (
  `director` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mainactor` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `playintro` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `play_id` int(11) NULL DEFAULT NULL,
  INDEX `FK_playdetail_play`(`play_id`) USING BTREE,
  CONSTRAINT `FK_playdetail_play` FOREIGN KEY (`play_id`) REFERENCES `play` (`play_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of playdetail
-- ----------------------------
INSERT INTO `playdetail` VALUES ('詹姆斯·卡梅隆', '莱昂纳多·迪卡普里奥，凯特·温斯莱特，比利·赞恩，格劳瑞亚·斯图尔特，凯西·贝茨', '影片以1912年泰坦尼克号邮轮在其处女启航时触礁冰山而沉没的事件为背景，讲述了处于不同阶层的两个人穷画家杰克和贵族女露丝抛弃世俗的偏见坠入爱河，最终杰克把生命的机会让给了露丝的感人故事。', 1);
INSERT INTO `playdetail` VALUES ('雷德利·斯科特', '马特·达蒙，杰西卡·查斯坦，克里斯汀·韦格，杰夫·丹尼尔斯，迈克尔·佩纳，肖恩·宾，凯特·玛拉，塞巴斯蒂安·斯坦，阿卡塞尔·亨涅，麦肯兹·戴维斯，切瓦特·埃加福特', '讲述了由于一场沙尘暴，马克与他的团队失联，孤身一人置身于火星面临着飞船损毁，想方设法回地球的故事', 2);
INSERT INTO `playdetail` VALUES ('威廉·惠勒', '奥黛丽·赫本，格里高利·派克', '美丽高贵的公主短暂逃离宫廷繁文缛节的束缚，和英俊潇洒的平民记者在罗马度过了快乐的一天，萌生爱意，然而碍于身份的差距，他们最终还是只能依依不舍地告别，道一声再见，回归自己原来的生活', 3);
INSERT INTO `playdetail` VALUES ('藤子·F·不二雄', '哆啦a梦，大雄，静香，胖虎，小夫', '漫画叙述了一只来自22世纪的猫型机器人——哆啦A梦，受主人野比世修的托付，回到20世纪，借助从四维口袋里拿出来的各种未来道具，来帮助世修的高祖父——小学生野比大雄化解身边的种种困难问题，以及生活中和身边的小伙伴们发生的轻松幽默搞笑感人的故事。', 4);
INSERT INTO `playdetail` VALUES ('克里斯托弗·诺兰', '马修·麦康纳，安妮·海瑟薇，杰西卡·查斯坦，韦斯·本特利，卡西·阿弗莱克，迈克尔·凯恩', '在不远的未来，人类面临着无法生存的威胁。一个探险小组通过这个虫洞穿越到太阳系之外，他们的目标是找到一颗适合人类移民的星球然而，通过虫洞后，他们发现飞船上在星球上的一个小时相当于地球上的七年时间，即使探险小组的任务能够完成，他们的救赎对于对地球上仍然活着的人来说已经是太晚。飞行员库珀（马修·麦康纳饰演）必须在与自己的儿女重逢以及拯救人类的未来之间做出抉择', 5);

-- ----------------------------
-- Table structure for region
-- ----------------------------
DROP TABLE IF EXISTS `region`;
CREATE TABLE `region`  (
  `reg_id` int(11) NOT NULL,
  `reg_reg_id` int(11) NULL DEFAULT NULL,
  `reg_code` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `reg_name` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`reg_id`) USING BTREE,
  INDEX `FK_parent_region`(`reg_reg_id`) USING BTREE,
  CONSTRAINT `FK_parent_region` FOREIGN KEY (`reg_reg_id`) REFERENCES `region` (`reg_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sale
-- ----------------------------
DROP TABLE IF EXISTS `sale`;
CREATE TABLE `sale`  (
  `sale_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `emp_id` int(11) NULL DEFAULT NULL,
  `sale_time` datetime(0) NULL DEFAULT NULL,
  `sale_payment` decimal(10, 2) NULL DEFAULT NULL,
  `sale_change` decimal(10, 2) NULL DEFAULT NULL,
  `sale_type` smallint(6) NULL DEFAULT NULL COMMENT '类别取值含义：\r\n            1：销售单\r\n            -1：退款单',
  `sale_status` smallint(6) NULL DEFAULT NULL COMMENT '销售单状态如下：\r\n            0：代付款\r\n            1：已付款',
  PRIMARY KEY (`sale_ID`) USING BTREE,
  INDEX `FK`(`emp_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sale
-- ----------------------------
INSERT INTO `sale` VALUES (1, 8, '2019-06-13 20:15:37', 45.00, 1.00, 1, 1);
INSERT INTO `sale` VALUES (2, 8, '2019-06-13 20:40:33', 34.00, 1.00, 1, 1);
INSERT INTO `sale` VALUES (3, 8, '2019-06-13 20:46:26', 45.00, 1.00, 1, 1);
INSERT INTO `sale` VALUES (4, 1, '2019-06-13 21:38:44', 45.00, 1.00, 1, 1);
INSERT INTO `sale` VALUES (5, 1, '2019-06-13 22:09:11', 45.00, 1.00, 1, 1);
INSERT INTO `sale` VALUES (6, 1, '2019-06-14 08:04:37', 45.00, 1.00, 1, 1);
INSERT INTO `sale` VALUES (7, 1, '2019-06-14 08:08:54', 45.00, 1.00, 1, 1);
INSERT INTO `sale` VALUES (8, 1, '2019-06-14 08:27:44', 34.00, 1.00, 1, 1);
INSERT INTO `sale` VALUES (9, 1, '2019-06-14 08:41:22', 34.00, 1.00, 1, 1);
INSERT INTO `sale` VALUES (10, 1, '2019-06-14 08:45:40', 34.00, 1.00, 1, 1);
INSERT INTO `sale` VALUES (11, 1, '2019-06-14 08:48:01', 68.00, 1.00, 1, 1);
INSERT INTO `sale` VALUES (12, 1, '2019-06-14 08:48:01', 68.00, 1.00, 1, 1);
INSERT INTO `sale` VALUES (13, 1, '2019-06-14 09:22:55', 45.00, 1.00, 1, 1);
INSERT INTO `sale` VALUES (14, 1, '2019-06-14 09:23:36', 45.00, 1.00, 1, 1);
INSERT INTO `sale` VALUES (15, 1, '2019-06-14 09:24:03', 68.00, 1.00, 1, 1);
INSERT INTO `sale` VALUES (16, 1, '2019-06-14 09:24:03', 68.00, 1.00, 1, 1);
INSERT INTO `sale` VALUES (17, 1, '2019-06-14 09:29:10', 70.00, 1.00, 1, 1);
INSERT INTO `sale` VALUES (18, 1, '2019-06-14 09:29:10', 70.00, 1.00, 1, 1);
INSERT INTO `sale` VALUES (19, 1, '2019-06-14 10:02:56', 68.00, 1.00, 1, 1);
INSERT INTO `sale` VALUES (20, 1, '2019-06-14 10:02:56', 68.00, 1.00, 1, 1);
INSERT INTO `sale` VALUES (21, 1, '2019-06-14 10:07:00', 90.00, 1.00, 1, 1);
INSERT INTO `sale` VALUES (22, 1, '2019-06-14 10:07:00', 90.00, 1.00, 1, 1);
INSERT INTO `sale` VALUES (23, 1, '2019-06-14 10:49:44', 45.00, 1.00, 1, 1);
INSERT INTO `sale` VALUES (24, 1, '2019-06-14 11:09:52', 45.00, 1.00, 1, 1);
INSERT INTO `sale` VALUES (25, 1, '2019-06-14 11:20:33', 34.00, 1.00, 1, 1);
INSERT INTO `sale` VALUES (26, 1, '2019-06-14 12:13:52', 35.00, 1.00, 1, 1);
INSERT INTO `sale` VALUES (27, 1, '2019-06-14 12:42:25', 270.00, 1.00, 1, 1);
INSERT INTO `sale` VALUES (28, 1, '2019-06-14 12:42:25', 270.00, 1.00, 1, 1);
INSERT INTO `sale` VALUES (29, 1, '2019-06-14 12:42:25', 270.00, 1.00, 1, 1);
INSERT INTO `sale` VALUES (30, 1, '2019-06-14 12:42:25', 270.00, 1.00, 1, 1);
INSERT INTO `sale` VALUES (31, 1, '2019-06-14 12:42:25', 270.00, 1.00, 1, 1);
INSERT INTO `sale` VALUES (32, 1, '2019-06-14 12:42:25', 270.00, 1.00, 1, 1);
INSERT INTO `sale` VALUES (33, 1, '2019-06-25 18:43:28', 45.00, 1.00, 1, 1);
INSERT INTO `sale` VALUES (34, 8, '2019-06-25 18:51:58', 45.00, 1.00, 1, 1);
INSERT INTO `sale` VALUES (35, 8, '2019-06-25 18:52:44', 90.00, 1.00, 1, 1);
INSERT INTO `sale` VALUES (36, 8, '2019-06-25 18:52:44', 90.00, 1.00, 1, 1);
INSERT INTO `sale` VALUES (37, 8, '2019-06-25 19:00:12', 90.00, 1.00, 1, 1);
INSERT INTO `sale` VALUES (38, 8, '2019-06-25 19:00:12', 90.00, 1.00, 1, 1);
INSERT INTO `sale` VALUES (39, 8, '2019-06-25 19:09:44', 45.00, 1.00, 1, 1);
INSERT INTO `sale` VALUES (40, 8, '2019-06-25 19:23:28', 90.00, 1.00, 1, 1);
INSERT INTO `sale` VALUES (41, 8, '2019-06-25 19:23:28', 90.00, 1.00, 1, 1);
INSERT INTO `sale` VALUES (42, 8, '2019-06-25 19:23:54', 45.00, 1.00, 1, 1);
INSERT INTO `sale` VALUES (43, 8, '2019-06-25 19:25:41', 45.00, 1.00, 1, 1);

-- ----------------------------
-- Table structure for sale_item
-- ----------------------------
DROP TABLE IF EXISTS `sale_item`;
CREATE TABLE `sale_item`  (
  `sale_item_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ticket_id` bigint(20) NULL DEFAULT NULL,
  `sale_ID` bigint(20) NULL DEFAULT NULL,
  `sale_item_price` decimal(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`sale_item_id`) USING BTREE,
  INDEX `FK_sale_sale_item`(`sale_ID`) USING BTREE,
  INDEX `FK_ticket_sale_item`(`ticket_id`) USING BTREE,
  CONSTRAINT `FK_sale_sale_item` FOREIGN KEY (`sale_ID`) REFERENCES `sale` (`sale_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_ticket_sale_item` FOREIGN KEY (`ticket_id`) REFERENCES `ticket` (`ticket_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for schedule
-- ----------------------------
DROP TABLE IF EXISTS `schedule`;
CREATE TABLE `schedule`  (
  `schedule_id` int(11) NOT NULL AUTO_INCREMENT,
  `schedule_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `studio_id` int(11) NULL DEFAULT NULL,
  `play_id` int(11) NULL DEFAULT NULL,
  `schedule_time` datetime(6) NULL DEFAULT NULL,
  `discount` decimal(22, 0) NULL DEFAULT NULL,
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `status` int(255) NULL DEFAULT NULL,
  `isticket` int(12) NULL DEFAULT NULL,
  `end_time` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`schedule_id`) USING BTREE,
  INDEX `FK_play_sched`(`play_id`) USING BTREE,
  INDEX `FK_studio_sched`(`studio_id`) USING BTREE,
  CONSTRAINT `FK_play_sched` FOREIGN KEY (`play_id`) REFERENCES `play` (`play_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_studio_sched` FOREIGN KEY (`studio_id`) REFERENCES `studio` (`studio_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of schedule
-- ----------------------------
INSERT INTO `schedule` VALUES (3, 'holiday', 1, 3, '2019-06-28 16:08:00.000000', 1, 35.00, 1, NULL, '2019-06-28 18:09:01.000000');
INSERT INTO `schedule` VALUES (4, 'duola', 2, 4, '2019-06-28 16:14:00.000000', 1, 32.00, 1, 0, '2019-06-28 18:15:00.000000');
INSERT INTO `schedule` VALUES (5, 'Titanic', 1, 1, '2019-06-26 12:03:00.000000', 1, 45.00, 1, NULL, '2019-06-26 21:15:00.000000');
INSERT INTO `schedule` VALUES (16, 'huoxing', 2, 2, '2019-06-29 19:07:00.000000', 1, 1.00, 1, 0, '2019-06-29 21:22:00.000000');
INSERT INTO `schedule` VALUES (18, 'Titanic', 2, 2, '2019-07-01 00:00:00.000000', 1, 1.00, 1, 0, '2019-07-01 02:15:00.000000');
INSERT INTO `schedule` VALUES (19, 'liu', 1, 1, '2019-06-26 12:19:00.000000', 1, 1.00, 1, 0, '2019-06-26 14:50:00.000000');
INSERT INTO `schedule` VALUES (20, 'liu', 2, 1, '2019-06-26 12:19:00.000000', 1, 1.00, 1, 0, '2019-06-26 14:50:00.000000');
INSERT INTO `schedule` VALUES (21, 'liu', 2, 1, '2019-07-01 00:00:00.000000', 1, 1.00, 1, 0, '2019-07-01 02:31:00.000000');
INSERT INTO `schedule` VALUES (22, 'liu', 2, 2, '2019-07-01 00:00:00.000000', 1, 1.00, 1, 0, '2019-07-01 02:15:00.000000');

-- ----------------------------
-- Table structure for seat
-- ----------------------------
DROP TABLE IF EXISTS `seat`;
CREATE TABLE `seat`  (
  `seat_id` int(11) NOT NULL AUTO_INCREMENT,
  `studio_id` int(11) NULL DEFAULT NULL,
  `seat_row` int(11) NULL DEFAULT NULL,
  `seat_column` int(11) NULL DEFAULT NULL,
  `seat_status` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`seat_id`) USING BTREE,
  INDEX `FK_studio_seat`(`studio_id`) USING BTREE,
  CONSTRAINT `FK_studio_seat` FOREIGN KEY (`studio_id`) REFERENCES `studio` (`studio_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 247 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of seat
-- ----------------------------
INSERT INTO `seat` VALUES (1, 1, 1, 1, 0);
INSERT INTO `seat` VALUES (2, 1, 1, 2, 0);
INSERT INTO `seat` VALUES (3, 1, 1, 3, 0);
INSERT INTO `seat` VALUES (4, 1, 1, 4, 0);
INSERT INTO `seat` VALUES (5, 1, 1, 5, 0);
INSERT INTO `seat` VALUES (6, 1, 1, 6, 0);
INSERT INTO `seat` VALUES (7, 1, 1, 7, 1);
INSERT INTO `seat` VALUES (8, 1, 1, 8, 0);
INSERT INTO `seat` VALUES (9, 1, 1, 9, 0);
INSERT INTO `seat` VALUES (10, 1, 1, 10, 0);
INSERT INTO `seat` VALUES (11, 1, 2, 1, 1);
INSERT INTO `seat` VALUES (12, 1, 2, 2, 1);
INSERT INTO `seat` VALUES (13, 1, 2, 3, 1);
INSERT INTO `seat` VALUES (14, 1, 2, 4, 1);
INSERT INTO `seat` VALUES (15, 1, 2, 5, 0);
INSERT INTO `seat` VALUES (16, 1, 2, 6, 0);
INSERT INTO `seat` VALUES (17, 1, 2, 7, 0);
INSERT INTO `seat` VALUES (18, 1, 2, 8, 0);
INSERT INTO `seat` VALUES (19, 1, 2, 9, 0);
INSERT INTO `seat` VALUES (20, 1, 2, 10, 1);
INSERT INTO `seat` VALUES (21, 1, 3, 1, 1);
INSERT INTO `seat` VALUES (22, 1, 3, 2, 1);
INSERT INTO `seat` VALUES (23, 1, 3, 3, 1);
INSERT INTO `seat` VALUES (24, 1, 3, 4, 1);
INSERT INTO `seat` VALUES (25, 1, 3, 5, 0);
INSERT INTO `seat` VALUES (26, 1, 3, 6, 0);
INSERT INTO `seat` VALUES (27, 1, 3, 7, 0);
INSERT INTO `seat` VALUES (28, 1, 3, 8, 0);
INSERT INTO `seat` VALUES (29, 1, 3, 9, 1);
INSERT INTO `seat` VALUES (30, 1, 3, 10, 1);
INSERT INTO `seat` VALUES (31, 1, 4, 1, 1);
INSERT INTO `seat` VALUES (32, 1, 4, 2, 1);
INSERT INTO `seat` VALUES (33, 1, 4, 3, 0);
INSERT INTO `seat` VALUES (34, 1, 4, 4, 0);
INSERT INTO `seat` VALUES (35, 1, 4, 5, 1);
INSERT INTO `seat` VALUES (36, 1, 4, 6, 1);
INSERT INTO `seat` VALUES (37, 1, 4, 7, 0);
INSERT INTO `seat` VALUES (38, 1, 4, 8, 1);
INSERT INTO `seat` VALUES (39, 2, 1, 1, 1);
INSERT INTO `seat` VALUES (40, 2, 1, 2, 1);
INSERT INTO `seat` VALUES (41, 2, 1, 3, 0);
INSERT INTO `seat` VALUES (42, 2, 1, 4, 0);
INSERT INTO `seat` VALUES (43, 2, 1, 5, 0);
INSERT INTO `seat` VALUES (44, 2, 1, 6, 0);
INSERT INTO `seat` VALUES (46, 2, 1, 7, 0);
INSERT INTO `seat` VALUES (47, 2, 1, 8, 0);
INSERT INTO `seat` VALUES (48, 2, 1, 9, 1);
INSERT INTO `seat` VALUES (49, 2, 3, 10, 1);
INSERT INTO `seat` VALUES (50, 2, 2, 1, 1);
INSERT INTO `seat` VALUES (51, 2, 2, 2, 0);
INSERT INTO `seat` VALUES (52, 2, 2, 3, 0);
INSERT INTO `seat` VALUES (53, 2, 2, 4, 1);
INSERT INTO `seat` VALUES (54, 2, 2, 5, 1);
INSERT INTO `seat` VALUES (55, 2, 2, 6, 1);
INSERT INTO `seat` VALUES (56, 2, 2, 7, 0);
INSERT INTO `seat` VALUES (57, 2, 2, 8, 1);
INSERT INTO `seat` VALUES (58, 2, 2, 9, 1);
INSERT INTO `seat` VALUES (59, 2, 2, 10, 1);
INSERT INTO `seat` VALUES (60, 2, 3, 1, 1);
INSERT INTO `seat` VALUES (61, 2, 3, 2, 1);
INSERT INTO `seat` VALUES (62, 2, 3, 3, 1);
INSERT INTO `seat` VALUES (63, 2, 3, 4, 0);
INSERT INTO `seat` VALUES (64, 1, NULL, NULL, NULL);
INSERT INTO `seat` VALUES (65, 1, 4, 9, 1);
INSERT INTO `seat` VALUES (66, 1, 4, 10, 1);
INSERT INTO `seat` VALUES (67, 1, 5, 1, 1);
INSERT INTO `seat` VALUES (68, 1, 5, 2, 1);
INSERT INTO `seat` VALUES (69, 1, 5, 3, 1);
INSERT INTO `seat` VALUES (70, 1, 5, 4, 1);
INSERT INTO `seat` VALUES (71, 1, 5, 5, 1);
INSERT INTO `seat` VALUES (72, 1, 5, 6, 1);
INSERT INTO `seat` VALUES (73, 1, 5, 7, 1);
INSERT INTO `seat` VALUES (74, 1, 5, 8, 1);
INSERT INTO `seat` VALUES (75, 1, 5, 9, 1);
INSERT INTO `seat` VALUES (76, 1, 5, 10, 1);
INSERT INTO `seat` VALUES (77, 1, 6, 1, 1);
INSERT INTO `seat` VALUES (78, 1, 6, 2, 1);
INSERT INTO `seat` VALUES (79, 1, 6, 3, 1);
INSERT INTO `seat` VALUES (80, 1, 6, 4, 1);
INSERT INTO `seat` VALUES (81, 1, 6, 5, 1);
INSERT INTO `seat` VALUES (82, 1, 6, 6, 1);
INSERT INTO `seat` VALUES (83, 1, 6, 7, 1);
INSERT INTO `seat` VALUES (84, 1, 6, 8, 1);
INSERT INTO `seat` VALUES (85, 1, 6, 9, 1);
INSERT INTO `seat` VALUES (86, 1, 6, 10, 1);
INSERT INTO `seat` VALUES (87, 1, 7, 1, 1);
INSERT INTO `seat` VALUES (88, 1, 7, 2, 1);
INSERT INTO `seat` VALUES (89, 1, 7, 3, 1);
INSERT INTO `seat` VALUES (90, 1, 7, 4, 1);
INSERT INTO `seat` VALUES (91, 1, 7, 5, 1);
INSERT INTO `seat` VALUES (92, 1, 7, 6, 1);
INSERT INTO `seat` VALUES (93, 1, 7, 7, 1);
INSERT INTO `seat` VALUES (94, 1, 7, 8, 1);
INSERT INTO `seat` VALUES (95, 1, 7, 9, 1);
INSERT INTO `seat` VALUES (96, 1, 7, 10, 1);
INSERT INTO `seat` VALUES (97, 1, 8, 1, 1);
INSERT INTO `seat` VALUES (98, 1, 8, 2, 1);
INSERT INTO `seat` VALUES (99, 1, 8, 3, 1);
INSERT INTO `seat` VALUES (100, 1, 8, 4, 1);
INSERT INTO `seat` VALUES (101, 1, 8, 5, 1);
INSERT INTO `seat` VALUES (102, 1, 8, 6, 1);
INSERT INTO `seat` VALUES (103, 1, 8, 7, 1);
INSERT INTO `seat` VALUES (104, 1, 8, 8, 1);
INSERT INTO `seat` VALUES (105, 1, 8, 9, 1);
INSERT INTO `seat` VALUES (106, 1, 8, 10, 1);
INSERT INTO `seat` VALUES (107, 1, 9, 1, 1);
INSERT INTO `seat` VALUES (108, 1, 9, 2, 1);
INSERT INTO `seat` VALUES (109, 1, 9, 3, 1);
INSERT INTO `seat` VALUES (110, 1, 9, 4, 1);
INSERT INTO `seat` VALUES (111, 1, 9, 5, 1);
INSERT INTO `seat` VALUES (112, 1, 9, 6, 1);
INSERT INTO `seat` VALUES (113, 1, 9, 7, 1);
INSERT INTO `seat` VALUES (114, 1, 9, 8, 1);
INSERT INTO `seat` VALUES (115, 1, 9, 9, 1);
INSERT INTO `seat` VALUES (116, 1, 9, 10, 1);
INSERT INTO `seat` VALUES (117, 1, 10, 1, 1);
INSERT INTO `seat` VALUES (118, 1, 10, 2, 1);
INSERT INTO `seat` VALUES (119, 1, 10, 3, 1);
INSERT INTO `seat` VALUES (120, 1, 10, 4, 1);
INSERT INTO `seat` VALUES (121, 1, 10, 5, 1);
INSERT INTO `seat` VALUES (122, 1, 10, 6, 1);
INSERT INTO `seat` VALUES (123, 1, 10, 7, 1);
INSERT INTO `seat` VALUES (124, 1, 10, 8, 1);
INSERT INTO `seat` VALUES (125, 1, 10, 9, 1);
INSERT INTO `seat` VALUES (126, 1, 10, 10, 1);
INSERT INTO `seat` VALUES (127, 2, 3, 5, 1);
INSERT INTO `seat` VALUES (128, 2, 3, 6, 1);
INSERT INTO `seat` VALUES (129, 2, 3, 7, 1);
INSERT INTO `seat` VALUES (130, 2, 3, 8, 1);
INSERT INTO `seat` VALUES (131, 2, 3, 9, 1);
INSERT INTO `seat` VALUES (160, 9, 1, 1, 1);
INSERT INTO `seat` VALUES (161, 9, 1, 2, 0);
INSERT INTO `seat` VALUES (162, 9, 1, 3, 0);
INSERT INTO `seat` VALUES (163, 9, 1, 4, 1);
INSERT INTO `seat` VALUES (164, 9, 1, 5, 1);
INSERT INTO `seat` VALUES (165, 9, 1, 6, 1);
INSERT INTO `seat` VALUES (166, 9, 2, 1, 1);
INSERT INTO `seat` VALUES (167, 9, 2, 2, 1);
INSERT INTO `seat` VALUES (168, 9, 2, 3, 1);
INSERT INTO `seat` VALUES (169, 9, 2, 4, 1);
INSERT INTO `seat` VALUES (170, 9, 2, 5, 1);
INSERT INTO `seat` VALUES (171, 9, 2, 6, 1);
INSERT INTO `seat` VALUES (172, 9, 3, 1, 1);
INSERT INTO `seat` VALUES (173, 9, 3, 2, 1);
INSERT INTO `seat` VALUES (174, 9, 3, 3, 1);
INSERT INTO `seat` VALUES (175, 9, 3, 4, 1);
INSERT INTO `seat` VALUES (176, 9, 3, 5, 1);
INSERT INTO `seat` VALUES (177, 9, 3, 6, 1);
INSERT INTO `seat` VALUES (178, 9, 4, 1, 1);
INSERT INTO `seat` VALUES (179, 9, 4, 2, 1);
INSERT INTO `seat` VALUES (180, 9, 4, 3, 1);
INSERT INTO `seat` VALUES (181, 9, 4, 4, 1);
INSERT INTO `seat` VALUES (182, 9, 4, 5, 1);
INSERT INTO `seat` VALUES (183, 9, 4, 6, 1);
INSERT INTO `seat` VALUES (184, 9, 5, 1, 1);
INSERT INTO `seat` VALUES (185, 9, 5, 2, 1);
INSERT INTO `seat` VALUES (186, 9, 5, 3, 1);
INSERT INTO `seat` VALUES (187, 9, 5, 4, 1);
INSERT INTO `seat` VALUES (188, 9, 5, 5, 1);
INSERT INTO `seat` VALUES (189, 9, 5, 6, 1);
INSERT INTO `seat` VALUES (190, 10, 1, 1, 1);
INSERT INTO `seat` VALUES (191, 10, 1, 2, 1);
INSERT INTO `seat` VALUES (192, 10, 1, 3, 0);
INSERT INTO `seat` VALUES (193, 10, 1, 4, 0);
INSERT INTO `seat` VALUES (194, 10, 1, 5, 1);
INSERT INTO `seat` VALUES (195, 10, 1, 6, 1);
INSERT INTO `seat` VALUES (196, 10, 2, 1, 1);
INSERT INTO `seat` VALUES (197, 10, 2, 2, 1);
INSERT INTO `seat` VALUES (198, 10, 2, 3, 1);
INSERT INTO `seat` VALUES (199, 10, 2, 4, 1);
INSERT INTO `seat` VALUES (200, 10, 2, 5, 1);
INSERT INTO `seat` VALUES (201, 10, 2, 6, 1);
INSERT INTO `seat` VALUES (202, 10, 3, 1, 1);
INSERT INTO `seat` VALUES (203, 10, 3, 2, 1);
INSERT INTO `seat` VALUES (204, 10, 3, 3, 1);
INSERT INTO `seat` VALUES (205, 10, 3, 4, 1);
INSERT INTO `seat` VALUES (206, 10, 3, 5, 1);
INSERT INTO `seat` VALUES (207, 10, 3, 6, 1);
INSERT INTO `seat` VALUES (208, 10, 4, 1, 1);
INSERT INTO `seat` VALUES (209, 10, 4, 2, 1);
INSERT INTO `seat` VALUES (210, 10, 4, 3, 1);
INSERT INTO `seat` VALUES (211, 10, 4, 4, 1);
INSERT INTO `seat` VALUES (212, 10, 4, 5, 1);
INSERT INTO `seat` VALUES (213, 10, 4, 6, 1);
INSERT INTO `seat` VALUES (214, 10, 5, 1, 1);
INSERT INTO `seat` VALUES (215, 10, 5, 2, 1);
INSERT INTO `seat` VALUES (216, 10, 5, 3, 1);
INSERT INTO `seat` VALUES (217, 10, 5, 4, 1);
INSERT INTO `seat` VALUES (218, 10, 5, 5, 1);
INSERT INTO `seat` VALUES (219, 10, 5, 6, 1);
INSERT INTO `seat` VALUES (220, 11, 1, 1, 1);
INSERT INTO `seat` VALUES (221, 11, 1, 2, 0);
INSERT INTO `seat` VALUES (222, 11, 1, 3, 0);
INSERT INTO `seat` VALUES (223, 11, 1, 4, 1);
INSERT INTO `seat` VALUES (224, 11, 2, 1, 1);
INSERT INTO `seat` VALUES (225, 11, 2, 2, 1);
INSERT INTO `seat` VALUES (226, 11, 2, 3, 1);
INSERT INTO `seat` VALUES (227, 11, 2, 4, 1);
INSERT INTO `seat` VALUES (228, 11, 3, 1, 1);
INSERT INTO `seat` VALUES (229, 11, 3, 2, 1);
INSERT INTO `seat` VALUES (230, 11, 3, 3, 1);
INSERT INTO `seat` VALUES (231, 11, 3, 4, 1);
INSERT INTO `seat` VALUES (232, 12, 1, 1, 1);
INSERT INTO `seat` VALUES (233, 12, 1, 2, 0);
INSERT INTO `seat` VALUES (234, 12, 1, 3, 0);
INSERT INTO `seat` VALUES (235, 12, 1, 4, 1);
INSERT INTO `seat` VALUES (236, 12, 1, 5, 1);
INSERT INTO `seat` VALUES (237, 12, 2, 1, 1);
INSERT INTO `seat` VALUES (238, 12, 2, 2, 1);
INSERT INTO `seat` VALUES (239, 12, 2, 3, 1);
INSERT INTO `seat` VALUES (240, 12, 2, 4, 1);
INSERT INTO `seat` VALUES (241, 12, 2, 5, 1);
INSERT INTO `seat` VALUES (242, 12, 3, 1, 1);
INSERT INTO `seat` VALUES (243, 12, 3, 2, 1);
INSERT INTO `seat` VALUES (244, 12, 3, 3, 1);
INSERT INTO `seat` VALUES (245, 12, 3, 4, 1);
INSERT INTO `seat` VALUES (246, 12, 3, 5, 1);

-- ----------------------------
-- Table structure for studio
-- ----------------------------
DROP TABLE IF EXISTS `studio`;
CREATE TABLE `studio`  (
  `studio_id` int(11) NOT NULL AUTO_INCREMENT,
  `studio_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `studio_row_count` int(11) NULL DEFAULT NULL,
  `studio_col_count` int(11) NULL DEFAULT NULL,
  `studio_introduction` varchar(2000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`studio_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of studio
-- ----------------------------
INSERT INTO `studio` VALUES (1, '1', 10, 10, 'good');
INSERT INTO `studio` VALUES (2, '2', 8, 9, 'goo');
INSERT INTO `studio` VALUES (3, '3', 9, 9, 'good');
INSERT INTO `studio` VALUES (9, 'we', 5, 6, 'test');
INSERT INTO `studio` VALUES (10, 'abc', 5, 6, 'tes');
INSERT INTO `studio` VALUES (11, 'aaaaa', 3, 4, 'test');
INSERT INTO `studio` VALUES (12, 'liu', 3, 5, '444');

-- ----------------------------
-- Table structure for ticket
-- ----------------------------
DROP TABLE IF EXISTS `ticket`;
CREATE TABLE `ticket`  (
  `ticket_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `seat_id` int(11) NULL DEFAULT NULL,
  `studio_id` int(11) NULL DEFAULT NULL,
  `ticket_price` decimal(10, 2) NULL DEFAULT NULL,
  `ticket_status` smallint(6) NULL DEFAULT NULL COMMENT '含义如下：\r\n            0：待销售\r\n            1：锁定\r\n            9：卖出',
  `schedule_id` int(11) NULL DEFAULT NULL,
  `ticket_locked_time` datetime(0) NULL DEFAULT NULL,
  `time_stamp` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ticket_id`) USING BTREE,
  INDEX `FK_seat_ticket`(`seat_id`) USING BTREE,
  INDEX `FK_studio_ticket`(`studio_id`) USING BTREE,
  INDEX `FK_schedule_ticket`(`schedule_id`) USING BTREE,
  CONSTRAINT `FK_schedule_ticket` FOREIGN KEY (`schedule_id`) REFERENCES `schedule` (`schedule_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_seat_ticket` FOREIGN KEY (`seat_id`) REFERENCES `seat` (`seat_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_studio_ticket` FOREIGN KEY (`studio_id`) REFERENCES `studio` (`studio_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1975 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ticket
-- ----------------------------
INSERT INTO `ticket` VALUES (1167, 1, 1, 35.00, 0, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1168, 2, 1, 35.00, 0, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1169, 3, 1, 35.00, 0, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1170, 4, 1, 35.00, 0, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1171, 5, 1, 35.00, 0, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1172, 6, 1, 35.00, 0, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1173, 7, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1174, 8, 1, 35.00, 0, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1175, 9, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1176, 10, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1177, 11, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1178, 12, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1179, 13, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1180, 14, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1181, 15, 1, 35.00, 0, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1182, 16, 1, 35.00, 0, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1183, 17, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1184, 18, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1185, 19, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1186, 20, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1187, 21, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1188, 22, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1189, 23, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1190, 24, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1191, 25, 1, 35.00, 0, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1192, 26, 1, 35.00, 0, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1193, 27, 1, 35.00, 0, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1194, 28, 1, 35.00, 0, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1195, 29, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1196, 30, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1197, 31, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1198, 32, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1199, 33, 1, 35.00, 0, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1200, 34, 1, 35.00, 0, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1201, 35, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1202, 36, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1203, 37, 1, 35.00, 0, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1204, 38, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1205, 39, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1206, 40, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1207, 41, 1, 35.00, 0, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1208, 42, 1, 35.00, 0, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1209, 43, 1, 35.00, 0, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1210, 44, 1, 35.00, 0, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1211, 46, 1, 35.00, 0, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1212, 47, 1, 35.00, 0, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1213, 48, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1214, 49, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1215, 50, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1216, 51, 1, 35.00, 0, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1217, 52, 1, 35.00, 0, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1218, 53, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1219, 54, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1220, 55, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1221, 56, 1, 35.00, 0, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1222, 57, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1223, 58, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1224, 59, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1225, 60, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1226, 61, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1227, 62, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1228, 63, 1, 35.00, 0, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1229, 64, 1, 35.00, 0, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1230, 65, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1231, 66, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1232, 67, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1233, 68, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1234, 69, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1235, 70, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1236, 71, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1237, 72, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1238, 73, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1239, 74, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1240, 75, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1241, 76, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1242, 77, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1243, 78, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1244, 79, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1245, 80, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1246, 81, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1247, 82, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1248, 83, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1249, 84, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1250, 85, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1251, 86, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1252, 87, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1253, 88, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1254, 89, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1255, 90, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1256, 91, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1257, 92, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1258, 93, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1259, 94, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1260, 95, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1261, 96, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1262, 97, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1263, 98, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1264, 99, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1265, 100, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1266, 101, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1267, 102, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1268, 103, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1269, 104, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1270, 105, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1271, 106, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1272, 107, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1273, 108, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1274, 109, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1275, 110, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1276, 111, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1277, 112, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1278, 113, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1279, 114, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1280, 115, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1281, 116, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1282, 117, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1283, 118, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1284, 119, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1285, 120, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1286, 121, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1287, 122, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1288, 123, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1289, 124, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1290, 125, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1291, 126, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1292, 127, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1293, 128, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1294, 129, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1295, 130, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1296, 131, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1297, 160, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1298, 161, 1, 35.00, 0, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1299, 162, 1, 35.00, 0, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1300, 163, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1301, 164, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1302, 165, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1303, 166, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1304, 167, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1305, 168, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1306, 169, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1307, 170, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1308, 171, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1309, 172, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1310, 173, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1311, 174, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1312, 175, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1313, 176, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1314, 177, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1315, 178, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1316, 179, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1317, 180, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1318, 181, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1319, 182, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1320, 183, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1321, 184, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1322, 185, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1323, 186, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1324, 187, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1325, 188, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1326, 189, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1327, 190, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1328, 191, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1329, 192, 1, 35.00, 0, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1330, 193, 1, 35.00, 0, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1331, 194, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1332, 195, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1333, 196, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1334, 197, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1335, 198, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1336, 199, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1337, 200, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1338, 201, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1339, 202, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1340, 203, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1341, 204, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1342, 205, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1343, 206, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1344, 207, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1345, 208, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1346, 209, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1347, 210, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1348, 211, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1349, 212, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1350, 213, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1351, 214, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1352, 215, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1353, 216, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1354, 217, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1355, 218, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1356, 219, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1357, 220, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1358, 221, 1, 35.00, 0, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1359, 222, 1, 35.00, 0, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1360, 223, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1361, 224, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1362, 225, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1363, 226, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1364, 227, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1365, 228, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1366, 229, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1367, 230, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1368, 231, 1, 35.00, 1, 3, NULL, NULL);
INSERT INTO `ticket` VALUES (1369, 1, 2, 32.00, 0, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1370, 2, 2, 32.00, 0, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1371, 3, 2, 32.00, 0, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1372, 4, 2, 32.00, 0, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1373, 5, 2, 32.00, 0, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1374, 6, 2, 32.00, 0, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1375, 7, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1376, 8, 2, 32.00, 0, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1377, 9, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1378, 10, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1379, 11, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1380, 12, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1381, 13, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1382, 14, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1383, 15, 2, 32.00, 0, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1384, 16, 2, 32.00, 0, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1385, 17, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1386, 18, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1387, 19, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1388, 20, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1389, 21, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1390, 22, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1391, 23, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1392, 24, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1393, 25, 2, 32.00, 0, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1394, 26, 2, 32.00, 0, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1395, 27, 2, 32.00, 0, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1396, 28, 2, 32.00, 0, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1397, 29, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1398, 30, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1399, 31, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1400, 32, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1401, 33, 2, 32.00, 0, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1402, 34, 2, 32.00, 0, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1403, 35, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1404, 36, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1405, 37, 2, 32.00, 0, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1406, 38, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1407, 39, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1408, 40, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1409, 41, 2, 32.00, 0, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1410, 42, 2, 32.00, 0, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1411, 43, 2, 32.00, 0, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1412, 44, 2, 32.00, 0, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1413, 46, 2, 32.00, 0, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1414, 47, 2, 32.00, 0, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1415, 48, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1416, 49, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1417, 50, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1418, 51, 2, 32.00, 0, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1419, 52, 2, 32.00, 0, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1420, 53, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1421, 54, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1422, 55, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1423, 56, 2, 32.00, 0, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1424, 57, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1425, 58, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1426, 59, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1427, 60, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1428, 61, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1429, 62, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1430, 63, 2, 32.00, 0, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1431, 64, 2, 32.00, 0, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1432, 65, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1433, 66, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1434, 67, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1435, 68, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1436, 69, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1437, 70, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1438, 71, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1439, 72, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1440, 73, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1441, 74, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1442, 75, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1443, 76, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1444, 77, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1445, 78, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1446, 79, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1447, 80, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1448, 81, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1449, 82, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1450, 83, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1451, 84, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1452, 85, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1453, 86, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1454, 87, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1455, 88, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1456, 89, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1457, 90, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1458, 91, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1459, 92, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1460, 93, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1461, 94, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1462, 95, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1463, 96, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1464, 97, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1465, 98, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1466, 99, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1467, 100, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1468, 101, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1469, 102, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1470, 103, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1471, 104, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1472, 105, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1473, 106, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1474, 107, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1475, 108, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1476, 109, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1477, 110, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1478, 111, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1479, 112, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1480, 113, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1481, 114, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1482, 115, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1483, 116, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1484, 117, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1485, 118, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1486, 119, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1487, 120, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1488, 121, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1489, 122, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1490, 123, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1491, 124, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1492, 125, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1493, 126, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1494, 127, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1495, 128, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1496, 129, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1497, 130, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1498, 131, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1499, 160, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1500, 161, 2, 32.00, 0, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1501, 162, 2, 32.00, 0, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1502, 163, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1503, 164, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1504, 165, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1505, 166, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1506, 167, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1507, 168, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1508, 169, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1509, 170, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1510, 171, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1511, 172, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1512, 173, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1513, 174, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1514, 175, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1515, 176, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1516, 177, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1517, 178, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1518, 179, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1519, 180, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1520, 181, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1521, 182, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1522, 183, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1523, 184, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1524, 185, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1525, 186, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1526, 187, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1527, 188, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1528, 189, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1529, 190, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1530, 191, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1531, 192, 2, 32.00, 0, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1532, 193, 2, 32.00, 0, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1533, 194, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1534, 195, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1535, 196, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1536, 197, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1537, 198, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1538, 199, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1539, 200, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1540, 201, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1541, 202, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1542, 203, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1543, 204, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1544, 205, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1545, 206, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1546, 207, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1547, 208, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1548, 209, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1549, 210, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1550, 211, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1551, 212, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1552, 213, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1553, 214, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1554, 215, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1555, 216, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1556, 217, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1557, 218, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1558, 219, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1559, 220, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1560, 221, 2, 32.00, 0, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1561, 222, 2, 32.00, 0, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1562, 223, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1563, 224, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1564, 225, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1565, 226, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1566, 227, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1567, 228, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1568, 229, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1569, 230, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1570, 231, 2, 32.00, 1, 4, NULL, NULL);
INSERT INTO `ticket` VALUES (1571, 1, 1, 45.00, 0, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1572, 2, 1, 45.00, 0, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1573, 3, 1, 45.00, 0, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1574, 4, 1, 45.00, 0, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1575, 5, 1, 45.00, 0, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1576, 6, 1, 45.00, 0, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1577, 7, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1578, 8, 1, 45.00, 0, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1579, 9, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1580, 10, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1581, 11, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1582, 12, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1583, 13, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1584, 14, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1585, 15, 1, 45.00, 0, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1586, 16, 1, 45.00, 0, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1587, 17, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1588, 18, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1589, 19, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1590, 20, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1591, 21, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1592, 22, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1593, 23, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1594, 24, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1595, 25, 1, 45.00, 0, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1596, 26, 1, 45.00, 0, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1597, 27, 1, 45.00, 0, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1598, 28, 1, 45.00, 0, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1599, 29, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1600, 30, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1601, 31, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1602, 32, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1603, 33, 1, 45.00, 0, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1604, 34, 1, 45.00, 0, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1605, 35, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1606, 36, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1607, 37, 1, 45.00, 0, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1608, 38, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1609, 39, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1610, 40, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1611, 41, 1, 45.00, 0, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1612, 42, 1, 45.00, 0, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1613, 43, 1, 45.00, 0, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1614, 44, 1, 45.00, 0, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1615, 46, 1, 45.00, 0, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1616, 47, 1, 45.00, 0, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1617, 48, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1618, 49, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1619, 50, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1620, 51, 1, 45.00, 0, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1621, 52, 1, 45.00, 0, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1622, 53, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1623, 54, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1624, 55, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1625, 56, 1, 45.00, 0, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1626, 57, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1627, 58, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1628, 59, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1629, 60, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1630, 61, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1631, 62, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1632, 63, 1, 45.00, 0, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1633, 64, 1, 45.00, 0, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1634, 65, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1635, 66, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1636, 67, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1637, 68, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1638, 69, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1639, 70, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1640, 71, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1641, 72, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1642, 73, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1643, 74, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1644, 75, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1645, 76, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1646, 77, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1647, 78, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1648, 79, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1649, 80, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1650, 81, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1651, 82, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1652, 83, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1653, 84, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1654, 85, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1655, 86, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1656, 87, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1657, 88, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1658, 89, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1659, 90, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1660, 91, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1661, 92, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1662, 93, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1663, 94, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1664, 95, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1665, 96, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1666, 97, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1667, 98, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1668, 99, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1669, 100, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1670, 101, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1671, 102, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1672, 103, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1673, 104, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1674, 105, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1675, 106, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1676, 107, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1677, 108, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1678, 109, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1679, 110, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1680, 111, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1681, 112, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1682, 113, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1683, 114, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1684, 115, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1685, 116, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1686, 117, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1687, 118, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1688, 119, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1689, 120, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1690, 121, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1691, 122, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1692, 123, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1693, 124, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1694, 125, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1695, 126, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1696, 127, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1697, 128, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1698, 129, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1699, 130, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1700, 131, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1701, 160, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1702, 161, 1, 45.00, 0, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1703, 162, 1, 45.00, 0, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1704, 163, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1705, 164, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1706, 165, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1707, 166, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1708, 167, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1709, 168, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1710, 169, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1711, 170, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1712, 171, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1713, 172, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1714, 173, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1715, 174, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1716, 175, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1717, 176, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1718, 177, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1719, 178, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1720, 179, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1721, 180, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1722, 181, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1723, 182, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1724, 183, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1725, 184, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1726, 185, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1727, 186, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1728, 187, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1729, 188, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1730, 189, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1731, 190, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1732, 191, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1733, 192, 1, 45.00, 0, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1734, 193, 1, 45.00, 0, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1735, 194, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1736, 195, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1737, 196, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1738, 197, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1739, 198, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1740, 199, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1741, 200, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1742, 201, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1743, 202, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1744, 203, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1745, 204, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1746, 205, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1747, 206, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1748, 207, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1749, 208, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1750, 209, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1751, 210, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1752, 211, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1753, 212, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1754, 213, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1755, 214, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1756, 215, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1757, 216, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1758, 217, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1759, 218, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1760, 219, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1761, 220, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1762, 221, 1, 45.00, 0, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1763, 222, 1, 45.00, 0, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1764, 223, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1765, 224, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1766, 225, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1767, 226, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1768, 227, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1769, 228, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1770, 229, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1771, 230, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1772, 231, 1, 45.00, 1, 5, NULL, NULL);
INSERT INTO `ticket` VALUES (1773, 1, 2, 1.00, 0, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1774, 2, 2, 1.00, 0, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1775, 3, 2, 1.00, 0, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1776, 4, 2, 1.00, 0, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1777, 5, 2, 1.00, 0, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1778, 6, 2, 1.00, 0, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1779, 7, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1780, 8, 2, 1.00, 0, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1781, 9, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1782, 10, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1783, 11, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1784, 12, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1785, 13, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1786, 14, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1787, 15, 2, 1.00, 0, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1788, 16, 2, 1.00, 0, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1789, 17, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1790, 18, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1791, 19, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1792, 20, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1793, 21, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1794, 22, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1795, 23, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1796, 24, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1797, 25, 2, 1.00, 0, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1798, 26, 2, 1.00, 0, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1799, 27, 2, 1.00, 0, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1800, 28, 2, 1.00, 0, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1801, 29, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1802, 30, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1803, 31, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1804, 32, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1805, 33, 2, 1.00, 0, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1806, 34, 2, 1.00, 0, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1807, 35, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1808, 36, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1809, 37, 2, 1.00, 0, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1810, 38, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1811, 39, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1812, 40, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1813, 41, 2, 1.00, 0, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1814, 42, 2, 1.00, 0, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1815, 43, 2, 1.00, 0, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1816, 44, 2, 1.00, 0, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1817, 46, 2, 1.00, 0, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1818, 47, 2, 1.00, 0, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1819, 48, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1820, 49, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1821, 50, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1822, 51, 2, 1.00, 0, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1823, 52, 2, 1.00, 0, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1824, 53, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1825, 54, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1826, 55, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1827, 56, 2, 1.00, 0, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1828, 57, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1829, 58, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1830, 59, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1831, 60, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1832, 61, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1833, 62, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1834, 63, 2, 1.00, 0, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1835, 64, 2, 1.00, 0, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1836, 65, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1837, 66, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1838, 67, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1839, 68, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1840, 69, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1841, 70, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1842, 71, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1843, 72, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1844, 73, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1845, 74, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1846, 75, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1847, 76, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1848, 77, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1849, 78, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1850, 79, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1851, 80, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1852, 81, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1853, 82, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1854, 83, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1855, 84, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1856, 85, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1857, 86, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1858, 87, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1859, 88, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1860, 89, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1861, 90, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1862, 91, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1863, 92, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1864, 93, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1865, 94, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1866, 95, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1867, 96, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1868, 97, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1869, 98, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1870, 99, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1871, 100, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1872, 101, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1873, 102, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1874, 103, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1875, 104, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1876, 105, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1877, 106, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1878, 107, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1879, 108, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1880, 109, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1881, 110, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1882, 111, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1883, 112, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1884, 113, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1885, 114, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1886, 115, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1887, 116, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1888, 117, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1889, 118, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1890, 119, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1891, 120, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1892, 121, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1893, 122, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1894, 123, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1895, 124, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1896, 125, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1897, 126, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1898, 127, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1899, 128, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1900, 129, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1901, 130, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1902, 131, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1903, 160, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1904, 161, 2, 1.00, 0, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1905, 162, 2, 1.00, 0, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1906, 163, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1907, 164, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1908, 165, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1909, 166, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1910, 167, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1911, 168, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1912, 169, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1913, 170, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1914, 171, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1915, 172, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1916, 173, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1917, 174, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1918, 175, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1919, 176, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1920, 177, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1921, 178, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1922, 179, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1923, 180, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1924, 181, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1925, 182, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1926, 183, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1927, 184, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1928, 185, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1929, 186, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1930, 187, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1931, 188, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1932, 189, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1933, 190, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1934, 191, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1935, 192, 2, 1.00, 0, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1936, 193, 2, 1.00, 0, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1937, 194, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1938, 195, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1939, 196, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1940, 197, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1941, 198, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1942, 199, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1943, 200, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1944, 201, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1945, 202, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1946, 203, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1947, 204, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1948, 205, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1949, 206, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1950, 207, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1951, 208, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1952, 209, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1953, 210, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1954, 211, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1955, 212, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1956, 213, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1957, 214, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1958, 215, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1959, 216, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1960, 217, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1961, 218, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1962, 219, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1963, 220, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1964, 221, 2, 1.00, 0, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1965, 222, 2, 1.00, 0, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1966, 223, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1967, 224, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1968, 225, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1969, 226, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1970, 227, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1971, 228, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1972, 229, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1973, 230, 2, 1.00, 1, 16, NULL, NULL);
INSERT INTO `ticket` VALUES (1974, 231, 2, 1.00, 1, 16, NULL, NULL);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `user_password` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `user_status` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'charge', '111', '1');
INSERT INTO `user` VALUES (2, 'jingli', '222', '2');
INSERT INTO `user` VALUES (3, 'shoupiao', '333', '3');
INSERT INTO `user` VALUES (4, 'zuowei', '444', '4');
INSERT INTO `user` VALUES (5, 'guke1', '555', '0');
INSERT INTO `user` VALUES (8, 'guke2', '666', '0');
INSERT INTO `user` VALUES (9, 'guke4', '234', '0');
INSERT INTO `user` VALUES (10, 'ding', '678', '0');
INSERT INTO `user` VALUES (11, 'abc', '123', '0');

-- ----------------------------
-- Table structure for userdetail
-- ----------------------------
DROP TABLE IF EXISTS `userdetail`;
CREATE TABLE `userdetail`  (
  `user_telNum` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_bankcarid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_paypwd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_age` int(3) NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  INDEX `FKKK`(`user_id`) USING BTREE,
  CONSTRAINT `FKKK` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of userdetail
-- ----------------------------
INSERT INTO `userdetail` VALUES ('1234567', 'shen', '234566', '1111', 'null', -1, 1);
INSERT INTO `userdetail` VALUES ('45637289', 'xi', '3456978', '23456', 'm', 23, 2);
INSERT INTO `userdetail` VALUES ('67833938', 'ti', '56894378', '35678', 'w', 25, 3);
INSERT INTO `userdetail` VALUES ('23466', 'gu', 'su', '23467', 'w', 34, 4);
INSERT INTO `userdetail` VALUES ('125764', 'hu', 'de', '467894', 'm', 25, 5);
INSERT INTO `userdetail` VALUES ('12648578', 'lan', 'fr', '135378', 'w', 35, 8);
INSERT INTO `userdetail` VALUES (NULL, NULL, NULL, NULL, NULL, NULL, 9);
INSERT INTO `userdetail` VALUES (NULL, NULL, NULL, NULL, NULL, NULL, 10);
INSERT INTO `userdetail` VALUES (NULL, NULL, NULL, NULL, NULL, NULL, 11);

SET FOREIGN_KEY_CHECKS = 1;
