/*
Navicat MySQL Data Transfer

Source Server         : LC
Source Server Version : 50637
Source Host           : 127.0.0.1:3306
Source Database       : z

Target Server Type    : MYSQL
Target Server Version : 50637
File Encoding         : 65001

Date: 2018-02-08 10:40:39
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of z_account
-- ----------------------------
INSERT INTO `z_account` VALUES ('1', '1', '0', '0.00', '0');
INSERT INTO `z_account` VALUES ('2', '2', '0', '0.00', '0');
INSERT INTO `z_account` VALUES ('3', '3', '0', '0.00', '0');

-- ----------------------------
-- Table structure for z_ad
-- ----------------------------
DROP TABLE IF EXISTS `z_ad`;
CREATE TABLE `z_ad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '广告类型 0-首页',
  `src` varchar(255) NOT NULL DEFAULT '' COMMENT '图片地址',
  `href` varchar(255) NOT NULL COMMENT '链接地址',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0-是 1-否',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of z_ad
-- ----------------------------
INSERT INTO `z_ad` VALUES ('6', '1', '0', '/static/images/design/1.jpg', '#', '0');
INSERT INTO `z_ad` VALUES ('7', '2', '0', '/static/images/design/2.jpg', '#', '0');
INSERT INTO `z_ad` VALUES ('8', '3', '0', '/static/images/design/6.jpg', '#', '0');

-- ----------------------------
-- Table structure for z_assess
-- ----------------------------
DROP TABLE IF EXISTS `z_assess`;
CREATE TABLE `z_assess` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `object` tinyint(1) NOT NULL DEFAULT '1' COMMENT '对象 1-设计 2-物料 3-评价',
  `object_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '对象ID',
  `is_read` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已读 0-否 1-是',
  `create_time` varchar(12) NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COMMENT='点评表';

-- ----------------------------
-- Records of z_assess
-- ----------------------------
INSERT INTO `z_assess` VALUES ('43', '1', '1', '2', '1', '1517882383');
INSERT INTO `z_assess` VALUES ('44', '1', '3', '47', '0', '1517882416');
INSERT INTO `z_assess` VALUES ('46', '1', '1', '3', '0', '1517906492');
INSERT INTO `z_assess` VALUES ('47', '1', '3', '49', '0', '1517906501');
INSERT INTO `z_assess` VALUES ('48', '1', '3', '50', '0', '1517906511');

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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COMMENT='班次表';

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

-- ----------------------------
-- Table structure for z_comment
-- ----------------------------
DROP TABLE IF EXISTS `z_comment`;
CREATE TABLE `z_comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `object` tinyint(1) NOT NULL COMMENT '评价对象 1-设计 2-物料',
  `object_id` bigint(20) NOT NULL COMMENT '对象ID',
  `parent_id` bigint(20) NOT NULL DEFAULT '0',
  `parent_user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '父评价用户id',
  `content` text NOT NULL COMMENT '内容',
  `create_time` varchar(12) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `is_read` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已读 0-否 1-是',
  `is_read_parent` tinyint(1) NOT NULL DEFAULT '0' COMMENT '父评论是否已读 0-否 1-是',
  `assess` int(11) NOT NULL DEFAULT '0' COMMENT '点赞数',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 1-正常 2-用户删除 3-后台拉黑',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0-否 1-是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COMMENT='评论表';

-- ----------------------------
-- Records of z_comment
-- ----------------------------
INSERT INTO `z_comment` VALUES ('46', '1', '1', '2', '0', '0', '第一条评价test', '1517882393', '0', '0', '0', '1', '0');
INSERT INTO `z_comment` VALUES ('47', '1', '1', '2', '0', '0', '第二条评价test', '1517882404', '0', '0', '1', '1', '0');
INSERT INTO `z_comment` VALUES ('48', '1', '1', '2', '0', '0', '第三条评价test', '1517882414', '0', '0', '0', '1', '0');
INSERT INTO `z_comment` VALUES ('49', '1', '1', '3', '0', '0', '嘿嘿嘿', '1517905202', '0', '0', '1', '1', '0');
INSERT INTO `z_comment` VALUES ('50', '1', '1', '3', '0', '0', '好', '1517906510', '0', '0', '1', '2', '0');
INSERT INTO `z_comment` VALUES ('51', '1', '1', '3', '0', '0', 'test', '1517906716', '0', '0', '0', '2', '0');
INSERT INTO `z_comment` VALUES ('52', '1', '1', '3', '0', '0', 'test', '1517906764', '0', '0', '0', '2', '0');
INSERT INTO `z_comment` VALUES ('53', '1', '1', '3', '0', '0', 'test', '1517907004', '0', '0', '0', '2', '0');
INSERT INTO `z_comment` VALUES ('54', '1', '1', '3', '0', '0', 'test', '1517907074', '0', '0', '0', '2', '0');
INSERT INTO `z_comment` VALUES ('55', '1', '1', '3', '0', '0', 'test', '1517907114', '0', '0', '0', '2', '0');
INSERT INTO `z_comment` VALUES ('56', '1', '1', '3', '0', '0', 'heiheihei', '1517907181', '0', '0', '0', '2', '0');
INSERT INTO `z_comment` VALUES ('57', '1', '1', '3', '0', '0', 'shanchu shanchu ', '1517907186', '0', '0', '0', '2', '0');

-- ----------------------------
-- Table structure for z_design
-- ----------------------------
DROP TABLE IF EXISTS `z_design`;
CREATE TABLE `z_design` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `designer_id` int(11) NOT NULL DEFAULT '0' COMMENT '设计师ID',
  `class_id` int(11) NOT NULL DEFAULT '0' COMMENT '检索类型 0-无 1-推荐 2-热门 3-精选',
  `title` varchar(255) NOT NULL COMMENT '设计名称',
  `intro` varchar(500) NOT NULL COMMENT '介绍',
  `content` text NOT NULL COMMENT '内容',
  `fav` smallint(6) NOT NULL DEFAULT '0' COMMENT '收藏数量',
  `assess` smallint(6) NOT NULL DEFAULT '0' COMMENT '点赞数量',
  `comment` int(11) NOT NULL DEFAULT '0' COMMENT '评价数量',
  `is_sell` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否开售 0-否 1-是',
  `is_public` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否公开',
  `is_recommend` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否推荐 0-否 1-是',
  `status` smallint(2) NOT NULL DEFAULT '1' COMMENT '状态 0-拉黑 1-正常 2-用户删除',
  `create_time` varchar(12) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0-否 1-是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='设计图稿表';

-- ----------------------------
-- Records of z_design
-- ----------------------------
INSERT INTO `z_design` VALUES ('2', '1', '0', '灯笼', '灯笼灯笼', '灯笼灯笼灯笼灯笼灯笼灯笼灯笼灯笼', '1', '1', '3', '1', '1', '0', '1', '1517882353', '0');
INSERT INTO `z_design` VALUES ('3', '1', '0', '手表', '手表', '手表手表手表手表手表手表', '1', '1', '9', '1', '1', '0', '3', '1517883890', '0');
INSERT INTO `z_design` VALUES ('4', '1', '0', 'test2', 'test2', 'test2', '0', '0', '0', '1', '1', '0', '1', '1517911138', '0');
INSERT INTO `z_design` VALUES ('5', '1', '0', 'test1', 'test1', 'test1', '0', '0', '0', '1', '1', '0', '1', '1517911149', '0');

-- ----------------------------
-- Table structure for z_designer
-- ----------------------------
DROP TABLE IF EXISTS `z_designer`;
CREATE TABLE `z_designer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL COMMENT '称谓',
  `address` varchar(255) DEFAULT NULL COMMENT '地区',
  `is_public` tinyint(1) DEFAULT '1',
  `idea` varchar(255) DEFAULT NULL COMMENT '理念',
  `style` varchar(255) DEFAULT NULL COMMENT '风格',
  `sign` varchar(255) DEFAULT NULL COMMENT '标签',
  `royalty` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '稿费',
  `design_num` smallint(6) NOT NULL DEFAULT '0' COMMENT '图稿数量',
  `fav` int(11) NOT NULL DEFAULT '0' COMMENT '被收藏次数',
  `match_num` int(11) NOT NULL DEFAULT '0' COMMENT '搭配次数',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '设计师状态 0-拉黑 1-正常',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0-否 1-是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='设计师表';

-- ----------------------------
-- Records of z_designer
-- ----------------------------
INSERT INTO `z_designer` VALUES ('1', '1', 'Alam', '深圳市 大马路 街头艺人', '1', '随心', '现代', '', '0.00', '17', '1', '0', '1', '0');
INSERT INTO `z_designer` VALUES ('2', '3', 'Huang', '广州市越秀区', '1', '原始 随心', '现代', '', '0.00', '0', '0', '0', '1', '0');
INSERT INTO `z_designer` VALUES ('3', '1', 'alam', '', '1', '', '', '', '0.00', '0', '0', '0', '1', '0');

-- ----------------------------
-- Table structure for z_design_img
-- ----------------------------
DROP TABLE IF EXISTS `z_design_img`;
CREATE TABLE `z_design_img` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `design_id` int(11) NOT NULL DEFAULT '0' COMMENT '设计图稿id',
  `src` varchar(255) NOT NULL,
  `is_main` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否主图 0-否 1-是',
  `create_time` varchar(12) NOT NULL DEFAULT '0' COMMENT '上传时间',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0-否 1-是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8mb4 COMMENT='设计图稿图片表';

-- ----------------------------
-- Records of z_design_img
-- ----------------------------
INSERT INTO `z_design_img` VALUES ('129', '2', '{\"src\":\"\\/upload\\/images\\/1\\/20180206095853_601.jpg\",\"ssrc\":\"\\/upload\\/images\\/1\\/s20180206095853_601.jpg\"}', '1', '1517882334', '0');
INSERT INTO `z_design_img` VALUES ('130', '3', '{\"src\":\"\\/upload\\/images\\/1\\/20180206102435_648.jpg\",\"ssrc\":\"\\/upload\\/images\\/1\\/s20180206102435_648.jpg\"}', '1', '1517883876', '0');
INSERT INTO `z_design_img` VALUES ('131', '4', '{\"src\":\"\\/upload\\/images\\/1\\/20180206170009_832.jpg\",\"ssrc\":\"\\/upload\\/images\\/1\\/s20180206170009_832.jpg\"}', '0', '1517907609', '1');
INSERT INTO `z_design_img` VALUES ('132', '5', '{\"src\":\"\\/upload\\/images\\/1\\/20180206175404_312.jpg\",\"ssrc\":\"\\/upload\\/images\\/1\\/s20180206175404_312.jpg\"}', '0', '1517910845', '1');
INSERT INTO `z_design_img` VALUES ('133', '4', '{\"src\":\"\\/upload\\/images\\/1\\/20180206175443_748.jpg\",\"ssrc\":\"\\/upload\\/images\\/1\\/s20180206175443_748.jpg\"}', '0', '1517910883', '1');
INSERT INTO `z_design_img` VALUES ('134', '5', '{\"src\":\"\\/upload\\/images\\/1\\/20180206175612_324.jpg\",\"ssrc\":\"\\/upload\\/images\\/1\\/s20180206175612_324.jpg\"}', '0', '1517910972', '1');
INSERT INTO `z_design_img` VALUES ('135', '0', '{\"src\":\"\\/upload\\/images\\/1\\/20180206175649_210.jpg\",\"ssrc\":\"\\/upload\\/images\\/1\\/s20180206175649_210.jpg\"}', '0', '1517911010', '0');
INSERT INTO `z_design_img` VALUES ('136', '4', '{\"src\":\"\\/upload\\/images\\/1\\/20180206175651_806.jpg\",\"ssrc\":\"\\/upload\\/images\\/1\\/s20180206175651_806.jpg\"}', '0', '1517911011', '1');
INSERT INTO `z_design_img` VALUES ('137', '5', '{\"src\":\"\\/upload\\/images\\/1\\/20180206175738_986.jpg\",\"ssrc\":\"\\/upload\\/images\\/1\\/s20180206175738_986.jpg\"}', '0', '1517911058', '1');
INSERT INTO `z_design_img` VALUES ('138', '4', '{\"src\":\"\\/upload\\/images\\/1\\/20180206175857_664.jpg\",\"ssrc\":\"\\/upload\\/images\\/1\\/s20180206175857_664.jpg\"}', '1', '1517911137', '0');

-- ----------------------------
-- Table structure for z_favorites
-- ----------------------------
DROP TABLE IF EXISTS `z_favorites`;
CREATE TABLE `z_favorites` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户id',
  `object` tinyint(1) NOT NULL DEFAULT '1' COMMENT '对象 1-设计 2-设计师 3-物料',
  `object_id` bigint(20) NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已读 0-否 1-是',
  `create_time` varchar(12) NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of z_favorites
-- ----------------------------
INSERT INTO `z_favorites` VALUES ('50', '1', '1', '2', '1', '1517882381');
INSERT INTO `z_favorites` VALUES ('52', '1', '2', '1', '1', '1517906487');
INSERT INTO `z_favorites` VALUES ('53', '1', '1', '3', '0', '1517906491');

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
INSERT INTO `z_schedule` VALUES ('13', 'B班', '1512835200', '6', '[9,8,10,10,8,9]', '1', '1', '1512889667', '0');

-- ----------------------------
-- Table structure for z_user
-- ----------------------------
DROP TABLE IF EXISTS `z_user`;
CREATE TABLE `z_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parend_id` bigint(20) NOT NULL DEFAULT '0',
  `username` varchar(50) NOT NULL,
  `nickname` varchar(50) DEFAULT NULL,
  `password` varchar(32) NOT NULL,
  `pay_passwork` varchar(32) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

-- ----------------------------
-- Records of z_user
-- ----------------------------
INSERT INTO `z_user` VALUES ('1', '0', '18814148940', 'alam', '9d0b573d923c7b4145f7d6f71f4002ce', null, '1', '0', '/static/images/default_img.jpg', null, '18814148940', '0', '1511963406', null, null, '0', '0', '1517898447');
INSERT INTO `z_user` VALUES ('2', '0', '15013511282', null, '9d0b573d923c7b4145f7d6f71f4002ce', null, '1', '0', null, null, '15013511282', '0', '1511965925', null, null, '0', '0', '1515500493');
INSERT INTO `z_user` VALUES ('3', '0', '13666666666', 'huang', '14e1b600b1fd579f47433b88e8d85291', null, '1', '0', '/static/images/design/1.jpg', null, '13666666666', null, '1511965925', null, null, '0', '0', '1517832009');

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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COMMENT='用户班次表';

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
