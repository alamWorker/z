/*
Navicat MySQL Data Transfer

Source Server         : 2.5
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : z

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2017-11-21 17:39:55
*/

SET FOREIGN_KEY_CHECKS=0;

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
  `deleted` smallint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除 0-否 1-是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for z_schedule
-- ----------------------------
DROP TABLE IF EXISTS `z_schedule`;
CREATE TABLE `z_schedule` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '班表名称',
  `start_time` int(11) NOT NULL DEFAULT '0' COMMENT '开始时间',
  `period` tinyint(3) NOT NULL DEFAULT '0' COMMENT '周期',
  `law` varchar(255) NOT NULL,
  `default` int(11) NOT NULL DEFAULT '0' COMMENT '默认 0-否 1-是',
  `status` tinyint(3) NOT NULL COMMENT '状态 0-正常 1-共享',
  `creator` bigint(20) NOT NULL DEFAULT '0' COMMENT '创始人id',
  `deleted` smallint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除 0-否 1-是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for z_user_class
-- ----------------------------
DROP TABLE IF EXISTS `z_user_class`;
CREATE TABLE `z_user_class` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户id',
  `class_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '班次id',
  `deleted` smallint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除 0-否 1-是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for z_user_schedule
-- ----------------------------
DROP TABLE IF EXISTS `z_user_schedule`;
CREATE TABLE `z_user_schedule` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户id',
  `schedule_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '班表id',
  `deleted` smallint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除 0-否 1-是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
