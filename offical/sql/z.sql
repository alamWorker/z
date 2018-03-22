/*
Navicat MySQL Data Transfer

Source Server         : Localhost
Source Server Version : 50714
Source Host           : localhost:3306
Source Database       : z

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2018-03-19 17:31:30
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for z_account
-- ----------------------------
DROP TABLE IF EXISTS `z_account`;
CREATE TABLE `z_account` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT '0',
  `integal` int(11) NOT NULL DEFAULT '0' COMMENT '积分',
  `amount` double(11,2) NOT NULL DEFAULT '0.00' COMMENT '资金',
  `frozen` int(11) NOT NULL DEFAULT '0' COMMENT '冻结',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of z_account
-- ----------------------------
INSERT INTO `z_account` VALUES ('1', '1', '0', '0.00', '0');
INSERT INTO `z_account` VALUES ('2', '2', '0', '0.00', '0');
INSERT INTO `z_account` VALUES ('3', '3', '0', '0.00', '0');
INSERT INTO `z_account` VALUES ('4', '4', '0', '0.00', '0');

-- ----------------------------
-- Table structure for z_class
-- ----------------------------
DROP TABLE IF EXISTS `z_class`;
CREATE TABLE `z_class` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '班次名称',
  `sign` tinyint(3) NOT NULL DEFAULT '0' COMMENT '颜色标记 0-透明 1-#87CEFA 2-#4cd964 3-#dd524d 4-#8a6de9 5-#929292',
  `rank` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(3) NOT NULL DEFAULT '1' COMMENT '状态 1-正常 2-共享',
  `creator` bigint(20) NOT NULL DEFAULT '0' COMMENT '创始人id',
  `create_time` bigint(12) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `deleted` smallint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除 0-否 1-是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COMMENT='班次表';

-- ----------------------------
-- Records of z_class
-- ----------------------------
INSERT INTO `z_class` VALUES ('1', '休息', '6', '0', '1', '2', '1511966015', '0');
INSERT INTO `z_class` VALUES ('2', '早班', '5', '0', '1', '2', '1511966131', '0');
INSERT INTO `z_class` VALUES ('3', '晚班', '1', '0', '1', '2', '1511966142', '0');
INSERT INTO `z_class` VALUES ('4', '早班', '5', '0', '1', '1', '1511966731', '1');
INSERT INTO `z_class` VALUES ('5', '早班', '1', '0', '1', '1', '1511966756', '1');
INSERT INTO `z_class` VALUES ('6', '晚班', '2', '0', '1', '1', '1511966810', '1');
INSERT INTO `z_class` VALUES ('7', '休息', '4', '0', '1', '1', '1511966841', '1');
INSERT INTO `z_class` VALUES ('8', '休息', '6', '0', '1', '1', '1512201539', '0');
INSERT INTO `z_class` VALUES ('9', '早班', '1', '0', '1', '1', '1512201578', '0');
INSERT INTO `z_class` VALUES ('10', '晚班', '3', '0', '1', '1', '1512201589', '0');
INSERT INTO `z_class` VALUES ('11', '休息', '6', '0', '1', '3', '1512885261', '0');
INSERT INTO `z_class` VALUES ('12', '早班', '4', '0', '1', '3', '1512885342', '0');
INSERT INTO `z_class` VALUES ('13', '晚班', '1', '0', '1', '3', '1512885361', '0');
INSERT INTO `z_class` VALUES ('14', '2333', '2', '1', '1', '4', '1515841913', '0');

-- ----------------------------
-- Table structure for z_schedule
-- ----------------------------
DROP TABLE IF EXISTS `z_schedule`;
CREATE TABLE `z_schedule` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '班表名称',
  `start_time` varchar(12) NOT NULL DEFAULT '0' COMMENT '开始时间',
  `period` tinyint(3) NOT NULL DEFAULT '0' COMMENT '周期',
  `law` varchar(255) NOT NULL COMMENT '规律',
  `status` tinyint(3) NOT NULL DEFAULT '1' COMMENT '状态 1-正常 2-共享',
  `creator` bigint(20) NOT NULL DEFAULT '0' COMMENT '创始人id',
  `create_time` varchar(12) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `deleted` smallint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除 0-否 1-是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COMMENT='班表表\r\n';

-- ----------------------------
-- Records of z_schedule
-- ----------------------------
INSERT INTO `z_schedule` VALUES ('1', 'C班', '1512144000', '6', '[1,3,3,1,2,2]', '1', '2', '1511966179', '1');
INSERT INTO `z_schedule` VALUES ('2', 'A班', '1512576000', '6', '[2,2,1,3,3,1]', '1', '2', '1511966274', '1');
INSERT INTO `z_schedule` VALUES ('3', 'B班', '1512144000', '6', '[3,1,2,2,1,3]', '1', '2', '1511966339', '1');
INSERT INTO `z_schedule` VALUES ('4', '测试', '1511884800', '6', '[7,6,6,7,5,5]', '1', '1', '1511966859', '1');
INSERT INTO `z_schedule` VALUES ('5', 'A班', '1512144000', '6', '[8,9,9,8,10,10]', '1', '1', '1512201782', '1');
INSERT INTO `z_schedule` VALUES ('6', 'A班', '1512662400', '6', '[1,2,2,1,3,3]', '1', '2', '1512392273', '1');
INSERT INTO `z_schedule` VALUES ('7', 'C班', '1514044800', '6', '[1,2,2,1,3,3]', '1', '2', '1512702195', '0');
INSERT INTO `z_schedule` VALUES ('8', 'A班', '1512748800', '6', '[2,2,1,3,3,1]', '1', '2', '1512702289', '0');
INSERT INTO `z_schedule` VALUES ('9', 'B班', '1512748800', '6', '[3,1,2,2,1,3]', '1', '2', '1512702328', '0');
INSERT INTO `z_schedule` VALUES ('10', 'A班', '1512835200', '6', '[12,11,13,13,11,12]', '1', '3', '1512885400', '0');
INSERT INTO `z_schedule` VALUES ('11', 'B班', '1512748800', '6', '[13,11,12,12,11,13]', '1', '3', '1512885472', '0');
INSERT INTO `z_schedule` VALUES ('12', 'C班', '1512835200', '6', '[13,13,11,12,12,11]', '1', '3', '1512885599', '0');
INSERT INTO `z_schedule` VALUES ('13', 'B班', '1512835200', '6', '[9,8,10,9,8,10]', '1', '1', '1512889667', '0');

-- ----------------------------
-- Table structure for z_user
-- ----------------------------
DROP TABLE IF EXISTS `z_user`;
CREATE TABLE `z_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parend_id` bigint(20) NOT NULL DEFAULT '0',
  `username` varchar(50) NOT NULL,
  `nickname` varchar(50) DEFAULT NULL,
  `password` varchar(50) NOT NULL,
  `six` smallint(1) NOT NULL DEFAULT '1' COMMENT '性别 1-男 2-女',
  `area` int(11) NOT NULL DEFAULT '0' COMMENT '地区',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像',
  `sign` varchar(255) DEFAULT NULL,
  `mobile` varchar(11) NOT NULL DEFAULT '0',
  `email` varchar(255) DEFAULT NULL,
  `create_time` varchar(12) NOT NULL DEFAULT '0',
  `token` varchar(50) DEFAULT NULL,
  `open_id` varchar(50) DEFAULT NULL,
  `status` smallint(1) NOT NULL DEFAULT '0' COMMENT '状态 0-禁用 1-正常',
  `last_login_ip` varchar(50) DEFAULT '0',
  `last_login_time` varchar(12) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

-- ----------------------------
-- Records of z_user
-- ----------------------------
INSERT INTO `z_user` VALUES ('1', '0', '18814148940', null, '9d0b573d923c7b4145f7d6f71f4002ce', '1', '0', null, null, '18814148940', '0', '1511963406', null, null, '0', '0', '1517190469');
INSERT INTO `z_user` VALUES ('2', '0', '15013511282', null, '9d0b573d923c7b4145f7d6f71f4002ce', '1', '0', null, null, '15013511282', '0', '1511965925', null, null, '0', '0', '1520768132');
INSERT INTO `z_user` VALUES ('3', '0', '18318058625', null, '14e1b600b1fd579f47433b88e8d85291', '1', '0', null, null, '18318058625', null, '1512885195', null, null, '0', '0', '1512887114');
INSERT INTO `z_user` VALUES ('4', '0', '13570468578', null, '550e1bafe077ff0b0b67f4e32f29d751', '1', '0', null, null, '13570468578', null, '1515841802', null, null, '0', '0', '1515929328');

-- ----------------------------
-- Table structure for z_user_class
-- ----------------------------
DROP TABLE IF EXISTS `z_user_class`;
CREATE TABLE `z_user_class` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `class_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '班次id',
  `create_time` bigint(12) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `deleted` smallint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除 0-否 1-是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COMMENT='用户班次表';

-- ----------------------------
-- Records of z_user_class
-- ----------------------------
INSERT INTO `z_user_class` VALUES ('1', '2', '1', '1511966015', '0');
INSERT INTO `z_user_class` VALUES ('2', '2', '2', '1511966131', '0');
INSERT INTO `z_user_class` VALUES ('3', '2', '3', '1511966142', '0');
INSERT INTO `z_user_class` VALUES ('4', '1', '4', '1511966731', '1');
INSERT INTO `z_user_class` VALUES ('5', '1', '5', '1511966756', '1');
INSERT INTO `z_user_class` VALUES ('6', '1', '6', '1511966810', '1');
INSERT INTO `z_user_class` VALUES ('7', '1', '7', '1511966841', '1');
INSERT INTO `z_user_class` VALUES ('8', '1', '8', '1512201539', '0');
INSERT INTO `z_user_class` VALUES ('9', '1', '9', '1512201578', '0');
INSERT INTO `z_user_class` VALUES ('10', '1', '10', '1512201589', '0');
INSERT INTO `z_user_class` VALUES ('11', '3', '11', '1512885261', '0');
INSERT INTO `z_user_class` VALUES ('12', '3', '12', '1512885342', '0');
INSERT INTO `z_user_class` VALUES ('13', '3', '13', '1512885361', '0');
INSERT INTO `z_user_class` VALUES ('14', '4', '14', '1515841913', '0');

-- ----------------------------
-- Table structure for z_user_schedule
-- ----------------------------
DROP TABLE IF EXISTS `z_user_schedule`;
CREATE TABLE `z_user_schedule` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户id',
  `schedule_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '班表id',
  `create_time` bigint(12) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `default` smallint(1) NOT NULL DEFAULT '0' COMMENT '默认 0-否 1-是',
  `deleted` smallint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除 0-否 1-是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COMMENT='用户班表表';

-- ----------------------------
-- Records of z_user_schedule
-- ----------------------------
INSERT INTO `z_user_schedule` VALUES ('1', '2', '1', '1511966179', '0', '1');
INSERT INTO `z_user_schedule` VALUES ('2', '2', '2', '1511966274', '0', '1');
INSERT INTO `z_user_schedule` VALUES ('3', '2', '3', '1511966339', '0', '1');
INSERT INTO `z_user_schedule` VALUES ('4', '1', '4', '1511966859', '0', '1');
INSERT INTO `z_user_schedule` VALUES ('5', '1', '5', '1512201782', '0', '1');
INSERT INTO `z_user_schedule` VALUES ('6', '2', '6', '1512392273', '0', '1');
INSERT INTO `z_user_schedule` VALUES ('7', '2', '7', '1512702195', '0', '0');
INSERT INTO `z_user_schedule` VALUES ('8', '2', '8', '1512702289', '1', '0');
INSERT INTO `z_user_schedule` VALUES ('9', '2', '9', '1512702328', '0', '0');
INSERT INTO `z_user_schedule` VALUES ('10', '3', '10', '1512885400', '1', '0');
INSERT INTO `z_user_schedule` VALUES ('11', '3', '11', '1512885472', '0', '0');
INSERT INTO `z_user_schedule` VALUES ('12', '3', '12', '1512885599', '0', '0');
INSERT INTO `z_user_schedule` VALUES ('13', '1', '13', '1512889667', '1', '0');
