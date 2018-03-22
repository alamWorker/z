/*
Navicat MySQL Data Transfer

Source Server         : Localhost
Source Server Version : 50714
Source Host           : localhost:3306
Source Database       : z_log

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2018-03-19 17:30:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for z_active_log_201712
-- ----------------------------
DROP TABLE IF EXISTS `z_active_log_201712`;
CREATE TABLE `z_active_log_201712` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT '0',
  `app_path` varchar(255) NOT NULL DEFAULT '' COMMENT '模块路径',
  `param` varchar(255) NOT NULL COMMENT '传递参数json',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `operate_ip` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '0.0.0.0' COMMENT '操作ip',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `app_path` (`app_path`(191)) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4 COMMENT='(用户操作记录表2017/12/18)';

-- ----------------------------
-- Records of z_active_log_201712
-- ----------------------------
INSERT INTO `z_active_log_201712` VALUES ('1', '2', 'index/Index/index', '[]', '2017-12-18 17:18:19', '183.13.213.54');
INSERT INTO `z_active_log_201712` VALUES ('2', '2', 'workclass/View/show_schedule', '[]', '2017-12-18 17:18:19', '183.13.213.54');
INSERT INTO `z_active_log_201712` VALUES ('3', '2', 'workclass/View/set_schedule', '{\"schedule_id\":\"8\"}', '2017-12-18 17:18:29', '183.13.213.54');
INSERT INTO `z_active_log_201712` VALUES ('4', '2', 'workclass/View/show_schedule', '[]', '2017-12-18 22:56:40', '223.104.63.2');
INSERT INTO `z_active_log_201712` VALUES ('5', '2', 'workclass/View/set_class', '{\"class_id\":\"1\"}', '2017-12-18 22:58:41', '223.104.63.2');
INSERT INTO `z_active_log_201712` VALUES ('6', '2', 'workclass/Index/set_class_info', '{\"id\":\"1\",\"name\":\"\\u4f11\\u606f\",\"sign\":\"6\",\"status\":\"0\",\"rank\":\"\"}', '2017-12-18 22:58:47', '223.104.63.2');
INSERT INTO `z_active_log_201712` VALUES ('7', '2', 'workclass/Index/set_class_info', '{\"id\":\"1\",\"name\":\"\\u4f11\\u606f\",\"sign\":\"6\",\"status\":\"0\",\"rank\":\"\"}', '2017-12-18 22:58:56', '223.104.63.2');
INSERT INTO `z_active_log_201712` VALUES ('8', '2', 'workclass/Index/set_class_info', '{\"id\":\"1\",\"name\":\"\\u4f11\\u606f\",\"sign\":\"7\",\"status\":\"0\",\"rank\":\"\"}', '2017-12-18 22:59:04', '223.104.63.2');
INSERT INTO `z_active_log_201712` VALUES ('9', '2', 'workclass/Index/set_class_info', '{\"id\":\"1\",\"name\":\"\\u4f11\\u606f\",\"sign\":\"6\",\"status\":\"0\",\"rank\":\"\"}', '2017-12-18 22:59:06', '223.104.63.2');
INSERT INTO `z_active_log_201712` VALUES ('10', '2', 'workclass/View/show_schedule', '[]', '2017-12-18 22:59:08', '223.104.63.2');
INSERT INTO `z_active_log_201712` VALUES ('11', '2', 'workclass/View/set_schedule', '[]', '2017-12-18 23:01:40', '223.104.63.2');
INSERT INTO `z_active_log_201712` VALUES ('12', '2', 'workclass/View/set_schedule', '{\"schedule_id\":\"8\"}', '2017-12-18 23:01:43', '223.104.63.2');
INSERT INTO `z_active_log_201712` VALUES ('13', '2', 'workclass/View/set_schedule', '{\"schedule_id\":\"9\"}', '2017-12-18 23:01:45', '223.104.63.2');
INSERT INTO `z_active_log_201712` VALUES ('14', '2', 'workclass/View/set_schedule', '{\"schedule_id\":\"7\"}', '2017-12-18 23:01:49', '223.104.63.2');
INSERT INTO `z_active_log_201712` VALUES ('15', '2', 'workclass/View/set_class', '[]', '2017-12-18 23:02:12', '223.104.63.2');
INSERT INTO `z_active_log_201712` VALUES ('16', '2', 'workclass/Index/get_class_info', '{\"class_id\":\"3\"}', '2017-12-18 23:02:15', '223.104.63.2');
INSERT INTO `z_active_log_201712` VALUES ('17', '2', 'workclass/Index/set_class_info', '{\"id\":\"3\",\"name\":\"\\u665a\\u73ed\",\"sign\":\"2\",\"status\":\"0\",\"rank\":\"\"}', '2017-12-18 23:02:18', '223.104.63.2');
INSERT INTO `z_active_log_201712` VALUES ('18', '2', 'workclass/Index/set_class_info', '{\"id\":\"3\",\"name\":\"\\u665a\\u73ed\",\"sign\":\"1\",\"status\":\"0\",\"rank\":\"\"}', '2017-12-18 23:02:20', '223.104.63.2');
INSERT INTO `z_active_log_201712` VALUES ('19', '2', 'workclass/View/set_schedule', '{\"schedule_id\":\"7\"}', '2017-12-18 23:02:28', '223.104.63.2');
INSERT INTO `z_active_log_201712` VALUES ('20', '2', 'workclass/View/set_schedule', '{\"schedule_id\":\"9\"}', '2017-12-18 23:02:31', '223.104.63.2');
INSERT INTO `z_active_log_201712` VALUES ('21', '2', 'index/Index/index', '[]', '2017-12-19 07:21:39', '117.136.40.216');
INSERT INTO `z_active_log_201712` VALUES ('22', '2', 'workclass/View/show_schedule', '[]', '2017-12-19 07:21:40', '117.136.40.216');
INSERT INTO `z_active_log_201712` VALUES ('23', '2', 'workclass/View/set_class', '{\"class_id\":\"1\"}', '2017-12-19 07:21:54', '117.136.40.216');
INSERT INTO `z_active_log_201712` VALUES ('24', '2', 'workclass/Index/set_class_info', '{\"id\":\"1\",\"name\":\"\\u4f11\\u606f\",\"sign\":\"5\",\"status\":\"0\",\"rank\":\"\"}', '2017-12-19 07:21:57', '117.136.40.216');
INSERT INTO `z_active_log_201712` VALUES ('25', '2', 'workclass/View/show_schedule', '[]', '2017-12-19 07:21:59', '117.136.40.216');
INSERT INTO `z_active_log_201712` VALUES ('26', '2', 'workclass/View/set_schedule', '{\"schedule_id\":\"8\"}', '2017-12-19 07:22:04', '117.136.40.216');
INSERT INTO `z_active_log_201712` VALUES ('27', '2', 'workclass/Index/set_schedule_info', '{\"id\":\"8\",\"name\":\"A\\u73ed\",\"start_time\":\"2017-12-09\",\"period\":\"6\",\"is_default\":\"1\",\"status\":\"0\",\"law\":\"[2,2,1,3,3,2]\"}', '2017-12-19 07:22:12', '117.136.40.216');
INSERT INTO `z_active_log_201712` VALUES ('28', '2', 'workclass/View/set_schedule', '{\"schedule_id\":\"8\"}', '2017-12-19 07:22:17', '117.136.40.216');
INSERT INTO `z_active_log_201712` VALUES ('29', '2', 'workclass/View/show_schedule', '[]', '2017-12-19 07:22:18', '117.136.40.216');
INSERT INTO `z_active_log_201712` VALUES ('30', '2', 'workclass/View/show_schedule', '[]', '2017-12-19 09:26:43', '183.13.213.54');
INSERT INTO `z_active_log_201712` VALUES ('31', '2', 'workclass/View/set_class', '{\"class_id\":\"1\"}', '2017-12-19 09:26:46', '183.13.213.54');
INSERT INTO `z_active_log_201712` VALUES ('32', '2', 'workclass/Index/set_class_info', '{\"id\":\"1\",\"name\":\"\\u4f11\\u606f\",\"sign\":\"6\",\"status\":\"0\",\"rank\":\"\"}', '2017-12-19 09:26:49', '183.13.213.54');
INSERT INTO `z_active_log_201712` VALUES ('33', '2', 'workclass/View/show_schedule', '[]', '2017-12-19 09:26:52', '183.13.213.54');
INSERT INTO `z_active_log_201712` VALUES ('34', '2', 'workclass/View/show_schedule', '[]', '2017-12-19 09:26:53', '183.13.213.54');
INSERT INTO `z_active_log_201712` VALUES ('35', '2', 'workclass/View/set_class', '{\"class_id\":\"1\"}', '2017-12-19 09:26:56', '183.13.213.54');
INSERT INTO `z_active_log_201712` VALUES ('36', '2', 'workclass/Index/set_class_info', '{\"id\":\"1\",\"name\":\"\\u4f11\\u606f\",\"sign\":\"4\",\"status\":\"0\",\"rank\":\"\"}', '2017-12-19 09:26:57', '183.13.213.54');
INSERT INTO `z_active_log_201712` VALUES ('37', '2', 'workclass/View/show_schedule', '[]', '2017-12-19 09:26:59', '183.13.213.54');
INSERT INTO `z_active_log_201712` VALUES ('38', '2', 'workclass/View/show_schedule', '[]', '2017-12-19 09:26:59', '183.13.213.54');
INSERT INTO `z_active_log_201712` VALUES ('39', '2', 'index/Index/index', '[]', '2017-12-19 17:02:54', '59.37.8.145');
INSERT INTO `z_active_log_201712` VALUES ('40', '2', 'workclass/View/show_schedule', '[]', '2017-12-19 17:02:54', '59.37.8.145');
INSERT INTO `z_active_log_201712` VALUES ('41', '2', 'index/Index/index', '[]', '2017-12-20 15:22:18', '219.133.249.123');
INSERT INTO `z_active_log_201712` VALUES ('42', '2', 'workclass/View/show_schedule', '[]', '2017-12-20 15:22:18', '219.133.249.123');
INSERT INTO `z_active_log_201712` VALUES ('43', '2', 'index/Index/index', '[]', '2017-12-21 07:42:28', '117.136.79.129');
INSERT INTO `z_active_log_201712` VALUES ('44', '2', 'workclass/View/show_schedule', '[]', '2017-12-21 07:42:28', '117.136.79.129');
INSERT INTO `z_active_log_201712` VALUES ('45', '2', 'index/Index/index', '[]', '2017-12-21 07:58:45', '117.136.79.129');
INSERT INTO `z_active_log_201712` VALUES ('46', '2', 'workclass/View/show_schedule', '[]', '2017-12-21 07:58:45', '117.136.79.129');
INSERT INTO `z_active_log_201712` VALUES ('47', '2', 'index/Index/index', '[]', '2017-12-21 13:10:02', '59.37.8.149');
INSERT INTO `z_active_log_201712` VALUES ('48', '2', 'workclass/View/show_schedule', '[]', '2017-12-21 13:10:02', '59.37.8.149');
INSERT INTO `z_active_log_201712` VALUES ('49', '2', 'workclass/View/set_class', '{\"class_id\":\"1\"}', '2017-12-21 13:12:37', '59.37.8.149');
INSERT INTO `z_active_log_201712` VALUES ('50', '2', 'workclass/Index/set_class_info', '{\"id\":\"1\",\"name\":\"\\u4f11\\u606f\",\"sign\":\"6\",\"status\":\"0\",\"rank\":\"\"}', '2017-12-21 13:13:17', '59.37.8.149');
INSERT INTO `z_active_log_201712` VALUES ('51', '2', 'workclass/View/show_schedule', '[]', '2017-12-21 13:13:20', '59.37.8.149');
INSERT INTO `z_active_log_201712` VALUES ('52', '2', 'index/Index/index', '[]', '2017-12-22 14:06:11', '113.92.92.57');
INSERT INTO `z_active_log_201712` VALUES ('53', '2', 'workclass/View/show_schedule', '[]', '2017-12-22 14:06:11', '113.92.92.57');
INSERT INTO `z_active_log_201712` VALUES ('54', '2', 'workclass/Index/get_schedule_info', '{\"id\":\"7\"}', '2017-12-22 14:06:26', '113.92.92.57');
INSERT INTO `z_active_log_201712` VALUES ('55', '2', 'index/Index/index', '[]', '2017-12-22 14:37:48', '223.104.63.30');
INSERT INTO `z_active_log_201712` VALUES ('56', '2', 'workclass/View/show_schedule', '[]', '2017-12-22 14:37:48', '223.104.63.30');
INSERT INTO `z_active_log_201712` VALUES ('57', '2', 'index/Index/index', '[]', '2017-12-24 18:39:21', '59.37.8.138');
INSERT INTO `z_active_log_201712` VALUES ('58', '2', 'workclass/View/show_schedule', '[]', '2017-12-24 18:39:21', '59.37.8.138');
INSERT INTO `z_active_log_201712` VALUES ('59', '2', 'workclass/Index/get_schedule_info', '{\"id\":\"7\"}', '2017-12-24 18:47:07', '59.37.8.138');
INSERT INTO `z_active_log_201712` VALUES ('60', '2', 'workclass/Index/get_schedule_info', '{\"id\":\"7\"}', '2017-12-24 18:47:23', '59.37.8.138');
INSERT INTO `z_active_log_201712` VALUES ('61', '2', 'workclass/Index/get_schedule_info', '{\"id\":\"9\"}', '2017-12-24 18:48:11', '59.37.8.138');
INSERT INTO `z_active_log_201712` VALUES ('62', '2', 'workclass/Index/get_schedule_info', '{\"id\":\"9\"}', '2017-12-24 18:48:16', '59.37.8.138');
INSERT INTO `z_active_log_201712` VALUES ('63', '2', 'workclass/Index/get_schedule_info', '{\"id\":\"7\"}', '2017-12-24 18:48:18', '59.37.8.138');
INSERT INTO `z_active_log_201712` VALUES ('64', '2', 'workclass/Index/get_schedule_info', '{\"id\":\"8\"}', '2017-12-24 18:48:30', '59.37.8.138');
INSERT INTO `z_active_log_201712` VALUES ('65', '2', 'workclass/Index/get_schedule_info', '{\"id\":\"8\"}', '2017-12-24 18:48:34', '59.37.8.138');
INSERT INTO `z_active_log_201712` VALUES ('66', '2', 'workclass/Index/get_schedule_info', '{\"id\":\"7\"}', '2017-12-24 18:48:44', '59.37.8.138');
INSERT INTO `z_active_log_201712` VALUES ('67', '2', 'workclass/Index/get_schedule_info', '{\"id\":\"8\"}', '2017-12-24 18:48:56', '59.37.8.138');
INSERT INTO `z_active_log_201712` VALUES ('68', '2', 'workclass/Index/get_schedule_info', '{\"id\":\"7\"}', '2017-12-24 18:49:19', '59.37.8.138');
INSERT INTO `z_active_log_201712` VALUES ('69', '2', 'index/Index/index', '[]', '2017-12-24 18:53:29', '117.136.12.162');
INSERT INTO `z_active_log_201712` VALUES ('70', '2', 'workclass/View/show_schedule', '[]', '2017-12-24 18:53:29', '117.136.12.162');
INSERT INTO `z_active_log_201712` VALUES ('71', '2', 'workclass/Index/get_schedule_info', '{\"id\":\"7\"}', '2017-12-24 18:53:45', '117.136.12.162');
INSERT INTO `z_active_log_201712` VALUES ('72', '2', 'workclass/Index/get_schedule_info', '{\"id\":\"8\"}', '2017-12-24 18:53:50', '117.136.12.162');
INSERT INTO `z_active_log_201712` VALUES ('73', '2', 'index/Index/index', '[]', '2017-12-24 18:54:27', '117.136.12.162');
INSERT INTO `z_active_log_201712` VALUES ('74', '2', 'workclass/View/show_schedule', '[]', '2017-12-24 18:54:27', '117.136.12.162');
INSERT INTO `z_active_log_201712` VALUES ('75', '2', 'workclass/View/set_schedule', '{\"schedule_id\":\"7\"}', '2017-12-24 18:54:30', '117.136.12.162');
INSERT INTO `z_active_log_201712` VALUES ('76', '2', 'workclass/Index/set_schedule_info', '{\"id\":\"7\",\"name\":\"C\\u73ed\",\"start_time\":\"2017-12-24\",\"period\":\"6\",\"is_default\":\"0\",\"status\":\"0\",\"law\":\"[1,2,2,1,3,3]\"}', '2017-12-24 18:54:52', '117.136.12.162');
INSERT INTO `z_active_log_201712` VALUES ('77', '2', 'workclass/View/show_schedule', '{\"schedule_id\":\"7\"}', '2017-12-24 18:54:53', '117.136.12.162');
INSERT INTO `z_active_log_201712` VALUES ('78', '2', 'index/Index/index', '[]', '2017-12-24 18:56:12', '117.136.12.162');
INSERT INTO `z_active_log_201712` VALUES ('79', '2', 'workclass/View/show_schedule', '[]', '2017-12-24 18:56:12', '117.136.12.162');
INSERT INTO `z_active_log_201712` VALUES ('80', '2', 'workclass/Index/get_schedule_info', '{\"id\":\"9\"}', '2017-12-24 18:57:09', '117.136.12.162');
INSERT INTO `z_active_log_201712` VALUES ('81', '2', 'index/Index/index', '[]', '2017-12-24 18:57:59', '117.136.12.162');
INSERT INTO `z_active_log_201712` VALUES ('82', '2', 'workclass/View/show_schedule', '[]', '2017-12-24 18:58:00', '117.136.12.162');
INSERT INTO `z_active_log_201712` VALUES ('83', '2', 'workclass/Index/get_schedule_info', '{\"id\":\"9\"}', '2017-12-24 18:58:03', '117.136.12.162');
INSERT INTO `z_active_log_201712` VALUES ('84', '2', 'index/Index/index', '[]', '2017-12-24 22:53:40', '117.136.39.223');
INSERT INTO `z_active_log_201712` VALUES ('85', '2', 'workclass/View/show_schedule', '[]', '2017-12-24 22:53:41', '117.136.39.223');
INSERT INTO `z_active_log_201712` VALUES ('86', '2', 'workclass/Index/get_schedule_info', '{\"id\":\"7\"}', '2017-12-24 22:54:48', '117.136.39.223');
INSERT INTO `z_active_log_201712` VALUES ('87', '1', 'workclass/View/show_schedule', '[]', '2017-12-26 11:50:51', '117.136.40.188');
INSERT INTO `z_active_log_201712` VALUES ('88', '2', 'index/Index/index', '[]', '2017-12-26 22:42:15', '113.88.67.105');
INSERT INTO `z_active_log_201712` VALUES ('89', '2', 'workclass/View/show_schedule', '[]', '2017-12-26 22:42:16', '113.88.67.105');
INSERT INTO `z_active_log_201712` VALUES ('90', '2', 'index/Index/index', '[]', '2017-12-26 22:43:53', '183.17.56.181');
INSERT INTO `z_active_log_201712` VALUES ('91', '2', 'workclass/View/show_schedule', '[]', '2017-12-26 22:43:53', '183.17.56.181');
INSERT INTO `z_active_log_201712` VALUES ('92', '2', 'workclass/Index/get_schedule_info', '{\"id\":\"7\"}', '2017-12-26 22:44:36', '183.17.56.181');
INSERT INTO `z_active_log_201712` VALUES ('93', '2', 'workclass/Index/get_schedule_info', '{\"id\":\"9\"}', '2017-12-26 22:44:39', '183.17.56.181');
INSERT INTO `z_active_log_201712` VALUES ('94', '2', 'index/Index/index', '[]', '2017-12-26 22:44:54', '183.17.56.181');
INSERT INTO `z_active_log_201712` VALUES ('95', '2', 'workclass/View/show_schedule', '[]', '2017-12-26 22:44:54', '183.17.56.181');
INSERT INTO `z_active_log_201712` VALUES ('96', '2', 'index/Index/index', '[]', '2017-12-26 22:46:00', '183.17.56.181');
INSERT INTO `z_active_log_201712` VALUES ('97', '2', 'workclass/View/show_schedule', '[]', '2017-12-26 22:46:05', '183.17.56.181');
INSERT INTO `z_active_log_201712` VALUES ('98', '2', 'index/Index/index', '[]', '2017-12-26 22:47:52', '183.17.56.176');
INSERT INTO `z_active_log_201712` VALUES ('99', '2', 'workclass/View/show_schedule', '[]', '2017-12-26 22:47:52', '183.17.56.176');
INSERT INTO `z_active_log_201712` VALUES ('100', '2', 'index/Index/index', '[]', '2017-12-28 10:01:36', '223.104.63.183');
INSERT INTO `z_active_log_201712` VALUES ('101', '2', 'workclass/View/show_schedule', '[]', '2017-12-28 10:01:37', '223.104.63.183');
INSERT INTO `z_active_log_201712` VALUES ('102', '2', 'workclass/Index/get_schedule_info', '{\"id\":\"9\"}', '2017-12-28 10:01:47', '223.104.63.183');
INSERT INTO `z_active_log_201712` VALUES ('103', '2', 'workclass/Index/get_schedule_info', '{\"id\":\"8\"}', '2017-12-28 10:02:14', '223.104.63.183');
INSERT INTO `z_active_log_201712` VALUES ('104', '2', 'index/Index/index', '[]', '2017-12-28 12:31:50', '59.37.8.143');
INSERT INTO `z_active_log_201712` VALUES ('105', '2', 'workclass/View/show_schedule', '[]', '2017-12-28 12:31:50', '59.37.8.143');
INSERT INTO `z_active_log_201712` VALUES ('106', '2', 'index/Index/index', '[]', '2017-12-28 12:33:29', '59.37.8.143');
INSERT INTO `z_active_log_201712` VALUES ('107', '2', 'workclass/View/show_schedule', '[]', '2017-12-28 12:33:29', '59.37.8.143');
INSERT INTO `z_active_log_201712` VALUES ('108', '2', 'index/Index/index', '[]', '2017-12-28 15:31:47', '117.136.40.176');
INSERT INTO `z_active_log_201712` VALUES ('109', '2', 'workclass/View/show_schedule', '[]', '2017-12-28 15:31:47', '117.136.40.176');

-- ----------------------------
-- Table structure for z_active_log_201801
-- ----------------------------
DROP TABLE IF EXISTS `z_active_log_201801`;
CREATE TABLE `z_active_log_201801` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT '0',
  `app_path` varchar(255) NOT NULL DEFAULT '' COMMENT '模块路径',
  `param` varchar(255) NOT NULL COMMENT '传递参数json',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `operate_ip` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '0.0.0.0' COMMENT '操作ip',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `app_path` (`app_path`(191)) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=237 DEFAULT CHARSET=utf8mb4 COMMENT='(用户操作记录表2018/01/04)';

-- ----------------------------
-- Records of z_active_log_201801
-- ----------------------------
INSERT INTO `z_active_log_201801` VALUES ('1', '1', 'workclass/View/show_schedule', '[]', '2018-01-04 10:02:41', '219.133.174.195');
INSERT INTO `z_active_log_201801` VALUES ('2', '2', 'workclass/View/show_schedule', '[]', '2018-01-05 10:51:39', '219.133.179.25');
INSERT INTO `z_active_log_201801` VALUES ('3', '2', 'index/Index/index', '[]', '2018-01-05 13:36:56', '183.17.57.123');
INSERT INTO `z_active_log_201801` VALUES ('4', '2', 'workclass/View/show_schedule', '[]', '2018-01-05 13:36:56', '183.17.57.123');
INSERT INTO `z_active_log_201801` VALUES ('5', '2', 'workclass/Index/get_schedule_info', '{\"id\":\"7\"}', '2018-01-05 13:37:12', '183.17.57.123');
INSERT INTO `z_active_log_201801` VALUES ('6', '2', 'workclass/Index/get_schedule_info', '{\"id\":\"9\"}', '2018-01-05 13:37:35', '183.17.57.123');
INSERT INTO `z_active_log_201801` VALUES ('7', '2', 'index/Index/index', '[]', '2018-01-05 14:45:51', '223.104.63.20');
INSERT INTO `z_active_log_201801` VALUES ('8', '2', 'workclass/View/show_schedule', '[]', '2018-01-05 14:45:51', '223.104.63.20');
INSERT INTO `z_active_log_201801` VALUES ('9', '2', 'workclass/Index/get_schedule_info', '{\"id\":\"9\"}', '2018-01-05 14:46:37', '223.104.63.20');
INSERT INTO `z_active_log_201801` VALUES ('10', '2', 'index/Index/index', '[]', '2018-01-06 18:33:39', '223.104.63.179');
INSERT INTO `z_active_log_201801` VALUES ('11', '2', 'workclass/View/show_schedule', '[]', '2018-01-06 18:33:42', '223.104.63.179');
INSERT INTO `z_active_log_201801` VALUES ('12', '2', 'workclass/View/show_schedule', '[]', '2018-01-09 20:21:33', '113.88.65.183');
INSERT INTO `z_active_log_201801` VALUES ('13', '2', 'index/Index/index', '[]', '2018-01-09 20:21:41', '113.88.65.183');
INSERT INTO `z_active_log_201801` VALUES ('14', '2', 'workclass/View/show_schedule', '[]', '2018-01-09 20:21:42', '113.88.65.183');
INSERT INTO `z_active_log_201801` VALUES ('15', '2', 'index/Index/index', '[]', '2018-01-09 23:24:57', '117.136.40.206');
INSERT INTO `z_active_log_201801` VALUES ('16', '2', 'workclass/View/show_schedule', '[]', '2018-01-09 23:24:57', '117.136.40.206');
INSERT INTO `z_active_log_201801` VALUES ('17', '2', 'index/Index/index', '[]', '2018-01-09 23:25:04', '117.136.40.206');
INSERT INTO `z_active_log_201801` VALUES ('18', '2', 'workclass/View/show_schedule', '[]', '2018-01-09 23:25:05', '117.136.40.206');
INSERT INTO `z_active_log_201801` VALUES ('19', '2', 'workclass/View/show_schedule', '[]', '2018-01-11 22:32:04', '113.88.65.43');
INSERT INTO `z_active_log_201801` VALUES ('20', '2', 'workclass/View/show_schedule', '[]', '2018-01-11 22:32:34', '219.133.177.165');
INSERT INTO `z_active_log_201801` VALUES ('21', '2', 'workclass/View/set_class', '{\"class_id\":\"1\"}', '2018-01-11 22:35:07', '219.133.248.31');
INSERT INTO `z_active_log_201801` VALUES ('22', '2', 'index/Index/index', '[]', '2018-01-13 07:28:17', '117.136.12.166');
INSERT INTO `z_active_log_201801` VALUES ('23', '2', 'workclass/View/show_schedule', '[]', '2018-01-13 07:28:18', '117.136.12.166');
INSERT INTO `z_active_log_201801` VALUES ('24', '2', 'workclass/View/show_schedule', '[]', '2018-01-13 07:28:40', '117.136.12.166');
INSERT INTO `z_active_log_201801` VALUES ('25', '2', 'workclass/Index/get_schedule_info', '{\"id\":\"9\"}', '2018-01-13 07:28:45', '117.136.12.166');
INSERT INTO `z_active_log_201801` VALUES ('26', '1', 'workclass/View/show_schedule', '[]', '2018-01-13 10:56:26', '113.87.11.221');
INSERT INTO `z_active_log_201801` VALUES ('27', '1', 'workclass/View/show_schedule', '[]', '2018-01-13 11:08:30', '113.87.11.221');
INSERT INTO `z_active_log_201801` VALUES ('28', '1', 'workclass/View/show_schedule', '[]', '2018-01-13 13:37:06', '223.104.63.193');
INSERT INTO `z_active_log_201801` VALUES ('29', '1', 'workclass/View/show_schedule', '{\"nsukey\":\"Ie715Z4LVa2ovGzjS8wLxkjrGJ6Ak6t1xpK+DI8cdKO8VKRHTadiAu25+UtZb330i8N7DVsVzjhRrm4FTxcgleg6SmpHYCGjuOOACrDCtdrtcZ7LN2oue75nfj+0fkXx57fcGR1rWC5CNYkJt+u2\\/vvnpFutya1YMU2D5yf0ubAYLEx1BssKVFZ2tQSfe2m5\"}', '2018-01-13 13:37:11', '223.104.63.193');
INSERT INTO `z_active_log_201801` VALUES ('30', '1', 'workclass/View/set_schedule', '{\"schedule_id\":\"13\"}', '2018-01-13 13:37:13', '223.104.63.193');
INSERT INTO `z_active_log_201801` VALUES ('31', '1', 'index/Index/index', '[]', '2018-01-13 13:41:44', '223.104.63.193');
INSERT INTO `z_active_log_201801` VALUES ('32', '1', 'workclass/View/show_schedule', '[]', '2018-01-13 13:41:44', '223.104.63.193');
INSERT INTO `z_active_log_201801` VALUES ('33', '1', 'workclass/View/show_schedule', '{\"nsukey\":\"6khJIjrr8puluXAtp1k4eGUfdLu3cSjps1R3vdCFQzF9cTsGhUbEJrULRhX+qYyPSDJ5iQTzQeDYwDJLglTxubK\\/oIgQqR6bSHnC0dVQNyH1k0T2BAIGasu8gzuMtGiPXxHf+38fME75lKs\\/fZV4aHrEW6ciWlZo7Smsdig1DUAbDQ+WaPpMVQfXuhWdYa5tUkliEZhKnOrQRisTdaM1JQ==\"}', '2018-01-13 13:41:50', '223.104.63.193');
INSERT INTO `z_active_log_201801` VALUES ('34', '1', 'index/Index/index', '[]', '2018-01-13 13:42:04', '223.104.63.193');
INSERT INTO `z_active_log_201801` VALUES ('35', '1', 'workclass/View/show_schedule', '[]', '2018-01-13 13:42:04', '223.104.63.193');
INSERT INTO `z_active_log_201801` VALUES ('36', '1', 'index/Index/index', '[]', '2018-01-13 13:49:40', '223.104.63.193');
INSERT INTO `z_active_log_201801` VALUES ('37', '1', 'workclass/View/show_schedule', '[]', '2018-01-13 13:49:40', '223.104.63.193');
INSERT INTO `z_active_log_201801` VALUES ('38', '1', 'index/Index/index', '{\"nsukey\":\"6EtE94LKGJ8GY2xVso+s6QY98d90oVitDSvwAFeSAEfm6WHoff5g9DnDlZ82WX4Bp9mrUbQJNbt0PYq1569HIoIrz2TjM7AdPrf6TuC8xpCps0l20wZcpCgL+U2nxOKfSUFnjMH+uGaTemdwps6xRab0nbq11jU1OriJXlpQ3f+9IfpWjVReOGxBkFfe7vxyZr6w8D81mvYk+oXhRE8I2A==\"}', '2018-01-13 13:50:52', '223.104.63.193');
INSERT INTO `z_active_log_201801` VALUES ('39', '1', 'workclass/View/show_schedule', '[]', '2018-01-13 13:50:52', '223.104.63.193');
INSERT INTO `z_active_log_201801` VALUES ('40', '1', 'workclass/View/show_schedule', '{\"nsukey\":\"9F5QKabAVzWJqUbu+Vu66+2PWo8hSmmneqWASbA2fZgHA7LXkpCOr6Bv\\/rzrrVCV7tC67wX6+AcsjDepQNR0l6222lTaq9BfLdPvQGq4s9GqyV2XabsdXviK+2OgurXhxu2bEZeGb1WxFQPrvDuIqzIaAyjRG7RFjilMLVuGg04=\"}', '2018-01-13 13:50:54', '223.104.63.193');
INSERT INTO `z_active_log_201801` VALUES ('41', '1', 'workclass/View/set_schedule', '{\"schedule_id\":\"13\"}', '2018-01-13 13:50:56', '223.104.63.193');
INSERT INTO `z_active_log_201801` VALUES ('42', '1', 'workclass/View/set_schedule', '{\"schedule_id\":\"13\",\"nsukey\":\"OJm10ulZBzdO05f3r6lpV8sBR4GJr41\\/LOZM08oguyxKWTuTY0Vfo+dIRRtFqY9EUGFpFljbF7n+3jr4XcCoXg6ZO7eAj7DTJWQ\\/CZcsj9SpiW7Z3EZPxDFF656vp7lm2ckTr7wLz7jHTOUhnx7BgSX5TrrxRQ+X2I\\/G94q2T1kxZbPsUau73z6u9KUshbQDpCGLgVUK+aL\\/rOsspgl45A==\"}', '2018-01-13 13:50:58', '223.104.63.193');
INSERT INTO `z_active_log_201801` VALUES ('43', '1', 'workclass/View/show_schedule', '{\"schedule_id\":\"13\"}', '2018-01-13 13:50:59', '223.104.63.193');
INSERT INTO `z_active_log_201801` VALUES ('44', '1', 'workclass/View/show_schedule', '{\"schedule_id\":\"13\",\"nsukey\":\"HOlpL2E96uT1velpj+Wm47Oo36NyMrVmwutkS6QRMuzGS2VuOsqVfCdUXqsuiBg0tvM6MIducIhYomlqWv7Uf8SphDbaMPtwna0zvN1P0hZ3r10bqB8Vv\\/srQ6LuiN1FwhMAZAGX4I\\/jW3AicSZF+jR0rwSMkqohwMtiDIB4Ukp1ja3o\\/f\\/9NQRS+MtXHIJY1FmhYyt\\/E7ytolZ26\\/LYkA==\"}', '2018-01-13 13:51:09', '223.104.63.193');
INSERT INTO `z_active_log_201801` VALUES ('45', '1', 'workclass/View/set_schedule', '{\"schedule_id\":\"13\"}', '2018-01-13 13:51:12', '223.104.63.193');
INSERT INTO `z_active_log_201801` VALUES ('46', '1', 'index/Index/index', '[]', '2018-01-13 17:53:37', '113.87.11.221');
INSERT INTO `z_active_log_201801` VALUES ('47', '1', 'workclass/View/show_schedule', '[]', '2018-01-13 17:53:37', '113.87.11.221');
INSERT INTO `z_active_log_201801` VALUES ('48', '1', 'index/Index/index', '[]', '2018-01-13 18:21:27', '223.104.63.193');
INSERT INTO `z_active_log_201801` VALUES ('49', '1', 'workclass/View/show_schedule', '[]', '2018-01-13 18:21:27', '223.104.63.193');
INSERT INTO `z_active_log_201801` VALUES ('50', '1', 'workclass/View/set_schedule', '{\"schedule_id\":\"13\"}', '2018-01-13 18:21:31', '223.104.63.193');
INSERT INTO `z_active_log_201801` VALUES ('51', '4', 'index/Index/index', '[]', '2018-01-13 19:10:21', '117.136.41.47');
INSERT INTO `z_active_log_201801` VALUES ('52', '4', 'workclass/View/show_schedule', '[]', '2018-01-13 19:10:21', '117.136.41.47');
INSERT INTO `z_active_log_201801` VALUES ('53', '4', 'workclass/View/set_schedule', '[]', '2018-01-13 19:10:22', '117.136.41.47');
INSERT INTO `z_active_log_201801` VALUES ('54', '4', 'workclass/View/set_class', '[]', '2018-01-13 19:11:43', '117.136.41.47');
INSERT INTO `z_active_log_201801` VALUES ('55', '4', 'workclass/Index/set_class_info', '{\"id\":\"\",\"name\":\"\",\"sign\":\"2\",\"status\":\"0\",\"rank\":\"\"}', '2018-01-13 19:11:45', '117.136.41.47');
INSERT INTO `z_active_log_201801` VALUES ('56', '4', 'workclass/Index/set_class_info', '{\"id\":\"\",\"name\":\"2333\",\"sign\":\"2\",\"status\":\"0\",\"rank\":\"\"}', '2018-01-13 19:11:53', '117.136.41.47');
INSERT INTO `z_active_log_201801` VALUES ('57', '4', 'workclass/Index/set_class_info', '{\"id\":\"14\",\"name\":\"2333\",\"sign\":\"2\",\"status\":\"0\",\"rank\":\"1\"}', '2018-01-13 19:11:56', '117.136.41.47');
INSERT INTO `z_active_log_201801` VALUES ('58', '4', 'workclass/View/set_schedule', '[]', '2018-01-13 19:12:02', '117.136.41.47');
INSERT INTO `z_active_log_201801` VALUES ('59', '4', 'workclass/View/set_class', '[]', '2018-01-13 19:12:04', '117.136.41.47');
INSERT INTO `z_active_log_201801` VALUES ('60', '4', 'workclass/View/set_schedule', '[]', '2018-01-13 19:12:06', '117.136.41.47');
INSERT INTO `z_active_log_201801` VALUES ('61', '4', 'workclass/View/set_schedule', '[]', '2018-01-13 19:12:07', '117.136.41.47');
INSERT INTO `z_active_log_201801` VALUES ('62', '4', 'workclass/View/set_schedule', '[]', '2018-01-13 19:12:10', '117.136.41.47');
INSERT INTO `z_active_log_201801` VALUES ('63', '4', 'workclass/View/set_schedule', '[]', '2018-01-13 19:12:12', '117.136.41.47');
INSERT INTO `z_active_log_201801` VALUES ('64', '4', 'workclass/View/set_schedule', '[]', '2018-01-13 19:12:14', '117.136.41.47');
INSERT INTO `z_active_log_201801` VALUES ('65', '4', 'member/View/login', '[]', '2018-01-13 19:13:02', '117.136.41.47');
INSERT INTO `z_active_log_201801` VALUES ('66', '4', 'index/Index/index', '[]', '2018-01-13 19:13:02', '117.136.41.47');
INSERT INTO `z_active_log_201801` VALUES ('67', '4', 'workclass/View/set_schedule', '[]', '2018-01-13 19:13:02', '117.136.41.47');
INSERT INTO `z_active_log_201801` VALUES ('68', '1', 'index/Index/index', '[]', '2018-01-13 20:02:53', '14.155.223.54');
INSERT INTO `z_active_log_201801` VALUES ('69', '1', 'workclass/View/show_schedule', '[]', '2018-01-13 20:02:53', '14.155.223.54');
INSERT INTO `z_active_log_201801` VALUES ('70', '4', 'workclass/View/show_schedule', '[]', '2018-01-14 19:28:48', '223.104.63.74');
INSERT INTO `z_active_log_201801` VALUES ('71', '4', 'workclass/View/set_schedule', '[]', '2018-01-14 19:28:48', '223.104.63.74');
INSERT INTO `z_active_log_201801` VALUES ('72', '4', 'workclass/View/set_schedule', '[]', '2018-01-14 19:28:57', '223.104.63.74');
INSERT INTO `z_active_log_201801` VALUES ('73', '4', 'workclass/View/set_schedule', '[]', '2018-01-14 19:28:59', '223.104.63.74');
INSERT INTO `z_active_log_201801` VALUES ('74', '2', 'workclass/View/show_schedule', '[]', '2018-01-16 17:36:01', '223.104.1.110');
INSERT INTO `z_active_log_201801` VALUES ('75', '2', 'index/Index/index', '[]', '2018-01-17 14:01:51', '113.88.65.103');
INSERT INTO `z_active_log_201801` VALUES ('76', '2', 'workclass/View/show_schedule', '[]', '2018-01-17 14:01:51', '113.88.65.103');
INSERT INTO `z_active_log_201801` VALUES ('77', '2', 'index/Index/index', '[]', '2018-01-18 21:39:37', '59.37.8.131');
INSERT INTO `z_active_log_201801` VALUES ('78', '2', 'workclass/View/show_schedule', '[]', '2018-01-18 21:39:37', '59.37.8.131');
INSERT INTO `z_active_log_201801` VALUES ('79', '2', 'workclass/View/show_schedule', '[]', '2018-01-21 23:27:09', '117.136.40.229');
INSERT INTO `z_active_log_201801` VALUES ('80', '2', 'workclass/View/set_schedule', '{\"schedule_id\":\"8\"}', '2018-01-21 23:27:15', '117.136.40.229');
INSERT INTO `z_active_log_201801` VALUES ('81', '2', 'workclass/View/show_schedule', '{\"schedule_id\":\"8\"}', '2018-01-21 23:27:32', '117.136.40.229');
INSERT INTO `z_active_log_201801` VALUES ('82', '2', 'workclass/View/set_schedule', '{\"schedule_id\":\"8\"}', '2018-01-21 23:27:36', '117.136.40.229');
INSERT INTO `z_active_log_201801` VALUES ('83', '2', 'workclass/View/show_schedule', '{\"schedule_id\":\"8\"}', '2018-01-21 23:27:39', '117.136.40.229');
INSERT INTO `z_active_log_201801` VALUES ('84', '2', 'workclass/View/set_schedule', '{\"schedule_id\":\"8\"}', '2018-01-21 23:27:41', '117.136.40.229');
INSERT INTO `z_active_log_201801` VALUES ('85', '2', 'workclass/View/set_schedule', '{\"schedule_id\":\"9\"}', '2018-01-21 23:27:45', '117.136.40.229');
INSERT INTO `z_active_log_201801` VALUES ('86', '2', 'workclass/View/set_schedule', '{\"schedule_id\":\"7\"}', '2018-01-21 23:27:47', '117.136.40.229');
INSERT INTO `z_active_log_201801` VALUES ('87', '2', 'workclass/View/set_class', '[]', '2018-01-21 23:27:54', '117.136.40.229');
INSERT INTO `z_active_log_201801` VALUES ('88', '2', 'workclass/Index/get_class_info', '{\"class_id\":\"3\"}', '2018-01-21 23:27:59', '117.136.40.229');
INSERT INTO `z_active_log_201801` VALUES ('89', '2', 'workclass/Index/get_class_info', '{\"class_id\":\"3\"}', '2018-01-21 23:28:00', '117.136.40.229');
INSERT INTO `z_active_log_201801` VALUES ('90', '2', 'workclass/Index/get_class_info', '{\"class_id\":\"2\"}', '2018-01-21 23:28:01', '117.136.40.229');
INSERT INTO `z_active_log_201801` VALUES ('91', '2', 'workclass/Index/get_class_info', '{\"class_id\":\"1\"}', '2018-01-21 23:28:03', '117.136.40.229');
INSERT INTO `z_active_log_201801` VALUES ('92', '2', 'workclass/Index/get_class_info', '{\"class_id\":\"3\"}', '2018-01-21 23:28:04', '117.136.40.229');
INSERT INTO `z_active_log_201801` VALUES ('93', '2', 'workclass/Index/get_class_info', '{\"class_id\":\"2\"}', '2018-01-21 23:28:04', '117.136.40.229');
INSERT INTO `z_active_log_201801` VALUES ('94', '2', 'workclass/Index/get_class_info', '{\"class_id\":\"3\"}', '2018-01-21 23:28:06', '117.136.40.229');
INSERT INTO `z_active_log_201801` VALUES ('95', '2', 'workclass/Index/get_class_info', '{\"class_id\":\"3\"}', '2018-01-21 23:28:06', '117.136.40.229');
INSERT INTO `z_active_log_201801` VALUES ('96', '2', 'workclass/Index/get_class_info', '{\"class_id\":\"3\"}', '2018-01-21 23:28:07', '117.136.40.229');
INSERT INTO `z_active_log_201801` VALUES ('97', '2', 'workclass/Index/get_class_info', '{\"class_id\":\"3\"}', '2018-01-21 23:28:07', '117.136.40.229');
INSERT INTO `z_active_log_201801` VALUES ('98', '2', 'workclass/Index/get_class_info', '{\"class_id\":\"3\"}', '2018-01-21 23:28:07', '117.136.40.229');
INSERT INTO `z_active_log_201801` VALUES ('99', '2', 'workclass/Index/get_class_info', '{\"class_id\":\"3\"}', '2018-01-21 23:28:07', '117.136.40.229');
INSERT INTO `z_active_log_201801` VALUES ('100', '2', 'workclass/Index/get_class_info', '{\"class_id\":\"3\"}', '2018-01-21 23:28:07', '117.136.40.229');
INSERT INTO `z_active_log_201801` VALUES ('101', '2', 'workclass/Index/get_class_info', '{\"class_id\":\"3\"}', '2018-01-21 23:28:08', '117.136.40.229');
INSERT INTO `z_active_log_201801` VALUES ('102', '2', 'workclass/Index/get_class_info', '{\"class_id\":\"3\"}', '2018-01-21 23:28:08', '117.136.40.229');
INSERT INTO `z_active_log_201801` VALUES ('103', '2', 'workclass/Index/get_class_info', '{\"class_id\":\"2\"}', '2018-01-21 23:28:08', '117.136.40.229');
INSERT INTO `z_active_log_201801` VALUES ('104', '2', 'workclass/Index/get_class_info', '{\"class_id\":\"3\"}', '2018-01-21 23:28:08', '117.136.40.229');
INSERT INTO `z_active_log_201801` VALUES ('105', '2', 'workclass/Index/get_class_info', '{\"class_id\":\"2\"}', '2018-01-21 23:28:08', '117.136.40.229');
INSERT INTO `z_active_log_201801` VALUES ('106', '2', 'workclass/Index/get_class_info', '{\"class_id\":\"1\"}', '2018-01-21 23:28:09', '117.136.40.229');
INSERT INTO `z_active_log_201801` VALUES ('107', '2', 'workclass/Index/get_class_info', '{\"class_id\":\"3\"}', '2018-01-21 23:28:09', '117.136.40.229');
INSERT INTO `z_active_log_201801` VALUES ('108', '2', 'workclass/Index/get_class_info', '{\"class_id\":\"3\"}', '2018-01-21 23:28:09', '117.136.40.229');
INSERT INTO `z_active_log_201801` VALUES ('109', '2', 'workclass/Index/get_class_info', '{\"class_id\":\"2\"}', '2018-01-21 23:28:09', '117.136.40.229');
INSERT INTO `z_active_log_201801` VALUES ('110', '2', 'workclass/Index/get_class_info', '{\"class_id\":\"1\"}', '2018-01-21 23:28:10', '117.136.40.229');
INSERT INTO `z_active_log_201801` VALUES ('111', '2', 'workclass/Index/get_class_info', '{\"class_id\":\"1\"}', '2018-01-21 23:28:10', '117.136.40.229');
INSERT INTO `z_active_log_201801` VALUES ('112', '2', 'workclass/Index/get_class_info', '{\"class_id\":\"3\"}', '2018-01-21 23:28:10', '117.136.40.229');
INSERT INTO `z_active_log_201801` VALUES ('113', '2', 'workclass/Index/get_class_info', '{\"class_id\":\"3\"}', '2018-01-21 23:28:10', '117.136.40.229');
INSERT INTO `z_active_log_201801` VALUES ('114', '2', 'workclass/Index/get_class_info', '{\"class_id\":\"2\"}', '2018-01-21 23:28:10', '117.136.40.229');
INSERT INTO `z_active_log_201801` VALUES ('115', '2', 'workclass/Index/get_class_info', '{\"class_id\":\"1\"}', '2018-01-21 23:28:11', '117.136.40.229');
INSERT INTO `z_active_log_201801` VALUES ('116', '2', 'workclass/Index/get_class_info', '{\"class_id\":\"1\"}', '2018-01-21 23:28:11', '117.136.40.229');
INSERT INTO `z_active_log_201801` VALUES ('117', '2', 'workclass/Index/get_class_info', '{\"class_id\":\"2\"}', '2018-01-21 23:28:11', '117.136.40.229');
INSERT INTO `z_active_log_201801` VALUES ('118', '2', 'workclass/Index/get_class_info', '{\"class_id\":\"3\"}', '2018-01-21 23:28:11', '117.136.40.229');
INSERT INTO `z_active_log_201801` VALUES ('119', '2', 'workclass/Index/get_class_info', '{\"class_id\":\"2\"}', '2018-01-21 23:28:11', '117.136.40.229');
INSERT INTO `z_active_log_201801` VALUES ('120', '2', 'workclass/Index/get_class_info', '{\"class_id\":\"1\"}', '2018-01-21 23:28:12', '117.136.40.229');
INSERT INTO `z_active_log_201801` VALUES ('121', '2', 'workclass/Index/get_class_info', '{\"class_id\":\"3\"}', '2018-01-21 23:28:12', '117.136.40.229');
INSERT INTO `z_active_log_201801` VALUES ('122', '2', 'workclass/Index/get_class_info', '{\"class_id\":\"2\"}', '2018-01-21 23:28:12', '117.136.40.229');
INSERT INTO `z_active_log_201801` VALUES ('123', '2', 'workclass/Index/get_class_info', '{\"class_id\":\"1\"}', '2018-01-21 23:28:12', '117.136.40.229');
INSERT INTO `z_active_log_201801` VALUES ('124', '2', 'workclass/Index/get_class_info', '{\"class_id\":\"1\"}', '2018-01-21 23:28:13', '117.136.40.229');
INSERT INTO `z_active_log_201801` VALUES ('125', '2', 'workclass/Index/get_class_info', '{\"class_id\":\"2\"}', '2018-01-21 23:28:13', '117.136.40.229');
INSERT INTO `z_active_log_201801` VALUES ('126', '2', 'workclass/Index/get_class_info', '{\"class_id\":\"3\"}', '2018-01-21 23:28:13', '117.136.40.229');
INSERT INTO `z_active_log_201801` VALUES ('127', '2', 'workclass/Index/get_class_info', '{\"class_id\":\"2\"}', '2018-01-21 23:28:13', '117.136.40.229');
INSERT INTO `z_active_log_201801` VALUES ('128', '2', 'workclass/Index/get_class_info', '{\"class_id\":\"1\"}', '2018-01-21 23:28:13', '117.136.40.229');
INSERT INTO `z_active_log_201801` VALUES ('129', '2', 'workclass/Index/get_class_info', '{\"class_id\":\"3\"}', '2018-01-21 23:28:14', '117.136.40.229');
INSERT INTO `z_active_log_201801` VALUES ('130', '2', 'workclass/Index/get_class_info', '{\"class_id\":\"2\"}', '2018-01-21 23:28:14', '117.136.40.229');
INSERT INTO `z_active_log_201801` VALUES ('131', '2', 'workclass/Index/get_class_info', '{\"class_id\":\"3\"}', '2018-01-21 23:28:15', '117.136.40.229');
INSERT INTO `z_active_log_201801` VALUES ('132', '2', 'workclass/Index/get_class_info', '{\"class_id\":\"2\"}', '2018-01-21 23:28:16', '117.136.40.229');
INSERT INTO `z_active_log_201801` VALUES ('133', '2', 'workclass/Index/get_class_info', '{\"class_id\":\"3\"}', '2018-01-21 23:28:17', '117.136.40.229');
INSERT INTO `z_active_log_201801` VALUES ('134', '2', 'workclass/Index/get_class_info', '{\"class_id\":\"1\"}', '2018-01-21 23:28:18', '117.136.40.229');
INSERT INTO `z_active_log_201801` VALUES ('135', '2', 'workclass/Index/get_class_info', '{\"class_id\":\"2\"}', '2018-01-21 23:28:19', '117.136.40.229');
INSERT INTO `z_active_log_201801` VALUES ('136', '2', 'workclass/Index/get_class_info', '{\"class_id\":\"3\"}', '2018-01-21 23:28:20', '117.136.40.229');
INSERT INTO `z_active_log_201801` VALUES ('137', '2', 'workclass/Index/get_class_info', '{\"class_id\":\"2\"}', '2018-01-21 23:28:22', '117.136.40.229');
INSERT INTO `z_active_log_201801` VALUES ('138', '2', 'workclass/Index/get_class_info', '{\"class_id\":\"1\"}', '2018-01-21 23:28:23', '117.136.40.229');
INSERT INTO `z_active_log_201801` VALUES ('139', '2', 'workclass/Index/get_class_info', '{\"class_id\":\"2\"}', '2018-01-21 23:28:23', '117.136.40.229');
INSERT INTO `z_active_log_201801` VALUES ('140', '2', 'workclass/View/set_schedule', '{\"schedule_id\":\"7\"}', '2018-01-21 23:28:29', '117.136.40.229');
INSERT INTO `z_active_log_201801` VALUES ('141', '2', 'workclass/View/show_schedule', '{\"schedule_id\":\"7\"}', '2018-01-21 23:28:31', '117.136.40.229');
INSERT INTO `z_active_log_201801` VALUES ('142', '2', 'workclass/View/set_class', '{\"class_id\":\"2\"}', '2018-01-21 23:29:17', '117.136.40.229');
INSERT INTO `z_active_log_201801` VALUES ('143', '2', 'workclass/View/show_schedule', '{\"schedule_id\":\"7\"}', '2018-01-21 23:29:19', '117.136.40.229');
INSERT INTO `z_active_log_201801` VALUES ('144', '2', 'workclass/Index/get_schedule_info', '{\"id\":\"9\"}', '2018-01-21 23:29:25', '117.136.40.229');
INSERT INTO `z_active_log_201801` VALUES ('145', '2', 'workclass/Index/get_schedule_info', '{\"id\":\"8\"}', '2018-01-21 23:29:28', '117.136.40.229');
INSERT INTO `z_active_log_201801` VALUES ('146', '2', 'workclass/Index/get_schedule_info', '{\"id\":\"8\"}', '2018-01-21 23:29:33', '117.136.40.229');
INSERT INTO `z_active_log_201801` VALUES ('147', '2', 'workclass/View/show_schedule', '{\"schedule_id\":\"7\"}', '2018-01-21 23:30:57', '117.136.40.229');
INSERT INTO `z_active_log_201801` VALUES ('148', '2', 'workclass/View/set_schedule', '{\"schedule_id\":\"8\"}', '2018-01-21 23:31:21', '117.136.40.229');
INSERT INTO `z_active_log_201801` VALUES ('149', '2', 'workclass/View/set_schedule', '{\"schedule_id\":\"9\"}', '2018-01-21 23:31:33', '117.136.40.229');
INSERT INTO `z_active_log_201801` VALUES ('150', '2', 'workclass/View/show_schedule', '{\"schedule_id\":\"9\"}', '2018-01-21 23:31:37', '117.136.40.229');
INSERT INTO `z_active_log_201801` VALUES ('151', '2', 'workclass/View/set_schedule', '{\"schedule_id\":\"8\"}', '2018-01-21 23:31:58', '117.136.40.229');
INSERT INTO `z_active_log_201801` VALUES ('152', '2', 'workclass/View/set_schedule', '{\"schedule_id\":\"9\"}', '2018-01-21 23:32:09', '117.136.40.229');
INSERT INTO `z_active_log_201801` VALUES ('153', '2', 'workclass/View/show_schedule', '{\"schedule_id\":\"9\"}', '2018-01-21 23:32:22', '117.136.40.229');
INSERT INTO `z_active_log_201801` VALUES ('154', '2', 'workclass/Index/get_schedule_info', '{\"id\":\"9\"}', '2018-01-21 23:32:54', '117.136.40.229');
INSERT INTO `z_active_log_201801` VALUES ('155', '2', 'index/Index/index', '[]', '2018-01-22 08:58:56', '223.104.63.19');
INSERT INTO `z_active_log_201801` VALUES ('156', '2', 'workclass/View/show_schedule', '[]', '2018-01-22 08:58:57', '223.104.63.19');
INSERT INTO `z_active_log_201801` VALUES ('157', '2', 'workclass/View/set_schedule', '{\"schedule_id\":\"8\"}', '2018-01-22 08:59:04', '223.104.63.19');
INSERT INTO `z_active_log_201801` VALUES ('158', '2', 'workclass/View/show_schedule', '{\"schedule_id\":\"8\"}', '2018-01-22 08:59:06', '223.104.63.19');
INSERT INTO `z_active_log_201801` VALUES ('159', '2', 'workclass/View/set_class', '{\"class_id\":\"1\"}', '2018-01-22 08:59:12', '223.104.63.19');
INSERT INTO `z_active_log_201801` VALUES ('160', '2', 'workclass/View/show_schedule', '[]', '2018-01-23 10:34:52', '183.17.56.232');
INSERT INTO `z_active_log_201801` VALUES ('161', '2', 'member/View/login', '[]', '2018-01-23 10:35:25', '183.17.56.232');
INSERT INTO `z_active_log_201801` VALUES ('162', '2', 'index/Index/index', '[]', '2018-01-23 10:35:25', '183.17.56.232');
INSERT INTO `z_active_log_201801` VALUES ('163', '2', 'workclass/View/show_schedule', '[]', '2018-01-23 10:35:25', '183.17.56.232');
INSERT INTO `z_active_log_201801` VALUES ('164', '1', 'workclass/View/show_schedule', '[]', '2018-01-24 21:13:57', '117.136.40.228');
INSERT INTO `z_active_log_201801` VALUES ('165', '1', 'workclass/View/set_class', '{\"class_id\":\"8\"}', '2018-01-24 21:14:02', '117.136.40.228');
INSERT INTO `z_active_log_201801` VALUES ('166', '1', 'workclass/Index/get_schedule_info', '{\"id\":\"13\"}', '2018-01-24 21:14:05', '117.136.40.228');
INSERT INTO `z_active_log_201801` VALUES ('167', '1', 'workclass/Index/get_schedule_info', '{\"id\":\"13\"}', '2018-01-24 21:14:06', '117.136.40.228');
INSERT INTO `z_active_log_201801` VALUES ('168', '1', 'workclass/View/set_schedule', '{\"schedule_id\":\"13\"}', '2018-01-24 21:14:09', '117.136.40.228');
INSERT INTO `z_active_log_201801` VALUES ('169', '1', 'workclass/View/set_schedule', '{\"schedule_id\":\"13\"}', '2018-01-24 21:14:29', '117.136.40.228');
INSERT INTO `z_active_log_201801` VALUES ('170', '1', 'workclass/View/show_schedule', '{\"schedule_id\":\"13\"}', '2018-01-24 21:14:38', '117.136.40.228');
INSERT INTO `z_active_log_201801` VALUES ('171', '1', 'workclass/Index/get_schedule_info', '{\"id\":\"13\"}', '2018-01-24 21:14:41', '117.136.40.228');
INSERT INTO `z_active_log_201801` VALUES ('172', '1', 'workclass/View/set_schedule', '{\"schedule_id\":\"13\"}', '2018-01-24 21:14:42', '117.136.40.228');
INSERT INTO `z_active_log_201801` VALUES ('173', '1', 'workclass/View/set_schedule', '{\"schedule_id\":\"13\"}', '2018-01-24 21:14:51', '117.136.40.228');
INSERT INTO `z_active_log_201801` VALUES ('174', '1', 'member/View/logout', '{\"schedule_id\":\"13\"}', '2018-01-24 21:15:41', '117.136.40.228');
INSERT INTO `z_active_log_201801` VALUES ('175', '1', 'member/View/logout', '{\"schedule_id\":\"13\"}', '2018-01-24 21:15:41', '117.136.40.228');
INSERT INTO `z_active_log_201801` VALUES ('176', '1', 'member/Index/logout', '{\"schedule_id\":\"13\"}', '2018-01-24 21:15:53', '117.136.40.228');
INSERT INTO `z_active_log_201801` VALUES ('177', '2', 'workclass/View/show_schedule', '[]', '2018-01-24 21:16:14', '117.136.40.228');
INSERT INTO `z_active_log_201801` VALUES ('178', '2', 'workclass/Index/get_schedule_info', '{\"id\":\"9\"}', '2018-01-24 21:16:17', '117.136.40.228');
INSERT INTO `z_active_log_201801` VALUES ('179', '2', 'workclass/View/set_schedule', '{\"schedule_id\":\"9\"}', '2018-01-24 21:16:19', '117.136.40.228');
INSERT INTO `z_active_log_201801` VALUES ('180', '2', 'workclass/View/set_schedule', '{\"schedule_id\":\"8\"}', '2018-01-24 21:16:21', '117.136.40.228');
INSERT INTO `z_active_log_201801` VALUES ('181', '2', 'workclass/View/set_schedule', '{\"schedule_id\":\"7\"}', '2018-01-24 21:16:21', '117.136.40.228');
INSERT INTO `z_active_log_201801` VALUES ('182', '2', 'workclass/View/set_schedule', '{\"schedule_id\":\"8\"}', '2018-01-24 21:16:23', '117.136.40.228');
INSERT INTO `z_active_log_201801` VALUES ('183', '2', 'workclass/View/set_schedule', '{\"schedule_id\":\"7\"}', '2018-01-24 21:16:25', '117.136.40.228');
INSERT INTO `z_active_log_201801` VALUES ('184', '2', 'workclass/View/set_schedule', '{\"schedule_id\":\"8\"}', '2018-01-24 21:16:35', '117.136.40.228');
INSERT INTO `z_active_log_201801` VALUES ('185', '2', 'workclass/View/set_class', '[]', '2018-01-24 21:16:37', '117.136.40.228');
INSERT INTO `z_active_log_201801` VALUES ('186', '2', 'workclass/Index/get_schedule_info', '{\"id\":\"7\"}', '2018-01-24 21:16:49', '117.136.40.228');
INSERT INTO `z_active_log_201801` VALUES ('187', '2', 'workclass/View/show_schedule', '[]', '2018-01-25 15:12:22', '113.87.91.114');
INSERT INTO `z_active_log_201801` VALUES ('188', '2', 'workclass/View/show_schedule', '[]', '2018-01-26 19:25:23', '183.17.59.85');
INSERT INTO `z_active_log_201801` VALUES ('189', '2', 'workclass/View/show_schedule', '[]', '2018-01-28 13:26:11', '183.17.63.4');
INSERT INTO `z_active_log_201801` VALUES ('190', '2', 'index/Index/index', '[]', '2018-01-28 13:30:35', '219.133.179.3');
INSERT INTO `z_active_log_201801` VALUES ('191', '2', 'workclass/View/show_schedule', '[]', '2018-01-28 13:30:36', '219.133.179.3');
INSERT INTO `z_active_log_201801` VALUES ('192', '2', 'index/Index/index', '[]', '2018-01-28 22:11:13', '117.136.40.246');
INSERT INTO `z_active_log_201801` VALUES ('193', '2', 'workclass/View/show_schedule', '[]', '2018-01-28 22:11:13', '117.136.40.246');
INSERT INTO `z_active_log_201801` VALUES ('194', '1', 'workclass/View/show_schedule', '[]', '2018-01-29 10:02:10', '219.133.173.31');
INSERT INTO `z_active_log_201801` VALUES ('195', '1', 'workclass/View/show_schedule', '[]', '2018-01-29 10:05:06', '219.133.173.31');
INSERT INTO `z_active_log_201801` VALUES ('196', '1', 'workclass/View/show_schedule', '[]', '2018-01-29 10:05:17', '219.133.173.31');
INSERT INTO `z_active_log_201801` VALUES ('197', '1', 'workclass/View/show_schedule', '[]', '2018-01-29 10:05:19', '219.133.173.31');
INSERT INTO `z_active_log_201801` VALUES ('198', '1', 'workclass/View/show_schedule', '[]', '2018-01-29 10:05:22', '219.133.173.31');
INSERT INTO `z_active_log_201801` VALUES ('199', '1', 'workclass/View/show_schedule', '[]', '2018-01-29 10:05:23', '219.133.173.31');
INSERT INTO `z_active_log_201801` VALUES ('200', '1', 'workclass/View/show_schedule', '[]', '2018-01-29 10:05:23', '219.133.173.31');
INSERT INTO `z_active_log_201801` VALUES ('201', '1', 'workclass/View/show_schedule', '[]', '2018-01-29 10:05:31', '219.133.173.31');
INSERT INTO `z_active_log_201801` VALUES ('202', '1', 'workclass/View/show_schedule', '[]', '2018-01-29 10:05:38', '219.133.173.31');
INSERT INTO `z_active_log_201801` VALUES ('203', '1', 'workclass/View/show_schedule', '[]', '2018-01-29 10:05:48', '219.133.173.31');
INSERT INTO `z_active_log_201801` VALUES ('204', '1', 'workclass/View/logout', '[]', '2018-01-29 10:05:52', '219.133.173.31');
INSERT INTO `z_active_log_201801` VALUES ('205', '1', 'member/Index/logout', '[]', '2018-01-29 10:07:01', '219.133.173.31');
INSERT INTO `z_active_log_201801` VALUES ('206', '2', 'workclass/View/show_schedule', '[]', '2018-01-29 10:07:13', '219.133.173.31');
INSERT INTO `z_active_log_201801` VALUES ('207', '2', 'workclass/View/show_schedule', '[]', '2018-01-29 10:07:19', '219.133.173.31');
INSERT INTO `z_active_log_201801` VALUES ('208', '2', 'workclass/View/show_schedule', '[]', '2018-01-29 10:07:38', '219.133.173.31');
INSERT INTO `z_active_log_201801` VALUES ('209', '2', 'workclass/View/show_schedule', '[]', '2018-01-29 10:07:40', '219.133.173.31');
INSERT INTO `z_active_log_201801` VALUES ('210', '2', 'workclass/View/show_schedule', '[]', '2018-01-29 10:07:43', '219.133.173.31');
INSERT INTO `z_active_log_201801` VALUES ('211', '2', 'workclass/View/show_schedule', '[]', '2018-01-29 10:08:42', '219.133.173.31');
INSERT INTO `z_active_log_201801` VALUES ('212', '2', 'workclass/View/show_schedule', '[]', '2018-01-29 10:08:45', '219.133.173.31');
INSERT INTO `z_active_log_201801` VALUES ('213', '2', 'index/Index/index', '[]', '2018-01-29 10:33:01', '219.133.173.31');
INSERT INTO `z_active_log_201801` VALUES ('214', '2', 'workclass/View/show_schedule', '[]', '2018-01-29 10:33:01', '219.133.173.31');
INSERT INTO `z_active_log_201801` VALUES ('215', '2', 'workclass/View/show_schedule', '[]', '2018-01-29 10:33:03', '219.133.173.31');
INSERT INTO `z_active_log_201801` VALUES ('216', '2', 'workclass/View/show_schedule', '[]', '2018-01-29 10:33:05', '219.133.173.31');
INSERT INTO `z_active_log_201801` VALUES ('217', '2', 'index/Index/index', '[]', '2018-01-29 11:38:20', '219.133.173.31');
INSERT INTO `z_active_log_201801` VALUES ('218', '2', 'workclass/View/show_schedule', '[]', '2018-01-29 11:38:20', '219.133.173.31');
INSERT INTO `z_active_log_201801` VALUES ('219', '2', 'workclass/View/show_schedule', '[]', '2018-01-29 11:38:24', '219.133.173.31');
INSERT INTO `z_active_log_201801` VALUES ('220', '2', 'workclass/View/show_schedule', '[]', '2018-01-29 11:38:25', '219.133.173.31');
INSERT INTO `z_active_log_201801` VALUES ('221', '2', 'workclass/View/show_schedule', '[]', '2018-01-29 11:41:28', '219.133.173.31');
INSERT INTO `z_active_log_201801` VALUES ('222', '2', 'workclass/View/show_schedule', '[]', '2018-01-29 11:41:30', '219.133.173.31');
INSERT INTO `z_active_log_201801` VALUES ('223', '2', 'index/Index/index', '[]', '2018-01-29 11:48:58', '219.133.173.31');
INSERT INTO `z_active_log_201801` VALUES ('224', '2', 'workclass/View/show_schedule', '[]', '2018-01-29 11:48:58', '219.133.173.31');
INSERT INTO `z_active_log_201801` VALUES ('225', '2', 'workclass/View/show_schedule', '[]', '2018-01-29 11:49:00', '219.133.173.31');
INSERT INTO `z_active_log_201801` VALUES ('226', '2', 'workclass/View/show_schedule', '[]', '2018-01-29 11:49:01', '219.133.173.31');
INSERT INTO `z_active_log_201801` VALUES ('227', '2', 'workclass/View/show_schedule', '[]', '2018-01-29 11:49:39', '219.133.173.31');
INSERT INTO `z_active_log_201801` VALUES ('228', '2', 'workclass/View/show_schedule', '[]', '2018-01-29 11:53:19', '219.133.173.31');
INSERT INTO `z_active_log_201801` VALUES ('229', '2', 'index/Index/index', '[]', '2018-01-30 14:43:16', '117.136.79.139');
INSERT INTO `z_active_log_201801` VALUES ('230', '2', 'workclass/View/show_schedule', '[]', '2018-01-30 14:43:16', '117.136.79.139');
INSERT INTO `z_active_log_201801` VALUES ('231', '2', 'index/Index/index', '[]', '2018-01-30 15:12:48', '59.37.8.131');
INSERT INTO `z_active_log_201801` VALUES ('232', '2', 'workclass/View/show_schedule', '[]', '2018-01-30 15:12:48', '59.37.8.131');
INSERT INTO `z_active_log_201801` VALUES ('233', '2', 'index/Index/index', '[]', '2018-01-30 21:56:24', '59.37.8.131');
INSERT INTO `z_active_log_201801` VALUES ('234', '2', 'index/Index/index', '[]', '2018-01-30 21:56:24', '59.37.8.131');
INSERT INTO `z_active_log_201801` VALUES ('235', '2', 'workclass/View/show_schedule', '[]', '2018-01-30 21:56:24', '59.37.8.131');
INSERT INTO `z_active_log_201801` VALUES ('236', '2', 'workclass/View/show_schedule', '[]', '2018-01-30 21:56:24', '59.37.8.131');

-- ----------------------------
-- Table structure for z_active_log_201802
-- ----------------------------
DROP TABLE IF EXISTS `z_active_log_201802`;
CREATE TABLE `z_active_log_201802` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT '0',
  `app_path` varchar(255) NOT NULL DEFAULT '' COMMENT '模块路径',
  `param` varchar(255) NOT NULL COMMENT '传递参数json',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `operate_ip` varchar(16) NOT NULL DEFAULT '0.0.0.0' COMMENT '操作ip',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `app_path` (`app_path`(191)) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COMMENT='(用户操作记录表2018/02/02)';

-- ----------------------------
-- Records of z_active_log_201802
-- ----------------------------
INSERT INTO `z_active_log_201802` VALUES ('1', '2', 'workclass/View/show_schedule', '[]', '2018-02-02 07:47:33', '117.136.79.140');
INSERT INTO `z_active_log_201802` VALUES ('2', '2', 'index/Index/index', '[]', '2018-02-02 16:45:13', '223.104.63.25');
INSERT INTO `z_active_log_201802` VALUES ('3', '2', 'workclass/View/show_schedule', '[]', '2018-02-02 16:45:14', '223.104.63.25');
INSERT INTO `z_active_log_201802` VALUES ('4', '2', 'workclass/Index/get_schedule_info', '{\"id\":\"9\"}', '2018-02-02 16:45:31', '223.104.63.25');
INSERT INTO `z_active_log_201802` VALUES ('5', '2', 'index/Index/index', '[]', '2018-02-03 10:49:51', '120.234.51.107');
INSERT INTO `z_active_log_201802` VALUES ('6', '2', 'workclass/View/show_schedule', '[]', '2018-02-03 10:49:51', '120.234.51.107');
INSERT INTO `z_active_log_201802` VALUES ('7', '2', 'index/Index/index', '[]', '2018-02-03 15:25:42', '220.112.16.152');
INSERT INTO `z_active_log_201802` VALUES ('8', '2', 'workclass/View/show_schedule', '[]', '2018-02-03 15:25:43', '220.112.16.152');
INSERT INTO `z_active_log_201802` VALUES ('9', '2', 'workclass/View/show_schedule', '[]', '2018-02-06 16:08:39', '219.133.172.100');
INSERT INTO `z_active_log_201802` VALUES ('10', '2', 'workclass/View/show_schedule', '[]', '2018-02-06 16:08:41', '219.133.172.100');
INSERT INTO `z_active_log_201802` VALUES ('11', '2', 'workclass/View/set_schedule', '{\"schedule_id\":\"8\"}', '2018-02-06 16:09:31', '219.133.172.100');
INSERT INTO `z_active_log_201802` VALUES ('12', '2', 'workclass/View/set_schedule', '{\"schedule_id\":\"9\"}', '2018-02-06 16:09:38', '219.133.172.100');
INSERT INTO `z_active_log_201802` VALUES ('13', '2', 'workclass/View/show_schedule', '{\"schedule_id\":\"9\"}', '2018-02-06 16:09:42', '219.133.172.100');
INSERT INTO `z_active_log_201802` VALUES ('14', '2', 'workclass/Index/get_schedule_info', '{\"id\":\"7\"}', '2018-02-06 16:09:46', '219.133.172.100');
INSERT INTO `z_active_log_201802` VALUES ('15', '2', 'workclass/Index/get_schedule_info', '{\"id\":\"8\"}', '2018-02-06 16:09:57', '219.133.172.100');
INSERT INTO `z_active_log_201802` VALUES ('16', '2', 'index/Index/index', '[]', '2018-02-07 10:46:15', '59.37.8.131');
INSERT INTO `z_active_log_201802` VALUES ('17', '2', 'workclass/View/show_schedule', '[]', '2018-02-07 10:46:15', '59.37.8.131');
INSERT INTO `z_active_log_201802` VALUES ('18', '2', 'index/Index/index', '[]', '2018-02-07 16:12:26', '117.136.79.128');
INSERT INTO `z_active_log_201802` VALUES ('19', '2', 'workclass/View/show_schedule', '[]', '2018-02-07 16:12:27', '117.136.79.128');
INSERT INTO `z_active_log_201802` VALUES ('20', '2', 'index/Index/index', '[]', '2018-02-07 16:14:03', '117.136.79.128');
INSERT INTO `z_active_log_201802` VALUES ('21', '2', 'workclass/View/show_schedule', '[]', '2018-02-07 16:14:04', '117.136.79.128');
INSERT INTO `z_active_log_201802` VALUES ('22', '2', 'workclass/Index/get_schedule_info', '{\"id\":\"7\"}', '2018-02-07 16:15:03', '117.136.79.128');
INSERT INTO `z_active_log_201802` VALUES ('23', '2', 'index/Index/index', '[]', '2018-02-07 18:12:09', '113.88.64.42');
INSERT INTO `z_active_log_201802` VALUES ('24', '2', 'workclass/View/show_schedule', '[]', '2018-02-07 18:12:09', '113.88.64.42');
INSERT INTO `z_active_log_201802` VALUES ('25', '2', 'index/Index/index', '[]', '2018-02-08 17:53:57', '183.17.58.136');
INSERT INTO `z_active_log_201802` VALUES ('26', '2', 'workclass/View/show_schedule', '[]', '2018-02-08 17:53:58', '183.17.58.136');
INSERT INTO `z_active_log_201802` VALUES ('27', '2', 'index/Index/index', '[]', '2018-02-08 18:18:33', '219.133.249.255');
INSERT INTO `z_active_log_201802` VALUES ('28', '2', 'workclass/View/show_schedule', '[]', '2018-02-08 18:18:59', '219.133.249.255');
INSERT INTO `z_active_log_201802` VALUES ('29', '2', 'workclass/View/show_schedule', '[]', '2018-02-08 18:19:29', '219.133.249.255');
INSERT INTO `z_active_log_201802` VALUES ('30', '2', 'index/Index/index', '[]', '2018-02-08 22:47:15', '183.17.58.136');
INSERT INTO `z_active_log_201802` VALUES ('31', '2', 'workclass/View/show_schedule', '[]', '2018-02-08 22:47:16', '183.17.58.136');
INSERT INTO `z_active_log_201802` VALUES ('32', '2', 'index/Index/index', '[]', '2018-02-08 23:11:10', '113.88.65.245');
INSERT INTO `z_active_log_201802` VALUES ('33', '2', 'workclass/View/show_schedule', '[]', '2018-02-08 23:11:10', '113.88.65.245');
INSERT INTO `z_active_log_201802` VALUES ('34', '2', 'index/Index/index', '[]', '2018-02-09 12:27:47', '183.233.209.90');
INSERT INTO `z_active_log_201802` VALUES ('35', '2', 'workclass/View/show_schedule', '[]', '2018-02-09 12:27:48', '183.233.209.90');
INSERT INTO `z_active_log_201802` VALUES ('36', '2', 'index/Index/index', '[]', '2018-02-10 22:06:52', '117.136.39.100');
INSERT INTO `z_active_log_201802` VALUES ('37', '2', 'workclass/View/show_schedule', '[]', '2018-02-10 22:06:52', '117.136.39.100');
INSERT INTO `z_active_log_201802` VALUES ('38', '2', 'index/Index/index', '[]', '2018-02-10 22:10:48', '117.136.39.100');
INSERT INTO `z_active_log_201802` VALUES ('39', '2', 'workclass/View/show_schedule', '[]', '2018-02-10 22:10:48', '117.136.39.100');
INSERT INTO `z_active_log_201802` VALUES ('40', '2', 'workclass/Index/get_schedule_info', '{\"id\":\"7\"}', '2018-02-10 22:11:03', '117.136.39.100');
INSERT INTO `z_active_log_201802` VALUES ('41', '2', 'workclass/Index/get_schedule_info', '{\"id\":\"8\"}', '2018-02-10 22:12:08', '117.136.39.100');
INSERT INTO `z_active_log_201802` VALUES ('42', '2', 'index/Index/index', '[]', '2018-02-11 15:13:57', '59.37.8.149');
INSERT INTO `z_active_log_201802` VALUES ('43', '2', 'workclass/View/show_schedule', '[]', '2018-02-11 15:13:57', '59.37.8.149');
INSERT INTO `z_active_log_201802` VALUES ('44', '2', 'workclass/Index/get_schedule_info', '{\"id\":\"9\"}', '2018-02-11 15:14:06', '59.37.8.149');
INSERT INTO `z_active_log_201802` VALUES ('45', '2', 'workclass/Index/get_schedule_info', '{\"id\":\"7\"}', '2018-02-11 15:14:20', '59.37.8.149');
INSERT INTO `z_active_log_201802` VALUES ('46', '2', 'workclass/View/show_schedule', '[]', '2018-02-12 10:33:13', '219.133.178.127');
INSERT INTO `z_active_log_201802` VALUES ('47', '2', 'workclass/Index/get_schedule_info', '{\"id\":\"7\"}', '2018-02-12 10:33:49', '219.133.178.127');
INSERT INTO `z_active_log_201802` VALUES ('48', '2', 'workclass/View/show_schedule', '[]', '2018-02-18 21:50:02', '183.7.179.232');
INSERT INTO `z_active_log_201802` VALUES ('49', '2', 'index/Index/index', '[]', '2018-02-19 16:18:00', '223.104.1.104');
INSERT INTO `z_active_log_201802` VALUES ('50', '2', 'workclass/View/show_schedule', '[]', '2018-02-19 16:18:01', '223.104.1.104');
INSERT INTO `z_active_log_201802` VALUES ('51', '2', 'index/Index/index', '[]', '2018-02-19 16:25:41', '223.104.1.104');
INSERT INTO `z_active_log_201802` VALUES ('52', '2', 'workclass/View/show_schedule', '[]', '2018-02-19 16:25:41', '223.104.1.104');
INSERT INTO `z_active_log_201802` VALUES ('53', '2', 'workclass/Index/get_schedule_info', '{\"id\":\"7\"}', '2018-02-19 16:25:48', '223.104.1.104');
INSERT INTO `z_active_log_201802` VALUES ('54', '2', 'workclass/Index/get_schedule_info', '{\"id\":\"8\"}', '2018-02-19 16:26:08', '223.104.1.104');
INSERT INTO `z_active_log_201802` VALUES ('55', '2', 'workclass/Index/get_schedule_info', '{\"id\":\"7\"}', '2018-02-19 16:26:24', '223.104.1.104');
INSERT INTO `z_active_log_201802` VALUES ('56', '2', 'index/Index/index', '[]', '2018-02-20 09:01:50', '59.37.8.137');
INSERT INTO `z_active_log_201802` VALUES ('57', '2', 'workclass/View/show_schedule', '[]', '2018-02-20 09:01:50', '59.37.8.137');
INSERT INTO `z_active_log_201802` VALUES ('58', '2', 'index/Index/index', '[]', '2018-02-21 10:25:46', '219.133.250.32');
INSERT INTO `z_active_log_201802` VALUES ('59', '2', 'workclass/View/show_schedule', '[]', '2018-02-21 10:25:46', '219.133.250.32');
INSERT INTO `z_active_log_201802` VALUES ('60', '2', 'workclass/Index/get_schedule_info', '{\"id\":\"9\"}', '2018-02-21 10:26:34', '219.133.250.32');
INSERT INTO `z_active_log_201802` VALUES ('61', '2', 'workclass/Index/get_schedule_info', '{\"id\":\"9\"}', '2018-02-21 10:26:35', '219.133.250.32');
INSERT INTO `z_active_log_201802` VALUES ('62', '2', 'index/Index/index', '[]', '2018-02-21 10:44:48', '219.133.250.32');
INSERT INTO `z_active_log_201802` VALUES ('63', '2', 'workclass/View/show_schedule', '[]', '2018-02-21 10:44:48', '219.133.250.32');
INSERT INTO `z_active_log_201802` VALUES ('64', '2', 'index/Index/index', '[]', '2018-02-22 10:49:07', '113.88.65.4');
INSERT INTO `z_active_log_201802` VALUES ('65', '2', 'workclass/View/show_schedule', '[]', '2018-02-22 10:49:07', '113.88.65.4');
INSERT INTO `z_active_log_201802` VALUES ('66', '2', 'index/Index/index', '[]', '2018-02-22 10:49:29', '113.88.65.4');
INSERT INTO `z_active_log_201802` VALUES ('67', '2', 'workclass/View/show_schedule', '[]', '2018-02-22 10:49:29', '113.88.65.4');
INSERT INTO `z_active_log_201802` VALUES ('68', '2', 'index/Index/index', '[]', '2018-02-23 15:17:17', '59.37.8.147');
INSERT INTO `z_active_log_201802` VALUES ('69', '2', 'workclass/View/show_schedule', '[]', '2018-02-23 15:17:18', '59.37.8.147');
INSERT INTO `z_active_log_201802` VALUES ('70', '2', 'index/Index/index', '[]', '2018-02-24 16:48:01', '223.104.63.173');
INSERT INTO `z_active_log_201802` VALUES ('71', '2', 'workclass/View/show_schedule', '[]', '2018-02-24 16:48:01', '223.104.63.173');
INSERT INTO `z_active_log_201802` VALUES ('72', '2', 'index/Index/index', '[]', '2018-02-24 18:20:57', '223.104.63.173');
INSERT INTO `z_active_log_201802` VALUES ('73', '2', 'workclass/View/show_schedule', '[]', '2018-02-24 18:20:57', '223.104.63.173');
INSERT INTO `z_active_log_201802` VALUES ('74', '2', 'workclass/Index/get_schedule_info', '{\"id\":\"7\"}', '2018-02-24 18:21:04', '223.104.63.173');
INSERT INTO `z_active_log_201802` VALUES ('75', '2', 'workclass/Index/get_schedule_info', '{\"id\":\"8\"}', '2018-02-24 18:21:20', '223.104.63.173');
INSERT INTO `z_active_log_201802` VALUES ('76', '2', 'index/Index/index', '[]', '2018-02-24 20:37:16', '113.88.67.187');
INSERT INTO `z_active_log_201802` VALUES ('77', '2', 'workclass/View/show_schedule', '[]', '2018-02-24 20:37:17', '113.88.67.187');
INSERT INTO `z_active_log_201802` VALUES ('78', '2', 'index/Index/index', '[]', '2018-02-24 20:38:33', '113.88.67.187');
INSERT INTO `z_active_log_201802` VALUES ('79', '2', 'workclass/View/show_schedule', '[]', '2018-02-24 20:38:33', '113.88.67.187');
INSERT INTO `z_active_log_201802` VALUES ('80', '2', 'index/Index/index', '[]', '2018-02-25 12:07:41', '59.37.8.135');
INSERT INTO `z_active_log_201802` VALUES ('81', '2', 'workclass/View/show_schedule', '[]', '2018-02-25 12:07:41', '59.37.8.135');
INSERT INTO `z_active_log_201802` VALUES ('82', '2', 'index/Index/index', '[]', '2018-02-25 12:09:00', '59.37.8.135');
INSERT INTO `z_active_log_201802` VALUES ('83', '2', 'workclass/View/show_schedule', '[]', '2018-02-25 12:09:00', '59.37.8.135');
INSERT INTO `z_active_log_201802` VALUES ('84', '2', 'index/Index/index', '[]', '2018-02-26 13:44:35', '223.104.63.25');
INSERT INTO `z_active_log_201802` VALUES ('85', '2', 'workclass/View/show_schedule', '[]', '2018-02-26 13:44:35', '223.104.63.25');
INSERT INTO `z_active_log_201802` VALUES ('86', '2', 'index/Index/index', '[]', '2018-02-26 14:55:51', '223.104.63.25');
INSERT INTO `z_active_log_201802` VALUES ('87', '2', 'workclass/View/show_schedule', '[]', '2018-02-26 14:55:51', '223.104.63.25');
INSERT INTO `z_active_log_201802` VALUES ('88', '2', 'workclass/Index/get_schedule_info', '{\"id\":\"9\"}', '2018-02-26 14:55:58', '223.104.63.25');
INSERT INTO `z_active_log_201802` VALUES ('89', '2', 'index/Index/index', '[]', '2018-02-26 15:00:17', '223.104.63.25');
INSERT INTO `z_active_log_201802` VALUES ('90', '2', 'workclass/View/show_schedule', '[]', '2018-02-26 15:00:17', '223.104.63.25');
INSERT INTO `z_active_log_201802` VALUES ('91', '2', 'index/Index/index', '[]', '2018-02-26 20:26:19', '117.136.79.112');
INSERT INTO `z_active_log_201802` VALUES ('92', '2', 'workclass/View/show_schedule', '[]', '2018-02-26 20:26:20', '117.136.79.112');
INSERT INTO `z_active_log_201802` VALUES ('93', '2', 'workclass/Index/get_schedule_info', '{\"id\":\"7\"}', '2018-02-26 20:37:00', '117.136.79.112');
INSERT INTO `z_active_log_201802` VALUES ('94', '2', 'workclass/View/show_schedule', '[]', '2018-02-27 10:59:40', '223.104.63.192');
INSERT INTO `z_active_log_201802` VALUES ('95', '2', 'member/View/login', '[]', '2018-02-27 11:02:08', '223.104.63.192');
INSERT INTO `z_active_log_201802` VALUES ('96', '2', 'index/Index/index', '[]', '2018-02-27 11:02:09', '223.104.63.192');
INSERT INTO `z_active_log_201802` VALUES ('97', '2', 'workclass/View/show_schedule', '[]', '2018-02-27 11:02:09', '223.104.63.192');
INSERT INTO `z_active_log_201802` VALUES ('98', '2', 'index/Index/index', '[]', '2018-02-27 11:03:07', '223.104.63.192');
INSERT INTO `z_active_log_201802` VALUES ('99', '2', 'workclass/View/show_schedule', '[]', '2018-02-27 11:03:08', '223.104.63.192');
INSERT INTO `z_active_log_201802` VALUES ('100', '2', 'workclass/Index/get_schedule_info', '{\"id\":\"9\"}', '2018-02-27 11:03:26', '223.104.63.192');

-- ----------------------------
-- Table structure for z_active_log_201803
-- ----------------------------
DROP TABLE IF EXISTS `z_active_log_201803`;
CREATE TABLE `z_active_log_201803` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT '0',
  `app_path` varchar(255) NOT NULL DEFAULT '' COMMENT '模块路径',
  `param` varchar(255) NOT NULL COMMENT '传递参数json',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `operate_ip` varchar(16) NOT NULL DEFAULT '0.0.0.0' COMMENT '操作ip',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `app_path` (`app_path`(191)) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COMMENT='(用户操作记录表2018/03/01)';

-- ----------------------------
-- Records of z_active_log_201803
-- ----------------------------
INSERT INTO `z_active_log_201803` VALUES ('1', '2', 'workclass/View/show_schedule', '[]', '2018-03-01 08:22:28', '117.136.12.163');
INSERT INTO `z_active_log_201803` VALUES ('2', '2', 'index/Index/index', '[]', '2018-03-01 15:59:26', '117.136.12.163');
INSERT INTO `z_active_log_201803` VALUES ('3', '2', 'workclass/View/show_schedule', '[]', '2018-03-01 15:59:26', '117.136.12.163');
INSERT INTO `z_active_log_201803` VALUES ('4', '2', 'index/Index/index', '[]', '2018-03-01 16:12:26', '117.136.12.163');
INSERT INTO `z_active_log_201803` VALUES ('5', '2', 'workclass/View/show_schedule', '[]', '2018-03-01 16:12:26', '117.136.12.163');
INSERT INTO `z_active_log_201803` VALUES ('6', '2', 'workclass/View/show_schedule', '[]', '2018-03-01 21:45:33', '223.104.63.23');
INSERT INTO `z_active_log_201803` VALUES ('7', '2', 'member/View/login', '[]', '2018-03-01 21:45:54', '223.104.63.23');
INSERT INTO `z_active_log_201803` VALUES ('8', '2', 'index/Index/index', '[]', '2018-03-01 21:45:54', '223.104.63.23');
INSERT INTO `z_active_log_201803` VALUES ('9', '2', 'workclass/View/show_schedule', '[]', '2018-03-01 21:45:54', '223.104.63.23');
INSERT INTO `z_active_log_201803` VALUES ('10', '2', 'index/Index/index', '[]', '2018-03-01 21:46:08', '223.104.63.23');
INSERT INTO `z_active_log_201803` VALUES ('11', '2', 'workclass/View/show_schedule', '[]', '2018-03-01 21:46:08', '223.104.63.23');
INSERT INTO `z_active_log_201803` VALUES ('12', '2', 'workclass/View/show_schedule', '[]', '2018-03-02 13:46:19', '117.136.79.106');
INSERT INTO `z_active_log_201803` VALUES ('13', '2', 'index/Index/index', '[]', '2018-03-02 23:12:03', '117.136.79.133');
INSERT INTO `z_active_log_201803` VALUES ('14', '2', 'workclass/View/show_schedule', '[]', '2018-03-02 23:12:03', '117.136.79.133');
INSERT INTO `z_active_log_201803` VALUES ('15', '2', 'index/Index/index', '[]', '2018-03-02 23:12:31', '117.136.79.133');
INSERT INTO `z_active_log_201803` VALUES ('16', '2', 'workclass/View/show_schedule', '[]', '2018-03-02 23:12:31', '117.136.79.133');
INSERT INTO `z_active_log_201803` VALUES ('17', '2', 'index/Index/index', '[]', '2018-03-03 11:08:19', '117.136.79.131');
INSERT INTO `z_active_log_201803` VALUES ('18', '2', 'workclass/View/show_schedule', '[]', '2018-03-03 11:08:19', '117.136.79.131');
INSERT INTO `z_active_log_201803` VALUES ('19', '2', 'index/Index/index', '[]', '2018-03-03 11:08:39', '117.136.79.131');
INSERT INTO `z_active_log_201803` VALUES ('20', '2', 'workclass/View/show_schedule', '[]', '2018-03-03 11:08:39', '117.136.79.131');
INSERT INTO `z_active_log_201803` VALUES ('21', '2', 'index/Index/index', '[]', '2018-03-04 14:08:46', '117.136.79.111');
INSERT INTO `z_active_log_201803` VALUES ('22', '2', 'workclass/View/show_schedule', '[]', '2018-03-04 14:08:46', '117.136.79.111');
INSERT INTO `z_active_log_201803` VALUES ('23', '2', 'index/Index/index', '[]', '2018-03-06 17:34:24', '223.104.63.33');
INSERT INTO `z_active_log_201803` VALUES ('24', '2', 'workclass/View/show_schedule', '[]', '2018-03-06 17:34:24', '223.104.63.33');
INSERT INTO `z_active_log_201803` VALUES ('25', '2', 'workclass/View/show_schedule', '[]', '2018-03-08 13:04:29', '183.17.62.29');
INSERT INTO `z_active_log_201803` VALUES ('26', '2', 'index/Index/index', '[]', '2018-03-09 13:19:45', '117.136.79.145');
INSERT INTO `z_active_log_201803` VALUES ('27', '2', 'workclass/View/show_schedule', '[]', '2018-03-09 13:19:46', '117.136.79.145');
INSERT INTO `z_active_log_201803` VALUES ('28', '2', 'index/Index/index', '[]', '2018-03-09 13:20:05', '117.136.79.145');
INSERT INTO `z_active_log_201803` VALUES ('29', '2', 'workclass/View/show_schedule', '[]', '2018-03-09 13:20:05', '117.136.79.145');
INSERT INTO `z_active_log_201803` VALUES ('30', '2', 'index/Index/index', '[]', '2018-03-10 21:24:42', '59.37.8.139');
INSERT INTO `z_active_log_201803` VALUES ('31', '2', 'workclass/View/show_schedule', '[]', '2018-03-10 21:24:42', '59.37.8.139');
INSERT INTO `z_active_log_201803` VALUES ('32', '2', 'workclass/View/show_schedule', '[]', '2018-03-11 19:35:32', '117.136.79.172');
INSERT INTO `z_active_log_201803` VALUES ('33', '2', 'index/Index/index', '[]', '2018-03-11 19:37:51', '117.136.79.172');
INSERT INTO `z_active_log_201803` VALUES ('34', '2', 'workclass/View/show_schedule', '[]', '2018-03-11 19:37:51', '117.136.79.172');
INSERT INTO `z_active_log_201803` VALUES ('35', '2', 'workclass/Index/get_schedule_info', '{\"id\":\"7\"}', '2018-03-11 19:37:56', '117.136.79.172');
INSERT INTO `z_active_log_201803` VALUES ('36', '2', 'workclass/Index/get_schedule_info', '{\"id\":\"8\"}', '2018-03-11 19:38:01', '117.136.79.172');
INSERT INTO `z_active_log_201803` VALUES ('37', '2', 'index/Index/index', '[]', '2018-03-11 22:17:03', '117.136.79.172');
INSERT INTO `z_active_log_201803` VALUES ('38', '2', 'workclass/View/show_schedule', '[]', '2018-03-11 22:17:04', '117.136.79.172');
INSERT INTO `z_active_log_201803` VALUES ('39', '2', 'index/Index/index', '[]', '2018-03-12 11:21:38', '183.17.61.188');
INSERT INTO `z_active_log_201803` VALUES ('40', '2', 'workclass/View/show_schedule', '[]', '2018-03-12 11:21:38', '183.17.61.188');
INSERT INTO `z_active_log_201803` VALUES ('41', '2', 'workclass/Index/get_schedule_info', '{\"id\":\"7\"}', '2018-03-12 11:21:43', '183.17.61.188');
INSERT INTO `z_active_log_201803` VALUES ('42', '2', 'index/Index/index', '[]', '2018-03-12 17:51:13', '117.136.79.116');
INSERT INTO `z_active_log_201803` VALUES ('43', '2', 'workclass/View/show_schedule', '[]', '2018-03-12 17:51:13', '117.136.79.116');
INSERT INTO `z_active_log_201803` VALUES ('44', '2', 'workclass/Index/get_schedule_info', '{\"id\":\"7\"}', '2018-03-12 17:51:31', '117.136.79.116');
INSERT INTO `z_active_log_201803` VALUES ('45', '2', 'workclass/Index/get_schedule_info', '{\"id\":\"8\"}', '2018-03-12 17:51:37', '117.136.79.116');
INSERT INTO `z_active_log_201803` VALUES ('46', '2', 'index/Index/index', '[]', '2018-03-12 17:51:48', '117.136.79.116');
INSERT INTO `z_active_log_201803` VALUES ('47', '2', 'workclass/View/show_schedule', '[]', '2018-03-12 17:51:48', '117.136.79.116');
INSERT INTO `z_active_log_201803` VALUES ('48', '2', 'workclass/Index/get_schedule_info', '{\"id\":\"9\"}', '2018-03-12 17:51:51', '117.136.79.116');
INSERT INTO `z_active_log_201803` VALUES ('49', '2', 'workclass/Index/get_schedule_info', '{\"id\":\"9\"}', '2018-03-12 17:51:53', '117.136.79.116');
INSERT INTO `z_active_log_201803` VALUES ('50', '2', 'index/Index/index', '[]', '2018-03-12 17:52:06', '117.136.79.116');
INSERT INTO `z_active_log_201803` VALUES ('51', '2', 'workclass/View/show_schedule', '[]', '2018-03-12 17:52:06', '117.136.79.116');
INSERT INTO `z_active_log_201803` VALUES ('52', '2', 'index/Index/index', '[]', '2018-03-12 19:20:29', '59.37.8.144');
INSERT INTO `z_active_log_201803` VALUES ('53', '2', 'workclass/View/show_schedule', '[]', '2018-03-12 19:20:29', '59.37.8.144');
INSERT INTO `z_active_log_201803` VALUES ('54', '2', 'index/Index/index', '[]', '2018-03-13 13:20:32', '183.17.62.80');
INSERT INTO `z_active_log_201803` VALUES ('55', '2', 'workclass/View/show_schedule', '[]', '2018-03-13 13:20:32', '183.17.62.80');
INSERT INTO `z_active_log_201803` VALUES ('56', '2', 'index/Index/index', '[]', '2018-03-13 13:21:50', '113.92.92.168');
INSERT INTO `z_active_log_201803` VALUES ('57', '2', 'workclass/View/show_schedule', '[]', '2018-03-13 13:21:50', '113.92.92.168');
INSERT INTO `z_active_log_201803` VALUES ('58', '2', 'index/Index/index', '[]', '2018-03-13 13:24:45', '183.17.62.82');
INSERT INTO `z_active_log_201803` VALUES ('59', '2', 'workclass/View/show_schedule', '[]', '2018-03-13 13:24:45', '183.17.62.82');
INSERT INTO `z_active_log_201803` VALUES ('60', '2', 'index/Index/index', '[]', '2018-03-13 13:34:12', '183.17.61.230');
INSERT INTO `z_active_log_201803` VALUES ('61', '2', 'workclass/View/show_schedule', '[]', '2018-03-13 13:34:12', '183.17.61.230');
INSERT INTO `z_active_log_201803` VALUES ('62', '2', 'index/Index/index', '[]', '2018-03-13 21:51:53', '59.37.8.145');
INSERT INTO `z_active_log_201803` VALUES ('63', '2', 'workclass/View/show_schedule', '[]', '2018-03-13 21:51:53', '59.37.8.145');
INSERT INTO `z_active_log_201803` VALUES ('64', '2', 'index/Index/index', '[]', '2018-03-14 07:59:03', '223.104.63.186');
INSERT INTO `z_active_log_201803` VALUES ('65', '2', 'workclass/View/show_schedule', '[]', '2018-03-14 07:59:03', '223.104.63.186');
INSERT INTO `z_active_log_201803` VALUES ('66', '2', 'workclass/Index/get_schedule_info', '{\"id\":\"7\"}', '2018-03-14 07:59:11', '223.104.63.186');
INSERT INTO `z_active_log_201803` VALUES ('67', '2', 'index/Index/index', '[]', '2018-03-14 11:14:54', '117.136.79.119');
INSERT INTO `z_active_log_201803` VALUES ('68', '2', 'workclass/View/show_schedule', '[]', '2018-03-14 11:14:54', '117.136.79.119');
INSERT INTO `z_active_log_201803` VALUES ('69', '2', 'workclass/Index/get_schedule_info', '{\"id\":\"7\"}', '2018-03-14 11:15:28', '117.136.79.119');
INSERT INTO `z_active_log_201803` VALUES ('70', '2', 'index/Index/index', '[]', '2018-03-15 07:31:35', '117.136.79.170');
INSERT INTO `z_active_log_201803` VALUES ('71', '2', 'workclass/View/show_schedule', '[]', '2018-03-15 07:31:35', '117.136.79.170');
INSERT INTO `z_active_log_201803` VALUES ('72', '2', 'index/Index/index', '[]', '2018-03-15 10:40:19', '223.104.63.43');
INSERT INTO `z_active_log_201803` VALUES ('73', '2', 'workclass/View/show_schedule', '[]', '2018-03-15 10:40:19', '223.104.63.43');
INSERT INTO `z_active_log_201803` VALUES ('74', '2', 'index/Index/index', '[]', '2018-03-16 13:16:40', '117.136.79.127');
INSERT INTO `z_active_log_201803` VALUES ('75', '2', 'workclass/View/show_schedule', '[]', '2018-03-16 13:16:41', '117.136.79.127');
INSERT INTO `z_active_log_201803` VALUES ('76', '2', 'index/Index/index', '[]', '2018-03-17 13:06:36', '183.17.61.4');
INSERT INTO `z_active_log_201803` VALUES ('77', '2', 'workclass/View/show_schedule', '[]', '2018-03-17 13:06:36', '183.17.61.4');
INSERT INTO `z_active_log_201803` VALUES ('78', '2', 'index/Index/index', '[]', '2018-03-17 20:22:08', '115.174.69.149');
INSERT INTO `z_active_log_201803` VALUES ('79', '2', 'workclass/View/show_schedule', '[]', '2018-03-17 20:22:08', '115.174.69.149');
INSERT INTO `z_active_log_201803` VALUES ('80', '2', 'workclass/Index/get_schedule_info', '{\"id\":\"9\"}', '2018-03-17 20:22:26', '115.174.69.149');
INSERT INTO `z_active_log_201803` VALUES ('81', '2', 'workclass/Index/get_schedule_info', '{\"id\":\"7\"}', '2018-03-17 20:22:39', '115.174.69.149');
