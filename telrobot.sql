/*
 Navicat Premium Data Transfer

 Source Server         : 47.96.15.203
 Source Server Type    : MariaDB
 Source Server Version : 50560
 Source Host           : localhost:3306
 Source Schema         : telrobot

 Target Server Type    : MariaDB
 Target Server Version : 50560
 File Encoding         : 65001

 Date: 15/09/2018 10:30:25
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for autodialer_task
-- ----------------------------
DROP TABLE IF EXISTS `autodialer_task`;
CREATE TABLE `autodialer_task`  (
  `uuid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_datetime` datetime(0) NOT NULL,
  `alter_datetime` datetime(0) NULL DEFAULT NULL,
  `start` int(11) NULL DEFAULT NULL,
  `talk_time_limit` int(11) NULL DEFAULT NULL,
  `call_per_second` int(11) NULL DEFAULT NULL,
  `call_limit` int(11) NULL DEFAULT NULL,
  `call_limit_cycle` int(11) NULL DEFAULT NULL,
  `call_pause_second` int(11) NULL DEFAULT NULL,
  `maximumcall` int(11) NOT NULL,
  `recycle_limit` int(11) NULL DEFAULT NULL,
  `cache_number_count` int(11) NULL DEFAULT NULL,
  `random_assignment_number` int(11) NULL DEFAULT NULL,
  `disable_dial_timegroup` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '时间组ID',
  `destination_extension` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `destination_dialplan` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `destination_context` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `scheduling_policy_ratio` float NULL DEFAULT NULL,
  `scheduling_queue` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `version` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dial_format` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `domain` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `originate_variables` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `_originate_timeout` int(11) NULL DEFAULT NULL,
  `call_notify_url` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `call_notify_type` int(11) NULL DEFAULT NULL,
  `_origination_caller_id_number` varchar(4096) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `_ignore_early_media` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `member_id` int(11) NOT NULL COMMENT 'admin表id',
  PRIMARY KEY (`uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of autodialer_task
-- ----------------------------
INSERT INTO `autodialer_task` VALUES (1, '喜刷刷', '2018-07-18 17:30:24', '2018-08-28 10:31:38', 1, NULL, 0, NULL, NULL, 0, 1, 0, 2, 0, '(NULL)', '88882', 'XML', 'default', 0, '', NULL, 'user/fwgoip', '', '喜刷刷', '', 0, 'http://manage.yun235.net/api/smartivr/unusualNotify', 1, '1001', '', 26);
INSERT INTO `autodialer_task` VALUES (17, '北京时代京师教育', '2018-07-18 17:39:40', '2018-08-28 10:31:38', 1, NULL, 0, NULL, NULL, 0, 1, 0, 0, 0, NULL, '88883', 'XML', 'default', 0, '', NULL, 'user/fwgoip', '', '北京时代京师教育1', '', 0, 'http://manage.yun235.net/api/smartivr/unusualNotify', 1, '1002', '', 27);
INSERT INTO `autodialer_task` VALUES (18, '演示使用', '2018-07-18 18:42:19', '2018-08-28 10:31:38', 1, NULL, 0, NULL, NULL, 0, 1, 0, 0, 0, '7', '88881', 'XML', 'default', 0, '', NULL, 'user/fwgoip', '', '', '', 0, 'http://manage.yun235.net/api/smartivr/unusualNotify', 1, '1003', '', 22);
INSERT INTO `autodialer_task` VALUES (20, 'Mr.song', '2018-08-02 09:12:29', '2018-08-28 10:31:38', 1, NULL, 0, NULL, NULL, 0, 1, 0, 0, 0, NULL, '88885', 'XML', 'default', 0, '', NULL, 'user/fwgoip', '', '', '', 0, 'http://manage.yun235.net/api/smartivr/unusualNotify', 1, '1004', '', 30);
INSERT INTO `autodialer_task` VALUES (21, '演示', '2018-08-02 15:33:08', '2018-08-28 10:31:38', 1, NULL, 0, NULL, NULL, 0, 1, 0, 0, 0, '6', '66661', 'XML', 'default', 0, '', NULL, 'user/yszgoip', '', '', '', 0, 'http://yy.a5188.cc/api/smartivr/unusualNotify', 1, '6001', '', 5556);
INSERT INTO `autodialer_task` VALUES (22, 'AI 推广', '2018-08-06 11:38:28', '2018-08-28 10:31:38', 1, NULL, 0, NULL, NULL, 0, 1, 0, 0, 0, NULL, '88886', 'XML', 'default', 0, '', NULL, 'user/fwgoip', '', 'AI 推广用号', '', 0, 'http://manage.yun235.net/api/smartivr/unusualNotify', 1, '1005', '', 31);
INSERT INTO `autodialer_task` VALUES (24, 'asdf', '2018-08-06 21:07:29', '2018-08-28 10:31:38', 1, NULL, 0, NULL, NULL, 0, 1, 0, 0, 0, NULL, '66664', 'XML', 'default', 0, '', NULL, 'user/yszgoip', '', '', '', 0, 'http://yy.a5188.cc/api/smartivr/unusualNotify', 1, '6001', '', 5559);
INSERT INTO `autodialer_task` VALUES (25, 'xss pos', '2018-08-08 18:06:04', '2018-08-28 10:31:38', 1, NULL, 0, NULL, NULL, 0, 1, 0, 0, 0, NULL, '88887', 'XML', 'default', 0, '', NULL, 'user/fwgoip', '', 'pos 推广用', '', 0, 'http://manage.yun235.net/api/smartivr/unusualNotify', 1, '1006', '', 32);
INSERT INTO `autodialer_task` VALUES (26, '硅藻泥', '2018-08-17 09:55:05', '2018-08-28 10:31:38', 1, NULL, 0, NULL, NULL, 0, 1, 0, 0, 0, NULL, '88888', 'XML', 'default', 0, '', NULL, 'user/fwgoip', '', '硅藻泥推广', '', 0, 'http://manage.yun235.net/api/smartivr/unusualNotify', 1, '1007', '', 33);
INSERT INTO `autodialer_task` VALUES (36, 'new plan', '2018-08-18 18:57:46', '2018-08-28 10:31:38', 1, NULL, NULL, NULL, NULL, 9, 1, NULL, 2, NULL, '19', '66667', 'XML', 'default', NULL, NULL, NULL, 'user/yszgoip', NULL, 'remarks + 备注', NULL, NULL, 'http://yy.a5188.cc/api/smartivr/unusualNotify', 1, '1212', NULL, 5559);
INSERT INTO `autodialer_task` VALUES (43, 'lilith', '2018-08-21 11:56:12', '2018-08-28 10:31:38', 1, NULL, NULL, NULL, NULL, 666, 1, NULL, 2, NULL, '29', '66667', 'XML', 'default', NULL, NULL, NULL, 'user/yszgoip', NULL, '是否立即启动是否立即启动是否立即启动', NULL, NULL, 'http://yy.a5188.cc/api/smartivr/unusualNotify', 1, '1212', NULL, 5559);

-- ----------------------------
-- Table structure for autodialer_timegroup
-- ----------------------------
DROP TABLE IF EXISTS `autodialer_timegroup`;
CREATE TABLE `autodialer_timegroup`  (
  `uuid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `domain` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `member_id` int(11) NOT NULL COMMENT 'admin表id',
  PRIMARY KEY (`uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for autodialer_timer_task
-- ----------------------------
DROP TABLE IF EXISTS `autodialer_timer_task`;
CREATE TABLE `autodialer_timer_task`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL COMMENT 'timegrou表id',
  `date_list` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '排除日期',
  `week_list` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '排除周',
  `task_id` int(11) NULL DEFAULT NULL COMMENT 'task表id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '按时间排除执行' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of autodialer_timer_task
-- ----------------------------
INSERT INTO `autodialer_timer_task` VALUES (14, 29, '2018-08-23', 'Saturday,Sunday', 43);

-- ----------------------------
-- Table structure for autodialer_timerange
-- ----------------------------
DROP TABLE IF EXISTS `autodialer_timerange`;
CREATE TABLE `autodialer_timerange`  (
  `uuid` int(11) NOT NULL AUTO_INCREMENT,
  `begin_datetime` time(0) NOT NULL,
  `end_datetime` time(0) NOT NULL,
  `group_uuid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `member_id` int(11) NOT NULL COMMENT 'admin表id',
  PRIMARY KEY (`uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for rk_action
-- ----------------------------
DROP TABLE IF EXISTS `rk_action`;
CREATE TABLE `rk_action`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '行为唯一标识',
  `title` char(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '行为说明',
  `remark` char(140) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '行为描述',
  `rule` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '行为规则',
  `log` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '日志规则',
  `type` tinyint(2) UNSIGNED NOT NULL DEFAULT 1 COMMENT '类型',
  `status` tinyint(2) NOT NULL DEFAULT 0 COMMENT '状态',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统行为表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rk_action_log
-- ----------------------------
DROP TABLE IF EXISTS `rk_action_log`;
CREATE TABLE `rk_action_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `action_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '行为id',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '执行用户id',
  `action_ip` bigint(20) NOT NULL COMMENT '执行行为者ip',
  `model` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '触发行为的表',
  `record_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '触发行为的数据id',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '日志备注',
  `status` tinyint(2) NOT NULL DEFAULT 1 COMMENT '状态',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '执行行为的时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `action_ip_ix`(`action_ip`) USING BTREE,
  INDEX `action_id_ix`(`action_id`) USING BTREE,
  INDEX `user_id_ix`(`user_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1006 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行为日志表' ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for rk_ad
-- ----------------------------
DROP TABLE IF EXISTS `rk_ad`;
CREATE TABLE `rk_ad`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `place_id` int(11) NULL DEFAULT NULL COMMENT '广告位ID',
  `title` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '广告名称',
  `cover_id` int(11) NULL DEFAULT NULL COMMENT '广告图片',
  `photolist` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '辅助图片',
  `url` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '广告链接',
  `listurl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '辅助链接',
  `background` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '广告背景',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '广告描述',
  `create_time` int(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '广告状态',
  `closing_date` int(11) NULL DEFAULT NULL COMMENT '广告截止日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '广告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rk_ad_place
-- ----------------------------
DROP TABLE IF EXISTS `rk_ad_place`;
CREATE TABLE `rk_ad_place`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '广告位名称',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用名称',
  `show_type` int(11) NOT NULL DEFAULT 5 COMMENT '广告位类型',
  `show_num` int(11) NOT NULL DEFAULT 5 COMMENT '显示条数',
  `start_time` int(11) NOT NULL DEFAULT 0 COMMENT '开始时间',
  `end_time` int(11) NOT NULL DEFAULT 0 COMMENT '结束时间',
  `create_time` int(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  `template` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '广告位模板',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '广告位状态',
  `member_id` int(11) NULL DEFAULT NULL COMMENT '添加者uid',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 41 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '广告位表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rk_addons
-- ----------------------------
DROP TABLE IF EXISTS `rk_addons`;
CREATE TABLE `rk_addons`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '插件名或标识',
  `title` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '中文名',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '插件描述',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态',
  `config` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '配置',
  `author` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '作者',
  `version` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '版本号',
  `isinstall` int(10) NULL DEFAULT 0 COMMENT '是否安装',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '安装时间',
  `has_adminlist` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否有后台列表',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '插件表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rk_admin
-- ----------------------------
DROP TABLE IF EXISTS `rk_admin`;
CREATE TABLE `rk_admin`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `role_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '角色ID',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `realname` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `sex` tinyint(4) NULL DEFAULT 0 COMMENT '0 男 1 女',
  `super` tinyint(4) NULL DEFAULT 0 COMMENT '0 普通管理 1超级管理',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态',
  `open_tsr` tinyint(4) NULL DEFAULT 0 COMMENT '开通人工坐席 0 未开通  1开通',
  `expiry_date` int(11) NULL DEFAULT 0 COMMENT '会员有效期',
  `last_login_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后登陆IP',
  `last_login_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '最后登陆时间',
  `create_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '修改时间',
  `salt` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码盐值',
  `destination_extension` int(11) NOT NULL,
  `user_type` int(11) NULL DEFAULT 0 COMMENT '0 普通  1销售 2代理商',
  `pid` int(11) NULL DEFAULT NULL COMMENT '父id',
  `open_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `wxname` int(64) NULL DEFAULT NULL,
  `logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `remark` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `examine` tinyint(2) NOT NULL DEFAULT 0 COMMENT '是否需要审核？ 1是 0否',
  `index_show_tip` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否还显示用户协议提示',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5572 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '[系统] 管理用户' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of rk_admin
-- ----------------------------
INSERT INTO `rk_admin` VALUES (5555, 12, 'admin', '10059c2a0a702a3190dd3e999382e9b8', NULL, '13736914725', '1223334444@qq.com', 0, 1, 1, 0, 1767283200, '2028287795', 1536977304, 1505376188, 1535619435, 'zXJEMQ', 66660, 0, NULL, NULL, NULL, '', NULL, 1, 1);

-- ----------------------------
-- Table structure for rk_admin_role
-- ----------------------------
DROP TABLE IF EXISTS `rk_admin_role`;
CREATE TABLE `rk_admin_role`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `intro` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色简介',
  `rule_items` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色权限项menu表中的id',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '修改时间',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '[系统] 管理角色' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of rk_admin_role
-- ----------------------------
INSERT INTO `rk_admin_role` VALUES (12, '管理员', '管理', '31,78,112,174,175,127,128,129,130,136,140,180,182,162,163,181,167,168,169,170,171,172,177,178,179', 1515817292, 1535904603, 1);
INSERT INTO `rk_admin_role` VALUES (14, '正式客户', '用户权限', '31,78,112,174,175,136,183,162,176,181,167,168,169,170,171,172,177,178,179', 1527924542, 1536286854, 1);
INSERT INTO `rk_admin_role` VALUES (15, '演示客户', '演示客户', '31,78,112,174,175,136,183,162,176,181,169,170,171,172,177,178,179', 1531911876, 1536286819, 1);

-- ----------------------------
-- Table structure for rk_attachment
-- ----------------------------
DROP TABLE IF EXISTS `rk_attachment`;
CREATE TABLE `rk_attachment`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户ID',
  `title` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '附件显示名',
  `type` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '附件类型',
  `source` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '资源ID',
  `record_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '关联记录ID',
  `download` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '下载次数',
  `size` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '附件大小',
  `dir` int(12) UNSIGNED NOT NULL DEFAULT 0 COMMENT '上级目录ID',
  `sort` int(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_record_status`(`record_id`, `status`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '附件表' ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for rk_attribute
-- ----------------------------
DROP TABLE IF EXISTS `rk_attribute`;
CREATE TABLE `rk_attribute`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '字段名',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '字段注释',
  `length` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '字段定义',
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '数据类型',
  `value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '字段默认值',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `is_show` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否显示',
  `extra` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '参数',
  `model_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '模型id',
  `is_must` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否必填',
  `status` tinyint(2) NOT NULL DEFAULT 0 COMMENT '状态',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `validate_rule` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `validate_time` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `error_info` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `validate_type` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `auto_rule` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `auto_time` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `auto_type` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `model_id`(`model_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 56 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '模型属性表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rk_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `rk_auth_rule`;
CREATE TABLE `rk_auth_rule`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `module` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '规则所属module',
  `type` tinyint(2) NOT NULL DEFAULT 1 COMMENT '1-url;2-主菜单',
  `name` char(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '规则唯一英文标识',
  `title` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `group` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '权限节点分组',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `module`(`module`, `status`, `type`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 35 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rk_auth_rule
-- ----------------------------
INSERT INTO `rk_auth_rule` VALUES (1, 'admin', 2, 'admin/index/index', '后台首页', '首页管理', 1, '');
INSERT INTO `rk_auth_rule` VALUES (2, 'admin', 2, 'admin/form/index', '自定义表单', '运营管理', 1, '');
INSERT INTO `rk_auth_rule` VALUES (3, 'admin', 2, 'admin/addons/hooks', '钩子列表', '扩展管理', 1, '');
INSERT INTO `rk_auth_rule` VALUES (4, 'admin', 2, 'admin/addons/index', '插件列表', '扩展管理', 1, '');
INSERT INTO `rk_auth_rule` VALUES (5, 'admin', 2, 'admin/ad/index', '广告管理', '运营管理', 1, '');
INSERT INTO `rk_auth_rule` VALUES (6, 'admin', 2, 'admin/link/index', '友链管理', '运营管理', 1, '');
INSERT INTO `rk_auth_rule` VALUES (7, 'admin', 2, 'admin/action/log', '行为日志', '会员管理', 1, '');
INSERT INTO `rk_auth_rule` VALUES (8, 'admin', 2, 'admin/action/index', '行为列表', '会员管理', 1, '');
INSERT INTO `rk_auth_rule` VALUES (9, 'admin', 2, 'admin/group/access', '权限列表', '会员管理', 1, '');
INSERT INTO `rk_auth_rule` VALUES (10, 'admin', 2, 'admin/group/index', '用户组表', '会员管理', 1, '');
INSERT INTO `rk_auth_rule` VALUES (11, 'admin', 2, 'admin/user/index', '用户列表', '会员管理', 1, '');
INSERT INTO `rk_auth_rule` VALUES (12, 'admin', 2, 'admin/model/index', '模型管理', '内容管理', 1, '');
INSERT INTO `rk_auth_rule` VALUES (13, 'admin', 2, 'admin/category/index', '栏目管理', '内容管理', 1, '');
INSERT INTO `rk_auth_rule` VALUES (14, 'admin', 2, 'admin/seo/index', 'SEO设置', '系统管理', 1, '');
INSERT INTO `rk_auth_rule` VALUES (15, 'admin', 2, 'admin/database/index?type=import', '数据恢复', '系统管理', 1, '');
INSERT INTO `rk_auth_rule` VALUES (16, 'admin', 2, 'admin/database/index?type=export', '数据备份', '系统管理', 1, '');
INSERT INTO `rk_auth_rule` VALUES (17, 'admin', 2, 'admin/channel/index', '导航管理', '系统管理', 1, '');
INSERT INTO `rk_auth_rule` VALUES (18, 'admin', 2, 'admin/menu/index', '菜单管理', '系统管理', 1, '');
INSERT INTO `rk_auth_rule` VALUES (19, 'admin', 2, 'admin/config/group', '配置管理', '系统管理', 1, '');
INSERT INTO `rk_auth_rule` VALUES (20, 'admin', 2, 'admin/index/clear', '更新缓存', '首页管理', 1, '');
INSERT INTO `rk_auth_rule` VALUES (21, 'admin', 1, 'admin/config/add', '配置添加', '系统管理', 1, '');
INSERT INTO `rk_auth_rule` VALUES (22, 'admin', 2, 'admin/content/index', '内容列表', '内容管理', 1, '');
INSERT INTO `rk_auth_rule` VALUES (23, 'admin', 2, 'admin/content/add', '内容添加', '内容管理', 1, '');
INSERT INTO `rk_auth_rule` VALUES (24, 'admin', 1, 'admin/content/edit', '内容编辑', '内容管理', 1, '');
INSERT INTO `rk_auth_rule` VALUES (25, 'admin', 1, 'admin/content/del', '内容删除', '内容管理', 1, '');
INSERT INTO `rk_auth_rule` VALUES (26, 'admin', 1, 'admin/content/status', '内容设置状态', '内容管理', 1, '');
INSERT INTO `rk_auth_rule` VALUES (27, 'admin', 1, 'admin/category/add', '栏目添加', '内容管理', 1, '');
INSERT INTO `rk_auth_rule` VALUES (28, 'admin', 1, 'admin/category/edit', '栏目编辑', '内容管理', 1, '');
INSERT INTO `rk_auth_rule` VALUES (29, 'admin', 1, 'admin/category/editable', '栏目单字编辑', '内容管理', 1, '');
INSERT INTO `rk_auth_rule` VALUES (30, 'admin', 1, 'admin/category/remove', '栏目删除', '内容管理', 1, '');
INSERT INTO `rk_auth_rule` VALUES (31, 'admin', 1, 'admin/category/merge', '栏目合并', '内容管理', 1, '');
INSERT INTO `rk_auth_rule` VALUES (32, 'admin', 1, 'admin/category/move', '栏目移动', '内容管理', 1, '');
INSERT INTO `rk_auth_rule` VALUES (33, 'admin', 1, 'admin/category/status', '栏目状态', '内容管理', 1, '');

-- ----------------------------
-- Table structure for rk_category
-- ----------------------------
DROP TABLE IF EXISTS `rk_category`;
CREATE TABLE `rk_category`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标志',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '上级分类ID',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序（同级有效）',
  `list_row` tinyint(3) UNSIGNED NOT NULL DEFAULT 10 COMMENT '列表每页行数',
  `meta_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'SEO的网页标题',
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '描述',
  `template_index` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '频道页模板',
  `template_lists` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '列表页模板',
  `template_detail` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '详情页模板',
  `template_edit` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '编辑页模板',
  `model` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '列表绑定模型',
  `model_sub` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '子文档绑定模型',
  `type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '允许发布的内容类型',
  `link_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '外链',
  `allow_publish` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否允许发布内容',
  `display` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '可见性',
  `reply` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否允许回复',
  `check` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '发布的文章是否需要审核',
  `reply_model` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `extend` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '扩展设置',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '数据状态',
  `icon` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '分类图标',
  `groups` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '分组定义',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pid`(`pid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rk_city
-- ----------------------------
DROP TABLE IF EXISTS `rk_city`;
CREATE TABLE `rk_city`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `province_id` int(11) NOT NULL DEFAULT 0,
  `city_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `zipcode` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `sort` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `IDX_g_city_CityName`(`city_name`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 346 AVG_ROW_LENGTH = 135 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rk_city
-- ----------------------------
INSERT INTO `rk_city` VALUES (1, 1, '北京市', '100000', 1);
INSERT INTO `rk_city` VALUES (2, 2, '天津市', '100000', 0);
INSERT INTO `rk_city` VALUES (3, 3, '石家庄市', '050000', 0);
INSERT INTO `rk_city` VALUES (4, 3, '唐山市', '063000', 0);
INSERT INTO `rk_city` VALUES (5, 3, '秦皇岛市', '066000', 0);
INSERT INTO `rk_city` VALUES (6, 3, '邯郸市', '056000', 0);
INSERT INTO `rk_city` VALUES (7, 3, '邢台市', '054000', 0);
INSERT INTO `rk_city` VALUES (8, 3, '保定市', '071000', 0);
INSERT INTO `rk_city` VALUES (9, 3, '张家口市', '075000', 0);
INSERT INTO `rk_city` VALUES (10, 3, '承德市', '067000', 0);
INSERT INTO `rk_city` VALUES (11, 3, '沧州市', '061000', 0);
INSERT INTO `rk_city` VALUES (12, 3, '廊坊市', '065000', 0);
INSERT INTO `rk_city` VALUES (13, 3, '衡水市', '053000', 0);
INSERT INTO `rk_city` VALUES (14, 4, '太原市', '030000', 0);
INSERT INTO `rk_city` VALUES (15, 4, '大同市', '037000', 0);
INSERT INTO `rk_city` VALUES (16, 4, '阳泉市', '045000', 0);
INSERT INTO `rk_city` VALUES (17, 4, '长治市', '046000', 0);
INSERT INTO `rk_city` VALUES (18, 4, '晋城市', '048000', 0);
INSERT INTO `rk_city` VALUES (19, 4, '朔州市', '036000', 0);
INSERT INTO `rk_city` VALUES (20, 4, '晋中市', '030600', 0);
INSERT INTO `rk_city` VALUES (21, 4, '运城市', '044000', 0);
INSERT INTO `rk_city` VALUES (22, 4, '忻州市', '034000', 0);
INSERT INTO `rk_city` VALUES (23, 4, '临汾市', '041000', 0);
INSERT INTO `rk_city` VALUES (24, 4, '吕梁市', '030500', 0);
INSERT INTO `rk_city` VALUES (25, 5, '呼和浩特市', '010000', 0);
INSERT INTO `rk_city` VALUES (26, 5, '包头市', '014000', 0);
INSERT INTO `rk_city` VALUES (27, 5, '乌海市', '016000', 0);
INSERT INTO `rk_city` VALUES (28, 5, '赤峰市', '024000', 0);
INSERT INTO `rk_city` VALUES (29, 5, '通辽市', '028000', 0);
INSERT INTO `rk_city` VALUES (30, 5, '鄂尔多斯市', '010300', 0);
INSERT INTO `rk_city` VALUES (31, 5, '呼伦贝尔市', '021000', 0);
INSERT INTO `rk_city` VALUES (32, 5, '巴彦淖尔市', '014400', 0);
INSERT INTO `rk_city` VALUES (33, 5, '乌兰察布市', '011800', 0);
INSERT INTO `rk_city` VALUES (34, 5, '兴安盟', '137500', 0);
INSERT INTO `rk_city` VALUES (35, 5, '锡林郭勒盟', '011100', 0);
INSERT INTO `rk_city` VALUES (36, 5, '阿拉善盟', '016000', 0);
INSERT INTO `rk_city` VALUES (37, 6, '沈阳市', '110000', 0);
INSERT INTO `rk_city` VALUES (38, 6, '大连市', '116000', 0);
INSERT INTO `rk_city` VALUES (39, 6, '鞍山市', '114000', 0);
INSERT INTO `rk_city` VALUES (40, 6, '抚顺市', '113000', 0);
INSERT INTO `rk_city` VALUES (41, 6, '本溪市', '117000', 0);
INSERT INTO `rk_city` VALUES (42, 6, '丹东市', '118000', 0);
INSERT INTO `rk_city` VALUES (43, 6, '锦州市', '121000', 0);
INSERT INTO `rk_city` VALUES (44, 6, '营口市', '115000', 0);
INSERT INTO `rk_city` VALUES (45, 6, '阜新市', '123000', 0);
INSERT INTO `rk_city` VALUES (46, 6, '辽阳市', '111000', 0);
INSERT INTO `rk_city` VALUES (47, 6, '盘锦市', '124000', 0);
INSERT INTO `rk_city` VALUES (48, 6, '铁岭市', '112000', 0);
INSERT INTO `rk_city` VALUES (49, 6, '朝阳市', '122000', 0);
INSERT INTO `rk_city` VALUES (50, 6, '葫芦岛市', '125000', 0);
INSERT INTO `rk_city` VALUES (51, 7, '长春市', '130000', 0);
INSERT INTO `rk_city` VALUES (52, 7, '吉林市', '132000', 0);
INSERT INTO `rk_city` VALUES (53, 7, '四平市', '136000', 0);
INSERT INTO `rk_city` VALUES (54, 7, '辽源市', '136200', 0);
INSERT INTO `rk_city` VALUES (55, 7, '通化市', '134000', 0);
INSERT INTO `rk_city` VALUES (56, 7, '白山市', '134300', 0);
INSERT INTO `rk_city` VALUES (57, 7, '松原市', '131100', 0);
INSERT INTO `rk_city` VALUES (58, 7, '白城市', '137000', 0);
INSERT INTO `rk_city` VALUES (59, 7, '延边朝鲜族自治州', '133000', 0);
INSERT INTO `rk_city` VALUES (60, 8, '哈尔滨市', '150000', 0);
INSERT INTO `rk_city` VALUES (61, 8, '齐齐哈尔市', '161000', 0);
INSERT INTO `rk_city` VALUES (62, 8, '鸡西市', '158100', 0);
INSERT INTO `rk_city` VALUES (63, 8, '鹤岗市', '154100', 0);
INSERT INTO `rk_city` VALUES (64, 8, '双鸭山市', '155100', 0);
INSERT INTO `rk_city` VALUES (65, 8, '大庆市', '163000', 0);
INSERT INTO `rk_city` VALUES (66, 8, '伊春市', '152300', 0);
INSERT INTO `rk_city` VALUES (67, 8, '佳木斯市', '154000', 0);
INSERT INTO `rk_city` VALUES (68, 8, '七台河市', '154600', 0);
INSERT INTO `rk_city` VALUES (69, 8, '牡丹江市', '157000', 0);
INSERT INTO `rk_city` VALUES (70, 8, '黑河市', '164300', 0);
INSERT INTO `rk_city` VALUES (71, 8, '绥化市', '152000', 0);
INSERT INTO `rk_city` VALUES (72, 8, '大兴安岭地区', '165000', 0);
INSERT INTO `rk_city` VALUES (73, 9, '上海市', '200000', 0);
INSERT INTO `rk_city` VALUES (74, 10, '南京市', '210000', 0);
INSERT INTO `rk_city` VALUES (75, 10, '无锡市', '214000', 0);
INSERT INTO `rk_city` VALUES (76, 10, '徐州市', '221000', 0);
INSERT INTO `rk_city` VALUES (77, 10, '常州市', '213000', 0);
INSERT INTO `rk_city` VALUES (78, 10, '苏州市', '215000', 0);
INSERT INTO `rk_city` VALUES (79, 10, '南通市', '226000', 0);
INSERT INTO `rk_city` VALUES (80, 10, '连云港市', '222000', 0);
INSERT INTO `rk_city` VALUES (81, 10, '淮安市', '223200', 0);
INSERT INTO `rk_city` VALUES (82, 10, '盐城市', '224000', 0);
INSERT INTO `rk_city` VALUES (83, 10, '扬州市', '225000', 0);
INSERT INTO `rk_city` VALUES (84, 10, '镇江市', '212000', 0);
INSERT INTO `rk_city` VALUES (85, 10, '泰州市', '225300', 0);
INSERT INTO `rk_city` VALUES (86, 10, '宿迁市', '223800', 0);
INSERT INTO `rk_city` VALUES (87, 11, '杭州市', '310000', 0);
INSERT INTO `rk_city` VALUES (88, 11, '宁波市', '315000', 0);
INSERT INTO `rk_city` VALUES (89, 11, '温州市', '325000', 0);
INSERT INTO `rk_city` VALUES (90, 11, '嘉兴市', '314000', 0);
INSERT INTO `rk_city` VALUES (91, 11, '湖州市', '313000', 0);
INSERT INTO `rk_city` VALUES (92, 11, '绍兴市', '312000', 0);
INSERT INTO `rk_city` VALUES (93, 11, '金华市', '321000', 0);
INSERT INTO `rk_city` VALUES (94, 11, '衢州市', '324000', 0);
INSERT INTO `rk_city` VALUES (95, 11, '舟山市', '316000', 0);
INSERT INTO `rk_city` VALUES (96, 11, '台州市', '318000', 0);
INSERT INTO `rk_city` VALUES (97, 11, '丽水市', '323000', 0);
INSERT INTO `rk_city` VALUES (98, 12, '合肥市', '230000', 0);
INSERT INTO `rk_city` VALUES (99, 12, '芜湖市', '241000', 0);
INSERT INTO `rk_city` VALUES (100, 12, '蚌埠市', '233000', 0);
INSERT INTO `rk_city` VALUES (101, 12, '淮南市', '232000', 0);
INSERT INTO `rk_city` VALUES (102, 12, '马鞍山市', '243000', 0);
INSERT INTO `rk_city` VALUES (103, 12, '淮北市', '235000', 0);
INSERT INTO `rk_city` VALUES (104, 12, '铜陵市', '244000', 0);
INSERT INTO `rk_city` VALUES (105, 12, '安庆市', '246000', 0);
INSERT INTO `rk_city` VALUES (106, 12, '黄山市', '242700', 0);
INSERT INTO `rk_city` VALUES (107, 12, '滁州市', '239000', 0);
INSERT INTO `rk_city` VALUES (108, 12, '阜阳市', '236100', 0);
INSERT INTO `rk_city` VALUES (109, 12, '宿州市', '234100', 0);
INSERT INTO `rk_city` VALUES (110, 12, '巢湖市', '238000', 0);
INSERT INTO `rk_city` VALUES (111, 12, '六安市', '237000', 0);
INSERT INTO `rk_city` VALUES (112, 12, '亳州市', '236800', 0);
INSERT INTO `rk_city` VALUES (113, 12, '池州市', '247100', 0);
INSERT INTO `rk_city` VALUES (114, 12, '宣城市', '366000', 0);
INSERT INTO `rk_city` VALUES (115, 13, '福州市', '350000', 0);
INSERT INTO `rk_city` VALUES (116, 13, '厦门市', '361000', 0);
INSERT INTO `rk_city` VALUES (117, 13, '莆田市', '351100', 0);
INSERT INTO `rk_city` VALUES (118, 13, '三明市', '365000', 0);
INSERT INTO `rk_city` VALUES (119, 13, '泉州市', '362000', 0);
INSERT INTO `rk_city` VALUES (120, 13, '漳州市', '363000', 0);
INSERT INTO `rk_city` VALUES (121, 13, '南平市', '353000', 0);
INSERT INTO `rk_city` VALUES (122, 13, '龙岩市', '364000', 0);
INSERT INTO `rk_city` VALUES (123, 13, '宁德市', '352100', 0);
INSERT INTO `rk_city` VALUES (124, 14, '南昌市', '330000', 0);
INSERT INTO `rk_city` VALUES (125, 14, '景德镇市', '333000', 0);
INSERT INTO `rk_city` VALUES (126, 14, '萍乡市', '337000', 0);
INSERT INTO `rk_city` VALUES (127, 14, '九江市', '332000', 0);
INSERT INTO `rk_city` VALUES (128, 14, '新余市', '338000', 0);
INSERT INTO `rk_city` VALUES (129, 14, '鹰潭市', '335000', 0);
INSERT INTO `rk_city` VALUES (130, 14, '赣州市', '341000', 0);
INSERT INTO `rk_city` VALUES (131, 14, '吉安市', '343000', 0);
INSERT INTO `rk_city` VALUES (132, 14, '宜春市', '336000', 0);
INSERT INTO `rk_city` VALUES (133, 14, '抚州市', '332900', 0);
INSERT INTO `rk_city` VALUES (134, 14, '上饶市', '334000', 0);
INSERT INTO `rk_city` VALUES (135, 15, '济南市', '250000', 0);
INSERT INTO `rk_city` VALUES (136, 15, '青岛市', '266000', 0);
INSERT INTO `rk_city` VALUES (137, 15, '淄博市', '255000', 0);
INSERT INTO `rk_city` VALUES (138, 15, '枣庄市', '277100', 0);
INSERT INTO `rk_city` VALUES (139, 15, '东营市', '257000', 0);
INSERT INTO `rk_city` VALUES (140, 15, '烟台市', '264000', 0);
INSERT INTO `rk_city` VALUES (141, 15, '潍坊市', '261000', 0);
INSERT INTO `rk_city` VALUES (142, 15, '济宁市', '272100', 0);
INSERT INTO `rk_city` VALUES (143, 15, '泰安市', '271000', 0);
INSERT INTO `rk_city` VALUES (144, 15, '威海市', '265700', 0);
INSERT INTO `rk_city` VALUES (145, 15, '日照市', '276800', 0);
INSERT INTO `rk_city` VALUES (146, 15, '莱芜市', '271100', 0);
INSERT INTO `rk_city` VALUES (147, 15, '临沂市', '276000', 0);
INSERT INTO `rk_city` VALUES (148, 15, '德州市', '253000', 0);
INSERT INTO `rk_city` VALUES (149, 15, '聊城市', '252000', 0);
INSERT INTO `rk_city` VALUES (150, 15, '滨州市', '256600', 0);
INSERT INTO `rk_city` VALUES (151, 15, '荷泽市', '255000', 0);
INSERT INTO `rk_city` VALUES (152, 16, '郑州市', '450000', 0);
INSERT INTO `rk_city` VALUES (153, 16, '开封市', '475000', 0);
INSERT INTO `rk_city` VALUES (154, 16, '洛阳市', '471000', 0);
INSERT INTO `rk_city` VALUES (155, 16, '平顶山市', '467000', 0);
INSERT INTO `rk_city` VALUES (156, 16, '安阳市', '454900', 0);
INSERT INTO `rk_city` VALUES (157, 16, '鹤壁市', '456600', 0);
INSERT INTO `rk_city` VALUES (158, 16, '新乡市', '453000', 0);
INSERT INTO `rk_city` VALUES (159, 16, '焦作市', '454100', 0);
INSERT INTO `rk_city` VALUES (160, 16, '濮阳市', '457000', 0);
INSERT INTO `rk_city` VALUES (161, 16, '许昌市', '461000', 0);
INSERT INTO `rk_city` VALUES (162, 16, '漯河市', '462000', 0);
INSERT INTO `rk_city` VALUES (163, 16, '三门峡市', '472000', 0);
INSERT INTO `rk_city` VALUES (164, 16, '南阳市', '473000', 0);
INSERT INTO `rk_city` VALUES (165, 16, '商丘市', '476000', 0);
INSERT INTO `rk_city` VALUES (166, 16, '信阳市', '464000', 0);
INSERT INTO `rk_city` VALUES (167, 16, '周口市', '466000', 0);
INSERT INTO `rk_city` VALUES (168, 16, '驻马店市', '463000', 0);
INSERT INTO `rk_city` VALUES (169, 17, '武汉市', '430000', 0);
INSERT INTO `rk_city` VALUES (170, 17, '黄石市', '435000', 0);
INSERT INTO `rk_city` VALUES (171, 17, '十堰市', '442000', 0);
INSERT INTO `rk_city` VALUES (172, 17, '宜昌市', '443000', 0);
INSERT INTO `rk_city` VALUES (173, 17, '襄樊市', '441000', 0);
INSERT INTO `rk_city` VALUES (174, 17, '鄂州市', '436000', 0);
INSERT INTO `rk_city` VALUES (175, 17, '荆门市', '448000', 0);
INSERT INTO `rk_city` VALUES (176, 17, '孝感市', '432100', 0);
INSERT INTO `rk_city` VALUES (177, 17, '荆州市', '434000', 0);
INSERT INTO `rk_city` VALUES (178, 17, '黄冈市', '438000', 0);
INSERT INTO `rk_city` VALUES (179, 17, '咸宁市', '437000', 0);
INSERT INTO `rk_city` VALUES (180, 17, '随州市', '441300', 0);
INSERT INTO `rk_city` VALUES (181, 17, '恩施土家族苗族自治州', '445000', 0);
INSERT INTO `rk_city` VALUES (182, 17, '神农架', '442400', 0);
INSERT INTO `rk_city` VALUES (183, 18, '长沙市', '410000', 0);
INSERT INTO `rk_city` VALUES (184, 18, '株洲市', '412000', 0);
INSERT INTO `rk_city` VALUES (185, 18, '湘潭市', '411100', 0);
INSERT INTO `rk_city` VALUES (186, 18, '衡阳市', '421000', 0);
INSERT INTO `rk_city` VALUES (187, 18, '邵阳市', '422000', 0);
INSERT INTO `rk_city` VALUES (188, 18, '岳阳市', '414000', 0);
INSERT INTO `rk_city` VALUES (189, 18, '常德市', '415000', 0);
INSERT INTO `rk_city` VALUES (190, 18, '张家界市', '427000', 0);
INSERT INTO `rk_city` VALUES (191, 18, '益阳市', '413000', 0);
INSERT INTO `rk_city` VALUES (192, 18, '郴州市', '423000', 0);
INSERT INTO `rk_city` VALUES (193, 18, '永州市', '425000', 0);
INSERT INTO `rk_city` VALUES (194, 18, '怀化市', '418000', 0);
INSERT INTO `rk_city` VALUES (195, 18, '娄底市', '417000', 0);
INSERT INTO `rk_city` VALUES (196, 18, '湘西土家族苗族自治州', '416000', 0);
INSERT INTO `rk_city` VALUES (197, 19, '广州市', '510000', 0);
INSERT INTO `rk_city` VALUES (198, 19, '韶关市', '521000', 0);
INSERT INTO `rk_city` VALUES (199, 19, '深圳市', '518000', 0);
INSERT INTO `rk_city` VALUES (200, 19, '珠海市', '519000', 0);
INSERT INTO `rk_city` VALUES (201, 19, '汕头市', '515000', 0);
INSERT INTO `rk_city` VALUES (202, 19, '佛山市', '528000', 0);
INSERT INTO `rk_city` VALUES (203, 19, '江门市', '529000', 0);
INSERT INTO `rk_city` VALUES (204, 19, '湛江市', '524000', 0);
INSERT INTO `rk_city` VALUES (205, 19, '茂名市', '525000', 0);
INSERT INTO `rk_city` VALUES (206, 19, '肇庆市', '526000', 0);
INSERT INTO `rk_city` VALUES (207, 19, '惠州市', '516000', 0);
INSERT INTO `rk_city` VALUES (208, 19, '梅州市', '514000', 0);
INSERT INTO `rk_city` VALUES (209, 19, '汕尾市', '516600', 1);
INSERT INTO `rk_city` VALUES (210, 19, '河源市', '517000', 0);
INSERT INTO `rk_city` VALUES (211, 19, '阳江市', '529500', 0);
INSERT INTO `rk_city` VALUES (212, 19, '清远市', '511500', 0);
INSERT INTO `rk_city` VALUES (213, 19, '东莞市', '511700', 0);
INSERT INTO `rk_city` VALUES (214, 19, '中山市', '528400', 0);
INSERT INTO `rk_city` VALUES (215, 19, '潮州市', '515600', 0);
INSERT INTO `rk_city` VALUES (216, 19, '揭阳市', '522000', 0);
INSERT INTO `rk_city` VALUES (217, 19, '云浮市', '527300', 0);
INSERT INTO `rk_city` VALUES (218, 20, '南宁市', '530000', 0);
INSERT INTO `rk_city` VALUES (219, 20, '柳州市', '545000', 0);
INSERT INTO `rk_city` VALUES (220, 20, '桂林市', '541000', 0);
INSERT INTO `rk_city` VALUES (221, 20, '梧州市', '543000', 0);
INSERT INTO `rk_city` VALUES (222, 20, '北海市', '536000', 0);
INSERT INTO `rk_city` VALUES (223, 20, '防城港市', '538000', 0);
INSERT INTO `rk_city` VALUES (224, 20, '钦州市', '535000', 0);
INSERT INTO `rk_city` VALUES (225, 20, '贵港市', '537100', 0);
INSERT INTO `rk_city` VALUES (226, 20, '玉林市', '537000', 0);
INSERT INTO `rk_city` VALUES (227, 20, '百色市', '533000', 0);
INSERT INTO `rk_city` VALUES (228, 20, '贺州市', '542800', 0);
INSERT INTO `rk_city` VALUES (229, 20, '河池市', '547000', 0);
INSERT INTO `rk_city` VALUES (230, 20, '来宾市', '546100', 0);
INSERT INTO `rk_city` VALUES (231, 20, '崇左市', '532200', 0);
INSERT INTO `rk_city` VALUES (232, 21, '海口市', '570000', 0);
INSERT INTO `rk_city` VALUES (233, 21, '三亚市', '572000', 0);
INSERT INTO `rk_city` VALUES (234, 22, '重庆市', '400000', 0);
INSERT INTO `rk_city` VALUES (235, 23, '成都市', '610000', 0);
INSERT INTO `rk_city` VALUES (236, 23, '自贡市', '643000', 0);
INSERT INTO `rk_city` VALUES (237, 23, '攀枝花市', '617000', 0);
INSERT INTO `rk_city` VALUES (238, 23, '泸州市', '646100', 0);
INSERT INTO `rk_city` VALUES (239, 23, '德阳市', '618000', 0);
INSERT INTO `rk_city` VALUES (240, 23, '绵阳市', '621000', 0);
INSERT INTO `rk_city` VALUES (241, 23, '广元市', '628000', 0);
INSERT INTO `rk_city` VALUES (242, 23, '遂宁市', '629000', 0);
INSERT INTO `rk_city` VALUES (243, 23, '内江市', '641000', 0);
INSERT INTO `rk_city` VALUES (244, 23, '乐山市', '614000', 0);
INSERT INTO `rk_city` VALUES (245, 23, '南充市', '637000', 0);
INSERT INTO `rk_city` VALUES (246, 23, '眉山市', '612100', 0);
INSERT INTO `rk_city` VALUES (247, 23, '宜宾市', '644000', 0);
INSERT INTO `rk_city` VALUES (248, 23, '广安市', '638000', 0);
INSERT INTO `rk_city` VALUES (249, 23, '达州市', '635000', 0);
INSERT INTO `rk_city` VALUES (250, 23, '雅安市', '625000', 0);
INSERT INTO `rk_city` VALUES (251, 23, '巴中市', '635500', 0);
INSERT INTO `rk_city` VALUES (252, 23, '资阳市', '641300', 0);
INSERT INTO `rk_city` VALUES (253, 23, '阿坝藏族羌族自治州', '624600', 0);
INSERT INTO `rk_city` VALUES (254, 23, '甘孜藏族自治州', '626000', 0);
INSERT INTO `rk_city` VALUES (255, 23, '凉山彝族自治州', '615000', 0);
INSERT INTO `rk_city` VALUES (256, 24, '贵阳市', '55000', 0);
INSERT INTO `rk_city` VALUES (257, 24, '六盘水市', '553000', 0);
INSERT INTO `rk_city` VALUES (258, 24, '遵义市', '563000', 0);
INSERT INTO `rk_city` VALUES (259, 24, '安顺市', '561000', 0);
INSERT INTO `rk_city` VALUES (260, 24, '铜仁地区', '554300', 0);
INSERT INTO `rk_city` VALUES (261, 24, '黔西南布依族苗族自治州', '551500', 0);
INSERT INTO `rk_city` VALUES (262, 24, '毕节地区', '551700', 0);
INSERT INTO `rk_city` VALUES (263, 24, '黔东南苗族侗族自治州', '551500', 0);
INSERT INTO `rk_city` VALUES (264, 24, '黔南布依族苗族自治州', '550100', 0);
INSERT INTO `rk_city` VALUES (265, 25, '昆明市', '650000', 0);
INSERT INTO `rk_city` VALUES (266, 25, '曲靖市', '655000', 0);
INSERT INTO `rk_city` VALUES (267, 25, '玉溪市', '653100', 0);
INSERT INTO `rk_city` VALUES (268, 25, '保山市', '678000', 0);
INSERT INTO `rk_city` VALUES (269, 25, '昭通市', '657000', 0);
INSERT INTO `rk_city` VALUES (270, 25, '丽江市', '674100', 0);
INSERT INTO `rk_city` VALUES (271, 25, '思茅市', '665000', 0);
INSERT INTO `rk_city` VALUES (272, 25, '临沧市', '677000', 0);
INSERT INTO `rk_city` VALUES (273, 25, '楚雄彝族自治州', '675000', 0);
INSERT INTO `rk_city` VALUES (274, 25, '红河哈尼族彝族自治州', '654400', 0);
INSERT INTO `rk_city` VALUES (275, 25, '文山壮族苗族自治州', '663000', 0);
INSERT INTO `rk_city` VALUES (276, 25, '西双版纳傣族自治州', '666200', 0);
INSERT INTO `rk_city` VALUES (277, 25, '大理白族自治州', '671000', 0);
INSERT INTO `rk_city` VALUES (278, 25, '德宏傣族景颇族自治州', '678400', 0);
INSERT INTO `rk_city` VALUES (279, 25, '怒江傈僳族自治州', '671400', 0);
INSERT INTO `rk_city` VALUES (280, 25, '迪庆藏族自治州', '674400', 0);
INSERT INTO `rk_city` VALUES (281, 26, '拉萨市', '850000', 0);
INSERT INTO `rk_city` VALUES (282, 26, '昌都地区', '854000', 0);
INSERT INTO `rk_city` VALUES (283, 26, '山南地区', '856000', 0);
INSERT INTO `rk_city` VALUES (284, 26, '日喀则地区', '857000', 0);
INSERT INTO `rk_city` VALUES (285, 26, '那曲地区', '852000', 0);
INSERT INTO `rk_city` VALUES (286, 26, '阿里地区', '859100', 0);
INSERT INTO `rk_city` VALUES (287, 26, '林芝地区', '860100', 0);
INSERT INTO `rk_city` VALUES (288, 27, '西安市', '710000', 0);
INSERT INTO `rk_city` VALUES (289, 27, '铜川市', '727000', 0);
INSERT INTO `rk_city` VALUES (290, 27, '宝鸡市', '721000', 0);
INSERT INTO `rk_city` VALUES (291, 27, '咸阳市', '712000', 0);
INSERT INTO `rk_city` VALUES (292, 27, '渭南市', '714000', 0);
INSERT INTO `rk_city` VALUES (293, 27, '延安市', '716000', 0);
INSERT INTO `rk_city` VALUES (294, 27, '汉中市', '723000', 0);
INSERT INTO `rk_city` VALUES (295, 27, '榆林市', '719000', 0);
INSERT INTO `rk_city` VALUES (296, 27, '安康市', '725000', 0);
INSERT INTO `rk_city` VALUES (297, 27, '商洛市', '711500', 0);
INSERT INTO `rk_city` VALUES (298, 28, '兰州市', '730000', 0);
INSERT INTO `rk_city` VALUES (299, 28, '嘉峪关市', '735100', 0);
INSERT INTO `rk_city` VALUES (300, 28, '金昌市', '737100', 0);
INSERT INTO `rk_city` VALUES (301, 28, '白银市', '730900', 0);
INSERT INTO `rk_city` VALUES (302, 28, '天水市', '741000', 0);
INSERT INTO `rk_city` VALUES (303, 28, '武威市', '733000', 0);
INSERT INTO `rk_city` VALUES (304, 28, '张掖市', '734000', 0);
INSERT INTO `rk_city` VALUES (305, 28, '平凉市', '744000', 0);
INSERT INTO `rk_city` VALUES (306, 28, '酒泉市', '735000', 0);
INSERT INTO `rk_city` VALUES (307, 28, '庆阳市', '744500', 0);
INSERT INTO `rk_city` VALUES (308, 28, '定西市', '743000', 0);
INSERT INTO `rk_city` VALUES (309, 28, '陇南市', '742100', 0);
INSERT INTO `rk_city` VALUES (310, 28, '临夏回族自治州', '731100', 0);
INSERT INTO `rk_city` VALUES (311, 28, '甘南藏族自治州', '747000', 0);
INSERT INTO `rk_city` VALUES (312, 29, '西宁市', '810000', 0);
INSERT INTO `rk_city` VALUES (313, 29, '海东地区', '810600', 0);
INSERT INTO `rk_city` VALUES (314, 29, '海北藏族自治州', '810300', 0);
INSERT INTO `rk_city` VALUES (315, 29, '黄南藏族自治州', '811300', 0);
INSERT INTO `rk_city` VALUES (316, 29, '海南藏族自治州', '813000', 0);
INSERT INTO `rk_city` VALUES (317, 29, '果洛藏族自治州', '814000', 0);
INSERT INTO `rk_city` VALUES (318, 29, '玉树藏族自治州', '815000', 0);
INSERT INTO `rk_city` VALUES (319, 29, '海西蒙古族藏族自治州', '817000', 0);
INSERT INTO `rk_city` VALUES (320, 30, '银川市', '750000', 0);
INSERT INTO `rk_city` VALUES (321, 30, '石嘴山市', '753000', 0);
INSERT INTO `rk_city` VALUES (322, 30, '吴忠市', '751100', 0);
INSERT INTO `rk_city` VALUES (323, 30, '固原市', '756000', 0);
INSERT INTO `rk_city` VALUES (324, 30, '中卫市', '751700', 0);
INSERT INTO `rk_city` VALUES (325, 31, '乌鲁木齐市', '830000', 0);
INSERT INTO `rk_city` VALUES (326, 31, '克拉玛依市', '834000', 0);
INSERT INTO `rk_city` VALUES (327, 31, '吐鲁番地区', '838000', 0);
INSERT INTO `rk_city` VALUES (328, 31, '哈密地区', '839000', 0);
INSERT INTO `rk_city` VALUES (329, 31, '昌吉回族自治州', '831100', 0);
INSERT INTO `rk_city` VALUES (330, 31, '博尔塔拉蒙古自治州', '833400', 0);
INSERT INTO `rk_city` VALUES (331, 31, '巴音郭楞蒙古自治州', '841000', 0);
INSERT INTO `rk_city` VALUES (332, 31, '阿克苏地区', '843000', 0);
INSERT INTO `rk_city` VALUES (333, 31, '克孜勒苏柯尔克孜自治州', '835600', 0);
INSERT INTO `rk_city` VALUES (334, 31, '喀什地区', '844000', 0);
INSERT INTO `rk_city` VALUES (335, 31, '和田地区', '848000', 0);
INSERT INTO `rk_city` VALUES (336, 31, '伊犁哈萨克自治州', '833200', 0);
INSERT INTO `rk_city` VALUES (337, 31, '塔城地区', '834700', 0);
INSERT INTO `rk_city` VALUES (338, 31, '阿勒泰地区', '836500', 0);
INSERT INTO `rk_city` VALUES (339, 31, '石河子市', '832000', 0);
INSERT INTO `rk_city` VALUES (340, 31, '阿拉尔市', '843300', 0);
INSERT INTO `rk_city` VALUES (341, 31, '图木舒克市', '843900', 0);
INSERT INTO `rk_city` VALUES (342, 31, '五家渠市', '831300', 0);
INSERT INTO `rk_city` VALUES (343, 32, '香港特别行政区', '000000', 0);
INSERT INTO `rk_city` VALUES (344, 33, '澳门特别行政区', '000000', 0);
INSERT INTO `rk_city` VALUES (345, 34, '台湾省', '000000', 0);

-- ----------------------------
-- Table structure for rk_config
-- ----------------------------
DROP TABLE IF EXISTS `rk_config`;
CREATE TABLE `rk_config`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '配置名称',
  `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'text' COMMENT '配置类型',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '配置说明',
  `group` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '配置分组',
  `extra` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '配置值',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '配置说明',
  `icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '小图标',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '状态',
  `value` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '配置值',
  `sort` smallint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `type`(`type`) USING BTREE,
  INDEX `group`(`group`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 85 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rk_config
-- ----------------------------
INSERT INTO `rk_config` VALUES (42, 'PRINT_PORT', 'text', '打印接口', 0, '', '打印订单时用到', '', 0, 0, 1, '8000', 0);
INSERT INTO `rk_config` VALUES (43, '', 'text', '基础设置', 36, '', '', '', 0, 0, 1, 'a:7:{s:11:\"websitename\";s:27:\"一呼智能语音机器人\";s:10:\"websiteURL\";s:24:\"http://yihu.echome123.cn\";s:14:\"Contactaddress\";s:15:\"北京中南海\";s:4:\"desc\";s:9:\"moonlight\";s:5:\"cover\";s:4:\"2616\";s:19:\"Websiterecordnumber\";s:7:\"7758258\";s:11:\"contactmode\";s:11:\"14795520542\";}', 0);
INSERT INTO `rk_config` VALUES (46, 'websitename', 'text', '网站名称', 0, '', '', '', 0, 0, 1, '龙宇物流', 0);
INSERT INTO `rk_config` VALUES (45, 'ALIYUN_SMS', 'text', '短信通知', 37, '', '', '', 0, 0, 1, 'a:5:{s:6:\"status\";s:1:\"0\";s:11:\"accessKeyId\";s:16:\"LTAIZQVJEg2pn0UO\";s:15:\"accessKeySecret\";s:30:\"OCdix0MVNfsuP5CmuoovJceopPoEGf\";s:8:\"signName\";s:12:\"龙宇物流\";s:12:\"templateCode\";s:13:\"SMS_119910993\";}', 0);
INSERT INTO `rk_config` VALUES (79, 'is_open', 'text', '', 38, '', '', '', 0, 0, 1, '1', 0);
INSERT INTO `rk_config` VALUES (84, 'evaluate', 'text', '', 38, '', '', '', 0, 0, 1, '50', 0);
INSERT INTO `rk_config` VALUES (83, 'invitation', 'text', '', 38, '', '', '', 0, 0, 1, '500', 0);
INSERT INTO `rk_config` VALUES (82, 'payment', 'text', '', 38, '', '', '', 0, 0, 1, '100', 0);
INSERT INTO `rk_config` VALUES (81, 'register', 'text', '', 38, '', '', '', 0, 0, 1, '500', 0);
INSERT INTO `rk_config` VALUES (80, 'is_open', 'text', '', 38, '', '', '', 0, 0, 1, '1', 0);

-- ----------------------------
-- Table structure for rk_content
-- ----------------------------
DROP TABLE IF EXISTS `rk_content`;
CREATE TABLE `rk_content`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `uid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户ID',
  `title` char(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `author` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作者',
  `category_id` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '所属分类',
  `description` char(140) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '描述',
  `type` tinyint(3) UNSIGNED NULL DEFAULT 0 COMMENT '类别，区分到底是图文还是视频。 1是图文，2是视频',
  `position` smallint(5) UNSIGNED NULL DEFAULT 0 COMMENT '推荐位',
  `external_link` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '外链',
  `cover_id` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '封面',
  `display` tinyint(3) UNSIGNED NULL DEFAULT 1 COMMENT '可见性',
  `deadline` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '截至时间',
  `view` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '浏览量',
  `comment` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '评论数',
  `level` int(10) NULL DEFAULT 0 COMMENT '优先级',
  `is_top` int(2) NOT NULL DEFAULT 0 COMMENT '是否置顶  1是置顶，0是不置顶',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '数据状态',
  `video_link` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '视频链接地址',
  `praise` int(10) NULL DEFAULT 0 COMMENT '点赞数',
  `keyword` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关键字，自动应答的关键词回复。',
  `is_share` tinyint(4) UNSIGNED NULL DEFAULT NULL COMMENT '是否允许分享',
  `is_comment` tinyint(4) NULL DEFAULT 0 COMMENT '是否可以评论',
  `is_examine` tinyint(4) NULL DEFAULT 0 COMMENT '是否需要审核评论',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_category_status`(`category_id`, `status`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 55 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文档模型基础表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rk_content
-- ----------------------------
INSERT INTO `rk_content` VALUES (53, 5555, '公告', NULL, NULL, '', 1, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, 1535942481, 1535942495, 1, NULL, NULL, '', NULL, NULL, NULL);
INSERT INTO `rk_content` VALUES (51, 5555, 'ew1', NULL, NULL, '', 1, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, 1535941715, 1535941717, 1, NULL, NULL, '5568', NULL, NULL, NULL);
INSERT INTO `rk_content` VALUES (52, 5555, 'ee', NULL, NULL, '', 1, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, 1535940733, 1535940240, 1, NULL, NULL, '5568', NULL, NULL, NULL);
INSERT INTO `rk_content` VALUES (54, 5555, 'rre', NULL, NULL, '', 1, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, 1535942441, 1535942441, 1, NULL, NULL, '', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for rk_content_comment
-- ----------------------------
DROP TABLE IF EXISTS `rk_content_comment`;
CREATE TABLE `rk_content_comment`  (
  `comment_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '评论id',
  `content_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品id',
  `username` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评论内容',
  `add_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '添加时间',
  `ip_address` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'ip地址',
  `is_show` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否显示',
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '父id',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '评论用户',
  PRIMARY KEY (`comment_id`) USING BTREE,
  INDEX `parent_id`(`parent_id`) USING BTREE,
  INDEX `id_value`(`content_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 343 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rk_content_detail
-- ----------------------------
DROP TABLE IF EXISTS `rk_content_detail`;
CREATE TABLE `rk_content_detail`  (
  `doc_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `content` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `tags` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签，就是搜索引擎要的关键字。',
  PRIMARY KEY (`doc_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 55 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文章' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rk_content_detail
-- ----------------------------
INSERT INTO `rk_content_detail` VALUES (51, '<p>ew1</p>', NULL);
INSERT INTO `rk_content_detail` VALUES (52, '<p>we32323323232</p>', NULL);
INSERT INTO `rk_content_detail` VALUES (53, '<p>按时</p>', NULL);
INSERT INTO `rk_content_detail` VALUES (54, '<p>热热热e</p>', NULL);

-- ----------------------------
-- Table structure for rk_content_report
-- ----------------------------
DROP TABLE IF EXISTS `rk_content_report`;
CREATE TABLE `rk_content_report`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `report_text` varchar(256) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `open_id` varchar(64) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `nickname` varchar(32) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rk_fans
-- ----------------------------
DROP TABLE IF EXISTS `rk_fans`;
CREATE TABLE `rk_fans`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '记录id',
  `mobile` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `head_pic` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `is_focus` tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否关注：0没关注 ，1关注',
  `open_id` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `power_open_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '服务号的openid',
  `client_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投票客户端的IP地址',
  `union_id` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `token` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nickname` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `integral` int(20) UNSIGNED NULL DEFAULT NULL COMMENT '积分',
  `sex` tinyint(4) NULL DEFAULT 0,
  `city` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `province` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `country` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1',
  `invite_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邀请码',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `open_id`(`open_id`) USING BTREE,
  INDEX `union_id`(`union_id`, `token`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 98582 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rk_fans
-- ----------------------------

-- ----------------------------
-- Table structure for rk_file
-- ----------------------------
DROP TABLE IF EXISTS `rk_file`;
CREATE TABLE `rk_file`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '文件ID',
  `name` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '原始文件名',
  `savename` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '保存名称',
  `savepath` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '文件保存路径',
  `ext` char(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '文件后缀',
  `mime` char(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '文件mime类型',
  `size` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '文件大小',
  `md5` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `location` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '文件保存位置',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '远程地址',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '上传时间',
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文件表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rk_hooks
-- ----------------------------
DROP TABLE IF EXISTS `rk_hooks`;
CREATE TABLE `rk_hooks`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '钩子名称',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '描述',
  `type` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '类型',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `addons` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '钩子挂载的插件 \'，\'分割',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rk_link
-- ----------------------------
DROP TABLE IF EXISTS `rk_link`;
CREATE TABLE `rk_link`  (
  `id` int(5) NOT NULL AUTO_INCREMENT COMMENT '标识ID',
  `ftype` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0:友情链接 1:合作单位',
  `title` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `url` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '链接地址',
  `cover_id` int(11) NOT NULL DEFAULT 0 COMMENT '封面图片ID',
  `descrip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '备注信息',
  `sort` int(10) NOT NULL DEFAULT 0 COMMENT '排序',
  `hits` tinyint(7) NOT NULL DEFAULT 0 COMMENT '点击率',
  `update_time` int(10) NOT NULL DEFAULT 0 COMMENT '更新时间',
  `uid` int(7) NOT NULL DEFAULT 0 COMMENT '用户ID ',
  `status` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rk_member
-- ----------------------------
DROP TABLE IF EXISTS `rk_member`;
CREATE TABLE `rk_member`  (
  `uid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `owner` int(11) NOT NULL COMMENT '所属人',
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `real_name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户密码',
  `nickname` char(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '昵称',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '邮箱地址',
  `mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '性别',
  `birthday` date NULL DEFAULT NULL COMMENT '生日',
  `qq` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'qq号',
  `score` mediumint(8) NOT NULL DEFAULT 0 COMMENT '用户积分',
  `pos_province` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户所在省份',
  `pos_city` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户所在城市',
  `pos_district` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户所在县城',
  `pos_community` int(11) NULL DEFAULT 0 COMMENT '用户所在区域',
  `salt` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '密码盐值',
  `login` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '登录次数',
  `reg_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '注册IP',
  `reg_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '注册时间',
  `last_login_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `last_login_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最后登录时间',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '会员状态，0未拨打 1拨打排队中  2已接通  3未接听挂断/关机/欠费',
  `is_admin` tinyint(1) NULL DEFAULT 0,
  `logo` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `money` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '收入',
  `account_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '提现账号类型',
  `account` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '账号',
  `id_card` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '身份证',
  `reasons` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '审核不通过的原因',
  `puid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'admin 表的ID',
  `open_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `group_id` int(11) NULL DEFAULT 0,
  `client_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '个推clientId',
  `user_type` tinyint(4) NULL DEFAULT 0 COMMENT '0普通用户，1 白名单',
  `level` int(11) NOT NULL,
  `last_dial_time` int(11) NOT NULL COMMENT '最后拨打时间',
  `duration` int(11) NULL DEFAULT 0 COMMENT '拨打时长',
  `task` int(11) NOT NULL COMMENT '任务表的uuid',
  `record_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `is_new` tinyint(2) NOT NULL DEFAULT 0 COMMENT '是否新增？ 1是 0否',
  `uuid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `call_rotation` int(11) NULL DEFAULT 0 COMMENT '呼叫轮次',
  `originating_call` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主叫号码 ',
  `salesman` int(11) NULL DEFAULT NULL COMMENT '销售人员id取admin表中的id',
  PRIMARY KEY (`uid`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `salesman`(`salesman`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 14162 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rk_member
-- ----------------------------

-- ----------------------------
-- Table structure for rk_member_group
-- ----------------------------
DROP TABLE IF EXISTS `rk_member_group`;
CREATE TABLE `rk_member_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `owner` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL COMMENT '状态：0不可用 1可用',
  `remark` varchar(200) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 9 CHARACTER SET = gbk COLLATE = gbk_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rk_member_group
-- ----------------------------
INSERT INTO `rk_member_group` VALUES (7, '意向客户', 0, 1, '');
INSERT INTO `rk_member_group` VALUES (8, '无意向客户', 0, 1, '没有意向的');

-- ----------------------------
-- Table structure for rk_member_income
-- ----------------------------
DROP TABLE IF EXISTS `rk_member_income`;
CREATE TABLE `rk_member_income`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pay_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '提现支付类型',
  `transaction_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付交易id',
  `member_id` int(32) UNSIGNED NOT NULL DEFAULT 0,
  `income_source` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'IN_RED_PACKET 红包    IN_COUPON 优惠卷   IN_DRIVER_PROFIT  司机分润  OUT_WITHDRAW_PROFIT提现',
  `money` decimal(10, 2) NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 代表收入    1代表支出',
  `status` tinyint(4) NOT NULL COMMENT '-1 是作废  0是申请中 1是审核通过 ',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `auditor` int(11) NULL DEFAULT NULL,
  `auditor_time` datetime(0) NULL DEFAULT NULL,
  `remark` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `actual_amount` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '实际提现金额',
  `tax` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '税费',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 424 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员收益表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rk_member_level
-- ----------------------------
DROP TABLE IF EXISTS `rk_member_level`;
CREATE TABLE `rk_member_level`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `order_money` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '完成订单金额升级',
  `order_count` int(11) NOT NULL DEFAULT 0 COMMENT '按完成订单数量升级',
  `discount` smallint(6) NOT NULL DEFAULT 0 COMMENT '扣扣率',
  `status` tinyint(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = gbk COLLATE = gbk_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rk_member_level
-- ----------------------------
INSERT INTO `rk_member_level` VALUES (1, '认证会员', 500.00, 1, 100, 1);
INSERT INTO `rk_member_level` VALUES (2, '钻石会员', 20000.00, 100, 80, 1);

-- ----------------------------
-- Table structure for rk_member_set
-- ----------------------------
DROP TABLE IF EXISTS `rk_member_set`;
CREATE TABLE `rk_member_set`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reg_reward` decimal(5, 2) NULL DEFAULT 0.00 COMMENT '注册奖励',
  `invite_reward_l1` decimal(5, 2) NULL DEFAULT 0.00 COMMENT '邀请奖励1级',
  `invite_reward_l2` decimal(5, 2) NULL DEFAULT 0.00 COMMENT '邀请奖励2级',
  `invite_reward_l3` decimal(5, 2) NULL DEFAULT 0.00 COMMENT '邀请奖励3级',
  `invite_limit` int(11) NULL DEFAULT 0 COMMENT '每天限制邀请奖励人数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = gbk COLLATE = gbk_chinese_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of rk_member_set
-- ----------------------------
INSERT INTO `rk_member_set` VALUES (1, 1.00, 2.00, 3.00, 4.00, 0);

-- ----------------------------
-- Table structure for rk_menu
-- ----------------------------
DROP TABLE IF EXISTS `rk_menu`;
CREATE TABLE `rk_menu`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'admin' COMMENT '菜单类别（admin后台，user会员中心）',
  `icon` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '分类图标',
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '上级分类ID',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序（同级有效）',
  `url` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '链接地址',
  `hide` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否隐藏',
  `tip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '提示',
  `group` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '分组',
  `is_dev` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否仅开发者模式可见',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '状态',
  `update_time` int(11) NOT NULL DEFAULT 0,
  `create_time` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pid`(`pid`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 185 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rk_menu
-- ----------------------------
INSERT INTO `rk_menu` VALUES (31, '客户管理', 'user', 'icon-gerenkehuguanli', 0, 9, 'user/member/index', 0, '', '用户管理', 0, 0, 1484533494, '2018-05-27 22:27:19');
INSERT INTO `rk_menu` VALUES (171, '座席管理', 'user', 'icon-zuoxi1', 0, 10, '', 0, '', '', 0, 0, 0, '2018-06-19 10:26:37');
INSERT INTO `rk_menu` VALUES (172, '坐席代表', 'user', '', 171, 0, 'user/tsr/index', 0, '', '', 0, 0, 0, '2018-06-19 10:33:36');
INSERT INTO `rk_menu` VALUES (173, '拨打计划', 'user', '', 167, 2, 'user/plan/project', 1, '', '', 0, 0, 0, '2018-06-30 10:34:42');
INSERT INTO `rk_menu` VALUES (78, '客户列表', 'user', '', 31, 0, 'user/member/memberlist', 0, '会员管理', '客户管理', 0, 0, 1482226304, '2018-05-27 14:11:57');
INSERT INTO `rk_menu` VALUES (83, '图文内容', 'user', '', 82, 0, 'user/Content/documentList', 0, '内容管理', '内容管理', 0, 0, 1482491144, '0000-00-00 00:00:00');
INSERT INTO `rk_menu` VALUES (85, '栏目管理', 'user', '', 82, 0, 'user/Category/index', 0, '内容管理', '内容管理', 0, 0, 1482491316, '0000-00-00 00:00:00');
INSERT INTO `rk_menu` VALUES (95, '查看结果', 'user', '', 90, 5, 'User/Vote/voteResult', 0, '投票管理', '投票管理', 0, 0, 1483343311, '0000-00-00 00:00:00');
INSERT INTO `rk_menu` VALUES (99, '插件列表', 'user', '', 98, 0, 'user/Advert/index', 0, '广告管理', '广告管理', 0, 0, 1484277798, '0000-00-00 00:00:00');
INSERT INTO `rk_menu` VALUES (101, '投诉列表', 'user', '', 90, 0, 'user/Vote/complain', 0, '投票的投诉列表', '投票管理', 0, 0, 1486455648, '0000-00-00 00:00:00');
INSERT INTO `rk_menu` VALUES (108, '评论管理', 'user', '', 105, 0, 'user/Forum/postscomment', 0, '社区管理', '社区管理', 0, 0, 1490066236, '0000-00-00 00:00:00');
INSERT INTO `rk_menu` VALUES (112, '客户分组', 'user', '', 31, 2, 'user/Member/group', 0, '', '客户管理', 0, 0, 1491461744, '2018-05-27 14:12:10');
INSERT INTO `rk_menu` VALUES (162, '通信管理', 'user', 'icon-shebeiyuce', 0, 8, '', 0, '', '', 0, 0, 0, '2018-08-30 23:57:55');
INSERT INTO `rk_menu` VALUES (163, '语音网关', 'user', '', 162, 0, 'user/device/voip', 0, '', '', 0, 0, 0, '2018-05-27 00:34:17');
INSERT INTO `rk_menu` VALUES (127, '会员管理', 'user', 'icon-quanxiandaili13', 0, 14, '', 0, '', '', 0, 0, 1504619430, '2018-07-18 11:51:51');
INSERT INTO `rk_menu` VALUES (128, '角色管理', 'user', '', 127, 2, 'user/Role/index', 0, '', '权限管理', 0, 0, 1504619691, '0000-00-00 00:00:00');
INSERT INTO `rk_menu` VALUES (129, '会员列表', 'user', '', 127, 1, 'user/manager/index', 0, '', '', 0, 0, 1504620318, '2018-08-17 11:58:49');
INSERT INTO `rk_menu` VALUES (130, '菜单管理', 'user', '', 127, 3, 'user/Menu/index', 0, '', '权限管理', 0, 0, 1505350759, '0000-00-00 00:00:00');
INSERT INTO `rk_menu` VALUES (136, '系统管理', 'user', 'icon-shezhi', 0, 33, '', 0, '', '', 0, 0, 0, '2018-05-27 22:27:57');
INSERT INTO `rk_menu` VALUES (164, '接口配置', 'user', '', 136, 2, 'user/system/interfacePage', 1, '', '', 0, 0, 0, '2018-05-29 22:57:53');
INSERT INTO `rk_menu` VALUES (140, '基本信息', 'user', '', 136, 1, 'user/system/setting', 0, '基础设置', '系统管理', 0, 0, 0, '2017-12-28 15:19:08');
INSERT INTO `rk_menu` VALUES (165, '报表管理', 'user', 'icon-forms', 0, 12, '', 1, '', '', 0, 0, 0, '2018-05-27 22:28:18');
INSERT INTO `rk_menu` VALUES (166, '拨打统计', 'user', '', 165, 0, 'user/report/index', 0, '', '', 0, 0, 0, '2018-05-27 01:04:46');
INSERT INTO `rk_menu` VALUES (167, '任务管理', 'user', 'icon-renwufabu', 0, 0, '', 0, '', '', 0, 0, 0, '2018-05-27 22:28:39');
INSERT INTO `rk_menu` VALUES (168, '任务列表', 'user', '', 167, 1, 'user/plan/newindex', 0, '', '', 0, 0, 0, '2018-09-13 18:57:56');
INSERT INTO `rk_menu` VALUES (169, '话术管理', 'user', 'icon-yewuchangjing', 0, 3, '', 0, '', '', 0, 0, 0, '2018-05-27 22:28:58');
INSERT INTO `rk_menu` VALUES (170, '话术场景', 'user', '', 169, 0, 'user/scenarios/index', 0, '', '', 0, 0, 0, '2018-05-27 01:04:19');
INSERT INTO `rk_menu` VALUES (174, '呼叫记录', 'user', '', 31, 0, 'user/member/callRecord', 0, '客户里面已经拨打了的', '客户管理', 0, 0, 0, '2018-08-11 16:02:15');
INSERT INTO `rk_menu` VALUES (175, '客户白名单', 'user', '', 31, 0, 'user/member/whitelist', 0, '会员管理里面的白名单，都是不给打的，政府人员之类的人的电话', '客户管理', 0, 0, 0, '2018-08-11 16:04:29');
INSERT INTO `rk_menu` VALUES (176, '机器座席', 'user', '', 162, 0, 'user/device/robot', 0, '', '', 0, 0, 0, '2018-08-23 10:35:06');
INSERT INTO `rk_menu` VALUES (177, '销售管理', 'user', 'icon-gerenkehuguanli', 0, 18, '', 0, '', '', 0, 0, 0, '2018-08-23 10:33:28');
INSERT INTO `rk_menu` VALUES (178, '销售人员', 'user', '', 177, 0, 'user/manager/sales', 0, '', '', 0, 0, 0, '2018-08-14 10:25:36');
INSERT INTO `rk_menu` VALUES (179, '我的客户', 'user', '', 177, 0, 'user/manager/mycustomer', 0, '', '', 0, 0, 0, '2018-08-14 15:49:05');
INSERT INTO `rk_menu` VALUES (180, '公众号配置', 'user', '', 136, 0, 'user/weixin/index', 0, '', '', 0, 0, 0, '2018-08-14 17:11:40');
INSERT INTO `rk_menu` VALUES (181, '线路管理', 'user', '', 162, 0, 'user/device/lines', 0, '', '', 0, 0, 0, '2018-08-31 00:15:05');
INSERT INTO `rk_menu` VALUES (182, '站内消息', 'user', '', 136, 0, 'user/message/index', 0, '', '', 0, 0, 0, '2018-09-03 01:36:50');
INSERT INTO `rk_menu` VALUES (183, '我的消息', 'user', '', 136, 0, 'user/message/my', 0, '', '', 0, 0, 0, '2018-09-03 10:05:48');
INSERT INTO `rk_menu` VALUES (184, '我的客户', 'user', '', 127, 0, 'user/manage/my', 0, '', '', 0, 0, 0, '2018-09-14 08:31:48');

-- ----------------------------
-- Table structure for rk_message
-- ----------------------------
DROP TABLE IF EXISTS `rk_message`;
CREATE TABLE `rk_message`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` tinyint(255) NULL DEFAULT NULL COMMENT '0 未阅读  1已阅读',
  `view_time` int(11) NOT NULL COMMENT '阅读时间',
  `create_time` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of rk_message
-- ----------------------------
INSERT INTO `rk_message` VALUES (1, 5568, 'test', 'ThinkPHP是一个免费开源的，快速、简单的面向对象的轻量级PHP开发框架，是为了敏捷WEB应用开发和简化企业应用开发而诞生的。ThinkPHP从诞生以来一直秉承简洁实用的设计原则，在保持出色的性能和至简的代码的同时，也注重易用性。遵循Apache2开源许可协议发布，意味着你可以免费使用ThinkPHP，甚至允许把你基于ThinkPHP开发的应用开源或商业产品发布/销售。', 1, 0, NULL);
INSERT INTO `rk_message` VALUES (2, 5568, 'ee', '<p>we</p>', 1, 0, 1535940240);
INSERT INTO `rk_message` VALUES (3, 5568, 'ew1', '<p>ew1</p>', 1, 0, 1535941717);
INSERT INTO `rk_message` VALUES (4, 5568, '公告', '', 1, 0, 1535942251);
INSERT INTO `rk_message` VALUES (5, 5569, '公告', '', 1, 0, 1535942251);
INSERT INTO `rk_message` VALUES (7, 5568, 'rre', '<p>热热热e</p>', 1, 0, 1535942441);
INSERT INTO `rk_message` VALUES (8, 5569, 'rre', '<p>热热热e</p>', 1, 0, 1535942441);
INSERT INTO `rk_message` VALUES (10, 5568, '公告', '<p>按时</p>', 1, 0, 1535942495);
INSERT INTO `rk_message` VALUES (11, 5569, '公告', '<p>按时</p>', 1, 0, 1535942495);

-- ----------------------------
-- Table structure for rk_model
-- ----------------------------
DROP TABLE IF EXISTS `rk_model`;
CREATE TABLE `rk_model`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '模型ID',
  `name` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '模型标识',
  `title` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '模型名称',
  `extend` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '继承的模型',
  `icon` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模型图标',
  `relation` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '继承与被继承模型的关联字段',
  `is_user_show` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否会员中心显示',
  `need_pk` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '新建表时是否需要主键字段',
  `field_sort` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '表单字段排序',
  `field_group` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1:基础' COMMENT '字段分组',
  `field_list` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '字段列表',
  `attribute_list` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '属性列表（表的字段）',
  `attribute_alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '属性别名定义',
  `list_grid` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '列表定义',
  `list_row` smallint(2) UNSIGNED NOT NULL DEFAULT 10 COMMENT '列表数据长度',
  `search_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '默认搜索字段',
  `search_list` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '高级搜索的字段',
  `template_list` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '列表显示模板',
  `template_add` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '新增模板',
  `template_edit` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '编辑模板',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态',
  `engine_type` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'MyISAM' COMMENT '数据库引擎',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文档模型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rk_my_address
-- ----------------------------
DROP TABLE IF EXISTS `rk_my_address`;
CREATE TABLE `rk_my_address`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `city` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `address` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mobile` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_default` tinyint(4) NOT NULL COMMENT '0为正常 1是默认',
  `is_send` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0是发货取货地址  1是收货地址 ',
  `coordinate` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '地址坐标',
  `sendercode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮编',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rk_page
-- ----------------------------
DROP TABLE IF EXISTS `rk_page`;
CREATE TABLE `rk_page`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uid` int(11) NOT NULL DEFAULT 0 COMMENT '用户uid',
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `model_id` int(11) NOT NULL,
  `cover_id` int(11) NULL DEFAULT 0,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `create_time` int(11) NULL DEFAULT NULL,
  `update_time` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '单页' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rk_picture
-- ----------------------------
DROP TABLE IF EXISTS `rk_picture`;
CREATE TABLE `rk_picture`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id自增',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '路径',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '图片链接',
  `md5` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `status` tinyint(2) NOT NULL DEFAULT 0 COMMENT '状态',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2618 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rk_picture
-- ----------------------------
INSERT INTO `rk_picture` VALUES (1, '/uploads/picture/20180102/b14afa09e61d380f5655425eb415587d.png', '/uploads/picture/20180102/b14afa09e61d380f5655425eb415587d.png', 'eb12e770b21f4ea9f73e2524ca2a8304', 'c4e94389744506df5fd0c4ae45d36dc7d9d6251d', 1, 1514857317);
INSERT INTO `rk_picture` VALUES (2, '/uploads/picture/20180108/cc58164a7f0ea941112ad0cb4be5921d.png', '/uploads/picture/20180108/cc58164a7f0ea941112ad0cb4be5921d.png', 'eb12e770b21f4ea9f73e2524ca2a8304', 'c4e94389744506df5fd0c4ae45d36dc7d9d6251d', 1, 1515402059);
INSERT INTO `rk_picture` VALUES (3, '/uploads/picture/20180108/f1e0a19f54aa12f916fa477e00d6eb69.png', '/uploads/picture/20180108/f1e0a19f54aa12f916fa477e00d6eb69.png', 'c7597e196e445c74223e434b471de0dc', '6b4772c2d90f4db5b2f1eca13285586fc655cad8', 1, 1515402077);
INSERT INTO `rk_picture` VALUES (4, '/uploads/picture/20180109/21e113331a3d0e281c73d84b7ba5dec8.png', '/uploads/picture/20180109/21e113331a3d0e281c73d84b7ba5dec8.png', 'eb12e770b21f4ea9f73e2524ca2a8304', 'c4e94389744506df5fd0c4ae45d36dc7d9d6251d', 1, 1515460648);
INSERT INTO `rk_picture` VALUES (5, '/uploads/picture/20180109/d8a7795456bcb2f12dbee11ee2eb440e.jpg', '/uploads/picture/20180109/d8a7795456bcb2f12dbee11ee2eb440e.jpg', 'd3fb1675d2dda74cd0263f0345fca0d5', '2de545b2f4c09c983cabbb1a9417a3eedc06b75d', 1, 1515466625);
INSERT INTO `rk_picture` VALUES (6, '/uploads/picture/20180110/151555868884.jpeg', '/uploads/picture/20180110/151555868884.jpeg', '', '', 1, 1515558688);
INSERT INTO `rk_picture` VALUES (7, '/uploads/picture/20180110/151555874461.jpeg', '/uploads/picture/20180110/151555874461.jpeg', '', '', 1, 1515558744);
INSERT INTO `rk_picture` VALUES (8, '/uploads/picture/20180110/15155605047.jpeg', '/uploads/picture/20180110/15155605047.jpeg', '', '', 1, 1515560504);
INSERT INTO `rk_picture` VALUES (9, '/uploads/picture/20180110/151556051137.jpeg', '/uploads/picture/20180110/151556051137.jpeg', '', '', 1, 1515560512);
INSERT INTO `rk_picture` VALUES (10, '/uploads/picture/20180110/151556065172.jpeg', '/uploads/picture/20180110/151556065172.jpeg', '', '', 1, 1515560651);
INSERT INTO `rk_picture` VALUES (11, '/uploads/picture/20180111/7f40790ae56dd1db1cacb37a5b1f5e2a.jpg', '/uploads/picture/20180111/7f40790ae56dd1db1cacb37a5b1f5e2a.jpg', '435daaff8fd9dc6753abd97589ce080a', '249e331498d60839c2765a0fe4ebd4e4b39ec7db', 1, 1515661711);
INSERT INTO `rk_picture` VALUES (12, '/uploads/picture/20180111/9b82a6ba2dfd15f7d4f749859a4efcfe.jpg', '/uploads/picture/20180111/9b82a6ba2dfd15f7d4f749859a4efcfe.jpg', '692169b3db2cd44ca32182e46bd2c2f4', '5445f314ba5636a3192586368cc8106a09bdee91', 1, 1515661922);
INSERT INTO `rk_picture` VALUES (13, '/uploads/picture/20180111/b9c7d74a5aa24ffd2f77c20d6f231ace.jpg', '/uploads/picture/20180111/b9c7d74a5aa24ffd2f77c20d6f231ace.jpg', 'd098ff38486ce38180049d24308cfb31', '23009833541d4d509bc61afed78d25ea7ae5d7a3', 1, 1515664147);
INSERT INTO `rk_picture` VALUES (14, '/uploads/picture/20180111/32081bc23d12d06368138db1bd54f3f7.jpg', '/uploads/picture/20180111/32081bc23d12d06368138db1bd54f3f7.jpg', 'd098ff38486ce38180049d24308cfb31', '23009833541d4d509bc61afed78d25ea7ae5d7a3', 1, 1515664487);
INSERT INTO `rk_picture` VALUES (15, '/uploads/picture/20180111/b7ac3d4886b53dc31d27c16ec22b475b.jpg', '/uploads/picture/20180111/b7ac3d4886b53dc31d27c16ec22b475b.jpg', '692169b3db2cd44ca32182e46bd2c2f4', '5445f314ba5636a3192586368cc8106a09bdee91', 1, 1515664571);
INSERT INTO `rk_picture` VALUES (16, '/uploads/picture/20180111/38483434320a52506aa6f142a4426ba8.png', '/uploads/picture/20180111/38483434320a52506aa6f142a4426ba8.png', 'efff054c3e6883ae4dd9fd4b8155e534', '1ae797d87ba345035a6d0f15a775cb88bc8c126e', 1, 1515664619);
INSERT INTO `rk_picture` VALUES (17, '/uploads/picture/20180112/d8ae91aa1b17a62c83472fccf9f83423.jpeg', '/uploads/picture/20180112/d8ae91aa1b17a62c83472fccf9f83423.jpeg', '958785484d0f58828cef64d71d4be5fb', 'e5b0199ebda9858b31db3f0e55a173e754c9b107', 1, 1515723038);
INSERT INTO `rk_picture` VALUES (18, './uploads/picture/20180112/1515730205.jpg', './uploads/picture/20180112/1515730205.jpg', '', '', 1, 1515730205);
INSERT INTO `rk_picture` VALUES (19, './uploads/picture/20180112/1515730252.jpg', './uploads/picture/20180112/1515730252.jpg', '', '', 1, 1515730252);
INSERT INTO `rk_picture` VALUES (20, './uploads/picture/20180112/1515730256.jpg', './uploads/picture/20180112/1515730256.jpg', '', '', 1, 1515730256);
INSERT INTO `rk_picture` VALUES (21, './uploads/picture/20180112/1515730256fuben.jpg', './uploads/picture/20180112/1515730256fuben.jpg', '', '', 1, 1515730256);
INSERT INTO `rk_picture` VALUES (22, './uploads/picture/20180112/1515730257.jpg', './uploads/picture/20180112/1515730257.jpg', '', '', 1, 1515730257);
INSERT INTO `rk_picture` VALUES (23, './uploads/picture/20180112/1515730258.jpg', './uploads/picture/20180112/1515730258.jpg', '', '', 1, 1515730258);
INSERT INTO `rk_picture` VALUES (24, './uploads/picture/20180112/1515730258fuben.jpg', './uploads/picture/20180112/1515730258fuben.jpg', '', '', 1, 1515730258);
INSERT INTO `rk_picture` VALUES (25, './uploads/picture/20180112/1515730258fuben.jpg', './uploads/picture/20180112/1515730258fuben.jpg', '', '', 1, 1515730258);
INSERT INTO `rk_picture` VALUES (26, './uploads/picture/20180112/1515730258fuben.jpg', './uploads/picture/20180112/1515730258fuben.jpg', '', '', 1, 1515730258);
INSERT INTO `rk_picture` VALUES (27, './uploads/picture/20180112/1515730258fuben.jpg', './uploads/picture/20180112/1515730258fuben.jpg', '', '', 1, 1515730258);
INSERT INTO `rk_picture` VALUES (28, './uploads/picture/20180112/1515730259.jpg', './uploads/picture/20180112/1515730259.jpg', '', '', 1, 1515730259);
INSERT INTO `rk_picture` VALUES (29, './uploads/picture/20180112/1515730273.jpg', './uploads/picture/20180112/1515730273.jpg', '', '', 1, 1515730273);
INSERT INTO `rk_picture` VALUES (30, './uploads/picture/20180112/1515730378.jpg', './uploads/picture/20180112/1515730378.jpg', '', '', 1, 1515730378);
INSERT INTO `rk_picture` VALUES (31, './uploads/picture/20180112/1515730493.jpg', './uploads/picture/20180112/1515730493.jpg', '', '', 1, 1515730493);
INSERT INTO `rk_picture` VALUES (32, '/uploads/picture/20180112/151574283336.png', '/uploads/picture/20180112/151574283336.png', '', '', 1, 1515742834);
INSERT INTO `rk_picture` VALUES (33, '/uploads/picture/20180112/151574371596.jpeg', '/uploads/picture/20180112/151574371596.jpeg', '', '', 1, 1515743717);
INSERT INTO `rk_picture` VALUES (34, '/uploads/picture/20180112/151574519825.png', '/uploads/picture/20180112/151574519825.png', '', '', 1, 1515745199);
INSERT INTO `rk_picture` VALUES (35, '/uploads/picture/20180112/151574522247.png', '/uploads/picture/20180112/151574522247.png', '', '', 1, 1515745222);
INSERT INTO `rk_picture` VALUES (36, '/uploads/picture/20180112/151574524664.png', '/uploads/picture/20180112/151574524664.png', '', '', 1, 1515745246);
INSERT INTO `rk_picture` VALUES (37, '/uploads/picture/20180112/151574527428.png', '/uploads/picture/20180112/151574527428.png', '', '', 1, 1515745275);
INSERT INTO `rk_picture` VALUES (38, '/uploads/picture/20180112/151574532036.png', '/uploads/picture/20180112/151574532036.png', '', '', 1, 1515745321);
INSERT INTO `rk_picture` VALUES (39, '/uploads/picture/20180112/151574534582.png', '/uploads/picture/20180112/151574534582.png', '', '', 1, 1515745345);
INSERT INTO `rk_picture` VALUES (40, '/uploads/picture/20180112/151574542073.png', '/uploads/picture/20180112/151574542073.png', '', '', 1, 1515745421);
INSERT INTO `rk_picture` VALUES (41, '/uploads/picture/20180112/151574543780.png', '/uploads/picture/20180112/151574543780.png', '', '', 1, 1515745438);
INSERT INTO `rk_picture` VALUES (42, '/uploads/picture/20180112/151574691696.png', '/uploads/picture/20180112/151574691696.png', '', '', 1, 1515746917);
INSERT INTO `rk_picture` VALUES (43, '/uploads/picture/20180112/151574695184.png', '/uploads/picture/20180112/151574695184.png', '', '', 1, 1515746952);
INSERT INTO `rk_picture` VALUES (44, '/uploads/picture/20180112/151574701896.png', '/uploads/picture/20180112/151574701896.png', '', '', 1, 1515747018);
INSERT INTO `rk_picture` VALUES (45, '/uploads/picture/20180112/151575007872.jpeg', '/uploads/picture/20180112/151575007872.jpeg', '', '', 1, 1515750079);
INSERT INTO `rk_picture` VALUES (46, '/uploads/picture/20180113/151580963188.png', '/uploads/picture/20180113/151580963188.png', '', '', 1, 1515809631);
INSERT INTO `rk_picture` VALUES (47, '/uploads/picture/20180113/151580965772.png', '/uploads/picture/20180113/151580965772.png', '', '', 1, 1515809657);
INSERT INTO `rk_picture` VALUES (48, '/uploads/picture/20180113/151580977736.png', '/uploads/picture/20180113/151580977736.png', '', '', 1, 1515809777);
INSERT INTO `rk_picture` VALUES (49, '/uploads/picture/20180113/151580979773.png', '/uploads/picture/20180113/151580979773.png', '', '', 1, 1515809797);
INSERT INTO `rk_picture` VALUES (50, '/uploads/picture/20180113/151580999698.png', '/uploads/picture/20180113/151580999698.png', '', '', 1, 1515809996);
INSERT INTO `rk_picture` VALUES (51, '/uploads/picture/20180113/151581002352.png', '/uploads/picture/20180113/151581002352.png', '', '', 1, 1515810023);
INSERT INTO `rk_picture` VALUES (52, '/uploads/picture/20180113/151581033498.jpeg', '/uploads/picture/20180113/151581033498.jpeg', '', '', 1, 1515810336);
INSERT INTO `rk_picture` VALUES (53, '/uploads/picture/20180113/1515813292.jpg', '/uploads/picture/20180113/1515813292.jpg', '', '', 1, 1515813292);
INSERT INTO `rk_picture` VALUES (54, '/uploads/picture/20180116/151610490171.jpeg', '/uploads/picture/20180116/151610490171.jpeg', '', '', 1, 1516104901);
INSERT INTO `rk_picture` VALUES (55, '/uploads/picture/20180119/84251216438d5fbe29f8f5499c60a184.jpeg', '/uploads/picture/20180119/84251216438d5fbe29f8f5499c60a184.jpeg', 'a225e79a4bc2288655ec5788166f476d', '3adfe8f8d894302d8ffb50964374052570112bf7', 1, 1516353338);
INSERT INTO `rk_picture` VALUES (56, '/uploads/picture/20180120/43714afc62c320aaac780f774b5e8f1f.jpeg', '/uploads/picture/20180120/43714afc62c320aaac780f774b5e8f1f.jpeg', 'a225e79a4bc2288655ec5788166f476d', '3adfe8f8d894302d8ffb50964374052570112bf7', 1, 1516417722);
INSERT INTO `rk_picture` VALUES (57, '/uploads/picture/20180120/832f68b390e0e0449fdd39d0a2de8c2d.jpeg', '/uploads/picture/20180120/832f68b390e0e0449fdd39d0a2de8c2d.jpeg', '8298026e5f6c7530b09c68a1516cbef0', '60a76205dd946169e500f84c7b4d3bbf8dd11a65', 1, 1516417761);
INSERT INTO `rk_picture` VALUES (58, '/uploads/picture/20180120/e8d576ce6a77361de165375643bc8d4d.jpeg', '/uploads/picture/20180120/e8d576ce6a77361de165375643bc8d4d.jpeg', '2b06c5b7199a520e989385471e258632', '063291041db4a88a31a481da35538f7dbc4ca705', 1, 1516431599);
INSERT INTO `rk_picture` VALUES (59, '/uploads/picture/20180120/8db19c2e182e89c334c9336a588e1f10.jpeg', '/uploads/picture/20180120/8db19c2e182e89c334c9336a588e1f10.jpeg', 'd03a81550eb490405111d08ae59b5931', '2f8486fab3a37fac72050bc0785fbcddb2daf4fa', 1, 1516431632);
INSERT INTO `rk_picture` VALUES (60, '/uploads/picture/20180120/659649cc7fff63534a3891343ec5ff3a.jpeg', '/uploads/picture/20180120/659649cc7fff63534a3891343ec5ff3a.jpeg', 'a225e79a4bc2288655ec5788166f476d', '3adfe8f8d894302d8ffb50964374052570112bf7', 1, 1516444006);
INSERT INTO `rk_picture` VALUES (61, '/uploads/picture/20180120/58cda47d3c17ded31dd46fbedd2c0e5c.jpeg', '/uploads/picture/20180120/58cda47d3c17ded31dd46fbedd2c0e5c.jpeg', 'a225e79a4bc2288655ec5788166f476d', '3adfe8f8d894302d8ffb50964374052570112bf7', 1, 1516444372);
INSERT INTO `rk_picture` VALUES (62, '/uploads/picture/20180120/c4130212d31f0ec8d9e930ec1d110d95.jpeg', '/uploads/picture/20180120/c4130212d31f0ec8d9e930ec1d110d95.jpeg', 'a225e79a4bc2288655ec5788166f476d', '3adfe8f8d894302d8ffb50964374052570112bf7', 1, 1516445790);
INSERT INTO `rk_picture` VALUES (63, '/uploads/picture/20180120/74701d3b234ea3565a334b7fea9ca1c3.jpeg', '/uploads/picture/20180120/74701d3b234ea3565a334b7fea9ca1c3.jpeg', '8298026e5f6c7530b09c68a1516cbef0', '60a76205dd946169e500f84c7b4d3bbf8dd11a65', 1, 1516445978);
INSERT INTO `rk_picture` VALUES (64, '/uploads/picture/20180120/4a856505492335aa4f7710e38c002155.jpeg', '/uploads/picture/20180120/4a856505492335aa4f7710e38c002155.jpeg', 'a225e79a4bc2288655ec5788166f476d', '3adfe8f8d894302d8ffb50964374052570112bf7', 1, 1516446563);
INSERT INTO `rk_picture` VALUES (65, '/uploads/picture/20180122/3ae17493cb1fda60f0e99e449cf90569.jpeg', '/uploads/picture/20180122/3ae17493cb1fda60f0e99e449cf90569.jpeg', 'a225e79a4bc2288655ec5788166f476d', '3adfe8f8d894302d8ffb50964374052570112bf7', 1, 1516580440);
INSERT INTO `rk_picture` VALUES (66, '/uploads/picture/20180122/8a0d5eadcd8801f465d95741ed80fa2a.jpeg', '/uploads/picture/20180122/8a0d5eadcd8801f465d95741ed80fa2a.jpeg', 'd03a81550eb490405111d08ae59b5931', '2f8486fab3a37fac72050bc0785fbcddb2daf4fa', 1, 1516582027);
INSERT INTO `rk_picture` VALUES (67, '/uploads/picture/20180122/01706712bcd465b2f91b49dd728a05c4.png', '/uploads/picture/20180122/01706712bcd465b2f91b49dd728a05c4.png', 'fe088acf727da396cd94506072f29780', '5dc89d6b7b1f2c76439d825c4e90e2be0953e3fe', 1, 1516583995);
INSERT INTO `rk_picture` VALUES (68, '/uploads/picture/20180122/ce19ea86f5a049d461de7678234a6c56.png', '/uploads/picture/20180122/ce19ea86f5a049d461de7678234a6c56.png', 'fe088acf727da396cd94506072f29780', '5dc89d6b7b1f2c76439d825c4e90e2be0953e3fe', 1, 1516584153);
INSERT INTO `rk_picture` VALUES (69, '/uploads/picture/20180122/5b78c5f268c4f382d11818335fe866bb.png', '/uploads/picture/20180122/5b78c5f268c4f382d11818335fe866bb.png', 'fe088acf727da396cd94506072f29780', '5dc89d6b7b1f2c76439d825c4e90e2be0953e3fe', 1, 1516584548);
INSERT INTO `rk_picture` VALUES (70, '/uploads/picture/20180122/a76dbd0081e0855ec2b87e44a7a23324.png', '/uploads/picture/20180122/a76dbd0081e0855ec2b87e44a7a23324.png', 'fe088acf727da396cd94506072f29780', '5dc89d6b7b1f2c76439d825c4e90e2be0953e3fe', 1, 1516585176);
INSERT INTO `rk_picture` VALUES (71, '/uploads/picture/20180122/8be85f48c93cc5e419fdc7ff3cc574a1.png', '/uploads/picture/20180122/8be85f48c93cc5e419fdc7ff3cc574a1.png', 'fe088acf727da396cd94506072f29780', '5dc89d6b7b1f2c76439d825c4e90e2be0953e3fe', 1, 1516585367);
INSERT INTO `rk_picture` VALUES (72, '/uploads/picture/20180126/15169625564.jpeg', '/uploads/picture/20180126/15169625564.jpeg', '', '', 1, 1516962556);
INSERT INTO `rk_picture` VALUES (73, '/uploads/picture/20180127/5700ba3901d49998934558e2157e0d20.jpeg', '/uploads/picture/20180127/5700ba3901d49998934558e2157e0d20.jpeg', '2b06c5b7199a520e989385471e258632', '063291041db4a88a31a481da35538f7dbc4ca705', 1, 1517041257);
INSERT INTO `rk_picture` VALUES (74, '/uploads/picture/20180127/acedf3263712e1cfc863d29890092324.jpeg', '/uploads/picture/20180127/acedf3263712e1cfc863d29890092324.jpeg', 'a225e79a4bc2288655ec5788166f476d', '3adfe8f8d894302d8ffb50964374052570112bf7', 1, 1517041542);
INSERT INTO `rk_picture` VALUES (75, '/uploads/picture/20180127/00778fed3b07c72aad5359d113538f7b.jpeg', '/uploads/picture/20180127/00778fed3b07c72aad5359d113538f7b.jpeg', '8298026e5f6c7530b09c68a1516cbef0', '60a76205dd946169e500f84c7b4d3bbf8dd11a65', 1, 1517041927);
INSERT INTO `rk_picture` VALUES (76, '/uploads/picture/20180127/bc9136baf9f05042e842b745dd859d46.jpg', '/uploads/picture/20180127/bc9136baf9f05042e842b745dd859d46.jpg', 'faa028759327df3d1b5243acd183b002', 'b66071270e9d3a87e6369078c1cbb2aab4f64594', 1, 1517042018);
INSERT INTO `rk_picture` VALUES (77, '/uploads/picture/20180127/de90b703a9834a32454b3b3e1b4a98b6.jpg', '/uploads/picture/20180127/de90b703a9834a32454b3b3e1b4a98b6.jpg', 'd098ff38486ce38180049d24308cfb31', '23009833541d4d509bc61afed78d25ea7ae5d7a3', 1, 1517042221);
INSERT INTO `rk_picture` VALUES (78, '/uploads/picture/20180127/4739ef186856e77e810c4dd383cda59f.jpg', '/uploads/picture/20180127/4739ef186856e77e810c4dd383cda59f.jpg', '199b4c98787cac1d94c711650fb0df9e', '773177352838f6dcd74f75226e1220fc08512f50', 1, 1517042292);
INSERT INTO `rk_picture` VALUES (79, '/uploads/picture/20180127/1829ff51fc20f39ccd6b5bbd7396891d.jpg', '/uploads/picture/20180127/1829ff51fc20f39ccd6b5bbd7396891d.jpg', '6bffedcae72ba090f1eb32c571cdecbc', 'e5176b56a80c5e458ad5dc2a33700043975609cb', 1, 1517042440);
INSERT INTO `rk_picture` VALUES (80, '/uploads/picture/20180130/151729054247.jpeg', '/uploads/picture/20180130/151729054247.jpeg', '', '', 1, 1517290543);
INSERT INTO `rk_picture` VALUES (81, './uploads/picture/20180130/1517290648.jpg', './uploads/picture/20180130/1517290648.jpg', '', '', 1, 1517290648);
INSERT INTO `rk_picture` VALUES (82, './uploads/picture/20180130/1517291013.jpg', './uploads/picture/20180130/1517291013.jpg', '', '', 1, 1517291013);
INSERT INTO `rk_picture` VALUES (83, './uploads/picture/20180130/1517291016.jpg', './uploads/picture/20180130/1517291016.jpg', '', '', 1, 1517291016);
INSERT INTO `rk_picture` VALUES (84, './uploads/picture/20180130/1517291044.jpg', './uploads/picture/20180130/1517291044.jpg', '', '', 1, 1517291044);
INSERT INTO `rk_picture` VALUES (85, './uploads/picture/20180130/1517291044fuben.jpg', './uploads/picture/20180130/1517291044fuben.jpg', '', '', 1, 1517291044);
INSERT INTO `rk_picture` VALUES (86, './uploads/picture/20180130/1517291044fuben.jpg', './uploads/picture/20180130/1517291044fuben.jpg', '', '', 1, 1517291044);
INSERT INTO `rk_picture` VALUES (87, './uploads/picture/20180130/1517291044fuben.jpg', './uploads/picture/20180130/1517291044fuben.jpg', '', '', 1, 1517291044);
INSERT INTO `rk_picture` VALUES (88, './uploads/picture/20180130/1517291044fuben.jpg', './uploads/picture/20180130/1517291044fuben.jpg', '', '', 1, 1517291044);
INSERT INTO `rk_picture` VALUES (89, './uploads/picture/20180130/1517291045.jpg', './uploads/picture/20180130/1517291045.jpg', '', '', 1, 1517291045);
INSERT INTO `rk_picture` VALUES (90, './uploads/picture/20180130/1517291067.jpg', './uploads/picture/20180130/1517291067.jpg', '', '', 1, 1517291067);
INSERT INTO `rk_picture` VALUES (91, './uploads/picture/20180130/1517291067fuben.jpg', './uploads/picture/20180130/1517291067fuben.jpg', '', '', 1, 1517291067);
INSERT INTO `rk_picture` VALUES (92, './uploads/picture/20180130/1517291067fuben.jpg', './uploads/picture/20180130/1517291067fuben.jpg', '', '', 1, 1517291067);
INSERT INTO `rk_picture` VALUES (93, './uploads/picture/20180130/1517291067fuben.jpg', './uploads/picture/20180130/1517291067fuben.jpg', '', '', 1, 1517291067);
INSERT INTO `rk_picture` VALUES (94, './uploads/picture/20180130/1517291067fuben.jpg', './uploads/picture/20180130/1517291067fuben.jpg', '', '', 1, 1517291067);
INSERT INTO `rk_picture` VALUES (95, './uploads/picture/20180130/1517291067fuben.jpg', './uploads/picture/20180130/1517291067fuben.jpg', '', '', 1, 1517291067);
INSERT INTO `rk_picture` VALUES (96, './uploads/picture/20180130/1517291068.jpg', './uploads/picture/20180130/1517291068.jpg', '', '', 1, 1517291068);
INSERT INTO `rk_picture` VALUES (97, './uploads/picture/20180130/1517291068fuben.jpg', './uploads/picture/20180130/1517291068fuben.jpg', '', '', 1, 1517291068);
INSERT INTO `rk_picture` VALUES (98, './uploads/picture/20180130/1517291068fuben.jpg', './uploads/picture/20180130/1517291068fuben.jpg', '', '', 1, 1517291068);
INSERT INTO `rk_picture` VALUES (99, './uploads/picture/20180130/1517291068fuben.jpg', './uploads/picture/20180130/1517291068fuben.jpg', '', '', 1, 1517291068);
INSERT INTO `rk_picture` VALUES (100, './uploads/picture/20180130/1517291068fuben.jpg', './uploads/picture/20180130/1517291068fuben.jpg', '', '', 1, 1517291068);
INSERT INTO `rk_picture` VALUES (101, './uploads/picture/20180130/1517291068fuben.jpg', './uploads/picture/20180130/1517291068fuben.jpg', '', '', 1, 1517291068);
INSERT INTO `rk_picture` VALUES (102, './uploads/picture/20180130/1517291069.jpg', './uploads/picture/20180130/1517291069.jpg', '', '', 1, 1517291069);
INSERT INTO `rk_picture` VALUES (103, './uploads/picture/20180130/1517291069fuben.jpg', './uploads/picture/20180130/1517291069fuben.jpg', '', '', 1, 1517291069);
INSERT INTO `rk_picture` VALUES (104, './uploads/picture/20180130/1517291069fuben.jpg', './uploads/picture/20180130/1517291069fuben.jpg', '', '', 1, 1517291069);
INSERT INTO `rk_picture` VALUES (105, './uploads/picture/20180130/1517291069fuben.jpg', './uploads/picture/20180130/1517291069fuben.jpg', '', '', 1, 1517291069);
INSERT INTO `rk_picture` VALUES (106, './uploads/picture/20180130/1517291436.jpg', './uploads/picture/20180130/1517291436.jpg', '', '', 1, 1517291436);
INSERT INTO `rk_picture` VALUES (107, './uploads/picture/20180130/1517293422.jpg', './uploads/picture/20180130/1517293422.jpg', '', '', 1, 1517293422);
INSERT INTO `rk_picture` VALUES (108, './uploads/picture/20180130/1517293605.jpg', './uploads/picture/20180130/1517293605.jpg', '', '', 1, 1517293605);
INSERT INTO `rk_picture` VALUES (109, './uploads/picture/20180130/1517294607.jpg', './uploads/picture/20180130/1517294607.jpg', '', '', 1, 1517294607);
INSERT INTO `rk_picture` VALUES (110, './uploads/picture/20180130/1517297613.jpg', './uploads/picture/20180130/1517297613.jpg', '', '', 1, 1517297613);
INSERT INTO `rk_picture` VALUES (111, './uploads/picture/20180130/1517301010.jpg', './uploads/picture/20180130/1517301010.jpg', '', '', 1, 1517301010);
INSERT INTO `rk_picture` VALUES (112, './uploads/picture/20180130/1517301037.jpg', './uploads/picture/20180130/1517301037.jpg', '', '', 1, 1517301037);
INSERT INTO `rk_picture` VALUES (113, '/uploads/picture/20180130/44413f83f0def33bdfac2715661b39a5.jpg', '/uploads/picture/20180130/44413f83f0def33bdfac2715661b39a5.jpg', '96c63ed62176e2d9ea6706ee8bc605cd', '1ad0b75b476eed2c248faff0a8e5e2e29ecfda93', 1, 1517308025);
INSERT INTO `rk_picture` VALUES (114, '/uploads/picture/20180130/1569b63bde0065849b88c300e035a45b.jpg', '/uploads/picture/20180130/1569b63bde0065849b88c300e035a45b.jpg', '96c63ed62176e2d9ea6706ee8bc605cd', '1ad0b75b476eed2c248faff0a8e5e2e29ecfda93', 1, 1517308056);
INSERT INTO `rk_picture` VALUES (115, '/uploads/picture/20180130/1517325921100.jpeg', '/uploads/picture/20180130/1517325921100.jpeg', '', '', 1, 1517325921);
INSERT INTO `rk_picture` VALUES (116, '/uploads/picture/20180204/521b7edb899140aecdaeac02602c67a8.jpg', '/uploads/picture/20180204/521b7edb899140aecdaeac02602c67a8.jpg', '776806f0ff53ff0de420b91038e43780', 'ec1561350277d90a1b2407d3e1deb0fe391b5dcb', 1, 1517712062);
INSERT INTO `rk_picture` VALUES (117, '/uploads/picture/20180204/9648a2931748a4028a107741169fae20.jpeg', '/uploads/picture/20180204/9648a2931748a4028a107741169fae20.jpeg', 'c208d3c2a90cb48950b69dcd0765081a', '09b1c1243a5106dc06769ef61e9ab755e50264b5', 1, 1517712338);
INSERT INTO `rk_picture` VALUES (118, '/uploads/picture/20180204/6259656b06c92ea6a0fdc4dd15329b87.jpg', '/uploads/picture/20180204/6259656b06c92ea6a0fdc4dd15329b87.jpg', '1e870a5fac20dfab64af0a5c64ad37f9', 'f3d77041b9b7f98cd6f0ba50e0dafd2ce337b192', 1, 1517712493);
INSERT INTO `rk_picture` VALUES (119, '/uploads/picture/20180204/dc757738724f8b723b9ec59d42362ba1.jpg', '/uploads/picture/20180204/dc757738724f8b723b9ec59d42362ba1.jpg', '1e870a5fac20dfab64af0a5c64ad37f9', 'f3d77041b9b7f98cd6f0ba50e0dafd2ce337b192', 1, 1517712684);
INSERT INTO `rk_picture` VALUES (120, '/uploads/picture/20180204/83bac4c05579b7522416bfb6e33bfb78.jpg', '/uploads/picture/20180204/83bac4c05579b7522416bfb6e33bfb78.jpg', '8ff9380e113fb3ce5d7c7afd1e61a194', '18c6fa8664342557a9a1ac66f77d58e6e2a96eec', 1, 1517712716);
INSERT INTO `rk_picture` VALUES (121, '/uploads/picture/20180204/bc26515bb23a3aadbb71b28a395f1a9f.jpg', '/uploads/picture/20180204/bc26515bb23a3aadbb71b28a395f1a9f.jpg', '42cf3d1423f0ec55abcff6dc39883131', '9d5005cd3ac626c44459681529194a06d34a210e', 1, 1517712998);
INSERT INTO `rk_picture` VALUES (122, '/uploads/picture/20180204/59634735b5be6c00383e5019b53e86b5.jpg', '/uploads/picture/20180204/59634735b5be6c00383e5019b53e86b5.jpg', '1d12f9c9346c3d102d705ea588d274bf', 'e27b23f02b2eed0fad4f0b1066165514db77ec4e', 1, 1517713099);
INSERT INTO `rk_picture` VALUES (123, '/uploads/picture/20180204/022d737673cf91b2770b8fa764520c4d.jpg', '/uploads/picture/20180204/022d737673cf91b2770b8fa764520c4d.jpg', 'af3367145a4a955e5a048db1f36bb3e3', 'bb069d5c091436579e5c7246aca11596866e1f8a', 1, 1517713170);
INSERT INTO `rk_picture` VALUES (124, '/uploads/picture/20180204/c86cacce1ade896f6fd9567979e0adf9.jpg', '/uploads/picture/20180204/c86cacce1ade896f6fd9567979e0adf9.jpg', 'c617614d5d9aacc162219e7b194cc084', '98e272d7af802351804f0bcc2960c8dfae6bc6ae', 1, 1517713397);
INSERT INTO `rk_picture` VALUES (125, '/uploads/picture/20180204/df7cbfe6d4ed68acdf33a37ed54e6ffe.jpg', '/uploads/picture/20180204/df7cbfe6d4ed68acdf33a37ed54e6ffe.jpg', '77400b22bc4ec3206ab359d5edacb44b', 'b872c9ec3fa384f9408836bb5baa4cf3dc402bd8', 1, 1517713609);
INSERT INTO `rk_picture` VALUES (126, '/uploads/picture/20180204/a2ed00beb41d072ba8b36f689946b11e.jpg', '/uploads/picture/20180204/a2ed00beb41d072ba8b36f689946b11e.jpg', '26dbc032e030b27320e12fe605a8cd62', '72f0515d0db2709037e76d0be13555d0fedf2a5b', 1, 1517740955);
INSERT INTO `rk_picture` VALUES (127, '/uploads/picture/20180204/dc82974be77c675a52205e9091cecfe0.jpg', '/uploads/picture/20180204/dc82974be77c675a52205e9091cecfe0.jpg', '4f23216dcd4a032b98fb225167a13778', '5567ad5d0a9445be7f94ba266c9baae7c084d610', 1, 1517741221);
INSERT INTO `rk_picture` VALUES (128, '/uploads/picture/20180204/790d4cd5c17e3858039fc3596a42a020.png', '/uploads/picture/20180204/790d4cd5c17e3858039fc3596a42a020.png', 'd6b25064eceb5ab0c8f264c4c81b5098', '4c144b2333445c9463bdd353d5eb6b4b4c10bb3b', 1, 1517741355);
INSERT INTO `rk_picture` VALUES (129, '/uploads/picture/20180204/4b114ee78c05c29f9d0fe67b7a8b67d6.png', '/uploads/picture/20180204/4b114ee78c05c29f9d0fe67b7a8b67d6.png', 'c9b64c8e290b9200c4a72abe2370f026', 'd9d3a4b45ac62129b7683a74d7ce7287d5e041f1', 1, 1517741504);
INSERT INTO `rk_picture` VALUES (130, '/uploads/picture/20180204/9373d48be4237a55a6f6f29e01ea53ef.png', '/uploads/picture/20180204/9373d48be4237a55a6f6f29e01ea53ef.png', '638a91bf0ad99ac85c4e9ad752c3dd36', '3adf137baa4777797c058622ac0183f763cc7173', 1, 1517741659);
INSERT INTO `rk_picture` VALUES (131, '/uploads/picture/20180204/f54bc3abaa4ee7021a762a70a38bf873.png', '/uploads/picture/20180204/f54bc3abaa4ee7021a762a70a38bf873.png', 'da653da5be88e46e425afbf2ca08b05c', 'bac48b1022d9e843b099170c9049873a5692a413', 1, 1517741865);
INSERT INTO `rk_picture` VALUES (132, '/uploads/picture/20180204/56d72e4ad8a3f1efbf7a3bf36ff0e450.png', '/uploads/picture/20180204/56d72e4ad8a3f1efbf7a3bf36ff0e450.png', '0fac28390c083810d129e0f7816634b0', 'e628785fc2fee33dfc7c2948d68301d9ac0d4ce5', 1, 1517742049);
INSERT INTO `rk_picture` VALUES (133, '/uploads/picture/20180204/65d0cbcddb84ad0ee21352fe7fa45ef4.png', '/uploads/picture/20180204/65d0cbcddb84ad0ee21352fe7fa45ef4.png', 'bc3f700e44601608d497948c14aae56b', 'ff38f3a5f28c4428a4ff2bef2e7e3cf32af9915d', 1, 1517742326);
INSERT INTO `rk_picture` VALUES (134, '/uploads/picture/20180204/de97160c2b8d0069a97f83eb1fcbb5c1.png', '/uploads/picture/20180204/de97160c2b8d0069a97f83eb1fcbb5c1.png', 'bc3f700e44601608d497948c14aae56b', 'ff38f3a5f28c4428a4ff2bef2e7e3cf32af9915d', 1, 1517742410);
INSERT INTO `rk_picture` VALUES (135, '/uploads/picture/20180204/3c4448ce87025e5295629a22c86af5a2.png', '/uploads/picture/20180204/3c4448ce87025e5295629a22c86af5a2.png', '5a846d5f046855a5ece63fc175f97c29', 'b633e7d9a90ad4c5cdf0af4d09d481133741ca46', 1, 1517742463);
INSERT INTO `rk_picture` VALUES (136, '/uploads/picture/20180204/137fcb1125d8f72960fd3df20be0787d.png', '/uploads/picture/20180204/137fcb1125d8f72960fd3df20be0787d.png', 'ada0440b1338ec6f1471d6ec43bb48af', 'f50c4ac1d970180090a618f26d0fef1b8cce5c7f', 1, 1517742514);
INSERT INTO `rk_picture` VALUES (137, '/uploads/picture/20180204/9b03d6b714202ea7b5601009017ca167.png', '/uploads/picture/20180204/9b03d6b714202ea7b5601009017ca167.png', '6c34d6deadca5a73fb0c5c0f5b70ce13', '07495145b3d090fc72746a127f11126af629e516', 1, 1517742670);
INSERT INTO `rk_picture` VALUES (138, '/uploads/picture/20180204/0b3caa638b26e2689e1d4257fb9c783d.png', '/uploads/picture/20180204/0b3caa638b26e2689e1d4257fb9c783d.png', '6c34d6deadca5a73fb0c5c0f5b70ce13', '07495145b3d090fc72746a127f11126af629e516', 1, 1517742849);
INSERT INTO `rk_picture` VALUES (139, '/uploads/picture/20180204/a90de8402b206b13021b5687b5cbb1b0.png', '/uploads/picture/20180204/a90de8402b206b13021b5687b5cbb1b0.png', '347517844964d8280e64aab65773769e', '63775f2f29af5bbe919478adf587349407471de6', 1, 1517742857);
INSERT INTO `rk_picture` VALUES (140, '/uploads/picture/20180204/a51bb4134ad6e0839af5760ce6d0f5fb.png', '/uploads/picture/20180204/a51bb4134ad6e0839af5760ce6d0f5fb.png', '62da6d2b68b5d38c186991736c7b0636', '5478a2d23d8e911a49b71e3b61e4ee9379438535', 1, 1517743289);
INSERT INTO `rk_picture` VALUES (141, '/uploads/picture/20180204/eb3b8d99760d927bbd901cc72268bf2b.png', '/uploads/picture/20180204/eb3b8d99760d927bbd901cc72268bf2b.png', '6b30441bf397f7c2c912a3d418024218', '3a8d4b39f1da10f187a842aeb63770b22538274c', 1, 1517743360);
INSERT INTO `rk_picture` VALUES (142, '/uploads/picture/20180204/f05c8af4efdbd43361f8fe107ecf141c.png', '/uploads/picture/20180204/f05c8af4efdbd43361f8fe107ecf141c.png', '8aef0d6a37efd15a848b5bd7ea1b8aa6', '8591712d712a88cfbf903b2cae9119a09a68c7e9', 1, 1517743420);
INSERT INTO `rk_picture` VALUES (143, '/uploads/picture/20180204/839c517a9f7df087df039605f6937736.png', '/uploads/picture/20180204/839c517a9f7df087df039605f6937736.png', '8b5643655f4031339b5b3f1e1c554223', 'd9ef8bbbf2a5fd428b4674785a3d587a34d2f7b3', 1, 1517743607);
INSERT INTO `rk_picture` VALUES (144, '/uploads/picture/20180204/644d75f78f457fdf78fb4c97718255f4.png', '/uploads/picture/20180204/644d75f78f457fdf78fb4c97718255f4.png', 'b64f33b67d432fc4a250565fed42ae9e', 'c20f2d64dd08e80c1a33fd61076c6c5779dbc26a', 1, 1517743645);
INSERT INTO `rk_picture` VALUES (145, '/uploads/picture/20180204/8859fd06b31dbb3978bb7143ac3272a0.png', '/uploads/picture/20180204/8859fd06b31dbb3978bb7143ac3272a0.png', '318d49792bf6fa371bd38e72cdd86d88', 'c329f829d6fb26a790cb47673c8909d4273d1afe', 1, 1517743738);
INSERT INTO `rk_picture` VALUES (146, '/uploads/picture/20180204/295441c1af73637cac5c6b91be6b347c.png', '/uploads/picture/20180204/295441c1af73637cac5c6b91be6b347c.png', 'c04c870f17f7e1396f27229b73fc54f5', 'ba8df4544cdc62ae6ce80adc9c40f75a3e999329', 1, 1517743876);
INSERT INTO `rk_picture` VALUES (147, '/uploads/picture/20180204/c4573cef0c612637ef747b597ab8f614.png', '/uploads/picture/20180204/c4573cef0c612637ef747b597ab8f614.png', 'c04c870f17f7e1396f27229b73fc54f5', 'ba8df4544cdc62ae6ce80adc9c40f75a3e999329', 1, 1517743949);
INSERT INTO `rk_picture` VALUES (148, '/uploads/picture/20180204/01fdc80c377114ee7b012ff71848a016.png', '/uploads/picture/20180204/01fdc80c377114ee7b012ff71848a016.png', 'b43c8af67e79c89173ecabacc926d38f', 'a50c8dae673403dfea8a8e1f30ae50a152e1ade7', 1, 1517746660);
INSERT INTO `rk_picture` VALUES (149, '/uploads/picture/20180204/817333465f56d4a42266ffc46181c678.png', '/uploads/picture/20180204/817333465f56d4a42266ffc46181c678.png', 'f2fc476e3156c00e3b436376a6dd8714', '7979540afb5c9fa69fe5d67f6f467455b69104e2', 1, 1517746736);
INSERT INTO `rk_picture` VALUES (150, '/uploads/picture/20180204/9f9f179d0cb7f35577ae8a2ca8a72ee4.png', '/uploads/picture/20180204/9f9f179d0cb7f35577ae8a2ca8a72ee4.png', 'f2fc476e3156c00e3b436376a6dd8714', '7979540afb5c9fa69fe5d67f6f467455b69104e2', 1, 1517746838);
INSERT INTO `rk_picture` VALUES (151, '/uploads/picture/20180204/46b336307df2de391175a6709f5da00b.png', '/uploads/picture/20180204/46b336307df2de391175a6709f5da00b.png', '29468c2ec6499e384af0f222e36d26e2', '87953bdb31d973abcd795d2577a28a32f981d87b', 1, 1517746853);
INSERT INTO `rk_picture` VALUES (152, '/uploads/picture/20180204/02cb2a32485c4b0eda50c2e347d3cb56.png', '/uploads/picture/20180204/02cb2a32485c4b0eda50c2e347d3cb56.png', 'a7b7bef52fbc944f57808d1d56ea3802', 'e4542c840a33501960c37d0570a93cba952bb6ad', 1, 1517746935);
INSERT INTO `rk_picture` VALUES (153, '/uploads/picture/20180204/50da1b1232e71779111abde29cd83218.png', '/uploads/picture/20180204/50da1b1232e71779111abde29cd83218.png', 'ae428e4db566fe01a2d026427743d4a3', 'f5c6f31f2ae3413ad47fcee5bbe13be7e5c13778', 1, 1517747024);
INSERT INTO `rk_picture` VALUES (154, '/uploads/picture/20180204/c37c8acee31e482227e9650bbe94dce7.png', '/uploads/picture/20180204/c37c8acee31e482227e9650bbe94dce7.png', 'ae428e4db566fe01a2d026427743d4a3', 'f5c6f31f2ae3413ad47fcee5bbe13be7e5c13778', 1, 1517747153);
INSERT INTO `rk_picture` VALUES (155, '/uploads/picture/20180204/c2467e068c7ed37568793d6a8ec75bda.png', '/uploads/picture/20180204/c2467e068c7ed37568793d6a8ec75bda.png', 'b00bf33efa541819a7f99adeb2ff1316', 'd8091c8a1c307a1313a23c59ba8c0128cce53652', 1, 1517747163);
INSERT INTO `rk_picture` VALUES (156, '/uploads/picture/20180204/5d9aec65ecb878542025c536978b99ac.png', '/uploads/picture/20180204/5d9aec65ecb878542025c536978b99ac.png', '232d632cd24560f4561fda70dedeeac1', 'a31d4dcb8a486086b1d419f52efe4b3283cd61b1', 1, 1517747295);
INSERT INTO `rk_picture` VALUES (157, './uploads/picture/20180205/1517803297.jpg', './uploads/picture/20180205/1517803297.jpg', '', '', 1, 1517803297);
INSERT INTO `rk_picture` VALUES (158, './uploads/picture/20180205/1517819563.jpg', './uploads/picture/20180205/1517819563.jpg', '', '', 1, 1517819563);
INSERT INTO `rk_picture` VALUES (159, './uploads/picture/20180205/1517819935.jpg', './uploads/picture/20180205/1517819935.jpg', '', '', 1, 1517819935);
INSERT INTO `rk_picture` VALUES (160, './uploads/picture/20180205/1517825237.jpg', './uploads/picture/20180205/1517825237.jpg', '', '', 1, 1517825237);
INSERT INTO `rk_picture` VALUES (161, './uploads/picture/20180206/1517881001.jpg', './uploads/picture/20180206/1517881001.jpg', '', '', 1, 1517881001);
INSERT INTO `rk_picture` VALUES (162, './uploads/picture/20180206/1517900972.jpg', './uploads/picture/20180206/1517900972.jpg', '', '', 1, 1517900972);
INSERT INTO `rk_picture` VALUES (163, './uploads/picture/20180206/1517901290.jpg', './uploads/picture/20180206/1517901290.jpg', '', '', 1, 1517901290);
INSERT INTO `rk_picture` VALUES (164, './uploads/picture/20180206/1517903703.jpg', './uploads/picture/20180206/1517903703.jpg', '', '', 1, 1517903703);
INSERT INTO `rk_picture` VALUES (165, './uploads/picture/20180206/1517906094.jpg', './uploads/picture/20180206/1517906094.jpg', '', '', 1, 1517906094);
INSERT INTO `rk_picture` VALUES (166, './uploads/picture/20180206/1517906145.jpg', './uploads/picture/20180206/1517906145.jpg', '', '', 1, 1517906145);
INSERT INTO `rk_picture` VALUES (167, './uploads/picture/20180206/1517908426.jpg', './uploads/picture/20180206/1517908426.jpg', '', '', 1, 1517908426);
INSERT INTO `rk_picture` VALUES (168, './uploads/picture/20180206/1517908790.jpg', './uploads/picture/20180206/1517908790.jpg', '', '', 1, 1517908790);
INSERT INTO `rk_picture` VALUES (169, './uploads/picture/20180206/1517909846.jpg', './uploads/picture/20180206/1517909846.jpg', '', '', 1, 1517909846);
INSERT INTO `rk_picture` VALUES (170, './uploads/picture/20180206/1517911538.jpg', './uploads/picture/20180206/1517911538.jpg', '', '', 1, 1517911538);
INSERT INTO `rk_picture` VALUES (171, './uploads/picture/20180206/1517911560.jpg', './uploads/picture/20180206/1517911560.jpg', '', '', 1, 1517911560);
INSERT INTO `rk_picture` VALUES (172, './uploads/picture/20180206/1517911865.jpg', './uploads/picture/20180206/1517911865.jpg', '', '', 1, 1517911865);
INSERT INTO `rk_picture` VALUES (173, './uploads/picture/20180206/1517912170.jpg', './uploads/picture/20180206/1517912170.jpg', '', '', 1, 1517912170);
INSERT INTO `rk_picture` VALUES (174, './uploads/picture/20180207/1517970711.jpg', './uploads/picture/20180207/1517970711.jpg', '', '', 1, 1517970711);
INSERT INTO `rk_picture` VALUES (175, '/uploads/picture/20180207/151799289495.jpeg', '/uploads/picture/20180207/151799289495.jpeg', '', '', 1, 1517992894);
INSERT INTO `rk_picture` VALUES (176, '/uploads/picture/20180207/151799305761.jpeg', '/uploads/picture/20180207/151799305761.jpeg', '', '', 1, 1517993057);
INSERT INTO `rk_picture` VALUES (177, '/uploads/picture/20180207/151799461853.png', '/uploads/picture/20180207/151799461853.png', '', '', 1, 1517994619);
INSERT INTO `rk_picture` VALUES (178, '/uploads/picture/20180207/151799467239.png', '/uploads/picture/20180207/151799467239.png', '', '', 1, 1517994672);
INSERT INTO `rk_picture` VALUES (179, '/uploads/picture/20180207/151799473019.png', '/uploads/picture/20180207/151799473019.png', '', '', 1, 1517994730);
INSERT INTO `rk_picture` VALUES (180, '/uploads/picture/20180207/151799474677.png', '/uploads/picture/20180207/151799474677.png', '', '', 1, 1517994747);
INSERT INTO `rk_picture` VALUES (181, '/uploads/picture/20180207/151799476098.png', '/uploads/picture/20180207/151799476098.png', '', '', 1, 1517994760);
INSERT INTO `rk_picture` VALUES (182, '/uploads/picture/20180207/151801317591.png', '/uploads/picture/20180207/151801317591.png', '', '', 1, 1518013176);
INSERT INTO `rk_picture` VALUES (183, '/uploads/picture/20180207/15180131875.png', '/uploads/picture/20180207/15180131875.png', '', '', 1, 1518013187);
INSERT INTO `rk_picture` VALUES (184, '/uploads/picture/20180207/151801320513.png', '/uploads/picture/20180207/151801320513.png', '', '', 1, 1518013205);
INSERT INTO `rk_picture` VALUES (185, '/uploads/picture/20180207/151801361125.png', '/uploads/picture/20180207/151801361125.png', '', '', 1, 1518013612);
INSERT INTO `rk_picture` VALUES (186, '/uploads/picture/20180207/151801363227.png', '/uploads/picture/20180207/151801363227.png', '', '', 1, 1518013633);
INSERT INTO `rk_picture` VALUES (187, '/uploads/picture/20180207/151801365074.png', '/uploads/picture/20180207/151801365074.png', '', '', 1, 1518013650);
INSERT INTO `rk_picture` VALUES (188, '/uploads/picture/20180207/151801500638.png', '/uploads/picture/20180207/151801500638.png', '', '', 1, 1518015006);
INSERT INTO `rk_picture` VALUES (189, '/uploads/picture/20180207/151801502282.png', '/uploads/picture/20180207/151801502282.png', '', '', 1, 1518015022);
INSERT INTO `rk_picture` VALUES (190, '/uploads/picture/20180207/151801505024.png', '/uploads/picture/20180207/151801505024.png', '', '', 1, 1518015050);
INSERT INTO `rk_picture` VALUES (191, '/uploads/picture/20180207/151801741933.png', '/uploads/picture/20180207/151801741933.png', '', '', 1, 1518017419);
INSERT INTO `rk_picture` VALUES (192, '/uploads/picture/20180207/151801743866.png', '/uploads/picture/20180207/151801743866.png', '', '', 1, 1518017438);
INSERT INTO `rk_picture` VALUES (193, '/uploads/picture/20180207/151801745265.png', '/uploads/picture/20180207/151801745265.png', '', '', 1, 1518017452);
INSERT INTO `rk_picture` VALUES (194, '/uploads/picture/20180208/151805603158.png', '/uploads/picture/20180208/151805603158.png', '', '', 1, 1518056031);
INSERT INTO `rk_picture` VALUES (195, '/uploads/picture/20180208/151805605036.png', '/uploads/picture/20180208/151805605036.png', '', '', 1, 1518056050);
INSERT INTO `rk_picture` VALUES (196, '/uploads/picture/20180208/1518056071100.png', '/uploads/picture/20180208/1518056071100.png', '', '', 1, 1518056071);
INSERT INTO `rk_picture` VALUES (197, './uploads/picture/20180208/1518061409.jpg', './uploads/picture/20180208/1518061409.jpg', '', '', 1, 1518061409);
INSERT INTO `rk_picture` VALUES (198, './uploads/picture/20180208/1518061623.jpg', './uploads/picture/20180208/1518061623.jpg', '', '', 1, 1518061623);
INSERT INTO `rk_picture` VALUES (199, './uploads/picture/20180208/1518061888.jpg', './uploads/picture/20180208/1518061888.jpg', '', '', 1, 1518061888);
INSERT INTO `rk_picture` VALUES (1117, '/uploads/picture/20180320/620e53d863f33cb4743721bc78f92056.png', '/uploads/picture/20180320/620e53d863f33cb4743721bc78f92056.png', '', '', 1, 1521506178);
INSERT INTO `rk_picture` VALUES (201, '/uploads/picture/20180208/151807891763.png', '/uploads/picture/20180208/151807891763.png', '', '', 1, 1518078917);
INSERT INTO `rk_picture` VALUES (202, '/uploads/picture/20180208/151807893415.png', '/uploads/picture/20180208/151807893415.png', '', '', 1, 1518078934);
INSERT INTO `rk_picture` VALUES (203, '/uploads/picture/20180208/151809279489.png', '/uploads/picture/20180208/151809279489.png', '', '', 1, 1518092794);
INSERT INTO `rk_picture` VALUES (204, '/uploads/picture/20180208/151809283453.png', '/uploads/picture/20180208/151809283453.png', '', '', 1, 1518092834);
INSERT INTO `rk_picture` VALUES (205, '/uploads/picture/20180209/151814488533.png', '/uploads/picture/20180209/151814488533.png', '', '', 1, 1518144885);
INSERT INTO `rk_picture` VALUES (206, '/uploads/picture/20180209/151814493123.png', '/uploads/picture/20180209/151814493123.png', '', '', 1, 1518144932);
INSERT INTO `rk_picture` VALUES (207, '/uploads/picture/20180209/151814495986.png', '/uploads/picture/20180209/151814495986.png', '', '', 1, 1518144959);
INSERT INTO `rk_picture` VALUES (208, '/uploads/picture/20180209/151814499077.png', '/uploads/picture/20180209/151814499077.png', '', '', 1, 1518144990);
INSERT INTO `rk_picture` VALUES (209, '/uploads/picture/20180209/151816265949.png', '/uploads/picture/20180209/151816265949.png', '', '', 1, 1518162659);
INSERT INTO `rk_picture` VALUES (210, '/uploads/picture/20180209/151816272927.png', '/uploads/picture/20180209/151816272927.png', '', '', 1, 1518162729);
INSERT INTO `rk_picture` VALUES (211, '/uploads/picture/20180209/151816275015.png', '/uploads/picture/20180209/151816275015.png', '', '', 1, 1518162751);
INSERT INTO `rk_picture` VALUES (212, '/uploads/picture/20180209/151816279986.png', '/uploads/picture/20180209/151816279986.png', '', '', 1, 1518162800);
INSERT INTO `rk_picture` VALUES (213, '/uploads/picture/20180209/151816285119.png', '/uploads/picture/20180209/151816285119.png', '', '', 1, 1518162851);
INSERT INTO `rk_picture` VALUES (214, '/uploads/picture/20180209/151816287283.png', '/uploads/picture/20180209/151816287283.png', '', '', 1, 1518162872);
INSERT INTO `rk_picture` VALUES (215, './uploads/picture/20180209/1518173031.jpg', './uploads/picture/20180209/1518173031.jpg', '', '', 1, 1518173031);
INSERT INTO `rk_picture` VALUES (216, '/uploads/picture/20180209/151818488848.jpeg', '/uploads/picture/20180209/151818488848.jpeg', '', '', 1, 1518184889);
INSERT INTO `rk_picture` VALUES (217, './uploads/picture/20180210/1518237727.jpg', './uploads/picture/20180210/1518237727.jpg', '', '', 1, 1518237727);
INSERT INTO `rk_picture` VALUES (218, './uploads/picture/20180210/1518238060.jpg', './uploads/picture/20180210/1518238060.jpg', '', '', 1, 1518238060);
INSERT INTO `rk_picture` VALUES (219, '/uploads/picture/20180210/151826766185.png', '/uploads/picture/20180210/151826766185.png', '', '', 1, 1518267661);
INSERT INTO `rk_picture` VALUES (220, '/uploads/picture/20180210/151826771154.png', '/uploads/picture/20180210/151826771154.png', '', '', 1, 1518267711);
INSERT INTO `rk_picture` VALUES (221, './uploads/picture/20180210/1518267932.jpg', './uploads/picture/20180210/1518267932.jpg', '', '', 1, 1518267932);
INSERT INTO `rk_picture` VALUES (222, './uploads/picture/20180210/1518267945.jpg', './uploads/picture/20180210/1518267945.jpg', '', '', 1, 1518267945);
INSERT INTO `rk_picture` VALUES (223, './uploads/picture/20180211/1518330034.jpg', './uploads/picture/20180211/1518330034.jpg', '', '', 1, 1518330034);
INSERT INTO `rk_picture` VALUES (224, './uploads/picture/20180211/1518330355.jpg', './uploads/picture/20180211/1518330355.jpg', '', '', 1, 1518330355);
INSERT INTO `rk_picture` VALUES (225, './uploads/picture/20180211/1518345431.jpg', './uploads/picture/20180211/1518345431.jpg', '', '', 1, 1518345431);
INSERT INTO `rk_picture` VALUES (226, './uploads/picture/20180211/1518348259.jpg', './uploads/picture/20180211/1518348259.jpg', '', '', 1, 1518348259);
INSERT INTO `rk_picture` VALUES (227, './uploads/picture/20180211/1518348350.jpg', './uploads/picture/20180211/1518348350.jpg', '', '', 1, 1518348350);
INSERT INTO `rk_picture` VALUES (228, './uploads/picture/20180211/1518348484.jpg', './uploads/picture/20180211/1518348484.jpg', '', '', 1, 1518348484);
INSERT INTO `rk_picture` VALUES (229, './uploads/picture/20180211/1518351820.jpg', './uploads/picture/20180211/1518351820.jpg', '', '', 1, 1518351820);
INSERT INTO `rk_picture` VALUES (230, './uploads/picture/20180211/1518351889.jpg', './uploads/picture/20180211/1518351889.jpg', '', '', 1, 1518351889);
INSERT INTO `rk_picture` VALUES (231, './uploads/picture/20180211/1518352102.jpg', './uploads/picture/20180211/1518352102.jpg', '', '', 1, 1518352102);
INSERT INTO `rk_picture` VALUES (232, './uploads/picture/20180212/1518391692.jpg', './uploads/picture/20180212/1518391692.jpg', '', '', 1, 1518391692);
INSERT INTO `rk_picture` VALUES (233, './uploads/picture/20180212/1518391785.jpg', './uploads/picture/20180212/1518391785.jpg', '', '', 1, 1518391785);
INSERT INTO `rk_picture` VALUES (234, './uploads/picture/20180212/1518391846.jpg', './uploads/picture/20180212/1518391846.jpg', '', '', 1, 1518391846);
INSERT INTO `rk_picture` VALUES (235, './uploads/picture/20180213/1518494061.jpg', './uploads/picture/20180213/1518494061.jpg', '', '', 1, 1518494061);
INSERT INTO `rk_picture` VALUES (236, './uploads/picture/20180213/1518494077.jpg', './uploads/picture/20180213/1518494077.jpg', '', '', 1, 1518494077);
INSERT INTO `rk_picture` VALUES (237, './uploads/picture/20180214/1518573776.jpg', './uploads/picture/20180214/1518573776.jpg', '', '', 1, 1518573776);
INSERT INTO `rk_picture` VALUES (238, './uploads/picture/20180214/1518575758.jpg', './uploads/picture/20180214/1518575758.jpg', '', '', 1, 1518575758);
INSERT INTO `rk_picture` VALUES (239, './uploads/picture/20180214/1518576027.jpg', './uploads/picture/20180214/1518576027.jpg', '', '', 1, 1518576027);
INSERT INTO `rk_picture` VALUES (240, './uploads/picture/20180214/1518576244.jpg', './uploads/picture/20180214/1518576244.jpg', '', '', 1, 1518576244);
INSERT INTO `rk_picture` VALUES (241, './uploads/picture/20180214/1518576419.jpg', './uploads/picture/20180214/1518576419.jpg', '', '', 1, 1518576419);
INSERT INTO `rk_picture` VALUES (242, './uploads/picture/20180214/1518577460.jpg', './uploads/picture/20180214/1518577460.jpg', '', '', 1, 1518577460);
INSERT INTO `rk_picture` VALUES (243, './uploads/picture/20180214/1518577574.jpg', './uploads/picture/20180214/1518577574.jpg', '', '', 1, 1518577574);
INSERT INTO `rk_picture` VALUES (244, './uploads/picture/20180214/1518578309.jpg', './uploads/picture/20180214/1518578309.jpg', '', '', 1, 1518578309);
INSERT INTO `rk_picture` VALUES (245, './uploads/picture/20180214/1518578910.jpg', './uploads/picture/20180214/1518578910.jpg', '', '', 1, 1518578910);
INSERT INTO `rk_picture` VALUES (246, './uploads/picture/20180214/1518579361.jpg', './uploads/picture/20180214/1518579361.jpg', '', '', 1, 1518579361);
INSERT INTO `rk_picture` VALUES (247, './uploads/picture/20180214/1518586585.jpg', './uploads/picture/20180214/1518586585.jpg', '', '', 1, 1518586585);
INSERT INTO `rk_picture` VALUES (248, '/uploads/picture/20180214/95f18319b6556826210f4516412f9ef4.jpg', '/uploads/picture/20180214/95f18319b6556826210f4516412f9ef4.jpg', '86442b4396a39044fb1537e0e3d3e855', 'cbbaef5eec85f2610b802d5bc15fd0c9814de1e0', 1, 1518588039);
INSERT INTO `rk_picture` VALUES (249, './uploads/picture/20180214/1518588761.jpg', './uploads/picture/20180214/1518588761.jpg', '', '', 1, 1518588761);
INSERT INTO `rk_picture` VALUES (250, './uploads/picture/20180214/1518588852.jpg', './uploads/picture/20180214/1518588852.jpg', '', '', 1, 1518588852);
INSERT INTO `rk_picture` VALUES (251, './uploads/picture/20180214/1518589185.jpg', './uploads/picture/20180214/1518589185.jpg', '', '', 1, 1518589185);
INSERT INTO `rk_picture` VALUES (252, './uploads/picture/20180214/1518618901.jpg', './uploads/picture/20180214/1518618901.jpg', '', '', 1, 1518618901);
INSERT INTO `rk_picture` VALUES (253, './uploads/picture/20180214/1518619105.jpg', './uploads/picture/20180214/1518619105.jpg', '', '', 1, 1518619105);
INSERT INTO `rk_picture` VALUES (254, './uploads/picture/20180215/1518650086.jpg', './uploads/picture/20180215/1518650086.jpg', '', '', 1, 1518650086);
INSERT INTO `rk_picture` VALUES (255, './uploads/picture/20180215/1518650150.jpg', './uploads/picture/20180215/1518650150.jpg', '', '', 1, 1518650150);
INSERT INTO `rk_picture` VALUES (256, './uploads/picture/20180215/1518650154.jpg', './uploads/picture/20180215/1518650154.jpg', '', '', 1, 1518650154);
INSERT INTO `rk_picture` VALUES (257, './uploads/picture/20180215/1518650155.jpg', './uploads/picture/20180215/1518650155.jpg', '', '', 1, 1518650155);
INSERT INTO `rk_picture` VALUES (258, './uploads/picture/20180215/1518650156.jpg', './uploads/picture/20180215/1518650156.jpg', '', '', 1, 1518650156);
INSERT INTO `rk_picture` VALUES (259, './uploads/picture/20180215/1518650160.jpg', './uploads/picture/20180215/1518650160.jpg', '', '', 1, 1518650160);
INSERT INTO `rk_picture` VALUES (260, './uploads/picture/20180215/1518650161.jpg', './uploads/picture/20180215/1518650161.jpg', '', '', 1, 1518650161);
INSERT INTO `rk_picture` VALUES (261, './uploads/picture/20180215/1518650161fuben.jpg', './uploads/picture/20180215/1518650161fuben.jpg', '', '', 1, 1518650161);
INSERT INTO `rk_picture` VALUES (262, './uploads/picture/20180215/1518650162.jpg', './uploads/picture/20180215/1518650162.jpg', '', '', 1, 1518650162);
INSERT INTO `rk_picture` VALUES (263, './uploads/picture/20180215/1518650162fuben.jpg', './uploads/picture/20180215/1518650162fuben.jpg', '', '', 1, 1518650162);
INSERT INTO `rk_picture` VALUES (264, './uploads/picture/20180215/1518650162fuben.jpg', './uploads/picture/20180215/1518650162fuben.jpg', '', '', 1, 1518650162);
INSERT INTO `rk_picture` VALUES (265, './uploads/picture/20180215/1518650163.jpg', './uploads/picture/20180215/1518650163.jpg', '', '', 1, 1518650163);
INSERT INTO `rk_picture` VALUES (266, './uploads/picture/20180215/1518650163fuben.jpg', './uploads/picture/20180215/1518650163fuben.jpg', '', '', 1, 1518650163);
INSERT INTO `rk_picture` VALUES (267, './uploads/picture/20180215/1518650170.jpg', './uploads/picture/20180215/1518650170.jpg', '', '', 1, 1518650170);
INSERT INTO `rk_picture` VALUES (268, './uploads/picture/20180215/1518650170fuben.jpg', './uploads/picture/20180215/1518650170fuben.jpg', '', '', 1, 1518650170);
INSERT INTO `rk_picture` VALUES (269, './uploads/picture/20180215/1518650178.jpg', './uploads/picture/20180215/1518650178.jpg', '', '', 1, 1518650178);
INSERT INTO `rk_picture` VALUES (270, './uploads/picture/20180215/1518650178fuben.jpg', './uploads/picture/20180215/1518650178fuben.jpg', '', '', 1, 1518650178);
INSERT INTO `rk_picture` VALUES (271, './uploads/picture/20180215/1518650179.jpg', './uploads/picture/20180215/1518650179.jpg', '', '', 1, 1518650179);
INSERT INTO `rk_picture` VALUES (272, './uploads/picture/20180215/1518650179fuben.jpg', './uploads/picture/20180215/1518650179fuben.jpg', '', '', 1, 1518650179);
INSERT INTO `rk_picture` VALUES (273, './uploads/picture/20180215/1518650179fuben.jpg', './uploads/picture/20180215/1518650179fuben.jpg', '', '', 1, 1518650179);
INSERT INTO `rk_picture` VALUES (274, './uploads/picture/20180215/1518650197.jpg', './uploads/picture/20180215/1518650197.jpg', '', '', 1, 1518650197);
INSERT INTO `rk_picture` VALUES (275, './uploads/picture/20180215/1518650903.jpg', './uploads/picture/20180215/1518650903.jpg', '', '', 1, 1518650903);
INSERT INTO `rk_picture` VALUES (276, './uploads/picture/20180215/1518651998.jpg', './uploads/picture/20180215/1518651998.jpg', '', '', 1, 1518651998);
INSERT INTO `rk_picture` VALUES (277, './uploads/picture/20180215/1518666021.jpg', './uploads/picture/20180215/1518666021.jpg', '', '', 1, 1518666021);
INSERT INTO `rk_picture` VALUES (278, './uploads/picture/20180215/1518686081.jpg', './uploads/picture/20180215/1518686081.jpg', '', '', 1, 1518686081);
INSERT INTO `rk_picture` VALUES (279, './uploads/picture/20180218/1518937497.jpg', './uploads/picture/20180218/1518937497.jpg', '', '', 1, 1518937497);
INSERT INTO `rk_picture` VALUES (280, './uploads/picture/20180218/1518937673.jpg', './uploads/picture/20180218/1518937673.jpg', '', '', 1, 1518937673);
INSERT INTO `rk_picture` VALUES (281, './uploads/picture/20180218/1518938235.jpg', './uploads/picture/20180218/1518938235.jpg', '', '', 1, 1518938235);
INSERT INTO `rk_picture` VALUES (282, './uploads/picture/20180218/1518938424.jpg', './uploads/picture/20180218/1518938424.jpg', '', '', 1, 1518938424);
INSERT INTO `rk_picture` VALUES (283, './uploads/picture/20180220/1519093448.jpg', './uploads/picture/20180220/1519093448.jpg', '', '', 1, 1519093448);
INSERT INTO `rk_picture` VALUES (284, './uploads/picture/20180221/1519189292.jpg', './uploads/picture/20180221/1519189292.jpg', '', '', 1, 1519189292);
INSERT INTO `rk_picture` VALUES (285, './uploads/picture/20180221/1519194779.jpg', './uploads/picture/20180221/1519194779.jpg', '', '', 1, 1519194779);
INSERT INTO `rk_picture` VALUES (286, './uploads/picture/20180221/1519194781.jpg', './uploads/picture/20180221/1519194781.jpg', '', '', 1, 1519194781);
INSERT INTO `rk_picture` VALUES (287, './uploads/picture/20180221/1519194784.jpg', './uploads/picture/20180221/1519194784.jpg', '', '', 1, 1519194784);
INSERT INTO `rk_picture` VALUES (288, './uploads/picture/20180221/1519194786.jpg', './uploads/picture/20180221/1519194786.jpg', '', '', 1, 1519194786);
INSERT INTO `rk_picture` VALUES (289, './uploads/picture/20180221/1519194786fuben.jpg', './uploads/picture/20180221/1519194786fuben.jpg', '', '', 1, 1519194786);
INSERT INTO `rk_picture` VALUES (290, './uploads/picture/20180221/1519194787.jpg', './uploads/picture/20180221/1519194787.jpg', '', '', 1, 1519194787);
INSERT INTO `rk_picture` VALUES (291, './uploads/picture/20180221/1519194787fuben.jpg', './uploads/picture/20180221/1519194787fuben.jpg', '', '', 1, 1519194787);
INSERT INTO `rk_picture` VALUES (292, './uploads/picture/20180221/1519194788.jpg', './uploads/picture/20180221/1519194788.jpg', '', '', 1, 1519194788);
INSERT INTO `rk_picture` VALUES (293, './uploads/picture/20180221/1519194788fuben.jpg', './uploads/picture/20180221/1519194788fuben.jpg', '', '', 1, 1519194788);
INSERT INTO `rk_picture` VALUES (294, './uploads/picture/20180221/1519194793.jpg', './uploads/picture/20180221/1519194793.jpg', '', '', 1, 1519194793);
INSERT INTO `rk_picture` VALUES (295, './uploads/picture/20180221/1519194801.jpg', './uploads/picture/20180221/1519194801.jpg', '', '', 1, 1519194801);
INSERT INTO `rk_picture` VALUES (296, './uploads/picture/20180221/1519194801fuben.jpg', './uploads/picture/20180221/1519194801fuben.jpg', '', '', 1, 1519194801);
INSERT INTO `rk_picture` VALUES (297, './uploads/picture/20180221/1519194801fuben.jpg', './uploads/picture/20180221/1519194801fuben.jpg', '', '', 1, 1519194801);
INSERT INTO `rk_picture` VALUES (298, './uploads/picture/20180221/1519194802.jpg', './uploads/picture/20180221/1519194802.jpg', '', '', 1, 1519194802);
INSERT INTO `rk_picture` VALUES (299, './uploads/picture/20180221/1519194802fuben.jpg', './uploads/picture/20180221/1519194802fuben.jpg', '', '', 1, 1519194802);
INSERT INTO `rk_picture` VALUES (300, './uploads/picture/20180221/1519194802fuben.jpg', './uploads/picture/20180221/1519194802fuben.jpg', '', '', 1, 1519194802);
INSERT INTO `rk_picture` VALUES (301, './uploads/picture/20180221/1519194803.jpg', './uploads/picture/20180221/1519194803.jpg', '', '', 1, 1519194803);
INSERT INTO `rk_picture` VALUES (302, './uploads/picture/20180221/1519194831.jpg', './uploads/picture/20180221/1519194831.jpg', '', '', 1, 1519194831);
INSERT INTO `rk_picture` VALUES (303, './uploads/picture/20180221/1519194833.jpg', './uploads/picture/20180221/1519194833.jpg', '', '', 1, 1519194833);
INSERT INTO `rk_picture` VALUES (304, './uploads/picture/20180221/1519194833fuben.jpg', './uploads/picture/20180221/1519194833fuben.jpg', '', '', 1, 1519194833);
INSERT INTO `rk_picture` VALUES (305, './uploads/picture/20180221/1519194834.jpg', './uploads/picture/20180221/1519194834.jpg', '', '', 1, 1519194834);
INSERT INTO `rk_picture` VALUES (306, './uploads/picture/20180222/1519274715.jpg', './uploads/picture/20180222/1519274715.jpg', '', '', 1, 1519274715);
INSERT INTO `rk_picture` VALUES (307, './uploads/picture/20180222/1519274778.jpg', './uploads/picture/20180222/1519274778.jpg', '', '', 1, 1519274778);
INSERT INTO `rk_picture` VALUES (308, './uploads/picture/20180222/1519274778fuben.jpg', './uploads/picture/20180222/1519274778fuben.jpg', '', '', 1, 1519274778);
INSERT INTO `rk_picture` VALUES (309, '/uploads/picture/20180224/151943977518.png', '/uploads/picture/20180224/151943977518.png', '', '', 1, 1519439775);
INSERT INTO `rk_picture` VALUES (310, '/uploads/picture/20180224/151943982452.png', '/uploads/picture/20180224/151943982452.png', '', '', 1, 1519439824);
INSERT INTO `rk_picture` VALUES (311, '/uploads/picture/20180224/151943987392.png', '/uploads/picture/20180224/151943987392.png', '', '', 1, 1519439873);
INSERT INTO `rk_picture` VALUES (312, '/uploads/picture/20180224/1519439962.jpg', '/uploads/picture/20180224/1519439962.jpg', '', '', 1, 1519439962);
INSERT INTO `rk_picture` VALUES (313, '/uploads/picture/20180224/15194440428.png', '/uploads/picture/20180224/15194440428.png', '', '', 1, 1519444043);
INSERT INTO `rk_picture` VALUES (314, '/uploads/picture/20180224/151944406834.png', '/uploads/picture/20180224/151944406834.png', '', '', 1, 1519444068);
INSERT INTO `rk_picture` VALUES (315, '/uploads/picture/20180224/151944408019.png', '/uploads/picture/20180224/151944408019.png', '', '', 1, 1519444080);
INSERT INTO `rk_picture` VALUES (316, '/uploads/picture/20180226/f6f697ddcbe4af28c309ddfe43d5e395.png', '/uploads/picture/20180226/f6f697ddcbe4af28c309ddfe43d5e395.png', 'c7597e196e445c74223e434b471de0dc', '6b4772c2d90f4db5b2f1eca13285586fc655cad8', 1, 1519614240);
INSERT INTO `rk_picture` VALUES (2610, '/uploads/picture/20180529/27e562ac48e50e839cec981a9cd4900b.jpg', '/uploads/picture/20180529/27e562ac48e50e839cec981a9cd4900b.jpg', 'f9bf905b48db540049444f8da1ee6395', '89a0808d564677eda101a20a4d0ac40edd911895', 1, 1527592486);
INSERT INTO `rk_picture` VALUES (318, '/uploads/picture/20180228/9069171142149ecaf897a21252aeebf5.jpg', '/uploads/picture/20180228/9069171142149ecaf897a21252aeebf5.jpg', 'f27ed645c5c856e1ec2bdfd13f97d374', '2d42e537656f402956f4605bd375399ce1ee36fe', 1, 1519784841);
INSERT INTO `rk_picture` VALUES (319, '/uploads/picture/20180228/ec807e6c737d266ec923f67339ed4855.jpg', '/uploads/picture/20180228/ec807e6c737d266ec923f67339ed4855.jpg', '0518eab0ee4b4d6630d2ba06d7e8e7b3', '0c6c68d566f727c4cf7d5bc9b3e2791e76f706e0', 1, 1519784851);
INSERT INTO `rk_picture` VALUES (320, './uploads/picture/20180228/1519802628.jpg', './uploads/picture/20180228/1519802628.jpg', '', '', 1, 1519802628);
INSERT INTO `rk_picture` VALUES (321, './uploads/picture/20180228/1519804978.jpg', './uploads/picture/20180228/1519804978.jpg', '', '', 1, 1519804978);
INSERT INTO `rk_picture` VALUES (322, './uploads/picture/20180228/1519830683.jpg', './uploads/picture/20180228/1519830683.jpg', '', '', 1, 1519830683);
INSERT INTO `rk_picture` VALUES (323, './uploads/picture/20180228/1519831581.jpg', './uploads/picture/20180228/1519831581.jpg', '', '', 1, 1519831581);
INSERT INTO `rk_picture` VALUES (324, './uploads/picture/20180301/1519866986.jpg', './uploads/picture/20180301/1519866986.jpg', '', '', 1, 1519866986);
INSERT INTO `rk_picture` VALUES (325, './uploads/picture/20180301/1519867297.jpg', './uploads/picture/20180301/1519867297.jpg', '', '', 1, 1519867297);
INSERT INTO `rk_picture` VALUES (326, './uploads/picture/20180301/1519873441.jpg', './uploads/picture/20180301/1519873441.jpg', '', '', 1, 1519873441);
INSERT INTO `rk_picture` VALUES (327, './uploads/picture/20180301/1519885030.jpg', './uploads/picture/20180301/1519885030.jpg', '', '', 1, 1519885030);
INSERT INTO `rk_picture` VALUES (328, './uploads/picture/20180301/1519886782.jpg', './uploads/picture/20180301/1519886782.jpg', '', '', 1, 1519886782);
INSERT INTO `rk_picture` VALUES (329, './uploads/picture/20180301/1519887931.jpg', './uploads/picture/20180301/1519887931.jpg', '', '', 1, 1519887931);
INSERT INTO `rk_picture` VALUES (330, './uploads/picture/20180301/1519889130.jpg', './uploads/picture/20180301/1519889130.jpg', '', '', 1, 1519889130);
INSERT INTO `rk_picture` VALUES (331, './uploads/picture/20180301/1519889206.jpg', './uploads/picture/20180301/1519889206.jpg', '', '', 1, 1519889206);
INSERT INTO `rk_picture` VALUES (332, './uploads/picture/20180301/1519890318.jpg', './uploads/picture/20180301/1519890318.jpg', '', '', 1, 1519890318);
INSERT INTO `rk_picture` VALUES (333, './uploads/picture/20180301/1519890638.jpg', './uploads/picture/20180301/1519890638.jpg', '', '', 1, 1519890638);
INSERT INTO `rk_picture` VALUES (334, './uploads/picture/20180301/1519902260.jpg', './uploads/picture/20180301/1519902260.jpg', '', '', 1, 1519902260);
INSERT INTO `rk_picture` VALUES (335, './uploads/picture/20180301/1519914087.jpg', './uploads/picture/20180301/1519914087.jpg', '', '', 1, 1519914087);
INSERT INTO `rk_picture` VALUES (336, './uploads/picture/20180301/1519914433.jpg', './uploads/picture/20180301/1519914433.jpg', '', '', 1, 1519914433);
INSERT INTO `rk_picture` VALUES (1138, '/uploads/picture/20180320/a8888eabd576dca3ca1436fe11510c84.png', '/uploads/picture/20180320/a8888eabd576dca3ca1436fe11510c84.png', 'c393327f52632a4c49718af5f784e0e8', '7c380602644118a99ae9e8f3cf198f42544c9794', 1, 1521529181);
INSERT INTO `rk_picture` VALUES (338, '/uploads/picture/20180302/15199616256.png', '/uploads/picture/20180302/15199616256.png', '', '', 1, 1519961626);
INSERT INTO `rk_picture` VALUES (340, '/uploads/picture/20180302/151996166618.jpeg', '/uploads/picture/20180302/151996166618.jpeg', '', '', 1, 1519961667);
INSERT INTO `rk_picture` VALUES (341, './uploads/picture/20180302/1519998357.jpg', './uploads/picture/20180302/1519998357.jpg', '', '', 1, 1519998357);
INSERT INTO `rk_picture` VALUES (342, '/uploads/picture/20180303/152006904689.jpeg', '/uploads/picture/20180303/152006904689.jpeg', '', '', 1, 1520069046);
INSERT INTO `rk_picture` VALUES (343, './uploads/picture/20180303/1520073489.jpg', './uploads/picture/20180303/1520073489.jpg', '', '', 1, 1520073489);
INSERT INTO `rk_picture` VALUES (344, '/uploads/picture/20180304/de130c557aa51429b9353b46fd58e236.jpg', '/uploads/picture/20180304/de130c557aa51429b9353b46fd58e236.jpg', '084370cec71974efdd618f7644c1a9c0', '95b3c5004c81dfd5469142f291f095889a0271d6', 1, 1520126345);
INSERT INTO `rk_picture` VALUES (345, '/uploads/picture/20180304/152012715723.jpeg', '/uploads/picture/20180304/152012715723.jpeg', '', '', 1, 1520127157);
INSERT INTO `rk_picture` VALUES (346, './uploads/picture/20180304/1520128192.jpg', './uploads/picture/20180304/1520128192.jpg', '', '', 1, 1520128192);
INSERT INTO `rk_picture` VALUES (347, '/uploads/picture/20180304/3a1cc95a77bbd904d9cb7aa78718ef92.jpg', '/uploads/picture/20180304/3a1cc95a77bbd904d9cb7aa78718ef92.jpg', '084370cec71974efdd618f7644c1a9c0', '95b3c5004c81dfd5469142f291f095889a0271d6', 1, 1520129684);
INSERT INTO `rk_picture` VALUES (348, '/uploads/picture/20180304/152013459829.jpeg', '/uploads/picture/20180304/152013459829.jpeg', '', '', 1, 1520134599);
INSERT INTO `rk_picture` VALUES (349, './uploads/picture/20180304/1520139364.jpg', './uploads/picture/20180304/1520139364.jpg', '', '', 1, 1520139364);
INSERT INTO `rk_picture` VALUES (350, '/uploads/picture/20180304/152014105417.jpeg', '/uploads/picture/20180304/152014105417.jpeg', '', '', 1, 1520141054);
INSERT INTO `rk_picture` VALUES (351, '/uploads/picture/20180305/1520213103.jpg', '/uploads/picture/20180305/1520213103.jpg', '', '', 1, 1520213103);
INSERT INTO `rk_picture` VALUES (352, './uploads/picture/20180305/1520217245.jpg', './uploads/picture/20180305/1520217245.jpg', '', '', 1, 1520217245);
INSERT INTO `rk_picture` VALUES (353, '/uploads/picture/20180305/152024092489.png', '/uploads/picture/20180305/152024092489.png', '', '', 1, 1520240924);
INSERT INTO `rk_picture` VALUES (354, '/uploads/picture/20180305/152024094712.png', '/uploads/picture/20180305/152024094712.png', '', '', 1, 1520240947);
INSERT INTO `rk_picture` VALUES (355, '/uploads/picture/20180305/152024095714.png', '/uploads/picture/20180305/152024095714.png', '', '', 1, 1520240957);
INSERT INTO `rk_picture` VALUES (356, './uploads/picture/20180306/1520325874.jpg', './uploads/picture/20180306/1520325874.jpg', '', '', 1, 1520325874);
INSERT INTO `rk_picture` VALUES (357, '/uploads/picture/20180307/152038761578.png', '/uploads/picture/20180307/152038761578.png', '', '', 1, 1520387615);
INSERT INTO `rk_picture` VALUES (358, '/uploads/picture/20180307/152038766756.png', '/uploads/picture/20180307/152038766756.png', '', '', 1, 1520387667);
INSERT INTO `rk_picture` VALUES (359, '/uploads/picture/20180307/152038777898.png', '/uploads/picture/20180307/152038777898.png', '', '', 1, 1520387778);
INSERT INTO `rk_picture` VALUES (360, '/uploads/picture/20180307/392b0e5593779e9a495680968d41f74d.jpg', '/uploads/picture/20180307/392b0e5593779e9a495680968d41f74d.jpg', '5983cba47f8afcc40747e4986cdc833a', '241891e0ad503ab4f29030dd1ab968f0c7b6be06', 1, 1520410059);
INSERT INTO `rk_picture` VALUES (361, '/uploads/picture/20180307/20180307/87078130d7c4978a849fc19fc9445f53.jpg', '/uploads/picture/20180307/20180307/87078130d7c4978a849fc19fc9445f53.jpg', '', '', 1, 1520415062);
INSERT INTO `rk_picture` VALUES (362, '/uploads/picture/20180307/73031f08c2a9741d7312832bcf7051dd.jpg', '/uploads/picture/20180307/73031f08c2a9741d7312832bcf7051dd.jpg', '', '', 1, 1520415206);
INSERT INTO `rk_picture` VALUES (363, '/uploads/picture/20180307/66f8765e963fd7dda14c3b259142dbb3.jpg', '/uploads/picture/20180307/66f8765e963fd7dda14c3b259142dbb3.jpg', '', '', 1, 1520415673);
INSERT INTO `rk_picture` VALUES (364, '/uploads/picture/20180307/b441e1682df171a40410098a18e5a0e8.jpg', '/uploads/picture/20180307/b441e1682df171a40410098a18e5a0e8.jpg', '', '', 1, 1520429910);
INSERT INTO `rk_picture` VALUES (365, '/uploads/picture/20180307/dc73f68cbd4d94b651e0a4b8cd749918.jpg', '/uploads/picture/20180307/dc73f68cbd4d94b651e0a4b8cd749918.jpg', '', '', 1, 1520429936);
INSERT INTO `rk_picture` VALUES (366, '/uploads/picture/20180307/771b8a6e72f69c41e800c6722ad33b88.jpg', '/uploads/picture/20180307/771b8a6e72f69c41e800c6722ad33b88.jpg', '', '', 1, 1520429948);
INSERT INTO `rk_picture` VALUES (367, '/uploads/picture/20180307/2fc4c1e4fa051b31890734dc13f6c7b3.jpg', '/uploads/picture/20180307/2fc4c1e4fa051b31890734dc13f6c7b3.jpg', '', '', 1, 1520430002);
INSERT INTO `rk_picture` VALUES (368, '/uploads/picture/20180307/152043242116.png', '/uploads/picture/20180307/152043242116.png', '', '', 1, 1520432421);
INSERT INTO `rk_picture` VALUES (369, './uploads/picture/20180308/1520472509.jpg', './uploads/picture/20180308/1520472509.jpg', '', '', 1, 1520472509);
INSERT INTO `rk_picture` VALUES (370, './uploads/picture/20180308/1520476062.jpg', './uploads/picture/20180308/1520476062.jpg', '', '', 1, 1520476062);
INSERT INTO `rk_picture` VALUES (371, './uploads/picture/20180308/1520476523.jpg', './uploads/picture/20180308/1520476523.jpg', '', '', 1, 1520476523);
INSERT INTO `rk_picture` VALUES (372, './uploads/picture/20180308/1520476658.jpg', './uploads/picture/20180308/1520476658.jpg', '', '', 1, 1520476658);
INSERT INTO `rk_picture` VALUES (373, './uploads/picture/20180308/1520477138.jpg', './uploads/picture/20180308/1520477138.jpg', '', '', 1, 1520477138);
INSERT INTO `rk_picture` VALUES (374, './uploads/picture/20180308/1520477270.jpg', './uploads/picture/20180308/1520477270.jpg', '', '', 1, 1520477270);
INSERT INTO `rk_picture` VALUES (375, './uploads/picture/20180308/1520479257.jpg', './uploads/picture/20180308/1520479257.jpg', '', '', 1, 1520479257);
INSERT INTO `rk_picture` VALUES (376, '/uploads/picture/20180308/8bb03785e53683e54c9667edf881db44.jpg', '/uploads/picture/20180308/8bb03785e53683e54c9667edf881db44.jpg', '', '', 1, 1520481875);
INSERT INTO `rk_picture` VALUES (377, '/uploads/picture/20180308/1bb274955ab42f6a0f2ebb59b12aa15e.jpg', '/uploads/picture/20180308/1bb274955ab42f6a0f2ebb59b12aa15e.jpg', '', '', 1, 1520481875);
INSERT INTO `rk_picture` VALUES (378, '/uploads/picture/20180308/b72934d27e02b79157040e1efeffc3de.jpg', '/uploads/picture/20180308/b72934d27e02b79157040e1efeffc3de.jpg', '', '', 1, 1520481875);
INSERT INTO `rk_picture` VALUES (379, '/uploads/picture/20180308/6cb53cf0569fabbb24ec21c53edcea32.jpg', '/uploads/picture/20180308/6cb53cf0569fabbb24ec21c53edcea32.jpg', '', '', 1, 1520481875);
INSERT INTO `rk_picture` VALUES (380, '/uploads/picture/20180308/a80fbbbc1c5e3d3c0544de35dd6d1d58.jpg', '/uploads/picture/20180308/a80fbbbc1c5e3d3c0544de35dd6d1d58.jpg', '', '', 1, 1520481884);
INSERT INTO `rk_picture` VALUES (381, '/uploads/picture/20180308/c80308b3d89cb98d4b1fa2bb049d0b6a.jpg', '/uploads/picture/20180308/c80308b3d89cb98d4b1fa2bb049d0b6a.jpg', '', '', 1, 1520481884);
INSERT INTO `rk_picture` VALUES (382, '/uploads/picture/20180308/d12a503f5feeee5d4c67584d365b64f3.jpg', '/uploads/picture/20180308/d12a503f5feeee5d4c67584d365b64f3.jpg', '', '', 1, 1520481884);
INSERT INTO `rk_picture` VALUES (383, '/uploads/picture/20180308/f54e0d7e687bca4dba438f4ee4fde067.jpg', '/uploads/picture/20180308/f54e0d7e687bca4dba438f4ee4fde067.jpg', '', '', 1, 1520481884);
INSERT INTO `rk_picture` VALUES (384, '/uploads/picture/20180308/61da3e484edb33b14a4143b74277b913.jpg', '/uploads/picture/20180308/61da3e484edb33b14a4143b74277b913.jpg', '', '', 1, 1520481884);
INSERT INTO `rk_picture` VALUES (385, '/uploads/picture/20180308/80716ec522f38777d56ba3e1c18008d2.jpg', '/uploads/picture/20180308/80716ec522f38777d56ba3e1c18008d2.jpg', '', '', 1, 1520481884);
INSERT INTO `rk_picture` VALUES (386, '/uploads/picture/20180308/b5e9a9c9a200467ec66afcad91aa00fa.jpg', '/uploads/picture/20180308/b5e9a9c9a200467ec66afcad91aa00fa.jpg', '', '', 1, 1520481884);
INSERT INTO `rk_picture` VALUES (387, '/uploads/picture/20180308/a9b991ba666bc09ef039243246fb865a.jpg', '/uploads/picture/20180308/a9b991ba666bc09ef039243246fb865a.jpg', '', '', 1, 1520481884);
INSERT INTO `rk_picture` VALUES (388, '/uploads/picture/20180308/884144c552f00185229ed60bcd59076f.jpg', '/uploads/picture/20180308/884144c552f00185229ed60bcd59076f.jpg', '', '', 1, 1520481884);
INSERT INTO `rk_picture` VALUES (389, '/uploads/picture/20180308/88aaa1448a471be269f4ca9af50da48b.jpg', '/uploads/picture/20180308/88aaa1448a471be269f4ca9af50da48b.jpg', '', '', 1, 1520481884);
INSERT INTO `rk_picture` VALUES (390, '/uploads/picture/20180308/1560f733aac399979f8e94fa17030009.jpg', '/uploads/picture/20180308/1560f733aac399979f8e94fa17030009.jpg', '', '', 1, 1520481885);
INSERT INTO `rk_picture` VALUES (391, '/uploads/picture/20180308/17348ab309e9bcec9c4e9d1ebf8feee1.jpg', '/uploads/picture/20180308/17348ab309e9bcec9c4e9d1ebf8feee1.jpg', '', '', 1, 1520481885);
INSERT INTO `rk_picture` VALUES (392, '/uploads/picture/20180308/24dff85d1d2f7a292e43aed84b3f0db8.jpg', '/uploads/picture/20180308/24dff85d1d2f7a292e43aed84b3f0db8.jpg', '', '', 1, 1520481885);
INSERT INTO `rk_picture` VALUES (393, '/uploads/picture/20180308/dfa16ea5c5a9df1a8e07628488435602.jpg', '/uploads/picture/20180308/dfa16ea5c5a9df1a8e07628488435602.jpg', '', '', 1, 1520481885);
INSERT INTO `rk_picture` VALUES (394, '/uploads/picture/20180308/90c2761e70abd8a73289b7da60b3bafe.jpg', '/uploads/picture/20180308/90c2761e70abd8a73289b7da60b3bafe.jpg', '', '', 1, 1520481886);
INSERT INTO `rk_picture` VALUES (395, '/uploads/picture/20180308/57eaa924ba2152f6784e2cf49cd34fd0.jpg', '/uploads/picture/20180308/57eaa924ba2152f6784e2cf49cd34fd0.jpg', '', '', 1, 1520481886);
INSERT INTO `rk_picture` VALUES (396, '/uploads/picture/20180308/ea21d07f6bd547eafccfb5b574d8176a.jpg', '/uploads/picture/20180308/ea21d07f6bd547eafccfb5b574d8176a.jpg', '', '', 1, 1520481886);
INSERT INTO `rk_picture` VALUES (397, '/uploads/picture/20180308/00f24888fc9448172a1f58be1f368a8d.jpg', '/uploads/picture/20180308/00f24888fc9448172a1f58be1f368a8d.jpg', '', '', 1, 1520481886);
INSERT INTO `rk_picture` VALUES (398, '/uploads/picture/20180308/80b8976348a54564ad5d23994495c405.jpg', '/uploads/picture/20180308/80b8976348a54564ad5d23994495c405.jpg', '', '', 1, 1520481886);
INSERT INTO `rk_picture` VALUES (399, '/uploads/picture/20180308/5999d0a66e72a7a16c8f6b5300511ca8.jpg', '/uploads/picture/20180308/5999d0a66e72a7a16c8f6b5300511ca8.jpg', '', '', 1, 1520481887);
INSERT INTO `rk_picture` VALUES (400, '/uploads/picture/20180308/be9cead5aaa8a4beeeaa8418850600c7.jpg', '/uploads/picture/20180308/be9cead5aaa8a4beeeaa8418850600c7.jpg', '', '', 1, 1520481887);
INSERT INTO `rk_picture` VALUES (401, '/uploads/picture/20180308/e4b9f83ca7f217a9cb6d79f4ed2921e1.jpg', '/uploads/picture/20180308/e4b9f83ca7f217a9cb6d79f4ed2921e1.jpg', '', '', 1, 1520481887);
INSERT INTO `rk_picture` VALUES (402, '/uploads/picture/20180308/be53abc53a6c694d643f4f7a081d41cb.jpg', '/uploads/picture/20180308/be53abc53a6c694d643f4f7a081d41cb.jpg', '', '', 1, 1520481887);
INSERT INTO `rk_picture` VALUES (403, '/uploads/picture/20180308/175e3963dbc56e0ca7ec5ae0d6139da3.jpg', '/uploads/picture/20180308/175e3963dbc56e0ca7ec5ae0d6139da3.jpg', '', '', 1, 1520481887);
INSERT INTO `rk_picture` VALUES (404, '/uploads/picture/20180308/1b353afc78902ddd7e99e92bf0076dc4.jpg', '/uploads/picture/20180308/1b353afc78902ddd7e99e92bf0076dc4.jpg', '', '', 1, 1520481888);
INSERT INTO `rk_picture` VALUES (405, '/uploads/picture/20180308/62af7b76b49a260007c2b8f7094944c8.jpg', '/uploads/picture/20180308/62af7b76b49a260007c2b8f7094944c8.jpg', '', '', 1, 1520481888);
INSERT INTO `rk_picture` VALUES (406, '/uploads/picture/20180308/f32a2789cfae193e9cd74db488af2c3b.jpg', '/uploads/picture/20180308/f32a2789cfae193e9cd74db488af2c3b.jpg', '', '', 1, 1520481888);
INSERT INTO `rk_picture` VALUES (407, '/uploads/picture/20180308/7d8cd4d94891f7290470870dc32bba7d.jpg', '/uploads/picture/20180308/7d8cd4d94891f7290470870dc32bba7d.jpg', '', '', 1, 1520481889);
INSERT INTO `rk_picture` VALUES (408, '/uploads/picture/20180308/630d4330fe29cb45131fd32cff48945a.jpg', '/uploads/picture/20180308/630d4330fe29cb45131fd32cff48945a.jpg', '', '', 1, 1520481966);
INSERT INTO `rk_picture` VALUES (409, '/uploads/picture/20180308/33775ff49f98c645872f22e6ddf72899.jpg', '/uploads/picture/20180308/33775ff49f98c645872f22e6ddf72899.jpg', '', '', 1, 1520481966);
INSERT INTO `rk_picture` VALUES (410, '/uploads/picture/20180308/7a2a6a049f9c1e8cc47d8bd887215c66.jpg', '/uploads/picture/20180308/7a2a6a049f9c1e8cc47d8bd887215c66.jpg', '', '', 1, 1520481966);
INSERT INTO `rk_picture` VALUES (411, '/uploads/picture/20180308/8cd8827056353d1d1783ac98f4efd0dd.jpg', '/uploads/picture/20180308/8cd8827056353d1d1783ac98f4efd0dd.jpg', '', '', 1, 1520481966);
INSERT INTO `rk_picture` VALUES (412, '/uploads/picture/20180308/0ef40cdc10563da2c2654bde3d818fd4.jpg', '/uploads/picture/20180308/0ef40cdc10563da2c2654bde3d818fd4.jpg', '', '', 1, 1520490078);
INSERT INTO `rk_picture` VALUES (413, '/uploads/picture/20180308/ddf157b4cc52808b5f65a228d2d6d71b.jpg', '/uploads/picture/20180308/ddf157b4cc52808b5f65a228d2d6d71b.jpg', '', '', 1, 1520490078);
INSERT INTO `rk_picture` VALUES (414, '/uploads/picture/20180308/83ac0fd4c30d4895f952b6c60b2bdbf3.jpg', '/uploads/picture/20180308/83ac0fd4c30d4895f952b6c60b2bdbf3.jpg', '', '', 1, 1520490356);
INSERT INTO `rk_picture` VALUES (415, '/uploads/picture/20180308/19282d8184ea7e87c9437efc6bc715ae.jpg', '/uploads/picture/20180308/19282d8184ea7e87c9437efc6bc715ae.jpg', '', '', 1, 1520490356);
INSERT INTO `rk_picture` VALUES (416, '/uploads/picture/20180308/2ac1f0ac0468729643dd9d31a18323a7.jpg', '/uploads/picture/20180308/2ac1f0ac0468729643dd9d31a18323a7.jpg', '', '', 1, 1520490356);
INSERT INTO `rk_picture` VALUES (417, '/uploads/picture/20180308/e7538b1922b32bce540eb67ac4c6c684.jpg', '/uploads/picture/20180308/e7538b1922b32bce540eb67ac4c6c684.jpg', '', '', 1, 1520490738);
INSERT INTO `rk_picture` VALUES (418, '/uploads/picture/20180308/730056d7e195e0ad0c7a19cad3290ad1.jpg', '/uploads/picture/20180308/730056d7e195e0ad0c7a19cad3290ad1.jpg', '', '', 1, 1520490738);
INSERT INTO `rk_picture` VALUES (419, '/uploads/picture/20180308/665d838d2c3e64e1a8ef08ed56271a0a.jpg', '/uploads/picture/20180308/665d838d2c3e64e1a8ef08ed56271a0a.jpg', '', '', 1, 1520491103);
INSERT INTO `rk_picture` VALUES (420, '/uploads/picture/20180308/962dc613c4709551aec4bf2074637a53.jpg', '/uploads/picture/20180308/962dc613c4709551aec4bf2074637a53.jpg', '', '', 1, 1520491597);
INSERT INTO `rk_picture` VALUES (421, '/uploads/picture/20180308/18ef9c2f0c9a6b521e0520ebf2b02e4b.jpg', '/uploads/picture/20180308/18ef9c2f0c9a6b521e0520ebf2b02e4b.jpg', '', '', 1, 1520491597);
INSERT INTO `rk_picture` VALUES (422, '/uploads/picture/20180308/0cfb6502c1894ecbf5c96ececb9b7a1b.jpg', '/uploads/picture/20180308/0cfb6502c1894ecbf5c96ececb9b7a1b.jpg', '', '', 1, 1520491597);
INSERT INTO `rk_picture` VALUES (423, '/uploads/picture/20180308/f1593c658e787d376b2fd0fa9363dfd4.jpg', '/uploads/picture/20180308/f1593c658e787d376b2fd0fa9363dfd4.jpg', '', '', 1, 1520491648);
INSERT INTO `rk_picture` VALUES (424, '/uploads/picture/20180308/4aab82f532bc5106dee8ad3e35adf1e6.jpg', '/uploads/picture/20180308/4aab82f532bc5106dee8ad3e35adf1e6.jpg', '', '', 1, 1520491648);
INSERT INTO `rk_picture` VALUES (425, '/uploads/picture/20180308/bcb856d6b8d3c3afed7179dc29ed361e.jpg', '/uploads/picture/20180308/bcb856d6b8d3c3afed7179dc29ed361e.jpg', '', '', 1, 1520491648);
INSERT INTO `rk_picture` VALUES (426, '/uploads/picture/20180308/19778cf8c3f50ba401a3e56494136a0a.jpg', '/uploads/picture/20180308/19778cf8c3f50ba401a3e56494136a0a.jpg', '', '', 1, 1520491649);
INSERT INTO `rk_picture` VALUES (427, '/uploads/picture/20180308/ce820defeeb2000878b6d639473d4db1.jpg', '/uploads/picture/20180308/ce820defeeb2000878b6d639473d4db1.jpg', '', '', 1, 1520492478);
INSERT INTO `rk_picture` VALUES (428, '/uploads/picture/20180308/4deff0c7091566a43bfcdc98b167dd1f.jpg', '/uploads/picture/20180308/4deff0c7091566a43bfcdc98b167dd1f.jpg', '', '', 1, 1520492478);
INSERT INTO `rk_picture` VALUES (429, '/uploads/picture/20180308/6d0e0f38a78fa676171c2906bcf53f6a.jpg', '/uploads/picture/20180308/6d0e0f38a78fa676171c2906bcf53f6a.jpg', '', '', 1, 1520492510);
INSERT INTO `rk_picture` VALUES (430, '/uploads/picture/20180308/34aabf74efc7e62312bfdd3b652c19d9.jpg', '/uploads/picture/20180308/34aabf74efc7e62312bfdd3b652c19d9.jpg', '', '', 1, 1520492510);
INSERT INTO `rk_picture` VALUES (431, '/uploads/picture/20180308/68bbc7b1c7234d73517a57dfa64fea1e.jpg', '/uploads/picture/20180308/68bbc7b1c7234d73517a57dfa64fea1e.jpg', '', '', 1, 1520492614);
INSERT INTO `rk_picture` VALUES (432, '/uploads/picture/20180308/c532144ac712bb49beb08f29c562324e.jpg', '/uploads/picture/20180308/c532144ac712bb49beb08f29c562324e.jpg', '', '', 1, 1520492615);
INSERT INTO `rk_picture` VALUES (433, '/uploads/picture/20180308/070e9771a64aad72f87e8a3b8352a9dc.jpg', '/uploads/picture/20180308/070e9771a64aad72f87e8a3b8352a9dc.jpg', '', '', 1, 1520492615);
INSERT INTO `rk_picture` VALUES (434, '/uploads/picture/20180308/7c6ce0dc99bca69ee183c097b079cc29.jpg', '/uploads/picture/20180308/7c6ce0dc99bca69ee183c097b079cc29.jpg', '', '', 1, 1520492634);
INSERT INTO `rk_picture` VALUES (435, '/uploads/picture/20180308/4f30690e586e9f0dc7a0b132e91af6d4.jpg', '/uploads/picture/20180308/4f30690e586e9f0dc7a0b132e91af6d4.jpg', '', '', 1, 1520492780);
INSERT INTO `rk_picture` VALUES (436, '/uploads/picture/20180308/2303bf2d1da18c68f003be6e66d10a39.jpg', '/uploads/picture/20180308/2303bf2d1da18c68f003be6e66d10a39.jpg', '', '', 1, 1520492781);
INSERT INTO `rk_picture` VALUES (437, '/uploads/picture/20180308/9aae382dfc6ab430a493e816de2f5e5a.jpg', '/uploads/picture/20180308/9aae382dfc6ab430a493e816de2f5e5a.jpg', '', '', 1, 1520492795);
INSERT INTO `rk_picture` VALUES (438, '/uploads/picture/20180308/3147cbabfd7842c3d5fa109eee90b5d0.jpg', '/uploads/picture/20180308/3147cbabfd7842c3d5fa109eee90b5d0.jpg', '', '', 1, 1520494901);
INSERT INTO `rk_picture` VALUES (439, '/uploads/picture/20180308/dc004604288c11855e405c8327d3c50b.jpg', '/uploads/picture/20180308/dc004604288c11855e405c8327d3c50b.jpg', '', '', 1, 1520494913);
INSERT INTO `rk_picture` VALUES (440, '/uploads/picture/20180308/de6b075f78b671cfd22d5a03648bd8a7.jpg', '/uploads/picture/20180308/de6b075f78b671cfd22d5a03648bd8a7.jpg', '', '', 1, 1520494925);
INSERT INTO `rk_picture` VALUES (441, '/uploads/picture/20180308/c60ce776a535a0963cbc4c04074d3a6d.jpg', '/uploads/picture/20180308/c60ce776a535a0963cbc4c04074d3a6d.jpg', '', '', 1, 1520495264);
INSERT INTO `rk_picture` VALUES (442, './uploads/picture/20180308/1520495379.jpg', './uploads/picture/20180308/1520495379.jpg', '', '', 1, 1520495379);
INSERT INTO `rk_picture` VALUES (443, '/uploads/picture/20180308/e43fc8426324d3962ddb69baff2ebb30.jpg', '/uploads/picture/20180308/e43fc8426324d3962ddb69baff2ebb30.jpg', '', '', 1, 1520495400);
INSERT INTO `rk_picture` VALUES (444, '/uploads/picture/20180308/a10fd40ea72ad056d8aa0f134188c8ca.jpg', '/uploads/picture/20180308/a10fd40ea72ad056d8aa0f134188c8ca.jpg', '', '', 1, 1520495416);
INSERT INTO `rk_picture` VALUES (445, '/uploads/picture/20180308/2fefb2a07b5af9c0131931eca51456bd.jpg', '/uploads/picture/20180308/2fefb2a07b5af9c0131931eca51456bd.jpg', '', '', 1, 1520495438);
INSERT INTO `rk_picture` VALUES (446, '/uploads/picture/20180308/413c78acd5f3fed6a2b9fd5a10b023c7.jpg', '/uploads/picture/20180308/413c78acd5f3fed6a2b9fd5a10b023c7.jpg', '', '', 1, 1520495438);
INSERT INTO `rk_picture` VALUES (447, '/uploads/picture/20180308/e45eaa8af83c10162cc61df5488b6d1a.jpg', '/uploads/picture/20180308/e45eaa8af83c10162cc61df5488b6d1a.jpg', '', '', 1, 1520495438);
INSERT INTO `rk_picture` VALUES (448, '/uploads/picture/20180308/36bf692cdfbd84f0dd25a61e3226535a.jpg', '/uploads/picture/20180308/36bf692cdfbd84f0dd25a61e3226535a.jpg', '', '', 1, 1520495824);
INSERT INTO `rk_picture` VALUES (449, './uploads/picture/20180308/1520498845.jpg', './uploads/picture/20180308/1520498845.jpg', '', '', 1, 1520498845);
INSERT INTO `rk_picture` VALUES (450, '/uploads/picture/20180308/480b4b5cc2a3d797c7268da22f2a1947.jpg', '/uploads/picture/20180308/480b4b5cc2a3d797c7268da22f2a1947.jpg', '', '', 1, 1520498858);
INSERT INTO `rk_picture` VALUES (451, '/uploads/picture/20180308/cab27388335636d9f10490dd943fb1fd.jpg', '/uploads/picture/20180308/cab27388335636d9f10490dd943fb1fd.jpg', '', '', 1, 1520498877);
INSERT INTO `rk_picture` VALUES (452, '/uploads/picture/20180308/09f1e08c88b374a5dd4c05ddf40f0cf0.jpg', '/uploads/picture/20180308/09f1e08c88b374a5dd4c05ddf40f0cf0.jpg', '', '', 1, 1520498904);
INSERT INTO `rk_picture` VALUES (453, '/uploads/picture/20180308/89bb8afdfff37b4ec507ccd2e2d637c8.jpg', '/uploads/picture/20180308/89bb8afdfff37b4ec507ccd2e2d637c8.jpg', '', '', 1, 1520498904);
INSERT INTO `rk_picture` VALUES (454, './uploads/picture/20180308/1520499048.jpg', './uploads/picture/20180308/1520499048.jpg', '', '', 1, 1520499048);
INSERT INTO `rk_picture` VALUES (455, '/uploads/picture/20180308/a9fb028c88b65d1de8f787fc6e074f35.jpg', '/uploads/picture/20180308/a9fb028c88b65d1de8f787fc6e074f35.jpg', '', '', 1, 1520499072);
INSERT INTO `rk_picture` VALUES (456, '/uploads/picture/20180308/bfdc23aac2bafef5c2dfadd1d4cde593.jpg', '/uploads/picture/20180308/bfdc23aac2bafef5c2dfadd1d4cde593.jpg', '', '', 1, 1520499141);
INSERT INTO `rk_picture` VALUES (457, '/uploads/picture/20180308/bbe8bc14a936716e278814e52895f94b.jpg', '/uploads/picture/20180308/bbe8bc14a936716e278814e52895f94b.jpg', '', '', 1, 1520499165);
INSERT INTO `rk_picture` VALUES (458, '/uploads/picture/20180308/03098e04e6448dcae99df0227099b955.png', '/uploads/picture/20180308/03098e04e6448dcae99df0227099b955.png', '', '', 1, 1520499607);
INSERT INTO `rk_picture` VALUES (459, './uploads/picture/20180308/1520500734.jpg', './uploads/picture/20180308/1520500734.jpg', '', '', 1, 1520500734);
INSERT INTO `rk_picture` VALUES (460, '/uploads/picture/20180308/0ac6e86649b6ab1f137881e38f3bbdfa.jpg', '/uploads/picture/20180308/0ac6e86649b6ab1f137881e38f3bbdfa.jpg', '', '', 1, 1520500776);
INSERT INTO `rk_picture` VALUES (461, './uploads/picture/20180308/1520501245.jpg', './uploads/picture/20180308/1520501245.jpg', '', '', 1, 1520501245);
INSERT INTO `rk_picture` VALUES (462, '/uploads/picture/20180308/245f275f7375e93d37de0cba5b484b53.jpg', '/uploads/picture/20180308/245f275f7375e93d37de0cba5b484b53.jpg', '', '', 1, 1520501252);
INSERT INTO `rk_picture` VALUES (463, './uploads/picture/20180308/1520501725.jpg', './uploads/picture/20180308/1520501725.jpg', '', '', 1, 1520501725);
INSERT INTO `rk_picture` VALUES (464, './uploads/picture/20180308/1520501833.jpg', './uploads/picture/20180308/1520501833.jpg', '', '', 1, 1520501833);
INSERT INTO `rk_picture` VALUES (465, './uploads/picture/20180308/1520501866.jpg', './uploads/picture/20180308/1520501866.jpg', '', '', 1, 1520501866);
INSERT INTO `rk_picture` VALUES (466, '/uploads/picture/20180308/a9326ec604d9ab9e4af3450447a889c6.jpg', '/uploads/picture/20180308/a9326ec604d9ab9e4af3450447a889c6.jpg', '', '', 1, 1520501879);
INSERT INTO `rk_picture` VALUES (467, './uploads/picture/20180308/1520502225.jpg', './uploads/picture/20180308/1520502225.jpg', '', '', 1, 1520502225);
INSERT INTO `rk_picture` VALUES (468, '/uploads/picture/20180308/0d0372108fd806698c31e5bb8465adde.jpg', '/uploads/picture/20180308/0d0372108fd806698c31e5bb8465adde.jpg', '', '', 1, 1520502238);
INSERT INTO `rk_picture` VALUES (469, './uploads/picture/20180308/1520502840.jpg', './uploads/picture/20180308/1520502840.jpg', '', '', 1, 1520502840);
INSERT INTO `rk_picture` VALUES (470, '/uploads/picture/20180308/a557e5e483ef4c8fcf92fdc065b9ca7e.jpg', '/uploads/picture/20180308/a557e5e483ef4c8fcf92fdc065b9ca7e.jpg', '', '', 1, 1520502849);
INSERT INTO `rk_picture` VALUES (471, '/uploads/picture/20180308/8ff61161bb983289b8b5b1f54feedace.jpg', '/uploads/picture/20180308/8ff61161bb983289b8b5b1f54feedace.jpg', '', '', 1, 1520502902);
INSERT INTO `rk_picture` VALUES (472, './uploads/picture/20180308/1520503556.jpg', './uploads/picture/20180308/1520503556.jpg', '', '', 1, 1520503556);
INSERT INTO `rk_picture` VALUES (473, '/uploads/picture/20180308/6a68595710b0693eea1295bf95352c94.jpg', '/uploads/picture/20180308/6a68595710b0693eea1295bf95352c94.jpg', '', '', 1, 1520503565);
INSERT INTO `rk_picture` VALUES (474, '/uploads/picture/20180308/0dcc47ae827d66db5eb027915c07ecd9.jpg', '/uploads/picture/20180308/0dcc47ae827d66db5eb027915c07ecd9.jpg', '', '', 1, 1520503627);
INSERT INTO `rk_picture` VALUES (475, './uploads/picture/20180308/1520503858.jpg', './uploads/picture/20180308/1520503858.jpg', '', '', 1, 1520503858);
INSERT INTO `rk_picture` VALUES (476, '/uploads/picture/20180308/3bb4860375e291927962b974e94c1a45.jpg', '/uploads/picture/20180308/3bb4860375e291927962b974e94c1a45.jpg', '', '', 1, 1520503878);
INSERT INTO `rk_picture` VALUES (477, '/uploads/picture/20180308/2b775ec5f3b15e220b191dfd9a4bb73d.jpg', '/uploads/picture/20180308/2b775ec5f3b15e220b191dfd9a4bb73d.jpg', '', '', 1, 1520503924);
INSERT INTO `rk_picture` VALUES (478, './uploads/picture/20180308/1520504047.jpg', './uploads/picture/20180308/1520504047.jpg', '', '', 1, 1520504047);
INSERT INTO `rk_picture` VALUES (479, '/uploads/picture/20180308/e146c3105944f91afefe8877632a46d7.jpg', '/uploads/picture/20180308/e146c3105944f91afefe8877632a46d7.jpg', '', '', 1, 1520504060);
INSERT INTO `rk_picture` VALUES (480, '/uploads/picture/20180308/7adedc6f23107c541552df98f4f23780.jpg', '/uploads/picture/20180308/7adedc6f23107c541552df98f4f23780.jpg', '', '', 1, 1520504091);
INSERT INTO `rk_picture` VALUES (481, './uploads/picture/20180308/1520504161.jpg', './uploads/picture/20180308/1520504161.jpg', '', '', 1, 1520504161);
INSERT INTO `rk_picture` VALUES (482, '/uploads/picture/20180308/4e8f09167d1b28c57e4027c6a2835473.jpg', '/uploads/picture/20180308/4e8f09167d1b28c57e4027c6a2835473.jpg', '', '', 1, 1520504168);
INSERT INTO `rk_picture` VALUES (483, '/uploads/picture/20180308/cf1dd44f41289643caf40d835516e22a.jpg', '/uploads/picture/20180308/cf1dd44f41289643caf40d835516e22a.jpg', '', '', 1, 1520504190);
INSERT INTO `rk_picture` VALUES (484, './uploads/picture/20180308/1520504852.jpg', './uploads/picture/20180308/1520504852.jpg', '', '', 1, 1520504852);
INSERT INTO `rk_picture` VALUES (485, '/uploads/picture/20180308/475566fe33193af4ad5cfe76a8c430b4.jpg', '/uploads/picture/20180308/475566fe33193af4ad5cfe76a8c430b4.jpg', '', '', 1, 1520504861);
INSERT INTO `rk_picture` VALUES (486, '/uploads/picture/20180308/f3341eb548518fc9bceabc22e5886552.jpg', '/uploads/picture/20180308/f3341eb548518fc9bceabc22e5886552.jpg', '', '', 1, 1520504910);
INSERT INTO `rk_picture` VALUES (487, '/uploads/picture/20180308/c0ac8847563bfb1bd0a3d5c4bd78bee4.jpg', '/uploads/picture/20180308/c0ac8847563bfb1bd0a3d5c4bd78bee4.jpg', '', '', 1, 1520504923);
INSERT INTO `rk_picture` VALUES (488, './uploads/picture/20180308/1520505436.jpg', './uploads/picture/20180308/1520505436.jpg', '', '', 1, 1520505436);
INSERT INTO `rk_picture` VALUES (489, '/uploads/picture/20180308/4ff4ff494a028354738997ad4d5a6360.jpg', '/uploads/picture/20180308/4ff4ff494a028354738997ad4d5a6360.jpg', '', '', 1, 1520505446);
INSERT INTO `rk_picture` VALUES (490, '/uploads/picture/20180308/6f30998bc4ef2323eb7ac58255bf2927.jpg', '/uploads/picture/20180308/6f30998bc4ef2323eb7ac58255bf2927.jpg', '', '', 1, 1520505515);
INSERT INTO `rk_picture` VALUES (491, '/uploads/picture/20180308/23a8637f8ad8f86ad29a74336fb78b25.jpg', '/uploads/picture/20180308/23a8637f8ad8f86ad29a74336fb78b25.jpg', '', '', 1, 1520505528);
INSERT INTO `rk_picture` VALUES (492, './uploads/picture/20180308/1520505822.jpg', './uploads/picture/20180308/1520505822.jpg', '', '', 1, 1520505822);
INSERT INTO `rk_picture` VALUES (493, '/uploads/picture/20180308/2be25b8a277867fbd960955dda88d003.jpg', '/uploads/picture/20180308/2be25b8a277867fbd960955dda88d003.jpg', '', '', 1, 1520505831);
INSERT INTO `rk_picture` VALUES (494, '/uploads/picture/20180308/39d71ea7c7c57e63f6d2a597a62cb8e1.jpg', '/uploads/picture/20180308/39d71ea7c7c57e63f6d2a597a62cb8e1.jpg', '', '', 1, 1520505865);
INSERT INTO `rk_picture` VALUES (495, './uploads/picture/20180308/1520505944.jpg', './uploads/picture/20180308/1520505944.jpg', '', '', 1, 1520505944);
INSERT INTO `rk_picture` VALUES (496, '/uploads/picture/20180308/cc49a9e499ca3adc0e5798483e0bc08c.jpg', '/uploads/picture/20180308/cc49a9e499ca3adc0e5798483e0bc08c.jpg', '', '', 1, 1520505951);
INSERT INTO `rk_picture` VALUES (497, '/uploads/picture/20180308/485840f11cc9b44a9193c2e09ffe3942.jpg', '/uploads/picture/20180308/485840f11cc9b44a9193c2e09ffe3942.jpg', '', '', 1, 1520506018);
INSERT INTO `rk_picture` VALUES (498, '/uploads/picture/20180308/5d95019e28971396b786c9b2181c03e5.jpg', '/uploads/picture/20180308/5d95019e28971396b786c9b2181c03e5.jpg', '', '', 1, 1520506041);
INSERT INTO `rk_picture` VALUES (499, './uploads/picture/20180308/1520506216.jpg', './uploads/picture/20180308/1520506216.jpg', '', '', 1, 1520506216);
INSERT INTO `rk_picture` VALUES (500, '/uploads/picture/20180308/8bdfc5f11f1a8b856f1847c4cdf92e7b.jpg', '/uploads/picture/20180308/8bdfc5f11f1a8b856f1847c4cdf92e7b.jpg', '', '', 1, 1520506226);
INSERT INTO `rk_picture` VALUES (501, './uploads/picture/20180308/1520506424.jpg', './uploads/picture/20180308/1520506424.jpg', '', '', 1, 1520506424);
INSERT INTO `rk_picture` VALUES (502, '/uploads/picture/20180308/3ba43144e602be13befd1ef854215bc9.jpg', '/uploads/picture/20180308/3ba43144e602be13befd1ef854215bc9.jpg', '', '', 1, 1520506431);
INSERT INTO `rk_picture` VALUES (503, '/uploads/picture/20180308/72ed09e5bf9996d7bac4dde6d273fb2d.jpg', '/uploads/picture/20180308/72ed09e5bf9996d7bac4dde6d273fb2d.jpg', '', '', 1, 1520506443);
INSERT INTO `rk_picture` VALUES (504, '/uploads/picture/20180308/ba422375ecce066d126beaa416cfdcef.jpg', '/uploads/picture/20180308/ba422375ecce066d126beaa416cfdcef.jpg', '', '', 1, 1520506452);
INSERT INTO `rk_picture` VALUES (505, './uploads/picture/20180308/1520506526.jpg', './uploads/picture/20180308/1520506526.jpg', '', '', 1, 1520506526);
INSERT INTO `rk_picture` VALUES (506, '/uploads/picture/20180308/f973cf76dedaa903811d8240d19cc11e.jpg', '/uploads/picture/20180308/f973cf76dedaa903811d8240d19cc11e.jpg', '', '', 1, 1520506535);
INSERT INTO `rk_picture` VALUES (507, '/uploads/picture/20180308/77995216200cb9e8be942e587f5ceb8e.jpg', '/uploads/picture/20180308/77995216200cb9e8be942e587f5ceb8e.jpg', '', '', 1, 1520506565);
INSERT INTO `rk_picture` VALUES (508, '/uploads/picture/20180308/c9138d1f45693fb60861c429150de0c5.jpg', '/uploads/picture/20180308/c9138d1f45693fb60861c429150de0c5.jpg', '', '', 1, 1520506576);
INSERT INTO `rk_picture` VALUES (509, './uploads/picture/20180308/1520506688.jpg', './uploads/picture/20180308/1520506688.jpg', '', '', 1, 1520506688);
INSERT INTO `rk_picture` VALUES (510, '/uploads/picture/20180308/ef0a4fab9462f67d8c95170c7fcece0a.jpg', '/uploads/picture/20180308/ef0a4fab9462f67d8c95170c7fcece0a.jpg', '', '', 1, 1520506700);
INSERT INTO `rk_picture` VALUES (511, '/uploads/picture/20180308/aa8d91d491fb3a08caa82b1bb39981f2.png', '/uploads/picture/20180308/aa8d91d491fb3a08caa82b1bb39981f2.png', '', '', 1, 1520506819);
INSERT INTO `rk_picture` VALUES (512, '/uploads/picture/20180308/59e4817a1fe3a01fdddc22a86dbd3925.png', '/uploads/picture/20180308/59e4817a1fe3a01fdddc22a86dbd3925.png', '', '', 1, 1520506856);
INSERT INTO `rk_picture` VALUES (513, '/uploads/picture/20180308/7ad1c2002f05d83e7360d5aac367432d.png', '/uploads/picture/20180308/7ad1c2002f05d83e7360d5aac367432d.png', '', '', 1, 1520506882);
INSERT INTO `rk_picture` VALUES (514, '/uploads/picture/20180308/05e7488c82091800af0b1a2eac7dadcf.png', '/uploads/picture/20180308/05e7488c82091800af0b1a2eac7dadcf.png', '', '', 1, 1520518182);
INSERT INTO `rk_picture` VALUES (515, '/uploads/picture/20180308/6aac4c9d0d2333a649956b3bcfd69589.png', '/uploads/picture/20180308/6aac4c9d0d2333a649956b3bcfd69589.png', '', '', 1, 1520518209);
INSERT INTO `rk_picture` VALUES (516, '/uploads/picture/20180308/b47d1914efa47a68ccad19238c607390.png', '/uploads/picture/20180308/b47d1914efa47a68ccad19238c607390.png', '', '', 1, 1520518236);
INSERT INTO `rk_picture` VALUES (517, '/uploads/picture/20180308/b721f9cd1e1aa75db1fffbc52192bff1.png', '/uploads/picture/20180308/b721f9cd1e1aa75db1fffbc52192bff1.png', '', '', 1, 1520518418);
INSERT INTO `rk_picture` VALUES (518, '/uploads/picture/20180308/73da8866a877173c7246120588dcf12d.png', '/uploads/picture/20180308/73da8866a877173c7246120588dcf12d.png', '', '', 1, 1520518443);
INSERT INTO `rk_picture` VALUES (519, '/uploads/picture/20180308/fbf61be6d8e2efeb3b6c90c2cd80d9f9.png', '/uploads/picture/20180308/fbf61be6d8e2efeb3b6c90c2cd80d9f9.png', '', '', 1, 1520518471);
INSERT INTO `rk_picture` VALUES (520, '/uploads/picture/20180309/e03b138784bcfef6999dd26f83f169e8.png', '/uploads/picture/20180309/e03b138784bcfef6999dd26f83f169e8.png', '', '', 1, 1520534369);
INSERT INTO `rk_picture` VALUES (521, '/uploads/picture/20180309/020fd963d293490db567e4a2a12714af.png', '/uploads/picture/20180309/020fd963d293490db567e4a2a12714af.png', '', '', 1, 1520534385);
INSERT INTO `rk_picture` VALUES (522, '/uploads/picture/20180309/e167b312f2807268071e5b9f36466f9e.png', '/uploads/picture/20180309/e167b312f2807268071e5b9f36466f9e.png', '', '', 1, 1520534414);
INSERT INTO `rk_picture` VALUES (523, '/uploads/picture/20180309/9b4b435869545f733d754ea69e1fe478.png', '/uploads/picture/20180309/9b4b435869545f733d754ea69e1fe478.png', '', '', 1, 1520534434);
INSERT INTO `rk_picture` VALUES (524, '/uploads/picture/20180309/16e779f44298c6704bf52a86bb9e0742.png', '/uploads/picture/20180309/16e779f44298c6704bf52a86bb9e0742.png', '', '', 1, 1520534449);
INSERT INTO `rk_picture` VALUES (525, '/uploads/picture/20180309/7c37ec080e695947a67e30120c21ea84.png', '/uploads/picture/20180309/7c37ec080e695947a67e30120c21ea84.png', '', '', 1, 1520553233);
INSERT INTO `rk_picture` VALUES (526, '/uploads/picture/20180309/36ff124650346d6dc7195a8f68294870.png', '/uploads/picture/20180309/36ff124650346d6dc7195a8f68294870.png', '', '', 1, 1520553359);
INSERT INTO `rk_picture` VALUES (527, '/uploads/picture/20180309/05fdba6879a8fb679427010440a2ed91.png', '/uploads/picture/20180309/05fdba6879a8fb679427010440a2ed91.png', '', '', 1, 1520553391);
INSERT INTO `rk_picture` VALUES (528, './uploads/picture/20180309/1520554235.jpg', './uploads/picture/20180309/1520554235.jpg', '', '', 1, 1520554235);
INSERT INTO `rk_picture` VALUES (529, '/uploads/picture/20180309/13e3e0d20a1b91b0b8aa4e29fb9fdc41.jpg', '/uploads/picture/20180309/13e3e0d20a1b91b0b8aa4e29fb9fdc41.jpg', '', '', 1, 1520554291);
INSERT INTO `rk_picture` VALUES (530, '/uploads/picture/20180309/58f9da69b3c64feecec4e15eda6f8cc4.jpg', '/uploads/picture/20180309/58f9da69b3c64feecec4e15eda6f8cc4.jpg', '', '', 1, 1520554292);
INSERT INTO `rk_picture` VALUES (531, '/uploads/picture/20180309/f18e392abdc552b0433e8789dad34f6c.png', '/uploads/picture/20180309/f18e392abdc552b0433e8789dad34f6c.png', '', '', 1, 1520555514);
INSERT INTO `rk_picture` VALUES (532, '/uploads/picture/20180309/64ba069465f4d557f0eb9c34cb65a8d3.png', '/uploads/picture/20180309/64ba069465f4d557f0eb9c34cb65a8d3.png', '', '', 1, 1520555623);
INSERT INTO `rk_picture` VALUES (533, '/uploads/picture/20180309/0b3b9c729f915864dda4d60fec2cbabc.png', '/uploads/picture/20180309/0b3b9c729f915864dda4d60fec2cbabc.png', '', '', 1, 1520555657);
INSERT INTO `rk_picture` VALUES (534, '/uploads/picture/20180309/468400604aa698c81ddb09c86955e99c.png', '/uploads/picture/20180309/468400604aa698c81ddb09c86955e99c.png', '', '', 1, 1520555843);
INSERT INTO `rk_picture` VALUES (535, '/uploads/picture/20180309/152055695483.jpeg', '/uploads/picture/20180309/152055695483.jpeg', '', '', 1, 1520556954);
INSERT INTO `rk_picture` VALUES (536, './uploads/picture/20180309/1520560245.jpg', './uploads/picture/20180309/1520560245.jpg', '', '', 1, 1520560245);
INSERT INTO `rk_picture` VALUES (537, '/uploads/picture/20180309/2beed50a8420e454c6eb6cd92c2e8820.jpg', '/uploads/picture/20180309/2beed50a8420e454c6eb6cd92c2e8820.jpg', '', '', 1, 1520560295);
INSERT INTO `rk_picture` VALUES (538, '/uploads/picture/20180309/e5c3e797405efa1cde138c2575fcc3e9.png', '/uploads/picture/20180309/e5c3e797405efa1cde138c2575fcc3e9.png', '', '', 1, 1520561808);
INSERT INTO `rk_picture` VALUES (1116, '/uploads/picture/20180320/9bfcdec3d080db19c3e02d38c712dbaf.jpg', '/uploads/picture/20180320/9bfcdec3d080db19c3e02d38c712dbaf.jpg', '1010eaec028ebcf309f747e023a25512', '1a4eb9de236177cb8cb38de56d381ce118643932', 1, 1521505896);
INSERT INTO `rk_picture` VALUES (540, '/uploads/picture/20180309/472344d33d057f8fd59cab3554105f3f.png', '/uploads/picture/20180309/472344d33d057f8fd59cab3554105f3f.png', 'efff054c3e6883ae4dd9fd4b8155e534', '1ae797d87ba345035a6d0f15a775cb88bc8c126e', 1, 1520563609);
INSERT INTO `rk_picture` VALUES (541, '/uploads/picture/20180309/eb4ce1d621b8b920b5a7bd699dbe8444.jpg', '/uploads/picture/20180309/eb4ce1d621b8b920b5a7bd699dbe8444.jpg', 'a90dccaffc69bcd32f7eede9be080e78', 'eebace323ffc06c7783c33f793196eab635ed881', 1, 1520563621);
INSERT INTO `rk_picture` VALUES (542, '/uploads/picture/20180309/dff030d6ae147394fc80e2f9b27eae8c.png', '/uploads/picture/20180309/dff030d6ae147394fc80e2f9b27eae8c.png', '', '', 1, 1520563721);
INSERT INTO `rk_picture` VALUES (543, '/uploads/picture/20180309/2f4e8ce58e380c6e2538a76a5869b13c.png', '/uploads/picture/20180309/2f4e8ce58e380c6e2538a76a5869b13c.png', '', '', 1, 1520563738);
INSERT INTO `rk_picture` VALUES (544, './uploads/picture/20180309/1520566289.jpg', './uploads/picture/20180309/1520566289.jpg', '', '', 1, 1520566289);
INSERT INTO `rk_picture` VALUES (545, './uploads/picture/20180309/1520569928.jpg', './uploads/picture/20180309/1520569928.jpg', '', '', 1, 1520569928);
INSERT INTO `rk_picture` VALUES (546, '/uploads/picture/20180309/ac34211cbd54b912b3a3472d4f476f6e.jpg', '/uploads/picture/20180309/ac34211cbd54b912b3a3472d4f476f6e.jpg', '', '', 1, 1520569950);
INSERT INTO `rk_picture` VALUES (547, '/uploads/picture/20180309/4da23bca3c5d27d69495d6ca6d2326cf.jpg', '/uploads/picture/20180309/4da23bca3c5d27d69495d6ca6d2326cf.jpg', '', '', 1, 1520569969);
INSERT INTO `rk_picture` VALUES (548, '/uploads/picture/20180309/43ec7c0c559166ac24fce04e9e686ad7.jpg', '/uploads/picture/20180309/43ec7c0c559166ac24fce04e9e686ad7.jpg', '', '', 1, 1520569998);
INSERT INTO `rk_picture` VALUES (549, './uploads/picture/20180309/1520577624.jpg', './uploads/picture/20180309/1520577624.jpg', '', '', 1, 1520577624);
INSERT INTO `rk_picture` VALUES (550, '/uploads/picture/20180309/ba7abb83f5cae9d3ad32d6215f0e202f.jpg', '/uploads/picture/20180309/ba7abb83f5cae9d3ad32d6215f0e202f.jpg', '', '', 1, 1520578210);
INSERT INTO `rk_picture` VALUES (551, '/uploads/picture/20180309/cafc0bbf42e6b76c8f45e2ed545c9026.jpg', '/uploads/picture/20180309/cafc0bbf42e6b76c8f45e2ed545c9026.jpg', '', '', 1, 1520578253);
INSERT INTO `rk_picture` VALUES (552, '/uploads/picture/20180309/079a3b8ec73b143e44e48dccae7b0be2.jpg', '/uploads/picture/20180309/079a3b8ec73b143e44e48dccae7b0be2.jpg', '', '', 1, 1520578267);
INSERT INTO `rk_picture` VALUES (553, '/uploads/picture/20180309/35931bd654dc3790981a64cec4e9b89c.jpg', '/uploads/picture/20180309/35931bd654dc3790981a64cec4e9b89c.jpg', '', '', 1, 1520578292);
INSERT INTO `rk_picture` VALUES (554, '/uploads/picture/20180309/31a035954c56ae0546ac70c3ecadbd1a.png', '/uploads/picture/20180309/31a035954c56ae0546ac70c3ecadbd1a.png', '', '', 1, 1520580155);
INSERT INTO `rk_picture` VALUES (555, '/uploads/picture/20180309/96e709f00272f879c936b65a9426dee6.png', '/uploads/picture/20180309/96e709f00272f879c936b65a9426dee6.png', '', '', 1, 1520580207);
INSERT INTO `rk_picture` VALUES (556, '/uploads/picture/20180309/dec67055529eda53a29ad9767c683652.png', '/uploads/picture/20180309/dec67055529eda53a29ad9767c683652.png', '', '', 1, 1520580224);
INSERT INTO `rk_picture` VALUES (557, '/uploads/picture/20180309/5663b5e2ff0a2d3605360b2b51915a08.png', '/uploads/picture/20180309/5663b5e2ff0a2d3605360b2b51915a08.png', '', '', 1, 1520580439);
INSERT INTO `rk_picture` VALUES (558, '/uploads/picture/20180309/ebbe2a754d487c18925359bca07795cb.png', '/uploads/picture/20180309/ebbe2a754d487c18925359bca07795cb.png', '', '', 1, 1520580507);
INSERT INTO `rk_picture` VALUES (559, '/uploads/picture/20180309/a01ca95b257a01d8b445ddd10ab0236a.png', '/uploads/picture/20180309/a01ca95b257a01d8b445ddd10ab0236a.png', '', '', 1, 1520580524);
INSERT INTO `rk_picture` VALUES (560, '/uploads/picture/20180309/c462c655fa57f2cd9a6de992f66275d5.jpg', '/uploads/picture/20180309/c462c655fa57f2cd9a6de992f66275d5.jpg', 'bb074681d27ae31a0d88cb80d1f6aa51', '1c444bd607f07fd8d336ed4fc60f111de78d465e', 1, 1520581057);
INSERT INTO `rk_picture` VALUES (561, '/uploads/picture/20180309/eb888f684fbed6c1087d1286673447ed.jpg', '/uploads/picture/20180309/eb888f684fbed6c1087d1286673447ed.jpg', '4905bc0c635a43ebb4cd53e129b928f7', '5521a29be1a8287a4c97658791daf89f48071cfc', 1, 1520581551);
INSERT INTO `rk_picture` VALUES (562, './uploads/picture/20180309/1520584591.jpg', './uploads/picture/20180309/1520584591.jpg', '', '', 1, 1520584591);
INSERT INTO `rk_picture` VALUES (563, '/uploads/picture/20180309/1ca087b65ab0a9c88a936047f395307a.jpg', '/uploads/picture/20180309/1ca087b65ab0a9c88a936047f395307a.jpg', '', '', 1, 1520584615);
INSERT INTO `rk_picture` VALUES (564, '/uploads/picture/20180309/3565408cd52962f767fe5ac68bf7fa91.jpg', '/uploads/picture/20180309/3565408cd52962f767fe5ac68bf7fa91.jpg', '', '', 1, 1520584627);
INSERT INTO `rk_picture` VALUES (565, '/uploads/picture/20180309/e8bbeb936367b1d8c750940415b134f7.jpg', '/uploads/picture/20180309/e8bbeb936367b1d8c750940415b134f7.jpg', '', '', 1, 1520584661);
INSERT INTO `rk_picture` VALUES (566, './uploads/picture/20180309/1520585191.jpg', './uploads/picture/20180309/1520585191.jpg', '', '', 1, 1520585191);
INSERT INTO `rk_picture` VALUES (567, '/uploads/picture/20180309/295cd4cbb76a3f680a7677f3794da796.jpg', '/uploads/picture/20180309/295cd4cbb76a3f680a7677f3794da796.jpg', '', '', 1, 1520585213);
INSERT INTO `rk_picture` VALUES (568, '/uploads/picture/20180309/d3ece20e9b0937d48171eb09cb578b9d.jpg', '/uploads/picture/20180309/d3ece20e9b0937d48171eb09cb578b9d.jpg', '', '', 1, 1520585221);
INSERT INTO `rk_picture` VALUES (569, '/uploads/picture/20180309/90bd2b5ac4fecaf37149836c11484360.jpg', '/uploads/picture/20180309/90bd2b5ac4fecaf37149836c11484360.jpg', '', '', 1, 1520585263);
INSERT INTO `rk_picture` VALUES (570, '/uploads/picture/20180309/21c3809ea607b51e4fd25af1782b59cb.jpg', '/uploads/picture/20180309/21c3809ea607b51e4fd25af1782b59cb.jpg', '', '', 1, 1520585272);
INSERT INTO `rk_picture` VALUES (571, './uploads/picture/20180309/1520585644.jpg', './uploads/picture/20180309/1520585644.jpg', '', '', 1, 1520585644);
INSERT INTO `rk_picture` VALUES (572, '/uploads/picture/20180309/2b71fa1d5b6d820d346a0ac542ff2f4c.jpg', '/uploads/picture/20180309/2b71fa1d5b6d820d346a0ac542ff2f4c.jpg', '', '', 1, 1520585677);
INSERT INTO `rk_picture` VALUES (573, '/uploads/picture/20180309/a72e2c589192d977ba4bc657fe8be43c.jpg', '/uploads/picture/20180309/a72e2c589192d977ba4bc657fe8be43c.jpg', '', '', 1, 1520585709);
INSERT INTO `rk_picture` VALUES (574, '/uploads/picture/20180309/d3cbec7807ae625d3cd074663f22c87e.jpg', '/uploads/picture/20180309/d3cbec7807ae625d3cd074663f22c87e.jpg', '', '', 1, 1520585722);
INSERT INTO `rk_picture` VALUES (575, '/uploads/picture/20180309/07bf8023233121e4b95de9965ec6af48.jpg', '/uploads/picture/20180309/07bf8023233121e4b95de9965ec6af48.jpg', '', '', 1, 1520585741);
INSERT INTO `rk_picture` VALUES (576, '/uploads/picture/20180309/5048592093c7685fd4dcf93b17d335e6.png', '/uploads/picture/20180309/5048592093c7685fd4dcf93b17d335e6.png', 'eb12e770b21f4ea9f73e2524ca2a8304', 'c4e94389744506df5fd0c4ae45d36dc7d9d6251d', 1, 1520586374);
INSERT INTO `rk_picture` VALUES (577, '/uploads/picture/20180309/152059992719.jpeg', '/uploads/picture/20180309/152059992719.jpeg', '', '', 1, 1520599927);
INSERT INTO `rk_picture` VALUES (578, './uploads/picture/20180310/1520662864.jpg', './uploads/picture/20180310/1520662864.jpg', '', '', 1, 1520662864);
INSERT INTO `rk_picture` VALUES (579, '/uploads/picture/20180310/26a273cab7cbe83411840c1b55ee35d3.jpg', '/uploads/picture/20180310/26a273cab7cbe83411840c1b55ee35d3.jpg', '', '', 1, 1520662881);
INSERT INTO `rk_picture` VALUES (580, '/uploads/picture/20180310/5ff3f56658340c5723290443d6c6ddd4.png', '/uploads/picture/20180310/5ff3f56658340c5723290443d6c6ddd4.png', '', '', 1, 1520672671);
INSERT INTO `rk_picture` VALUES (581, '/uploads/picture/20180310/7573adcde109b29f2d118511e00dee71.png', '/uploads/picture/20180310/7573adcde109b29f2d118511e00dee71.png', '', '', 1, 1520672686);
INSERT INTO `rk_picture` VALUES (582, './uploads/picture/20180310/1520673407.jpg', './uploads/picture/20180310/1520673407.jpg', '', '', 1, 1520673407);
INSERT INTO `rk_picture` VALUES (583, '/uploads/picture/20180310/304e30cf2ed1b08240afc2e2fb91b681.jpg', '/uploads/picture/20180310/304e30cf2ed1b08240afc2e2fb91b681.jpg', '', '', 1, 1520673445);
INSERT INTO `rk_picture` VALUES (584, '/uploads/picture/20180310/8f08dac821fc760ce759de6dc6333f66.jpg', '/uploads/picture/20180310/8f08dac821fc760ce759de6dc6333f66.jpg', '', '', 1, 1520673475);
INSERT INTO `rk_picture` VALUES (585, '/uploads/picture/20180310/04e08f8ebf3eeffe0ceb7bb9f2ff21c5.jpg', '/uploads/picture/20180310/04e08f8ebf3eeffe0ceb7bb9f2ff21c5.jpg', '', '', 1, 1520673528);
INSERT INTO `rk_picture` VALUES (586, '/uploads/picture/20180310/8dc043656fa681ebc4f69fa0f1614cff.jpg', '/uploads/picture/20180310/8dc043656fa681ebc4f69fa0f1614cff.jpg', '', '', 1, 1520673528);
INSERT INTO `rk_picture` VALUES (587, './uploads/picture/20180310/1520674191.jpg', './uploads/picture/20180310/1520674191.jpg', '', '', 1, 1520674191);
INSERT INTO `rk_picture` VALUES (588, '/uploads/picture/20180310/268aea8cfe58373fb46a72e0ee4f135a.jpg', '/uploads/picture/20180310/268aea8cfe58373fb46a72e0ee4f135a.jpg', '', '', 1, 1520674200);
INSERT INTO `rk_picture` VALUES (589, '/uploads/picture/20180310/eaebff099c961fe58bac6241eb168d19.jpg', '/uploads/picture/20180310/eaebff099c961fe58bac6241eb168d19.jpg', '', '', 1, 1520674224);
INSERT INTO `rk_picture` VALUES (590, '/uploads/picture/20180310/6bb50a462f65e4de3bda0c8bd137589d.jpg', '/uploads/picture/20180310/6bb50a462f65e4de3bda0c8bd137589d.jpg', '', '', 1, 1520674235);
INSERT INTO `rk_picture` VALUES (591, './uploads/picture/20180310/1520674606.jpg', './uploads/picture/20180310/1520674606.jpg', '', '', 1, 1520674606);
INSERT INTO `rk_picture` VALUES (592, '/uploads/picture/20180310/7037b779d265e96e393701073b41caf7.jpg', '/uploads/picture/20180310/7037b779d265e96e393701073b41caf7.jpg', '', '', 1, 1520674614);
INSERT INTO `rk_picture` VALUES (593, '/uploads/picture/20180310/d6271148abd039382b72110ff7ec6067.jpg', '/uploads/picture/20180310/d6271148abd039382b72110ff7ec6067.jpg', '', '', 1, 1520674660);
INSERT INTO `rk_picture` VALUES (594, '/uploads/picture/20180310/e182779b05591e18e9710b3099142129.jpg', '/uploads/picture/20180310/e182779b05591e18e9710b3099142129.jpg', '', '', 1, 1520674688);
INSERT INTO `rk_picture` VALUES (595, './uploads/picture/20180310/1520675206.jpg', './uploads/picture/20180310/1520675206.jpg', '', '', 1, 1520675206);
INSERT INTO `rk_picture` VALUES (596, './uploads/picture/20180310/1520675309.jpg', './uploads/picture/20180310/1520675309.jpg', '', '', 1, 1520675309);
INSERT INTO `rk_picture` VALUES (597, '/uploads/picture/20180310/01603b058553a84b2491ff877dcb46fb.jpg', '/uploads/picture/20180310/01603b058553a84b2491ff877dcb46fb.jpg', '', '', 1, 1520675332);
INSERT INTO `rk_picture` VALUES (598, '/uploads/picture/20180310/79bf82f8d7fdb634acc9fb1ad082b8f7.jpg', '/uploads/picture/20180310/79bf82f8d7fdb634acc9fb1ad082b8f7.jpg', '', '', 1, 1520675343);
INSERT INTO `rk_picture` VALUES (599, '/uploads/picture/20180310/c26c5ad486ad3e8ef03b830abd422cb3.jpg', '/uploads/picture/20180310/c26c5ad486ad3e8ef03b830abd422cb3.jpg', '', '', 1, 1520675357);
INSERT INTO `rk_picture` VALUES (600, './uploads/picture/20180310/1520676388.jpg', './uploads/picture/20180310/1520676388.jpg', '', '', 1, 1520676388);
INSERT INTO `rk_picture` VALUES (601, '/uploads/picture/20180310/9137f37cb8e5787a6a2625072dc71ad5.jpg', '/uploads/picture/20180310/9137f37cb8e5787a6a2625072dc71ad5.jpg', '', '', 1, 1520676409);
INSERT INTO `rk_picture` VALUES (602, './uploads/picture/20180310/1520676495.jpg', './uploads/picture/20180310/1520676495.jpg', '', '', 1, 1520676495);
INSERT INTO `rk_picture` VALUES (603, '/uploads/picture/20180310/85e862e296e62aa3cbf2adabe42fa9ec.jpg', '/uploads/picture/20180310/85e862e296e62aa3cbf2adabe42fa9ec.jpg', '', '', 1, 1520676526);
INSERT INTO `rk_picture` VALUES (604, '/uploads/picture/20180310/84ba29ff18d69d6e433df264af8fc12d.png', '/uploads/picture/20180310/84ba29ff18d69d6e433df264af8fc12d.png', '', '', 1, 1520680271);
INSERT INTO `rk_picture` VALUES (605, '/uploads/picture/20180310/e2251666d286f8b074cfc99738002cee.png', '/uploads/picture/20180310/e2251666d286f8b074cfc99738002cee.png', '', '', 1, 1520680314);
INSERT INTO `rk_picture` VALUES (606, '/uploads/picture/20180310/229f5a2e4f3e005a5b107986f879ab8f.png', '/uploads/picture/20180310/229f5a2e4f3e005a5b107986f879ab8f.png', '', '', 1, 1520680381);
INSERT INTO `rk_picture` VALUES (607, '/uploads/picture/20180310/4bfd85802fbbd676fff11046eb456997.png', '/uploads/picture/20180310/4bfd85802fbbd676fff11046eb456997.png', '', '', 1, 1520680452);
INSERT INTO `rk_picture` VALUES (608, '/uploads/picture/20180310/f389519bc76cd1b619220fe7913d3c57.png', '/uploads/picture/20180310/f389519bc76cd1b619220fe7913d3c57.png', '', '', 1, 1520680496);
INSERT INTO `rk_picture` VALUES (609, './uploads/picture/20180310/1520680665.jpg', './uploads/picture/20180310/1520680665.jpg', '', '', 1, 1520680665);
INSERT INTO `rk_picture` VALUES (610, '/uploads/picture/20180310/a6211ea7a5480d48dd46f7afe3986f65.jpg', '/uploads/picture/20180310/a6211ea7a5480d48dd46f7afe3986f65.jpg', '', '', 1, 1520680692);
INSERT INTO `rk_picture` VALUES (611, '/uploads/picture/20180310/16e7f5c6631e34452caf7c69ce67a154.jpg', '/uploads/picture/20180310/16e7f5c6631e34452caf7c69ce67a154.jpg', '', '', 1, 1520680692);
INSERT INTO `rk_picture` VALUES (612, './uploads/picture/20180310/1520681245.jpg', './uploads/picture/20180310/1520681245.jpg', '', '', 1, 1520681245);
INSERT INTO `rk_picture` VALUES (613, '/uploads/picture/20180310/dac2cf5d85c9ffe89147853b74962336.jpg', '/uploads/picture/20180310/dac2cf5d85c9ffe89147853b74962336.jpg', '', '', 1, 1520681258);
INSERT INTO `rk_picture` VALUES (614, './uploads/picture/20180310/1520681412.jpg', './uploads/picture/20180310/1520681412.jpg', '', '', 1, 1520681412);
INSERT INTO `rk_picture` VALUES (615, '/uploads/picture/20180310/4190ae99b67cd9f9a50dbc611a39dfc7.jpg', '/uploads/picture/20180310/4190ae99b67cd9f9a50dbc611a39dfc7.jpg', '', '', 1, 1520681430);
INSERT INTO `rk_picture` VALUES (616, './uploads/picture/20180310/1520681652.jpg', './uploads/picture/20180310/1520681652.jpg', '', '', 1, 1520681652);
INSERT INTO `rk_picture` VALUES (617, '/uploads/picture/20180310/cf0314ae507c0b2f76794feb200e3279.jpg', '/uploads/picture/20180310/cf0314ae507c0b2f76794feb200e3279.jpg', '', '', 1, 1520681676);
INSERT INTO `rk_picture` VALUES (618, './uploads/picture/20180310/1520682092.jpg', './uploads/picture/20180310/1520682092.jpg', '', '', 1, 1520682092);
INSERT INTO `rk_picture` VALUES (619, '/uploads/picture/20180310/9e4d25ce8a943453c6ea5082793aa39f.jpg', '/uploads/picture/20180310/9e4d25ce8a943453c6ea5082793aa39f.jpg', '', '', 1, 1520682139);
INSERT INTO `rk_picture` VALUES (620, './uploads/picture/20180310/1520682273.jpg', './uploads/picture/20180310/1520682273.jpg', '', '', 1, 1520682273);
INSERT INTO `rk_picture` VALUES (621, '/uploads/picture/20180310/9ca704f9e216e114f81e6170cedc2d67.jpg', '/uploads/picture/20180310/9ca704f9e216e114f81e6170cedc2d67.jpg', '', '', 1, 1520682306);
INSERT INTO `rk_picture` VALUES (622, '/uploads/picture/20180310/6ffea043476450942ff2d7520b045f74.jpg', '/uploads/picture/20180310/6ffea043476450942ff2d7520b045f74.jpg', '', '', 1, 1520682307);
INSERT INTO `rk_picture` VALUES (623, './uploads/picture/20180310/1520682531.jpg', './uploads/picture/20180310/1520682531.jpg', '', '', 1, 1520682531);
INSERT INTO `rk_picture` VALUES (624, '/uploads/picture/20180310/1bb4640eec0ad1f1bc6ab84a44ae981e.jpg', '/uploads/picture/20180310/1bb4640eec0ad1f1bc6ab84a44ae981e.jpg', '', '', 1, 1520682544);
INSERT INTO `rk_picture` VALUES (625, '/uploads/picture/20180310/40aa1b84be6fccbd662aa2434451172a.png', '/uploads/picture/20180310/40aa1b84be6fccbd662aa2434451172a.png', '', '', 1, 1520684088);
INSERT INTO `rk_picture` VALUES (626, '/uploads/picture/20180310/152069387586.jpeg', '/uploads/picture/20180310/152069387586.jpeg', '', '', 1, 1520693875);
INSERT INTO `rk_picture` VALUES (627, './uploads/picture/20180311/1520754548.jpg', './uploads/picture/20180311/1520754548.jpg', '', '', 1, 1520754548);
INSERT INTO `rk_picture` VALUES (628, '/uploads/picture/20180311/7474ca72f52a51ecc906234ce93cb079.jpg', '/uploads/picture/20180311/7474ca72f52a51ecc906234ce93cb079.jpg', '', '', 1, 1520754577);
INSERT INTO `rk_picture` VALUES (629, '/uploads/picture/20180311/0050b88274056d1d08c62bc3019fb788.jpg', '/uploads/picture/20180311/0050b88274056d1d08c62bc3019fb788.jpg', '', '', 1, 1520754613);
INSERT INTO `rk_picture` VALUES (630, './uploads/picture/20180311/1520754714.jpg', './uploads/picture/20180311/1520754714.jpg', '', '', 1, 1520754714);
INSERT INTO `rk_picture` VALUES (631, '/uploads/picture/20180311/a64651e012634b8519910d3d45d9a7f4.jpg', '/uploads/picture/20180311/a64651e012634b8519910d3d45d9a7f4.jpg', '', '', 1, 1520754735);
INSERT INTO `rk_picture` VALUES (632, '/uploads/picture/20180311/d31a0e1fe54258fdfae12eb32943ac4e.jpg', '/uploads/picture/20180311/d31a0e1fe54258fdfae12eb32943ac4e.jpg', '', '', 1, 1520754735);
INSERT INTO `rk_picture` VALUES (633, '/uploads/picture/20180311/78e2ef9709bdb6881b8548c779ec0f05.png', '/uploads/picture/20180311/78e2ef9709bdb6881b8548c779ec0f05.png', '', '', 1, 1520762209);
INSERT INTO `rk_picture` VALUES (634, '/uploads/picture/20180311/aaa2c1670c0bd1e0acf8315db27ccb20.png', '/uploads/picture/20180311/aaa2c1670c0bd1e0acf8315db27ccb20.png', '', '', 1, 1520763875);
INSERT INTO `rk_picture` VALUES (635, '/uploads/picture/20180311/7280bf6d31778f5ed4b4480d7e1e0401.png', '/uploads/picture/20180311/7280bf6d31778f5ed4b4480d7e1e0401.png', '', '', 1, 1520765035);
INSERT INTO `rk_picture` VALUES (636, './uploads/picture/20180311/1520768852.jpg', './uploads/picture/20180311/1520768852.jpg', '', '', 1, 1520768852);
INSERT INTO `rk_picture` VALUES (637, '/uploads/picture/20180311/10356d514e498a9ab1ec27fe3b6f6b13.jpg', '/uploads/picture/20180311/10356d514e498a9ab1ec27fe3b6f6b13.jpg', '', '', 1, 1520768870);
INSERT INTO `rk_picture` VALUES (638, './uploads/picture/20180311/1520769067.jpg', './uploads/picture/20180311/1520769067.jpg', '', '', 1, 1520769067);
INSERT INTO `rk_picture` VALUES (639, '/uploads/picture/20180311/50a52dfe3948e89b81a462a6a447e912.jpg', '/uploads/picture/20180311/50a52dfe3948e89b81a462a6a447e912.jpg', '', '', 1, 1520769080);
INSERT INTO `rk_picture` VALUES (640, './uploads/picture/20180311/1520769135.jpg', './uploads/picture/20180311/1520769135.jpg', '', '', 1, 1520769135);
INSERT INTO `rk_picture` VALUES (641, '/uploads/picture/20180311/002a440b5b6e6916d17240e9362e87d9.jpg', '/uploads/picture/20180311/002a440b5b6e6916d17240e9362e87d9.jpg', '', '', 1, 1520769148);
INSERT INTO `rk_picture` VALUES (642, './uploads/picture/20180311/1520769530.jpg', './uploads/picture/20180311/1520769530.jpg', '', '', 1, 1520769530);
INSERT INTO `rk_picture` VALUES (643, '/uploads/picture/20180311/f8a64ba516df2fe4c29e3e7143a81fe1.jpg', '/uploads/picture/20180311/f8a64ba516df2fe4c29e3e7143a81fe1.jpg', '', '', 1, 1520769543);
INSERT INTO `rk_picture` VALUES (644, '/uploads/picture/20180311/9612e52040ea64804c2427d41b6d3cab.jpg', '/uploads/picture/20180311/9612e52040ea64804c2427d41b6d3cab.jpg', '', '', 1, 1520769704);
INSERT INTO `rk_picture` VALUES (645, '/uploads/picture/20180311/20b8adf5047d3fe72ef29711a7624257.png', '/uploads/picture/20180311/20b8adf5047d3fe72ef29711a7624257.png', '', '', 1, 1520769975);
INSERT INTO `rk_picture` VALUES (646, '/uploads/picture/20180311/e37198f1234415d8e940421bead199cf.png', '/uploads/picture/20180311/e37198f1234415d8e940421bead199cf.png', '', '', 1, 1520769997);
INSERT INTO `rk_picture` VALUES (647, '/uploads/picture/20180311/8de44244ff3d7113e14c1b2d029db78c.png', '/uploads/picture/20180311/8de44244ff3d7113e14c1b2d029db78c.png', '', '', 1, 1520770035);
INSERT INTO `rk_picture` VALUES (648, '/uploads/picture/20180311/4ae0dcef1bb51e739c921e0f434283dc.png', '/uploads/picture/20180311/4ae0dcef1bb51e739c921e0f434283dc.png', '', '', 1, 1520770051);
INSERT INTO `rk_picture` VALUES (649, '/uploads/picture/20180311/742de3c254082ba90588bf3dae74204f.png', '/uploads/picture/20180311/742de3c254082ba90588bf3dae74204f.png', '', '', 1, 1520770201);
INSERT INTO `rk_picture` VALUES (650, '/uploads/picture/20180311/639a91df52cb17253d0c56dd3682a956.png', '/uploads/picture/20180311/639a91df52cb17253d0c56dd3682a956.png', '', '', 1, 1520770259);
INSERT INTO `rk_picture` VALUES (651, '/uploads/picture/20180311/678e753aa06b567fa2c507231cee3c54.png', '/uploads/picture/20180311/678e753aa06b567fa2c507231cee3c54.png', '', '', 1, 1520770366);
INSERT INTO `rk_picture` VALUES (652, '/uploads/picture/20180311/dca84e78e3dd9619357c9539ae80de45.png', '/uploads/picture/20180311/dca84e78e3dd9619357c9539ae80de45.png', '', '', 1, 1520770396);
INSERT INTO `rk_picture` VALUES (653, '/uploads/picture/20180311/bfd06c524319980566bda64a64a25935.png', '/uploads/picture/20180311/bfd06c524319980566bda64a64a25935.png', '', '', 1, 1520770447);
INSERT INTO `rk_picture` VALUES (654, '/uploads/picture/20180311/071113d9135d80a93a5857161a81b927.png', '/uploads/picture/20180311/071113d9135d80a93a5857161a81b927.png', '', '', 1, 1520770478);
INSERT INTO `rk_picture` VALUES (655, './uploads/picture/20180311/1520777332.jpg', './uploads/picture/20180311/1520777332.jpg', '', '', 1, 1520777332);
INSERT INTO `rk_picture` VALUES (656, '/uploads/picture/20180311/548df34eae31c66ce111cecfbdbf8280.jpg', '/uploads/picture/20180311/548df34eae31c66ce111cecfbdbf8280.jpg', '', '', 1, 1520777360);
INSERT INTO `rk_picture` VALUES (657, './uploads/picture/20180311/1520779407.jpg', './uploads/picture/20180311/1520779407.jpg', '', '', 1, 1520779407);
INSERT INTO `rk_picture` VALUES (658, './uploads/picture/20180312/1520817584.jpg', './uploads/picture/20180312/1520817584.jpg', '', '', 1, 1520817584);
INSERT INTO `rk_picture` VALUES (659, '/uploads/picture/20180312/f37c0053f12cb2de0fc544f025b67864.jpg', '/uploads/picture/20180312/f37c0053f12cb2de0fc544f025b67864.jpg', '', '', 1, 1520817607);
INSERT INTO `rk_picture` VALUES (660, '/uploads/picture/20180312/b1fc9dcf089db4ba44528d1709f415de.jpg', '/uploads/picture/20180312/b1fc9dcf089db4ba44528d1709f415de.jpg', '', '', 1, 1520817622);
INSERT INTO `rk_picture` VALUES (661, './uploads/picture/20180312/1520818139.jpg', './uploads/picture/20180312/1520818139.jpg', '', '', 1, 1520818139);
INSERT INTO `rk_picture` VALUES (662, '/uploads/picture/20180312/1cba059771c591a5f1ba4ded0d4c692b.jpg', '/uploads/picture/20180312/1cba059771c591a5f1ba4ded0d4c692b.jpg', '', '', 1, 1520818177);
INSERT INTO `rk_picture` VALUES (663, '/uploads/picture/20180312/2c1cea655269fa565fb9e220946fcc1a.jpg', '/uploads/picture/20180312/2c1cea655269fa565fb9e220946fcc1a.jpg', '', '', 1, 1520818210);
INSERT INTO `rk_picture` VALUES (664, './uploads/picture/20180312/1520818647.jpg', './uploads/picture/20180312/1520818647.jpg', '', '', 1, 1520818647);
INSERT INTO `rk_picture` VALUES (665, '/uploads/picture/20180312/4faa30735d8f91e886d13973425da203.jpg', '/uploads/picture/20180312/4faa30735d8f91e886d13973425da203.jpg', '', '', 1, 1520818656);
INSERT INTO `rk_picture` VALUES (666, '/uploads/picture/20180312/e042e0867ce9475835f71606431f6b9c.jpg', '/uploads/picture/20180312/e042e0867ce9475835f71606431f6b9c.jpg', '', '', 1, 1520818667);
INSERT INTO `rk_picture` VALUES (667, '/uploads/picture/20180312/8c55e7e7b427118422973b549ec7cd71.jpg', '/uploads/picture/20180312/8c55e7e7b427118422973b549ec7cd71.jpg', '', '', 1, 1520818697);
INSERT INTO `rk_picture` VALUES (668, './uploads/picture/20180312/1520818818.jpg', './uploads/picture/20180312/1520818818.jpg', '', '', 1, 1520818818);
INSERT INTO `rk_picture` VALUES (669, '/uploads/picture/20180312/4976a43cb4ba2d1797ece66cb6a80d97.jpg', '/uploads/picture/20180312/4976a43cb4ba2d1797ece66cb6a80d97.jpg', '', '', 1, 1520818831);
INSERT INTO `rk_picture` VALUES (670, '/uploads/picture/20180312/f621254f3d5d555f37426101d2dcdade.jpg', '/uploads/picture/20180312/f621254f3d5d555f37426101d2dcdade.jpg', '', '', 1, 1520818878);
INSERT INTO `rk_picture` VALUES (671, '/uploads/picture/20180312/08e3a662e0d654d59384ab9ca6ca4c08.jpg', '/uploads/picture/20180312/08e3a662e0d654d59384ab9ca6ca4c08.jpg', '', '', 1, 1520818890);
INSERT INTO `rk_picture` VALUES (672, './uploads/picture/20180312/1520819342.jpg', './uploads/picture/20180312/1520819342.jpg', '', '', 1, 1520819342);
INSERT INTO `rk_picture` VALUES (673, '/uploads/picture/20180312/2f074b7fdcc0fdc843683b46229af1a2.jpg', '/uploads/picture/20180312/2f074b7fdcc0fdc843683b46229af1a2.jpg', '', '', 1, 1520819355);
INSERT INTO `rk_picture` VALUES (674, './uploads/picture/20180312/1520819641.jpg', './uploads/picture/20180312/1520819641.jpg', '', '', 1, 1520819641);
INSERT INTO `rk_picture` VALUES (675, '/uploads/picture/20180312/9c8e09f0e0a219675320269682f664dc.jpg', '/uploads/picture/20180312/9c8e09f0e0a219675320269682f664dc.jpg', '', '', 1, 1520819660);
INSERT INTO `rk_picture` VALUES (676, './uploads/picture/20180312/1520819778.jpg', './uploads/picture/20180312/1520819778.jpg', '', '', 1, 1520819778);
INSERT INTO `rk_picture` VALUES (677, '/uploads/picture/20180312/08d7c4221cdb3cef96609980622c30f8.jpg', '/uploads/picture/20180312/08d7c4221cdb3cef96609980622c30f8.jpg', '', '', 1, 1520819788);
INSERT INTO `rk_picture` VALUES (678, './uploads/picture/20180312/1520819927.jpg', './uploads/picture/20180312/1520819927.jpg', '', '', 1, 1520819927);
INSERT INTO `rk_picture` VALUES (679, '/uploads/picture/20180312/22c64f8e95f10e1e5b1f8cae0b36dcd6.jpg', '/uploads/picture/20180312/22c64f8e95f10e1e5b1f8cae0b36dcd6.jpg', '', '', 1, 1520819935);
INSERT INTO `rk_picture` VALUES (680, './uploads/picture/20180312/1520820053.jpg', './uploads/picture/20180312/1520820053.jpg', '', '', 1, 1520820053);
INSERT INTO `rk_picture` VALUES (681, '/uploads/picture/20180312/63a763a91241b4d22ce384cb8275637b.jpg', '/uploads/picture/20180312/63a763a91241b4d22ce384cb8275637b.jpg', '', '', 1, 1520820084);
INSERT INTO `rk_picture` VALUES (682, './uploads/picture/20180312/1520820337.jpg', './uploads/picture/20180312/1520820337.jpg', '', '', 1, 1520820337);
INSERT INTO `rk_picture` VALUES (683, '/uploads/picture/20180312/893f6bbb7cc83b96e12024c1e42c4a4e.jpg', '/uploads/picture/20180312/893f6bbb7cc83b96e12024c1e42c4a4e.jpg', '', '', 1, 1520820349);
INSERT INTO `rk_picture` VALUES (684, './uploads/picture/20180312/1520820514.jpg', './uploads/picture/20180312/1520820514.jpg', '', '', 1, 1520820514);
INSERT INTO `rk_picture` VALUES (685, '/uploads/picture/20180312/28afd4a97a290874ff528e4099f66f81.jpg', '/uploads/picture/20180312/28afd4a97a290874ff528e4099f66f81.jpg', '', '', 1, 1520820526);
INSERT INTO `rk_picture` VALUES (686, '/uploads/picture/20180312/4b263802f5096878d4ac85aef955a5b7.jpg', '/uploads/picture/20180312/4b263802f5096878d4ac85aef955a5b7.jpg', '', '', 1, 1520820608);
INSERT INTO `rk_picture` VALUES (687, './uploads/picture/20180312/1520820773.jpg', './uploads/picture/20180312/1520820773.jpg', '', '', 1, 1520820773);
INSERT INTO `rk_picture` VALUES (688, '/uploads/picture/20180312/42d47b38343beb8e818e6ee1f6cf950d.jpg', '/uploads/picture/20180312/42d47b38343beb8e818e6ee1f6cf950d.jpg', '', '', 1, 1520820780);
INSERT INTO `rk_picture` VALUES (689, '/uploads/picture/20180312/8fe5b625bc9c111fa78d1d00102348fa.jpg', '/uploads/picture/20180312/8fe5b625bc9c111fa78d1d00102348fa.jpg', '', '', 1, 1520820831);
INSERT INTO `rk_picture` VALUES (690, '/uploads/picture/20180312/0657b2d650e6db76da2312ac31856008.jpg', '/uploads/picture/20180312/0657b2d650e6db76da2312ac31856008.jpg', '', '', 1, 1520820841);
INSERT INTO `rk_picture` VALUES (691, './uploads/picture/20180312/1520821034.jpg', './uploads/picture/20180312/1520821034.jpg', '', '', 1, 1520821034);
INSERT INTO `rk_picture` VALUES (692, '/uploads/picture/20180312/e4d1b04336e9d6fc995aa9d4090d53f7.jpg', '/uploads/picture/20180312/e4d1b04336e9d6fc995aa9d4090d53f7.jpg', '', '', 1, 1520821046);
INSERT INTO `rk_picture` VALUES (693, '/uploads/picture/20180312/67d724961efa94423633986d2996747a.jpg', '/uploads/picture/20180312/67d724961efa94423633986d2996747a.jpg', '', '', 1, 1520821091);
INSERT INTO `rk_picture` VALUES (694, '/uploads/picture/20180312/fc2449e779489e69e04356a4519200f4.jpg', '/uploads/picture/20180312/fc2449e779489e69e04356a4519200f4.jpg', '', '', 1, 1520821105);
INSERT INTO `rk_picture` VALUES (695, './uploads/picture/20180312/1520821256.jpg', './uploads/picture/20180312/1520821256.jpg', '', '', 1, 1520821256);
INSERT INTO `rk_picture` VALUES (696, '/uploads/picture/20180312/7020e6cc1e3e228836efcb9b9c67867a.jpg', '/uploads/picture/20180312/7020e6cc1e3e228836efcb9b9c67867a.jpg', '', '', 1, 1520821267);
INSERT INTO `rk_picture` VALUES (697, '/uploads/picture/20180312/ba4adeecd4c4cab93ac47e4c40c539b6.jpg', '/uploads/picture/20180312/ba4adeecd4c4cab93ac47e4c40c539b6.jpg', '', '', 1, 1520821308);
INSERT INTO `rk_picture` VALUES (698, '/uploads/picture/20180312/3a74c78814b195d1427b0a7a28d53a78.jpg', '/uploads/picture/20180312/3a74c78814b195d1427b0a7a28d53a78.jpg', '', '', 1, 1520821329);
INSERT INTO `rk_picture` VALUES (699, './uploads/picture/20180312/1520821569.jpg', './uploads/picture/20180312/1520821569.jpg', '', '', 1, 1520821569);
INSERT INTO `rk_picture` VALUES (700, '/uploads/picture/20180312/d547bc7f50e28670aea9031c9ab2258c.jpg', '/uploads/picture/20180312/d547bc7f50e28670aea9031c9ab2258c.jpg', '', '', 1, 1520821577);
INSERT INTO `rk_picture` VALUES (701, './uploads/picture/20180312/1520821754.jpg', './uploads/picture/20180312/1520821754.jpg', '', '', 1, 1520821754);
INSERT INTO `rk_picture` VALUES (702, '/uploads/picture/20180312/2fc0780ac31a7eaf9943dcfec3a1de4b.jpg', '/uploads/picture/20180312/2fc0780ac31a7eaf9943dcfec3a1de4b.jpg', '', '', 1, 1520821771);
INSERT INTO `rk_picture` VALUES (703, '/uploads/picture/20180312/bf8ed52a58456209f839d6a1d149dda3.jpg', '/uploads/picture/20180312/bf8ed52a58456209f839d6a1d149dda3.jpg', '', '', 1, 1520821795);
INSERT INTO `rk_picture` VALUES (704, '/uploads/picture/20180312/8ecd250ecca5d90b323934384fa09dfe.jpg', '/uploads/picture/20180312/8ecd250ecca5d90b323934384fa09dfe.jpg', '', '', 1, 1520821827);
INSERT INTO `rk_picture` VALUES (705, './uploads/picture/20180312/1520822889.jpg', './uploads/picture/20180312/1520822889.jpg', '', '', 1, 1520822889);
INSERT INTO `rk_picture` VALUES (706, './uploads/picture/20180312/1520823638.jpg', './uploads/picture/20180312/1520823638.jpg', '', '', 1, 1520823638);
INSERT INTO `rk_picture` VALUES (707, '/uploads/picture/20180312/4bda946bc893c95d2ea841c6ab0cb506.jpg', '/uploads/picture/20180312/4bda946bc893c95d2ea841c6ab0cb506.jpg', '', '', 1, 1520823677);
INSERT INTO `rk_picture` VALUES (708, './uploads/picture/20180312/1520823737.jpg', './uploads/picture/20180312/1520823737.jpg', '', '', 1, 1520823737);
INSERT INTO `rk_picture` VALUES (709, '/uploads/picture/20180312/4eafed0ce1d82aba8c4dc82faa434f84.jpg', '/uploads/picture/20180312/4eafed0ce1d82aba8c4dc82faa434f84.jpg', '', '', 1, 1520823747);
INSERT INTO `rk_picture` VALUES (710, '/uploads/picture/20180312/07adc80b9a62e88032686b35a157dacb.jpg', '/uploads/picture/20180312/07adc80b9a62e88032686b35a157dacb.jpg', '', '', 1, 1520823778);
INSERT INTO `rk_picture` VALUES (711, '/uploads/picture/20180312/06496833138893b1929b648eec15e92a.jpg', '/uploads/picture/20180312/06496833138893b1929b648eec15e92a.jpg', '', '', 1, 1520823788);
INSERT INTO `rk_picture` VALUES (712, './uploads/picture/20180312/1520824436.jpg', './uploads/picture/20180312/1520824436.jpg', '', '', 1, 1520824436);
INSERT INTO `rk_picture` VALUES (713, './uploads/picture/20180312/1520824535.jpg', './uploads/picture/20180312/1520824535.jpg', '', '', 1, 1520824535);
INSERT INTO `rk_picture` VALUES (714, '/uploads/picture/20180312/1c07efeb853f0e9a4cc9b73193537e35.jpg', '/uploads/picture/20180312/1c07efeb853f0e9a4cc9b73193537e35.jpg', '', '', 1, 1520824541);
INSERT INTO `rk_picture` VALUES (715, '/uploads/picture/20180312/bf3a89fc2c9db773401a0d1a3bd32002.jpg', '/uploads/picture/20180312/bf3a89fc2c9db773401a0d1a3bd32002.jpg', '', '', 1, 1520824640);
INSERT INTO `rk_picture` VALUES (716, '/uploads/picture/20180312/119ba3f2907086da320b94a01c2e028c.jpg', '/uploads/picture/20180312/119ba3f2907086da320b94a01c2e028c.jpg', '', '', 1, 1520824648);
INSERT INTO `rk_picture` VALUES (717, './uploads/picture/20180312/1520824861.jpg', './uploads/picture/20180312/1520824861.jpg', '', '', 1, 1520824861);
INSERT INTO `rk_picture` VALUES (718, '/uploads/picture/20180312/3bfcceae515a54c489bbef99acc81587.jpg', '/uploads/picture/20180312/3bfcceae515a54c489bbef99acc81587.jpg', '', '', 1, 1520824869);
INSERT INTO `rk_picture` VALUES (719, '/uploads/picture/20180312/de01c5c29f99637849bf511174ad9cc8.jpg', '/uploads/picture/20180312/de01c5c29f99637849bf511174ad9cc8.jpg', '', '', 1, 1520824877);
INSERT INTO `rk_picture` VALUES (720, '/uploads/picture/20180312/e25c99424346c4bda6b2a1bf700c1d0b.jpg', '/uploads/picture/20180312/e25c99424346c4bda6b2a1bf700c1d0b.jpg', '', '', 1, 1520824886);
INSERT INTO `rk_picture` VALUES (721, './uploads/picture/20180312/1520824942.jpg', './uploads/picture/20180312/1520824942.jpg', '', '', 1, 1520824942);
INSERT INTO `rk_picture` VALUES (722, '/uploads/picture/20180312/7cbf7e545b55b5509dfbea7f7134ea0b.jpg', '/uploads/picture/20180312/7cbf7e545b55b5509dfbea7f7134ea0b.jpg', '', '', 1, 1520824955);
INSERT INTO `rk_picture` VALUES (723, '/uploads/picture/20180312/0a6e908dcebbf989c9c56f0135dad477.jpg', '/uploads/picture/20180312/0a6e908dcebbf989c9c56f0135dad477.jpg', '', '', 1, 1520824964);
INSERT INTO `rk_picture` VALUES (724, '/uploads/picture/20180312/86404820eab47d9cb8bcf699b189b529.jpg', '/uploads/picture/20180312/86404820eab47d9cb8bcf699b189b529.jpg', '', '', 1, 1520824988);
INSERT INTO `rk_picture` VALUES (725, './uploads/picture/20180312/1520825473.jpg', './uploads/picture/20180312/1520825473.jpg', '', '', 1, 1520825473);
INSERT INTO `rk_picture` VALUES (726, './uploads/picture/20180312/1520825628.jpg', './uploads/picture/20180312/1520825628.jpg', '', '', 1, 1520825628);
INSERT INTO `rk_picture` VALUES (727, '/uploads/picture/20180312/2e6f6fc01598c2b91c8b1bc13335d482.jpg', '/uploads/picture/20180312/2e6f6fc01598c2b91c8b1bc13335d482.jpg', '', '', 1, 1520825761);
INSERT INTO `rk_picture` VALUES (728, './uploads/picture/20180312/1520826276.jpg', './uploads/picture/20180312/1520826276.jpg', '', '', 1, 1520826276);
INSERT INTO `rk_picture` VALUES (729, './uploads/picture/20180312/1520826401.jpg', './uploads/picture/20180312/1520826401.jpg', '', '', 1, 1520826401);
INSERT INTO `rk_picture` VALUES (730, './uploads/picture/20180312/1520826470.jpg', './uploads/picture/20180312/1520826470.jpg', '', '', 1, 1520826470);
INSERT INTO `rk_picture` VALUES (731, '/uploads/picture/20180312/03855939d18a76d3990bae61344968f6.jpg', '/uploads/picture/20180312/03855939d18a76d3990bae61344968f6.jpg', '', '', 1, 1520826484);
INSERT INTO `rk_picture` VALUES (732, './uploads/picture/20180312/1520827017.jpg', './uploads/picture/20180312/1520827017.jpg', '', '', 1, 1520827017);
INSERT INTO `rk_picture` VALUES (733, '/uploads/picture/20180312/235f93379eb506541da1653bd1f2827d.jpg', '/uploads/picture/20180312/235f93379eb506541da1653bd1f2827d.jpg', '', '', 1, 1520827024);
INSERT INTO `rk_picture` VALUES (734, './uploads/picture/20180312/1520827246.jpg', './uploads/picture/20180312/1520827246.jpg', '', '', 1, 1520827246);
INSERT INTO `rk_picture` VALUES (735, '/uploads/picture/20180312/f60f4d137aaf3a275e794be19d0365a4.jpg', '/uploads/picture/20180312/f60f4d137aaf3a275e794be19d0365a4.jpg', '', '', 1, 1520827254);
INSERT INTO `rk_picture` VALUES (736, './uploads/picture/20180312/1520827340.jpg', './uploads/picture/20180312/1520827340.jpg', '', '', 1, 1520827340);
INSERT INTO `rk_picture` VALUES (737, '/uploads/picture/20180312/df7b75312b3e44139b3e5871de008bc9.jpg', '/uploads/picture/20180312/df7b75312b3e44139b3e5871de008bc9.jpg', '', '', 1, 1520827347);
INSERT INTO `rk_picture` VALUES (738, '/uploads/picture/20180312/5527a25486bb172d7d1e7c51e1162bb9.jpg', '/uploads/picture/20180312/5527a25486bb172d7d1e7c51e1162bb9.jpg', '', '', 1, 1520827356);
INSERT INTO `rk_picture` VALUES (739, '/uploads/picture/20180312/37847da36942663584ffb79c81f70421.jpg', '/uploads/picture/20180312/37847da36942663584ffb79c81f70421.jpg', '', '', 1, 1520827364);
INSERT INTO `rk_picture` VALUES (740, './uploads/picture/20180312/1520827427.jpg', './uploads/picture/20180312/1520827427.jpg', '', '', 1, 1520827427);
INSERT INTO `rk_picture` VALUES (741, '/uploads/picture/20180312/1c743efd1887e745680fe21362299941.jpg', '/uploads/picture/20180312/1c743efd1887e745680fe21362299941.jpg', '', '', 1, 1520827434);
INSERT INTO `rk_picture` VALUES (742, './uploads/picture/20180312/1520836465.jpg', './uploads/picture/20180312/1520836465.jpg', '', '', 1, 1520836465);
INSERT INTO `rk_picture` VALUES (743, '/uploads/picture/20180312/aecbcf012ef49db084c4dc426bb6330a.jpg', '/uploads/picture/20180312/aecbcf012ef49db084c4dc426bb6330a.jpg', '', '', 1, 1520836480);
INSERT INTO `rk_picture` VALUES (744, '/uploads/picture/20180312/e107447edb4100a0e6733bbf9b211a7f.jpg', '/uploads/picture/20180312/e107447edb4100a0e6733bbf9b211a7f.jpg', '', '', 1, 1520839965);
INSERT INTO `rk_picture` VALUES (745, '/uploads/picture/20180312/af7ec6041975c5732a66e652d77e359f.jpg', '/uploads/picture/20180312/af7ec6041975c5732a66e652d77e359f.jpg', '', '', 1, 1520840184);
INSERT INTO `rk_picture` VALUES (746, '/uploads/picture/20180312/f88b275c7343d40eaf67f012d2a42984.jpg', '/uploads/picture/20180312/f88b275c7343d40eaf67f012d2a42984.jpg', '', '', 1, 1520840320);
INSERT INTO `rk_picture` VALUES (747, '/uploads/picture/20180312/311aa8729307c8e240ce2918db8ce9a7.jpg', '/uploads/picture/20180312/311aa8729307c8e240ce2918db8ce9a7.jpg', '', '', 1, 1520840988);
INSERT INTO `rk_picture` VALUES (748, '/uploads/picture/20180312/d264a71b04b2b99604387d41113ce3c1.jpg', '/uploads/picture/20180312/d264a71b04b2b99604387d41113ce3c1.jpg', '', '', 1, 1520840999);
INSERT INTO `rk_picture` VALUES (749, '/uploads/picture/20180312/c143d2a854d73827a96ec11684c66f43.jpg', '/uploads/picture/20180312/c143d2a854d73827a96ec11684c66f43.jpg', '', '', 1, 1520841054);
INSERT INTO `rk_picture` VALUES (750, '/uploads/picture/20180312/dd87790ab0ab8c104c5c8f7d7214ae3a.jpg', '/uploads/picture/20180312/dd87790ab0ab8c104c5c8f7d7214ae3a.jpg', '', '', 1, 1520841062);
INSERT INTO `rk_picture` VALUES (751, '/uploads/picture/20180312/33bdcb16d288ee00986ba548aa090bd8.jpg', '/uploads/picture/20180312/33bdcb16d288ee00986ba548aa090bd8.jpg', '', '', 1, 1520841077);
INSERT INTO `rk_picture` VALUES (752, '/uploads/picture/20180312/13810fa9088063177fa09d6f97f4e280.jpg', '/uploads/picture/20180312/13810fa9088063177fa09d6f97f4e280.jpg', '', '', 1, 1520841096);
INSERT INTO `rk_picture` VALUES (753, '/uploads/picture/20180312/334f230684dc0c5538f974b1bbff6b5b.jpg', '/uploads/picture/20180312/334f230684dc0c5538f974b1bbff6b5b.jpg', '', '', 1, 1520841096);
INSERT INTO `rk_picture` VALUES (754, '/uploads/picture/20180312/152084322853.jpeg', '/uploads/picture/20180312/152084322853.jpeg', '', '', 1, 1520843228);
INSERT INTO `rk_picture` VALUES (755, '/uploads/picture/20180312/152084323451.jpeg', '/uploads/picture/20180312/152084323451.jpeg', '', '', 1, 1520843234);
INSERT INTO `rk_picture` VALUES (756, '/uploads/picture/20180312/15208433849.jpeg', '/uploads/picture/20180312/15208433849.jpeg', '', '', 1, 1520843384);
INSERT INTO `rk_picture` VALUES (757, '/uploads/picture/20180312/5fb684df2a2063a7614d2abb9168d1d2.jpg', '/uploads/picture/20180312/5fb684df2a2063a7614d2abb9168d1d2.jpg', '', '', 1, 1520843622);
INSERT INTO `rk_picture` VALUES (758, '/uploads/picture/20180312/f14955962eb717a309227c1f1b9368f9.jpg', '/uploads/picture/20180312/f14955962eb717a309227c1f1b9368f9.jpg', '', '', 1, 1520843665);
INSERT INTO `rk_picture` VALUES (759, '/uploads/picture/20180312/66a439fd1c732af695789c719f5af3c5.jpg', '/uploads/picture/20180312/66a439fd1c732af695789c719f5af3c5.jpg', '', '', 1, 1520843821);
INSERT INTO `rk_picture` VALUES (760, '/uploads/picture/20180312/5c2b3094900aec45561b0669f029305b.jpg', '/uploads/picture/20180312/5c2b3094900aec45561b0669f029305b.jpg', '', '', 1, 1520843880);
INSERT INTO `rk_picture` VALUES (761, '/uploads/picture/20180312/dd138ac9454dbbd555d73bdf0639d497.jpg', '/uploads/picture/20180312/dd138ac9454dbbd555d73bdf0639d497.jpg', '', '', 1, 1520844192);
INSERT INTO `rk_picture` VALUES (762, '/uploads/picture/20180312/444d58f2b31927495247fb1dadd6a355.jpg', '/uploads/picture/20180312/444d58f2b31927495247fb1dadd6a355.jpg', '', '', 1, 1520844196);
INSERT INTO `rk_picture` VALUES (763, '/uploads/picture/20180312/5cb726d5842e97bb0360774e588ce002.jpg', '/uploads/picture/20180312/5cb726d5842e97bb0360774e588ce002.jpg', '', '', 1, 1520844211);
INSERT INTO `rk_picture` VALUES (764, '/uploads/picture/20180312/d25520946bdf38ddcbf6ad80f281b0b9.jpg', '/uploads/picture/20180312/d25520946bdf38ddcbf6ad80f281b0b9.jpg', '', '', 1, 1520844223);
INSERT INTO `rk_picture` VALUES (765, '/uploads/picture/20180312/201a5c6404782a551564b5f09d29c586.jpg', '/uploads/picture/20180312/201a5c6404782a551564b5f09d29c586.jpg', '', '', 1, 1520844232);
INSERT INTO `rk_picture` VALUES (766, '/uploads/picture/20180312/a84348fa9f3e761c259827fd8576ece7.jpg', '/uploads/picture/20180312/a84348fa9f3e761c259827fd8576ece7.jpg', '', '', 1, 1520844236);
INSERT INTO `rk_picture` VALUES (767, '/uploads/picture/20180312/f4d3ca6546c1edde7e4ad0f27d635634.jpg', '/uploads/picture/20180312/f4d3ca6546c1edde7e4ad0f27d635634.jpg', '', '', 1, 1520844749);
INSERT INTO `rk_picture` VALUES (768, '/uploads/picture/20180312/34028c48d94545a1691cf6a796a8c8ac.jpg', '/uploads/picture/20180312/34028c48d94545a1691cf6a796a8c8ac.jpg', '', '', 1, 1520844752);
INSERT INTO `rk_picture` VALUES (769, '/uploads/picture/20180312/fcfda74c7768c8eee73993dfa727d65a.jpg', '/uploads/picture/20180312/fcfda74c7768c8eee73993dfa727d65a.jpg', '', '', 1, 1520844756);
INSERT INTO `rk_picture` VALUES (770, '/uploads/picture/20180312/a8ace8e011b75d2b70dcd801547704ec.jpg', '/uploads/picture/20180312/a8ace8e011b75d2b70dcd801547704ec.jpg', '', '', 1, 1520845843);
INSERT INTO `rk_picture` VALUES (771, '/uploads/picture/20180312/0209929f06f32057e7fdc3bf4e9e707a.jpg', '/uploads/picture/20180312/0209929f06f32057e7fdc3bf4e9e707a.jpg', '', '', 1, 1520845846);
INSERT INTO `rk_picture` VALUES (772, '/uploads/picture/20180312/787f0b5b2cfe9a7cb90792e4ba0bf482.jpg', '/uploads/picture/20180312/787f0b5b2cfe9a7cb90792e4ba0bf482.jpg', '', '', 1, 1520846268);
INSERT INTO `rk_picture` VALUES (773, '/uploads/picture/20180312/8e4972d3f5571e78753635c0384a2867.jpg', '/uploads/picture/20180312/8e4972d3f5571e78753635c0384a2867.jpg', '', '', 1, 1520846272);
INSERT INTO `rk_picture` VALUES (774, '/uploads/picture/20180312/3d9d41226c79e676835b2f9ad9f61241.jpg', '/uploads/picture/20180312/3d9d41226c79e676835b2f9ad9f61241.jpg', '', '', 1, 1520846276);
INSERT INTO `rk_picture` VALUES (775, '/uploads/picture/20180312/7aacd932707ae7901d86703aeed42918.jpg', '/uploads/picture/20180312/7aacd932707ae7901d86703aeed42918.jpg', '', '', 1, 1520849275);
INSERT INTO `rk_picture` VALUES (776, '/uploads/picture/20180312/08504d77c372df168b4d864b9d50ab7d.png', '/uploads/picture/20180312/08504d77c372df168b4d864b9d50ab7d.png', '', '', 1, 1520849317);
INSERT INTO `rk_picture` VALUES (777, '/uploads/picture/20180312/b854d587d4c1ad2a1add100d8f233bb3.png', '/uploads/picture/20180312/b854d587d4c1ad2a1add100d8f233bb3.png', '', '', 1, 1520849336);
INSERT INTO `rk_picture` VALUES (778, '/uploads/picture/20180312/5f16d81f4fa60c69aef13fe6bf97b465.png', '/uploads/picture/20180312/5f16d81f4fa60c69aef13fe6bf97b465.png', '', '', 1, 1520849344);
INSERT INTO `rk_picture` VALUES (779, '/uploads/picture/20180312/03f6764327441e7eab2e4adcfb402794.png', '/uploads/picture/20180312/03f6764327441e7eab2e4adcfb402794.png', '', '', 1, 1520849383);
INSERT INTO `rk_picture` VALUES (780, '/uploads/picture/20180312/458c5e78d3daa8acb2822ef88e2fec99.jpg', '/uploads/picture/20180312/458c5e78d3daa8acb2822ef88e2fec99.jpg', '', '', 1, 1520849966);
INSERT INTO `rk_picture` VALUES (781, '/uploads/picture/20180312/046b42526ef258d397364d048b548765.jpg', '/uploads/picture/20180312/046b42526ef258d397364d048b548765.jpg', '', '', 1, 1520849969);
INSERT INTO `rk_picture` VALUES (782, '/uploads/picture/20180312/e149edce536d641151d27846d9aa5594.jpg', '/uploads/picture/20180312/e149edce536d641151d27846d9aa5594.jpg', '', '', 1, 1520849973);
INSERT INTO `rk_picture` VALUES (783, '/uploads/picture/20180312/8aba76cfb0a47e7f80416c77a4c839a3.jpg', '/uploads/picture/20180312/8aba76cfb0a47e7f80416c77a4c839a3.jpg', '', '', 1, 1520850041);
INSERT INTO `rk_picture` VALUES (784, '/uploads/picture/20180312/12430efdda68b07f48aaf036f218c0b8.jpg', '/uploads/picture/20180312/12430efdda68b07f48aaf036f218c0b8.jpg', '', '', 1, 1520850045);
INSERT INTO `rk_picture` VALUES (785, '/uploads/picture/20180312/4bdc7bbebaebd71314226fa83d1bae4c.jpg', '/uploads/picture/20180312/4bdc7bbebaebd71314226fa83d1bae4c.jpg', '', '', 1, 1520850048);
INSERT INTO `rk_picture` VALUES (786, '/uploads/picture/20180313/19544af70a301ef586cd5dbcd36b3fae.png', '/uploads/picture/20180313/19544af70a301ef586cd5dbcd36b3fae.png', '', '', 1, 1520902990);
INSERT INTO `rk_picture` VALUES (1118, '/uploads/picture/20180320/b3b369ca5909adfa5f7a2be1f68bed63.png', '/uploads/picture/20180320/b3b369ca5909adfa5f7a2be1f68bed63.png', '5e3cf9b3899a12e3775a7c7f9d57c31b', '62fef09058f7dd4dba1dead9ff97bde2182836f6', 1, 1521512281);
INSERT INTO `rk_picture` VALUES (788, '/uploads/picture/20180313/b198719a612605796427a6dbc17e72ae.png', '/uploads/picture/20180313/b198719a612605796427a6dbc17e72ae.png', '', '', 1, 1520903032);
INSERT INTO `rk_picture` VALUES (789, '/uploads/picture/20180313/4e7ad4035a01f42dd962d60c34e47a8f.png', '/uploads/picture/20180313/4e7ad4035a01f42dd962d60c34e47a8f.png', '', '', 1, 1520904558);
INSERT INTO `rk_picture` VALUES (790, '/uploads/picture/20180313/bb61a51a1cedaba5c7347e88e65b2e10.png', '/uploads/picture/20180313/bb61a51a1cedaba5c7347e88e65b2e10.png', '', '', 1, 1520904610);
INSERT INTO `rk_picture` VALUES (791, '/uploads/picture/20180313/ec05da1b421a78b6c108f7712804cde5.png', '/uploads/picture/20180313/ec05da1b421a78b6c108f7712804cde5.png', '', '', 1, 1520904620);
INSERT INTO `rk_picture` VALUES (792, '/uploads/picture/20180313/bf2e2ce69e30d60d440e664c9b003358.png', '/uploads/picture/20180313/bf2e2ce69e30d60d440e664c9b003358.png', '', '', 1, 1520904652);
INSERT INTO `rk_picture` VALUES (793, '/uploads/picture/20180313/6b4530337432d8d79818fe9f2d417d10.jpg', '/uploads/picture/20180313/6b4530337432d8d79818fe9f2d417d10.jpg', '', '', 1, 1520927972);
INSERT INTO `rk_picture` VALUES (794, '/uploads/picture/20180313/1b6f3fdefa213c95823d238ef3bfcd5f.jpg', '/uploads/picture/20180313/1b6f3fdefa213c95823d238ef3bfcd5f.jpg', '', '', 1, 1520927987);
INSERT INTO `rk_picture` VALUES (795, '/uploads/picture/20180313/2bd6b3d193fd21cdf8accf7ebd01de5e.jpg', '/uploads/picture/20180313/2bd6b3d193fd21cdf8accf7ebd01de5e.jpg', '', '', 1, 1520928023);
INSERT INTO `rk_picture` VALUES (796, '/uploads/picture/20180313/9af327bc2389000c0f312c26f6bf3064.jpg', '/uploads/picture/20180313/9af327bc2389000c0f312c26f6bf3064.jpg', '', '', 1, 1520928033);
INSERT INTO `rk_picture` VALUES (797, '/uploads/picture/20180313/6c8bb2debcb08fcd17226a82b670835d.jpg', '/uploads/picture/20180313/6c8bb2debcb08fcd17226a82b670835d.jpg', '', '', 1, 1520928054);
INSERT INTO `rk_picture` VALUES (798, '/uploads/picture/20180313/8782048c99630ad2eab42672f3e85f2b.jpg', '/uploads/picture/20180313/8782048c99630ad2eab42672f3e85f2b.jpg', '', '', 1, 1520928065);
INSERT INTO `rk_picture` VALUES (799, '/uploads/picture/20180313/c03035dbee29bf39a5a73ad8c91e72b2.jpg', '/uploads/picture/20180313/c03035dbee29bf39a5a73ad8c91e72b2.jpg', '', '', 1, 1520928085);
INSERT INTO `rk_picture` VALUES (800, '/uploads/picture/20180313/81efe9c151761cdf3b6feac85fa8d677.jpg', '/uploads/picture/20180313/81efe9c151761cdf3b6feac85fa8d677.jpg', '', '', 1, 1520928097);
INSERT INTO `rk_picture` VALUES (801, '/uploads/picture/20180313/3544d48c1fbd49f0a5c53cfa6e2e3fe7.jpg', '/uploads/picture/20180313/3544d48c1fbd49f0a5c53cfa6e2e3fe7.jpg', '', '', 1, 1520928159);
INSERT INTO `rk_picture` VALUES (802, '/uploads/picture/20180313/32bc50b75188199c5b63e74ef756b4ab.jpg', '/uploads/picture/20180313/32bc50b75188199c5b63e74ef756b4ab.jpg', '', '', 1, 1520928335);
INSERT INTO `rk_picture` VALUES (803, '/uploads/picture/20180313/5de80d5efcac43d9b6bb795d15efce48.jpg', '/uploads/picture/20180313/5de80d5efcac43d9b6bb795d15efce48.jpg', '', '', 1, 1520928349);
INSERT INTO `rk_picture` VALUES (804, '/uploads/picture/20180313/d8ebb386e432e0b2cfcf6c0398cb4e1a.jpg', '/uploads/picture/20180313/d8ebb386e432e0b2cfcf6c0398cb4e1a.jpg', '', '', 1, 1520928367);
INSERT INTO `rk_picture` VALUES (805, '/uploads/picture/20180313/6b8a490dd8789bf1b6f5f6345ec62ad7.png', '/uploads/picture/20180313/6b8a490dd8789bf1b6f5f6345ec62ad7.png', '', '', 1, 1520928644);
INSERT INTO `rk_picture` VALUES (806, '/uploads/picture/20180313/8c6764b2c0d6a0c57c4679d6649736eb.png', '/uploads/picture/20180313/8c6764b2c0d6a0c57c4679d6649736eb.png', '', '', 1, 1520928662);
INSERT INTO `rk_picture` VALUES (807, '/uploads/picture/20180313/40e8b5dd6596ecd99f968bc71cbab406.png', '/uploads/picture/20180313/40e8b5dd6596ecd99f968bc71cbab406.png', '', '', 1, 1520928690);
INSERT INTO `rk_picture` VALUES (808, '/uploads/picture/20180313/5c532fbd3bdca66b34af3f250a882c8b.png', '/uploads/picture/20180313/5c532fbd3bdca66b34af3f250a882c8b.png', '', '', 1, 1520928704);
INSERT INTO `rk_picture` VALUES (809, '/uploads/picture/20180313/4236f400276f5647b9b88873bf343140.png', '/uploads/picture/20180313/4236f400276f5647b9b88873bf343140.png', '', '', 1, 1520928714);
INSERT INTO `rk_picture` VALUES (810, '/uploads/picture/20180313/c3c3cdababc3af4a0b9e841cdd989f8f.jpg', '/uploads/picture/20180313/c3c3cdababc3af4a0b9e841cdd989f8f.jpg', '6e02cd1b37f468198343ac55c0037c97', '8acd0c1f7f59c45cfee8386f46366f1bdea8fb7e', 1, 1520929658);
INSERT INTO `rk_picture` VALUES (811, '/uploads/picture/20180313/da9bc4fde5317d240e0ae25a03692dcc.png', '/uploads/picture/20180313/da9bc4fde5317d240e0ae25a03692dcc.png', 'eb12e770b21f4ea9f73e2524ca2a8304', 'c4e94389744506df5fd0c4ae45d36dc7d9d6251d', 1, 1520930530);
INSERT INTO `rk_picture` VALUES (814, '/uploads/picture/20180313/a4b9f8172a49b808bf3de894ff398942.jpg', '/uploads/picture/20180313/a4b9f8172a49b808bf3de894ff398942.jpg', '6e02cd1b37f468198343ac55c0037c97', '8acd0c1f7f59c45cfee8386f46366f1bdea8fb7e', 1, 1520933045);
INSERT INTO `rk_picture` VALUES (813, '/uploads/picture/20180313/352ec8c2e60ff6f4227f1421412f9257.jpg', '/uploads/picture/20180313/352ec8c2e60ff6f4227f1421412f9257.jpg', '6e02cd1b37f468198343ac55c0037c97', '8acd0c1f7f59c45cfee8386f46366f1bdea8fb7e', 1, 1520930956);
INSERT INTO `rk_picture` VALUES (815, '/uploads/picture/20180313/b83e1d9390586ab433d8675c89a7efdf.jpg', '/uploads/picture/20180313/b83e1d9390586ab433d8675c89a7efdf.jpg', '1010eaec028ebcf309f747e023a25512', '1a4eb9de236177cb8cb38de56d381ce118643932', 1, 1520935362);
INSERT INTO `rk_picture` VALUES (816, '/uploads/picture/20180313/d5d6b9fa078d2d9cd8441a64af067f7a.jpg', '/uploads/picture/20180313/d5d6b9fa078d2d9cd8441a64af067f7a.jpg', 'bb8bf5f5cb6d0f646d1c9b994d8fb603', 'df622d5d589064cde65e76a3416fe046f3360c7b', 1, 1520935936);
INSERT INTO `rk_picture` VALUES (817, '/uploads/picture/20180313/1cd5f2018b3934a58898822e93e03056.jpg', '/uploads/picture/20180313/1cd5f2018b3934a58898822e93e03056.jpg', 'bb8bf5f5cb6d0f646d1c9b994d8fb603', 'df622d5d589064cde65e76a3416fe046f3360c7b', 1, 1520935977);
INSERT INTO `rk_picture` VALUES (818, '/uploads/picture/20180313/d157489c1f3df032d213c6784dfcd38d.jpg', '/uploads/picture/20180313/d157489c1f3df032d213c6784dfcd38d.jpg', '1010eaec028ebcf309f747e023a25512', '1a4eb9de236177cb8cb38de56d381ce118643932', 1, 1520938589);
INSERT INTO `rk_picture` VALUES (819, '/uploads/picture/20180313/397f54a5e08820e1144f13568915f6ed.jpg', '/uploads/picture/20180313/397f54a5e08820e1144f13568915f6ed.jpg', '', '', 1, 1520939080);
INSERT INTO `rk_picture` VALUES (820, '/uploads/picture/20180313/f09be0db293b032546519bce8b274bb6.jpg', '/uploads/picture/20180313/f09be0db293b032546519bce8b274bb6.jpg', '', '', 1, 1520939094);
INSERT INTO `rk_picture` VALUES (821, '/uploads/picture/20180313/3dc0922e60e2d09e99a7b90e48255935.jpg', '/uploads/picture/20180313/3dc0922e60e2d09e99a7b90e48255935.jpg', '', '', 1, 1520939121);
INSERT INTO `rk_picture` VALUES (822, '/uploads/picture/20180313/1c24ff8f3093595706b29742845e6124.jpg', '/uploads/picture/20180313/1c24ff8f3093595706b29742845e6124.jpg', '', '', 1, 1520939135);
INSERT INTO `rk_picture` VALUES (823, '/uploads/picture/20180313/0e3088277b20ea20b49e92d297decb3d.jpg', '/uploads/picture/20180313/0e3088277b20ea20b49e92d297decb3d.jpg', '', '', 1, 1520939150);
INSERT INTO `rk_picture` VALUES (824, '/uploads/picture/20180313/b1f02fd24ffaf88c65591d30ff584da7.jpg', '/uploads/picture/20180313/b1f02fd24ffaf88c65591d30ff584da7.jpg', '', '', 1, 1520948323);
INSERT INTO `rk_picture` VALUES (825, '/uploads/picture/20180313/50665953fe715f54678af91ffd9ba8e3.jpg', '/uploads/picture/20180313/50665953fe715f54678af91ffd9ba8e3.jpg', '', '', 1, 1520948387);
INSERT INTO `rk_picture` VALUES (826, '/uploads/picture/20180313/22e06bdda9e7cf6422a441eb59eb5a8a.jpg', '/uploads/picture/20180313/22e06bdda9e7cf6422a441eb59eb5a8a.jpg', '', '', 1, 1520948387);
INSERT INTO `rk_picture` VALUES (827, '/uploads/picture/20180313/d89d6e15b773476de5f6a072f448ff92.jpg', '/uploads/picture/20180313/d89d6e15b773476de5f6a072f448ff92.jpg', '', '', 1, 1520948424);
INSERT INTO `rk_picture` VALUES (828, '/uploads/picture/20180314/7a93d73658c932604ac2989d2dd8ff0b.jpg', '/uploads/picture/20180314/7a93d73658c932604ac2989d2dd8ff0b.jpg', '', '', 1, 1520991576);
INSERT INTO `rk_picture` VALUES (829, '/uploads/picture/20180314/5f345641468c62eb018ae7de2ef28327.jpg', '/uploads/picture/20180314/5f345641468c62eb018ae7de2ef28327.jpg', '', '', 1, 1520991588);
INSERT INTO `rk_picture` VALUES (830, '/uploads/picture/20180314/3a8fe7378353b5cd5f3a583cea6f90a2.jpg', '/uploads/picture/20180314/3a8fe7378353b5cd5f3a583cea6f90a2.jpg', '', '', 1, 1520992441);
INSERT INTO `rk_picture` VALUES (831, '/uploads/picture/20180314/d286e4bcead901f2aeb649e2d3d50b66.jpg', '/uploads/picture/20180314/d286e4bcead901f2aeb649e2d3d50b66.jpg', '', '', 1, 1520992462);
INSERT INTO `rk_picture` VALUES (832, '/uploads/picture/20180314/c190b61524738e0469ed11dd00ca076a.jpg', '/uploads/picture/20180314/c190b61524738e0469ed11dd00ca076a.jpg', '', '', 1, 1520992485);
INSERT INTO `rk_picture` VALUES (833, '/uploads/picture/20180314/19b6501c13aa25f9a614365d03185c4a.jpg', '/uploads/picture/20180314/19b6501c13aa25f9a614365d03185c4a.jpg', '', '', 1, 1521003984);
INSERT INTO `rk_picture` VALUES (834, '/uploads/picture/20180314/dd2549dc812f583d02a33be6cce3e59d.jpg', '/uploads/picture/20180314/dd2549dc812f583d02a33be6cce3e59d.jpg', '', '', 1, 1521004010);
INSERT INTO `rk_picture` VALUES (835, '/uploads/picture/20180314/77a79c4be963759fabe131ba8a8cf02f.jpg', '/uploads/picture/20180314/77a79c4be963759fabe131ba8a8cf02f.jpg', '', '', 1, 1521005418);
INSERT INTO `rk_picture` VALUES (836, '/uploads/picture/20180314/0dcd3eb90dec8a5266206874273a6a9b.jpg', '/uploads/picture/20180314/0dcd3eb90dec8a5266206874273a6a9b.jpg', '', '', 1, 1521005430);
INSERT INTO `rk_picture` VALUES (837, '/uploads/picture/20180314/ebed04213d4ceb8f7cf31a997e51a75c.jpg', '/uploads/picture/20180314/ebed04213d4ceb8f7cf31a997e51a75c.jpg', '', '', 1, 1521005444);
INSERT INTO `rk_picture` VALUES (838, '/uploads/picture/20180314/17b548f06163c924a9e71cb7e5f806c7.jpg', '/uploads/picture/20180314/17b548f06163c924a9e71cb7e5f806c7.jpg', '', '', 1, 1521006919);
INSERT INTO `rk_picture` VALUES (839, '/uploads/picture/20180314/c3c1fc4407af3486b5d832b96ea2e165.jpg', '/uploads/picture/20180314/c3c1fc4407af3486b5d832b96ea2e165.jpg', '', '', 1, 1521006931);
INSERT INTO `rk_picture` VALUES (840, '/uploads/picture/20180314/20c7d17a76926b007dc7932240c01e3d.jpg', '/uploads/picture/20180314/20c7d17a76926b007dc7932240c01e3d.jpg', '', '', 1, 1521007743);
INSERT INTO `rk_picture` VALUES (841, '/uploads/picture/20180314/b1884bf8a5f7c910109d4e8c62b975ae.jpg', '/uploads/picture/20180314/b1884bf8a5f7c910109d4e8c62b975ae.jpg', '', '', 1, 1521031455);
INSERT INTO `rk_picture` VALUES (842, '/uploads/picture/20180314/970ad796521e47e2f9f206b538f1106e.jpg', '/uploads/picture/20180314/970ad796521e47e2f9f206b538f1106e.jpg', '', '', 1, 1521031508);
INSERT INTO `rk_picture` VALUES (843, '/uploads/picture/20180314/555e34dabdfcb5fa5ce6af87a4d32972.jpg', '/uploads/picture/20180314/555e34dabdfcb5fa5ce6af87a4d32972.jpg', '', '', 1, 1521031509);
INSERT INTO `rk_picture` VALUES (844, '/uploads/picture/20180314/48a89160ef7807f06259f1aa8562aab4.jpg', '/uploads/picture/20180314/48a89160ef7807f06259f1aa8562aab4.jpg', '', '', 1, 1521031509);
INSERT INTO `rk_picture` VALUES (845, '/uploads/picture/20180314/59fea0a3937463637e3373061f151245.jpg', '/uploads/picture/20180314/59fea0a3937463637e3373061f151245.jpg', '', '', 1, 1521031658);
INSERT INTO `rk_picture` VALUES (846, '/uploads/picture/20180314/4b70b0ccc596ee498345595ff6242997.jpg', '/uploads/picture/20180314/4b70b0ccc596ee498345595ff6242997.jpg', '', '', 1, 1521031682);
INSERT INTO `rk_picture` VALUES (847, '/uploads/picture/20180314/b115a87b4a727617601394f635b2f201.jpg', '/uploads/picture/20180314/b115a87b4a727617601394f635b2f201.jpg', '', '', 1, 1521031701);
INSERT INTO `rk_picture` VALUES (848, '/uploads/picture/20180314/d6bd9a26ba4fdf3481304f880daa8bf3.png', '/uploads/picture/20180314/d6bd9a26ba4fdf3481304f880daa8bf3.png', '', '', 1, 1521041244);
INSERT INTO `rk_picture` VALUES (849, '/uploads/picture/20180314/d03d6ea505484345759e7dde198beafe.png', '/uploads/picture/20180314/d03d6ea505484345759e7dde198beafe.png', '', '', 1, 1521041453);
INSERT INTO `rk_picture` VALUES (850, '/uploads/picture/20180315/bf249ed168751e16271cd4c871fc5192.png', '/uploads/picture/20180315/bf249ed168751e16271cd4c871fc5192.png', '', '', 1, 1521079401);
INSERT INTO `rk_picture` VALUES (851, '/uploads/picture/20180315/448fa0b9a4c616bbdc51eba762b95202.png', '/uploads/picture/20180315/448fa0b9a4c616bbdc51eba762b95202.png', '', '', 1, 1521101930);
INSERT INTO `rk_picture` VALUES (852, '/uploads/picture/20180315/aa0e786b18f7aac92c084595a052e3b7.png', '/uploads/picture/20180315/aa0e786b18f7aac92c084595a052e3b7.png', '', '', 1, 1521102213);
INSERT INTO `rk_picture` VALUES (853, '/uploads/picture/20180315/abc17101ff28bdd4c2c1ed5713535c2f.png', '/uploads/picture/20180315/abc17101ff28bdd4c2c1ed5713535c2f.png', '', '', 1, 1521102242);
INSERT INTO `rk_picture` VALUES (854, '/uploads/picture/20180315/a1ca714cd564013e816e9720d9c51460.png', '/uploads/picture/20180315/a1ca714cd564013e816e9720d9c51460.png', '', '', 1, 1521102265);
INSERT INTO `rk_picture` VALUES (855, '/uploads/picture/20180315/cdeb6d14d2122b50b9bc84f9c56b11c5.png', '/uploads/picture/20180315/cdeb6d14d2122b50b9bc84f9c56b11c5.png', '', '', 1, 1521102292);
INSERT INTO `rk_picture` VALUES (856, '/uploads/picture/20180315/041b9b674330ed4a4c40c3fe5bea6975.png', '/uploads/picture/20180315/041b9b674330ed4a4c40c3fe5bea6975.png', '', '', 1, 1521102316);
INSERT INTO `rk_picture` VALUES (857, '/uploads/picture/20180315/bce7d42f1390d8cdfa6015b67bc59971.png', '/uploads/picture/20180315/bce7d42f1390d8cdfa6015b67bc59971.png', '', '', 1, 1521102394);
INSERT INTO `rk_picture` VALUES (858, '/uploads/picture/20180315/99ce273af9646e84f9e40466d427e243.png', '/uploads/picture/20180315/99ce273af9646e84f9e40466d427e243.png', '', '', 1, 1521102422);
INSERT INTO `rk_picture` VALUES (859, '/uploads/picture/20180315/ecfd2a0b168076ccc8efd1fd7e9257cc.png', '/uploads/picture/20180315/ecfd2a0b168076ccc8efd1fd7e9257cc.png', '', '', 1, 1521102475);
INSERT INTO `rk_picture` VALUES (860, '/uploads/picture/20180315/9e1d24720466d414fe6676fe31364d41.png', '/uploads/picture/20180315/9e1d24720466d414fe6676fe31364d41.png', '', '', 1, 1521102654);
INSERT INTO `rk_picture` VALUES (861, '/uploads/picture/20180315/4243e480d32ec0a0a99ec73195777841.png', '/uploads/picture/20180315/4243e480d32ec0a0a99ec73195777841.png', '', '', 1, 1521102678);
INSERT INTO `rk_picture` VALUES (862, '/uploads/picture/20180315/69b37d34f98725227bd319ec0661c9f7.png', '/uploads/picture/20180315/69b37d34f98725227bd319ec0661c9f7.png', '', '', 1, 1521102688);
INSERT INTO `rk_picture` VALUES (863, '/uploads/picture/20180315/1fe3bef97573dda7cc2bfd63019a6f12.png', '/uploads/picture/20180315/1fe3bef97573dda7cc2bfd63019a6f12.png', '', '', 1, 1521104241);
INSERT INTO `rk_picture` VALUES (864, '/uploads/picture/20180315/625420e7f5d15433b3ffe99ab7ab818e.png', '/uploads/picture/20180315/625420e7f5d15433b3ffe99ab7ab818e.png', '', '', 1, 1521104322);
INSERT INTO `rk_picture` VALUES (865, '/uploads/picture/20180315/7f376763cb6358dd972e38d6eb50e5e3.png', '/uploads/picture/20180315/7f376763cb6358dd972e38d6eb50e5e3.png', '', '', 1, 1521104359);
INSERT INTO `rk_picture` VALUES (866, '/uploads/picture/20180315/178d441e1c99ad81a7e72c92792b2f3d.png', '/uploads/picture/20180315/178d441e1c99ad81a7e72c92792b2f3d.png', '', '', 1, 1521104387);
INSERT INTO `rk_picture` VALUES (867, '/uploads/picture/20180315/598f78f49c6120208893d25f6cc2797a.png', '/uploads/picture/20180315/598f78f49c6120208893d25f6cc2797a.png', '', '', 1, 1521104601);
INSERT INTO `rk_picture` VALUES (868, '/uploads/picture/20180315/a03acd7f2c6058f16c0534e18dcb3ee1.png', '/uploads/picture/20180315/a03acd7f2c6058f16c0534e18dcb3ee1.png', '', '', 1, 1521104601);
INSERT INTO `rk_picture` VALUES (869, '/uploads/picture/20180315/1e8181fde7524c1b02ecfd06151d13d1.png', '/uploads/picture/20180315/1e8181fde7524c1b02ecfd06151d13d1.png', '', '', 1, 1521104617);
INSERT INTO `rk_picture` VALUES (870, '/uploads/picture/20180315/11ce92fafe01de790c0f574c379181b1.png', '/uploads/picture/20180315/11ce92fafe01de790c0f574c379181b1.png', '', '', 1, 1521105687);
INSERT INTO `rk_picture` VALUES (871, '/uploads/picture/20180315/59fc88a8a701bef859ff62a639ec5265.png', '/uploads/picture/20180315/59fc88a8a701bef859ff62a639ec5265.png', '', '', 1, 1521105880);
INSERT INTO `rk_picture` VALUES (872, '/uploads/picture/20180315/e2e13249fa2d9704225acc964d8508e0.png', '/uploads/picture/20180315/e2e13249fa2d9704225acc964d8508e0.png', '', '', 1, 1521105904);
INSERT INTO `rk_picture` VALUES (873, '/uploads/picture/20180315/8bd7a52a466bf5409c26800ada89615a.png', '/uploads/picture/20180315/8bd7a52a466bf5409c26800ada89615a.png', '', '', 1, 1521105942);
INSERT INTO `rk_picture` VALUES (874, '/uploads/picture/20180315/5b4474aa3be3fe911f59f0e572550879.png', '/uploads/picture/20180315/5b4474aa3be3fe911f59f0e572550879.png', '', '', 1, 1521105965);
INSERT INTO `rk_picture` VALUES (875, '/uploads/picture/20180315/575fd0c519a51b0fcb12a3217a368085.png', '/uploads/picture/20180315/575fd0c519a51b0fcb12a3217a368085.png', '', '', 1, 1521106006);
INSERT INTO `rk_picture` VALUES (876, '/uploads/picture/20180315/a298dc79029ea539bee0347456edd509.png', '/uploads/picture/20180315/a298dc79029ea539bee0347456edd509.png', '', '', 1, 1521106116);
INSERT INTO `rk_picture` VALUES (877, '/uploads/picture/20180315/55a14b6ac59e165a67311105475bd4e4.png', '/uploads/picture/20180315/55a14b6ac59e165a67311105475bd4e4.png', '', '', 1, 1521106257);
INSERT INTO `rk_picture` VALUES (878, '/uploads/picture/20180315/c3a34b872e78156a96dba1ba156b3277.png', '/uploads/picture/20180315/c3a34b872e78156a96dba1ba156b3277.png', '', '', 1, 1521106279);
INSERT INTO `rk_picture` VALUES (879, '/uploads/picture/20180315/87084552929da6d51872c15482bdc728.png', '/uploads/picture/20180315/87084552929da6d51872c15482bdc728.png', '', '', 1, 1521106311);
INSERT INTO `rk_picture` VALUES (880, '/uploads/picture/20180315/7170f09c0357bd7dc53673d976ba0d81.png', '/uploads/picture/20180315/7170f09c0357bd7dc53673d976ba0d81.png', '', '', 1, 1521106336);
INSERT INTO `rk_picture` VALUES (881, '/uploads/picture/20180315/e39b57832cc88e6432796dd4991529a7.png', '/uploads/picture/20180315/e39b57832cc88e6432796dd4991529a7.png', '', '', 1, 1521106336);
INSERT INTO `rk_picture` VALUES (882, '/uploads/picture/20180315/cbc556fa4f57ddd257df87f0a0ff7807.png', '/uploads/picture/20180315/cbc556fa4f57ddd257df87f0a0ff7807.png', '', '', 1, 1521106392);
INSERT INTO `rk_picture` VALUES (883, '/uploads/picture/20180315/3afa1e577d86faa906a344f85369e135.png', '/uploads/picture/20180315/3afa1e577d86faa906a344f85369e135.png', '', '', 1, 1521106580);
INSERT INTO `rk_picture` VALUES (884, '/uploads/picture/20180315/7f9a9485c60798d2a2ce75b89540ea42.png', '/uploads/picture/20180315/7f9a9485c60798d2a2ce75b89540ea42.png', '', '', 1, 1521106666);
INSERT INTO `rk_picture` VALUES (885, '/uploads/picture/20180315/c42e5b24fd06160048a6ddcab23eb9fc.png', '/uploads/picture/20180315/c42e5b24fd06160048a6ddcab23eb9fc.png', '', '', 1, 1521106705);
INSERT INTO `rk_picture` VALUES (886, '/uploads/picture/20180315/d1034a6bfb1819f3d1e681106e62b464.png', '/uploads/picture/20180315/d1034a6bfb1819f3d1e681106e62b464.png', '', '', 1, 1521106739);
INSERT INTO `rk_picture` VALUES (887, '/uploads/picture/20180315/8f40e9432d1fd54af4c217427659f7f1.png', '/uploads/picture/20180315/8f40e9432d1fd54af4c217427659f7f1.png', '', '', 1, 1521106826);
INSERT INTO `rk_picture` VALUES (888, '/uploads/picture/20180315/bbefcf93665d988ea4fa4a35b9fe2f26.png', '/uploads/picture/20180315/bbefcf93665d988ea4fa4a35b9fe2f26.png', '', '', 1, 1521107764);
INSERT INTO `rk_picture` VALUES (889, '/uploads/picture/20180315/21e4166e56184ccdd71a18f8267da0d3.png', '/uploads/picture/20180315/21e4166e56184ccdd71a18f8267da0d3.png', '', '', 1, 1521110109);
INSERT INTO `rk_picture` VALUES (890, '/uploads/picture/20180315/30833afceb3ef7a48916c2b375bfa49a.png', '/uploads/picture/20180315/30833afceb3ef7a48916c2b375bfa49a.png', '', '', 1, 1521110468);
INSERT INTO `rk_picture` VALUES (891, '/uploads/picture/20180315/54f09893da3afcb9646d3b566c452076.png', '/uploads/picture/20180315/54f09893da3afcb9646d3b566c452076.png', '', '', 1, 1521110504);
INSERT INTO `rk_picture` VALUES (892, '/uploads/picture/20180315/65364328f01781450da983558d2982d3.png', '/uploads/picture/20180315/65364328f01781450da983558d2982d3.png', '', '', 1, 1521110559);
INSERT INTO `rk_picture` VALUES (893, '/uploads/picture/20180315/944505cce8703211ec2af0efd9d9792a.png', '/uploads/picture/20180315/944505cce8703211ec2af0efd9d9792a.png', '', '', 1, 1521110589);
INSERT INTO `rk_picture` VALUES (894, '/uploads/picture/20180315/e5fec784f440f827e63a41a5143dc23f.png', '/uploads/picture/20180315/e5fec784f440f827e63a41a5143dc23f.png', '', '', 1, 1521110627);
INSERT INTO `rk_picture` VALUES (895, '/uploads/picture/20180315/6da37d7cd2d7e91d5f75dff2fad231d7.png', '/uploads/picture/20180315/6da37d7cd2d7e91d5f75dff2fad231d7.png', '', '', 1, 1521116367);
INSERT INTO `rk_picture` VALUES (896, '/uploads/picture/20180315/ab753933f548648d39da71c3bacf2d1b.png', '/uploads/picture/20180315/ab753933f548648d39da71c3bacf2d1b.png', '', '', 1, 1521119148);
INSERT INTO `rk_picture` VALUES (897, '/uploads/picture/20180315/02c4a2d05826c6270a09e8a65408ab38.png', '/uploads/picture/20180315/02c4a2d05826c6270a09e8a65408ab38.png', '', '', 1, 1521119291);
INSERT INTO `rk_picture` VALUES (898, '/uploads/picture/20180315/8f3922a52bec12013309a26324ef0271.png', '/uploads/picture/20180315/8f3922a52bec12013309a26324ef0271.png', '', '', 1, 1521119357);
INSERT INTO `rk_picture` VALUES (899, '/uploads/picture/20180315/45d8d965e5329da8fb7b3b526db9d92c.png', '/uploads/picture/20180315/45d8d965e5329da8fb7b3b526db9d92c.png', '', '', 1, 1521119395);
INSERT INTO `rk_picture` VALUES (900, '/uploads/picture/20180315/8159b4a8b5215e43ffb932adacad04eb.png', '/uploads/picture/20180315/8159b4a8b5215e43ffb932adacad04eb.png', '', '', 1, 1521119498);
INSERT INTO `rk_picture` VALUES (901, '/uploads/picture/20180315/efcc1a7b1a88c1ca194fe7b39ed3a33f.png', '/uploads/picture/20180315/efcc1a7b1a88c1ca194fe7b39ed3a33f.png', '', '', 1, 1521119509);
INSERT INTO `rk_picture` VALUES (902, '/uploads/picture/20180315/2b2042ce15d3b42f3a42f3b49fe69596.png', '/uploads/picture/20180315/2b2042ce15d3b42f3a42f3b49fe69596.png', '', '', 1, 1521119543);
INSERT INTO `rk_picture` VALUES (903, '/uploads/picture/20180315/641e52be6de5468d939ff45f6629ec28.png', '/uploads/picture/20180315/641e52be6de5468d939ff45f6629ec28.png', '', '', 1, 1521120120);
INSERT INTO `rk_picture` VALUES (904, '/uploads/picture/20180315/da7ad2ddc5ad104bef1778ec5d52ac2c.png', '/uploads/picture/20180315/da7ad2ddc5ad104bef1778ec5d52ac2c.png', '', '', 1, 1521120135);
INSERT INTO `rk_picture` VALUES (905, '/uploads/picture/20180315/c733eaa2411cbc57598c5edf7bb40e7e.png', '/uploads/picture/20180315/c733eaa2411cbc57598c5edf7bb40e7e.png', '', '', 1, 1521120166);
INSERT INTO `rk_picture` VALUES (906, '/uploads/picture/20180315/7cc5bd0e3aaa8acc0cfa18ddb5d7fd69.png', '/uploads/picture/20180315/7cc5bd0e3aaa8acc0cfa18ddb5d7fd69.png', '', '', 1, 1521120228);
INSERT INTO `rk_picture` VALUES (907, '/uploads/picture/20180315/33d9fdc6143d0d51410a0a6cb99342e8.png', '/uploads/picture/20180315/33d9fdc6143d0d51410a0a6cb99342e8.png', '', '', 1, 1521120270);
INSERT INTO `rk_picture` VALUES (908, '/uploads/picture/20180315/5b4e81f123618ec9c0cc4e18a823960c.png', '/uploads/picture/20180315/5b4e81f123618ec9c0cc4e18a823960c.png', '', '', 1, 1521121615);
INSERT INTO `rk_picture` VALUES (909, '/uploads/picture/20180315/952e40ed796b5178d5dd441af6c09eef.png', '/uploads/picture/20180315/952e40ed796b5178d5dd441af6c09eef.png', '', '', 1, 1521121654);
INSERT INTO `rk_picture` VALUES (910, '/uploads/picture/20180315/3c4fd93f7dd11441258af61d130156e2.png', '/uploads/picture/20180315/3c4fd93f7dd11441258af61d130156e2.png', '', '', 1, 1521121709);
INSERT INTO `rk_picture` VALUES (911, '/uploads/picture/20180315/2c42deef0c825eb874e749b119de14bb.png', '/uploads/picture/20180315/2c42deef0c825eb874e749b119de14bb.png', '', '', 1, 1521121736);
INSERT INTO `rk_picture` VALUES (912, '/uploads/picture/20180316/3066d1a626f33da391770f0836a8f46a.png', '/uploads/picture/20180316/3066d1a626f33da391770f0836a8f46a.png', '', '', 1, 1521151847);
INSERT INTO `rk_picture` VALUES (913, '/uploads/picture/20180316/b4aaa34432bd6386d3f1ba1e66fc172d.png', '/uploads/picture/20180316/b4aaa34432bd6386d3f1ba1e66fc172d.png', '', '', 1, 1521153108);
INSERT INTO `rk_picture` VALUES (914, '/uploads/picture/20180316/5d6e9b67db5c1962c46241d304a41331.png', '/uploads/picture/20180316/5d6e9b67db5c1962c46241d304a41331.png', '', '', 1, 1521153155);
INSERT INTO `rk_picture` VALUES (915, '/uploads/picture/20180316/191ece1700e780e7ece07a339b082ad9.png', '/uploads/picture/20180316/191ece1700e780e7ece07a339b082ad9.png', '', '', 1, 1521153233);
INSERT INTO `rk_picture` VALUES (916, '/uploads/picture/20180316/a110b7da72d7842312311091d1b47a14.png', '/uploads/picture/20180316/a110b7da72d7842312311091d1b47a14.png', '', '', 1, 1521153298);
INSERT INTO `rk_picture` VALUES (917, '/uploads/picture/20180316/b62ba9309aacb68a0e0d2b5d7745e854.png', '/uploads/picture/20180316/b62ba9309aacb68a0e0d2b5d7745e854.png', '', '', 1, 1521153348);
INSERT INTO `rk_picture` VALUES (918, '/uploads/picture/20180316/5aa9c3b5bcb87587dbf03d75bc883d45.png', '/uploads/picture/20180316/5aa9c3b5bcb87587dbf03d75bc883d45.png', '', '', 1, 1521154616);
INSERT INTO `rk_picture` VALUES (919, '/uploads/picture/20180316/284fc1874043f712b16cea56fa8478b9.png', '/uploads/picture/20180316/284fc1874043f712b16cea56fa8478b9.png', '', '', 1, 1521154632);
INSERT INTO `rk_picture` VALUES (920, '/uploads/picture/20180316/59fb38953500d019916636e63456d9dc.png', '/uploads/picture/20180316/59fb38953500d019916636e63456d9dc.png', '', '', 1, 1521154661);
INSERT INTO `rk_picture` VALUES (921, '/uploads/picture/20180316/f3880fb185ad2b5a1f33989d398d22b4.png', '/uploads/picture/20180316/f3880fb185ad2b5a1f33989d398d22b4.png', '', '', 1, 1521154681);
INSERT INTO `rk_picture` VALUES (922, '/uploads/picture/20180316/fdd2078e75ae90360baf551133d68ad7.png', '/uploads/picture/20180316/fdd2078e75ae90360baf551133d68ad7.png', '', '', 1, 1521154701);
INSERT INTO `rk_picture` VALUES (923, '/uploads/picture/20180316/aca099d78653f4a5fda276e3d2b01337.png', '/uploads/picture/20180316/aca099d78653f4a5fda276e3d2b01337.png', '', '', 1, 1521154707);
INSERT INTO `rk_picture` VALUES (924, '/uploads/picture/20180316/03a4868058bc569202a8eb4bbc9cfcc2.png', '/uploads/picture/20180316/03a4868058bc569202a8eb4bbc9cfcc2.png', '', '', 1, 1521154741);
INSERT INTO `rk_picture` VALUES (925, '/uploads/picture/20180316/ca86ea19b78a7a4276812549dac61eb7.png', '/uploads/picture/20180316/ca86ea19b78a7a4276812549dac61eb7.png', '', '', 1, 1521154754);
INSERT INTO `rk_picture` VALUES (926, '/uploads/picture/20180316/4168eb055b0eafc804f756646d95f73b.png', '/uploads/picture/20180316/4168eb055b0eafc804f756646d95f73b.png', '', '', 1, 1521154802);
INSERT INTO `rk_picture` VALUES (927, '/uploads/picture/20180316/a77e457372ee6f64e6d010459a213c52.png', '/uploads/picture/20180316/a77e457372ee6f64e6d010459a213c52.png', '', '', 1, 1521154827);
INSERT INTO `rk_picture` VALUES (928, '/uploads/picture/20180316/3cc6065c3ccc39d1ac6bba20eebf3b60.png', '/uploads/picture/20180316/3cc6065c3ccc39d1ac6bba20eebf3b60.png', '', '', 1, 1521154832);
INSERT INTO `rk_picture` VALUES (929, '/uploads/picture/20180316/9e0d345d8d4910d45a91d1bb6d38f448.jpg', '/uploads/picture/20180316/9e0d345d8d4910d45a91d1bb6d38f448.jpg', '', '', 1, 1521159070);
INSERT INTO `rk_picture` VALUES (930, '/uploads/picture/20180316/a140e0c923f263a6cee5446d5aa7c7fa.jpg', '/uploads/picture/20180316/a140e0c923f263a6cee5446d5aa7c7fa.jpg', '', '', 1, 1521159086);
INSERT INTO `rk_picture` VALUES (931, '/uploads/picture/20180316/d4165cb3b0f63a2270928286248574cd.jpg', '/uploads/picture/20180316/d4165cb3b0f63a2270928286248574cd.jpg', '', '', 1, 1521159105);
INSERT INTO `rk_picture` VALUES (932, '/uploads/picture/20180316/1a9641edb7c9c85445f945fc39642dac.jpg', '/uploads/picture/20180316/1a9641edb7c9c85445f945fc39642dac.jpg', '', '', 1, 1521159138);
INSERT INTO `rk_picture` VALUES (933, '/uploads/picture/20180316/fcfefef738835ef055e24078592c5e38.jpg', '/uploads/picture/20180316/fcfefef738835ef055e24078592c5e38.jpg', '', '', 1, 1521159152);
INSERT INTO `rk_picture` VALUES (934, '/uploads/picture/20180316/87772827f46d63959336e0566929f92a.jpg', '/uploads/picture/20180316/87772827f46d63959336e0566929f92a.jpg', '', '', 1, 1521159164);
INSERT INTO `rk_picture` VALUES (935, '/uploads/picture/20180316/1b9586c08ee9d0a2a2e7f84794d5e53c.jpg', '/uploads/picture/20180316/1b9586c08ee9d0a2a2e7f84794d5e53c.jpg', '', '', 1, 1521159198);
INSERT INTO `rk_picture` VALUES (936, '/uploads/picture/20180316/930b2f1367b319b695104e9cd4b22984.jpg', '/uploads/picture/20180316/930b2f1367b319b695104e9cd4b22984.jpg', '', '', 1, 1521159212);
INSERT INTO `rk_picture` VALUES (937, '/uploads/picture/20180316/6f89a3ecc484f4447969b53678ba6a0b.jpg', '/uploads/picture/20180316/6f89a3ecc484f4447969b53678ba6a0b.jpg', '', '', 1, 1521159235);
INSERT INTO `rk_picture` VALUES (938, '/uploads/picture/20180316/e43536758f703ef27ca7f17899ec0429.jpg', '/uploads/picture/20180316/e43536758f703ef27ca7f17899ec0429.jpg', '', '', 1, 1521159246);
INSERT INTO `rk_picture` VALUES (939, '/uploads/picture/20180316/014a5acc9accc839c2cb8a0bf55c6ee9.jpg', '/uploads/picture/20180316/014a5acc9accc839c2cb8a0bf55c6ee9.jpg', '', '', 1, 1521159381);
INSERT INTO `rk_picture` VALUES (940, '/uploads/picture/20180316/473010c29b3c5004deaece8108e0c66e.jpg', '/uploads/picture/20180316/473010c29b3c5004deaece8108e0c66e.jpg', '', '', 1, 1521159393);
INSERT INTO `rk_picture` VALUES (941, '/uploads/picture/20180316/453e8e262dea1e63c3a4de105e08b7a4.png', '/uploads/picture/20180316/453e8e262dea1e63c3a4de105e08b7a4.png', '', '', 1, 1521159434);
INSERT INTO `rk_picture` VALUES (942, '/uploads/picture/20180316/d01d9ef71a75b548fe4004bff82842f6.jpg', '/uploads/picture/20180316/d01d9ef71a75b548fe4004bff82842f6.jpg', '', '', 1, 1521159501);
INSERT INTO `rk_picture` VALUES (943, '/uploads/picture/20180316/36f35614a2f7a1db1d31e7eaec1cf594.jpg', '/uploads/picture/20180316/36f35614a2f7a1db1d31e7eaec1cf594.jpg', '', '', 1, 1521159516);
INSERT INTO `rk_picture` VALUES (944, '/uploads/picture/20180316/ccff0985638c8a746685b0a8767ac871.png', '/uploads/picture/20180316/ccff0985638c8a746685b0a8767ac871.png', '', '', 1, 1521164377);
INSERT INTO `rk_picture` VALUES (945, '/uploads/picture/20180316/831ae155e3a6d816350ee352a92b99b7.png', '/uploads/picture/20180316/831ae155e3a6d816350ee352a92b99b7.png', '', '', 1, 1521164418);
INSERT INTO `rk_picture` VALUES (946, '/uploads/picture/20180316/30c927d3845e7b83641de78ded6da1c6.png', '/uploads/picture/20180316/30c927d3845e7b83641de78ded6da1c6.png', '', '', 1, 1521164462);
INSERT INTO `rk_picture` VALUES (947, '/uploads/picture/20180316/6dcea8040b9ba11a2f3414cebf0eafe9.jpg', '/uploads/picture/20180316/6dcea8040b9ba11a2f3414cebf0eafe9.jpg', '', '', 1, 1521164842);
INSERT INTO `rk_picture` VALUES (948, '/uploads/picture/20180316/16b0322df4b02821a64b351f5039bffd.jpg', '/uploads/picture/20180316/16b0322df4b02821a64b351f5039bffd.jpg', '', '', 1, 1521164857);
INSERT INTO `rk_picture` VALUES (949, '/uploads/picture/20180316/aa48c9584dbb19ae3ff85c58d14d877f.jpg', '/uploads/picture/20180316/aa48c9584dbb19ae3ff85c58d14d877f.jpg', '', '', 1, 1521166070);
INSERT INTO `rk_picture` VALUES (950, '/uploads/picture/20180316/fdc8f4b5d7a7f8dac142e31766bc4c20.png', '/uploads/picture/20180316/fdc8f4b5d7a7f8dac142e31766bc4c20.png', '', '', 1, 1521167316);
INSERT INTO `rk_picture` VALUES (951, '/uploads/picture/20180316/0b25d0fa366206d30cd237a8a7cb9332.png', '/uploads/picture/20180316/0b25d0fa366206d30cd237a8a7cb9332.png', '', '', 1, 1521167317);
INSERT INTO `rk_picture` VALUES (952, '/uploads/picture/20180316/cabd21927aa971741182d8f083716178.png', '/uploads/picture/20180316/cabd21927aa971741182d8f083716178.png', '', '', 1, 1521167359);
INSERT INTO `rk_picture` VALUES (953, '/uploads/picture/20180316/0c7ea85685f56e013f205685ef2474b6.png', '/uploads/picture/20180316/0c7ea85685f56e013f205685ef2474b6.png', '', '', 1, 1521167396);
INSERT INTO `rk_picture` VALUES (954, '/uploads/picture/20180316/99316b0a15f8b09ecc228bcc37903778.png', '/uploads/picture/20180316/99316b0a15f8b09ecc228bcc37903778.png', '', '', 1, 1521167438);
INSERT INTO `rk_picture` VALUES (955, '/uploads/picture/20180316/b9b2b474820ebed86b2afe86da4382e1.png', '/uploads/picture/20180316/b9b2b474820ebed86b2afe86da4382e1.png', '', '', 1, 1521167438);
INSERT INTO `rk_picture` VALUES (956, '/uploads/picture/20180316/4784ff62cfbc72803602cf531e0917ba.png', '/uploads/picture/20180316/4784ff62cfbc72803602cf531e0917ba.png', '', '', 1, 1521167477);
INSERT INTO `rk_picture` VALUES (957, '/uploads/picture/20180316/492b852999a9b6132f2dc10ae17373f9.jpg', '/uploads/picture/20180316/492b852999a9b6132f2dc10ae17373f9.jpg', '', '', 1, 1521178140);
INSERT INTO `rk_picture` VALUES (958, '/uploads/picture/20180316/0d1e4c553eec1bb8c013af7ecbfaeb75.jpg', '/uploads/picture/20180316/0d1e4c553eec1bb8c013af7ecbfaeb75.jpg', '', '', 1, 1521178182);
INSERT INTO `rk_picture` VALUES (959, '/uploads/picture/20180316/51b7f1afcc1c3efd09b821decd369373.jpg', '/uploads/picture/20180316/51b7f1afcc1c3efd09b821decd369373.jpg', '', '', 1, 1521178329);
INSERT INTO `rk_picture` VALUES (960, '/uploads/picture/20180316/f6fa1a42a9e9f58b5d63662deaf2b7bf.jpg', '/uploads/picture/20180316/f6fa1a42a9e9f58b5d63662deaf2b7bf.jpg', '', '', 1, 1521178339);
INSERT INTO `rk_picture` VALUES (961, '/uploads/picture/20180316/b0f47771d8ed2e7894b14ff5567d877b.jpg', '/uploads/picture/20180316/b0f47771d8ed2e7894b14ff5567d877b.jpg', '', '', 1, 1521178368);
INSERT INTO `rk_picture` VALUES (962, '/uploads/picture/20180316/49df2b24dfa2a1777beadbba1cfc93cb.jpg', '/uploads/picture/20180316/49df2b24dfa2a1777beadbba1cfc93cb.jpg', '', '', 1, 1521178379);
INSERT INTO `rk_picture` VALUES (963, '/uploads/picture/20180316/cf3955e81409e68bd1688e75d64987a6.png', '/uploads/picture/20180316/cf3955e81409e68bd1688e75d64987a6.png', '', '', 1, 1521179775);
INSERT INTO `rk_picture` VALUES (964, '/uploads/picture/20180316/652b4169bf15704956ad54d5f35fb450.png', '/uploads/picture/20180316/652b4169bf15704956ad54d5f35fb450.png', '', '', 1, 1521187172);
INSERT INTO `rk_picture` VALUES (965, '/uploads/picture/20180316/fc0da89d30d990b5e3ef22ce203121f3.png', '/uploads/picture/20180316/fc0da89d30d990b5e3ef22ce203121f3.png', '', '', 1, 1521187300);
INSERT INTO `rk_picture` VALUES (966, '/uploads/picture/20180316/420f04da25b8ef784e8fb1196c0fbb2e.png', '/uploads/picture/20180316/420f04da25b8ef784e8fb1196c0fbb2e.png', '', '', 1, 1521187384);
INSERT INTO `rk_picture` VALUES (967, '/uploads/picture/20180316/02cf105705d1b7e73489bc9c2a4924f0.png', '/uploads/picture/20180316/02cf105705d1b7e73489bc9c2a4924f0.png', '', '', 1, 1521187428);
INSERT INTO `rk_picture` VALUES (968, '/uploads/picture/20180316/4f551deaee70494a9d71d974820c8541.png', '/uploads/picture/20180316/4f551deaee70494a9d71d974820c8541.png', '', '', 1, 1521187477);
INSERT INTO `rk_picture` VALUES (969, '/uploads/picture/20180316/05afd8b9194c1e0b7deb3da9a4081edb.png', '/uploads/picture/20180316/05afd8b9194c1e0b7deb3da9a4081edb.png', '', '', 1, 1521192660);
INSERT INTO `rk_picture` VALUES (970, '/uploads/picture/20180316/fe165bc4d55c671a9fdfad630b1a5fe5.png', '/uploads/picture/20180316/fe165bc4d55c671a9fdfad630b1a5fe5.png', '', '', 1, 1521192684);
INSERT INTO `rk_picture` VALUES (971, '/uploads/picture/20180316/7fbc611925b95e1f46edb0c183331ee4.png', '/uploads/picture/20180316/7fbc611925b95e1f46edb0c183331ee4.png', '', '', 1, 1521192736);
INSERT INTO `rk_picture` VALUES (972, '/uploads/picture/20180316/dc000124ff79bbf1f2df30da7a21346d.png', '/uploads/picture/20180316/dc000124ff79bbf1f2df30da7a21346d.png', '', '', 1, 1521195450);
INSERT INTO `rk_picture` VALUES (973, '/uploads/picture/20180316/d27f9e950f1d93c696f95010f2a44693.png', '/uploads/picture/20180316/d27f9e950f1d93c696f95010f2a44693.png', '', '', 1, 1521195471);
INSERT INTO `rk_picture` VALUES (974, '/uploads/picture/20180316/f0df6a8ee9574825945a9333d41ae608.png', '/uploads/picture/20180316/f0df6a8ee9574825945a9333d41ae608.png', '', '', 1, 1521195494);
INSERT INTO `rk_picture` VALUES (975, '/uploads/picture/20180316/0bea327327266d77885fc8b5c3666f09.png', '/uploads/picture/20180316/0bea327327266d77885fc8b5c3666f09.png', '', '', 1, 1521195519);
INSERT INTO `rk_picture` VALUES (976, '/uploads/picture/20180316/9e1e90eb64530ebff3c8d76ea97fd4c0.png', '/uploads/picture/20180316/9e1e90eb64530ebff3c8d76ea97fd4c0.png', '', '', 1, 1521195647);
INSERT INTO `rk_picture` VALUES (977, '/uploads/picture/20180316/fd6ac4a5809c8b5dfc910dd189e7850e.jpg', '/uploads/picture/20180316/fd6ac4a5809c8b5dfc910dd189e7850e.jpg', '', '', 1, 1521195869);
INSERT INTO `rk_picture` VALUES (978, '/uploads/picture/20180316/f5b266137dc56ebc245c1aeca6f3b047.jpg', '/uploads/picture/20180316/f5b266137dc56ebc245c1aeca6f3b047.jpg', '', '', 1, 1521195885);
INSERT INTO `rk_picture` VALUES (979, '/uploads/picture/20180316/e8c81713ccd20f37d0f993ed2c56a9a5.png', '/uploads/picture/20180316/e8c81713ccd20f37d0f993ed2c56a9a5.png', '', '', 1, 1521200377);
INSERT INTO `rk_picture` VALUES (980, '/uploads/picture/20180316/eb63b1097e7005cca7b2851e34b0e095.jpg', '/uploads/picture/20180316/eb63b1097e7005cca7b2851e34b0e095.jpg', '', '', 1, 1521200405);
INSERT INTO `rk_picture` VALUES (981, '/uploads/picture/20180316/39077cef9b112e2a7069e25106bd2fde.jpg', '/uploads/picture/20180316/39077cef9b112e2a7069e25106bd2fde.jpg', '', '', 1, 1521200421);
INSERT INTO `rk_picture` VALUES (982, '/uploads/picture/20180316/9a26ddd90a5d3c82c2298b12c18d4259.jpg', '/uploads/picture/20180316/9a26ddd90a5d3c82c2298b12c18d4259.jpg', '', '', 1, 1521200606);
INSERT INTO `rk_picture` VALUES (983, '/uploads/picture/20180316/6fa458b80c11f22ac5e3f01680b7da1d.jpg', '/uploads/picture/20180316/6fa458b80c11f22ac5e3f01680b7da1d.jpg', '', '', 1, 1521200625);
INSERT INTO `rk_picture` VALUES (984, '/uploads/picture/20180316/529d4df6f5232c89212a1fefd128bf19.jpg', '/uploads/picture/20180316/529d4df6f5232c89212a1fefd128bf19.jpg', '', '', 1, 1521200943);
INSERT INTO `rk_picture` VALUES (985, '/uploads/picture/20180316/739a547b95d0e8bbfb5be127f633783d.jpg', '/uploads/picture/20180316/739a547b95d0e8bbfb5be127f633783d.jpg', '', '', 1, 1521200958);
INSERT INTO `rk_picture` VALUES (986, '/uploads/picture/20180316/2d7502966df61f27f01e0f54dc67d339.png', '/uploads/picture/20180316/2d7502966df61f27f01e0f54dc67d339.png', '', '', 1, 1521208025);
INSERT INTO `rk_picture` VALUES (987, '/uploads/picture/20180316/c615df77f7adc28cbe5e8522ec526df0.png', '/uploads/picture/20180316/c615df77f7adc28cbe5e8522ec526df0.png', '', '', 1, 1521208100);
INSERT INTO `rk_picture` VALUES (988, '/uploads/picture/20180316/636c4a2ab159bf76c265893c4fb26a26.png', '/uploads/picture/20180316/636c4a2ab159bf76c265893c4fb26a26.png', '', '', 1, 1521208251);
INSERT INTO `rk_picture` VALUES (989, '/uploads/picture/20180316/aebe551d1685b5054b9a3f6a0e8f64eb.png', '/uploads/picture/20180316/aebe551d1685b5054b9a3f6a0e8f64eb.png', '', '', 1, 1521208526);
INSERT INTO `rk_picture` VALUES (990, '/uploads/picture/20180316/59f94fa98e86c42b40390b475de14abd.png', '/uploads/picture/20180316/59f94fa98e86c42b40390b475de14abd.png', '', '', 1, 1521208526);
INSERT INTO `rk_picture` VALUES (991, '/uploads/picture/20180316/ff0754c1a35e036a84bd744e24b41a50.png', '/uploads/picture/20180316/ff0754c1a35e036a84bd744e24b41a50.png', '', '', 1, 1521208572);
INSERT INTO `rk_picture` VALUES (992, '/uploads/picture/20180316/9e6d51cc61ac749979ed2622e305f28a.png', '/uploads/picture/20180316/9e6d51cc61ac749979ed2622e305f28a.png', '', '', 1, 1521208601);
INSERT INTO `rk_picture` VALUES (1179, '/uploads/picture/20180322/742512a4f5dbaf226ee7019f050434f2.jpg', '/uploads/picture/20180322/742512a4f5dbaf226ee7019f050434f2.jpg', '67d79321168ebf5e5be8b5da510496c4', '1734cc0c54fefd1a6044d2047b091a205896ac5e', 1, 1521706584);
INSERT INTO `rk_picture` VALUES (994, '/uploads/picture/20180317/79db87b4eae0e65bef8c61ff18119f4e.png', '/uploads/picture/20180317/79db87b4eae0e65bef8c61ff18119f4e.png', '', '', 1, 1521258956);
INSERT INTO `rk_picture` VALUES (995, '/uploads/picture/20180317/55ececba5be91c4d0829b6d65835ebfd.png', '/uploads/picture/20180317/55ececba5be91c4d0829b6d65835ebfd.png', '', '', 1, 1521259036);
INSERT INTO `rk_picture` VALUES (996, '/uploads/picture/20180317/21caafff0576c784bfb68faf6ddb2990.png', '/uploads/picture/20180317/21caafff0576c784bfb68faf6ddb2990.png', '', '', 1, 1521259068);
INSERT INTO `rk_picture` VALUES (997, '/uploads/picture/20180317/82914e3eafcca333b3ba54483f068568.png', '/uploads/picture/20180317/82914e3eafcca333b3ba54483f068568.png', '', '', 1, 1521259121);
INSERT INTO `rk_picture` VALUES (998, '/uploads/picture/20180317/7fb0ca5ef0ff62cc6943ff6c7bd56ef0.png', '/uploads/picture/20180317/7fb0ca5ef0ff62cc6943ff6c7bd56ef0.png', '', '', 1, 1521259175);
INSERT INTO `rk_picture` VALUES (999, '/uploads/picture/20180317/82cf71e06fe857266720f30cf35d78ee.png', '/uploads/picture/20180317/82cf71e06fe857266720f30cf35d78ee.png', '', '', 1, 1521265249);
INSERT INTO `rk_picture` VALUES (1000, '/uploads/picture/20180317/a2ddff464637be214c0399f789558f9a.png', '/uploads/picture/20180317/a2ddff464637be214c0399f789558f9a.png', '', '', 1, 1521265320);
INSERT INTO `rk_picture` VALUES (1001, '/uploads/picture/20180317/9f29afc5b45e3d17e28a74f744210870.png', '/uploads/picture/20180317/9f29afc5b45e3d17e28a74f744210870.png', '', '', 1, 1521276476);
INSERT INTO `rk_picture` VALUES (1002, '/uploads/picture/20180317/3e504fb4d97ffb3b04553b991d7a2043.png', '/uploads/picture/20180317/3e504fb4d97ffb3b04553b991d7a2043.png', '', '', 1, 1521282428);
INSERT INTO `rk_picture` VALUES (1003, '/uploads/picture/20180317/aa6b330da88b1071b9806a6bcf72caa1.png', '/uploads/picture/20180317/aa6b330da88b1071b9806a6bcf72caa1.png', '', '', 1, 1521282459);
INSERT INTO `rk_picture` VALUES (1004, '/uploads/picture/20180317/1255a823343c06c47019db965c9baa56.png', '/uploads/picture/20180317/1255a823343c06c47019db965c9baa56.png', '', '', 1, 1521282496);
INSERT INTO `rk_picture` VALUES (1005, '/uploads/picture/20180317/414be5874611fef72518cf44aa0d2ada.png', '/uploads/picture/20180317/414be5874611fef72518cf44aa0d2ada.png', '', '', 1, 1521282783);
INSERT INTO `rk_picture` VALUES (1006, '/uploads/picture/20180317/61671bd192ae584d1d02519313d7b0b0.png', '/uploads/picture/20180317/61671bd192ae584d1d02519313d7b0b0.png', '', '', 1, 1521282835);
INSERT INTO `rk_picture` VALUES (1007, '/uploads/picture/20180317/787d45b3d52b14ed57ffdbb324f3bac7.png', '/uploads/picture/20180317/787d45b3d52b14ed57ffdbb324f3bac7.png', '', '', 1, 1521282894);
INSERT INTO `rk_picture` VALUES (1008, '/uploads/picture/20180317/78901a863f5f0266d1925a8e638ecf25.png', '/uploads/picture/20180317/78901a863f5f0266d1925a8e638ecf25.png', '', '', 1, 1521284549);
INSERT INTO `rk_picture` VALUES (1009, '/uploads/picture/20180317/0d846f9e35b3313f3336ccc00cebfbd2.png', '/uploads/picture/20180317/0d846f9e35b3313f3336ccc00cebfbd2.png', '', '', 1, 1521284583);
INSERT INTO `rk_picture` VALUES (1010, '/uploads/picture/20180317/a7de04b4af8d33d13fc35f01bc735547.png', '/uploads/picture/20180317/a7de04b4af8d33d13fc35f01bc735547.png', '', '', 1, 1521284604);
INSERT INTO `rk_picture` VALUES (1011, '/uploads/picture/20180317/f8a52b85794b8d92c2e510b02d70f753.png', '/uploads/picture/20180317/f8a52b85794b8d92c2e510b02d70f753.png', '', '', 1, 1521284625);
INSERT INTO `rk_picture` VALUES (1012, '/uploads/picture/20180317/0f949ca4097e6f6cc5e59154098cd8bf.png', '/uploads/picture/20180317/0f949ca4097e6f6cc5e59154098cd8bf.png', '', '', 1, 1521284720);
INSERT INTO `rk_picture` VALUES (1013, '/uploads/picture/20180317/30f90238653fa3ebf9b5acf5f482ee18.png', '/uploads/picture/20180317/30f90238653fa3ebf9b5acf5f482ee18.png', '', '', 1, 1521285305);
INSERT INTO `rk_picture` VALUES (1014, '/uploads/picture/20180317/da5865c637d200d1ebb83302fee3e66a.png', '/uploads/picture/20180317/da5865c637d200d1ebb83302fee3e66a.png', '', '', 1, 1521285367);
INSERT INTO `rk_picture` VALUES (1015, '/uploads/picture/20180317/9d490f61b140a44ab045fdb1050737f0.png', '/uploads/picture/20180317/9d490f61b140a44ab045fdb1050737f0.png', '', '', 1, 1521285470);
INSERT INTO `rk_picture` VALUES (1016, '/uploads/picture/20180317/40dce3997d1086b79132fbcdd955a581.png', '/uploads/picture/20180317/40dce3997d1086b79132fbcdd955a581.png', '', '', 1, 1521285554);
INSERT INTO `rk_picture` VALUES (1017, '/uploads/picture/20180317/a76dc23329157ce6df2da5ca6defe2d7.png', '/uploads/picture/20180317/a76dc23329157ce6df2da5ca6defe2d7.png', '', '', 1, 1521285651);
INSERT INTO `rk_picture` VALUES (1018, '/uploads/picture/20180317/e184839f1c6bc9f7992b931cf8cecd15.png', '/uploads/picture/20180317/e184839f1c6bc9f7992b931cf8cecd15.png', '', '', 1, 1521285720);
INSERT INTO `rk_picture` VALUES (1019, '/uploads/picture/20180317/4d312d974aa43856392024e963fc24f1.png', '/uploads/picture/20180317/4d312d974aa43856392024e963fc24f1.png', '', '', 1, 1521285742);
INSERT INTO `rk_picture` VALUES (1020, '/uploads/picture/20180317/3a3f441faffe04a6603cf172eec74bfc.png', '/uploads/picture/20180317/3a3f441faffe04a6603cf172eec74bfc.png', '', '', 1, 1521286203);
INSERT INTO `rk_picture` VALUES (1021, '/uploads/picture/20180317/d0626aa6deb6a50b8be15c5d70bc20cb.png', '/uploads/picture/20180317/d0626aa6deb6a50b8be15c5d70bc20cb.png', '', '', 1, 1521286231);
INSERT INTO `rk_picture` VALUES (1022, '/uploads/picture/20180317/f61e1fea0a0d186c4fbbc0db0d143840.png', '/uploads/picture/20180317/f61e1fea0a0d186c4fbbc0db0d143840.png', '', '', 1, 1521286298);
INSERT INTO `rk_picture` VALUES (1023, '/uploads/picture/20180317/8e218cac9c60c9a899a65d06af3c9d2f.png', '/uploads/picture/20180317/8e218cac9c60c9a899a65d06af3c9d2f.png', '', '', 1, 1521286316);
INSERT INTO `rk_picture` VALUES (1024, '/uploads/picture/20180317/8318ec681fd827f22310189f440d9f75.png', '/uploads/picture/20180317/8318ec681fd827f22310189f440d9f75.png', '', '', 1, 1521286341);
INSERT INTO `rk_picture` VALUES (1025, '/uploads/picture/20180317/59998fc2a94eb05e7c1ca5ec97319692.png', '/uploads/picture/20180317/59998fc2a94eb05e7c1ca5ec97319692.png', '', '', 1, 1521286358);
INSERT INTO `rk_picture` VALUES (1026, '/uploads/picture/20180317/add95963d7e4b3fc1e5643a8687a945b.png', '/uploads/picture/20180317/add95963d7e4b3fc1e5643a8687a945b.png', '', '', 1, 1521286404);
INSERT INTO `rk_picture` VALUES (1027, '/uploads/picture/20180317/1e464d547fd711505038ccd59d4f81a2.png', '/uploads/picture/20180317/1e464d547fd711505038ccd59d4f81a2.png', '', '', 1, 1521292803);
INSERT INTO `rk_picture` VALUES (1028, '/uploads/picture/20180317/efa6ead625c025dcbaf26a9a25ee945c.png', '/uploads/picture/20180317/efa6ead625c025dcbaf26a9a25ee945c.png', '', '', 1, 1521292837);
INSERT INTO `rk_picture` VALUES (1029, '/uploads/picture/20180317/d5bacaaac910dddc019c382c4270b76f.png', '/uploads/picture/20180317/d5bacaaac910dddc019c382c4270b76f.png', '', '', 1, 1521292860);
INSERT INTO `rk_picture` VALUES (1030, '/uploads/picture/20180317/c57be5b62901fbb9e2341a77b5856d94.png', '/uploads/picture/20180317/c57be5b62901fbb9e2341a77b5856d94.png', '', '', 1, 1521292860);
INSERT INTO `rk_picture` VALUES (1031, '/uploads/picture/20180317/17170cb9c9baf6bd56c8403254c7c14c.png', '/uploads/picture/20180317/17170cb9c9baf6bd56c8403254c7c14c.png', '', '', 1, 1521292915);
INSERT INTO `rk_picture` VALUES (1032, '/uploads/picture/20180317/0d55b440713b857a798921860a811d99.png', '/uploads/picture/20180317/0d55b440713b857a798921860a811d99.png', '', '', 1, 1521293006);
INSERT INTO `rk_picture` VALUES (1033, '/uploads/picture/20180317/c6f96f0eba3ff708cfe7e58f19065ef1.png', '/uploads/picture/20180317/c6f96f0eba3ff708cfe7e58f19065ef1.png', '', '', 1, 1521293021);
INSERT INTO `rk_picture` VALUES (1034, '/uploads/picture/20180317/ba466ed3465faf24bbad02dd83526084.png', '/uploads/picture/20180317/ba466ed3465faf24bbad02dd83526084.png', '', '', 1, 1521293050);
INSERT INTO `rk_picture` VALUES (1035, '/uploads/picture/20180317/511a332e3bf46412a0ff5b40d7c44740.png', '/uploads/picture/20180317/511a332e3bf46412a0ff5b40d7c44740.png', '', '', 1, 1521293069);
INSERT INTO `rk_picture` VALUES (1036, '/uploads/picture/20180317/cf5e67e562928429ef7c4d10378f3f8e.png', '/uploads/picture/20180317/cf5e67e562928429ef7c4d10378f3f8e.png', '', '', 1, 1521293094);
INSERT INTO `rk_picture` VALUES (1037, '/uploads/picture/20180317/9f1b72e01d0e8ee4c4a08c900828c5bb.png', '/uploads/picture/20180317/9f1b72e01d0e8ee4c4a08c900828c5bb.png', '', '', 1, 1521294885);
INSERT INTO `rk_picture` VALUES (1038, '/uploads/picture/20180318/cf16952b6f35a22e1c6246b64090ce27.jpg', '/uploads/picture/20180318/cf16952b6f35a22e1c6246b64090ce27.jpg', '', '', 1, 1521311730);
INSERT INTO `rk_picture` VALUES (1039, '/uploads/picture/20180318/27f4ad1e7b798fa35a08bdc95cdc30b5.jpg', '/uploads/picture/20180318/27f4ad1e7b798fa35a08bdc95cdc30b5.jpg', '', '', 1, 1521311866);
INSERT INTO `rk_picture` VALUES (1040, '/uploads/picture/20180318/f9267849b1616e3f4b7ceca1bbbfa2df.jpg', '/uploads/picture/20180318/f9267849b1616e3f4b7ceca1bbbfa2df.jpg', '', '', 1, 1521312215);
INSERT INTO `rk_picture` VALUES (1041, '/uploads/picture/20180318/cb1340a7e0a1ae2b25373260397ec056.jpg', '/uploads/picture/20180318/cb1340a7e0a1ae2b25373260397ec056.jpg', '', '', 1, 1521312635);
INSERT INTO `rk_picture` VALUES (1042, '/uploads/picture/20180318/15c234e7a7998da55bc1ed68270e0d1a.jpg', '/uploads/picture/20180318/15c234e7a7998da55bc1ed68270e0d1a.jpg', '', '', 1, 1521313810);
INSERT INTO `rk_picture` VALUES (1043, '/uploads/picture/20180318/999d72a12ffd18d98c459566600dfd37.jpg', '/uploads/picture/20180318/999d72a12ffd18d98c459566600dfd37.jpg', '', '', 1, 1521313832);
INSERT INTO `rk_picture` VALUES (1044, '/uploads/picture/20180318/5adf5d332df1726c4d1711659e866f7d.jpg', '/uploads/picture/20180318/5adf5d332df1726c4d1711659e866f7d.jpg', '', '', 1, 1521314081);
INSERT INTO `rk_picture` VALUES (1045, '/uploads/picture/20180318/2e8464ec9af4ccc72be72fcc61c850a9.jpg', '/uploads/picture/20180318/2e8464ec9af4ccc72be72fcc61c850a9.jpg', '', '', 1, 1521314192);
INSERT INTO `rk_picture` VALUES (1046, '/uploads/picture/20180318/9a628b9a4fe38a35e641a061b8be7488.png', '/uploads/picture/20180318/9a628b9a4fe38a35e641a061b8be7488.png', '', '', 1, 1521325885);
INSERT INTO `rk_picture` VALUES (1047, '/uploads/picture/20180318/f3b01bafce85958cb04c6ecade39c83b.jpg', '/uploads/picture/20180318/f3b01bafce85958cb04c6ecade39c83b.jpg', '', '', 1, 1521335830);
INSERT INTO `rk_picture` VALUES (1048, '/uploads/picture/20180318/1a90a4da21c866f438bff189141bcf58.jpg', '/uploads/picture/20180318/1a90a4da21c866f438bff189141bcf58.jpg', '', '', 1, 1521335937);
INSERT INTO `rk_picture` VALUES (1049, '/uploads/picture/20180318/f54f3cd9e602e5e95822ace6ecf12a60.jpg', '/uploads/picture/20180318/f54f3cd9e602e5e95822ace6ecf12a60.jpg', '', '', 1, 1521335938);
INSERT INTO `rk_picture` VALUES (1050, '/uploads/picture/20180318/884216a808a6c07748b10d42fd7374e5.png', '/uploads/picture/20180318/884216a808a6c07748b10d42fd7374e5.png', '', '', 1, 1521337559);
INSERT INTO `rk_picture` VALUES (1051, '/uploads/picture/20180318/668df8e9a6a98048653ae5704c97ec12.png', '/uploads/picture/20180318/668df8e9a6a98048653ae5704c97ec12.png', '', '', 1, 1521337598);
INSERT INTO `rk_picture` VALUES (1052, '/uploads/picture/20180318/167e4930e34af92d71ef1b64f4efbe3f.png', '/uploads/picture/20180318/167e4930e34af92d71ef1b64f4efbe3f.png', '', '', 1, 1521337649);
INSERT INTO `rk_picture` VALUES (1053, '/uploads/picture/20180318/71f682f852038e5d8a1d817966bb1f9e.png', '/uploads/picture/20180318/71f682f852038e5d8a1d817966bb1f9e.png', '', '', 1, 1521337687);
INSERT INTO `rk_picture` VALUES (1054, '/uploads/picture/20180318/845caf49c586a32086494f22a161b54c.png', '/uploads/picture/20180318/845caf49c586a32086494f22a161b54c.png', '', '', 1, 1521337766);
INSERT INTO `rk_picture` VALUES (1055, '/uploads/picture/20180318/1af826858b649fc866ef122c5bdc3325.png', '/uploads/picture/20180318/1af826858b649fc866ef122c5bdc3325.png', '', '', 1, 1521343266);
INSERT INTO `rk_picture` VALUES (1056, '/uploads/picture/20180318/3c217ec7939bf88db148380193a74b79.png', '/uploads/picture/20180318/3c217ec7939bf88db148380193a74b79.png', '', '', 1, 1521343267);
INSERT INTO `rk_picture` VALUES (1057, '/uploads/picture/20180318/f3434aa80f3bd5d155e0b14f39065cda.png', '/uploads/picture/20180318/f3434aa80f3bd5d155e0b14f39065cda.png', '', '', 1, 1521343342);
INSERT INTO `rk_picture` VALUES (1058, '/uploads/picture/20180318/e6f9df6d13955f32a44614157dfaf73c.png', '/uploads/picture/20180318/e6f9df6d13955f32a44614157dfaf73c.png', '', '', 1, 1521343451);
INSERT INTO `rk_picture` VALUES (1059, '/uploads/picture/20180318/f800009483901b3705f22514d37281e4.png', '/uploads/picture/20180318/f800009483901b3705f22514d37281e4.png', '', '', 1, 1521343512);
INSERT INTO `rk_picture` VALUES (1060, '/uploads/picture/20180318/10b558f3383728d9cb7f6f3274c1bd68.png', '/uploads/picture/20180318/10b558f3383728d9cb7f6f3274c1bd68.png', '', '', 1, 1521343614);
INSERT INTO `rk_picture` VALUES (1061, '/uploads/picture/20180318/12d65c43268497bafcb9575724bea8c3.png', '/uploads/picture/20180318/12d65c43268497bafcb9575724bea8c3.png', '', '', 1, 1521354210);
INSERT INTO `rk_picture` VALUES (1062, '/uploads/picture/20180318/6806b9aaedc9ac069ad7a3ca3b45e5c7.png', '/uploads/picture/20180318/6806b9aaedc9ac069ad7a3ca3b45e5c7.png', '', '', 1, 1521354240);
INSERT INTO `rk_picture` VALUES (1063, '/uploads/picture/20180318/6cedb31de8b8ddb339a8fd8faedabe77.png', '/uploads/picture/20180318/6cedb31de8b8ddb339a8fd8faedabe77.png', '', '', 1, 1521354299);
INSERT INTO `rk_picture` VALUES (1064, '/uploads/picture/20180318/f113ef615ecdc5b83cf98c97bfc1fb2d.png', '/uploads/picture/20180318/f113ef615ecdc5b83cf98c97bfc1fb2d.png', '', '', 1, 1521354328);
INSERT INTO `rk_picture` VALUES (1065, '/uploads/picture/20180318/7d50e6b880e0e4e2acf2ba8746b808a0.png', '/uploads/picture/20180318/7d50e6b880e0e4e2acf2ba8746b808a0.png', '', '', 1, 1521354373);
INSERT INTO `rk_picture` VALUES (1066, '/uploads/picture/20180318/5b2419e7530848b40fd83a3deafc6a71.png', '/uploads/picture/20180318/5b2419e7530848b40fd83a3deafc6a71.png', '', '', 1, 1521354505);
INSERT INTO `rk_picture` VALUES (1067, '/uploads/picture/20180318/ca516f33e5058a7f6d41eabfea48258d.png', '/uploads/picture/20180318/ca516f33e5058a7f6d41eabfea48258d.png', '', '', 1, 1521354531);
INSERT INTO `rk_picture` VALUES (1068, '/uploads/picture/20180318/10bb863ce148f9a9ec2188d52e9ecda3.png', '/uploads/picture/20180318/10bb863ce148f9a9ec2188d52e9ecda3.png', '', '', 1, 1521354550);
INSERT INTO `rk_picture` VALUES (1069, '/uploads/picture/20180318/069b2f6c8a04e22b87cc2bb79e1011a1.png', '/uploads/picture/20180318/069b2f6c8a04e22b87cc2bb79e1011a1.png', '', '', 1, 1521356268);
INSERT INTO `rk_picture` VALUES (1070, '/uploads/picture/20180318/934eaded75d2ebc8391fdb6307a1d799.png', '/uploads/picture/20180318/934eaded75d2ebc8391fdb6307a1d799.png', '', '', 1, 1521356291);
INSERT INTO `rk_picture` VALUES (1071, '/uploads/picture/20180318/c5cb74f32fa581aad0d082f47bcf91fc.png', '/uploads/picture/20180318/c5cb74f32fa581aad0d082f47bcf91fc.png', '', '', 1, 1521356442);
INSERT INTO `rk_picture` VALUES (1072, '/uploads/picture/20180318/96dadc2b8c2decb277d597d48b5d3b3e.jpg', '/uploads/picture/20180318/96dadc2b8c2decb277d597d48b5d3b3e.jpg', '', '', 1, 1521357043);
INSERT INTO `rk_picture` VALUES (1073, '/uploads/picture/20180318/5c09d94c25490394c2978f2e07a8649b.jpg', '/uploads/picture/20180318/5c09d94c25490394c2978f2e07a8649b.jpg', '', '', 1, 1521357052);
INSERT INTO `rk_picture` VALUES (1074, '/uploads/picture/20180318/cadffcda7068f3cb0cb16190670c80d1.jpg', '/uploads/picture/20180318/cadffcda7068f3cb0cb16190670c80d1.jpg', '', '', 1, 1521357074);
INSERT INTO `rk_picture` VALUES (1075, '/uploads/picture/20180318/16499cf395d0534ca7463811769421b8.png', '/uploads/picture/20180318/16499cf395d0534ca7463811769421b8.png', '', '', 1, 1521364340);
INSERT INTO `rk_picture` VALUES (1076, '/uploads/picture/20180318/09930f039a08e0baf3eaa6b44a21f1c4.png', '/uploads/picture/20180318/09930f039a08e0baf3eaa6b44a21f1c4.png', '', '', 1, 1521364384);
INSERT INTO `rk_picture` VALUES (1077, '/uploads/picture/20180318/56256c8e78e7fdb368e5d2ef43e5e80c.png', '/uploads/picture/20180318/56256c8e78e7fdb368e5d2ef43e5e80c.png', '', '', 1, 1521364385);
INSERT INTO `rk_picture` VALUES (1078, '/uploads/picture/20180318/9f69fa86b25df808dde3cb5ba0740a19.png', '/uploads/picture/20180318/9f69fa86b25df808dde3cb5ba0740a19.png', '', '', 1, 1521364438);
INSERT INTO `rk_picture` VALUES (1079, '/uploads/picture/20180318/6766b8fbec0bcd59f646d21650b60521.png', '/uploads/picture/20180318/6766b8fbec0bcd59f646d21650b60521.png', '', '', 1, 1521364438);
INSERT INTO `rk_picture` VALUES (1080, '/uploads/picture/20180318/bc8367e594b96859e702d455b6978a53.png', '/uploads/picture/20180318/bc8367e594b96859e702d455b6978a53.png', '', '', 1, 1521364499);
INSERT INTO `rk_picture` VALUES (1081, '/uploads/picture/20180318/6e1e1492939688ae0681b083754a2bc3.png', '/uploads/picture/20180318/6e1e1492939688ae0681b083754a2bc3.png', '', '', 1, 1521364500);
INSERT INTO `rk_picture` VALUES (1082, '/uploads/picture/20180318/445b57cf234b91cca4ec5c1b8b37b079.png', '/uploads/picture/20180318/445b57cf234b91cca4ec5c1b8b37b079.png', '', '', 1, 1521364572);
INSERT INTO `rk_picture` VALUES (1083, '/uploads/picture/20180318/1b2d0732b305b524e06b7a61c5a22d96.png', '/uploads/picture/20180318/1b2d0732b305b524e06b7a61c5a22d96.png', '', '', 1, 1521364607);
INSERT INTO `rk_picture` VALUES (1084, '/uploads/picture/20180318/43e9a00ad1d47337037660b2ad481be8.png', '/uploads/picture/20180318/43e9a00ad1d47337037660b2ad481be8.png', '', '', 1, 1521375664);
INSERT INTO `rk_picture` VALUES (1085, '/uploads/picture/20180318/d54a9c82b10e7d46a4df1dc3c7b3dcae.png', '/uploads/picture/20180318/d54a9c82b10e7d46a4df1dc3c7b3dcae.png', '', '', 1, 1521375665);
INSERT INTO `rk_picture` VALUES (1086, '/uploads/picture/20180318/7ec0cee664b5eb26674919f606594f29.png', '/uploads/picture/20180318/7ec0cee664b5eb26674919f606594f29.png', '', '', 1, 1521375741);
INSERT INTO `rk_picture` VALUES (1087, '/uploads/picture/20180318/260b0845e50cbf1406e5098390b6a9a8.png', '/uploads/picture/20180318/260b0845e50cbf1406e5098390b6a9a8.png', '', '', 1, 1521375842);
INSERT INTO `rk_picture` VALUES (1088, '/uploads/picture/20180318/ca8df3e3a8962dd918deab17d1e2622d.png', '/uploads/picture/20180318/ca8df3e3a8962dd918deab17d1e2622d.png', '', '', 1, 1521375843);
INSERT INTO `rk_picture` VALUES (1089, '/uploads/picture/20180319/bc3b22f29d403ba8e5204bf4e46e2daf.png', '/uploads/picture/20180319/bc3b22f29d403ba8e5204bf4e46e2daf.png', '', '', 1, 1521427380);
INSERT INTO `rk_picture` VALUES (1090, '/uploads/picture/20180319/3c5d6a200f8f89a02888c93a8c8b167b.png', '/uploads/picture/20180319/3c5d6a200f8f89a02888c93a8c8b167b.png', '', '', 1, 1521442426);
INSERT INTO `rk_picture` VALUES (1091, '/uploads/picture/20180319/4383eec7203f8149f4e285b1bab68f1e.png', '/uploads/picture/20180319/4383eec7203f8149f4e285b1bab68f1e.png', '', '', 1, 1521442481);
INSERT INTO `rk_picture` VALUES (1092, '/uploads/picture/20180319/aadcd65ea1ae3be4169cfdd2b4bea4d2.png', '/uploads/picture/20180319/aadcd65ea1ae3be4169cfdd2b4bea4d2.png', '', '', 1, 1521442536);
INSERT INTO `rk_picture` VALUES (1093, '/uploads/picture/20180319/4225108976afd39b9a51a29cf223190e.png', '/uploads/picture/20180319/4225108976afd39b9a51a29cf223190e.png', '', '', 1, 1521442613);
INSERT INTO `rk_picture` VALUES (1094, '/uploads/picture/20180319/8396babcdec23f5ea2f60b8943e7c78d.png', '/uploads/picture/20180319/8396babcdec23f5ea2f60b8943e7c78d.png', '', '', 1, 1521442686);
INSERT INTO `rk_picture` VALUES (1095, '/uploads/picture/20180319/6bc6198fb57d02af78db338be6311e7a.png', '/uploads/picture/20180319/6bc6198fb57d02af78db338be6311e7a.png', '', '', 1, 1521442785);
INSERT INTO `rk_picture` VALUES (1096, '/uploads/picture/20180319/65aa870d329bcd52f48c8e1f67954ecc.png', '/uploads/picture/20180319/65aa870d329bcd52f48c8e1f67954ecc.png', '', '', 1, 1521443802);
INSERT INTO `rk_picture` VALUES (1097, '/uploads/picture/20180319/72990186ae0d0394ef8972ce90efa5e5.png', '/uploads/picture/20180319/72990186ae0d0394ef8972ce90efa5e5.png', '', '', 1, 1521443909);
INSERT INTO `rk_picture` VALUES (1098, '/uploads/picture/20180319/a8c832c7d6138f5df0593bc5e599107b.png', '/uploads/picture/20180319/a8c832c7d6138f5df0593bc5e599107b.png', '', '', 1, 1521443999);
INSERT INTO `rk_picture` VALUES (1099, '/uploads/picture/20180319/6f1cd705039426e653347f20e90c705f.png', '/uploads/picture/20180319/6f1cd705039426e653347f20e90c705f.png', '', '', 1, 1521444095);
INSERT INTO `rk_picture` VALUES (1100, '/uploads/picture/20180319/8a95ce8ec113e1bb2515622f034ee51f.png', '/uploads/picture/20180319/8a95ce8ec113e1bb2515622f034ee51f.png', '', '', 1, 1521444149);
INSERT INTO `rk_picture` VALUES (1101, '/uploads/picture/20180319/04cfa65745b70ce657a308749e259a67.png', '/uploads/picture/20180319/04cfa65745b70ce657a308749e259a67.png', '', '', 1, 1521447616);
INSERT INTO `rk_picture` VALUES (1102, '/uploads/picture/20180319/b8b018434f47d4e1f4d7d8450f4c97a9.png', '/uploads/picture/20180319/b8b018434f47d4e1f4d7d8450f4c97a9.png', '', '', 1, 1521447686);
INSERT INTO `rk_picture` VALUES (1103, '/uploads/picture/20180319/bde2e5d87b5b21daed2253e4146a4e92.png', '/uploads/picture/20180319/bde2e5d87b5b21daed2253e4146a4e92.png', '', '', 1, 1521447769);
INSERT INTO `rk_picture` VALUES (1104, '/uploads/picture/20180319/b4facc3264a6eab1e8d25e11511340bf.png', '/uploads/picture/20180319/b4facc3264a6eab1e8d25e11511340bf.png', '', '', 1, 1521447880);
INSERT INTO `rk_picture` VALUES (1105, '/uploads/picture/20180319/f82bbc637bbde8d83f5b4f36431af9b4.png', '/uploads/picture/20180319/f82bbc637bbde8d83f5b4f36431af9b4.png', '', '', 1, 1521447926);
INSERT INTO `rk_picture` VALUES (1106, '/uploads/picture/20180319/37a8fe01f52eec2eb565f00040e38c25.png', '/uploads/picture/20180319/37a8fe01f52eec2eb565f00040e38c25.png', '', '', 1, 1521451536);
INSERT INTO `rk_picture` VALUES (1107, '/uploads/picture/20180319/44db7a894eee60a2551fc4aae4881434.png', '/uploads/picture/20180319/44db7a894eee60a2551fc4aae4881434.png', '', '', 1, 1521451555);
INSERT INTO `rk_picture` VALUES (1108, '/uploads/picture/20180319/8ce4ffc2a48b5466c406f80cb78924a6.png', '/uploads/picture/20180319/8ce4ffc2a48b5466c406f80cb78924a6.png', '', '', 1, 1521451574);
INSERT INTO `rk_picture` VALUES (1109, '/uploads/picture/20180319/9ae1fc22bf6d3b8a81be5f005b0b0786.png', '/uploads/picture/20180319/9ae1fc22bf6d3b8a81be5f005b0b0786.png', '', '', 1, 1521451597);
INSERT INTO `rk_picture` VALUES (1110, '/uploads/picture/20180319/50d5beb6f13c3978ab4c7e5336c5f997.png', '/uploads/picture/20180319/50d5beb6f13c3978ab4c7e5336c5f997.png', '', '', 1, 1521451640);
INSERT INTO `rk_picture` VALUES (1111, '/uploads/picture/20180319/76b245210f2b725b2d6cf9005fb694ac.jpg', '/uploads/picture/20180319/76b245210f2b725b2d6cf9005fb694ac.jpg', '', '', 1, 1521461819);
INSERT INTO `rk_picture` VALUES (1112, '/uploads/picture/20180319/f145e9ac33e0fc8a0076376522d8b7ec.jpg', '/uploads/picture/20180319/f145e9ac33e0fc8a0076376522d8b7ec.jpg', '', '', 1, 1521461856);
INSERT INTO `rk_picture` VALUES (1113, '/uploads/picture/20180319/8be910aa371e2e07b8001fc62343990e.jpg', '/uploads/picture/20180319/8be910aa371e2e07b8001fc62343990e.jpg', '', '', 1, 1521461856);
INSERT INTO `rk_picture` VALUES (1114, '/uploads/picture/20180319/b06ed5657c6c3716143fd0321d3c23cb.jpg', '/uploads/picture/20180319/b06ed5657c6c3716143fd0321d3c23cb.jpg', '', '', 1, 1521461920);
INSERT INTO `rk_picture` VALUES (1115, '/uploads/picture/20180319/9faa5a64a0865cfa26d182395f03b9b8.jpg', '/uploads/picture/20180319/9faa5a64a0865cfa26d182395f03b9b8.jpg', '', '', 1, 1521461936);
INSERT INTO `rk_picture` VALUES (1119, '/uploads/picture/20180320/3dba48dd25348f891e14328552cc0925.png', '/uploads/picture/20180320/3dba48dd25348f891e14328552cc0925.png', '4c1cbd80db4a2ba8e3ba82f000aff389', 'd0314e75f29ad3d948b9544d897ad21e269f9867', 1, 1521512701);
INSERT INTO `rk_picture` VALUES (1120, '/uploads/picture/20180320/fa8d987b148df5ee6ff3c31ac2ddc3d9.png', '/uploads/picture/20180320/fa8d987b148df5ee6ff3c31ac2ddc3d9.png', '4c1cbd80db4a2ba8e3ba82f000aff389', 'd0314e75f29ad3d948b9544d897ad21e269f9867', 1, 1521512897);
INSERT INTO `rk_picture` VALUES (1121, '/uploads/picture/20180320/8b15ed00c642368e7d616781e3027dad.png', '/uploads/picture/20180320/8b15ed00c642368e7d616781e3027dad.png', '6625158d4086bc9e38a6a81fbb840b94', '1da4a99bcd6b6547e3f179f2cd450c5d8b8ce56c', 1, 1521514007);
INSERT INTO `rk_picture` VALUES (1122, '/uploads/picture/20180320/b962901e1270d6c279d0b26279142f4e.png', '/uploads/picture/20180320/b962901e1270d6c279d0b26279142f4e.png', 'dbb38b680063f1b1422692899f7e27d2', 'd54617b9536541114f0d791df4a24e1d09d1df60', 1, 1521514026);
INSERT INTO `rk_picture` VALUES (1123, '/uploads/picture/20180320/0396752a1df1acca25d71cef0ea3da46.png', '/uploads/picture/20180320/0396752a1df1acca25d71cef0ea3da46.png', '6625158d4086bc9e38a6a81fbb840b94', '1da4a99bcd6b6547e3f179f2cd450c5d8b8ce56c', 1, 1521514030);
INSERT INTO `rk_picture` VALUES (1124, '/uploads/picture/20180320/298be6fefe4fb91fd537fb302f09c89f.png', '/uploads/picture/20180320/298be6fefe4fb91fd537fb302f09c89f.png', '4c1cbd80db4a2ba8e3ba82f000aff389', 'd0314e75f29ad3d948b9544d897ad21e269f9867', 1, 1521514035);
INSERT INTO `rk_picture` VALUES (1125, '/uploads/picture/20180320/f416934715d00e5e37dd5ec2480c338a.png', '/uploads/picture/20180320/f416934715d00e5e37dd5ec2480c338a.png', '5e3cf9b3899a12e3775a7c7f9d57c31b', '62fef09058f7dd4dba1dead9ff97bde2182836f6', 1, 1521514039);
INSERT INTO `rk_picture` VALUES (1126, '/uploads/picture/20180320/a2316065cf9891a30a6c2dde98a40098.png', '/uploads/picture/20180320/a2316065cf9891a30a6c2dde98a40098.png', '5e3cf9b3899a12e3775a7c7f9d57c31b', '62fef09058f7dd4dba1dead9ff97bde2182836f6', 1, 1521514111);
INSERT INTO `rk_picture` VALUES (1127, '/uploads/picture/20180320/868d5effef8e6d46f980068d849cb2a5.png', '/uploads/picture/20180320/868d5effef8e6d46f980068d849cb2a5.png', '6625158d4086bc9e38a6a81fbb840b94', '1da4a99bcd6b6547e3f179f2cd450c5d8b8ce56c', 1, 1521514121);
INSERT INTO `rk_picture` VALUES (1128, '/uploads/picture/20180320/1ba57faf92d87005fd1643501b2b6472.png', '/uploads/picture/20180320/1ba57faf92d87005fd1643501b2b6472.png', '7b72b90f9b1a7a7e155768098263b9d4', 'a0d67b1e0b2cf4b34ffc0f96fc569a7bcbf4b0c4', 1, 1521514125);
INSERT INTO `rk_picture` VALUES (1129, '/uploads/picture/20180320/30c990d6349a2046ad527816ecc3558f.png', '/uploads/picture/20180320/30c990d6349a2046ad527816ecc3558f.png', '4c1cbd80db4a2ba8e3ba82f000aff389', 'd0314e75f29ad3d948b9544d897ad21e269f9867', 1, 1521514129);
INSERT INTO `rk_picture` VALUES (1130, '/uploads/picture/20180320/f6566d073601ef389b9324fc2414b4f7.png', '/uploads/picture/20180320/f6566d073601ef389b9324fc2414b4f7.png', '5e3cf9b3899a12e3775a7c7f9d57c31b', '62fef09058f7dd4dba1dead9ff97bde2182836f6', 1, 1521514135);
INSERT INTO `rk_picture` VALUES (1131, '/uploads/picture/20180320/32f7f2ac8237c68c94a42d92008ec4d1.png', '/uploads/picture/20180320/32f7f2ac8237c68c94a42d92008ec4d1.png', '4c1cbd80db4a2ba8e3ba82f000aff389', 'd0314e75f29ad3d948b9544d897ad21e269f9867', 1, 1521514173);
INSERT INTO `rk_picture` VALUES (1132, '/uploads/picture/20180320/f2bdc8fdd9e1e3fb0f688d905eca2dbb.png', '/uploads/picture/20180320/f2bdc8fdd9e1e3fb0f688d905eca2dbb.png', 'cbf76a407d396a672c0baf724c8d1276', '4b901889129fbb30790006710181b5323843a419', 1, 1521514181);
INSERT INTO `rk_picture` VALUES (1133, '/uploads/picture/20180320/bed40d57a3a87c77aec0f464e9143f6f.png', '/uploads/picture/20180320/bed40d57a3a87c77aec0f464e9143f6f.png', '', '', 1, 1521514585);
INSERT INTO `rk_picture` VALUES (1134, '/uploads/picture/20180320/837353cf2d3ef53ea65e94035fea3cee.png', '/uploads/picture/20180320/837353cf2d3ef53ea65e94035fea3cee.png', '', '', 1, 1521514644);
INSERT INTO `rk_picture` VALUES (1135, '/uploads/picture/20180320/0558c7f62a780491a28428949db415dd.png', '/uploads/picture/20180320/0558c7f62a780491a28428949db415dd.png', '', '', 1, 1521514687);
INSERT INTO `rk_picture` VALUES (1136, '/uploads/picture/20180320/832163350de5547db1998a89917c82e2.png', '/uploads/picture/20180320/832163350de5547db1998a89917c82e2.png', '', '', 1, 1521514721);
INSERT INTO `rk_picture` VALUES (1137, '/uploads/picture/20180320/e37960190a09d70332ebf9181c266496.png', '/uploads/picture/20180320/e37960190a09d70332ebf9181c266496.png', '', '', 1, 1521514771);
INSERT INTO `rk_picture` VALUES (1139, '/uploads/picture/20180320/8d9e34b24971d35c232e60e7f4a9e04f.png', '/uploads/picture/20180320/8d9e34b24971d35c232e60e7f4a9e04f.png', '5e3cf9b3899a12e3775a7c7f9d57c31b', '62fef09058f7dd4dba1dead9ff97bde2182836f6', 1, 1521529186);
INSERT INTO `rk_picture` VALUES (1140, '/uploads/picture/20180320/11db42cf372dc0d9636d88bb955fc706.png', '/uploads/picture/20180320/11db42cf372dc0d9636d88bb955fc706.png', '7b72b90f9b1a7a7e155768098263b9d4', 'a0d67b1e0b2cf4b34ffc0f96fc569a7bcbf4b0c4', 1, 1521529192);
INSERT INTO `rk_picture` VALUES (1141, '/uploads/picture/20180320/a7b5ae6c19f46bad4268b37c720c2283.png', '/uploads/picture/20180320/a7b5ae6c19f46bad4268b37c720c2283.png', '4c1cbd80db4a2ba8e3ba82f000aff389', 'd0314e75f29ad3d948b9544d897ad21e269f9867', 1, 1521529196);
INSERT INTO `rk_picture` VALUES (1142, '/uploads/picture/20180320/31d4d56ca190394c70745c7d46928b56.png', '/uploads/picture/20180320/31d4d56ca190394c70745c7d46928b56.png', 'c393327f52632a4c49718af5f784e0e8', '7c380602644118a99ae9e8f3cf198f42544c9794', 1, 1521529423);
INSERT INTO `rk_picture` VALUES (1143, '/uploads/picture/20180320/996d2cd6c162e8a597caab09fc190b84.png', '/uploads/picture/20180320/996d2cd6c162e8a597caab09fc190b84.png', '5e3cf9b3899a12e3775a7c7f9d57c31b', '62fef09058f7dd4dba1dead9ff97bde2182836f6', 1, 1521529428);
INSERT INTO `rk_picture` VALUES (1144, '/uploads/picture/20180320/a5bbc4319c755958211e7016acfab4e0.png', '/uploads/picture/20180320/a5bbc4319c755958211e7016acfab4e0.png', '7b72b90f9b1a7a7e155768098263b9d4', 'a0d67b1e0b2cf4b34ffc0f96fc569a7bcbf4b0c4', 1, 1521529433);
INSERT INTO `rk_picture` VALUES (1145, '/uploads/picture/20180320/63742fde57c3ab756aedc5a794d464ae.png', '/uploads/picture/20180320/63742fde57c3ab756aedc5a794d464ae.png', '4c1cbd80db4a2ba8e3ba82f000aff389', 'd0314e75f29ad3d948b9544d897ad21e269f9867', 1, 1521529437);
INSERT INTO `rk_picture` VALUES (1146, '/uploads/picture/20180320/c649e1b74e81bf58eb8ead54c82446d0.png', '/uploads/picture/20180320/c649e1b74e81bf58eb8ead54c82446d0.png', 'a57d4a256b37f1edadc3ad7dbdb5def8', 'cf1487a23eaebce5896c3ea82bbfb3e7c6bc682f', 1, 1521531321);
INSERT INTO `rk_picture` VALUES (1147, '/uploads/picture/20180320/50e5e90e0c29435525c679576b8b81ee.png', '/uploads/picture/20180320/50e5e90e0c29435525c679576b8b81ee.png', '4c1cbd80db4a2ba8e3ba82f000aff389', 'd0314e75f29ad3d948b9544d897ad21e269f9867', 1, 1521531335);
INSERT INTO `rk_picture` VALUES (1148, '/uploads/picture/20180320/d47883681163e2040e77122c8a903d68.png', '/uploads/picture/20180320/d47883681163e2040e77122c8a903d68.png', '7b72b90f9b1a7a7e155768098263b9d4', 'a0d67b1e0b2cf4b34ffc0f96fc569a7bcbf4b0c4', 1, 1521531340);
INSERT INTO `rk_picture` VALUES (1149, '/uploads/picture/20180320/055a0036318306c4da56f538ad273c98.png', '/uploads/picture/20180320/055a0036318306c4da56f538ad273c98.png', 'c393327f52632a4c49718af5f784e0e8', '7c380602644118a99ae9e8f3cf198f42544c9794', 1, 1521531348);
INSERT INTO `rk_picture` VALUES (1150, '/uploads/picture/20180320/3794d2c47a6f7112532c203b1323ed00.jpg', '/uploads/picture/20180320/3794d2c47a6f7112532c203b1323ed00.jpg', 'b2ff4a1e837c70cd84f79db4d6ed81d9', '127e73ff98a3cebe88cf68bb8d6d5985c9b48359', 1, 1521531360);
INSERT INTO `rk_picture` VALUES (1151, '/uploads/picture/20180320/36871c7bd8e1c24a5c35b8d9904cb633.png', '/uploads/picture/20180320/36871c7bd8e1c24a5c35b8d9904cb633.png', '0fe91294e8c55db0e83220e7d28a7417', '1c4b65091d81de0e94f62b2ca893ecfabbc8b19f', 1, 1521533227);
INSERT INTO `rk_picture` VALUES (1152, '/uploads/picture/20180320/8c83176fea50426f6575b222ca1d1022.png', '/uploads/picture/20180320/8c83176fea50426f6575b222ca1d1022.png', 'c81ab5570956c3d4f352bdf3835f4b91', '9881805a9b3e4e151445b2b1aff7b71b99d00fc8', 1, 1521533234);
INSERT INTO `rk_picture` VALUES (1153, '/uploads/picture/20180320/328f9bdd90d2e434f5b30fb70a239c0b.jpg', '/uploads/picture/20180320/328f9bdd90d2e434f5b30fb70a239c0b.jpg', '111b795a6da868be1fe6ed42c27e09d1', '5c3dddccbfa4aa6bd1ac61676f3443ad4f47c87a', 1, 1521533248);
INSERT INTO `rk_picture` VALUES (1154, '/uploads/picture/20180320/1a371d4d82854695a81efcfeea25e7dc.jpg', '/uploads/picture/20180320/1a371d4d82854695a81efcfeea25e7dc.jpg', '', '', 1, 1521542566);
INSERT INTO `rk_picture` VALUES (1155, '/uploads/picture/20180320/9025f951e5145f6734265b0c3d76c163.png', '/uploads/picture/20180320/9025f951e5145f6734265b0c3d76c163.png', '', '', 1, 1521547737);
INSERT INTO `rk_picture` VALUES (1156, '/uploads/picture/20180320/8c1af9f3e81e20fa7199b42cc464f02a.png', '/uploads/picture/20180320/8c1af9f3e81e20fa7199b42cc464f02a.png', '', '', 1, 1521547803);
INSERT INTO `rk_picture` VALUES (1157, '/uploads/picture/20180320/90cc51e8b17aaab111a60ec6febf8038.png', '/uploads/picture/20180320/90cc51e8b17aaab111a60ec6febf8038.png', '', '', 1, 1521547874);
INSERT INTO `rk_picture` VALUES (1158, '/uploads/picture/20180320/5b19663a8cdad51d5ca2cf0a90ab9efd.png', '/uploads/picture/20180320/5b19663a8cdad51d5ca2cf0a90ab9efd.png', '', '', 1, 1521547874);
INSERT INTO `rk_picture` VALUES (1159, '/uploads/picture/20180320/e02559b677cb3bbb9b06f7c047199b52.png', '/uploads/picture/20180320/e02559b677cb3bbb9b06f7c047199b52.png', '', '', 1, 1521547875);
INSERT INTO `rk_picture` VALUES (1160, '/uploads/picture/20180320/1ce90b1f4ef651bf0cae3e75da28c964.png', '/uploads/picture/20180320/1ce90b1f4ef651bf0cae3e75da28c964.png', '', '', 1, 1521547930);
INSERT INTO `rk_picture` VALUES (1161, '/uploads/picture/20180320/544feba50af444c725e6dcc29b0b047b.png', '/uploads/picture/20180320/544feba50af444c725e6dcc29b0b047b.png', '', '', 1, 1521547930);
INSERT INTO `rk_picture` VALUES (1162, '/uploads/picture/20180320/61f2a2002e513172ad24f014cd86b1f0.png', '/uploads/picture/20180320/61f2a2002e513172ad24f014cd86b1f0.png', '', '', 1, 1521548015);
INSERT INTO `rk_picture` VALUES (1163, '/uploads/picture/20180321/2242b0546d87a89daeba634c8f6db68f.jpg', '/uploads/picture/20180321/2242b0546d87a89daeba634c8f6db68f.jpg', '', '', 1, 1521603321);
INSERT INTO `rk_picture` VALUES (1164, '/uploads/picture/20180321/d0e48c0fa96e8cddfa460468b942ad9c.jpg', '/uploads/picture/20180321/d0e48c0fa96e8cddfa460468b942ad9c.jpg', '', '', 1, 1521603803);
INSERT INTO `rk_picture` VALUES (1165, '/uploads/picture/20180321/4905d7044d85c40d550dd941fe0fbc07.jpg', '/uploads/picture/20180321/4905d7044d85c40d550dd941fe0fbc07.jpg', '', '', 1, 1521609577);
INSERT INTO `rk_picture` VALUES (1166, '/uploads/picture/20180321/67ebf5eff538be384fec76b0f24588ca.png', '/uploads/picture/20180321/67ebf5eff538be384fec76b0f24588ca.png', '', '', 1, 1521609925);
INSERT INTO `rk_picture` VALUES (1167, '/uploads/picture/20180321/d6832ced6c4848cbe629ea1b74ac6ec9.png', '/uploads/picture/20180321/d6832ced6c4848cbe629ea1b74ac6ec9.png', '', '', 1, 1521609925);
INSERT INTO `rk_picture` VALUES (1168, '/uploads/picture/20180321/84a3a64425348c37d831582b1b0a13d7.png', '/uploads/picture/20180321/84a3a64425348c37d831582b1b0a13d7.png', '', '', 1, 1521609973);
INSERT INTO `rk_picture` VALUES (1169, '/uploads/picture/20180321/4a3d1382a25712c21d759fb6049705e3.png', '/uploads/picture/20180321/4a3d1382a25712c21d759fb6049705e3.png', '', '', 1, 1521609974);
INSERT INTO `rk_picture` VALUES (1170, '/uploads/picture/20180321/bed485902b7786ac56dc1461923be231.png', '/uploads/picture/20180321/bed485902b7786ac56dc1461923be231.png', '', '', 1, 1521610017);
INSERT INTO `rk_picture` VALUES (1171, '/uploads/picture/20180321/e6f803393ba77ca44da8694a1e57876c.png', '/uploads/picture/20180321/e6f803393ba77ca44da8694a1e57876c.png', '', '', 1, 1521610018);
INSERT INTO `rk_picture` VALUES (1172, '/uploads/picture/20180321/ec9550caafc8f763ddd6ed1266966d3c.png', '/uploads/picture/20180321/ec9550caafc8f763ddd6ed1266966d3c.png', '', '', 1, 1521610068);
INSERT INTO `rk_picture` VALUES (1173, '/uploads/picture/20180321/4ad5339b25f8803ccbdfee638edd1ea1.png', '/uploads/picture/20180321/4ad5339b25f8803ccbdfee638edd1ea1.png', '', '', 1, 1521610145);
INSERT INTO `rk_picture` VALUES (1174, '/uploads/picture/20180321/2ad6c5c8c590631c683b990a17f0fb78.png', '/uploads/picture/20180321/2ad6c5c8c590631c683b990a17f0fb78.png', '', '', 1, 1521610146);
INSERT INTO `rk_picture` VALUES (1175, '/uploads/picture/20180321/75fd15a220c25e78a7709c79fe34c62f.jpg', '/uploads/picture/20180321/75fd15a220c25e78a7709c79fe34c62f.jpg', '', '', 1, 1521619119);
INSERT INTO `rk_picture` VALUES (1176, '/uploads/picture/20180322/73bcd4ee9b57afc32c8ee25535746fd3.jpg', '/uploads/picture/20180322/73bcd4ee9b57afc32c8ee25535746fd3.jpg', '', '', 1, 1521682566);
INSERT INTO `rk_picture` VALUES (1177, '/uploads/picture/20180322/99cc550f487f6da679f5f9caa4e92eb7.jpg', '/uploads/picture/20180322/99cc550f487f6da679f5f9caa4e92eb7.jpg', '', '', 1, 1521689810);
INSERT INTO `rk_picture` VALUES (1180, '/uploads/picture/20180323/856cea96c0888e7e86d49897f71a422d.jpg', '/uploads/picture/20180323/856cea96c0888e7e86d49897f71a422d.jpg', '', '', 1, 1521764574);
INSERT INTO `rk_picture` VALUES (1181, '/uploads/picture/20180323/425570088dd7cbf160551759e36eeddb.jpg', '/uploads/picture/20180323/425570088dd7cbf160551759e36eeddb.jpg', '', '', 1, 1521764603);
INSERT INTO `rk_picture` VALUES (1182, '/uploads/picture/20180323/c4d415453adf516932b6e04cedee6028.png', '/uploads/picture/20180323/c4d415453adf516932b6e04cedee6028.png', '', '', 1, 1521776590);
INSERT INTO `rk_picture` VALUES (1183, '/uploads/picture/20180323/b4186251716d8b96a0ee2b0f36e5d0bb.png', '/uploads/picture/20180323/b4186251716d8b96a0ee2b0f36e5d0bb.png', '', '', 1, 1521776710);
INSERT INTO `rk_picture` VALUES (1184, '/uploads/picture/20180323/844962eacbe76b13b32f3ab43b759c7f.png', '/uploads/picture/20180323/844962eacbe76b13b32f3ab43b759c7f.png', '', '', 1, 1521776836);
INSERT INTO `rk_picture` VALUES (1185, '/uploads/picture/20180323/56107b360b566dfff8c262c71fa759b0.png', '/uploads/picture/20180323/56107b360b566dfff8c262c71fa759b0.png', '', '', 1, 1521776881);
INSERT INTO `rk_picture` VALUES (1186, '/uploads/picture/20180323/3472892454cbeafef9e89bea60f0b0b2.png', '/uploads/picture/20180323/3472892454cbeafef9e89bea60f0b0b2.png', '', '', 1, 1521776927);
INSERT INTO `rk_picture` VALUES (1187, '/uploads/picture/20180323/c9ff9bb985d1692591f70272fb68967e.png', '/uploads/picture/20180323/c9ff9bb985d1692591f70272fb68967e.png', '', '', 1, 1521798095);
INSERT INTO `rk_picture` VALUES (1188, '/uploads/picture/20180323/04b7fb49c34997ab041833dba5b82b01.png', '/uploads/picture/20180323/04b7fb49c34997ab041833dba5b82b01.png', '', '', 1, 1521798150);
INSERT INTO `rk_picture` VALUES (1189, '/uploads/picture/20180323/2385a624af2f0653bb41e5633ba6a7fc.png', '/uploads/picture/20180323/2385a624af2f0653bb41e5633ba6a7fc.png', '', '', 1, 1521798156);
INSERT INTO `rk_picture` VALUES (1190, '/uploads/picture/20180323/595119364c45bfc8a7a83ce3d8f36e89.png', '/uploads/picture/20180323/595119364c45bfc8a7a83ce3d8f36e89.png', '', '', 1, 1521798164);
INSERT INTO `rk_picture` VALUES (1191, '/uploads/picture/20180323/262b29555f5d3c8dc0e1d3b34e8b0b60.png', '/uploads/picture/20180323/262b29555f5d3c8dc0e1d3b34e8b0b60.png', '', '', 1, 1521798326);
INSERT INTO `rk_picture` VALUES (1192, '/uploads/picture/20180323/f7e7f77f90ddba24d13b933c47bdaaba.png', '/uploads/picture/20180323/f7e7f77f90ddba24d13b933c47bdaaba.png', '', '', 1, 1521798379);
INSERT INTO `rk_picture` VALUES (1193, '/uploads/picture/20180323/6df6f2faf5a8e64ab187b097951032a9.png', '/uploads/picture/20180323/6df6f2faf5a8e64ab187b097951032a9.png', '', '', 1, 1521798398);
INSERT INTO `rk_picture` VALUES (1194, '/uploads/picture/20180323/b98bc64348cb325492cf99740895c828.png', '/uploads/picture/20180323/b98bc64348cb325492cf99740895c828.png', '', '', 1, 1521798442);
INSERT INTO `rk_picture` VALUES (1195, '/uploads/picture/20180323/789185560340d575bb502fbe70ac5f9c.png', '/uploads/picture/20180323/789185560340d575bb502fbe70ac5f9c.png', '', '', 1, 1521798450);
INSERT INTO `rk_picture` VALUES (1196, '/uploads/picture/20180323/7ca6d3a11950d8c17c8a02ec477c4fdb.png', '/uploads/picture/20180323/7ca6d3a11950d8c17c8a02ec477c4fdb.png', '', '', 1, 1521798461);
INSERT INTO `rk_picture` VALUES (1197, '/uploads/picture/20180323/680c5d2cbd25083d4a0f0abea56aaf0f.png', '/uploads/picture/20180323/680c5d2cbd25083d4a0f0abea56aaf0f.png', '', '', 1, 1521798469);
INSERT INTO `rk_picture` VALUES (1198, '/uploads/picture/20180323/6713e90c82aec2ad97845c659971b2a6.png', '/uploads/picture/20180323/6713e90c82aec2ad97845c659971b2a6.png', '', '', 1, 1521798526);
INSERT INTO `rk_picture` VALUES (1199, '/uploads/picture/20180323/cb2c227ea53978fb25655d1d22427d4a.png', '/uploads/picture/20180323/cb2c227ea53978fb25655d1d22427d4a.png', '', '', 1, 1521798540);
INSERT INTO `rk_picture` VALUES (1200, '/uploads/picture/20180323/4297bcffc7edb85e14a542101b7886d1.png', '/uploads/picture/20180323/4297bcffc7edb85e14a542101b7886d1.png', '', '', 1, 1521798653);
INSERT INTO `rk_picture` VALUES (1201, '/uploads/picture/20180323/970d15ac039d6f93e19282167b7565b4.jpg', '/uploads/picture/20180323/970d15ac039d6f93e19282167b7565b4.jpg', '', '', 1, 1521801713);
INSERT INTO `rk_picture` VALUES (1202, '/uploads/picture/20180323/0b279c0ad90f39f0952210e4ff776e4e.jpg', '/uploads/picture/20180323/0b279c0ad90f39f0952210e4ff776e4e.jpg', '', '', 1, 1521801767);
INSERT INTO `rk_picture` VALUES (1203, '/uploads/picture/20180323/7fea98976e82029f373c93439301fd16.jpg', '/uploads/picture/20180323/7fea98976e82029f373c93439301fd16.jpg', '', '', 1, 1521801791);
INSERT INTO `rk_picture` VALUES (1204, '/uploads/picture/20180323/dbbe70ced77e50737db68c153d16bd89.jpg', '/uploads/picture/20180323/dbbe70ced77e50737db68c153d16bd89.jpg', '', '', 1, 1521802712);
INSERT INTO `rk_picture` VALUES (1205, '/uploads/picture/20180323/a8a1a7f8af6e531d1e275582c702e0c5.jpg', '/uploads/picture/20180323/a8a1a7f8af6e531d1e275582c702e0c5.jpg', '', '', 1, 1521802744);
INSERT INTO `rk_picture` VALUES (1206, '/uploads/picture/20180323/1f5a352868210b11d1885fb259eeef32.jpg', '/uploads/picture/20180323/1f5a352868210b11d1885fb259eeef32.jpg', '', '', 1, 1521802934);
INSERT INTO `rk_picture` VALUES (1207, '/uploads/picture/20180323/344d121a54d5155e3fffed124b4f92a0.jpg', '/uploads/picture/20180323/344d121a54d5155e3fffed124b4f92a0.jpg', '', '', 1, 1521803165);
INSERT INTO `rk_picture` VALUES (1208, '/uploads/picture/20180323/dccbb1b985a3965af244f248064ac336.jpg', '/uploads/picture/20180323/dccbb1b985a3965af244f248064ac336.jpg', '', '', 1, 1521803203);
INSERT INTO `rk_picture` VALUES (1209, '/uploads/picture/20180323/0769545e7539ce71b258eed3dbf4051e.jpg', '/uploads/picture/20180323/0769545e7539ce71b258eed3dbf4051e.jpg', '', '', 1, 1521803236);
INSERT INTO `rk_picture` VALUES (1210, '/uploads/picture/20180323/4863933578190a4b141e504d80519957.jpg', '/uploads/picture/20180323/4863933578190a4b141e504d80519957.jpg', '', '', 1, 1521803252);
INSERT INTO `rk_picture` VALUES (1211, '/uploads/picture/20180323/cecaa3a56ef772472269395337d7991e.jpg', '/uploads/picture/20180323/cecaa3a56ef772472269395337d7991e.jpg', '', '', 1, 1521803301);
INSERT INTO `rk_picture` VALUES (1212, '/uploads/picture/20180323/ced55e27caf35895a4db0f72216e3291.jpg', '/uploads/picture/20180323/ced55e27caf35895a4db0f72216e3291.jpg', '', '', 1, 1521803708);
INSERT INTO `rk_picture` VALUES (1213, '/uploads/picture/20180323/f3ff1f388a31733e371b958e813b5901.jpg', '/uploads/picture/20180323/f3ff1f388a31733e371b958e813b5901.jpg', '', '', 1, 1521803841);
INSERT INTO `rk_picture` VALUES (1214, '/uploads/picture/20180323/4369888250b60c33f26461ed751eeac4.jpg', '/uploads/picture/20180323/4369888250b60c33f26461ed751eeac4.jpg', '', '', 1, 1521803898);
INSERT INTO `rk_picture` VALUES (1215, '/uploads/picture/20180323/cd27e3da246d2752f7ad3c750bc4e46f.jpg', '/uploads/picture/20180323/cd27e3da246d2752f7ad3c750bc4e46f.jpg', '', '', 1, 1521809019);
INSERT INTO `rk_picture` VALUES (1216, '/uploads/picture/20180323/3485748e7eae6ea94956624962b62c3f.jpg', '/uploads/picture/20180323/3485748e7eae6ea94956624962b62c3f.jpg', '', '', 1, 1521809038);
INSERT INTO `rk_picture` VALUES (1217, '/uploads/picture/20180324/5c9b67a88d8f7ba94b53fcb7faae7664.jpg', '/uploads/picture/20180324/5c9b67a88d8f7ba94b53fcb7faae7664.jpg', '', '', 1, 1521845015);
INSERT INTO `rk_picture` VALUES (1218, '/uploads/picture/20180324/641fb7a0ac1917bde8a6cbaec31dd506.jpg', '/uploads/picture/20180324/641fb7a0ac1917bde8a6cbaec31dd506.jpg', '', '', 1, 1521845037);
INSERT INTO `rk_picture` VALUES (1219, '/uploads/picture/20180324/eda73263594d55184ba61c25b48c6be4.png', '/uploads/picture/20180324/eda73263594d55184ba61c25b48c6be4.png', '', '', 1, 1521845258);
INSERT INTO `rk_picture` VALUES (1220, '/uploads/picture/20180324/2f6e6f7c3075e48a1b7a2b402f40ba57.jpg', '/uploads/picture/20180324/2f6e6f7c3075e48a1b7a2b402f40ba57.jpg', '', '', 1, 1521845623);
INSERT INTO `rk_picture` VALUES (1221, '/uploads/picture/20180324/cd487ea2f6caae0f7699c86cc31e8b13.jpg', '/uploads/picture/20180324/cd487ea2f6caae0f7699c86cc31e8b13.jpg', '', '', 1, 1521845635);
INSERT INTO `rk_picture` VALUES (1222, '/uploads/picture/20180324/71f7b5324811b0554b3fa9a4b8dd46f6.png', '/uploads/picture/20180324/71f7b5324811b0554b3fa9a4b8dd46f6.png', '', '', 1, 1521880935);
INSERT INTO `rk_picture` VALUES (1223, '/uploads/picture/20180324/bef3a184508ef7694398c338c770bca2.png', '/uploads/picture/20180324/bef3a184508ef7694398c338c770bca2.png', '', '', 1, 1521881028);
INSERT INTO `rk_picture` VALUES (1224, '/uploads/picture/20180324/98d27cfad5604b218e62d79a94b140cb.png', '/uploads/picture/20180324/98d27cfad5604b218e62d79a94b140cb.png', '', '', 1, 1521881089);
INSERT INTO `rk_picture` VALUES (1225, '/uploads/picture/20180324/43cc672e7fb0b054b6ceb360ea4caff1.png', '/uploads/picture/20180324/43cc672e7fb0b054b6ceb360ea4caff1.png', '', '', 1, 1521881152);
INSERT INTO `rk_picture` VALUES (1226, '/uploads/picture/20180324/485cc4be59ed9c6b6ce3733ad241b09c.png', '/uploads/picture/20180324/485cc4be59ed9c6b6ce3733ad241b09c.png', '', '', 1, 1521881214);
INSERT INTO `rk_picture` VALUES (1227, '/uploads/picture/20180325/8bb4aee5fcf34e38de9f743fa01437ea.png', '/uploads/picture/20180325/8bb4aee5fcf34e38de9f743fa01437ea.png', '', '', 1, 1521938923);
INSERT INTO `rk_picture` VALUES (1228, '/uploads/picture/20180325/9d1fc6538e062ae57137e6928228a149.png', '/uploads/picture/20180325/9d1fc6538e062ae57137e6928228a149.png', '', '', 1, 1521938961);
INSERT INTO `rk_picture` VALUES (1229, '/uploads/picture/20180325/a0197b5786bc0d391b8d409caba29fc9.png', '/uploads/picture/20180325/a0197b5786bc0d391b8d409caba29fc9.png', '', '', 1, 1521938984);
INSERT INTO `rk_picture` VALUES (1230, '/uploads/picture/20180325/c53f35430326cd17ac8ee0af11765d77.png', '/uploads/picture/20180325/c53f35430326cd17ac8ee0af11765d77.png', '', '', 1, 1521939003);
INSERT INTO `rk_picture` VALUES (1231, '/uploads/picture/20180325/81a33f7cb746c4455307332b43670b1f.png', '/uploads/picture/20180325/81a33f7cb746c4455307332b43670b1f.png', '', '', 1, 1521939041);
INSERT INTO `rk_picture` VALUES (1232, '/uploads/picture/20180325/6abb69ff660f88da9613136e1e278449.png', '/uploads/picture/20180325/6abb69ff660f88da9613136e1e278449.png', '', '', 1, 1521968027);
INSERT INTO `rk_picture` VALUES (1233, '/uploads/picture/20180325/83e89ce0da65a4e26800f7cffc418e89.png', '/uploads/picture/20180325/83e89ce0da65a4e26800f7cffc418e89.png', '', '', 1, 1521968073);
INSERT INTO `rk_picture` VALUES (1234, '/uploads/picture/20180326/bc76d188437c561cfb9011c1f4266d07.png', '/uploads/picture/20180326/bc76d188437c561cfb9011c1f4266d07.png', '', '', 1, 1522026981);
INSERT INTO `rk_picture` VALUES (1235, '/uploads/picture/20180326/020693df6f789bcb3c6e61a12837d99a.png', '/uploads/picture/20180326/020693df6f789bcb3c6e61a12837d99a.png', '', '', 1, 1522027019);
INSERT INTO `rk_picture` VALUES (1236, '/uploads/picture/20180326/c4539e972cccfa9f14399e86a9f0e8ca.png', '/uploads/picture/20180326/c4539e972cccfa9f14399e86a9f0e8ca.png', '', '', 1, 1522027064);
INSERT INTO `rk_picture` VALUES (1237, '/uploads/picture/20180326/ec834acf54937713a1853be2060fd0f7.png', '/uploads/picture/20180326/ec834acf54937713a1853be2060fd0f7.png', '', '', 1, 1522027090);
INSERT INTO `rk_picture` VALUES (1238, '/uploads/picture/20180326/1bed140f3ce5906b619d11ecfcd88753.png', '/uploads/picture/20180326/1bed140f3ce5906b619d11ecfcd88753.png', '', '', 1, 1522027138);
INSERT INTO `rk_picture` VALUES (1239, '/uploads/picture/20180326/81517e6600b8ae35885b98a42de86668.png', '/uploads/picture/20180326/81517e6600b8ae35885b98a42de86668.png', '', '', 1, 1522027202);
INSERT INTO `rk_picture` VALUES (1240, '/uploads/picture/20180326/383a55ee95bd99d94494ea59dd657064.png', '/uploads/picture/20180326/383a55ee95bd99d94494ea59dd657064.png', '', '', 1, 1522027222);
INSERT INTO `rk_picture` VALUES (1241, '/uploads/picture/20180326/7a8d24ecbce43efa386ef7a0e2e5ee84.png', '/uploads/picture/20180326/7a8d24ecbce43efa386ef7a0e2e5ee84.png', '', '', 1, 1522027304);
INSERT INTO `rk_picture` VALUES (1242, '/uploads/picture/20180326/10c98a100e2f57d7eefc7b477603d095.png', '/uploads/picture/20180326/10c98a100e2f57d7eefc7b477603d095.png', '', '', 1, 1522047515);
INSERT INTO `rk_picture` VALUES (1243, '/uploads/picture/20180326/24f5543728ff576331d9e54d179262f3.jpg', '/uploads/picture/20180326/24f5543728ff576331d9e54d179262f3.jpg', '', '', 1, 1522066513);
INSERT INTO `rk_picture` VALUES (1244, '/uploads/picture/20180326/48a461f0dc62b953311fb8a191ab51ce.jpg', '/uploads/picture/20180326/48a461f0dc62b953311fb8a191ab51ce.jpg', '', '', 1, 1522070566);
INSERT INTO `rk_picture` VALUES (1245, '/uploads/picture/20180327/904437de450664b4dda4a2669eb34342.png', '/uploads/picture/20180327/904437de450664b4dda4a2669eb34342.png', '', '', 1, 1522110873);
INSERT INTO `rk_picture` VALUES (1246, '/uploads/picture/20180327/62581ae408ca3a5c3301d8c9825c4351.png', '/uploads/picture/20180327/62581ae408ca3a5c3301d8c9825c4351.png', '', '', 1, 1522110929);
INSERT INTO `rk_picture` VALUES (1247, '/uploads/picture/20180327/960809c5912a373e0140b449e9eee8c3.png', '/uploads/picture/20180327/960809c5912a373e0140b449e9eee8c3.png', '', '', 1, 1522110978);
INSERT INTO `rk_picture` VALUES (1248, '/uploads/picture/20180327/236f57ec41c0a3bbac5acae8ad74c56e.png', '/uploads/picture/20180327/236f57ec41c0a3bbac5acae8ad74c56e.png', '', '', 1, 1522111056);
INSERT INTO `rk_picture` VALUES (1249, '/uploads/picture/20180327/3fe7ac9c18dd633e63d33b8b8b029860.png', '/uploads/picture/20180327/3fe7ac9c18dd633e63d33b8b8b029860.png', '', '', 1, 1522111167);
INSERT INTO `rk_picture` VALUES (1250, '/uploads/picture/20180327/d6d0d6658fc9fdfa2d5e571555fd8a2d.jpg', '/uploads/picture/20180327/d6d0d6658fc9fdfa2d5e571555fd8a2d.jpg', '', '', 1, 1522116212);
INSERT INTO `rk_picture` VALUES (1251, '/uploads/picture/20180327/b528c4e6f6cfe648c0c4c48fa49608b8.jpg', '/uploads/picture/20180327/b528c4e6f6cfe648c0c4c48fa49608b8.jpg', '', '', 1, 1522154075);
INSERT INTO `rk_picture` VALUES (1252, '/uploads/picture/20180327/8368e31665b0def9fa9ae5e08b90915c.jpg', '/uploads/picture/20180327/8368e31665b0def9fa9ae5e08b90915c.jpg', '', '', 1, 1522155056);
INSERT INTO `rk_picture` VALUES (1253, '/uploads/picture/20180327/c61093079bcfd047ee6df1e6ed7904ae.jpg', '/uploads/picture/20180327/c61093079bcfd047ee6df1e6ed7904ae.jpg', '', '', 1, 1522155171);
INSERT INTO `rk_picture` VALUES (1254, '/uploads/picture/20180328/5cf74410dee1bb19d3b2486cd77a320d.jpg', '/uploads/picture/20180328/5cf74410dee1bb19d3b2486cd77a320d.jpg', '', '', 1, 1522187279);
INSERT INTO `rk_picture` VALUES (1255, '/uploads/picture/20180328/13955d39e91bbfe26e4819a8247a2429.jpg', '/uploads/picture/20180328/13955d39e91bbfe26e4819a8247a2429.jpg', '', '', 1, 1522187395);
INSERT INTO `rk_picture` VALUES (1256, '/uploads/picture/20180328/43a6a4dd3165c16e036c4c636d98772d.jpg', '/uploads/picture/20180328/43a6a4dd3165c16e036c4c636d98772d.jpg', '', '', 1, 1522201500);
INSERT INTO `rk_picture` VALUES (1257, '/uploads/picture/20180328/9327b42700c04c98f7079e04b15f892c.jpg', '/uploads/picture/20180328/9327b42700c04c98f7079e04b15f892c.jpg', '', '', 1, 1522201859);
INSERT INTO `rk_picture` VALUES (1258, '/uploads/picture/20180328/131b8924498f9d5af0d65980ed4555fa.jpg', '/uploads/picture/20180328/131b8924498f9d5af0d65980ed4555fa.jpg', '', '', 1, 1522203358);
INSERT INTO `rk_picture` VALUES (1259, '/uploads/picture/20180328/8b3baf4895a074038177a62afe63ea24.jpg', '/uploads/picture/20180328/8b3baf4895a074038177a62afe63ea24.jpg', '', '', 1, 1522204193);
INSERT INTO `rk_picture` VALUES (1260, '/uploads/picture/20180328/9e5a3a91675b910fa87fa6f38e061374.jpg', '/uploads/picture/20180328/9e5a3a91675b910fa87fa6f38e061374.jpg', '', '', 1, 1522208059);
INSERT INTO `rk_picture` VALUES (1261, '/uploads/picture/20180328/9d6f01c39704677f1b88988f3836d2ce.jpg', '/uploads/picture/20180328/9d6f01c39704677f1b88988f3836d2ce.jpg', '', '', 1, 1522208290);
INSERT INTO `rk_picture` VALUES (1262, '/uploads/picture/20180328/76aceb4423f3759900a4453dfbb1a32b.jpg', '/uploads/picture/20180328/76aceb4423f3759900a4453dfbb1a32b.jpg', '', '', 1, 1522208299);
INSERT INTO `rk_picture` VALUES (1263, '/uploads/picture/20180328/b4dd90282e52e93ca7e522ae854802f9.jpg', '/uploads/picture/20180328/b4dd90282e52e93ca7e522ae854802f9.jpg', '', '', 1, 1522208308);
INSERT INTO `rk_picture` VALUES (1264, '/uploads/picture/20180328/e29ef9755a08358e0209855093578039.jpg', '/uploads/picture/20180328/e29ef9755a08358e0209855093578039.jpg', '', '', 1, 1522208786);
INSERT INTO `rk_picture` VALUES (1265, '/uploads/picture/20180328/211153e30b60364b1d2db6b720c3a3c9.jpg', '/uploads/picture/20180328/211153e30b60364b1d2db6b720c3a3c9.jpg', '', '', 1, 1522208803);
INSERT INTO `rk_picture` VALUES (1266, '/uploads/picture/20180328/e427107718f481825d78f53425eaa6ae.jpg', '/uploads/picture/20180328/e427107718f481825d78f53425eaa6ae.jpg', '', '', 1, 1522209017);
INSERT INTO `rk_picture` VALUES (1267, '/uploads/picture/20180328/c7886397ab6f377b756f160be3488d5b.jpg', '/uploads/picture/20180328/c7886397ab6f377b756f160be3488d5b.jpg', '', '', 1, 1522209025);
INSERT INTO `rk_picture` VALUES (1268, '/uploads/picture/20180328/2a882c25f6dc53e8334aaf313a4ecfef.jpg', '/uploads/picture/20180328/2a882c25f6dc53e8334aaf313a4ecfef.jpg', '', '', 1, 1522209202);
INSERT INTO `rk_picture` VALUES (1269, '/uploads/picture/20180328/206bce1f5bd89736b00c9d24fd37f7b3.jpg', '/uploads/picture/20180328/206bce1f5bd89736b00c9d24fd37f7b3.jpg', '', '', 1, 1522209233);
INSERT INTO `rk_picture` VALUES (1270, '/uploads/picture/20180328/c0760eaffa8f407b3174ff57d1d11d0d.jpg', '/uploads/picture/20180328/c0760eaffa8f407b3174ff57d1d11d0d.jpg', '', '', 1, 1522209323);
INSERT INTO `rk_picture` VALUES (1271, '/uploads/picture/20180328/07a0680b40a8ab4a75b27a3218a88d4d.jpg', '/uploads/picture/20180328/07a0680b40a8ab4a75b27a3218a88d4d.jpg', '', '', 1, 1522209346);
INSERT INTO `rk_picture` VALUES (1272, '/uploads/picture/20180328/55bc65cd115ba7c5971405f9b575dcab.jpg', '/uploads/picture/20180328/55bc65cd115ba7c5971405f9b575dcab.jpg', '', '', 1, 1522209480);
INSERT INTO `rk_picture` VALUES (1273, '/uploads/picture/20180328/5f1a62c066caf1bfb642ca2baa2bb34e.jpg', '/uploads/picture/20180328/5f1a62c066caf1bfb642ca2baa2bb34e.jpg', '', '', 1, 1522209704);
INSERT INTO `rk_picture` VALUES (1274, '/uploads/picture/20180328/edada9d16cfdffd63c02d1cbbe98d9b1.jpg', '/uploads/picture/20180328/edada9d16cfdffd63c02d1cbbe98d9b1.jpg', '', '', 1, 1522209716);
INSERT INTO `rk_picture` VALUES (1275, '/uploads/picture/20180328/ad65564af42baed16c3b26d27371d15a.jpg', '/uploads/picture/20180328/ad65564af42baed16c3b26d27371d15a.jpg', '', '', 1, 1522209889);
INSERT INTO `rk_picture` VALUES (1276, '/uploads/picture/20180328/855cee5cdf4675b4ef1d792f32f850bb.jpg', '/uploads/picture/20180328/855cee5cdf4675b4ef1d792f32f850bb.jpg', '', '', 1, 1522209907);
INSERT INTO `rk_picture` VALUES (1277, '/uploads/picture/20180328/2651a7530b2cc31f525b158af0f9b791.jpg', '/uploads/picture/20180328/2651a7530b2cc31f525b158af0f9b791.jpg', '', '', 1, 1522209915);
INSERT INTO `rk_picture` VALUES (1278, '/uploads/picture/20180328/9ac3b2bbf3633d812ef121d735bd98ba.jpg', '/uploads/picture/20180328/9ac3b2bbf3633d812ef121d735bd98ba.jpg', '', '', 1, 1522217637);
INSERT INTO `rk_picture` VALUES (1279, '/uploads/picture/20180328/12d91afdde6bd02631b50dbcca250bc6.png', '/uploads/picture/20180328/12d91afdde6bd02631b50dbcca250bc6.png', '', '', 1, 1522221384);
INSERT INTO `rk_picture` VALUES (1280, '/uploads/picture/20180328/d37a40ccc9897f0c31c4b6dd887fe667.png', '/uploads/picture/20180328/d37a40ccc9897f0c31c4b6dd887fe667.png', '', '', 1, 1522221412);
INSERT INTO `rk_picture` VALUES (1281, '/uploads/picture/20180328/008ad1f21b6a5cb2a025fe9c8757059f.png', '/uploads/picture/20180328/008ad1f21b6a5cb2a025fe9c8757059f.png', '', '', 1, 1522221460);
INSERT INTO `rk_picture` VALUES (1282, '/uploads/picture/20180328/07aed1b2902a5ff1357943f735b348a7.png', '/uploads/picture/20180328/07aed1b2902a5ff1357943f735b348a7.png', '', '', 1, 1522221487);
INSERT INTO `rk_picture` VALUES (1283, '/uploads/picture/20180328/41d10d1da2a2e2825784361ea689df90.png', '/uploads/picture/20180328/41d10d1da2a2e2825784361ea689df90.png', '', '', 1, 1522221510);
INSERT INTO `rk_picture` VALUES (1284, '/uploads/picture/20180328/f8cbfcb2fd2a7bf236023a48c9da3f7d.png', '/uploads/picture/20180328/f8cbfcb2fd2a7bf236023a48c9da3f7d.png', '', '', 1, 1522221532);
INSERT INTO `rk_picture` VALUES (1285, '/uploads/picture/20180328/99622c7e457850e091980ddb26656a98.png', '/uploads/picture/20180328/99622c7e457850e091980ddb26656a98.png', '', '', 1, 1522222565);
INSERT INTO `rk_picture` VALUES (1286, '/uploads/picture/20180328/199129c39836448e4a926918510ea0ab.png', '/uploads/picture/20180328/199129c39836448e4a926918510ea0ab.png', '', '', 1, 1522222842);
INSERT INTO `rk_picture` VALUES (1287, '/uploads/picture/20180328/452bcb694862e1587c4c68e7c4221527.png', '/uploads/picture/20180328/452bcb694862e1587c4c68e7c4221527.png', '', '', 1, 1522222855);
INSERT INTO `rk_picture` VALUES (1288, '/uploads/picture/20180328/411a95ed05d32a7401faadb2a71cff04.png', '/uploads/picture/20180328/411a95ed05d32a7401faadb2a71cff04.png', '', '', 1, 1522223049);
INSERT INTO `rk_picture` VALUES (1289, '/uploads/picture/20180328/eaa92195c28d7795d06629a3165f2fb0.jpg', '/uploads/picture/20180328/eaa92195c28d7795d06629a3165f2fb0.jpg', '', '', 1, 1522228255);
INSERT INTO `rk_picture` VALUES (1290, '/uploads/picture/20180328/03957b772c54939ae01581a3e740d907.jpg', '/uploads/picture/20180328/03957b772c54939ae01581a3e740d907.jpg', '', '', 1, 1522231242);
INSERT INTO `rk_picture` VALUES (1291, '/uploads/picture/20180328/0e8ddf5a2d84f251575cceac746ecdfc.jpg', '/uploads/picture/20180328/0e8ddf5a2d84f251575cceac746ecdfc.jpg', '', '', 1, 1522231376);
INSERT INTO `rk_picture` VALUES (1292, '/uploads/picture/20180328/4aada655f27335ecfff4ba6e9961bf28.jpg', '/uploads/picture/20180328/4aada655f27335ecfff4ba6e9961bf28.jpg', '', '', 1, 1522232065);
INSERT INTO `rk_picture` VALUES (1293, '/uploads/picture/20180328/54f28a0a6522b39e1eb3a45f2896cc58.jpg', '/uploads/picture/20180328/54f28a0a6522b39e1eb3a45f2896cc58.jpg', '', '', 1, 1522232109);
INSERT INTO `rk_picture` VALUES (1294, '/uploads/picture/20180328/547a9d5a82c7374acf29e05a28a5e5fe.jpg', '/uploads/picture/20180328/547a9d5a82c7374acf29e05a28a5e5fe.jpg', '', '', 1, 1522232306);
INSERT INTO `rk_picture` VALUES (1295, '/uploads/picture/20180328/34cb9b75d546513eccf8ba29d12bcf1b.jpg', '/uploads/picture/20180328/34cb9b75d546513eccf8ba29d12bcf1b.jpg', '', '', 1, 1522232480);
INSERT INTO `rk_picture` VALUES (1296, '/uploads/picture/20180328/48b951171a79eb5dd48e2023d42ba0fb.jpg', '/uploads/picture/20180328/48b951171a79eb5dd48e2023d42ba0fb.jpg', '', '', 1, 1522232592);
INSERT INTO `rk_picture` VALUES (1297, '/uploads/picture/20180328/b0c27f529c698322533de92af0acf5bc.jpg', '/uploads/picture/20180328/b0c27f529c698322533de92af0acf5bc.jpg', '', '', 1, 1522232598);
INSERT INTO `rk_picture` VALUES (1298, '/uploads/picture/20180328/571a7885416a5350406a1fc6b35220b7.jpg', '/uploads/picture/20180328/571a7885416a5350406a1fc6b35220b7.jpg', '', '', 1, 1522232605);
INSERT INTO `rk_picture` VALUES (1299, '/uploads/picture/20180328/41d3d7c1a14f57745fe9c0107a029fea.jpg', '/uploads/picture/20180328/41d3d7c1a14f57745fe9c0107a029fea.jpg', '', '', 1, 1522232609);
INSERT INTO `rk_picture` VALUES (1300, '/uploads/picture/20180328/6f17c06f2130e1a1032d57e6051a8e78.jpg', '/uploads/picture/20180328/6f17c06f2130e1a1032d57e6051a8e78.jpg', '', '', 1, 1522232620);
INSERT INTO `rk_picture` VALUES (1301, '/uploads/picture/20180328/08f35fb66ed60ea53e93f037f0b820f5.jpg', '/uploads/picture/20180328/08f35fb66ed60ea53e93f037f0b820f5.jpg', '', '', 1, 1522232626);
INSERT INTO `rk_picture` VALUES (1302, '/uploads/picture/20180328/5032524241f5bed2b5b1e04ece31feeb.jpg', '/uploads/picture/20180328/5032524241f5bed2b5b1e04ece31feeb.jpg', '', '', 1, 1522232638);
INSERT INTO `rk_picture` VALUES (1303, '/uploads/picture/20180328/9c4a8c398efe335ce1cb2b22b406d726.jpg', '/uploads/picture/20180328/9c4a8c398efe335ce1cb2b22b406d726.jpg', '', '', 1, 1522232642);
INSERT INTO `rk_picture` VALUES (1304, '/uploads/picture/20180328/83604b5cc9643f2dd2f81468bb6fa099.jpg', '/uploads/picture/20180328/83604b5cc9643f2dd2f81468bb6fa099.jpg', '', '', 1, 1522232646);
INSERT INTO `rk_picture` VALUES (1305, '/uploads/picture/20180328/3bb9a777e7295427bfaa8bf3f182505d.jpg', '/uploads/picture/20180328/3bb9a777e7295427bfaa8bf3f182505d.jpg', '', '', 1, 1522232770);
INSERT INTO `rk_picture` VALUES (1306, '/uploads/picture/20180328/3f71beb405bffaf0f3a99977608c85ff.jpg', '/uploads/picture/20180328/3f71beb405bffaf0f3a99977608c85ff.jpg', '', '', 1, 1522232821);
INSERT INTO `rk_picture` VALUES (1307, '/uploads/picture/20180328/2ed0e53207f0f15f21d0c2f2e9511017.jpg', '/uploads/picture/20180328/2ed0e53207f0f15f21d0c2f2e9511017.jpg', '', '', 1, 1522233049);
INSERT INTO `rk_picture` VALUES (1308, '/uploads/picture/20180328/7416c704341f195cbd5acf5a7dd18fc3.jpg', '/uploads/picture/20180328/7416c704341f195cbd5acf5a7dd18fc3.jpg', '', '', 1, 1522233056);
INSERT INTO `rk_picture` VALUES (1309, '/uploads/picture/20180328/51468ec12b126d3945c056ef4837c07c.jpg', '/uploads/picture/20180328/51468ec12b126d3945c056ef4837c07c.jpg', '', '', 1, 1522233084);
INSERT INTO `rk_picture` VALUES (1310, '/uploads/picture/20180328/776df748617e7973d956630aed433126.jpg', '/uploads/picture/20180328/776df748617e7973d956630aed433126.jpg', '', '', 1, 1522233088);
INSERT INTO `rk_picture` VALUES (1311, '/uploads/picture/20180328/c4e495be64d236721b1e2a42652c0b03.jpg', '/uploads/picture/20180328/c4e495be64d236721b1e2a42652c0b03.jpg', '', '', 1, 1522233093);
INSERT INTO `rk_picture` VALUES (1312, '/uploads/picture/20180328/b3876017f913f2427a4156cea7618f54.jpg', '/uploads/picture/20180328/b3876017f913f2427a4156cea7618f54.jpg', '', '', 1, 1522233094);
INSERT INTO `rk_picture` VALUES (1313, '/uploads/picture/20180328/1a1f80b13273f30c40e85d12895adc61.jpg', '/uploads/picture/20180328/1a1f80b13273f30c40e85d12895adc61.jpg', '', '', 1, 1522233105);
INSERT INTO `rk_picture` VALUES (1314, '/uploads/picture/20180328/1c6ccbf7db48c8e265127fec4a16b1cc.jpg', '/uploads/picture/20180328/1c6ccbf7db48c8e265127fec4a16b1cc.jpg', '', '', 1, 1522233332);
INSERT INTO `rk_picture` VALUES (1315, '/uploads/picture/20180328/d8ba1c056e50049bd57463da696962e2.jpg', '/uploads/picture/20180328/d8ba1c056e50049bd57463da696962e2.jpg', '', '', 1, 1522233384);
INSERT INTO `rk_picture` VALUES (1316, '/uploads/picture/20180328/2bdcf60d4efba9546e0fdd832cbb1296.jpg', '/uploads/picture/20180328/2bdcf60d4efba9546e0fdd832cbb1296.jpg', '', '', 1, 1522233467);
INSERT INTO `rk_picture` VALUES (1317, '/uploads/picture/20180328/34540658c2e5580aea1b6d8fa999a7cb.jpg', '/uploads/picture/20180328/34540658c2e5580aea1b6d8fa999a7cb.jpg', '', '', 1, 1522233484);
INSERT INTO `rk_picture` VALUES (1318, '/uploads/picture/20180328/bf5441c0fc3ca3a235f1c56cc0341b24.jpg', '/uploads/picture/20180328/bf5441c0fc3ca3a235f1c56cc0341b24.jpg', '', '', 1, 1522233510);
INSERT INTO `rk_picture` VALUES (1319, '/uploads/picture/20180328/fc494525ce28de098e9b736cf35cb2a8.jpg', '/uploads/picture/20180328/fc494525ce28de098e9b736cf35cb2a8.jpg', '', '', 1, 1522233514);
INSERT INTO `rk_picture` VALUES (1320, '/uploads/picture/20180328/30483d73e34d019cd385496a9649cfeb.jpg', '/uploads/picture/20180328/30483d73e34d019cd385496a9649cfeb.jpg', '', '', 1, 1522233528);
INSERT INTO `rk_picture` VALUES (1321, '/uploads/picture/20180328/cce956b2ed8b211752f6e6f400c412bf.jpg', '/uploads/picture/20180328/cce956b2ed8b211752f6e6f400c412bf.jpg', '', '', 1, 1522245175);
INSERT INTO `rk_picture` VALUES (1322, '/uploads/picture/20180328/1d786414a6dc4902b052aa45950ad49e.jpg', '/uploads/picture/20180328/1d786414a6dc4902b052aa45950ad49e.jpg', '', '', 1, 1522245219);
INSERT INTO `rk_picture` VALUES (1323, '/uploads/picture/20180329/a4f3fbe1c2ecbfef085da5eb9dbbddde.jpg', '/uploads/picture/20180329/a4f3fbe1c2ecbfef085da5eb9dbbddde.jpg', '', '', 1, 1522273875);
INSERT INTO `rk_picture` VALUES (1324, '/uploads/picture/20180329/c52f0fc960ce5f15d6a48bfeb10b6de3.jpg', '/uploads/picture/20180329/c52f0fc960ce5f15d6a48bfeb10b6de3.jpg', '', '', 1, 1522273912);
INSERT INTO `rk_picture` VALUES (1325, '/uploads/picture/20180329/ecc14ed4680305d8cc3bd4fa4104e42b.jpg', '/uploads/picture/20180329/ecc14ed4680305d8cc3bd4fa4104e42b.jpg', '', '', 1, 1522273970);
INSERT INTO `rk_picture` VALUES (1326, '/uploads/picture/20180329/7546c385300fc3ad5a4d35545a44ba0f.jpg', '/uploads/picture/20180329/7546c385300fc3ad5a4d35545a44ba0f.jpg', '', '', 1, 1522274139);
INSERT INTO `rk_picture` VALUES (1327, '/uploads/picture/20180329/996f1877cdc1f4fd6007a743d79f0425.jpg', '/uploads/picture/20180329/996f1877cdc1f4fd6007a743d79f0425.jpg', '', '', 1, 1522274155);
INSERT INTO `rk_picture` VALUES (1328, '/uploads/picture/20180329/a2bdbf5109f0a667bf67306b1c08e8bb.png', '/uploads/picture/20180329/a2bdbf5109f0a667bf67306b1c08e8bb.png', '', '', 1, 1522283222);
INSERT INTO `rk_picture` VALUES (1329, '/uploads/picture/20180329/b0e981680b967a26cfa88be700ba8704.png', '/uploads/picture/20180329/b0e981680b967a26cfa88be700ba8704.png', '', '', 1, 1522283236);
INSERT INTO `rk_picture` VALUES (1330, '/uploads/picture/20180329/5fffb371d790f2c3e783dd0ff548ea1d.png', '/uploads/picture/20180329/5fffb371d790f2c3e783dd0ff548ea1d.png', '', '', 1, 1522283533);
INSERT INTO `rk_picture` VALUES (1331, '/uploads/picture/20180329/b594d06a4835067f7e5700e8032d2c34.png', '/uploads/picture/20180329/b594d06a4835067f7e5700e8032d2c34.png', '', '', 1, 1522283569);
INSERT INTO `rk_picture` VALUES (1332, '/uploads/picture/20180329/cc41d5187541c13385c82773cbb60780.png', '/uploads/picture/20180329/cc41d5187541c13385c82773cbb60780.png', '', '', 1, 1522283593);
INSERT INTO `rk_picture` VALUES (1333, '/uploads/picture/20180329/614d18cedd01b2ea0d8e486089d410c1.jpg', '/uploads/picture/20180329/614d18cedd01b2ea0d8e486089d410c1.jpg', '', '', 1, 1522286064);
INSERT INTO `rk_picture` VALUES (1334, '/uploads/picture/20180329/f7ea73d4fa08a7011060ff51dc936cc3.jpg', '/uploads/picture/20180329/f7ea73d4fa08a7011060ff51dc936cc3.jpg', '', '', 1, 1522286717);
INSERT INTO `rk_picture` VALUES (1335, '/uploads/picture/20180329/d93aa44478577b4d33800e4eb3973b62.jpg', '/uploads/picture/20180329/d93aa44478577b4d33800e4eb3973b62.jpg', '', '', 1, 1522286807);
INSERT INTO `rk_picture` VALUES (1336, '/uploads/picture/20180329/0b8735b6782d567d69596cbf41e8a3ec.jpg', '/uploads/picture/20180329/0b8735b6782d567d69596cbf41e8a3ec.jpg', '', '', 1, 1522287465);
INSERT INTO `rk_picture` VALUES (1337, '/uploads/picture/20180329/b44f63bee910adc490fe764159ed51c3.jpg', '/uploads/picture/20180329/b44f63bee910adc490fe764159ed51c3.jpg', '', '', 1, 1522287468);
INSERT INTO `rk_picture` VALUES (1338, '/uploads/picture/20180329/b1f644c010d7c9f322c96e91d3d81330.jpg', '/uploads/picture/20180329/b1f644c010d7c9f322c96e91d3d81330.jpg', '', '', 1, 1522288110);
INSERT INTO `rk_picture` VALUES (1339, '/uploads/picture/20180329/b8daf4363925448cf8c1d277ca797c9d.jpg', '/uploads/picture/20180329/b8daf4363925448cf8c1d277ca797c9d.jpg', '', '', 1, 1522288118);
INSERT INTO `rk_picture` VALUES (1340, '/uploads/picture/20180329/8fea4277425a730b16885dce9ee5adde.png', '/uploads/picture/20180329/8fea4277425a730b16885dce9ee5adde.png', '', '', 1, 1522288492);
INSERT INTO `rk_picture` VALUES (1341, '/uploads/picture/20180329/88832f835f7c1097f7355302a42ace0c.png', '/uploads/picture/20180329/88832f835f7c1097f7355302a42ace0c.png', '', '', 1, 1522288528);
INSERT INTO `rk_picture` VALUES (1342, '/uploads/picture/20180329/27cc549813d4183d71181973a988b946.png', '/uploads/picture/20180329/27cc549813d4183d71181973a988b946.png', '', '', 1, 1522288565);
INSERT INTO `rk_picture` VALUES (1343, '/uploads/picture/20180329/b057dc753f9dc01e27f400ebf20b279e.png', '/uploads/picture/20180329/b057dc753f9dc01e27f400ebf20b279e.png', '', '', 1, 1522288644);
INSERT INTO `rk_picture` VALUES (1344, '/uploads/picture/20180329/baa7268e2c30049eb19d1eb053ecc66e.jpg', '/uploads/picture/20180329/baa7268e2c30049eb19d1eb053ecc66e.jpg', '', '', 1, 1522290110);
INSERT INTO `rk_picture` VALUES (1345, '/uploads/picture/20180329/268edc2ee95aa9baf0257cf8d1b11ab0.jpg', '/uploads/picture/20180329/268edc2ee95aa9baf0257cf8d1b11ab0.jpg', '', '', 1, 1522290429);
INSERT INTO `rk_picture` VALUES (1346, '/uploads/picture/20180329/4a4271a8cc63bfa2c21f5858f6d1c7a0.jpg', '/uploads/picture/20180329/4a4271a8cc63bfa2c21f5858f6d1c7a0.jpg', '', '', 1, 1522290429);
INSERT INTO `rk_picture` VALUES (1347, '/uploads/picture/20180329/a7ceb799b1e96669b55f419102653c50.jpg', '/uploads/picture/20180329/a7ceb799b1e96669b55f419102653c50.jpg', '', '', 1, 1522292287);
INSERT INTO `rk_picture` VALUES (1348, '/uploads/picture/20180329/108bd77477fa271ca7a1721ac2183715.jpg', '/uploads/picture/20180329/108bd77477fa271ca7a1721ac2183715.jpg', '', '', 1, 1522292697);
INSERT INTO `rk_picture` VALUES (1349, '/uploads/picture/20180329/fa01d24f745d1f7ca89d2d9d5b7a6fff.jpg', '/uploads/picture/20180329/fa01d24f745d1f7ca89d2d9d5b7a6fff.jpg', '', '', 1, 1522295974);
INSERT INTO `rk_picture` VALUES (1350, '/uploads/picture/20180329/4d17eaf08bb1dde16c3e513c6c420c02.jpg', '/uploads/picture/20180329/4d17eaf08bb1dde16c3e513c6c420c02.jpg', '', '', 1, 1522306288);
INSERT INTO `rk_picture` VALUES (1351, '/uploads/picture/20180329/95505c84a2ba294d251df05e995d8873.jpg', '/uploads/picture/20180329/95505c84a2ba294d251df05e995d8873.jpg', '', '', 1, 1522307901);
INSERT INTO `rk_picture` VALUES (1352, '/uploads/picture/20180329/c233d0669294396daddaffddfa677208.jpg', '/uploads/picture/20180329/c233d0669294396daddaffddfa677208.jpg', '', '', 1, 1522307933);
INSERT INTO `rk_picture` VALUES (1353, '/uploads/picture/20180329/df18c2210a055b1b173211e443ab9aa4.jpg', '/uploads/picture/20180329/df18c2210a055b1b173211e443ab9aa4.jpg', '', '', 1, 1522308449);
INSERT INTO `rk_picture` VALUES (1354, '/uploads/picture/20180329/b4e8833836d0cb8c0fcb738f1d62d543.jpg', '/uploads/picture/20180329/b4e8833836d0cb8c0fcb738f1d62d543.jpg', '', '', 1, 1522310781);
INSERT INTO `rk_picture` VALUES (1355, '/uploads/picture/20180329/b3e5b7ddb865ddff7bd8630499e8345a.jpg', '/uploads/picture/20180329/b3e5b7ddb865ddff7bd8630499e8345a.jpg', '', '', 1, 1522311270);
INSERT INTO `rk_picture` VALUES (1356, '/uploads/picture/20180329/373b889f5a717f9cc683c9ede2b9d47b.jpg', '/uploads/picture/20180329/373b889f5a717f9cc683c9ede2b9d47b.jpg', '', '', 1, 1522312572);
INSERT INTO `rk_picture` VALUES (1357, '/uploads/picture/20180329/c4e19d322a2639e9f55f6b8ff1b06e89.jpg', '/uploads/picture/20180329/c4e19d322a2639e9f55f6b8ff1b06e89.jpg', '', '', 1, 1522312613);
INSERT INTO `rk_picture` VALUES (1358, '/uploads/picture/20180329/511bc4d15c0dace54689c5a16eb8abea.jpg', '/uploads/picture/20180329/511bc4d15c0dace54689c5a16eb8abea.jpg', '', '', 1, 1522312630);
INSERT INTO `rk_picture` VALUES (1359, '/uploads/picture/20180329/9cfc6fa4ba205b1b4b07b06b0b53b42a.jpg', '/uploads/picture/20180329/9cfc6fa4ba205b1b4b07b06b0b53b42a.jpg', '', '', 1, 1522312853);
INSERT INTO `rk_picture` VALUES (1360, '/uploads/picture/20180329/11c1ff530f05c904b5beb528a555f13e.jpg', '/uploads/picture/20180329/11c1ff530f05c904b5beb528a555f13e.jpg', '', '', 1, 1522312867);
INSERT INTO `rk_picture` VALUES (1361, '/uploads/picture/20180329/2fd30dfd94df5dafa9e099084236e7e8.jpg', '/uploads/picture/20180329/2fd30dfd94df5dafa9e099084236e7e8.jpg', '', '', 1, 1522314105);
INSERT INTO `rk_picture` VALUES (1362, '/uploads/picture/20180329/f904495200b0ca6af760a6c13bb6cff2.jpg', '/uploads/picture/20180329/f904495200b0ca6af760a6c13bb6cff2.jpg', '', '', 1, 1522314332);
INSERT INTO `rk_picture` VALUES (1363, '/uploads/picture/20180329/566eee6cde04986ce4e11a32f9b30d65.jpg', '/uploads/picture/20180329/566eee6cde04986ce4e11a32f9b30d65.jpg', '', '', 1, 1522314346);
INSERT INTO `rk_picture` VALUES (1364, '/uploads/picture/20180329/664ee68665200e083e8de0d6698f0297.jpg', '/uploads/picture/20180329/664ee68665200e083e8de0d6698f0297.jpg', '', '', 1, 1522314604);
INSERT INTO `rk_picture` VALUES (1365, '/uploads/picture/20180329/16919c0e21061442f657868b60da3cf6.jpg', '/uploads/picture/20180329/16919c0e21061442f657868b60da3cf6.jpg', '', '', 1, 1522314645);
INSERT INTO `rk_picture` VALUES (1366, '/uploads/picture/20180329/f021b23532968727bffdf6477ae10949.jpg', '/uploads/picture/20180329/f021b23532968727bffdf6477ae10949.jpg', '', '', 1, 1522314787);
INSERT INTO `rk_picture` VALUES (1367, '/uploads/picture/20180329/6866f05d4841b497a20b44235129210c.jpg', '/uploads/picture/20180329/6866f05d4841b497a20b44235129210c.jpg', '', '', 1, 1522314803);
INSERT INTO `rk_picture` VALUES (1368, '/uploads/picture/20180329/4d72cc53cf2607205676d062581d449b.jpg', '/uploads/picture/20180329/4d72cc53cf2607205676d062581d449b.jpg', '', '', 1, 1522314820);
INSERT INTO `rk_picture` VALUES (1369, '/uploads/picture/20180329/944ac0b8177fe600f9780ebf1e527e80.jpg', '/uploads/picture/20180329/944ac0b8177fe600f9780ebf1e527e80.jpg', '', '', 1, 1522314940);
INSERT INTO `rk_picture` VALUES (1370, '/uploads/picture/20180329/d4bca8773d7bb466a48013a31023f904.jpg', '/uploads/picture/20180329/d4bca8773d7bb466a48013a31023f904.jpg', '', '', 1, 1522314951);
INSERT INTO `rk_picture` VALUES (1371, '/uploads/picture/20180329/2420fc31f725133d829933cfcb6b4c8e.jpg', '/uploads/picture/20180329/2420fc31f725133d829933cfcb6b4c8e.jpg', '', '', 1, 1522314976);
INSERT INTO `rk_picture` VALUES (1372, '/uploads/picture/20180329/1b5c21fd4ed4d70c66729026e5dc3417.jpg', '/uploads/picture/20180329/1b5c21fd4ed4d70c66729026e5dc3417.jpg', '', '', 1, 1522315307);
INSERT INTO `rk_picture` VALUES (1373, '/uploads/picture/20180329/4e810b1b1302c1277760e6480860b1b0.jpg', '/uploads/picture/20180329/4e810b1b1302c1277760e6480860b1b0.jpg', '', '', 1, 1522315319);
INSERT INTO `rk_picture` VALUES (1374, '/uploads/picture/20180329/0a422d507de22b263a8a70ec6ca03603.jpg', '/uploads/picture/20180329/0a422d507de22b263a8a70ec6ca03603.jpg', '', '', 1, 1522315411);
INSERT INTO `rk_picture` VALUES (1375, '/uploads/picture/20180329/d4d514698af2f7cddf35fa50b5fdf1a8.jpg', '/uploads/picture/20180329/d4d514698af2f7cddf35fa50b5fdf1a8.jpg', '', '', 1, 1522315419);
INSERT INTO `rk_picture` VALUES (1376, '/uploads/picture/20180329/0a6d90ea2506fe00840204083d3c2dbb.jpg', '/uploads/picture/20180329/0a6d90ea2506fe00840204083d3c2dbb.jpg', '', '', 1, 1522315453);
INSERT INTO `rk_picture` VALUES (1377, '/uploads/picture/20180329/6f4f7b0577ff855bae6c94808998ecac.jpg', '/uploads/picture/20180329/6f4f7b0577ff855bae6c94808998ecac.jpg', '', '', 1, 1522315599);
INSERT INTO `rk_picture` VALUES (1378, '/uploads/picture/20180329/8cf3ea4bb8f658b67323545a70190a9b.jpg', '/uploads/picture/20180329/8cf3ea4bb8f658b67323545a70190a9b.jpg', '', '', 1, 1522315685);
INSERT INTO `rk_picture` VALUES (1379, '/uploads/picture/20180329/7a6a0d51198f63f34d37cd33dc14e3a1.jpg', '/uploads/picture/20180329/7a6a0d51198f63f34d37cd33dc14e3a1.jpg', '', '', 1, 1522315763);
INSERT INTO `rk_picture` VALUES (1380, '/uploads/picture/20180329/fc928447e25b8ec8215f7ea703262377.jpg', '/uploads/picture/20180329/fc928447e25b8ec8215f7ea703262377.jpg', '', '', 1, 1522315792);
INSERT INTO `rk_picture` VALUES (1381, '/uploads/picture/20180329/37b26d34b2c28496e3da44ae856ceb7b.jpg', '/uploads/picture/20180329/37b26d34b2c28496e3da44ae856ceb7b.jpg', '', '', 1, 1522315807);
INSERT INTO `rk_picture` VALUES (1382, '/uploads/picture/20180329/2eb2f65c4d8aee6d89ba026076bc0dc2.jpg', '/uploads/picture/20180329/2eb2f65c4d8aee6d89ba026076bc0dc2.jpg', '', '', 1, 1522316054);
INSERT INTO `rk_picture` VALUES (1383, '/uploads/picture/20180329/a5fb67237e1d864d2bd53e0110edc3f8.jpg', '/uploads/picture/20180329/a5fb67237e1d864d2bd53e0110edc3f8.jpg', '', '', 1, 1522316062);
INSERT INTO `rk_picture` VALUES (1384, '/uploads/picture/20180329/23d61fc449f293269213fa5b912c28f0.jpg', '/uploads/picture/20180329/23d61fc449f293269213fa5b912c28f0.jpg', '', '', 1, 1522316142);
INSERT INTO `rk_picture` VALUES (1385, '/uploads/picture/20180329/e9a8297a4640eb9b5415e02982ec7728.jpg', '/uploads/picture/20180329/e9a8297a4640eb9b5415e02982ec7728.jpg', '', '', 1, 1522316168);
INSERT INTO `rk_picture` VALUES (1386, '/uploads/picture/20180329/9986124ac84bec580e196e0262bdf8d9.jpg', '/uploads/picture/20180329/9986124ac84bec580e196e0262bdf8d9.jpg', '', '', 1, 1522316351);
INSERT INTO `rk_picture` VALUES (1387, '/uploads/picture/20180329/a8edb4a6c4ba997fe7087b5b4e905d81.jpg', '/uploads/picture/20180329/a8edb4a6c4ba997fe7087b5b4e905d81.jpg', '', '', 1, 1522316366);
INSERT INTO `rk_picture` VALUES (1388, '/uploads/picture/20180329/3d9d0d927fb82c42ed298d5b104a122e.jpg', '/uploads/picture/20180329/3d9d0d927fb82c42ed298d5b104a122e.jpg', '', '', 1, 1522316419);
INSERT INTO `rk_picture` VALUES (1389, '/uploads/picture/20180329/28b73bd506dedf9d9c91abd2755b60c4.jpg', '/uploads/picture/20180329/28b73bd506dedf9d9c91abd2755b60c4.jpg', '', '', 1, 1522316458);
INSERT INTO `rk_picture` VALUES (1390, '/uploads/picture/20180329/688646dd3bc41a047e4fb3b13eb799d0.jpg', '/uploads/picture/20180329/688646dd3bc41a047e4fb3b13eb799d0.jpg', '', '', 1, 1522316650);
INSERT INTO `rk_picture` VALUES (1391, '/uploads/picture/20180329/991f34d49e9ccd47887114d079cdaae0.jpg', '/uploads/picture/20180329/991f34d49e9ccd47887114d079cdaae0.jpg', '', '', 1, 1522316661);
INSERT INTO `rk_picture` VALUES (1392, '/uploads/picture/20180329/34ada95886c35f0fbd7910f1114d0150.jpg', '/uploads/picture/20180329/34ada95886c35f0fbd7910f1114d0150.jpg', '', '', 1, 1522316696);
INSERT INTO `rk_picture` VALUES (1393, '/uploads/picture/20180329/b24733fd20bb728bf73c048511932843.jpg', '/uploads/picture/20180329/b24733fd20bb728bf73c048511932843.jpg', '', '', 1, 1522316918);
INSERT INTO `rk_picture` VALUES (1394, '/uploads/picture/20180329/52561326a3ff551d6ace3adca861e17c.jpg', '/uploads/picture/20180329/52561326a3ff551d6ace3adca861e17c.jpg', '', '', 1, 1522316930);
INSERT INTO `rk_picture` VALUES (1395, '/uploads/picture/20180329/76509dda39d0915aa422947bbee8a622.jpg', '/uploads/picture/20180329/76509dda39d0915aa422947bbee8a622.jpg', '', '', 1, 1522316945);
INSERT INTO `rk_picture` VALUES (1396, '/uploads/picture/20180329/50ce9864c742d3a926388b513d93eebe.jpg', '/uploads/picture/20180329/50ce9864c742d3a926388b513d93eebe.jpg', '', '', 1, 1522316955);
INSERT INTO `rk_picture` VALUES (1397, '/uploads/picture/20180329/4a5cc0502a425201fd47b88f4eba0f06.jpg', '/uploads/picture/20180329/4a5cc0502a425201fd47b88f4eba0f06.jpg', '', '', 1, 1522317086);
INSERT INTO `rk_picture` VALUES (1398, '/uploads/picture/20180329/81ef58402181af01d1fa9237f53231a3.jpg', '/uploads/picture/20180329/81ef58402181af01d1fa9237f53231a3.jpg', '', '', 1, 1522317118);
INSERT INTO `rk_picture` VALUES (1399, '/uploads/picture/20180329/7b8b4bf451b957431b02906b117a4c19.jpg', '/uploads/picture/20180329/7b8b4bf451b957431b02906b117a4c19.jpg', '', '', 1, 1522317138);
INSERT INTO `rk_picture` VALUES (1400, '/uploads/picture/20180329/26999b7a151aade7706d7b68ac30e7dc.jpg', '/uploads/picture/20180329/26999b7a151aade7706d7b68ac30e7dc.jpg', '', '', 1, 1522317152);
INSERT INTO `rk_picture` VALUES (1401, '/uploads/picture/20180329/c18ff58f151319c39e3e0164654e27a9.jpg', '/uploads/picture/20180329/c18ff58f151319c39e3e0164654e27a9.jpg', '', '', 1, 1522317327);
INSERT INTO `rk_picture` VALUES (1402, '/uploads/picture/20180329/7b7fe892282cbf1067849d918e56ee25.jpg', '/uploads/picture/20180329/7b7fe892282cbf1067849d918e56ee25.jpg', '', '', 1, 1522317360);
INSERT INTO `rk_picture` VALUES (1403, '/uploads/picture/20180329/9fbb25cf95e9a27c4a4dfe7ef44a421f.jpg', '/uploads/picture/20180329/9fbb25cf95e9a27c4a4dfe7ef44a421f.jpg', '', '', 1, 1522317694);
INSERT INTO `rk_picture` VALUES (1404, '/uploads/picture/20180329/77d4b2e5a87c0725d9e55969c4bdfc45.jpg', '/uploads/picture/20180329/77d4b2e5a87c0725d9e55969c4bdfc45.jpg', '', '', 1, 1522317716);
INSERT INTO `rk_picture` VALUES (1405, '/uploads/picture/20180329/1bfbdddf3d68dc04d0a74cfb0343dab1.jpg', '/uploads/picture/20180329/1bfbdddf3d68dc04d0a74cfb0343dab1.jpg', '', '', 1, 1522317728);
INSERT INTO `rk_picture` VALUES (1406, '/uploads/picture/20180329/fd42c0924ac466b13986161a625a8fec.jpg', '/uploads/picture/20180329/fd42c0924ac466b13986161a625a8fec.jpg', '', '', 1, 1522317738);
INSERT INTO `rk_picture` VALUES (1407, '/uploads/picture/20180329/58c5ae6090ef5349e577254754f358ea.jpg', '/uploads/picture/20180329/58c5ae6090ef5349e577254754f358ea.jpg', '', '', 1, 1522317813);
INSERT INTO `rk_picture` VALUES (1408, '/uploads/picture/20180329/7c18e33440c837962666ba66906c26b0.jpg', '/uploads/picture/20180329/7c18e33440c837962666ba66906c26b0.jpg', '', '', 1, 1522317821);
INSERT INTO `rk_picture` VALUES (1409, '/uploads/picture/20180329/d12600601226f1c23de3fcdebbd56921.jpg', '/uploads/picture/20180329/d12600601226f1c23de3fcdebbd56921.jpg', '', '', 1, 1522317980);
INSERT INTO `rk_picture` VALUES (1410, '/uploads/picture/20180329/0f0249b69ccc2473516a321317cea596.jpg', '/uploads/picture/20180329/0f0249b69ccc2473516a321317cea596.jpg', '', '', 1, 1522318451);
INSERT INTO `rk_picture` VALUES (1411, '/uploads/picture/20180329/b244c99e029a87121e2deae232eccebc.jpg', '/uploads/picture/20180329/b244c99e029a87121e2deae232eccebc.jpg', '', '', 1, 1522318581);
INSERT INTO `rk_picture` VALUES (1412, '/uploads/picture/20180329/41050b752b930054a0bb5ec784c4e4f2.jpg', '/uploads/picture/20180329/41050b752b930054a0bb5ec784c4e4f2.jpg', '', '', 1, 1522319173);
INSERT INTO `rk_picture` VALUES (1413, '/uploads/picture/20180329/2ad5aff1ba0ef59453cf651bfb16e453.jpg', '/uploads/picture/20180329/2ad5aff1ba0ef59453cf651bfb16e453.jpg', '', '', 1, 1522319446);
INSERT INTO `rk_picture` VALUES (1414, '/uploads/picture/20180329/23f7f98b62a7ee79f2131ad78ff9f4fa.jpg', '/uploads/picture/20180329/23f7f98b62a7ee79f2131ad78ff9f4fa.jpg', '', '', 1, 1522319476);
INSERT INTO `rk_picture` VALUES (1415, '/uploads/picture/20180329/c02f0b403af0fadf811d6f72954ea387.jpg', '/uploads/picture/20180329/c02f0b403af0fadf811d6f72954ea387.jpg', '', '', 1, 1522319510);
INSERT INTO `rk_picture` VALUES (1416, '/uploads/picture/20180329/7bfac66e9c9903c02305b90028b1003b.jpg', '/uploads/picture/20180329/7bfac66e9c9903c02305b90028b1003b.jpg', '', '', 1, 1522319535);
INSERT INTO `rk_picture` VALUES (1417, '/uploads/picture/20180329/ece2a0e1f18a42c912e4d0a963b5ca49.jpg', '/uploads/picture/20180329/ece2a0e1f18a42c912e4d0a963b5ca49.jpg', '', '', 1, 1522319721);
INSERT INTO `rk_picture` VALUES (1418, '/uploads/picture/20180329/0f3edc05e6149c813a6e83e231232469.jpg', '/uploads/picture/20180329/0f3edc05e6149c813a6e83e231232469.jpg', '', '', 1, 1522319876);
INSERT INTO `rk_picture` VALUES (1419, '/uploads/picture/20180329/82fe6c21f8bf71a49462e6db2e5b07eb.jpg', '/uploads/picture/20180329/82fe6c21f8bf71a49462e6db2e5b07eb.jpg', '', '', 1, 1522319951);
INSERT INTO `rk_picture` VALUES (1420, '/uploads/picture/20180329/d2fd812365ac65654f57f63cd15f6a09.jpg', '/uploads/picture/20180329/d2fd812365ac65654f57f63cd15f6a09.jpg', '', '', 1, 1522320187);
INSERT INTO `rk_picture` VALUES (1421, '/uploads/picture/20180329/50284813e7f36f096bc096eaf1e1c209.jpg', '/uploads/picture/20180329/50284813e7f36f096bc096eaf1e1c209.jpg', '', '', 1, 1522320201);
INSERT INTO `rk_picture` VALUES (1422, '/uploads/picture/20180329/fd0b6e5cf79a0229b136d3690f944518.jpg', '/uploads/picture/20180329/fd0b6e5cf79a0229b136d3690f944518.jpg', '', '', 1, 1522320214);
INSERT INTO `rk_picture` VALUES (1423, '/uploads/picture/20180329/47b5be98fbadf835fec7ada4d6de0eba.jpg', '/uploads/picture/20180329/47b5be98fbadf835fec7ada4d6de0eba.jpg', '', '', 1, 1522320242);
INSERT INTO `rk_picture` VALUES (1424, '/uploads/picture/20180329/99293b72bb9dadf49c622f1ec69de9c7.jpg', '/uploads/picture/20180329/99293b72bb9dadf49c622f1ec69de9c7.jpg', '', '', 1, 1522320360);
INSERT INTO `rk_picture` VALUES (1425, '/uploads/picture/20180329/8dc5c8519241320913774312f15e4bee.jpg', '/uploads/picture/20180329/8dc5c8519241320913774312f15e4bee.jpg', '', '', 1, 1522320523);
INSERT INTO `rk_picture` VALUES (1426, '/uploads/picture/20180329/d27cfa4b4a19fe40b6de4d5cf44c4da6.jpg', '/uploads/picture/20180329/d27cfa4b4a19fe40b6de4d5cf44c4da6.jpg', '', '', 1, 1522320678);
INSERT INTO `rk_picture` VALUES (1427, '/uploads/picture/20180329/385f15eab14ae5eac6422ab9e1c48501.jpg', '/uploads/picture/20180329/385f15eab14ae5eac6422ab9e1c48501.jpg', '', '', 1, 1522320731);
INSERT INTO `rk_picture` VALUES (1428, '/uploads/picture/20180329/860695d6a7b32b5890be22a81eb30a80.jpg', '/uploads/picture/20180329/860695d6a7b32b5890be22a81eb30a80.jpg', '', '', 1, 1522320856);
INSERT INTO `rk_picture` VALUES (1429, '/uploads/picture/20180329/fffb9f345deb6689c973d4ba21286a82.jpg', '/uploads/picture/20180329/fffb9f345deb6689c973d4ba21286a82.jpg', '', '', 1, 1522320949);
INSERT INTO `rk_picture` VALUES (1430, '/uploads/picture/20180329/b8a72ccc4ad1a447a260729f30e8a1e7.jpg', '/uploads/picture/20180329/b8a72ccc4ad1a447a260729f30e8a1e7.jpg', '', '', 1, 1522321086);
INSERT INTO `rk_picture` VALUES (1431, '/uploads/picture/20180329/2d84b0d94106940b6cadfa5bd8e78729.jpg', '/uploads/picture/20180329/2d84b0d94106940b6cadfa5bd8e78729.jpg', '', '', 1, 1522321183);
INSERT INTO `rk_picture` VALUES (1432, '/uploads/picture/20180329/221628333732f8b1403d93e746dfed17.jpg', '/uploads/picture/20180329/221628333732f8b1403d93e746dfed17.jpg', '', '', 1, 1522321351);
INSERT INTO `rk_picture` VALUES (1433, '/uploads/picture/20180329/cce0474b791b60f117e51776783abd73.jpg', '/uploads/picture/20180329/cce0474b791b60f117e51776783abd73.jpg', '', '', 1, 1522321413);
INSERT INTO `rk_picture` VALUES (1434, '/uploads/picture/20180329/ef834c5b7bc7467504df4403f17c8a82.jpg', '/uploads/picture/20180329/ef834c5b7bc7467504df4403f17c8a82.jpg', '', '', 1, 1522321667);
INSERT INTO `rk_picture` VALUES (1435, '/uploads/picture/20180329/f901932990bfc25e7b7ee5fdd097ff63.jpg', '/uploads/picture/20180329/f901932990bfc25e7b7ee5fdd097ff63.jpg', '', '', 1, 1522321716);
INSERT INTO `rk_picture` VALUES (1436, '/uploads/picture/20180329/03fd46e2c8ff0944a39750ffebe06b3a.jpg', '/uploads/picture/20180329/03fd46e2c8ff0944a39750ffebe06b3a.jpg', '', '', 1, 1522321738);
INSERT INTO `rk_picture` VALUES (1437, '/uploads/picture/20180329/5d293361d0a25e0e2c8380a276cfd14e.jpg', '/uploads/picture/20180329/5d293361d0a25e0e2c8380a276cfd14e.jpg', '', '', 1, 1522321934);
INSERT INTO `rk_picture` VALUES (1438, '/uploads/picture/20180329/db831b3b08de8f6aa8152661a0172bb6.jpg', '/uploads/picture/20180329/db831b3b08de8f6aa8152661a0172bb6.jpg', '', '', 1, 1522321959);
INSERT INTO `rk_picture` VALUES (1439, '/uploads/picture/20180329/4470ca93fc453740bbfba09394c95400.jpg', '/uploads/picture/20180329/4470ca93fc453740bbfba09394c95400.jpg', '', '', 1, 1522322362);
INSERT INTO `rk_picture` VALUES (1440, '/uploads/picture/20180329/784432b0f506933576e86cb15a828097.jpg', '/uploads/picture/20180329/784432b0f506933576e86cb15a828097.jpg', '', '', 1, 1522322444);
INSERT INTO `rk_picture` VALUES (1441, '/uploads/picture/20180329/330e7082a5dda1c0f12185463795bf34.jpg', '/uploads/picture/20180329/330e7082a5dda1c0f12185463795bf34.jpg', '', '', 1, 1522322462);
INSERT INTO `rk_picture` VALUES (1442, '/uploads/picture/20180329/aed23445e0f070f7cf8d2bfd8ed7303b.jpg', '/uploads/picture/20180329/aed23445e0f070f7cf8d2bfd8ed7303b.jpg', '', '', 1, 1522322593);
INSERT INTO `rk_picture` VALUES (1443, '/uploads/picture/20180329/f1f5af7c54ab4fd3fe23a53136d0d4c9.jpg', '/uploads/picture/20180329/f1f5af7c54ab4fd3fe23a53136d0d4c9.jpg', '', '', 1, 1522322628);
INSERT INTO `rk_picture` VALUES (1444, '/uploads/picture/20180329/c37fd55de1c3a5d331394b090ed6eda7.jpg', '/uploads/picture/20180329/c37fd55de1c3a5d331394b090ed6eda7.jpg', '', '', 1, 1522322641);
INSERT INTO `rk_picture` VALUES (1445, '/uploads/picture/20180329/756c1b147db1c17a9c53ec0c9987fd59.jpg', '/uploads/picture/20180329/756c1b147db1c17a9c53ec0c9987fd59.jpg', '', '', 1, 1522322720);
INSERT INTO `rk_picture` VALUES (1446, '/uploads/picture/20180329/e748ddfafac98b0e4c3f25d817141579.jpg', '/uploads/picture/20180329/e748ddfafac98b0e4c3f25d817141579.jpg', '', '', 1, 1522322729);
INSERT INTO `rk_picture` VALUES (1447, '/uploads/picture/20180329/a364ea8c534699647dbdcf099fd8e804.jpg', '/uploads/picture/20180329/a364ea8c534699647dbdcf099fd8e804.jpg', '', '', 1, 1522322821);
INSERT INTO `rk_picture` VALUES (1448, '/uploads/picture/20180329/52d4634938d4b8a5639131a1dce51022.jpg', '/uploads/picture/20180329/52d4634938d4b8a5639131a1dce51022.jpg', '', '', 1, 1522322842);
INSERT INTO `rk_picture` VALUES (1449, '/uploads/picture/20180329/59251af54fab34d80291256eed30fb8e.jpg', '/uploads/picture/20180329/59251af54fab34d80291256eed30fb8e.jpg', '', '', 1, 1522322849);
INSERT INTO `rk_picture` VALUES (1450, '/uploads/picture/20180329/8b8c11021b69fa802a82660e1da8e1ed.jpg', '/uploads/picture/20180329/8b8c11021b69fa802a82660e1da8e1ed.jpg', '', '', 1, 1522322856);
INSERT INTO `rk_picture` VALUES (1451, '/uploads/picture/20180329/eb0be8691bc3ecbdfbebd046619f5ade.jpg', '/uploads/picture/20180329/eb0be8691bc3ecbdfbebd046619f5ade.jpg', '', '', 1, 1522323012);
INSERT INTO `rk_picture` VALUES (1452, '/uploads/picture/20180329/ab56c8e7f4c5c8138ca95282b8f96f95.jpg', '/uploads/picture/20180329/ab56c8e7f4c5c8138ca95282b8f96f95.jpg', '', '', 1, 1522323042);
INSERT INTO `rk_picture` VALUES (1453, '/uploads/picture/20180329/e9f82addb3250926df3c3a00208894e5.jpg', '/uploads/picture/20180329/e9f82addb3250926df3c3a00208894e5.jpg', '', '', 1, 1522323055);
INSERT INTO `rk_picture` VALUES (1454, '/uploads/picture/20180329/4eea25afaed0e1e46f397fcb331a6f01.jpg', '/uploads/picture/20180329/4eea25afaed0e1e46f397fcb331a6f01.jpg', '', '', 1, 1522323064);
INSERT INTO `rk_picture` VALUES (1455, '/uploads/picture/20180329/8a8086b5e0eca88cd06cf44efafccd21.jpg', '/uploads/picture/20180329/8a8086b5e0eca88cd06cf44efafccd21.jpg', '', '', 1, 1522332790);
INSERT INTO `rk_picture` VALUES (1456, '/uploads/picture/20180329/cc9b436820f356a60ee3ff328af6c0f0.jpg', '/uploads/picture/20180329/cc9b436820f356a60ee3ff328af6c0f0.jpg', '', '', 1, 1522332868);
INSERT INTO `rk_picture` VALUES (1457, '/uploads/picture/20180329/3f7d65e8a2e21f9d264734837aaa78d9.jpg', '/uploads/picture/20180329/3f7d65e8a2e21f9d264734837aaa78d9.jpg', '', '', 1, 1522334209);
INSERT INTO `rk_picture` VALUES (1458, '/uploads/picture/20180329/1aeb859f8c1b84c439a9f61ce9e19d76.jpg', '/uploads/picture/20180329/1aeb859f8c1b84c439a9f61ce9e19d76.jpg', '', '', 1, 1522334244);
INSERT INTO `rk_picture` VALUES (1459, '/uploads/picture/20180330/d3432716a8d635d1ac1fbfd1616c4000.jpg', '/uploads/picture/20180330/d3432716a8d635d1ac1fbfd1616c4000.jpg', '', '', 1, 1522344608);
INSERT INTO `rk_picture` VALUES (1460, '/uploads/picture/20180330/8a6e7a24c6d320f206e7e3d0c2081dab.jpg', '/uploads/picture/20180330/8a6e7a24c6d320f206e7e3d0c2081dab.jpg', '', '', 1, 1522344640);
INSERT INTO `rk_picture` VALUES (1461, '/uploads/picture/20180330/b009c1126408546b5df026a17e8e8cc1.jpg', '/uploads/picture/20180330/b009c1126408546b5df026a17e8e8cc1.jpg', '', '', 1, 1522356516);
INSERT INTO `rk_picture` VALUES (1462, '/uploads/picture/20180330/37f10cfe20b5db23a5c567a8edc543c1.jpg', '/uploads/picture/20180330/37f10cfe20b5db23a5c567a8edc543c1.jpg', '', '', 1, 1522356529);
INSERT INTO `rk_picture` VALUES (1463, '/uploads/picture/20180330/4f44dc3da73b2f043b3467cd57a42186.jpg', '/uploads/picture/20180330/4f44dc3da73b2f043b3467cd57a42186.jpg', '', '', 1, 1522356583);
INSERT INTO `rk_picture` VALUES (1464, '/uploads/picture/20180330/6a47f64427defacd12730b63367b6d7e.jpg', '/uploads/picture/20180330/6a47f64427defacd12730b63367b6d7e.jpg', '', '', 1, 1522356595);
INSERT INTO `rk_picture` VALUES (1465, '/uploads/picture/20180330/fa1f954e4d1b723d537959cc061c0f42.jpg', '/uploads/picture/20180330/fa1f954e4d1b723d537959cc061c0f42.jpg', '', '', 1, 1522356620);
INSERT INTO `rk_picture` VALUES (1466, '/uploads/picture/20180330/29d5ae4e9c34d75607161fa018c01bd7.jpg', '/uploads/picture/20180330/29d5ae4e9c34d75607161fa018c01bd7.jpg', '', '', 1, 1522359723);
INSERT INTO `rk_picture` VALUES (1467, '/uploads/picture/20180330/79f447dc39cef01fa6b865e9a0314870.png', '/uploads/picture/20180330/79f447dc39cef01fa6b865e9a0314870.png', '', '', 1, 1522379382);
INSERT INTO `rk_picture` VALUES (1468, '/uploads/picture/20180330/0f977177d965bd8932db6d93f6c6eb63.png', '/uploads/picture/20180330/0f977177d965bd8932db6d93f6c6eb63.png', '', '', 1, 1522379421);
INSERT INTO `rk_picture` VALUES (1469, '/uploads/picture/20180330/57b34ac550143ce6422e5dd39da76fe8.png', '/uploads/picture/20180330/57b34ac550143ce6422e5dd39da76fe8.png', '', '', 1, 1522379470);
INSERT INTO `rk_picture` VALUES (1470, '/uploads/picture/20180330/2cd7267b18854fea891839eb92325f73.png', '/uploads/picture/20180330/2cd7267b18854fea891839eb92325f73.png', '', '', 1, 1522379571);
INSERT INTO `rk_picture` VALUES (1471, '/uploads/picture/20180330/cf78ecc48d60b51fb2aabee89bcc9f99.jpg', '/uploads/picture/20180330/cf78ecc48d60b51fb2aabee89bcc9f99.jpg', '', '', 1, 1522383594);
INSERT INTO `rk_picture` VALUES (1472, '/uploads/picture/20180330/0d44b7bbdfc4f35a3aaa3080e96e1c3d.jpg', '/uploads/picture/20180330/0d44b7bbdfc4f35a3aaa3080e96e1c3d.jpg', '', '', 1, 1522383628);
INSERT INTO `rk_picture` VALUES (1473, '/uploads/picture/20180330/6b5a8773887f7a7055380bdaf6b776ce.jpg', '/uploads/picture/20180330/6b5a8773887f7a7055380bdaf6b776ce.jpg', '', '', 1, 1522384166);
INSERT INTO `rk_picture` VALUES (1474, '/uploads/picture/20180330/a71f38c03eba1bf637046868fa891e1c.jpg', '/uploads/picture/20180330/a71f38c03eba1bf637046868fa891e1c.jpg', '', '', 1, 1522384364);
INSERT INTO `rk_picture` VALUES (1475, '/uploads/picture/20180330/a928d9a1b81d3075619834c8e7613351.jpg', '/uploads/picture/20180330/a928d9a1b81d3075619834c8e7613351.jpg', '', '', 1, 1522405560);
INSERT INTO `rk_picture` VALUES (1476, '/uploads/picture/20180330/5c6e08089a48b315adc01d5e564cb676.jpg', '/uploads/picture/20180330/5c6e08089a48b315adc01d5e564cb676.jpg', '', '', 1, 1522405580);
INSERT INTO `rk_picture` VALUES (1477, '/uploads/picture/20180330/db25ffa967e98b4921fcae09b88fe451.jpg', '/uploads/picture/20180330/db25ffa967e98b4921fcae09b88fe451.jpg', '', '', 1, 1522406326);
INSERT INTO `rk_picture` VALUES (1478, '/uploads/picture/20180330/4e801e36046bdfd18f5be0316605557d.jpg', '/uploads/picture/20180330/4e801e36046bdfd18f5be0316605557d.jpg', '', '', 1, 1522406479);
INSERT INTO `rk_picture` VALUES (1479, '/uploads/picture/20180330/d4ea22a66b0778d710ed15e1e8e47806.jpg', '/uploads/picture/20180330/d4ea22a66b0778d710ed15e1e8e47806.jpg', '', '', 1, 1522407210);
INSERT INTO `rk_picture` VALUES (1480, '/uploads/picture/20180330/48d71cf0cd7c6808fef19e8183a29b87.jpg', '/uploads/picture/20180330/48d71cf0cd7c6808fef19e8183a29b87.jpg', '', '', 1, 1522407309);
INSERT INTO `rk_picture` VALUES (1481, '/uploads/picture/20180330/21415f95d8fdabf51bb1062396374103.jpg', '/uploads/picture/20180330/21415f95d8fdabf51bb1062396374103.jpg', '', '', 1, 1522408616);
INSERT INTO `rk_picture` VALUES (1482, '/uploads/picture/20180330/4c3e495398d70b664567538b6c345402.jpg', '/uploads/picture/20180330/4c3e495398d70b664567538b6c345402.jpg', '', '', 1, 1522408670);
INSERT INTO `rk_picture` VALUES (1483, '/uploads/picture/20180330/eb8a9842bf975677ead8914afbea8628.jpg', '/uploads/picture/20180330/eb8a9842bf975677ead8914afbea8628.jpg', '', '', 1, 1522408723);
INSERT INTO `rk_picture` VALUES (1484, '/uploads/picture/20180330/64768de202b875945c05e9e708f70a5e.jpg', '/uploads/picture/20180330/64768de202b875945c05e9e708f70a5e.jpg', '', '', 1, 1522409329);
INSERT INTO `rk_picture` VALUES (1485, '/uploads/picture/20180330/07b252ec100d7bfca59988ae2211f9d1.jpg', '/uploads/picture/20180330/07b252ec100d7bfca59988ae2211f9d1.jpg', '', '', 1, 1522409550);
INSERT INTO `rk_picture` VALUES (1486, '/uploads/picture/20180330/39564604f20622a812c33c11b5dfd4ff.jpg', '/uploads/picture/20180330/39564604f20622a812c33c11b5dfd4ff.jpg', '', '', 1, 1522409637);
INSERT INTO `rk_picture` VALUES (1487, '/uploads/picture/20180330/1bbe9b3ab5e65cd8cb035d930b5ed85a.jpg', '/uploads/picture/20180330/1bbe9b3ab5e65cd8cb035d930b5ed85a.jpg', '', '', 1, 1522409649);
INSERT INTO `rk_picture` VALUES (1488, '/uploads/picture/20180331/ead32fba912cf2018803092cccef9ee5.jpg', '/uploads/picture/20180331/ead32fba912cf2018803092cccef9ee5.jpg', '', '', 1, 1522461186);
INSERT INTO `rk_picture` VALUES (1489, '/uploads/picture/20180331/4f3dd9aa4da4442ab1579889d66acf46.jpg', '/uploads/picture/20180331/4f3dd9aa4da4442ab1579889d66acf46.jpg', '', '', 1, 1522461742);
INSERT INTO `rk_picture` VALUES (1490, '/uploads/picture/20180331/61334afe2ef9b8956cec22b7713270ff.jpg', '/uploads/picture/20180331/61334afe2ef9b8956cec22b7713270ff.jpg', '', '', 1, 1522478470);
INSERT INTO `rk_picture` VALUES (1491, '/uploads/picture/20180331/f786a9804ec96b47329af677b4de5d2e.jpg', '/uploads/picture/20180331/f786a9804ec96b47329af677b4de5d2e.jpg', '', '', 1, 1522478575);
INSERT INTO `rk_picture` VALUES (1492, '/uploads/picture/20180331/432d3aa3d47e1b187e66bb9da414c064.jpg', '/uploads/picture/20180331/432d3aa3d47e1b187e66bb9da414c064.jpg', '', '', 1, 1522478581);
INSERT INTO `rk_picture` VALUES (1493, '/uploads/picture/20180331/f1b97766d5ff655585fa5f26e7465797.jpg', '/uploads/picture/20180331/f1b97766d5ff655585fa5f26e7465797.jpg', '', '', 1, 1522480009);
INSERT INTO `rk_picture` VALUES (1494, '/uploads/picture/20180331/bd03a215bf6cf6e8e0d61a41bcf0261a.jpg', '/uploads/picture/20180331/bd03a215bf6cf6e8e0d61a41bcf0261a.jpg', '', '', 1, 1522480022);
INSERT INTO `rk_picture` VALUES (1495, '/uploads/picture/20180331/82d64521aef790183169ae90ec01c08a.jpg', '/uploads/picture/20180331/82d64521aef790183169ae90ec01c08a.jpg', '', '', 1, 1522482818);
INSERT INTO `rk_picture` VALUES (1496, '/uploads/picture/20180331/775b901b1a4e6610613e812c081a227e.jpg', '/uploads/picture/20180331/775b901b1a4e6610613e812c081a227e.jpg', '', '', 1, 1522482961);
INSERT INTO `rk_picture` VALUES (1497, '/uploads/picture/20180331/d25c6f6122400e98c880671889693fc1.jpg', '/uploads/picture/20180331/d25c6f6122400e98c880671889693fc1.jpg', '', '', 1, 1522483925);
INSERT INTO `rk_picture` VALUES (1498, '/uploads/picture/20180331/fff625ba8e49afd4cb9ed88b26c23787.jpg', '/uploads/picture/20180331/fff625ba8e49afd4cb9ed88b26c23787.jpg', '', '', 1, 1522483976);
INSERT INTO `rk_picture` VALUES (1499, '/uploads/picture/20180331/ddb3334e757baa1927f3065d54f2fbae.jpg', '/uploads/picture/20180331/ddb3334e757baa1927f3065d54f2fbae.jpg', '', '', 1, 1522484986);
INSERT INTO `rk_picture` VALUES (1500, '/uploads/picture/20180331/76bbb3c28f5538a3dd1a4dfbdb562698.jpg', '/uploads/picture/20180331/76bbb3c28f5538a3dd1a4dfbdb562698.jpg', '', '', 1, 1522485018);
INSERT INTO `rk_picture` VALUES (1501, '/uploads/picture/20180331/f1d8ba132ba870ffebc96ea037a22223.jpg', '/uploads/picture/20180331/f1d8ba132ba870ffebc96ea037a22223.jpg', '', '', 1, 1522485099);
INSERT INTO `rk_picture` VALUES (1502, '/uploads/picture/20180331/05f81957b857dd50c68dfe836675dfed.jpg', '/uploads/picture/20180331/05f81957b857dd50c68dfe836675dfed.jpg', '', '', 1, 1522485120);
INSERT INTO `rk_picture` VALUES (1503, '/uploads/picture/20180331/b915cd27028b11cf29406ab735ba9cde.jpg', '/uploads/picture/20180331/b915cd27028b11cf29406ab735ba9cde.jpg', '', '', 1, 1522485344);
INSERT INTO `rk_picture` VALUES (1504, '/uploads/picture/20180331/b6f241c4340f7050870a2e9c797b7ec9.jpg', '/uploads/picture/20180331/b6f241c4340f7050870a2e9c797b7ec9.jpg', '', '', 1, 1522485364);
INSERT INTO `rk_picture` VALUES (1505, '/uploads/picture/20180331/d948682601206f954c5c08a737220e09.jpg', '/uploads/picture/20180331/d948682601206f954c5c08a737220e09.jpg', '', '', 1, 1522486258);
INSERT INTO `rk_picture` VALUES (1506, '/uploads/picture/20180331/f4d1149c9a98a0dc47f6518071e6fba8.jpg', '/uploads/picture/20180331/f4d1149c9a98a0dc47f6518071e6fba8.jpg', '', '', 1, 1522486372);
INSERT INTO `rk_picture` VALUES (1507, '/uploads/picture/20180331/5e93ee92c77cd10742e28db8acf23418.jpg', '/uploads/picture/20180331/5e93ee92c77cd10742e28db8acf23418.jpg', '', '', 1, 1522486400);
INSERT INTO `rk_picture` VALUES (1508, '/uploads/picture/20180331/3bb8a17bd98905ef3ccfc556f61ff74e.jpg', '/uploads/picture/20180331/3bb8a17bd98905ef3ccfc556f61ff74e.jpg', '', '', 1, 1522486400);
INSERT INTO `rk_picture` VALUES (1509, '/uploads/picture/20180331/4549f1f85e1dd3e2b512d2f45e3fc8a5.jpg', '/uploads/picture/20180331/4549f1f85e1dd3e2b512d2f45e3fc8a5.jpg', '', '', 1, 1522487068);
INSERT INTO `rk_picture` VALUES (1510, '/uploads/picture/20180331/409ea24fdc93ab259b8d3a938cbd6c90.jpg', '/uploads/picture/20180331/409ea24fdc93ab259b8d3a938cbd6c90.jpg', '', '', 1, 1522487159);
INSERT INTO `rk_picture` VALUES (1511, '/uploads/picture/20180331/a13ee3e7ec62a4baa16b9ec7b6e076f5.jpg', '/uploads/picture/20180331/a13ee3e7ec62a4baa16b9ec7b6e076f5.jpg', '', '', 1, 1522488771);
INSERT INTO `rk_picture` VALUES (1512, '/uploads/picture/20180331/7e990c23a5dea79c6b0a8e4e80cce56f.jpg', '/uploads/picture/20180331/7e990c23a5dea79c6b0a8e4e80cce56f.jpg', '', '', 1, 1522488779);
INSERT INTO `rk_picture` VALUES (1513, '/uploads/picture/20180331/14e52c606d5d700dfa6a622dac48c77f.jpg', '/uploads/picture/20180331/14e52c606d5d700dfa6a622dac48c77f.jpg', '', '', 1, 1522488924);
INSERT INTO `rk_picture` VALUES (1514, '/uploads/picture/20180331/2f8082ab86969c2728668755f0db2cd6.jpg', '/uploads/picture/20180331/2f8082ab86969c2728668755f0db2cd6.jpg', '', '', 1, 1522488952);
INSERT INTO `rk_picture` VALUES (1515, '/uploads/picture/20180331/a5cd186b785c3088e8d74c9f673aef8b.jpg', '/uploads/picture/20180331/a5cd186b785c3088e8d74c9f673aef8b.jpg', '', '', 1, 1522494945);
INSERT INTO `rk_picture` VALUES (1516, '/uploads/picture/20180331/bc0334e78a70ec3da26a0fd4b071d153.jpg', '/uploads/picture/20180331/bc0334e78a70ec3da26a0fd4b071d153.jpg', '', '', 1, 1522495003);
INSERT INTO `rk_picture` VALUES (1517, '/uploads/picture/20180331/ab18a30e570b27deca889b9f2495e759.jpg', '/uploads/picture/20180331/ab18a30e570b27deca889b9f2495e759.jpg', '', '', 1, 1522495443);
INSERT INTO `rk_picture` VALUES (1518, '/uploads/picture/20180331/ba6651a0b3d4c44c0b5f4a3713e6f172.jpg', '/uploads/picture/20180331/ba6651a0b3d4c44c0b5f4a3713e6f172.jpg', '', '', 1, 1522495455);
INSERT INTO `rk_picture` VALUES (1519, '/uploads/picture/20180331/e24057566b6156659e5442d70e5a9895.jpg', '/uploads/picture/20180331/e24057566b6156659e5442d70e5a9895.jpg', '', '', 1, 1522495582);
INSERT INTO `rk_picture` VALUES (1520, '/uploads/picture/20180331/842cfc954605744d9bda6fc18e5d22d1.jpg', '/uploads/picture/20180331/842cfc954605744d9bda6fc18e5d22d1.jpg', '', '', 1, 1522495626);
INSERT INTO `rk_picture` VALUES (1521, '/uploads/picture/20180401/d4259284917d0d89283375ff679e31fd.png', '/uploads/picture/20180401/d4259284917d0d89283375ff679e31fd.png', '', '', 1, 1522555364);
INSERT INTO `rk_picture` VALUES (1522, '/uploads/picture/20180401/f07a57f327a11d5994b056652dbc313e.png', '/uploads/picture/20180401/f07a57f327a11d5994b056652dbc313e.png', '', '', 1, 1522555430);
INSERT INTO `rk_picture` VALUES (1523, '/uploads/picture/20180401/ef7ea35f8bbb08859af8945a1330fa8d.png', '/uploads/picture/20180401/ef7ea35f8bbb08859af8945a1330fa8d.png', '', '', 1, 1522555527);
INSERT INTO `rk_picture` VALUES (1524, '/uploads/picture/20180401/89352fa8528e496b4058dcfd849d8aec.png', '/uploads/picture/20180401/89352fa8528e496b4058dcfd849d8aec.png', '', '', 1, 1522555598);
INSERT INTO `rk_picture` VALUES (1525, '/uploads/picture/20180401/b201275ed90d6045a78d445f164db73c.png', '/uploads/picture/20180401/b201275ed90d6045a78d445f164db73c.png', '', '', 1, 1522555682);
INSERT INTO `rk_picture` VALUES (1526, '/uploads/picture/20180401/c131c5fbc95efba496d5a19ade5d1ee4.jpg', '/uploads/picture/20180401/c131c5fbc95efba496d5a19ade5d1ee4.jpg', '', '', 1, 1522562392);
INSERT INTO `rk_picture` VALUES (1527, '/uploads/picture/20180401/f396c0f3599c9e936f6aaab18d27c998.jpg', '/uploads/picture/20180401/f396c0f3599c9e936f6aaab18d27c998.jpg', '', '', 1, 1522562412);
INSERT INTO `rk_picture` VALUES (1528, '/uploads/picture/20180401/9f1f5bfbc4ed130998185d5d8e29f304.jpg', '/uploads/picture/20180401/9f1f5bfbc4ed130998185d5d8e29f304.jpg', '', '', 1, 1522562474);
INSERT INTO `rk_picture` VALUES (1529, '/uploads/picture/20180401/d001273345010221d3d583c5e7721366.jpg', '/uploads/picture/20180401/d001273345010221d3d583c5e7721366.jpg', '', '', 1, 1522573385);
INSERT INTO `rk_picture` VALUES (1530, '/uploads/picture/20180402/4cf6a009cdb8fd5175c3676ee63aca48.jpg', '/uploads/picture/20180402/4cf6a009cdb8fd5175c3676ee63aca48.jpg', '', '', 1, 1522630794);
INSERT INTO `rk_picture` VALUES (1531, '/uploads/picture/20180402/f06fe9d79f28fe0a0a4301f72043be70.jpg', '/uploads/picture/20180402/f06fe9d79f28fe0a0a4301f72043be70.jpg', '', '', 1, 1522631106);
INSERT INTO `rk_picture` VALUES (1532, '/uploads/picture/20180402/4a2664e1038e726f5d35bccc2cc5b6ac.jpg', '/uploads/picture/20180402/4a2664e1038e726f5d35bccc2cc5b6ac.jpg', '', '', 1, 1522631165);
INSERT INTO `rk_picture` VALUES (1533, '/uploads/picture/20180402/53e427bed608fba875e8fdf8675e1eb8.jpg', '/uploads/picture/20180402/53e427bed608fba875e8fdf8675e1eb8.jpg', '', '', 1, 1522631278);
INSERT INTO `rk_picture` VALUES (1534, '/uploads/picture/20180402/2755bf4e42cd54c3f29e763f761e357e.jpg', '/uploads/picture/20180402/2755bf4e42cd54c3f29e763f761e357e.jpg', '', '', 1, 1522631462);
INSERT INTO `rk_picture` VALUES (1535, '/uploads/picture/20180402/cb62eaf75ef63e19ac959c18d03471f5.jpg', '/uploads/picture/20180402/cb62eaf75ef63e19ac959c18d03471f5.jpg', '', '', 1, 1522631516);
INSERT INTO `rk_picture` VALUES (1536, '/uploads/picture/20180402/d57ea1af17a9d5b3e988295105955dab.jpg', '/uploads/picture/20180402/d57ea1af17a9d5b3e988295105955dab.jpg', '', '', 1, 1522631596);
INSERT INTO `rk_picture` VALUES (1537, '/uploads/picture/20180402/d10b4efef68878a5d79ef15434cdb13e.jpg', '/uploads/picture/20180402/d10b4efef68878a5d79ef15434cdb13e.jpg', '', '', 1, 1522631620);
INSERT INTO `rk_picture` VALUES (1538, '/uploads/picture/20180402/77049b2322abaa09e04f39e6205a7229.jpg', '/uploads/picture/20180402/77049b2322abaa09e04f39e6205a7229.jpg', '', '', 1, 1522631630);
INSERT INTO `rk_picture` VALUES (1539, '/uploads/picture/20180402/601cc909ac0edadf82ee408baca9bfaf.jpg', '/uploads/picture/20180402/601cc909ac0edadf82ee408baca9bfaf.jpg', '', '', 1, 1522631716);
INSERT INTO `rk_picture` VALUES (1540, '/uploads/picture/20180402/662b814e37a35ea41f497271c0ef8d29.jpg', '/uploads/picture/20180402/662b814e37a35ea41f497271c0ef8d29.jpg', '', '', 1, 1522631740);
INSERT INTO `rk_picture` VALUES (1541, '/uploads/picture/20180402/3b21ac9fd571f1b0c7e2d63ad7bfae9d.jpg', '/uploads/picture/20180402/3b21ac9fd571f1b0c7e2d63ad7bfae9d.jpg', '', '', 1, 1522631748);
INSERT INTO `rk_picture` VALUES (1542, '/uploads/picture/20180402/aa3554b8981c59ba3c5c6d7210139862.jpg', '/uploads/picture/20180402/aa3554b8981c59ba3c5c6d7210139862.jpg', '', '', 1, 1522631787);
INSERT INTO `rk_picture` VALUES (1543, '/uploads/picture/20180402/c4f56715d2037d4ff2c9315632c34019.jpg', '/uploads/picture/20180402/c4f56715d2037d4ff2c9315632c34019.jpg', '', '', 1, 1522631824);
INSERT INTO `rk_picture` VALUES (1544, '/uploads/picture/20180402/2c0237c76c5d07d3937bcf6a3d19251a.jpg', '/uploads/picture/20180402/2c0237c76c5d07d3937bcf6a3d19251a.jpg', '', '', 1, 1522631834);
INSERT INTO `rk_picture` VALUES (1545, '/uploads/picture/20180402/7b96ab073d3b678522a53e9a31ffcb3c.jpg', '/uploads/picture/20180402/7b96ab073d3b678522a53e9a31ffcb3c.jpg', '', '', 1, 1522631843);
INSERT INTO `rk_picture` VALUES (1546, '/uploads/picture/20180402/4e63fa2928c0a3a494a0e34c41da4379.jpg', '/uploads/picture/20180402/4e63fa2928c0a3a494a0e34c41da4379.jpg', '', '', 1, 1522631852);
INSERT INTO `rk_picture` VALUES (1547, '/uploads/picture/20180402/5498d026a358bc2d03468962403dc450.jpg', '/uploads/picture/20180402/5498d026a358bc2d03468962403dc450.jpg', '', '', 1, 1522631868);
INSERT INTO `rk_picture` VALUES (1548, '/uploads/picture/20180402/377ce968b72d48800a6592d433060dce.jpg', '/uploads/picture/20180402/377ce968b72d48800a6592d433060dce.jpg', '', '', 1, 1522632440);
INSERT INTO `rk_picture` VALUES (1549, '/uploads/picture/20180402/ce1bc8eb2368c1c5cbba0e57aebd2351.jpg', '/uploads/picture/20180402/ce1bc8eb2368c1c5cbba0e57aebd2351.jpg', '', '', 1, 1522632472);
INSERT INTO `rk_picture` VALUES (1550, '/uploads/picture/20180402/b3788f30fdd7d2baf9c138d9fc6658df.jpg', '/uploads/picture/20180402/b3788f30fdd7d2baf9c138d9fc6658df.jpg', '', '', 1, 1522632484);
INSERT INTO `rk_picture` VALUES (1551, '/uploads/picture/20180402/f85b7447dfb6218fcce50cb98ac2f0da.jpg', '/uploads/picture/20180402/f85b7447dfb6218fcce50cb98ac2f0da.jpg', '', '', 1, 1522636799);
INSERT INTO `rk_picture` VALUES (1552, '/uploads/picture/20180402/77a54b71a8684e59f2d35509700d8674.jpg', '/uploads/picture/20180402/77a54b71a8684e59f2d35509700d8674.jpg', '', '', 1, 1522636944);
INSERT INTO `rk_picture` VALUES (1553, '/uploads/picture/20180402/56853fff6e840528dd99596a7ea173cf.jpg', '/uploads/picture/20180402/56853fff6e840528dd99596a7ea173cf.jpg', '', '', 1, 1522638416);
INSERT INTO `rk_picture` VALUES (1554, '/uploads/picture/20180402/213b564ad3a4b90a77cb437e33aa08a0.jpg', '/uploads/picture/20180402/213b564ad3a4b90a77cb437e33aa08a0.jpg', '', '', 1, 1522638450);
INSERT INTO `rk_picture` VALUES (1555, '/uploads/picture/20180402/881d0438c3f5a94fe21325f6ff43c3a1.jpg', '/uploads/picture/20180402/881d0438c3f5a94fe21325f6ff43c3a1.jpg', '', '', 1, 1522638682);
INSERT INTO `rk_picture` VALUES (1556, '/uploads/picture/20180402/9fc6d2c9436aa8e6b9a45b0f5bf54b83.jpg', '/uploads/picture/20180402/9fc6d2c9436aa8e6b9a45b0f5bf54b83.jpg', '', '', 1, 1522638838);
INSERT INTO `rk_picture` VALUES (1557, '/uploads/picture/20180402/c12723c86e1ce699b495c3933f2f008e.jpg', '/uploads/picture/20180402/c12723c86e1ce699b495c3933f2f008e.jpg', '', '', 1, 1522638873);
INSERT INTO `rk_picture` VALUES (1558, '/uploads/picture/20180402/8329cbe3e7a52d0ad4c325189aae3ce6.jpg', '/uploads/picture/20180402/8329cbe3e7a52d0ad4c325189aae3ce6.jpg', '', '', 1, 1522638892);
INSERT INTO `rk_picture` VALUES (1559, '/uploads/picture/20180402/becce95a34d29745da04209f978ca122.jpg', '/uploads/picture/20180402/becce95a34d29745da04209f978ca122.jpg', '', '', 1, 1522639265);
INSERT INTO `rk_picture` VALUES (1560, '/uploads/picture/20180402/2da6edb9d6e121dcb1be06fe8fb50492.jpg', '/uploads/picture/20180402/2da6edb9d6e121dcb1be06fe8fb50492.jpg', '', '', 1, 1522639309);
INSERT INTO `rk_picture` VALUES (1561, '/uploads/picture/20180402/5f158d399c9e6b77ab15133b3347f245.jpg', '/uploads/picture/20180402/5f158d399c9e6b77ab15133b3347f245.jpg', '', '', 1, 1522649553);
INSERT INTO `rk_picture` VALUES (1562, '/uploads/picture/20180402/29db43b8f964bb49dd412b2fdc988850.jpg', '/uploads/picture/20180402/29db43b8f964bb49dd412b2fdc988850.jpg', '', '', 1, 1522649613);
INSERT INTO `rk_picture` VALUES (1563, '/uploads/picture/20180402/42ff21ac60e0e28f11232e5b2d955643.jpg', '/uploads/picture/20180402/42ff21ac60e0e28f11232e5b2d955643.jpg', '', '', 1, 1522649621);
INSERT INTO `rk_picture` VALUES (1564, '/uploads/picture/20180402/d94b159e6f15c067dc65bc9851202e49.jpg', '/uploads/picture/20180402/d94b159e6f15c067dc65bc9851202e49.jpg', '', '', 1, 1522649681);
INSERT INTO `rk_picture` VALUES (1565, '/uploads/picture/20180402/b8ed52f5eaac51e1d16ea161477b328b.jpg', '/uploads/picture/20180402/b8ed52f5eaac51e1d16ea161477b328b.jpg', '', '', 1, 1522649737);
INSERT INTO `rk_picture` VALUES (1566, '/uploads/picture/20180402/4eedf5424c3aca1b96b5e164b841a392.jpg', '/uploads/picture/20180402/4eedf5424c3aca1b96b5e164b841a392.jpg', '', '', 1, 1522649876);
INSERT INTO `rk_picture` VALUES (1567, '/uploads/picture/20180402/cc1f1f697e29001ab152ae4b4e3f33f2.jpg', '/uploads/picture/20180402/cc1f1f697e29001ab152ae4b4e3f33f2.jpg', '', '', 1, 1522650121);
INSERT INTO `rk_picture` VALUES (1568, '/uploads/picture/20180402/c3c1d777c27328843b51d97b5eba0d7c.jpg', '/uploads/picture/20180402/c3c1d777c27328843b51d97b5eba0d7c.jpg', '', '', 1, 1522650149);
INSERT INTO `rk_picture` VALUES (1569, '/uploads/picture/20180402/73e499320b9ec5213adbfd677b9b9522.jpg', '/uploads/picture/20180402/73e499320b9ec5213adbfd677b9b9522.jpg', '', '', 1, 1522650255);
INSERT INTO `rk_picture` VALUES (1570, '/uploads/picture/20180402/d0a36e747a10c2934e603599c05487c3.jpg', '/uploads/picture/20180402/d0a36e747a10c2934e603599c05487c3.jpg', '', '', 1, 1522650954);
INSERT INTO `rk_picture` VALUES (1571, '/uploads/picture/20180402/7b13e0b32c44213672ce5fa8255cac47.jpg', '/uploads/picture/20180402/7b13e0b32c44213672ce5fa8255cac47.jpg', '', '', 1, 1522650971);
INSERT INTO `rk_picture` VALUES (1572, '/uploads/picture/20180402/db186079596b834b2a583deb823a143e.jpg', '/uploads/picture/20180402/db186079596b834b2a583deb823a143e.jpg', '', '', 1, 1522651275);
INSERT INTO `rk_picture` VALUES (1573, '/uploads/picture/20180402/b72afc3f293ddc5e750183a67791c14d.jpg', '/uploads/picture/20180402/b72afc3f293ddc5e750183a67791c14d.jpg', '', '', 1, 1522651308);
INSERT INTO `rk_picture` VALUES (1574, '/uploads/picture/20180402/b9270f9c11362de56971378fff22ae58.jpg', '/uploads/picture/20180402/b9270f9c11362de56971378fff22ae58.jpg', '', '', 1, 1522653450);
INSERT INTO `rk_picture` VALUES (1575, '/uploads/picture/20180402/04014d42163c03951aa8db576dd8cf5a.jpg', '/uploads/picture/20180402/04014d42163c03951aa8db576dd8cf5a.jpg', '', '', 1, 1522653460);
INSERT INTO `rk_picture` VALUES (1576, '/uploads/picture/20180402/3f1b1c1b6ea2ba3cb887998f7e29d65e.jpg', '/uploads/picture/20180402/3f1b1c1b6ea2ba3cb887998f7e29d65e.jpg', '', '', 1, 1522653506);
INSERT INTO `rk_picture` VALUES (1577, '/uploads/picture/20180402/411bacaafc2cb83e56b9c1d1949aed72.jpg', '/uploads/picture/20180402/411bacaafc2cb83e56b9c1d1949aed72.jpg', '', '', 1, 1522653600);
INSERT INTO `rk_picture` VALUES (1578, '/uploads/picture/20180402/5f645db88f0cc749143b040ddf7d7788.jpg', '/uploads/picture/20180402/5f645db88f0cc749143b040ddf7d7788.jpg', '', '', 1, 1522653625);
INSERT INTO `rk_picture` VALUES (1579, '/uploads/picture/20180402/bfce8434eed239b1927de7d3f788a175.jpg', '/uploads/picture/20180402/bfce8434eed239b1927de7d3f788a175.jpg', '', '', 1, 1522653633);
INSERT INTO `rk_picture` VALUES (1580, '/uploads/picture/20180402/3187c9d5b4f3c83268876571389eecbe.jpg', '/uploads/picture/20180402/3187c9d5b4f3c83268876571389eecbe.jpg', '', '', 1, 1522656043);
INSERT INTO `rk_picture` VALUES (1581, '/uploads/picture/20180402/473178882a6162f94102dad7dcb225c4.jpg', '/uploads/picture/20180402/473178882a6162f94102dad7dcb225c4.jpg', '', '', 1, 1522667870);
INSERT INTO `rk_picture` VALUES (1582, '/uploads/picture/20180402/95cfa883a9e168f36af8acc8667e9962.jpg', '/uploads/picture/20180402/95cfa883a9e168f36af8acc8667e9962.jpg', '', '', 1, 1522667926);
INSERT INTO `rk_picture` VALUES (1583, '/uploads/picture/20180402/ad4467a7bea593e133a42d5c567663f0.jpg', '/uploads/picture/20180402/ad4467a7bea593e133a42d5c567663f0.jpg', '', '', 1, 1522667934);
INSERT INTO `rk_picture` VALUES (1584, '/uploads/picture/20180402/939c997c1365db2a790b7519e168ffd6.jpg', '/uploads/picture/20180402/939c997c1365db2a790b7519e168ffd6.jpg', '', '', 1, 1522668032);
INSERT INTO `rk_picture` VALUES (1585, '/uploads/picture/20180402/37032cf4a267d98122a96ad5c851c11d.jpg', '/uploads/picture/20180402/37032cf4a267d98122a96ad5c851c11d.jpg', '', '', 1, 1522668037);
INSERT INTO `rk_picture` VALUES (1586, '/uploads/picture/20180402/77f57a147b86494b30eb226622fe31ad.jpg', '/uploads/picture/20180402/77f57a147b86494b30eb226622fe31ad.jpg', '', '', 1, 1522668269);
INSERT INTO `rk_picture` VALUES (1587, '/uploads/picture/20180402/a245e7757adce3eab2b3242db687a5ad.jpg', '/uploads/picture/20180402/a245e7757adce3eab2b3242db687a5ad.jpg', '', '', 1, 1522668367);
INSERT INTO `rk_picture` VALUES (1588, '/uploads/picture/20180402/487454b313abe1ffd759da92ce67d985.jpg', '/uploads/picture/20180402/487454b313abe1ffd759da92ce67d985.jpg', '', '', 1, 1522668374);
INSERT INTO `rk_picture` VALUES (1589, '/uploads/picture/20180402/9bbd9391dcd1dd9d82ef1d9470bcc925.jpg', '/uploads/picture/20180402/9bbd9391dcd1dd9d82ef1d9470bcc925.jpg', '', '', 1, 1522668992);
INSERT INTO `rk_picture` VALUES (1590, '/uploads/picture/20180402/18957b7c875506a74bac422250b4a070.jpg', '/uploads/picture/20180402/18957b7c875506a74bac422250b4a070.jpg', '', '', 1, 1522669065);
INSERT INTO `rk_picture` VALUES (1591, '/uploads/picture/20180402/1fb11cd505690302c4395c726f7c9342.jpg', '/uploads/picture/20180402/1fb11cd505690302c4395c726f7c9342.jpg', '', '', 1, 1522669208);
INSERT INTO `rk_picture` VALUES (1592, '/uploads/picture/20180402/e757e6e2c4c6bd757911189b82fa0a1d.jpg', '/uploads/picture/20180402/e757e6e2c4c6bd757911189b82fa0a1d.jpg', '', '', 1, 1522669234);
INSERT INTO `rk_picture` VALUES (1593, '/uploads/picture/20180402/872a775bc0ff5fc97f33176d2191ffef.jpg', '/uploads/picture/20180402/872a775bc0ff5fc97f33176d2191ffef.jpg', '', '', 1, 1522669541);
INSERT INTO `rk_picture` VALUES (1594, '/uploads/picture/20180402/e49fcdb8524376040668ea7374939d74.jpg', '/uploads/picture/20180402/e49fcdb8524376040668ea7374939d74.jpg', '', '', 1, 1522669568);
INSERT INTO `rk_picture` VALUES (1595, '/uploads/picture/20180403/99589f7ae1715c87a85c74c8df79b3c0.jpg', '/uploads/picture/20180403/99589f7ae1715c87a85c74c8df79b3c0.jpg', '', '', 1, 1522705335);
INSERT INTO `rk_picture` VALUES (1596, '/uploads/picture/20180403/026f0e38a6fac7f57e84dc190b151e29.jpg', '/uploads/picture/20180403/026f0e38a6fac7f57e84dc190b151e29.jpg', '', '', 1, 1522705415);
INSERT INTO `rk_picture` VALUES (1597, '/uploads/picture/20180403/fe1190fa8a9010378f3149aaea9177d2.jpg', '/uploads/picture/20180403/fe1190fa8a9010378f3149aaea9177d2.jpg', '', '', 1, 1522706351);
INSERT INTO `rk_picture` VALUES (1598, '/uploads/picture/20180403/82c21a68ffc448f21e633eba1d07bc55.jpg', '/uploads/picture/20180403/82c21a68ffc448f21e633eba1d07bc55.jpg', '', '', 1, 1522706385);
INSERT INTO `rk_picture` VALUES (1599, '/uploads/picture/20180403/b3cd129bda87b19fc6a121c0f978d392.jpg', '/uploads/picture/20180403/b3cd129bda87b19fc6a121c0f978d392.jpg', '', '', 1, 1522706637);
INSERT INTO `rk_picture` VALUES (1600, '/uploads/picture/20180403/0c1ba35c283b6d3b1a45975a651a4c3a.jpg', '/uploads/picture/20180403/0c1ba35c283b6d3b1a45975a651a4c3a.jpg', '', '', 1, 1522706661);
INSERT INTO `rk_picture` VALUES (1601, '/uploads/picture/20180403/6b4bad8b0b3163f183467e54d87ac45b.jpg', '/uploads/picture/20180403/6b4bad8b0b3163f183467e54d87ac45b.jpg', '', '', 1, 1522707048);
INSERT INTO `rk_picture` VALUES (1602, '/uploads/picture/20180403/0a4eebcb043a387dc233f0ffa3b5c9d7.jpg', '/uploads/picture/20180403/0a4eebcb043a387dc233f0ffa3b5c9d7.jpg', '', '', 1, 1522707083);
INSERT INTO `rk_picture` VALUES (1603, '/uploads/picture/20180403/d9ce40bc130e77dbc2ea0f7ae606c03a.jpg', '/uploads/picture/20180403/d9ce40bc130e77dbc2ea0f7ae606c03a.jpg', '', '', 1, 1522707502);
INSERT INTO `rk_picture` VALUES (1604, '/uploads/picture/20180403/1ca3092dd08fd85222cb0b02c4c8e163.jpg', '/uploads/picture/20180403/1ca3092dd08fd85222cb0b02c4c8e163.jpg', '', '', 1, 1522707531);
INSERT INTO `rk_picture` VALUES (1605, '/uploads/picture/20180403/0dcd3534de90ee902173b0d045d06fe4.jpg', '/uploads/picture/20180403/0dcd3534de90ee902173b0d045d06fe4.jpg', '', '', 1, 1522707554);
INSERT INTO `rk_picture` VALUES (1606, '/uploads/picture/20180403/0262c59b5253283bf77ad2e9c0cc43ab.jpg', '/uploads/picture/20180403/0262c59b5253283bf77ad2e9c0cc43ab.jpg', '', '', 1, 1522707587);
INSERT INTO `rk_picture` VALUES (1607, '/uploads/picture/20180403/4fc49dda8f05c20ca91876e3de35b6aa.jpg', '/uploads/picture/20180403/4fc49dda8f05c20ca91876e3de35b6aa.jpg', '', '', 1, 1522718890);
INSERT INTO `rk_picture` VALUES (1608, '/uploads/picture/20180403/bb54d3e604ccd688f8c68398ea2393bb.jpg', '/uploads/picture/20180403/bb54d3e604ccd688f8c68398ea2393bb.jpg', '', '', 1, 1522719527);
INSERT INTO `rk_picture` VALUES (1609, '/uploads/picture/20180403/20deb93aa7ccce36c2b199735a950386.jpg', '/uploads/picture/20180403/20deb93aa7ccce36c2b199735a950386.jpg', '', '', 1, 1522719534);
INSERT INTO `rk_picture` VALUES (1610, '/uploads/picture/20180403/559df01752c2b1457dc2f3d9e8474356.jpg', '/uploads/picture/20180403/559df01752c2b1457dc2f3d9e8474356.jpg', '', '', 1, 1522719569);
INSERT INTO `rk_picture` VALUES (1611, '/uploads/picture/20180403/c95f310c7ef8637a5c00c6a13a266f8b.jpg', '/uploads/picture/20180403/c95f310c7ef8637a5c00c6a13a266f8b.jpg', '', '', 1, 1522719676);
INSERT INTO `rk_picture` VALUES (1612, '/uploads/picture/20180403/00c213920edaa390da0d6fad3ec2892b.jpg', '/uploads/picture/20180403/00c213920edaa390da0d6fad3ec2892b.jpg', '', '', 1, 1522719787);
INSERT INTO `rk_picture` VALUES (1613, '/uploads/picture/20180403/30941328150a989000a57ea98c3f0911.jpg', '/uploads/picture/20180403/30941328150a989000a57ea98c3f0911.jpg', '', '', 1, 1522720595);
INSERT INTO `rk_picture` VALUES (1614, '/uploads/picture/20180403/08ca936f5842f48e13c2773bb87558e6.jpg', '/uploads/picture/20180403/08ca936f5842f48e13c2773bb87558e6.jpg', '', '', 1, 1522721554);
INSERT INTO `rk_picture` VALUES (1615, '/uploads/picture/20180403/4fe385a5cb306b89afce3cbf29177f1c.jpg', '/uploads/picture/20180403/4fe385a5cb306b89afce3cbf29177f1c.jpg', '', '', 1, 1522721744);
INSERT INTO `rk_picture` VALUES (1616, '/uploads/picture/20180403/dd01a76392b1c7cebfeaec8890d6e1d6.jpg', '/uploads/picture/20180403/dd01a76392b1c7cebfeaec8890d6e1d6.jpg', '', '', 1, 1522721962);
INSERT INTO `rk_picture` VALUES (1617, '/uploads/picture/20180403/388fd23b649affd6fd3c85d1207f5a10.jpg', '/uploads/picture/20180403/388fd23b649affd6fd3c85d1207f5a10.jpg', '', '', 1, 1522722001);
INSERT INTO `rk_picture` VALUES (1618, '/uploads/picture/20180403/faea59670e7a8446eb2e6e7bb5b973ff.jpg', '/uploads/picture/20180403/faea59670e7a8446eb2e6e7bb5b973ff.jpg', '', '', 1, 1522724861);
INSERT INTO `rk_picture` VALUES (1619, '/uploads/picture/20180403/5ce3efb6a20ba75023c86a8310999b45.jpg', '/uploads/picture/20180403/5ce3efb6a20ba75023c86a8310999b45.jpg', '', '', 1, 1522724996);
INSERT INTO `rk_picture` VALUES (1620, '/uploads/picture/20180403/ed46b41c6b1fdaa1ff3f12d0ae11f4d4.jpg', '/uploads/picture/20180403/ed46b41c6b1fdaa1ff3f12d0ae11f4d4.jpg', '', '', 1, 1522725009);
INSERT INTO `rk_picture` VALUES (1621, '/uploads/picture/20180403/8afcd0597974adfebc612745bf456ca2.jpg', '/uploads/picture/20180403/8afcd0597974adfebc612745bf456ca2.jpg', '', '', 1, 1522725920);
INSERT INTO `rk_picture` VALUES (1622, '/uploads/picture/20180403/8716ddeaf04af9f80d9cd3eba2718be3.jpg', '/uploads/picture/20180403/8716ddeaf04af9f80d9cd3eba2718be3.jpg', '', '', 1, 1522725952);
INSERT INTO `rk_picture` VALUES (1623, '/uploads/picture/20180403/6ebcbeea19fd2c050f2172ed95c40d91.jpg', '/uploads/picture/20180403/6ebcbeea19fd2c050f2172ed95c40d91.jpg', '', '', 1, 1522725963);
INSERT INTO `rk_picture` VALUES (1624, '/uploads/picture/20180403/6feb431a8dced5d1e3dae59fc6a321f0.jpg', '/uploads/picture/20180403/6feb431a8dced5d1e3dae59fc6a321f0.jpg', '', '', 1, 1522726132);
INSERT INTO `rk_picture` VALUES (1625, '/uploads/picture/20180403/677e3f372d4ca2bb5b029d5486998892.jpg', '/uploads/picture/20180403/677e3f372d4ca2bb5b029d5486998892.jpg', '', '', 1, 1522726172);
INSERT INTO `rk_picture` VALUES (1626, '/uploads/picture/20180403/e1cbaeb126a54a2d17cc7d9549b566b9.jpg', '/uploads/picture/20180403/e1cbaeb126a54a2d17cc7d9549b566b9.jpg', '', '', 1, 1522726211);
INSERT INTO `rk_picture` VALUES (1627, '/uploads/picture/20180403/916002c3878a8acb0b4b5cf30ad6dcc0.jpg', '/uploads/picture/20180403/916002c3878a8acb0b4b5cf30ad6dcc0.jpg', '', '', 1, 1522726648);
INSERT INTO `rk_picture` VALUES (1628, '/uploads/picture/20180403/96ff4f5ec04b45e3d43c170fc4a16ef0.jpg', '/uploads/picture/20180403/96ff4f5ec04b45e3d43c170fc4a16ef0.jpg', '', '', 1, 1522727241);
INSERT INTO `rk_picture` VALUES (1629, '/uploads/picture/20180403/5e3f76e0023986b9ae60aec4eb7e2057.jpg', '/uploads/picture/20180403/5e3f76e0023986b9ae60aec4eb7e2057.jpg', '', '', 1, 1522727790);
INSERT INTO `rk_picture` VALUES (1630, '/uploads/picture/20180403/7a3ee49c3e9896c505b3beec4828d0e7.jpg', '/uploads/picture/20180403/7a3ee49c3e9896c505b3beec4828d0e7.jpg', '', '', 1, 1522727831);
INSERT INTO `rk_picture` VALUES (1631, '/uploads/picture/20180403/6feb93af111d4e477a59f655b23b907b.jpg', '/uploads/picture/20180403/6feb93af111d4e477a59f655b23b907b.jpg', '', '', 1, 1522731418);
INSERT INTO `rk_picture` VALUES (1632, '/uploads/picture/20180403/7415a175e28e0a03d831504ce329646b.jpg', '/uploads/picture/20180403/7415a175e28e0a03d831504ce329646b.jpg', '', '', 1, 1522731459);
INSERT INTO `rk_picture` VALUES (1633, '/uploads/picture/20180403/f093ed8d423eba58f6b2d61789179eda.jpg', '/uploads/picture/20180403/f093ed8d423eba58f6b2d61789179eda.jpg', '', '', 1, 1522731576);
INSERT INTO `rk_picture` VALUES (1634, '/uploads/picture/20180403/4d4b1a7202e4d225977f7e21681fa225.jpg', '/uploads/picture/20180403/4d4b1a7202e4d225977f7e21681fa225.jpg', '', '', 1, 1522731639);
INSERT INTO `rk_picture` VALUES (1635, '/uploads/picture/20180403/1ff964c3a3c1341de74d705a09ac9599.jpg', '/uploads/picture/20180403/1ff964c3a3c1341de74d705a09ac9599.jpg', '', '', 1, 1522731654);
INSERT INTO `rk_picture` VALUES (1636, '/uploads/picture/20180403/48e22b4db3b2a7d0a6fae3858c427f03.jpg', '/uploads/picture/20180403/48e22b4db3b2a7d0a6fae3858c427f03.jpg', '', '', 1, 1522732642);
INSERT INTO `rk_picture` VALUES (1637, '/uploads/picture/20180403/811f76db60cf0d72c53b9919a0a15540.jpg', '/uploads/picture/20180403/811f76db60cf0d72c53b9919a0a15540.jpg', '', '', 1, 1522732684);
INSERT INTO `rk_picture` VALUES (1638, '/uploads/picture/20180403/946c85da936199722efdc19ad742f1bb.jpg', '/uploads/picture/20180403/946c85da936199722efdc19ad742f1bb.jpg', '', '', 1, 1522736638);
INSERT INTO `rk_picture` VALUES (1639, '/uploads/picture/20180403/bdb299373ac735d0342025983c5c7877.jpg', '/uploads/picture/20180403/bdb299373ac735d0342025983c5c7877.jpg', '', '', 1, 1522736675);
INSERT INTO `rk_picture` VALUES (1640, '/uploads/picture/20180403/23e7aed636823780c6e7d71b5a7daafa.jpg', '/uploads/picture/20180403/23e7aed636823780c6e7d71b5a7daafa.jpg', '', '', 1, 1522736699);
INSERT INTO `rk_picture` VALUES (1641, '/uploads/picture/20180403/a72ac908be908df2051e3725804ad029.jpg', '/uploads/picture/20180403/a72ac908be908df2051e3725804ad029.jpg', '', '', 1, 1522737126);
INSERT INTO `rk_picture` VALUES (1642, '/uploads/picture/20180403/9e91c3460459290b347a0975b4465485.jpg', '/uploads/picture/20180403/9e91c3460459290b347a0975b4465485.jpg', '', '', 1, 1522737135);
INSERT INTO `rk_picture` VALUES (1643, '/uploads/picture/20180403/19e2c3efc1201e34edbd035971af7947.jpg', '/uploads/picture/20180403/19e2c3efc1201e34edbd035971af7947.jpg', '', '', 1, 1522737521);
INSERT INTO `rk_picture` VALUES (1644, '/uploads/picture/20180403/564f8d23921716cd289b50de89677e0c.jpg', '/uploads/picture/20180403/564f8d23921716cd289b50de89677e0c.jpg', '', '', 1, 1522738594);
INSERT INTO `rk_picture` VALUES (1645, '/uploads/picture/20180403/b4ab4e2b18c6a2029e6feddd36875716.jpg', '/uploads/picture/20180403/b4ab4e2b18c6a2029e6feddd36875716.jpg', '', '', 1, 1522741228);
INSERT INTO `rk_picture` VALUES (1646, '/uploads/picture/20180403/e041af363b1e7679dc254d45e2f88887.jpg', '/uploads/picture/20180403/e041af363b1e7679dc254d45e2f88887.jpg', '', '', 1, 1522741449);
INSERT INTO `rk_picture` VALUES (1647, '/uploads/picture/20180403/02ca4fda67fbfb7588148b16eefc0458.jpg', '/uploads/picture/20180403/02ca4fda67fbfb7588148b16eefc0458.jpg', '', '', 1, 1522741726);
INSERT INTO `rk_picture` VALUES (1648, '/uploads/picture/20180403/cc277aa04a056240dc36f27a729c6808.jpg', '/uploads/picture/20180403/cc277aa04a056240dc36f27a729c6808.jpg', '', '', 1, 1522742406);
INSERT INTO `rk_picture` VALUES (1649, '/uploads/picture/20180403/d2f15b9b8355d1f596eb35ff684fa2e1.jpg', '/uploads/picture/20180403/d2f15b9b8355d1f596eb35ff684fa2e1.jpg', '', '', 1, 1522744341);
INSERT INTO `rk_picture` VALUES (1650, '/uploads/picture/20180403/0924129df44fd975e64b910ecb66fa4a.jpg', '/uploads/picture/20180403/0924129df44fd975e64b910ecb66fa4a.jpg', '', '', 1, 1522744734);
INSERT INTO `rk_picture` VALUES (1651, '/uploads/picture/20180403/d24b9f336334c59edf4ca2ebb064c7d9.jpg', '/uploads/picture/20180403/d24b9f336334c59edf4ca2ebb064c7d9.jpg', '', '', 1, 1522745419);
INSERT INTO `rk_picture` VALUES (1652, '/uploads/picture/20180403/d58190e20552b4467f44875c57365f7b.jpg', '/uploads/picture/20180403/d58190e20552b4467f44875c57365f7b.jpg', '', '', 1, 1522745972);
INSERT INTO `rk_picture` VALUES (1653, '/uploads/picture/20180403/a41166a6c95326e042d054ae5e837d23.jpg', '/uploads/picture/20180403/a41166a6c95326e042d054ae5e837d23.jpg', '', '', 1, 1522746350);
INSERT INTO `rk_picture` VALUES (1654, '/uploads/picture/20180403/454107672e9acaa62a3a6ba5d2ff9b19.jpg', '/uploads/picture/20180403/454107672e9acaa62a3a6ba5d2ff9b19.jpg', '', '', 1, 1522746451);
INSERT INTO `rk_picture` VALUES (1655, '/uploads/picture/20180403/5cf0b9d86d36bd3465e63e796da75ed9.jpg', '/uploads/picture/20180403/5cf0b9d86d36bd3465e63e796da75ed9.jpg', '', '', 1, 1522747061);
INSERT INTO `rk_picture` VALUES (1656, '/uploads/picture/20180403/dab7b6231a758c1155bebc8981fe4a84.jpg', '/uploads/picture/20180403/dab7b6231a758c1155bebc8981fe4a84.jpg', '', '', 1, 1522747279);
INSERT INTO `rk_picture` VALUES (1657, '/uploads/picture/20180403/782b95f5bf7664e1bd12ec655b78867e.jpg', '/uploads/picture/20180403/782b95f5bf7664e1bd12ec655b78867e.jpg', '', '', 1, 1522747287);
INSERT INTO `rk_picture` VALUES (1658, '/uploads/picture/20180403/fd8b3309b3808781c6db527ae9ecbfcc.jpg', '/uploads/picture/20180403/fd8b3309b3808781c6db527ae9ecbfcc.jpg', '', '', 1, 1522747295);
INSERT INTO `rk_picture` VALUES (1659, '/uploads/picture/20180403/425350859b88b13cb0f2f81d164830f5.jpg', '/uploads/picture/20180403/425350859b88b13cb0f2f81d164830f5.jpg', '', '', 1, 1522747302);
INSERT INTO `rk_picture` VALUES (1660, '/uploads/picture/20180403/631518b67a02dd61c35e730a3a1d5cde.jpg', '/uploads/picture/20180403/631518b67a02dd61c35e730a3a1d5cde.jpg', '', '', 1, 1522750251);
INSERT INTO `rk_picture` VALUES (1661, '/uploads/picture/20180403/c760471e88327080012e2c4fbebc40a0.jpg', '/uploads/picture/20180403/c760471e88327080012e2c4fbebc40a0.jpg', '', '', 1, 1522750392);
INSERT INTO `rk_picture` VALUES (1662, '/uploads/picture/20180403/b54e8a8a16b435bd422e9eb1c618d6a7.jpg', '/uploads/picture/20180403/b54e8a8a16b435bd422e9eb1c618d6a7.jpg', '', '', 1, 1522750420);
INSERT INTO `rk_picture` VALUES (1663, '/uploads/picture/20180403/398d5f263c7f76e3f410bbb835727a24.jpg', '/uploads/picture/20180403/398d5f263c7f76e3f410bbb835727a24.jpg', '', '', 1, 1522750434);
INSERT INTO `rk_picture` VALUES (1664, '/uploads/picture/20180403/e80c8a63682e434841ead3b51bda6f3c.jpg', '/uploads/picture/20180403/e80c8a63682e434841ead3b51bda6f3c.jpg', '', '', 1, 1522751089);
INSERT INTO `rk_picture` VALUES (1665, '/uploads/picture/20180403/0027f822f8c1bfce039e59b09794d1ca.jpg', '/uploads/picture/20180403/0027f822f8c1bfce039e59b09794d1ca.jpg', '', '', 1, 1522751114);
INSERT INTO `rk_picture` VALUES (1666, '/uploads/picture/20180403/f887183ee76acf53e442e9efa12b484a.jpg', '/uploads/picture/20180403/f887183ee76acf53e442e9efa12b484a.jpg', '', '', 1, 1522751122);
INSERT INTO `rk_picture` VALUES (1667, '/uploads/picture/20180403/686347f961ea2d484bffa70554e5d0be.jpg', '/uploads/picture/20180403/686347f961ea2d484bffa70554e5d0be.jpg', '', '', 1, 1522753587);
INSERT INTO `rk_picture` VALUES (1668, '/uploads/picture/20180403/58e680df01ec2c1b92a71c72ded6c324.jpg', '/uploads/picture/20180403/58e680df01ec2c1b92a71c72ded6c324.jpg', '', '', 1, 1522753671);
INSERT INTO `rk_picture` VALUES (1669, '/uploads/picture/20180403/9ad6777fbfc89e90bfc39c1c94627ec0.jpg', '/uploads/picture/20180403/9ad6777fbfc89e90bfc39c1c94627ec0.jpg', '', '', 1, 1522754921);
INSERT INTO `rk_picture` VALUES (1670, '/uploads/picture/20180403/9ec4cb34cab1232668c70bcd6b90a8a2.jpg', '/uploads/picture/20180403/9ec4cb34cab1232668c70bcd6b90a8a2.jpg', '', '', 1, 1522754980);
INSERT INTO `rk_picture` VALUES (1671, '/uploads/picture/20180403/39a543f834e0cec58cbc4e266865e7bb.jpg', '/uploads/picture/20180403/39a543f834e0cec58cbc4e266865e7bb.jpg', '', '', 1, 1522755010);
INSERT INTO `rk_picture` VALUES (1672, '/uploads/picture/20180403/7320dd79038fa9b93086dd29d9090a9f.jpg', '/uploads/picture/20180403/7320dd79038fa9b93086dd29d9090a9f.jpg', '', '', 1, 1522755063);
INSERT INTO `rk_picture` VALUES (1673, '/uploads/picture/20180403/9054f547d3d70af1d377f6f82450bb44.jpg', '/uploads/picture/20180403/9054f547d3d70af1d377f6f82450bb44.jpg', '', '', 1, 1522755936);
INSERT INTO `rk_picture` VALUES (1674, '/uploads/picture/20180403/ab732cc38f47159082bd4592be40f36b.jpg', '/uploads/picture/20180403/ab732cc38f47159082bd4592be40f36b.jpg', '', '', 1, 1522755959);
INSERT INTO `rk_picture` VALUES (1675, '/uploads/picture/20180403/f8c8dc4f4cc5ea9be07c27974d19574a.jpg', '/uploads/picture/20180403/f8c8dc4f4cc5ea9be07c27974d19574a.jpg', '', '', 1, 1522755989);
INSERT INTO `rk_picture` VALUES (1676, '/uploads/picture/20180403/08b196a94e3a1c089d2735fba792e512.jpg', '/uploads/picture/20180403/08b196a94e3a1c089d2735fba792e512.jpg', '', '', 1, 1522756012);
INSERT INTO `rk_picture` VALUES (1677, '/uploads/picture/20180403/88528ccb874b7546000318b0b6897ef1.jpg', '/uploads/picture/20180403/88528ccb874b7546000318b0b6897ef1.jpg', '', '', 1, 1522756215);
INSERT INTO `rk_picture` VALUES (1678, '/uploads/picture/20180403/9ce2b2f8340f65b6e86f01899ccbd7cb.jpg', '/uploads/picture/20180403/9ce2b2f8340f65b6e86f01899ccbd7cb.jpg', '', '', 1, 1522756245);
INSERT INTO `rk_picture` VALUES (1679, '/uploads/picture/20180403/10cd4688842edb827b2eb908d8e7c5cb.jpg', '/uploads/picture/20180403/10cd4688842edb827b2eb908d8e7c5cb.jpg', '', '', 1, 1522756259);
INSERT INTO `rk_picture` VALUES (1680, '/uploads/picture/20180403/626a64e303cf2dcf54b82854b7af6d4a.jpg', '/uploads/picture/20180403/626a64e303cf2dcf54b82854b7af6d4a.jpg', '', '', 1, 1522756298);
INSERT INTO `rk_picture` VALUES (1681, '/uploads/picture/20180403/2591a06baa2acc4ff2362df82c081e29.jpg', '/uploads/picture/20180403/2591a06baa2acc4ff2362df82c081e29.jpg', '', '', 1, 1522756312);
INSERT INTO `rk_picture` VALUES (1682, '/uploads/picture/20180403/61fd5e315523e73ab5c314b9e4ca0860.jpg', '/uploads/picture/20180403/61fd5e315523e73ab5c314b9e4ca0860.jpg', '', '', 1, 1522756341);
INSERT INTO `rk_picture` VALUES (1683, '/uploads/picture/20180403/03041664244b9971467ea56406b37568.jpg', '/uploads/picture/20180403/03041664244b9971467ea56406b37568.jpg', '', '', 1, 1522756389);
INSERT INTO `rk_picture` VALUES (1684, '/uploads/picture/20180403/51d884f9ec437c4a3f7cbf7e63173369.jpg', '/uploads/picture/20180403/51d884f9ec437c4a3f7cbf7e63173369.jpg', '', '', 1, 1522756413);
INSERT INTO `rk_picture` VALUES (1685, '/uploads/picture/20180403/08cc0952b63f6a61bfb15e4a24592471.jpg', '/uploads/picture/20180403/08cc0952b63f6a61bfb15e4a24592471.jpg', '', '', 1, 1522756439);
INSERT INTO `rk_picture` VALUES (1686, '/uploads/picture/20180403/2a192f017f9b909332585eab71dd8db8.jpg', '/uploads/picture/20180403/2a192f017f9b909332585eab71dd8db8.jpg', '', '', 1, 1522756459);
INSERT INTO `rk_picture` VALUES (1687, '/uploads/picture/20180403/5cf600095c0fc1ddd2203a7004ab7309.jpg', '/uploads/picture/20180403/5cf600095c0fc1ddd2203a7004ab7309.jpg', '', '', 1, 1522756473);
INSERT INTO `rk_picture` VALUES (1688, '/uploads/picture/20180403/1bbe17a8e16c6edf8001cc1fba5cd849.jpg', '/uploads/picture/20180403/1bbe17a8e16c6edf8001cc1fba5cd849.jpg', '', '', 1, 1522756504);
INSERT INTO `rk_picture` VALUES (1689, '/uploads/picture/20180403/b3629cd11173ba1e0eba23fd874c9605.jpg', '/uploads/picture/20180403/b3629cd11173ba1e0eba23fd874c9605.jpg', '', '', 1, 1522758295);
INSERT INTO `rk_picture` VALUES (1690, '/uploads/picture/20180403/cc199f1a165c5d1fad0ef3f67585b2bd.jpg', '/uploads/picture/20180403/cc199f1a165c5d1fad0ef3f67585b2bd.jpg', '', '', 1, 1522758312);
INSERT INTO `rk_picture` VALUES (1691, '/uploads/picture/20180404/5e19c9c0dce1305c0c9ea658767cb2ff.jpg', '/uploads/picture/20180404/5e19c9c0dce1305c0c9ea658767cb2ff.jpg', '', '', 1, 1522812464);
INSERT INTO `rk_picture` VALUES (1692, '/uploads/picture/20180404/025b95fc92b21c7902c5da0c362dce17.jpg', '/uploads/picture/20180404/025b95fc92b21c7902c5da0c362dce17.jpg', '', '', 1, 1522812493);
INSERT INTO `rk_picture` VALUES (1693, '/uploads/picture/20180404/cb63b74c009493632e84123f559d6e54.jpg', '/uploads/picture/20180404/cb63b74c009493632e84123f559d6e54.jpg', '', '', 1, 1522812532);
INSERT INTO `rk_picture` VALUES (1694, '/uploads/picture/20180404/f556e876a5b1a389e3d1bc845b1a218d.jpg', '/uploads/picture/20180404/f556e876a5b1a389e3d1bc845b1a218d.jpg', '', '', 1, 1522812617);
INSERT INTO `rk_picture` VALUES (1695, '/uploads/picture/20180404/0df299a9974af1e0e0bdf1f381bb4319.jpg', '/uploads/picture/20180404/0df299a9974af1e0e0bdf1f381bb4319.jpg', '', '', 1, 1522812654);
INSERT INTO `rk_picture` VALUES (1696, '/uploads/picture/20180404/c03f7246f70ad1ed1322d439d40d3dd7.jpg', '/uploads/picture/20180404/c03f7246f70ad1ed1322d439d40d3dd7.jpg', '', '', 1, 1522813483);
INSERT INTO `rk_picture` VALUES (1697, '/uploads/picture/20180404/dd6e31c1bc0b239f515e72a0653ffa14.jpg', '/uploads/picture/20180404/dd6e31c1bc0b239f515e72a0653ffa14.jpg', '', '', 1, 1522813549);
INSERT INTO `rk_picture` VALUES (1698, '/uploads/picture/20180404/ac51eef4cbcdf4a6c34d5a644e98231b.jpg', '/uploads/picture/20180404/ac51eef4cbcdf4a6c34d5a644e98231b.jpg', '', '', 1, 1522813565);
INSERT INTO `rk_picture` VALUES (1699, '/uploads/picture/20180404/f82b943440567ae246a1cd9629dc7d81.jpg', '/uploads/picture/20180404/f82b943440567ae246a1cd9629dc7d81.jpg', '', '', 1, 1522815735);
INSERT INTO `rk_picture` VALUES (1700, '/uploads/picture/20180404/dfe6da1cafa6d04a5c3440c62e8877e1.jpg', '/uploads/picture/20180404/dfe6da1cafa6d04a5c3440c62e8877e1.jpg', '', '', 1, 1522815883);
INSERT INTO `rk_picture` VALUES (1701, '/uploads/picture/20180404/145fbf268dc2e29bf8f6646c1d7bf96b.jpg', '/uploads/picture/20180404/145fbf268dc2e29bf8f6646c1d7bf96b.jpg', '', '', 1, 1522815887);
INSERT INTO `rk_picture` VALUES (1702, '/uploads/picture/20180404/04d284d2c2351ec11e65f9c519af02f7.jpg', '/uploads/picture/20180404/04d284d2c2351ec11e65f9c519af02f7.jpg', '', '', 1, 1522816043);
INSERT INTO `rk_picture` VALUES (1703, '/uploads/picture/20180404/ae8032f94ff5b5545ea1288836c327ed.jpg', '/uploads/picture/20180404/ae8032f94ff5b5545ea1288836c327ed.jpg', '', '', 1, 1522816050);
INSERT INTO `rk_picture` VALUES (1704, '/uploads/picture/20180404/f957073a29f2b6f7de5cbf1959d0a920.jpg', '/uploads/picture/20180404/f957073a29f2b6f7de5cbf1959d0a920.jpg', '', '', 1, 1522816070);
INSERT INTO `rk_picture` VALUES (1705, '/uploads/picture/20180404/ba31d703b35993bbff1f9ac85a1cddaf.jpg', '/uploads/picture/20180404/ba31d703b35993bbff1f9ac85a1cddaf.jpg', '', '', 1, 1522835908);
INSERT INTO `rk_picture` VALUES (1706, '/uploads/picture/20180404/1314d79a9a9ebb8e13c15d06137cc302.jpg', '/uploads/picture/20180404/1314d79a9a9ebb8e13c15d06137cc302.jpg', '', '', 1, 1522835956);
INSERT INTO `rk_picture` VALUES (1707, '/uploads/picture/20180404/6126d83d7a64fa50fbc0ccc415ca6e7a.jpg', '/uploads/picture/20180404/6126d83d7a64fa50fbc0ccc415ca6e7a.jpg', '', '', 1, 1522835986);
INSERT INTO `rk_picture` VALUES (1708, '/uploads/picture/20180404/3ae3fd17206a981cc7585ae21102b28f.jpg', '/uploads/picture/20180404/3ae3fd17206a981cc7585ae21102b28f.jpg', '', '', 1, 1522836684);
INSERT INTO `rk_picture` VALUES (1709, '/uploads/picture/20180404/03e8cbc535574ee5a45f5c4e4e51c816.jpg', '/uploads/picture/20180404/03e8cbc535574ee5a45f5c4e4e51c816.jpg', '', '', 1, 1522836739);
INSERT INTO `rk_picture` VALUES (1710, '/uploads/picture/20180404/32ad89b7f34b0489367280e221ff222f.jpg', '/uploads/picture/20180404/32ad89b7f34b0489367280e221ff222f.jpg', '', '', 1, 1522845849);
INSERT INTO `rk_picture` VALUES (1711, '/uploads/picture/20180404/8ca9017a03418b3f4c9a2f868ffac334.jpg', '/uploads/picture/20180404/8ca9017a03418b3f4c9a2f868ffac334.jpg', '', '', 1, 1522845867);
INSERT INTO `rk_picture` VALUES (1712, '/uploads/picture/20180404/4ce18c599fb162b054481284881309bf.jpg', '/uploads/picture/20180404/4ce18c599fb162b054481284881309bf.jpg', '', '', 1, 1522847551);
INSERT INTO `rk_picture` VALUES (1713, '/uploads/picture/20180405/01f1a176a1dcd204fe99d65121f3d768.png', '/uploads/picture/20180405/01f1a176a1dcd204fe99d65121f3d768.png', '', '', 1, 1522914349);
INSERT INTO `rk_picture` VALUES (1714, '/uploads/picture/20180406/dd5788c516f3a283bd40806096fcef15.jpg', '/uploads/picture/20180406/dd5788c516f3a283bd40806096fcef15.jpg', '', '', 1, 1523007279);
INSERT INTO `rk_picture` VALUES (1715, '/uploads/picture/20180406/4f7baa31c4ac89a0bbaa7fad81584d5e.jpg', '/uploads/picture/20180406/4f7baa31c4ac89a0bbaa7fad81584d5e.jpg', '', '', 1, 1523007322);
INSERT INTO `rk_picture` VALUES (1716, '/uploads/picture/20180406/9e971ae367c68a46a082ad9bdc23a43b.jpg', '/uploads/picture/20180406/9e971ae367c68a46a082ad9bdc23a43b.jpg', '', '', 1, 1523017141);
INSERT INTO `rk_picture` VALUES (1717, '/uploads/picture/20180406/b788b1c6c4d9ff11f401cbbae87c8c42.jpg', '/uploads/picture/20180406/b788b1c6c4d9ff11f401cbbae87c8c42.jpg', '', '', 1, 1523017181);
INSERT INTO `rk_picture` VALUES (1718, '/uploads/picture/20180406/01f399ba1d2ca78dc399ad770a83d70a.jpg', '/uploads/picture/20180406/01f399ba1d2ca78dc399ad770a83d70a.jpg', '', '', 1, 1523017202);
INSERT INTO `rk_picture` VALUES (1719, '/uploads/picture/20180406/82495b6d89fe15f3b2c097ec3e23c4ba.jpg', '/uploads/picture/20180406/82495b6d89fe15f3b2c097ec3e23c4ba.jpg', '', '', 1, 1523017229);
INSERT INTO `rk_picture` VALUES (1720, '/uploads/picture/20180406/a771c23f56001e97e471c7c4ada3e9c6.jpg', '/uploads/picture/20180406/a771c23f56001e97e471c7c4ada3e9c6.jpg', '', '', 1, 1523017245);
INSERT INTO `rk_picture` VALUES (1721, '/uploads/picture/20180406/e9ccdc34ea7965d3aae66c5f41b0a65f.jpg', '/uploads/picture/20180406/e9ccdc34ea7965d3aae66c5f41b0a65f.jpg', '', '', 1, 1523017266);
INSERT INTO `rk_picture` VALUES (1722, '/uploads/picture/20180406/2a10404d991fa6961f383485eebfdc52.jpg', '/uploads/picture/20180406/2a10404d991fa6961f383485eebfdc52.jpg', '', '', 1, 1523017286);
INSERT INTO `rk_picture` VALUES (1723, '/uploads/picture/20180406/2e0c03869a76032c8813bb322ee17be3.jpg', '/uploads/picture/20180406/2e0c03869a76032c8813bb322ee17be3.jpg', '', '', 1, 1523017310);
INSERT INTO `rk_picture` VALUES (1724, '/uploads/picture/20180406/77f87568ec3547e0c254f30afb772d48.jpg', '/uploads/picture/20180406/77f87568ec3547e0c254f30afb772d48.jpg', '', '', 1, 1523017350);
INSERT INTO `rk_picture` VALUES (1725, '/uploads/picture/20180406/d2e10fbc9df58c6394a1da27bbc05f74.jpg', '/uploads/picture/20180406/d2e10fbc9df58c6394a1da27bbc05f74.jpg', '', '', 1, 1523017397);
INSERT INTO `rk_picture` VALUES (1726, '/uploads/picture/20180406/84afad1d73063d30dd844c4ed565be45.jpg', '/uploads/picture/20180406/84afad1d73063d30dd844c4ed565be45.jpg', '', '', 1, 1523017427);
INSERT INTO `rk_picture` VALUES (1727, '/uploads/picture/20180406/f42f4bfcdcb1e2b8b04c24cb67cfe8cd.jpg', '/uploads/picture/20180406/f42f4bfcdcb1e2b8b04c24cb67cfe8cd.jpg', '', '', 1, 1523017498);
INSERT INTO `rk_picture` VALUES (1728, '/uploads/picture/20180406/a7c8ac12ea3d4d70af078a30e10d9b92.jpg', '/uploads/picture/20180406/a7c8ac12ea3d4d70af078a30e10d9b92.jpg', '', '', 1, 1523017525);
INSERT INTO `rk_picture` VALUES (1729, '/uploads/picture/20180406/14a45f6188a76d7ee48742076a7fdacb.jpg', '/uploads/picture/20180406/14a45f6188a76d7ee48742076a7fdacb.jpg', '', '', 1, 1523021053);
INSERT INTO `rk_picture` VALUES (1730, '/uploads/picture/20180406/7dd5d382450712a2d64fbfa58e53a14d.jpg', '/uploads/picture/20180406/7dd5d382450712a2d64fbfa58e53a14d.jpg', '', '', 1, 1523021069);
INSERT INTO `rk_picture` VALUES (1731, '/uploads/picture/20180406/4757172c273738618632dc1760805f5c.jpg', '/uploads/picture/20180406/4757172c273738618632dc1760805f5c.jpg', '', '', 1, 1523021253);
INSERT INTO `rk_picture` VALUES (1732, '/uploads/picture/20180406/5dfbe1b1a43ed37df8a0f5e4d34b7aac.jpg', '/uploads/picture/20180406/5dfbe1b1a43ed37df8a0f5e4d34b7aac.jpg', '', '', 1, 1523021267);
INSERT INTO `rk_picture` VALUES (1733, '/uploads/picture/20180406/58e1643729c46cfe1550914fd9d0f691.jpg', '/uploads/picture/20180406/58e1643729c46cfe1550914fd9d0f691.jpg', '', '', 1, 1523022540);
INSERT INTO `rk_picture` VALUES (1734, '/uploads/picture/20180406/37b7815dadf73e520a5026cb9ae39b41.jpg', '/uploads/picture/20180406/37b7815dadf73e520a5026cb9ae39b41.jpg', '', '', 1, 1523022561);
INSERT INTO `rk_picture` VALUES (1735, '/uploads/picture/20180407/adac095922dc1ad570ad7e5af6da1d39.jpg', '/uploads/picture/20180407/adac095922dc1ad570ad7e5af6da1d39.jpg', '', '', 1, 1523053305);
INSERT INTO `rk_picture` VALUES (1736, '/uploads/picture/20180407/68af8672f0f9138e5633c637f0d23341.jpg', '/uploads/picture/20180407/68af8672f0f9138e5633c637f0d23341.jpg', '', '', 1, 1523053338);
INSERT INTO `rk_picture` VALUES (1737, '/uploads/picture/20180407/352f8fe1a389db9357733f28a5973d0b.jpg', '/uploads/picture/20180407/352f8fe1a389db9357733f28a5973d0b.jpg', '', '', 1, 1523053349);
INSERT INTO `rk_picture` VALUES (1738, '/uploads/picture/20180407/d50150c5cebb6ff9cd130042e53dbd32.jpg', '/uploads/picture/20180407/d50150c5cebb6ff9cd130042e53dbd32.jpg', '', '', 1, 1523053362);
INSERT INTO `rk_picture` VALUES (1739, '/uploads/picture/20180407/afa49c8f24566b410d55bfa8a1075e5e.png', '/uploads/picture/20180407/afa49c8f24566b410d55bfa8a1075e5e.png', '', '', 1, 1523054024);
INSERT INTO `rk_picture` VALUES (1740, '/uploads/picture/20180407/57905cd3662899e235a17c1f8a25edfc.png', '/uploads/picture/20180407/57905cd3662899e235a17c1f8a25edfc.png', '', '', 1, 1523054139);
INSERT INTO `rk_picture` VALUES (1741, '/uploads/picture/20180407/eabfb71f65a146101fc048638542f548.png', '/uploads/picture/20180407/eabfb71f65a146101fc048638542f548.png', '', '', 1, 1523054177);
INSERT INTO `rk_picture` VALUES (1742, '/uploads/picture/20180407/e4453829e62e6b011887ca84b46603b6.png', '/uploads/picture/20180407/e4453829e62e6b011887ca84b46603b6.png', '', '', 1, 1523054711);
INSERT INTO `rk_picture` VALUES (1743, '/uploads/picture/20180407/318500488945f8ff17d987ad6a315095.png', '/uploads/picture/20180407/318500488945f8ff17d987ad6a315095.png', '', '', 1, 1523054736);
INSERT INTO `rk_picture` VALUES (1744, '/uploads/picture/20180407/5e4560b1cfc815334b7cbd19828f9e4d.png', '/uploads/picture/20180407/5e4560b1cfc815334b7cbd19828f9e4d.png', '', '', 1, 1523054752);
INSERT INTO `rk_picture` VALUES (1745, '/uploads/picture/20180407/837343f702d1afb80f7fc7b374bdbb11.png', '/uploads/picture/20180407/837343f702d1afb80f7fc7b374bdbb11.png', '', '', 1, 1523054773);
INSERT INTO `rk_picture` VALUES (1746, '/uploads/picture/20180407/847ec106e64ca94ad0544cb3ff931a50.png', '/uploads/picture/20180407/847ec106e64ca94ad0544cb3ff931a50.png', '', '', 1, 1523054801);
INSERT INTO `rk_picture` VALUES (1747, '/uploads/picture/20180407/5794df062743a6c960349acbd0d65337.png', '/uploads/picture/20180407/5794df062743a6c960349acbd0d65337.png', '', '', 1, 1523054822);
INSERT INTO `rk_picture` VALUES (1748, '/uploads/picture/20180407/767c1f383a6351b82aeaa2e13588bf80.png', '/uploads/picture/20180407/767c1f383a6351b82aeaa2e13588bf80.png', '', '', 1, 1523054837);
INSERT INTO `rk_picture` VALUES (1749, '/uploads/picture/20180407/38ed891d2b447a23761f86bf9eaf2fc5.png', '/uploads/picture/20180407/38ed891d2b447a23761f86bf9eaf2fc5.png', '', '', 1, 1523054852);
INSERT INTO `rk_picture` VALUES (1750, '/uploads/picture/20180407/27073446865a32857585b4bd4e74d05b.jpg', '/uploads/picture/20180407/27073446865a32857585b4bd4e74d05b.jpg', '', '', 1, 1523062300);
INSERT INTO `rk_picture` VALUES (1751, '/uploads/picture/20180407/5ed29b7d824d41cc959759dfdc8a6914.jpg', '/uploads/picture/20180407/5ed29b7d824d41cc959759dfdc8a6914.jpg', '', '', 1, 1523065414);
INSERT INTO `rk_picture` VALUES (1752, '/uploads/picture/20180407/9d15d4c35564d9a18903cb040a907ad7.jpg', '/uploads/picture/20180407/9d15d4c35564d9a18903cb040a907ad7.jpg', '', '', 1, 1523065492);
INSERT INTO `rk_picture` VALUES (1753, '/uploads/picture/20180407/9f02d66601644d768c1b493a88219863.jpg', '/uploads/picture/20180407/9f02d66601644d768c1b493a88219863.jpg', '', '', 1, 1523066069);
INSERT INTO `rk_picture` VALUES (1754, '/uploads/picture/20180407/dacd915527376294bfabf1c8ca0c2fdb.jpg', '/uploads/picture/20180407/dacd915527376294bfabf1c8ca0c2fdb.jpg', '', '', 1, 1523066832);
INSERT INTO `rk_picture` VALUES (1755, '/uploads/picture/20180407/61dc07ec240c82b227f78bd739dbf2cf.jpg', '/uploads/picture/20180407/61dc07ec240c82b227f78bd739dbf2cf.jpg', '', '', 1, 1523066876);
INSERT INTO `rk_picture` VALUES (1756, '/uploads/picture/20180407/d2c6242da3eeb170ce223e315d2d42c0.jpg', '/uploads/picture/20180407/d2c6242da3eeb170ce223e315d2d42c0.jpg', '', '', 1, 1523066885);
INSERT INTO `rk_picture` VALUES (1757, '/uploads/picture/20180407/b04b9ec6a03bb1c0bc2ee613e991e08b.jpg', '/uploads/picture/20180407/b04b9ec6a03bb1c0bc2ee613e991e08b.jpg', '', '', 1, 1523066984);
INSERT INTO `rk_picture` VALUES (1758, '/uploads/picture/20180407/335e4d45f8b1677a42c9218f6549498e.jpg', '/uploads/picture/20180407/335e4d45f8b1677a42c9218f6549498e.jpg', '', '', 1, 1523066986);
INSERT INTO `rk_picture` VALUES (1759, '/uploads/picture/20180407/aadace6a83bae9a624760aca63df52ea.jpg', '/uploads/picture/20180407/aadace6a83bae9a624760aca63df52ea.jpg', '', '', 1, 1523067008);
INSERT INTO `rk_picture` VALUES (1760, '/uploads/picture/20180407/8631134aa55cea475a57ec25f26b87ef.jpg', '/uploads/picture/20180407/8631134aa55cea475a57ec25f26b87ef.jpg', '', '', 1, 1523067079);
INSERT INTO `rk_picture` VALUES (1761, '/uploads/picture/20180407/f44953ba32ce73f64dd482e494263927.jpg', '/uploads/picture/20180407/f44953ba32ce73f64dd482e494263927.jpg', '', '', 1, 1523067107);
INSERT INTO `rk_picture` VALUES (1762, '/uploads/picture/20180407/d30d4e39e79c705937b226f6d768575a.jpg', '/uploads/picture/20180407/d30d4e39e79c705937b226f6d768575a.jpg', '', '', 1, 1523068667);
INSERT INTO `rk_picture` VALUES (1763, '/uploads/picture/20180407/6e9bded8210a1f3535d2a136a726338d.jpg', '/uploads/picture/20180407/6e9bded8210a1f3535d2a136a726338d.jpg', '', '', 1, 1523068686);
INSERT INTO `rk_picture` VALUES (1764, '/uploads/picture/20180407/5167c6b5eab1fd2d27ffc9ed3e00cea0.jpg', '/uploads/picture/20180407/5167c6b5eab1fd2d27ffc9ed3e00cea0.jpg', '', '', 1, 1523070131);
INSERT INTO `rk_picture` VALUES (1765, '/uploads/picture/20180407/e99d33abce745b3f344a1945c7005953.jpg', '/uploads/picture/20180407/e99d33abce745b3f344a1945c7005953.jpg', '', '', 1, 1523071491);
INSERT INTO `rk_picture` VALUES (1766, '/uploads/picture/20180407/0672d2c9a89aec3a6e666cdec7431bd2.jpg', '/uploads/picture/20180407/0672d2c9a89aec3a6e666cdec7431bd2.jpg', '', '', 1, 1523071821);
INSERT INTO `rk_picture` VALUES (1767, '/uploads/picture/20180407/d0dde97987dae29e7be8b39c22b25807.jpg', '/uploads/picture/20180407/d0dde97987dae29e7be8b39c22b25807.jpg', '', '', 1, 1523071973);
INSERT INTO `rk_picture` VALUES (1768, '/uploads/picture/20180407/9b8926266a0b31e277814f3bbdbcd4e6.jpg', '/uploads/picture/20180407/9b8926266a0b31e277814f3bbdbcd4e6.jpg', '', '', 1, 1523089130);
INSERT INTO `rk_picture` VALUES (1769, '/uploads/picture/20180407/ef22929245765964c620be8f5405114b.jpg', '/uploads/picture/20180407/ef22929245765964c620be8f5405114b.jpg', '', '', 1, 1523090159);
INSERT INTO `rk_picture` VALUES (1770, '/uploads/picture/20180407/5f4c58445f690aa869b14e261052fdcc.jpg', '/uploads/picture/20180407/5f4c58445f690aa869b14e261052fdcc.jpg', '', '', 1, 1523090261);
INSERT INTO `rk_picture` VALUES (1771, '/uploads/picture/20180407/f6576b67f815b516c3b35ff19e3d1b4a.png', '/uploads/picture/20180407/f6576b67f815b516c3b35ff19e3d1b4a.png', '', '', 1, 1523092986);
INSERT INTO `rk_picture` VALUES (1772, '/uploads/picture/20180407/5301f0e5e4b3c0c028fd7155114cfa09.png', '/uploads/picture/20180407/5301f0e5e4b3c0c028fd7155114cfa09.png', '', '', 1, 1523093058);
INSERT INTO `rk_picture` VALUES (1773, '/uploads/picture/20180407/1a53b38e4b586af7d205f3a8e8635fa6.png', '/uploads/picture/20180407/1a53b38e4b586af7d205f3a8e8635fa6.png', '', '', 1, 1523093137);
INSERT INTO `rk_picture` VALUES (1774, '/uploads/picture/20180407/b461be29b9fb3562522fcda3d588b2c0.png', '/uploads/picture/20180407/b461be29b9fb3562522fcda3d588b2c0.png', '', '', 1, 1523093168);
INSERT INTO `rk_picture` VALUES (1775, '/uploads/picture/20180407/f27c261550081480d82a7f0648b3a9d2.png', '/uploads/picture/20180407/f27c261550081480d82a7f0648b3a9d2.png', '', '', 1, 1523093257);
INSERT INTO `rk_picture` VALUES (1776, '/uploads/picture/20180407/6c8b516b80f156a6a6459c28cad92649.jpg', '/uploads/picture/20180407/6c8b516b80f156a6a6459c28cad92649.jpg', '', '', 1, 1523094732);
INSERT INTO `rk_picture` VALUES (1777, '/uploads/picture/20180407/3a38b9211d5fd56794794c6ae85853b4.jpg', '/uploads/picture/20180407/3a38b9211d5fd56794794c6ae85853b4.jpg', '', '', 1, 1523095311);
INSERT INTO `rk_picture` VALUES (1778, '/uploads/picture/20180407/92cca4fe8c606061e2d53e2009ed8c45.jpg', '/uploads/picture/20180407/92cca4fe8c606061e2d53e2009ed8c45.jpg', '', '', 1, 1523096500);
INSERT INTO `rk_picture` VALUES (1779, '/uploads/picture/20180407/14b971dd695ee30db860eb0b3168107d.jpg', '/uploads/picture/20180407/14b971dd695ee30db860eb0b3168107d.jpg', '', '', 1, 1523103615);
INSERT INTO `rk_picture` VALUES (1780, '/uploads/picture/20180407/16f2610bf77840e274f40cf6bf33a3c7.jpg', '/uploads/picture/20180407/16f2610bf77840e274f40cf6bf33a3c7.jpg', '', '', 1, 1523103983);
INSERT INTO `rk_picture` VALUES (1781, '/uploads/picture/20180407/df0ecc5cbd9570d0b659313838643e8a.jpg', '/uploads/picture/20180407/df0ecc5cbd9570d0b659313838643e8a.jpg', '', '', 1, 1523104082);
INSERT INTO `rk_picture` VALUES (1782, '/uploads/picture/20180407/37babb8a876c3c7da010be90c4c6f242.jpg', '/uploads/picture/20180407/37babb8a876c3c7da010be90c4c6f242.jpg', '', '', 1, 1523106749);
INSERT INTO `rk_picture` VALUES (1783, '/uploads/picture/20180407/3475bd42b9e4a9f31aa8d78245796f05.jpg', '/uploads/picture/20180407/3475bd42b9e4a9f31aa8d78245796f05.jpg', '', '', 1, 1523106771);
INSERT INTO `rk_picture` VALUES (1784, '/uploads/picture/20180407/c81b300e3df5fb9faec3c997a0dc65b1.jpg', '/uploads/picture/20180407/c81b300e3df5fb9faec3c997a0dc65b1.jpg', '', '', 1, 1523107108);
INSERT INTO `rk_picture` VALUES (1785, '/uploads/picture/20180408/4d1b748be3299d01c607ff293b395202.jpg', '/uploads/picture/20180408/4d1b748be3299d01c607ff293b395202.jpg', '', '', 1, 1523144004);
INSERT INTO `rk_picture` VALUES (1786, '/uploads/picture/20180408/e1527516c51cc8761f913666dad953d1.jpg', '/uploads/picture/20180408/e1527516c51cc8761f913666dad953d1.jpg', '', '', 1, 1523149878);
INSERT INTO `rk_picture` VALUES (1787, '/uploads/picture/20180408/9015a3dca0fa2d0851e0d0d6cbac5213.jpg', '/uploads/picture/20180408/9015a3dca0fa2d0851e0d0d6cbac5213.jpg', '', '', 1, 1523154495);
INSERT INTO `rk_picture` VALUES (1788, '/uploads/picture/20180408/50561464f1891cf6843d29752e179c72.jpg', '/uploads/picture/20180408/50561464f1891cf6843d29752e179c72.jpg', '', '', 1, 1523154550);
INSERT INTO `rk_picture` VALUES (1789, '/uploads/picture/20180408/62831be2b396ad08f606060c3c7a2892.jpg', '/uploads/picture/20180408/62831be2b396ad08f606060c3c7a2892.jpg', '', '', 1, 1523155393);
INSERT INTO `rk_picture` VALUES (1790, '/uploads/picture/20180408/1158ceda1f2549211e8cdd615400de45.jpg', '/uploads/picture/20180408/1158ceda1f2549211e8cdd615400de45.jpg', '', '', 1, 1523155439);
INSERT INTO `rk_picture` VALUES (1791, '/uploads/picture/20180408/1d6d179fadfda6c17c9089a12728b856.jpg', '/uploads/picture/20180408/1d6d179fadfda6c17c9089a12728b856.jpg', '', '', 1, 1523155456);
INSERT INTO `rk_picture` VALUES (1792, '/uploads/picture/20180408/b909fde3ffaf085a688298d5fc294a02.jpg', '/uploads/picture/20180408/b909fde3ffaf085a688298d5fc294a02.jpg', '', '', 1, 1523155605);
INSERT INTO `rk_picture` VALUES (1793, '/uploads/picture/20180408/6f0f532794d8f191632d0893de6a7621.jpg', '/uploads/picture/20180408/6f0f532794d8f191632d0893de6a7621.jpg', '', '', 1, 1523155648);
INSERT INTO `rk_picture` VALUES (1794, '/uploads/picture/20180408/0fe1576a02c85616336f5912f71a58f2.jpg', '/uploads/picture/20180408/0fe1576a02c85616336f5912f71a58f2.jpg', '', '', 1, 1523155681);
INSERT INTO `rk_picture` VALUES (1795, '/uploads/picture/20180408/946619b64c68dfc1ab9789035ccc7650.jpg', '/uploads/picture/20180408/946619b64c68dfc1ab9789035ccc7650.jpg', '', '', 1, 1523165020);
INSERT INTO `rk_picture` VALUES (1796, '/uploads/picture/20180408/f2f943f855fb3bc743406355a34e6250.jpg', '/uploads/picture/20180408/f2f943f855fb3bc743406355a34e6250.jpg', '', '', 1, 1523165038);
INSERT INTO `rk_picture` VALUES (1797, '/uploads/picture/20180408/7f3686b51e9e5be505a9ff2afc413e99.jpg', '/uploads/picture/20180408/7f3686b51e9e5be505a9ff2afc413e99.jpg', '', '', 1, 1523165705);
INSERT INTO `rk_picture` VALUES (1798, '/uploads/picture/20180408/1ce1fd551dce894c6f9923dfe006bac9.jpg', '/uploads/picture/20180408/1ce1fd551dce894c6f9923dfe006bac9.jpg', '', '', 1, 1523165728);
INSERT INTO `rk_picture` VALUES (1799, '/uploads/picture/20180408/ccfce997cf7f43d7d6817f17957eb68f.jpg', '/uploads/picture/20180408/ccfce997cf7f43d7d6817f17957eb68f.jpg', '', '', 1, 1523171996);
INSERT INTO `rk_picture` VALUES (1800, '/uploads/picture/20180408/fd4bb4b0b457a8e9c0761642437bc1cc.jpg', '/uploads/picture/20180408/fd4bb4b0b457a8e9c0761642437bc1cc.jpg', '', '', 1, 1523172044);
INSERT INTO `rk_picture` VALUES (1801, '/uploads/picture/20180408/b18877a710edc67941524c4ecfac4e7e.jpg', '/uploads/picture/20180408/b18877a710edc67941524c4ecfac4e7e.jpg', '', '', 1, 1523172053);
INSERT INTO `rk_picture` VALUES (1802, '/uploads/picture/20180408/b179c137f694fabb9bdb4e9ce3b4545b.jpg', '/uploads/picture/20180408/b179c137f694fabb9bdb4e9ce3b4545b.jpg', '', '', 1, 1523172069);
INSERT INTO `rk_picture` VALUES (1803, '/uploads/picture/20180408/6856f925d2400ceb66c021c111e55b27.jpg', '/uploads/picture/20180408/6856f925d2400ceb66c021c111e55b27.jpg', '', '', 1, 1523191586);
INSERT INTO `rk_picture` VALUES (1804, '/uploads/picture/20180408/5b239bf98b4cf8e352a46dc4d825f86d.jpg', '/uploads/picture/20180408/5b239bf98b4cf8e352a46dc4d825f86d.jpg', '', '', 1, 1523191605);
INSERT INTO `rk_picture` VALUES (1805, '/uploads/picture/20180408/9ef278ce04cbff574a27ce91a81edefb.jpg', '/uploads/picture/20180408/9ef278ce04cbff574a27ce91a81edefb.jpg', '', '', 1, 1523192520);
INSERT INTO `rk_picture` VALUES (1806, '/uploads/picture/20180408/e2e4789a1a6aca1276db28a07639faa2.jpg', '/uploads/picture/20180408/e2e4789a1a6aca1276db28a07639faa2.jpg', '', '', 1, 1523192542);
INSERT INTO `rk_picture` VALUES (1807, '/uploads/picture/20180409/648612ad83ed809ca78b36fd638d6f8d.jpg', '/uploads/picture/20180409/648612ad83ed809ca78b36fd638d6f8d.jpg', '', '', 1, 1523225840);
INSERT INTO `rk_picture` VALUES (1808, '/uploads/picture/20180409/22fd0f44781ed3db92e4ea5bf5c456ad.jpg', '/uploads/picture/20180409/22fd0f44781ed3db92e4ea5bf5c456ad.jpg', '', '', 1, 1523225872);
INSERT INTO `rk_picture` VALUES (1809, '/uploads/picture/20180409/c7c290a5339bf6291f87b0803b9fd4ef.jpg', '/uploads/picture/20180409/c7c290a5339bf6291f87b0803b9fd4ef.jpg', '', '', 1, 1523226870);
INSERT INTO `rk_picture` VALUES (1810, '/uploads/picture/20180409/689814e34194f43dddb92c03e4ef2c8c.jpg', '/uploads/picture/20180409/689814e34194f43dddb92c03e4ef2c8c.jpg', '', '', 1, 1523226889);
INSERT INTO `rk_picture` VALUES (1811, '/uploads/picture/20180409/da70b845490ba3ea3bf3e7ff510103b9.jpg', '/uploads/picture/20180409/da70b845490ba3ea3bf3e7ff510103b9.jpg', '', '', 1, 1523226907);
INSERT INTO `rk_picture` VALUES (1812, '/uploads/picture/20180409/49afc165e293976cf2b64a6f9b8e5558.jpg', '/uploads/picture/20180409/49afc165e293976cf2b64a6f9b8e5558.jpg', '', '', 1, 1523226924);
INSERT INTO `rk_picture` VALUES (1813, '/uploads/picture/20180409/0f571b8c57fb1b6990bfa4f67bae2ec7.jpg', '/uploads/picture/20180409/0f571b8c57fb1b6990bfa4f67bae2ec7.jpg', '', '', 1, 1523227245);
INSERT INTO `rk_picture` VALUES (1814, '/uploads/picture/20180409/d127dc16dc3a5e3962019b8cbb58eed2.jpg', '/uploads/picture/20180409/d127dc16dc3a5e3962019b8cbb58eed2.jpg', '', '', 1, 1523227255);
INSERT INTO `rk_picture` VALUES (1815, '/uploads/picture/20180409/9e04340a373878366a98efa5ca75da99.jpg', '/uploads/picture/20180409/9e04340a373878366a98efa5ca75da99.jpg', '', '', 1, 1523227277);
INSERT INTO `rk_picture` VALUES (1816, '/uploads/picture/20180409/3f0df9a6ab21f69d06cce45caa20b1c9.jpg', '/uploads/picture/20180409/3f0df9a6ab21f69d06cce45caa20b1c9.jpg', '', '', 1, 1523227324);
INSERT INTO `rk_picture` VALUES (1817, '/uploads/picture/20180409/76f7cc0cdf0c81185ffd858deddfb7b5.jpg', '/uploads/picture/20180409/76f7cc0cdf0c81185ffd858deddfb7b5.jpg', '', '', 1, 1523237393);
INSERT INTO `rk_picture` VALUES (1818, '/uploads/picture/20180409/1e713046ae14fbced17f000a834f4e6c.jpg', '/uploads/picture/20180409/1e713046ae14fbced17f000a834f4e6c.jpg', '', '', 1, 1523238545);
INSERT INTO `rk_picture` VALUES (1819, '/uploads/picture/20180409/2cacc9bc61cc86eac5a6331c5c813de6.jpg', '/uploads/picture/20180409/2cacc9bc61cc86eac5a6331c5c813de6.jpg', '', '', 1, 1523241365);
INSERT INTO `rk_picture` VALUES (1820, '/uploads/picture/20180409/8c447699b2527dbd7c61f52c3b086d83.jpg', '/uploads/picture/20180409/8c447699b2527dbd7c61f52c3b086d83.jpg', '', '', 1, 1523241459);
INSERT INTO `rk_picture` VALUES (1821, '/uploads/picture/20180409/1f242fa590fe586af17ee97f932345e8.jpg', '/uploads/picture/20180409/1f242fa590fe586af17ee97f932345e8.jpg', '', '', 1, 1523241497);
INSERT INTO `rk_picture` VALUES (1822, '/uploads/picture/20180409/64308e72e31706d08d4c1dc518798f50.jpg', '/uploads/picture/20180409/64308e72e31706d08d4c1dc518798f50.jpg', '', '', 1, 1523241653);
INSERT INTO `rk_picture` VALUES (1823, '/uploads/picture/20180409/34c01a88496982e2cf16b52bfa55587f.jpg', '/uploads/picture/20180409/34c01a88496982e2cf16b52bfa55587f.jpg', '', '', 1, 1523241735);
INSERT INTO `rk_picture` VALUES (1824, '/uploads/picture/20180409/36fb2bbae52f713c28bedaa64b3e39db.jpg', '/uploads/picture/20180409/36fb2bbae52f713c28bedaa64b3e39db.jpg', '', '', 1, 1523241777);
INSERT INTO `rk_picture` VALUES (1825, '/uploads/picture/20180409/80ccd4f2ada59468b58d1e86191e54f3.jpg', '/uploads/picture/20180409/80ccd4f2ada59468b58d1e86191e54f3.jpg', '', '', 1, 1523241778);
INSERT INTO `rk_picture` VALUES (1826, '/uploads/picture/20180409/6a5f8b68121cb4d380fdb8157caecb1f.jpg', '/uploads/picture/20180409/6a5f8b68121cb4d380fdb8157caecb1f.jpg', '', '', 1, 1523242002);
INSERT INTO `rk_picture` VALUES (1827, '/uploads/picture/20180409/710e504a760669498411df72407ee597.jpg', '/uploads/picture/20180409/710e504a760669498411df72407ee597.jpg', '', '', 1, 1523242017);
INSERT INTO `rk_picture` VALUES (1828, '/uploads/picture/20180409/ede52c72ab4f864861dab1a9b50dc025.jpg', '/uploads/picture/20180409/ede52c72ab4f864861dab1a9b50dc025.jpg', '', '', 1, 1523242072);
INSERT INTO `rk_picture` VALUES (1829, '/uploads/picture/20180409/245dbc31413a2c2ffe92c299e9d6c9a6.jpg', '/uploads/picture/20180409/245dbc31413a2c2ffe92c299e9d6c9a6.jpg', '', '', 1, 1523242118);
INSERT INTO `rk_picture` VALUES (1830, '/uploads/picture/20180409/d1fad33f6c295dc08139d4a243717f89.jpg', '/uploads/picture/20180409/d1fad33f6c295dc08139d4a243717f89.jpg', '', '', 1, 1523242235);
INSERT INTO `rk_picture` VALUES (1831, '/uploads/picture/20180409/6f5560ff5bfe3ca633fd2db9c7f689d0.jpg', '/uploads/picture/20180409/6f5560ff5bfe3ca633fd2db9c7f689d0.jpg', '', '', 1, 1523243230);
INSERT INTO `rk_picture` VALUES (1832, '/uploads/picture/20180409/ec14f95c7815ecbccd1b1afb8e3db065.jpg', '/uploads/picture/20180409/ec14f95c7815ecbccd1b1afb8e3db065.jpg', '', '', 1, 1523243529);
INSERT INTO `rk_picture` VALUES (1833, '/uploads/picture/20180409/eb0732386d1bf8d89527bb13d407e7c2.jpg', '/uploads/picture/20180409/eb0732386d1bf8d89527bb13d407e7c2.jpg', '', '', 1, 1523243566);
INSERT INTO `rk_picture` VALUES (1834, '/uploads/picture/20180409/f273c4d60d1d8b6779ab7029250f7829.jpg', '/uploads/picture/20180409/f273c4d60d1d8b6779ab7029250f7829.jpg', '', '', 1, 1523244669);
INSERT INTO `rk_picture` VALUES (1835, '/uploads/picture/20180409/e8211af58f952521aeff108f79d03406.jpg', '/uploads/picture/20180409/e8211af58f952521aeff108f79d03406.jpg', '', '', 1, 1523249830);
INSERT INTO `rk_picture` VALUES (1836, '/uploads/picture/20180409/c7ccab7569f4306634c43c0366b5af0e.jpg', '/uploads/picture/20180409/c7ccab7569f4306634c43c0366b5af0e.jpg', '', '', 1, 1523251804);
INSERT INTO `rk_picture` VALUES (1837, '/uploads/picture/20180409/26519b851e42e054c4dc14bd19c9eb9d.jpg', '/uploads/picture/20180409/26519b851e42e054c4dc14bd19c9eb9d.jpg', '', '', 1, 1523251816);
INSERT INTO `rk_picture` VALUES (1838, '/uploads/picture/20180409/fd1b9f694abdcd041a7c689e16b2cf14.jpg', '/uploads/picture/20180409/fd1b9f694abdcd041a7c689e16b2cf14.jpg', '', '', 1, 1523257964);
INSERT INTO `rk_picture` VALUES (1839, '/uploads/picture/20180409/79921202a7cb5b598be2b2f2073bdbfd.jpg', '/uploads/picture/20180409/79921202a7cb5b598be2b2f2073bdbfd.jpg', '', '', 1, 1523258387);
INSERT INTO `rk_picture` VALUES (1840, '/uploads/picture/20180409/1534e771cb75b67a0f8c144f6c91ac58.png', '/uploads/picture/20180409/1534e771cb75b67a0f8c144f6c91ac58.png', '', '', 1, 1523258564);
INSERT INTO `rk_picture` VALUES (1841, '/uploads/picture/20180409/1958fde3a02d166887da90364e51ea51.png', '/uploads/picture/20180409/1958fde3a02d166887da90364e51ea51.png', '', '', 1, 1523258598);
INSERT INTO `rk_picture` VALUES (1842, '/uploads/picture/20180409/d079b12f8d5cc5f170caec5db219dd7a.png', '/uploads/picture/20180409/d079b12f8d5cc5f170caec5db219dd7a.png', '', '', 1, 1523258652);
INSERT INTO `rk_picture` VALUES (1843, '/uploads/picture/20180409/7ff8e162b8e25ff974bd5a7654b7887b.png', '/uploads/picture/20180409/7ff8e162b8e25ff974bd5a7654b7887b.png', '', '', 1, 1523258674);
INSERT INTO `rk_picture` VALUES (1844, '/uploads/picture/20180409/b3e3b8519401b7cc3a5678d786c50e94.jpg', '/uploads/picture/20180409/b3e3b8519401b7cc3a5678d786c50e94.jpg', '', '', 1, 1523261066);
INSERT INTO `rk_picture` VALUES (1845, '/uploads/picture/20180409/a2a53f7b37cfcf2831353c13f2e2ea41.jpg', '/uploads/picture/20180409/a2a53f7b37cfcf2831353c13f2e2ea41.jpg', '', '', 1, 1523262688);
INSERT INTO `rk_picture` VALUES (1846, '/uploads/picture/20180409/e860fb7b1d273016981ef9d7a6d4ac4c.png', '/uploads/picture/20180409/e860fb7b1d273016981ef9d7a6d4ac4c.png', '', '', 1, 1523262991);
INSERT INTO `rk_picture` VALUES (1847, '/uploads/picture/20180409/6f7445df676777c16c68a81a64c60560.jpg', '/uploads/picture/20180409/6f7445df676777c16c68a81a64c60560.jpg', '', '', 1, 1523263277);
INSERT INTO `rk_picture` VALUES (1848, '/uploads/picture/20180409/2b8fb62f00bcaa2a6158cc3b0c2c1d4c.jpg', '/uploads/picture/20180409/2b8fb62f00bcaa2a6158cc3b0c2c1d4c.jpg', '', '', 1, 1523264853);
INSERT INTO `rk_picture` VALUES (1849, '/uploads/picture/20180409/c1fa198c681ac3e9935d8946461f01e4.jpg', '/uploads/picture/20180409/c1fa198c681ac3e9935d8946461f01e4.jpg', '', '', 1, 1523264881);
INSERT INTO `rk_picture` VALUES (1850, '/uploads/picture/20180409/d34b4d83e11da442a5052a475efdc7fb.jpg', '/uploads/picture/20180409/d34b4d83e11da442a5052a475efdc7fb.jpg', '', '', 1, 1523269858);
INSERT INTO `rk_picture` VALUES (1851, '/uploads/picture/20180409/fb9cee699908fe2c104cf544c9af6c76.png', '/uploads/picture/20180409/fb9cee699908fe2c104cf544c9af6c76.png', '', '', 1, 1523277747);
INSERT INTO `rk_picture` VALUES (1852, '/uploads/picture/20180409/aecb200b06880fbe69d35497c87e41f8.png', '/uploads/picture/20180409/aecb200b06880fbe69d35497c87e41f8.png', '', '', 1, 1523277755);
INSERT INTO `rk_picture` VALUES (1853, '/uploads/picture/20180409/6122848e87883d27c9e4cf85f79bb2a9.png', '/uploads/picture/20180409/6122848e87883d27c9e4cf85f79bb2a9.png', '', '', 1, 1523277779);
INSERT INTO `rk_picture` VALUES (1854, '/uploads/picture/20180409/f757172e6ef4de07742e1b7b1ba545fe.png', '/uploads/picture/20180409/f757172e6ef4de07742e1b7b1ba545fe.png', '', '', 1, 1523277799);
INSERT INTO `rk_picture` VALUES (1855, '/uploads/picture/20180409/c8cbfccd3e3a86ed821c36bc3d229df0.png', '/uploads/picture/20180409/c8cbfccd3e3a86ed821c36bc3d229df0.png', '', '', 1, 1523277805);
INSERT INTO `rk_picture` VALUES (1856, '/uploads/picture/20180409/53cdc8d4e1e8cf9bdbe52c2a77b35915.png', '/uploads/picture/20180409/53cdc8d4e1e8cf9bdbe52c2a77b35915.png', '', '', 1, 1523278034);
INSERT INTO `rk_picture` VALUES (1857, '/uploads/picture/20180409/215d02f90545de21b68325217005f03e.png', '/uploads/picture/20180409/215d02f90545de21b68325217005f03e.png', '', '', 1, 1523278041);
INSERT INTO `rk_picture` VALUES (1858, '/uploads/picture/20180409/3a7e2bcbaef6c3def8ff7df34d4a5f87.png', '/uploads/picture/20180409/3a7e2bcbaef6c3def8ff7df34d4a5f87.png', '', '', 1, 1523278060);
INSERT INTO `rk_picture` VALUES (1859, '/uploads/picture/20180409/6b55780e8c0ac217f00759cdd1ddedee.png', '/uploads/picture/20180409/6b55780e8c0ac217f00759cdd1ddedee.png', '', '', 1, 1523278074);
INSERT INTO `rk_picture` VALUES (1860, '/uploads/picture/20180409/290dee708970dc53f8700ec50168f56e.png', '/uploads/picture/20180409/290dee708970dc53f8700ec50168f56e.png', '', '', 1, 1523278095);
INSERT INTO `rk_picture` VALUES (1861, '/uploads/picture/20180409/606a64cab1b48b571bd07ac33bc921c3.jpg', '/uploads/picture/20180409/606a64cab1b48b571bd07ac33bc921c3.jpg', '', '', 1, 1523281415);
INSERT INTO `rk_picture` VALUES (1862, '/uploads/picture/20180409/f1013bd798bd9f816d110c8da04a28d8.jpg', '/uploads/picture/20180409/f1013bd798bd9f816d110c8da04a28d8.jpg', '', '', 1, 1523281429);
INSERT INTO `rk_picture` VALUES (1863, '/uploads/picture/20180410/6271101712f53886868c84b05bf4d78d.jpg', '/uploads/picture/20180410/6271101712f53886868c84b05bf4d78d.jpg', '', '', 1, 1523312377);
INSERT INTO `rk_picture` VALUES (1864, '/uploads/picture/20180410/ddef80f2fda8283361ae4eb07247dfc5.jpg', '/uploads/picture/20180410/ddef80f2fda8283361ae4eb07247dfc5.jpg', '', '', 1, 1523312475);
INSERT INTO `rk_picture` VALUES (1865, '/uploads/picture/20180410/b68298754f53736e3ccf6891a885de7e.jpg', '/uploads/picture/20180410/b68298754f53736e3ccf6891a885de7e.jpg', '', '', 1, 1523326313);
INSERT INTO `rk_picture` VALUES (1866, '/uploads/picture/20180410/bb05b9b52ded37b8a2017577c878b19b.jpg', '/uploads/picture/20180410/bb05b9b52ded37b8a2017577c878b19b.jpg', '', '', 1, 1523326340);
INSERT INTO `rk_picture` VALUES (1867, '/uploads/picture/20180410/1b02a782f3fabe31cb8a3b7e273bbf32.jpg', '/uploads/picture/20180410/1b02a782f3fabe31cb8a3b7e273bbf32.jpg', '', '', 1, 1523326349);
INSERT INTO `rk_picture` VALUES (1868, '/uploads/picture/20180410/d9d2e380b857dec3f45191e2fde8130f.jpg', '/uploads/picture/20180410/d9d2e380b857dec3f45191e2fde8130f.jpg', '', '', 1, 1523340955);
INSERT INTO `rk_picture` VALUES (1869, '/uploads/picture/20180410/325530f880a24d7041bf13b114f67c2a.jpg', '/uploads/picture/20180410/325530f880a24d7041bf13b114f67c2a.jpg', '', '', 1, 1523341756);
INSERT INTO `rk_picture` VALUES (1870, '/uploads/picture/20180410/ef95c369fe387f05fb67ac5b9f33cbd1.jpg', '/uploads/picture/20180410/ef95c369fe387f05fb67ac5b9f33cbd1.jpg', '', '', 1, 1523347035);
INSERT INTO `rk_picture` VALUES (1871, '/uploads/picture/20180410/512188fdf55ca7e44101145383492ef3.jpg', '/uploads/picture/20180410/512188fdf55ca7e44101145383492ef3.jpg', '', '', 1, 1523347051);
INSERT INTO `rk_picture` VALUES (1872, '/uploads/picture/20180410/ee9a26f68a16676879ee09fa4f82dbba.jpg', '/uploads/picture/20180410/ee9a26f68a16676879ee09fa4f82dbba.jpg', '', '', 1, 1523354236);
INSERT INTO `rk_picture` VALUES (1873, '/uploads/picture/20180410/815707bcc5e81763bac2f33332b25c4f.jpg', '/uploads/picture/20180410/815707bcc5e81763bac2f33332b25c4f.jpg', '', '', 1, 1523356512);
INSERT INTO `rk_picture` VALUES (1874, '/uploads/picture/20180410/6ef331af57be6a50f17db63a7bcf0233.jpg', '/uploads/picture/20180410/6ef331af57be6a50f17db63a7bcf0233.jpg', '', '', 1, 1523356557);
INSERT INTO `rk_picture` VALUES (1875, '/uploads/picture/20180411/49e50572d9838a99dd4ff3dd556b175c.jpg', '/uploads/picture/20180411/49e50572d9838a99dd4ff3dd556b175c.jpg', '', '', 1, 1523418171);
INSERT INTO `rk_picture` VALUES (1876, '/uploads/picture/20180411/c755229a37a0e64147ff100d41580862.jpg', '/uploads/picture/20180411/c755229a37a0e64147ff100d41580862.jpg', '', '', 1, 1523418663);
INSERT INTO `rk_picture` VALUES (1877, '/uploads/picture/20180411/8a8529f354233996ae24ab88433fff44.jpg', '/uploads/picture/20180411/8a8529f354233996ae24ab88433fff44.jpg', '', '', 1, 1523418715);
INSERT INTO `rk_picture` VALUES (1878, '/uploads/picture/20180411/74d958003cc4c36c453c3e5f6008f607.jpg', '/uploads/picture/20180411/74d958003cc4c36c453c3e5f6008f607.jpg', '', '', 1, 1523418823);
INSERT INTO `rk_picture` VALUES (1879, '/uploads/picture/20180411/88f1647132e31a4226edf74387f362b7.jpg', '/uploads/picture/20180411/88f1647132e31a4226edf74387f362b7.jpg', '', '', 1, 1523418906);
INSERT INTO `rk_picture` VALUES (1880, '/uploads/picture/20180411/0ee2449f928c288303dcb78ae94a5fa5.jpg', '/uploads/picture/20180411/0ee2449f928c288303dcb78ae94a5fa5.jpg', '', '', 1, 1523419023);
INSERT INTO `rk_picture` VALUES (1881, '/uploads/picture/20180411/ecc445f78bac631485da6fea62383cc9.jpg', '/uploads/picture/20180411/ecc445f78bac631485da6fea62383cc9.jpg', '', '', 1, 1523419217);
INSERT INTO `rk_picture` VALUES (1882, '/uploads/picture/20180411/e07516b89feefaf44f2477c7bd587ea3.jpg', '/uploads/picture/20180411/e07516b89feefaf44f2477c7bd587ea3.jpg', '', '', 1, 1523419236);
INSERT INTO `rk_picture` VALUES (1883, '/uploads/picture/20180411/6a1b8e6f183fa050f5ceef40c6dd86f2.jpg', '/uploads/picture/20180411/6a1b8e6f183fa050f5ceef40c6dd86f2.jpg', '', '', 1, 1523436424);
INSERT INTO `rk_picture` VALUES (1884, '/uploads/picture/20180411/03a2264a02be883b1f7b83a3da8d1d4a.jpg', '/uploads/picture/20180411/03a2264a02be883b1f7b83a3da8d1d4a.jpg', '', '', 1, 1523437528);
INSERT INTO `rk_picture` VALUES (1885, '/uploads/picture/20180411/083aadcbadbaee5ae86b4194de3228bd.jpg', '/uploads/picture/20180411/083aadcbadbaee5ae86b4194de3228bd.jpg', '', '', 1, 1523437554);
INSERT INTO `rk_picture` VALUES (1886, '/uploads/picture/20180411/57179f5ebdf67ed1b01460590cabbb34.jpg', '/uploads/picture/20180411/57179f5ebdf67ed1b01460590cabbb34.jpg', '', '', 1, 1523438952);
INSERT INTO `rk_picture` VALUES (1887, '/uploads/picture/20180411/72aab232b3638849a8e3073153aea4ed.jpg', '/uploads/picture/20180411/72aab232b3638849a8e3073153aea4ed.jpg', '', '', 1, 1523439620);
INSERT INTO `rk_picture` VALUES (1888, '/uploads/picture/20180412/add466a0b5b268e17ed85bb18caeaee0.jpg', '/uploads/picture/20180412/add466a0b5b268e17ed85bb18caeaee0.jpg', '', '', 1, 1523462743);
INSERT INTO `rk_picture` VALUES (1889, '/uploads/picture/20180412/08120719b569fe8570116ad32cc3993c.jpg', '/uploads/picture/20180412/08120719b569fe8570116ad32cc3993c.jpg', '', '', 1, 1523462774);
INSERT INTO `rk_picture` VALUES (1890, '/uploads/picture/20180412/6d0dcc6e2c3add3f989b09a636980fea.jpg', '/uploads/picture/20180412/6d0dcc6e2c3add3f989b09a636980fea.jpg', '', '', 1, 1523463409);
INSERT INTO `rk_picture` VALUES (1891, '/uploads/picture/20180412/837e69bd73b7454a2612ab50f99354c0.jpg', '/uploads/picture/20180412/837e69bd73b7454a2612ab50f99354c0.jpg', '', '', 1, 1523463470);
INSERT INTO `rk_picture` VALUES (1892, '/uploads/picture/20180412/f05b61681ee094f88db136867fc7cb6b.jpg', '/uploads/picture/20180412/f05b61681ee094f88db136867fc7cb6b.jpg', '', '', 1, 1523494295);
INSERT INTO `rk_picture` VALUES (1893, '/uploads/picture/20180412/cc6a8d262c299095d10e184fb510325d.jpg', '/uploads/picture/20180412/cc6a8d262c299095d10e184fb510325d.jpg', '', '', 1, 1523496594);
INSERT INTO `rk_picture` VALUES (1894, '/uploads/picture/20180412/df2fdcec454df6e32d09c6aeb637b18c.jpg', '/uploads/picture/20180412/df2fdcec454df6e32d09c6aeb637b18c.jpg', '', '', 1, 1523496648);
INSERT INTO `rk_picture` VALUES (1895, '/uploads/picture/20180412/b74046c7c22ecbec235b3c31da67120d.jpg', '/uploads/picture/20180412/b74046c7c22ecbec235b3c31da67120d.jpg', '', '', 1, 1523496753);
INSERT INTO `rk_picture` VALUES (1896, '/uploads/picture/20180412/ce2c504bf369a6622fac4ea0ff79fe36.jpg', '/uploads/picture/20180412/ce2c504bf369a6622fac4ea0ff79fe36.jpg', '', '', 1, 1523496879);
INSERT INTO `rk_picture` VALUES (1897, '/uploads/picture/20180412/d1a80f98bfe07b1d95f41bc6c2a463f9.jpg', '/uploads/picture/20180412/d1a80f98bfe07b1d95f41bc6c2a463f9.jpg', '', '', 1, 1523497097);
INSERT INTO `rk_picture` VALUES (1898, '/uploads/picture/20180412/aa1136d842190dc9b885461412cb54e5.jpg', '/uploads/picture/20180412/aa1136d842190dc9b885461412cb54e5.jpg', '', '', 1, 1523497121);
INSERT INTO `rk_picture` VALUES (1899, '/uploads/picture/20180412/33ad086b076c76ca580dc5bad73d0dd2.jpg', '/uploads/picture/20180412/33ad086b076c76ca580dc5bad73d0dd2.jpg', '', '', 1, 1523497181);
INSERT INTO `rk_picture` VALUES (1900, '/uploads/picture/20180412/478fc1329be752ad48dc21d54470af81.jpg', '/uploads/picture/20180412/478fc1329be752ad48dc21d54470af81.jpg', '', '', 1, 1523497398);
INSERT INTO `rk_picture` VALUES (1901, '/uploads/picture/20180412/c272f8bbad64026120ff3ee464b34a2e.jpg', '/uploads/picture/20180412/c272f8bbad64026120ff3ee464b34a2e.jpg', '', '', 1, 1523497747);
INSERT INTO `rk_picture` VALUES (1902, '/uploads/picture/20180412/6efd128053a78ebf4bc617101a4602f1.jpg', '/uploads/picture/20180412/6efd128053a78ebf4bc617101a4602f1.jpg', '', '', 1, 1523497808);
INSERT INTO `rk_picture` VALUES (1903, '/uploads/picture/20180412/00ac2a4b39f1d43f8e472bcdbf51a7ea.jpg', '/uploads/picture/20180412/00ac2a4b39f1d43f8e472bcdbf51a7ea.jpg', '', '', 1, 1523497850);
INSERT INTO `rk_picture` VALUES (1904, '/uploads/picture/20180412/0867dc65b32b63f0d0f50e646c8512e5.jpg', '/uploads/picture/20180412/0867dc65b32b63f0d0f50e646c8512e5.jpg', '', '', 1, 1523498148);
INSERT INTO `rk_picture` VALUES (1905, '/uploads/picture/20180412/39efca094cd249dc37fff94100204136.jpg', '/uploads/picture/20180412/39efca094cd249dc37fff94100204136.jpg', '', '', 1, 1523498196);
INSERT INTO `rk_picture` VALUES (1906, '/uploads/picture/20180412/21ae4e5272d8d5e36dbbb4a59cde23ad.jpg', '/uploads/picture/20180412/21ae4e5272d8d5e36dbbb4a59cde23ad.jpg', '', '', 1, 1523498431);
INSERT INTO `rk_picture` VALUES (1907, '/uploads/picture/20180412/65f9f7f8ecbff07a7edf4b99fb8eb0ab.jpg', '/uploads/picture/20180412/65f9f7f8ecbff07a7edf4b99fb8eb0ab.jpg', '', '', 1, 1523498440);
INSERT INTO `rk_picture` VALUES (1908, '/uploads/picture/20180412/89ce1c2bf0fdbe6cf4b277e08a839cca.jpg', '/uploads/picture/20180412/89ce1c2bf0fdbe6cf4b277e08a839cca.jpg', '', '', 1, 1523498557);
INSERT INTO `rk_picture` VALUES (1909, '/uploads/picture/20180412/0aa552037973012d43c279414e06ed10.jpg', '/uploads/picture/20180412/0aa552037973012d43c279414e06ed10.jpg', '', '', 1, 1523498572);
INSERT INTO `rk_picture` VALUES (1910, '/uploads/picture/20180412/e6b8f0295f3e194286cb4cea09204ff7.jpg', '/uploads/picture/20180412/e6b8f0295f3e194286cb4cea09204ff7.jpg', '', '', 1, 1523498716);
INSERT INTO `rk_picture` VALUES (1911, '/uploads/picture/20180412/39779ce43782558bd185b614df64f857.jpg', '/uploads/picture/20180412/39779ce43782558bd185b614df64f857.jpg', '', '', 1, 1523499686);
INSERT INTO `rk_picture` VALUES (1912, '/uploads/picture/20180412/6f1dd3e436224fb0428be3663227a028.jpg', '/uploads/picture/20180412/6f1dd3e436224fb0428be3663227a028.jpg', '', '', 1, 1523499709);
INSERT INTO `rk_picture` VALUES (1913, '/uploads/picture/20180412/464c2bb51af4871daadc3cc5d7e03e5d.jpg', '/uploads/picture/20180412/464c2bb51af4871daadc3cc5d7e03e5d.jpg', '', '', 1, 1523499751);
INSERT INTO `rk_picture` VALUES (1914, '/uploads/picture/20180412/eec1567cb2f1067b6df13e8430d4a8f9.png', '/uploads/picture/20180412/eec1567cb2f1067b6df13e8430d4a8f9.png', '', '', 1, 1523506067);
INSERT INTO `rk_picture` VALUES (1915, '/uploads/picture/20180412/6ec541fe3c14f2033c09f355a0e92994.png', '/uploads/picture/20180412/6ec541fe3c14f2033c09f355a0e92994.png', '', '', 1, 1523506107);
INSERT INTO `rk_picture` VALUES (1916, '/uploads/picture/20180412/eff68a78ea4bd3eaf79cd5999f894a46.jpg', '/uploads/picture/20180412/eff68a78ea4bd3eaf79cd5999f894a46.jpg', '', '', 1, 1523510020);
INSERT INTO `rk_picture` VALUES (1917, '/uploads/picture/20180412/00d269cc87ddd13603274a730fed2be8.jpg', '/uploads/picture/20180412/00d269cc87ddd13603274a730fed2be8.jpg', '', '', 1, 1523510048);
INSERT INTO `rk_picture` VALUES (1918, '/uploads/picture/20180412/6a6e2d1562cef18841622545b7b3be2a.jpg', '/uploads/picture/20180412/6a6e2d1562cef18841622545b7b3be2a.jpg', '', '', 1, 1523510602);
INSERT INTO `rk_picture` VALUES (1919, '/uploads/picture/20180412/f4bca1f05ab1c59fdeb9eb8065b6d8d8.jpg', '/uploads/picture/20180412/f4bca1f05ab1c59fdeb9eb8065b6d8d8.jpg', '', '', 1, 1523510626);
INSERT INTO `rk_picture` VALUES (1920, '/uploads/picture/20180412/8f3a8b535f567704395574ae96c60204.jpg', '/uploads/picture/20180412/8f3a8b535f567704395574ae96c60204.jpg', '', '', 1, 1523510724);
INSERT INTO `rk_picture` VALUES (1921, '/uploads/picture/20180412/615399e0dcf9f2369ddf6efda7d74ca6.jpg', '/uploads/picture/20180412/615399e0dcf9f2369ddf6efda7d74ca6.jpg', '', '', 1, 1523511070);
INSERT INTO `rk_picture` VALUES (1922, '/uploads/picture/20180412/bd0783909b29f445ce52c6f598c48dfd.jpg', '/uploads/picture/20180412/bd0783909b29f445ce52c6f598c48dfd.jpg', '', '', 1, 1523511105);
INSERT INTO `rk_picture` VALUES (1923, '/uploads/picture/20180412/c6fe9b0745c6e88bdbce315bc43f6449.jpg', '/uploads/picture/20180412/c6fe9b0745c6e88bdbce315bc43f6449.jpg', '', '', 1, 1523515215);
INSERT INTO `rk_picture` VALUES (1924, '/uploads/picture/20180412/2e2986518bae01308f27697cd10dbd7e.jpg', '/uploads/picture/20180412/2e2986518bae01308f27697cd10dbd7e.jpg', '', '', 1, 1523515635);
INSERT INTO `rk_picture` VALUES (1925, '/uploads/picture/20180412/4fbb4606363f9fa420c38c074230ca65.jpg', '/uploads/picture/20180412/4fbb4606363f9fa420c38c074230ca65.jpg', '', '', 1, 1523516103);
INSERT INTO `rk_picture` VALUES (1926, '/uploads/picture/20180412/57cb780a2c87798e1676413dae8b90f0.jpg', '/uploads/picture/20180412/57cb780a2c87798e1676413dae8b90f0.jpg', '', '', 1, 1523532713);
INSERT INTO `rk_picture` VALUES (1927, '/uploads/picture/20180412/3d8d09c0e76005407e4d9a92bbb3c220.jpg', '/uploads/picture/20180412/3d8d09c0e76005407e4d9a92bbb3c220.jpg', '', '', 1, 1523532731);
INSERT INTO `rk_picture` VALUES (1928, '/uploads/picture/20180412/f67778c7993fd582ac7612b87e64668f.jpg', '/uploads/picture/20180412/f67778c7993fd582ac7612b87e64668f.jpg', '', '', 1, 1523532883);
INSERT INTO `rk_picture` VALUES (1929, '/uploads/picture/20180413/b5681f54474cadea5da8dfe169dac7a0.jpg', '/uploads/picture/20180413/b5681f54474cadea5da8dfe169dac7a0.jpg', '', '', 1, 1523579520);
INSERT INTO `rk_picture` VALUES (1930, '/uploads/picture/20180413/6bf1f79eb48b015abd3ae2927decfba9.jpg', '/uploads/picture/20180413/6bf1f79eb48b015abd3ae2927decfba9.jpg', '', '', 1, 1523580097);
INSERT INTO `rk_picture` VALUES (1931, '/uploads/picture/20180413/3d0a91b4fa3037244a75e28f5fcb12c1.jpg', '/uploads/picture/20180413/3d0a91b4fa3037244a75e28f5fcb12c1.jpg', '', '', 1, 1523580154);
INSERT INTO `rk_picture` VALUES (1932, '/uploads/picture/20180413/6ee659f33453cb2b51be6d8699bf7cd9.jpg', '/uploads/picture/20180413/6ee659f33453cb2b51be6d8699bf7cd9.jpg', '', '', 1, 1523580176);
INSERT INTO `rk_picture` VALUES (1933, '/uploads/picture/20180413/6aa844a4dfbbbc693db3e6aac9ff0489.jpg', '/uploads/picture/20180413/6aa844a4dfbbbc693db3e6aac9ff0489.jpg', '', '', 1, 1523580372);
INSERT INTO `rk_picture` VALUES (1934, '/uploads/picture/20180413/87a8adf4dd4a71d548490fbc763e97d8.jpg', '/uploads/picture/20180413/87a8adf4dd4a71d548490fbc763e97d8.jpg', '', '', 1, 1523582351);
INSERT INTO `rk_picture` VALUES (1935, '/uploads/picture/20180413/777d6c95cef0dba85bd41e094039ba17.jpg', '/uploads/picture/20180413/777d6c95cef0dba85bd41e094039ba17.jpg', '', '', 1, 1523587027);
INSERT INTO `rk_picture` VALUES (1936, '/uploads/picture/20180413/db1351000d148f9c8f949be3765367a4.jpg', '/uploads/picture/20180413/db1351000d148f9c8f949be3765367a4.jpg', '', '', 1, 1523604092);
INSERT INTO `rk_picture` VALUES (1937, '/uploads/picture/20180413/b116691b2ddb18d87e464751dd5e1dd7.jpg', '/uploads/picture/20180413/b116691b2ddb18d87e464751dd5e1dd7.jpg', '', '', 1, 1523604246);
INSERT INTO `rk_picture` VALUES (1938, '/uploads/picture/20180413/d1c0ed519ca9ae8c16093f7e1eaed839.jpg', '/uploads/picture/20180413/d1c0ed519ca9ae8c16093f7e1eaed839.jpg', '', '', 1, 1523604684);
INSERT INTO `rk_picture` VALUES (1939, '/uploads/picture/20180413/19536bd16beb067ef3b157cf784227d5.jpg', '/uploads/picture/20180413/19536bd16beb067ef3b157cf784227d5.jpg', '', '', 1, 1523604845);
INSERT INTO `rk_picture` VALUES (1940, '/uploads/picture/20180413/9c10f495432805b4317a2092c64f211c.jpg', '/uploads/picture/20180413/9c10f495432805b4317a2092c64f211c.jpg', '', '', 1, 1523605355);
INSERT INTO `rk_picture` VALUES (1941, '/uploads/picture/20180413/d1dacd1afba1d57d41e8c33da8a3b96f.jpg', '/uploads/picture/20180413/d1dacd1afba1d57d41e8c33da8a3b96f.jpg', '', '', 1, 1523605401);
INSERT INTO `rk_picture` VALUES (1942, '/uploads/picture/20180413/2144d72f24da100d50df7ee6d7ab6213.jpg', '/uploads/picture/20180413/2144d72f24da100d50df7ee6d7ab6213.jpg', '', '', 1, 1523605487);
INSERT INTO `rk_picture` VALUES (1943, '/uploads/picture/20180413/511b78a1dd4c72ede2d579d7684a57f4.jpg', '/uploads/picture/20180413/511b78a1dd4c72ede2d579d7684a57f4.jpg', '', '', 1, 1523605512);
INSERT INTO `rk_picture` VALUES (1944, '/uploads/picture/20180413/71f70e59f09fcdfccf310a1119d025bb.jpg', '/uploads/picture/20180413/71f70e59f09fcdfccf310a1119d025bb.jpg', '', '', 1, 1523606007);
INSERT INTO `rk_picture` VALUES (1945, '/uploads/picture/20180413/51c6fc066175d5f7f00e751fd519266f.jpg', '/uploads/picture/20180413/51c6fc066175d5f7f00e751fd519266f.jpg', '', '', 1, 1523607934);
INSERT INTO `rk_picture` VALUES (1946, '/uploads/picture/20180413/663dcd1c4fdfcc9e45a7052ee352c1b5.jpg', '/uploads/picture/20180413/663dcd1c4fdfcc9e45a7052ee352c1b5.jpg', '', '', 1, 1523607981);
INSERT INTO `rk_picture` VALUES (1947, '/uploads/picture/20180413/fed07e0cc7b2343d2813e6267ae708db.jpg', '/uploads/picture/20180413/fed07e0cc7b2343d2813e6267ae708db.jpg', '', '', 1, 1523608415);
INSERT INTO `rk_picture` VALUES (1948, '/uploads/picture/20180414/6a267cf798e56493251bc18e19b6afa3.jpg', '/uploads/picture/20180414/6a267cf798e56493251bc18e19b6afa3.jpg', '', '', 1, 1523638310);
INSERT INTO `rk_picture` VALUES (1949, '/uploads/picture/20180414/3dd07e1289f6cbc8bcbad47d5867a0b8.jpg', '/uploads/picture/20180414/3dd07e1289f6cbc8bcbad47d5867a0b8.jpg', '', '', 1, 1523638322);
INSERT INTO `rk_picture` VALUES (1950, '/uploads/picture/20180414/60af71a4e5ae2460e95dad96b81d5538.jpg', '/uploads/picture/20180414/60af71a4e5ae2460e95dad96b81d5538.jpg', '', '', 1, 1523708563);
INSERT INTO `rk_picture` VALUES (1951, '/uploads/picture/20180414/509670fb044c0f15b2ea6cae62f1839c.jpg', '/uploads/picture/20180414/509670fb044c0f15b2ea6cae62f1839c.jpg', '', '', 1, 1523708668);
INSERT INTO `rk_picture` VALUES (1952, '/uploads/picture/20180415/e122d0ecf20d33b62b9691966d84a05c.jpg', '/uploads/picture/20180415/e122d0ecf20d33b62b9691966d84a05c.jpg', '', '', 1, 1523800319);
INSERT INTO `rk_picture` VALUES (1953, '/uploads/picture/20180416/50e2c44a069a5bf7353e8a8a2d6db2da.jpg', '/uploads/picture/20180416/50e2c44a069a5bf7353e8a8a2d6db2da.jpg', '', '', 1, 1523858998);
INSERT INTO `rk_picture` VALUES (1954, '/uploads/picture/20180416/d5a5f92c8d259b523c785db067c1f38d.jpg', '/uploads/picture/20180416/d5a5f92c8d259b523c785db067c1f38d.jpg', '', '', 1, 1523859045);
INSERT INTO `rk_picture` VALUES (1955, '/uploads/picture/20180416/e2c4c3e9c5ca013b54b9bff6deb2bade.png', '/uploads/picture/20180416/e2c4c3e9c5ca013b54b9bff6deb2bade.png', '', '', 1, 1523876122);
INSERT INTO `rk_picture` VALUES (1956, '/uploads/picture/20180416/7a97008f80cdc9b2273797c3614c04e8.png', '/uploads/picture/20180416/7a97008f80cdc9b2273797c3614c04e8.png', '', '', 1, 1523876188);
INSERT INTO `rk_picture` VALUES (1957, '/uploads/picture/20180416/ba62c5c7ef5c411f397519c0d84a27c0.png', '/uploads/picture/20180416/ba62c5c7ef5c411f397519c0d84a27c0.png', '', '', 1, 1523876233);
INSERT INTO `rk_picture` VALUES (1958, '/uploads/picture/20180417/0d477abdaddeaec19975a54308871fcd.png', '/uploads/picture/20180417/0d477abdaddeaec19975a54308871fcd.png', '', '', 1, 1523924977);
INSERT INTO `rk_picture` VALUES (1959, '/uploads/picture/20180417/59b95ffa956e27f6169c23e0cd4ef20d.jpg', '/uploads/picture/20180417/59b95ffa956e27f6169c23e0cd4ef20d.jpg', '', '', 1, 1523958723);
INSERT INTO `rk_picture` VALUES (1960, '/uploads/picture/20180417/2eeb4f2646e5969b8cbbaf06fd78b3e4.jpg', '/uploads/picture/20180417/2eeb4f2646e5969b8cbbaf06fd78b3e4.jpg', '', '', 1, 1523958860);
INSERT INTO `rk_picture` VALUES (1961, '/uploads/picture/20180417/f864d5c2421ed8a36a4ceecda714e404.jpg', '/uploads/picture/20180417/f864d5c2421ed8a36a4ceecda714e404.jpg', '', '', 1, 1523959046);
INSERT INTO `rk_picture` VALUES (1962, '/uploads/picture/20180417/853b3b0db65e8307e7e90f0226bee128.jpg', '/uploads/picture/20180417/853b3b0db65e8307e7e90f0226bee128.jpg', '', '', 1, 1523959076);
INSERT INTO `rk_picture` VALUES (1963, '/uploads/picture/20180417/66081aa4bb96f7b73f347dec2852df9f.jpg', '/uploads/picture/20180417/66081aa4bb96f7b73f347dec2852df9f.jpg', '', '', 1, 1523959149);
INSERT INTO `rk_picture` VALUES (1964, '/uploads/picture/20180417/c86e923b692907bcbf8aad90eae3e3cf.jpg', '/uploads/picture/20180417/c86e923b692907bcbf8aad90eae3e3cf.jpg', '', '', 1, 1523959185);
INSERT INTO `rk_picture` VALUES (1965, '/uploads/picture/20180417/c257afa5478ad2b8d36b3dc6006bd8ea.jpg', '/uploads/picture/20180417/c257afa5478ad2b8d36b3dc6006bd8ea.jpg', '', '', 1, 1523959266);
INSERT INTO `rk_picture` VALUES (1966, '/uploads/picture/20180417/2f2c3c95dd9563ac5001f66a8f7216ec.jpg', '/uploads/picture/20180417/2f2c3c95dd9563ac5001f66a8f7216ec.jpg', '', '', 1, 1523959638);
INSERT INTO `rk_picture` VALUES (1967, '/uploads/picture/20180417/6409da2cc77909ff0f005ef436ef6a0f.jpg', '/uploads/picture/20180417/6409da2cc77909ff0f005ef436ef6a0f.jpg', '', '', 1, 1523959781);
INSERT INTO `rk_picture` VALUES (1968, '/uploads/picture/20180417/7d24772b997bb47e91e4b4d5dad832d9.jpg', '/uploads/picture/20180417/7d24772b997bb47e91e4b4d5dad832d9.jpg', '', '', 1, 1523959805);
INSERT INTO `rk_picture` VALUES (1969, '/uploads/picture/20180417/fe17fd0802eff3158b2c3d23c4a27401.jpg', '/uploads/picture/20180417/fe17fd0802eff3158b2c3d23c4a27401.jpg', '', '', 1, 1523959834);
INSERT INTO `rk_picture` VALUES (1970, '/uploads/picture/20180417/395639c5fc7b5ca6ffecd514e3597057.jpg', '/uploads/picture/20180417/395639c5fc7b5ca6ffecd514e3597057.jpg', '', '', 1, 1523959856);
INSERT INTO `rk_picture` VALUES (1971, '/uploads/picture/20180417/19c609282eb8220fe5d4f4d77aa508a9.jpg', '/uploads/picture/20180417/19c609282eb8220fe5d4f4d77aa508a9.jpg', '', '', 1, 1523959941);
INSERT INTO `rk_picture` VALUES (1972, '/uploads/picture/20180417/a0fe3feff4d451655d812c950d5207bc.jpg', '/uploads/picture/20180417/a0fe3feff4d451655d812c950d5207bc.jpg', '', '', 1, 1523959986);
INSERT INTO `rk_picture` VALUES (1973, '/uploads/picture/20180417/6adaf4f8a6823eeda56d3164a0a49ff5.jpg', '/uploads/picture/20180417/6adaf4f8a6823eeda56d3164a0a49ff5.jpg', '', '', 1, 1523960181);
INSERT INTO `rk_picture` VALUES (1974, '/uploads/picture/20180417/3d5072aec39400893ed88a338c9ebad3.jpg', '/uploads/picture/20180417/3d5072aec39400893ed88a338c9ebad3.jpg', '', '', 1, 1523960207);
INSERT INTO `rk_picture` VALUES (1975, '/uploads/picture/20180417/8a3b596634ec4e2d7ee9ea58de15c38c.jpg', '/uploads/picture/20180417/8a3b596634ec4e2d7ee9ea58de15c38c.jpg', '', '', 1, 1523960253);
INSERT INTO `rk_picture` VALUES (1976, '/uploads/picture/20180417/f2a73e7df6a9aa35f9ca3b3879122afb.jpg', '/uploads/picture/20180417/f2a73e7df6a9aa35f9ca3b3879122afb.jpg', '', '', 1, 1523960410);
INSERT INTO `rk_picture` VALUES (1977, '/uploads/picture/20180417/c1fce3987c68664f955db172fbcc2abf.jpg', '/uploads/picture/20180417/c1fce3987c68664f955db172fbcc2abf.jpg', '', '', 1, 1523960464);
INSERT INTO `rk_picture` VALUES (1978, '/uploads/picture/20180417/70acb72d776ff822afd2957ba407789f.jpg', '/uploads/picture/20180417/70acb72d776ff822afd2957ba407789f.jpg', '', '', 1, 1523960486);
INSERT INTO `rk_picture` VALUES (1979, '/uploads/picture/20180418/6d26ef66b3d6ca220f0768ff3cb29b7b.jpg', '/uploads/picture/20180418/6d26ef66b3d6ca220f0768ff3cb29b7b.jpg', '', '', 1, 1524006800);
INSERT INTO `rk_picture` VALUES (1980, '/uploads/picture/20180418/00415b714c32dac5d36a152bf6ca04d5.jpg', '/uploads/picture/20180418/00415b714c32dac5d36a152bf6ca04d5.jpg', '', '', 1, 1524006823);
INSERT INTO `rk_picture` VALUES (1981, '/uploads/picture/20180418/3dfba4dda8afed07d2a2bbfe134aa530.jpg', '/uploads/picture/20180418/3dfba4dda8afed07d2a2bbfe134aa530.jpg', '', '', 1, 1524010964);
INSERT INTO `rk_picture` VALUES (1982, '/uploads/picture/20180418/5d1bff1ace8688657b293e2a9b054338.jpg', '/uploads/picture/20180418/5d1bff1ace8688657b293e2a9b054338.jpg', '', '', 1, 1524011442);
INSERT INTO `rk_picture` VALUES (1983, '/uploads/picture/20180418/c5b5753cf3ac0dc11136a0e7d756811e.jpg', '/uploads/picture/20180418/c5b5753cf3ac0dc11136a0e7d756811e.jpg', '', '', 1, 1524014264);
INSERT INTO `rk_picture` VALUES (1984, '/uploads/picture/20180418/b6ec3a73f73037f405fa3e4442fca31b.jpg', '/uploads/picture/20180418/b6ec3a73f73037f405fa3e4442fca31b.jpg', '', '', 1, 1524016385);
INSERT INTO `rk_picture` VALUES (1985, '/uploads/picture/20180418/b6034bfa8b9ea83390959213590d9cfe.jpg', '/uploads/picture/20180418/b6034bfa8b9ea83390959213590d9cfe.jpg', '', '', 1, 1524016415);
INSERT INTO `rk_picture` VALUES (1986, '/uploads/picture/20180418/5fc90c1071bc24fff26685df4a1a38b7.jpg', '/uploads/picture/20180418/5fc90c1071bc24fff26685df4a1a38b7.jpg', '', '', 1, 1524017085);
INSERT INTO `rk_picture` VALUES (1987, '/uploads/picture/20180418/0878bcc9ed43f92cf892e0354695d620.jpg', '/uploads/picture/20180418/0878bcc9ed43f92cf892e0354695d620.jpg', '', '', 1, 1524017250);
INSERT INTO `rk_picture` VALUES (1988, '/uploads/picture/20180418/28d19df65e95e869c82d667d1d563a5c.jpg', '/uploads/picture/20180418/28d19df65e95e869c82d667d1d563a5c.jpg', '', '', 1, 1524017287);
INSERT INTO `rk_picture` VALUES (1989, '/uploads/picture/20180418/406ae5e18dae5aa4f0ed2efc38fd5668.jpg', '/uploads/picture/20180418/406ae5e18dae5aa4f0ed2efc38fd5668.jpg', '', '', 1, 1524017553);
INSERT INTO `rk_picture` VALUES (1990, '/uploads/picture/20180418/25741492947e185b7a50e945dd9db4aa.jpg', '/uploads/picture/20180418/25741492947e185b7a50e945dd9db4aa.jpg', '', '', 1, 1524017773);
INSERT INTO `rk_picture` VALUES (1991, '/uploads/picture/20180418/ed39c71398651b0329c7feb87733552c.jpg', '/uploads/picture/20180418/ed39c71398651b0329c7feb87733552c.jpg', '', '', 1, 1524020571);
INSERT INTO `rk_picture` VALUES (1992, '/uploads/picture/20180418/756909c10f61f3515a25060b7c10c5cf.jpg', '/uploads/picture/20180418/756909c10f61f3515a25060b7c10c5cf.jpg', '', '', 1, 1524021351);
INSERT INTO `rk_picture` VALUES (1993, '/uploads/picture/20180418/1f6b87f196d73f644ff8c8efaa7f3408.jpg', '/uploads/picture/20180418/1f6b87f196d73f644ff8c8efaa7f3408.jpg', '', '', 1, 1524051840);
INSERT INTO `rk_picture` VALUES (1994, '/uploads/picture/20180418/7d467996b8c5e7c373dd34c70673d39f.jpg', '/uploads/picture/20180418/7d467996b8c5e7c373dd34c70673d39f.jpg', '', '', 1, 1524051864);
INSERT INTO `rk_picture` VALUES (1995, '/uploads/picture/20180418/958edf2bb95e6037b3988285254e731a.jpg', '/uploads/picture/20180418/958edf2bb95e6037b3988285254e731a.jpg', '', '', 1, 1524052278);
INSERT INTO `rk_picture` VALUES (1996, '/uploads/picture/20180418/b782f27714981884cecd1fd999974d6f.jpg', '/uploads/picture/20180418/b782f27714981884cecd1fd999974d6f.jpg', '', '', 1, 1524052330);
INSERT INTO `rk_picture` VALUES (1997, '/uploads/picture/20180418/09763aeae62ea5d1ef168962c13eed2b.jpg', '/uploads/picture/20180418/09763aeae62ea5d1ef168962c13eed2b.jpg', '', '', 1, 1524052795);
INSERT INTO `rk_picture` VALUES (1998, '/uploads/picture/20180418/a2a616b967cce9cc0abce0d0f747c734.jpg', '/uploads/picture/20180418/a2a616b967cce9cc0abce0d0f747c734.jpg', '', '', 1, 1524052822);
INSERT INTO `rk_picture` VALUES (1999, '/uploads/picture/20180418/826c273691c4d0989379dc8d45793274.jpg', '/uploads/picture/20180418/826c273691c4d0989379dc8d45793274.jpg', '', '', 1, 1524052847);
INSERT INTO `rk_picture` VALUES (2000, '/uploads/picture/20180418/ef385f664898e9e4d121bba31261b994.jpg', '/uploads/picture/20180418/ef385f664898e9e4d121bba31261b994.jpg', '', '', 1, 1524052968);
INSERT INTO `rk_picture` VALUES (2001, '/uploads/picture/20180418/b7d4fe778bcde013b27415491d79eb14.jpg', '/uploads/picture/20180418/b7d4fe778bcde013b27415491d79eb14.jpg', '', '', 1, 1524053473);
INSERT INTO `rk_picture` VALUES (2002, '/uploads/picture/20180418/10dc14b58fbc535a28b7757869608749.jpg', '/uploads/picture/20180418/10dc14b58fbc535a28b7757869608749.jpg', '', '', 1, 1524054633);
INSERT INTO `rk_picture` VALUES (2003, '/uploads/picture/20180418/e09919ea7ba0d49d5a64fe02289b9573.jpg', '/uploads/picture/20180418/e09919ea7ba0d49d5a64fe02289b9573.jpg', '', '', 1, 1524054662);
INSERT INTO `rk_picture` VALUES (2004, '/uploads/picture/20180418/69a10e23c01f6dcd7b9e451d6019a286.jpg', '/uploads/picture/20180418/69a10e23c01f6dcd7b9e451d6019a286.jpg', '', '', 1, 1524057202);
INSERT INTO `rk_picture` VALUES (2005, '/uploads/picture/20180418/18067a729541de9316cf257edbea7a01.jpg', '/uploads/picture/20180418/18067a729541de9316cf257edbea7a01.jpg', '', '', 1, 1524057226);
INSERT INTO `rk_picture` VALUES (2006, '/uploads/picture/20180419/b7bf7deef6c852e9a0b21a130ede6a2a.jpg', '/uploads/picture/20180419/b7bf7deef6c852e9a0b21a130ede6a2a.jpg', '', '', 1, 1524098573);
INSERT INTO `rk_picture` VALUES (2007, '/uploads/picture/20180419/f0eeb8ae2d197de27620c98a7df7fba1.jpg', '/uploads/picture/20180419/f0eeb8ae2d197de27620c98a7df7fba1.jpg', '', '', 1, 1524098640);
INSERT INTO `rk_picture` VALUES (2008, '/uploads/picture/20180419/eb35f74ce4fdc9aa72306355475b2545.jpg', '/uploads/picture/20180419/eb35f74ce4fdc9aa72306355475b2545.jpg', '', '', 1, 1524119632);
INSERT INTO `rk_picture` VALUES (2009, '/uploads/picture/20180419/44ac9192428f8a3b0338edf9b7bfa911.jpg', '/uploads/picture/20180419/44ac9192428f8a3b0338edf9b7bfa911.jpg', '', '', 1, 1524119641);
INSERT INTO `rk_picture` VALUES (2010, '/uploads/picture/20180419/61e59fd0e1dca6acd025002037490f71.jpg', '/uploads/picture/20180419/61e59fd0e1dca6acd025002037490f71.jpg', '', '', 1, 1524134935);
INSERT INTO `rk_picture` VALUES (2011, '/uploads/picture/20180419/88a090ea095e12e940bea64365d9e5a0.jpg', '/uploads/picture/20180419/88a090ea095e12e940bea64365d9e5a0.jpg', '', '', 1, 1524134966);
INSERT INTO `rk_picture` VALUES (2012, '/uploads/picture/20180419/9b3d1d8838739cf861cc850ead81a7c5.jpg', '/uploads/picture/20180419/9b3d1d8838739cf861cc850ead81a7c5.jpg', '', '', 1, 1524135029);
INSERT INTO `rk_picture` VALUES (2013, '/uploads/picture/20180419/9a5238a9e1a600f95a0da2a72b826bcc.jpg', '/uploads/picture/20180419/9a5238a9e1a600f95a0da2a72b826bcc.jpg', '', '', 1, 1524135068);
INSERT INTO `rk_picture` VALUES (2014, '/uploads/picture/20180419/e1fe4c217a841dc43b38aabed20802cd.jpg', '/uploads/picture/20180419/e1fe4c217a841dc43b38aabed20802cd.jpg', '', '', 1, 1524135090);
INSERT INTO `rk_picture` VALUES (2015, '/uploads/picture/20180419/947182ce41ee5e749b99871aa70bccd3.jpg', '/uploads/picture/20180419/947182ce41ee5e749b99871aa70bccd3.jpg', '', '', 1, 1524135124);
INSERT INTO `rk_picture` VALUES (2016, '/uploads/picture/20180419/c35ac28604baff314825e2ad1ac43d72.jpg', '/uploads/picture/20180419/c35ac28604baff314825e2ad1ac43d72.jpg', '', '', 1, 1524135141);
INSERT INTO `rk_picture` VALUES (2017, '/uploads/picture/20180419/af84f611e06511ba897324a211167ec3.jpg', '/uploads/picture/20180419/af84f611e06511ba897324a211167ec3.jpg', '', '', 1, 1524135170);
INSERT INTO `rk_picture` VALUES (2018, '/uploads/picture/20180420/87c4aee6f1525f7ac3faa6c173f43e9f.jpg', '/uploads/picture/20180420/87c4aee6f1525f7ac3faa6c173f43e9f.jpg', '', '', 1, 1524206830);
INSERT INTO `rk_picture` VALUES (2019, '/uploads/picture/20180421/f7b984bc562cd0f1af8c4915ef9a5d71.jpg', '/uploads/picture/20180421/f7b984bc562cd0f1af8c4915ef9a5d71.jpg', '', '', 1, 1524240626);
INSERT INTO `rk_picture` VALUES (2020, '/uploads/picture/20180421/fd456fedae339b633d87a280cac02a4f.jpg', '/uploads/picture/20180421/fd456fedae339b633d87a280cac02a4f.jpg', '', '', 1, 1524240671);
INSERT INTO `rk_picture` VALUES (2021, '/uploads/picture/20180422/0555670fe004800746c81f43a7ab1c32.jpg', '/uploads/picture/20180422/0555670fe004800746c81f43a7ab1c32.jpg', '', '', 1, 1524357133);
INSERT INTO `rk_picture` VALUES (2022, '/uploads/picture/20180422/50fea11b448f79b73f8b2d12528f0d9e.jpg', '/uploads/picture/20180422/50fea11b448f79b73f8b2d12528f0d9e.jpg', '', '', 1, 1524357266);
INSERT INTO `rk_picture` VALUES (2023, '/uploads/picture/20180422/0f80433c0689fe72f544f96e15d78088.jpg', '/uploads/picture/20180422/0f80433c0689fe72f544f96e15d78088.jpg', '', '', 1, 1524357537);
INSERT INTO `rk_picture` VALUES (2024, '/uploads/picture/20180422/b0aa222907eccae332d0683edb4ce787.jpg', '/uploads/picture/20180422/b0aa222907eccae332d0683edb4ce787.jpg', '', '', 1, 1524357596);
INSERT INTO `rk_picture` VALUES (2025, '/uploads/picture/20180422/780def1150242c1524c1201db34f14ef.jpg', '/uploads/picture/20180422/780def1150242c1524c1201db34f14ef.jpg', '', '', 1, 1524358120);
INSERT INTO `rk_picture` VALUES (2026, '/uploads/picture/20180422/f55b24345bb30c5445ac5c88dbcc3cf4.jpg', '/uploads/picture/20180422/f55b24345bb30c5445ac5c88dbcc3cf4.jpg', '', '', 1, 1524358916);
INSERT INTO `rk_picture` VALUES (2027, '/uploads/picture/20180422/47a0ca2a082ad2a1c624efa6bebac17b.jpg', '/uploads/picture/20180422/47a0ca2a082ad2a1c624efa6bebac17b.jpg', '', '', 1, 1524359042);
INSERT INTO `rk_picture` VALUES (2028, '/uploads/picture/20180422/c3662d1497211cd289edc423c8e0b047.jpg', '/uploads/picture/20180422/c3662d1497211cd289edc423c8e0b047.jpg', '', '', 1, 1524362877);
INSERT INTO `rk_picture` VALUES (2029, '/uploads/picture/20180423/2d59ad990620a4d0738cba9062e063c4.png', '/uploads/picture/20180423/2d59ad990620a4d0738cba9062e063c4.png', '', '', 1, 1524475894);
INSERT INTO `rk_picture` VALUES (2030, '/uploads/picture/20180423/31b87d4d4e51438f97658a1d3d919564.png', '/uploads/picture/20180423/31b87d4d4e51438f97658a1d3d919564.png', '', '', 1, 1524475922);
INSERT INTO `rk_picture` VALUES (2031, '/uploads/picture/20180423/ac1fcf93e6128f26dfee86d294554460.png', '/uploads/picture/20180423/ac1fcf93e6128f26dfee86d294554460.png', '', '', 1, 1524476334);
INSERT INTO `rk_picture` VALUES (2032, '/uploads/picture/20180423/1cca208e0abab938e570767f06b9f919.png', '/uploads/picture/20180423/1cca208e0abab938e570767f06b9f919.png', '', '', 1, 1524476379);
INSERT INTO `rk_picture` VALUES (2033, '/uploads/picture/20180423/2142118c4b262ac3336ba152dfd01d2a.png', '/uploads/picture/20180423/2142118c4b262ac3336ba152dfd01d2a.png', '', '', 1, 1524476452);
INSERT INTO `rk_picture` VALUES (2034, '/uploads/picture/20180423/68c21864fbc59c46cd19c141d3effbbf.png', '/uploads/picture/20180423/68c21864fbc59c46cd19c141d3effbbf.png', '', '', 1, 1524476485);
INSERT INTO `rk_picture` VALUES (2035, '/uploads/picture/20180423/9a24ab3de943c7b7f64d19464be997b9.png', '/uploads/picture/20180423/9a24ab3de943c7b7f64d19464be997b9.png', '', '', 1, 1524476507);
INSERT INTO `rk_picture` VALUES (2036, '/uploads/picture/20180423/8b0b16ae908aebaac14b96d95be38ee1.png', '/uploads/picture/20180423/8b0b16ae908aebaac14b96d95be38ee1.png', '', '', 1, 1524476612);
INSERT INTO `rk_picture` VALUES (2037, '/uploads/picture/20180424/a10cb4820f0b8d8de564b104e1c002ea.jpg', '/uploads/picture/20180424/a10cb4820f0b8d8de564b104e1c002ea.jpg', '', '', 1, 1524575456);
INSERT INTO `rk_picture` VALUES (2038, '/uploads/picture/20180424/5d846f761064e6a07479658764822b65.jpg', '/uploads/picture/20180424/5d846f761064e6a07479658764822b65.jpg', '', '', 1, 1524575485);
INSERT INTO `rk_picture` VALUES (2039, '/uploads/picture/20180424/5d846f761064e6a07479658764822b65.jpg', '/uploads/picture/20180424/5d846f761064e6a07479658764822b65.jpg', '', '', 1, 1524575485);
INSERT INTO `rk_picture` VALUES (2040, '/uploads/picture/20180424/0f2846fea282c85b7fbc5f824482040f.jpg', '/uploads/picture/20180424/0f2846fea282c85b7fbc5f824482040f.jpg', '', '', 1, 1524575505);
INSERT INTO `rk_picture` VALUES (2041, '/uploads/picture/20180424/3c83e9a0b0358ca53cb3a9f9f4f13d42.jpg', '/uploads/picture/20180424/3c83e9a0b0358ca53cb3a9f9f4f13d42.jpg', '', '', 1, 1524575535);
INSERT INTO `rk_picture` VALUES (2042, '/uploads/picture/20180424/683a688a2ba25053c43eeb07dd118fdf.jpg', '/uploads/picture/20180424/683a688a2ba25053c43eeb07dd118fdf.jpg', '', '', 1, 1524577043);
INSERT INTO `rk_picture` VALUES (2043, '/uploads/picture/20180425/eb238d36e628457ea58c9c1ba9bc95ac.jpg', '/uploads/picture/20180425/eb238d36e628457ea58c9c1ba9bc95ac.jpg', '', '', 1, 1524616676);
INSERT INTO `rk_picture` VALUES (2044, '/uploads/picture/20180425/3399140dfc571e87898bf34cd0aef25a.jpg', '/uploads/picture/20180425/3399140dfc571e87898bf34cd0aef25a.jpg', '', '', 1, 1524616775);
INSERT INTO `rk_picture` VALUES (2045, '/uploads/picture/20180425/969daf33ba4287b70b5f4eafc11946eb.jpg', '/uploads/picture/20180425/969daf33ba4287b70b5f4eafc11946eb.jpg', '', '', 1, 1524616990);
INSERT INTO `rk_picture` VALUES (2046, '/uploads/picture/20180425/00bf571cd0808e31e42e01655185c671.jpg', '/uploads/picture/20180425/00bf571cd0808e31e42e01655185c671.jpg', '', '', 1, 1524622456);
INSERT INTO `rk_picture` VALUES (2047, '/uploads/picture/20180425/ae6491a41a3b30d8c7a03f2293478540.jpg', '/uploads/picture/20180425/ae6491a41a3b30d8c7a03f2293478540.jpg', '', '', 1, 1524622787);
INSERT INTO `rk_picture` VALUES (2048, '/uploads/picture/20180425/ceef4b033b6a1319457fc4379712eed5.jpg', '/uploads/picture/20180425/ceef4b033b6a1319457fc4379712eed5.jpg', '', '', 1, 1524622796);
INSERT INTO `rk_picture` VALUES (2049, '/uploads/picture/20180425/5c270257951998b5e14dedf941e4c3c0.jpg', '/uploads/picture/20180425/5c270257951998b5e14dedf941e4c3c0.jpg', '', '', 1, 1524622813);
INSERT INTO `rk_picture` VALUES (2050, '/uploads/picture/20180425/ca4d8a7764e4654cdedf5ee8519f94a0.jpg', '/uploads/picture/20180425/ca4d8a7764e4654cdedf5ee8519f94a0.jpg', '', '', 1, 1524623236);
INSERT INTO `rk_picture` VALUES (2051, '/uploads/picture/20180425/f5afb889dee22acfab9f45ed9e9e8e8f.jpg', '/uploads/picture/20180425/f5afb889dee22acfab9f45ed9e9e8e8f.jpg', '', '', 1, 1524623299);
INSERT INTO `rk_picture` VALUES (2052, '/uploads/picture/20180425/3051e4375c2b3e1bae024420f9837c64.jpg', '/uploads/picture/20180425/3051e4375c2b3e1bae024420f9837c64.jpg', '', '', 1, 1524623382);
INSERT INTO `rk_picture` VALUES (2053, '/uploads/picture/20180425/ab45450299520679254549dce0d573a7.jpg', '/uploads/picture/20180425/ab45450299520679254549dce0d573a7.jpg', '', '', 1, 1524623448);
INSERT INTO `rk_picture` VALUES (2054, '/uploads/picture/20180425/6fee6f6122511f73253b6038cf7ddb48.jpg', '/uploads/picture/20180425/6fee6f6122511f73253b6038cf7ddb48.jpg', '', '', 1, 1524623663);
INSERT INTO `rk_picture` VALUES (2055, '/uploads/picture/20180425/135f0d8e6c2f5a3224534c3e36cf3d20.jpg', '/uploads/picture/20180425/135f0d8e6c2f5a3224534c3e36cf3d20.jpg', '', '', 1, 1524623693);
INSERT INTO `rk_picture` VALUES (2056, '/uploads/picture/20180425/bef4733ff83033052f191fc7aa3560dc.jpg', '/uploads/picture/20180425/bef4733ff83033052f191fc7aa3560dc.jpg', '', '', 1, 1524623970);
INSERT INTO `rk_picture` VALUES (2057, '/uploads/picture/20180425/03598f85aad4dc12da43b402c31b8f0d.jpg', '/uploads/picture/20180425/03598f85aad4dc12da43b402c31b8f0d.jpg', '', '', 1, 1524623974);
INSERT INTO `rk_picture` VALUES (2058, '/uploads/picture/20180425/b43e223ce5e8c83773e4f537164923cd.jpg', '/uploads/picture/20180425/b43e223ce5e8c83773e4f537164923cd.jpg', '', '', 1, 1524623978);
INSERT INTO `rk_picture` VALUES (2059, '/uploads/picture/20180425/e8e3a9238d19b561ad3e31e786904a3b.jpg', '/uploads/picture/20180425/e8e3a9238d19b561ad3e31e786904a3b.jpg', '', '', 1, 1524623991);
INSERT INTO `rk_picture` VALUES (2060, '/uploads/picture/20180425/d31f06de7ab1957bcf67ce6dbde8af3a.jpg', '/uploads/picture/20180425/d31f06de7ab1957bcf67ce6dbde8af3a.jpg', '', '', 1, 1524624005);
INSERT INTO `rk_picture` VALUES (2061, '/uploads/picture/20180425/ecb3f9bf58c07534d7547cae4416f578.jpg', '/uploads/picture/20180425/ecb3f9bf58c07534d7547cae4416f578.jpg', '', '', 1, 1524624017);
INSERT INTO `rk_picture` VALUES (2062, '/uploads/picture/20180425/7ce9777abd242333a4f8562f717ee2f5.jpg', '/uploads/picture/20180425/7ce9777abd242333a4f8562f717ee2f5.jpg', '', '', 1, 1524624026);
INSERT INTO `rk_picture` VALUES (2063, '/uploads/picture/20180425/158576083ee439347b6b493f1ae8f27f.jpg', '/uploads/picture/20180425/158576083ee439347b6b493f1ae8f27f.jpg', '', '', 1, 1524624165);
INSERT INTO `rk_picture` VALUES (2064, '/uploads/picture/20180425/ad17995ee8398f46b361d26fcb843d47.jpg', '/uploads/picture/20180425/ad17995ee8398f46b361d26fcb843d47.jpg', '', '', 1, 1524624327);
INSERT INTO `rk_picture` VALUES (2065, '/uploads/picture/20180425/6ca519ff46487647d6edb57003ad0a3d.jpg', '/uploads/picture/20180425/6ca519ff46487647d6edb57003ad0a3d.jpg', '', '', 1, 1524625018);
INSERT INTO `rk_picture` VALUES (2066, '/uploads/picture/20180425/bd1009f234d7b2b3b2d2de33e99df991.jpg', '/uploads/picture/20180425/bd1009f234d7b2b3b2d2de33e99df991.jpg', '', '', 1, 1524625030);
INSERT INTO `rk_picture` VALUES (2067, '/uploads/picture/20180425/a67b757a07a12e91df0a428331f2ca34.jpg', '/uploads/picture/20180425/a67b757a07a12e91df0a428331f2ca34.jpg', '', '', 1, 1524625035);
INSERT INTO `rk_picture` VALUES (2068, '/uploads/picture/20180425/6632e33a360fbc3af2f037a089218a1d.jpg', '/uploads/picture/20180425/6632e33a360fbc3af2f037a089218a1d.jpg', '', '', 1, 1524625048);
INSERT INTO `rk_picture` VALUES (2069, '/uploads/picture/20180425/434d1f1f418ae2eab2e580599f75119a.jpg', '/uploads/picture/20180425/434d1f1f418ae2eab2e580599f75119a.jpg', '', '', 1, 1524625052);
INSERT INTO `rk_picture` VALUES (2070, '/uploads/picture/20180425/0ee899554088e290456b8c9602f6e0b8.jpg', '/uploads/picture/20180425/0ee899554088e290456b8c9602f6e0b8.jpg', '', '', 1, 1524625182);
INSERT INTO `rk_picture` VALUES (2071, '/uploads/picture/20180425/54e2aa88739bc3c95bb76fda4d2d7df4.jpg', '/uploads/picture/20180425/54e2aa88739bc3c95bb76fda4d2d7df4.jpg', '', '', 1, 1524627068);
INSERT INTO `rk_picture` VALUES (2072, '/uploads/picture/20180425/d2ff4c22f21f94be2c3a557785857b94.jpg', '/uploads/picture/20180425/d2ff4c22f21f94be2c3a557785857b94.jpg', '', '', 1, 1524627085);
INSERT INTO `rk_picture` VALUES (2073, '/uploads/picture/20180425/dd62f69d32774965fe0ed4c934f0fbfe.jpg', '/uploads/picture/20180425/dd62f69d32774965fe0ed4c934f0fbfe.jpg', '', '', 1, 1524627675);
INSERT INTO `rk_picture` VALUES (2074, '/uploads/picture/20180425/54ac32601fd0c6ff7d9a5384b94d8f19.jpg', '/uploads/picture/20180425/54ac32601fd0c6ff7d9a5384b94d8f19.jpg', '', '', 1, 1524634503);
INSERT INTO `rk_picture` VALUES (2075, '/uploads/picture/20180425/0840b86044aeb98c0a458d7787fe232a.jpg', '/uploads/picture/20180425/0840b86044aeb98c0a458d7787fe232a.jpg', '', '', 1, 1524637561);
INSERT INTO `rk_picture` VALUES (2076, '/uploads/picture/20180425/4f38d6e950df7cc845f341a5ec4b4b4d.jpg', '/uploads/picture/20180425/4f38d6e950df7cc845f341a5ec4b4b4d.jpg', '', '', 1, 1524639666);
INSERT INTO `rk_picture` VALUES (2077, '/uploads/picture/20180425/92cd43f18516581551f76b93f7260959.jpg', '/uploads/picture/20180425/92cd43f18516581551f76b93f7260959.jpg', '', '', 1, 1524640235);
INSERT INTO `rk_picture` VALUES (2078, '/uploads/picture/20180425/181ce145a81263ab9046fe849f8f4a5b.jpg', '/uploads/picture/20180425/181ce145a81263ab9046fe849f8f4a5b.jpg', '', '', 1, 1524640267);
INSERT INTO `rk_picture` VALUES (2079, '/uploads/picture/20180425/abb5bd8b20c083b94c6795e723a79ec8.jpg', '/uploads/picture/20180425/abb5bd8b20c083b94c6795e723a79ec8.jpg', '', '', 1, 1524640437);
INSERT INTO `rk_picture` VALUES (2080, '/uploads/picture/20180425/0a054f541f8915f018cb6005c3d0cb66.jpg', '/uploads/picture/20180425/0a054f541f8915f018cb6005c3d0cb66.jpg', '', '', 1, 1524640517);
INSERT INTO `rk_picture` VALUES (2081, '/uploads/picture/20180425/92d89a19240a35acc59e86f12247f32c.jpg', '/uploads/picture/20180425/92d89a19240a35acc59e86f12247f32c.jpg', '', '', 1, 1524640801);
INSERT INTO `rk_picture` VALUES (2082, '/uploads/picture/20180425/d3b22dfee7ffdad12413d090974944e5.jpg', '/uploads/picture/20180425/d3b22dfee7ffdad12413d090974944e5.jpg', '', '', 1, 1524640807);
INSERT INTO `rk_picture` VALUES (2083, '/uploads/picture/20180425/4184b00f20e35c6931b2fec03a099772.jpg', '/uploads/picture/20180425/4184b00f20e35c6931b2fec03a099772.jpg', '', '', 1, 1524641399);
INSERT INTO `rk_picture` VALUES (2084, '/uploads/picture/20180425/8f20193502aa58ad0ca1f1aeb4298e02.jpg', '/uploads/picture/20180425/8f20193502aa58ad0ca1f1aeb4298e02.jpg', '', '', 1, 1524641406);
INSERT INTO `rk_picture` VALUES (2085, '/uploads/picture/20180425/18f195035072e24cbe125988ced8f35c.jpg', '/uploads/picture/20180425/18f195035072e24cbe125988ced8f35c.jpg', '', '', 1, 1524659317);
INSERT INTO `rk_picture` VALUES (2086, '/uploads/picture/20180425/cfe0eadfa2f47a79a8d6964381603c56.jpg', '/uploads/picture/20180425/cfe0eadfa2f47a79a8d6964381603c56.jpg', '', '', 1, 1524659322);
INSERT INTO `rk_picture` VALUES (2087, '/uploads/picture/20180425/cdc19f5fe0091dbeb9c236fb574fcd52.jpg', '/uploads/picture/20180425/cdc19f5fe0091dbeb9c236fb574fcd52.jpg', '', '', 1, 1524659329);
INSERT INTO `rk_picture` VALUES (2088, '/uploads/picture/20180425/e8ad2107a62666fb301dd16e6f28fc1e.jpg', '/uploads/picture/20180425/e8ad2107a62666fb301dd16e6f28fc1e.jpg', '', '', 1, 1524660108);
INSERT INTO `rk_picture` VALUES (2089, '/uploads/picture/20180425/4b3fe42d8ba0d66c0994ca1355b4c966.jpg', '/uploads/picture/20180425/4b3fe42d8ba0d66c0994ca1355b4c966.jpg', '', '', 1, 1524660443);
INSERT INTO `rk_picture` VALUES (2090, '/uploads/picture/20180426/1e75c84833dc7281a5db632985a746e0.jpg', '/uploads/picture/20180426/1e75c84833dc7281a5db632985a746e0.jpg', '', '', 1, 1524711979);
INSERT INTO `rk_picture` VALUES (2091, '/uploads/picture/20180426/3cd1786d17e98b3a653f740c0236158b.jpg', '/uploads/picture/20180426/3cd1786d17e98b3a653f740c0236158b.jpg', '', '', 1, 1524711986);
INSERT INTO `rk_picture` VALUES (2092, '/uploads/picture/20180426/4a7e8a2b9bf6a82f65953029f16b81f5.jpg', '/uploads/picture/20180426/4a7e8a2b9bf6a82f65953029f16b81f5.jpg', '', '', 1, 1524739046);
INSERT INTO `rk_picture` VALUES (2093, '/uploads/picture/20180426/71b6676e59d9e7e875747e1b1c90ad23.jpg', '/uploads/picture/20180426/71b6676e59d9e7e875747e1b1c90ad23.jpg', '', '', 1, 1524740319);
INSERT INTO `rk_picture` VALUES (2094, '/uploads/picture/20180426/79122dc8582c95bb4a6534b5b8065b62.jpg', '/uploads/picture/20180426/79122dc8582c95bb4a6534b5b8065b62.jpg', '', '', 1, 1524740324);
INSERT INTO `rk_picture` VALUES (2095, '/uploads/picture/20180426/2f40e126067b0279edc7ad23f75bfac3.jpg', '/uploads/picture/20180426/2f40e126067b0279edc7ad23f75bfac3.jpg', '', '', 1, 1524740329);
INSERT INTO `rk_picture` VALUES (2096, '/uploads/picture/20180426/dd202775db99062533e93b193807df90.jpg', '/uploads/picture/20180426/dd202775db99062533e93b193807df90.jpg', '', '', 1, 1524740342);
INSERT INTO `rk_picture` VALUES (2097, '/uploads/picture/20180427/df4c4ad752dcaba782a197ed29ce78f8.jpg', '/uploads/picture/20180427/df4c4ad752dcaba782a197ed29ce78f8.jpg', '', '', 1, 1524811442);
INSERT INTO `rk_picture` VALUES (2098, '/uploads/picture/20180427/8822156074b6929487c412278276fdc6.jpg', '/uploads/picture/20180427/8822156074b6929487c412278276fdc6.jpg', '', '', 1, 1524811447);
INSERT INTO `rk_picture` VALUES (2099, '/uploads/picture/20180427/ae048ac4dc9ac5c9a80e0a41437e26bb.jpg', '/uploads/picture/20180427/ae048ac4dc9ac5c9a80e0a41437e26bb.jpg', '', '', 1, 1524811452);
INSERT INTO `rk_picture` VALUES (2100, '/uploads/picture/20180427/6b4367814b80a75b234443560b39a931.jpg', '/uploads/picture/20180427/6b4367814b80a75b234443560b39a931.jpg', '', '', 1, 1524811456);
INSERT INTO `rk_picture` VALUES (2101, '/uploads/picture/20180427/9f0549c01265073ebb90c1fb5ea293be.jpg', '/uploads/picture/20180427/9f0549c01265073ebb90c1fb5ea293be.jpg', '', '', 1, 1524811462);
INSERT INTO `rk_picture` VALUES (2102, '/uploads/picture/20180427/ee7357a4214a4ddbfb5ca135f952b478.jpg', '/uploads/picture/20180427/ee7357a4214a4ddbfb5ca135f952b478.jpg', '', '', 1, 1524828129);
INSERT INTO `rk_picture` VALUES (2103, '/uploads/picture/20180427/1a688cc0def5b6cd1507a0e68cbb4478.jpg', '/uploads/picture/20180427/1a688cc0def5b6cd1507a0e68cbb4478.jpg', '', '', 1, 1524828148);
INSERT INTO `rk_picture` VALUES (2104, '/uploads/picture/20180428/21395d608773eb590454c89c8641c771.jpg', '/uploads/picture/20180428/21395d608773eb590454c89c8641c771.jpg', '', '', 1, 1524897801);
INSERT INTO `rk_picture` VALUES (2105, '/uploads/picture/20180428/76bc536e430482489e63df4095d4187e.jpg', '/uploads/picture/20180428/76bc536e430482489e63df4095d4187e.jpg', '', '', 1, 1524897845);
INSERT INTO `rk_picture` VALUES (2106, '/uploads/picture/20180428/dd6fb65eedf963e2a3bd32e5ca212d22.jpg', '/uploads/picture/20180428/dd6fb65eedf963e2a3bd32e5ca212d22.jpg', '', '', 1, 1524903539);
INSERT INTO `rk_picture` VALUES (2107, '/uploads/picture/20180428/fda578cfb6367352deccb9e58d3c23c6.jpg', '/uploads/picture/20180428/fda578cfb6367352deccb9e58d3c23c6.jpg', '', '', 1, 1524903545);
INSERT INTO `rk_picture` VALUES (2108, '/uploads/picture/20180428/2feb8c5746cf61cc4f1f8632229d665c.jpg', '/uploads/picture/20180428/2feb8c5746cf61cc4f1f8632229d665c.jpg', '', '', 1, 1524904849);
INSERT INTO `rk_picture` VALUES (2109, '/uploads/picture/20180428/791a5236f91d444b866e01851b3d3d12.jpg', '/uploads/picture/20180428/791a5236f91d444b866e01851b3d3d12.jpg', '', '', 1, 1524905603);
INSERT INTO `rk_picture` VALUES (2110, '/uploads/picture/20180428/ac6c62995b512b7d5ed5c3d9b92b1603.jpg', '/uploads/picture/20180428/ac6c62995b512b7d5ed5c3d9b92b1603.jpg', '', '', 1, 1524905608);
INSERT INTO `rk_picture` VALUES (2111, '/uploads/picture/20180428/ff5ff466124f822d1f511d4d5e42fc9b.jpg', '/uploads/picture/20180428/ff5ff466124f822d1f511d4d5e42fc9b.jpg', '', '', 1, 1524905612);
INSERT INTO `rk_picture` VALUES (2112, '/uploads/picture/20180429/768e871883c1d8f3c45fc810adb1e7af.png', '/uploads/picture/20180429/768e871883c1d8f3c45fc810adb1e7af.png', '', '', 1, 1524979429);
INSERT INTO `rk_picture` VALUES (2113, '/uploads/picture/20180429/7b86cc3b25539d0c901865edf604ea0e.png', '/uploads/picture/20180429/7b86cc3b25539d0c901865edf604ea0e.png', '', '', 1, 1524979542);
INSERT INTO `rk_picture` VALUES (2114, '/uploads/picture/20180429/f20dd2098bc2c597850308f708c600c6.png', '/uploads/picture/20180429/f20dd2098bc2c597850308f708c600c6.png', '', '', 1, 1524979564);
INSERT INTO `rk_picture` VALUES (2115, '/uploads/picture/20180429/231780fea6fecd6de5e3590d6638411d.png', '/uploads/picture/20180429/231780fea6fecd6de5e3590d6638411d.png', '', '', 1, 1524998180);
INSERT INTO `rk_picture` VALUES (2116, '/uploads/picture/20180429/e07968a63d935543bf32c1aeef570550.png', '/uploads/picture/20180429/e07968a63d935543bf32c1aeef570550.png', '', '', 1, 1524998228);
INSERT INTO `rk_picture` VALUES (2117, '/uploads/picture/20180429/4adff3d23ed5708fb9d928e0c9b513f8.png', '/uploads/picture/20180429/4adff3d23ed5708fb9d928e0c9b513f8.png', '', '', 1, 1524998262);
INSERT INTO `rk_picture` VALUES (2118, '/uploads/picture/20180429/76472ead2aa4a245abb0f561aedba71b.png', '/uploads/picture/20180429/76472ead2aa4a245abb0f561aedba71b.png', '', '', 1, 1524998333);
INSERT INTO `rk_picture` VALUES (2119, '/uploads/picture/20180429/cf2d443d979a829be70c8813c22f0ab7.png', '/uploads/picture/20180429/cf2d443d979a829be70c8813c22f0ab7.png', '', '', 1, 1524998379);
INSERT INTO `rk_picture` VALUES (2120, '/uploads/picture/20180429/f126855b00a87834a48f6a9697cde9ec.png', '/uploads/picture/20180429/f126855b00a87834a48f6a9697cde9ec.png', '', '', 1, 1524998408);
INSERT INTO `rk_picture` VALUES (2121, '/uploads/picture/20180429/56f807655ceaee298f27e409f5dba34e.jpg', '/uploads/picture/20180429/56f807655ceaee298f27e409f5dba34e.jpg', '', '', 1, 1524998638);
INSERT INTO `rk_picture` VALUES (2122, '/uploads/picture/20180430/7ccf0487c14db0f407786b7d2c235ce6.jpg', '/uploads/picture/20180430/7ccf0487c14db0f407786b7d2c235ce6.jpg', '', '', 1, 1525050382);
INSERT INTO `rk_picture` VALUES (2123, '/uploads/picture/20180430/fdf546f9e2034b0d622169db8eed815c.jpg', '/uploads/picture/20180430/fdf546f9e2034b0d622169db8eed815c.jpg', '', '', 1, 1525054233);
INSERT INTO `rk_picture` VALUES (2124, '/uploads/picture/20180501/6d92c96238ef787d5a019eea26279e6b.jpg', '/uploads/picture/20180501/6d92c96238ef787d5a019eea26279e6b.jpg', '', '', 1, 1525151300);
INSERT INTO `rk_picture` VALUES (2125, '/uploads/picture/20180501/f8cf8d25b830dac3d85dde31c3407776.jpg', '/uploads/picture/20180501/f8cf8d25b830dac3d85dde31c3407776.jpg', '', '', 1, 1525151333);
INSERT INTO `rk_picture` VALUES (2126, '/uploads/picture/20180501/3facb1d6f3db1fc99fe87508d285918a.jpg', '/uploads/picture/20180501/3facb1d6f3db1fc99fe87508d285918a.jpg', '', '', 1, 1525151395);
INSERT INTO `rk_picture` VALUES (2127, '/uploads/picture/20180501/5874cae8842d4f1ae8f5564f9a198921.jpg', '/uploads/picture/20180501/5874cae8842d4f1ae8f5564f9a198921.jpg', '', '', 1, 1525151410);
INSERT INTO `rk_picture` VALUES (2128, '/uploads/picture/20180501/653f8fe6fc16f877522a8b7ddba9e21e.jpg', '/uploads/picture/20180501/653f8fe6fc16f877522a8b7ddba9e21e.jpg', '', '', 1, 1525151452);
INSERT INTO `rk_picture` VALUES (2129, '/uploads/picture/20180502/0e597ed3b3d398d1ec5a76f06c9f4eab.png', '/uploads/picture/20180502/0e597ed3b3d398d1ec5a76f06c9f4eab.png', '', '', 1, 1525221480);
INSERT INTO `rk_picture` VALUES (2130, '/uploads/picture/20180502/dc994c5f387e6ddfe7dc7618377013b8.png', '/uploads/picture/20180502/dc994c5f387e6ddfe7dc7618377013b8.png', '', '', 1, 1525221618);
INSERT INTO `rk_picture` VALUES (2131, '/uploads/picture/20180502/73824a1598072a56a60e28d5feee2ff7.png', '/uploads/picture/20180502/73824a1598072a56a60e28d5feee2ff7.png', '', '', 1, 1525221666);
INSERT INTO `rk_picture` VALUES (2132, '/uploads/picture/20180502/37c665f2041466010b3e95d704382034.png', '/uploads/picture/20180502/37c665f2041466010b3e95d704382034.png', '', '', 1, 1525222247);
INSERT INTO `rk_picture` VALUES (2133, '/uploads/picture/20180502/961a136b19323bbb185bb3889910cc4d.png', '/uploads/picture/20180502/961a136b19323bbb185bb3889910cc4d.png', '', '', 1, 1525222488);
INSERT INTO `rk_picture` VALUES (2134, '/uploads/picture/20180502/769c8b0d79a5e7e5b847bda90091c860.png', '/uploads/picture/20180502/769c8b0d79a5e7e5b847bda90091c860.png', '', '', 1, 1525222567);
INSERT INTO `rk_picture` VALUES (2135, '/uploads/picture/20180502/74658fcc0b13b644412d26c6ce520171.png', '/uploads/picture/20180502/74658fcc0b13b644412d26c6ce520171.png', '', '', 1, 1525222633);
INSERT INTO `rk_picture` VALUES (2136, '/uploads/picture/20180502/1a727aa171f475750f85eb450d5c0943.png', '/uploads/picture/20180502/1a727aa171f475750f85eb450d5c0943.png', '', '', 1, 1525222732);
INSERT INTO `rk_picture` VALUES (2137, '/uploads/picture/20180502/ae8bcc5af05f91ce325a4c8ce5091d8f.png', '/uploads/picture/20180502/ae8bcc5af05f91ce325a4c8ce5091d8f.png', '', '', 1, 1525222844);
INSERT INTO `rk_picture` VALUES (2138, '/uploads/picture/20180502/78cac8083049e2cf7f9af88ca1ecc28b.png', '/uploads/picture/20180502/78cac8083049e2cf7f9af88ca1ecc28b.png', '', '', 1, 1525222934);
INSERT INTO `rk_picture` VALUES (2139, '/uploads/picture/20180502/0c56dea989c9131d9031195395e2e7b7.jpg', '/uploads/picture/20180502/0c56dea989c9131d9031195395e2e7b7.jpg', '', '', 1, 1525224712);
INSERT INTO `rk_picture` VALUES (2140, '/uploads/picture/20180502/373f4ab95004fc741eeb0e991d6d0433.jpg', '/uploads/picture/20180502/373f4ab95004fc741eeb0e991d6d0433.jpg', '', '', 1, 1525227907);
INSERT INTO `rk_picture` VALUES (2141, '/uploads/picture/20180502/5843b0f3fca9cfc65d491c6b12e1774a.jpg', '/uploads/picture/20180502/5843b0f3fca9cfc65d491c6b12e1774a.jpg', '', '', 1, 1525228410);
INSERT INTO `rk_picture` VALUES (2142, '/uploads/picture/20180502/a8049eab952c3018ec343c29b9d656b8.jpg', '/uploads/picture/20180502/a8049eab952c3018ec343c29b9d656b8.jpg', '', '', 1, 1525228430);
INSERT INTO `rk_picture` VALUES (2143, '/uploads/picture/20180502/636bd2314e41fad1adc38248c91478d5.jpg', '/uploads/picture/20180502/636bd2314e41fad1adc38248c91478d5.jpg', '', '', 1, 1525228444);
INSERT INTO `rk_picture` VALUES (2144, '/uploads/picture/20180502/52a224377a2b127877ed9ed4ee43fdeb.jpg', '/uploads/picture/20180502/52a224377a2b127877ed9ed4ee43fdeb.jpg', '', '', 1, 1525228494);
INSERT INTO `rk_picture` VALUES (2145, '/uploads/picture/20180502/ca232cd508686e1c790b5f12ab69bad2.jpg', '/uploads/picture/20180502/ca232cd508686e1c790b5f12ab69bad2.jpg', '', '', 1, 1525231878);
INSERT INTO `rk_picture` VALUES (2146, '/uploads/picture/20180502/5a1ee2e47a5efa91f27b31a78c721d6e.jpg', '/uploads/picture/20180502/5a1ee2e47a5efa91f27b31a78c721d6e.jpg', '', '', 1, 1525237652);
INSERT INTO `rk_picture` VALUES (2147, '/uploads/picture/20180502/09f185cf11a4742ce8da4c5624e0e8c1.jpg', '/uploads/picture/20180502/09f185cf11a4742ce8da4c5624e0e8c1.jpg', '', '', 1, 1525243492);
INSERT INTO `rk_picture` VALUES (2148, '/uploads/picture/20180502/c1f83cf0e05dc8dc62b05511ed1ed6e7.jpg', '/uploads/picture/20180502/c1f83cf0e05dc8dc62b05511ed1ed6e7.jpg', '', '', 1, 1525244772);
INSERT INTO `rk_picture` VALUES (2149, '/uploads/picture/20180502/6a9c82d2605b227f431ea3d9d191a158.jpg', '/uploads/picture/20180502/6a9c82d2605b227f431ea3d9d191a158.jpg', '', '', 1, 1525247158);
INSERT INTO `rk_picture` VALUES (2150, '/uploads/picture/20180502/eea5c7678ac7074a2b3ffeab25c478c5.jpg', '/uploads/picture/20180502/eea5c7678ac7074a2b3ffeab25c478c5.jpg', '', '', 1, 1525247237);
INSERT INTO `rk_picture` VALUES (2151, '/uploads/picture/20180502/04216db03e72d62ff127bfcf896ae345.jpg', '/uploads/picture/20180502/04216db03e72d62ff127bfcf896ae345.jpg', '', '', 1, 1525247689);
INSERT INTO `rk_picture` VALUES (2152, '/uploads/picture/20180502/2a18613f07ac5e0256e47f1cfa454612.jpg', '/uploads/picture/20180502/2a18613f07ac5e0256e47f1cfa454612.jpg', '', '', 1, 1525248063);
INSERT INTO `rk_picture` VALUES (2153, '/uploads/picture/20180502/580eaeaf0a16fa6980a7191cc78dde54.jpg', '/uploads/picture/20180502/580eaeaf0a16fa6980a7191cc78dde54.jpg', '', '', 1, 1525250920);
INSERT INTO `rk_picture` VALUES (2154, '/uploads/picture/20180502/f45323f1a47f4d2fecb6b9c75417899c.jpg', '/uploads/picture/20180502/f45323f1a47f4d2fecb6b9c75417899c.jpg', '', '', 1, 1525251255);
INSERT INTO `rk_picture` VALUES (2155, '/uploads/picture/20180503/53e98b752a78f24fc96a7ae22ab26777.png', '/uploads/picture/20180503/53e98b752a78f24fc96a7ae22ab26777.png', '', '', 1, 1525313801);
INSERT INTO `rk_picture` VALUES (2156, '/uploads/picture/20180503/4543e38ba05686f805e5359b4cf549f9.png', '/uploads/picture/20180503/4543e38ba05686f805e5359b4cf549f9.png', '', '', 1, 1525313824);
INSERT INTO `rk_picture` VALUES (2157, '/uploads/picture/20180503/d14f250bf1b743f824e12518c3944975.png', '/uploads/picture/20180503/d14f250bf1b743f824e12518c3944975.png', '', '', 1, 1525313917);
INSERT INTO `rk_picture` VALUES (2158, '/uploads/picture/20180503/f2d8edcfe64ade0912fcaaad86c72a7d.png', '/uploads/picture/20180503/f2d8edcfe64ade0912fcaaad86c72a7d.png', '', '', 1, 1525313937);
INSERT INTO `rk_picture` VALUES (2159, '/uploads/picture/20180503/4d58cadd79eb1c0f2e79e8a51feb0214.png', '/uploads/picture/20180503/4d58cadd79eb1c0f2e79e8a51feb0214.png', '', '', 1, 1525315254);
INSERT INTO `rk_picture` VALUES (2160, '/uploads/picture/20180503/a6ed292ef63997fe7abd9fcd587de2e9.png', '/uploads/picture/20180503/a6ed292ef63997fe7abd9fcd587de2e9.png', '', '', 1, 1525317581);
INSERT INTO `rk_picture` VALUES (2161, '/uploads/picture/20180503/97e29fcc0cafe7d9a44721ea2141cd34.png', '/uploads/picture/20180503/97e29fcc0cafe7d9a44721ea2141cd34.png', '', '', 1, 1525317604);
INSERT INTO `rk_picture` VALUES (2162, '/uploads/picture/20180503/3b0c7af71f7660d4303c5fa2de57dd77.png', '/uploads/picture/20180503/3b0c7af71f7660d4303c5fa2de57dd77.png', '', '', 1, 1525317640);
INSERT INTO `rk_picture` VALUES (2163, '/uploads/picture/20180503/03bf37ecaa5f297c3c56d8491f1f9858.png', '/uploads/picture/20180503/03bf37ecaa5f297c3c56d8491f1f9858.png', '', '', 1, 1525317669);
INSERT INTO `rk_picture` VALUES (2164, '/uploads/picture/20180503/b96a3db3ba66b495680d7d6eade4bf3a.png', '/uploads/picture/20180503/b96a3db3ba66b495680d7d6eade4bf3a.png', '', '', 1, 1525317729);
INSERT INTO `rk_picture` VALUES (2165, '/uploads/picture/20180503/74683d6794f8db32122455eea240404a.jpg', '/uploads/picture/20180503/74683d6794f8db32122455eea240404a.jpg', '', '', 1, 1525320424);
INSERT INTO `rk_picture` VALUES (2166, '/uploads/picture/20180503/992f3ca0eecabde847071fc1aedd2b92.jpg', '/uploads/picture/20180503/992f3ca0eecabde847071fc1aedd2b92.jpg', '', '', 1, 1525320773);
INSERT INTO `rk_picture` VALUES (2167, '/uploads/picture/20180503/8efed1d0de2ec9d58d1a6b9fa0e9dba6.jpg', '/uploads/picture/20180503/8efed1d0de2ec9d58d1a6b9fa0e9dba6.jpg', '', '', 1, 1525320870);
INSERT INTO `rk_picture` VALUES (2168, '/uploads/picture/20180503/c36e97f628dacbb09e5b02c09d046bea.jpg', '/uploads/picture/20180503/c36e97f628dacbb09e5b02c09d046bea.jpg', '', '', 1, 1525322016);
INSERT INTO `rk_picture` VALUES (2169, '/uploads/picture/20180503/745e0092def3c01f55360fd8e95d81d6.jpg', '/uploads/picture/20180503/745e0092def3c01f55360fd8e95d81d6.jpg', '', '', 1, 1525322085);
INSERT INTO `rk_picture` VALUES (2170, '/uploads/picture/20180503/2136e582ec871d3340da7878bc1f7f6d.jpg', '/uploads/picture/20180503/2136e582ec871d3340da7878bc1f7f6d.jpg', '', '', 1, 1525322108);
INSERT INTO `rk_picture` VALUES (2171, '/uploads/picture/20180503/215044e77a40a33e3e5867884d754277.jpg', '/uploads/picture/20180503/215044e77a40a33e3e5867884d754277.jpg', '', '', 1, 1525322149);
INSERT INTO `rk_picture` VALUES (2172, '/uploads/picture/20180503/51b6c776be0f95ba2c195eec4e463a60.jpg', '/uploads/picture/20180503/51b6c776be0f95ba2c195eec4e463a60.jpg', '', '', 1, 1525322227);
INSERT INTO `rk_picture` VALUES (2173, '/uploads/picture/20180503/66a51205982639c746b8d5c4f9d50190.jpg', '/uploads/picture/20180503/66a51205982639c746b8d5c4f9d50190.jpg', '', '', 1, 1525336084);
INSERT INTO `rk_picture` VALUES (2174, '/uploads/picture/20180504/59199b6ae341435f1c7b1f5fc905b83c.jpg', '/uploads/picture/20180504/59199b6ae341435f1c7b1f5fc905b83c.jpg', '', '', 1, 1525387612);
INSERT INTO `rk_picture` VALUES (2175, '/uploads/picture/20180504/021b5cdba398370127a85f712b771a65.jpg', '/uploads/picture/20180504/021b5cdba398370127a85f712b771a65.jpg', '', '', 1, 1525414724);
INSERT INTO `rk_picture` VALUES (2176, '/uploads/picture/20180504/ac5f98dd5fc9b1eb8d410a99908ff517.jpg', '/uploads/picture/20180504/ac5f98dd5fc9b1eb8d410a99908ff517.jpg', '', '', 1, 1525414728);
INSERT INTO `rk_picture` VALUES (2177, '/uploads/picture/20180504/b34f192b79e9f2e28990d61051729243.jpg', '/uploads/picture/20180504/b34f192b79e9f2e28990d61051729243.jpg', '', '', 1, 1525414741);
INSERT INTO `rk_picture` VALUES (2178, '/uploads/picture/20180504/0e98ec6dfef84a863f49d03686a8688c.jpg', '/uploads/picture/20180504/0e98ec6dfef84a863f49d03686a8688c.jpg', '', '', 1, 1525416841);
INSERT INTO `rk_picture` VALUES (2179, '/uploads/picture/20180504/895718bfb723b184db356f161703c81f.jpg', '/uploads/picture/20180504/895718bfb723b184db356f161703c81f.jpg', '', '', 1, 1525416849);
INSERT INTO `rk_picture` VALUES (2180, '/uploads/picture/20180504/5709e45d21b7f38408a49b52f53627a9.jpg', '/uploads/picture/20180504/5709e45d21b7f38408a49b52f53627a9.jpg', '', '', 1, 1525416853);
INSERT INTO `rk_picture` VALUES (2181, '/uploads/picture/20180504/707c6dfe18069e41174df6078fc4a77b.jpg', '/uploads/picture/20180504/707c6dfe18069e41174df6078fc4a77b.jpg', '', '', 1, 1525417036);
INSERT INTO `rk_picture` VALUES (2182, '/uploads/picture/20180504/44e3b945e3cbce16bb1c0bb280bb5eff.jpg', '/uploads/picture/20180504/44e3b945e3cbce16bb1c0bb280bb5eff.jpg', '', '', 1, 1525417039);
INSERT INTO `rk_picture` VALUES (2183, '/uploads/picture/20180504/a7f003f6f4b3f71a9b418fac197d7310.jpg', '/uploads/picture/20180504/a7f003f6f4b3f71a9b418fac197d7310.jpg', '', '', 1, 1525418084);
INSERT INTO `rk_picture` VALUES (2184, '/uploads/picture/20180504/af81ab0f675389b195624ef417d3392d.jpg', '/uploads/picture/20180504/af81ab0f675389b195624ef417d3392d.jpg', '', '', 1, 1525418088);
INSERT INTO `rk_picture` VALUES (2185, '/uploads/picture/20180504/1c8254883587e8a8d49c7bfd1330dd76.jpg', '/uploads/picture/20180504/1c8254883587e8a8d49c7bfd1330dd76.jpg', '', '', 1, 1525418606);
INSERT INTO `rk_picture` VALUES (2186, '/uploads/picture/20180504/2b97576e9452f1bb1f51e5119a0591f0.jpg', '/uploads/picture/20180504/2b97576e9452f1bb1f51e5119a0591f0.jpg', '', '', 1, 1525418610);
INSERT INTO `rk_picture` VALUES (2187, '/uploads/picture/20180504/0a93a9f8ef98a6ac93cedba4152db02b.jpg', '/uploads/picture/20180504/0a93a9f8ef98a6ac93cedba4152db02b.jpg', '', '', 1, 1525418958);
INSERT INTO `rk_picture` VALUES (2188, '/uploads/picture/20180504/7f0dd4d06d2adaa84131a725dab2198b.jpg', '/uploads/picture/20180504/7f0dd4d06d2adaa84131a725dab2198b.jpg', '', '', 1, 1525418964);
INSERT INTO `rk_picture` VALUES (2189, '/uploads/picture/20180504/01b93a1d5524ee889ded8c78b4f494a9.jpg', '/uploads/picture/20180504/01b93a1d5524ee889ded8c78b4f494a9.jpg', '', '', 1, 1525418969);
INSERT INTO `rk_picture` VALUES (2190, '/uploads/picture/20180504/81c4a3d42b47b604fb04bcbe335a8942.jpg', '/uploads/picture/20180504/81c4a3d42b47b604fb04bcbe335a8942.jpg', '', '', 1, 1525419731);
INSERT INTO `rk_picture` VALUES (2191, '/uploads/picture/20180504/2027e3240d3b727c2d1e94ce7dfbc570.jpg', '/uploads/picture/20180504/2027e3240d3b727c2d1e94ce7dfbc570.jpg', '', '', 1, 1525419739);
INSERT INTO `rk_picture` VALUES (2192, '/uploads/picture/20180504/1bac6f90758250b56a3743fe4424d08e.jpg', '/uploads/picture/20180504/1bac6f90758250b56a3743fe4424d08e.jpg', '', '', 1, 1525420571);
INSERT INTO `rk_picture` VALUES (2193, '/uploads/picture/20180504/25759760ead45c98a33b2a0f7a7a328c.jpg', '/uploads/picture/20180504/25759760ead45c98a33b2a0f7a7a328c.jpg', '', '', 1, 1525420580);
INSERT INTO `rk_picture` VALUES (2194, '/uploads/picture/20180504/c7c0d3c202a05bea976279bd827dcafb.jpg', '/uploads/picture/20180504/c7c0d3c202a05bea976279bd827dcafb.jpg', '', '', 1, 1525420787);
INSERT INTO `rk_picture` VALUES (2195, '/uploads/picture/20180504/415ca005c939307e6ada09a8067ee3e7.jpg', '/uploads/picture/20180504/415ca005c939307e6ada09a8067ee3e7.jpg', '', '', 1, 1525423838);
INSERT INTO `rk_picture` VALUES (2196, '/uploads/picture/20180504/a8dba3e565083052a506657cc9ed9043.jpg', '/uploads/picture/20180504/a8dba3e565083052a506657cc9ed9043.jpg', '', '', 1, 1525428229);
INSERT INTO `rk_picture` VALUES (2197, '/uploads/picture/20180504/a92d348940dad49a1bd03124aa47ae01.jpg', '/uploads/picture/20180504/a92d348940dad49a1bd03124aa47ae01.jpg', '', '', 1, 1525428233);
INSERT INTO `rk_picture` VALUES (2198, '/uploads/picture/20180504/18e184be17c04c2b42ad0fdead6cdf98.jpg', '/uploads/picture/20180504/18e184be17c04c2b42ad0fdead6cdf98.jpg', '', '', 1, 1525428237);
INSERT INTO `rk_picture` VALUES (2199, '/uploads/picture/20180504/2ea6336d8d6fbb439fa9825f0b50ef24.jpg', '/uploads/picture/20180504/2ea6336d8d6fbb439fa9825f0b50ef24.jpg', '', '', 1, 1525428445);
INSERT INTO `rk_picture` VALUES (2200, '/uploads/picture/20180504/54edf089d593ebf7ecd42a8fec3b9106.jpg', '/uploads/picture/20180504/54edf089d593ebf7ecd42a8fec3b9106.jpg', '', '', 1, 1525428449);
INSERT INTO `rk_picture` VALUES (2201, '/uploads/picture/20180504/afe84c3e079450d0c12cb2000f54b38c.jpg', '/uploads/picture/20180504/afe84c3e079450d0c12cb2000f54b38c.jpg', '', '', 1, 1525429390);
INSERT INTO `rk_picture` VALUES (2202, '/uploads/picture/20180504/9433efd27e9e8b9e9b8eab8c9bede41b.jpg', '/uploads/picture/20180504/9433efd27e9e8b9e9b8eab8c9bede41b.jpg', '', '', 1, 1525429787);
INSERT INTO `rk_picture` VALUES (2203, '/uploads/picture/20180504/4f98bfcc62e99c4f271a69ddc0c84da9.jpg', '/uploads/picture/20180504/4f98bfcc62e99c4f271a69ddc0c84da9.jpg', '', '', 1, 1525430231);
INSERT INTO `rk_picture` VALUES (2204, '/uploads/picture/20180505/34aec939a7d8536ed3c8d9ea47f0df1c.png', '/uploads/picture/20180505/34aec939a7d8536ed3c8d9ea47f0df1c.png', '', '', 1, 1525483763);
INSERT INTO `rk_picture` VALUES (2205, '/uploads/picture/20180505/9ed76990abd739a85ff50e7b67d3a88a.png', '/uploads/picture/20180505/9ed76990abd739a85ff50e7b67d3a88a.png', '', '', 1, 1525483838);
INSERT INTO `rk_picture` VALUES (2206, '/uploads/picture/20180505/f7d50d25470064ab2d5ea20f17c26941.png', '/uploads/picture/20180505/f7d50d25470064ab2d5ea20f17c26941.png', '', '', 1, 1525483923);
INSERT INTO `rk_picture` VALUES (2207, '/uploads/picture/20180505/7aa25967f01c7f4e7e59b6283f954643.png', '/uploads/picture/20180505/7aa25967f01c7f4e7e59b6283f954643.png', '', '', 1, 1525483924);
INSERT INTO `rk_picture` VALUES (2208, '/uploads/picture/20180505/c1ed28e0e3f5378b9f47b6401fd665af.png', '/uploads/picture/20180505/c1ed28e0e3f5378b9f47b6401fd665af.png', '', '', 1, 1525483996);
INSERT INTO `rk_picture` VALUES (2209, '/uploads/picture/20180505/0e1f297ac5efaa992e3c0249d6a0fb13.png', '/uploads/picture/20180505/0e1f297ac5efaa992e3c0249d6a0fb13.png', '', '', 1, 1525484036);
INSERT INTO `rk_picture` VALUES (2210, '/uploads/picture/20180505/f813f0ef4145f49fd3689a52fdb7057b.png', '/uploads/picture/20180505/f813f0ef4145f49fd3689a52fdb7057b.png', '', '', 1, 1525484132);
INSERT INTO `rk_picture` VALUES (2211, '/uploads/picture/20180505/93ec0db09a189ac7e79ed3cd638937a1.jpg', '/uploads/picture/20180505/93ec0db09a189ac7e79ed3cd638937a1.jpg', '', '', 1, 1525485538);
INSERT INTO `rk_picture` VALUES (2212, '/uploads/picture/20180505/10519ea07af3c1ba3c0f3c32e53d189f.jpg', '/uploads/picture/20180505/10519ea07af3c1ba3c0f3c32e53d189f.jpg', '', '', 1, 1525485544);
INSERT INTO `rk_picture` VALUES (2213, '/uploads/picture/20180505/cb2a14e1e4e6bdc75ea2d475588a5afd.jpg', '/uploads/picture/20180505/cb2a14e1e4e6bdc75ea2d475588a5afd.jpg', '', '', 1, 1525485549);
INSERT INTO `rk_picture` VALUES (2214, '/uploads/picture/20180505/443354ac5701344e3aad901d3612dc66.jpg', '/uploads/picture/20180505/443354ac5701344e3aad901d3612dc66.jpg', '', '', 1, 1525487882);
INSERT INTO `rk_picture` VALUES (2215, '/uploads/picture/20180505/a0398e1569ad875664e3a054ac682bff.jpg', '/uploads/picture/20180505/a0398e1569ad875664e3a054ac682bff.jpg', '', '', 1, 1525489085);
INSERT INTO `rk_picture` VALUES (2216, '/uploads/picture/20180505/ca359886f8928550ff1487cb4e8174a8.jpg', '/uploads/picture/20180505/ca359886f8928550ff1487cb4e8174a8.jpg', '', '', 1, 1525489101);
INSERT INTO `rk_picture` VALUES (2217, '/uploads/picture/20180505/4ece717b1d541dfa2115207cc6287a1d.jpg', '/uploads/picture/20180505/4ece717b1d541dfa2115207cc6287a1d.jpg', '', '', 1, 1525489126);
INSERT INTO `rk_picture` VALUES (2218, '/uploads/picture/20180505/4aef11e9f46a8e92e13ad0042554cb10.jpg', '/uploads/picture/20180505/4aef11e9f46a8e92e13ad0042554cb10.jpg', '', '', 1, 1525504438);
INSERT INTO `rk_picture` VALUES (2219, '/uploads/picture/20180505/add48d0052f656c004df6e3c008e263f.jpg', '/uploads/picture/20180505/add48d0052f656c004df6e3c008e263f.jpg', '', '', 1, 1525504455);
INSERT INTO `rk_picture` VALUES (2220, '/uploads/picture/20180505/24437a4f6066301384f5d4fe76f5f7f3.jpg', '/uploads/picture/20180505/24437a4f6066301384f5d4fe76f5f7f3.jpg', '', '', 1, 1525504459);
INSERT INTO `rk_picture` VALUES (2221, '/uploads/picture/20180505/5b4f7cbc7a10ff0e22331599037e014f.jpg', '/uploads/picture/20180505/5b4f7cbc7a10ff0e22331599037e014f.jpg', '', '', 1, 1525510137);
INSERT INTO `rk_picture` VALUES (2222, '/uploads/picture/20180505/61250dae2025efc1dfba4b75a2e2a2a7.jpg', '/uploads/picture/20180505/61250dae2025efc1dfba4b75a2e2a2a7.jpg', '', '', 1, 1525510144);
INSERT INTO `rk_picture` VALUES (2223, '/uploads/picture/20180505/53b27818ae4e3b3ef5241ab4360a3182.jpg', '/uploads/picture/20180505/53b27818ae4e3b3ef5241ab4360a3182.jpg', '', '', 1, 1525510152);
INSERT INTO `rk_picture` VALUES (2224, '/uploads/picture/20180505/10200d1571884810ae73dbf299d1d7e3.jpg', '/uploads/picture/20180505/10200d1571884810ae73dbf299d1d7e3.jpg', '', '', 1, 1525510161);
INSERT INTO `rk_picture` VALUES (2225, '/uploads/picture/20180505/01b53b716448be0a718741bd08585ac2.jpg', '/uploads/picture/20180505/01b53b716448be0a718741bd08585ac2.jpg', '', '', 1, 1525533278);
INSERT INTO `rk_picture` VALUES (2226, '/uploads/picture/20180506/6c1d09ebbc14f5b27899ce5b05510423.jpg', '/uploads/picture/20180506/6c1d09ebbc14f5b27899ce5b05510423.jpg', '', '', 1, 1525574571);
INSERT INTO `rk_picture` VALUES (2227, '/uploads/picture/20180506/15492ca745685a2181748fded3442da1.jpg', '/uploads/picture/20180506/15492ca745685a2181748fded3442da1.jpg', '', '', 1, 1525574609);
INSERT INTO `rk_picture` VALUES (2228, '/uploads/picture/20180506/93d8cd7162438d11a5d42f25cabe3534.jpg', '/uploads/picture/20180506/93d8cd7162438d11a5d42f25cabe3534.jpg', '', '', 1, 1525574615);
INSERT INTO `rk_picture` VALUES (2229, '/uploads/picture/20180506/1fb2065270c8c9b1041cdf92d0b10732.jpg', '/uploads/picture/20180506/1fb2065270c8c9b1041cdf92d0b10732.jpg', '', '', 1, 1525575780);
INSERT INTO `rk_picture` VALUES (2230, '/uploads/picture/20180506/1fc37de18d21ed8cd42a1e2a88569191.jpg', '/uploads/picture/20180506/1fc37de18d21ed8cd42a1e2a88569191.jpg', '', '', 1, 1525575825);
INSERT INTO `rk_picture` VALUES (2231, '/uploads/picture/20180506/afda8ee96cfd230e0a6334b790eb7347.jpg', '/uploads/picture/20180506/afda8ee96cfd230e0a6334b790eb7347.jpg', '', '', 1, 1525576114);
INSERT INTO `rk_picture` VALUES (2232, '/uploads/picture/20180506/d188a45efa2b91946b7da8acb346f2c5.jpg', '/uploads/picture/20180506/d188a45efa2b91946b7da8acb346f2c5.jpg', '', '', 1, 1525576587);
INSERT INTO `rk_picture` VALUES (2233, '/uploads/picture/20180506/0bfb56753d9863ee13bfa720eea1864c.jpg', '/uploads/picture/20180506/0bfb56753d9863ee13bfa720eea1864c.jpg', '', '', 1, 1525576644);
INSERT INTO `rk_picture` VALUES (2234, '/uploads/picture/20180507/3bbc214845db2a4aa6763736bcc53229.jpg', '/uploads/picture/20180507/3bbc214845db2a4aa6763736bcc53229.jpg', '', '', 1, 1525662405);
INSERT INTO `rk_picture` VALUES (2235, '/uploads/picture/20180507/ca6077eb6d17c088141ce63d7d95c2b4.jpg', '/uploads/picture/20180507/ca6077eb6d17c088141ce63d7d95c2b4.jpg', '', '', 1, 1525671076);
INSERT INTO `rk_picture` VALUES (2236, '/uploads/picture/20180507/5a3cb0dae83e91d221cc672f7841030e.jpg', '/uploads/picture/20180507/5a3cb0dae83e91d221cc672f7841030e.jpg', '', '', 1, 1525671118);
INSERT INTO `rk_picture` VALUES (2237, '/uploads/picture/20180507/635b35652bcc1e395c8d36df7591007a.jpg', '/uploads/picture/20180507/635b35652bcc1e395c8d36df7591007a.jpg', '', '', 1, 1525681960);
INSERT INTO `rk_picture` VALUES (2238, '/uploads/picture/20180507/5e68630fbe202e6338381086a9386967.jpg', '/uploads/picture/20180507/5e68630fbe202e6338381086a9386967.jpg', '', '', 1, 1525681975);
INSERT INTO `rk_picture` VALUES (2239, '/uploads/picture/20180507/4410287f4c0ba715f2cfe9814f6e1ed3.jpg', '/uploads/picture/20180507/4410287f4c0ba715f2cfe9814f6e1ed3.jpg', '', '', 1, 1525682464);
INSERT INTO `rk_picture` VALUES (2240, '/uploads/picture/20180507/f61c8498ef7b472669c7518233afc57a.jpg', '/uploads/picture/20180507/f61c8498ef7b472669c7518233afc57a.jpg', '', '', 1, 1525684113);
INSERT INTO `rk_picture` VALUES (2241, '/uploads/picture/20180508/c43fa223ba48063cb788ee7bd8a0094f.jpg', '/uploads/picture/20180508/c43fa223ba48063cb788ee7bd8a0094f.jpg', '', '', 1, 1525760312);
INSERT INTO `rk_picture` VALUES (2242, '/uploads/picture/20180508/cf88b41e902b22402bbe4553b83d2480.jpg', '/uploads/picture/20180508/cf88b41e902b22402bbe4553b83d2480.jpg', '', '', 1, 1525760336);
INSERT INTO `rk_picture` VALUES (2243, '/uploads/picture/20180508/441b10059af87d8972b3e6d0ac195105.jpg', '/uploads/picture/20180508/441b10059af87d8972b3e6d0ac195105.jpg', '', '', 1, 1525774696);
INSERT INTO `rk_picture` VALUES (2244, '/uploads/picture/20180508/0cc820b326be142f2d1bdfdae6b827cb.jpg', '/uploads/picture/20180508/0cc820b326be142f2d1bdfdae6b827cb.jpg', '', '', 1, 1525777093);
INSERT INTO `rk_picture` VALUES (2245, '/uploads/picture/20180509/d9a612158e5c2dfdcf284c614d7d32ed.jpg', '/uploads/picture/20180509/d9a612158e5c2dfdcf284c614d7d32ed.jpg', '', '', 1, 1525828299);
INSERT INTO `rk_picture` VALUES (2246, '/uploads/picture/20180509/2879c1a4714c83f2589a190f6c16bd68.jpg', '/uploads/picture/20180509/2879c1a4714c83f2589a190f6c16bd68.jpg', '', '', 1, 1525830448);
INSERT INTO `rk_picture` VALUES (2247, '/uploads/picture/20180509/6d382555177dbaef2ce430dcf41ae1b0.jpg', '/uploads/picture/20180509/6d382555177dbaef2ce430dcf41ae1b0.jpg', '', '', 1, 1525830453);
INSERT INTO `rk_picture` VALUES (2248, '/uploads/picture/20180509/2367a17b17b362ad9c486d32ef93e4da.jpg', '/uploads/picture/20180509/2367a17b17b362ad9c486d32ef93e4da.jpg', '', '', 1, 1525831709);
INSERT INTO `rk_picture` VALUES (2249, '/uploads/picture/20180509/d85e86a65a237b316afea4ffcb23aa77.jpg', '/uploads/picture/20180509/d85e86a65a237b316afea4ffcb23aa77.jpg', '', '', 1, 1525832148);
INSERT INTO `rk_picture` VALUES (2250, '/uploads/picture/20180509/ac59ed7fa5ecce4a782a5a20d1e062b2.jpg', '/uploads/picture/20180509/ac59ed7fa5ecce4a782a5a20d1e062b2.jpg', '', '', 1, 1525832189);
INSERT INTO `rk_picture` VALUES (2251, '/uploads/picture/20180509/f1ce0302a620a2a0ddee21b215177b7f.jpg', '/uploads/picture/20180509/f1ce0302a620a2a0ddee21b215177b7f.jpg', '', '', 1, 1525832198);
INSERT INTO `rk_picture` VALUES (2252, '/uploads/picture/20180509/4177212583d9ea42906da01225c1c99c.jpg', '/uploads/picture/20180509/4177212583d9ea42906da01225c1c99c.jpg', '', '', 1, 1525833032);
INSERT INTO `rk_picture` VALUES (2253, '/uploads/picture/20180509/ff2a56eea08090d67fc68da1f7aeb931.jpg', '/uploads/picture/20180509/ff2a56eea08090d67fc68da1f7aeb931.jpg', '', '', 1, 1525833049);
INSERT INTO `rk_picture` VALUES (2254, '/uploads/picture/20180509/598abf8378b48e1e1bf58a81ec495332.jpg', '/uploads/picture/20180509/598abf8378b48e1e1bf58a81ec495332.jpg', '', '', 1, 1525833057);
INSERT INTO `rk_picture` VALUES (2255, '/uploads/picture/20180509/15b89d48cd802e2618a7acae900f1bc4.jpg', '/uploads/picture/20180509/15b89d48cd802e2618a7acae900f1bc4.jpg', '', '', 1, 1525833063);
INSERT INTO `rk_picture` VALUES (2256, '/uploads/picture/20180509/8a84aaa02fcf30b54e0a41d5e6b38564.jpg', '/uploads/picture/20180509/8a84aaa02fcf30b54e0a41d5e6b38564.jpg', '', '', 1, 1525833662);
INSERT INTO `rk_picture` VALUES (2257, '/uploads/picture/20180509/2415243bbd54332d74256e9f502f8422.jpg', '/uploads/picture/20180509/2415243bbd54332d74256e9f502f8422.jpg', '', '', 1, 1525833669);
INSERT INTO `rk_picture` VALUES (2258, '/uploads/picture/20180509/006d8d807983a0a776cacfc8e11cd604.jpg', '/uploads/picture/20180509/006d8d807983a0a776cacfc8e11cd604.jpg', '', '', 1, 1525833679);
INSERT INTO `rk_picture` VALUES (2259, '/uploads/picture/20180509/bea57a808e948e93232e83cf4932f81c.jpg', '/uploads/picture/20180509/bea57a808e948e93232e83cf4932f81c.jpg', '', '', 1, 1525833747);
INSERT INTO `rk_picture` VALUES (2260, '/uploads/picture/20180509/b1694eb93b5af10ef2a428fb335067e2.jpg', '/uploads/picture/20180509/b1694eb93b5af10ef2a428fb335067e2.jpg', '', '', 1, 1525833763);
INSERT INTO `rk_picture` VALUES (2261, '/uploads/picture/20180509/f43a51e0ba3ebf590e8db508e3d0ab2b.jpg', '/uploads/picture/20180509/f43a51e0ba3ebf590e8db508e3d0ab2b.jpg', '', '', 1, 1525833784);
INSERT INTO `rk_picture` VALUES (2262, '/uploads/picture/20180509/0e642cf3acb6c93cde62d66268be7b0e.jpg', '/uploads/picture/20180509/0e642cf3acb6c93cde62d66268be7b0e.jpg', '', '', 1, 1525834606);
INSERT INTO `rk_picture` VALUES (2263, '/uploads/picture/20180509/559fbd843a443364c61ef419690c2c2f.jpg', '/uploads/picture/20180509/559fbd843a443364c61ef419690c2c2f.jpg', '', '', 1, 1525834666);
INSERT INTO `rk_picture` VALUES (2264, '/uploads/picture/20180509/f3e9543ed75e4c0dd036cf912c0e77e2.jpg', '/uploads/picture/20180509/f3e9543ed75e4c0dd036cf912c0e77e2.jpg', '', '', 1, 1525834724);
INSERT INTO `rk_picture` VALUES (2265, '/uploads/picture/20180509/bd2f6cd0d7268abd74669b4de91f48f0.jpg', '/uploads/picture/20180509/bd2f6cd0d7268abd74669b4de91f48f0.jpg', '', '', 1, 1525834742);
INSERT INTO `rk_picture` VALUES (2266, '/uploads/picture/20180509/0099860f79b9874a27b2d114da4712cf.jpg', '/uploads/picture/20180509/0099860f79b9874a27b2d114da4712cf.jpg', '', '', 1, 1525834785);
INSERT INTO `rk_picture` VALUES (2267, '/uploads/picture/20180509/b6e811d80f1a681290e0dad46dbf6c05.jpg', '/uploads/picture/20180509/b6e811d80f1a681290e0dad46dbf6c05.jpg', '', '', 1, 1525834795);
INSERT INTO `rk_picture` VALUES (2268, '/uploads/picture/20180509/b62ea8e2c914f9b8d3be38a41b874de8.jpg', '/uploads/picture/20180509/b62ea8e2c914f9b8d3be38a41b874de8.jpg', '', '', 1, 1525834986);
INSERT INTO `rk_picture` VALUES (2269, '/uploads/picture/20180509/108ac9b8b82e9f34d4f619a9d2ec10bd.jpg', '/uploads/picture/20180509/108ac9b8b82e9f34d4f619a9d2ec10bd.jpg', '', '', 1, 1525834990);
INSERT INTO `rk_picture` VALUES (2270, '/uploads/picture/20180509/d692ff68290b0eb1e58c45673f8a2c36.jpg', '/uploads/picture/20180509/d692ff68290b0eb1e58c45673f8a2c36.jpg', '', '', 1, 1525835243);
INSERT INTO `rk_picture` VALUES (2271, '/uploads/picture/20180509/251ad8b1b41e0e043134b658159eb977.jpg', '/uploads/picture/20180509/251ad8b1b41e0e043134b658159eb977.jpg', '', '', 1, 1525836332);
INSERT INTO `rk_picture` VALUES (2272, '/uploads/picture/20180509/8ac14709e0bfd146c53d60983f77b6a2.jpg', '/uploads/picture/20180509/8ac14709e0bfd146c53d60983f77b6a2.jpg', '', '', 1, 1525844588);
INSERT INTO `rk_picture` VALUES (2273, '/uploads/picture/20180509/04e5f0b41f079d9a7b685468ab451e13.jpg', '/uploads/picture/20180509/04e5f0b41f079d9a7b685468ab451e13.jpg', '', '', 1, 1525846422);
INSERT INTO `rk_picture` VALUES (2274, '/uploads/picture/20180509/e61d964d4c9250681253ea0bb146d752.jpg', '/uploads/picture/20180509/e61d964d4c9250681253ea0bb146d752.jpg', '', '', 1, 1525846435);
INSERT INTO `rk_picture` VALUES (2275, '/uploads/picture/20180509/a96e173e3814d77ca90fb4f500e2a781.png', '/uploads/picture/20180509/a96e173e3814d77ca90fb4f500e2a781.png', '', '', 1, 1525848785);
INSERT INTO `rk_picture` VALUES (2276, '/uploads/picture/20180509/7adcd9c093517f290ad0ff1636e71a54.png', '/uploads/picture/20180509/7adcd9c093517f290ad0ff1636e71a54.png', '', '', 1, 1525848841);
INSERT INTO `rk_picture` VALUES (2277, '/uploads/picture/20180509/0873d49a00dbcbafc050e176d174858d.png', '/uploads/picture/20180509/0873d49a00dbcbafc050e176d174858d.png', '', '', 1, 1525848862);
INSERT INTO `rk_picture` VALUES (2278, '/uploads/picture/20180509/39a5602a7ff86d7f0f6725b45892fd90.png', '/uploads/picture/20180509/39a5602a7ff86d7f0f6725b45892fd90.png', '', '', 1, 1525848922);
INSERT INTO `rk_picture` VALUES (2279, '/uploads/picture/20180509/ddce8870d1c588093b4cb49720171b85.jpg', '/uploads/picture/20180509/ddce8870d1c588093b4cb49720171b85.jpg', '', '', 1, 1525848923);
INSERT INTO `rk_picture` VALUES (2280, '/uploads/picture/20180509/bf9e598f658c06c0ae8bb8d4f74561fa.jpg', '/uploads/picture/20180509/bf9e598f658c06c0ae8bb8d4f74561fa.jpg', '', '', 1, 1525848928);
INSERT INTO `rk_picture` VALUES (2281, '/uploads/picture/20180509/8d32156f0d39f87cd69973d923643e19.jpg', '/uploads/picture/20180509/8d32156f0d39f87cd69973d923643e19.jpg', '', '', 1, 1525853805);
INSERT INTO `rk_picture` VALUES (2282, '/uploads/picture/20180509/b9e6f4e7134015da7a6c1fa5f08988a2.jpg', '/uploads/picture/20180509/b9e6f4e7134015da7a6c1fa5f08988a2.jpg', '', '', 1, 1525853822);
INSERT INTO `rk_picture` VALUES (2283, '/uploads/picture/20180509/35a25812817267fa3e8bc6d96db016a3.jpg', '/uploads/picture/20180509/35a25812817267fa3e8bc6d96db016a3.jpg', '', '', 1, 1525853834);
INSERT INTO `rk_picture` VALUES (2284, '/uploads/picture/20180509/dddfd31dccc198628ee515ab72711b05.jpg', '/uploads/picture/20180509/dddfd31dccc198628ee515ab72711b05.jpg', '', '', 1, 1525864251);
INSERT INTO `rk_picture` VALUES (2285, '/uploads/picture/20180509/3855dfb89e81d8c8f0ae4ac72cf57e81.jpg', '/uploads/picture/20180509/3855dfb89e81d8c8f0ae4ac72cf57e81.jpg', '', '', 1, 1525864287);
INSERT INTO `rk_picture` VALUES (2286, '/uploads/picture/20180509/36b32737b6b69ae63ff403b228c8f421.jpg', '/uploads/picture/20180509/36b32737b6b69ae63ff403b228c8f421.jpg', '', '', 1, 1525864313);
INSERT INTO `rk_picture` VALUES (2287, '/uploads/picture/20180510/41336947fbcc4238b772e9d302597926.jpg', '/uploads/picture/20180510/41336947fbcc4238b772e9d302597926.jpg', '', '', 1, 1525928391);
INSERT INTO `rk_picture` VALUES (2288, '/uploads/picture/20180510/cea5d29f9c1f345739bc7b143582be7d.jpg', '/uploads/picture/20180510/cea5d29f9c1f345739bc7b143582be7d.jpg', '', '', 1, 1525931877);
INSERT INTO `rk_picture` VALUES (2289, '/uploads/picture/20180510/28183108bb1c4a93b40295d1c6fac555.jpg', '/uploads/picture/20180510/28183108bb1c4a93b40295d1c6fac555.jpg', '', '', 1, 1525931914);
INSERT INTO `rk_picture` VALUES (2290, '/uploads/picture/20180510/94b3fbf44c41389919345c795cf81fe9.jpg', '/uploads/picture/20180510/94b3fbf44c41389919345c795cf81fe9.jpg', '', '', 1, 1525932242);
INSERT INTO `rk_picture` VALUES (2291, '/uploads/picture/20180510/f88f391f58d2a5a882290f534e18c604.jpg', '/uploads/picture/20180510/f88f391f58d2a5a882290f534e18c604.jpg', '', '', 1, 1525932987);
INSERT INTO `rk_picture` VALUES (2292, '/uploads/picture/20180510/9077a03fa408e7ddd7f0de650f3511ed.jpg', '/uploads/picture/20180510/9077a03fa408e7ddd7f0de650f3511ed.jpg', '', '', 1, 1525933379);
INSERT INTO `rk_picture` VALUES (2293, '/uploads/picture/20180510/6e6173f73a8f26e896c11848e9ca26a0.jpg', '/uploads/picture/20180510/6e6173f73a8f26e896c11848e9ca26a0.jpg', '', '', 1, 1525933521);
INSERT INTO `rk_picture` VALUES (2294, '/uploads/picture/20180510/a6a0a2d8d519fe67097d40e3faa14d4b.jpg', '/uploads/picture/20180510/a6a0a2d8d519fe67097d40e3faa14d4b.jpg', '', '', 1, 1525936324);
INSERT INTO `rk_picture` VALUES (2295, '/uploads/picture/20180510/5265ef55dc56182a8471222a1aeb0244.jpg', '/uploads/picture/20180510/5265ef55dc56182a8471222a1aeb0244.jpg', '', '', 1, 1525936348);
INSERT INTO `rk_picture` VALUES (2296, '/uploads/picture/20180510/9d3eeaabd693ecf86f9f53c67345b1fa.jpg', '/uploads/picture/20180510/9d3eeaabd693ecf86f9f53c67345b1fa.jpg', '', '', 1, 1525937759);
INSERT INTO `rk_picture` VALUES (2297, '/uploads/picture/20180510/aff075f3bfaafef289765cb645414312.jpg', '/uploads/picture/20180510/aff075f3bfaafef289765cb645414312.jpg', '', '', 1, 1525939207);
INSERT INTO `rk_picture` VALUES (2298, '/uploads/picture/20180510/0735b19b264b1dca14fdd26b7554421e.jpg', '/uploads/picture/20180510/0735b19b264b1dca14fdd26b7554421e.jpg', '', '', 1, 1525939212);
INSERT INTO `rk_picture` VALUES (2299, '/uploads/picture/20180511/c4178ea48c258a2ea0f01dbef009ee91.jpg', '/uploads/picture/20180511/c4178ea48c258a2ea0f01dbef009ee91.jpg', '', '', 1, 1525999716);
INSERT INTO `rk_picture` VALUES (2300, '/uploads/picture/20180511/b4d043c64bf450bfde4e4d80ee5d6b8d.jpg', '/uploads/picture/20180511/b4d043c64bf450bfde4e4d80ee5d6b8d.jpg', '', '', 1, 1526007906);
INSERT INTO `rk_picture` VALUES (2301, '/uploads/picture/20180512/4b3954122c92d706a4b0c25a7d077d31.jpg', '/uploads/picture/20180512/4b3954122c92d706a4b0c25a7d077d31.jpg', '', '', 1, 1526129549);
INSERT INTO `rk_picture` VALUES (2302, '/uploads/picture/20180512/6dd07dffee1340e56c72bb870647fe9f.jpg', '/uploads/picture/20180512/6dd07dffee1340e56c72bb870647fe9f.jpg', '', '', 1, 1526129590);
INSERT INTO `rk_picture` VALUES (2303, '/uploads/picture/20180512/88bdf8b53a81e6220e7d2af2f15857c6.jpg', '/uploads/picture/20180512/88bdf8b53a81e6220e7d2af2f15857c6.jpg', '', '', 1, 1526129807);
INSERT INTO `rk_picture` VALUES (2304, '/uploads/picture/20180512/3b0c3664ef09a738fe658c049a99a5f1.jpg', '/uploads/picture/20180512/3b0c3664ef09a738fe658c049a99a5f1.jpg', '', '', 1, 1526129863);
INSERT INTO `rk_picture` VALUES (2305, '/uploads/picture/20180512/4dbef4465f0083b75c8ec7ad506f265b.jpg', '/uploads/picture/20180512/4dbef4465f0083b75c8ec7ad506f265b.jpg', '', '', 1, 1526129896);
INSERT INTO `rk_picture` VALUES (2306, '/uploads/picture/20180512/4dcdaa852d7bdad06dd1a5a6ca3fb83a.jpg', '/uploads/picture/20180512/4dcdaa852d7bdad06dd1a5a6ca3fb83a.jpg', '', '', 1, 1526129934);
INSERT INTO `rk_picture` VALUES (2307, '/uploads/picture/20180512/be9d8581ed4b374bcd6263cfb1cdbcbd.jpg', '/uploads/picture/20180512/be9d8581ed4b374bcd6263cfb1cdbcbd.jpg', '', '', 1, 1526130459);
INSERT INTO `rk_picture` VALUES (2308, '/uploads/picture/20180512/231fbe6dd1b70b1ac7198fe2ec980136.jpg', '/uploads/picture/20180512/231fbe6dd1b70b1ac7198fe2ec980136.jpg', '', '', 1, 1526130498);
INSERT INTO `rk_picture` VALUES (2309, '/uploads/picture/20180513/5087ed3f51c54f074f151ec3fa5dbb03.png', '/uploads/picture/20180513/5087ed3f51c54f074f151ec3fa5dbb03.png', '', '', 1, 1526141531);
INSERT INTO `rk_picture` VALUES (2310, '/uploads/picture/20180513/3f7bccf08e64fe4aec9f260aeb78a50f.png', '/uploads/picture/20180513/3f7bccf08e64fe4aec9f260aeb78a50f.png', '', '', 1, 1526202463);
INSERT INTO `rk_picture` VALUES (2311, '/uploads/picture/20180513/f226a291960b2cba5d6ef2e6db743475.png', '/uploads/picture/20180513/f226a291960b2cba5d6ef2e6db743475.png', '', '', 1, 1526202483);
INSERT INTO `rk_picture` VALUES (2312, '/uploads/picture/20180514/cf3ffa6c1f30037d5fa686d84acff3cb.jpg', '/uploads/picture/20180514/cf3ffa6c1f30037d5fa686d84acff3cb.jpg', '', '', 1, 1526278615);
INSERT INTO `rk_picture` VALUES (2313, '/uploads/picture/20180514/e4d0c7741b74907c85f776e97ce53448.jpg', '/uploads/picture/20180514/e4d0c7741b74907c85f776e97ce53448.jpg', '', '', 1, 1526283888);
INSERT INTO `rk_picture` VALUES (2314, '/uploads/picture/20180514/e86f64f634d41ac7d4317cb5f4165f9b.jpg', '/uploads/picture/20180514/e86f64f634d41ac7d4317cb5f4165f9b.jpg', '9e574837750bfc33371058aa145d8593', 'fe7068caf8d3235153ce036b6f27d671cb034893', 1, 1526287042);
INSERT INTO `rk_picture` VALUES (2321, '/uploads/picture/20180514/5af9559207dce.png', '/uploads/picture/20180514/5af9559207dce.png', '', '', 1, 1526289810);
INSERT INTO `rk_picture` VALUES (2322, '/uploads/picture/20180514/5af955b007095.png', '/uploads/picture/20180514/5af955b007095.png', '', '', 1, 1526289840);
INSERT INTO `rk_picture` VALUES (2323, '/uploads/picture/20180514/5af960761ab4b.png', '/uploads/picture/20180514/5af960761ab4b.png', '', '', 1, 1526292598);
INSERT INTO `rk_picture` VALUES (2324, '/uploads/picture/20180514/5af96458ed901.png', '/uploads/picture/20180514/5af96458ed901.png', '', '', 1, 1526293592);
INSERT INTO `rk_picture` VALUES (2325, '/uploads/picture/20180514/5af96492b42f4.png', '/uploads/picture/20180514/5af96492b42f4.png', '', '', 1, 1526293650);
INSERT INTO `rk_picture` VALUES (2326, '/uploads/picture/20180514/5af964a7e8d22.png', '/uploads/picture/20180514/5af964a7e8d22.png', '', '', 1, 1526293671);
INSERT INTO `rk_picture` VALUES (2327, '/uploads/picture/20180514/5af964f008a50.png', '/uploads/picture/20180514/5af964f008a50.png', '', '', 1, 1526293744);
INSERT INTO `rk_picture` VALUES (2328, '/uploads/picture/20180514/5af9650cef16c.png', '/uploads/picture/20180514/5af9650cef16c.png', '', '', 1, 1526293772);
INSERT INTO `rk_picture` VALUES (2329, '/uploads/picture/20180514/5af9653a863a7.png', '/uploads/picture/20180514/5af9653a863a7.png', '', '', 1, 1526293818);
INSERT INTO `rk_picture` VALUES (2330, '/uploads/picture/20180514/5af965534b8ea.png', '/uploads/picture/20180514/5af965534b8ea.png', '', '', 1, 1526293843);
INSERT INTO `rk_picture` VALUES (2331, '/uploads/picture/20180514/5af9663b29188.png', '/uploads/picture/20180514/5af9663b29188.png', '', '', 1, 1526294075);
INSERT INTO `rk_picture` VALUES (2332, '/uploads/picture/20180514/5af9665fd5cb5.png', '/uploads/picture/20180514/5af9665fd5cb5.png', '', '', 1, 1526294111);
INSERT INTO `rk_picture` VALUES (2333, '/uploads/picture/20180514/5af96674514f8.png', '/uploads/picture/20180514/5af96674514f8.png', '', '', 1, 1526294132);
INSERT INTO `rk_picture` VALUES (2334, '/uploads/picture/20180514/5af9669df078b.png', '/uploads/picture/20180514/5af9669df078b.png', '', '', 1, 1526294173);
INSERT INTO `rk_picture` VALUES (2335, '/uploads/picture/20180514/5af966c19ed8c.png', '/uploads/picture/20180514/5af966c19ed8c.png', '', '', 1, 1526294209);
INSERT INTO `rk_picture` VALUES (2336, '/uploads/picture/20180514/5af966e320377.png', '/uploads/picture/20180514/5af966e320377.png', '', '', 1, 1526294243);
INSERT INTO `rk_picture` VALUES (2337, '/uploads/picture/20180514/5af9670a8d724.png', '/uploads/picture/20180514/5af9670a8d724.png', '', '', 1, 1526294282);
INSERT INTO `rk_picture` VALUES (2338, '/uploads/picture/20180514/5af9671c8fd8a.png', '/uploads/picture/20180514/5af9671c8fd8a.png', '', '', 1, 1526294300);
INSERT INTO `rk_picture` VALUES (2339, '/uploads/picture/20180514/5af9672ea854e.png', '/uploads/picture/20180514/5af9672ea854e.png', '', '', 1, 1526294318);
INSERT INTO `rk_picture` VALUES (2340, '/uploads/picture/20180514/5af9673eab3aa.png', '/uploads/picture/20180514/5af9673eab3aa.png', '', '', 1, 1526294334);
INSERT INTO `rk_picture` VALUES (2341, '/uploads/picture/20180514/5af9677ca78fa.png', '/uploads/picture/20180514/5af9677ca78fa.png', '', '', 1, 1526294396);
INSERT INTO `rk_picture` VALUES (2342, '/uploads/picture/20180514/5af96791652b8.png', '/uploads/picture/20180514/5af96791652b8.png', '', '', 1, 1526294417);
INSERT INTO `rk_picture` VALUES (2343, '/uploads/picture/20180514/5af967bd7c219.png', '/uploads/picture/20180514/5af967bd7c219.png', '', '', 1, 1526294461);
INSERT INTO `rk_picture` VALUES (2344, '/uploads/picture/20180514/5af967dd02c1c.png', '/uploads/picture/20180514/5af967dd02c1c.png', '', '', 1, 1526294493);
INSERT INTO `rk_picture` VALUES (2345, '/uploads/picture/20180514/5af967f999e9f.png', '/uploads/picture/20180514/5af967f999e9f.png', '', '', 1, 1526294521);
INSERT INTO `rk_picture` VALUES (2346, '/uploads/picture/20180514/5af9680bd5b02.png', '/uploads/picture/20180514/5af9680bd5b02.png', '', '', 1, 1526294539);
INSERT INTO `rk_picture` VALUES (2347, '/uploads/picture/20180514/5af9682659670.png', '/uploads/picture/20180514/5af9682659670.png', '', '', 1, 1526294566);
INSERT INTO `rk_picture` VALUES (2348, '/uploads/picture/20180514/5af968f1061a7.png', '/uploads/picture/20180514/5af968f1061a7.png', '', '', 1, 1526294769);
INSERT INTO `rk_picture` VALUES (2349, '/uploads/picture/20180514/5af9694cc77bc.png', '/uploads/picture/20180514/5af9694cc77bc.png', '', '', 1, 1526294860);
INSERT INTO `rk_picture` VALUES (2350, '/uploads/picture/20180514/5af96974bc493.png', '/uploads/picture/20180514/5af96974bc493.png', '', '', 1, 1526294900);
INSERT INTO `rk_picture` VALUES (2351, '/uploads/picture/20180514/5af9699ccfe31.png', '/uploads/picture/20180514/5af9699ccfe31.png', '', '', 1, 1526294940);
INSERT INTO `rk_picture` VALUES (2352, '/uploads/picture/20180514/5af96ad21cc9b.png', '/uploads/picture/20180514/5af96ad21cc9b.png', '', '', 1, 1526295250);
INSERT INTO `rk_picture` VALUES (2353, '/uploads/picture/20180514/5af96ae300960.png', '/uploads/picture/20180514/5af96ae300960.png', '', '', 1, 1526295266);
INSERT INTO `rk_picture` VALUES (2354, '/uploads/picture/20180514/5af96affacbf2.png', '/uploads/picture/20180514/5af96affacbf2.png', '', '', 1, 1526295295);
INSERT INTO `rk_picture` VALUES (2355, '/uploads/picture/20180514/5af96c06e9d9b.png', '/uploads/picture/20180514/5af96c06e9d9b.png', '', '', 1, 1526295558);
INSERT INTO `rk_picture` VALUES (2356, '/uploads/picture/20180514/5af96c284c35c.png', '/uploads/picture/20180514/5af96c284c35c.png', '', '', 1, 1526295592);
INSERT INTO `rk_picture` VALUES (2357, '/uploads/picture/20180514/5af96ca80f2ec.png', '/uploads/picture/20180514/5af96ca80f2ec.png', '', '', 1, 1526295720);
INSERT INTO `rk_picture` VALUES (2358, '/uploads/picture/20180514/5af96cd6a802f.png', '/uploads/picture/20180514/5af96cd6a802f.png', '', '', 1, 1526295766);
INSERT INTO `rk_picture` VALUES (2359, '/uploads/picture/20180514/5af96d1547624.png', '/uploads/picture/20180514/5af96d1547624.png', '', '', 1, 1526295829);
INSERT INTO `rk_picture` VALUES (2360, '/uploads/picture/20180514/5af96d3ee2433.png', '/uploads/picture/20180514/5af96d3ee2433.png', '', '', 1, 1526295870);
INSERT INTO `rk_picture` VALUES (2361, '/uploads/picture/20180514/5af96da0b96d5.png', '/uploads/picture/20180514/5af96da0b96d5.png', '', '', 1, 1526295968);
INSERT INTO `rk_picture` VALUES (2362, '/uploads/picture/20180514/5af96e94e2566.png', '/uploads/picture/20180514/5af96e94e2566.png', '', '', 1, 1526296212);
INSERT INTO `rk_picture` VALUES (2363, '/uploads/picture/20180514/5af96ef5531b4.png', '/uploads/picture/20180514/5af96ef5531b4.png', '', '', 1, 1526296309);
INSERT INTO `rk_picture` VALUES (2364, '/uploads/picture/20180514/5af96f2f545b6.png', '/uploads/picture/20180514/5af96f2f545b6.png', '', '', 1, 1526296367);
INSERT INTO `rk_picture` VALUES (2365, '/uploads/picture/20180514/5af9702c7d058.png', '/uploads/picture/20180514/5af9702c7d058.png', '', '', 1, 1526296620);
INSERT INTO `rk_picture` VALUES (2366, '/uploads/picture/20180514/5af970c89ce67.png', '/uploads/picture/20180514/5af970c89ce67.png', '', '', 1, 1526296776);
INSERT INTO `rk_picture` VALUES (2367, '/uploads/picture/20180514/5af9722f45661.png', '/uploads/picture/20180514/5af9722f45661.png', '', '', 1, 1526297135);
INSERT INTO `rk_picture` VALUES (2368, '/uploads/picture/20180514/5af974579a25b.png', '/uploads/picture/20180514/5af974579a25b.png', '', '', 1, 1526297687);
INSERT INTO `rk_picture` VALUES (2369, '/uploads/picture/20180514/5af974b8d9348.png', '/uploads/picture/20180514/5af974b8d9348.png', '', '', 1, 1526297784);
INSERT INTO `rk_picture` VALUES (2370, '/uploads/picture/20180514/5af9753d44134.png', '/uploads/picture/20180514/5af9753d44134.png', '', '', 1, 1526297917);
INSERT INTO `rk_picture` VALUES (2371, '/uploads/picture/20180514/5af9758a690d7.png', '/uploads/picture/20180514/5af9758a690d7.png', '', '', 1, 1526297994);
INSERT INTO `rk_picture` VALUES (2372, '/uploads/picture/20180514/5af975b1e41f2.png', '/uploads/picture/20180514/5af975b1e41f2.png', '', '', 1, 1526298033);
INSERT INTO `rk_picture` VALUES (2373, '/uploads/picture/20180514/5af976af0fccd.png', '/uploads/picture/20180514/5af976af0fccd.png', '', '', 1, 1526298287);
INSERT INTO `rk_picture` VALUES (2374, '/uploads/picture/20180514/5af978e0c5110.png', '/uploads/picture/20180514/5af978e0c5110.png', '', '', 1, 1526298848);
INSERT INTO `rk_picture` VALUES (2375, '/uploads/picture/20180515/5afa28eede177.png', '/uploads/picture/20180515/5afa28eede177.png', '', '', 1, 1526343918);
INSERT INTO `rk_picture` VALUES (2376, '/uploads/picture/20180515/5afa291d60f50.png', '/uploads/picture/20180515/5afa291d60f50.png', '', '', 1, 1526343965);
INSERT INTO `rk_picture` VALUES (2377, '/uploads/picture/20180515/5afa2934ac0ee.png', '/uploads/picture/20180515/5afa2934ac0ee.png', '', '', 1, 1526343988);
INSERT INTO `rk_picture` VALUES (2378, '/uploads/picture/20180515/5afa2ab841e55.png', '/uploads/picture/20180515/5afa2ab841e55.png', '', '', 1, 1526344376);
INSERT INTO `rk_picture` VALUES (2379, '/uploads/picture/20180515/5afa2b0e3b348.png', '/uploads/picture/20180515/5afa2b0e3b348.png', '', '', 1, 1526344462);
INSERT INTO `rk_picture` VALUES (2380, '/uploads/picture/20180515/5afa2b6e6dd89.png', '/uploads/picture/20180515/5afa2b6e6dd89.png', '', '', 1, 1526344558);
INSERT INTO `rk_picture` VALUES (2381, '/uploads/picture/20180515/5afa2cb0e10dd.png', '/uploads/picture/20180515/5afa2cb0e10dd.png', '', '', 1, 1526344880);
INSERT INTO `rk_picture` VALUES (2382, '/uploads/picture/20180515/5afa2cdcc4145.png', '/uploads/picture/20180515/5afa2cdcc4145.png', '', '', 1, 1526344924);
INSERT INTO `rk_picture` VALUES (2383, '/uploads/picture/20180515/5afa2e3126eb4.png', '/uploads/picture/20180515/5afa2e3126eb4.png', '', '', 1, 1526345265);
INSERT INTO `rk_picture` VALUES (2384, '/uploads/picture/20180515/5afa2fc04d90f.png', '/uploads/picture/20180515/5afa2fc04d90f.png', '', '', 1, 1526345664);
INSERT INTO `rk_picture` VALUES (2385, '/uploads/picture/20180515/5afa2fd04bf42.png', '/uploads/picture/20180515/5afa2fd04bf42.png', '', '', 1, 1526345680);
INSERT INTO `rk_picture` VALUES (2386, '/uploads/picture/20180515/5afa3024e73e6.png', '/uploads/picture/20180515/5afa3024e73e6.png', '', '', 1, 1526345764);
INSERT INTO `rk_picture` VALUES (2387, '/uploads/picture/20180515/5afa30526f4f8.png', '/uploads/picture/20180515/5afa30526f4f8.png', '', '', 1, 1526345810);
INSERT INTO `rk_picture` VALUES (2388, '/uploads/picture/20180515/5afa307ae60cc.png', '/uploads/picture/20180515/5afa307ae60cc.png', '', '', 1, 1526345850);
INSERT INTO `rk_picture` VALUES (2389, '/uploads/picture/20180515/5afa30a008622.png', '/uploads/picture/20180515/5afa30a008622.png', '', '', 1, 1526345888);
INSERT INTO `rk_picture` VALUES (2390, '/uploads/picture/20180515/5afa31c360649.png', '/uploads/picture/20180515/5afa31c360649.png', '', '', 1, 1526346179);
INSERT INTO `rk_picture` VALUES (2391, '/uploads/picture/20180515/5afa31d2a6143.png', '/uploads/picture/20180515/5afa31d2a6143.png', '', '', 1, 1526346194);
INSERT INTO `rk_picture` VALUES (2392, '/uploads/picture/20180515/5afa332fba05e.png', '/uploads/picture/20180515/5afa332fba05e.png', '', '', 1, 1526346543);
INSERT INTO `rk_picture` VALUES (2393, '/uploads/picture/20180515/5afa333c026d2.png', '/uploads/picture/20180515/5afa333c026d2.png', '', '', 1, 1526346556);
INSERT INTO `rk_picture` VALUES (2394, '/uploads/picture/20180515/5afa334abd089.png', '/uploads/picture/20180515/5afa334abd089.png', '', '', 1, 1526346570);
INSERT INTO `rk_picture` VALUES (2395, '/uploads/picture/20180515/5afa335c13fd7.png', '/uploads/picture/20180515/5afa335c13fd7.png', '', '', 1, 1526346588);
INSERT INTO `rk_picture` VALUES (2396, '/uploads/picture/20180515/5afa3369b1c0f.png', '/uploads/picture/20180515/5afa3369b1c0f.png', '', '', 1, 1526346601);
INSERT INTO `rk_picture` VALUES (2397, '/uploads/picture/20180515/5afa33bd989ab.png', '/uploads/picture/20180515/5afa33bd989ab.png', '', '', 1, 1526346685);
INSERT INTO `rk_picture` VALUES (2398, '/uploads/picture/20180515/5afa33f49ed01.png', '/uploads/picture/20180515/5afa33f49ed01.png', '', '', 1, 1526346740);
INSERT INTO `rk_picture` VALUES (2399, '/uploads/picture/20180515/5afa3404039f0.png', '/uploads/picture/20180515/5afa3404039f0.png', '', '', 1, 1526346756);
INSERT INTO `rk_picture` VALUES (2400, '/uploads/picture/20180515/5afa3422e07d5.png', '/uploads/picture/20180515/5afa3422e07d5.png', '', '', 1, 1526346786);
INSERT INTO `rk_picture` VALUES (2401, '/uploads/picture/20180515/5afa38ba1dabc.png', '/uploads/picture/20180515/5afa38ba1dabc.png', '', '', 1, 1526347962);
INSERT INTO `rk_picture` VALUES (2402, '/uploads/picture/20180515/5afa39fda95a2.png', '/uploads/picture/20180515/5afa39fda95a2.png', '', '', 1, 1526348285);
INSERT INTO `rk_picture` VALUES (2403, '/uploads/picture/20180515/5afa3a54d560a.png', '/uploads/picture/20180515/5afa3a54d560a.png', '', '', 1, 1526348372);
INSERT INTO `rk_picture` VALUES (2404, '/uploads/picture/20180515/5afa3aa87d10b.png', '/uploads/picture/20180515/5afa3aa87d10b.png', '', '', 1, 1526348456);
INSERT INTO `rk_picture` VALUES (2405, '/uploads/picture/20180515/5afa3b0acb500.png', '/uploads/picture/20180515/5afa3b0acb500.png', '', '', 1, 1526348554);
INSERT INTO `rk_picture` VALUES (2406, '/uploads/picture/20180515/5afa3b5174b00.png', '/uploads/picture/20180515/5afa3b5174b00.png', '', '', 1, 1526348625);
INSERT INTO `rk_picture` VALUES (2407, '/uploads/picture/20180515/5afa49ae3fe6a.png', '/uploads/picture/20180515/5afa49ae3fe6a.png', '', '', 1, 1526352302);
INSERT INTO `rk_picture` VALUES (2408, '/uploads/picture/20180515/5afa49c1e6852.png', '/uploads/picture/20180515/5afa49c1e6852.png', '', '', 1, 1526352321);
INSERT INTO `rk_picture` VALUES (2409, '/uploads/picture/20180515/5afa550887e60.png', '/uploads/picture/20180515/5afa550887e60.png', '', '', 1, 1526355208);
INSERT INTO `rk_picture` VALUES (2410, '/uploads/picture/20180515/5afa560718761.png', '/uploads/picture/20180515/5afa560718761.png', '', '', 1, 1526355463);
INSERT INTO `rk_picture` VALUES (2411, '/uploads/picture/20180515/5afa5640d1406.png', '/uploads/picture/20180515/5afa5640d1406.png', '', '', 1, 1526355520);
INSERT INTO `rk_picture` VALUES (2412, '/uploads/picture/20180515/5afa598b5162b.png', '/uploads/picture/20180515/5afa598b5162b.png', '', '', 1, 1526356363);
INSERT INTO `rk_picture` VALUES (2413, '/uploads/picture/20180515/5afa59b085611.png', '/uploads/picture/20180515/5afa59b085611.png', '', '', 1, 1526356400);
INSERT INTO `rk_picture` VALUES (2414, '/uploads/picture/20180515/5afa59c16d52e.png', '/uploads/picture/20180515/5afa59c16d52e.png', '', '', 1, 1526356417);
INSERT INTO `rk_picture` VALUES (2415, '/uploads/picture/20180515/5afa59ce24c48.png', '/uploads/picture/20180515/5afa59ce24c48.png', '', '', 1, 1526356430);
INSERT INTO `rk_picture` VALUES (2416, '/uploads/picture/20180515/5afa59d75c220.png', '/uploads/picture/20180515/5afa59d75c220.png', '', '', 1, 1526356439);
INSERT INTO `rk_picture` VALUES (2417, '/uploads/picture/20180515/5afa5a3369112.png', '/uploads/picture/20180515/5afa5a3369112.png', '', '', 1, 1526356531);
INSERT INTO `rk_picture` VALUES (2418, '/uploads/picture/20180515/5afa5a6fa24da.png', '/uploads/picture/20180515/5afa5a6fa24da.png', '', '', 1, 1526356591);
INSERT INTO `rk_picture` VALUES (2419, '/uploads/picture/20180515/5afa5b9a5230a.png', '/uploads/picture/20180515/5afa5b9a5230a.png', '', '', 1, 1526356890);
INSERT INTO `rk_picture` VALUES (2420, '/uploads/picture/20180516/01c3112dcf4af0d85e67abd9739efcb1.jpg', '/uploads/picture/20180516/01c3112dcf4af0d85e67abd9739efcb1.jpg', '', '', 1, 1526400941);
INSERT INTO `rk_picture` VALUES (2421, '/uploads/picture/20180516/0f4569b0ce95d0f77ed632bec68908c0.jpg', '/uploads/picture/20180516/0f4569b0ce95d0f77ed632bec68908c0.jpg', '', '', 1, 1526401107);
INSERT INTO `rk_picture` VALUES (2422, '/uploads/picture/20180516/3f470451440166e3184953af103a4ab8.jpg', '/uploads/picture/20180516/3f470451440166e3184953af103a4ab8.jpg', '', '', 1, 1526425261);
INSERT INTO `rk_picture` VALUES (2423, '/uploads/picture/20180516/5f8eb8d3bfc31c67add6b30b262845b3.jpg', '/uploads/picture/20180516/5f8eb8d3bfc31c67add6b30b262845b3.jpg', '', '', 1, 1526426502);
INSERT INTO `rk_picture` VALUES (2424, '/uploads/picture/20180516/80dea705c3deb89a596cace0532ca1dc.jpg', '/uploads/picture/20180516/80dea705c3deb89a596cace0532ca1dc.jpg', '', '', 1, 1526426512);
INSERT INTO `rk_picture` VALUES (2425, '/uploads/picture/20180516/47af518d80e11c796ed3d7f9c2987f3f.jpg', '/uploads/picture/20180516/47af518d80e11c796ed3d7f9c2987f3f.jpg', '', '', 1, 1526436466);
INSERT INTO `rk_picture` VALUES (2426, '/uploads/picture/20180516/e7795105248bf7215e90f9de2009323f.jpg', '/uploads/picture/20180516/e7795105248bf7215e90f9de2009323f.jpg', '', '', 1, 1526439672);
INSERT INTO `rk_picture` VALUES (2427, '/uploads/picture/20180516/334e2e41a5675fe89269cf030aad3bed.jpg', '/uploads/picture/20180516/334e2e41a5675fe89269cf030aad3bed.jpg', '', '', 1, 1526447091);
INSERT INTO `rk_picture` VALUES (2428, '/uploads/picture/20180516/736a620d0f8cfa4cc2d4b45c6eb28975.jpg', '/uploads/picture/20180516/736a620d0f8cfa4cc2d4b45c6eb28975.jpg', '', '', 1, 1526447119);
INSERT INTO `rk_picture` VALUES (2429, '/uploads/picture/20180516/24055d99246a3c637d68a5d9b5d5252b.jpg', '/uploads/picture/20180516/24055d99246a3c637d68a5d9b5d5252b.jpg', '', '', 1, 1526454551);
INSERT INTO `rk_picture` VALUES (2430, '/uploads/picture/20180516/d2f62109392ed2fc12fb7cabc94d9bc7.jpg', '/uploads/picture/20180516/d2f62109392ed2fc12fb7cabc94d9bc7.jpg', '', '', 1, 1526454551);
INSERT INTO `rk_picture` VALUES (2431, '/uploads/picture/20180516/1a1505170ea4002cc5321235dd08b6c5.jpg', '/uploads/picture/20180516/1a1505170ea4002cc5321235dd08b6c5.jpg', '', '', 1, 1526454993);
INSERT INTO `rk_picture` VALUES (2432, '/uploads/picture/20180516/abacd97317a39108c68154c06dfdc8a1.jpg', '/uploads/picture/20180516/abacd97317a39108c68154c06dfdc8a1.jpg', '', '', 1, 1526455541);
INSERT INTO `rk_picture` VALUES (2433, '/uploads/picture/20180517/cfaa227106e45c8c62d898d2eeee8259.jpg', '/uploads/picture/20180517/cfaa227106e45c8c62d898d2eeee8259.jpg', '', '', 1, 1526517890);
INSERT INTO `rk_picture` VALUES (2434, '/uploads/picture/20180517/7380d83a567cef270a74bc03e77b2553.jpg', '/uploads/picture/20180517/7380d83a567cef270a74bc03e77b2553.jpg', '', '', 1, 1526525291);
INSERT INTO `rk_picture` VALUES (2435, '/uploads/picture/20180517/f9bb7cd8281ae9cf4a458d3e7acded95.png', '/uploads/picture/20180517/f9bb7cd8281ae9cf4a458d3e7acded95.png', '', '', 1, 1526537560);
INSERT INTO `rk_picture` VALUES (2436, '/uploads/picture/20180517/c382922e6f58463afc507ad4d7f20f33.png', '/uploads/picture/20180517/c382922e6f58463afc507ad4d7f20f33.png', '', '', 1, 1526537609);
INSERT INTO `rk_picture` VALUES (2437, '/uploads/picture/20180517/4a83e8aa59308e7e54f61e2f66c3c5d6.png', '/uploads/picture/20180517/4a83e8aa59308e7e54f61e2f66c3c5d6.png', '', '', 1, 1526537650);
INSERT INTO `rk_picture` VALUES (2438, '/uploads/picture/20180517/d2ad3a4b3fbe4e220967f76edc8c8834.png', '/uploads/picture/20180517/d2ad3a4b3fbe4e220967f76edc8c8834.png', '', '', 1, 1526537685);
INSERT INTO `rk_picture` VALUES (2439, '/uploads/picture/20180517/96fabb71e7020bbc045267fd194d3a1a.png', '/uploads/picture/20180517/96fabb71e7020bbc045267fd194d3a1a.png', '', '', 1, 1526537760);
INSERT INTO `rk_picture` VALUES (2440, '/uploads/picture/20180517/2c755e07eadb50fd47931f93238dc719.jpg', '/uploads/picture/20180517/2c755e07eadb50fd47931f93238dc719.jpg', '', '', 1, 1526538360);
INSERT INTO `rk_picture` VALUES (2441, '/uploads/picture/20180517/eeef0334b4cf0aeefeff9901d72adb3c.jpg', '/uploads/picture/20180517/eeef0334b4cf0aeefeff9901d72adb3c.jpg', '', '', 1, 1526538983);
INSERT INTO `rk_picture` VALUES (2442, '/uploads/picture/20180517/6df54629060f937e05a7b646ef284bd9.jpg', '/uploads/picture/20180517/6df54629060f937e05a7b646ef284bd9.jpg', '', '', 1, 1526539815);
INSERT INTO `rk_picture` VALUES (2443, '/uploads/picture/20180517/6e55aef8aef611ba9bb6a35f9bb176e2.jpg', '/uploads/picture/20180517/6e55aef8aef611ba9bb6a35f9bb176e2.jpg', '', '', 1, 1526539982);
INSERT INTO `rk_picture` VALUES (2444, '/uploads/picture/20180517/c8cac626d86bab80ec847ab05d3fc9d1.jpg', '/uploads/picture/20180517/c8cac626d86bab80ec847ab05d3fc9d1.jpg', '', '', 1, 1526540027);
INSERT INTO `rk_picture` VALUES (2445, '/uploads/picture/20180517/a05010c960bac3f31645b186fda83a60.jpg', '/uploads/picture/20180517/a05010c960bac3f31645b186fda83a60.jpg', '', '', 1, 1526540040);
INSERT INTO `rk_picture` VALUES (2446, '/uploads/picture/20180517/5607361d50f53b7e3e79c1502472cc50.jpg', '/uploads/picture/20180517/5607361d50f53b7e3e79c1502472cc50.jpg', '', '', 1, 1526540056);
INSERT INTO `rk_picture` VALUES (2447, '/uploads/picture/20180517/f9a724a94344d5ce796c6733a29c29b1.jpg', '/uploads/picture/20180517/f9a724a94344d5ce796c6733a29c29b1.jpg', '', '', 1, 1526540207);
INSERT INTO `rk_picture` VALUES (2448, '/uploads/picture/20180518/7eba09596556f1d26910f6215585a3cc.jpg', '/uploads/picture/20180518/7eba09596556f1d26910f6215585a3cc.jpg', '', '', 1, 1526612960);
INSERT INTO `rk_picture` VALUES (2449, '/uploads/picture/20180518/369188a9d68670ec496b973dbbc4fad6.jpg', '/uploads/picture/20180518/369188a9d68670ec496b973dbbc4fad6.jpg', '', '', 1, 1526612961);
INSERT INTO `rk_picture` VALUES (2450, '/uploads/picture/20180518/c5075de73800e6a57d15606b2559fe25.jpg', '/uploads/picture/20180518/c5075de73800e6a57d15606b2559fe25.jpg', '', '', 1, 1526612975);
INSERT INTO `rk_picture` VALUES (2451, '/uploads/picture/20180518/6dc79f493302aca16eb6b9c9986a3c52.jpg', '/uploads/picture/20180518/6dc79f493302aca16eb6b9c9986a3c52.jpg', '', '', 1, 1526620662);
INSERT INTO `rk_picture` VALUES (2452, '/uploads/picture/20180518/be238eca2751c2d94b4a38219413055e.jpg', '/uploads/picture/20180518/be238eca2751c2d94b4a38219413055e.jpg', '', '', 1, 1526620702);
INSERT INTO `rk_picture` VALUES (2453, '/uploads/picture/20180518/0cefd891d15c84c62a3dc76f21e28ca2.jpg', '/uploads/picture/20180518/0cefd891d15c84c62a3dc76f21e28ca2.jpg', '', '', 1, 1526631694);
INSERT INTO `rk_picture` VALUES (2454, '/uploads/picture/20180518/e157ad3b22259bcc94e81a8fb324708f.jpg', '/uploads/picture/20180518/e157ad3b22259bcc94e81a8fb324708f.jpg', '', '', 1, 1526631716);
INSERT INTO `rk_picture` VALUES (2455, '/uploads/picture/20180518/a321988f0e273cd66aa0c3956a794f19.jpg', '/uploads/picture/20180518/a321988f0e273cd66aa0c3956a794f19.jpg', '', '', 1, 1526631787);
INSERT INTO `rk_picture` VALUES (2456, '/uploads/picture/20180518/6c35d02b6ed5ccca81b1719b3c2f52f5.jpg', '/uploads/picture/20180518/6c35d02b6ed5ccca81b1719b3c2f52f5.jpg', '', '', 1, 1526631956);
INSERT INTO `rk_picture` VALUES (2457, '/uploads/picture/20180518/c6449d891a9aa15f4aa33eae9949cfe6.jpg', '/uploads/picture/20180518/c6449d891a9aa15f4aa33eae9949cfe6.jpg', '', '', 1, 1526631969);
INSERT INTO `rk_picture` VALUES (2458, '/uploads/picture/20180518/9b0180dfdf3de03b6592756ffc526ac1.jpg', '/uploads/picture/20180518/9b0180dfdf3de03b6592756ffc526ac1.jpg', '', '', 1, 1526632088);
INSERT INTO `rk_picture` VALUES (2459, '/uploads/picture/20180518/a93ac8285fd1e027885c81b3876c4bc7.jpg', '/uploads/picture/20180518/a93ac8285fd1e027885c81b3876c4bc7.jpg', '', '', 1, 1526632117);
INSERT INTO `rk_picture` VALUES (2460, '/uploads/picture/20180518/ceb4a5f5258e2953500dd96c741c473e.jpg', '/uploads/picture/20180518/ceb4a5f5258e2953500dd96c741c473e.jpg', '', '', 1, 1526632153);
INSERT INTO `rk_picture` VALUES (2461, '/uploads/picture/20180518/a021b4f0bdd22ca0e0b8d9d732ec7512.jpg', '/uploads/picture/20180518/a021b4f0bdd22ca0e0b8d9d732ec7512.jpg', '', '', 1, 1526632357);
INSERT INTO `rk_picture` VALUES (2462, '/uploads/picture/20180518/25b676624d1de0c6b1f833687c76866f.jpg', '/uploads/picture/20180518/25b676624d1de0c6b1f833687c76866f.jpg', '', '', 1, 1526632367);
INSERT INTO `rk_picture` VALUES (2463, '/uploads/picture/20180518/47644c7dc8ab5bffad3c219c8cfb16b9.jpg', '/uploads/picture/20180518/47644c7dc8ab5bffad3c219c8cfb16b9.jpg', '', '', 1, 1526646162);
INSERT INTO `rk_picture` VALUES (2464, '/uploads/picture/20180518/53d100626d71d20b603938e272cead45.jpg', '/uploads/picture/20180518/53d100626d71d20b603938e272cead45.jpg', '', '', 1, 1526646201);
INSERT INTO `rk_picture` VALUES (2465, '/uploads/picture/20180518/32a20322984d577d008aa10eceacb4fd.jpg', '/uploads/picture/20180518/32a20322984d577d008aa10eceacb4fd.jpg', '', '', 1, 1526646276);
INSERT INTO `rk_picture` VALUES (2466, '/uploads/picture/20180518/e527f1b7e4df5ae0b8961958e13858a9.jpg', '/uploads/picture/20180518/e527f1b7e4df5ae0b8961958e13858a9.jpg', '', '', 1, 1526646324);
INSERT INTO `rk_picture` VALUES (2467, '/uploads/picture/20180518/a870a15fc7703f5905def2fbffb4e4c5.jpg', '/uploads/picture/20180518/a870a15fc7703f5905def2fbffb4e4c5.jpg', '', '', 1, 1526646373);
INSERT INTO `rk_picture` VALUES (2468, '/uploads/picture/20180518/353ce889aacdde3c25129a04feadad97.jpg', '/uploads/picture/20180518/353ce889aacdde3c25129a04feadad97.jpg', '', '', 1, 1526646395);
INSERT INTO `rk_picture` VALUES (2469, '/uploads/picture/20180518/b0b0170b4eece047ee3ba2de16d54f5f.jpg', '/uploads/picture/20180518/b0b0170b4eece047ee3ba2de16d54f5f.jpg', '', '', 1, 1526646423);
INSERT INTO `rk_picture` VALUES (2470, '/uploads/picture/20180518/048dd62d261f37462fe0494ef5b125b1.png', '/uploads/picture/20180518/048dd62d261f37462fe0494ef5b125b1.png', '', '', 1, 1526646899);
INSERT INTO `rk_picture` VALUES (2471, '/uploads/picture/20180518/0b131ea0c8326ab21a2449cf3307c81b.png', '/uploads/picture/20180518/0b131ea0c8326ab21a2449cf3307c81b.png', '', '', 1, 1526646939);
INSERT INTO `rk_picture` VALUES (2472, '/uploads/picture/20180518/ede769384dcd813c208551fd29f29ccf.png', '/uploads/picture/20180518/ede769384dcd813c208551fd29f29ccf.png', '', '', 1, 1526646983);
INSERT INTO `rk_picture` VALUES (2473, '/uploads/picture/20180518/16500c20107c048c75bd8e0887f4ef19.png', '/uploads/picture/20180518/16500c20107c048c75bd8e0887f4ef19.png', '', '', 1, 1526647034);
INSERT INTO `rk_picture` VALUES (2474, '/uploads/picture/20180518/e7162ef6c82b039b660c07504632d1d1.png', '/uploads/picture/20180518/e7162ef6c82b039b660c07504632d1d1.png', '', '', 1, 1526647117);
INSERT INTO `rk_picture` VALUES (2475, '/uploads/picture/20180518/f8fe1f0aa255213b18133e840c0fd6c3.jpg', '/uploads/picture/20180518/f8fe1f0aa255213b18133e840c0fd6c3.jpg', '', '', 1, 1526649164);
INSERT INTO `rk_picture` VALUES (2476, '/uploads/picture/20180518/09eef2a0b59b89477678d2bde7ba5234.jpg', '/uploads/picture/20180518/09eef2a0b59b89477678d2bde7ba5234.jpg', '', '', 1, 1526649457);
INSERT INTO `rk_picture` VALUES (2477, '/uploads/picture/20180518/b5853d0e98899d8b4a05f8d99de11457.jpg', '/uploads/picture/20180518/b5853d0e98899d8b4a05f8d99de11457.jpg', '', '', 1, 1526650012);
INSERT INTO `rk_picture` VALUES (2478, '/uploads/picture/20180518/723065603310f700b04da8ba1f43492c.jpg', '/uploads/picture/20180518/723065603310f700b04da8ba1f43492c.jpg', '', '', 1, 1526650057);
INSERT INTO `rk_picture` VALUES (2479, '/uploads/picture/20180518/8922c752370f28ef931acb1489a72222.jpg', '/uploads/picture/20180518/8922c752370f28ef931acb1489a72222.jpg', '', '', 1, 1526650078);
INSERT INTO `rk_picture` VALUES (2480, '/uploads/picture/20180518/65cedcd4f9bd3abfb1b608fda3e2cd8e.jpg', '/uploads/picture/20180518/65cedcd4f9bd3abfb1b608fda3e2cd8e.jpg', '', '', 1, 1526651553);
INSERT INTO `rk_picture` VALUES (2481, '/uploads/picture/20180518/3099079d2a714035cd1632b1f52952f8.jpg', '/uploads/picture/20180518/3099079d2a714035cd1632b1f52952f8.jpg', '', '', 1, 1526651799);
INSERT INTO `rk_picture` VALUES (2482, '/uploads/picture/20180518/69f0c9f4d2140b33194bdd9dc9f28c7c.jpg', '/uploads/picture/20180518/69f0c9f4d2140b33194bdd9dc9f28c7c.jpg', '', '', 1, 1526656562);
INSERT INTO `rk_picture` VALUES (2483, '/uploads/picture/20180519/e8299667c083848c795f822e6074ab3f.jpg', '/uploads/picture/20180519/e8299667c083848c795f822e6074ab3f.jpg', '', '', 1, 1526688497);
INSERT INTO `rk_picture` VALUES (2484, '/uploads/picture/20180519/d74e5a6a2a9aea80b7138e2661f2a206.jpg', '/uploads/picture/20180519/d74e5a6a2a9aea80b7138e2661f2a206.jpg', '', '', 1, 1526717105);
INSERT INTO `rk_picture` VALUES (2485, '/uploads/picture/20180519/a192c2057e850a25a790b69d312c747f.jpg', '/uploads/picture/20180519/a192c2057e850a25a790b69d312c747f.jpg', '', '', 1, 1526717882);
INSERT INTO `rk_picture` VALUES (2486, '/uploads/picture/20180519/364e8c9470bbc6bbf0eab52331b1572b.jpg', '/uploads/picture/20180519/364e8c9470bbc6bbf0eab52331b1572b.jpg', '', '', 1, 1526717964);
INSERT INTO `rk_picture` VALUES (2487, '/uploads/picture/20180519/879bc0f163dc2b98b8bdf6b9e668ee15.jpg', '/uploads/picture/20180519/879bc0f163dc2b98b8bdf6b9e668ee15.jpg', '', '', 1, 1526718175);
INSERT INTO `rk_picture` VALUES (2488, '/uploads/picture/20180519/4d183b1c8752df99e81ac1ffbcb165aa.jpg', '/uploads/picture/20180519/4d183b1c8752df99e81ac1ffbcb165aa.jpg', '', '', 1, 1526722461);
INSERT INTO `rk_picture` VALUES (2489, '/uploads/picture/20180519/ce118b88faef6be6fea73fa246f3b56f.jpg', '/uploads/picture/20180519/ce118b88faef6be6fea73fa246f3b56f.jpg', '', '', 1, 1526722638);
INSERT INTO `rk_picture` VALUES (2490, '/uploads/picture/20180519/cdf271e3ad463fef28b2183e97d4e4d8.jpg', '/uploads/picture/20180519/cdf271e3ad463fef28b2183e97d4e4d8.jpg', '', '', 1, 1526722822);
INSERT INTO `rk_picture` VALUES (2491, '/uploads/picture/20180519/86a91d978516a816c11a4449c71082a5.jpg', '/uploads/picture/20180519/86a91d978516a816c11a4449c71082a5.jpg', '', '', 1, 1526722848);
INSERT INTO `rk_picture` VALUES (2492, '/uploads/picture/20180519/9673f04e6d69742e1795bc49bb3e1ec4.jpg', '/uploads/picture/20180519/9673f04e6d69742e1795bc49bb3e1ec4.jpg', '', '', 1, 1526722879);
INSERT INTO `rk_picture` VALUES (2493, '/uploads/picture/20180519/82a5abb4a23ea9bfe1b2e13c6b161cc6.jpg', '/uploads/picture/20180519/82a5abb4a23ea9bfe1b2e13c6b161cc6.jpg', '', '', 1, 1526725247);
INSERT INTO `rk_picture` VALUES (2494, '/uploads/picture/20180519/2c35546a009b4d1c6dcea317782ecf46.jpg', '/uploads/picture/20180519/2c35546a009b4d1c6dcea317782ecf46.jpg', '', '', 1, 1526725275);
INSERT INTO `rk_picture` VALUES (2495, '/uploads/picture/20180519/5bee7918a6fd1805d1397ae3a4032829.jpg', '/uploads/picture/20180519/5bee7918a6fd1805d1397ae3a4032829.jpg', '', '', 1, 1526743298);
INSERT INTO `rk_picture` VALUES (2496, '/uploads/picture/20180520/5af2c0d1e00dae36b6fb7ac6d4a7813b.jpg', '/uploads/picture/20180520/5af2c0d1e00dae36b6fb7ac6d4a7813b.jpg', '', '', 1, 1526783190);
INSERT INTO `rk_picture` VALUES (2497, '/uploads/picture/20180520/063cfee452bcf752f44209c8b5234d06.jpg', '/uploads/picture/20180520/063cfee452bcf752f44209c8b5234d06.jpg', '', '', 1, 1526829547);
INSERT INTO `rk_picture` VALUES (2498, '/uploads/picture/20180521/8db1f0da0f894b61aec9ddfc1be4bd6b.jpg', '/uploads/picture/20180521/8db1f0da0f894b61aec9ddfc1be4bd6b.jpg', '', '', 1, 1526892853);
INSERT INTO `rk_picture` VALUES (2499, '/uploads/picture/20180521/bd98504d42ef0fe28e289235b37f8e0b.jpg', '/uploads/picture/20180521/bd98504d42ef0fe28e289235b37f8e0b.jpg', '', '', 1, 1526892917);
INSERT INTO `rk_picture` VALUES (2500, '/uploads/picture/20180521/19e4fcc67f34d8488b11008e3db107d8.jpg', '/uploads/picture/20180521/19e4fcc67f34d8488b11008e3db107d8.jpg', '', '', 1, 1526893282);
INSERT INTO `rk_picture` VALUES (2501, '/uploads/picture/20180521/22daa1b26e9f07f314e20d2a94f13c61.jpg', '/uploads/picture/20180521/22daa1b26e9f07f314e20d2a94f13c61.jpg', '', '', 1, 1526917711);
INSERT INTO `rk_picture` VALUES (2502, '/uploads/picture/20180522/2115408216712715dfcdb7dfecfae52f.jpg', '/uploads/picture/20180522/2115408216712715dfcdb7dfecfae52f.jpg', '', '', 1, 1526945895);
INSERT INTO `rk_picture` VALUES (2503, '/uploads/picture/20180522/899fe739ad5898bab8b1e40186d2f163.jpg', '/uploads/picture/20180522/899fe739ad5898bab8b1e40186d2f163.jpg', '', '', 1, 1526947842);
INSERT INTO `rk_picture` VALUES (2504, '/uploads/picture/20180522/46fe44d0c49651b7e2e060e7d8cdc396.jpg', '/uploads/picture/20180522/46fe44d0c49651b7e2e060e7d8cdc396.jpg', '', '', 1, 1526947863);
INSERT INTO `rk_picture` VALUES (2505, '/uploads/picture/20180522/5578c4c15c26376512caafd68388e065.jpg', '/uploads/picture/20180522/5578c4c15c26376512caafd68388e065.jpg', '', '', 1, 1526948033);
INSERT INTO `rk_picture` VALUES (2506, '/uploads/picture/20180522/7a12591115d7d25ae65b550182996c63.jpg', '/uploads/picture/20180522/7a12591115d7d25ae65b550182996c63.jpg', '', '', 1, 1526948574);
INSERT INTO `rk_picture` VALUES (2507, '/uploads/picture/20180522/bcf047ab1f5e182c27001536d399c697.jpg', '/uploads/picture/20180522/bcf047ab1f5e182c27001536d399c697.jpg', '', '', 1, 1526952980);
INSERT INTO `rk_picture` VALUES (2508, '/uploads/picture/20180522/6a9530b1d5c871da6d00d5d1bc088be5.jpg', '/uploads/picture/20180522/6a9530b1d5c871da6d00d5d1bc088be5.jpg', '', '', 1, 1526953428);
INSERT INTO `rk_picture` VALUES (2509, '/uploads/picture/20180522/d6deca6738480fa6a45f3aa2e1e2c53a.jpg', '/uploads/picture/20180522/d6deca6738480fa6a45f3aa2e1e2c53a.jpg', '', '', 1, 1526953885);
INSERT INTO `rk_picture` VALUES (2510, '/uploads/picture/20180522/27d005ec5bd618379247114724b58462.jpg', '/uploads/picture/20180522/27d005ec5bd618379247114724b58462.jpg', '', '', 1, 1526954449);
INSERT INTO `rk_picture` VALUES (2511, '/uploads/picture/20180522/471db9b069bf6ed869fb0788dcdd4718.jpg', '/uploads/picture/20180522/471db9b069bf6ed869fb0788dcdd4718.jpg', '', '', 1, 1526954471);
INSERT INTO `rk_picture` VALUES (2512, '/uploads/picture/20180522/d6959e7df4833e6d11f36c6a3c737d2a.jpg', '/uploads/picture/20180522/d6959e7df4833e6d11f36c6a3c737d2a.jpg', '', '', 1, 1526954619);
INSERT INTO `rk_picture` VALUES (2513, '/uploads/picture/20180522/264651d03ffc5b795a5880ebb2565fee.jpg', '/uploads/picture/20180522/264651d03ffc5b795a5880ebb2565fee.jpg', '', '', 1, 1526954637);
INSERT INTO `rk_picture` VALUES (2514, '/uploads/picture/20180522/d937b1aaf219b35cda60a414e52b5900.jpg', '/uploads/picture/20180522/d937b1aaf219b35cda60a414e52b5900.jpg', '', '', 1, 1526954652);
INSERT INTO `rk_picture` VALUES (2515, '/uploads/picture/20180522/1621907adf04e192dcffe24d2690075a.jpg', '/uploads/picture/20180522/1621907adf04e192dcffe24d2690075a.jpg', '', '', 1, 1526955169);
INSERT INTO `rk_picture` VALUES (2516, '/uploads/picture/20180522/3ce80343c47241afa4e1328d05a31c4f.jpg', '/uploads/picture/20180522/3ce80343c47241afa4e1328d05a31c4f.jpg', '', '', 1, 1526955225);
INSERT INTO `rk_picture` VALUES (2517, '/uploads/picture/20180522/0ccc468491547117659db469ec3b5401.jpg', '/uploads/picture/20180522/0ccc468491547117659db469ec3b5401.jpg', '', '', 1, 1526955234);
INSERT INTO `rk_picture` VALUES (2518, '/uploads/picture/20180522/47bcb192d3244d6bde937ed17544ba52.jpg', '/uploads/picture/20180522/47bcb192d3244d6bde937ed17544ba52.jpg', '', '', 1, 1526967149);
INSERT INTO `rk_picture` VALUES (2519, '/uploads/picture/20180522/76ca7d7ebd98e3101274e040a65332be.jpg', '/uploads/picture/20180522/76ca7d7ebd98e3101274e040a65332be.jpg', '', '', 1, 1526967188);
INSERT INTO `rk_picture` VALUES (2520, '/uploads/picture/20180522/08ae15403792d427106f3f923f795fa9.jpg', '/uploads/picture/20180522/08ae15403792d427106f3f923f795fa9.jpg', '', '', 1, 1526972807);
INSERT INTO `rk_picture` VALUES (2521, '/uploads/picture/20180522/268e0bc981eb029c241d7c7c2aae09a2.jpg', '/uploads/picture/20180522/268e0bc981eb029c241d7c7c2aae09a2.jpg', '', '', 1, 1526975019);
INSERT INTO `rk_picture` VALUES (2522, '/uploads/picture/20180522/708115583e4642d5b039dd7ef68110df.jpg', '/uploads/picture/20180522/708115583e4642d5b039dd7ef68110df.jpg', '', '', 1, 1526975216);
INSERT INTO `rk_picture` VALUES (2523, '/uploads/picture/20180523/4d5d9c43033e4f50bc021fa3719ba8c7.jpg', '/uploads/picture/20180523/4d5d9c43033e4f50bc021fa3719ba8c7.jpg', '', '', 1, 1527032128);
INSERT INTO `rk_picture` VALUES (2524, '/uploads/picture/20180523/4ca28e140f43423acb08631dc7a5146d.jpg', '/uploads/picture/20180523/4ca28e140f43423acb08631dc7a5146d.jpg', '', '', 1, 1527032170);
INSERT INTO `rk_picture` VALUES (2525, '/uploads/picture/20180523/53b2950782cba59472d768b111d0bb1f.jpg', '/uploads/picture/20180523/53b2950782cba59472d768b111d0bb1f.jpg', '', '', 1, 1527037267);
INSERT INTO `rk_picture` VALUES (2526, '/uploads/picture/20180523/c79df44700e75630ee7abc8cb4d21692.jpg', '/uploads/picture/20180523/c79df44700e75630ee7abc8cb4d21692.jpg', '', '', 1, 1527042158);
INSERT INTO `rk_picture` VALUES (2527, '/uploads/picture/20180523/007f7e5c59db26eb7f34be7977be8c7d.jpg', '/uploads/picture/20180523/007f7e5c59db26eb7f34be7977be8c7d.jpg', '', '', 1, 1527044402);
INSERT INTO `rk_picture` VALUES (2528, '/uploads/picture/20180523/01c64397e94634688c194400f367f5d1.jpg', '/uploads/picture/20180523/01c64397e94634688c194400f367f5d1.jpg', '', '', 1, 1527044679);
INSERT INTO `rk_picture` VALUES (2529, '/uploads/picture/20180523/802d812777fc9f9687fd2e421efe603a.jpg', '/uploads/picture/20180523/802d812777fc9f9687fd2e421efe603a.jpg', '', '', 1, 1527045855);
INSERT INTO `rk_picture` VALUES (2530, '/uploads/picture/20180523/7ba9547be8b0e6577f225cdbf1b868db.jpg', '/uploads/picture/20180523/7ba9547be8b0e6577f225cdbf1b868db.jpg', '', '', 1, 1527046576);
INSERT INTO `rk_picture` VALUES (2531, '/uploads/picture/20180523/fdfb79c8485dbdfd15641606ae395a6a.jpg', '/uploads/picture/20180523/fdfb79c8485dbdfd15641606ae395a6a.jpg', '', '', 1, 1527054151);
INSERT INTO `rk_picture` VALUES (2532, '/uploads/picture/20180523/15ce4cc829c4180e7c54720211b54e38.jpg', '/uploads/picture/20180523/15ce4cc829c4180e7c54720211b54e38.jpg', '', '', 1, 1527054170);
INSERT INTO `rk_picture` VALUES (2533, '/uploads/picture/20180523/00e6d9ef3d59ee6ab9a16327db1f7b5f.jpg', '/uploads/picture/20180523/00e6d9ef3d59ee6ab9a16327db1f7b5f.jpg', '', '', 1, 1527059603);
INSERT INTO `rk_picture` VALUES (2534, '/uploads/picture/20180523/a8456337a723352a91607662b7843892.jpg', '/uploads/picture/20180523/a8456337a723352a91607662b7843892.jpg', '', '', 1, 1527059924);
INSERT INTO `rk_picture` VALUES (2535, '/uploads/picture/20180523/ef8ec2828c6fb18620458517581afe1b.jpg', '/uploads/picture/20180523/ef8ec2828c6fb18620458517581afe1b.jpg', '', '', 1, 1527061495);
INSERT INTO `rk_picture` VALUES (2536, '/uploads/picture/20180523/aee75b8be00abecce7df83017e9c538b.jpg', '/uploads/picture/20180523/aee75b8be00abecce7df83017e9c538b.jpg', '', '', 1, 1527061506);
INSERT INTO `rk_picture` VALUES (2537, '/uploads/picture/20180523/e35c4677643ec2ba8c0af18e88162652.jpg', '/uploads/picture/20180523/e35c4677643ec2ba8c0af18e88162652.jpg', '', '', 1, 1527061553);
INSERT INTO `rk_picture` VALUES (2538, '/uploads/picture/20180523/2bd1f3a7bba07c3d4b2ecd5ce044bdeb.jpg', '/uploads/picture/20180523/2bd1f3a7bba07c3d4b2ecd5ce044bdeb.jpg', '', '', 1, 1527061626);
INSERT INTO `rk_picture` VALUES (2539, '/uploads/picture/20180523/a2126730caae9e89cc7ba5e090437aa8.jpg', '/uploads/picture/20180523/a2126730caae9e89cc7ba5e090437aa8.jpg', '', '', 1, 1527067289);
INSERT INTO `rk_picture` VALUES (2540, '/uploads/picture/20180523/16c023537402ee27aeccc7903facea51.jpg', '/uploads/picture/20180523/16c023537402ee27aeccc7903facea51.jpg', '', '', 1, 1527072609);
INSERT INTO `rk_picture` VALUES (2541, '/uploads/picture/20180523/0c9456037ed33cb279d06153627aead6.jpg', '/uploads/picture/20180523/0c9456037ed33cb279d06153627aead6.jpg', '', '', 1, 1527074891);
INSERT INTO `rk_picture` VALUES (2542, '/uploads/picture/20180523/3ac94e8472ce4f0e1c321af62ab88bdb.jpg', '/uploads/picture/20180523/3ac94e8472ce4f0e1c321af62ab88bdb.jpg', '', '', 1, 1527075068);
INSERT INTO `rk_picture` VALUES (2543, '/uploads/picture/20180523/6289c8bb355b0cb6c53cd0d947c8913b.jpg', '/uploads/picture/20180523/6289c8bb355b0cb6c53cd0d947c8913b.jpg', '', '', 1, 1527075117);
INSERT INTO `rk_picture` VALUES (2544, '/uploads/picture/20180523/b93ce5d3d6c02a1e8ba73d2de631d347.jpg', '/uploads/picture/20180523/b93ce5d3d6c02a1e8ba73d2de631d347.jpg', '', '', 1, 1527080248);
INSERT INTO `rk_picture` VALUES (2545, '/uploads/picture/20180523/2c3bcc5c237a9257b4716e80d23bfd56.jpg', '/uploads/picture/20180523/2c3bcc5c237a9257b4716e80d23bfd56.jpg', '', '', 1, 1527080296);
INSERT INTO `rk_picture` VALUES (2546, '/uploads/picture/20180523/e26d4a5d3d44bb4af135bc1ec2c2cf13.jpg', '/uploads/picture/20180523/e26d4a5d3d44bb4af135bc1ec2c2cf13.jpg', '', '', 1, 1527080325);
INSERT INTO `rk_picture` VALUES (2547, '/uploads/picture/20180523/32201e50b4bb30d4ed03459a74837ee3.jpg', '/uploads/picture/20180523/32201e50b4bb30d4ed03459a74837ee3.jpg', '', '', 1, 1527080341);
INSERT INTO `rk_picture` VALUES (2548, '/uploads/picture/20180523/06df03ffc053b524c980e9da487085d3.jpg', '/uploads/picture/20180523/06df03ffc053b524c980e9da487085d3.jpg', '', '', 1, 1527080629);
INSERT INTO `rk_picture` VALUES (2549, '/uploads/picture/20180523/c8d91f907649594b6eef9dfc7f89f144.jpg', '/uploads/picture/20180523/c8d91f907649594b6eef9dfc7f89f144.jpg', '', '', 1, 1527080651);
INSERT INTO `rk_picture` VALUES (2550, '/uploads/picture/20180523/587950a776f272a7f45e04ca9b511f4e.jpg', '/uploads/picture/20180523/587950a776f272a7f45e04ca9b511f4e.jpg', '', '', 1, 1527080899);
INSERT INTO `rk_picture` VALUES (2551, '/uploads/picture/20180523/10d4cdc1ba77660e2e42a38a61885591.jpg', '/uploads/picture/20180523/10d4cdc1ba77660e2e42a38a61885591.jpg', '', '', 1, 1527081139);
INSERT INTO `rk_picture` VALUES (2552, '/uploads/picture/20180523/f0f575c56e881321f58221653d2b3e28.jpg', '/uploads/picture/20180523/f0f575c56e881321f58221653d2b3e28.jpg', '', '', 1, 1527081844);
INSERT INTO `rk_picture` VALUES (2553, '/uploads/picture/20180523/42c7dbd8656e1ead531d0c97765314b3.jpg', '/uploads/picture/20180523/42c7dbd8656e1ead531d0c97765314b3.jpg', '', '', 1, 1527082009);
INSERT INTO `rk_picture` VALUES (2554, '/uploads/picture/20180523/f0536ee063ece7fb42c17d7a3cee0260.jpg', '/uploads/picture/20180523/f0536ee063ece7fb42c17d7a3cee0260.jpg', '', '', 1, 1527087399);
INSERT INTO `rk_picture` VALUES (2555, '/uploads/picture/20180523/b3c3f3c313ac66c39b3d49d646e7e5eb.jpg', '/uploads/picture/20180523/b3c3f3c313ac66c39b3d49d646e7e5eb.jpg', '', '', 1, 1527087539);
INSERT INTO `rk_picture` VALUES (2556, '/uploads/picture/20180524/5b45e0f7c490edd89f8da410caa02761.jpg', '/uploads/picture/20180524/5b45e0f7c490edd89f8da410caa02761.jpg', '', '', 1, 1527124634);
INSERT INTO `rk_picture` VALUES (2557, '/uploads/picture/20180524/4a5c33679ed6342302edc6331026361b.jpg', '/uploads/picture/20180524/4a5c33679ed6342302edc6331026361b.jpg', '', '', 1, 1527124650);
INSERT INTO `rk_picture` VALUES (2558, '/uploads/picture/20180524/e97b12bb73596d6c68a881631ce2ea4f.jpg', '/uploads/picture/20180524/e97b12bb73596d6c68a881631ce2ea4f.jpg', '', '', 1, 1527129309);
INSERT INTO `rk_picture` VALUES (2559, '/uploads/picture/20180524/7992ed519c12132f919341dc05b90360.jpg', '/uploads/picture/20180524/7992ed519c12132f919341dc05b90360.jpg', '', '', 1, 1527129426);
INSERT INTO `rk_picture` VALUES (2560, '/uploads/picture/20180524/bfabbef40705c649bb137934b7477baf.jpg', '/uploads/picture/20180524/bfabbef40705c649bb137934b7477baf.jpg', '', '', 1, 1527129603);
INSERT INTO `rk_picture` VALUES (2561, '/uploads/picture/20180524/c825ad60663ff816e4acbd03f6bb80c9.jpg', '/uploads/picture/20180524/c825ad60663ff816e4acbd03f6bb80c9.jpg', '', '', 1, 1527129728);
INSERT INTO `rk_picture` VALUES (2562, '/uploads/picture/20180524/5b0628802b5ac.png', '/uploads/picture/20180524/5b0628802b5ac.png', '', '', 1, 1527130240);
INSERT INTO `rk_picture` VALUES (2563, '/uploads/picture/20180524/5b0628f2b5806.png', '/uploads/picture/20180524/5b0628f2b5806.png', '', '', 1, 1527130354);
INSERT INTO `rk_picture` VALUES (2564, '/uploads/picture/20180524/5b062923959c2.png', '/uploads/picture/20180524/5b062923959c2.png', '', '', 1, 1527130403);
INSERT INTO `rk_picture` VALUES (2565, '/uploads/picture/20180524/5b06294ca9bd9.png', '/uploads/picture/20180524/5b06294ca9bd9.png', '', '', 1, 1527130444);
INSERT INTO `rk_picture` VALUES (2566, '/uploads/picture/20180524/5b062a0b96931.png', '/uploads/picture/20180524/5b062a0b96931.png', '', '', 1, 1527130635);
INSERT INTO `rk_picture` VALUES (2567, '/uploads/picture/20180524/5b062a4e020d0.png', '/uploads/picture/20180524/5b062a4e020d0.png', '', '', 1, 1527130702);
INSERT INTO `rk_picture` VALUES (2568, '/uploads/picture/20180524/5b062a652ac55.png', '/uploads/picture/20180524/5b062a652ac55.png', '', '', 1, 1527130725);
INSERT INTO `rk_picture` VALUES (2569, '/uploads/picture/20180524/5b062aa62d97d.png', '/uploads/picture/20180524/5b062aa62d97d.png', '', '', 1, 1527130790);
INSERT INTO `rk_picture` VALUES (2570, '/uploads/picture/20180524/5b062c813429f.png', '/uploads/picture/20180524/5b062c813429f.png', '', '', 1, 1527131265);
INSERT INTO `rk_picture` VALUES (2571, '/uploads/picture/20180524/5b062c8e39b82.png', '/uploads/picture/20180524/5b062c8e39b82.png', '', '', 1, 1527131278);
INSERT INTO `rk_picture` VALUES (2572, '/uploads/picture/20180524/5b062cb77338d.png', '/uploads/picture/20180524/5b062cb77338d.png', '', '', 1, 1527131319);
INSERT INTO `rk_picture` VALUES (2573, '/uploads/picture/20180524/15f681ec560c4eb45138e3b313cbd2b0.jpg', '/uploads/picture/20180524/15f681ec560c4eb45138e3b313cbd2b0.jpg', '', '', 1, 1527143143);
INSERT INTO `rk_picture` VALUES (2574, '/uploads/picture/20180524/82f12c0cda7fd641c45346ea9d95d0bb.jpg', '/uploads/picture/20180524/82f12c0cda7fd641c45346ea9d95d0bb.jpg', '', '', 1, 1527143184);
INSERT INTO `rk_picture` VALUES (2575, '/uploads/picture/20180524/6ba8adb7d56d0ca8d1396582c6802692.jpg', '/uploads/picture/20180524/6ba8adb7d56d0ca8d1396582c6802692.jpg', '', '', 1, 1527145779);
INSERT INTO `rk_picture` VALUES (2576, '/uploads/picture/20180524/4f1e1e556beae0fcbcd0e22193f9ccf1.jpg', '/uploads/picture/20180524/4f1e1e556beae0fcbcd0e22193f9ccf1.jpg', '', '', 1, 1527148732);
INSERT INTO `rk_picture` VALUES (2577, '/uploads/picture/20180524/6075b28c856881cb2b1b4574f4fae525.jpg', '/uploads/picture/20180524/6075b28c856881cb2b1b4574f4fae525.jpg', '', '', 1, 1527148744);
INSERT INTO `rk_picture` VALUES (2578, '/uploads/picture/20180524/4086843ca07ba4d93a338b2c13de9c88.jpg', '/uploads/picture/20180524/4086843ca07ba4d93a338b2c13de9c88.jpg', '', '', 1, 1527148919);
INSERT INTO `rk_picture` VALUES (2579, '/uploads/picture/20180524/6abb66c3d8e7f9db5e6357c7b876ba9b.jpg', '/uploads/picture/20180524/6abb66c3d8e7f9db5e6357c7b876ba9b.jpg', '', '', 1, 1527149307);
INSERT INTO `rk_picture` VALUES (2580, '/uploads/picture/20180524/756ba18c8ce5474aeb0d00da08251840.jpg', '/uploads/picture/20180524/756ba18c8ce5474aeb0d00da08251840.jpg', '', '', 1, 1527151651);
INSERT INTO `rk_picture` VALUES (2581, '/uploads/picture/20180524/0fc774290e1ed9f7e1fc3ad55f0e2ee8.jpg', '/uploads/picture/20180524/0fc774290e1ed9f7e1fc3ad55f0e2ee8.jpg', '', '', 1, 1527152408);
INSERT INTO `rk_picture` VALUES (2582, '/uploads/picture/20180524/6819d09bce21ce4ea068ae3b7b797b94.jpg', '/uploads/picture/20180524/6819d09bce21ce4ea068ae3b7b797b94.jpg', '', '', 1, 1527173704);
INSERT INTO `rk_picture` VALUES (2583, '/uploads/picture/20180524/fde77970a50828ebfc6b5586d95acb78.jpg', '/uploads/picture/20180524/fde77970a50828ebfc6b5586d95acb78.jpg', '', '', 1, 1527174847);
INSERT INTO `rk_picture` VALUES (2584, '/uploads/picture/20180524/525b1c5b1db25a32051d69b79102afa5.jpg', '/uploads/picture/20180524/525b1c5b1db25a32051d69b79102afa5.jpg', '', '', 1, 1527175076);
INSERT INTO `rk_picture` VALUES (2585, '/uploads/picture/20180524/714acbe02a95db6bbf7855c008462b6e.jpg', '/uploads/picture/20180524/714acbe02a95db6bbf7855c008462b6e.jpg', '', '', 1, 1527175111);
INSERT INTO `rk_picture` VALUES (2586, '/uploads/picture/20180524/dc0f174a67c65f19b955bdb23e0e23c4.jpg', '/uploads/picture/20180524/dc0f174a67c65f19b955bdb23e0e23c4.jpg', '', '', 1, 1527175307);
INSERT INTO `rk_picture` VALUES (2587, '/uploads/picture/20180525/6dcf525af52054efb87cf0215a0c03e1.jpg', '/uploads/picture/20180525/6dcf525af52054efb87cf0215a0c03e1.jpg', '', '', 1, 1527215437);
INSERT INTO `rk_picture` VALUES (2588, '/uploads/picture/20180525/baa4ad03d1d8c9ca940bce538ae5c870.jpg', '/uploads/picture/20180525/baa4ad03d1d8c9ca940bce538ae5c870.jpg', '', '', 1, 1527215474);
INSERT INTO `rk_picture` VALUES (2589, '/uploads/picture/20180526/5b090c455a01e.png', '/uploads/picture/20180526/5b090c455a01e.png', '', '', 1, 1527319621);
INSERT INTO `rk_picture` VALUES (2590, '/uploads/picture/20180526/5b090d6c2a5ae.png', '/uploads/picture/20180526/5b090d6c2a5ae.png', '', '', 1, 1527319916);
INSERT INTO `rk_picture` VALUES (2591, '/uploads/picture/20180526/5b090d8306428.png', '/uploads/picture/20180526/5b090d8306428.png', '', '', 1, 1527319939);
INSERT INTO `rk_picture` VALUES (2592, '/uploads/picture/20180526/5b090ee34fd69.png', '/uploads/picture/20180526/5b090ee34fd69.png', '', '', 1, 1527320291);
INSERT INTO `rk_picture` VALUES (2593, '/uploads/picture/20180526/5b090f0baa7d1.png', '/uploads/picture/20180526/5b090f0baa7d1.png', '', '', 1, 1527320331);
INSERT INTO `rk_picture` VALUES (2594, '/uploads/picture/20180526/5b090f4f4359f.png', '/uploads/picture/20180526/5b090f4f4359f.png', '', '', 1, 1527320399);
INSERT INTO `rk_picture` VALUES (2595, '/uploads/picture/20180526/5b090fc45accc.png', '/uploads/picture/20180526/5b090fc45accc.png', '', '', 1, 1527320516);
INSERT INTO `rk_picture` VALUES (2596, '/uploads/picture/20180526/5b0910a3d824f.png', '/uploads/picture/20180526/5b0910a3d824f.png', '', '', 1, 1527320739);
INSERT INTO `rk_picture` VALUES (2597, '/uploads/picture/20180526/5b09112b9d3fa.png', '/uploads/picture/20180526/5b09112b9d3fa.png', '', '', 1, 1527320875);
INSERT INTO `rk_picture` VALUES (2598, '/uploads/picture/20180526/5b09118174794.png', '/uploads/picture/20180526/5b09118174794.png', '', '', 1, 1527320961);
INSERT INTO `rk_picture` VALUES (2599, '/uploads/picture/20180526/5b0911d3e9ee8.png', '/uploads/picture/20180526/5b0911d3e9ee8.png', '', '', 1, 1527321043);
INSERT INTO `rk_picture` VALUES (2600, '/uploads/picture/20180526/5b091217b0a7c.png', '/uploads/picture/20180526/5b091217b0a7c.png', '', '', 1, 1527321111);
INSERT INTO `rk_picture` VALUES (2601, '/uploads/picture/20180526/5b09129ff20f4.png', '/uploads/picture/20180526/5b09129ff20f4.png', '', '', 1, 1527321247);
INSERT INTO `rk_picture` VALUES (2602, '/uploads/picture/20180526/5b0927d0ab514.png', '/uploads/picture/20180526/5b0927d0ab514.png', '', '', 1, 1527326672);
INSERT INTO `rk_picture` VALUES (2603, '/uploads/picture/20180526/5b09291d203f5.png', '/uploads/picture/20180526/5b09291d203f5.png', '', '', 1, 1527327005);
INSERT INTO `rk_picture` VALUES (2604, '/uploads/picture/20180526/5b092d397d210.png', '/uploads/picture/20180526/5b092d397d210.png', '', '', 1, 1527328057);
INSERT INTO `rk_picture` VALUES (2605, '/uploads/picture/20180526/5b092d4375364.png', '/uploads/picture/20180526/5b092d4375364.png', '', '', 1, 1527328067);
INSERT INTO `rk_picture` VALUES (2606, '/uploads/picture/20180526/5b092d49c0af1.png', '/uploads/picture/20180526/5b092d49c0af1.png', '', '', 1, 1527328073);
INSERT INTO `rk_picture` VALUES (2607, '/uploads/picture/20180526/5b092d5240d4d.png', '/uploads/picture/20180526/5b092d5240d4d.png', '', '', 1, 1527328082);
INSERT INTO `rk_picture` VALUES (2608, '/uploads/picture/20180526/5b092e75531dc.png', '/uploads/picture/20180526/5b092e75531dc.png', '', '', 1, 1527328373);
INSERT INTO `rk_picture` VALUES (2609, '/uploads/picture/20180526/1d5aca0e17eab713bc70074bea7d52a9.jpg', '/uploads/picture/20180526/1d5aca0e17eab713bc70074bea7d52a9.jpg', '', '', 1, 1527336075);
INSERT INTO `rk_picture` VALUES (2614, '/uploads/picture/20180817/a8e337c759b44ab24901ab115045c486.jpg', '/uploads/picture/20180817/a8e337c759b44ab24901ab115045c486.jpg', 'f9bf905b48db540049444f8da1ee6395', '89a0808d564677eda101a20a4d0ac40edd911895', 1, 1534473542);
INSERT INTO `rk_picture` VALUES (2617, '/uploads/picture/20180907/94d221b671aef1ab3ea7c9b19c5f1e99.jpg', '/uploads/picture/20180907/94d221b671aef1ab3ea7c9b19c5f1e99.jpg', '6ce3aa5e339eae69e00e360614c2d69d', 'f812fd8d39278362da8f8fd61d6d7bb061809770', 1, 1536286180);
INSERT INTO `rk_picture` VALUES (2616, '/uploads/picture/20180829/87ee2fff785c37648583f02114252add.jpg', '/uploads/picture/20180829/87ee2fff785c37648583f02114252add.jpg', 'f398db5074112f5541aec350715e4c9a', '54cce75ab0a7883dbc4ae146a2a50d51d5cb41ad', 1, 1535527355);

-- ----------------------------
-- Table structure for rk_province
-- ----------------------------
DROP TABLE IF EXISTS `rk_province`;
CREATE TABLE `rk_province`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `region_id` tinyint(4) NOT NULL DEFAULT 0,
  `province_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `sort` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `IDX_g_province_ProvinceName`(`province_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 AVG_ROW_LENGTH = 481 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for rk_region
-- ----------------------------
DROP TABLE IF EXISTS `rk_region`;
CREATE TABLE `rk_region`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `region_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `sort` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 AVG_ROW_LENGTH = 2048 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '片区表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for rk_rewrite
-- ----------------------------
DROP TABLE IF EXISTS `rk_rewrite`;
CREATE TABLE `rk_rewrite`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id自增',
  `rule` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '规则',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'url',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '伪静态表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rk_seo_rule
-- ----------------------------
DROP TABLE IF EXISTS `rk_seo_rule`;
CREATE TABLE `rk_seo_rule`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
  `title` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '规则标题',
  `app` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `controller` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `action` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '状态',
  `seo_title` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'SEO标题',
  `seo_keywords` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'SEO关键词',
  `seo_description` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'SEO描述',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rk_sms
-- ----------------------------
DROP TABLE IF EXISTS `rk_sms`;
CREATE TABLE `rk_sms`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mobile` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手机号码',
  `code` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'php生成短信码',
  `status` tinyint(4) NOT NULL COMMENT '验证码状态，0已发出，1已使用',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间用于限制一天用户发送次数',
  `client_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户端ip',
  `open_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `open_id`(`open_id`) USING BTREE,
  INDEX `mobile`(`mobile`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 512 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rk_tel_bills
-- ----------------------------
DROP TABLE IF EXISTS `rk_tel_bills`;
CREATE TABLE `rk_tel_bills`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '客户电话',
  `message` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `duration` int(11) NULL DEFAULT 0,
  `path` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '录音文件路径',
  `role` tinyint(4) NOT NULL COMMENT '0 机器  1客户',
  `status` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '识别状态',
  `hit_keyword` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '命中关键字',
  `create_time` int(11) NOT NULL,
  `call_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `phone`(`phone`) USING BTREE,
  INDEX `call_id`(`call_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 16899 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '话单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rk_tel_bills
-- ----------------------------

-- ----------------------------
-- Table structure for rk_tel_config
-- ----------------------------
DROP TABLE IF EXISTS `rk_tel_config`;
CREATE TABLE `rk_tel_config`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `level` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '等级格式：1,2,3',
  `sale_ids` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'admin表中的格式：336，344，566',
  `task_id` int(11) NOT NULL COMMENT 'task表的id',
  `scenarios_id` int(11) NOT NULL COMMENT '话术场景id',
  `destination_extension` int(11) NOT NULL,
  `bridge` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '人工客服id',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 暂停 1开启 2人工暂停 3停止',
  `call_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '呼叫类型 0 网关  1中继线路',
  `phone` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '机器人任务配置表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of rk_tel_config
-- ----------------------------


-- ----------------------------
-- Table structure for rk_tel_device
-- ----------------------------
DROP TABLE IF EXISTS `rk_tel_device`;
CREATE TABLE `rk_tel_device`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '设备名称',
  `number` int(11) NOT NULL DEFAULT 0 COMMENT '设备支持数量 ',
  `type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1 语音网关 2中继',
  `desc` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '设备表（语音网关或中继）' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rk_tel_device
-- ----------------------------
INSERT INTO `rk_tel_device` VALUES (6, 'F8-A0-3D-48-C2-8B', 16, 1, '');

-- ----------------------------
-- Table structure for rk_tel_flow
-- ----------------------------
DROP TABLE IF EXISTS `rk_tel_flow`;
CREATE TABLE `rk_tel_flow`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `scenarios_id` int(11) NOT NULL COMMENT '场景id',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '语音对应内容',
  `path` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '语音相对路径',
  `keyword` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回复匹配的关键字',
  `keyword_py` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `scenarios_keyword` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '场景关键字',
  `scenarios_keyword_py` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `classify` int(11) NOT NULL COMMENT '流程分类：命中 拒绝',
  `type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '语音类型 0 流程语音 1 问答语音 2 结束语音',
  `bridge` tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0 不需要转  1需要转',
  `priority` int(11) NOT NULL DEFAULT 0 COMMENT '优化级 ',
  `break` tinyint(2) NOT NULL DEFAULT 1 COMMENT '0 不打断  1 打断',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `scenarios_id`(`scenarios_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2165 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '流程' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rk_tel_flow
-- ----------------------------
INSERT INTO `rk_tel_flow` VALUES (22, 15, '您好，我这边是专业办理银行贷款的，请问你最近有办理银行贷款的考虑吗？', '/uploads/audio/20180609065627.wav', '', '', '单位', NULL, 1, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (25, 15, '是这样子的，我们是平安银行的合作单位，专门解决个人还有中小企业融资难，融资贵的问题的，我这边方便了解一下你的情况吗?', '/uploads/audio/20180609085643.wav', '', '', '', NULL, 0, 0, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (26, 15, '这样，我先问一下，您目前是需要多少资金呢？', '/uploads/audio/20180609085722.wav', '', '', '资金', NULL, 0, 0, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (27, 15, '那您是开公司，还是自己上班的。', '/uploads/audio/20180609085853.wav', '', '', '公司,上班', NULL, 0, 0, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (28, 15, '那方便问一下，您自己有房子或者车子吗?', '/uploads/audio/20180609085956.wav', '', '', '房子,车子', NULL, 0, 0, 0, 100, 1);
INSERT INTO `rk_tel_flow` VALUES (29, 15, '好的，那具体到时候再说，我就先不打扰您了，那祝你生活愉快，再见。', '/uploads/audio/20180609090026.wav', '', '', '', NULL, 0, 0, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (30, 15, '咱们这边利息低，放款又快，还是很不错的，真的。', '/uploads/audio/20180609090145.wav', '利息,速度', 'lixi,sudu', '', NULL, 1, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (31, 15, '是这样子的，我们公司会根据您的实际情况，为您匹配到低费率而且是较快的贷款产品，当然我们公司也会收取贷款额少量比例的服务费用，具体多少还是根据客户实际情况来定的。', '/uploads/audio/20180609112556.wav', '费用,手续费,收费,免费,收钱,要钱,几个点,中介费', 'feiyong,shouxufei,shoufei,mianfei,shouqian,yaoqian,jigedian,zhongjiefei', '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (32, 15, '你可以稍微了解一下嘛，我们这边是和银行正规合作的，下款非常快，而且利息也很低。', '/uploads/audio/20180609114154.wav', '', '', '利息,银行,速度', 'lixi,yinhang,sudu', 1, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (33, 15, '你看这样子好不好，具体问题，我建议您还是来我们公司详细了解一下，或者等会让我们融资顾问给您打个电话，好吗？', '/uploads/audio/20180609114301.wav', '', '', '公司,联系', 'gongsi,lianxi', 1, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (34, 15, '呢，您看这样子好了，我这边先给您发个信息过去，你看一下，做个了结，你感兴趣的话，您也可以随时联系我的。', '/uploads/audio/20180609114337.wav', '', '', '短信,兴趣', 'duanxin,xingqu', 1, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (35, 15, '哎，好的，那具体到时候再说，我就先不打扰您了，那祝你生活愉快，再见。', '/uploads/audio/20180609114355.wav', '', '', '', NULL, 1, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (36, 15, '恩，这个是需要看给你走什么产品的，快的话，咱们可以2,3天下款吗，甚至当天下款都是可以的，具体还是要看您一个资质了', '/uploads/audio/20180609114454.wav', '放款,贷款,拿钱,好快,好久,拿款,多块,多久,快不快', 'fangkuan,daikuan,naqian,haokuai,haojiu,nakuan,duokuai,duojiu,kuaibukuai', '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (37, 15, '我们这有月2,3厘的产品，这个就是相当于你一万元一个月2.30元的，具体还是看你那边的情况，恩，你看要么我安排我们公司专业的融资顾问跟您详细沟通一下，让他给您详细匹配一下贷款方案，你看可以吗？', '/uploads/audio/20180609114732.wav', '利息,一起,必须', 'lixi,yiqi,bixu', '方案,沟通,顾问', 'fangan,goutong,guwen', 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (38, 15, '我们是专业的第3方融资服务平台，专门解决中小企业，个人融资难的问题的', '/uploads/audio/20180a609114833.wav', '哪里公司,哪里得公司,那个公司,啥子公司,什么公司,单位,中介,代理,做什么,东西', 'naligongsi,nalidegongsi,nagegongsi,shazigongsi,shenmegongsi,danwei,zhongjie,daili,zuoshimo,dongxi', '融资,难', 'rongzi,nan', 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (39, 15, '我们在东门大桥，春熙路这边的，就是在市中心', '/uploads/audio/20180609114920.wav', '地址,地方,位置,彼此,在那里,在哪', 'dizhi,difang,weizhi,bici,zainali,zaina', '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (40, 15, '我们在成都这边都做了5年了，已经成功为数十万的贷款客户，解决了他们的融资问题。', '/uploads/audio/20180609115232.wav', '骗子,骗人,乱收费,保障,高利贷,催款,暴利,催收', 'pianzi,pianren,luanshoufei,baozhang,gaolidai,cuikuan,baoli,cuishou', '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (41, 15, '恩，是这样子的，我们公司目前，是和跟多家银行和融资机构都在合作的，一般会您那边的具体情况来为你量身定做最佳贷款方案的。', '/uploads/audio/20180609115323.wav', '黑户,工作,黑妇,黑裤,负债,附在', 'heihu,gongzuo,heifu,heiku,fuzhai,fuzai', '方案', 'fangan', 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (42, 15, '恩，现在这些都是比较方便的啦。不管您是抵押，还是信用贷款，资料准备都很简单的了', '/uploads/audio/20180609115354.wav', '复杂,麻烦,难搞,难得搞', 'fuza,mafan,nangao,nandegao', '资料,材料', 'ziliao,cailiao', 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (43, 15, '哦，我们准备的资料还是蛮简单的，就比如说：身份证，征信报告，还有社保，公积金或者房厂证，这些就可以了，这样吧，我一会还是发一个详细信息到您手机上，您到时看一下好吗?', '/uploads/audio/20180609115428.wav', '资料,材料', 'ziliao,cailiao', '信息', 'xinxi', 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (44, 15, '这个的话，还是看你那边是否愿意呀，如果您不想做抵押的话，那这边还是可以帮您操作信用贷款的。', '/uploads/audio/20180609115506.wav', '不做抵押,不低压,不地呀', 'buzuodiya,budiya,budiya', '信用', 'xinyong', 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (45, 15, '哦，这个您放心好了，我们公司是正规贷款平台，利息都是按照国家标准来的，这个您可以来我们公司详细了解一下的。', '/uploads/audio/20180609115554.wav', '乱收费,保障,高利贷,高利贷,催款,暴利,催收', 'luanshoufei,baozhang,gaolidai,gaolidai,cuikuan,baoli,cuishou', '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (46, 15, '我们是做抵押，和个人信用贷款的', '/uploads/audio/20180609115623.wav', '都有', 'douyou', '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (47, 15, '恩，是这样子的，我们公司目前，是和跟多家银行和融资机构都在合作的，一般会您那边的具体情况来为你量身定做最佳贷款方案的。', '/uploads/audio/20180609115647.wav', '银行,机构', 'yinhang,jigou', '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (48, 15, '这个您可以放心，您可以来我们公司当面了解一下的呀，眼见为实的嘛，对吧。', '/uploads/audio/20180609115713.wav', '正规,歪的', 'zhenggui,waide', '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (49, 15, '恩，这个是这样子的，我们公司会根据您这个具体情况来，为为您匹配到低费率的产品，因为我这边市场部的，那么，具体情况，我安排我们专业的融资顾问来为您解答，如果方案您满意的话，您可以直接找我们办理，如果不满意的话，您就当做一个了解，也是可以的，对吧。', '/uploads/audio/20180609115803.wav', '贷款,流程,抵押,做的,信用,二抵', 'daikuan,liucheng,diya,zuode,xinyong,erdi', '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (50, 15, '我这边王，您叫我小王就可以了，稍后我给您发个信息过去，上面有我的姓名，还是手机号码，您随时联系我都是可以的', '/uploads/audio/20180609115851.wav', '称呼,贵姓,朋友', 'chenghu,guixing,pengyou', '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (51, 15, '不好意思，您说', '/uploads/audio/20180609115935.wav', '听我讲,不要说,喂喂,等等', 'tingwojiang,buyaoshuo,weiwei,dengdeng', '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (52, 15, '这个贷多少的话，还是要根据您个人情况来定的哈，每个人的情况都不同的。', '/uploads/audio/20180609115958.wav', '贷多少', 'daiduoshao', '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (53, 15, '是的，我们也有很多网贷渠道，我这边安排贷款顾问给你回个电话具体讲解下，这样更方便您了解，您看好么？', '/uploads/audio/20180610120030.wav', '网上,网贷,放款,APP,app,线上', 'wangshang,wangdai,fangkuan,APP,app,xianshang', '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (54, 15, '这样子吧，我先安排贷款顾问给您详细介绍下，看您的条件满足不。你再做决定。', '/uploads/audio/20180610120059.wav', '远了,眉山,郫县,新都,龙泉,华阳,有点远,好远', 'yuanle,meishan,pixian,xindu,longquan,huayang,youdianyuan,haoyuan', '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (55, 15, '要看您征信不好到什么程度，您看要么安排我们公司专业的融资顾问跟您详细沟通一下，然后给您匹配最好的贷款方案，您看可以吗', '/uploads/audio/20180610120126.wav', '逾期,征信,真信,黑名单,真心,真性,真行,[真,问题]', 'yuqi,zhengxin,zhenxin,heimingdan,zhenxin,zhenxing,zhenxing,zhen,wenti', '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (56, 15, '这样子吧，我先安排贷款顾问给您详细介绍下，看您的条件满足不。你再做决定。', '/uploads/audio/20180610120154.wav', '远了,眉山,郫县,新都,龙泉,华阳,有点远,好远', 'yuanle,meishan,pixian,xindu,longquan,huayang,youdianyuan,haoyuan', '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (57, 15, '要看您征信不好到什么程度，您看要么安排我们公司专业的融资顾问跟您详细沟通一下，然后给您匹配最好的贷款方案，您看可以吗', '/uploads/audio/20180610120230.wav', '逾期,征信,真信,黑名单,真心,真性,真行,[真,问题]', 'yuqi,zhengxin,zhenxin,heimingdan,zhenxin,zhenxing,zhenxing,zhen,wenti', '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (58, 15, '我们有匹配不同年纪的银行产品，我能了解以下您的具体情况么？', '/uploads/audio/20180610120309.wav', '退休,老年人,年纪大,六七十岁,七八十岁', 'tuixiu,laonianren,nianjida,liuqishisui,qibashisui', '情况', 'qingkuang', 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (59, 15, '哦，是这样子的，我们有多种融资产品，我这边需要了解一下你的具体情况，看下怎么给您操作是最合适的。', '/uploads/audio/20180610120423.wav', '信用,保单,保险,社保,车,营业,执照,发票,飞机票,资质', 'xinyong,baodan,baoxian,shebao,che,yingye,zhizhao,fapiao,feijipiao,zizhi', '情况', 'qingkuang', 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (60, 15, '这个我们都是电脑随机拨号的', '/uploads/audio/20180610120454.wav', '找到我,我的号码', 'zhaodaowo,wodehaoma', '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (61, 15, '怎么会呢，肯定是人工给你打的电话，我姓王，你可以叫我小王', '/uploads/audio/20180610120527.wav', '机器', 'jiqi', '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (62, 15, '哎,什么', '/uploads/audio/20180610120614.wav', '', '', '', NULL, 3, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (63, 15, '哎,喂', '/uploads/audio/20180610120635.wav', '', '', '', NULL, 3, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (64, 15, '不好意思，我这边听得不是很清楚，您能说得慢一点点嘛？', '/uploads/audio/20180610120653.wav', '', '', '', NULL, 3, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (65, 15, '稍后等一下，我这边信号不太好，您刚才说什么呀。', '/uploads/audio/20180610120711.wav', '', '', '', NULL, 3, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (66, 15, '那等您方便的时候我们再联系，祝您生活愉快，再见！', '/uploads/audio/20180610120802.wav', '没空,没有空,没有工夫,没工夫,比较忙,很忙,开会,开车,在忙,睡觉,吃东西,吃饭,不方便,有事,有点忙,有些忙,没时间,没有时间,再联系,打给我', 'meikong,meiyoukong,meiyougongfu,meigongfu,bijiaomang,henmang,kaihui,kaiche,zaimang,shuijiao,chidongxi,chifan,bufangbian,youshi,youdianmang,youxiemang,meishijian,meiyoushijian,zailianxi,dageiwo', '', NULL, 4, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (67, 15, '那我这边先发个短信给你嘛。您先看下，做个了解，然后等您那边方便的时候，我们可以再联系的，好嘛。', '/uploads/audio/20180610120904.wav', '在外地,出差,[短信,给我],[信息,给我],[地址,给我],[忙,短信]', 'zaiwaidi,chuchai,duanxin,geiwo,xinxi,geiwo,dizhi,geiwo,mang,duanxin', '再联系', 'zailianxi', 4, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (68, 15, '那没关系，等您需要的时候再联系，祝您生活愉快，再见。', '/uploads/audio/20180610120943.wav', '不需要,不用,不要,不想了解,不考虑,不要再打,没打算,不打算,不想,不感兴趣,打错,没需求,没需要,莫迪,莫的,同行,不累,没有,么有,没的,已贷,已经贷,不贷', 'buxuyao,buyong,buyao,buxiangliaojie,bukaolv,buyaozaida,meidasuan,budasuan,buxiang,buganxingqu,dacuo,meixuqiu,meixuyao,modi,mode,tonghang,bulei,meiyou,meyou,meide,yidai,yijingdai,budai', '', NULL, 5, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (69, 15, '哎，好的，那具体到时候再说，我就先不打扰您了，那祝你生活愉快，再见。', '/uploads/audio/20180610121026.wav', '产品', 'chanpin', '', NULL, 6, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (70, 15, '喂，在吗', '/uploads/audio/20180610121058.wav', '', '', '', NULL, 7, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (71, 15, '喂，在听吗', '/uploads/audio/20180610121115.wav', '', '', '', NULL, 7, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (72, 15, '实在不好意思，我这边还是没有听到你的声音，要不我先挂了，好了，咱们回头再联系，再见', '/uploads/audio/20180610121136.wav', '', '', '', NULL, 7, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (73, 15, '不好意思啊,抱歉，我这边是市场部啦，有一些专业的问题不能给你很好的解答，您看要么安排我们专业的融资顾问跟您联系一下，让他给您做一下详细沟通，好吗?你看。', '/uploads/audio/20180610121214.wav', '', '', '', NULL, 8, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (74, 15, '不好意思，抱歉呀，我这边也是刚才不久的，有一些不是很熟，您看要不这样子，等会还是让我们的信贷顾问给您打个电话，根您那边详细介绍一下，您看可以吗？', '/uploads/audio/20180610121239.wav', '', '', '', NULL, 8, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (75, 15, '我觉得这些问题，您真的还是得到我们公司来，让我们融资顾问给您解答会更好一点。', '/uploads/audio/20180610121302.wav', '', '', '', NULL, 8, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1571, 60, '喂，您好', '/uploads/audio/20180825/201808031040301.wav', '', NULL, '', NULL, 0, 0, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1572, 60, '唉您好我这边有推出市中心首付15万起的精装修公寓，周边房价都涨了30%,现在房产行情这么好，您有投资房产的打算吗?', '/uploads/audio/20180825/upload-20180803104040_966.wav', NULL, NULL, '', NULL, 0, 0, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1573, 60, '是这样子的，我们公司主要销售杭州宁波上海等繁华区域的精装楼盘，包租包涨，去年同期购买的客户现在都赚了不少钱，老板你有没有发现别的行业做了几年赚的钱还不如买一套房子投资来的划算', '/uploads/audio/20180825/upload-20180803104040_967.wav', NULL, NULL, '', NULL, 0, 0, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1574, 60, '恩,好的，那如果你有兴趣了解的话，那等会挂完电话之后呢，我加您微信您通过一下给您详细介绍.', '/uploads/audio/20180825/upload-20180803104040_968.wav', NULL, NULL, '', NULL, 0, 0, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1575, 60, '好的，那祝您生活愉快，再见', '/uploads/audio/20180825/upload-20180803104040_969.wav', NULL, NULL, '', NULL, 0, 0, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1576, 60, '我们的项目有好几个 ,都是位于人口密集，地段繁华的闹市中心或者政府规划有潜力的新城都是有红头文件可以查的，具体的地我等下加您微信给您发项目资料.', '/uploads/audio/20180825/20180803105627_00.wav', '项目', 'xiangmu', '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1577, 60, '均价的话有 6 7千每平米的也有 1万多的，具体要看楼盘的位置和项目，比如银泰城的可能就会比别的要贵1 2千每平方', '/uploads/audio/20180825/20180803105627_01.wav', '楼盘', 'loupan', '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1578, 60, '面积的话小户型30-80多平方都有,大户型的80-200平方都有，选择也有很多，这个项目不一样，价格面积也不一样，我等会加您微信给你发具体的资料.', '/uploads/audio/20180825/20180803105627_02.wav', NULL, 'loupan', '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1579, 60, '是这样的，我们会跟您签一份十年的包租合同，由开发商这边统一包租包管，每年房子总价6个点的租金直接打到你银行卡上。比方说：您这套房子总价50万，那每年给您的租金6个点就是三万，你躺着就可以收租金了.', '/uploads/audio/20180825/20180803105627_03.wav', NULL, 'loupan', '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1580, 60, '是的，国家规定商业性质的都是40年产权房，当然70年产权的也有，你喜欢投资哪种就投资哪种.', '/uploads/audio/20180825/20180803105627_04.wav', NULL, 'loupan', '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1581, 60, '我们的项目基本上都有地铁或者轻轨覆盖，交通都是非常发达的.而且未来升值的潜力都是非常大的.', '/uploads/audio/20180825/20180803105627_05.wav', NULL, 'loupan', '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1582, 60, '公寓层高3.5米到4米的都有，有些项目4.5米的也有这个我等会发你资料你好好看看.', '/uploads/audio/20180825/20180803105627_06.wav', NULL, 'loupan', '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1583, 60, '物业费一般2-3元，不过物业费是不需要业主来出的，租客会承担的，所以你不用担心，这些我们经验非常足的', '/uploads/audio/20180825/20180803105627_07.wav', NULL, 'loupan', '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1584, 60, '不好意思，我是公司新来的，不是很专业，希望您理解，关于您的问题，稍后我们会有专业的销售经理和您联系', '/uploads/audio/20180825/20180803105627_08.wav', NULL, 'loupan', '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1585, 60, '这个您可能之前咨询过房产的相关问题。如果不巧打扰到您，向您说声抱歉', '/uploads/audio/20180825/20180803105627_09.wav', NULL, 'loupan', '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1586, 60, '老板如果您真的没钱那也爱莫助了，如果您开玩笑说没钱那真是遗憾加可惜了，现在好多人都婉惜以前没有买房，这么多年白努力了', '/uploads/audio/20180825/20180803105627_10.wav', NULL, 'loupan', '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1587, 60, '我们目前在售的基本上都是现房，也有少部份是期房,稍后我就把资料发给您，你看下.', '/uploads/audio/20180825/20180803105627_11.wav', NULL, 'loupan', '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1588, 60, '如果您要去考察的话，我们都有专车包接送的，而且高速下来就到了，非常方便.', '/uploads/audio/20180825/20180803105627_12.wav', NULL, 'loupan', '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1589, 60, '老板这个您放心好了，都说了多少年房价要降要降，结果呢，一点没降反而三四线城市的价格蹭蹭蹭往上涨,同时政府不可能让房子降价不然银行要倒闭了,所以未来投资还是房子最靠谱.', '/uploads/audio/20180825/20180803105627_13.wav', NULL, 'loupan', '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1590, 60, '恩，投资房产毕竟是大事是得考虑一下，不过您可以先加一下微信，随时了解关注一下房产行情，行情好的时候就可以适当出手了.我之前的客户就是这样的现在都赚了很多了. 恩，行，那这样，老板，你先忙，挂完电话之后呢，我就加您微信，您先通过一下，买不买都没事，可以先关注着', '/uploads/audio/20180825/20180803105627_14.wav', NULL, 'loupan', '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1591, 60, '我是椒江的房产公司，我们主要销售宁波的房子为主', '/uploads/audio/20180825/20180803105627_15.wav', NULL, 'loupan', '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1592, 60, '你是问哪里的楼盘吗？我们项目有好多个，具体的以宁波市中心或者是 杭州湾的项目', '/uploads/audio/20180825/20180803105627_16.wav', NULL, 'loupan', '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1596, 60, '那没关系,等您需要的时候再联系,祝您生活愉快,再见', '/uploads/audio/20180825/20180803104756_590.wav', '不需要', 'buxuyao', '', NULL, 5, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1597, 60, '哦，不好意思，我没听清楚，您可以说慢一点吗？', '/uploads/audio/20180825/20180803104203_670.wav', '不好意思', 'buhaoyisi', '', NULL, 8, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1598, 60, '那行，你先忙，那等您方便的时候我们再联系，祝您生活愉快，再见', '/uploads/audio/20180825/20180803104226_7579.wav', '忙', 'mang', '', NULL, 4, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1599, 60, '喂，您好，在吗', '/uploads/audio/20180825/20180803105009_182.wav', NULL, 'mang', '', NULL, 7, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1600, 60, '实在不好意思，我这边还是没有听到你的声音，你可以再说一遍吗', '/uploads/audio/20180825/20180803105029_59.wav', NULL, 'mang', '', NULL, 7, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1942, 68, '如果您要去考察的话，我们都有专车包接送的，而且高速下来就到了，非常方便.', '/uploads/audio/20180825/20180803105627_12.wav', '车接  交通  交通不方便', 'chejiejiaotongjiaotongbufangbian', '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1941, 68, '我们目前在售的基本上都是现房，也有少部份是期房,稍后我就把资料发给您，你看下.', '/uploads/audio/20180825/20180803105627_11.wav', '现房  期房  样板间', 'xianfangqifangyangbanjian', '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1940, 68, '老板如果您真的没钱那也爱莫助了，如果您开玩笑说没钱那真是遗憾加可惜了，现在好多人都婉惜以前没有买房，这么多年白努力了', '/uploads/audio/20180825/20180803105627_10.wav', '没钱 资金不足  太贵了', 'meiqianzijinbuzutaiguile', '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1939, 68, '这个您可能之前咨询过房产的相关问题。如果不巧打扰到您，向您说声抱歉', '/uploads/audio/20180825/20180803105627_09.wav', '之前联系过  不要再打了  好烦 骚扰 别打了', 'zhiqianlianxiguobuyaozaidalehaofansaoraobiedale', '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1938, 68, '不好意思，我是公司新来的，不是很专业，希望您理解，关于您的问题，稍后我们会有专业的销售经理和您联系', '/uploads/audio/20180825/20180803105627_08.wav', NULL, NULL, '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1937, 68, '物业费一般2-3元，不过物业费是不需要业主来出的，租客会承担的，所以你不用担心，这些我们经验非常足的', '/uploads/audio/20180825/20180803105627_07.wav', '物业费  物业多少钱 物业好不好  物业贵不贵', 'wuyefeiwuyeduoshaoqianwuyehaobuhaowuyeguibugui', '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1936, 68, '公寓层高3.5米到4米的都有，有些项目4.5米的也有这个我等会发你资料你好好看看.', '/uploads/audio/20180825/20180803105627_06.wav', NULL, NULL, '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1935, 68, '我们的项目基本上都有地铁或者轻轨覆盖，交通都是非常发达的.而且未来升值的潜力都是非常大的.', '/uploads/audio/20180825/20180803105627_05.wav', NULL, NULL, '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1934, 68, '是的，国家规定商业性质的都是40年产权房，当然70年产权的也有，你喜欢投资哪种就投资哪种.', '/uploads/audio/20180825/20180803105627_04.wav', NULL, NULL, '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1932, 68, '面积的话小户型30-80多平方都有,大户型的80-200平方都有，选择也有很多，这个项目不一样，价格面积也不一样，我等会加您微信给你发具体的资料.', '/uploads/audio/20180825/20180803105627_02.wav', NULL, NULL, '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1933, 68, '是这样的，我们会跟您签一份十年的包租合同，由开发商这边统一包租包管，每年房子总价6个点的租金直接打到你银行卡上。比方说：您这套房子总价50万，那每年给您的租金6个点就是三万，你躺着就可以收租金了.', '/uploads/audio/20180825/20180803105627_03.wav', NULL, NULL, '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1931, 68, '均价的话有 6 7千每平米的也有 1万多的，具体要看楼盘的位置和项目，比如银泰城的可能就会比别的要贵1 2千每平方', '/uploads/audio/20180825/20180803105627_01.wav', '楼盘', NULL, '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1929, 68, '好的，那祝您生活愉快，再见', '/uploads/audio/20180825/upload-20180803104040_969.wav', '', NULL, '', NULL, 0, 0, 0, 46, 1);
INSERT INTO `rk_tel_flow` VALUES (1930, 68, '我们的项目有好几个 ,都是位于人口密集，地段繁华的闹市中心或者政府规划有潜力的新城都是有红头文件可以查的，具体的地我等下加您微信给您发项目资料.', '/uploads/audio/20180825/20180803105627_00.wav', '项目', NULL, '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1928, 68, '恩,好的，那如果你有兴趣了解的话，那等会挂完电话之后呢，我加您微信您通过一下给您详细介绍.', '/uploads/audio/20180825/upload-20180803104040_968.wav', '', NULL, '', NULL, 0, 0, 0, 47, 1);
INSERT INTO `rk_tel_flow` VALUES (1927, 68, '是这样子的，我们公司主要销售杭州宁波上海等繁华区域的精装楼盘，包租包涨，去年同期购买的客户现在都赚了不少钱，老板你有没有发现别的行业做了几年赚的钱还不如买一套房子投资来的划算', '/uploads/audio/20180825/upload-20180803104040_967.wav', '', NULL, '', NULL, 0, 0, 0, 48, 1);
INSERT INTO `rk_tel_flow` VALUES (1925, 68, '喂，您好!', '/uploads/audio/20180825/201808031040301.wav', '', NULL, '', NULL, 0, 0, 0, 50, 1);
INSERT INTO `rk_tel_flow` VALUES (1926, 68, '唉您好我这边有推出市中心首付15万起的精装修公寓，周边房价都涨了30%,现在房产行情这么好，您有投资房产的打算吗?', '/uploads/audio/20180825/upload-20180803104040_966.wav', '', NULL, '', NULL, 0, 0, 0, 49, 1);
INSERT INTO `rk_tel_flow` VALUES (1923, 67, '喂，您好，在吗', '/uploads/audio/20180825/20180803105009_182.wav', NULL, NULL, '', NULL, 7, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1924, 67, '实在不好意思，我这边还是没有听到你的声音，你可以再说一遍吗', '/uploads/audio/20180825/20180803105029_59.wav', NULL, NULL, '', NULL, 7, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1921, 67, '哦，不好意思，我没听清楚，您可以说慢一点吗？', '/uploads/audio/20180825/20180803104203_670.wav', '不好意思', NULL, '', NULL, 8, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1922, 67, '那行，你先忙，那等您方便的时候我们再联系，祝您生活愉快，再见', '/uploads/audio/20180825/20180803104226_7579.wav', '忙', NULL, '', NULL, 4, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1920, 67, '那没关系,等您需要的时候再联系,祝您生活愉快,再见', '/uploads/audio/20180825/20180803104756_590.wav', '不需要', NULL, '', NULL, 5, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1918, 67, '我是椒江的房产公司，我们主要销售宁波的房子为主', '/uploads/audio/20180825/20180803105627_15.wav', NULL, NULL, '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1919, 67, '你是问哪里的楼盘吗？我们项目有好多个，具体的以宁波市中心或者是 杭州湾的项目', '/uploads/audio/20180825/20180803105627_16.wav', NULL, NULL, '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1917, 67, '恩，投资房产毕竟是大事是得考虑一下，不过您可以先加一下微信，随时了解关注一下房产行情，行情好的时候就可以适当出手了.我之前的客户就是这样的现在都赚了很多了. 恩，行，那这样，老板，你先忙，挂完电话之后呢，我就加您微信，您先通过一下，买不买都没事，可以先关注着', '/uploads/audio/20180825/20180803105627_14.wav', NULL, NULL, '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1916, 67, '老板这个您放心好了，都说了多少年房价要降要降，结果呢，一点没降反而三四线城市的价格蹭蹭蹭往上涨,同时政府不可能让房子降价不然银行要倒闭了,所以未来投资还是房子最靠谱.', '/uploads/audio/20180825/20180803105627_13.wav', NULL, NULL, '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1915, 67, '如果您要去考察的话，我们都有专车包接送的，而且高速下来就到了，非常方便.', '/uploads/audio/20180825/20180803105627_12.wav', NULL, NULL, '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1914, 67, '我们目前在售的基本上都是现房，也有少部份是期房,稍后我就把资料发给您，你看下.', '/uploads/audio/20180825/20180803105627_11.wav', NULL, NULL, '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1913, 67, '老板如果您真的没钱那也爱莫助了，如果您开玩笑说没钱那真是遗憾加可惜了，现在好多人都婉惜以前没有买房，这么多年白努力了', '/uploads/audio/20180825/20180803105627_10.wav', NULL, NULL, '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1911, 67, '不好意思，我是公司新来的，不是很专业，希望您理解，关于您的问题，稍后我们会有专业的销售经理和您联系', '/uploads/audio/20180825/20180803105627_08.wav', NULL, NULL, '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1912, 67, '这个您可能之前咨询过房产的相关问题。如果不巧打扰到您，向您说声抱歉', '/uploads/audio/20180825/20180803105627_09.wav', NULL, NULL, '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1909, 67, '公寓层高3.5米到4米的都有，有些项目4.5米的也有这个我等会发你资料你好好看看.', '/uploads/audio/20180825/20180803105627_06.wav', NULL, NULL, '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1910, 67, '物业费一般2-3元，不过物业费是不需要业主来出的，租客会承担的，所以你不用担心，这些我们经验非常足的', '/uploads/audio/20180825/20180803105627_07.wav', NULL, NULL, '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1908, 67, '我们的项目基本上都有地铁或者轻轨覆盖，交通都是非常发达的.而且未来升值的潜力都是非常大的.', '/uploads/audio/20180825/20180803105627_05.wav', NULL, NULL, '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1907, 67, '是的，国家规定商业性质的都是40年产权房，当然70年产权的也有，你喜欢投资哪种就投资哪种.', '/uploads/audio/20180825/20180803105627_04.wav', NULL, NULL, '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1906, 67, '是这样的，我们会跟您签一份十年的包租合同，由开发商这边统一包租包管，每年房子总价6个点的租金直接打到你银行卡上。比方说：您这套房子总价50万，那每年给您的租金6个点就是三万，你躺着就可以收租金了.', '/uploads/audio/20180825/20180803105627_03.wav', NULL, NULL, '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1905, 67, '面积的话小户型30-80多平方都有,大户型的80-200平方都有，选择也有很多，这个项目不一样，价格面积也不一样，我等会加您微信给你发具体的资料.', '/uploads/audio/20180825/20180803105627_02.wav', NULL, NULL, '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1904, 67, '均价的话有 6 7千每平米的也有 1万多的，具体要看楼盘的位置和项目，比如银泰城的可能就会比别的要贵1 2千每平方', '/uploads/audio/20180825/20180803105627_01.wav', '楼盘', NULL, '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1903, 67, '我们的项目有好几个 ,都是位于人口密集，地段繁华的闹市中心或者政府规划有潜力的新城都是有红头文件可以查的，具体的地我等下加您微信给您发项目资料.', '/uploads/audio/20180825/20180803105627_00.wav', '项目', NULL, '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1902, 67, '好的，那祝您生活愉快，再见', '/uploads/audio/20180825/upload-20180803104040_969.wav', NULL, NULL, '', NULL, 0, 0, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1901, 67, '恩,好的，那如果你有兴趣了解的话，那等会挂完电话之后呢，我加您微信您通过一下给您详细介绍.', '/uploads/audio/20180825/upload-20180803104040_968.wav', NULL, NULL, '', NULL, 0, 0, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1900, 67, '是这样子的，我们公司主要销售杭州宁波上海等繁华区域的精装楼盘，包租包涨，去年同期购买的客户现在都赚了不少钱，老板你有没有发现别的行业做了几年赚的钱还不如买一套房子投资来的划算', '/uploads/audio/20180825/upload-20180803104040_967.wav', NULL, NULL, '', NULL, 0, 0, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1898, 67, '喂，您好!', '/uploads/audio/20180825/201808031040301.wav', '', NULL, '', NULL, 0, 0, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1899, 67, '唉您好我这边有推出市中心首付15万起的精装修公寓，周边房价都涨了30%,现在房产行情这么好，您有投资房产的打算吗?', '/uploads/audio/20180825/upload-20180803104040_966.wav', NULL, NULL, '', NULL, 0, 0, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1943, 68, '老板这个您放心好了，都说了多少年房价要降要降，结果呢，一点没降反而三四线城市的价格蹭蹭蹭往上涨,同时政府不可能让房子降价不然银行要倒闭了,所以未来投资还是房子最靠谱.', '/uploads/audio/20180825/20180803105627_13.wav', NULL, NULL, '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1944, 68, '恩，投资房产毕竟是大事是得考虑一下，不过您可以先加一下微信，随时了解关注一下房产行情，行情好的时候就可以适当出手了.我之前的客户就是这样的现在都赚了很多了. 恩，行，那这样，老板，你先忙，挂完电话之后呢，我就加您微信，您先通过一下，买不买都没事，可以先关注着', '/uploads/audio/20180825/20180803105627_14.wav', NULL, NULL, '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1945, 68, '我是椒江的房产公司，我们主要销售宁波的房子为主', '/uploads/audio/20180825/20180803105627_15.wav', NULL, NULL, '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1946, 68, '你是问哪里的楼盘吗？我们项目有好多个，具体的以宁波市中心或者是 杭州湾的项目', '/uploads/audio/20180825/20180803105627_16.wav', NULL, NULL, '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1947, 68, '那没关系,等您需要的时候再联系,祝您生活愉快,再见', '/uploads/audio/20180825/20180803104756_590.wav', '不需要', NULL, '', NULL, 5, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1948, 68, '哦，不好意思，我没听清楚，您可以说慢一点吗？', '/uploads/audio/20180825/20180803104203_670.wav', '不好意思', NULL, '', NULL, 8, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1949, 68, '那行，你先忙，那等您方便的时候我们再联系，祝您生活愉快，再见', '/uploads/audio/20180825/20180803104226_7579.wav', '忙', NULL, '', NULL, 4, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1950, 68, '喂，您好，在吗', '/uploads/audio/20180825/20180803105009_182.wav', NULL, NULL, '', NULL, 7, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1951, 68, '实在不好意思，我这边还是没有听到你的声音，你可以再说一遍吗', '/uploads/audio/20180825/20180803105029_59.wav', NULL, NULL, '', NULL, 7, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1952, 69, '您好，我这边是专业办理银行贷款的，请问你最近有办理银行贷款的考虑吗？', '/uploads/audio/20180609065627.wav', '', NULL, '', NULL, 1, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1953, 69, '是这样子的，我们是平安银行的合作单位，专门解决个人还有中小企业融资难，融资贵的问题的，我这边方便了解一下你的情况吗?', '/uploads/audio/20180609085643.wav', '', NULL, '', NULL, 0, 0, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1954, 69, '这样，我先问一下，您目前是需要多少资金呢？', '/uploads/audio/20180609085722.wav', '', NULL, '', NULL, 0, 0, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1955, 69, '那您是开公司，还是自己上班的。', '/uploads/audio/20180609085853.wav', '', NULL, '', NULL, 0, 0, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1956, 69, '那方便问一下，您自己有房子或者车子吗?', '/uploads/audio/20180609085956.wav', '', NULL, '', NULL, 0, 0, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1957, 69, '好的，那具体到时候再说，我就先不打扰您了，那祝你生活愉快，再见。', '/uploads/audio/20180609090026.wav', '', NULL, '', NULL, 0, 0, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1958, 69, '咱们这边利息低，放款又快，还是很不错的，真的。', '/uploads/audio/20180609090145.wav', '利息,速度', NULL, '', NULL, 1, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1959, 69, '是这样子的，我们公司会根据您的实际情况，为您匹配到低费率而且是较快的贷款产品，当然我们公司也会收取贷款额少量比例的服务费用，具体多少还是根据客户实际情况来定的。', '/uploads/audio/20180609112556.wav', '费用,手续费,收费,免费,收钱,要钱,几个点,中介费', NULL, '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1960, 69, '你可以稍微了解一下嘛，我们这边是和银行正规合作的，下款非常快，而且利息也很低。', '/uploads/audio/20180609114154.wav', '', NULL, '', NULL, 1, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1961, 69, '你看这样子好不好，具体问题，我建议您还是来我们公司详细了解一下，或者等会让我们融资顾问给您打个电话，好吗？', '/uploads/audio/20180609114301.wav', '', NULL, '', NULL, 1, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1962, 69, '呢，您看这样子好了，我这边先给您发个信息过去，你看一下，做个了结，你感兴趣的话，您也可以随时联系我的。', '/uploads/audio/20180609114337.wav', '', NULL, '', NULL, 1, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1963, 69, '哎，好的，那具体到时候再说，我就先不打扰您了，那祝你生活愉快，再见。', '/uploads/audio/20180609114355.wav', '', NULL, '', NULL, 1, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1964, 69, '恩，这个是需要看给你走什么产品的，快的话，咱们可以2,3天下款吗，甚至当天下款都是可以的，具体还是要看您一个资质了', '/uploads/audio/20180609114454.wav', '放款,贷款,拿钱,好快,好久,拿款,多块,多久,快不快', NULL, '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1965, 69, '我们这有月2,3厘的产品，这个就是相当于你一万元一个月2.30元的，具体还是看你那边的情况，恩，你看要么我安排我们公司专业的融资顾问跟您详细沟通一下，让他给您详细匹配一下贷款方案，你看可以吗？', '/uploads/audio/20180609114732.wav', '利息,一起,必须', NULL, '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1966, 69, '我们是专业的第3方融资服务平台，专门解决中小企业，个人融资难的问题的', '/uploads/audio/20180a609114833.wav', '哪里公司,哪里得公司,那个公司,啥子公司,什么公司,单位,中介,代理,做什么,东西', NULL, '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1967, 69, '我们在东门大桥，春熙路这边的，就是在市中心', '/uploads/audio/20180609114920.wav', '地址,地方,位置,彼此,在那里,在哪', NULL, '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1968, 69, '我们在成都这边都做了5年了，已经成功为数十万的贷款客户，解决了他们的融资问题。', '/uploads/audio/20180609115232.wav', '骗子,骗人,乱收费,保障,高利贷,催款,暴利,催收', NULL, '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1969, 69, '恩，是这样子的，我们公司目前，是和跟多家银行和融资机构都在合作的，一般会您那边的具体情况来为你量身定做最佳贷款方案的。', '/uploads/audio/20180609115323.wav', '黑户,工作,黑妇,黑裤,负债,附在', NULL, '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1970, 69, '恩，现在这些都是比较方便的啦。不管您是抵押，还是信用贷款，资料准备都很简单的了', '/uploads/audio/20180609115354.wav', '复杂,麻烦,难搞,难得搞', NULL, '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1971, 69, '哦，我们准备的资料还是蛮简单的，就比如说：身份证，征信报告，还有社保，公积金或者房厂证，这些就可以了，这样吧，我一会还是发一个详细信息到您手机上，您到时看一下好吗?', '/uploads/audio/20180609115428.wav', '资料,材料', NULL, '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1972, 69, '这个的话，还是看你那边是否愿意呀，如果您不想做抵押的话，那这边还是可以帮您操作信用贷款的。', '/uploads/audio/20180609115506.wav', '不做抵押,不低压,不地呀', NULL, '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1973, 69, '哦，这个您放心好了，我们公司是正规贷款平台，利息都是按照国家标准来的，这个您可以来我们公司详细了解一下的。', '/uploads/audio/20180609115554.wav', '乱收费,保障,高利贷,高利贷,催款,暴利,催收', NULL, '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1974, 69, '我们是做抵押，和个人信用贷款的', '/uploads/audio/20180609115623.wav', '都有', NULL, '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1975, 69, '恩，是这样子的，我们公司目前，是和跟多家银行和融资机构都在合作的，一般会您那边的具体情况来为你量身定做最佳贷款方案的。', '/uploads/audio/20180609115647.wav', '银行,机构', NULL, '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1976, 69, '这个您可以放心，您可以来我们公司当面了解一下的呀，眼见为实的嘛，对吧。', '/uploads/audio/20180609115713.wav', '正规,歪的', NULL, '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1977, 69, '恩，这个是这样子的，我们公司会根据您这个具体情况来，为为您匹配到低费率的产品，因为我这边市场部的，那么，具体情况，我安排我们专业的融资顾问来为您解答，如果方案您满意的话，您可以直接找我们办理，如果不满意的话，您就当做一个了解，也是可以的，对吧。', '/uploads/audio/20180609115803.wav', '贷款,流程,抵押,做的,信用,二抵', NULL, '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1978, 69, '我这边王，您叫我小王就可以了，稍后我给您发个信息过去，上面有我的姓名，还是手机号码，您随时联系我都是可以的', '/uploads/audio/20180609115851.wav', '称呼,贵姓,朋友', NULL, '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1979, 69, '不好意思，您说', '/uploads/audio/20180609115935.wav', '听我讲,不要说,喂喂,等等', NULL, '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1980, 69, '这个贷多少的话，还是要根据您个人情况来定的哈，每个人的情况都不同的。', '/uploads/audio/20180609115958.wav', '贷多少', NULL, '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1981, 69, '是的，我们也有很多网贷渠道，我这边安排贷款顾问给你回个电话具体讲解下，这样更方便您了解，您看好么？', '/uploads/audio/20180610120030.wav', '网上,网贷,放款,APP,app,线上', NULL, '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1982, 69, '这样子吧，我先安排贷款顾问给您详细介绍下，看您的条件满足不。你再做决定。', '/uploads/audio/20180610120059.wav', '远了,眉山,郫县,新都,龙泉,华阳,有点远,好远', NULL, '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1983, 69, '要看您征信不好到什么程度，您看要么安排我们公司专业的融资顾问跟您详细沟通一下，然后给您匹配最好的贷款方案，您看可以吗', '/uploads/audio/20180610120126.wav', '逾期,征信,真信,黑名单,真心,真性,真行,[真,问题]', NULL, '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1984, 69, '这样子吧，我先安排贷款顾问给您详细介绍下，看您的条件满足不。你再做决定。', '/uploads/audio/20180610120154.wav', '远了,眉山,郫县,新都,龙泉,华阳,有点远,好远', NULL, '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1985, 69, '要看您征信不好到什么程度，您看要么安排我们公司专业的融资顾问跟您详细沟通一下，然后给您匹配最好的贷款方案，您看可以吗', '/uploads/audio/20180610120230.wav', '逾期,征信,真信,黑名单,真心,真性,真行,[真,问题]', NULL, '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1986, 69, '我们有匹配不同年纪的银行产品，我能了解以下您的具体情况么？', '/uploads/audio/20180610120309.wav', '退休,老年人,年纪大,六七十岁,七八十岁', NULL, '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1987, 69, '哦，是这样子的，我们有多种融资产品，我这边需要了解一下你的具体情况，看下怎么给您操作是最合适的。', '/uploads/audio/20180610120423.wav', '信用,保单,保险,社保,车,营业,执照,发票,飞机票,资质', NULL, '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1988, 69, '这个我们都是电脑随机拨号的', '/uploads/audio/20180610120454.wav', '找到我,我的号码', NULL, '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1989, 69, '怎么会呢，肯定是人工给你打的电话，我姓王，你可以叫我小王', '/uploads/audio/20180610120527.wav', '机器', NULL, '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1990, 69, '哎,什么', '/uploads/audio/20180610120614.wav', '', NULL, '', NULL, 3, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1991, 69, '哎,喂', '/uploads/audio/20180610120635.wav', '', NULL, '', NULL, 3, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1992, 69, '不好意思，我这边听得不是很清楚，您能说得慢一点点嘛？', '/uploads/audio/20180610120653.wav', '', NULL, '', NULL, 3, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1993, 69, '稍后等一下，我这边信号不太好，您刚才说什么呀。', '/uploads/audio/20180610120711.wav', '', NULL, '', NULL, 3, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1994, 69, '那等您方便的时候我们再联系，祝您生活愉快，再见！', '/uploads/audio/20180610120802.wav', '没空,没有空,没有工夫,没工夫,比较忙,很忙,开会,开车,在忙,睡觉,吃东西,吃饭,不方便,有事,有点忙,有些忙,没时间,没有时间,再联系,打给我', NULL, '', NULL, 4, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1995, 69, '那我这边先发个短信给你嘛。您先看下，做个了解，然后等您那边方便的时候，我们可以再联系的，好嘛。', '/uploads/audio/20180610120904.wav', '在外地,出差,[短信,给我],[信息,给我],[地址,给我],[忙,短信]', NULL, '', NULL, 4, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1996, 69, '那没关系，等您需要的时候再联系，祝您生活愉快，再见。', '/uploads/audio/20180610120943.wav', '不需要,不用,不要,不想了解,不考虑,不要再打,没打算,不打算,不想,不感兴趣,打错,没需求,没需要,莫迪,莫的,同行,不累,没有,么有,没的,已贷,已经贷,不贷', NULL, '', NULL, 5, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1997, 69, '哎，好的，那具体到时候再说，我就先不打扰您了，那祝你生活愉快，再见。', '/uploads/audio/20180610121026.wav', '产品', NULL, '', NULL, 6, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1998, 69, '喂，在吗', '/uploads/audio/20180610121058.wav', '', NULL, '', NULL, 7, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (1999, 69, '喂，在听吗', '/uploads/audio/20180610121115.wav', '', NULL, '', NULL, 7, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (2000, 69, '实在不好意思，我这边还是没有听到你的声音，要不我先挂了，好了，咱们回头再联系，再见', '/uploads/audio/20180610121136.wav', '', NULL, '', NULL, 7, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (2001, 69, '不好意思啊,抱歉，我这边是市场部啦，有一些专业的问题不能给你很好的解答，您看要么安排我们专业的融资顾问跟您联系一下，让他给您做一下详细沟通，好吗?你看。', '/uploads/audio/20180610121214.wav', '', NULL, '', NULL, 8, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (2002, 69, '不好意思，抱歉呀，我这边也是刚才不久的，有一些不是很熟，您看要不这样子，等会还是让我们的信贷顾问给您打个电话，根您那边详细介绍一下，您看可以吗？', '/uploads/audio/20180610121239.wav', '', NULL, '', NULL, 8, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (2003, 69, '我觉得这些问题，您真的还是得到我们公司来，让我们融资顾问给您解答会更好一点。', '/uploads/audio/20180610121302.wav', '', NULL, '', NULL, 8, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (2123, 72, '呢，您看这样子好了，我这边先给您发个信息过去，你看一下，做个了结，你感兴趣的话，您也可以随时联系我的。', '/uploads/audio/20180609114337.wav', '', NULL, '', NULL, 1, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (2122, 72, '你看这样子好不好，具体问题，我建议您还是来我们公司详细了解一下，或者等会让我们融资顾问给您打个电话，好吗？', '/uploads/audio/20180609114301.wav', '', NULL, '', NULL, 1, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (2121, 72, '你可以稍微了解一下嘛，我们这边是和银行正规合作的，下款非常快，而且利息也很低。', '/uploads/audio/20180609114154.wav', '', NULL, '', NULL, 1, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (2118, 72, '好的，那具体到时候再说，我就先不打扰您了，那祝你生活愉快，再见。', '/uploads/audio/20180609090026.wav', '', NULL, '', NULL, 0, 0, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (2119, 72, '咱们这边利息低，放款又快，还是很不错的，真的。', '/uploads/audio/20180609090145.wav', '利息,速度', NULL, '', NULL, 1, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (2120, 72, '是这样子的，我们公司会根据您的实际情况，为您匹配到低费率而且是较快的贷款产品，当然我们公司也会收取贷款额少量比例的服务费用，具体多少还是根据客户实际情况来定的。', '/uploads/audio/20180609112556.wav', '费用,手续费,收费,免费,收钱,要钱,几个点,中介费', NULL, '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (2116, 72, '那您是开公司，还是自己上班的。', '/uploads/audio/20180609085853.wav', '', NULL, '', NULL, 0, 0, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (2117, 72, '那方便问一下，您自己有房子或者车子吗?', '/uploads/audio/20180609085956.wav', '', NULL, '', NULL, 0, 0, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (2115, 72, '这样，我先问一下，您目前是需要多少资金呢？', '/uploads/audio/20180609085722.wav', '', NULL, '', NULL, 0, 0, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (2113, 72, '您好，我这边是专业办理银行贷款的，请问你最近有办理银行贷款的考虑吗？', '/uploads/audio/20180609065627.wav', '', NULL, '', NULL, 1, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (2114, 72, '是这样子的，我们是平安银行的合作单位，专门解决个人还有中小企业融资难，融资贵的问题的，我这边方便了解一下你的情况吗?', '/uploads/audio/20180609085643.wav', '', NULL, '', NULL, 0, 0, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (2112, 71, '我们公司是2013年成立的，是正规公司，您要是有什么疑惑不放心的，您可以先来公司具体了解一下再做决定啊', '/uploads/audio/20180904/20180904032100.wav', '骗子,假的,忽悠人,诈骗电话,个人,靠谱,正规公司,成立时间,骗人,真的,可信,注册时间', 'pianzi,jiade,huyouren,zhapiandianhua,geren,kaopu,zhengguigongsi,chenglishijian,pianren,zhende,kexin,zhuceshijian', '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (2111, 71, '那打扰您了，祝您生活愉快，再见！', '/uploads/audio/20180904/20180904124509.wav', '', NULL, '', NULL, 6, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (2108, 71, '喂，在吗', '/uploads/audio/20180904/20180904124323.wav', '', NULL, '', NULL, 7, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (2109, 71, '喂，在听吗', '/uploads/audio/20180904/20180904124426.wav', '', NULL, '', NULL, 7, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (2103, 71, '我觉得这些问题，您真的还是得到我们公司来，让我们负责人给您解答会更好一点。', '/uploads/audio/20180904/20180904033627.wav', '技术,稳定性,安全,专业,怎么用', 'jishu,wendingxing,anquan,zhuanye,zenmeyong', '', NULL, 8, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (2104, 71, '那等您方便的时候再联系您吧，再见！', '/uploads/audio/20180904/20180904124529.wav', '没空,没时间,太忙,开会,出差,睡觉,洗澡,按摩,吃饭,喝酒,约会,看电影,在玩', 'meikong,meishijian,taimang,kaihui,chuchai,shuijiao,xizao,anmo,chifan,hejiu,yuehui,kandianying,zaiwan', '', NULL, 4, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (2105, 71, '那我这边先发个短信给你嘛。您先看下，做个了解，然后等您那边方便的时候，我们可以再联系的，好嘛', '/uploads/audio/20180904/20180904033720.wav', '有事情,在忙,开会', 'youshiqing,zaimang,kaihui', '', NULL, 4, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (2106, 71, '抱歉，我这边没听清楚，您能说的慢一点吗', '/uploads/audio/20180904/20180904124544.wav', '', NULL, '', NULL, 7, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (2107, 71, '这样吧，这边信号不好，具体我们加微信聊，这个手机号就是我微信号，再见', '/uploads/audio/20180904/20180904033812.wav', '', NULL, '', NULL, 7, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (2102, 71, '不好意思，抱歉呀，我这边也是刚来不久的，有一些不是很熟，您看要不这样子，等会还是让我们的负责人给您打个电话，根您那边详细介绍一下，您看可以吗？', '/uploads/audio/20180904/20180904033541.wav', '', NULL, '', NULL, 8, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (2101, 71, '不好意思啊,抱歉，我这边是市场部啦，有一些专业的问题不能给你很好的解答，您看要么安排我们专业的负责人跟您联系一下，让他给您做一下详细沟通，您看可以吗?', '/uploads/audio/20180904/20180904033458.wav', '怎么用,不会用,教程,测试,方法,操作', 'zenmeyong,buhuiyong,jiaocheng,ceshi,fangfa,caozuo', '', NULL, 8, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (2100, 71, '不好意思哦，我也是新来的，要不稍后让我们经理给您回电话详细介绍一下，可以吗？', '/uploads/audio/20180904/20180904033425.wav', '', NULL, '', NULL, 8, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (2099, 71, '这样吧，电话里也不可能全部讲清楚，我稍后发一条短信给您或者让我们业务经理给您联系，您也可以加我微信，我微信就是这个手机号，详细的我们微信聊，祝你生活愉快！', '/uploads/audio/20180904/20180904033342.wav', '说什么,没听清,什么事,做什么,干什么,干啥,啥事,', 'shuoshimo,meitingqing,shenmeshi,zuoshimo,ganshenme,gansha,shashi,', '', NULL, 8, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (2098, 71, '实在不好意思，我这边还是没有听到你的声音，要不我先挂了，咱们回头再联系，再见', '/uploads/audio/20180904/20180904033312.wav', '', NULL, '', NULL, 8, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (2097, 71, '那打扰您了，祝您生活愉快，再见！', '/uploads/audio/20180904/20180904033234.wav', '', NULL, '', NULL, 5, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (2091, 71, '您也不用拒绝的这么快，不是说让您马上做决定，我觉得您至少可以先了解一下啊，毕竟这个智能机器人确实很好用，我们也可以给您一些好的建议，您觉得呢？', '/uploads/audio/20180904/20180904033148.wav', '不用,用不到,不明白,没听过,做什么,机器人,咋用,怎么样,怎么用,干啥子,不需要,考虑,以后再说,', 'buyong,yongbudao,bumingbai,meitingguo,zuoshimo,jiqiren,zayong,zenmeyang,zenmeyong,ganshazi,buxuyao,kaolv,yihouzaishuo,', '', NULL, 1, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (2085, 71, '我们的机器人一天能拨打一千到一千五百个电话。一个机器人相当于五个人的工作量，还是比较省时省力的。', '/uploads/audio/20180904/20180904033113.wav', '好用吗,怎么用,拨打量,一天打多少,是真的,真的吗,培训,教程,', 'haoyongma,zenmeyong,bodaliang,yitiandaduoshao,shizhende,zhendema,peixun,jiaocheng,', '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (2082, 71, '不好意思，您说', '/uploads/audio/20180904/20180904032911.wav', '', NULL, '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (2083, 71, '这个您可以放心，您可以在网上查找我们公司，我们公司都成立5年了，或者您可以来我们公司当面了解一下的呀，眼见为实的嘛，对吧', '/uploads/audio/20180904/20180904032939.wav', '', NULL, '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (2084, 71, '好的，我们的电话机器人是非常高效的，您可以根据业务需求在后台设定好关键词，机器人可以自动拨打电话与人沟通，回答问题，既增加工作效率又节省人力，是非常适合电销业务的。', '/uploads/audio/20180904/20180904033018.wav', '好用,怎么用,没用,费时,人工,干什么用,能做什么,有什么用,什么产品,什么机器人,', 'haoyong,zenmeyong,meiyong,feishi,rengong,ganshenmeyong,nengzuoshimo,youshenmeyong,shenmechanpin,shenmejiqiren,', '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (2081, 71, '我们这就是面向全国销售的啊，这样子吧，稍后我们业务经理会给您联系，给您详细介绍下，您可以了解清楚再做决定。', '/uploads/audio/20180904/20180904032837.wav', '', NULL, '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (2077, 71, '好的，您请说。', '/uploads/audio/20180904/20180904032631.wav', '', NULL, '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (2078, 71, '不好意思，您请讲。', '/uploads/audio/20180904/20180904032651.wav', '', NULL, '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (2079, 71, '哦，好的。', '/uploads/audio/20180904/20180904032707.wav', '', NULL, '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (2080, 71, '我们现在面向全国招各级代理商和加盟商，稍后我把我们招商经理的微信号和手机号发送给您，您可以加他微信和他详聊。机器的话您可以自己先试用一下，感觉好您再联系我们经理做我们的代理商或者加盟。', '/uploads/audio/20180904/20180904032735.wav', '合作方式,怎么合作,代理,加盟,招商,贴牌,试用', 'hezuofangshi,zenmehezuo,daili,jiameng,zhaoshang,tiepai,shiyong', '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (2074, 71, '怎么会呢，我们公司要求客服在与客户沟通的过程中，使用的话术是要统一的，为的就是能给您带来最好的客服体验。', '/uploads/audio/20180904/20180904032450.wav', '', NULL, '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (2075, 71, '是这样的，这个我们都是电脑随机拨号的。', '/uploads/audio/20180904/20180904032517.wav', '手机号,哪里弄得,从哪得到,怎么知道手机,', 'shoujihao,nalilongde,congnadedao,zenmezhidaoshouji,', '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (2076, 71, '好的，稍后我给您发条短信，里面有我们产品的链接和产品简介，您可以先了解一下，这个手机号也是我微信号，您可以加我微信聊！', '/uploads/audio/20180904/20180904032547.wav', '了解,具体一点,详细点,具体点,具体,仔细说,详细,参考', 'liaojie,jutiyidian,xiangxidian,jutidian,juti,zixishuo,xiangxi,cankao', '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (2072, 71, '我是标准的90后呢！', '/uploads/audio/20180904/20180904032203.wav', '多大,年龄,岁数,长相,样子,', 'duoda,nianling,suishu,zhangxiang,yangzi,', '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (2073, 71, '不好意思哦，我也是新来的，要不稍后让我们经理给您回电话详细介绍一下，可以吗？', '/uploads/audio/20180904/20180904032348.wav', '', NULL, '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (2071, 71, '我是聚盛网络科技有限公司的客服，我叫李灿灿，您叫我小李就可以了。', '/uploads/audio/20180904/20180904032136.wav', '叫什么名字,怎么称呼,贵姓,', 'jiaoshenmemingzi,zenmechenghu,guixing,', '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (2067, 71, '我们公司是沈阳聚盛网络科技有限公司，产品品牌是一呼AI智能机器人，这个产品是我们公司自主研发的，我们公司有国家知识产权的，您可以放心', '/uploads/audio/20180904/20180904031726.wav', '你是谁,公司,名称,做什么,哪里,啥东西,有什么用,做什么的,什么事,搞什么,干啥子,你谁呀,', 'nishishui,gongsi,mingcheng,zuoshimo,nali,shadongxi,youshenmeyong,zuoshimode,shenmeshi,gaoshenme,ganshazi,nishuiya,', '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (2068, 71, '我们公司地址在沈阳市沈北新区华强城，您要是方便可以来我们公司详细了解，您看可以吗？', '/uploads/audio/20180904/20180904031832.wav', '在哪,位置,地址,哪里,具体位置,发位置,什么车,', 'zaina,weizhi,dizhi,nali,jutiweizhi,faweizhi,shenmeche,', '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (2069, 71, '我们的机器人价格是很实惠的，具体价格的话要根据您购买的数量和使用时间来确定，量大肯定是有优惠的。具体让我们业务经理给您回电吧！', '/uploads/audio/20180904/20180904031902.wav', '价格,贵,价位,收费,免费,优惠,便宜,加高,价高,测试,试用,咋收,怎么收,报价,报个价,一个月,多少钱,', 'jiage,gui,jiawei,shoufei,mianfei,youhui,pianyi,jiagao,jiagao,ceshi,shiyong,zashou,zenmeshou,baojia,baogejia,yigeyue,duoshaoqian,', '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (2066, 71, '好的，那稍后我发一条短信给您，里面有我们公司的地址，您方便的话可以来公司具体了解或者稍后让我们业务经理回电给您，给您详细介绍一下。', '/uploads/audio/20180904/20180904034108.wav', '需要,那好吧,考虑考虑,想买,有这方面想法,有需求,感兴趣', 'xuyao,nahaoba,kaolvkaolv,xiangmai,youzhefangmianxiangfa,youxuqiu,ganxingqu', '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (2064, 71, '好的，我们公司地址在沈阳市沈北新区华强城，那稍后我发一条短信给您，里面有我们公司的地址，您方便的话可以来公司具体了解下。', '/uploads/audio/20180904/20180904034021.wav', '', NULL, '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (2065, 71, '好的，那稍后让我们公司业务经理回电给您，给您详细讲解。', '/uploads/audio/20180904/20180904034047.wav', '微信,qq,电话,邮箱,加微信', 'weixin,qq,dianhua,youxiang,jiaweixin', '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (2062, 71, '那打扰您了，祝您生活愉快，再见！', '/uploads/audio/20180904/20180904124447.wav', '', NULL, '', NULL, 0, 0, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (2061, 71, '好的，那稍后我发一条短信给您，里面有我们公司的地址，您方便的话可以来公司具体了解或者稍后让我们业务经理回电给您，给您详细介绍一下。', '/uploads/audio/20180904/20180904031438.wav', '', NULL, '', NULL, 0, 0, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (2059, 71, '稍后我把我们招商经理的微信号和手机号发送给您，您可以加他微信和他详聊。', '/uploads/audio/20180904/20180904031335.wav', '', NULL, '', NULL, 0, 0, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (2060, 71, '好的，我们的电话机器人是非常高效的，您可以根据业务需求在后台设定好关键词，机器人可以自动拨打电话与人沟通，回答问题，既增加工作效率又节省人力，是非常适合电销业务的。', '/uploads/audio/20180904/20180904031403.wav', '', NULL, '', NULL, 0, 0, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (2058, 71, '喂，您好，（录音停顿1秒）我们是做智能电话机器人的，就是代替人工拨打电话，就像我现在与您沟通的就是机器人拨打的，如果您有电销业务需求我给您简单介绍一下吧', '/uploads/audio/20180904/20180904031325.wav', '', NULL, '', NULL, 0, 0, 0, 0, 0);
INSERT INTO `rk_tel_flow` VALUES (2124, 72, '哎，好的，那具体到时候再说，我就先不打扰您了，那祝你生活愉快，再见。', '/uploads/audio/20180609114355.wav', '', NULL, '', NULL, 1, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (2125, 72, '恩，这个是需要看给你走什么产品的，快的话，咱们可以2,3天下款吗，甚至当天下款都是可以的，具体还是要看您一个资质了', '/uploads/audio/20180609114454.wav', '放款,贷款,拿钱,好快,好久,拿款,多块,多久,快不快', NULL, '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (2126, 72, '我们这有月2,3厘的产品，这个就是相当于你一万元一个月2.30元的，具体还是看你那边的情况，恩，你看要么我安排我们公司专业的融资顾问跟您详细沟通一下，让他给您详细匹配一下贷款方案，你看可以吗？', '/uploads/audio/20180609114732.wav', '利息,一起,必须', NULL, '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (2127, 72, '我们是专业的第3方融资服务平台，专门解决中小企业，个人融资难的问题的', '/uploads/audio/20180a609114833.wav', '哪里公司,哪里得公司,那个公司,啥子公司,什么公司,单位,中介,代理,做什么,东西', NULL, '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (2128, 72, '我们在东门大桥，春熙路这边的，就是在市中心', '/uploads/audio/20180609114920.wav', '地址,地方,位置,彼此,在那里,在哪', NULL, '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (2129, 72, '我们在成都这边都做了5年了，已经成功为数十万的贷款客户，解决了他们的融资问题。', '/uploads/audio/20180609115232.wav', '骗子,骗人,乱收费,保障,高利贷,催款,暴利,催收', NULL, '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (2130, 72, '恩，是这样子的，我们公司目前，是和跟多家银行和融资机构都在合作的，一般会您那边的具体情况来为你量身定做最佳贷款方案的。', '/uploads/audio/20180609115323.wav', '黑户,工作,黑妇,黑裤,负债,附在', NULL, '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (2131, 72, '恩，现在这些都是比较方便的啦。不管您是抵押，还是信用贷款，资料准备都很简单的了', '/uploads/audio/20180609115354.wav', '复杂,麻烦,难搞,难得搞', NULL, '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (2132, 72, '哦，我们准备的资料还是蛮简单的，就比如说：身份证，征信报告，还有社保，公积金或者房厂证，这些就可以了，这样吧，我一会还是发一个详细信息到您手机上，您到时看一下好吗?', '/uploads/audio/20180609115428.wav', '资料,材料', NULL, '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (2133, 72, '这个的话，还是看你那边是否愿意呀，如果您不想做抵押的话，那这边还是可以帮您操作信用贷款的。', '/uploads/audio/20180609115506.wav', '不做抵押,不低压,不地呀', NULL, '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (2134, 72, '哦，这个您放心好了，我们公司是正规贷款平台，利息都是按照国家标准来的，这个您可以来我们公司详细了解一下的。', '/uploads/audio/20180609115554.wav', '乱收费,保障,高利贷,高利贷,催款,暴利,催收', NULL, '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (2135, 72, '我们是做抵押，和个人信用贷款的', '/uploads/audio/20180609115623.wav', '都有', NULL, '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (2136, 72, '恩，是这样子的，我们公司目前，是和跟多家银行和融资机构都在合作的，一般会您那边的具体情况来为你量身定做最佳贷款方案的。', '/uploads/audio/20180609115647.wav', '银行,机构', NULL, '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (2137, 72, '这个您可以放心，您可以来我们公司当面了解一下的呀，眼见为实的嘛，对吧。', '/uploads/audio/20180609115713.wav', '正规,歪的', NULL, '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (2138, 72, '恩，这个是这样子的，我们公司会根据您这个具体情况来，为为您匹配到低费率的产品，因为我这边市场部的，那么，具体情况，我安排我们专业的融资顾问来为您解答，如果方案您满意的话，您可以直接找我们办理，如果不满意的话，您就当做一个了解，也是可以的，对吧。', '/uploads/audio/20180609115803.wav', '贷款,流程,抵押,做的,信用,二抵', NULL, '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (2139, 72, '我这边王，您叫我小王就可以了，稍后我给您发个信息过去，上面有我的姓名，还是手机号码，您随时联系我都是可以的', '/uploads/audio/20180609115851.wav', '称呼,贵姓,朋友', NULL, '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (2140, 72, '不好意思，您说', '/uploads/audio/20180609115935.wav', '听我讲,不要说,喂喂,等等', NULL, '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (2141, 72, '这个贷多少的话，还是要根据您个人情况来定的哈，每个人的情况都不同的。', '/uploads/audio/20180609115958.wav', '贷多少', NULL, '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (2142, 72, '是的，我们也有很多网贷渠道，我这边安排贷款顾问给你回个电话具体讲解下，这样更方便您了解，您看好么？', '/uploads/audio/20180610120030.wav', '网上,网贷,放款,APP,app,线上', NULL, '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (2143, 72, '这样子吧，我先安排贷款顾问给您详细介绍下，看您的条件满足不。你再做决定。', '/uploads/audio/20180610120059.wav', '远了,眉山,郫县,新都,龙泉,华阳,有点远,好远', NULL, '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (2144, 72, '要看您征信不好到什么程度，您看要么安排我们公司专业的融资顾问跟您详细沟通一下，然后给您匹配最好的贷款方案，您看可以吗', '/uploads/audio/20180610120126.wav', '逾期,征信,真信,黑名单,真心,真性,真行,[真,问题]', NULL, '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (2145, 72, '这样子吧，我先安排贷款顾问给您详细介绍下，看您的条件满足不。你再做决定。', '/uploads/audio/20180610120154.wav', '远了,眉山,郫县,新都,龙泉,华阳,有点远,好远', NULL, '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (2146, 72, '要看您征信不好到什么程度，您看要么安排我们公司专业的融资顾问跟您详细沟通一下，然后给您匹配最好的贷款方案，您看可以吗', '/uploads/audio/20180610120230.wav', '逾期,征信,真信,黑名单,真心,真性,真行,[真,问题]', NULL, '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (2147, 72, '我们有匹配不同年纪的银行产品，我能了解以下您的具体情况么？', '/uploads/audio/20180610120309.wav', '退休,老年人,年纪大,六七十岁,七八十岁', NULL, '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (2148, 72, '哦，是这样子的，我们有多种融资产品，我这边需要了解一下你的具体情况，看下怎么给您操作是最合适的。', '/uploads/audio/20180610120423.wav', '信用,保单,保险,社保,车,营业,执照,发票,飞机票,资质', NULL, '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (2149, 72, '这个我们都是电脑随机拨号的', '/uploads/audio/20180610120454.wav', '找到我,我的号码', NULL, '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (2150, 72, '怎么会呢，肯定是人工给你打的电话，我姓王，你可以叫我小王', '/uploads/audio/20180610120527.wav', '机器', NULL, '', NULL, 2, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (2151, 72, '哎,什么', '/uploads/audio/20180610120614.wav', '', NULL, '', NULL, 3, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (2152, 72, '哎,喂', '/uploads/audio/20180610120635.wav', '', NULL, '', NULL, 3, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (2153, 72, '不好意思，我这边听得不是很清楚，您能说得慢一点点嘛？', '/uploads/audio/20180610120653.wav', '', NULL, '', NULL, 3, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (2154, 72, '稍后等一下，我这边信号不太好，您刚才说什么呀。', '/uploads/audio/20180610120711.wav', '', NULL, '', NULL, 3, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (2155, 72, '那等您方便的时候我们再联系，祝您生活愉快，再见！', '/uploads/audio/20180610120802.wav', '没空,没有空,没有工夫,没工夫,比较忙,很忙,开会,开车,在忙,睡觉,吃东西,吃饭,不方便,有事,有点忙,有些忙,没时间,没有时间,再联系,打给我', NULL, '', NULL, 4, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (2156, 72, '那我这边先发个短信给你嘛。您先看下，做个了解，然后等您那边方便的时候，我们可以再联系的，好嘛。', '/uploads/audio/20180610120904.wav', '在外地,出差,[短信,给我],[信息,给我],[地址,给我],[忙,短信]', NULL, '', NULL, 4, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (2157, 72, '那没关系，等您需要的时候再联系，祝您生活愉快，再见。', '/uploads/audio/20180610120943.wav', '不需要,不用,不要,不想了解,不考虑,不要再打,没打算,不打算,不想,不感兴趣,打错,没需求,没需要,莫迪,莫的,同行,不累,没有,么有,没的,已贷,已经贷,不贷', NULL, '', NULL, 5, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (2158, 72, '哎，好的，那具体到时候再说，我就先不打扰您了，那祝你生活愉快，再见。', '/uploads/audio/20180610121026.wav', '产品', NULL, '', NULL, 6, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (2159, 72, '喂，在吗', '/uploads/audio/20180610121058.wav', '', NULL, '', NULL, 7, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (2160, 72, '喂，在听吗', '/uploads/audio/20180610121115.wav', '', NULL, '', NULL, 7, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (2161, 72, '实在不好意思，我这边还是没有听到你的声音，要不我先挂了，好了，咱们回头再联系，再见', '/uploads/audio/20180610121136.wav', '', NULL, '', NULL, 7, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (2162, 72, '不好意思啊,抱歉，我这边是市场部啦，有一些专业的问题不能给你很好的解答，您看要么安排我们专业的融资顾问跟您联系一下，让他给您做一下详细沟通，好吗?你看。', '/uploads/audio/20180610121214.wav', '', NULL, '', NULL, 8, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (2163, 72, '不好意思，抱歉呀，我这边也是刚才不久的，有一些不是很熟，您看要不这样子，等会还是让我们的信贷顾问给您打个电话，根您那边详细介绍一下，您看可以吗？', '/uploads/audio/20180610121239.wav', '', NULL, '', NULL, 8, 1, 0, 0, 1);
INSERT INTO `rk_tel_flow` VALUES (2164, 72, '我觉得这些问题，您真的还是得到我们公司来，让我们融资顾问给您解答会更好一点。', '/uploads/audio/20180610121302.wav', '', NULL, '', NULL, 8, 1, 0, 0, 1);

-- ----------------------------
-- Table structure for rk_tel_flow_ok
-- ----------------------------
DROP TABLE IF EXISTS `rk_tel_flow_ok`;
CREATE TABLE `rk_tel_flow_ok`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `scenarios_id` int(11) NOT NULL COMMENT '场景id',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '语音对应内容',
  `path` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '语音相对路径',
  `keyword` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回复匹配的关键字',
  `keyword_py` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `scenarios_keyword` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '场景关键字',
  `scenarios_keyword_py` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `classify` int(11) NOT NULL COMMENT '流程分类：命中 拒绝',
  `bridge` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否转人工0，否 1是',
  `type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '语音类型 0 流程语音 1 问答语音 2 结束语音',
  `priority` int(11) NOT NULL DEFAULT 0 COMMENT '优化级 ',
  `break` tinyint(2) NOT NULL DEFAULT 1 COMMENT '0 不打断  1 打断',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `scenarios_id`(`scenarios_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1659 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '流程' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rk_tel_flow_ok
-- ----------------------------
INSERT INTO `rk_tel_flow_ok` VALUES (1249, 68, '喂，您好!', '/uploads/audio/20180825/201808031040301.wav', '', NULL, '', NULL, 0, 0, 0, 50, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1250, 68, '唉您好我这边有推出市中心首付15万起的精装修公寓，周边房价都涨了30%,现在房产行情这么好，您有投资房产的打算吗?', '/uploads/audio/20180825/upload-20180803104040_966.wav', '', NULL, '', NULL, 0, 0, 0, 49, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1251, 68, '是这样子的，我们公司主要销售杭州宁波上海等繁华区域的精装楼盘，包租包涨，去年同期购买的客户现在都赚了不少钱，老板你有没有发现别的行业做了几年赚的钱还不如买一套房子投资来的划算', '/uploads/audio/20180825/upload-20180803104040_967.wav', '', NULL, '', NULL, 0, 0, 0, 48, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1252, 68, '恩,好的，那如果你有兴趣了解的话，那等会挂完电话之后呢，我加您微信您通过一下给您详细介绍.', '/uploads/audio/20180825/upload-20180803104040_968.wav', '', NULL, '', NULL, 0, 0, 0, 47, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1253, 68, '好的，那祝您生活愉快，再见', '/uploads/audio/20180825/upload-20180803104040_969.wav', '', NULL, '', NULL, 0, 0, 0, 46, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1254, 68, '我们的项目有好几个 ,都是位于人口密集，地段繁华的闹市中心或者政府规划有潜力的新城都是有红头文件可以查的，具体的地我等下加您微信给您发项目资料.', '/uploads/audio/20180825/20180803105627_00.wav', '项目', NULL, '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1255, 68, '均价的话有 6 7千每平米的也有 1万多的，具体要看楼盘的位置和项目，比如银泰城的可能就会比别的要贵1 2千每平方', '/uploads/audio/20180825/20180803105627_01.wav', '楼盘', NULL, '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1256, 68, '面积的话小户型30-80多平方都有,大户型的80-200平方都有，选择也有很多，这个项目不一样，价格面积也不一样，我等会加您微信给你发具体的资料.', '/uploads/audio/20180825/20180803105627_02.wav', NULL, NULL, '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1257, 68, '是这样的，我们会跟您签一份十年的包租合同，由开发商这边统一包租包管，每年房子总价6个点的租金直接打到你银行卡上。比方说：您这套房子总价50万，那每年给您的租金6个点就是三万，你躺着就可以收租金了.', '/uploads/audio/20180825/20180803105627_03.wav', NULL, NULL, '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1258, 68, '是的，国家规定商业性质的都是40年产权房，当然70年产权的也有，你喜欢投资哪种就投资哪种.', '/uploads/audio/20180825/20180803105627_04.wav', NULL, NULL, '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1259, 68, '我们的项目基本上都有地铁或者轻轨覆盖，交通都是非常发达的.而且未来升值的潜力都是非常大的.', '/uploads/audio/20180825/20180803105627_05.wav', NULL, NULL, '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1260, 68, '公寓层高3.5米到4米的都有，有些项目4.5米的也有这个我等会发你资料你好好看看.', '/uploads/audio/20180825/20180803105627_06.wav', NULL, NULL, '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1261, 68, '物业费一般2-3元，不过物业费是不需要业主来出的，租客会承担的，所以你不用担心，这些我们经验非常足的', '/uploads/audio/20180825/20180803105627_07.wav', '物业费  物业多少钱 物业好不好  物业贵不贵', 'wuyefeiwuyeduoshaoqianwuyehaobuhaowuyeguibugui', '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1262, 68, '不好意思，我是公司新来的，不是很专业，希望您理解，关于您的问题，稍后我们会有专业的销售经理和您联系', '/uploads/audio/20180825/20180803105627_08.wav', NULL, NULL, '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1263, 68, '这个您可能之前咨询过房产的相关问题。如果不巧打扰到您，向您说声抱歉', '/uploads/audio/20180825/20180803105627_09.wav', '之前联系过  不要再打了  好烦 骚扰 别打了', 'zhiqianlianxiguobuyaozaidalehaofansaoraobiedale', '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1264, 68, '老板如果您真的没钱那也爱莫助了，如果您开玩笑说没钱那真是遗憾加可惜了，现在好多人都婉惜以前没有买房，这么多年白努力了', '/uploads/audio/20180825/20180803105627_10.wav', '没钱 资金不足  太贵了', 'meiqianzijinbuzutaiguile', '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1265, 68, '我们目前在售的基本上都是现房，也有少部份是期房,稍后我就把资料发给您，你看下.', '/uploads/audio/20180825/20180803105627_11.wav', '现房  期房  样板间', 'xianfangqifangyangbanjian', '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1266, 68, '如果您要去考察的话，我们都有专车包接送的，而且高速下来就到了，非常方便.', '/uploads/audio/20180825/20180803105627_12.wav', '车接  交通  交通不方便', 'chejiejiaotongjiaotongbufangbian', '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1267, 68, '老板这个您放心好了，都说了多少年房价要降要降，结果呢，一点没降反而三四线城市的价格蹭蹭蹭往上涨,同时政府不可能让房子降价不然银行要倒闭了,所以未来投资还是房子最靠谱.', '/uploads/audio/20180825/20180803105627_13.wav', NULL, NULL, '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1268, 68, '恩，投资房产毕竟是大事是得考虑一下，不过您可以先加一下微信，随时了解关注一下房产行情，行情好的时候就可以适当出手了.我之前的客户就是这样的现在都赚了很多了. 恩，行，那这样，老板，你先忙，挂完电话之后呢，我就加您微信，您先通过一下，买不买都没事，可以先关注着', '/uploads/audio/20180825/20180803105627_14.wav', NULL, NULL, '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1269, 68, '我是椒江的房产公司，我们主要销售宁波的房子为主', '/uploads/audio/20180825/20180803105627_15.wav', NULL, NULL, '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1270, 68, '你是问哪里的楼盘吗？我们项目有好多个，具体的以宁波市中心或者是 杭州湾的项目', '/uploads/audio/20180825/20180803105627_16.wav', NULL, NULL, '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1271, 68, '那没关系,等您需要的时候再联系,祝您生活愉快,再见', '/uploads/audio/20180825/20180803104756_590.wav', '不需要', NULL, '', NULL, 5, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1272, 68, '哦，不好意思，我没听清楚，您可以说慢一点吗？', '/uploads/audio/20180825/20180803104203_670.wav', '不好意思', NULL, '', NULL, 8, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1273, 68, '那行，你先忙，那等您方便的时候我们再联系，祝您生活愉快，再见', '/uploads/audio/20180825/20180803104226_7579.wav', '忙', NULL, '', NULL, 4, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1274, 68, '喂，您好，在吗', '/uploads/audio/20180825/20180803105009_182.wav', NULL, NULL, '', NULL, 7, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1275, 68, '实在不好意思，我这边还是没有听到你的声音，你可以再说一遍吗', '/uploads/audio/20180825/20180803105029_59.wav', NULL, NULL, '', NULL, 7, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1276, 67, '喂，您好!', '/uploads/audio/20180825/201808031040301.wav', '', NULL, '', NULL, 0, 0, 0, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1277, 67, '唉您好我这边有推出市中心首付15万起的精装修公寓，周边房价都涨了30%,现在房产行情这么好，您有投资房产的打算吗?', '/uploads/audio/20180825/upload-20180803104040_966.wav', NULL, NULL, '', NULL, 0, 0, 0, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1278, 67, '是这样子的，我们公司主要销售杭州宁波上海等繁华区域的精装楼盘，包租包涨，去年同期购买的客户现在都赚了不少钱，老板你有没有发现别的行业做了几年赚的钱还不如买一套房子投资来的划算', '/uploads/audio/20180825/upload-20180803104040_967.wav', NULL, NULL, '', NULL, 0, 0, 0, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1279, 67, '恩,好的，那如果你有兴趣了解的话，那等会挂完电话之后呢，我加您微信您通过一下给您详细介绍.', '/uploads/audio/20180825/upload-20180803104040_968.wav', NULL, NULL, '', NULL, 0, 0, 0, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1280, 67, '好的，那祝您生活愉快，再见', '/uploads/audio/20180825/upload-20180803104040_969.wav', NULL, NULL, '', NULL, 0, 0, 0, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1281, 67, '我们的项目有好几个 ,都是位于人口密集，地段繁华的闹市中心或者政府规划有潜力的新城都是有红头文件可以查的，具体的地我等下加您微信给您发项目资料.', '/uploads/audio/20180825/20180803105627_00.wav', '项目', NULL, '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1282, 67, '均价的话有 6 7千每平米的也有 1万多的，具体要看楼盘的位置和项目，比如银泰城的可能就会比别的要贵1 2千每平方', '/uploads/audio/20180825/20180803105627_01.wav', '楼盘', NULL, '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1283, 67, '面积的话小户型30-80多平方都有,大户型的80-200平方都有，选择也有很多，这个项目不一样，价格面积也不一样，我等会加您微信给你发具体的资料.', '/uploads/audio/20180825/20180803105627_02.wav', NULL, NULL, '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1284, 67, '是这样的，我们会跟您签一份十年的包租合同，由开发商这边统一包租包管，每年房子总价6个点的租金直接打到你银行卡上。比方说：您这套房子总价50万，那每年给您的租金6个点就是三万，你躺着就可以收租金了.', '/uploads/audio/20180825/20180803105627_03.wav', NULL, NULL, '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1285, 67, '是的，国家规定商业性质的都是40年产权房，当然70年产权的也有，你喜欢投资哪种就投资哪种.', '/uploads/audio/20180825/20180803105627_04.wav', NULL, NULL, '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1286, 67, '我们的项目基本上都有地铁或者轻轨覆盖，交通都是非常发达的.而且未来升值的潜力都是非常大的.', '/uploads/audio/20180825/20180803105627_05.wav', NULL, NULL, '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1287, 67, '公寓层高3.5米到4米的都有，有些项目4.5米的也有这个我等会发你资料你好好看看.', '/uploads/audio/20180825/20180803105627_06.wav', NULL, NULL, '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1288, 67, '物业费一般2-3元，不过物业费是不需要业主来出的，租客会承担的，所以你不用担心，这些我们经验非常足的', '/uploads/audio/20180825/20180803105627_07.wav', NULL, NULL, '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1289, 67, '不好意思，我是公司新来的，不是很专业，希望您理解，关于您的问题，稍后我们会有专业的销售经理和您联系', '/uploads/audio/20180825/20180803105627_08.wav', NULL, NULL, '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1290, 67, '这个您可能之前咨询过房产的相关问题。如果不巧打扰到您，向您说声抱歉', '/uploads/audio/20180825/20180803105627_09.wav', NULL, NULL, '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1291, 67, '老板如果您真的没钱那也爱莫助了，如果您开玩笑说没钱那真是遗憾加可惜了，现在好多人都婉惜以前没有买房，这么多年白努力了', '/uploads/audio/20180825/20180803105627_10.wav', NULL, NULL, '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1292, 67, '我们目前在售的基本上都是现房，也有少部份是期房,稍后我就把资料发给您，你看下.', '/uploads/audio/20180825/20180803105627_11.wav', NULL, NULL, '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1293, 67, '如果您要去考察的话，我们都有专车包接送的，而且高速下来就到了，非常方便.', '/uploads/audio/20180825/20180803105627_12.wav', NULL, NULL, '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1294, 67, '老板这个您放心好了，都说了多少年房价要降要降，结果呢，一点没降反而三四线城市的价格蹭蹭蹭往上涨,同时政府不可能让房子降价不然银行要倒闭了,所以未来投资还是房子最靠谱.', '/uploads/audio/20180825/20180803105627_13.wav', NULL, NULL, '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1295, 67, '恩，投资房产毕竟是大事是得考虑一下，不过您可以先加一下微信，随时了解关注一下房产行情，行情好的时候就可以适当出手了.我之前的客户就是这样的现在都赚了很多了. 恩，行，那这样，老板，你先忙，挂完电话之后呢，我就加您微信，您先通过一下，买不买都没事，可以先关注着', '/uploads/audio/20180825/20180803105627_14.wav', NULL, NULL, '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1296, 67, '我是椒江的房产公司，我们主要销售宁波的房子为主', '/uploads/audio/20180825/20180803105627_15.wav', NULL, NULL, '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1297, 67, '你是问哪里的楼盘吗？我们项目有好多个，具体的以宁波市中心或者是 杭州湾的项目', '/uploads/audio/20180825/20180803105627_16.wav', NULL, NULL, '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1298, 67, '那没关系,等您需要的时候再联系,祝您生活愉快,再见', '/uploads/audio/20180825/20180803104756_590.wav', '不需要', NULL, '', NULL, 5, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1299, 67, '哦，不好意思，我没听清楚，您可以说慢一点吗？', '/uploads/audio/20180825/20180803104203_670.wav', '不好意思', NULL, '', NULL, 8, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1300, 67, '那行，你先忙，那等您方便的时候我们再联系，祝您生活愉快，再见', '/uploads/audio/20180825/20180803104226_7579.wav', '忙', NULL, '', NULL, 4, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1301, 67, '喂，您好，在吗', '/uploads/audio/20180825/20180803105009_182.wav', NULL, NULL, '', NULL, 7, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1302, 67, '实在不好意思，我这边还是没有听到你的声音，你可以再说一遍吗', '/uploads/audio/20180825/20180803105029_59.wav', NULL, NULL, '', NULL, 7, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1303, 69, '您好，我这边是专业办理银行贷款的，请问你最近有办理银行贷款的考虑吗？', '/uploads/audio/20180609065627.wav', '', NULL, '', NULL, 1, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1304, 69, '是这样子的，我们是平安银行的合作单位，专门解决个人还有中小企业融资难，融资贵的问题的，我这边方便了解一下你的情况吗?', '/uploads/audio/20180609085643.wav', '', NULL, '', NULL, 0, 0, 0, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1305, 69, '这样，我先问一下，您目前是需要多少资金呢？', '/uploads/audio/20180609085722.wav', '', NULL, '', NULL, 0, 0, 0, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1306, 69, '那您是开公司，还是自己上班的。', '/uploads/audio/20180609085853.wav', '', NULL, '', NULL, 0, 0, 0, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1307, 69, '那方便问一下，您自己有房子或者车子吗?', '/uploads/audio/20180609085956.wav', '', NULL, '', NULL, 0, 0, 0, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1308, 69, '好的，那具体到时候再说，我就先不打扰您了，那祝你生活愉快，再见。', '/uploads/audio/20180609090026.wav', '', NULL, '', NULL, 0, 0, 0, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1309, 69, '咱们这边利息低，放款又快，还是很不错的，真的。', '/uploads/audio/20180609090145.wav', '利息,速度', NULL, '', NULL, 1, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1310, 69, '是这样子的，我们公司会根据您的实际情况，为您匹配到低费率而且是较快的贷款产品，当然我们公司也会收取贷款额少量比例的服务费用，具体多少还是根据客户实际情况来定的。', '/uploads/audio/20180609112556.wav', '费用,手续费,收费,免费,收钱,要钱,几个点,中介费', NULL, '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1311, 69, '你可以稍微了解一下嘛，我们这边是和银行正规合作的，下款非常快，而且利息也很低。', '/uploads/audio/20180609114154.wav', '', NULL, '', NULL, 1, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1312, 69, '你看这样子好不好，具体问题，我建议您还是来我们公司详细了解一下，或者等会让我们融资顾问给您打个电话，好吗？', '/uploads/audio/20180609114301.wav', '', NULL, '', NULL, 1, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1313, 69, '呢，您看这样子好了，我这边先给您发个信息过去，你看一下，做个了结，你感兴趣的话，您也可以随时联系我的。', '/uploads/audio/20180609114337.wav', '', NULL, '', NULL, 1, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1314, 69, '哎，好的，那具体到时候再说，我就先不打扰您了，那祝你生活愉快，再见。', '/uploads/audio/20180609114355.wav', '', NULL, '', NULL, 1, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1315, 69, '恩，这个是需要看给你走什么产品的，快的话，咱们可以2,3天下款吗，甚至当天下款都是可以的，具体还是要看您一个资质了', '/uploads/audio/20180609114454.wav', '放款,贷款,拿钱,好快,好久,拿款,多块,多久,快不快', NULL, '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1316, 69, '我们这有月2,3厘的产品，这个就是相当于你一万元一个月2.30元的，具体还是看你那边的情况，恩，你看要么我安排我们公司专业的融资顾问跟您详细沟通一下，让他给您详细匹配一下贷款方案，你看可以吗？', '/uploads/audio/20180609114732.wav', '利息,一起,必须', NULL, '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1317, 69, '我们是专业的第3方融资服务平台，专门解决中小企业，个人融资难的问题的', '/uploads/audio/20180a609114833.wav', '哪里公司,哪里得公司,那个公司,啥子公司,什么公司,单位,中介,代理,做什么,东西', NULL, '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1318, 69, '我们在东门大桥，春熙路这边的，就是在市中心', '/uploads/audio/20180609114920.wav', '地址,地方,位置,彼此,在那里,在哪', NULL, '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1319, 69, '我们在成都这边都做了5年了，已经成功为数十万的贷款客户，解决了他们的融资问题。', '/uploads/audio/20180609115232.wav', '骗子,骗人,乱收费,保障,高利贷,催款,暴利,催收', NULL, '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1320, 69, '恩，是这样子的，我们公司目前，是和跟多家银行和融资机构都在合作的，一般会您那边的具体情况来为你量身定做最佳贷款方案的。', '/uploads/audio/20180609115323.wav', '黑户,工作,黑妇,黑裤,负债,附在', NULL, '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1321, 69, '恩，现在这些都是比较方便的啦。不管您是抵押，还是信用贷款，资料准备都很简单的了', '/uploads/audio/20180609115354.wav', '复杂,麻烦,难搞,难得搞', NULL, '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1322, 69, '哦，我们准备的资料还是蛮简单的，就比如说：身份证，征信报告，还有社保，公积金或者房厂证，这些就可以了，这样吧，我一会还是发一个详细信息到您手机上，您到时看一下好吗?', '/uploads/audio/20180609115428.wav', '资料,材料', NULL, '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1323, 69, '这个的话，还是看你那边是否愿意呀，如果您不想做抵押的话，那这边还是可以帮您操作信用贷款的。', '/uploads/audio/20180609115506.wav', '不做抵押,不低压,不地呀', NULL, '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1324, 69, '哦，这个您放心好了，我们公司是正规贷款平台，利息都是按照国家标准来的，这个您可以来我们公司详细了解一下的。', '/uploads/audio/20180609115554.wav', '乱收费,保障,高利贷,高利贷,催款,暴利,催收', NULL, '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1325, 69, '我们是做抵押，和个人信用贷款的', '/uploads/audio/20180609115623.wav', '都有', NULL, '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1326, 69, '恩，是这样子的，我们公司目前，是和跟多家银行和融资机构都在合作的，一般会您那边的具体情况来为你量身定做最佳贷款方案的。', '/uploads/audio/20180609115647.wav', '银行,机构', NULL, '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1327, 69, '这个您可以放心，您可以来我们公司当面了解一下的呀，眼见为实的嘛，对吧。', '/uploads/audio/20180609115713.wav', '正规,歪的', NULL, '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1328, 69, '恩，这个是这样子的，我们公司会根据您这个具体情况来，为为您匹配到低费率的产品，因为我这边市场部的，那么，具体情况，我安排我们专业的融资顾问来为您解答，如果方案您满意的话，您可以直接找我们办理，如果不满意的话，您就当做一个了解，也是可以的，对吧。', '/uploads/audio/20180609115803.wav', '贷款,流程,抵押,做的,信用,二抵', NULL, '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1329, 69, '我这边王，您叫我小王就可以了，稍后我给您发个信息过去，上面有我的姓名，还是手机号码，您随时联系我都是可以的', '/uploads/audio/20180609115851.wav', '称呼,贵姓,朋友', NULL, '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1330, 69, '不好意思，您说', '/uploads/audio/20180609115935.wav', '听我讲,不要说,喂喂,等等', NULL, '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1331, 69, '这个贷多少的话，还是要根据您个人情况来定的哈，每个人的情况都不同的。', '/uploads/audio/20180609115958.wav', '贷多少', NULL, '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1332, 69, '是的，我们也有很多网贷渠道，我这边安排贷款顾问给你回个电话具体讲解下，这样更方便您了解，您看好么？', '/uploads/audio/20180610120030.wav', '网上,网贷,放款,APP,app,线上', NULL, '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1333, 69, '这样子吧，我先安排贷款顾问给您详细介绍下，看您的条件满足不。你再做决定。', '/uploads/audio/20180610120059.wav', '远了,眉山,郫县,新都,龙泉,华阳,有点远,好远', NULL, '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1334, 69, '要看您征信不好到什么程度，您看要么安排我们公司专业的融资顾问跟您详细沟通一下，然后给您匹配最好的贷款方案，您看可以吗', '/uploads/audio/20180610120126.wav', '逾期,征信,真信,黑名单,真心,真性,真行,[真,问题]', NULL, '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1335, 69, '这样子吧，我先安排贷款顾问给您详细介绍下，看您的条件满足不。你再做决定。', '/uploads/audio/20180610120154.wav', '远了,眉山,郫县,新都,龙泉,华阳,有点远,好远', NULL, '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1336, 69, '要看您征信不好到什么程度，您看要么安排我们公司专业的融资顾问跟您详细沟通一下，然后给您匹配最好的贷款方案，您看可以吗', '/uploads/audio/20180610120230.wav', '逾期,征信,真信,黑名单,真心,真性,真行,[真,问题]', NULL, '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1337, 69, '我们有匹配不同年纪的银行产品，我能了解以下您的具体情况么？', '/uploads/audio/20180610120309.wav', '退休,老年人,年纪大,六七十岁,七八十岁', NULL, '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1338, 69, '哦，是这样子的，我们有多种融资产品，我这边需要了解一下你的具体情况，看下怎么给您操作是最合适的。', '/uploads/audio/20180610120423.wav', '信用,保单,保险,社保,车,营业,执照,发票,飞机票,资质', NULL, '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1339, 69, '这个我们都是电脑随机拨号的', '/uploads/audio/20180610120454.wav', '找到我,我的号码', NULL, '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1340, 69, '怎么会呢，肯定是人工给你打的电话，我姓王，你可以叫我小王', '/uploads/audio/20180610120527.wav', '机器', NULL, '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1341, 69, '哎,什么', '/uploads/audio/20180610120614.wav', '', NULL, '', NULL, 3, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1342, 69, '哎,喂', '/uploads/audio/20180610120635.wav', '', NULL, '', NULL, 3, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1343, 69, '不好意思，我这边听得不是很清楚，您能说得慢一点点嘛？', '/uploads/audio/20180610120653.wav', '', NULL, '', NULL, 3, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1344, 69, '稍后等一下，我这边信号不太好，您刚才说什么呀。', '/uploads/audio/20180610120711.wav', '', NULL, '', NULL, 3, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1345, 69, '那等您方便的时候我们再联系，祝您生活愉快，再见！', '/uploads/audio/20180610120802.wav', '没空,没有空,没有工夫,没工夫,比较忙,很忙,开会,开车,在忙,睡觉,吃东西,吃饭,不方便,有事,有点忙,有些忙,没时间,没有时间,再联系,打给我', NULL, '', NULL, 4, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1346, 69, '那我这边先发个短信给你嘛。您先看下，做个了解，然后等您那边方便的时候，我们可以再联系的，好嘛。', '/uploads/audio/20180610120904.wav', '在外地,出差,[短信,给我],[信息,给我],[地址,给我],[忙,短信]', NULL, '', NULL, 4, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1347, 69, '那没关系，等您需要的时候再联系，祝您生活愉快，再见。', '/uploads/audio/20180610120943.wav', '不需要,不用,不要,不想了解,不考虑,不要再打,没打算,不打算,不想,不感兴趣,打错,没需求,没需要,莫迪,莫的,同行,不累,没有,么有,没的,已贷,已经贷,不贷', NULL, '', NULL, 5, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1348, 69, '哎，好的，那具体到时候再说，我就先不打扰您了，那祝你生活愉快，再见。', '/uploads/audio/20180610121026.wav', '产品', NULL, '', NULL, 6, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1349, 69, '喂，在吗', '/uploads/audio/20180610121058.wav', '', NULL, '', NULL, 7, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1350, 69, '喂，在听吗', '/uploads/audio/20180610121115.wav', '', NULL, '', NULL, 7, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1351, 69, '实在不好意思，我这边还是没有听到你的声音，要不我先挂了，好了，咱们回头再联系，再见', '/uploads/audio/20180610121136.wav', '', NULL, '', NULL, 7, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1352, 69, '不好意思啊,抱歉，我这边是市场部啦，有一些专业的问题不能给你很好的解答，您看要么安排我们专业的融资顾问跟您联系一下，让他给您做一下详细沟通，好吗?你看。', '/uploads/audio/20180610121214.wav', '', NULL, '', NULL, 8, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1353, 69, '不好意思，抱歉呀，我这边也是刚才不久的，有一些不是很熟，您看要不这样子，等会还是让我们的信贷顾问给您打个电话，根您那边详细介绍一下，您看可以吗？', '/uploads/audio/20180610121239.wav', '', NULL, '', NULL, 8, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1354, 69, '我觉得这些问题，您真的还是得到我们公司来，让我们融资顾问给您解答会更好一点。', '/uploads/audio/20180610121302.wav', '', NULL, '', NULL, 8, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1656, 71, '喂，在听吗', '/uploads/audio/20180904/20180904124426.wav', '', NULL, '', NULL, 7, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1657, 71, '那打扰您了，祝您生活愉快，再见！', '/uploads/audio/20180904/20180904124509.wav', '', NULL, '', NULL, 6, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1655, 71, '喂，在吗', '/uploads/audio/20180904/20180904124323.wav', '', NULL, '', NULL, 7, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1649, 71, '不好意思，抱歉呀，我这边也是刚来不久的，有一些不是很熟，您看要不这样子，等会还是让我们的负责人给您打个电话，根您那边详细介绍一下，您看可以吗？', '/uploads/audio/20180904/20180904033541.wav', '', NULL, '', NULL, 8, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1650, 71, '我觉得这些问题，您真的还是得到我们公司来，让我们负责人给您解答会更好一点。', '/uploads/audio/20180904/20180904033627.wav', '技术,稳定性,安全,专业,怎么用', 'jishu,wendingxing,anquan,zhuanye,zenmeyong', '', NULL, 8, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1651, 71, '那等您方便的时候再联系您吧，再见！', '/uploads/audio/20180904/20180904124529.wav', '没空,没时间,太忙,开会,出差,睡觉,洗澡,按摩,吃饭,喝酒,约会,看电影,在玩', 'meikong,meishijian,taimang,kaihui,chuchai,shuijiao,xizao,anmo,chifan,hejiu,yuehui,kandianying,zaiwan', '', NULL, 4, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1652, 71, '那我这边先发个短信给你嘛。您先看下，做个了解，然后等您那边方便的时候，我们可以再联系的，好嘛', '/uploads/audio/20180904/20180904033720.wav', '有事情,在忙,开会', 'youshiqing,zaimang,kaihui', '', NULL, 4, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1653, 71, '抱歉，我这边没听清楚，您能说的慢一点吗', '/uploads/audio/20180904/20180904124544.wav', '', NULL, '', NULL, 7, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1654, 71, '这样吧，这边信号不好，具体我们加微信聊，这个手机号就是我微信号，再见', '/uploads/audio/20180904/20180904033812.wav', '', NULL, '', NULL, 7, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1647, 71, '不好意思哦，我也是新来的，要不稍后让我们经理给您回电话详细介绍一下，可以吗？', '/uploads/audio/20180904/20180904033425.wav', '', NULL, '', NULL, 8, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1648, 71, '不好意思啊,抱歉，我这边是市场部啦，有一些专业的问题不能给你很好的解答，您看要么安排我们专业的负责人跟您联系一下，让他给您做一下详细沟通，您看可以吗?', '/uploads/audio/20180904/20180904033458.wav', '怎么用,不会用,教程,测试,方法,操作', 'zenmeyong,buhuiyong,jiaocheng,ceshi,fangfa,caozuo', '', NULL, 8, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1643, 71, '您也不用拒绝的这么快，不是说让您马上做决定，我觉得您至少可以先了解一下啊，毕竟这个智能机器人确实很好用，我们也可以给您一些好的建议，您觉得呢？', '/uploads/audio/20180904/20180904033148.wav', '不用,用不到,不明白,没听过,做什么,机器人,咋用,怎么样,怎么用,干啥子,不需要,考虑,以后再说,', 'buyong,yongbudao,bumingbai,meitingguo,zuoshimo,jiqiren,zayong,zenmeyang,zenmeyong,ganshazi,buxuyao,kaolv,yihouzaishuo,', '', NULL, 1, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1646, 71, '这样吧，电话里也不可能全部讲清楚，我稍后发一条短信给您或者让我们业务经理给您联系，您也可以加我微信，我微信就是这个手机号，详细的我们微信聊，祝你生活愉快！', '/uploads/audio/20180904/20180904033342.wav', '说什么,没听清,什么事,做什么,干什么,干啥,啥事,', 'shuoshimo,meitingqing,shenmeshi,zuoshimo,ganshenme,gansha,shashi,', '', NULL, 8, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1644, 71, '那打扰您了，祝您生活愉快，再见！', '/uploads/audio/20180904/20180904033234.wav', '', NULL, '', NULL, 5, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1645, 71, '实在不好意思，我这边还是没有听到你的声音，要不我先挂了，咱们回头再联系，再见', '/uploads/audio/20180904/20180904033312.wav', '', NULL, '', NULL, 8, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1642, 71, '我们的机器人一天能拨打一千到一千五百个电话。一个机器人相当于五个人的工作量，还是比较省时省力的。', '/uploads/audio/20180904/20180904033113.wav', '好用吗,怎么用,拨打量,一天打多少,是真的,真的吗,培训,教程,', 'haoyongma,zenmeyong,bodaliang,yitiandaduoshao,shizhende,zhendema,peixun,jiaocheng,', '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1639, 71, '不好意思，您说', '/uploads/audio/20180904/20180904032911.wav', '', NULL, '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1640, 71, '这个您可以放心，您可以在网上查找我们公司，我们公司都成立5年了，或者您可以来我们公司当面了解一下的呀，眼见为实的嘛，对吧', '/uploads/audio/20180904/20180904032939.wav', '', NULL, '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1638, 71, '我们这就是面向全国销售的啊，这样子吧，稍后我们业务经理会给您联系，给您详细介绍下，您可以了解清楚再做决定。', '/uploads/audio/20180904/20180904032837.wav', '', NULL, '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1641, 71, '好的，我们的电话机器人是非常高效的，您可以根据业务需求在后台设定好关键词，机器人可以自动拨打电话与人沟通，回答问题，既增加工作效率又节省人力，是非常适合电销业务的。', '/uploads/audio/20180904/20180904033018.wav', '好用,怎么用,没用,费时,人工,干什么用,能做什么,有什么用,什么产品,什么机器人,', 'haoyong,zenmeyong,meiyong,feishi,rengong,ganshenmeyong,nengzuoshimo,youshenmeyong,shenmechanpin,shenmejiqiren,', '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1634, 71, '好的，您请说。', '/uploads/audio/20180904/20180904032631.wav', '', NULL, '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1635, 71, '不好意思，您请讲。', '/uploads/audio/20180904/20180904032651.wav', '', NULL, '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1636, 71, '哦，好的。', '/uploads/audio/20180904/20180904032707.wav', '', NULL, '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1633, 71, '好的，稍后我给您发条短信，里面有我们产品的链接和产品简介，您可以先了解一下，这个手机号也是我微信号，您可以加我微信聊！', '/uploads/audio/20180904/20180904032547.wav', '了解,具体一点,详细点,具体点,具体,仔细说,详细,参考', 'liaojie,jutiyidian,xiangxidian,jutidian,juti,zixishuo,xiangxi,cankao', '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1637, 71, '我们现在面向全国招各级代理商和加盟商，稍后我把我们招商经理的微信号和手机号发送给您，您可以加他微信和他详聊。机器的话您可以自己先试用一下，感觉好您再联系我们经理做我们的代理商或者加盟。', '/uploads/audio/20180904/20180904032735.wav', '合作方式,怎么合作,代理,加盟,招商,贴牌,试用', 'hezuofangshi,zenmehezuo,daili,jiameng,zhaoshang,tiepai,shiyong', '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1628, 71, '我是聚盛网络科技有限公司的客服，我叫李灿灿，您叫我小李就可以了。', '/uploads/audio/20180904/20180904032136.wav', '叫什么名字,怎么称呼,贵姓,', 'jiaoshenmemingzi,zenmechenghu,guixing,', '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1626, 71, '我们公司地址在沈阳市沈北新区华强城，您要是方便可以来我们公司详细了解，您看可以吗？', '/uploads/audio/20180904/20180904031832.wav', '在哪,位置,地址,哪里,具体位置,发位置,什么车,', 'zaina,weizhi,dizhi,nali,jutiweizhi,faweizhi,shenmeche,', '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1631, 71, '怎么会呢，我们公司要求客服在与客户沟通的过程中，使用的话术是要统一的，为的就是能给您带来最好的客服体验。', '/uploads/audio/20180904/20180904032450.wav', '', NULL, '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1632, 71, '是这样的，这个我们都是电脑随机拨号的。', '/uploads/audio/20180904/20180904032517.wav', '手机号,哪里弄得,从哪得到,怎么知道手机,', 'shoujihao,nalilongde,congnadedao,zenmezhidaoshouji,', '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1629, 71, '我是标准的90后呢！', '/uploads/audio/20180904/20180904032203.wav', '多大,年龄,岁数,长相,样子,', 'duoda,nianling,suishu,zhangxiang,yangzi,', '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1630, 71, '不好意思哦，我也是新来的，要不稍后让我们经理给您回电话详细介绍一下，可以吗？', '/uploads/audio/20180904/20180904032348.wav', '', NULL, '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1627, 71, '我们的机器人价格是很实惠的，具体价格的话要根据您购买的数量和使用时间来确定，量大肯定是有优惠的。具体让我们业务经理给您回电吧！', '/uploads/audio/20180904/20180904031902.wav', '价格,贵,价位,收费,免费,优惠,便宜,加高,价高,测试,试用,咋收,怎么收,报价,报个价,一个月,多少钱,', 'jiage,gui,jiawei,shoufei,mianfei,youhui,pianyi,jiagao,jiagao,ceshi,shiyong,zashou,zenmeshou,baojia,baogejia,yigeyue,duoshaoqian,', '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1625, 71, '我们公司是沈阳聚盛网络科技有限公司，产品品牌是一呼AI智能机器人，这个产品是我们公司自主研发的，我们公司有国家知识产权的，您可以放心', '/uploads/audio/20180904/20180904031726.wav', '你是谁,公司,名称,做什么,哪里,啥东西,有什么用,做什么的,什么事,搞什么,干啥子,你谁呀,', 'nishishui,gongsi,mingcheng,zuoshimo,nali,shadongxi,youshenmeyong,zuoshimode,shenmeshi,gaoshenme,ganshazi,nishuiya,', '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1620, 71, '好的，那稍后我发一条短信给您，里面有我们公司的地址，您方便的话可以来公司具体了解或者稍后让我们业务经理回电给您，给您详细介绍一下。', '/uploads/audio/20180904/20180904031438.wav', '', NULL, '', NULL, 0, 0, 0, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1621, 71, '那打扰您了，祝您生活愉快，再见！', '/uploads/audio/20180904/20180904124447.wav', '', NULL, '', NULL, 0, 0, 0, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1622, 71, '好的，我们公司地址在沈阳市沈北新区华强城，那稍后我发一条短信给您，里面有我们公司的地址，您方便的话可以来公司具体了解下。', '/uploads/audio/20180904/20180904034021.wav', '', NULL, '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1623, 71, '好的，那稍后让我们公司业务经理回电给您，给您详细讲解。', '/uploads/audio/20180904/20180904034047.wav', '微信,qq,电话,邮箱,加微信', 'weixin,qq,dianhua,youxiang,jiaweixin', '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1624, 71, '好的，那稍后我发一条短信给您，里面有我们公司的地址，您方便的话可以来公司具体了解或者稍后让我们业务经理回电给您，给您详细介绍一下。', '/uploads/audio/20180904/20180904034108.wav', '需要,那好吧,考虑考虑,想买,有这方面想法,有需求,感兴趣', 'xuyao,nahaoba,kaolvkaolv,xiangmai,youzhefangmianxiangfa,youxuqiu,ganxingqu', '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1619, 71, '好的，我们的电话机器人是非常高效的，您可以根据业务需求在后台设定好关键词，机器人可以自动拨打电话与人沟通，回答问题，既增加工作效率又节省人力，是非常适合电销业务的。', '/uploads/audio/20180904/20180904031403.wav', '', NULL, '', NULL, 0, 0, 0, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1617, 71, '喂，您好，（录音停顿1秒）我们是做智能电话机器人的，就是代替人工拨打电话，就像我现在与您沟通的就是机器人拨打的，如果您有电销业务需求我给您简单介绍一下吧', '/uploads/audio/20180904/20180904031325.wav', '', NULL, '', NULL, 0, 0, 0, 0, 0);
INSERT INTO `rk_tel_flow_ok` VALUES (1618, 71, '稍后我把我们招商经理的微信号和手机号发送给您，您可以加他微信和他详聊。', '/uploads/audio/20180904/20180904031335.wav', '', NULL, '', NULL, 0, 0, 0, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1565, 72, '您好，我这边是专业办理银行贷款的，请问你最近有办理银行贷款的考虑吗？', '/uploads/audio/20180609065627.wav', '', NULL, '', NULL, 1, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1566, 72, '是这样子的，我们是平安银行的合作单位，专门解决个人还有中小企业融资难，融资贵的问题的，我这边方便了解一下你的情况吗?', '/uploads/audio/20180609085643.wav', '', NULL, '', NULL, 0, 0, 0, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1567, 72, '这样，我先问一下，您目前是需要多少资金呢？', '/uploads/audio/20180609085722.wav', '', NULL, '', NULL, 0, 0, 0, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1568, 72, '那您是开公司，还是自己上班的。', '/uploads/audio/20180609085853.wav', '', NULL, '', NULL, 0, 0, 0, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1569, 72, '那方便问一下，您自己有房子或者车子吗?', '/uploads/audio/20180609085956.wav', '', NULL, '', NULL, 0, 0, 0, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1570, 72, '好的，那具体到时候再说，我就先不打扰您了，那祝你生活愉快，再见。', '/uploads/audio/20180609090026.wav', '', NULL, '', NULL, 0, 0, 0, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1571, 72, '咱们这边利息低，放款又快，还是很不错的，真的。', '/uploads/audio/20180609090145.wav', '利息,速度', NULL, '', NULL, 1, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1572, 72, '是这样子的，我们公司会根据您的实际情况，为您匹配到低费率而且是较快的贷款产品，当然我们公司也会收取贷款额少量比例的服务费用，具体多少还是根据客户实际情况来定的。', '/uploads/audio/20180609112556.wav', '费用,手续费,收费,免费,收钱,要钱,几个点,中介费', NULL, '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1573, 72, '你可以稍微了解一下嘛，我们这边是和银行正规合作的，下款非常快，而且利息也很低。', '/uploads/audio/20180609114154.wav', '', NULL, '', NULL, 1, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1574, 72, '你看这样子好不好，具体问题，我建议您还是来我们公司详细了解一下，或者等会让我们融资顾问给您打个电话，好吗？', '/uploads/audio/20180609114301.wav', '', NULL, '', NULL, 1, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1575, 72, '呢，您看这样子好了，我这边先给您发个信息过去，你看一下，做个了结，你感兴趣的话，您也可以随时联系我的。', '/uploads/audio/20180609114337.wav', '', NULL, '', NULL, 1, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1576, 72, '哎，好的，那具体到时候再说，我就先不打扰您了，那祝你生活愉快，再见。', '/uploads/audio/20180609114355.wav', '', NULL, '', NULL, 1, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1577, 72, '恩，这个是需要看给你走什么产品的，快的话，咱们可以2,3天下款吗，甚至当天下款都是可以的，具体还是要看您一个资质了', '/uploads/audio/20180609114454.wav', '放款,贷款,拿钱,好快,好久,拿款,多块,多久,快不快', NULL, '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1578, 72, '我们这有月2,3厘的产品，这个就是相当于你一万元一个月2.30元的，具体还是看你那边的情况，恩，你看要么我安排我们公司专业的融资顾问跟您详细沟通一下，让他给您详细匹配一下贷款方案，你看可以吗？', '/uploads/audio/20180609114732.wav', '利息,一起,必须', NULL, '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1579, 72, '我们是专业的第3方融资服务平台，专门解决中小企业，个人融资难的问题的', '/uploads/audio/20180a609114833.wav', '哪里公司,哪里得公司,那个公司,啥子公司,什么公司,单位,中介,代理,做什么,东西', NULL, '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1580, 72, '我们在东门大桥，春熙路这边的，就是在市中心', '/uploads/audio/20180609114920.wav', '地址,地方,位置,彼此,在那里,在哪', NULL, '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1581, 72, '我们在成都这边都做了5年了，已经成功为数十万的贷款客户，解决了他们的融资问题。', '/uploads/audio/20180609115232.wav', '骗子,骗人,乱收费,保障,高利贷,催款,暴利,催收', NULL, '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1582, 72, '恩，是这样子的，我们公司目前，是和跟多家银行和融资机构都在合作的，一般会您那边的具体情况来为你量身定做最佳贷款方案的。', '/uploads/audio/20180609115323.wav', '黑户,工作,黑妇,黑裤,负债,附在', NULL, '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1583, 72, '恩，现在这些都是比较方便的啦。不管您是抵押，还是信用贷款，资料准备都很简单的了', '/uploads/audio/20180609115354.wav', '复杂,麻烦,难搞,难得搞', NULL, '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1584, 72, '哦，我们准备的资料还是蛮简单的，就比如说：身份证，征信报告，还有社保，公积金或者房厂证，这些就可以了，这样吧，我一会还是发一个详细信息到您手机上，您到时看一下好吗?', '/uploads/audio/20180609115428.wav', '资料,材料', NULL, '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1585, 72, '这个的话，还是看你那边是否愿意呀，如果您不想做抵押的话，那这边还是可以帮您操作信用贷款的。', '/uploads/audio/20180609115506.wav', '不做抵押,不低压,不地呀', NULL, '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1586, 72, '哦，这个您放心好了，我们公司是正规贷款平台，利息都是按照国家标准来的，这个您可以来我们公司详细了解一下的。', '/uploads/audio/20180609115554.wav', '乱收费,保障,高利贷,高利贷,催款,暴利,催收', NULL, '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1587, 72, '我们是做抵押，和个人信用贷款的', '/uploads/audio/20180609115623.wav', '都有', NULL, '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1588, 72, '恩，是这样子的，我们公司目前，是和跟多家银行和融资机构都在合作的，一般会您那边的具体情况来为你量身定做最佳贷款方案的。', '/uploads/audio/20180609115647.wav', '银行,机构', NULL, '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1589, 72, '这个您可以放心，您可以来我们公司当面了解一下的呀，眼见为实的嘛，对吧。', '/uploads/audio/20180609115713.wav', '正规,歪的', NULL, '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1590, 72, '恩，这个是这样子的，我们公司会根据您这个具体情况来，为为您匹配到低费率的产品，因为我这边市场部的，那么，具体情况，我安排我们专业的融资顾问来为您解答，如果方案您满意的话，您可以直接找我们办理，如果不满意的话，您就当做一个了解，也是可以的，对吧。', '/uploads/audio/20180609115803.wav', '贷款,流程,抵押,做的,信用,二抵', NULL, '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1591, 72, '我这边王，您叫我小王就可以了，稍后我给您发个信息过去，上面有我的姓名，还是手机号码，您随时联系我都是可以的', '/uploads/audio/20180609115851.wav', '称呼,贵姓,朋友', NULL, '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1592, 72, '不好意思，您说', '/uploads/audio/20180609115935.wav', '听我讲,不要说,喂喂,等等', NULL, '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1593, 72, '这个贷多少的话，还是要根据您个人情况来定的哈，每个人的情况都不同的。', '/uploads/audio/20180609115958.wav', '贷多少', NULL, '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1594, 72, '是的，我们也有很多网贷渠道，我这边安排贷款顾问给你回个电话具体讲解下，这样更方便您了解，您看好么？', '/uploads/audio/20180610120030.wav', '网上,网贷,放款,APP,app,线上', NULL, '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1595, 72, '这样子吧，我先安排贷款顾问给您详细介绍下，看您的条件满足不。你再做决定。', '/uploads/audio/20180610120059.wav', '远了,眉山,郫县,新都,龙泉,华阳,有点远,好远', NULL, '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1596, 72, '要看您征信不好到什么程度，您看要么安排我们公司专业的融资顾问跟您详细沟通一下，然后给您匹配最好的贷款方案，您看可以吗', '/uploads/audio/20180610120126.wav', '逾期,征信,真信,黑名单,真心,真性,真行,[真,问题]', NULL, '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1597, 72, '这样子吧，我先安排贷款顾问给您详细介绍下，看您的条件满足不。你再做决定。', '/uploads/audio/20180610120154.wav', '远了,眉山,郫县,新都,龙泉,华阳,有点远,好远', NULL, '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1598, 72, '要看您征信不好到什么程度，您看要么安排我们公司专业的融资顾问跟您详细沟通一下，然后给您匹配最好的贷款方案，您看可以吗', '/uploads/audio/20180610120230.wav', '逾期,征信,真信,黑名单,真心,真性,真行,[真,问题]', NULL, '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1599, 72, '我们有匹配不同年纪的银行产品，我能了解以下您的具体情况么？', '/uploads/audio/20180610120309.wav', '退休,老年人,年纪大,六七十岁,七八十岁', NULL, '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1600, 72, '哦，是这样子的，我们有多种融资产品，我这边需要了解一下你的具体情况，看下怎么给您操作是最合适的。', '/uploads/audio/20180610120423.wav', '信用,保单,保险,社保,车,营业,执照,发票,飞机票,资质', NULL, '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1601, 72, '这个我们都是电脑随机拨号的', '/uploads/audio/20180610120454.wav', '找到我,我的号码', NULL, '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1602, 72, '怎么会呢，肯定是人工给你打的电话，我姓王，你可以叫我小王', '/uploads/audio/20180610120527.wav', '机器', NULL, '', NULL, 2, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1603, 72, '哎,什么', '/uploads/audio/20180610120614.wav', '', NULL, '', NULL, 3, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1604, 72, '哎,喂', '/uploads/audio/20180610120635.wav', '', NULL, '', NULL, 3, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1605, 72, '不好意思，我这边听得不是很清楚，您能说得慢一点点嘛？', '/uploads/audio/20180610120653.wav', '', NULL, '', NULL, 3, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1606, 72, '稍后等一下，我这边信号不太好，您刚才说什么呀。', '/uploads/audio/20180610120711.wav', '', NULL, '', NULL, 3, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1607, 72, '那等您方便的时候我们再联系，祝您生活愉快，再见！', '/uploads/audio/20180610120802.wav', '没空,没有空,没有工夫,没工夫,比较忙,很忙,开会,开车,在忙,睡觉,吃东西,吃饭,不方便,有事,有点忙,有些忙,没时间,没有时间,再联系,打给我', NULL, '', NULL, 4, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1608, 72, '那我这边先发个短信给你嘛。您先看下，做个了解，然后等您那边方便的时候，我们可以再联系的，好嘛。', '/uploads/audio/20180610120904.wav', '在外地,出差,[短信,给我],[信息,给我],[地址,给我],[忙,短信]', NULL, '', NULL, 4, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1609, 72, '那没关系，等您需要的时候再联系，祝您生活愉快，再见。', '/uploads/audio/20180610120943.wav', '不需要,不用,不要,不想了解,不考虑,不要再打,没打算,不打算,不想,不感兴趣,打错,没需求,没需要,莫迪,莫的,同行,不累,没有,么有,没的,已贷,已经贷,不贷', NULL, '', NULL, 5, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1610, 72, '哎，好的，那具体到时候再说，我就先不打扰您了，那祝你生活愉快，再见。', '/uploads/audio/20180610121026.wav', '产品', NULL, '', NULL, 6, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1611, 72, '喂，在吗', '/uploads/audio/20180610121058.wav', '', NULL, '', NULL, 7, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1612, 72, '喂，在听吗', '/uploads/audio/20180610121115.wav', '', NULL, '', NULL, 7, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1613, 72, '实在不好意思，我这边还是没有听到你的声音，要不我先挂了，好了，咱们回头再联系，再见', '/uploads/audio/20180610121136.wav', '', NULL, '', NULL, 7, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1614, 72, '不好意思啊,抱歉，我这边是市场部啦，有一些专业的问题不能给你很好的解答，您看要么安排我们专业的融资顾问跟您联系一下，让他给您做一下详细沟通，好吗?你看。', '/uploads/audio/20180610121214.wav', '', NULL, '', NULL, 8, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1615, 72, '不好意思，抱歉呀，我这边也是刚才不久的，有一些不是很熟，您看要不这样子，等会还是让我们的信贷顾问给您打个电话，根您那边详细介绍一下，您看可以吗？', '/uploads/audio/20180610121239.wav', '', NULL, '', NULL, 8, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1616, 72, '我觉得这些问题，您真的还是得到我们公司来，让我们融资顾问给您解答会更好一点。', '/uploads/audio/20180610121302.wav', '', NULL, '', NULL, 8, 0, 1, 0, 1);
INSERT INTO `rk_tel_flow_ok` VALUES (1658, 71, '我们公司是2013年成立的，是正规公司，您要是有什么疑惑不放心的，您可以先来公司具体了解一下再做决定啊', '/uploads/audio/20180904/20180904032100.wav', '骗子,假的,忽悠人,诈骗电话,个人,靠谱,正规公司,成立时间,骗人,真的,可信,注册时间', 'pianzi,jiade,huyouren,zhapiandianhua,geren,kaopu,zhengguigongsi,chenglishijian,pianren,zhende,kexin,zhuceshijian', '', NULL, 2, 0, 1, 0, 1);

-- ----------------------------
-- Table structure for rk_tel_interface
-- ----------------------------
DROP TABLE IF EXISTS `rk_tel_interface`;
CREATE TABLE `rk_tel_interface`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `app_key` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `app_secret` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'baidu 百度 xfyun 科大讯飞  aliyun  阿里云',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 启用 1禁用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '接口配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rk_tel_keyword
-- ----------------------------
DROP TABLE IF EXISTS `rk_tel_keyword`;
CREATE TABLE `rk_tel_keyword`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `scenarios_id` int(11) NOT NULL,
  `priority` int(5) NOT NULL COMMENT '优先级',
  `type` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '关键字类型',
  `keyword` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '关键字',
  `pinyin` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '关键字拼音',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 240 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of rk_tel_keyword
-- ----------------------------
INSERT INTO `rk_tel_keyword` VALUES (3, 11, 0, '1', '什么,谁,多少,好多,啥子,多久,有啥,怎么,几个,哪里,那里,哪些,那些,咋个,扎个,啷个,好低嘛,好快吗', 'shenme,shui,duoshao,haoduo,shazi,duojiu,yousha,zenme,jige,nali,nali,neixie,neixie,zage,zhage,langge,haodima,haokuaima');
INSERT INTO `rk_tel_keyword` VALUES (4, 11, 0, '2', '你好,您好,会的,好吧,好的,妥妥,对的,当然,感兴趣,方便,明白,是啊,是的,晓得,有一点,有兴趣,有啊,有的,有空,没有问题,没问题,清楚,满意,你说,有听,能听到,行吧,好了,哟啊,阿吆,要啊,继续,需要', 'nihao,ninhao,huide,haoba,haode,tuotuo,duide,dangran,ganxingqu,fangbian,mingbai,shia,shide,xiaode,youyidian,youxingqu,youa,youde,youkong,meiyouwenti,meiwenti,qingchu,manyi,nishuo,youting,nengtingdao,xingba,haole,yoa,ayao,yaoa,jixu,xuyao');
INSERT INTO `rk_tel_keyword` VALUES (5, 11, 0, '4', 'ok,不错,了解,做过,可以,听说过,听过,够了,够的,挺好,熟悉,知道,给力,继续,认可,嗯,差不多,讲,说,还不错,还好,具体点,哦,啊,哈', 'ok,bucuo,liaojie,zuoguo,keyi,tingshuoguo,tingguo,goule,goude,tinghao,shuxi,zhidao,geili,jixu,renke,,chabuduo,jiang,shuo,haibucuo,haihao,jutidian,o,a,ha');
INSERT INTO `rk_tel_keyword` VALUES (6, 11, 0, '5', '没听到,说什么,重说,再说一下,再说一次,再说一遍,没听见,很吵,听不清,听不到,什么啊,没听清,听不清楚', 'meitingdao,shuoshimo,zhongshuo,zaishuoyixia,zaishuoyici,zaishuoyibian,meitingjian,henchao,tingbuqing,tingbudao,shenmea,meitingqing,tingbuqingchu');
INSERT INTO `rk_tel_keyword` VALUES (7, 15, 0, '1', '什么,谁,多少,好多,啥子,多久,有啥,怎么,几个,哪里,那里,哪些,那些,咋个,扎个,啷个,好低嘛,好快吗', 'shenme,shui,duoshao,haoduo,shazi,duojiu,yousha,zenme,jige,nali,nali,neixie,neixie,zage,zhage,langge,haodima,haokuaima');
INSERT INTO `rk_tel_keyword` VALUES (8, 15, 0, '2', '你好,您好,会的,好吧,好的,妥妥,对的,当然,感兴趣,方便,明白,是啊,是的,晓得,有一点,有兴趣,有啊,有的,有空,没有问题,没问题,清楚,满意,你说,有听,能听到,行吧,好了,哟啊,阿吆,要啊,继续,需要', 'nihao,ninhao,huide,haoba,haode,tuotuo,duide,dangran,ganxingqu,fangbian,mingbai,shia,shide,xiaode,youyidian,youxingqu,youa,youde,youkong,meiyouwenti,meiwenti,qingchu,manyi,nishuo,youting,nengtingdao,xingba,haole,yoa,ayao,yaoa,jixu,xuyao');
INSERT INTO `rk_tel_keyword` VALUES (9, 15, 0, '4', 'ok,不错,了解,做过,可以,听说过,听过,够了,够的,挺好,熟悉,知道,给力,继续,认可,嗯,差不多,讲,说,还不错,还好,具体点,哦,啊,哈', 'ok,bucuo,liaojie,zuoguo,keyi,tingshuoguo,tingguo,goule,goude,tinghao,shuxi,zhidao,geili,jixu,renke,,chabuduo,jiang,shuo,haibucuo,haihao,jutidian,o,a,ha');
INSERT INTO `rk_tel_keyword` VALUES (10, 15, 0, '5', '没听到,说什么,重说,再说一下,再说一次,再说一遍,没听见,很吵,听不清,听不到,什么啊,没听清,听不清楚', 'meitingdao,shuoshimo,zhongshuo,zaishuoyixia,zaishuoyici,zaishuoyibian,meitingjian,henchao,tingbuqing,tingbudao,shenmea,meitingqing,tingbuqingchu');
INSERT INTO `rk_tel_keyword` VALUES (11, 16, 0, '1', '什么,谁,多少,好多,啥子,多久,有啥,怎么,几个,哪里,那里,哪些,那些,咋个,扎个,啷个,好低嘛,好快吗', 'shenme,shui,duoshao,haoduo,shazi,duojiu,yousha,zenme,jige,nali,nali,neixie,neixie,zage,zhage,langge,haodima,haokuaima');
INSERT INTO `rk_tel_keyword` VALUES (12, 16, 0, '2', '你好,您好,会的,好吧,好的,妥妥,对的,当然,感兴趣,方便,明白,是啊,是的,晓得,有一点,有兴趣,有啊,有的,有空,没有问题,没问题,清楚,满意,你说,有听,能听到,行吧,好了,哟啊,阿吆,要啊,继续,需要', 'nihao,ninhao,huide,haoba,haode,tuotuo,duide,dangran,ganxingqu,fangbian,mingbai,shia,shide,xiaode,youyidian,youxingqu,youa,youde,youkong,meiyouwenti,meiwenti,qingchu,manyi,nishuo,youting,nengtingdao,xingba,haole,yoa,ayao,yaoa,jixu,xuyao');
INSERT INTO `rk_tel_keyword` VALUES (13, 16, 0, '4', 'ok,不错,了解,做过,可以,听说过,听过,够了,够的,挺好,熟悉,知道,给力,继续,认可,嗯,差不多,讲,说,还不错,还好,具体点,哦,啊,哈', 'ok,bucuo,liaojie,zuoguo,keyi,tingshuoguo,tingguo,goule,goude,tinghao,shuxi,zhidao,geili,jixu,renke,,chabuduo,jiang,shuo,haibucuo,haihao,jutidian,o,a,ha');
INSERT INTO `rk_tel_keyword` VALUES (14, 16, 0, '5', '没听到,说什么,重说,再说一下,再说一次,再说一遍,没听见,很吵,听不清,听不到,什么啊,没听清,听不清楚', 'meitingdao,shuoshimo,zhongshuo,zaishuoyixia,zaishuoyici,zaishuoyibian,meitingjian,henchao,tingbuqing,tingbudao,shenmea,meitingqing,tingbuqingchu');
INSERT INTO `rk_tel_keyword` VALUES (15, 17, 0, '1', '什么,谁,多少,好多,啥子,多久,有啥,怎么,几个,哪里,那里,哪些,那些,咋个,扎个,啷个,好低嘛,好快吗', 'shenme,shui,duoshao,haoduo,shazi,duojiu,yousha,zenme,jige,nali,nali,neixie,neixie,zage,zhage,langge,haodima,haokuaima');
INSERT INTO `rk_tel_keyword` VALUES (16, 17, 0, '2', '你好,您好,会的,好吧,好的,妥妥,对的,当然,感兴趣,方便,明白,是啊,是的,晓得,有一点,有兴趣,有啊,有的,有空,没有问题,没问题,清楚,满意,你说,有听,能听到,行吧,好了,哟啊,阿吆,要啊,继续,需要', 'nihao,ninhao,huide,haoba,haode,tuotuo,duide,dangran,ganxingqu,fangbian,mingbai,shia,shide,xiaode,youyidian,youxingqu,youa,youde,youkong,meiyouwenti,meiwenti,qingchu,manyi,nishuo,youting,nengtingdao,xingba,haole,yoa,ayao,yaoa,jixu,xuyao');
INSERT INTO `rk_tel_keyword` VALUES (17, 17, 0, '4', 'ok,不错,了解,做过,可以,听说过,听过,够了,够的,挺好,熟悉,知道,给力,继续,认可,嗯,差不多,讲,说,还不错,还好,具体点,哦,啊,哈', 'ok,bucuo,liaojie,zuoguo,keyi,tingshuoguo,tingguo,goule,goude,tinghao,shuxi,zhidao,geili,jixu,renke,,chabuduo,jiang,shuo,haibucuo,haihao,jutidian,o,a,ha');
INSERT INTO `rk_tel_keyword` VALUES (18, 17, 0, '5', '没听到,说什么,重说,再说一下,再说一次,再说一遍,没听见,很吵,听不清,听不到,什么啊,没听清,听不清楚', 'meitingdao,shuoshimo,zhongshuo,zaishuoyixia,zaishuoyici,zaishuoyibian,meitingjian,henchao,tingbuqing,tingbudao,shenmea,meitingqing,tingbuqingchu');
INSERT INTO `rk_tel_keyword` VALUES (19, 18, 0, '1', '什么,谁,多少,好多,啥子,多久,有啥,怎么,几个,哪里,那里,哪些,那些,咋个,扎个,啷个,好低嘛,好快吗', 'shenme,shui,duoshao,haoduo,shazi,duojiu,yousha,zenme,jige,nali,nali,neixie,neixie,zage,zhage,langge,haodima,haokuaima');
INSERT INTO `rk_tel_keyword` VALUES (20, 18, 0, '2', '你好,您好,会的,好吧,好的,妥妥,对的,当然,感兴趣,方便,明白,是啊,是的,晓得,有一点,有兴趣,有啊,有的,有空,没有问题,没问题,清楚,满意,你说,有听,能听到,行吧,好了,哟啊,阿吆,要啊,继续,需要', 'nihao,ninhao,huide,haoba,haode,tuotuo,duide,dangran,ganxingqu,fangbian,mingbai,shia,shide,xiaode,youyidian,youxingqu,youa,youde,youkong,meiyouwenti,meiwenti,qingchu,manyi,nishuo,youting,nengtingdao,xingba,haole,yoa,ayao,yaoa,jixu,xuyao');
INSERT INTO `rk_tel_keyword` VALUES (21, 18, 0, '4', 'ok,不错,了解,做过,可以,听说过,听过,够了,够的,挺好,熟悉,知道,给力,继续,认可,嗯,差不多,讲,说,还不错,还好,具体点,哦,啊,哈', 'ok,bucuo,liaojie,zuoguo,keyi,tingshuoguo,tingguo,goule,goude,tinghao,shuxi,zhidao,geili,jixu,renke,,chabuduo,jiang,shuo,haibucuo,haihao,jutidian,o,a,ha');
INSERT INTO `rk_tel_keyword` VALUES (22, 18, 0, '5', '没听到,说什么,重说,再说一下,再说一次,再说一遍,没听见,很吵,听不清,听不到,什么啊,没听清,听不清楚', 'meitingdao,shuoshimo,zhongshuo,zaishuoyixia,zaishuoyici,zaishuoyibian,meitingjian,henchao,tingbuqing,tingbudao,shenmea,meitingqing,tingbuqingchu');
INSERT INTO `rk_tel_keyword` VALUES (23, 19, 0, '1', '什么,谁,多少,好多,啥子,多久,有啥,怎么,几个,哪里,那里,哪些,那些,咋个,扎个,啷个,好低嘛,好快吗', 'shenme,shui,duoshao,haoduo,shazi,duojiu,yousha,zenme,jige,nali,nali,neixie,neixie,zage,zhage,langge,haodima,haokuaima');
INSERT INTO `rk_tel_keyword` VALUES (24, 19, 0, '2', '你好,您好,会的,好吧,好的,妥妥,对的,当然,感兴趣,方便,明白,是啊,是的,晓得,有一点,有兴趣,有啊,有的,有空,没有问题,没问题,清楚,满意,你说,有听,能听到,行吧,好了,哟啊,阿吆,要啊,继续,需要', 'nihao,ninhao,huide,haoba,haode,tuotuo,duide,dangran,ganxingqu,fangbian,mingbai,shia,shide,xiaode,youyidian,youxingqu,youa,youde,youkong,meiyouwenti,meiwenti,qingchu,manyi,nishuo,youting,nengtingdao,xingba,haole,yoa,ayao,yaoa,jixu,xuyao');
INSERT INTO `rk_tel_keyword` VALUES (25, 19, 0, '4', 'ok,不错,了解,做过,可以,听说过,听过,够了,够的,挺好,熟悉,知道,给力,继续,认可,嗯,差不多,讲,说,还不错,还好,具体点,哦,啊,哈', 'ok,bucuo,liaojie,zuoguo,keyi,tingshuoguo,tingguo,goule,goude,tinghao,shuxi,zhidao,geili,jixu,renke,,chabuduo,jiang,shuo,haibucuo,haihao,jutidian,o,a,ha');
INSERT INTO `rk_tel_keyword` VALUES (26, 19, 0, '5', '没听到,说什么,重说,再说一下,再说一次,再说一遍,没听见,很吵,听不清,听不到,什么啊,没听清,听不清楚', 'meitingdao,shuoshimo,zhongshuo,zaishuoyixia,zaishuoyici,zaishuoyibian,meitingjian,henchao,tingbuqing,tingbudao,shenmea,meitingqing,tingbuqingchu');
INSERT INTO `rk_tel_keyword` VALUES (27, 20, 0, '1', '什么,谁,多少,好多,啥子,多久,有啥,怎么,几个,哪里,那里,哪些,那些,咋个,扎个,啷个,好低嘛,好快吗,是吗', 'shenme,shui,duoshao,haoduo,shazi,duojiu,yousha,zenme,jige,nali,nali,neixie,neixie,zage,zhage,langge,haodima,haokuaima');
INSERT INTO `rk_tel_keyword` VALUES (28, 20, 0, '2', '你好,您好,会的,好吧,好的,妥妥,对的,当然,感兴趣,方便,明白,是啊,是的,晓得,有一点,有兴趣,有啊,有的,有空,没有问题,没问题,清楚,满意,你说,有听,能听到,行吧,好了,哟啊,阿吆,要啊,继续,需要', 'nihao,ninhao,huide,haoba,haode,tuotuo,duide,dangran,ganxingqu,fangbian,mingbai,shia,shide,xiaode,youyidian,youxingqu,youa,youde,youkong,meiyouwenti,meiwenti,qingchu,manyi,nishuo,youting,nengtingdao,xingba,haole,yoa,ayao,yaoa,jixu,xuyao');
INSERT INTO `rk_tel_keyword` VALUES (29, 20, 0, '4', 'ok,不错,了解,做过,可以,听说过,听过,够了,够的,挺好,熟悉,知道,给力,继续,认可,嗯,差不多,讲,说,还不错,还好,具体点,哦,啊,哈', 'ok,bucuo,liaojie,zuoguo,keyi,tingshuoguo,tingguo,goule,goude,tinghao,shuxi,zhidao,geili,jixu,renke,,chabuduo,jiang,shuo,haibucuo,haihao,jutidian,o,a,ha');
INSERT INTO `rk_tel_keyword` VALUES (30, 20, 0, '5', '没听到,说什么,重说,再说一下,再说一次,再说一遍,没听见,很吵,听不清,听不到,什么啊,没听清,听不清楚', 'meitingdao,shuoshimo,zhongshuo,zaishuoyixia,zaishuoyici,zaishuoyibian,meitingjian,henchao,tingbuqing,tingbudao,shenmea,meitingqing,tingbuqingchu');
INSERT INTO `rk_tel_keyword` VALUES (31, 21, 0, '1', '什么,谁,多少,好多,啥子,多久,有啥,怎么,几个,哪里,那里,哪些,那些,咋个,扎个,啷个,好低嘛,好快吗', 'shenme,shui,duoshao,haoduo,shazi,duojiu,yousha,zenme,jige,nali,nali,neixie,neixie,zage,zhage,langge,haodima,haokuaima');
INSERT INTO `rk_tel_keyword` VALUES (32, 21, 0, '2', '你好,您好,会的,好吧,好的,妥妥,对的,当然,感兴趣,方便,明白,是啊,是的,晓得,有一点,有兴趣,有啊,有的,有空,没有问题,没问题,清楚,满意,你说,有听,能听到,行吧,好了,哟啊,阿吆,要啊,继续,需要', 'nihao,ninhao,huide,haoba,haode,tuotuo,duide,dangran,ganxingqu,fangbian,mingbai,shia,shide,xiaode,youyidian,youxingqu,youa,youde,youkong,meiyouwenti,meiwenti,qingchu,manyi,nishuo,youting,nengtingdao,xingba,haole,yoa,ayao,yaoa,jixu,xuyao');
INSERT INTO `rk_tel_keyword` VALUES (33, 21, 0, '4', 'ok,不错,了解,做过,可以,听说过,听过,够了,够的,挺好,熟悉,知道,给力,继续,认可,嗯,差不多,讲,说,还不错,还好,具体点,哦,啊,哈', 'ok,bucuo,liaojie,zuoguo,keyi,tingshuoguo,tingguo,goule,goude,tinghao,shuxi,zhidao,geili,jixu,renke,,chabuduo,jiang,shuo,haibucuo,haihao,jutidian,o,a,ha');
INSERT INTO `rk_tel_keyword` VALUES (34, 21, 0, '5', '没听到,说什么,重说,再说一下,再说一次,再说一遍,没听见,很吵,听不清,听不到,什么啊,没听清,听不清楚', 'meitingdao,shuoshimo,zhongshuo,zaishuoyixia,zaishuoyici,zaishuoyibian,meitingjian,henchao,tingbuqing,tingbudao,shenmea,meitingqing,tingbuqingchu');
INSERT INTO `rk_tel_keyword` VALUES (35, 22, 0, '1', '什么,谁,多少,好多,啥子,多久,有啥,怎么,几个,哪里,那里,哪些,那些,咋个,扎个,啷个,好低嘛,好快吗', 'shenme,shui,duoshao,haoduo,shazi,duojiu,yousha,zenme,jige,nali,nali,neixie,neixie,zage,zhage,langge,haodima,haokuaima');
INSERT INTO `rk_tel_keyword` VALUES (36, 22, 0, '2', '你好,您好,会的,好吧,好的,妥妥,对的,当然,感兴趣,方便,明白,是啊,是的,晓得,有一点,有兴趣,有啊,有的,有空,没有问题,没问题,清楚,满意,你说,有听,能听到,行吧,好了,哟啊,阿吆,要啊,继续,需要', 'nihao,ninhao,huide,haoba,haode,tuotuo,duide,dangran,ganxingqu,fangbian,mingbai,shia,shide,xiaode,youyidian,youxingqu,youa,youde,youkong,meiyouwenti,meiwenti,qingchu,manyi,nishuo,youting,nengtingdao,xingba,haole,yoa,ayao,yaoa,jixu,xuyao');
INSERT INTO `rk_tel_keyword` VALUES (37, 22, 0, '4', 'ok,不错,了解,做过,可以,听说过,听过,够了,够的,挺好,熟悉,知道,给力,继续,认可,嗯,差不多,讲,说,还不错,还好,具体点,哦,啊,哈', 'ok,bucuo,liaojie,zuoguo,keyi,tingshuoguo,tingguo,goule,goude,tinghao,shuxi,zhidao,geili,jixu,renke,,chabuduo,jiang,shuo,haibucuo,haihao,jutidian,o,a,ha');
INSERT INTO `rk_tel_keyword` VALUES (38, 22, 0, '5', '没听到,说什么,重说,再说一下,再说一次,再说一遍,没听见,很吵,听不清,听不到,什么啊,没听清,听不清楚', 'meitingdao,shuoshimo,zhongshuo,zaishuoyixia,zaishuoyici,zaishuoyibian,meitingjian,henchao,tingbuqing,tingbudao,shenmea,meitingqing,tingbuqingchu');
INSERT INTO `rk_tel_keyword` VALUES (39, 23, 0, '1', '什么,谁,多少,好多,啥子,多久,有啥,怎么,几个,哪里,那里,哪些,那些,咋个,扎个,啷个,好低嘛,好快吗', 'shenme,shui,duoshao,haoduo,shazi,duojiu,yousha,zenme,jige,nali,nali,neixie,neixie,zage,zhage,langge,haodima,haokuaima');
INSERT INTO `rk_tel_keyword` VALUES (40, 23, 0, '2', '你好,您好,会的,好吧,好的,妥妥,对的,当然,感兴趣,方便,明白,是啊,是的,晓得,有一点,有兴趣,有啊,有的,有空,没有问题,没问题,清楚,满意,你说,有听,能听到,行吧,好了,哟啊,阿吆,要啊,继续,需要', 'nihao,ninhao,huide,haoba,haode,tuotuo,duide,dangran,ganxingqu,fangbian,mingbai,shia,shide,xiaode,youyidian,youxingqu,youa,youde,youkong,meiyouwenti,meiwenti,qingchu,manyi,nishuo,youting,nengtingdao,xingba,haole,yoa,ayao,yaoa,jixu,xuyao');
INSERT INTO `rk_tel_keyword` VALUES (41, 23, 0, '4', 'ok,不错,了解,做过,可以,听说过,听过,够了,够的,挺好,熟悉,知道,给力,继续,认可,嗯,差不多,讲,说,还不错,还好,具体点,哦,啊,哈', 'ok,bucuo,liaojie,zuoguo,keyi,tingshuoguo,tingguo,goule,goude,tinghao,shuxi,zhidao,geili,jixu,renke,,chabuduo,jiang,shuo,haibucuo,haihao,jutidian,o,a,ha');
INSERT INTO `rk_tel_keyword` VALUES (42, 23, 0, '5', '没听到,说什么,重说,再说一下,再说一次,再说一遍,没听见,很吵,听不清,听不到,什么啊,没听清,听不清楚', 'meitingdao,shuoshimo,zhongshuo,zaishuoyixia,zaishuoyici,zaishuoyibian,meitingjian,henchao,tingbuqing,tingbudao,shenmea,meitingqing,tingbuqingchu');
INSERT INTO `rk_tel_keyword` VALUES (43, 24, 0, '1', '什么,谁,多少,好多,啥子,多久,有啥,怎么,几个,哪里,那里,哪些,那些,咋个,扎个,啷个,好低嘛,好快吗', 'shenme,shui,duoshao,haoduo,shazi,duojiu,yousha,zenme,jige,nali,nali,neixie,neixie,zage,zhage,langge,haodima,haokuaima');
INSERT INTO `rk_tel_keyword` VALUES (44, 24, 0, '2', '你好,您好,会的,好吧,好的,妥妥,对的,当然,感兴趣,方便,明白,是啊,是的,晓得,有一点,有兴趣,有啊,有的,有空,没有问题,没问题,清楚,满意,你说,有听,能听到,行吧,好了,哟啊,阿吆,要啊,继续,需要', 'nihao,ninhao,huide,haoba,haode,tuotuo,duide,dangran,ganxingqu,fangbian,mingbai,shia,shide,xiaode,youyidian,youxingqu,youa,youde,youkong,meiyouwenti,meiwenti,qingchu,manyi,nishuo,youting,nengtingdao,xingba,haole,yoa,ayao,yaoa,jixu,xuyao');
INSERT INTO `rk_tel_keyword` VALUES (45, 24, 0, '4', 'ok,不错,了解,做过,可以,听说过,听过,够了,够的,挺好,熟悉,知道,给力,继续,认可,嗯,差不多,讲,说,还不错,还好,具体点,哦,啊,哈', 'ok,bucuo,liaojie,zuoguo,keyi,tingshuoguo,tingguo,goule,goude,tinghao,shuxi,zhidao,geili,jixu,renke,,chabuduo,jiang,shuo,haibucuo,haihao,jutidian,o,a,ha');
INSERT INTO `rk_tel_keyword` VALUES (46, 24, 0, '5', '没听到,说什么,重说,再说一下,再说一次,再说一遍,没听见,很吵,听不清,听不到,什么啊,没听清,听不清楚', 'meitingdao,shuoshimo,zhongshuo,zaishuoyixia,zaishuoyici,zaishuoyibian,meitingjian,henchao,tingbuqing,tingbudao,shenmea,meitingqing,tingbuqingchu');
INSERT INTO `rk_tel_keyword` VALUES (47, 25, 0, '1', '什么,谁,多少,好多,啥子,多久,有啥,怎么,几个,哪里,那里,哪些,那些,咋个,扎个,啷个,好低嘛,好快吗', 'shenme,shui,duoshao,haoduo,shazi,duojiu,yousha,zenme,jige,nali,nali,neixie,neixie,zage,zhage,langge,haodima,haokuaima');
INSERT INTO `rk_tel_keyword` VALUES (48, 25, 0, '2', '你好,您好,会的,好吧,好的,妥妥,对的,当然,感兴趣,方便,明白,是啊,是的,晓得,有一点,有兴趣,有啊,有的,有空,没有问题,没问题,清楚,满意,你说,有听,能听到,行吧,好了,哟啊,阿吆,要啊,继续,需要', 'nihao,ninhao,huide,haoba,haode,tuotuo,duide,dangran,ganxingqu,fangbian,mingbai,shia,shide,xiaode,youyidian,youxingqu,youa,youde,youkong,meiyouwenti,meiwenti,qingchu,manyi,nishuo,youting,nengtingdao,xingba,haole,yoa,ayao,yaoa,jixu,xuyao');
INSERT INTO `rk_tel_keyword` VALUES (49, 25, 0, '4', 'ok,不错,了解,做过,可以,听说过,听过,够了,够的,挺好,熟悉,知道,给力,继续,认可,嗯,差不多,讲,说,还不错,还好,具体点,哦,啊,哈', 'ok,bucuo,liaojie,zuoguo,keyi,tingshuoguo,tingguo,goule,goude,tinghao,shuxi,zhidao,geili,jixu,renke,,chabuduo,jiang,shuo,haibucuo,haihao,jutidian,o,a,ha');
INSERT INTO `rk_tel_keyword` VALUES (50, 25, 0, '5', '没听到,说什么,重说,再说一下,再说一次,再说一遍,没听见,很吵,听不清,听不到,什么啊,没听清,听不清楚', 'meitingdao,shuoshimo,zhongshuo,zaishuoyixia,zaishuoyici,zaishuoyibian,meitingjian,henchao,tingbuqing,tingbudao,shenmea,meitingqing,tingbuqingchu');
INSERT INTO `rk_tel_keyword` VALUES (51, 26, 0, '1', '什么,谁,多少,好多,啥子,多久,有啥,怎么,几个,哪里,那里,哪些,那些,咋个,扎个,啷个,好低嘛,好快吗', 'shenme,shui,duoshao,haoduo,shazi,duojiu,yousha,zenme,jige,nali,nali,neixie,neixie,zage,zhage,langge,haodima,haokuaima');
INSERT INTO `rk_tel_keyword` VALUES (52, 26, 0, '2', '你好,您好,会的,好吧,好的,妥妥,对的,当然,感兴趣,方便,明白,是啊,是的,晓得,有一点,有兴趣,有啊,有的,有空,没有问题,没问题,清楚,满意,你说,有听,能听到,行吧,好了,哟啊,阿吆,要啊,继续,需要', 'nihao,ninhao,huide,haoba,haode,tuotuo,duide,dangran,ganxingqu,fangbian,mingbai,shia,shide,xiaode,youyidian,youxingqu,youa,youde,youkong,meiyouwenti,meiwenti,qingchu,manyi,nishuo,youting,nengtingdao,xingba,haole,yoa,ayao,yaoa,jixu,xuyao');
INSERT INTO `rk_tel_keyword` VALUES (53, 26, 0, '4', 'ok,不错,了解,做过,可以,听说过,听过,够了,够的,挺好,熟悉,知道,给力,继续,认可,嗯,差不多,讲,说,还不错,还好,具体点,哦,啊,哈', 'ok,bucuo,liaojie,zuoguo,keyi,tingshuoguo,tingguo,goule,goude,tinghao,shuxi,zhidao,geili,jixu,renke,,chabuduo,jiang,shuo,haibucuo,haihao,jutidian,o,a,ha');
INSERT INTO `rk_tel_keyword` VALUES (54, 26, 0, '5', '没听到,说什么,重说,再说一下,再说一次,再说一遍,没听见,很吵,听不清,听不到,什么啊,没听清,听不清楚', 'meitingdao,shuoshimo,zhongshuo,zaishuoyixia,zaishuoyici,zaishuoyibian,meitingjian,henchao,tingbuqing,tingbudao,shenmea,meitingqing,tingbuqingchu');
INSERT INTO `rk_tel_keyword` VALUES (55, 27, 0, '1', '什么,谁,多少,好多,啥子,多久,有啥,怎么,几个,哪里,那里,哪些,那些,咋个,扎个,啷个,好低嘛,好快吗', 'shenme,shui,duoshao,haoduo,shazi,duojiu,yousha,zenme,jige,nali,nali,neixie,neixie,zage,zhage,langge,haodima,haokuaima');
INSERT INTO `rk_tel_keyword` VALUES (56, 27, 0, '2', '你好,您好,会的,好吧,好的,妥妥,对的,当然,感兴趣,方便,明白,是啊,是的,晓得,有一点,有兴趣,有啊,有的,有空,没有问题,没问题,清楚,满意,你说,有听,能听到,行吧,好了,哟啊,阿吆,要啊,继续,需要', 'nihao,ninhao,huide,haoba,haode,tuotuo,duide,dangran,ganxingqu,fangbian,mingbai,shia,shide,xiaode,youyidian,youxingqu,youa,youde,youkong,meiyouwenti,meiwenti,qingchu,manyi,nishuo,youting,nengtingdao,xingba,haole,yoa,ayao,yaoa,jixu,xuyao');
INSERT INTO `rk_tel_keyword` VALUES (57, 27, 0, '4', 'ok,不错,了解,做过,可以,听说过,听过,够了,够的,挺好,熟悉,知道,给力,继续,认可,嗯,差不多,讲,说,还不错,还好,具体点,哦,啊,哈', 'ok,bucuo,liaojie,zuoguo,keyi,tingshuoguo,tingguo,goule,goude,tinghao,shuxi,zhidao,geili,jixu,renke,,chabuduo,jiang,shuo,haibucuo,haihao,jutidian,o,a,ha');
INSERT INTO `rk_tel_keyword` VALUES (58, 27, 0, '5', '没听到,说什么,重说,再说一下,再说一次,再说一遍,没听见,很吵,听不清,听不到,什么啊,没听清,听不清楚', 'meitingdao,shuoshimo,zhongshuo,zaishuoyixia,zaishuoyici,zaishuoyibian,meitingjian,henchao,tingbuqing,tingbudao,shenmea,meitingqing,tingbuqingchu');
INSERT INTO `rk_tel_keyword` VALUES (59, 28, 0, '1', '什么,谁,多少,好多,啥子,多久,有啥,怎么,几个,哪里,那里,哪些,那些,咋个,扎个,啷个,好低嘛,好快吗', 'shenme,shui,duoshao,haoduo,shazi,duojiu,yousha,zenme,jige,nali,nali,neixie,neixie,zage,zhage,langge,haodima,haokuaima');
INSERT INTO `rk_tel_keyword` VALUES (60, 28, 0, '2', '你好,您好,会的,好吧,好的,妥妥,对的,当然,感兴趣,方便,明白,是啊,是的,晓得,有一点,有兴趣,有啊,有的,有空,没有问题,没问题,清楚,满意,你说,有听,能听到,行吧,好了,哟啊,阿吆,要啊,继续,需要', 'nihao,ninhao,huide,haoba,haode,tuotuo,duide,dangran,ganxingqu,fangbian,mingbai,shia,shide,xiaode,youyidian,youxingqu,youa,youde,youkong,meiyouwenti,meiwenti,qingchu,manyi,nishuo,youting,nengtingdao,xingba,haole,yoa,ayao,yaoa,jixu,xuyao');
INSERT INTO `rk_tel_keyword` VALUES (61, 28, 0, '4', 'ok,不错,了解,做过,可以,听说过,听过,够了,够的,挺好,熟悉,知道,给力,继续,认可,嗯,差不多,讲,说,还不错,还好,具体点,哦,啊,哈', 'ok,bucuo,liaojie,zuoguo,keyi,tingshuoguo,tingguo,goule,goude,tinghao,shuxi,zhidao,geili,jixu,renke,,chabuduo,jiang,shuo,haibucuo,haihao,jutidian,o,a,ha');
INSERT INTO `rk_tel_keyword` VALUES (62, 28, 0, '5', '没听到,说什么,重说,再说一下,再说一次,再说一遍,没听见,很吵,听不清,听不到,什么啊,没听清,听不清楚', 'meitingdao,shuoshimo,zhongshuo,zaishuoyixia,zaishuoyici,zaishuoyibian,meitingjian,henchao,tingbuqing,tingbudao,shenmea,meitingqing,tingbuqingchu');
INSERT INTO `rk_tel_keyword` VALUES (67, 30, 0, '1', '什么,谁,多少,好多,啥子,多久,有啥,怎么,几个,哪里,那里,哪些,那些,咋个,扎个,啷个,好低嘛,好快吗', 'shenme,shui,duoshao,haoduo,shazi,duojiu,yousha,zenme,jige,nali,nali,neixie,neixie,zage,zhage,langge,haodima,haokuaima');
INSERT INTO `rk_tel_keyword` VALUES (68, 30, 0, '2', '你好,您好,会的,好吧,好的,妥妥,对的,当然,感兴趣,方便,明白,是啊,是的,晓得,有一点,有兴趣,有啊,有的,有空,没有问题,没问题,清楚,满意,你说,有听,能听到,行吧,好了,哟啊,阿吆,要啊,继续,需要', 'nihao,ninhao,huide,haoba,haode,tuotuo,duide,dangran,ganxingqu,fangbian,mingbai,shia,shide,xiaode,youyidian,youxingqu,youa,youde,youkong,meiyouwenti,meiwenti,qingchu,manyi,nishuo,youting,nengtingdao,xingba,haole,yoa,ayao,yaoa,jixu,xuyao');
INSERT INTO `rk_tel_keyword` VALUES (69, 30, 0, '4', 'ok,不错,了解,做过,可以,听说过,听过,够了,够的,挺好,熟悉,知道,给力,继续,认可,嗯,差不多,讲,说,还不错,还好,具体点,哦,啊,哈', 'ok,bucuo,liaojie,zuoguo,keyi,tingshuoguo,tingguo,goule,goude,tinghao,shuxi,zhidao,geili,jixu,renke,,chabuduo,jiang,shuo,haibucuo,haihao,jutidian,o,a,ha');
INSERT INTO `rk_tel_keyword` VALUES (70, 30, 0, '5', '没听到,说什么,重说,再说一下,再说一次,再说一遍,没听见,很吵,听不清,听不到,什么啊,没听清,听不清楚', 'meitingdao,shuoshimo,zhongshuo,zaishuoyixia,zaishuoyici,zaishuoyibian,meitingjian,henchao,tingbuqing,tingbudao,shenmea,meitingqing,tingbuqingchu');
INSERT INTO `rk_tel_keyword` VALUES (71, 31, 0, '1', '什么,谁,多少,好多,啥子,多久,有啥,怎么,几个,哪里,那里,哪些,那些,咋个,扎个,啷个,好低嘛,好快吗', 'shenme,shui,duoshao,haoduo,shazi,duojiu,yousha,zenme,jige,nali,nali,neixie,neixie,zage,zhage,langge,haodima,haokuaima');
INSERT INTO `rk_tel_keyword` VALUES (72, 31, 0, '2', '你好,您好,会的,好吧,好的,妥妥,对的,当然,感兴趣,方便,明白,是啊,是的,晓得,有一点,有兴趣,有啊,有的,有空,没有问题,没问题,清楚,满意,你说,有听,能听到,行吧,好了,哟啊,阿吆,要啊,继续,需要', 'nihao,ninhao,huide,haoba,haode,tuotuo,duide,dangran,ganxingqu,fangbian,mingbai,shia,shide,xiaode,youyidian,youxingqu,youa,youde,youkong,meiyouwenti,meiwenti,qingchu,manyi,nishuo,youting,nengtingdao,xingba,haole,yoa,ayao,yaoa,jixu,xuyao');
INSERT INTO `rk_tel_keyword` VALUES (73, 31, 0, '4', 'ok,不错,了解,做过,可以,听说过,听过,够了,够的,挺好,熟悉,知道,给力,继续,认可,嗯,差不多,讲,说,还不错,还好,具体点,哦,啊,哈', 'ok,bucuo,liaojie,zuoguo,keyi,tingshuoguo,tingguo,goule,goude,tinghao,shuxi,zhidao,geili,jixu,renke,,chabuduo,jiang,shuo,haibucuo,haihao,jutidian,o,a,ha');
INSERT INTO `rk_tel_keyword` VALUES (74, 31, 0, '5', '没听到,说什么,重说,再说一下,再说一次,再说一遍,没听见,很吵,听不清,听不到,什么啊,没听清,听不清楚', 'meitingdao,shuoshimo,zhongshuo,zaishuoyixia,zaishuoyici,zaishuoyibian,meitingjian,henchao,tingbuqing,tingbudao,shenmea,meitingqing,tingbuqingchu');
INSERT INTO `rk_tel_keyword` VALUES (75, 32, 0, '1', '什么,谁,多少,好多,啥子,多久,有啥,怎么,几个,哪里,那里,哪些,那些,咋个,扎个,啷个,好低嘛,好快吗', 'shenme,shui,duoshao,haoduo,shazi,duojiu,yousha,zenme,jige,nali,nali,neixie,neixie,zage,zhage,langge,haodima,haokuaima');
INSERT INTO `rk_tel_keyword` VALUES (76, 32, 0, '2', '你好,您好,会的,好吧,好的,妥妥,对的,当然,感兴趣,方便,明白,是啊,是的,晓得,有一点,有兴趣,有啊,有的,有空,没有问题,没问题,清楚,满意,你说,有听,能听到,行吧,好了,哟啊,阿吆,要啊,继续,需要', 'nihao,ninhao,huide,haoba,haode,tuotuo,duide,dangran,ganxingqu,fangbian,mingbai,shia,shide,xiaode,youyidian,youxingqu,youa,youde,youkong,meiyouwenti,meiwenti,qingchu,manyi,nishuo,youting,nengtingdao,xingba,haole,yoa,ayao,yaoa,jixu,xuyao');
INSERT INTO `rk_tel_keyword` VALUES (77, 32, 0, '4', 'ok,不错,了解,做过,可以,听说过,听过,够了,够的,挺好,熟悉,知道,给力,继续,认可,嗯,差不多,讲,说,还不错,还好,具体点,哦,啊,哈', 'ok,bucuo,liaojie,zuoguo,keyi,tingshuoguo,tingguo,goule,goude,tinghao,shuxi,zhidao,geili,jixu,renke,,chabuduo,jiang,shuo,haibucuo,haihao,jutidian,o,a,ha');
INSERT INTO `rk_tel_keyword` VALUES (78, 32, 0, '5', '没听到,说什么,重说,再说一下,再说一次,再说一遍,没听见,很吵,听不清,听不到,什么啊,没听清,听不清楚', 'meitingdao,shuoshimo,zhongshuo,zaishuoyixia,zaishuoyici,zaishuoyibian,meitingjian,henchao,tingbuqing,tingbudao,shenmea,meitingqing,tingbuqingchu');
INSERT INTO `rk_tel_keyword` VALUES (79, 33, 0, '1', '什么,谁,多少,好多,啥子,多久,有啥,怎么,几个,哪里,那里,哪些,那些,咋个,扎个,啷个,好低嘛,好快吗', 'shenme,shui,duoshao,haoduo,shazi,duojiu,yousha,zenme,jige,nali,nali,neixie,neixie,zage,zhage,langge,haodima,haokuaima');
INSERT INTO `rk_tel_keyword` VALUES (80, 33, 0, '2', '你好,您好,会的,好吧,好的,妥妥,对的,当然,感兴趣,方便,明白,是啊,是的,晓得,有一点,有兴趣,有啊,有的,有空,没有问题,没问题,清楚,满意,你说,有听,能听到,行吧,好了,哟啊,阿吆,要啊,继续,需要', 'nihao,ninhao,huide,haoba,haode,tuotuo,duide,dangran,ganxingqu,fangbian,mingbai,shia,shide,xiaode,youyidian,youxingqu,youa,youde,youkong,meiyouwenti,meiwenti,qingchu,manyi,nishuo,youting,nengtingdao,xingba,haole,yoa,ayao,yaoa,jixu,xuyao');
INSERT INTO `rk_tel_keyword` VALUES (81, 33, 0, '4', 'ok,不错,了解,做过,可以,听说过,听过,够了,够的,挺好,熟悉,知道,给力,继续,认可,嗯,差不多,讲,说,还不错,还好,具体点,哦,啊,哈', 'ok,bucuo,liaojie,zuoguo,keyi,tingshuoguo,tingguo,goule,goude,tinghao,shuxi,zhidao,geili,jixu,renke,,chabuduo,jiang,shuo,haibucuo,haihao,jutidian,o,a,ha');
INSERT INTO `rk_tel_keyword` VALUES (82, 33, 0, '5', '没听到,说什么,重说,再说一下,再说一次,再说一遍,没听见,很吵,听不清,听不到,什么啊,没听清,听不清楚', 'meitingdao,shuoshimo,zhongshuo,zaishuoyixia,zaishuoyici,zaishuoyibian,meitingjian,henchao,tingbuqing,tingbudao,shenmea,meitingqing,tingbuqingchu');
INSERT INTO `rk_tel_keyword` VALUES (83, 34, 0, '1', '什么,谁,多少,好多,啥子,多久,有啥,怎么,几个,哪里,那里,哪些,那些,咋个,扎个,啷个,好低嘛,好快吗', 'shenme,shui,duoshao,haoduo,shazi,duojiu,yousha,zenme,jige,nali,nali,neixie,neixie,zage,zhage,langge,haodima,haokuaima');
INSERT INTO `rk_tel_keyword` VALUES (84, 34, 0, '2', '你好,您好,会的,好吧,好的,妥妥,对的,当然,感兴趣,方便,明白,是啊,是的,晓得,有一点,有兴趣,有啊,有的,有空,没有问题,没问题,清楚,满意,你说,有听,能听到,行吧,好了,哟啊,阿吆,要啊,继续,需要', 'nihao,ninhao,huide,haoba,haode,tuotuo,duide,dangran,ganxingqu,fangbian,mingbai,shia,shide,xiaode,youyidian,youxingqu,youa,youde,youkong,meiyouwenti,meiwenti,qingchu,manyi,nishuo,youting,nengtingdao,xingba,haole,yoa,ayao,yaoa,jixu,xuyao');
INSERT INTO `rk_tel_keyword` VALUES (85, 34, 0, '4', 'ok,不错,了解,做过,可以,听说过,听过,够了,够的,挺好,熟悉,知道,给力,继续,认可,嗯,差不多,讲,说,还不错,还好,具体点,哦,啊,哈', 'ok,bucuo,liaojie,zuoguo,keyi,tingshuoguo,tingguo,goule,goude,tinghao,shuxi,zhidao,geili,jixu,renke,,chabuduo,jiang,shuo,haibucuo,haihao,jutidian,o,a,ha');
INSERT INTO `rk_tel_keyword` VALUES (86, 34, 0, '5', '没听到,说什么,重说,再说一下,再说一次,再说一遍,没听见,很吵,听不清,听不到,什么啊,没听清,听不清楚', 'meitingdao,shuoshimo,zhongshuo,zaishuoyixia,zaishuoyici,zaishuoyibian,meitingjian,henchao,tingbuqing,tingbudao,shenmea,meitingqing,tingbuqingchu');
INSERT INTO `rk_tel_keyword` VALUES (87, 35, 0, '1', '什么,谁,多少,好多,啥子,多久,有啥,怎么,几个,哪里,那里,哪些,那些,咋个,扎个,啷个,好低嘛,好快吗', 'shenme,shui,duoshao,haoduo,shazi,duojiu,yousha,zenme,jige,nali,nali,neixie,neixie,zage,zhage,langge,haodima,haokuaima');
INSERT INTO `rk_tel_keyword` VALUES (88, 35, 0, '2', '你好,您好,会的,好吧,好的,妥妥,对的,当然,感兴趣,方便,明白,是啊,是的,晓得,有一点,有兴趣,有啊,有的,有空,没有问题,没问题,清楚,满意,你说,有听,能听到,行吧,好了,哟啊,阿吆,要啊,继续,需要', 'nihao,ninhao,huide,haoba,haode,tuotuo,duide,dangran,ganxingqu,fangbian,mingbai,shia,shide,xiaode,youyidian,youxingqu,youa,youde,youkong,meiyouwenti,meiwenti,qingchu,manyi,nishuo,youting,nengtingdao,xingba,haole,yoa,ayao,yaoa,jixu,xuyao');
INSERT INTO `rk_tel_keyword` VALUES (89, 35, 0, '4', 'ok,不错,了解,做过,可以,听说过,听过,够了,够的,挺好,熟悉,知道,给力,继续,认可,嗯,差不多,讲,说,还不错,还好,具体点,哦,啊,哈', 'ok,bucuo,liaojie,zuoguo,keyi,tingshuoguo,tingguo,goule,goude,tinghao,shuxi,zhidao,geili,jixu,renke,,chabuduo,jiang,shuo,haibucuo,haihao,jutidian,o,a,ha');
INSERT INTO `rk_tel_keyword` VALUES (90, 35, 0, '5', '没听到,说什么,重说,再说一下,再说一次,再说一遍,没听见,很吵,听不清,听不到,什么啊,没听清,听不清楚', 'meitingdao,shuoshimo,zhongshuo,zaishuoyixia,zaishuoyici,zaishuoyibian,meitingjian,henchao,tingbuqing,tingbudao,shenmea,meitingqing,tingbuqingchu');
INSERT INTO `rk_tel_keyword` VALUES (91, 36, 0, '1', '什么,谁,多少,好多,啥子,多久,有啥,怎么,几个,哪里,那里,哪些,那些,咋个,扎个,啷个,好低嘛,好快吗', 'shenme,shui,duoshao,haoduo,shazi,duojiu,yousha,zenme,jige,nali,nali,neixie,neixie,zage,zhage,langge,haodima,haokuaima');
INSERT INTO `rk_tel_keyword` VALUES (92, 36, 0, '2', '你好,您好,会的,好吧,好的,妥妥,对的,当然,感兴趣,方便,明白,是啊,是的,晓得,有一点,有兴趣,有啊,有的,有空,没有问题,没问题,清楚,满意,你说,有听,能听到,行吧,好了,哟啊,阿吆,要啊,继续,需要', 'nihao,ninhao,huide,haoba,haode,tuotuo,duide,dangran,ganxingqu,fangbian,mingbai,shia,shide,xiaode,youyidian,youxingqu,youa,youde,youkong,meiyouwenti,meiwenti,qingchu,manyi,nishuo,youting,nengtingdao,xingba,haole,yoa,ayao,yaoa,jixu,xuyao');
INSERT INTO `rk_tel_keyword` VALUES (93, 36, 0, '4', 'ok,不错,了解,做过,可以,听说过,听过,够了,够的,挺好,熟悉,知道,给力,继续,认可,嗯,差不多,讲,说,还不错,还好,具体点,哦,啊,哈', 'ok,bucuo,liaojie,zuoguo,keyi,tingshuoguo,tingguo,goule,goude,tinghao,shuxi,zhidao,geili,jixu,renke,,chabuduo,jiang,shuo,haibucuo,haihao,jutidian,o,a,ha');
INSERT INTO `rk_tel_keyword` VALUES (94, 36, 0, '5', '没听到,说什么,重说,再说一下,再说一次,再说一遍,没听见,很吵,听不清,听不到,什么啊,没听清,听不清楚', 'meitingdao,shuoshimo,zhongshuo,zaishuoyixia,zaishuoyici,zaishuoyibian,meitingjian,henchao,tingbuqing,tingbudao,shenmea,meitingqing,tingbuqingchu');
INSERT INTO `rk_tel_keyword` VALUES (95, 37, 0, '1', '什么,谁,多少,好多,啥子,多久,有啥,怎么,几个,哪里,那里,哪些,那些,咋个,扎个,啷个,好低嘛,好快吗', 'shenme,shui,duoshao,haoduo,shazi,duojiu,yousha,zenme,jige,nali,nali,neixie,neixie,zage,zhage,langge,haodima,haokuaima');
INSERT INTO `rk_tel_keyword` VALUES (96, 37, 0, '2', '你好,您好,会的,好吧,好的,妥妥,对的,当然,感兴趣,方便,明白,是啊,是的,晓得,有一点,有兴趣,有啊,有的,有空,没有问题,没问题,清楚,满意,你说,有听,能听到,行吧,好了,哟啊,阿吆,要啊,继续,需要', 'nihao,ninhao,huide,haoba,haode,tuotuo,duide,dangran,ganxingqu,fangbian,mingbai,shia,shide,xiaode,youyidian,youxingqu,youa,youde,youkong,meiyouwenti,meiwenti,qingchu,manyi,nishuo,youting,nengtingdao,xingba,haole,yoa,ayao,yaoa,jixu,xuyao');
INSERT INTO `rk_tel_keyword` VALUES (97, 37, 0, '4', 'ok,不错,了解,做过,可以,听说过,听过,够了,够的,挺好,熟悉,知道,给力,继续,认可,嗯,差不多,讲,说,还不错,还好,具体点,哦,啊,哈', 'ok,bucuo,liaojie,zuoguo,keyi,tingshuoguo,tingguo,goule,goude,tinghao,shuxi,zhidao,geili,jixu,renke,,chabuduo,jiang,shuo,haibucuo,haihao,jutidian,o,a,ha');
INSERT INTO `rk_tel_keyword` VALUES (98, 37, 0, '5', '没听到,说什么,重说,再说一下,再说一次,再说一遍,没听见,很吵,听不清,听不到,什么啊,没听清,听不清楚', 'meitingdao,shuoshimo,zhongshuo,zaishuoyixia,zaishuoyici,zaishuoyibian,meitingjian,henchao,tingbuqing,tingbudao,shenmea,meitingqing,tingbuqingchu');
INSERT INTO `rk_tel_keyword` VALUES (99, 38, 0, '1', '什么,谁,多少,好多,啥子,多久,有啥,怎么,几个,哪里,那里,哪些,那些,咋个,扎个,啷个,好低嘛,好快吗', 'shenme,shui,duoshao,haoduo,shazi,duojiu,yousha,zenme,jige,nali,nali,neixie,neixie,zage,zhage,langge,haodima,haokuaima');
INSERT INTO `rk_tel_keyword` VALUES (100, 38, 0, '2', '你好,您好,会的,好吧,好的,妥妥,对的,当然,感兴趣,方便,明白,是啊,是的,晓得,有一点,有兴趣,有啊,有的,有空,没有问题,没问题,清楚,满意,你说,有听,能听到,行吧,好了,哟啊,阿吆,要啊,继续,需要', 'nihao,ninhao,huide,haoba,haode,tuotuo,duide,dangran,ganxingqu,fangbian,mingbai,shia,shide,xiaode,youyidian,youxingqu,youa,youde,youkong,meiyouwenti,meiwenti,qingchu,manyi,nishuo,youting,nengtingdao,xingba,haole,yoa,ayao,yaoa,jixu,xuyao');
INSERT INTO `rk_tel_keyword` VALUES (101, 38, 0, '4', 'ok,不错,了解,做过,可以,听说过,听过,够了,够的,挺好,熟悉,知道,给力,继续,认可,嗯,差不多,讲,说,还不错,还好,具体点,哦,啊,哈', 'ok,bucuo,liaojie,zuoguo,keyi,tingshuoguo,tingguo,goule,goude,tinghao,shuxi,zhidao,geili,jixu,renke,,chabuduo,jiang,shuo,haibucuo,haihao,jutidian,o,a,ha');
INSERT INTO `rk_tel_keyword` VALUES (102, 38, 0, '5', '没听到,说什么,重说,再说一下,再说一次,再说一遍,没听见,很吵,听不清,听不到,什么啊,没听清,听不清楚', 'meitingdao,shuoshimo,zhongshuo,zaishuoyixia,zaishuoyici,zaishuoyibian,meitingjian,henchao,tingbuqing,tingbudao,shenmea,meitingqing,tingbuqingchu');
INSERT INTO `rk_tel_keyword` VALUES (103, 39, 0, '1', '什么,谁,多少,好多,啥子,多久,有啥,怎么,几个,哪里,那里,哪些,那些,咋个,扎个,啷个,好低嘛,好快吗', 'shenme,shui,duoshao,haoduo,shazi,duojiu,yousha,zenme,jige,nali,nali,neixie,neixie,zage,zhage,langge,haodima,haokuaima');
INSERT INTO `rk_tel_keyword` VALUES (104, 39, 0, '2', '你好,您好,会的,好吧,好的,妥妥,对的,当然,感兴趣,方便,明白,是啊,是的,晓得,有一点,有兴趣,有啊,有的,有空,没有问题,没问题,清楚,满意,你说,有听,能听到,行吧,好了,哟啊,阿吆,要啊,继续,需要', 'nihao,ninhao,huide,haoba,haode,tuotuo,duide,dangran,ganxingqu,fangbian,mingbai,shia,shide,xiaode,youyidian,youxingqu,youa,youde,youkong,meiyouwenti,meiwenti,qingchu,manyi,nishuo,youting,nengtingdao,xingba,haole,yoa,ayao,yaoa,jixu,xuyao');
INSERT INTO `rk_tel_keyword` VALUES (105, 39, 0, '4', 'ok,不错,了解,做过,可以,听说过,听过,够了,够的,挺好,熟悉,知道,给力,继续,认可,嗯,差不多,讲,说,还不错,还好,具体点,哦,啊,哈', 'ok,bucuo,liaojie,zuoguo,keyi,tingshuoguo,tingguo,goule,goude,tinghao,shuxi,zhidao,geili,jixu,renke,,chabuduo,jiang,shuo,haibucuo,haihao,jutidian,o,a,ha');
INSERT INTO `rk_tel_keyword` VALUES (106, 39, 0, '5', '没听到,说什么,重说,再说一下,再说一次,再说一遍,没听见,很吵,听不清,听不到,什么啊,没听清,听不清楚', 'meitingdao,shuoshimo,zhongshuo,zaishuoyixia,zaishuoyici,zaishuoyibian,meitingjian,henchao,tingbuqing,tingbudao,shenmea,meitingqing,tingbuqingchu');
INSERT INTO `rk_tel_keyword` VALUES (107, 39, 0, '1', '什么,谁,多少,好多,啥子,多久,有啥,怎么,几个,哪里,那里,哪些,那些,咋个,扎个,啷个,好低嘛,好快吗', 'shenme,shui,duoshao,haoduo,shazi,duojiu,yousha,zenme,jige,nali,nali,neixie,neixie,zage,zhage,langge,haodima,haokuaima');
INSERT INTO `rk_tel_keyword` VALUES (108, 39, 0, '2', '你好,您好,会的,好吧,好的,妥妥,对的,当然,感兴趣,方便,明白,是啊,是的,晓得,有一点,有兴趣,有啊,有的,有空,没有问题,没问题,清楚,满意,你说,有听,能听到,行吧,好了,哟啊,阿吆,要啊,继续,需要', 'nihao,ninhao,huide,haoba,haode,tuotuo,duide,dangran,ganxingqu,fangbian,mingbai,shia,shide,xiaode,youyidian,youxingqu,youa,youde,youkong,meiyouwenti,meiwenti,qingchu,manyi,nishuo,youting,nengtingdao,xingba,haole,yoa,ayao,yaoa,jixu,xuyao');
INSERT INTO `rk_tel_keyword` VALUES (109, 39, 0, '4', 'ok,不错,了解,做过,可以,听说过,听过,够了,够的,挺好,熟悉,知道,给力,继续,认可,嗯,差不多,讲,说,还不错,还好,具体点,哦,啊,哈', 'ok,bucuo,liaojie,zuoguo,keyi,tingshuoguo,tingguo,goule,goude,tinghao,shuxi,zhidao,geili,jixu,renke,,chabuduo,jiang,shuo,haibucuo,haihao,jutidian,o,a,ha');
INSERT INTO `rk_tel_keyword` VALUES (110, 39, 0, '5', '没听到,说什么,重说,再说一下,再说一次,再说一遍,没听见,很吵,听不清,听不到,什么啊,没听清,听不清楚', 'meitingdao,shuoshimo,zhongshuo,zaishuoyixia,zaishuoyici,zaishuoyibian,meitingjian,henchao,tingbuqing,tingbudao,shenmea,meitingqing,tingbuqingchu');
INSERT INTO `rk_tel_keyword` VALUES (111, 40, 0, '1', '什么,谁,多少,好多,啥子,多久,有啥,怎么,几个,哪里,那里,哪些,那些,咋个,扎个,啷个,好低嘛,好快吗', 'shenme,shui,duoshao,haoduo,shazi,duojiu,yousha,zenme,jige,nali,nali,neixie,neixie,zage,zhage,langge,haodima,haokuaima');
INSERT INTO `rk_tel_keyword` VALUES (112, 40, 0, '2', '你好,您好,会的,好吧,好的,妥妥,对的,当然,感兴趣,方便,明白,是啊,是的,晓得,有一点,有兴趣,有啊,有的,有空,没有问题,没问题,清楚,满意,你说,有听,能听到,行吧,好了,哟啊,阿吆,要啊,继续,需要', 'nihao,ninhao,huide,haoba,haode,tuotuo,duide,dangran,ganxingqu,fangbian,mingbai,shia,shide,xiaode,youyidian,youxingqu,youa,youde,youkong,meiyouwenti,meiwenti,qingchu,manyi,nishuo,youting,nengtingdao,xingba,haole,yoa,ayao,yaoa,jixu,xuyao');
INSERT INTO `rk_tel_keyword` VALUES (113, 40, 0, '4', 'ok,不错,了解,做过,可以,听说过,听过,够了,够的,挺好,熟悉,知道,给力,继续,认可,嗯,差不多,讲,说,还不错,还好,具体点,哦,啊,哈', 'ok,bucuo,liaojie,zuoguo,keyi,tingshuoguo,tingguo,goule,goude,tinghao,shuxi,zhidao,geili,jixu,renke,,chabuduo,jiang,shuo,haibucuo,haihao,jutidian,o,a,ha');
INSERT INTO `rk_tel_keyword` VALUES (114, 40, 0, '5', '没听到,说什么,重说,再说一下,再说一次,再说一遍,没听见,很吵,听不清,听不到,什么啊,没听清,听不清楚', 'meitingdao,shuoshimo,zhongshuo,zaishuoyixia,zaishuoyici,zaishuoyibian,meitingjian,henchao,tingbuqing,tingbudao,shenmea,meitingqing,tingbuqingchu');
INSERT INTO `rk_tel_keyword` VALUES (115, 41, 0, '1', '什么,谁,多少,好多,啥子,多久,有啥,怎么,几个,哪里,那里,哪些,那些,咋个,扎个,啷个,好低嘛,好快吗', 'shenme,shui,duoshao,haoduo,shazi,duojiu,yousha,zenme,jige,nali,nali,neixie,neixie,zage,zhage,langge,haodima,haokuaima');
INSERT INTO `rk_tel_keyword` VALUES (116, 41, 0, '2', '你好,您好,会的,好吧,好的,妥妥,对的,当然,感兴趣,方便,明白,是啊,是的,晓得,有一点,有兴趣,有啊,有的,有空,没有问题,没问题,清楚,满意,你说,有听,能听到,行吧,好了,哟啊,阿吆,要啊,继续,需要', 'nihao,ninhao,huide,haoba,haode,tuotuo,duide,dangran,ganxingqu,fangbian,mingbai,shia,shide,xiaode,youyidian,youxingqu,youa,youde,youkong,meiyouwenti,meiwenti,qingchu,manyi,nishuo,youting,nengtingdao,xingba,haole,yoa,ayao,yaoa,jixu,xuyao');
INSERT INTO `rk_tel_keyword` VALUES (117, 41, 0, '4', 'ok,不错,了解,做过,可以,听说过,听过,够了,够的,挺好,熟悉,知道,给力,继续,认可,嗯,差不多,讲,说,还不错,还好,具体点,哦,啊,哈', 'ok,bucuo,liaojie,zuoguo,keyi,tingshuoguo,tingguo,goule,goude,tinghao,shuxi,zhidao,geili,jixu,renke,,chabuduo,jiang,shuo,haibucuo,haihao,jutidian,o,a,ha');
INSERT INTO `rk_tel_keyword` VALUES (118, 41, 0, '5', '没听到,说什么,重说,再说一下,再说一次,再说一遍,没听见,很吵,听不清,听不到,什么啊,没听清,听不清楚', 'meitingdao,shuoshimo,zhongshuo,zaishuoyixia,zaishuoyici,zaishuoyibian,meitingjian,henchao,tingbuqing,tingbudao,shenmea,meitingqing,tingbuqingchu');
INSERT INTO `rk_tel_keyword` VALUES (119, 42, 0, '1', '什么,谁,多少,好多,啥子,多久,有啥,怎么,几个,哪里,那里,哪些,那些,咋个,扎个,啷个,好低嘛,好快吗', 'shenme,shui,duoshao,haoduo,shazi,duojiu,yousha,zenme,jige,nali,nali,neixie,neixie,zage,zhage,langge,haodima,haokuaima');
INSERT INTO `rk_tel_keyword` VALUES (120, 42, 0, '2', '你好,您好,会的,好吧,好的,妥妥,对的,当然,感兴趣,方便,明白,是啊,是的,晓得,有一点,有兴趣,有啊,有的,有空,没有问题,没问题,清楚,满意,你说,有听,能听到,行吧,好了,哟啊,阿吆,要啊,继续,需要', 'nihao,ninhao,huide,haoba,haode,tuotuo,duide,dangran,ganxingqu,fangbian,mingbai,shia,shide,xiaode,youyidian,youxingqu,youa,youde,youkong,meiyouwenti,meiwenti,qingchu,manyi,nishuo,youting,nengtingdao,xingba,haole,yoa,ayao,yaoa,jixu,xuyao');
INSERT INTO `rk_tel_keyword` VALUES (121, 42, 0, '4', 'ok,不错,了解,做过,可以,听说过,听过,够了,够的,挺好,熟悉,知道,给力,继续,认可,嗯,差不多,讲,说,还不错,还好,具体点,哦,啊,哈', 'ok,bucuo,liaojie,zuoguo,keyi,tingshuoguo,tingguo,goule,goude,tinghao,shuxi,zhidao,geili,jixu,renke,,chabuduo,jiang,shuo,haibucuo,haihao,jutidian,o,a,ha');
INSERT INTO `rk_tel_keyword` VALUES (122, 42, 0, '5', '没听到,说什么,重说,再说一下,再说一次,再说一遍,没听见,很吵,听不清,听不到,什么啊,没听清,听不清楚', 'meitingdao,shuoshimo,zhongshuo,zaishuoyixia,zaishuoyici,zaishuoyibian,meitingjian,henchao,tingbuqing,tingbudao,shenmea,meitingqing,tingbuqingchu');
INSERT INTO `rk_tel_keyword` VALUES (123, 43, 0, '1', '什么,谁,多少,好多,啥子,多久,有啥,怎么,几个,哪里,那里,哪些,那些,咋个,扎个,啷个,好低嘛,好快吗', 'shenme,shui,duoshao,haoduo,shazi,duojiu,yousha,zenme,jige,nali,nali,neixie,neixie,zage,zhage,langge,haodima,haokuaima');
INSERT INTO `rk_tel_keyword` VALUES (124, 43, 0, '2', '你好,您好,会的,好吧,好的,妥妥,对的,当然,感兴趣,方便,明白,是啊,是的,晓得,有一点,有兴趣,有啊,有的,有空,没有问题,没问题,清楚,满意,你说,有听,能听到,行吧,好了,哟啊,阿吆,要啊,继续,需要', 'nihao,ninhao,huide,haoba,haode,tuotuo,duide,dangran,ganxingqu,fangbian,mingbai,shia,shide,xiaode,youyidian,youxingqu,youa,youde,youkong,meiyouwenti,meiwenti,qingchu,manyi,nishuo,youting,nengtingdao,xingba,haole,yoa,ayao,yaoa,jixu,xuyao');
INSERT INTO `rk_tel_keyword` VALUES (125, 43, 0, '4', 'ok,不错,了解,做过,可以,听说过,听过,够了,够的,挺好,熟悉,知道,给力,继续,认可,嗯,差不多,讲,说,还不错,还好,具体点,哦,啊,哈', 'ok,bucuo,liaojie,zuoguo,keyi,tingshuoguo,tingguo,goule,goude,tinghao,shuxi,zhidao,geili,jixu,renke,,chabuduo,jiang,shuo,haibucuo,haihao,jutidian,o,a,ha');
INSERT INTO `rk_tel_keyword` VALUES (126, 43, 0, '5', '没听到,说什么,重说,再说一下,再说一次,再说一遍,没听见,很吵,听不清,听不到,什么啊,没听清,听不清楚', 'meitingdao,shuoshimo,zhongshuo,zaishuoyixia,zaishuoyici,zaishuoyibian,meitingjian,henchao,tingbuqing,tingbudao,shenmea,meitingqing,tingbuqingchu');
INSERT INTO `rk_tel_keyword` VALUES (127, 44, 0, '1', '什么,谁,多少,好多,啥子,多久,有啥,怎么,几个,哪里,那里,哪些,那些,咋个,扎个,啷个,好低嘛,好快吗', 'shenme,shui,duoshao,haoduo,shazi,duojiu,yousha,zenme,jige,nali,nali,neixie,neixie,zage,zhage,langge,haodima,haokuaima');
INSERT INTO `rk_tel_keyword` VALUES (128, 44, 0, '2', '你好,您好,会的,好吧,好的,妥妥,对的,当然,感兴趣,方便,明白,是啊,是的,晓得,有一点,有兴趣,有啊,有的,有空,没有问题,没问题,清楚,满意,你说,有听,能听到,行吧,好了,哟啊,阿吆,要啊,继续,需要', 'nihao,ninhao,huide,haoba,haode,tuotuo,duide,dangran,ganxingqu,fangbian,mingbai,shia,shide,xiaode,youyidian,youxingqu,youa,youde,youkong,meiyouwenti,meiwenti,qingchu,manyi,nishuo,youting,nengtingdao,xingba,haole,yoa,ayao,yaoa,jixu,xuyao');
INSERT INTO `rk_tel_keyword` VALUES (129, 44, 0, '4', 'ok,不错,了解,做过,可以,听说过,听过,够了,够的,挺好,熟悉,知道,给力,继续,认可,嗯,差不多,讲,说,还不错,还好,具体点,哦,啊,哈', 'ok,bucuo,liaojie,zuoguo,keyi,tingshuoguo,tingguo,goule,goude,tinghao,shuxi,zhidao,geili,jixu,renke,,chabuduo,jiang,shuo,haibucuo,haihao,jutidian,o,a,ha');
INSERT INTO `rk_tel_keyword` VALUES (130, 44, 0, '5', '没听到,说什么,重说,再说一下,再说一次,再说一遍,没听见,很吵,听不清,听不到,什么啊,没听清,听不清楚', 'meitingdao,shuoshimo,zhongshuo,zaishuoyixia,zaishuoyici,zaishuoyibian,meitingjian,henchao,tingbuqing,tingbudao,shenmea,meitingqing,tingbuqingchu');
INSERT INTO `rk_tel_keyword` VALUES (131, 45, 0, '1', '什么,谁,多少,好多,啥子,多久,有啥,怎么,几个,哪里,那里,哪些,那些,咋个,扎个,啷个,好低嘛,好快吗', 'shenme,shui,duoshao,haoduo,shazi,duojiu,yousha,zenme,jige,nali,nali,neixie,neixie,zage,zhage,langge,haodima,haokuaima');
INSERT INTO `rk_tel_keyword` VALUES (132, 45, 0, '2', '你好,您好,会的,好吧,好的,妥妥,对的,当然,感兴趣,方便,明白,是啊,是的,晓得,有一点,有兴趣,有啊,有的,有空,没有问题,没问题,清楚,满意,你说,有听,能听到,行吧,好了,哟啊,阿吆,要啊,继续,需要', 'nihao,ninhao,huide,haoba,haode,tuotuo,duide,dangran,ganxingqu,fangbian,mingbai,shia,shide,xiaode,youyidian,youxingqu,youa,youde,youkong,meiyouwenti,meiwenti,qingchu,manyi,nishuo,youting,nengtingdao,xingba,haole,yoa,ayao,yaoa,jixu,xuyao');
INSERT INTO `rk_tel_keyword` VALUES (133, 45, 0, '4', 'ok,不错,了解,做过,可以,听说过,听过,够了,够的,挺好,熟悉,知道,给力,继续,认可,嗯,差不多,讲,说,还不错,还好,具体点,哦,啊,哈', 'ok,bucuo,liaojie,zuoguo,keyi,tingshuoguo,tingguo,goule,goude,tinghao,shuxi,zhidao,geili,jixu,renke,,chabuduo,jiang,shuo,haibucuo,haihao,jutidian,o,a,ha');
INSERT INTO `rk_tel_keyword` VALUES (134, 45, 0, '5', '没听到,说什么,重说,再说一下,再说一次,再说一遍,没听见,很吵,听不清,听不到,什么啊,没听清,听不清楚', 'meitingdao,shuoshimo,zhongshuo,zaishuoyixia,zaishuoyici,zaishuoyibian,meitingjian,henchao,tingbuqing,tingbudao,shenmea,meitingqing,tingbuqingchu');
INSERT INTO `rk_tel_keyword` VALUES (135, 46, 0, '1', '什么,谁,多少,好多,啥子,多久,有啥,怎么,几个,哪里,那里,哪些,那些,咋个,扎个,啷个,好低嘛,好快吗', 'shenme,shui,duoshao,haoduo,shazi,duojiu,yousha,zenme,jige,nali,nali,neixie,neixie,zage,zhage,langge,haodima,haokuaima');
INSERT INTO `rk_tel_keyword` VALUES (136, 46, 0, '2', '你好,您好,会的,好吧,好的,妥妥,对的,当然,感兴趣,方便,明白,是啊,是的,晓得,有一点,有兴趣,有啊,有的,有空,没有问题,没问题,清楚,满意,你说,有听,能听到,行吧,好了,哟啊,阿吆,要啊,继续,需要', 'nihao,ninhao,huide,haoba,haode,tuotuo,duide,dangran,ganxingqu,fangbian,mingbai,shia,shide,xiaode,youyidian,youxingqu,youa,youde,youkong,meiyouwenti,meiwenti,qingchu,manyi,nishuo,youting,nengtingdao,xingba,haole,yoa,ayao,yaoa,jixu,xuyao');
INSERT INTO `rk_tel_keyword` VALUES (137, 46, 0, '4', 'ok,不错,了解,做过,可以,听说过,听过,够了,够的,挺好,熟悉,知道,给力,继续,认可,嗯,差不多,讲,说,还不错,还好,具体点,哦,啊,哈', 'ok,bucuo,liaojie,zuoguo,keyi,tingshuoguo,tingguo,goule,goude,tinghao,shuxi,zhidao,geili,jixu,renke,,chabuduo,jiang,shuo,haibucuo,haihao,jutidian,o,a,ha');
INSERT INTO `rk_tel_keyword` VALUES (138, 46, 0, '5', '没听到,说什么,重说,再说一下,再说一次,再说一遍,没听见,很吵,听不清,听不到,什么啊,没听清,听不清楚', 'meitingdao,shuoshimo,zhongshuo,zaishuoyixia,zaishuoyici,zaishuoyibian,meitingjian,henchao,tingbuqing,tingbudao,shenmea,meitingqing,tingbuqingchu');
INSERT INTO `rk_tel_keyword` VALUES (139, 47, 0, '1', '什么,谁,多少,好多,啥子,多久,有啥,怎么,几个,哪里,那里,哪些,那些,咋个,扎个,啷个,好低嘛,好快吗', 'shenme,shui,duoshao,haoduo,shazi,duojiu,yousha,zenme,jige,nali,nali,neixie,neixie,zage,zhage,langge,haodima,haokuaima');
INSERT INTO `rk_tel_keyword` VALUES (140, 47, 0, '2', '你好,您好,会的,好吧,好的,妥妥,对的,当然,感兴趣,方便,明白,是啊,是的,晓得,有一点,有兴趣,有啊,有的,有空,没有问题,没问题,清楚,满意,你说,有听,能听到,行吧,好了,哟啊,阿吆,要啊,继续,需要', 'nihao,ninhao,huide,haoba,haode,tuotuo,duide,dangran,ganxingqu,fangbian,mingbai,shia,shide,xiaode,youyidian,youxingqu,youa,youde,youkong,meiyouwenti,meiwenti,qingchu,manyi,nishuo,youting,nengtingdao,xingba,haole,yoa,ayao,yaoa,jixu,xuyao');
INSERT INTO `rk_tel_keyword` VALUES (141, 47, 0, '4', 'ok,不错,了解,做过,可以,听说过,听过,够了,够的,挺好,熟悉,知道,给力,继续,认可,嗯,差不多,讲,说,还不错,还好,具体点,哦,啊,哈', 'ok,bucuo,liaojie,zuoguo,keyi,tingshuoguo,tingguo,goule,goude,tinghao,shuxi,zhidao,geili,jixu,renke,,chabuduo,jiang,shuo,haibucuo,haihao,jutidian,o,a,ha');
INSERT INTO `rk_tel_keyword` VALUES (142, 47, 0, '5', '没听到,说什么,重说,再说一下,再说一次,再说一遍,没听见,很吵,听不清,听不到,什么啊,没听清,听不清楚', 'meitingdao,shuoshimo,zhongshuo,zaishuoyixia,zaishuoyici,zaishuoyibian,meitingjian,henchao,tingbuqing,tingbudao,shenmea,meitingqing,tingbuqingchu');
INSERT INTO `rk_tel_keyword` VALUES (143, 48, 0, '1', '什么,谁,多少,好多,啥子,多久,有啥,怎么,几个,哪里,那里,哪些,那些,咋个,扎个,啷个,好低嘛,好快吗', 'shenme,shui,duoshao,haoduo,shazi,duojiu,yousha,zenme,jige,nali,nali,neixie,neixie,zage,zhage,langge,haodima,haokuaima');
INSERT INTO `rk_tel_keyword` VALUES (144, 48, 0, '2', '你好,您好,会的,好吧,好的,妥妥,对的,当然,感兴趣,方便,明白,是啊,是的,晓得,有一点,有兴趣,有啊,有的,有空,没有问题,没问题,清楚,满意,你说,有听,能听到,行吧,好了,哟啊,阿吆,要啊,继续,需要', 'nihao,ninhao,huide,haoba,haode,tuotuo,duide,dangran,ganxingqu,fangbian,mingbai,shia,shide,xiaode,youyidian,youxingqu,youa,youde,youkong,meiyouwenti,meiwenti,qingchu,manyi,nishuo,youting,nengtingdao,xingba,haole,yoa,ayao,yaoa,jixu,xuyao');
INSERT INTO `rk_tel_keyword` VALUES (145, 48, 0, '4', 'ok,不错,了解,做过,可以,听说过,听过,够了,够的,挺好,熟悉,知道,给力,继续,认可,嗯,差不多,讲,说,还不错,还好,具体点,哦,啊,哈', 'ok,bucuo,liaojie,zuoguo,keyi,tingshuoguo,tingguo,goule,goude,tinghao,shuxi,zhidao,geili,jixu,renke,,chabuduo,jiang,shuo,haibucuo,haihao,jutidian,o,a,ha');
INSERT INTO `rk_tel_keyword` VALUES (146, 48, 0, '5', '没听到,说什么,重说,再说一下,再说一次,再说一遍,没听见,很吵,听不清,听不到,什么啊,没听清,听不清楚', 'meitingdao,shuoshimo,zhongshuo,zaishuoyixia,zaishuoyici,zaishuoyibian,meitingjian,henchao,tingbuqing,tingbudao,shenmea,meitingqing,tingbuqingchu');
INSERT INTO `rk_tel_keyword` VALUES (147, 49, 0, '1', '什么,谁,多少,好多,啥子,多久,有啥,怎么,几个,哪里,那里,哪些,那些,咋个,扎个,啷个,好低嘛,好快吗', 'shenme,shui,duoshao,haoduo,shazi,duojiu,yousha,zenme,jige,nali,nali,neixie,neixie,zage,zhage,langge,haodima,haokuaima');
INSERT INTO `rk_tel_keyword` VALUES (148, 49, 0, '2', '你好,您好,会的,好吧,好的,妥妥,对的,当然,感兴趣,方便,明白,是啊,是的,晓得,有一点,有兴趣,有啊,有的,有空,没有问题,没问题,清楚,满意,你说,有听,能听到,行吧,好了,哟啊,阿吆,要啊,继续,需要', 'nihao,ninhao,huide,haoba,haode,tuotuo,duide,dangran,ganxingqu,fangbian,mingbai,shia,shide,xiaode,youyidian,youxingqu,youa,youde,youkong,meiyouwenti,meiwenti,qingchu,manyi,nishuo,youting,nengtingdao,xingba,haole,yoa,ayao,yaoa,jixu,xuyao');
INSERT INTO `rk_tel_keyword` VALUES (149, 49, 0, '4', 'ok,不错,了解,做过,可以,听说过,听过,够了,够的,挺好,熟悉,知道,给力,继续,认可,嗯,差不多,讲,说,还不错,还好,具体点,哦,啊,哈', 'ok,bucuo,liaojie,zuoguo,keyi,tingshuoguo,tingguo,goule,goude,tinghao,shuxi,zhidao,geili,jixu,renke,,chabuduo,jiang,shuo,haibucuo,haihao,jutidian,o,a,ha');
INSERT INTO `rk_tel_keyword` VALUES (150, 49, 0, '5', '没听到,说什么,重说,再说一下,再说一次,再说一遍,没听见,很吵,听不清,听不到,什么啊,没听清,听不清楚', 'meitingdao,shuoshimo,zhongshuo,zaishuoyixia,zaishuoyici,zaishuoyibian,meitingjian,henchao,tingbuqing,tingbudao,shenmea,meitingqing,tingbuqingchu');
INSERT INTO `rk_tel_keyword` VALUES (151, 50, 0, '1', '什么,谁,多少,好多,啥子,多久,有啥,怎么,几个,哪里,那里,哪些,那些,咋个,扎个,啷个,好低嘛,好快吗', 'shenme,shui,duoshao,haoduo,shazi,duojiu,yousha,zenme,jige,nali,nali,neixie,neixie,zage,zhage,langge,haodima,haokuaima');
INSERT INTO `rk_tel_keyword` VALUES (152, 50, 0, '2', '你好,您好,会的,好吧,好的,妥妥,对的,当然,感兴趣,方便,明白,是啊,是的,晓得,有一点,有兴趣,有啊,有的,有空,没有问题,没问题,清楚,满意,你说,有听,能听到,行吧,好了,哟啊,阿吆,要啊,继续,需要', 'nihao,ninhao,huide,haoba,haode,tuotuo,duide,dangran,ganxingqu,fangbian,mingbai,shia,shide,xiaode,youyidian,youxingqu,youa,youde,youkong,meiyouwenti,meiwenti,qingchu,manyi,nishuo,youting,nengtingdao,xingba,haole,yoa,ayao,yaoa,jixu,xuyao');
INSERT INTO `rk_tel_keyword` VALUES (153, 50, 0, '4', 'ok,不错,了解,做过,可以,听说过,听过,够了,够的,挺好,熟悉,知道,给力,继续,认可,嗯,差不多,讲,说,还不错,还好,具体点,哦,啊,哈', 'ok,bucuo,liaojie,zuoguo,keyi,tingshuoguo,tingguo,goule,goude,tinghao,shuxi,zhidao,geili,jixu,renke,,chabuduo,jiang,shuo,haibucuo,haihao,jutidian,o,a,ha');
INSERT INTO `rk_tel_keyword` VALUES (154, 50, 0, '5', '没听到,说什么,重说,再说一下,再说一次,再说一遍,没听见,很吵,听不清,听不到,什么啊,没听清,听不清楚', 'meitingdao,shuoshimo,zhongshuo,zaishuoyixia,zaishuoyici,zaishuoyibian,meitingjian,henchao,tingbuqing,tingbudao,shenmea,meitingqing,tingbuqingchu');
INSERT INTO `rk_tel_keyword` VALUES (155, 51, 0, '1', '什么,谁,多少,好多,啥子,多久,有啥,怎么,几个,哪里,那里,哪些,那些,咋个,扎个,啷个,好低嘛,好快吗', 'shenme,shui,duoshao,haoduo,shazi,duojiu,yousha,zenme,jige,nali,nali,neixie,neixie,zage,zhage,langge,haodima,haokuaima');
INSERT INTO `rk_tel_keyword` VALUES (156, 51, 0, '2', '你好,您好,会的,好吧,好的,妥妥,对的,当然,感兴趣,方便,明白,是啊,是的,晓得,有一点,有兴趣,有啊,有的,有空,没有问题,没问题,清楚,满意,你说,有听,能听到,行吧,好了,哟啊,阿吆,要啊,继续,需要', 'nihao,ninhao,huide,haoba,haode,tuotuo,duide,dangran,ganxingqu,fangbian,mingbai,shia,shide,xiaode,youyidian,youxingqu,youa,youde,youkong,meiyouwenti,meiwenti,qingchu,manyi,nishuo,youting,nengtingdao,xingba,haole,yoa,ayao,yaoa,jixu,xuyao');
INSERT INTO `rk_tel_keyword` VALUES (157, 51, 0, '4', 'ok,不错,了解,做过,可以,听说过,听过,够了,够的,挺好,熟悉,知道,给力,继续,认可,嗯,差不多,讲,说,还不错,还好,具体点,哦,啊,哈', 'ok,bucuo,liaojie,zuoguo,keyi,tingshuoguo,tingguo,goule,goude,tinghao,shuxi,zhidao,geili,jixu,renke,,chabuduo,jiang,shuo,haibucuo,haihao,jutidian,o,a,ha');
INSERT INTO `rk_tel_keyword` VALUES (158, 51, 0, '5', '没听到,说什么,重说,再说一下,再说一次,再说一遍,没听见,很吵,听不清,听不到,什么啊,没听清,听不清楚', 'meitingdao,shuoshimo,zhongshuo,zaishuoyixia,zaishuoyici,zaishuoyibian,meitingjian,henchao,tingbuqing,tingbudao,shenmea,meitingqing,tingbuqingchu');
INSERT INTO `rk_tel_keyword` VALUES (160, 52, 0, '1', '什么,谁,多少,好多,啥子,多久,有啥,怎么,几个,哪里,那里,哪些,那些,咋个,扎个,啷个,好低嘛,好快吗', 'shenme,shui,duoshao,haoduo,shazi,duojiu,yousha,zenme,jige,nali,nali,neixie,neixie,zage,zhage,langge,haodima,haokuaima');
INSERT INTO `rk_tel_keyword` VALUES (161, 52, 0, '2', '你好,您好,会的,好吧,好的,妥妥,对的,当然,感兴趣,方便,明白,是啊,是的,晓得,有一点,有兴趣,有啊,有的,有空,没有问题,没问题,清楚,满意,你说,有听,能听到,行吧,好了,哟啊,阿吆,要啊,继续,需要', 'nihao,ninhao,huide,haoba,haode,tuotuo,duide,dangran,ganxingqu,fangbian,mingbai,shia,shide,xiaode,youyidian,youxingqu,youa,youde,youkong,meiyouwenti,meiwenti,qingchu,manyi,nishuo,youting,nengtingdao,xingba,haole,yoa,ayao,yaoa,jixu,xuyao');
INSERT INTO `rk_tel_keyword` VALUES (162, 52, 0, '4', 'ok,不错,了解,做过,可以,听说过,听过,够了,够的,挺好,熟悉,知道,给力,继续,认可,嗯,差不多,讲,说,还不错,还好,具体点,哦,啊,哈', 'ok,bucuo,liaojie,zuoguo,keyi,tingshuoguo,tingguo,goule,goude,tinghao,shuxi,zhidao,geili,jixu,renke,,chabuduo,jiang,shuo,haibucuo,haihao,jutidian,o,a,ha');
INSERT INTO `rk_tel_keyword` VALUES (163, 52, 0, '5', '没听到,说什么,重说,再说一下,再说一次,再说一遍,没听见,很吵,听不清,听不到,什么啊,没听清,听不清楚', 'meitingdao,shuoshimo,zhongshuo,zaishuoyixia,zaishuoyici,zaishuoyibian,meitingjian,henchao,tingbuqing,tingbudao,shenmea,meitingqing,tingbuqingchu');
INSERT INTO `rk_tel_keyword` VALUES (164, 53, 0, '1', '什么,谁,多少,好多,啥子,多久,有啥,怎么,几个,哪里,那里,哪些,那些,咋个,扎个,啷个,好低嘛,好快吗', 'shenme,shui,duoshao,haoduo,shazi,duojiu,yousha,zenme,jige,nali,nali,neixie,neixie,zage,zhage,langge,haodima,haokuaima');
INSERT INTO `rk_tel_keyword` VALUES (165, 53, 0, '2', '你好,您好,会的,好吧,好的,妥妥,对的,当然,感兴趣,方便,明白,是啊,是的,晓得,有一点,有兴趣,有啊,有的,有空,没有问题,没问题,清楚,满意,你说,有听,能听到,行吧,好了,哟啊,阿吆,要啊,继续,需要', 'nihao,ninhao,huide,haoba,haode,tuotuo,duide,dangran,ganxingqu,fangbian,mingbai,shia,shide,xiaode,youyidian,youxingqu,youa,youde,youkong,meiyouwenti,meiwenti,qingchu,manyi,nishuo,youting,nengtingdao,xingba,haole,yoa,ayao,yaoa,jixu,xuyao');
INSERT INTO `rk_tel_keyword` VALUES (166, 53, 0, '4', 'ok,不错,了解,做过,可以,听说过,听过,够了,够的,挺好,熟悉,知道,给力,继续,认可,嗯,差不多,讲,说,还不错,还好,具体点,哦,啊,哈', 'ok,bucuo,liaojie,zuoguo,keyi,tingshuoguo,tingguo,goule,goude,tinghao,shuxi,zhidao,geili,jixu,renke,,chabuduo,jiang,shuo,haibucuo,haihao,jutidian,o,a,ha');
INSERT INTO `rk_tel_keyword` VALUES (167, 53, 0, '5', '没听到,说什么,重说,再说一下,再说一次,再说一遍,没听见,很吵,听不清,听不到,什么啊,没听清,听不清楚', 'meitingdao,shuoshimo,zhongshuo,zaishuoyixia,zaishuoyici,zaishuoyibian,meitingjian,henchao,tingbuqing,tingbudao,shenmea,meitingqing,tingbuqingchu');
INSERT INTO `rk_tel_keyword` VALUES (168, 54, 0, '1', '什么,谁,多少,好多,啥子,多久,有啥,怎么,几个,哪里,那里,哪些,那些,咋个,扎个,啷个,好低嘛,好快吗', 'shenme,shui,duoshao,haoduo,shazi,duojiu,yousha,zenme,jige,nali,nali,neixie,neixie,zage,zhage,langge,haodima,haokuaima');
INSERT INTO `rk_tel_keyword` VALUES (169, 54, 0, '2', '你好,您好,会的,好吧,好的,妥妥,对的,当然,感兴趣,方便,明白,是啊,是的,晓得,有一点,有兴趣,有啊,有的,有空,没有问题,没问题,清楚,满意,你说,有听,能听到,行吧,好了,哟啊,阿吆,要啊,继续,需要', 'nihao,ninhao,huide,haoba,haode,tuotuo,duide,dangran,ganxingqu,fangbian,mingbai,shia,shide,xiaode,youyidian,youxingqu,youa,youde,youkong,meiyouwenti,meiwenti,qingchu,manyi,nishuo,youting,nengtingdao,xingba,haole,yoa,ayao,yaoa,jixu,xuyao');
INSERT INTO `rk_tel_keyword` VALUES (170, 54, 0, '4', 'ok,不错,了解,做过,可以,听说过,听过,够了,够的,挺好,熟悉,知道,给力,继续,认可,嗯,差不多,讲,说,还不错,还好,具体点,哦,啊,哈', 'ok,bucuo,liaojie,zuoguo,keyi,tingshuoguo,tingguo,goule,goude,tinghao,shuxi,zhidao,geili,jixu,renke,,chabuduo,jiang,shuo,haibucuo,haihao,jutidian,o,a,ha');
INSERT INTO `rk_tel_keyword` VALUES (171, 54, 0, '5', '没听到,说什么,重说,再说一下,再说一次,再说一遍,没听见,很吵,听不清,听不到,什么啊,没听清,听不清楚', 'meitingdao,shuoshimo,zhongshuo,zaishuoyixia,zaishuoyici,zaishuoyibian,meitingjian,henchao,tingbuqing,tingbudao,shenmea,meitingqing,tingbuqingchu');
INSERT INTO `rk_tel_keyword` VALUES (172, 55, 0, '1', '什么,谁,多少,好多,啥子,多久,有啥,怎么,几个,哪里,那里,哪些,那些,咋个,扎个,啷个,好低嘛,好快吗', 'shenme,shui,duoshao,haoduo,shazi,duojiu,yousha,zenme,jige,nali,nali,neixie,neixie,zage,zhage,langge,haodima,haokuaima');
INSERT INTO `rk_tel_keyword` VALUES (173, 55, 0, '2', '你好,您好,会的,好吧,好的,妥妥,对的,当然,感兴趣,方便,明白,是啊,是的,晓得,有一点,有兴趣,有啊,有的,有空,没有问题,没问题,清楚,满意,你说,有听,能听到,行吧,好了,哟啊,阿吆,要啊,继续,需要', 'nihao,ninhao,huide,haoba,haode,tuotuo,duide,dangran,ganxingqu,fangbian,mingbai,shia,shide,xiaode,youyidian,youxingqu,youa,youde,youkong,meiyouwenti,meiwenti,qingchu,manyi,nishuo,youting,nengtingdao,xingba,haole,yoa,ayao,yaoa,jixu,xuyao');
INSERT INTO `rk_tel_keyword` VALUES (174, 55, 0, '4', 'ok,不错,了解,做过,可以,听说过,听过,够了,够的,挺好,熟悉,知道,给力,继续,认可,嗯,差不多,讲,说,还不错,还好,具体点,哦,啊,哈', 'ok,bucuo,liaojie,zuoguo,keyi,tingshuoguo,tingguo,goule,goude,tinghao,shuxi,zhidao,geili,jixu,renke,,chabuduo,jiang,shuo,haibucuo,haihao,jutidian,o,a,ha');
INSERT INTO `rk_tel_keyword` VALUES (175, 55, 0, '5', '没听到,说什么,重说,再说一下,再说一次,再说一遍,没听见,很吵,听不清,听不到,什么啊,没听清,听不清楚', 'meitingdao,shuoshimo,zhongshuo,zaishuoyixia,zaishuoyici,zaishuoyibian,meitingjian,henchao,tingbuqing,tingbudao,shenmea,meitingqing,tingbuqingchu');
INSERT INTO `rk_tel_keyword` VALUES (176, 56, 0, '1', '什么,谁,多少,好多,啥子,多久,有啥,怎么,几个,哪里,那里,哪些,那些,咋个,扎个,啷个,好低嘛,好快吗', 'shenme,shui,duoshao,haoduo,shazi,duojiu,yousha,zenme,jige,nali,nali,neixie,neixie,zage,zhage,langge,haodima,haokuaima');
INSERT INTO `rk_tel_keyword` VALUES (177, 56, 0, '2', '你好,您好,会的,好吧,好的,妥妥,对的,当然,感兴趣,方便,明白,是啊,是的,晓得,有一点,有兴趣,有啊,有的,有空,没有问题,没问题,清楚,满意,你说,有听,能听到,行吧,好了,哟啊,阿吆,要啊,继续,需要', 'nihao,ninhao,huide,haoba,haode,tuotuo,duide,dangran,ganxingqu,fangbian,mingbai,shia,shide,xiaode,youyidian,youxingqu,youa,youde,youkong,meiyouwenti,meiwenti,qingchu,manyi,nishuo,youting,nengtingdao,xingba,haole,yoa,ayao,yaoa,jixu,xuyao');
INSERT INTO `rk_tel_keyword` VALUES (178, 56, 0, '4', 'ok,不错,了解,做过,可以,听说过,听过,够了,够的,挺好,熟悉,知道,给力,继续,认可,嗯,差不多,讲,说,还不错,还好,具体点,哦,啊,哈', 'ok,bucuo,liaojie,zuoguo,keyi,tingshuoguo,tingguo,goule,goude,tinghao,shuxi,zhidao,geili,jixu,renke,,chabuduo,jiang,shuo,haibucuo,haihao,jutidian,o,a,ha');
INSERT INTO `rk_tel_keyword` VALUES (179, 56, 0, '5', '没听到,说什么,重说,再说一下,再说一次,再说一遍,没听见,很吵,听不清,听不到,什么啊,没听清,听不清楚', 'meitingdao,shuoshimo,zhongshuo,zaishuoyixia,zaishuoyici,zaishuoyibian,meitingjian,henchao,tingbuqing,tingbudao,shenmea,meitingqing,tingbuqingchu');
INSERT INTO `rk_tel_keyword` VALUES (180, 57, 0, '1', '什么,谁,多少,好多,啥子,多久,有啥,怎么,几个,哪里,那里,哪些,那些,咋个,扎个,啷个,好低嘛,好快吗', 'shenme,shui,duoshao,haoduo,shazi,duojiu,yousha,zenme,jige,nali,nali,neixie,neixie,zage,zhage,langge,haodima,haokuaima');
INSERT INTO `rk_tel_keyword` VALUES (181, 57, 0, '2', '你好,您好,会的,好吧,好的,妥妥,对的,当然,感兴趣,方便,明白,是啊,是的,晓得,有一点,有兴趣,有啊,有的,有空,没有问题,没问题,清楚,满意,你说,有听,能听到,行吧,好了,哟啊,阿吆,要啊,继续,需要', 'nihao,ninhao,huide,haoba,haode,tuotuo,duide,dangran,ganxingqu,fangbian,mingbai,shia,shide,xiaode,youyidian,youxingqu,youa,youde,youkong,meiyouwenti,meiwenti,qingchu,manyi,nishuo,youting,nengtingdao,xingba,haole,yoa,ayao,yaoa,jixu,xuyao');
INSERT INTO `rk_tel_keyword` VALUES (182, 57, 0, '4', 'ok,不错,了解,做过,可以,听说过,听过,够了,够的,挺好,熟悉,知道,给力,继续,认可,嗯,差不多,讲,说,还不错,还好,具体点,哦,啊,哈', 'ok,bucuo,liaojie,zuoguo,keyi,tingshuoguo,tingguo,goule,goude,tinghao,shuxi,zhidao,geili,jixu,renke,,chabuduo,jiang,shuo,haibucuo,haihao,jutidian,o,a,ha');
INSERT INTO `rk_tel_keyword` VALUES (183, 57, 0, '5', '没听到,说什么,重说,再说一下,再说一次,再说一遍,没听见,很吵,听不清,听不到,什么啊,没听清,听不清楚', 'meitingdao,shuoshimo,zhongshuo,zaishuoyixia,zaishuoyici,zaishuoyibian,meitingjian,henchao,tingbuqing,tingbudao,shenmea,meitingqing,tingbuqingchu');
INSERT INTO `rk_tel_keyword` VALUES (184, 58, 0, '1', '什么,谁,多少,好多,啥子,多久,有啥,怎么,几个,哪里,那里,哪些,那些,咋个,扎个,啷个,好低嘛,好快吗', 'shenme,shui,duoshao,haoduo,shazi,duojiu,yousha,zenme,jige,nali,nali,neixie,neixie,zage,zhage,langge,haodima,haokuaima');
INSERT INTO `rk_tel_keyword` VALUES (185, 58, 0, '2', '你好,您好,会的,好吧,好的,妥妥,对的,当然,感兴趣,方便,明白,是啊,是的,晓得,有一点,有兴趣,有啊,有的,有空,没有问题,没问题,清楚,满意,你说,有听,能听到,行吧,好了,哟啊,阿吆,要啊,继续,需要', 'nihao,ninhao,huide,haoba,haode,tuotuo,duide,dangran,ganxingqu,fangbian,mingbai,shia,shide,xiaode,youyidian,youxingqu,youa,youde,youkong,meiyouwenti,meiwenti,qingchu,manyi,nishuo,youting,nengtingdao,xingba,haole,yoa,ayao,yaoa,jixu,xuyao');
INSERT INTO `rk_tel_keyword` VALUES (186, 58, 0, '4', 'ok,不错,了解,做过,可以,听说过,听过,够了,够的,挺好,熟悉,知道,给力,继续,认可,嗯,差不多,讲,说,还不错,还好,具体点,哦,啊,哈', 'ok,bucuo,liaojie,zuoguo,keyi,tingshuoguo,tingguo,goule,goude,tinghao,shuxi,zhidao,geili,jixu,renke,,chabuduo,jiang,shuo,haibucuo,haihao,jutidian,o,a,ha');
INSERT INTO `rk_tel_keyword` VALUES (187, 58, 0, '5', '没听到,说什么,重说,再说一下,再说一次,再说一遍,没听见,很吵,听不清,听不到,什么啊,没听清,听不清楚', 'meitingdao,shuoshimo,zhongshuo,zaishuoyixia,zaishuoyici,zaishuoyibian,meitingjian,henchao,tingbuqing,tingbudao,shenmea,meitingqing,tingbuqingchu');
INSERT INTO `rk_tel_keyword` VALUES (188, 59, 0, '1', '什么,谁,多少,好多,啥子,多久,有啥,怎么,几个,哪里,那里,哪些,那些,咋个,扎个,啷个,好低嘛,好快吗', 'shenme,shui,duoshao,haoduo,shazi,duojiu,yousha,zenme,jige,nali,nali,neixie,neixie,zage,zhage,langge,haodima,haokuaima');
INSERT INTO `rk_tel_keyword` VALUES (189, 59, 0, '2', '你好,您好,会的,好吧,好的,妥妥,对的,当然,感兴趣,方便,明白,是啊,是的,晓得,有一点,有兴趣,有啊,有的,有空,没有问题,没问题,清楚,满意,你说,有听,能听到,行吧,好了,哟啊,阿吆,要啊,继续,需要', 'nihao,ninhao,huide,haoba,haode,tuotuo,duide,dangran,ganxingqu,fangbian,mingbai,shia,shide,xiaode,youyidian,youxingqu,youa,youde,youkong,meiyouwenti,meiwenti,qingchu,manyi,nishuo,youting,nengtingdao,xingba,haole,yoa,ayao,yaoa,jixu,xuyao');
INSERT INTO `rk_tel_keyword` VALUES (190, 59, 0, '4', 'ok,不错,了解,做过,可以,听说过,听过,够了,够的,挺好,熟悉,知道,给力,继续,认可,嗯,差不多,讲,说,还不错,还好,具体点,哦,啊,哈', 'ok,bucuo,liaojie,zuoguo,keyi,tingshuoguo,tingguo,goule,goude,tinghao,shuxi,zhidao,geili,jixu,renke,,chabuduo,jiang,shuo,haibucuo,haihao,jutidian,o,a,ha');
INSERT INTO `rk_tel_keyword` VALUES (191, 59, 0, '5', '没听到,说什么,重说,再说一下,再说一次,再说一遍,没听见,很吵,听不清,听不到,什么啊,没听清,听不清楚', 'meitingdao,shuoshimo,zhongshuo,zaishuoyixia,zaishuoyici,zaishuoyibian,meitingjian,henchao,tingbuqing,tingbudao,shenmea,meitingqing,tingbuqingchu');
INSERT INTO `rk_tel_keyword` VALUES (192, 60, 0, '1', '什么,谁,多少,好多,啥子,多久,有啥,怎么,几个,哪里,那里,哪些,那些,咋个,扎个,啷个,好低嘛,好快吗', 'shenme,shui,duoshao,haoduo,shazi,duojiu,yousha,zenme,jige,nali,nali,neixie,neixie,zage,zhage,langge,haodima,haokuaima');
INSERT INTO `rk_tel_keyword` VALUES (193, 60, 0, '2', '你好,您好,会的,好吧,好的,妥妥,对的,当然,感兴趣,方便,明白,是啊,是的,晓得,有一点,有兴趣,有啊,有的,有空,没有问题,没问题,清楚,满意,你说,有听,能听到,行吧,好了,哟啊,阿吆,要啊,继续,需要', 'nihao,ninhao,huide,haoba,haode,tuotuo,duide,dangran,ganxingqu,fangbian,mingbai,shia,shide,xiaode,youyidian,youxingqu,youa,youde,youkong,meiyouwenti,meiwenti,qingchu,manyi,nishuo,youting,nengtingdao,xingba,haole,yoa,ayao,yaoa,jixu,xuyao');
INSERT INTO `rk_tel_keyword` VALUES (194, 60, 0, '4', 'ok,不错,了解,做过,可以,听说过,听过,够了,够的,挺好,熟悉,知道,给力,继续,认可,嗯,差不多,讲,说,还不错,还好,具体点,哦,啊,哈', 'ok,bucuo,liaojie,zuoguo,keyi,tingshuoguo,tingguo,goule,goude,tinghao,shuxi,zhidao,geili,jixu,renke,,chabuduo,jiang,shuo,haibucuo,haihao,jutidian,o,a,ha');
INSERT INTO `rk_tel_keyword` VALUES (195, 60, 0, '5', '没听到,说什么,重说,再说一下,再说一次,再说一遍,没听见,很吵,听不清,听不到,什么啊,没听清,听不清楚', 'meitingdao,shuoshimo,zhongshuo,zaishuoyixia,zaishuoyici,zaishuoyibian,meitingjian,henchao,tingbuqing,tingbudao,shenmea,meitingqing,tingbuqingchu');
INSERT INTO `rk_tel_keyword` VALUES (196, 61, 0, '1', '什么,谁,多少,好多,啥子,多久,有啥,怎么,几个,哪里,那里,哪些,那些,咋个,扎个,啷个,好低嘛,好快吗', 'shenme,shui,duoshao,haoduo,shazi,duojiu,yousha,zenme,jige,nali,nali,neixie,neixie,zage,zhage,langge,haodima,haokuaima');
INSERT INTO `rk_tel_keyword` VALUES (197, 61, 0, '2', '你好,您好,会的,好吧,好的,妥妥,对的,当然,感兴趣,方便,明白,是啊,是的,晓得,有一点,有兴趣,有啊,有的,有空,没有问题,没问题,清楚,满意,你说,有听,能听到,行吧,好了,哟啊,阿吆,要啊,继续,需要', 'nihao,ninhao,huide,haoba,haode,tuotuo,duide,dangran,ganxingqu,fangbian,mingbai,shia,shide,xiaode,youyidian,youxingqu,youa,youde,youkong,meiyouwenti,meiwenti,qingchu,manyi,nishuo,youting,nengtingdao,xingba,haole,yoa,ayao,yaoa,jixu,xuyao');
INSERT INTO `rk_tel_keyword` VALUES (198, 61, 0, '4', 'ok,不错,了解,做过,可以,听说过,听过,够了,够的,挺好,熟悉,知道,给力,继续,认可,嗯,差不多,讲,说,还不错,还好,具体点,哦,啊,哈', 'ok,bucuo,liaojie,zuoguo,keyi,tingshuoguo,tingguo,goule,goude,tinghao,shuxi,zhidao,geili,jixu,renke,,chabuduo,jiang,shuo,haibucuo,haihao,jutidian,o,a,ha');
INSERT INTO `rk_tel_keyword` VALUES (199, 61, 0, '5', '没听到,说什么,重说,再说一下,再说一次,再说一遍,没听见,很吵,听不清,听不到,什么啊,没听清,听不清楚', 'meitingdao,shuoshimo,zhongshuo,zaishuoyixia,zaishuoyici,zaishuoyibian,meitingjian,henchao,tingbuqing,tingbudao,shenmea,meitingqing,tingbuqingchu');
INSERT INTO `rk_tel_keyword` VALUES (200, 62, 0, '1', '什么,谁,多少,好多,啥子,多久,有啥,怎么,几个,哪里,那里,哪些,那些,咋个,扎个,啷个,好低嘛,好快吗', 'shenme,shui,duoshao,haoduo,shazi,duojiu,yousha,zenme,jige,nali,nali,neixie,neixie,zage,zhage,langge,haodima,haokuaima');
INSERT INTO `rk_tel_keyword` VALUES (201, 62, 0, '2', '你好,您好,会的,好吧,好的,妥妥,对的,当然,感兴趣,方便,明白,是啊,是的,晓得,有一点,有兴趣,有啊,有的,有空,没有问题,没问题,清楚,满意,你说,有听,能听到,行吧,好了,哟啊,阿吆,要啊,继续,需要', 'nihao,ninhao,huide,haoba,haode,tuotuo,duide,dangran,ganxingqu,fangbian,mingbai,shia,shide,xiaode,youyidian,youxingqu,youa,youde,youkong,meiyouwenti,meiwenti,qingchu,manyi,nishuo,youting,nengtingdao,xingba,haole,yoa,ayao,yaoa,jixu,xuyao');
INSERT INTO `rk_tel_keyword` VALUES (202, 62, 0, '4', 'ok,不错,了解,做过,可以,听说过,听过,够了,够的,挺好,熟悉,知道,给力,继续,认可,嗯,差不多,讲,说,还不错,还好,具体点,哦,啊,哈', 'ok,bucuo,liaojie,zuoguo,keyi,tingshuoguo,tingguo,goule,goude,tinghao,shuxi,zhidao,geili,jixu,renke,,chabuduo,jiang,shuo,haibucuo,haihao,jutidian,o,a,ha');
INSERT INTO `rk_tel_keyword` VALUES (203, 62, 0, '5', '没听到,说什么,重说,再说一下,再说一次,再说一遍,没听见,很吵,听不清,听不到,什么啊,没听清,听不清楚', 'meitingdao,shuoshimo,zhongshuo,zaishuoyixia,zaishuoyici,zaishuoyibian,meitingjian,henchao,tingbuqing,tingbudao,shenmea,meitingqing,tingbuqingchu');
INSERT INTO `rk_tel_keyword` VALUES (204, 63, 0, '1', '什么,谁,多少,好多,啥子,多久,有啥,怎么,几个,哪里,那里,哪些,那些,咋个,扎个,啷个,好低嘛,好快吗', 'shenme,shui,duoshao,haoduo,shazi,duojiu,yousha,zenme,jige,nali,nali,neixie,neixie,zage,zhage,langge,haodima,haokuaima');
INSERT INTO `rk_tel_keyword` VALUES (205, 63, 0, '2', '你好,您好,会的,好吧,好的,妥妥,对的,当然,感兴趣,方便,明白,是啊,是的,晓得,有一点,有兴趣,有啊,有的,有空,没有问题,没问题,清楚,满意,你说,有听,能听到,行吧,好了,哟啊,阿吆,要啊,继续,需要', 'nihao,ninhao,huide,haoba,haode,tuotuo,duide,dangran,ganxingqu,fangbian,mingbai,shia,shide,xiaode,youyidian,youxingqu,youa,youde,youkong,meiyouwenti,meiwenti,qingchu,manyi,nishuo,youting,nengtingdao,xingba,haole,yoa,ayao,yaoa,jixu,xuyao');
INSERT INTO `rk_tel_keyword` VALUES (206, 63, 0, '4', 'ok,不错,了解,做过,可以,听说过,听过,够了,够的,挺好,熟悉,知道,给力,继续,认可,嗯,差不多,讲,说,还不错,还好,具体点,哦,啊,哈', 'ok,bucuo,liaojie,zuoguo,keyi,tingshuoguo,tingguo,goule,goude,tinghao,shuxi,zhidao,geili,jixu,renke,,chabuduo,jiang,shuo,haibucuo,haihao,jutidian,o,a,ha');
INSERT INTO `rk_tel_keyword` VALUES (207, 63, 0, '5', '没听到,说什么,重说,再说一下,再说一次,再说一遍,没听见,很吵,听不清,听不到,什么啊,没听清,听不清楚', 'meitingdao,shuoshimo,zhongshuo,zaishuoyixia,zaishuoyici,zaishuoyibian,meitingjian,henchao,tingbuqing,tingbudao,shenmea,meitingqing,tingbuqingchu');
INSERT INTO `rk_tel_keyword` VALUES (208, 64, 0, '1', '什么,谁,多少,好多,啥子,多久,有啥,怎么,几个,哪里,那里,哪些,那些,咋个,扎个,啷个,好低嘛,好快吗', 'shenme,shui,duoshao,haoduo,shazi,duojiu,yousha,zenme,jige,nali,nali,neixie,neixie,zage,zhage,langge,haodima,haokuaima');
INSERT INTO `rk_tel_keyword` VALUES (209, 64, 0, '2', '你好,您好,会的,好吧,好的,妥妥,对的,当然,感兴趣,方便,明白,是啊,是的,晓得,有一点,有兴趣,有啊,有的,有空,没有问题,没问题,清楚,满意,你说,有听,能听到,行吧,好了,哟啊,阿吆,要啊,继续,需要', 'nihao,ninhao,huide,haoba,haode,tuotuo,duide,dangran,ganxingqu,fangbian,mingbai,shia,shide,xiaode,youyidian,youxingqu,youa,youde,youkong,meiyouwenti,meiwenti,qingchu,manyi,nishuo,youting,nengtingdao,xingba,haole,yoa,ayao,yaoa,jixu,xuyao');
INSERT INTO `rk_tel_keyword` VALUES (210, 64, 0, '4', 'ok,不错,了解,做过,可以,听说过,听过,够了,够的,挺好,熟悉,知道,给力,继续,认可,嗯,差不多,讲,说,还不错,还好,具体点,哦,啊,哈', 'ok,bucuo,liaojie,zuoguo,keyi,tingshuoguo,tingguo,goule,goude,tinghao,shuxi,zhidao,geili,jixu,renke,,chabuduo,jiang,shuo,haibucuo,haihao,jutidian,o,a,ha');
INSERT INTO `rk_tel_keyword` VALUES (211, 64, 0, '5', '没听到,说什么,重说,再说一下,再说一次,再说一遍,没听见,很吵,听不清,听不到,什么啊,没听清,听不清楚', 'meitingdao,shuoshimo,zhongshuo,zaishuoyixia,zaishuoyici,zaishuoyibian,meitingjian,henchao,tingbuqing,tingbudao,shenmea,meitingqing,tingbuqingchu');
INSERT INTO `rk_tel_keyword` VALUES (212, 66, 0, '1', '什么,谁,多少,好多,啥子,多久,有啥,怎么,几个,哪里,那里,哪些,那些,咋个,扎个,啷个,好低嘛,好快吗', 'shenme,shui,duoshao,haoduo,shazi,duojiu,yousha,zenme,jige,nali,nali,neixie,neixie,zage,zhage,langge,haodima,haokuaima');
INSERT INTO `rk_tel_keyword` VALUES (213, 66, 0, '2', '你好,您好,会的,好吧,好的,妥妥,对的,当然,感兴趣,方便,明白,是啊,是的,晓得,有一点,有兴趣,有啊,有的,有空,没有问题,没问题,清楚,满意,你说,有听,能听到,行吧,好了,哟啊,阿吆,要啊,继续,需要', 'nihao,ninhao,huide,haoba,haode,tuotuo,duide,dangran,ganxingqu,fangbian,mingbai,shia,shide,xiaode,youyidian,youxingqu,youa,youde,youkong,meiyouwenti,meiwenti,qingchu,manyi,nishuo,youting,nengtingdao,xingba,haole,yoa,ayao,yaoa,jixu,xuyao');
INSERT INTO `rk_tel_keyword` VALUES (214, 66, 0, '4', 'ok,不错,了解,做过,可以,听说过,听过,够了,够的,挺好,熟悉,知道,给力,继续,认可,嗯,差不多,讲,说,还不错,还好,具体点,哦,啊,哈', 'ok,bucuo,liaojie,zuoguo,keyi,tingshuoguo,tingguo,goule,goude,tinghao,shuxi,zhidao,geili,jixu,renke,,chabuduo,jiang,shuo,haibucuo,haihao,jutidian,o,a,ha');
INSERT INTO `rk_tel_keyword` VALUES (215, 66, 0, '5', '没听到,说什么,重说,再说一下,再说一次,再说一遍,没听见,很吵,听不清,听不到,什么啊,没听清,听不清楚', 'meitingdao,shuoshimo,zhongshuo,zaishuoyixia,zaishuoyici,zaishuoyibian,meitingjian,henchao,tingbuqing,tingbudao,shenmea,meitingqing,tingbuqingchu');
INSERT INTO `rk_tel_keyword` VALUES (216, 67, 0, '1', '什么,谁,多少,好多,啥子,多久,有啥,怎么,几个,哪里,那里,哪些,那些,咋个,扎个,啷个,好低嘛,好快吗', 'shenme,shui,duoshao,haoduo,shazi,duojiu,yousha,zenme,jige,nali,nali,neixie,neixie,zage,zhage,langge,haodima,haokuaima');
INSERT INTO `rk_tel_keyword` VALUES (217, 67, 0, '2', '你好,您好,会的,好吧,好的,妥妥,对的,当然,感兴趣,方便,明白,是啊,是的,晓得,有一点,有兴趣,有啊,有的,有空,没有问题,没问题,清楚,满意,你说,有听,能听到,行吧,好了,哟啊,阿吆,要啊,继续,需要', 'nihao,ninhao,huide,haoba,haode,tuotuo,duide,dangran,ganxingqu,fangbian,mingbai,shia,shide,xiaode,youyidian,youxingqu,youa,youde,youkong,meiyouwenti,meiwenti,qingchu,manyi,nishuo,youting,nengtingdao,xingba,haole,yoa,ayao,yaoa,jixu,xuyao');
INSERT INTO `rk_tel_keyword` VALUES (218, 67, 0, '4', 'ok,不错,了解,做过,可以,听说过,听过,够了,够的,挺好,熟悉,知道,给力,继续,认可,嗯,差不多,讲,说,还不错,还好,具体点,哦,啊,哈', 'ok,bucuo,liaojie,zuoguo,keyi,tingshuoguo,tingguo,goule,goude,tinghao,shuxi,zhidao,geili,jixu,renke,,chabuduo,jiang,shuo,haibucuo,haihao,jutidian,o,a,ha');
INSERT INTO `rk_tel_keyword` VALUES (219, 67, 0, '5', '没听到,说什么,重说,再说一下,再说一次,再说一遍,没听见,很吵,听不清,听不到,什么啊,没听清,听不清楚', 'meitingdao,shuoshimo,zhongshuo,zaishuoyixia,zaishuoyici,zaishuoyibian,meitingjian,henchao,tingbuqing,tingbudao,shenmea,meitingqing,tingbuqingchu');
INSERT INTO `rk_tel_keyword` VALUES (220, 68, 0, '1', '什么,谁,多少,好多,啥子,多久,有啥,怎么,几个,哪里,那里,哪些,那些,咋个,扎个,啷个,好低嘛,好快吗', 'shenme,shui,duoshao,haoduo,shazi,duojiu,yousha,zenme,jige,nali,nali,neixie,neixie,zage,zhage,langge,haodima,haokuaima');
INSERT INTO `rk_tel_keyword` VALUES (221, 68, 0, '2', '你好,您好,会的,好吧,好的,妥妥,对的,当然,感兴趣,方便,明白,是啊,是的,晓得,有一点,有兴趣,有啊,有的,有空,没有问题,没问题,清楚,满意,你说,有听,能听到,行吧,好了,哟啊,阿吆,要啊,继续,需要', 'nihao,ninhao,huide,haoba,haode,tuotuo,duide,dangran,ganxingqu,fangbian,mingbai,shia,shide,xiaode,youyidian,youxingqu,youa,youde,youkong,meiyouwenti,meiwenti,qingchu,manyi,nishuo,youting,nengtingdao,xingba,haole,yoa,ayao,yaoa,jixu,xuyao');
INSERT INTO `rk_tel_keyword` VALUES (222, 68, 0, '4', 'ok,不错,了解,做过,可以,听说过,听过,够了,够的,挺好,熟悉,知道,给力,继续,认可,嗯,差不多,讲,说,还不错,还好,具体点,哦,啊,哈', 'ok,bucuo,liaojie,zuoguo,keyi,tingshuoguo,tingguo,goule,goude,tinghao,shuxi,zhidao,geili,jixu,renke,,chabuduo,jiang,shuo,haibucuo,haihao,jutidian,o,a,ha');
INSERT INTO `rk_tel_keyword` VALUES (223, 68, 0, '5', '没听到,说什么,重说,再说一下,再说一次,再说一遍,没听见,很吵,听不清,听不到,什么啊,没听清,听不清楚', 'meitingdao,shuoshimo,zhongshuo,zaishuoyixia,zaishuoyici,zaishuoyibian,meitingjian,henchao,tingbuqing,tingbudao,shenmea,meitingqing,tingbuqingchu');
INSERT INTO `rk_tel_keyword` VALUES (224, 69, 0, '1', '什么,谁,多少,好多,啥子,多久,有啥,怎么,几个,哪里,那里,哪些,那些,咋个,扎个,啷个,好低嘛,好快吗', 'shenme,shui,duoshao,haoduo,shazi,duojiu,yousha,zenme,jige,nali,nali,neixie,neixie,zage,zhage,langge,haodima,haokuaima');
INSERT INTO `rk_tel_keyword` VALUES (225, 69, 0, '2', '你好,您好,会的,好吧,好的,妥妥,对的,当然,感兴趣,方便,明白,是啊,是的,晓得,有一点,有兴趣,有啊,有的,有空,没有问题,没问题,清楚,满意,你说,有听,能听到,行吧,好了,哟啊,阿吆,要啊,继续,需要', 'nihao,ninhao,huide,haoba,haode,tuotuo,duide,dangran,ganxingqu,fangbian,mingbai,shia,shide,xiaode,youyidian,youxingqu,youa,youde,youkong,meiyouwenti,meiwenti,qingchu,manyi,nishuo,youting,nengtingdao,xingba,haole,yoa,ayao,yaoa,jixu,xuyao');
INSERT INTO `rk_tel_keyword` VALUES (226, 69, 0, '4', 'ok,不错,了解,做过,可以,听说过,听过,够了,够的,挺好,熟悉,知道,给力,继续,认可,嗯,差不多,讲,说,还不错,还好,具体点,哦,啊,哈', 'ok,bucuo,liaojie,zuoguo,keyi,tingshuoguo,tingguo,goule,goude,tinghao,shuxi,zhidao,geili,jixu,renke,,chabuduo,jiang,shuo,haibucuo,haihao,jutidian,o,a,ha');
INSERT INTO `rk_tel_keyword` VALUES (227, 69, 0, '5', '没听到,说什么,重说,再说一下,再说一次,再说一遍,没听见,很吵,听不清,听不到,什么啊,没听清,听不清楚', 'meitingdao,shuoshimo,zhongshuo,zaishuoyixia,zaishuoyici,zaishuoyibian,meitingjian,henchao,tingbuqing,tingbudao,shenmea,meitingqing,tingbuqingchu');
INSERT INTO `rk_tel_keyword` VALUES (228, 70, 0, '1', '什么,谁,多少,好多,啥子,多久,有啥,怎么,几个,哪里,那里,哪些,那些,咋个,扎个,啷个,好低嘛,好快吗', 'shenme,shui,duoshao,haoduo,shazi,duojiu,yousha,zenme,jige,nali,nali,neixie,neixie,zage,zhage,langge,haodima,haokuaima');
INSERT INTO `rk_tel_keyword` VALUES (229, 70, 0, '2', '你好,您好,会的,好吧,好的,妥妥,对的,当然,感兴趣,方便,明白,是啊,是的,晓得,有一点,有兴趣,有啊,有的,有空,没有问题,没问题,清楚,满意,你说,有听,能听到,行吧,好了,哟啊,阿吆,要啊,继续,需要', 'nihao,ninhao,huide,haoba,haode,tuotuo,duide,dangran,ganxingqu,fangbian,mingbai,shia,shide,xiaode,youyidian,youxingqu,youa,youde,youkong,meiyouwenti,meiwenti,qingchu,manyi,nishuo,youting,nengtingdao,xingba,haole,yoa,ayao,yaoa,jixu,xuyao');
INSERT INTO `rk_tel_keyword` VALUES (230, 70, 0, '4', 'ok,不错,了解,做过,可以,听说过,听过,够了,够的,挺好,熟悉,知道,给力,继续,认可,嗯,差不多,讲,说,还不错,还好,具体点,哦,啊,哈', 'ok,bucuo,liaojie,zuoguo,keyi,tingshuoguo,tingguo,goule,goude,tinghao,shuxi,zhidao,geili,jixu,renke,,chabuduo,jiang,shuo,haibucuo,haihao,jutidian,o,a,ha');
INSERT INTO `rk_tel_keyword` VALUES (231, 70, 0, '5', '没听到,说什么,重说,再说一下,再说一次,再说一遍,没听见,很吵,听不清,听不到,什么啊,没听清,听不清楚', 'meitingdao,shuoshimo,zhongshuo,zaishuoyixia,zaishuoyici,zaishuoyibian,meitingjian,henchao,tingbuqing,tingbudao,shenmea,meitingqing,tingbuqingchu');
INSERT INTO `rk_tel_keyword` VALUES (232, 71, 0, '1', '什么,谁,多少,好多,啥子,多久,有啥,怎么,几个,哪里,那里,哪些,那些,咋个,扎个,啷个,好低嘛,好快吗', 'shenme,shui,duoshao,haoduo,shazi,duojiu,yousha,zenme,jige,nali,nali,neixie,neixie,zage,zhage,langge,haodima,haokuaima');
INSERT INTO `rk_tel_keyword` VALUES (233, 71, 0, '2', '你好,您好,会的,好吧,好的,妥妥,对的,当然,感兴趣,方便,明白,是啊,是的,晓得,有一点,有兴趣,有啊,有的,有空,没有问题,没问题,清楚,满意,你说,有听,能听到,行吧,好了,哟啊,阿吆,要啊,继续,需要', 'nihao,ninhao,huide,haoba,haode,tuotuo,duide,dangran,ganxingqu,fangbian,mingbai,shia,shide,xiaode,youyidian,youxingqu,youa,youde,youkong,meiyouwenti,meiwenti,qingchu,manyi,nishuo,youting,nengtingdao,xingba,haole,yoa,ayao,yaoa,jixu,xuyao');
INSERT INTO `rk_tel_keyword` VALUES (234, 71, 0, '4', 'ok,不错,了解,做过,可以,听说过,听过,够了,够的,挺好,熟悉,知道,给力,继续,认可,嗯,差不多,讲,说,还不错,还好,具体点,哦,啊,哈', 'ok,bucuo,liaojie,zuoguo,keyi,tingshuoguo,tingguo,goule,goude,tinghao,shuxi,zhidao,geili,jixu,renke,,chabuduo,jiang,shuo,haibucuo,haihao,jutidian,o,a,ha');
INSERT INTO `rk_tel_keyword` VALUES (235, 71, 0, '5', '没听到,说什么,重说,再说一下,再说一次,再说一遍,没听见,很吵,听不清,听不到,什么啊,没听清,听不清楚', 'meitingdao,shuoshimo,zhongshuo,zaishuoyixia,zaishuoyici,zaishuoyibian,meitingjian,henchao,tingbuqing,tingbudao,shenmea,meitingqing,tingbuqingchu');
INSERT INTO `rk_tel_keyword` VALUES (236, 72, 0, '1', '什么,谁,多少,好多,啥子,多久,有啥,怎么,几个,哪里,那里,哪些,那些,咋个,扎个,啷个,好低嘛,好快吗', 'shenme,shui,duoshao,haoduo,shazi,duojiu,yousha,zenme,jige,nali,nali,neixie,neixie,zage,zhage,langge,haodima,haokuaima');
INSERT INTO `rk_tel_keyword` VALUES (237, 72, 0, '2', '你好,您好,会的,好吧,好的,妥妥,对的,当然,感兴趣,方便,明白,是啊,是的,晓得,有一点,有兴趣,有啊,有的,有空,没有问题,没问题,清楚,满意,你说,有听,能听到,行吧,好了,哟啊,阿吆,要啊,继续,需要', 'nihao,ninhao,huide,haoba,haode,tuotuo,duide,dangran,ganxingqu,fangbian,mingbai,shia,shide,xiaode,youyidian,youxingqu,youa,youde,youkong,meiyouwenti,meiwenti,qingchu,manyi,nishuo,youting,nengtingdao,xingba,haole,yoa,ayao,yaoa,jixu,xuyao');
INSERT INTO `rk_tel_keyword` VALUES (238, 72, 0, '4', 'ok,不错,了解,做过,可以,听说过,听过,够了,够的,挺好,熟悉,知道,给力,继续,认可,嗯,差不多,讲,说,还不错,还好,具体点,哦,啊,哈', 'ok,bucuo,liaojie,zuoguo,keyi,tingshuoguo,tingguo,goule,goude,tinghao,shuxi,zhidao,geili,jixu,renke,,chabuduo,jiang,shuo,haibucuo,haihao,jutidian,o,a,ha');
INSERT INTO `rk_tel_keyword` VALUES (239, 72, 0, '5', '没听到,说什么,重说,再说一下,再说一次,再说一遍,没听见,很吵,听不清,听不到,什么啊,没听清,听不清楚', 'meitingdao,shuoshimo,zhongshuo,zaishuoyixia,zaishuoyici,zaishuoyibian,meitingjian,henchao,tingbuqing,tingbudao,shenmea,meitingqing,tingbuqingchu');

-- ----------------------------
-- Table structure for rk_tel_learning
-- ----------------------------
DROP TABLE IF EXISTS `rk_tel_learning`;
CREATE TABLE `rk_tel_learning`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '被叫号码',
  `scenarios_id` int(11) NULL DEFAULT NULL COMMENT '话术场景id',
  `call_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '呼叫id',
  `content` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '待学习的内容',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 待学习 1 已学习 2忽略',
  `create_time` int(11) NOT NULL,
  `member_id` int(11) NOT NULL COMMENT 'member表里面的uid',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '呼叫问题学习' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of rk_tel_learning
-- ----------------------------
INSERT INTO `rk_tel_learning` VALUES (21, '18126152581', 67, 'e11a2f5b-4e98-473f-a557-9af27ca1b075', '4.二单。;', 0, 1536022356, 0);
INSERT INTO `rk_tel_learning` VALUES (22, '18126152581', 67, 'a91e4475-d9b0-4c8f-8bbe-0601802649fc', '2.在哪里？;', 1, 1536022489, 14138);
INSERT INTO `rk_tel_learning` VALUES (23, '13644047317', 71, 'b6dcbf94-4d43-431e-b136-bd69634a241a', '1.给你发。;', 0, 1536049985, 14071);
INSERT INTO `rk_tel_learning` VALUES (24, '18126152581', 71, '0ce08c47-2c5e-44ee-9564-317ec77df151', '1.侦查。;', 0, 1536050078, 14138);
INSERT INTO `rk_tel_learning` VALUES (25, '13644047317', 71, '06b986d8-39c2-41b6-95d3-92b76f3fdd65', '6.是这样的吧。;', 0, 1536052193, 14071);
INSERT INTO `rk_tel_learning` VALUES (26, '13644047317', 71, '06b986d8-39c2-41b6-95d3-92b76f3fdd65', '8.最近怎么办？;', 0, 1536052210, 14071);
INSERT INTO `rk_tel_learning` VALUES (27, '18126152581', 71, 'fed31a73-7d46-4bc4-a9cc-3fdd4ec5b6c0', '4.你别过不去。;', 0, 1536053321, 14138);
INSERT INTO `rk_tel_learning` VALUES (28, '18126152581', 71, '4ceb3393-5d01-477d-8d8e-f9d4c1f27987', '2.你。;', 0, 1536053422, 14138);
INSERT INTO `rk_tel_learning` VALUES (29, '18604023169', 71, '73638064-cd36-4e13-9723-a95f13bf3b15', '9.怎么可能哇？;', 0, 1536054756, 14139);
INSERT INTO `rk_tel_learning` VALUES (30, '13644047317', 71, 'b42022c8-4820-426e-8312-8ff4b6e07d50', '12.不会用。;', 0, 1536115787, 14071);
INSERT INTO `rk_tel_learning` VALUES (31, '13898153780', 71, 'e8d1dcae-a9aa-4f85-b0b2-73640e891f85', '1.我没有。;', 0, 1536115908, 14125);
INSERT INTO `rk_tel_learning` VALUES (32, '13644047317', 71, 'bbed762a-a830-467e-aac1-edcf7cf3723f', '4.干什么？;', 0, 1536201249, 14071);
INSERT INTO `rk_tel_learning` VALUES (33, '13644047317', 71, '8fe79ccb-0e45-4208-b95b-4a8ba3c2e5d0', '5.怎么会忘？;', 0, 1536201713, 14071);
INSERT INTO `rk_tel_learning` VALUES (34, '13644047317', 71, '62db85eb-e597-49a6-9b82-081ffb85d0a8', '2.我比较大。;', 0, 1536202040, 14071);

-- ----------------------------
-- Table structure for rk_tel_line
-- ----------------------------
DROP TABLE IF EXISTS `rk_tel_line`;
CREATE TABLE `rk_tel_line`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `member_id` int(11) NOT NULL,
  `dial_format` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `originate_variables` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `call_num` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of rk_tel_line
-- ----------------------------
INSERT INTO `rk_tel_line` VALUES (1, '线路-98705', '98705', 0, 'sofia/gateway/mygateway/%s', 'g729', 0, 1, '中断线路');

-- ----------------------------
-- Table structure for rk_tel_number
-- ----------------------------
DROP TABLE IF EXISTS `rk_tel_number`;
CREATE TABLE `rk_tel_number`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` int(11) NOT NULL COMMENT '0 排队中 1 意向 2 拒绝 3未接听挂断/关机/欠费',
  `duration` int(11) NOT NULL,
  `record_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `level` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '拨打结果' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for rk_tel_plan
-- ----------------------------
DROP TABLE IF EXISTS `rk_tel_plan`;
CREATE TABLE `rk_tel_plan`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL COMMENT 'admin表id',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '计划名称',
  `start` int(11) NOT NULL,
  `end` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '0  禁用 1 启用',
  `sim_id` int(11) NOT NULL COMMENT 'sim表id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '拨打计划表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rk_tel_scenarios
-- ----------------------------
DROP TABLE IF EXISTS `rk_tel_scenarios`;
CREATE TABLE `rk_tel_scenarios`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '场景名称',
  `member_id` int(11) NOT NULL COMMENT 'admin表id',
  `type` int(11) NOT NULL COMMENT '行业类型',
  `is_tpl` tinyint(4) NOT NULL COMMENT '是否是模板',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 禁用 1启用',
  `break` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否支持打断 0 支持 1不支持',
  `auditing` tinyint(4) NULL DEFAULT 0 COMMENT '0 未变更 1提交审核  2 待管理员显示审核  3不通过',
  `remark` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '备注，描述审核不通过的原因',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 73 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '场景表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rk_tel_scenarios
-- ----------------------------
INSERT INTO `rk_tel_scenarios` VALUES (15, '金融', 5556, 1, 1, 0, 0, 0, '');
INSERT INTO `rk_tel_scenarios` VALUES (72, '金融', 5570, 1, 0, 0, 0, 0, '');
INSERT INTO `rk_tel_scenarios` VALUES (71, '机器人', 5570, 7, 0, 1, 0, 0, '');
INSERT INTO `rk_tel_scenarios` VALUES (69, '金融', 5569, 1, 0, 1, 0, 0, '');
INSERT INTO `rk_tel_scenarios` VALUES (60, '房产', 5558, 3, 1, 0, 0, 0, '');
INSERT INTO `rk_tel_scenarios` VALUES (68, '测试', 5569, 3, 0, 1, 0, 0, '');
INSERT INTO `rk_tel_scenarios` VALUES (67, '测试房产', 5568, 3, 0, 1, 0, 0, '');

-- ----------------------------
-- Table structure for rk_tel_sim
-- ----------------------------
DROP TABLE IF EXISTS `rk_tel_sim`;
CREATE TABLE `rk_tel_sim`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL COMMENT '对应admin表中的id',
  `phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'sim卡号',
  `device_id` int(11) NOT NULL COMMENT 'device表id',
  `call_num` int(11) NULL DEFAULT 0 COMMENT '呼叫次数',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0 启用  1 禁用',
  `call_prefix` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '呼叫前缀',
  `position` int(11) NULL DEFAULT 0 COMMENT 'sim卡位置',
  `remark` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'sim卡表属于哪个设备下，绑定哪个话术场景' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rk_tel_sim
-- ----------------------------
INSERT INTO `rk_tel_sim` VALUES (12, 5569, '18604023169', 6, 0, 1, '01', 2, 'jushengt');
INSERT INTO `rk_tel_sim` VALUES (16, 5570, '15566159428', 6, 0, 1, '00', 0, '');

-- ----------------------------
-- Table structure for rk_tel_tsr
-- ----------------------------
DROP TABLE IF EXISTS `rk_tel_tsr`;
CREATE TABLE `rk_tel_tsr`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '坐席的号码',
  `member_id` int(11) NOT NULL,
  `times` int(11) NOT NULL DEFAULT 0 COMMENT '外呼次数',
  `succ_times` int(11) NOT NULL DEFAULT 0 COMMENT '外呼成功次数',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0 禁用 1启用',
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '座席表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rk_tel_tsr
-- ----------------------------
INSERT INTO `rk_tel_tsr` VALUES (10, '11111', 5555, 0, 0, 0, 1535390280);
INSERT INTO `rk_tel_tsr` VALUES (11, '15566159428', 5570, 0, 0, 1, 1536283334);

-- ----------------------------
-- Table structure for rk_wx_keyword
-- ----------------------------
DROP TABLE IF EXISTS `rk_wx_keyword`;
CREATE TABLE `rk_wx_keyword`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(256) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL COMMENT '关键词',
  `type` varchar(64) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL COMMENT '模块类型',
  `module_id` int(11) NOT NULL COMMENT '模块id',
  `sort` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `key`(`key`, `type`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 50 CHARACTER SET = gbk COLLATE = gbk_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rk_wx_menu
-- ----------------------------
DROP TABLE IF EXISTS `rk_wx_menu`;
CREATE TABLE `rk_wx_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `level` tinyint(1) NULL DEFAULT 1 COMMENT '菜单级别',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'name',
  `sort` int(5) NULL DEFAULT 0 COMMENT '排序',
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '0 view 1 click',
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'value',
  `token` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'token',
  `pid` int(11) NULL DEFAULT 0 COMMENT '上级菜单',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 74 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rk_wx_reply
-- ----------------------------
DROP TABLE IF EXISTS `rk_wx_reply`;
CREATE TABLE `rk_wx_reply`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `type` tinyint(4) NOT NULL COMMENT '回复类型：0关注回复 1回答不上来',
  `content_type` tinyint(4) NOT NULL COMMENT '内容类型：0文本 1图文',
  `token` varchar(64) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `create_time` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rk_wx_template
-- ----------------------------
DROP TABLE IF EXISTS `rk_wx_template`;
CREATE TABLE `rk_wx_template`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `template_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模板id',
  `template_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `content` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模板内容',
  `status` tinyint(4) NOT NULL COMMENT '状态：0不可用 1可用',
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rk_wx_template_record
-- ----------------------------
DROP TABLE IF EXISTS `rk_wx_template_record`;
CREATE TABLE `rk_wx_template_record`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tp_id` int(11) NOT NULL COMMENT '模板表中的id字段',
  `wx_id` int(11) NULL DEFAULT NULL,
  `group_id` int(11) NULL DEFAULT 0 COMMENT '粉丝组id，默认0 表示自定义，其它根据分组发送',
  `open_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '粉丝id',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '状态：0，未发送，1发送中 2，发送完成 -1 发送失败',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消息链接',
  `color` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#173177' COMMENT '模板内容字段颜色',
  `timer` datetime(0) NOT NULL,
  `create_time` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rk_wx_user
-- ----------------------------
DROP TABLE IF EXISTS `rk_wx_user`;
CREATE TABLE `rk_wx_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表id',
  `uid` int(11) NOT NULL COMMENT 'uid',
  `wxname` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公众号名称',
  `encodingaeskey` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'aeskey',
  `encode` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'encode',
  `appid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'appid',
  `appsecret` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'appsecret',
  `qr` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `wxid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公众号原始ID',
  `weixin` char(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '微信号',
  `headerpic` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '头像地址',
  `token` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'token',
  `create_time` int(11) NOT NULL COMMENT 'create_time',
  `updatetime` int(11) NOT NULL COMMENT 'updatetime',
  `type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '类型',
  `status` tinyint(4) UNSIGNED NOT NULL COMMENT '0 是停用  1是启用',
  `is_default` tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否是默认公从 0否，1是',
  `mch_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商户身份标识',
  `partnerkey` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商户权限密钥',
  `ssl_cer` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商户证书CER',
  `ssl_key` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商户证书KEY',
  `url` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公众号地址  关注地址',
  `wx_pay` tinyint(2) NOT NULL DEFAULT 0 COMMENT '微信支付 0 关闭',
  `balance_pay` tinyint(2) NOT NULL DEFAULT 0 COMMENT '0关闭',
  `cash_pay` tinyint(2) NOT NULL DEFAULT 0 COMMENT '货到付款 0关闭',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `uid_2`(`uid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '微信公共帐号' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rk_wx_user
-- ----------------------------
INSERT INTO `rk_wx_user` VALUES (36, 5570, '一呼AI', '', 0, 'wxd41ac0a36d588122', '8398e0b7f5a760214cf36d267b45cf4c', '2617', 'gh_8b52fbb63aa0', '', '', 'ijxlzu1536130942', 1536286206, 0, 4, 1, 1, '', '', '', '', '', 0, 0, 0);

-- ----------------------------
-- Event structure for ff
-- ----------------------------
DROP EVENT IF EXISTS `ff`;
delimiter ;;
CREATE EVENT `ff`
ON SCHEDULE AT '2018-08-22 17:30:00'
ON COMPLETION PRESERVE
DISABLE
DO BEGIN
	DECLARE taskId int;
	DECLARE date_list_str VARCHAR(1024);
	DECLARE week_list_str VARCHAR(100);
 	DECLARE s int default 0;
 	DECLARE is_start_task int default 1;
 	
 	DECLARE task CURSOR FOR select task_id,date_list,week_list from autodialer_timer_task;
	DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET s=1;
        
  	OPEN task;
  
  	fetch task into taskId,date_list_str,week_list_str;
  	WHILE s <> 1 DO
  	
         	SET is_start_task = 1;
				SET @count = 0;
				
				-- 按日期停止	
            SET @i=1; 
            SET @count=CHAR_LENGTH(date_list_str)-CHAR_LENGTH(REPLACE(date_list_str,',','')) + 1; 
            select @count;
            WHILE @i <= @count 
				DO
					SET @date_str = SUBSTRING_INDEX(substring_index(date_list_str,',', @i),',',-1); 
					SET @curr_date = date_format(now(),'%Y-%m-%d');
						IF @date_str = @curr_date THEN
							SET is_start_task = 0;
							SELECT is_start_task;
						END IF;
					SET @i=@i+1; 
				END WHILE;
    			
				-- 按周停止	
				IF is_start_task = 1 THEN
					SET @i=1; 
					SET @count = 0;
               SET @count=CHAR_LENGTH(week_list_str)-CHAR_LENGTH(REPLACE(week_list_str,',','')) + 1; 
               SELECT @count;
               WHILE @i <= @count 
					DO 					
						SET @week_str = SUBSTRING_INDEX(substring_index(week_list_str,',', @i),',',-1); 
						SET @curr_week = date_format(curdate(),'%W');
						IF @week_str = @curr_week THEN
							SET is_start_task = 0;
						
							SELECT is_start_task;
						END IF;
						SET @i=@i+1; 
					END WHILE;
				END IF;
			
				
				-- 判断是不是人工停止的 如果是人工停止的不做处理
				SET @status = (SELECT start from autodialer_task where uuid=taskId);
				IF @status <= 1 THEN
					update autodialer_task set `start`=is_start_task, alter_datetime=now() where uuid=taskId;
				END IF;
			
       	fetch task into taskId,date_list_str,week_list_str;
          		
		END WHILE;
  CLOSE  task;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
