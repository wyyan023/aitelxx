/*
 Navicat Premium Data Transfer

 Source Server         : rk
 Source Server Type    : MySQL
 Source Server Version : 50557
 Source Host           : 127.0.0.1:3306
 Source Schema         : yszrobot

 Target Server Type    : MySQL
 Target Server Version : 50557
 File Encoding         : 65001

 Date: 28/09/2018 16:21:10
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
  `create_datetime` datetime NOT NULL,
  `alter_datetime` datetime NULL DEFAULT NULL,
  `start` int(11) NULL DEFAULT NULL COMMENT '0 暂停 1开启 2人工暂停 3停止 -1软删除',
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
-- Table structure for autodialer_timegroup
-- ----------------------------
DROP TABLE IF EXISTS `autodialer_timegroup`;
CREATE TABLE `autodialer_timegroup`  (
  `uuid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `domain` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `member_id` int(11) NOT NULL COMMENT 'admin表id',
  PRIMARY KEY (`uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

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
-- Table structure for autodialer_timerange
-- ----------------------------
DROP TABLE IF EXISTS `autodialer_timerange`;
CREATE TABLE `autodialer_timerange`  (
  `uuid` int(11) NOT NULL AUTO_INCREMENT,
  `begin_datetime` time NOT NULL,
  `end_datetime` time NOT NULL,
  `group_uuid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `member_id` int(11) NOT NULL COMMENT 'admin表id',
  PRIMARY KEY (`uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

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
  `user_type` int(11) NULL DEFAULT 0 COMMENT '0 普通  1销售 2代理商',
  `pid` int(11) NULL DEFAULT NULL COMMENT '父id',
  `open_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ticket` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用于获取渠道二维码',
  `wxname` int(64) NULL DEFAULT NULL,
  `logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `remark` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `examine` tinyint(2) NOT NULL DEFAULT 0 COMMENT '是否需要审核？ 1是 0否',
  `index_show_tip` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否还显示用户协议提示',
  `time_price` decimal(5, 4) NULL DEFAULT NULL COMMENT '按时计费单价',
  `month_price` decimal(5, 4) NULL DEFAULT NULL COMMENT '按月计费',
  `asr_price` decimal(5, 4) NULL DEFAULT NULL COMMENT '识别计费单价',
  `credit_line` int(11) NULL DEFAULT NULL COMMENT '透支额度',
  `money` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '余额',
  `robot_cnt` int(3) NOT NULL DEFAULT 0 COMMENT '购买的机器数量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5573 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '[系统] 管理用户' ROW_FORMAT = Compact;

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
) ENGINE = MyISAM AUTO_INCREMENT = 98583 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
  `review` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否已经查看',
  `scenarios_id` int(11) NOT NULL DEFAULT 0 COMMENT '场景Id',
  `affirm_times` tinyint(4) UNSIGNED ZEROFILL NULL DEFAULT 0000 COMMENT '肯定次数',
  `negative_times` tinyint(4) UNSIGNED NULL DEFAULT 0 COMMENT '否定次数',
  `neutral_times` tinyint(4) UNSIGNED NULL DEFAULT 0 COMMENT '中性次数',
  `effective_times` tinyint(4) UNSIGNED NULL DEFAULT 0 COMMENT '有效次数',
  `hit_times` tinyint(4) UNSIGNED NULL DEFAULT 0 COMMENT '命中次数',
  `flow_label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流程标签',
  `call_times` tinyint(3) UNSIGNED NULL DEFAULT 0 COMMENT '客户说话次数',
  `semantic_label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '语义标签',
  PRIMARY KEY (`uid`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `salesman`(`salesman`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 14103 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员表' ROW_FORMAT = Dynamic;

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
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `auditor` int(11) NULL DEFAULT NULL,
  `auditor_time` datetime NULL DEFAULT NULL,
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
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pid`(`pid`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 188 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = MyISAM AUTO_INCREMENT = 2630 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 35 AVG_ROW_LENGTH = 481 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for rk_region
-- ----------------------------
DROP TABLE IF EXISTS `rk_region`;
CREATE TABLE `rk_region`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `region_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `sort` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 AVG_ROW_LENGTH = 2048 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '片区表' ROW_FORMAT = Compact;

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
  `create_time` datetime NOT NULL COMMENT '创建时间用于限制一天用户发送次数',
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
) ENGINE = MyISAM AUTO_INCREMENT = 16551 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '话单' ROW_FORMAT = Dynamic;

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
  `task_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `scenarios_id` int(11) NOT NULL COMMENT '话术场景id',
  `destination_extension` int(11) NOT NULL,
  `bridge` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '人工客服id',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 暂停 1开启 2人工暂停 3停止 4欠费 -1软删除',
  `call_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '呼叫类型 0 网关  1中继线路',
  `phone` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `robot_cnt` int(3) NOT NULL DEFAULT 0 COMMENT '并发数，不能超过admin表里面的robot_cnt数累计',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '机器人任务配置表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for rk_tel_corpus
-- ----------------------------
DROP TABLE IF EXISTS `rk_tel_corpus`;
CREATE TABLE `rk_tel_corpus`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `flow_id` int(11) NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '机器人文字',
  `audio` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机器人录音',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for rk_tel_deposit
-- ----------------------------
DROP TABLE IF EXISTS `rk_tel_deposit`;
CREATE TABLE `rk_tel_deposit`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` int(11) NOT NULL COMMENT 'admin表id',
  `menoy` float NOT NULL COMMENT '充值金额',
  `type` tinyint(4) NOT NULL COMMENT '充值类型：0现金，1短信充值',
  `status` tinyint(4) NOT NULL COMMENT '状态：0未成功;1成功',
  `create_time` datetime NOT NULL COMMENT '充值时间',
  `deposit_type` tinyint(4) NOT NULL COMMENT '充值方式;0微信，1支付宝',
  `out_trade_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `transaction_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `open_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 155 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rk_tel_device
-- ----------------------------
DROP TABLE IF EXISTS `rk_tel_device`;
CREATE TABLE `rk_tel_device`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` int(11) NULL DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '设备名称',
  `number` int(11) NOT NULL DEFAULT 0 COMMENT '设备支持数量 ',
  `dial_format` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '语音网关账号',
  `type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1 语音网关 2中继',
  `desc` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '设备表（语音网关或中继）' ROW_FORMAT = Dynamic;

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
) ENGINE = MyISAM AUTO_INCREMENT = 2324 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '流程' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rk_tel_flow_branch
-- ----------------------------
DROP TABLE IF EXISTS `rk_tel_flow_branch`;
CREATE TABLE `rk_tel_flow_branch`  (
  `id` int(11) NOT NULL,
  `flow_id` int(11) NULL DEFAULT NULL COMMENT 'flow_node表id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '节点名称',
  `keyword` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `keyword_py` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `action` tinyint(2) NULL DEFAULT 1 COMMENT '0 挂机 1 下一场景节点 2 指定场景节点 3返回当前场景节点中的话术 4 等待用户响应 5指定流程节点',
  `action_id` int(11) NULL DEFAULT NULL,
  `next_flow_id` int(11) NULL DEFAULT NULL COMMENT '下一个流程节点',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for rk_tel_flow_node
-- ----------------------------
DROP TABLE IF EXISTS `rk_tel_flow_node`;
CREATE TABLE `rk_tel_flow_node`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `scen_node_id` int(11) NULL DEFAULT NULL COMMENT 'scenarios_node表中的id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '节点名称',
  `break` tinyint(2) NULL DEFAULT NULL COMMENT '是不打断 0打断  1不允许打断',
  `type` tinyint(2) NULL DEFAULT NULL COMMENT '0 普通节点 1跳转节点 2问答节点',
  `keyword` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '关键字用英语逗号分隔',
  `keyword_py` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '拼音关键字用英语逗号分隔',
  `action` tinyint(2) NULL DEFAULT 1 COMMENT '0 挂机 1 下一场景节点 2 指定场景节点 3返回当前场景节点中的话术 4 等待用户响应 5指定场景节点',
  `action_id` int(11) NULL DEFAULT NULL,
  `intention` tinyint(2) NULL DEFAULT 0 COMMENT '意向等级 默认为0不需要，大于0对应意向规则表level',
  `last_time` int(11) NULL DEFAULT NULL COMMENT '最后更新时间',
  `scenarios_id` int(11) NULL DEFAULT NULL,
  `flow_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流程标签',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

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
  `break` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0 不打断 1打断',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `scenarios_id`(`scenarios_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1956 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '流程' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rk_tel_intention_rule
-- ----------------------------
DROP TABLE IF EXISTS `rk_tel_intention_rule`;
CREATE TABLE `rk_tel_intention_rule`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `scenarios_id` int(11) NULL DEFAULT NULL COMMENT '0 是模板',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规则名称',
  `level` int(4) NULL DEFAULT NULL COMMENT '意向等级',
  `type` tinyint(2) NULL DEFAULT 0 COMMENT '默认意向等级 0 不是 1是  3是模板',
  `rule` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '规则',
  `sort` int(4) NULL DEFAULT 0 COMMENT '排序',
  `status` tinyint(2) NULL DEFAULT NULL COMMENT '0 正常 1有改动',
  `create_time` int(11) NULL DEFAULT NULL,
  `update_time` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 173 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 296 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for rk_tel_label
-- ----------------------------
DROP TABLE IF EXISTS `rk_tel_label`;
CREATE TABLE `rk_tel_label`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NULL DEFAULT NULL COMMENT 'admin表id',
  `label` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签名',
  `keyword` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关键字，多个之前用“;\"分隔',
  `flow_id` int(11) NULL DEFAULT NULL COMMENT '标签所属流程id',
  `type` tinyint(2) UNSIGNED NULL DEFAULT 0 COMMENT '0 语义标签 1流程标签',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 60 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '呼叫问题学习' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for rk_tel_line
-- ----------------------------
DROP TABLE IF EXISTS `rk_tel_line`;
CREATE TABLE `rk_tel_line`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `member_id` int(11) NOT NULL,
  `inter_ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '接口ip端口',
  `dial_format` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '呼叫格式',
  `call_prefix` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '呼叫前缀',
  `gateway` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '网关名称',
  `type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 不需要验证 1需要用户密码验证',
  `originate_variables` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '语音编码',
  `call_num` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for rk_tel_order
-- ----------------------------
DROP TABLE IF EXISTS `rk_tel_order`;
CREATE TABLE `rk_tel_order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` int(11) NULL DEFAULT NULL COMMENT 'admin表id',
  `member_id` int(11) NULL DEFAULT NULL COMMENT 'member表uid',
  `mobile` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT 'member表mobile 被叫号码 ',
  `money` decimal(5, 2) NULL DEFAULT NULL COMMENT '消费金额',
  `duration` int(11) NULL DEFAULT NULL COMMENT '通话时间长',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `month_price` decimal(10, 4) NULL DEFAULT NULL COMMENT '按费用',
  `asr_price` decimal(10, 4) NULL DEFAULT NULL COMMENT '识别单价',
  `asr_cnt` int(5) NULL DEFAULT NULL COMMENT '识别次数',
  `time_price` decimal(10, 4) NULL DEFAULT NULL COMMENT '按时长单价',
  `end_time` int(11) NULL DEFAULT NULL COMMENT '结束时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

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
  `update_time` int(12) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 87 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '场景表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rk_tel_scenarios_node
-- ----------------------------
DROP TABLE IF EXISTS `rk_tel_scenarios_node`;
CREATE TABLE `rk_tel_scenarios_node`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `scenarios_id` int(11) NULL DEFAULT NULL COMMENT '场景id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流程节点名称',
  `sort` int(5) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

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
) ENGINE = MyISAM AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'sim卡表属于哪个设备下，绑定哪个话术场景' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

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
  `create_time` datetime NOT NULL,
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
  `timer` datetime NOT NULL,
  `create_time` datetime NOT NULL,
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
