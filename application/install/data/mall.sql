-- phpMyAdmin SQL Dump
-- version phpStudy 2014
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2017-05-17 11:17
-- 服务器版本: 5.5.38
-- PHP 版本: 5.5.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `ruikecms`
--

-- --------------------------------------------------------

--
-- 表的结构 `ruike_action`
--

CREATE TABLE IF NOT EXISTS `ruike_action` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '行为唯一标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '行为说明',
  `remark` char(140) NOT NULL DEFAULT '' COMMENT '行为描述',
  `rule` text COMMENT '行为规则',
  `log` text COMMENT '日志规则',
  `type` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统行为表' AUTO_INCREMENT=13 ;

-- --------------------------------------------------------

--
-- 表的结构 `ruike_action_log`
--

CREATE TABLE IF NOT EXISTS `ruike_action_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `action_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '行为id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行用户id',
  `action_ip` bigint(20) NOT NULL COMMENT '执行行为者ip',
  `model` varchar(50) NOT NULL DEFAULT '' COMMENT '触发行为的表',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '触发行为的数据id',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '日志备注',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行行为的时间',
  PRIMARY KEY (`id`),
  KEY `action_ip_ix` (`action_ip`),
  KEY `action_id_ix` (`action_id`),
  KEY `user_id_ix` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='行为日志表' AUTO_INCREMENT=147 ;

-- --------------------------------------------------------

--
-- 表的结构 `ruike_ad`
--

CREATE TABLE IF NOT EXISTS `ruike_ad` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `place_id` int(11) DEFAULT NULL COMMENT '广告位ID',
  `title` varchar(150) DEFAULT NULL COMMENT '广告名称',
  `cover_id` int(11) DEFAULT NULL COMMENT '广告图片',
  `photolist` varchar(20) NOT NULL COMMENT '辅助图片',
  `url` varchar(150) DEFAULT NULL COMMENT '广告链接',
  `listurl` varchar(255) DEFAULT NULL COMMENT '辅助链接',
  `background` varchar(150) DEFAULT NULL COMMENT '广告背景',
  `content` text COMMENT '广告描述',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '广告状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='广告表' AUTO_INCREMENT=14 ;

--
-- 转存表中的数据 `ruike_ad`
--

INSERT INTO `ruike_ad` (`id`, `place_id`, `title`, `cover_id`, `photolist`, `url`, `listurl`, `background`, `content`, `create_time`, `update_time`, `status`) VALUES
(12, 37, 'APP下载', 349, '', '', '', '', '', 1491018548, 1491409380, 1),
(13, 38, '商城底部', 350, '', '', '', '', '', 1491409343, 1491409358, 1);

-- --------------------------------------------------------

--
-- 表的结构 `ruike_addons`
--

CREATE TABLE IF NOT EXISTS `ruike_addons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL COMMENT '插件名或标识',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '中文名',
  `description` text COMMENT '插件描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `config` text COMMENT '配置',
  `author` varchar(40) DEFAULT '' COMMENT '作者',
  `version` varchar(20) DEFAULT '' COMMENT '版本号',
  `isinstall` int(10) DEFAULT '0' COMMENT '是否安装',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `has_adminlist` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有后台列表',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='插件表' AUTO_INCREMENT=11 ;

-- --------------------------------------------------------

--
-- 表的结构 `ruike_ad_place`
--

CREATE TABLE IF NOT EXISTS `ruike_ad_place` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(150) DEFAULT NULL COMMENT '广告位名称',
  `name` varchar(20) NOT NULL COMMENT '调用名称',
  `show_type` int(11) NOT NULL DEFAULT '5' COMMENT '广告位类型',
  `show_num` int(11) NOT NULL DEFAULT '5' COMMENT '显示条数',
  `start_time` int(11) NOT NULL DEFAULT '0' COMMENT '开始时间',
  `end_time` int(11) NOT NULL DEFAULT '0' COMMENT '结束时间',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `template` varchar(150) DEFAULT NULL COMMENT '广告位模板',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '广告位状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='广告位表' AUTO_INCREMENT=39 ;

--
-- 转存表中的数据 `ruike_ad_place`
--

INSERT INTO `ruike_ad_place` (`id`, `title`, `name`, `show_type`, `show_num`, `start_time`, `end_time`, `create_time`, `update_time`, `template`, `status`) VALUES
(37, '商城首页幻灯片', 'mall_top', 1, 0, 1491018530, 1628826350, 1491018534, 1491409372, '', 1),
(38, '商城首页底部', 'mall_bottom', 1, 0, 1491409219, 1491409219, 1491409255, 1491409366, '', 1);

-- --------------------------------------------------------

--
-- 表的结构 `ruike_apply_device`
--

CREATE TABLE IF NOT EXISTS `ruike_apply_device` (
  `applyId` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `apply_id` varchar(100) NOT NULL DEFAULT '' COMMENT '申请设备ID时所返回的批次ID',
  `audit_status` tinyint(1) DEFAULT '1' COMMENT '审核状态。',
  `apply_time` int(10) unsigned DEFAULT NULL COMMENT '提交申请的时间戳',
  `device_id` int(10) DEFAULT NULL COMMENT '设备id',
  `audit_comment` varchar(255) DEFAULT NULL,
  `audit_time` int(10) DEFAULT '0' COMMENT '确定审核结果的时间戳，若状态为审核中，则该时间值为0',
  PRIMARY KEY (`applyId`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

-- --------------------------------------------------------

--
-- 表的结构 `ruike_attachment`
--

CREATE TABLE IF NOT EXISTS `ruike_attachment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '附件显示名',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件类型',
  `source` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '资源ID',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关联记录ID',
  `download` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '附件大小',
  `dir` int(12) unsigned NOT NULL DEFAULT '0' COMMENT '上级目录ID',
  `sort` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `idx_record_status` (`record_id`,`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ruike_attribute`
--

CREATE TABLE IF NOT EXISTS `ruike_attribute` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '字段名',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '字段注释',
  `length` varchar(100) NOT NULL DEFAULT '' COMMENT '字段定义',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT '数据类型',
  `value` varchar(100) NOT NULL DEFAULT '' COMMENT '字段默认值',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '备注',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '参数',
  `model_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '模型id',
  `is_must` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否必填',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `validate_rule` varchar(255) NOT NULL DEFAULT '',
  `validate_time` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `error_info` varchar(100) NOT NULL DEFAULT '',
  `validate_type` varchar(25) NOT NULL DEFAULT '',
  `auto_rule` varchar(100) NOT NULL DEFAULT '',
  `auto_time` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `auto_type` varchar(25) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `model_id` (`model_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='模型属性表' AUTO_INCREMENT=56 ;

-- --------------------------------------------------------

--
-- 表的结构 `ruike_auth_extend`
--

CREATE TABLE IF NOT EXISTS `ruike_auth_extend` (
  `group_id` mediumint(10) unsigned NOT NULL COMMENT '用户id',
  `extend_id` mediumint(8) unsigned NOT NULL COMMENT '扩展表中数据的id',
  `type` tinyint(1) unsigned NOT NULL COMMENT '扩展类型标识 1:栏目分类权限;2:模型权限',
  UNIQUE KEY `group_extend_type` (`group_id`,`extend_id`,`type`),
  KEY `uid` (`group_id`),
  KEY `group_id` (`extend_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户组与分类的对应关系表';

-- --------------------------------------------------------

--
-- 表的结构 `ruike_auth_group`
--

CREATE TABLE IF NOT EXISTS `ruike_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组id,自增主键',
  `module` varchar(20) NOT NULL DEFAULT '' COMMENT '用户组所属模块',
  `type` varchar(10) NOT NULL DEFAULT '' COMMENT '组类型',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '用户组中文名称',
  `description` varchar(80) NOT NULL DEFAULT '' COMMENT '描述信息',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户组状态：为1正常，为0禁用,-1为删除',
  `rules` varchar(500) NOT NULL DEFAULT '' COMMENT '用户组拥有的规则id，多个规则 , 隔开',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- 表的结构 `ruike_auth_group_access`
--

CREATE TABLE IF NOT EXISTS `ruike_auth_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `group_id` mediumint(8) unsigned NOT NULL COMMENT '用户组id',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ruike_auth_rule`
--

CREATE TABLE IF NOT EXISTS `ruike_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1-url;2-主菜单',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `group` char(20) NOT NULL DEFAULT '' COMMENT '权限节点分组',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  KEY `module` (`module`,`status`,`type`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=35 ;

-- --------------------------------------------------------

--
-- 表的结构 `ruike_card`
--

CREATE TABLE IF NOT EXISTS `ruike_card` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `card_type` varchar(24) NOT NULL COMMENT '优惠卷类型:GROUPON CASH DISCOUNT GIFT GENERAL_COUPON',
  `code_type` tinyint(4) NOT NULL COMMENT '1 二维码，2 一维码',
  `color` varchar(16) NOT NULL COMMENT '优惠卷背景颜色',
  `title` varchar(64) NOT NULL,
  `sub_title` varchar(64) NOT NULL,
  `description` varchar(1024) NOT NULL,
  `quantity` int(11) NOT NULL COMMENT '优惠卷总数量',
  `discount` float NOT NULL COMMENT '优惠卷折扣',
  `condition` varchar(1024) DEFAULT NULL COMMENT '代金券抵扣条件',
  `type` tinyint(2) NOT NULL COMMENT '优惠使用时间的类型 1日期区间 2固定时长（自领取后按天算',
  `begin_time` datetime NOT NULL COMMENT '优惠卷起用时间',
  `end_time` datetime NOT NULL COMMENT '优惠卷停用时间',
  `fixed_term` int(11) NOT NULL COMMENT '自领取后多少天内有效',
  `fixed_begin_term` int(11) NOT NULL COMMENT '自领取后多少天开始生效',
  `status` tinyint(4) NOT NULL COMMENT '0 禁用 1开启',
  `operation_tips` varchar(20) NOT NULL,
  `detail` text NOT NULL COMMENT '优惠卷详情',
  `service_phone` varchar(32) NOT NULL COMMENT '商家电话',
  `location_id_list` varchar(1024) DEFAULT NULL COMMENT '设置该卡券的适用门店 json类型，没有门店可以为空',
  `use_all_locations` tinyint(1) NOT NULL COMMENT '是否所有门店通用',
  `get_limit` int(11) NOT NULL COMMENT '每人可领券的数量限制',
  `can_share` tinyint(1) NOT NULL COMMENT '是否允许分享0，不允许，1允许',
  `oper_id` int(11) NOT NULL COMMENT '操作人',
  `create_time` datetime NOT NULL,
  `last_update_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='优惠卷表' AUTO_INCREMENT=38 ;

-- --------------------------------------------------------

--
-- 表的结构 `ruike_card_code`
--

CREATE TABLE IF NOT EXISTS `ruike_card_code` (
  `card_id` varchar(32) NOT NULL COMMENT '优惠卷id',
  `code` varchar(32) NOT NULL COMMENT '优惠卷编号',
  `status` tinyint(4) NOT NULL COMMENT '0 未领取 1已领取 2已核销',
  `member_id` int(11) DEFAULT NULL COMMENT '领卷用户id',
  `openid` varchar(32) DEFAULT NULL COMMENT '领卷人的openid',
  `receive_people` varchar(32) DEFAULT NULL COMMENT '领卷人',
  `receive_time` datetime DEFAULT NULL COMMENT '领卷时间',
  `auditor` varchar(32) DEFAULT NULL COMMENT '核销人',
  `auditor_time` datetime DEFAULT NULL COMMENT '核销时间',
  PRIMARY KEY (`code`),
  KEY `card_id` (`card_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ruike_category`
--

CREATE TABLE IF NOT EXISTS `ruike_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `name` varchar(30) NOT NULL COMMENT '标志',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `list_row` tinyint(3) unsigned NOT NULL DEFAULT '10' COMMENT '列表每页行数',
  `meta_title` varchar(50) NOT NULL DEFAULT '' COMMENT 'SEO的网页标题',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `template_index` varchar(100) NOT NULL DEFAULT '' COMMENT '频道页模板',
  `template_lists` varchar(100) NOT NULL DEFAULT '' COMMENT '列表页模板',
  `template_detail` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页模板',
  `template_edit` varchar(100) NOT NULL DEFAULT '' COMMENT '编辑页模板',
  `model` varchar(100) NOT NULL DEFAULT '' COMMENT '列表绑定模型',
  `model_sub` varchar(100) NOT NULL DEFAULT '' COMMENT '子文档绑定模型',
  `type` varchar(100) NOT NULL DEFAULT '' COMMENT '允许发布的内容类型',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '外链',
  `allow_publish` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许发布内容',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '可见性',
  `reply` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许回复',
  `check` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '发布的文章是否需要审核',
  `reply_model` varchar(100) NOT NULL DEFAULT '',
  `extend` text COMMENT '扩展设置',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  `icon` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类图标',
  `groups` varchar(255) NOT NULL DEFAULT '' COMMENT '分组定义',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='分类表' AUTO_INCREMENT=14 ;

-- --------------------------------------------------------

--
-- 表的结构 `ruike_channel`
--

CREATE TABLE IF NOT EXISTS `ruike_channel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '频道ID',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级频道ID',
  `title` char(30) NOT NULL COMMENT '频道标题',
  `url` char(100) NOT NULL COMMENT '频道连接',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '导航排序',
  `icon` varchar(20) DEFAULT NULL COMMENT '图标',
  `color` varchar(20) DEFAULT NULL COMMENT '导航颜色',
  `band_color` varchar(20) DEFAULT NULL COMMENT '标识点颜色',
  `band_text` varchar(30) DEFAULT NULL COMMENT '标志点文字',
  `active` char(100) NOT NULL DEFAULT '' COMMENT '当前链接',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `target` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '新窗口打开',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

-- --------------------------------------------------------

--
-- 表的结构 `ruike_config`
--

CREATE TABLE IF NOT EXISTS `ruike_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '配置名称',
  `type` varchar(10) NOT NULL DEFAULT 'text' COMMENT '配置类型',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '配置说明',
  `group` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置分组',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '配置值',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '配置说明',
  `icon` varchar(50) NOT NULL DEFAULT '' COMMENT '小图标',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `value` text COMMENT '配置值',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `group` (`group`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=43 ;

--
-- 转存表中的数据 `ruike_config`
--

INSERT INTO `ruike_config` (`id`, `name`, `type`, `title`, `group`, `extra`, `remark`, `icon`, `create_time`, `update_time`, `status`, `value`, `sort`) VALUES
(42, 'PRINT_PORT', 'text', '打印接口', 0, '', '打印订单时用到', '', 0, 0, 1, '8000', 0);

-- --------------------------------------------------------

--
-- 表的结构 `ruike_content`
--

CREATE TABLE IF NOT EXISTS `ruike_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '标题',
  `author` varchar(30) NOT NULL COMMENT '作者',
  `category_id` int(10) unsigned NOT NULL COMMENT '所属分类',
  `description` char(140) NOT NULL DEFAULT '' COMMENT '描述',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '类别，区分到底是图文还是视频。 1是图文，2是视频',
  `position` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '推荐位',
  `external_link` varchar(30) NOT NULL DEFAULT '0' COMMENT '外链',
  `cover_id` int(10) unsigned DEFAULT NULL COMMENT '封面',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '可见性',
  `deadline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '截至时间',
  `view` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '浏览量',
  `comment` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `level` int(10) NOT NULL DEFAULT '0' COMMENT '优先级',
  `is_top` int(2) NOT NULL DEFAULT '0' COMMENT '是否置顶  1是置顶，0是不置顶',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  `video_link` varchar(256) DEFAULT NULL COMMENT '视频链接地址',
  `praise` int(10) NOT NULL DEFAULT '0' COMMENT '点赞数',
  `keyword` varchar(256) DEFAULT NULL COMMENT '关键字，自动应答的关键词回复。',
  `is_share` tinyint(4) unsigned NOT NULL COMMENT '是否允许分享',
  PRIMARY KEY (`id`),
  KEY `idx_category_status` (`category_id`,`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='文档模型基础表' AUTO_INCREMENT=48 ;

--
-- 转存表中的数据 `ruike_content`
--

INSERT INTO `ruike_content` (`id`, `uid`, `title`, `author`, `category_id`, `description`, `type`, `position`, `external_link`, `cover_id`, `display`, `deadline`, `view`, `comment`, `level`, `is_top`, `create_time`, `update_time`, `status`, `video_link`, `praise`, `keyword`, `is_share`) VALUES
(47, 1, 'adsf', '', 0, '', 1, 1, '', 0, 0, 1491018269, 12, 1, 1, 1, 1491018269, 1491018291, 0, '', 1, '', 0),
(35, 1, ' 五一小长假,移动、联通、电信流量免费领，最高可领8G！\n', '手掌流量宝', 12, ' 五一小长假,移动、联通、电信流量免费领，最高可领8G！', 1, 2, 'http://www.qq.com/', 0, 1, 1513632300, 812, 55, 8, 0, 1492236859, 1489998892, 0, NULL, 24, '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `ruike_content_comment`
--

CREATE TABLE IF NOT EXISTS `ruike_content_comment` (
  `comment_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论id',
  `content_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `email` varchar(60) NOT NULL DEFAULT '' COMMENT 'email邮箱',
  `username` varchar(60) NOT NULL DEFAULT '' COMMENT '用户名',
  `content` text NOT NULL COMMENT '评论内容',
  `deliver_rank` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '物流评价等级',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `ip_address` varchar(15) NOT NULL DEFAULT '' COMMENT 'ip地址',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否显示',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论用户',
  `img` text COMMENT '晒单图片',
  `service_rank` tinyint(1) DEFAULT NULL COMMENT '商家服务态度评价等级',
  PRIMARY KEY (`comment_id`),
  KEY `parent_id` (`parent_id`),
  KEY `id_value` (`content_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=343 ;

-- --------------------------------------------------------

--
-- 表的结构 `ruike_content_detail`
--

CREATE TABLE IF NOT EXISTS `ruike_content_detail` (
  `doc_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `content` text,
  `tags` varchar(20) DEFAULT NULL COMMENT '标签，就是搜索引擎要的关键字。',
  PRIMARY KEY (`doc_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='文章' AUTO_INCREMENT=48 ;

--
-- 转存表中的数据 `ruike_content_detail`
--

INSERT INTO `ruike_content_detail` (`doc_id`, `content`, `tags`) VALUES
(47, '', ''),
(35, '                  \r\n                       \r\n                        \r\n\r\n                        \r\n                        \r\n                        <p style="margin-top: 0px; margin-bottom: 0px; line-height: 1.75em; white-space: normal; text-align: center;"><span style="color: rgb(0, 176, 80);"><strong>马上“劳动节”小长假来袭，你“激动”了吗？</strong></span></p><p style="margin-top: 0px; margin-bottom: 0px; line-height: 1.75em; white-space: normal; text-align: center;"><img class="__bg_gif" data-src="https://mmbiz.qlogo.cn/mmbiz/5htKlPqMNRBwWaQa2vcK6JWr59MBibtcCTaD9CJg4PXA3bhMlSYj67cQWcicsMCM5oLsI89LibUBhibiaxBIYwIiaibTg/0?wx_fmt=gif&amp;wx_lazy=1" style="line-height: 25.6px; width: auto !important; visibility: visible !important; height: auto !important;" data-order="0" src="/application/wap/static/wxactivity/images/4.gif" data-fail="0"><img class="__bg_gif" data-src="https://mmbiz.qlogo.cn/mmbiz/5htKlPqMNRBwWaQa2vcK6JWr59MBibtcCTaD9CJg4PXA3bhMlSYj67cQWcicsMCM5oLsI89LibUBhibiaxBIYwIiaibTg/0?wx_fmt=gif&amp;wx_lazy=1" style="line-height: 25.6px; text-align: center; white-space: normal; width: auto !important; visibility: visible !important; height: auto !important;" data-order="1" src="/application/wap/static/wxactivity/images/4.gif" data-fail="0"><img class="__bg_gif" data-src="https://mmbiz.qlogo.cn/mmbiz/5htKlPqMNRBwWaQa2vcK6JWr59MBibtcCTaD9CJg4PXA3bhMlSYj67cQWcicsMCM5oLsI89LibUBhibiaxBIYwIiaibTg/0?wx_fmt=gif&amp;wx_lazy=1" style="line-height: 25.6px; text-align: center; white-space: normal; width: auto !important; visibility: visible !important; height: auto !important;" data-order="2" src="/application/wap/static/wxactivity/images/4.gif" data-fail="0"></p><p style="margin-top: 0px; margin-bottom: 0px; line-height: 1.75em; white-space: normal; text-align: center;"><span style="color: rgb(0, 176, 240);"><strong>劳动节期间高速免费通行时间<strong style="color: rgb(0, 176, 240); line-height: 25.6000003814697px; white-space: normal;">为</strong></strong></span></p><p style="margin-top: 0px; margin-bottom: 0px; line-height: 1.75em; white-space: normal; text-align: center;"><span style="color: rgb(0, 176, 240);"><strong>4月29日0时至5月1日24时，共三天</strong></span></p><p style="margin-top: 0px; margin-bottom: 0px; line-height: 1.75em; white-space: normal; text-align: center;"><span style="color: rgb(0, 176, 240);"><strong>如此好时光，你计划好了没？</strong></span></p><p style="margin-top: 0px; margin-bottom: 0px; line-height: 25.6px; white-space: normal; text-align: center;"><img class="__bg_gif" data-src="https://mmbiz.qlogo.cn/mmbiz/5htKlPqMNRBwWaQa2vcK6JWr59MBibtcCQPy6xBc5TGRHfQBNRLgichNW0jyf2P7HWzhibpBBP6gTo0YwMMiaF8EzQ/0?wx_fmt=gif&amp;wx_lazy=1" style="width: auto !important; visibility: visible !important; height: auto !important;" data-order="3" src="/application/wap/static/wxactivity/images/1.gif" data-fail="0"><br></p><section class=""><p style="margin-top: 0px; margin-bottom: 0px; line-height: 1.75em; text-align: center;"><span style="color: rgb(0, 176, 80);"><strong>出去旅行，什么最要紧？<br style="color: inherit;">风景还是美食？</strong></span></p><p style="margin-top: 0px; margin-bottom: 0px; line-height: 1.75em; text-align: center;"><span style="color: rgb(0, 176, 240);"><strong>都不是！是发朋友圈！<br></strong></span></p><p style="margin-top: 0px; margin-bottom: 0px; line-height: 1.75em; text-align: center;"><span style="color: rgb(0, 176, 240);"><strong>不发个朋友圈，都不好意思说自己出去玩过了</strong></span></p><p style="margin-top: 0px; margin-bottom: 0px; line-height: 25.6px; text-align: center;"><img data-src="https://mmbiz.qlogo.cn/mmbiz/VEwWdPBveWbJj6fMq5LPWr9lg48FzJIKHcicYTercz0bs0wYNiceNZO69rwicF1saW5fwqPTDGOIIv8fxy1fpbjQg/0?wx_fmt=gif&amp;wx_lazy=1" style="visibility: visible !important; height: auto !important; width: auto !important;" class=" __bg_gif" data-order="4" src="/application/wap/static/wxactivity/images/3.gif" data-fail="0"><img data-src="https://mmbiz.qlogo.cn/mmbiz/VEwWdPBveWbJj6fMq5LPWr9lg48FzJIKHcicYTercz0bs0wYNiceNZO69rwicF1saW5fwqPTDGOIIv8fxy1fpbjQg/0?wx_fmt=gif&amp;wx_lazy=1" style="visibility: visible !important; height: auto !important; width: auto !important;" class=" __bg_gif" data-order="5" src="/application/wap/static/wxactivity/images/3.gif" data-fail="0"><img data-src="https://mmbiz.qlogo.cn/mmbiz/VEwWdPBveWbJj6fMq5LPWr9lg48FzJIKHcicYTercz0bs0wYNiceNZO69rwicF1saW5fwqPTDGOIIv8fxy1fpbjQg/0?wx_fmt=gif&amp;wx_lazy=1" style="visibility: visible !important; height: auto !important; width: auto !important;" class=" __bg_gif" data-order="6" src="/application/wap/static/wxactivity/images/3.gif" data-fail="0"></p><p style="margin-top: 0px; margin-bottom: 0px; line-height: 25.6px; text-align: center;"><span style="font-size: 14px;">但…</span></p><p style="margin-top: 0px; margin-bottom: 0px; line-height: 25.6px; text-align: center;">重要的是</p><p style="margin-top: 0px; margin-bottom: 0px; line-height: 25.6px; text-align: center;"><span style="color: rgb(255, 79, 121); font-size: 24px;"><strong>没流量怎么刷朋友圈</strong></span></p></section><p style="text-align: center;"><img class="__bg_gif" data-src="https://mmbiz.qlogo.cn/mmbiz_gif/nhoibAJIWpJgBC29yYrO4pYGaj9n1wJ9CAAyrb1NGV45dib3yG74ibmFHHpqI8KnSkVwP3JMhIphgyAqHmfZNHX7Q/0?wx_fmt=gif&amp;wx_lazy=1" style="color: rgb(89, 89, 89); font-family: 微软雅黑; font-size: 14px; line-height: 22.4px; text-align: center; white-space: normal; width: auto !important; visibility: visible !important; height: auto !important;" data-order="7" src="/application/wap/static/wxactivity/images/2.gif" data-fail="0"></p><section class=""><section class=""><section class=""><p style="margin-top: 0px; margin-bottom: 0px; text-align: center;"><span style="color: rgb(255, 79, 121); font-size: 24px;"><strong>别担心，往下看！</strong></span></p><p style="margin-top: 0px; margin-bottom: 0px; text-align: center;">☟☟☟</p></section></section></section><p style="margin-top: 0px; margin-bottom: 0px; line-height: 25.6px; white-space: normal; text-align: center;"><img data-src="https://mmbiz.qlogo.cn/mmbiz_gif/GOfNYjlspQRecjRx5ibR0GBqvJW94gzuyGeicWyM98StXOiaSb7E95vI6VnXZDFOpEL6gwIAkYIWQOsq6PRtSwjiag/0?wx_fmt=gif" style="visibility: visible !important; height: auto !important; width: auto !important;" class=" __bg_gif" data-order="8" src="/application/wap/static/wxactivity/images/0.gif" data-fail="0"></p><section class="" label="Copyright © 2015 Yead All Rights Reserved." style="font-family: 微软雅黑; line-height: 25.6px; white-space: normal;"><section style="margin: 1em auto; border-style: none;"><span style="margin-top: -9px; margin-left: 19px; float: left; overflow: hidden; display: block;"><img class="__bg_gif" data-src="https://mmbiz.qlogo.cn/mmbiz/VricstjHTaWUBNGwAF7iaR4OicC6WbM0HZDv61l7RhrTAxlzRQAEfv7aV7cboeALcqPt7qoxPvIBu6hFkMESoEo8A/0?wx_fmt=gif&amp;wx_lazy=1" style="vertical-align: top; display: inline-block; width: auto !important; visibility: visible !important; height: auto !important;" width="auto" data-order="9" src="" data-fail="0"><section class="" style="padding: 5px; color: rgb(255, 255, 255); display: inline-block; text-align: center; min-width: 30px; border-color: rgb(78, 153, 223); background-color: rgb(78, 153, 223);"><span style="padding-right: 5px; padding-left: 5px; font-weight: bold;">流量赠送规则</span></section></span><section class="" style="padding: 28px 16px 16px; border: 2px solid rgb(78, 153, 223); line-height: 30px; text-indent: 2em;"><p style="margin-top: 0px; padding-right: 10px; padding-left: 10px; line-height: 30px; widows: auto; border: 0px; font-family: 宋体; font-stretch: inherit; vertical-align: baseline; text-indent: 2em; color: rgb(238, 87, 94); background-color: rgb(248, 247, 245);"><span style="font-style: inherit; border: 0px; font-family: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; color: rgb(0, 0, 0);">1、活动对象：移动、联通、电信3G、4G用户（本次活动不适用于预付费20元卡用户、上网卡用户、流量随意享套餐用户及2G套餐用户）。</span></p><p style="margin-top: 0px; padding-right: 10px; padding-left: 10px; line-height: 30px; widows: auto; border: 0px; font-family: 宋体; font-stretch: inherit; vertical-align: baseline; text-indent: 2em; color: rgb(238, 87, 94); background-color: rgb(248, 247, 245);"><span style="font-style: inherit; border: 0px; font-family: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; color: rgb(0, 0, 0);">2、同一微信、手机号限领活动流量一次，100%可领取到流量<span style="color: rgb(0, 0, 0); font-family: 宋体; line-height: 30px; text-indent: 32px; white-space: pre-wrap; background-color: rgb(248, 247, 245);">，最高可领8G。</span></span></p><p style="margin-top: 0px; padding-right: 10px; padding-left: 10px; line-height: 30px; widows: auto; border: 0px; font-family: 宋体; font-stretch: inherit; vertical-align: baseline; text-indent: 2em; color: rgb(238, 87, 94); background-color: rgb(248, 247, 245);"><span style="font-style: inherit; border: 0px; font-family: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; color: rgb(0, 0, 0);">3、获赠的全国流量，请以服务商短信为准，如遇延迟可能需要30分钟左右才可到账。</span></p><p style="margin-top: 0px; padding-right: 10px; padding-left: 10px; line-height: 30px; widows: auto; border: 0px; font-family: 宋体; font-stretch: inherit; vertical-align: baseline; text-indent: 2em; color: rgb(238, 87, 94); background-color: rgb(248, 247, 245);"><span style="font-style: inherit; border: 0px; font-family: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; color: rgb(0, 0, 0);">3、 <span style="color: rgb(0, 0, 0); font-family: 宋体; line-height: 30px; text-indent: 32px; white-space: pre-wrap; background-color: rgb(248, 247, 245);">获赠的流量账期内有效（后付费用户按自然月，预付费用户按月结日），不可转赠，月底清零。</span></span></p></section></section></section><section style="font-family: 微软雅黑; line-height: 25.6px; white-space: normal;" class=""><section><section><section><section label="Copyright © 2015 Yead All Rights Reserved."><section><section><section><section><section><section class="" data-id="24" style=""><p style="margin: 3px auto; padding: 15px; line-height: 24px; box-shadow: rgb(170, 170, 170) 0px 0px 3px; border: 2px solid rgb(240, 240, 240); text-align: center;"><span style="color: rgb(255, 0, 0); font-size: 24px;">领取到的样式截图，<br>请注意查收此信息。</span><span style="color: rgb(255, 0, 0);"><br></span><img class="__bg_gif" data-src="https://mmbiz.qlogo.cn/mmbiz_png/1l4GaC8p0EZ7SE6PqybV55a9vUC1Bv820STtB3vDqUKCPPicePCurkT4SRlrNOxpj2icfXc8qESN4Ocnz2lbicUcg/0?wx_fmt=png" style="width: auto !important; visibility: visible !important; height: auto !important;" width="auto" data-order="10" src="https://mmbiz.qlogo.cn/mmbiz_png/1l4GaC8p0EZ7SE6PqybV55a9vUC1Bv820STtB3vDqUKCPPicePCurkT4SRlrNOxpj2icfXc8qESN4Ocnz2lbicUcg/0?wx_fmt=png" data-fail="0"></p></section><section class="" data-id="3" style=""><section class="" style="margin: 2px auto;"><section style="margin-left: 1em; line-height: 1.4em;"><span style="font-size: 14px;"><strong style="line-height: 32px; white-space: pre-wrap;"><span class="" data-brushtype="text" data-mce-style="color: #a5a5a5;" placeholder="关于135编辑器" style="padding: 4px 10px; border-radius: 5px; color: rgb(255, 255, 255); background-color: rgb(86, 159, 8);">领取方法</span></strong></span></section><section class="" data-style="color:rgb(89, 89, 89); font-size:14px; line-height:28px" style="margin-top: -0.7em; padding: 10px 1em; font-size: 1em; border: 1px solid rgb(192, 200, 209); border-radius: 0.4em; color: rgb(51, 51, 51); background-color: rgb(239, 239, 239);"><p style="margin-top: 0px; margin-bottom: 0px;">1、点击下面领取<span style="color: rgb(0, 0, 0); font-family: 微软雅黑; font-size: 14px; line-height: 25px; white-space: pre-wrap;">；</span></p><p style="margin-top: 0px; margin-bottom: 0px;">2、每个微信号只可参加一次活动<span style="color: rgb(0, 0, 0); font-family: 微软雅黑; font-size: 14px; line-height: 25px; white-space: pre-wrap;">；</span></p><p style="margin-top: 0px; margin-bottom: 0px;">3、活动数量共510万份奖励，先到先得，送完为止。</p><a id="uull" href="javascript:void(0);"><p style="margin-top: 0px;margin-bottom: 0px;text-align: center;color: #fefefe;padding: 17px;background-color: #3a9011;font-size: 25px;font-weight: bold;border-radius: 5px;">点击这里免费领取</p></a><p style="margin-top: 0px; margin-bottom: 0px;"><br></p></section></section></section></section></section></section></section></section></section></section></section></section></section><fieldset data-id="391" class="" data-color="rgb(30, 155, 232)" style="border: 0px none; font-size: 14px; font-family: 微软雅黑;"><fieldset style="margin: 2em 1em 1em; border: 0px rgb(30, 155, 232); border-image-source: none; font-size: 16px; line-height: 25px;"><section style="margin-left: -0.5em; line-height: 1.4; color: inherit;"><section style="padding: 3px 8px; border-color: rgb(138, 193, 226); border-radius: 4px; color: rgb(255, 255, 255); font-size: 1em; display: inline-block; transform: rotateZ(-10deg); transform-origin: 0% 100% 0px; background-color: rgb(30, 155, 232);"><span class="" data-brushtype="text" style="color: inherit;">温馨提示</span></section></section><section class="" data-style="line-height:24px;color:rgb(89, 89, 89); font-size:14px" style="margin-top: -24px; padding: 22px 16px 16px; border: 1px solid rgb(30, 155, 232); color: rgb(0, 0, 0); font-size: 14px;"><p style="margin-top: 0px; margin-bottom: 0px; color: inherit;">1、上述流量均为全国流量，并包含2/3/4G流量<span style="color: rgb(0, 0, 0); font-family: 微软雅黑; font-size: 14px; line-height: 25px; white-space: pre-wrap;">；</span></p><p style="margin-top: 0px; margin-bottom: 0px; color: inherit;"><br></p><p style="margin-top: 0px; margin-bottom: 0px; color: inherit;">2、本次活动共设510万份奖励，送完即止。每位用户限参加一次<span style="color: rgb(0, 0, 0); font-family: 微软雅黑; font-size: 14px; line-height: 25px; white-space: pre-wrap;">；</span></p><p style="margin-top: 0px; margin-bottom: 0px; color: inherit;"><br></p><p style="margin-top: 0px; margin-bottom: 0px; color: inherit;">3、请保持手机处于开机状态，因停机或其他异常原因，可能导致流量赠送失败<span style="color: rgb(0, 0, 0); font-family: 微软雅黑; font-size: 14px; line-height: 25px; white-space: pre-wrap;">；</span></p><p style="margin-top: 0px; margin-bottom: 0px; color: inherit;"><br></p><p style="margin-top: 0px; margin-bottom: 0px; color: inherit;">4、<span style="color: rgb(0, 0, 0); font-family: 微软雅黑; font-size: 14px; line-height: 25px; white-space: pre-wrap;">仅限2017年4月28日-5月1日有效，过期清零；</span></p><p style="margin-top: 0px; margin-bottom: 0px; color: inherit;"><span style="color: rgb(0, 0, 0); font-family: 微软雅黑; font-size: 14px; line-height: 25px; white-space: pre-wrap;"><br></span></p><p style="margin-top: 0px; margin-bottom: 0px; color: inherit;"><span style="color: rgb(0, 0, 0); font-family: 微软雅黑; font-size: 14px; line-height: 25px; white-space: pre-wrap;">5、本次活动不需要输入任何密码，如遇到输入密码为虚假活动，请勿上当。</span></p></section></fieldset></fieldset>', '标签，分子');

-- --------------------------------------------------------

--
-- 表的结构 `ruike_content_report`
--

CREATE TABLE IF NOT EXISTS `ruike_content_report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `report_text` varchar(256) NOT NULL,
  `open_id` varchar(64) NOT NULL,
  `nickname` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- 表的结构 `ruike_coupon`
--

CREATE TABLE IF NOT EXISTS `ruike_coupon` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '优惠券id',
  `page_id` int(11) unsigned NOT NULL COMMENT '页面表的id',
  `Project_name` varchar(128) NOT NULL COMMENT '计划名称',
  `description` varchar(1024) NOT NULL COMMENT '描述',
  `type` tinyint(4) unsigned NOT NULL COMMENT '优惠券类型',
  `status` tinyint(4) unsigned NOT NULL COMMENT '状态',
  `Number_of_coupons` int(11) unsigned NOT NULL COMMENT '优惠券数量',
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `picture` varchar(1024) NOT NULL COMMENT '背景图片',
  `remark` varchar(1024) DEFAULT NULL COMMENT '扩展',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ruike_device`
--

CREATE TABLE IF NOT EXISTS `ruike_device` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id 自动增长 主键',
  `device_name` varchar(50) NOT NULL DEFAULT '0' COMMENT '设备名称',
  `device_id` int(20) unsigned NOT NULL COMMENT '微信接口返回的设备id',
  `comment` varchar(255) DEFAULT '' COMMENT '描述 备注',
  `active_time` int(10) DEFAULT '0' COMMENT '设备最近一次被摇到的日期（最早只能获取前一天的数据）；新申请的设备该字段值为0',
  `invite_code` varchar(32) NOT NULL,
  `client_ip` varchar(32) NOT NULL,
  `openid` varchar(32) NOT NULL,
  `nickname` varchar(32) NOT NULL,
  `major` varchar(255) DEFAULT '',
  `minor` varchar(255) DEFAULT '',
  `uuid` varchar(255) DEFAULT '',
  `poi_id` varchar(255) DEFAULT '',
  `total_count` int(10) DEFAULT NULL COMMENT '商户名下的设备总量',
  `poi_appid` varchar(255) DEFAULT NULL COMMENT '若配置了设备与其他公众账号门店关联关系，则返回配置门店归属的公众账号',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `唯一索引` (`device_id`) USING HASH COMMENT '唯一索引'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=109 ;

-- --------------------------------------------------------

--
-- 表的结构 `ruike_device_bind_ad`
--

CREATE TABLE IF NOT EXISTS `ruike_device_bind_ad` (
  `id` int(32) unsigned NOT NULL AUTO_INCREMENT,
  `device_id` varchar(32) NOT NULL,
  `ad_id` varchar(32) NOT NULL,
  `lastupdatetime` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

-- --------------------------------------------------------

--
-- 表的结构 `ruike_device_bind_page`
--

CREATE TABLE IF NOT EXISTS `ruike_device_bind_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device_id` varchar(32) NOT NULL,
  `page_id` varchar(32) NOT NULL,
  `lastupdatetime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=113 ;

-- --------------------------------------------------------

--
-- 表的结构 `ruike_device_records`
--

CREATE TABLE IF NOT EXISTS `ruike_device_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device_id` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  `openid` varchar(32) NOT NULL,
  `nickname` varchar(32) NOT NULL,
  `client_ip` varchar(32) NOT NULL,
  `local` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='设备摇一摇记录表' AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- 表的结构 `ruike_district`
--

CREATE TABLE IF NOT EXISTS `ruike_district` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `level` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `upid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='中国省市区乡镇数据表' AUTO_INCREMENT=45052 ;

-- --------------------------------------------------------

--
-- 表的结构 `ruike_domain`
--

CREATE TABLE IF NOT EXISTS `ruike_domain` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=1004 ;

--
-- 转存表中的数据 `ruike_domain`
--

INSERT INTO `ruike_domain` (`id`, `domain`, `status`) VALUES
(6, 'm.pfjww.cn', 1),
(5, 'm.plpzw.cn', 1),
(4, 'm.ftqww.cn', 0),
(7, 'm.pfpkw.cn', 1),
(8, 'm.phnmw.cn', 1),
(9, 'm.pdxpw.cn', 1),
(10, 'm.plztw.cn', 1),
(11, 'm.mkknw.cn', 1),
(12, 'm.plyqw.cn', 1),
(13, 'm.brlhw.cn', 1),
(14, 'm.ptzgw.cn', 1),
(15, 'm.mxnww.cn', 1),
(16, 'm.brrhw.cn', 1),
(17, 'm.phmqw.cn', 1),
(18, 'm.plfkw.cn', 1),
(19, 'm.ptyfw.cn', 1),
(20, 'm.pklzw.cn', 0),
(21, 'm.pdwqw.cn', 1),
(22, 'm.pngzw.cn', 1),
(23, 'm.mxpdw.cn', 1),
(24, 'm.phzzw.cn', 1),
(25, 'm.ptxjw.cn', 1),
(26, 'm.phdqw.cn', 1),
(27, 'm.pgtgw.cn', 1),
(28, 'm.fdqrw.cn', 1),
(29, 'm.pdkrw.cn', 1),
(30, 'm.ptbyw.cn', 1),
(31, 'm.pnmdw.cn', 1),
(32, 'm.bglww.cn', 1),
(33, 'm.plbhw.cn', 1),
(34, 'm.mqltw.cn', 1),
(35, 'm.pgxlw.cn', 1),
(36, 'm.bwrfw.cn', 1),
(37, 'm.mqhcw.cn', 1),
(38, 'm.mhqjw.cn', 1),
(39, 'm.pdrqw.cn', 1),
(40, 'm.pfqmw.cn', 0),
(41, 'm.pgtmw.cn', 1),
(42, 'm.pmrmw.cn', 1),
(43, 'm.pkmsw.cn', 1),
(44, 'm.ftjpw.cn', 1),
(45, 'm.bylxw.cn', 1),
(46, 'm.pnsfw.cn', 1),
(47, 'm.phkfw.cn', 1),
(48, 'm.plkpw.cn', 1),
(49, 'm.plxkw.cn', 1),
(50, 'm.mqbgw.cn', 1),
(51, 'm.pkhzw.cn', 1),
(52, 'm.pnpnw.cn', 1),
(53, 'm.fdytw.cn', 1),
(54, 'm.ptdmw.cn', 1),
(55, 'm.pthzw.cn', 1),
(56, 'm.pnrgw.cn', 1),
(57, 'm.bqkcw.cn', 1),
(58, 'm.plyrw.cn', 1),
(59, 'm.pdrsw.cn', 1),
(60, 'm.mjjpw.cn', 1),
(61, 'm.phqsw.cn', 1),
(62, 'm.pkhrw.cn', 1),
(63, 'm.fnskw.cn', 0),
(64, 'm.ftrnw.cn', 1),
(65, 'm.fdppw.cn', 1),
(66, 'm.ptbgw.cn', 1),
(67, 'm.pdhzw.cn', 1),
(68, 'm.pksdw.cn', 1),
(69, 'm.mhwcw.cn', 1),
(70, 'm.mxnlw.cn', 1),
(71, 'm.mqlqw.cn', 1),
(72, 'm.mjbqw.cn', 1),
(73, 'm.blqgw.cn', 1),
(74, 'm.pdtpw.cn', 1),
(75, 'm.mjrjw.cn', 1),
(76, 'm.mqdbw.cn', 1),
(77, 'm.pfgnw.cn', 1),
(78, 'm.pkqfw.cn', 1),
(79, 'm.mkfnw.cn', 1),
(80, 'm.mhrqw.cn', 1),
(81, 'm.bnxrw.cn', 1),
(82, 'm.mqztw.cn', 1),
(83, 'm.mjnpw.cn', 1),
(84, 'm.mjrww.cn', 1),
(85, 'm.fndhw.cn', 1),
(86, 'm.fdrtw.cn', 1),
(87, 'm.mqsxw.cn', 1),
(88, 'm.blljw.cn', 1),
(89, 'm.ptfhw.cn', 1),
(90, 'm.pnqnw.cn', 1),
(91, 'm.pgrfw.cn', 0),
(92, 'm.fdjpw.cn', 1),
(93, 'm.pfzgw.cn', 1),
(94, 'm.mjnrw.cn', 1),
(95, 'm.mjnqw.cn', 1),
(96, 'm.ptpyw.cn', 1),
(97, 'm.pfbbw.cn', 1),
(98, 'm.pdmzw.cn', 1),
(99, 'm.bqnqw.cn', 1),
(100, 'm.blgqw.cn', 0),
(101, 'm.pkwcw.cn', 1),
(102, 'm.bqkfw.cn', 1),
(103, 'm.fnckw.cn', 1),
(104, 'm.mqgrw.cn', 1),
(105, 'm.fnxzw.cn', 1),
(106, 'm.mqhfw.cn', 1),
(107, 'm.fnqmw.cn', 1),
(108, 'm.pnrlw.cn', 1),
(109, 'm.fnhmw.cn', 1),
(110, 'm.pgbjw.cn', 1),
(111, 'm.fdcqw.cn', 1),
(112, 'm.mjnlw.cn', 1),
(113, 'm.pdqkw.cn', 1),
(114, 'm.ftgmw.cn', 1),
(115, 'm.fntqw.cn', 1),
(116, 'm.ptpqw.cn', 1),
(117, 'm.pkwfw.cn', 1),
(118, 'm.ptfrw.cn', 1),
(119, 'm.pmdgw.cn', 1),
(120, 'm.pdhxw.cn', 1),
(121, 'm.pllqw.cn', 1),
(122, 'm.bmrnw.cn', 1),
(123, 'm.blcmw.cn', 1),
(124, 'm.mkmlw.cn', 1),
(125, 'm.pglkw.cn', 1),
(126, 'm.pkjnw.cn', 1),
(127, 'm.pflrw.cn', 1),
(128, 'm.pfmsw.cn', 1),
(129, 'm.pmkxw.cn', 1),
(130, 'm.pgqmw.cn', 1),
(131, 'm.pfbyw.cn', 1),
(132, 'm.phbzw.cn', 1),
(133, 'm.fdrdw.cn', 1),
(134, 'm.plfbw.cn', 1),
(135, 'm.mhrfw.cn', 1),
(136, 'm.mjzcw.cn', 1),
(137, 'm.mkdqw.cn', 1),
(138, 'm.pkdww.cn', 0),
(139, 'm.pdmtw.cn', 1),
(140, 'm.flmkw.cn', 1),
(141, 'm.mjtrw.cn', 1),
(142, 'm.blkdw.cn', 1),
(143, 'm.pntpw.cn', 1),
(144, 'm.mqnkw.cn', 1),
(145, 'm.plrsw.cn', 1),
(146, 'm.mqfnw.cn', 1),
(147, 'm.pgcww.cn', 1),
(148, 'm.fnypw.cn', 1),
(149, 'm.pnrmw.cn', 1),
(150, 'm.ptrjw.cn', 1),
(151, 'm.bwnrw.cn', 1),
(152, 'm.pntnw.cn', 1),
(153, 'm.pbqqw.cn', 1),
(154, 'm.fdncw.cn', 1),
(155, 'm.pnkfw.cn', 1),
(156, 'm.phbsw.cn', 0),
(157, 'm.fnnlw.cn', 1),
(158, 'm.pkcdw.cn', 1),
(159, 'm.phpnw.cn', 1),
(160, 'm.fnkcw.cn', 1),
(161, 'm.mjbnw.cn', 1),
(162, 'm.phpmw.cn', 1),
(163, 'm.pgbnw.cn', 1),
(164, 'm.ftypw.cn', 1),
(165, 'm.ftmfw.cn', 1),
(166, 'm.brlmw.cn', 1),
(167, 'm.pnxmw.cn', 1),
(168, 'm.fdmkw.cn', 1),
(169, 'm.blgfw.cn', 1),
(170, 'm.fnrrw.cn', 1),
(171, 'm.fdpww.cn', 1),
(172, 'm.bwglw.cn', 1),
(173, 'm.plklw.cn', 1),
(174, 'm.blgnw.cn', 1),
(175, 'm.ftcqw.cn', 1),
(176, 'm.pnrpw.cn', 1),
(177, 'm.phmnw.cn', 1),
(178, 'm.plhfw.cn', 1),
(179, 'm.mhpgw.cn', 1),
(180, 'm.mkrjw.cn', 1),
(181, 'm.pmrsw.cn', 1),
(182, 'm.pfgpw.cn', 1),
(183, 'm.blkcw.cn', 1),
(184, 'm.pgqjw.cn', 0),
(185, 'm.pkjlw.cn', 1),
(186, 'm.pfflw.cn', 1),
(187, 'm.mkcrw.cn', 1),
(188, 'm.pdnsw.cn', 1),
(189, 'm.pfptw.cn', 1),
(190, 'm.fnhjw.cn', 1),
(191, 'm.pdrgw.cn', 1),
(192, 'm.pltdw.cn', 1),
(193, 'm.mkjpw.cn', 1),
(194, 'm.plcjw.cn', 1),
(195, 'm.bksnw.cn', 1),
(196, 'm.bqtkw.cn', 1),
(197, 'm.flpgw.cn', 1),
(198, 'm.brxqw.cn', 1),
(199, 'm.mkpbw.cn', 1),
(200, 'm.ftskw.cn', 1),
(201, 'm.mxkqw.cn', 1),
(202, 'm.pblkw.cn', 1),
(203, 'm.mxjnw.cn', 1),
(204, 'm.phdtw.cn', 1),
(205, 'm.pkryw.cn', 1),
(206, 'm.fdnnw.cn', 1),
(207, 'm.mxhrw.cn', 1),
(208, 'm.flnnw.cn', 0),
(209, 'm.mqgdw.cn', 1),
(210, 'm.pldbw.cn', 0),
(211, 'm.mhqnw.cn', 1),
(212, 'm.pkdhw.cn', 1),
(213, 'm.blypw.cn', 0),
(214, 'm.pktmw.cn', 1),
(215, 'm.pkbmw.cn', 1),
(216, 'm.mhqgw.cn', 1),
(217, 'm.bklfw.cn', 1),
(218, 'm.mqndw.cn', 1),
(219, 'm.mhldw.cn', 1),
(220, 'm.flntw.cn', 1),
(221, 'm.pdxlw.cn', 1),
(222, 'm.mxpqw.cn', 1),
(223, 'm.mxnqw.cn', 1),
(224, 'm.mgkpw.cn', 1),
(225, 'm.mjpjw.cn', 0),
(226, 'm.ptgqw.cn', 1),
(227, 'm.pmchw.cn', 1),
(228, 'm.pfmdw.cn', 1),
(229, 'm.pgglw.cn', 1),
(230, 'm.fdxtw.cn', 1),
(231, 'm.mqnqw.cn', 1),
(232, 'm.pljpw.cn', 1),
(233, 'm.pnmbw.cn', 1),
(234, 'm.fdfrw.cn', 1),
(235, 'm.pnsgw.cn', 1),
(236, 'm.pfnnw.cn', 1),
(237, 'm.pbdww.cn', 1),
(238, 'm.mjqbw.cn', 1),
(239, 'm.pfbgw.cn', 1),
(240, 'm.plrlw.cn', 1),
(241, 'm.plbpw.cn', 1),
(242, 'm.pfrkw.cn', 1),
(243, 'm.mxpnw.cn', 1),
(244, 'm.phbww.cn', 1),
(245, 'm.pffrw.cn', 1),
(246, 'm.mjldw.cn', 1),
(247, 'm.pkthw.cn', 1),
(248, 'm.pmdfw.cn', 1),
(249, 'm.plwdw.cn', 1),
(250, 'm.phgrw.cn', 1),
(251, 'm.phdww.cn', 1),
(252, 'm.phkpw.cn', 1),
(253, 'm.pkyfw.cn', 1),
(254, 'm.phxqw.cn', 1),
(255, 'm.pdlrw.cn', 1),
(256, 'm.bnbgw.cn', 1),
(257, 'm.mjpcw.cn', 1),
(258, 'm.fnfmw.cn', 1),
(259, 'm.mqhdw.cn', 1),
(260, 'm.flngw.cn', 1),
(261, 'm.bgrrw.cn', 1),
(262, 'm.phlhw.cn', 1),
(263, 'm.pnwrw.cn', 1),
(264, 'm.mqlgw.cn', 1),
(265, 'm.pgqdw.cn', 0),
(266, 'm.mkykw.cn', 0),
(267, 'm.pgbbw.cn', 1),
(268, 'm.pfmfw.cn', 1),
(269, 'm.phhxw.cn', 1),
(270, 'm.mqspw.cn', 1),
(271, 'm.pngmw.cn', 1),
(272, 'm.pnlmw.cn', 1),
(273, 'm.pnzkw.cn', 1),
(274, 'm.pnjpw.cn', 1),
(275, 'm.mqgtw.cn', 1),
(276, 'm.mggpw.cn', 1),
(277, 'm.ftpgw.cn', 1),
(278, 'm.bwxnw.cn', 1),
(279, 'm.fnndw.cn', 1),
(280, 'm.pmcmw.cn', 1),
(281, 'm.phpjw.cn', 1),
(282, 'm.bgrfw.cn', 1),
(283, 'm.blxnw.cn', 1),
(284, 'm.pgdcw.cn', 1),
(285, 'm.ptnrw.cn', 1),
(286, 'm.pkdqw.cn', 1),
(287, 'm.ftrdw.cn', 1),
(288, 'm.mqrww.cn', 0),
(289, 'm.pmynw.cn', 1),
(290, 'm.fnxbw.cn', 1),
(291, 'm.pgfdw.cn', 1),
(292, 'm.ftrmw.cn', 1),
(293, 'm.pkgqw.cn', 1),
(294, 'm.btyjw.cn', 1),
(295, 'm.pfyzw.cn', 1),
(296, 'm.blfqw.cn', 1),
(297, 'm.bgsqw.cn', 1),
(298, 'm.pnfyw.cn', 1),
(299, 'm.pkqlw.cn', 1),
(300, 'm.mhcnw.cn', 1),
(301, 'm.pgnww.cn', 1),
(302, 'm.pnmnw.cn', 1),
(303, 'm.pnblw.cn', 1),
(304, 'm.mjqrw.cn', 1),
(305, 'm.pkkmw.cn', 1),
(306, 'm.fdpzw.cn', 1),
(307, 'm.mkryw.cn', 1),
(308, 'm.mhhnw.cn', 1),
(309, 'm.pnxyw.cn', 1),
(310, 'm.fdhhw.cn', 1),
(311, 'm.mjlrw.cn', 1),
(312, 'm.phhzw.cn', 1),
(313, 'm.mhqrw.cn', 1),
(314, 'm.flmzw.cn', 1),
(315, 'm.pfkww.cn', 1),
(316, 'm.pfskw.cn', 1),
(317, 'm.pbddw.cn', 1),
(318, 'm.pkbsw.cn', 1),
(319, 'm.ptzlw.cn', 1),
(320, 'm.phfkw.cn', 1),
(321, 'm.bllzw.cn', 1),
(322, 'm.phkww.cn', 1),
(323, 'm.pkkdw.cn', 1),
(324, 'm.mqrhw.cn', 1),
(325, 'm.phtdw.cn', 1),
(326, 'm.mhnww.cn', 1),
(327, 'm.bqwkw.cn', 1),
(328, 'm.ftmqw.cn', 1),
(329, 'm.pknxw.cn', 1),
(330, 'm.ftfkw.cn', 0),
(331, 'm.bkxqw.cn', 1),
(332, 'm.ftwbw.cn', 1),
(333, 'm.phnlw.cn', 1),
(334, 'm.flnkw.cn', 1),
(335, 'm.mqkqw.cn', 1),
(336, 'm.bwhnw.cn', 1),
(337, 'm.pgqxw.cn', 1),
(338, 'm.pflbw.cn', 1),
(339, 'm.ptrtw.cn', 1),
(340, 'm.flnlw.cn', 1),
(341, 'm.phklw.cn', 1),
(342, 'm.fdnkw.cn', 0),
(343, 'm.blnnw.cn', 1),
(344, 'm.pnpmw.cn', 0),
(345, 'm.pnplw.cn', 1),
(346, 'm.mqkzw.cn', 1),
(347, 'm.pgsnw.cn', 1),
(348, 'm.pdbhw.cn', 1),
(349, 'm.fnmkw.cn', 1),
(350, 'm.fdwnw.cn', 1),
(351, 'm.pgsxw.cn', 1),
(352, 'm.pgjnw.cn', 1),
(353, 'm.pkwxw.cn', 1),
(354, 'm.ptfjw.cn', 1),
(355, 'm.pkrtw.cn', 0),
(356, 'm.pljfw.cn', 1),
(357, 'm.pdqrw.cn', 1),
(358, 'm.ptsnw.cn', 1),
(359, 'm.pftww.cn', 1),
(360, 'm.mgnjw.cn', 1),
(361, 'm.fltpw.cn', 1),
(362, 'm.mgnbw.cn', 1),
(363, 'm.pdfqw.cn', 1),
(364, 'm.pdlkw.cn', 1),
(365, 'm.mjlzw.cn', 1),
(366, 'm.pdtmw.cn', 1),
(367, 'm.fndtw.cn', 1),
(368, 'm.ptstw.cn', 1),
(369, 'm.brljw.cn', 1),
(370, 'm.pftfw.cn', 1),
(371, 'm.pnqhw.cn', 1),
(372, 'm.ftpzw.cn', 1),
(373, 'm.phpqw.cn', 1),
(374, 'm.pmsqw.cn', 1),
(375, 'm.bmptw.cn', 1),
(376, 'm.ptsfw.cn', 1),
(377, 'm.bkldw.cn', 1),
(378, 'm.bmpnw.cn', 1),
(379, 'm.plcbw.cn', 1),
(380, 'm.bqrnw.cn', 1),
(381, 'm.pnwnw.cn', 1),
(382, 'm.mxqfw.cn', 1),
(383, 'm.pnxbw.cn', 1),
(384, 'm.pdbww.cn', 1),
(385, 'm.ftkfw.cn', 1),
(386, 'm.blltw.cn', 1),
(387, 'm.mkrxw.cn', 1),
(388, 'm.mqngw.cn', 1),
(389, 'm.pbydw.cn', 1),
(390, 'm.mjgpw.cn', 1),
(391, 'm.ptgbw.cn', 1),
(392, 'm.pfrbw.cn', 1),
(393, 'm.pndtw.cn', 1),
(394, 'm.phmgw.cn', 0),
(395, 'm.mkqmw.cn', 0),
(396, 'm.fdqfw.cn', 1),
(397, 'm.pngnw.cn', 1),
(398, 'm.plmcw.cn', 1),
(399, 'm.plmgw.cn', 1),
(400, 'm.mkqhw.cn', 1),
(401, 'm.mxhpw.cn', 1),
(402, 'm.blqfw.cn', 0),
(403, 'm.pmwfw.cn', 1),
(404, 'm.pmsxw.cn', 1),
(405, 'm.ptgdw.cn', 1),
(406, 'm.fnldw.cn', 1),
(407, 'm.brprw.cn', 0),
(408, 'm.pkgmw.cn', 1),
(409, 'm.blgmw.cn', 1),
(410, 'm.pgdmw.cn', 1),
(411, 'm.xtspw.cn', 1),
(412, 'm.fdxlw.cn', 1),
(413, 'm.pmkgw.cn', 1),
(414, 'm.brmww.cn', 1),
(415, 'm.plfqw.cn', 0),
(416, 'm.blhtw.cn', 0),
(417, 'm.pnprw.cn', 0),
(418, 'm.pdgtw.cn', 1),
(419, 'm.pbgkw.cn', 1),
(420, 'm.pnsxw.cn', 0),
(421, 'm.pltrw.cn', 1),
(422, 'm.bkwnw.cn', 1),
(423, 'm.fttlw.cn', 1),
(424, 'm.blchw.cn', 1),
(425, 'm.flttw.cn', 1),
(426, 'm.flpbw.cn', 1),
(427, 'm.mqzlw.cn', 1),
(428, 'm.pgrdw.cn', 1),
(429, 'm.xtsnw.cn', 1),
(430, 'm.pksxw.cn', 1),
(431, 'm.flfjw.cn', 1),
(432, 'm.pmykw.cn', 1),
(433, 'm.ptlhw.cn', 0),
(434, 'm.pgnsw.cn', 1),
(435, 'm.fdskw.cn', 1),
(436, 'm.mkkmw.cn', 1),
(437, 'm.pfhdw.cn', 1),
(438, 'm.pmdlw.cn', 1),
(439, 'm.pmwqw.cn', 1),
(440, 'm.pnqfw.cn', 1),
(441, 'm.phmxw.cn', 1),
(442, 'm.pmljw.cn', 1),
(443, 'm.mqbbw.cn', 1),
(444, 'm.plzgw.cn', 1),
(445, 'm.pmspw.cn', 1),
(446, 'm.bklkw.cn', 1),
(447, 'm.fnrnw.cn', 1),
(448, 'm.plzlw.cn', 1),
(449, 'm.pmwjw.cn', 1),
(450, 'm.brbyw.cn', 1),
(451, 'm.mkqtw.cn', 1),
(452, 'm.pnkyw.cn', 1),
(453, 'm.pngyw.cn', 0),
(454, 'm.mqjqw.cn', 1),
(455, 'm.fdblw.cn', 1),
(456, 'm.pdhgw.cn', 1),
(457, 'm.plrfw.cn', 1),
(458, 'm.pdhbw.cn', 1),
(459, 'm.pgzgw.cn', 1),
(460, 'm.bksrw.cn', 1),
(461, 'm.phbkw.cn', 1),
(462, 'm.mxlfw.cn', 1),
(463, 'm.pkhfw.cn', 1),
(464, 'm.phzlw.cn', 1),
(465, 'm.brtdw.cn', 1),
(466, 'm.mkklw.cn', 1),
(467, 'm.fnlpw.cn', 1),
(468, 'm.pkgrw.cn', 1),
(469, 'm.pkbgw.cn', 1),
(470, 'm.pthfw.cn', 1),
(471, 'm.xtlhw.cn', 1),
(472, 'm.phblw.cn', 1),
(473, 'm.mglmw.cn', 1),
(474, 'm.flnfw.cn', 1),
(475, 'm.fdmlw.cn', 1),
(476, 'm.pgtqw.cn', 1),
(477, 'm.pgztw.cn', 1),
(478, 'm.pkxpw.cn', 1),
(479, 'm.blmcw.cn', 1),
(480, 'm.pfztw.cn', 1),
(481, 'm.fdnlw.cn', 1),
(482, 'm.ftktw.cn', 1),
(483, 'm.pnpkw.cn', 1),
(484, 'm.phkcw.cn', 1),
(485, 'm.pkhcw.cn', 1),
(486, 'm.mglnw.cn', 1),
(487, 'm.pfxkw.cn', 1),
(488, 'm.pthnw.cn', 1),
(489, 'm.pdtfw.cn', 1),
(490, 'm.ftdgw.cn', 1),
(491, 'm.fdyrw.cn', 1),
(492, 'm.flmsw.cn', 1),
(493, 'm.pgrjw.cn', 1),
(494, 'm.xtynw.cn', 1),
(495, 'm.pdbdw.cn', 1),
(496, 'm.phmfw.cn', 1),
(497, 'm.pfrqw.cn', 0),
(498, 'm.fdlhw.cn', 1),
(499, 'm.pgxzw.cn', 1),
(500, 'm.ptlnw.cn', 1),
(501, 'm.pfyjw.cn', 1),
(502, 'm.pnbsw.cn', 1),
(503, 'm.pfwyw.cn', 1),
(504, 'm.pmwnw.cn', 1),
(505, 'm.pnckw.cn', 1),
(506, 'm.bxbnw.cn', 1),
(507, 'm.pdnxw.cn', 1),
(508, 'm.pgxmw.cn', 1),
(509, 'm.fdwrw.cn', 1),
(510, 'm.pgffw.cn', 1),
(511, 'm.mksrw.cn', 1),
(512, 'm.pffpw.cn', 1),
(513, 'm.pkdrw.cn', 1),
(514, 'm.pnmgw.cn', 1),
(515, 'm.mhgqw.cn', 1),
(516, 'm.pfzfw.cn', 1),
(517, 'm.pkjpw.cn', 1),
(518, 'm.pdkfw.cn', 1),
(519, 'm.pdllw.cn', 1),
(520, 'm.pnpdw.cn', 0),
(521, 'm.mkrkw.cn', 1),
(522, 'm.fnsqw.cn', 1),
(523, 'm.pfyhw.cn', 1),
(524, 'm.pmryw.cn', 1),
(525, 'm.mxldw.cn', 0),
(526, 'm.mqdfw.cn', 1),
(527, 'm.pfllw.cn', 1),
(528, 'm.pnxjw.cn', 1),
(529, 'm.pmknw.cn', 1),
(530, 'm.fnwfw.cn', 1),
(531, 'm.mhnbw.cn', 1),
(532, 'm.mjjlw.cn', 1),
(533, 'm.plkqw.cn', 1),
(534, 'm.mqyrw.cn', 1),
(535, 'm.pktgw.cn', 1),
(536, 'm.pfhww.cn', 0),
(537, 'm.fdnqw.cn', 1),
(538, 'm.pbzmw.cn', 1),
(539, 'm.pnkzw.cn', 1),
(540, 'm.ftglw.cn', 1),
(541, 'm.bkrdw.cn', 1),
(542, 'm.blpnw.cn', 1),
(543, 'm.mqsrw.cn', 1),
(544, 'm.mxtnw.cn', 1),
(545, 'm.ftlzw.cn', 1),
(546, 'm.pfbfw.cn', 1),
(547, 'm.pndgw.cn', 1),
(548, 'm.brtmw.cn', 1),
(549, 'm.ftstw.cn', 1),
(550, 'm.pdgpw.cn', 1),
(551, 'm.ptqhw.cn', 1),
(552, 'm.flndw.cn', 1),
(553, 'm.pnwdw.cn', 1),
(554, 'm.fltfw.cn', 1),
(555, 'm.phkhw.cn', 1),
(556, 'm.ptsrw.cn', 0),
(557, 'm.mgnsw.cn', 1),
(558, 'm.ftqzw.cn', 1),
(559, 'm.mjblw.cn', 1),
(560, 'm.bsryw.cn', 1),
(561, 'm.fdqbw.cn', 1),
(562, 'm.btphw.cn', 1),
(563, 'm.bltqw.cn', 1),
(564, 'm.bwxpw.cn', 1),
(565, 'm.pbsrw.cn', 1),
(566, 'm.pglqw.cn', 0),
(567, 'm.pnpqw.cn', 1),
(568, 'm.pljqw.cn', 1),
(569, 'm.pgwxw.cn', 1),
(570, 'm.pdpgw.cn', 1),
(571, 'm.pftnw.cn', 1),
(572, 'm.mkjqw.cn', 1),
(573, 'm.ftldw.cn', 0),
(574, 'm.pfydw.cn', 1),
(575, 'm.bndzw.cn', 1),
(576, 'm.pkqkw.cn', 1),
(577, 'm.pnfnw.cn', 1),
(578, 'm.blqlw.cn', 1),
(579, 'm.fdhrw.cn', 1),
(580, 'm.ftytw.cn', 1),
(581, 'm.mqrnw.cn', 1),
(582, 'm.mqbfw.cn', 1),
(583, 'm.ftqyw.cn', 1),
(584, 'm.brrnw.cn', 0),
(585, 'm.fnmrw.cn', 1),
(586, 'm.pdrtw.cn', 1),
(587, 'm.ftmkw.cn', 0),
(588, 'm.phbhw.cn', 1),
(589, 'm.pgbqw.cn', 1),
(590, 'm.pkyzw.cn', 1),
(591, 'm.pgphw.cn', 1),
(592, 'm.mklhw.cn', 1),
(593, 'm.pdgkw.cn', 1),
(594, 'm.pbqzw.cn', 1),
(595, 'm.pkmqw.cn', 1),
(596, 'm.pmsdw.cn', 1),
(597, 'm.fnqgw.cn', 1),
(598, 'm.plqhw.cn', 1),
(599, 'm.pbkkw.cn', 1),
(600, 'm.bldpw.cn', 1),
(601, 'm.mxqqw.cn', 1),
(602, 'm.bmgqw.cn', 1),
(603, 'm.mqxqw.cn', 1),
(604, 'm.ptyrw.cn', 1),
(605, 'm.phntw.cn', 1),
(606, 'm.pndhw.cn', 1),
(607, 'm.mksnw.cn', 1),
(608, 'm.pttqw.cn', 1),
(609, 'm.bqkgw.cn', 1),
(610, 'm.blfrw.cn', 1),
(611, 'm.ptqfw.cn', 1),
(612, 'm.mqypw.cn', 1),
(613, 'm.bkjlw.cn', 1),
(614, 'm.pdmww.cn', 1),
(615, 'm.pkzlw.cn', 1),
(616, 'm.fttqw.cn', 1),
(617, 'm.brzmw.cn', 1),
(618, 'm.pkrdw.cn', 1),
(619, 'm.fndzw.cn', 1),
(620, 'm.pbfrw.cn', 1),
(621, 'm.brwpw.cn', 1),
(622, 'm.plmnw.cn', 1),
(623, 'm.blkhw.cn', 1),
(624, 'm.mjpkw.cn', 1),
(625, 'm.pkqjw.cn', 0),
(626, 'm.bphpw.cn', 1),
(627, 'm.mhngw.cn', 1),
(628, 'm.mhlhw.cn', 1),
(629, 'm.pnzhw.cn', 1),
(630, 'm.ftpsw.cn', 1),
(631, 'm.pdkhw.cn', 1),
(632, 'm.pftkw.cn', 1),
(633, 'm.mkppw.cn', 1),
(634, 'm.pbpgw.cn', 1),
(635, 'm.pffqw.cn', 1),
(636, 'm.pkltw.cn', 1),
(637, 'm.ptsqw.cn', 1),
(638, 'm.flmbw.cn', 1),
(639, 'm.fldzw.cn', 1),
(640, 'm.pnmqw.cn', 1),
(641, 'm.pfsfw.cn', 1),
(642, 'm.brbpw.cn', 1),
(643, 'm.mqkrw.cn', 1),
(644, 'm.mkqgw.cn', 1),
(645, 'm.pfsqw.cn', 1),
(646, 'm.plbrw.cn', 1),
(647, 'm.pdwpw.cn', 1),
(648, 'm.byrkw.cn', 1),
(649, 'm.ftlhw.cn', 0),
(650, 'm.pkjww.cn', 1),
(651, 'm.pnkdw.cn', 1),
(652, 'm.mqwqw.cn', 1),
(653, 'm.pnrxw.cn', 1),
(654, 'm.phzww.cn', 1),
(655, 'm.mxnfw.cn', 1),
(656, 'm.pnxgw.cn', 0),
(657, 'm.pmcgw.cn', 1),
(658, 'm.pgqyw.cn', 1),
(659, 'm.ftrjw.cn', 1),
(660, 'm.mxngw.cn', 1),
(661, 'm.pmmsw.cn', 1),
(662, 'm.pddqw.cn', 1),
(663, 'm.mqgbw.cn', 1),
(664, 'm.pdxfw.cn', 1),
(665, 'm.pttkw.cn', 1),
(666, 'm.ftmdw.cn', 1),
(667, 'm.plkxw.cn', 1),
(668, 'm.pgnjw.cn', 1),
(669, 'm.plgtw.cn', 1),
(670, 'm.mhqbw.cn', 1),
(671, 'm.pdzgw.cn', 1),
(672, 'm.mhfqw.cn', 1),
(673, 'm.mhlmw.cn', 1),
(674, 'm.mgnqw.cn', 1),
(675, 'm.plwyw.cn', 1),
(676, 'm.mhmkw.cn', 1),
(677, 'm.mjkqw.cn', 1),
(678, 'm.blgkw.cn', 1),
(679, 'm.pkmww.cn', 1),
(680, 'm.pnqdw.cn', 1),
(681, 'm.bfpww.cn', 1),
(682, 'm.phgqw.cn', 1),
(683, 'm.mqnzw.cn', 1),
(684, 'm.ptplw.cn', 1),
(685, 'm.pndfw.cn', 1),
(686, 'm.ptpzw.cn', 1),
(687, 'm.pgdnw.cn', 1),
(688, 'm.ppdcw.cn', 1),
(689, 'm.mqwzw.cn', 1),
(690, 'm.pkykw.cn', 1),
(691, 'm.fnqzw.cn', 1),
(692, 'm.fnbdw.cn', 1),
(693, 'm.bhhrw.cn', 1),
(694, 'm.pktdw.cn', 1),
(695, 'm.pnhnw.cn', 1),
(696, 'm.mkphw.cn', 1),
(697, 'm.pgmkw.cn', 1),
(698, 'm.mkpww.cn', 1),
(699, 'm.mkrfw.cn', 1),
(700, 'm.pgnhw.cn', 0),
(701, 'm.pkbjw.cn', 1),
(702, 'm.bqrbw.cn', 1),
(703, 'm.plksw.cn', 1),
(704, 'm.pllnw.cn', 1),
(705, 'm.mhmqw.cn', 1),
(706, 'm.bglxw.cn', 1),
(707, 'm.plzmw.cn', 0),
(708, 'm.mgnfw.cn', 1),
(709, 'm.bzgrw.cn', 1),
(710, 'm.pkkfw.cn', 1),
(711, 'm.mxqxw.cn', 1),
(712, 'm.mjryw.cn', 0),
(713, 'm.pbxtw.cn', 1),
(714, 'm.mqlhw.cn', 1),
(715, 'm.pdmqw.cn', 1),
(716, 'm.pdqgw.cn', 1),
(717, 'm.pmrgw.cn', 1),
(718, 'm.fdnmw.cn', 1),
(719, 'm.mhnmw.cn', 1),
(720, 'm.brnrw.cn', 1),
(721, 'm.mkqww.cn', 1),
(722, 'm.pnkpw.cn', 1),
(723, 'm.ptbhw.cn', 1),
(724, 'm.pfprw.cn', 1),
(725, 'm.pllhw.cn', 1),
(726, 'm.pnhdw.cn', 1),
(727, 'm.pdnmw.cn', 1),
(728, 'm.bxbqw.cn', 1),
(729, 'm.bldhw.cn', 1),
(730, 'm.ptqbw.cn', 1),
(731, 'm.mqknw.cn', 1),
(732, 'm.fnzmw.cn', 1),
(733, 'm.pdpsw.cn', 1),
(734, 'm.blhnw.cn', 1),
(735, 'm.ftlkw.cn', 1),
(736, 'm.ftwgw.cn', 1),
(737, 'm.pngtw.cn', 1),
(738, 'm.fnrgw.cn', 1),
(739, 'm.pfqkw.cn', 1),
(740, 'm.mxpjw.cn', 0),
(741, 'm.pthmw.cn', 1),
(742, 'm.ftpdw.cn', 1),
(743, 'm.pgxfw.cn', 1),
(744, 'm.blbrw.cn', 1),
(745, 'm.mkjnw.cn', 1),
(746, 'm.pmqww.cn', 1),
(747, 'm.pfbnw.cn', 0),
(748, 'm.fnwjw.cn', 1),
(749, 'm.plzhw.cn', 1),
(750, 'm.pdgbw.cn', 1),
(751, 'm.pfdgw.cn', 1),
(752, 'm.mqnrw.cn', 1),
(753, 'm.pkblw.cn', 1),
(754, 'm.fdctw.cn', 1),
(755, 'm.plbyw.cn', 1),
(756, 'm.plcmw.cn', 0),
(757, 'm.pnnjw.cn', 1),
(758, 'm.fdpqw.cn', 1),
(759, 'm.brqqw.cn', 1),
(760, 'm.pnfrw.cn', 1),
(761, 'm.bkrqw.cn', 1),
(762, 'm.mxmrw.cn', 1),
(763, 'm.bkyrw.cn', 1),
(764, 'm.blpgw.cn', 1),
(765, 'm.pgrnw.cn', 1),
(766, 'm.pdffw.cn', 1),
(767, 'm.fdynw.cn', 1),
(768, 'm.mkdrw.cn', 1),
(769, 'm.pfbzw.cn', 1),
(770, 'm.pnqmw.cn', 1),
(771, 'm.ptwqw.cn', 1),
(772, 'm.bqypw.cn', 1),
(773, 'm.ptwrw.cn', 1),
(774, 'm.pfmgw.cn', 1),
(775, 'm.bkzlw.cn', 1),
(776, 'm.mkclw.cn', 1),
(777, 'm.pncjw.cn', 1),
(778, 'm.mxqdw.cn', 1),
(779, 'm.blnqw.cn', 1),
(780, 'm.ftqtw.cn', 1),
(781, 'm.brxjw.cn', 1),
(782, 'm.bpplw.cn', 1),
(783, 'm.bfqzw.cn', 0),
(784, 'm.blnsw.cn', 1),
(785, 'm.pnlnw.cn', 1),
(786, 'm.bgrkw.cn', 0),
(787, 'm.mknkw.cn', 1),
(788, 'm.pktjw.cn', 1),
(789, 'm.blmdw.cn', 1),
(790, 'm.pnxnw.cn', 1),
(791, 'm.ptcdw.cn', 1),
(792, 'm.pgrbw.cn', 1),
(793, 'm.plghw.cn', 1),
(794, 'm.ptljw.cn', 1),
(795, 'm.pdxyw.cn', 1),
(796, 'm.ptbrw.cn', 1),
(797, 'm.pgrqw.cn', 1),
(798, 'm.plfmw.cn', 1),
(799, 'm.pnktw.cn', 0),
(800, 'm.pnclw.cn', 1),
(801, 'm.fdthw.cn', 1),
(802, 'm.pnxrw.cn', 1),
(803, 'm.pgqsw.cn', 1),
(804, 'm.pgwqw.cn', 1),
(805, 'm.fnfxw.cn', 1),
(806, 'm.ftqdw.cn', 1),
(807, 'm.mhrlw.cn', 1),
(808, 'm.mxqjw.cn', 1),
(809, 'm.mhpyw.cn', 1),
(810, 'm.pkcqw.cn', 1),
(811, 'm.mgnzw.cn', 1),
(812, 'm.phxtw.cn', 1),
(813, 'm.pmrww.cn', 1),
(814, 'm.phmww.cn', 1),
(815, 'm.ptgzw.cn', 1),
(816, 'm.pktqw.cn', 1),
(817, 'm.pkqtw.cn', 1),
(818, 'm.pdlbw.cn', 1),
(819, 'm.fngrw.cn', 1),
(820, 'm.blnmw.cn', 1),
(821, 'm.phgyw.cn', 1),
(822, 'm.pnzzw.cn', 1),
(823, 'm.bftxw.cn', 1),
(824, 'm.phlww.cn', 1),
(825, 'm.plwmw.cn', 1),
(826, 'm.pdfnw.cn', 1),
(827, 'm.pnwqw.cn', 1),
(828, 'm.pfgjw.cn', 1),
(829, 'm.fdpnw.cn', 1),
(830, 'm.fnhkw.cn', 1),
(831, 'm.bnpcw.cn', 1),
(832, 'm.pfkrw.cn', 1),
(833, 'm.pdbzw.cn', 1),
(834, 'm.plmsw.cn', 1),
(835, 'm.ftcdw.cn', 1),
(836, 'm.mkngw.cn', 1),
(837, 'm.ftpyw.cn', 0),
(838, 'm.pkfmw.cn', 1),
(839, 'm.ftjlw.cn', 1),
(840, 'm.pnwbw.cn', 0),
(841, 'm.bqrkw.cn', 1),
(842, 'm.fncgw.cn', 1),
(843, 'm.mjtkw.cn', 1),
(844, 'm.mqrjw.cn', 1),
(845, 'm.pfwrw.cn', 1),
(846, 'm.bgpww.cn', 1),
(847, 'm.mknxw.cn', 0),
(848, 'm.mjwnw.cn', 1),
(849, 'm.pdsnw.cn', 1),
(850, 'm.pdxcw.cn', 1),
(851, 'm.flffw.cn', 1),
(852, 'm.pfthw.cn', 1),
(853, 'm.pksqw.cn', 0),
(854, 'm.pfsxw.cn', 1),
(855, 'm.fdphw.cn', 1),
(856, 'm.pgtjw.cn', 1),
(857, 'm.mgnnw.cn', 1),
(858, 'm.fdfpw.cn', 1),
(859, 'm.mqhnw.cn', 1),
(860, 'm.mhqqw.cn', 1),
(861, 'm.mqwrw.cn', 1),
(862, 'm.fdndw.cn', 1),
(863, 'm.blpqw.cn', 1),
(864, 'm.pkbfw.cn', 1),
(865, 'm.bkbrw.cn', 1),
(866, 'm.mxnsw.cn', 1),
(867, 'm.fntfw.cn', 1),
(868, 'm.pnnmw.cn', 1),
(869, 'm.plcgw.cn', 1),
(870, 'm.bmypw.cn', 1),
(871, 'm.pnpzw.cn', 1),
(872, 'm.pdqhw.cn', 1),
(873, 'm.pfmbw.cn', 1),
(874, 'm.mklxw.cn', 1),
(875, 'm.fdwqw.cn', 1),
(876, 'm.pgcrw.cn', 1),
(877, 'm.pgptw.cn', 1),
(878, 'm.fnbrw.cn', 1),
(879, 'm.mkpqw.cn', 1),
(880, 'm.pdttw.cn', 1),
(881, 'm.pnzdw.cn', 1),
(882, 'm.pgzlw.cn', 1),
(883, 'm.plmzw.cn', 1),
(884, 'm.pgbsw.cn', 1),
(885, 'm.phplw.cn', 1),
(886, 'm.mkrgw.cn', 1),
(887, 'm.brzrw.cn', 1),
(888, 'm.pgqqw.cn', 1),
(889, 'm.ptzqw.cn', 1),
(890, 'm.mkrdw.cn', 1),
(891, 'm.fdkpw.cn', 1),
(892, 'm.mkqrw.cn', 1),
(893, 'm.pfqyw.cn', 1),
(894, 'm.mqrgw.cn', 1),
(895, 'm.mqrqw.cn', 1),
(896, 'm.pgnpw.cn', 1),
(897, 'm.mhypw.cn', 1),
(898, 'm.ftkbw.cn', 1),
(899, 'm.fnydw.cn', 1),
(900, 'm.pnrkw.cn', 1),
(901, 'm.phltw.cn', 1),
(902, 'm.blqjw.cn', 1),
(903, 'm.pnjgw.cn', 1),
(904, 'm.fdxqw.cn', 1),
(905, 'm.pkrbw.cn', 1),
(906, 'm.pkrpw.cn', 1),
(907, 'm.fnynw.cn', 1),
(908, 'm.pkhmw.cn', 1),
(909, 'm.pfpsw.cn', 0),
(910, 'm.phdxw.cn', 1),
(911, 'm.fnxmw.cn', 1),
(912, 'm.pkrqw.cn', 1),
(913, 'm.mxkrw.cn', 1),
(914, 'm.pbglw.cn', 1),
(915, 'm.bqxdw.cn', 1),
(916, 'm.pfrfw.cn', 1),
(917, 'm.pdbrw.cn', 1),
(918, 'm.mxljw.cn', 1),
(919, 'm.pftrw.cn', 1),
(920, 'm.bnwrw.cn', 0),
(921, 'm.blpsw.cn', 1),
(922, 'm.blbsw.cn', 1),
(923, 'm.pdwkw.cn', 1),
(924, 'm.pkdbw.cn', 1),
(925, 'm.mglkw.cn', 1),
(926, 'm.pngpw.cn', 1),
(927, 'm.mqjpw.cn', 1),
(928, 'm.pmydw.cn', 1),
(929, 'm.bnttw.cn', 1),
(930, 'm.mqfkw.cn', 0),
(931, 'm.pnhpw.cn', 1),
(932, 'm.fntrw.cn', 1),
(933, 'm.ffcnw.cn', 1),
(934, 'm.pfbww.cn', 1),
(935, 'm.ptlrw.cn', 1),
(936, 'm.pncnw.cn', 1),
(937, 'm.pfwnw.cn', 1),
(938, 'm.mjpgw.cn', 1),
(939, 'm.ptxzw.cn', 1),
(940, 'm.plkkw.cn', 1),
(941, 'm.pnkmw.cn', 1),
(942, 'm.pkttw.cn', 1),
(943, 'm.fnbbw.cn', 1),
(944, 'm.mglgw.cn', 1),
(945, 'm.pgmtw.cn', 1),
(946, 'm.ptxlw.cn', 1),
(947, 'm.mqfqw.cn', 1),
(948, 'm.ftpcw.cn', 1),
(949, 'm.ftmlw.cn', 1),
(950, 'm.pgypw.cn', 1),
(951, 'm.bllfw.cn', 1),
(952, 'm.fndpw.cn', 1),
(953, 'm.mqbtw.cn', 1),
(954, 'm.pdrww.cn', 1),
(955, 'm.pndpw.cn', 1),
(956, 'm.pdchw.cn', 1),
(957, 'm.pnkcw.cn', 1),
(958, 'm.mxfhw.cn', 1),
(959, 'm.pkmjw.cn', 1),
(960, 'm.mjplw.cn', 1),
(961, 'm.mxpzw.cn', 0),
(962, 'm.pdhkw.cn', 1),
(963, 'm.pbsnw.cn', 1),
(964, 'm.pkftw.cn', 1),
(965, 'm.mjrsw.cn', 1),
(966, 'm.fnglw.cn', 1),
(967, 'm.pbrdw.cn', 1),
(968, 'm.pgfrw.cn', 0),
(969, 'm.pdxgw.cn', 1),
(970, 'm.xtkrw.cn', 1),
(971, 'm.bpcmw.cn', 1),
(972, 'm.pdthw.cn', 1),
(973, 'm.bqwbw.cn', 1),
(974, 'm.mjyqw.cn', 1),
(975, 'm.pkdcw.cn', 1),
(976, 'm.fnjnw.cn', 1),
(977, 'm.plddw.cn', 1),
(978, 'm.ptczw.cn', 1),
(979, 'm.pdrjw.cn', 1),
(980, 'm.flpww.cn', 1),
(981, 'm.blmlw.cn', 1),
(982, 'm.pnrhw.cn', 1),
(983, 'm.mqgkw.cn', 1),
(984, 'm.mxmqw.cn', 1),
(985, 'm.xtkqw.cn', 1),
(986, 'm.xtktw.cn', 1),
(987, 'm.xtzqw.cn', 1),
(988, 'm.blnzw.cn', 1),
(989, 'm.xtyrw.cn', 1),
(990, 'm.xtddw.cn', 1),
(991, 'm.xtykw.cn', 1),
(992, 'm.xtzmw.cn', 1),
(993, 'm.xtkpw.cn', 1),
(994, 'm.xtklw.cn', 1),
(995, 'm.xtshw.cn', 1),
(996, 'm.xtypw.cn', 1),
(997, 'm.xtknw.cn', 1),
(998, 'm.xtyqw.cn', 1),
(999, 'm.xtkww.cn', 1),
(1000, 'm.xtkmw.cn', 1),
(1001, 'm.xtzdw.cn', 1),
(1002, 'm.xtytw.cn', 1),
(1003, 'm.xtkhw.cn', 0);

-- --------------------------------------------------------

--
-- 表的结构 `ruike_express`
--

CREATE TABLE IF NOT EXISTS `ruike_express` (
  `id` varchar(32) NOT NULL COMMENT '任务id',
  `express_id` int(11) NOT NULL COMMENT '司机的id（派送人id）',
  `from_memer_id` int(11) NOT NULL COMMENT '发货人meber_id',
  `from` varchar(256) NOT NULL COMMENT '发货地址',
  `from_mobile` varchar(24) NOT NULL COMMENT '发货人电话',
  `to` varchar(256) NOT NULL COMMENT '收件人地址',
  `to_username` varchar(30) DEFAULT NULL COMMENT '收货人姓名',
  `to_mobile` varchar(24) NOT NULL COMMENT '收件人电话 ',
  `goods_type` varchar(64) NOT NULL COMMENT '物品类型',
  `remark` varchar(1024) NOT NULL COMMENT '备注信息',
  `status` tinyint(4) NOT NULL COMMENT '任务状态：0下单但是未付款  1已发布，2已接单，3已收件派送中，4已签收完成，-1取消订单',
  `cancel_member` int(11) NOT NULL COMMENT '订单取消人',
  `cancel_reason` varchar(1024) DEFAULT NULL,
  `express_type` tinyint(4) NOT NULL COMMENT '快递类型：1送货 2取货 3物流',
  `total_money` float NOT NULL COMMENT '总价格',
  `goods_price` float NOT NULL COMMENT '商品价格',
  `card_id` varchar(11) NOT NULL COMMENT '优惠卷code',
  `real_pay_money` float NOT NULL COMMENT '实付金额',
  `goods_pic` int(11) NOT NULL COMMENT '物品图片',
  `score` tinyint(4) NOT NULL COMMENT '星级1-5星',
  `rate` varchar(512) NOT NULL COMMENT '评价',
  `car_type` int(11) NOT NULL COMMENT '物流车吨位类型',
  `insurance` int(11) NOT NULL COMMENT '保单金额',
  `scheduled_time` datetime DEFAULT NULL COMMENT '快递预约时间，为空时立即派送',
  `create_time` datetime NOT NULL COMMENT '下单时间',
  `incubator` varchar(512) DEFAULT NULL COMMENT '特殊要求要有保温箱',
  `time_of_receipt` datetime DEFAULT NULL COMMENT '签收时间',
  `shipping_coordinates` varchar(100) NOT NULL COMMENT '发货坐标',
  `receiving_coordinates` varchar(100) NOT NULL COMMENT '收货坐标',
  `goods_receipt_pic` int(110) unsigned NOT NULL COMMENT '收货图片',
  `goods_receipt_code` varchar(512) NOT NULL COMMENT '收件码',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ruike_express_company`
--

CREATE TABLE IF NOT EXISTS `ruike_express_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT '',
  `express` varchar(50) DEFAULT '',
  `status` tinyint(1) DEFAULT '1',
  `displayorder` tinyint(3) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=92 ;

--
-- 转存表中的数据 `ruike_express_company`
--

INSERT INTO `ruike_express_company` (`id`, `name`, `express`, `status`, `displayorder`) VALUES
(1, '顺丰', 'shunfeng', 1, 0),
(2, '申通', 'shentong', 1, 0),
(3, '韵达快运', 'yunda', 1, 0),
(4, '天天快递', 'tiantian', 1, 0),
(5, '圆通速递', 'yuantong', 1, 0),
(6, '中通速递', 'zhongtong', 1, 0),
(7, 'ems快递', 'ems', 1, 0),
(8, '汇通快运', 'huitongkuaidi', 1, 0),
(9, '全峰快递', 'quanfengkuaidi', 1, 0),
(10, '宅急送', 'zhaijisong', 1, 0),
(11, 'aae全球专递', 'aae', 1, 0),
(12, '安捷快递', 'anjie', 1, 0),
(13, '安信达快递', 'anxindakuaixi', 1, 0),
(14, '彪记快递', 'biaojikuaidi', 1, 0),
(15, 'bht', 'bht', 1, 0),
(16, '百福东方国际物流', 'baifudongfang', 1, 0),
(17, '中国东方（COE）', 'coe', 1, 0),
(18, '长宇物流', 'changyuwuliu', 1, 0),
(19, '大田物流', 'datianwuliu', 1, 0),
(20, '德邦物流', 'debangwuliu', 1, 0),
(21, 'dhl', 'dhl', 1, 0),
(22, 'dpex', 'dpex', 1, 0),
(23, 'd速快递', 'dsukuaidi', 1, 0),
(24, '递四方', 'disifang', 1, 0),
(25, 'fedex（国外）', 'fedex', 1, 0),
(26, '飞康达物流', 'feikangda', 1, 0),
(27, '凤凰快递', 'fenghuangkuaidi', 1, 0),
(28, '飞快达', 'feikuaida', 1, 0),
(29, '国通快递', 'guotongkuaidi', 1, 0),
(30, '港中能达物流', 'ganzhongnengda', 1, 0),
(31, '广东邮政物流', 'guangdongyouzhengwuliu', 1, 0),
(32, '共速达', 'gongsuda', 1, 0),
(33, '恒路物流', 'hengluwuliu', 1, 0),
(34, '华夏龙物流', 'huaxialongwuliu', 1, 0),
(35, '海红', 'haihongwangsong', 1, 0),
(36, '海外环球', 'haiwaihuanqiu', 1, 0),
(37, '佳怡物流', 'jiayiwuliu', 1, 0),
(38, '京广速递', 'jinguangsudikuaijian', 1, 0),
(39, '急先达', 'jixianda', 1, 0),
(40, '佳吉物流', 'jjwl', 1, 0),
(41, '加运美物流', 'jymwl', 1, 0),
(42, '金大物流', 'jindawuliu', 1, 0),
(43, '嘉里大通', 'jialidatong', 1, 0),
(44, '晋越快递', 'jykd', 1, 0),
(45, '快捷速递', 'kuaijiesudi', 1, 0),
(46, '联邦快递（国内）', 'lianb', 1, 0),
(47, '联昊通物流', 'lianhaowuliu', 1, 0),
(48, '龙邦物流', 'longbanwuliu', 1, 0),
(49, '立即送', 'lijisong', 1, 0),
(50, '乐捷递', 'lejiedi', 1, 0),
(51, '民航快递', 'minghangkuaidi', 1, 0),
(52, '美国快递', 'meiguokuaidi', 1, 0),
(53, '门对门', 'menduimen', 1, 0),
(54, 'OCS', 'ocs', 1, 0),
(55, '配思货运', 'peisihuoyunkuaidi', 1, 0),
(56, '全晨快递', 'quanchenkuaidi', 1, 0),
(57, '全际通物流', 'quanjitong', 1, 0),
(58, '全日通快递', 'quanritongkuaidi', 1, 0),
(59, '全一快递', 'quanyikuaidi', 1, 0),
(60, '如风达', 'rufengda', 1, 0),
(61, '三态速递', 'santaisudi', 1, 0),
(62, '盛辉物流', 'shenghuiwuliu', 1, 0),
(63, '速尔物流', 'sue', 1, 0),
(64, '盛丰物流', 'shengfeng', 1, 0),
(65, '赛澳递', 'saiaodi', 1, 0),
(66, '天地华宇', 'tiandihuayu', 1, 0),
(67, 'tnt', 'tnt', 1, 0),
(68, 'ups', 'ups', 1, 0),
(69, '万家物流', 'wanjiawuliu', 1, 0),
(70, '文捷航空速递', 'wenjiesudi', 1, 0),
(71, '伍圆', 'wuyuan', 1, 0),
(72, '万象物流', 'wxwl', 1, 0),
(73, '新邦物流', 'xinbangwuliu', 1, 0),
(74, '信丰物流', 'xinfengwuliu', 1, 0),
(75, '亚风速递', 'yafengsudi', 1, 0),
(76, '一邦速递', 'yibangwuliu', 1, 0),
(77, '优速物流', 'youshuwuliu', 1, 0),
(78, '邮政包裹挂号信', 'youzhengguonei', 1, 0),
(79, '邮政国际包裹挂号信', 'youzhengguoji', 1, 0),
(80, '远成物流', 'yuanchengwuliu', 1, 0),
(81, '源伟丰快递', 'yuanweifeng', 1, 0),
(82, '元智捷诚快递', 'yuanzhijiecheng', 1, 0),
(83, '运通快递', 'yuntongkuaidi', 1, 0),
(84, '越丰物流', 'yuefengwuliu', 1, 0),
(85, '源安达', 'yad', 1, 0),
(86, '银捷速递', 'yinjiesudi', 1, 0),
(87, '中铁快运', 'zhongtiekuaiyun', 1, 0),
(88, '中邮物流', 'zhongyouwuliu', 1, 0),
(89, '忠信达', 'zhongxinda', 1, 0),
(90, '芝麻开门', 'zhimakaimen', 1, 0),
(91, '安能物流', 'annengwuliu', 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ruike_express_record`
--

CREATE TABLE IF NOT EXISTS `ruike_express_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `express_id` varchar(32) NOT NULL COMMENT '快递单编号',
  `open_id` varchar(64) NOT NULL COMMENT '微信openid',
  `client_ip` varchar(64) NOT NULL COMMENT '用户当前ip',
  `status` tinyint(4) NOT NULL COMMENT '当前任务状态：0已发布，1已接单，2已收件派送中，3已签收完成',
  `location` varchar(128) NOT NULL COMMENT '当前位置坐标',
  `create_time` datetime NOT NULL,
  `remark` varchar(1024) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- 表的结构 `ruike_express_setting`
--

CREATE TABLE IF NOT EXISTS `ruike_express_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL COMMENT '配置名称',
  `express_type` tinyint(4) NOT NULL COMMENT '快递类型，1送货 2取货 3物流',
  `rule` varchar(2048) NOT NULL COMMENT '规则',
  `status` int(11) NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `remark` varchar(1024) DEFAULT NULL,
  `level` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '优先级',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

-- --------------------------------------------------------

--
-- 表的结构 `ruike_express_template`
--

CREATE TABLE IF NOT EXISTS `ruike_express_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(1) NOT NULL DEFAULT '1',
  `expressname` varchar(255) DEFAULT '',
  `expresscom` varchar(255) NOT NULL DEFAULT '',
  `express` varchar(255) NOT NULL DEFAULT '',
  `width` decimal(10,2) DEFAULT '0.00',
  `datas` text,
  `height` decimal(10,2) DEFAULT '0.00',
  `bg` varchar(255) DEFAULT '',
  `isdefault` tinyint(3) DEFAULT '0',
  `merchid` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_isdefault` (`isdefault`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `ruike_express_template`
--

INSERT INTO `ruike_express_template` (`id`, `type`, `expressname`, `expresscom`, `express`, `width`, `datas`, `height`, `bg`, `isdefault`, `merchid`) VALUES
(1, 1, 'aa', '顺丰', 'shunfeng', '0.00', '[{&quot;left&quot;:&quot;100px&quot;,&quot;top&quot;:&quot;10px&quot;,&quot;width&quot;:&quot;203px&quot;,&quot;height&quot;:&quot;25px&quot;,&quot;items&quot;:&quot;sendername,sendertel,senderaddress&quot;,&quot;font&quot;:&quot;微软雅黑&quot;,&quot;size&quot;:&quot;12&quot;,&quot;color&quot;:&quot;#000&quot;,&quot;string&quot;:&quot;发件人,发件人电话,发件地址&quot;,&quot;pre&quot;:&quot;&quot;,&quot;last&quot;:&quot;&quot;,&quot;align&quot;:&quot;1&quot;,&quot;cate&quot;:&quot;1&quot;}]', '130.00', '', 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ruike_fans`
--

CREATE TABLE IF NOT EXISTS `ruike_fans` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '记录id',
  `mobile` varchar(13) DEFAULT NULL COMMENT '手机号码',
  `head_pic` varchar(256) DEFAULT NULL COMMENT '头像',
  `is_focus` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '是否关注：0没关注 ，1关注',
  `open_id` varchar(60) NOT NULL,
  `power_open_id` varchar(64) NOT NULL COMMENT '服务号的openid',
  `client_ip` varchar(20) DEFAULT NULL COMMENT '投票客户端的IP地址',
  `union_id` varchar(60) DEFAULT NULL,
  `token` varchar(60) DEFAULT NULL,
  `nickname` varchar(256) DEFAULT NULL,
  `integral` int(20) unsigned DEFAULT NULL COMMENT '积分',
  `sex` tinyint(4) DEFAULT '0',
  `city` varchar(32) DEFAULT NULL,
  `province` varchar(32) DEFAULT NULL,
  `country` varchar(32) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1',
  `invite_code` varchar(64) DEFAULT NULL COMMENT '邀请码',
  PRIMARY KEY (`id`),
  KEY `open_id` (`open_id`),
  KEY `union_id` (`union_id`,`token`),
  KEY `open_id_2` (`open_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=98580 ;

--
-- 转存表中的数据 `ruike_fans`
--

INSERT INTO `ruike_fans` (`id`, `mobile`, `head_pic`, `is_focus`, `open_id`, `power_open_id`, `client_ip`, `union_id`, `token`, `nickname`, `integral`, `sex`, `city`, `province`, `country`, `status`, `invite_code`) VALUES
(73, NULL, 'http://wx.qlogo.cn/mmopen/WOm5u5FTB64Tvya3Bqt3N6gUO824JmEGibn7xthN55bg3ljibOXw4XYPtBqfuxtfcszvYCCnlbUialhl3Na6iaRs7ibop4Ezb8fBx/0', 1, 'oZCEfuM3t7ZJCNmgg3DwcnsZ_Bas', 'o_Vaow7ZKJtnrL9-FlPn9AY5EAbA', NULL, 'oPzkCwD6-QwYuYg6AMYOTcnniQIE', 'irpfjy1484563046', '哈根达斯', 0, 1, '', '', 'CN', 1, '1'),
(72, NULL, 'http://wx.qlogo.cn/mmopen/mm3yJHj7xy2MwjvvTZUJI1hlia1tmPr6m2Ac9iaprDwicThlyhXHemfHSgvgicK2r6fFkV8DIGrANnicFUnKMLluUkNtUaoET9jMy/0', 1, 'oZCEfuD6RyfKK9hRGW6aA30i2r6k', 'o_VaowzPNiJfjOIvzFpF5SUJlJzI', NULL, 'oPzkCwBFoc3Uc-CTgdfBStv7PjYg', 'atdskb1484806844', 'drin', NULL, 1, '深圳', '广东', '中国', 1, '1'),
(74, NULL, 'http://wx.qlogo.cn/mmopen/25q12yBoJH5RibHDl7tBpTNFZia9pYpI0PGSFA2VCj0jxv9SN8vNN51bL7Tm2u43g9TusEnJb8IjdaODYsiaEc6f5dWTjaMFHIy/0', 0, 'oZCEfuJPt7lZLUmExGRmESiVvwF8', 'oZCEfuJPt7lZLUmExGRmESiVvwF8', NULL, 'oPzkCwD7xm_OsGFoLxgOWhPWH6ok', 'atdskb1484806844', '我是老兵', NULL, 0, '', '', '', 1, '1'),
(67, NULL, 'http://wx.qlogo.cn/mmopen/ICicLd1X1MMSbGZyFHEhruUQzQWWlaLDfAsiadFw1sV5bMaiaAcpXFEULS1aOP1E7Ss8VicEiaWJBY8YJ6RZsH3cc8S8rYkKP1n7A/0', 1, 'o_VaowzPNiJfjOIvzFpF5SUJlJzI', '', NULL, 'oPzkCwBFoc3Uc-CTgdfBStv7PjYg', 'ygpwlc1484809425', 'drin', 799, 1, 'Shenzhen', 'Guangdong', 'CN', 1, '1'),
(75, NULL, 'http://wx.qlogo.cn/mmopen/ibhHR6OSef7xssE5NhXqBy6KATrZf9qPbBYnicHuS0E46HoTKsjduk0DFs2qYTqAytNqPe70J9OA2ELI5dTnRylWYBs1pxSUON/0', 0, 'oKQeFwiaK7DH6hGr6UUKbyNeez6w', 'oKQeFwiaK7DH6hGr6UUKbyNeez6w', NULL, '', 'irpfjy1484563046', '杨', NULL, 0, '', '', 'CN', 1, '20365mWet'),
(76, NULL, 'http://wx.qlogo.cn/mmopen/tb4TQrOLLazQMQtbic6FMW4R1XgXOC3Isy0DqzKNKl3oWAIqZPnIIsJP4vjusSdmicghYggRkVhNicVpUXMV50sRRbGB5GXZOdD/0', 0, 'oKQeFwoLkwHYx5YHMXxyB_MqfFLQ', 'oKQeFwoLkwHYx5YHMXxyB_MqfFLQ', NULL, '', 'irpfjy1484563046', 'wayne', NULL, 1, 'Shenzhen', 'Guangdong', 'CN', 1, ''),
(77, NULL, 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIxXM9PedgDz7B26oyG8GoJEZiakERzkSQicqX0RIKeEZjff0ic0ibsSkTMscU5NjMFZibAWx1Itb7H8pg/0', 0, 'oKQeFwn2k_a7VJFH5LpkEx-4B8GE', 'oKQeFwn2k_a7VJFH5LpkEx-4B8GE', NULL, '', 'irpfjy1484563046', '颜孙植', NULL, 1, 'Taizhou', 'Zhejiang', 'CN', 1, '20362fVrt');

-- --------------------------------------------------------

--
-- 表的结构 `ruike_feedback`
--

CREATE TABLE IF NOT EXISTS `ruike_feedback` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `question` text NOT NULL COMMENT '客户反应的问题',
  `phone` varchar(20) DEFAULT NULL,
  `imglist` varchar(255) DEFAULT NULL COMMENT '问题图片列表',
  `create_time` int(10) unsigned NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- 表的结构 `ruike_file`
--

CREATE TABLE IF NOT EXISTS `ruike_file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文件ID',
  `name` varchar(300) NOT NULL DEFAULT '' COMMENT '原始文件名',
  `savename` varchar(100) NOT NULL DEFAULT '' COMMENT '保存名称',
  `savepath` varchar(100) NOT NULL DEFAULT '' COMMENT '文件保存路径',
  `ext` char(5) NOT NULL DEFAULT '' COMMENT '文件后缀',
  `mime` char(40) NOT NULL DEFAULT '' COMMENT '文件mime类型',
  `size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `location` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '文件保存位置',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '远程地址',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间',
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='文件表' AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- 表的结构 `ruike_forum`
--

CREATE TABLE IF NOT EXISTS `ruike_forum` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL COMMENT '版块名称',
  `desc` text,
  `cover` int(11) NOT NULL COMMENT '封面',
  `posts_num` int(11) NOT NULL COMMENT '帖子数',
  `status` int(11) NOT NULL COMMENT '状态',
  `token` varchar(64) NOT NULL,
  `is_share` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否分享  0否  1是',
  `is_focus` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否强制关注',
  `auth_url` varchar(1024) NOT NULL,
  `share_url` varchar(4096) NOT NULL,
  `return_url` varchar(512) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- 表的结构 `ruike_forum_comments`
--

CREATE TABLE IF NOT EXISTS `ruike_forum_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fid` int(11) NOT NULL COMMENT '版块id',
  `pid` int(11) NOT NULL COMMENT '帖子id',
  `content` varchar(255) NOT NULL,
  `member_id` int(11) NOT NULL,
  `nickname` varchar(64) NOT NULL COMMENT '昵称',
  `avatar` varchar(255) NOT NULL COMMENT '头像',
  `likes_num` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `client_ip` varchar(64) NOT NULL,
  `create_time` datetime NOT NULL,
  `parent_id` int(11) DEFAULT '0' COMMENT '评论父id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=57 ;

-- --------------------------------------------------------

--
-- 表的结构 `ruike_forum_likes`
--

CREATE TABLE IF NOT EXISTS `ruike_forum_likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL COMMENT '帖子id',
  `member_id` int(11) NOT NULL,
  `is_like` tinyint(4) NOT NULL COMMENT '点赞，0取消 1点赞',
  `client_ip` varchar(64) NOT NULL,
  `last_time` datetime NOT NULL,
  `type` tinyint(4) NOT NULL COMMENT '0 是帖子点赞   1是评论点赞',
  `cid` int(11) NOT NULL COMMENT '评论id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `pid` (`pid`,`member_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

-- --------------------------------------------------------

--
-- 表的结构 `ruike_forum_posts`
--

CREATE TABLE IF NOT EXISTS `ruike_forum_posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fid` int(11) NOT NULL DEFAULT '0' COMMENT '版块或组',
  `content` varchar(255) NOT NULL COMMENT '帖子',
  `status` tinyint(4) NOT NULL COMMENT '状态 0待审核 1可用',
  `member_id` int(11) NOT NULL COMMENT '用户id',
  `nickname` varchar(255) NOT NULL,
  `avatar` varchar(255) NOT NULL COMMENT '头像地址',
  `client_ip` varchar(64) NOT NULL,
  `likes_num` int(11) NOT NULL COMMENT '点赞数',
  `comments_num` int(11) NOT NULL COMMENT '评论数',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `bg_color` varchar(255) DEFAULT NULL COMMENT '背景颜色',
  `head_pic` int(10) DEFAULT NULL COMMENT '头部图片',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=39 ;

-- --------------------------------------------------------

--
-- 表的结构 `ruike_hooks`
--

CREATE TABLE IF NOT EXISTS `ruike_hooks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `description` text COMMENT '描述',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `addons` varchar(255) NOT NULL DEFAULT '' COMMENT '钩子挂载的插件 ''，''分割',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

-- --------------------------------------------------------

--
-- 表的结构 `ruike_integral_mall`
--

CREATE TABLE IF NOT EXISTS `ruike_integral_mall` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(256) NOT NULL,
  `integral` int(11) NOT NULL COMMENT '商品积分',
  `unit` varchar(10) NOT NULL COMMENT '单位 币 豆之类的',
  `status` int(11) NOT NULL COMMENT '状态：0未上架，1正常',
  `number` int(11) NOT NULL COMMENT '商品数量',
  `cover` varchar(256) NOT NULL COMMENT '封面',
  `content` text NOT NULL COMMENT '商品介绍',
  `category` int(11) NOT NULL COMMENT '商品分类',
  `sort` tinyint(4) NOT NULL COMMENT '排序，数字越小越靠前',
  `hot` tinyint(4) NOT NULL COMMENT '推荐：0正常，1推荐',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `request_express` tinyint(4) unsigned NOT NULL COMMENT '是否需要邮寄：0要，1不要',
  `exchange_quantity` int(20) unsigned DEFAULT NULL COMMENT '兑换数量',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

-- --------------------------------------------------------

--
-- 表的结构 `ruike_integral_mall_category`
--

CREATE TABLE IF NOT EXISTS `ruike_integral_mall_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(128) NOT NULL,
  `sort` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

-- --------------------------------------------------------

--
-- 表的结构 `ruike_integral_mall_order`
--

CREATE TABLE IF NOT EXISTS `ruike_integral_mall_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL COMMENT '商品id',
  `member_id` int(11) NOT NULL COMMENT '兑换人id',
  `integral` int(11) NOT NULL COMMENT '商品积分数',
  `status` tinyint(4) NOT NULL COMMENT '状态：0兑换失败，1兑换成功 ，2已经发货，3完成',
  `client_ip` varchar(128) NOT NULL COMMENT '用户ip',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `express_id` varchar(32) DEFAULT NULL,
  `remarks` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

-- --------------------------------------------------------

--
-- 表的结构 `ruike_invite`
--

CREATE TABLE IF NOT EXISTS `ruike_invite` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `invite_id` int(10) NOT NULL COMMENT '邀请人id',
  `be_invited_id` int(20) unsigned NOT NULL COMMENT '被邀请人id',
  `invite_time` datetime DEFAULT NULL COMMENT '邀请时间',
  `entry_time` datetime DEFAULT NULL COMMENT '生效时间',
  `status` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '0，已邀请，1邀请成功',
  `type` tinyint(4) unsigned NOT NULL COMMENT '类型（0，用户端邀请，1司机端）',
  `reward_type` tinyint(4) unsigned DEFAULT '0' COMMENT '奖励类型（0，现金 1，优惠卷）',
  `reward` varchar(50) DEFAULT NULL COMMENT '奖励（类型为0时，填写金额，类型为1时填写优惠卷id）',
  `remarks` varchar(1024) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=22 ;

-- --------------------------------------------------------

--
-- 表的结构 `ruike_link`
--

CREATE TABLE IF NOT EXISTS `ruike_link` (
  `id` int(5) NOT NULL AUTO_INCREMENT COMMENT '标识ID',
  `ftype` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:友情链接 1:合作单位',
  `title` varchar(30) NOT NULL DEFAULT '' COMMENT '标题',
  `url` varchar(150) NOT NULL DEFAULT '' COMMENT '链接地址',
  `cover_id` int(11) NOT NULL DEFAULT '0' COMMENT '封面图片ID',
  `descrip` varchar(255) NOT NULL DEFAULT '' COMMENT '备注信息',
  `sort` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `hits` tinyint(7) NOT NULL DEFAULT '0' COMMENT '点击率',
  `update_time` int(10) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `uid` int(7) NOT NULL DEFAULT '0' COMMENT '用户ID ',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

-- --------------------------------------------------------

--
-- 表的结构 `ruike_lucky_money`
--

CREATE TABLE IF NOT EXISTS `ruike_lucky_money` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `description` varchar(1024) NOT NULL,
  `picture` varchar(256) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `total_amount` float NOT NULL,
  `total_num` int(11) NOT NULL,
  `can_num_limit` int(11) NOT NULL,
  `luck_num_limit` int(11) NOT NULL,
  `wishing` varchar(1024) NOT NULL,
  `nowishing` varchar(1024) NOT NULL,
  `create_time` datetime NOT NULL,
  `remark` varchar(1024) DEFAULT NULL,
  `fixed_amount` double(10,2) DEFAULT NULL COMMENT '固定金额',
  `min_amount` double(10,2) DEFAULT NULL COMMENT '最小金额',
  `max_amount` double(10,2) DEFAULT NULL COMMENT '最大金额',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

-- --------------------------------------------------------

--
-- 表的结构 `ruike_lucky_money_records`
--

CREATE TABLE IF NOT EXISTS `ruike_lucky_money_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lucky_id` int(11) NOT NULL,
  `money` float NOT NULL,
  `openid` varchar(32) NOT NULL COMMENT '微信给的id',
  `nickname` varchar(32) NOT NULL,
  `device_id` varchar(32) NOT NULL,
  `local` varchar(32) NOT NULL,
  `lucky_time` datetime NOT NULL,
  `page_id` varchar(32) NOT NULL,
  `member_id` int(30) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='红包记录表' AUTO_INCREMENT=77 ;

-- --------------------------------------------------------

--
-- 表的结构 `ruike_mall`
--

CREATE TABLE IF NOT EXISTS `ruike_mall` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seller_id` int(11) NOT NULL DEFAULT '0' COMMENT '商户id',
  `category_id` int(11) NOT NULL DEFAULT '0' COMMENT '分类id',
  `name` varchar(256) NOT NULL COMMENT '商品名称',
  `num` int(11) NOT NULL COMMENT '库存数量',
  `cover` varchar(256) NOT NULL COMMENT '商品封面',
  `unit` varchar(32) NOT NULL COMMENT '商品单位',
  `oprice` decimal(10,2) NOT NULL COMMENT '商品原价',
  `price` decimal(10,2) NOT NULL COMMENT '商品价格',
  `sales` int(11) NOT NULL COMMENT '销量',
  `fxrate_1` int(11) NOT NULL COMMENT '一级佣金',
  `fxrate_2` int(11) NOT NULL COMMENT '二级佣金',
  `fxrate_3` int(11) NOT NULL COMMENT '三级佣金',
  `sort` int(11) NOT NULL COMMENT '排序',
  `detail` text NOT NULL COMMENT '商品详情',
  `free_shipment` tinyint(4) NOT NULL COMMENT '是否包邮：0不包 1包邮件',
  `sku` int(11) NOT NULL COMMENT '商品规格id',
  `mall_img_list` varchar(512) DEFAULT NULL COMMENT '物品图片，最多6张。',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态：0下架，1上架',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=31 ;

--
-- 转存表中的数据 `ruike_mall`
--

INSERT INTO `ruike_mall` (`id`, `seller_id`, `category_id`, `name`, `num`, `cover`, `unit`, `oprice`, `price`, `sales`, `fxrate_1`, `fxrate_2`, `fxrate_3`, `sort`, `detail`, `free_shipment`, `sku`, `mall_img_list`, `status`) VALUES
(29, 7, 0, '竹妃竹纤维抽纸(20包/箱)', 1000, '347', '箱', '0.01', '0.01', 0, 20, 10, 5, 2, '<p class="article-first-p" style="height:95px;padding-top:30px"><span>竹妃竹纤维面巾纸</span><br/><span style="font-size:15px;color:#F29D53;display: block; margin-top: 5px;margin-left: -10px">￥<em style="color:#F29D53">99</em>元</span></p><p><img src="_RES_/uploads/editor/20170406/a6030ba55c1eb85f63337d19979f5c40.png" _src="_RES_/uploads/editor/20170406/a6030ba55c1eb85f63337d19979f5c40.png"/><span></span></p><div style="clear:both;overflow: hidden"><p style="height:50px;line-height:50px;text-align:center"><span>《27年，只为一张好纸》</span></p><p><iframe frameborder="0" style="clear:both;overflow: hidden;width:100%;height: 220px;" clear="both" src="http://v.qq.com/iframe/player.html?vid=u0182zgw31g&tiny=0&auto=0" allowfullscreen=""></iframe></p><p><img src="_RES_/uploads/editor/20170406/35600ebe92e62b8690605eb07537e1bc.jpg" _src="_RES_/uploads/editor/20170406/35600ebe92e62b8690605eb07537e1bc.jpg" style=""/></p><p><img src="_RES_/uploads/editor/20170406/149b3f7c85b3ce38c5daf0739d8b25ad.jpg" _src="_RES_/uploads/editor/20170406/149b3f7c85b3ce38c5daf0739d8b25ad.jpg" style=""/></p><p><img src="_RES_/uploads/editor/20170406/84ff014409ffea361885016fb9dab8cf.jpg" _src="_RES_/uploads/editor/20170406/84ff014409ffea361885016fb9dab8cf.jpg" style=""/></p><p><img src="_RES_/uploads/editor/20170406/a05cc310cbb0b27b01ba72f405f56c6a.jpg" _src="_RES_/uploads/editor/20170406/a05cc310cbb0b27b01ba72f405f56c6a.jpg" style=""/></p><p><img src="_RES_/uploads/editor/20170406/9798d19c015fb76fe24a5ac5071ad4b3.jpg" _src="_RES_/uploads/editor/20170406/9798d19c015fb76fe24a5ac5071ad4b3.jpg" style=""/></p><p><img src="_RES_/uploads/editor/20170406/80babf0898a12f03fbf3f0f74b98016d.jpg" _src="_RES_/uploads/editor/20170406/80babf0898a12f03fbf3f0f74b98016d.jpg" style=""/></p><p><img src="_RES_/uploads/editor/20170406/45a1b07135295a444688d049de6dbb96.jpg" _src="_RES_/uploads/editor/20170406/45a1b07135295a444688d049de6dbb96.jpg" style=""/></p><p><img src="_RES_/uploads/editor/20170406/1b25d93a378bb961923600c3bba6da4f.jpg" _src="_RES_/uploads/editor/20170406/1b25d93a378bb961923600c3bba6da4f.jpg" style=""/></p></div>', 0, 0, '351,352', 1),
(30, 0, 0, '竹妃竹纤维卷纸(27卷/箱)', 100000000, '348', '箱', '99.00', '99.00', 0, 0, 0, 0, 1, '<p>hellor</p>', 0, 0, '', 1);

-- --------------------------------------------------------

--
-- 表的结构 `ruike_mall_cart`
--

CREATE TABLE IF NOT EXISTS `ruike_mall_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `num` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ruike_mall_category`
--

CREATE TABLE IF NOT EXISTS `ruike_mall_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seller_id` int(11) NOT NULL,
  `category_name` varchar(128) NOT NULL,
  `sort` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

-- --------------------------------------------------------

--
-- 表的结构 `ruike_mall_comment`
--

CREATE TABLE IF NOT EXISTS `ruike_mall_comment` (
  `comment_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论id',
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `email` varchar(60) NOT NULL DEFAULT '' COMMENT 'email邮箱',
  `username` varchar(60) NOT NULL DEFAULT '' COMMENT '用户名',
  `content` varchar(2048) NOT NULL COMMENT '评论内容',
  `deliver_rank` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '物流评价等级',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `ip_address` varchar(15) NOT NULL DEFAULT '' COMMENT 'ip地址',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否显示',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论用户',
  `img` text COMMENT '晒单图片',
  `order_id` mediumint(8) DEFAULT NULL COMMENT '订单id',
  `goods_rank` tinyint(1) DEFAULT NULL COMMENT '商品评价等级',
  `service_rank` tinyint(1) DEFAULT NULL COMMENT '商家服务态度评价等级',
  PRIMARY KEY (`comment_id`),
  KEY `parent_id` (`parent_id`),
  KEY `id_value` (`goods_id`),
  KEY `goods_id` (`goods_id`,`is_show`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=336 ;

--
-- 转存表中的数据 `ruike_mall_comment`
--

INSERT INTO `ruike_mall_comment` (`comment_id`, `goods_id`, `email`, `username`, `content`, `deliver_rank`, `add_time`, `ip_address`, `is_show`, `parent_id`, `user_id`, `img`, `order_id`, `goods_rank`, `service_rank`) VALUES
(332, 29, '16666666666@qq.com', '18888888888', '商品不错', 0, 0, '', 1, 0, 1, NULL, NULL, NULL, NULL),
(1, 29, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 3, 1457746403, '127.0.0.1', 1, 0, 1, '', 1, 4, 4),
(2, 39, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 3, 1457746403, '127.0.0.1', 1, 0, 1, '', 1, 4, 3),
(3, 40, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 2, 1457746403, '127.0.0.1', 1, 0, 1, '', 1, 5, 4),
(4, 41, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 2, 1457746403, '127.0.0.1', 1, 0, 1, '', 1, 5, 5),
(330, 1, '', 'admin', '发反反复复反反复复发生大幅沙敦府', 0, 1482312962, '', 1, 1, 1, NULL, NULL, NULL, NULL),
(329, 41, '', 'admin', '阿斯顿发生的发生的', 0, 1482312928, '', 1, 4, 1, NULL, NULL, NULL, NULL),
(7, 44, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 2, 1457746403, '127.0.0.1', 0, 0, 1, '', 1, 5, 4),
(327, 41, '', 'admin', '100yuan', 0, 1482225257, '', 1, 4, 1, NULL, NULL, NULL, NULL),
(328, 41, '', 'admin', '共产主义', 0, 1482225499, '', 1, 327, 1, NULL, NULL, NULL, NULL),
(9, 46, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 2, 1457746403, '127.0.0.1', 0, 0, 1, '', 1, 5, 5),
(10, 47, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 5, 1457746403, '127.0.0.1', 0, 0, 1, '', 1, 3, 3),
(11, 48, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 4, 1457746403, '127.0.0.1', 0, 0, 1, '', 1, 3, 5),
(12, 49, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 2, 1457746403, '127.0.0.1', 0, 0, 1, '', 1, 4, 5),
(13, 50, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 4, 1457746403, '127.0.0.1', 0, 0, 1, '', 1, 4, 5),
(14, 51, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 3, 1457746403, '127.0.0.1', 0, 0, 1, '', 1, 5, 5),
(15, 52, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 4, 1457746403, '127.0.0.1', 0, 0, 1, '', 1, 3, 4),
(16, 53, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 2, 1457746403, '127.0.0.1', 1, 0, 1, '', 1, 3, 3),
(17, 54, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 5, 1457746403, '127.0.0.1', 1, 0, 1, '', 1, 4, 3),
(18, 55, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 5, 1457746403, '127.0.0.1', 1, 0, 1, '', 1, 4, 4),
(19, 56, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 5, 1457746403, '127.0.0.1', 1, 0, 1, '', 1, 5, 3),
(20, 57, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 3, 1457746403, '127.0.0.1', 1, 0, 1, '', 1, 4, 4),
(21, 58, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 3, 1457746403, '127.0.0.1', 1, 0, 1, '', 1, 5, 4),
(22, 59, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 3, 1457746403, '127.0.0.1', 1, 0, 1, '', 1, 3, 4),
(23, 60, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 2, 1457746403, '127.0.0.1', 1, 0, 1, '', 1, 3, 3),
(24, 61, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 4, 1457746403, '127.0.0.1', 1, 0, 1, '', 1, 4, 5),
(25, 62, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 5, 1457746403, '127.0.0.1', 1, 0, 1, '', 1, 3, 4),
(26, 63, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 2, 1457746403, '127.0.0.1', 1, 0, 1, '', 1, 4, 5),
(27, 64, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 2, 1457746403, '127.0.0.1', 1, 0, 1, '', 1, 4, 4),
(28, 65, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 2, 1457746403, '127.0.0.1', 1, 0, 1, '', 1, 5, 4),
(29, 66, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 4, 1457746403, '127.0.0.1', 1, 0, 1, '', 1, 5, 5),
(30, 67, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 4, 1457746403, '127.0.0.1', 1, 0, 1, '', 1, 5, 5),
(31, 68, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 5, 1457746403, '127.0.0.1', 1, 0, 1, '', 1, 3, 3),
(32, 69, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 3, 1457746403, '127.0.0.1', 1, 0, 1, '', 1, 4, 4),
(33, 70, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 3, 1457746403, '127.0.0.1', 1, 0, 1, '', 1, 5, 5),
(34, 71, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 3, 1457746403, '127.0.0.1', 1, 0, 1, '', 1, 3, 5),
(35, 72, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 5, 1457746403, '127.0.0.1', 1, 0, 1, '', 1, 3, 3),
(36, 73, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 4, 1457746403, '127.0.0.1', 1, 0, 1, '', 1, 3, 3),
(37, 74, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 4, 1457746403, '127.0.0.1', 1, 0, 1, '', 1, 3, 4),
(38, 75, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 2, 1457746403, '127.0.0.1', 1, 0, 1, '', 1, 4, 4),
(39, 76, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 5, 1457746403, '127.0.0.1', 1, 0, 1, '', 1, 3, 4),
(40, 77, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 4, 1457746403, '127.0.0.1', 1, 0, 1, '', 1, 4, 3),
(41, 78, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 4, 1457746403, '127.0.0.1', 1, 0, 1, '', 1, 3, 4),
(42, 79, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 3, 1457746403, '127.0.0.1', 1, 0, 1, '', 1, 3, 5),
(43, 80, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 2, 1457746403, '127.0.0.1', 1, 0, 1, '', 1, 3, 3),
(44, 81, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 3, 1457746403, '127.0.0.1', 1, 0, 1, '', 1, 3, 4),
(45, 82, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 3, 1457746403, '127.0.0.1', 1, 0, 1, '', 1, 4, 4),
(46, 83, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 2, 1457746403, '127.0.0.1', 1, 0, 1, '', 1, 5, 5),
(47, 84, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 5, 1457746403, '127.0.0.1', 1, 0, 1, '', 1, 5, 3),
(48, 85, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 4, 1457746403, '127.0.0.1', 1, 0, 1, '', 1, 3, 3),
(49, 86, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 2, 1457746403, '127.0.0.1', 1, 0, 1, '', 1, 4, 3),
(50, 87, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 5, 1457746403, '127.0.0.1', 1, 0, 1, '', 1, 4, 4),
(51, 88, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 2, 1457746403, '127.0.0.1', 1, 0, 1, '', 1, 5, 3),
(52, 89, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 2, 1457746403, '127.0.0.1', 1, 0, 1, '', 1, 4, 5),
(53, 90, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 3, 1457746403, '127.0.0.1', 1, 0, 1, '', 1, 3, 5),
(54, 91, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 2, 1457746403, '127.0.0.1', 1, 0, 1, '', 1, 3, 4),
(55, 92, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 4, 1457746403, '127.0.0.1', 1, 0, 1, '', 1, 4, 3),
(56, 93, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 3, 1457746403, '127.0.0.1', 1, 0, 1, '', 1, 4, 3),
(57, 94, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 4, 1457746403, '127.0.0.1', 1, 0, 1, '', 1, 5, 5),
(58, 95, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 4, 1457746403, '127.0.0.1', 1, 0, 1, '', 1, 4, 5),
(59, 96, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 3, 1457746403, '127.0.0.1', 1, 0, 1, '', 1, 4, 5),
(60, 97, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 4, 1457746403, '127.0.0.1', 1, 0, 1, '', 1, 3, 3),
(61, 98, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 5, 1457746403, '127.0.0.1', 1, 0, 1, '', 1, 3, 4),
(62, 99, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 2, 1457746403, '127.0.0.1', 1, 0, 1, '', 1, 5, 3),
(63, 100, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 4, 1457746403, '127.0.0.1', 1, 0, 1, '', 1, 5, 3),
(64, 101, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 3, 1457746403, '127.0.0.1', 1, 0, 1, '', 1, 3, 5),
(65, 102, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 5, 1457746403, '127.0.0.1', 1, 0, 1, '', 1, 4, 4),
(66, 103, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 3, 1457746403, '127.0.0.1', 1, 0, 1, '', 1, 3, 5),
(67, 1, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 5, 1457746449, '127.0.0.1', 1, 0, 1, '', 1, 5, 3),
(68, 39, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 5, 1457746449, '127.0.0.1', 1, 0, 1, '', 1, 4, 3),
(69, 40, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 4, 1457746449, '127.0.0.1', 1, 0, 1, '', 1, 5, 5),
(70, 41, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 4, 1457746449, '127.0.0.1', 1, 0, 1, '', 1, 3, 4),
(71, 42, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 2, 1457746449, '127.0.0.1', 1, 0, 1, '', 1, 4, 4),
(72, 43, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 5, 1457746449, '127.0.0.1', 1, 0, 1, '', 1, 5, 4),
(73, 44, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 5, 1457746449, '127.0.0.1', 1, 0, 1, '', 1, 3, 4),
(74, 45, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 5, 1457746449, '127.0.0.1', 1, 0, 1, '', 1, 3, 4),
(75, 46, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 5, 1457746449, '127.0.0.1', 1, 0, 1, '', 1, 3, 5),
(76, 47, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 3, 1457746449, '127.0.0.1', 1, 0, 1, '', 1, 5, 3),
(77, 48, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 4, 1457746449, '127.0.0.1', 1, 0, 1, '', 1, 4, 4),
(78, 49, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 4, 1457746449, '127.0.0.1', 1, 0, 1, '', 1, 5, 5),
(79, 50, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 3, 1457746449, '127.0.0.1', 1, 0, 1, '', 1, 5, 4),
(80, 51, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 5, 1457746449, '127.0.0.1', 1, 0, 1, '', 1, 4, 4),
(81, 52, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 4, 1457746449, '127.0.0.1', 1, 0, 1, '', 1, 4, 5),
(82, 53, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 4, 1457746449, '127.0.0.1', 1, 0, 1, '', 1, 4, 3),
(83, 54, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 5, 1457746449, '127.0.0.1', 1, 0, 1, '', 1, 4, 3),
(84, 55, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 5, 1457746449, '127.0.0.1', 1, 0, 1, '', 1, 4, 5),
(85, 56, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 4, 1457746449, '127.0.0.1', 1, 0, 1, '', 1, 3, 5),
(86, 57, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 4, 1457746449, '127.0.0.1', 1, 0, 1, '', 1, 3, 3),
(87, 58, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 4, 1457746449, '127.0.0.1', 1, 0, 1, '', 1, 4, 4),
(88, 59, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 5, 1457746449, '127.0.0.1', 1, 0, 1, '', 1, 5, 3),
(89, 60, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 5, 1457746449, '127.0.0.1', 1, 0, 1, '', 1, 4, 5),
(90, 61, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 2, 1457746449, '127.0.0.1', 1, 0, 1, '', 1, 5, 5),
(91, 62, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 5, 1457746449, '127.0.0.1', 1, 0, 1, '', 1, 3, 4),
(92, 63, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 2, 1457746449, '127.0.0.1', 1, 0, 1, '', 1, 4, 5),
(93, 64, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 2, 1457746449, '127.0.0.1', 1, 0, 1, '', 1, 4, 3),
(94, 65, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 4, 1457746449, '127.0.0.1', 1, 0, 1, '', 1, 5, 4),
(95, 66, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 2, 1457746449, '127.0.0.1', 1, 0, 1, '', 1, 4, 4),
(96, 67, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 2, 1457746449, '127.0.0.1', 1, 0, 1, '', 1, 4, 5),
(97, 68, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 4, 1457746449, '127.0.0.1', 1, 0, 1, '', 1, 5, 5),
(98, 69, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 2, 1457746449, '127.0.0.1', 1, 0, 1, '', 1, 4, 3),
(99, 70, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 2, 1457746449, '127.0.0.1', 1, 0, 1, '', 1, 5, 4),
(100, 71, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 2, 1457746449, '127.0.0.1', 1, 0, 1, '', 1, 4, 3),
(101, 72, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 2, 1457746449, '127.0.0.1', 1, 0, 1, '', 1, 4, 4),
(102, 73, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 2, 1457746449, '127.0.0.1', 1, 0, 1, '', 1, 5, 5),
(103, 74, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 5, 1457746449, '127.0.0.1', 1, 0, 1, '', 1, 5, 3),
(104, 75, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 4, 1457746449, '127.0.0.1', 1, 0, 1, '', 1, 5, 4),
(105, 76, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 2, 1457746449, '127.0.0.1', 1, 0, 1, '', 1, 3, 5),
(106, 77, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 2, 1457746449, '127.0.0.1', 1, 0, 1, '', 1, 5, 5),
(107, 78, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 2, 1457746449, '127.0.0.1', 1, 0, 1, '', 1, 5, 4),
(108, 79, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 3, 1457746449, '127.0.0.1', 1, 0, 1, '', 1, 3, 4),
(109, 80, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 2, 1457746449, '127.0.0.1', 1, 0, 1, '', 1, 3, 3),
(110, 81, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 2, 1457746449, '127.0.0.1', 1, 0, 1, '', 1, 3, 5),
(111, 82, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 3, 1457746449, '127.0.0.1', 1, 0, 1, '', 1, 3, 3),
(112, 83, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 2, 1457746449, '127.0.0.1', 1, 0, 1, '', 1, 4, 4),
(113, 84, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 4, 1457746449, '127.0.0.1', 1, 0, 1, '', 1, 3, 4),
(114, 85, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 3, 1457746449, '127.0.0.1', 1, 0, 1, '', 1, 3, 5),
(115, 86, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 5, 1457746449, '127.0.0.1', 1, 0, 1, '', 1, 3, 5),
(116, 87, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 4, 1457746449, '127.0.0.1', 1, 0, 1, '', 1, 3, 5),
(117, 88, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 3, 1457746449, '127.0.0.1', 1, 0, 1, '', 1, 3, 3),
(118, 89, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 5, 1457746449, '127.0.0.1', 1, 0, 1, '', 1, 3, 4),
(119, 90, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 5, 1457746449, '127.0.0.1', 1, 0, 1, '', 1, 5, 3),
(120, 91, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 3, 1457746449, '127.0.0.1', 1, 0, 1, '', 1, 3, 3),
(121, 92, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 3, 1457746449, '127.0.0.1', 1, 0, 1, '', 1, 3, 5),
(122, 93, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 3, 1457746449, '127.0.0.1', 1, 0, 1, '', 1, 4, 4),
(123, 94, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 4, 1457746449, '127.0.0.1', 1, 0, 1, '', 1, 3, 5),
(124, 95, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 4, 1457746449, '127.0.0.1', 1, 0, 1, '', 1, 4, 3),
(125, 96, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 5, 1457746449, '127.0.0.1', 1, 0, 1, '', 1, 5, 3),
(126, 97, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 5, 1457746449, '127.0.0.1', 1, 0, 1, '', 1, 4, 5),
(127, 98, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 4, 1457746449, '127.0.0.1', 1, 0, 1, '', 1, 3, 3),
(128, 99, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 4, 1457746449, '127.0.0.1', 1, 0, 1, '', 1, 5, 5),
(129, 100, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 5, 1457746449, '127.0.0.1', 1, 0, 1, '', 1, 5, 3),
(130, 101, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 5, 1457746449, '127.0.0.1', 1, 0, 1, '', 1, 4, 3),
(131, 102, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 5, 1457746449, '127.0.0.1', 1, 0, 1, '', 1, 4, 3),
(132, 103, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 3, 1457746449, '127.0.0.1', 1, 0, 1, '', 1, 4, 3),
(133, 1, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 5, 1457746625, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/03-09/56e01a54a2c6d.jpg";i:1;s:49:"/Public/upload/goods/2016/03-09/56e01a54bcc53.jpg";i:2;s:49:"/Public/upload/goods/2016/03-09/56e01a54de5a9.jpg";}', 1, 2, 1),
(134, 39, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 1, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-13/5695bc6403c1b.jpg";i:1;s:49:"/Public/upload/goods/2016/01-13/5695bc6426660.jpg";i:2;s:49:"/Public/upload/goods/2016/01-13/5695bc644906d.jpg";}', 1, 4, 5),
(135, 40, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 4, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-13/5695be3a2a47b.jpg";i:1;s:49:"/Public/upload/goods/2016/01-13/5695be3a4ced1.jpg";i:2;s:49:"/Public/upload/goods/2016/01-13/5695be3a60cc2.jpg";}', 1, 5, 3),
(136, 41, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 0, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-13/5695bfa3130fe.jpg";i:1;s:49:"/Public/upload/goods/2016/01-13/5695bfa2f2b92.jpg";i:2;s:49:"/Public/upload/goods/2016/01-13/5695bfa2d3f78.jpg";}', 1, 2, 5),
(137, 42, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 0, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-13/5695c8835131f.jpg";i:1;s:49:"/Public/upload/goods/2016/01-13/5695c7340c3c7.png";i:2;s:49:"/Public/upload/goods/2016/01-13/5695c884b21c0.jpg";}', 1, 4, 2),
(138, 43, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 4, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-13/5695c0f6bbfa9.jpg";i:1;s:49:"/Public/upload/goods/2016/01-13/5695c0f6a8cfa.jpg";i:2;s:49:"/Public/upload/goods/2016/01-13/5695c0f692507.jpg";}', 1, 5, 4),
(139, 44, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 3, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-13/5695c1f7ca3c0.jpg";i:1;s:49:"/Public/upload/goods/2016/01-13/5695c1f7b4037.jpg";i:2;s:49:"/Public/upload/goods/2016/01-13/5695c1f79accb.jpg";}', 1, 5, 0),
(140, 45, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 4, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-13/5695e931ca316.jpg";i:1;s:49:"/Public/upload/goods/2016/01-13/5695e931b2751.jpg";i:2;s:49:"/Public/upload/goods/2016/01-13/5695e9319ae9b.jpg";}', 1, 4, 0),
(141, 46, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 5, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-13/5695ef5a121e0.jpg";i:1;s:49:"/Public/upload/goods/2016/01-13/5695ef59edc08.jpg";i:2;s:49:"/Public/upload/goods/2016/01-13/5695ef59db973.jpg";}', 1, 5, 1),
(142, 47, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 0, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-13/5695f46121de2.jpg";i:1;s:49:"/Public/upload/goods/2016/01-13/5695f46109a55.jpg";i:2;s:49:"/Public/upload/goods/2016/01-13/5695f460d9be3.jpg";}', 1, 2, 4),
(143, 48, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 4, 1457746626, '127.0.0.1', 1, 0, 1, 'a:2:{i:0;s:49:"/Public/upload/goods/2016/01-13/5695f99db14f2.jpg";i:1;s:49:"/Public/upload/goods/2016/01-13/5695f99d8cf8f.jpg";}', 1, 0, 0),
(144, 49, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 3, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-13/569600fcb09e9.jpg";i:1;s:49:"/Public/upload/goods/2016/01-13/569600fc992df.jpg";i:2;s:49:"/Public/upload/goods/2016/01-13/569600fc73203.jpg";}', 1, 3, 0),
(145, 50, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 5, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-13/569603691addc.jpg";i:1;s:49:"/Public/upload/goods/2016/01-13/56960369057f8.jpg";i:2;s:49:"/Public/upload/goods/2016/01-13/56960368e45f5.jpg";}', 1, 4, 0),
(146, 51, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 1, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-13/56960931469a8.jpg";i:1;s:49:"/Public/upload/goods/2016/01-13/56960930d4628.jpg";i:2;s:49:"/Public/upload/goods/2016/01-13/56960930b6a32.jpg";}', 1, 1, 1),
(147, 52, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 5, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-13/56960d9958b28.jpg";i:1;s:49:"/Public/upload/goods/2016/01-13/56960d99415e4.jpg";i:2;s:49:"/Public/upload/goods/2016/01-13/56960d992f857.jpg";}', 1, 3, 1),
(148, 53, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 0, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-13/5696114bd63f7.jpg";i:1;s:49:"/Public/upload/goods/2016/01-13/5696114bc21c5.jpg";i:2;s:49:"/Public/upload/goods/2016/01-13/5696114baf034.jpg";}', 1, 2, 2),
(149, 54, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 0, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-13/569612581ea27.jpg";i:1;s:49:"/Public/upload/goods/2016/01-13/569612580975d.jpg";i:2;s:49:"/Public/upload/goods/2016/01-13/56961257eb4bb.jpg";}', 1, 5, 1),
(150, 55, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 2, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-13/5696137544eff.jpg";i:1;s:49:"/Public/upload/goods/2016/01-13/56961375304b1.jpg";i:2;s:49:"/Public/upload/goods/2016/01-13/569613751cd2d.jpg";}', 1, 0, 4),
(151, 56, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 3, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-14/56970ffcb99f8.jpg";i:1;s:49:"/Public/upload/goods/2016/01-14/56970ffc7cfca.jpg";i:2;s:49:"/Public/upload/goods/2016/01-14/56970ffc37d61.jpg";}', 1, 1, 3),
(152, 57, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 1, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-14/5697110e71cca.jpg";i:1;s:49:"/Public/upload/goods/2016/01-14/5697110e518b1.jpg";i:2;s:49:"/Public/upload/goods/2016/01-14/5697110e3e83f.jpg";}', 1, 0, 2),
(153, 58, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 2, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-14/569714ad81e71.jpg";i:1;s:49:"/Public/upload/goods/2016/01-14/569714ad5db16.jpg";i:2;s:49:"/Public/upload/goods/2016/01-14/569714ad445ad.jpg";}', 1, 2, 2),
(154, 59, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 3, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-14/5697492ac6ce6.jpg";i:1;s:49:"/Public/upload/goods/2016/01-14/5697492aa9c2a.jpg";i:2;s:49:"/Public/upload/goods/2016/01-14/5697492a899e1.jpg";}', 1, 1, 0),
(155, 60, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 3, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-14/5697525ce387e.jpg";i:1;s:49:"/Public/upload/goods/2016/01-14/5697525cc175c.jpg";i:2;s:49:"/Public/upload/goods/2016/01-14/569752597836f.jpg";}', 1, 1, 4),
(156, 61, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 4, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-14/56975c9e889f0.jpg";i:1;s:49:"/Public/upload/goods/2016/01-14/56975c9e712d2.jpg";i:2;s:49:"/Public/upload/goods/2016/01-14/56975c9e5b5e9.jpg";}', 1, 2, 0),
(157, 62, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 4, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-14/569769e715c1a.jpg";i:1;s:49:"/Public/upload/goods/2016/01-14/569769e6f2f82.jpg";i:2;s:49:"/Public/upload/goods/2016/01-14/569769e6de4df.jpg";}', 1, 5, 0),
(158, 63, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 3, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-15/56985460def2d.jpg";i:1;s:49:"/Public/upload/goods/2016/01-15/56985460be7df.jpg";i:2;s:49:"/Public/upload/goods/2016/01-15/56985460a59db.jpg";}', 1, 0, 4),
(159, 64, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 3, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-15/5698555a28000.jpg";i:1;s:49:"/Public/upload/goods/2016/01-15/5698555a0bf59.jpg";i:2;s:49:"/Public/upload/goods/2016/01-15/56985559dbde4.jpg";}', 1, 2, 1),
(160, 65, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 3, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-15/569856df42cbd.jpg";i:1;s:49:"/Public/upload/goods/2016/01-15/569856df2086d.jpg";i:2;s:49:"/Public/upload/goods/2016/01-15/569856df05157.jpg";}', 1, 4, 2),
(161, 66, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 0, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-15/56985aaf7fd1b.jpg";i:1;s:49:"/Public/upload/goods/2016/01-15/56985aaf556a0.jpg";i:2;s:49:"/Public/upload/goods/2016/01-15/56985aaf2de8a.jpg";}', 1, 0, 2),
(162, 67, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 4, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-15/569862a30290b.jpg";i:1;s:49:"/Public/upload/goods/2016/01-15/569862a2db60b.jpg";i:2;s:49:"/Public/upload/goods/2016/01-15/569862a2b953e.jpg";}', 1, 0, 0),
(163, 68, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 5, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-15/56986502e0a52.jpg";i:1;s:49:"/Public/upload/goods/2016/01-15/56986502c6e5a.jpg";i:2;s:49:"/Public/upload/goods/2016/01-15/56986502a475c.jpg";}', 1, 1, 1),
(164, 69, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 1, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-15/56988e0e6f15d.jpg";i:1;s:49:"/Public/upload/goods/2016/01-15/56988e0e5024a.jpg";i:2;s:49:"/Public/upload/goods/2016/01-15/56988e0e379b4.jpg";}', 1, 5, 1),
(165, 70, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 0, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-15/56989004b635d.jpg";i:1;s:49:"/Public/upload/goods/2016/01-15/5698900493b9e.jpg";i:2;s:49:"/Public/upload/goods/2016/01-15/569890047b83d.jpg";}', 1, 5, 3),
(166, 71, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 5, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-15/5698b4de40ef3.jpg";i:1;s:49:"/Public/upload/goods/2016/01-15/5698b4de205b1.jpg";i:2;s:49:"/Public/upload/goods/2016/01-15/5698b4de0409e.jpg";}', 1, 3, 1),
(167, 72, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 3, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-15/5698c8bd543f7.jpg";i:1;s:49:"/Public/upload/goods/2016/01-15/5698c8bd3a9a0.jpg";i:2;s:49:"/Public/upload/goods/2016/01-15/5698c8bd19b19.jpg";}', 1, 0, 1),
(168, 73, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 4, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-16/5699b40fef3f6.jpg";i:1;s:49:"/Public/upload/goods/2016/01-16/5699b40fcb646.jpg";i:2;s:49:"/Public/upload/goods/2016/01-16/5699b40f99a6b.jpg";}', 1, 1, 0),
(169, 74, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 5, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-16/5699f30f76a97.jpg";i:1;s:49:"/Public/upload/goods/2016/01-16/5699f30f5286d.jpg";i:2;s:49:"/Public/upload/goods/2016/01-16/5699f30f28676.jpg";}', 1, 5, 2),
(170, 75, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 5, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-18/569c3ef96aa71.jpg";i:1;s:49:"/Public/upload/goods/2016/01-18/569c3ef943711.jpg";i:2;s:49:"/Public/upload/goods/2016/01-18/569c3ef91f666.jpg";}', 1, 0, 3),
(171, 76, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 0, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-18/569c41f5937a9.jpg";i:1;s:49:"/Public/upload/goods/2016/01-18/569c41f571d08.jpg";i:2;s:49:"/Public/upload/goods/2016/01-18/569c41f546a70.jpg";}', 1, 3, 4),
(172, 77, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 4, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-18/569c5abc25e65.jpg";i:1;s:49:"/Public/upload/goods/2016/01-18/569c5abc09442.jpg";i:2;s:49:"/Public/upload/goods/2016/01-18/569c5abbdbea5.jpg";}', 1, 0, 2),
(173, 78, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 2, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-18/569c5d27ad1b7.jpg";i:1;s:49:"/Public/upload/goods/2016/01-18/569c5d2793d1b.jpg";i:2;s:49:"/Public/upload/goods/2016/01-18/569c5d2776313.jpg";}', 1, 0, 2),
(174, 79, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 1, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-18/569c82ed7d5aa.jpg";i:1;s:49:"/Public/upload/goods/2016/01-18/569c82ed59c7a.jpg";i:2;s:49:"/Public/upload/goods/2016/01-18/569c82ed43834.jpg";}', 1, 0, 3),
(175, 80, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 1, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-18/569c86423ab5f.jpg";i:1;s:49:"/Public/upload/goods/2016/01-18/569c86422181d.jpg";i:2;s:49:"/Public/upload/goods/2016/01-18/569c8641f21a2.jpg";}', 1, 2, 0),
(176, 81, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 0, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-18/569cb7174c173.jpg";i:1;s:49:"/Public/upload/goods/2016/01-18/569cb71732782.jpg";i:2;s:49:"/Public/upload/goods/2016/01-18/569cb71712765.jpg";}', 1, 1, 4),
(177, 82, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 2, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-19/569de0d4100cb.jpg";i:1;s:49:"/Public/upload/goods/2016/01-19/569de0d3dc011.jpg";i:2;s:49:"/Public/upload/goods/2016/01-19/569de0d3bcb9a.jpg";}', 1, 1, 3),
(178, 83, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 3, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-19/569de27026343.jpg";i:1;s:49:"/Public/upload/goods/2016/01-19/569de27008d44.jpg";i:2;s:49:"/Public/upload/goods/2016/01-19/569de26fdd1a1.jpg";}', 1, 3, 0),
(179, 84, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 2, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-20/569f355dc2852.jpg";i:1;s:49:"/Public/upload/goods/2016/01-20/569f355d98268.jpg";i:2;s:49:"/Public/upload/goods/2016/01-20/569f355d6a8c4.jpg";}', 1, 5, 3),
(180, 85, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 2, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-20/569f361a147e3.jpg";i:1;s:49:"/Public/upload/goods/2016/01-20/569f3619eb9ad.jpg";i:2;s:49:"/Public/upload/goods/2016/01-20/569f3619c8ec4.jpg";}', 1, 0, 4),
(181, 86, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 5, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-20/569f36c197ea6.jpg";i:1;s:49:"/Public/upload/goods/2016/01-20/569f36c17498e.jpg";i:2;s:49:"/Public/upload/goods/2016/01-20/569f36c14820c.jpg";}', 1, 0, 1),
(182, 87, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 1, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-20/569f379d13b6e.jpg";i:1;s:49:"/Public/upload/goods/2016/01-20/569f379ce020f.jpg";i:2;s:49:"/Public/upload/goods/2016/01-20/569f379cba59a.jpg";}', 1, 2, 4),
(183, 88, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 2, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-20/569f5f4203f96.jpg";i:1;s:49:"/Public/upload/goods/2016/01-20/569f5f41d29d6.jpg";i:2;s:49:"/Public/upload/goods/2016/01-20/569f5f41acd33.jpg";}', 1, 4, 4),
(184, 89, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 3, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-21/56a033c190b20.jpg";i:1;s:49:"/Public/upload/goods/2016/01-21/56a033c1722bb.jpg";i:2;s:49:"/Public/upload/goods/2016/01-21/56a033c1530fb.jpg";}', 1, 5, 4),
(185, 90, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 3, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-21/56a04168c20be.jpg";i:1;s:49:"/Public/upload/goods/2016/01-21/56a041688d362.jpg";i:2;s:49:"/Public/upload/goods/2016/01-21/56a0416867bbf.jpg";}', 1, 1, 2),
(186, 91, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 0, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-21/56a08a626e7d6.jpg";i:1;s:49:"/Public/upload/goods/2016/01-21/56a08a624e240.jpg";i:2;s:49:"/Public/upload/goods/2016/01-21/56a08a622ffc3.jpg";}', 1, 4, 3),
(187, 92, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 0, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-21/56a08b0393510.jpg";i:1;s:49:"/Public/upload/goods/2016/01-21/56a08b0374d84.jpg";i:2;s:49:"/Public/upload/goods/2016/01-21/56a08b035878e.jpg";}', 1, 0, 5),
(188, 93, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 2, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-21/56a08b83f03f6.jpg";i:1;s:49:"/Public/upload/goods/2016/01-21/56a08b83d1225.jpg";i:2;s:49:"/Public/upload/goods/2016/01-21/56a08b83af7b1.jpg";}', 1, 3, 3),
(189, 94, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 4, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-21/56a08c04e2b94.jpg";i:1;s:49:"/Public/upload/goods/2016/01-21/56a08c04c5ac7.jpg";i:2;s:49:"/Public/upload/goods/2016/01-21/56a08c04a4150.jpg";}', 1, 4, 1),
(190, 95, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 0, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-21/56a08cbe3cbc3.jpg";i:1;s:49:"/Public/upload/goods/2016/01-21/56a08cbe1d096.jpg";i:2;s:49:"/Public/upload/goods/2016/01-21/56a08cbdf153c.jpg";}', 1, 0, 1),
(191, 96, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 4, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-21/56a08d4c42e99.jpg";i:1;s:49:"/Public/upload/goods/2016/01-21/56a08d4c25b37.jpg";i:2;s:49:"/Public/upload/goods/2016/01-21/56a08d4c0a8cb.jpg";}', 1, 0, 3),
(192, 97, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 5, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-21/56a08e46bfddf.jpg";i:1;s:49:"/Public/upload/goods/2016/01-21/56a08e46a58be.jpg";i:2;s:49:"/Public/upload/goods/2016/01-21/56a08e4686fa8.jpg";}', 1, 2, 1),
(193, 98, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 5, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-21/56a08ebdef116.jpg";i:1;s:49:"/Public/upload/goods/2016/01-21/56a08ebdd7128.jpg";i:2;s:49:"/Public/upload/goods/2016/01-21/56a08ebdbdf39.jpg";}', 1, 1, 5),
(194, 99, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 1, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-21/56a08f7370fba.jpg";i:1;s:49:"/Public/upload/goods/2016/01-21/56a08f734e42e.jpg";i:2;s:49:"/Public/upload/goods/2016/01-21/56a08f7336991.jpg";}', 1, 4, 3),
(195, 100, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 1, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-21/56a08fd941a91.jpg";i:1;s:49:"/Public/upload/goods/2016/01-21/56a08fd9235fe.jpg";i:2;s:49:"/Public/upload/goods/2016/01-21/56a08fd8ef1c9.jpg";}', 1, 3, 0),
(196, 101, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 1, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-21/56a0904e6e31e.jpg";i:1;s:49:"/Public/upload/goods/2016/01-21/56a0904e4cf35.jpg";i:2;s:49:"/Public/upload/goods/2016/01-21/56a0904e2d706.jpg";}', 1, 2, 5),
(197, 102, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 1, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-21/56a092513dc93.jpg";i:1;s:49:"/Public/upload/goods/2016/01-21/56a092512352f.jpg";i:2;s:49:"/Public/upload/goods/2016/01-21/56a092510cb8f.jpg";}', 1, 3, 3),
(198, 103, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 5, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-21/56a092d85d0df.jpg";i:1;s:49:"/Public/upload/goods/2016/01-21/56a092d8406fc.jpg";i:2;s:49:"/Public/upload/goods/2016/01-21/56a092d81fe22.jpg";}', 1, 2, 0),
(203, 51, 'zuanshi@tpshop.com', 'guangmu', '打的', 3, 1457754388, '116.24.126.90', 1, 0, 1, 'a:1:{i:0;s:51:"/Public/upload/comment/2016-03-12/56e3911410d61.png";}', 18, 3, 3),
(204, 104, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 3, 1457746403, '127.0.0.1', 1, 0, 1, '', 1, 4, 4),
(205, 104, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 5, 1457746449, '127.0.0.1', 1, 0, 1, '', 1, 5, 3),
(206, 104, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 5, 1457746625, '127.0.0.1', 1, 0, 1, 'a:4:{i:0;s:49:"/Public/upload/goods/2016/03-12/56e3eb73912ff.jpg";i:1;s:50:"/Public/upload//goods/2016/03-12/56e3e6e13859a.jpg";i:2;s:50:"/Public/upload//goods/2016/03-12/56e3e6dae9b86.jpg";i:3;s:50:"/Public/upload//goods/2016/03-12/56e3e6ce7efcb.jpg";}', 1, 2, 1),
(207, 104, 'zuanshi@tpshop.com', 'guangmu', '雨啊', 4, 1458027430, '113.118.69.135', 1, 0, 1, NULL, 161, 4, 4),
(208, 104, 'zuanshi@tpshop.com', 'guangmu', '测试一下评论', 3, 1460455593, '121.35.69.191', 1, 0, 1, 'a:1:{i:0;s:51:"/Public/upload/comment/2016-04-12/570cc8a9b355f.png";}', 177, 4, 4),
(209, 105, 'www.99soubao.com', '美丽淑女', '少女们都很喜欢.', 0, 1461243531, '127.0.0.1', 1, 0, 1, NULL, 1, 0, 2),
(210, 106, 'www.99soubao.com', '美丽淑女', '少女们都很喜欢.', 4, 1461243531, '127.0.0.1', 1, 0, 1, NULL, 1, 4, 2),
(211, 107, 'www.99soubao.com', '美丽淑女', '少女们都很喜欢.', 1, 1461243531, '127.0.0.1', 1, 0, 1, NULL, 1, 5, 4),
(212, 108, 'www.99soubao.com', '美丽淑女', '少女们都很喜欢.', 3, 1461243531, '127.0.0.1', 1, 0, 1, NULL, 1, 5, 0),
(213, 109, 'www.99soubao.com', '美丽淑女', '少女们都很喜欢.', 3, 1461243531, '127.0.0.1', 1, 0, 1, NULL, 1, 2, 1),
(214, 110, 'www.99soubao.com', '美丽淑女', '少女们都很喜欢.', 0, 1461243531, '127.0.0.1', 1, 0, 1, NULL, 1, 2, 0),
(215, 111, 'www.99soubao.com', '美丽淑女', '少女们都很喜欢.', 3, 1461243531, '127.0.0.1', 1, 0, 1, NULL, 1, 1, 3),
(216, 112, 'www.99soubao.com', '美丽淑女', '少女们都很喜欢.', 4, 1461243531, '127.0.0.1', 1, 0, 1, NULL, 1, 4, 5),
(217, 113, 'www.99soubao.com', '美丽淑女', '少女们都很喜欢.', 2, 1461243531, '127.0.0.1', 1, 0, 1, NULL, 1, 5, 0),
(218, 114, 'www.99soubao.com', '美丽淑女', '少女们都很喜欢.', 1, 1461243531, '127.0.0.1', 1, 0, 1, NULL, 1, 2, 5),
(219, 115, 'www.99soubao.com', '美丽淑女', '少女们都很喜欢.', 3, 1461243531, '127.0.0.1', 1, 0, 1, NULL, 1, 2, 5),
(220, 116, 'www.99soubao.com', '美丽淑女', '少女们都很喜欢.', 2, 1461243531, '127.0.0.1', 1, 0, 1, NULL, 1, 2, 4),
(221, 117, 'www.99soubao.com', '美丽淑女', '少女们都很喜欢.', 5, 1461243531, '127.0.0.1', 1, 0, 1, NULL, 1, 4, 2),
(222, 118, 'www.99soubao.com', '美丽淑女', '少女们都很喜欢.', 2, 1461243531, '127.0.0.1', 1, 0, 1, NULL, 1, 1, 2),
(223, 119, 'www.99soubao.com', '美丽淑女', '少女们都很喜欢.', 0, 1461243531, '127.0.0.1', 1, 0, 1, NULL, 1, 3, 5),
(224, 120, 'www.99soubao.com', '美丽淑女', '少女们都很喜欢.', 5, 1461243531, '127.0.0.1', 1, 0, 1, NULL, 1, 1, 2),
(225, 121, 'www.99soubao.com', '美丽淑女', '少女们都很喜欢.', 2, 1461243531, '127.0.0.1', 1, 0, 1, NULL, 1, 4, 0),
(226, 122, 'www.99soubao.com', '美丽淑女', '少女们都很喜欢.', 1, 1461243531, '127.0.0.1', 1, 0, 1, NULL, 1, 5, 2),
(227, 123, 'www.99soubao.com', '美丽淑女', '少女们都很喜欢.', 3, 1461243531, '127.0.0.1', 1, 0, 1, NULL, 1, 1, 0),
(228, 124, 'www.99soubao.com', '美丽淑女', '少女们都很喜欢.', 1, 1461243531, '127.0.0.1', 1, 0, 1, NULL, 1, 0, 4),
(229, 125, 'www.99soubao.com', '美丽淑女', '少女们都很喜欢.', 5, 1461243531, '127.0.0.1', 1, 0, 1, NULL, 1, 4, 1),
(230, 126, 'www.99soubao.com', '美丽淑女', '少女们都很喜欢.', 4, 1461243531, '127.0.0.1', 1, 0, 1, NULL, 1, 0, 2),
(231, 127, 'www.99soubao.com', '美丽淑女', '少女们都很喜欢.', 4, 1461243531, '127.0.0.1', 1, 0, 1, NULL, 1, 4, 3),
(232, 129, 'www.99soubao.com', '美丽淑女', '少女们都很喜欢.', 4, 1461243531, '127.0.0.1', 1, 0, 1, NULL, 1, 0, 3),
(233, 130, 'www.99soubao.com', '美丽淑女', '少女们都很喜欢.', 0, 1461243531, '127.0.0.1', 1, 0, 1, NULL, 1, 1, 4),
(234, 131, 'www.99soubao.com', '美丽淑女', '少女们都很喜欢.', 5, 1461243531, '127.0.0.1', 1, 0, 1, NULL, 1, 3, 1),
(235, 132, 'www.99soubao.com', '美丽淑女', '少女们都很喜欢.', 4, 1461243531, '127.0.0.1', 1, 0, 1, NULL, 1, 3, 4),
(236, 133, 'www.99soubao.com', '美丽淑女', '少女们都很喜欢.', 2, 1461243531, '127.0.0.1', 1, 0, 1, NULL, 1, 0, 0),
(237, 134, 'www.99soubao.com', '美丽淑女', '少女们都很喜欢.', 4, 1461243531, '127.0.0.1', 1, 0, 1, NULL, 1, 5, 5),
(238, 135, 'www.99soubao.com', '美丽淑女', '少女们都很喜欢.', 2, 1461243531, '127.0.0.1', 1, 0, 1, NULL, 1, 0, 3),
(239, 136, 'www.99soubao.com', '美丽淑女', '少女们都很喜欢.', 2, 1461243531, '127.0.0.1', 1, 0, 1, NULL, 1, 0, 4),
(240, 137, 'www.99soubao.com', '美丽淑女', '少女们都很喜欢.', 2, 1461243531, '127.0.0.1', 1, 0, 1, NULL, 1, 2, 5),
(241, 138, 'www.99soubao.com', '美丽淑女', '少女们都很喜欢.', 3, 1461243531, '127.0.0.1', 1, 0, 1, NULL, 1, 2, 2),
(242, 139, 'www.99soubao.com', '美丽淑女', '少女们都很喜欢.', 2, 1461243531, '127.0.0.1', 1, 0, 1, NULL, 1, 3, 4),
(243, 105, 'www.99soubao.com', '美女', '买回去男朋友很喜欢 ..', 4, 1461243560, '127.0.0.1', 1, 0, 1, NULL, 1, 1, 5),
(244, 106, 'www.99soubao.com', '美女', '买回去男朋友很喜欢 ..', 5, 1461243560, '127.0.0.1', 1, 0, 1, NULL, 1, 0, 3),
(245, 107, 'www.99soubao.com', '美女', '买回去男朋友很喜欢 ..', 2, 1461243560, '127.0.0.1', 1, 0, 1, NULL, 1, 3, 3),
(246, 108, 'www.99soubao.com', '美女', '买回去男朋友很喜欢 ..', 3, 1461243560, '127.0.0.1', 1, 0, 1, NULL, 1, 4, 3),
(247, 109, 'www.99soubao.com', '美女', '买回去男朋友很喜欢 ..', 4, 1461243560, '127.0.0.1', 1, 0, 1, NULL, 1, 5, 1),
(248, 110, 'www.99soubao.com', '美女', '买回去男朋友很喜欢 ..', 3, 1461243560, '127.0.0.1', 1, 0, 1, NULL, 1, 2, 2),
(249, 111, 'www.99soubao.com', '美女', '买回去男朋友很喜欢 ..', 3, 1461243560, '127.0.0.1', 1, 0, 1, NULL, 1, 0, 1),
(250, 112, 'www.99soubao.com', '美女', '买回去男朋友很喜欢 ..', 0, 1461243560, '127.0.0.1', 1, 0, 1, NULL, 1, 0, 5),
(251, 113, 'www.99soubao.com', '美女', '买回去男朋友很喜欢 ..', 5, 1461243560, '127.0.0.1', 1, 0, 1, NULL, 1, 3, 1),
(252, 114, 'www.99soubao.com', '美女', '买回去男朋友很喜欢 ..', 2, 1461243560, '127.0.0.1', 1, 0, 1, NULL, 1, 0, 5),
(253, 115, 'www.99soubao.com', '美女', '买回去男朋友很喜欢 ..', 3, 1461243560, '127.0.0.1', 1, 0, 1, NULL, 1, 2, 4),
(254, 116, 'www.99soubao.com', '美女', '买回去男朋友很喜欢 ..', 4, 1461243560, '127.0.0.1', 1, 0, 1, NULL, 1, 3, 1),
(255, 117, 'www.99soubao.com', '美女', '买回去男朋友很喜欢 ..', 1, 1461243560, '127.0.0.1', 1, 0, 1, NULL, 1, 0, 2),
(256, 118, 'www.99soubao.com', '美女', '买回去男朋友很喜欢 ..', 4, 1461243560, '127.0.0.1', 1, 0, 1, NULL, 1, 3, 4),
(257, 119, 'www.99soubao.com', '美女', '买回去男朋友很喜欢 ..', 0, 1461243560, '127.0.0.1', 1, 0, 1, NULL, 1, 1, 2),
(258, 120, 'www.99soubao.com', '美女', '买回去男朋友很喜欢 ..', 2, 1461243560, '127.0.0.1', 1, 0, 1, NULL, 1, 3, 3),
(259, 121, 'www.99soubao.com', '美女', '买回去男朋友很喜欢 ..', 2, 1461243560, '127.0.0.1', 1, 0, 1, NULL, 1, 0, 4),
(260, 122, 'www.99soubao.com', '美女', '买回去男朋友很喜欢 ..', 1, 1461243560, '127.0.0.1', 1, 0, 1, NULL, 1, 1, 4),
(261, 123, 'www.99soubao.com', '美女', '买回去男朋友很喜欢 ..', 3, 1461243560, '127.0.0.1', 1, 0, 1, NULL, 1, 5, 4),
(262, 124, 'www.99soubao.com', '美女', '买回去男朋友很喜欢 ..', 5, 1461243560, '127.0.0.1', 1, 0, 1, NULL, 1, 0, 5),
(263, 125, 'www.99soubao.com', '美女', '买回去男朋友很喜欢 ..', 3, 1461243560, '127.0.0.1', 1, 0, 1, NULL, 1, 3, 1),
(264, 126, 'www.99soubao.com', '美女', '买回去男朋友很喜欢 ..', 1, 1461243560, '127.0.0.1', 1, 0, 1, NULL, 1, 3, 3),
(265, 127, 'www.99soubao.com', '美女', '买回去男朋友很喜欢 ..', 0, 1461243560, '127.0.0.1', 1, 0, 1, NULL, 1, 0, 1),
(266, 129, 'www.99soubao.com', '美女', '买回去男朋友很喜欢 ..', 5, 1461243560, '127.0.0.1', 1, 0, 1, NULL, 1, 2, 1),
(267, 130, 'www.99soubao.com', '美女', '买回去男朋友很喜欢 ..', 2, 1461243560, '127.0.0.1', 1, 0, 1, NULL, 1, 1, 1),
(268, 131, 'www.99soubao.com', '美女', '买回去男朋友很喜欢 ..', 2, 1461243560, '127.0.0.1', 1, 0, 1, NULL, 1, 4, 2),
(269, 132, 'www.99soubao.com', '美女', '买回去男朋友很喜欢 ..', 4, 1461243560, '127.0.0.1', 1, 0, 1, NULL, 1, 0, 1),
(270, 133, 'www.99soubao.com', '美女', '买回去男朋友很喜欢 ..', 1, 1461243560, '127.0.0.1', 1, 0, 1, NULL, 1, 3, 4),
(271, 134, 'www.99soubao.com', '美女', '买回去男朋友很喜欢 ..', 0, 1461243560, '127.0.0.1', 1, 0, 1, NULL, 1, 4, 5),
(272, 135, 'www.99soubao.com', '美女', '买回去男朋友很喜欢 ..', 0, 1461243560, '127.0.0.1', 1, 0, 1, NULL, 1, 3, 3),
(273, 136, 'www.99soubao.com', '美女', '买回去男朋友很喜欢 ..', 4, 1461243560, '127.0.0.1', 1, 0, 1, NULL, 1, 4, 5),
(274, 137, 'www.99soubao.com', '美女', '买回去男朋友很喜欢 ..', 4, 1461243560, '127.0.0.1', 1, 0, 1, NULL, 1, 5, 1),
(275, 138, 'www.99soubao.com', '美女', '买回去男朋友很喜欢 ..', 1, 1461243560, '127.0.0.1', 1, 0, 1, NULL, 1, 5, 2),
(276, 139, 'www.99soubao.com', '美女', '买回去男朋友很喜欢 ..', 1, 1461243560, '127.0.0.1', 1, 0, 1, NULL, 1, 0, 1),
(277, 105, 'www.99soubao.com', '貌美如花', '买来送给我老公的, 嘻嘻....', 0, 1461243599, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/04-19/5715e06372f03.jpg";i:1;s:49:"/Public/upload/goods/2016/04-19/5715e09a61ded.jpg";i:2;s:49:"/Public/upload/goods/2016/04-19/5715e09a54c53.jpg";}', 1, 1, 5),
(278, 106, 'www.99soubao.com', '貌美如花', '买来送给我老公的, 嘻嘻....', 0, 1461243599, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/04-19/5715eb1f78393.jpg";i:1;s:49:"/Public/upload/goods/2016/04-19/5715eb3995d92.png";i:2;s:49:"/Public/upload/goods/2016/04-19/5715eb397e45c.jpg";}', 1, 4, 4),
(279, 107, 'www.99soubao.com', '貌美如花', '买来送给我老公的, 嘻嘻....', 5, 1461243599, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/04-19/5715efc3bc242.jpg";i:1;s:49:"/Public/upload/goods/2016/04-19/5715efe45f613.jpg";i:2;s:49:"/Public/upload/goods/2016/04-19/5715efe44e074.jpg";}', 1, 5, 4),
(280, 108, 'www.99soubao.com', '貌美如花', '买来送给我老公的, 嘻嘻....', 1, 1461243599, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/04-19/5715f4e32340f.jpg";i:1;s:49:"/Public/upload/goods/2016/04-19/5715f4f9ae27e.jpg";i:2;s:49:"/Public/upload/goods/2016/04-19/5715f4f989a1b.jpg";}', 1, 3, 5),
(281, 109, 'www.99soubao.com', '貌美如花', '买来送给我老公的, 嘻嘻....', 1, 1461243599, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/04-19/5715f7b35a3f7.jpg";i:1;s:49:"/Public/upload/goods/2016/04-19/5715f7c928765.jpg";i:2;s:49:"/Public/upload/goods/2016/04-19/5715f7c900afe.jpg";}', 1, 1, 4),
(282, 110, 'www.99soubao.com', '貌美如花', '买来送给我老公的, 嘻嘻....', 1, 1461243599, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/04-20/5716dda75a263.jpg";i:1;s:49:"/Public/upload/goods/2016/04-20/5716ddca0083c.jpg";i:2;s:49:"/Public/upload/goods/2016/04-20/5716ddc9a0403.jpg";}', 1, 3, 0),
(283, 111, 'www.99soubao.com', '貌美如花', '买来送给我老公的, 嘻嘻....', 5, 1461243599, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/04-20/5716ed08448b7.jpg";i:1;s:49:"/Public/upload/goods/2016/04-20/5716ed26cda84.png";i:2;s:49:"/Public/upload/goods/2016/04-20/5716ed2695c83.jpg";}', 1, 1, 1);
INSERT INTO `ruike_mall_comment` (`comment_id`, `goods_id`, `email`, `username`, `content`, `deliver_rank`, `add_time`, `ip_address`, `is_show`, `parent_id`, `user_id`, `img`, `order_id`, `goods_rank`, `service_rank`) VALUES
(284, 112, 'www.99soubao.com', '貌美如花', '买来送给我老公的, 嘻嘻....', 2, 1461243599, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/04-20/5716ef7989479.jpg";i:1;s:49:"/Public/upload/goods/2016/04-20/5716ef91b2d09.jpg";i:2;s:49:"/Public/upload/goods/2016/04-20/5716ef9160e03.jpg";}', 1, 4, 5),
(285, 113, 'www.99soubao.com', '貌美如花', '买来送给我老公的, 嘻嘻....', 3, 1461243599, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/04-20/5717262e577ed.jpg";i:1;s:49:"/Public/upload/goods/2016/04-20/5717264b7f416.jpg";i:2;s:49:"/Public/upload/goods/2016/04-20/5717264b5ff9d.jpg";}', 1, 3, 4),
(286, 114, 'www.99soubao.com', '貌美如花', '买来送给我老公的, 嘻嘻....', 4, 1461243599, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/04-20/571733f4f2ff4.jpg";i:1;s:49:"/Public/upload/goods/2016/04-20/57173415c5e7a.jpg";i:2;s:49:"/Public/upload/goods/2016/04-20/5717341543764.jpg";}', 1, 4, 5),
(287, 115, 'www.99soubao.com', '貌美如花', '买来送给我老公的, 嘻嘻....', 3, 1461243599, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/04-20/57175033b5c37.jpg";i:1;s:49:"/Public/upload/goods/2016/04-20/5717505a692de.jpg";i:2;s:49:"/Public/upload/goods/2016/04-20/57175059b2046.jpg";}', 1, 4, 1),
(288, 116, 'www.99soubao.com', '貌美如花', '买来送给我老公的, 嘻嘻....', 1, 1461243599, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/04-20/57175203bd715.jpg";i:1;s:49:"/Public/upload/goods/2016/04-20/5717521b0b94c.jpg";i:2;s:49:"/Public/upload/goods/2016/04-20/5717521abe1ba.jpg";}', 1, 4, 1),
(289, 117, 'www.99soubao.com', '貌美如花', '买来送给我老公的, 嘻嘻....', 2, 1461243599, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/04-21/57182dc652219.jpg";i:1;s:49:"/Public/upload/goods/2016/04-21/57182dd9dee42.jpg";i:2;s:49:"/Public/upload/goods/2016/04-21/57182dd9c365c.jpg";}', 1, 4, 0),
(290, 118, 'www.99soubao.com', '貌美如花', '买来送给我老公的, 嘻嘻....', 2, 1461243599, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/04-21/571835ac8f4db.jpg";i:1;s:49:"/Public/upload/goods/2016/04-21/571835c77b583.jpg";i:2;s:49:"/Public/upload/goods/2016/04-21/571835c764bac.jpg";}', 1, 3, 5),
(291, 119, 'www.99soubao.com', '貌美如花', '买来送给我老公的, 嘻嘻....', 4, 1461243599, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/04-21/571836416e936.jpg";i:1;s:49:"/Public/upload/goods/2016/04-21/5718365665d97.jpg";i:2;s:49:"/Public/upload/goods/2016/04-21/571836564b297.jpg";}', 1, 3, 5),
(292, 120, 'www.99soubao.com', '貌美如花', '买来送给我老公的, 嘻嘻....', 2, 1461243599, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/04-21/571836cf3102e.jpg";i:1;s:49:"/Public/upload/goods/2016/04-21/571836e336b14.jpg";i:2;s:49:"/Public/upload/goods/2016/04-21/571836e30aaba.jpg";}', 1, 4, 4),
(293, 121, 'www.99soubao.com', '貌美如花', '买来送给我老公的, 嘻嘻....', 0, 1461243599, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/04-21/5718379d770a2.jpg";i:1;s:49:"/Public/upload/goods/2016/04-21/571837b36fb87.jpg";i:2;s:49:"/Public/upload/goods/2016/04-21/571837b34a48e.jpg";}', 1, 3, 2),
(294, 122, 'www.99soubao.com', '貌美如花', '买来送给我老公的, 嘻嘻....', 2, 1461243599, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/04-21/5718384936f8a.jpg";i:1;s:49:"/Public/upload/goods/2016/04-21/5718385e082c2.jpg";i:2;s:49:"/Public/upload/goods/2016/04-21/5718385dea007.jpg";}', 1, 0, 4),
(295, 123, 'www.99soubao.com', '貌美如花', '买来送给我老公的, 嘻嘻....', 3, 1461243599, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/04-21/57186b06906be.jpg";i:1;s:49:"/Public/upload/goods/2016/04-21/57186b2487f06.jpg";i:2;s:49:"/Public/upload/goods/2016/04-21/57186b2475e75.jpg";}', 1, 2, 3),
(296, 124, 'www.99soubao.com', '貌美如花', '买来送给我老公的, 嘻嘻....', 3, 1461243599, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/04-21/571878f368468.jpg";i:1;s:49:"/Public/upload/goods/2016/04-21/5718790944465.jpg";i:2;s:49:"/Public/upload/goods/2016/04-21/571879090f7aa.jpg";}', 1, 3, 2),
(297, 125, 'www.99soubao.com', '貌美如花', '买来送给我老公的, 嘻嘻....', 4, 1461243599, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/04-21/57187b42bfc0c.jpg";i:1;s:49:"/Public/upload/goods/2016/04-21/57187b5841296.jpg";i:2;s:49:"/Public/upload/goods/2016/04-21/57187b580abe4.jpg";}', 1, 2, 1),
(298, 126, 'www.99soubao.com', '貌美如花', '买来送给我老公的, 嘻嘻....', 1, 1461243599, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/04-21/57187bc13f7f6.jpg";i:1;s:49:"/Public/upload/goods/2016/04-21/57187bd601eaf.jpg";i:2;s:49:"/Public/upload/goods/2016/04-21/57187bd5dd859.jpg";}', 1, 5, 0),
(299, 127, 'www.99soubao.com', '貌美如花', '买来送给我老公的, 嘻嘻....', 0, 1461243599, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/04-21/57187c4a0ee19.jpg";i:1;s:49:"/Public/upload/goods/2016/04-21/57187c5d48daa.jpg";i:2;s:49:"/Public/upload/goods/2016/04-21/57187c5d36631.jpg";}', 1, 2, 2),
(300, 129, 'www.99soubao.com', '貌美如花', '买来送给我老公的, 嘻嘻....', 2, 1461243599, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/04-21/57187dbb16571.jpg";i:1;s:49:"/Public/upload/goods/2016/04-21/57187dd92a26f.jpg";i:2;s:49:"/Public/upload/goods/2016/04-21/57187dd8e18e8.jpg";}', 1, 3, 5),
(301, 130, 'www.99soubao.com', '貌美如花', '买来送给我老公的, 嘻嘻....', 4, 1461243599, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/04-21/57187e4c5a833.jpg";i:1;s:49:"/Public/upload/goods/2016/04-21/57187e647a9e0.jpg";i:2;s:49:"/Public/upload/goods/2016/04-21/57187e64208f2.jpg";}', 1, 2, 2),
(302, 131, 'www.99soubao.com', '貌美如花', '买来送给我老公的, 嘻嘻....', 0, 1461243599, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/04-21/57187f2652a09.jpg";i:1;s:49:"/Public/upload/goods/2016/04-21/57187f3e13b73.jpg";i:2;s:49:"/Public/upload/goods/2016/04-21/57187f3d96daf.gif";}', 1, 0, 2),
(303, 132, 'www.99soubao.com', '貌美如花', '买来送给我老公的, 嘻嘻....', 1, 1461243599, '127.0.0.1', 1, 0, 1, 'N;', 1, 0, 5),
(304, 133, 'www.99soubao.com', '貌美如花', '买来送给我老公的, 嘻嘻....', 4, 1461243599, '127.0.0.1', 1, 0, 1, 'N;', 1, 2, 2),
(305, 134, 'www.99soubao.com', '貌美如花', '买来送给我老公的, 嘻嘻....', 2, 1461243599, '127.0.0.1', 1, 0, 1, 'N;', 1, 5, 5),
(306, 135, 'www.99soubao.com', '貌美如花', '买来送给我老公的, 嘻嘻....', 4, 1461243599, '127.0.0.1', 1, 0, 1, 'a:2:{i:0;s:49:"/Public/upload/goods/2016/04-21/5718883514695.jpg";i:1;s:49:"/Public/upload/goods/2016/04-21/57188845afa4a.jpg";}', 1, 0, 3),
(307, 136, 'www.99soubao.com', '貌美如花', '买来送给我老公的, 嘻嘻....', 5, 1461243599, '127.0.0.1', 1, 0, 1, 'N;', 1, 5, 0),
(308, 137, 'www.99soubao.com', '貌美如花', '买来送给我老公的, 嘻嘻....', 5, 1461243599, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/04-21/571888ed55109.jpg";i:1;s:49:"/Public/upload/goods/2016/04-21/5718890105ad8.jpg";i:2;s:49:"/Public/upload/goods/2016/04-21/57188900836e7.jpg";}', 1, 2, 3),
(309, 138, 'www.99soubao.com', '貌美如花', '买来送给我老公的, 嘻嘻....', 5, 1461243599, '127.0.0.1', 1, 0, 1, 'N;', 1, 4, 3),
(310, 139, 'www.99soubao.com', '貌美如花', '买来送给我老公的, 嘻嘻....', 1, 1461243599, '127.0.0.1', 1, 0, 1, 'N;', 1, 5, 0),
(311, 140, 'www.99soubao.com', '貌美如花', '买来送给我老公的, 嘻嘻....', 3, 1461305493, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/04-22/5719843a87434.jpg";i:1;s:49:"/Public/upload/goods/2016/04-22/57198456a2514.jpg";i:2;s:49:"/Public/upload/goods/2016/04-22/57198456932b4.jpg";}', 1, 0, 3),
(312, 141, 'www.99soubao.com', '貌美如花', '买来送给我老公的, 嘻嘻....', 5, 1461305493, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/04-22/57198a178e5c1.jpg";i:1;s:49:"/Public/upload/goods/2016/04-22/57198a2ccddd3.jpg";i:2;s:49:"/Public/upload/goods/2016/04-22/57198a2cbc726.jpg";}', 1, 1, 5),
(313, 142, 'www.99soubao.com', '貌美如花', '买来送给我老公的, 嘻嘻....', 0, 1461305493, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/04-22/57199141d9c05.jpg";i:1;s:49:"/Public/upload/goods/2016/04-22/57199164c3a67.jpg";i:2;s:49:"/Public/upload/goods/2016/04-22/57199164b5284.jpg";}', 1, 0, 3),
(314, 143, 'www.99soubao.com', '貌美如花', '买来送给我老公的, 嘻嘻....', 3, 1461305493, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/04-22/5719923fb2708.jpg";i:1;s:49:"/Public/upload/goods/2016/04-22/57199253bf198.jpg";i:2;s:49:"/Public/upload/goods/2016/04-22/57199253abf3d.jpg";}', 1, 0, 0),
(315, 140, 'www.99soubao.com', '貌美如花', '第二次光顾了, 不错 ,不错 ....', 1, 1461305549, '127.0.0.1', 1, 0, 1, NULL, 1, 5, 5),
(316, 141, 'www.99soubao.com', '貌美如花', '第二次光顾了, 不错 ,不错 ....', 5, 1461305549, '127.0.0.1', 1, 0, 1, NULL, 1, 3, 2),
(317, 142, 'www.99soubao.com', '貌美如花', '第二次光顾了, 不错 ,不错 ....', 5, 1461305549, '127.0.0.1', 1, 0, 1, NULL, 1, 0, 5),
(318, 143, 'www.99soubao.com', '貌美如花', '第二次光顾了, 不错 ,不错 ....', 4, 1461305549, '127.0.0.1', 1, 0, 1, NULL, 1, 0, 0),
(319, 140, 'www.99soubao.com', '淑女', '买回来用了一段时间, 真心感觉不错  ....', 4, 1461305593, '127.0.0.1', 1, 0, 1, NULL, 1, 2, 4),
(320, 141, 'www.99soubao.com', '淑女', '买回来用了一段时间, 真心感觉不错  ....', 5, 1461305593, '127.0.0.1', 1, 0, 1, NULL, 1, 1, 0),
(321, 142, 'www.99soubao.com', '淑女', '买回来用了一段时间, 真心感觉不错  ....', 3, 1461305593, '127.0.0.1', 1, 0, 1, NULL, 1, 1, 4),
(322, 143, 'www.99soubao.com', '淑女', '买回来用了一段时间, 真心感觉不错  ....', 5, 1461305593, '127.0.0.1', 1, 0, 1, NULL, 1, 4, 5),
(324, 119, 'dfgdfg@163.com', 'hello', '', 3, 1474537525, '192.168.0.103', 0, 0, 1, 's:0:"";', 770, 3, 3),
(325, 119, 'dfgdfg@163.com', 'hello', '', 4, 1474537731, '192.168.0.103', 0, 0, 1, 's:0:"";', 772, 4, 4),
(326, 104, 'dfgdfg@163.com', 'hello', '', 4, 1474595970, '192.168.0.101', 0, 0, 1, 's:0:"";', 775, 4, 4),
(331, 1, '', 'admin', '石原里美', 0, 1482368691, '', 1, 1, 1, NULL, NULL, NULL, NULL),
(333, 29, '', '', 'imya', 0, 1491473335, '', 1, 0, 1, NULL, NULL, NULL, NULL),
(334, 29, '', '', '重新评论', 0, 1491474337, '', 0, 0, 1, NULL, NULL, NULL, NULL),
(335, 29, '', '', '再来一次', 0, 1491474581, '', 0, 0, 1, NULL, 217, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `ruike_mall_config`
--

CREATE TABLE IF NOT EXISTS `ruike_mall_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `desc` varchar(200) NOT NULL,
  `cover` int(11) NOT NULL,
  `poster` int(11) NOT NULL,
  `comment_review` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0不需要 1需要审核',
  `distribution` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0未开启分销 1 一级分销 2 二级分销 3三级分销',
  `commission` tinyint(4) NOT NULL COMMENT '佣金结算方式：0付款成功立刻 1付款成功后N天',
  `balance_day` int(11) NOT NULL COMMENT 'commission为1情况，付款后n天结算',
  `status` tinyint(4) NOT NULL COMMENT '0 禁用 1启用',
  `distribution_cond` tinyint(4) DEFAULT '1' COMMENT '成为分销商条件;0不限制 1购买成功',
  `withdrawal_limit` int(11) DEFAULT '0' COMMENT '余额提现限制 0没有限制',
  `cash_fee` decimal(2,1) DEFAULT '0.0' COMMENT '提现手续费 0没有手续费',
  `discount` decimal(2,1) DEFAULT '0.0' COMMENT '购买扣扣 0没有折扣',
  `discount_type` tinyint(4) DEFAULT '0' COMMENT '折扣类型 0折扣头券 1现金券可以提现',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `ruike_mall_config`
--

INSERT INTO `ruike_mall_config` (`id`, `name`, `desc`, `cover`, `poster`, `comment_review`, `distribution`, `commission`, `balance_day`, `status`, `distribution_cond`, `withdrawal_limit`, `cash_fee`, `discount`, `discount_type`) VALUES
(1, '美易柔', '美易柔', 0, 353, 0, 3, 1, 7, 0, 0, 0, '0.0', '8.0', 1);

-- --------------------------------------------------------

--
-- 表的结构 `ruike_mall_dispatch`
--

CREATE TABLE IF NOT EXISTS `ruike_mall_dispatch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `type` tinyint(4) NOT NULL COMMENT '0,按重量计费 1按件计费',
  `first_price` int(11) NOT NULL COMMENT '首重',
  `first_weight` int(11) NOT NULL COMMENT '首重运费',
  `second_price` int(11) NOT NULL COMMENT '续重',
  `second_weight` int(11) NOT NULL COMMENT '续重运费',
  `first_num` int(11) NOT NULL COMMENT '首件',
  `first_num_price` int(11) NOT NULL COMMENT '首件运费',
  `second_num` int(11) NOT NULL COMMENT '续件',
  `second_num_price` int(11) NOT NULL COMMENT '续件运费',
  `express` varchar(20) NOT NULL COMMENT '快递名称',
  `express_name` varchar(30) DEFAULT NULL,
  `sort` int(11) NOT NULL,
  `is_default` tinyint(4) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL COMMENT '0 禁用 1启用',
  `area` text NOT NULL COMMENT '配置区域',
  `no_area` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `ruike_mall_dispatch`
--

INSERT INTO `ruike_mall_dispatch` (`id`, `name`, `type`, `first_price`, `first_weight`, `second_price`, `second_weight`, `first_num`, `first_num_price`, `second_num`, `second_num_price`, `express`, `express_name`, `sort`, `is_default`, `status`, `area`, `no_area`) VALUES
(1, '包邮', 1, 0, 1000, 0, 1000, 1, 0, 1, 0, 'shentong', '', 0, 1, 1, 'a:2:{i:1;a:9:{s:5:"citys";s:322:"拉萨市;昌都地区;山南地区;日喀则地区;那曲地区;阿里地区;林芝地区;乌鲁木齐市;克拉玛依市;吐鲁番地区;哈密地区;昌吉自治州;博尔塔拉州;巴音郭楞州;阿克苏地区;克孜勒苏州;喀什地区;和田地区;伊犁自治州;塔城地区;阿勒泰地区;新疆省辖单位;";s:11:"firstweight";s:4:"1000";s:10:"firstprice";i:0;s:12:"secondweight";s:4:"1000";s:11:"secondprice";i:0;s:8:"firstnum";s:1:"1";s:13:"firstnumprice";s:2:"15";s:9:"secondnum";s:1:"1";s:14:"secondnumprice";i:0;}i:2;a:9:{s:5:"citys";s:195:"呼和浩特市;包头市;乌海市;赤峰市;通辽市;鄂尔多斯市;呼伦贝尔市;巴彦淖尔市;乌兰察布市;兴安盟;锡林郭勒盟;阿拉善盟;海口市;三亚市;海南直辖县;";s:11:"firstweight";s:4:"1000";s:10:"firstprice";i:0;s:12:"secondweight";s:4:"1000";s:11:"secondprice";i:0;s:8:"firstnum";s:1:"1";s:13:"firstnumprice";s:2:"10";s:9:"secondnum";s:1:"1";s:14:"secondnumprice";i:0;}}', 's:403:"昆明市;曲靖市;玉溪市;保山市;昭通市;丽江市;思茅市;临沧市;楚雄自治州;红河自治州;文山自治州;西双版纳州;大理自治州;德宏自治州;怒江傈自治州;迪庆自治州;台北市;高雄市;基隆市;台中市;台南市;新竹市;嘉义市;香港岛;九龙;新界东;新界西;花地玛堂区;圣安多尼堂区;花王堂区;大堂区;望德堂区;风顺堂区;;";');

-- --------------------------------------------------------

--
-- 表的结构 `ruike_mall_distributor`
--

CREATE TABLE IF NOT EXISTS `ruike_mall_distributor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `sub_member_id` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `total_money` decimal(10,2) NOT NULL,
  `money` decimal(10,2) NOT NULL,
  `nickname` varchar(32) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0未购买 1已购买 ',
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `member_id` (`member_id`,`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- 转存表中的数据 `ruike_mall_distributor`
--

INSERT INTO `ruike_mall_distributor` (`id`, `member_id`, `sub_member_id`, `level`, `total_money`, `money`, `nickname`, `status`, `create_time`) VALUES
(8, 1, 20365, 2, '0.00', '0.00', '颜孙植', 0, '2017-04-18 14:43:01'),
(7, 29, 20365, 1, '0.00', '0.00', '颜孙植', 0, '2017-04-18 14:43:01'),
(9, 20365, 20366, 1, '15.84', '15.84', '杨', 0, '2017-04-18 14:49:16'),
(10, 29, 20366, 2, '7.92', '7.92', '杨', 0, '2017-04-18 14:49:16'),
(11, 1, 20366, 3, '3.96', '3.96', '杨', 0, '2017-04-18 14:49:16'),
(12, 29, 20369, 1, '0.00', '0.00', '哈根达斯', 0, '2017-04-25 17:50:50'),
(13, 1, 20369, 2, '0.00', '0.00', '哈根达斯', 0, '2017-04-25 17:50:50');

-- --------------------------------------------------------

--
-- 表的结构 `ruike_mall_distributor_level`
--

CREATE TABLE IF NOT EXISTS `ruike_mall_distributor_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT '',
  `level1` decimal(10,2) DEFAULT '0.00',
  `level2` decimal(10,2) DEFAULT '0.00',
  `level3` decimal(10,2) DEFAULT '0.00',
  `remark` varchar(100) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- 表的结构 `ruike_mall_distributor_order`
--

CREATE TABLE IF NOT EXISTS `ruike_mall_distributor_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_sn` varchar(64) NOT NULL,
  `member_id` int(11) NOT NULL,
  `total_money` decimal(10,2) NOT NULL,
  `money` decimal(10,2) NOT NULL,
  `pay_time` datetime NOT NULL,
  `level` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `confirm_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `member_id` (`member_id`,`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `ruike_mall_distributor_order`
--

INSERT INTO `ruike_mall_distributor_order` (`id`, `order_sn`, `member_id`, `total_money`, `money`, `pay_time`, `level`, `status`, `confirm_time`) VALUES
(3, '201704180843260997', 20365, '99.00', '19.80', '2017-04-18 17:01:33', 1, -1, '2017-04-21 11:38:16'),
(4, '201704180843260997', 29, '99.00', '19.80', '2017-04-18 17:01:33', 2, 1, '2017-04-21 11:38:16'),
(5, '201704180843260997', 1, '99.00', '19.80', '2017-04-18 17:01:33', 3, 1, '2017-04-21 11:38:16'),
(7, '201704281704300604', 20365, '99.00', '15.84', '2017-04-28 17:15:42', 1, 1, '2017-04-28 17:34:49'),
(8, '201704281704300604', 29, '99.00', '7.92', '2017-04-28 17:15:42', 2, 1, '2017-04-28 17:34:49'),
(9, '201704281704300604', 1, '99.00', '3.96', '2017-04-28 17:15:42', 3, 1, '2017-04-28 17:34:49');

-- --------------------------------------------------------

--
-- 表的结构 `ruike_mall_order`
--

CREATE TABLE IF NOT EXISTS `ruike_mall_order` (
  `order_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `order_sn` varchar(20) NOT NULL DEFAULT '' COMMENT '订单编号',
  `member_id` int(11) NOT NULL,
  `order_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '订单状态',
  `shipping_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '发货状态',
  `pay_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '支付状态',
  `consignee` varchar(60) NOT NULL DEFAULT '' COMMENT '收货人',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '地址',
  `mobile` varchar(60) NOT NULL DEFAULT '' COMMENT '手机',
  `email` varchar(60) NOT NULL DEFAULT '' COMMENT '邮件',
  `shipping_code` varchar(32) NOT NULL DEFAULT '0' COMMENT '物流code',
  `shipping_name` varchar(120) NOT NULL DEFAULT '' COMMENT '物流名称',
  `invoice_no` varchar(32) DEFAULT NULL COMMENT '物流单号',
  `pay_code` varchar(32) NOT NULL DEFAULT '' COMMENT '支付code',
  `pay_name` varchar(120) NOT NULL DEFAULT '' COMMENT '支付方式名称',
  `transaction_id` varchar(64) DEFAULT NULL COMMENT '支付方id',
  `invoice_title` varchar(256) DEFAULT '' COMMENT '发票抬头',
  `goods_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品总价',
  `shipping_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '邮费',
  `user_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '使用余额',
  `coupon_price` decimal(10,2) DEFAULT '0.00' COMMENT '优惠券抵扣',
  `integral` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '使用积分',
  `integral_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '使用积分抵多少钱',
  `order_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '应付款金额',
  `total_amount` decimal(10,2) DEFAULT '0.00' COMMENT '订单总价',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下单时间',
  `shipping_time` int(11) DEFAULT '0' COMMENT '最后新发货时间',
  `confirm_time` int(10) DEFAULT '0' COMMENT '收货确认时间',
  `pay_time` datetime DEFAULT NULL COMMENT '支付时间',
  `order_prom_id` smallint(6) NOT NULL DEFAULT '0' COMMENT '活动id',
  `order_prom_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '活动优惠金额',
  `discount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '价格调整',
  `user_note` varchar(255) NOT NULL DEFAULT '' COMMENT '用户备注',
  `admin_note` varchar(255) DEFAULT '' COMMENT '管理员备注',
  `parent_sn` varchar(100) DEFAULT NULL COMMENT '父单单号',
  `is_distribut` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已分成0未分成1已分成',
  `date_of_application` int(11) unsigned DEFAULT NULL COMMENT '申请退换货时间',
  `return_or_exchange` tinyint(1) unsigned DEFAULT NULL COMMENT '区分是退货还是换货 0是退换  1是换货',
  `return_description` varchar(255) DEFAULT NULL COMMENT '退换货描述',
  `return_img` int(20) unsigned DEFAULT NULL COMMENT '退换图片',
  `processing_remarks` varchar(512) DEFAULT NULL COMMENT '退换货处理描述',
  `coordinate` varchar(64) DEFAULT NULL,
  `discount_type` tinyint(4) DEFAULT '0' COMMENT '折扣类型 0直接抵扣 1确认收货返现金',
  `pay_cnt` int(11) DEFAULT NULL COMMENT '重复支付次数',
  `mark` varchar(32) DEFAULT NULL COMMENT '快递大头字',
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `order_sn` (`order_sn`),
  KEY `order_status` (`order_status`),
  KEY `shipping_status` (`shipping_status`),
  KEY `pay_status` (`pay_status`),
  KEY `shipping_id` (`shipping_code`),
  KEY `pay_id` (`pay_code`),
  KEY `member_id` (`member_id`),
  KEY `order_sn_2` (`order_sn`),
  KEY `order_status_2` (`order_status`,`shipping_status`,`pay_status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=803 ;

--
-- 转存表中的数据 `ruike_mall_order`
--

INSERT INTO `ruike_mall_order` (`order_id`, `order_sn`, `member_id`, `order_status`, `shipping_status`, `pay_status`, `consignee`, `address`, `mobile`, `email`, `shipping_code`, `shipping_name`, `invoice_no`, `pay_code`, `pay_name`, `transaction_id`, `invoice_title`, `goods_price`, `shipping_price`, `user_money`, `coupon_price`, `integral`, `integral_money`, `order_amount`, `total_amount`, `add_time`, `shipping_time`, `confirm_time`, `pay_time`, `order_prom_id`, `order_prom_amount`, `discount`, `user_note`, `admin_note`, `parent_sn`, `is_distribut`, `date_of_application`, `return_or_exchange`, `return_description`, `return_img`, `processing_remarks`, `coordinate`, `discount_type`, `pay_cnt`, `mark`) VALUES
(210, '201605122147135200', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shunfeng', '顺丰物流', NULL, '', '', '', '', '1959.02', '0.00', '0.00', '0.00', 0, '0.00', '1959.02', '1959.02', 1463060833, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(785, '201704180843260997', 20366, 1, 2, 1, '121e1e', '宁夏,中卫市市,其他,121221', '15689877898', '', '0', '', NULL, '', '', '4008252001201701237291908433', '', '99.00', '0.00', '0.00', '0.00', 0, '0.00', '99.00', '99.00', 1492476206, 0, 1492745896, '2017-04-18 17:01:33', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(208, '201605121627367531', 0, 1, 0, 1, '张谷泉', '某大街道某号', '13554754711', '', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '1698.00', '0.00', '0.00', '0.00', 0, '0.00', '1698.00', '1698.00', 1463041656, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(207, '201605121625566047', 0, 1, 1, 1, '张谷泉', '某大街道某号', '13554754711', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '4200.00', '10.00', '0.00', '0.00', 0, '0.00', '4208.00', '4200.00', 1463041556, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '2.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(206, '201605121602013148', 0, 1, 2, 1, '黄先生', '通州区旗舰凯旋小区', '15889560679', 'text@tpshop.com', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '100.00', '0.00', '0.00', '0.00', 0, '0.00', '100.00', '100.00', 1463040121, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(205, '201605121552142475', 0, 2, 0, 0, '张谷泉', '某大街道某号', '13554754711', '', 'shunfeng', '顺丰物流', '13554754711', 'weixin', '微信支付', '', '', '2700.00', '0.00', '0.00', '0.00', 0, '0.00', '2700.00', '2700.00', 1463039534, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, 1462965252, 1, '2asdfdfdf', 37, '测试退换货201605121552142475', NULL, 0, NULL, NULL),
(204, '201605121517391563', 0, 2, 0, 1, '黄先生', '通州区旗舰凯旋小区', '15889560679', 'text@tpshop.com', 'shentong', '申通物流', NULL, '', '', '', '', '300.00', '0.00', '0.00', '0.00', 0, '0.00', '300.00', '300.00', 1463037459, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(203, '201605121515012668', 0, 3, 0, 2, '黄先生', '通州区旗舰凯旋小区', '15889560679', 'text@tpshop.com', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '100.00', '0.00', '0.00', '0.00', 0, '0.00', '100.00', '100.00', 1463037301, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(202, '201605111914121930', 0, 0, 0, 1, 'sasa', 'sasa', '', 'zuanshi@tpshop.com', 'shentong', '申通物流', NULL, '', '', '', '', '4809.02', '0.00', '0.00', '0.00', 0, '0.00', '4809.02', '4809.02', 1462965252, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(198, '201605021231046814', 0, 4, 2, 1, '窝里逗', '东城区', '18640367560', '', 'shentong', '申通物流', NULL, 'alipay', '支付宝支付', '', '', '100.00', '0.00', '0.00', '0.00', 0, '0.00', '100.00', '100.00', 1462163464, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(199, '201605021234165993', 0, 1, 1, 1, '窝里逗', '东城区', '18640367560', '', 'shentong', '申通物流', NULL, 'alipay', '支付宝支付', '', '', '100.00', '0.00', '0.00', '0.00', 0, '0.00', '100.00', '100.00', 1462163656, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', '201605021231046814', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(200, '201605021637538029', 0, 5, 2, 5, '黄先生', '通州区旗舰凯旋小区', '15889560679', 'text@tpshop.com', 'shentong', '申通物流', NULL, 'alipay', '支付宝支付', '', '', '1959.02', '0.00', '0.00', '0.00', 0, '0.00', '1959.02', '1959.02', 1462178273, 0, 1462178343, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(201, '201605021640246413', 0, 6, 2, 2, '黄先生', '通州区旗舰凯旋小区', '15889560679', 'text@tpshop.com', 'shentong', '申通物流', NULL, 'alipay', '支付宝支付', '', '', '979.02', '0.00', '0.00', '0.00', 0, '0.00', '979.02', '979.02', 1462178424, 0, 1462178529, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(197, '201605021215126304', 0, 6, 2, 1, '窝里逗', '东城区', '18640367560', '', 'shunfeng', '顺丰物流', NULL, 'alipay', '支付宝支付', '', '', '2258.02', '0.00', '0.00', '0.00', 0, '0.00', '2258.02', '2258.02', 1462162512, 0, 1462163102, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(196, '201605021002078610', 0, 7, 2, 2, '黄先生', '通州区旗舰凯旋小区', '15889560679', 'text@tpshop.com', 'shentong', '申通物流', NULL, '', '', '', '', '2840.02', '0.00', '0.00', '0.00', 0, '0.00', '2840.02', '2840.02', 1462154527, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(195, '201605021001081616', 0, 4, 0, 0, '黄先生', '通州区旗舰凯旋小区', '15889560679', 'text@tpshop.com', 'shentong', '申通物流', NULL, 'alipay', '支付宝支付', '', '', '299.00', '0.00', '0.00', '0.00', 0, '0.00', '299.00', '299.00', 1462154468, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', '201605020957028285', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(194, '201605020957028285', 0, 5, 0, 0, '黄先生', '通州区旗舰凯旋小区', '15889560679', 'text@tpshop.com', 'shentong', '申通物流', NULL, 'alipay', '支付宝支付', '', '', '95.00', '0.00', '0.00', '0.00', 0, '0.00', '95.00', '95.00', 1462154222, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(193, '201604281431545944', 0, 6, 0, 0, '某大街某号 2', ' 某街道办 .', '13554754891', '', 'shentong', '申通物流', NULL, '', '', '', '', '0.06', '0.00', '0.00', '0.00', 0, '0.00', '0.06', '0.06', 1461825114, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(192, '201604281429286957', 0, 7, 0, 0, '某大街某号 2', ' 某街道办 .', '13554754891', '', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.01', 1461824968, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(191, '201604281428307276', 0, 0, 0, 1, '某大街某号 2', ' 某街道办 .', '13554754891', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.01', 1461824910, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(190, '201604281424272949', 0, 1, 1, 1, '某大街某号 2', ' 某街道办 .', '13554754891', '', 'shentong', '申通物流', '201604281424272949', 'alipay', '支付宝支付', '', '', '0.02', '0.00', '0.00', '0.00', 0, '0.00', '0.02', '0.02', 1461824667, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(189, '201604281356364590', 0, 0, 0, 0, '某大街某号 2', ' 某街道办 .', '13554754891', '', 'shentong', '申通物流', NULL, '', '', '', '', '2099.00', '0.00', '0.00', '0.00', 0, '0.00', '2099.00', '2099.00', 1461822996, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(292, '201606071313179779', 0, 0, 0, 0, '44', '我理可以破地', '13852364365', '', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '69.00', '7.00', '0.00', '0.00', 0, '0.00', '76.00', '76.00', 1465276397, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(291, '201606041821446103', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shunfeng', '顺丰物流', NULL, 'alipay', '支付宝支付', '', '', '28396.00', '58.00', '0.00', '0.00', 0, '0.00', '28454.00', '28454.00', 1465035704, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(290, '201606031410208105', 0, 0, 0, 0, 'OK', '贡米', '18081240805', '', 'shentong', '申通物流', NULL, '', '', '', '', '69.00', '0.00', '0.00', '0.00', 0, '0.00', '69.00', '69.00', 1464934220, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(289, '201606031106599150', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, '', '', '', '', '1999.00', '0.00', '0.00', '0.00', 0, '0.00', '1999.00', '1999.00', 1464923219, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(80, '201601231454088299', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shunfeng', '顺丰物流', NULL, '', '', '', '', '1700.01', '0.00', '0.00', '0.00', 0, '0.00', '1700.01', '0.00', 1453532048, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', '0', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(81, '201601231528394823', 0, 1, 1, 1, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shunfeng', '顺丰物流', '201601231528394823', '', '', '', '', '1000.00', '0.00', '0.00', '0.00', 0, '0.00', '1000.00', '0.00', 1453534119, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', '0', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(82, '201601231530321839', 0, 1, 2, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shunfeng', '顺丰物流', NULL, '', '', '', '', '1400.00', '0.00', '0.00', '0.00', 0, '0.00', '1400.00', '0.00', 1453534232, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', '0', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(83, '201601231616165211', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shunfeng', '顺丰物流', NULL, '', '', '', '', '2000.00', '0.00', '0.00', '0.00', 0, '0.00', '2000.00', '0.00', 1453536976, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', '0', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(84, '201601250843024354', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shunfeng', '顺丰物流', NULL, '', '', '', '', '2400.00', '0.00', '0.00', '0.00', 0, '0.00', '2400.00', '0.00', 1453682582, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', '0', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(85, '201601251002051763', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shunfeng', '顺丰物流', NULL, '', '', '', '', '1000.00', '0.00', '0.00', '0.00', 0, '0.00', '1000.00', '0.00', 1453687325, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', '0', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(86, '201601251014528775', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shunfeng', '顺丰物流', NULL, '', '', '', '', '1000.00', '0.00', '0.00', '0.00', 0, '0.00', '1000.00', '0.00', 1453688092, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', '0', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(87, '201601291219196463', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shunfeng', '顺丰物流', NULL, '', '', '', '', '11000.00', '0.00', '0.00', '0.00', 0, '0.00', '11000.00', '0.00', 1454041159, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', '0', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(88, '201601291446499448', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shunfeng', '顺丰物流', NULL, '', '', '', '', '11000.00', '0.00', '0.00', '0.00', 0, '0.00', '11000.00', '0.00', 1454050009, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', '0', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(89, '201601291449101104', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shunfeng', '顺丰物流', NULL, '', '', '', '', '11000.00', '0.00', '0.00', '0.00', 0, '0.00', '11000.00', '0.00', 1454050150, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', '0', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(90, '201601291651363199', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shunfeng', '顺丰物流', NULL, '', '', '', '', '11000.00', '0.00', '0.00', '0.00', 0, '0.00', '11000.00', '0.00', 1454057496, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', '0', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(91, '201601291652454435', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shunfeng', '顺丰物流', NULL, '', '', '', '', '11000.00', '0.00', '0.00', '0.00', 0, '0.00', '11000.00', '0.00', 1454057565, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', '0', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(92, '201601291653329686', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shunfeng', '顺丰物流', NULL, '', '', '', '', '11000.00', '0.00', '0.00', '0.00', 0, '0.00', '11000.00', '0.00', 1454057612, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', '0', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(93, '201601291653362496', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shunfeng', '顺丰物流', NULL, '', '', '', '', '11000.00', '0.00', '0.00', '0.00', 0, '0.00', '11000.00', '0.00', 1454057616, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', '0', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(94, '201601291654454381', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shunfeng', '顺丰物流', NULL, '', '', '', '', '11000.00', '0.00', '0.00', '0.00', 0, '0.00', '11000.00', '0.00', 1454057685, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', '0', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(95, '201601291655311655', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shunfeng', '顺丰物流', NULL, '', '', '', '', '11000.00', '0.00', '0.00', '0.00', 0, '0.00', '11000.00', '0.00', 1454057731, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', '0', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(96, '201601291655543355', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shunfeng', '顺丰物流', NULL, '', '', '', '', '11000.00', '0.00', '0.00', '0.00', 0, '0.00', '11000.00', '0.00', 1454057754, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', '0', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(97, '201603011711065933', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '0.10', '48.00', '0.00', '0.00', 0, '0.00', '48.10', '0.00', 1456823466, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', '0', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(98, '201603011800388326', 0, 0, 0, 1, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shunfeng', '顺丰物流', NULL, 'alipay', '支付宝支付', '', '', '0.09', '0.00', '0.00', '0.00', 0, '0.00', '0.09', '0.00', 1456826438, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', '0', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(99, '201603020925393687', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, '', '', '', '', '0.05', '28.00', '0.00', '0.00', 0, '0.00', '28.05', '0.00', 1456881939, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', '0', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(100, '201603021235128218', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shunfeng', '顺丰物流', NULL, 'alipay', '支付宝支付', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.00', 1456893312, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', '0', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(101, '201603021347367134', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shunfeng', '顺丰物流', NULL, '', '', '', '', '0.02', '0.00', '0.00', '0.00', 0, '0.00', '0.02', '0.00', 1456897656, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', '0', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(102, '201603021401114013', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shunfeng', '顺丰物流', NULL, '', '', '', '', '0.02', '0.00', '0.00', '0.00', 0, '0.00', '0.02', '0.00', 1456898471, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', '0', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(103, '201603021434254495', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shunfeng', '顺丰物流', NULL, '', '', '', '', '0.03', '0.00', '0.00', '0.00', 0, '0.00', '0.03', '0.00', 1456900465, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', '0', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(104, '201603021440047058', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shunfeng', '顺丰物流', NULL, '', '', '', '', '0.02', '0.00', '0.00', '0.00', 0, '0.00', '0.02', '0.00', 1456900804, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', '0', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(105, '201603021527081312', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shunfeng', '顺丰物流', NULL, '', '', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.00', 1456903628, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', '0', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(106, '201603021604567988', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shunfeng', '顺丰物流', NULL, '', '', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.00', 1456905896, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', '0', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(107, '201603021614411281', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shunfeng', '顺丰物流', NULL, '', '', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.00', 1456906481, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', '0', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(108, '201603021616366062', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shunfeng', '顺丰物流', NULL, '', '', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.00', 1456906596, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', '0', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(109, '201603021653237328', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, '', '', '', '', '0.01', '28.00', '0.00', '0.00', 0, '0.00', '28.01', '0.00', 1456908803, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', '0', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(110, '201603021654418645', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shunfeng', '顺丰物流', NULL, '', '', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.00', 1456908881, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', '0', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(111, '201603021705248857', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shunfeng', '顺丰物流', NULL, '', '', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.00', 1456909524, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', '0', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(112, '201603021718095273', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shunfeng', '顺丰物流', NULL, '', '', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.00', 1456910289, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', '0', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(113, '201603021741227096', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shunfeng', '顺丰物流', NULL, '', '', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.00', 1456911682, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', '0', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(114, '201603021757517672', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shunfeng', '顺丰物流', NULL, '', '', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.00', 1456912671, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', '0', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(115, '201603021846017449', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shunfeng', '顺丰物流', NULL, '', '', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.00', 1456915561, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', '0', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(116, '201603021849379723', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shunfeng', '顺丰物流', NULL, '', '', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.00', 1456915777, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', '0', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(117, '201603021854414182', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shunfeng', '顺丰物流', NULL, '', '', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.00', 1456916081, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', '0', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(118, '201603021855407734', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shunfeng', '顺丰物流', NULL, '', '', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.00', 1456916140, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', '0', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(288, '201606031059093738', 0, 0, 0, 1, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, 'alipay', 'app支付宝', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.01', 1464922749, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(287, '201606031056493223', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, '', '', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.01', 1464922609, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(286, '201606031056021570', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, '', '', '', '', '6000.00', '0.00', '0.00', '0.00', 0, '0.00', '6000.00', '6000.00', 1464922562, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(122, '201603031807042366', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, '', '', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.00', 1456999624, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', '0', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(123, '201603031837522967', 0, 3, 1, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shunfeng', '顺丰物流', NULL, '', '', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.00', 1457001472, 1474265403, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', '0', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(124, '201603041156115802', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, '', '', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.00', 1457063771, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', '0', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(125, '201603050922173428', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, '', '', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.00', 1457140937, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', '0', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(126, '201603050922505140', 0, 0, 0, 1, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, 'alipay', 'app支付宝', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.00', 1457140970, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', '0', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(127, '201603050927029691', 0, 0, 0, 1, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, '', '', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.00', 1457141222, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', '0', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(128, '201603050940162521', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, '', '', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.00', 1457142016, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', '0', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(129, '201603050940498804', 0, 0, 0, 1, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, 'alipay', 'app支付宝', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.00', 1457142049, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', '0', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(130, '201603051649349891', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, '', '', '', '', '22635.06', '14.00', '0.00', '0.00', 0, '0.00', '22649.06', '0.00', 1457167774, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', '0', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(131, '201603051759077204', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, '', '', '', '', '3625.02', '12.00', '0.00', '0.00', 0, '0.00', '3637.02', '0.00', 1457171947, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', '0', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(132, '201603051803507751', 0, 3, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, '', '', '', '', '3625.02', '12.00', '0.00', '0.00', 0, '0.00', '3637.02', '0.00', 1457172230, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', '0', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(133, '201603051820409355', 0, 3, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, '', '', '', '', '7250.04', '12.00', '0.00', '0.00', 0, '0.00', '7262.04', '0.00', 1457173240, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', '0', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(285, '201606031055285255', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, '', '', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.01', 1464922528, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(284, '201606031054532414', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.01', 1464922493, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(136, '201603052327236042', 0, 3, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, '', '', '', '', '3625.02', '12.00', '0.00', '0.00', 0, '0.00', '3637.02', '0.00', 1457191643, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', '0', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(137, '201603100916383448', 0, 3, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, '', '', '', '', '3625.02', '12.00', '0.00', '0.00', 0, '0.00', '3637.02', '0.00', 1457572598, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', '0', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(138, '201603100924483386', 0, 3, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, '', '', '', '', '3625.02', '12.00', '0.00', '0.00', 0, '0.00', '3637.02', '0.00', 1457573088, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', '0', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(139, '201603100940275553', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, '', '', '', '', '979.02', '12.00', '0.00', '0.00', 0, '0.00', '991.02', '0.00', 1457574027, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', '0', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(140, '201603100943338316', 0, 0, 0, 1, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, '', '', '', '', '1175.02', '12.00', '0.00', '0.00', 0, '0.00', '0.00', '0.00', 1457574213, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', '0', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(141, '201603101048436660', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, '', '', '', '', '3625.02', '12.00', '0.00', '0.00', 0, '0.00', '3637.02', '0.00', 1457578123, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', '0', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(142, '201603101050126456', 0, 0, 0, 1, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, '', '', '', '', '3625.02', '12.00', '0.00', '0.00', 0, '0.00', '0.00', '0.00', 1457578212, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', '0', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(143, '201603101052424285', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, '', '', '', '', '1175.02', '12.00', '0.00', '0.00', 0, '0.00', '1187.02', '0.00', 1457578362, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', '0', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(144, '201603101054321518', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, '', '', '', '', '2057.02', '12.00', '0.00', '0.00', 0, '0.00', '2069.02', '0.00', 1457578472, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', '0', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(145, '201603101058009294', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, '', '', '', '', '1175.02', '12.00', '0.00', '0.00', 0, '0.00', '1187.02', '0.00', 1457578680, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', '0', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(146, '201603101104101192', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, '', '', '', '', '1175.02', '12.00', '0.00', '0.00', 0, '0.00', '1187.02', '0.00', 1457579050, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', '0', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(147, '201603101104317560', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, '', '', '', '', '2057.02', '12.00', '0.00', '0.00', 0, '0.00', '2069.02', '0.00', 1457579071, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', '0', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(148, '201603101615287551', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, '', '', '', '', '7150.08', '12.00', '0.00', '0.00', 0, '0.00', '7162.08', '0.00', 1457597728, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', '0', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(149, '201603101808091112', 0, 0, 0, 0, '叶先生', '通州区旗舰凯旋小区', '15889560679', 't@tpshop.com', 'shunfeng', '顺丰物流', NULL, 'alipay', '支付宝支付', '', '', '10285.10', '0.00', '0.00', '0.00', 0, '0.00', '10285.10', '0.00', 1457604489, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', '0', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(150, '201603111626559862', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, '', '', '', '', '8829.80', '12.00', '0.00', '0.00', 0, '0.00', '8841.80', '0.00', 1457684815, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', '0', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(151, '201603112338131422', 0, 3, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, '', '', '', '', '7250.04', '12.00', '0.00', '0.00', 0, '0.00', '7262.04', '0.00', 1457710693, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', '0', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(152, '201603121135528306', 0, 3, 0, 0, '4544', '4534', '5345', '4', 'shentong', '申通物流', NULL, 'alipay', '支付宝支付', '', '', '100.00', '28.00', '0.00', '0.00', 0, '0.00', '128.00', '0.00', 1457753752, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', '0', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(153, '201603121235324538', 0, 3, 0, 0, '4544', '4534', '5345', '4', 'shentong', '申通物流', NULL, 'alipay', '支付宝支付', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.00', 1457757332, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', '0', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(154, '201603121816246688', 0, 3, 0, 1, '4544', '4534', '5345', '4', 'shentong', '申通物流', NULL, 'alipay', '支付宝支付', '', '', '16760.00', '0.00', '0.00', '0.00', 0, '0.00', '0.00', '0.00', 1457777784, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', '0', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(155, '201603122018391385', 0, 0, 0, 0, '叶先生', '通州区旗舰凯旋小区', '15889560679', 't@tpshop.com', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '10975.06', '0.00', '0.00', '0.00', 0, '0.00', '10975.06', '0.00', 1457785119, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', '0', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(156, '201603151124536882', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shunfeng', '顺丰物流', NULL, '', '', '', '', '4214.00', '0.00', '0.00', '0.00', 0, '0.00', '4214.00', '0.00', 1458012293, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', '0', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(157, '201603151130348834', 0, 0, 0, 1, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shunfeng', '顺丰物流', NULL, 'alipay', 'app支付宝', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.00', 1458012634, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', '0', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(158, '201603151345089545', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '0.01', '12.00', '0.00', '0.00', 0, '0.00', '12.01', '0.00', 1458020708, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', '0', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(159, '201603151345342125', 0, 0, 0, 1, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shunfeng', '顺丰物流', NULL, 'alipay', 'app支付宝', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.00', 1458020734, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', '0', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(160, '201603151348394817', 0, 1, 2, 1, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shunfeng', '顺丰物流', NULL, 'alipay', 'app支付宝', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.00', 1458020919, 0, 1458033994, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', '0', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(161, '201603151410289614', 0, 4, 2, 1, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shunfeng', '顺丰物流', NULL, 'alipay', 'app支付宝', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.00', 1458022228, 0, 1458023002, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', '0', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(162, '201603151551568925', 0, 1, 2, 1, '张三', '某大街道', '13554747891', '', 'shentong', '申通物流', NULL, 'alipay', '支付宝支付', '', '', '0.02', '0.00', '0.00', '0.00', 0, '0.00', '0.00', '0.00', 1458028316, 0, 1458032178, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', '0', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(163, '201603160935033272', 0, 0, 0, 0, '某大街某号 2', ' ujiuo;iiergf', '13554745866', '', 'shentong', '申通物流', NULL, '', '', '', '', '0.02', '0.00', '0.00', '0.00', 0, '0.00', '0.02', '0.00', 1458092103, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', '0', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(164, '201603161042426535', 0, 0, 0, 0, '叶先生', '通州区旗舰凯旋小区', '15889560679', 't@tpshop.com', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '195.00', '12.00', '0.00', '0.00', 0, '0.00', '0.01', '0.00', 1458096162, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', '0', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(165, '201603161406367392', 0, 3, 0, 0, '叶先生', '通州区旗舰凯旋小区', '15889560679', 't@tpshop.com', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '1.00', '0.00', 1458108396, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', '0', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(166, '201603161446236103', 0, 0, 0, 1, '4544', '4534', '5345', '4', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '5972.06', '0.00', '0.00', '0.00', 0, '0.00', '5972.06', '0.00', 1458110783, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', '0', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(167, '201603161451063617', 0, 0, 0, 1, '4544', '4534', '5345', '4', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '1959.02', '0.00', '0.00', '0.00', 0, '0.00', '1959.02', '0.00', 1458111066, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', '0', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(168, '201603161504389752', 0, 0, 0, 1, '4544', '4534', '5345', '4', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '95.00', '0.00', '0.00', '0.00', 0, '0.00', '95.00', '0.00', 1458111878, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', '0', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(169, '201603161555288197', 0, 0, 0, 1, '4544', '4534', '5345', '4', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '1959.02', '0.00', '0.00', '0.00', 0, '0.00', '1959.02', '0.00', 1458114928, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', '0', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(170, '201603161640266237', 0, 0, 0, 1, '哈哈', '记录贴', '13800138000', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '2000.00', '0.00', '0.00', '0.00', 0, '0.00', '2000.00', '0.00', 1458117626, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', '0', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(171, '201603161714583917', 0, 2, 1, 1, '叶先生', '通州区旗舰凯旋小区', '15889560679', 't@tpshop.com', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '200.00', '46.00', '0.00', '0.00', 0, '0.00', '0.01', '0.00', 1458119698, 0, 1462178878, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', '0', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(172, '201603182251139947', 0, 3, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shunfeng', '顺丰物流', NULL, '', '', '', '', '3042.04', '0.00', '0.00', '0.00', 0, '0.00', '3042.04', '3042.04', 1458312673, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', '0', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(176, '201603191601425014', 0, 1, 2, 1, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, '', '', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.01', 1458374502, 0, 1458374831, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', '0', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(174, '201603191406495683', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shunfeng', '顺丰物流', NULL, '', '', '', '', '0.01', '10.00', '0.00', '0.00', 0, '0.00', '10.01', '10.01', 1458367609, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', '0', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(175, '201603191408273699', 0, 1, 2, 1, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, '', '', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.01', 1458367707, 0, 1458373679, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', '0', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(177, '201603192017421080', 0, 2, 1, 1, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, '', '', '', '', '13812.12', '0.00', '0.00', '0.00', 0, '0.00', '13812.12', '13812.12', 1458389862, 0, 1458392104, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(178, '201603200924462926', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, '', '', '', '', '100.00', '0.00', '0.00', '0.00', 0, '0.00', '100.00', '100.00', 1458437086, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(179, '201604121231056733', 0, 0, 0, 0, '4544', '4534', '5345', '4', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '34986.00', '0.00', '0.00', '0.00', 0, '0.00', '34986.00', '34986.00', 1460435465, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(180, '201604131840284008', 0, 3, 0, 0, '叶先生', '通州区旗舰凯旋小区', '15889560679', 't@tpshop.com', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.01', 1460544028, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(181, '201604141431448890', 0, 0, 0, 1, '4544', '4534', '5345', '4', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.01', 1460615504, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(182, '201604141443297339', 0, 0, 0, 1, '叶先生', '通州区旗舰凯旋小区', '15889560679', 't@tpshop.com', 'shentong', '申通物流', NULL, 'alipay', '支付宝支付', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.01', 1460616209, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(183, '201604141446227712', 0, 0, 0, 1, 'sasa', 'sasa', '', 'zuanshi@ecshop.com', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.01', 1460616382, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(184, '201604171356316241', 0, 0, 0, 0, '某大街某号 2', ' 某街道办 .', '13554754891', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '4592.00', '0.00', '0.00', '0.00', 0, '0.00', '4592.00', '4592.00', 1460872591, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(185, '201604181118267225', 0, 0, 0, 1, '4544', '4534', '5345', '4', 'shentong', '申通物流', NULL, 'alipayMobile', '手机网站支付宝', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.01', 1460949506, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(186, '201604191651394016', 0, 0, 0, 0, ' 测试', '测试', '13012345678', '', 'shentong', '申通物流', NULL, 'alipay', '支付宝支付', '', '测试', '2209.00', '0.00', '0.00', '0.00', 0, '0.00', '2209.00', '2209.00', 1461055899, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(187, '201604191705065073', 0, 0, 0, 0, ' 测试', '测试', '13012345678', '', 'shunfeng', '顺丰物流', NULL, '', '', '', '', '2099.00', '0.00', '0.00', '0.00', 0, '0.00', '2099.00', '2099.00', 1461056706, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(188, '201604221407587301', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, '', '', '', '', '7053.06', '0.00', '0.00', '0.00', 0, '0.00', '7053.06', '7053.06', 1461305278, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(211, '201605130849293892', 0, 0, 0, 0, '张谷泉', '某大街道某号', '13554754711', '', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '5997.00', '0.00', '0.00', '0.00', 0, '0.00', '5997.00', '5997.00', 1463100569, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(212, '201605130900289519', 0, 0, 0, 0, 'ncjjja女夏季', '你会选择错误中间', '18988888888', '', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '5978.00', '0.00', '0.00', '0.00', 0, '0.00', '5978.00', '5978.00', 1463101228, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(213, '201605141359002227', 0, 0, 0, 0, '我靠你妹…', '我靠你妹啊…', '13554754268', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '2500.00', '0.00', '0.00', '0.00', 0, '0.00', '2500.00', '2500.00', 1463205540, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(214, '201605141418292409', 0, 0, 0, 0, '我靠你妹…', '我靠你妹啊…', '13554754268', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '110.00', '0.00', '0.00', '0.00', 0, '0.00', '110.00', '110.00', 1463206709, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(215, '201605141450382399', 0, 0, 0, 0, '我靠你妹…', '我靠你妹啊…', '13554754268', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '300.00', '0.00', '0.00', '0.00', 0, '0.00', '300.00', '300.00', 1463208638, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(216, '201605141458256593', 0, 0, 0, 0, '我靠你妹…', '我靠你妹啊…', '13554754268', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '110.00', '0.00', '0.00', '0.00', 0, '0.00', '110.00', '110.00', 1463209105, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `ruike_mall_order` (`order_id`, `order_sn`, `member_id`, `order_status`, `shipping_status`, `pay_status`, `consignee`, `address`, `mobile`, `email`, `shipping_code`, `shipping_name`, `invoice_no`, `pay_code`, `pay_name`, `transaction_id`, `invoice_title`, `goods_price`, `shipping_price`, `user_money`, `coupon_price`, `integral`, `integral_money`, `order_amount`, `total_amount`, `add_time`, `shipping_time`, `confirm_time`, `pay_time`, `order_prom_id`, `order_prom_amount`, `discount`, `user_note`, `admin_note`, `parent_sn`, `is_distribut`, `date_of_application`, `return_or_exchange`, `return_description`, `return_img`, `processing_remarks`, `coordinate`, `discount_type`, `pay_cnt`, `mark`) VALUES
(217, '201605141521323110', 0, 0, 0, 0, '我靠你妹…', '我靠你妹啊…', '13554754268', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '0.02', '0.00', '0.00', '0.00', 0, '0.00', '0.02', '0.02', 1463210492, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(218, '201605162011119408', 0, 0, 0, 0, '我靠你妹…', '我靠你妹啊…', '13554754268', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '0.02', '0.00', '0.00', '0.00', 0, '0.00', '0.02', '0.02', 1463400671, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(219, '201605162012201097', 0, 0, 0, 0, '我靠你妹…', '我靠你妹啊…', '13554754268', '', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '0.02', '0.00', '0.00', '0.00', 0, '0.00', '0.02', '0.02', 1463400740, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(220, '201605171056508845', 0, 0, 0, 0, '吴亚朋', '南山大道1001号', '13410710107', '', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '0.02', '0.00', '0.00', '0.00', 0, '0.00', '0.02', '0.02', 1463453810, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(221, '201605171104159579', 0, 0, 0, 0, '吴亚朋', '南山大道1001号', '13410710107', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '300.00', '0.00', '0.00', '0.00', 0, '0.00', '300.00', '300.00', 1463454255, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(222, '201605171451405036', 0, 0, 0, 1, '张谷泉', '某大街道某号', '13554754711', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '0.02', '0.00', '0.00', '0.00', 0, '0.00', '0.02', '0.02', 1463467900, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(223, '201605171607594051', 0, 0, 0, 1, '张谷泉', '某大街道某号', '13554754711', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '0.02', '0.00', '0.00', '0.00', 0, '0.00', '0.02', '0.02', 1463472479, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(224, '201605171753565314', 0, 0, 0, 0, '黄先生', '通州区旗舰凯旋小区', '15889560679', 'text@tpshop.com', 'shentong', '申通物流', NULL, 'alipay', '支付宝支付', '', '', '2057.04', '0.00', '0.00', '0.00', 0, '0.00', '2057.04', '2057.04', 1463478836, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(225, '201605171756442311', 0, 0, 0, 1, '黄先生', '通州区旗舰凯旋小区', '15889560679', 'text@tpshop.com', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '0.02', '0.00', '0.00', '0.00', 0, '0.00', '0.02', '0.02', 1463479004, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(226, '201605180114231316', 0, 0, 0, 0, '不知道', '45558', '18285166333', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '110.00', '0.00', '0.00', '0.00', 0, '0.00', '110.00', '110.00', 1463505263, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(227, '201605182100279042', 0, 0, 0, 0, '黄先生', '通州区旗舰凯旋小区', '15889560679', 'text@tpshop.com', 'shentong', '申通物流', NULL, '', '', '', '', '13996.00', '0.00', '0.00', '0.00', 0, '0.00', '13996.00', '13996.00', 1463576427, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(228, '201605190628053180', 0, 0, 0, 0, '黄先生', '通州区旗舰凯旋小区', '15889560679', 'text@tpshop.com', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '100.00', '0.00', '0.00', '0.00', 0, '0.00', '100.00', '100.00', 1463610485, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(229, '201605190846391568', 0, 0, 0, 1, '黄先生', '通州区旗舰凯旋小区', '15889560679', 'text@tpshop.com', 'shentong', '申通物流', NULL, '', '', '', '', '110.00', '0.00', '100.00', '10.00', 0, '0.00', '0.00', '110.00', 1463618799, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(230, '201605190955459419', 0, 0, 0, 0, '黄先生', '通州区旗舰凯旋小区', '15889560679', 'text@tpshop.com', 'shentong', '申通物流', NULL, 'unionpay', '银联在线支付', '', '', '95.00', '0.00', '0.00', '0.00', 0, '0.00', '95.00', '95.00', 1463622945, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(231, '201605191059088744', 0, 0, 0, 0, '徐枫', '2', '18576083032', '', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '3499.00', '0.00', '0.00', '0.00', 0, '0.00', '3499.00', '3499.00', 1463626748, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(232, '201605191101515264', 0, 0, 0, 0, '黄先生', '通州区旗舰凯旋小区', '15889560679', 'text@tpshop.com', 'shentong', '申通物流', NULL, 'unionpay', '银联在线支付', '', '', '0.02', '0.00', '0.00', '0.00', 0, '0.00', '0.02', '0.02', 1463626911, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(233, '201605191123535489', 0, 0, 0, 0, '黄先生', '通州区旗舰凯旋小区', '15889560679', 'text@tpshop.com', 'shentong', '申通物流', NULL, 'unionpay', '银联在线支付', '', '', '2100.02', '0.00', '0.00', '0.00', 0, '0.00', '2100.02', '2100.02', 1463628233, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(234, '201605191124263015', 0, 0, 0, 0, '黄先生', '通州区旗舰凯旋小区', '15889560679', 'text@tpshop.com', 'shentong', '申通物流', NULL, 'unionpay', '银联在线支付', '', '', '0.02', '0.00', '0.00', '0.00', 0, '0.00', '0.02', '0.02', 1463628266, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(235, '201605191309251906', 0, 0, 0, 0, '黄先生', '通州区旗舰凯旋小区', '15889560679', 'text@tpshop.com', 'shentong', '申通物流', NULL, 'unionpay', '银联在线支付', '', '', '100.00', '0.00', '0.00', '0.00', 0, '0.00', '100.00', '100.00', 1463634565, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(236, '201605191342293821', 0, 0, 0, 0, '黄先生', '通州区旗舰凯旋小区', '15889560679', 'text@tpshop.com', 'shentong', '申通物流', NULL, 'unionpay', '银联在线支付', '', '', '100.00', '0.00', '0.00', '0.00', 0, '0.00', '100.00', '100.00', 1463636549, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(237, '201605191346303338', 0, 0, 0, 0, '黄先生', '通州区旗舰凯旋小区', '15889560679', 'text@tpshop.com', 'shentong', '申通物流', NULL, 'unionpay', '银联在线支付', '', '', '0.02', '0.00', '0.00', '0.00', 0, '0.00', '0.02', '0.02', 1463636790, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(238, '201605191351291601', 0, 0, 0, 1, '黄先生', '通州区旗舰凯旋小区', '15889560679', 'text@tpshop.com', 'shentong', '申通物流', NULL, 'alipay', '支付宝支付', '', '', '0.02', '0.00', '0.00', '0.00', 0, '0.00', '0.02', '0.02', 1463637089, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(239, '201605191357396983', 0, 3, 0, 0, '黄先生', '通州区旗舰凯旋小区', '15889560679', 'text@tpshop.com', 'shentong', '申通物流', NULL, 'unionpay', '银联在线支付', '', '', '0.02', '0.00', '0.00', '0.00', 0, '0.00', '0.02', '0.02', 1463637459, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(240, '201605191415507531', 0, 3, 0, 0, '黄先生', '通州区旗舰凯旋小区', '15889560679', 'text@tpshop.com', 'shentong', '申通物流', NULL, 'unionpay', '银联在线支付', '', '', '0.02', '0.00', '0.00', '0.00', 0, '0.00', '0.02', '0.02', 1463638550, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(241, '201605191422526381', 0, 0, 0, 1, '黄先生', '通州区旗舰凯旋小区', '15889560679', 'text@tpshop.com', 'shentong', '申通物流', NULL, 'unionpay', '银联在线支付', '', '', '0.02', '0.00', '0.00', '0.00', 0, '0.00', '0.02', '0.02', 1463638972, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(242, '201605191432322311', 0, 0, 0, 1, '黄先生', '通州区旗舰凯旋小区', '15889560679', 'text@tpshop.com', 'shentong', '申通物流', NULL, 'unionpay', '银联在线支付', '', '', '100.00', '0.00', '0.00', '0.00', 0, '0.00', '100.00', '100.00', 1463639552, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(243, '201605191435394214', 0, 0, 0, 1, '黄先生', '通州区旗舰凯旋小区', '15889560679', 'text@tpshop.com', 'shentong', '申通物流', NULL, 'unionpay', '银联在线支付', '', '', '0.02', '0.00', '0.00', '0.00', 0, '0.00', '0.02', '0.02', 1463639739, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(244, '201605191439252479', 0, 0, 0, 1, '黄先生', '通州区旗舰凯旋小区', '15889560679', 'text@tpshop.com', 'shentong', '申通物流', NULL, 'unionpay', '银联在线支付', '', '', '0.02', '0.00', '0.00', '0.00', 0, '0.00', '0.02', '0.02', 1463639965, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(245, '201605191515168112', 0, 3, 0, 0, '黄先生', '通州区旗舰凯旋小区', '15889560679', 'text@tpshop.com', 'shunfeng', '顺丰物流', NULL, 'alipayMobile', '手机网站支付宝', '', '', '12000.00', '0.00', '0.00', '0.00', 0, '0.00', '12000.00', '12000.00', 1463642116, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(246, '201605191716367771', 0, 0, 0, 0, '黄先生', '通州区旗舰凯旋小区', '15889560679', 'text@tpshop.com', 'shentong', '申通物流', NULL, 'unionpay', '银联在线支付', '', '', '2100.00', '0.00', '0.00', '0.00', 0, '0.00', '2100.00', '2100.00', 1463649396, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(247, '201605191718523981', 0, 3, 0, 0, '黄先生', '通州区旗舰凯旋小区', '15889560679', 'text@tpshop.com', 'shentong', '申通物流', NULL, 'unionpay', '银联在线支付', '', '', '100.00', '0.00', '0.00', '0.00', 0, '0.00', '100.00', '100.00', 1463649532, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(248, '201605192023052392', 0, 0, 0, 1, '黄先生', '通州区旗舰凯旋小区', '15889560679', 'text@tpshop.com', 'shunfeng', '顺丰物流', NULL, '', '', '', '', '110.00', '16.00', '108.00', '0.00', 180, '18.00', '0.00', '126.00', 1463660585, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(249, '201605201054187312', 0, 3, 0, 0, '黄先生', '通州区旗舰凯旋小区', '15889560679', 'text@tpshop.com', 'shentong', '申通物流', NULL, 'unionpay', '银联在线支付', '', '', '2400.00', '0.00', '0.00', '0.00', 0, '0.00', '2400.00', '2400.00', 1463712858, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(271, '201605240857157854', 0, 0, 0, 0, '继续继续', '继续继续奖学金', '15888888888', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '3398.00', '0.00', '0.00', '0.00', 0, '0.00', '3398.00', '3398.00', 1464051435, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(272, '201605241101429707', 0, 3, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, 'alipayMobile', '手机网站支付宝', '', '', '8933.00', '0.00', '0.00', '0.00', 0, '0.00', '8933.00', '8933.00', 1464058902, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(273, '201605251918276709', 0, 0, 0, 0, '牛气轰轰', '某大街道某号', '13554754711', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '69.00', '0.00', '0.00', '0.00', 0, '0.00', '69.00', '69.00', 1464175107, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(274, '201605261523288101', 0, 0, 0, 0, '123', '九里堤中路52号', '18308379300', '', 'shentong', '申通物流', NULL, '', '', '', '', '110.00', '0.00', '0.00', '0.00', 0, '0.00', '110.00', '110.00', 1464247408, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(275, '201605281133527619', 0, 3, 0, 0, '刘显示', '啊啊啊啊啊啊', '13603712782', '', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '100.00', '0.00', '0.00', '0.00', 0, '0.00', '100.00', '100.00', 1464406432, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(276, '201605281150402484', 0, 3, 0, 0, '刘显示', '啊啊啊啊啊啊', '13603712782', '', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '110.00', '0.00', '0.00', '0.00', 0, '0.00', '110.00', '110.00', 1464407440, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(277, '201606021721386276', 0, 0, 0, 1, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, 'alipay', 'app支付宝', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.01', 1464859298, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(278, '201606021729389772', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, '', '', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.01', 1464859778, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(279, '201606021730296940', 0, 0, 0, 1, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, 'alipay', 'app支付宝', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.01', 1464859829, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(280, '201606031021456806', 0, 0, 0, 0, '黄先生', '通州区旗舰凯旋小区', '15889560679', 'text@tpshop.com', 'shentong', '申通物流', NULL, '', '', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.01', 1464920505, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(281, '201606031022569005', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, '', '', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.01', 1464920576, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(282, '201606031025515097', 0, 0, 0, 1, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, 'alipay', 'app支付宝', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.01', 1464920751, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(283, '201606031036523061', 0, 3, 0, 0, 'sasa', 'sasa', '', 'zuanshi@tpshop.com', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '1999.00', '0.00', '0.00', '0.00', 0, '0.00', '1999.00', '1999.00', 1464921412, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(265, '201605211047582085', 0, 0, 0, 0, '我', '北京', '13675116451', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '110.00', '0.00', '0.00', '0.00', 0, '0.00', '110.00', '110.00', 1463798878, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(266, '201605211930041705', 0, 0, 0, 0, 'sdfqwe', 'fewf', '18666666666', '', 'shentong', '申通物流', NULL, 'alipay', '支付宝支付', '', '', '1999.00', '0.00', '0.00', '0.00', 0, '0.00', '1999.00', '1999.00', 1463830204, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(267, '201605211932224057', 0, 0, 0, 0, 'sdfqwe', 'fewf', '18666666666', '', 'shentong', '申通物流', NULL, 'alipayMobile', '手机网站支付宝', '', '', '69.00', '0.00', '0.00', '0.00', 0, '0.00', '69.00', '69.00', 1463830342, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(268, '201605221202353748', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '22996.00', '0.00', '0.00', '0.00', 0, '0.00', '22996.00', '22996.00', 1463889755, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(269, '201605221816166477', 0, 0, 0, 0, '哈哈哈', '啊啊', '13068103525', '', 'shunfeng', '顺丰物流', NULL, 'cod', '到货付款', '', '', '1500.00', '0.00', '0.00', '0.00', 0, '0.00', '1500.00', '1500.00', 1463912176, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(270, '201605222105293784', 0, 3, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '679.20', '0.00', '0.00', '0.00', 0, '0.00', '679.20', '679.20', 1463922329, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(293, '201606081641259679', 0, 0, 0, 0, '王云', '红红火火过后', '13555555555', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '110.00', '9.00', '0.00', '0.00', 0, '0.00', '119.00', '119.00', 1465375285, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(294, '201606121748208619', 0, 0, 0, 0, '牛气轰轰', '某大街道某号', '13554754711', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '18300.00', '35.00', '0.00', '0.00', 0, '0.00', '18335.00', '18335.00', 1465724900, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(295, '201606130838388713', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, 'alipay', '支付宝支付', '', '', '1999.00', '7.00', '0.00', '10.00', 0, '0.00', '1996.00', '2006.00', 1465778318, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(296, '201606172127176819', 0, 0, 0, 0, '哈哈哈', '啊啊', '13068103525', '', 'shunfeng', '顺丰物流', NULL, 'weixin', '微信支付', '', '', '2399.00', '12.00', '0.00', '0.00', 0, '0.00', '2411.00', '2411.00', 1466170037, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(297, '201606181152028740', 0, 3, 0, 0, '123454', '李敏', '13554754788', '', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '499.00', '7.00', '0.00', '0.00', 0, '0.00', '506.00', '506.00', 1466221922, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(298, '201606181315565231', 0, 3, 0, 0, '哈哈', '人民路', '15833996666', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '169.00', '17.00', '0.00', '0.00', 0, '0.00', '186.00', '186.00', 1466226956, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(299, '201606181631391423', 0, 0, 0, 0, 'jrrujwj', 'hrjeidj', '13564978564', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', 'hdidjeiiehdjd', '719.00', '13.00', '0.00', '0.00', 0, '0.00', '732.00', '732.00', 1466238699, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(300, '201606181707229292', 0, 0, 0, 0, '公积金', '破坏了', '13554785642', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '4900.00', '9.00', '0.00', '0.00', 0, '0.00', '4909.00', '4909.00', 1466240842, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(301, '201606181834072033', 0, 0, 0, 0, '公积金', '破坏了', '13554785642', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '4000.00', '7.00', '0.00', '0.00', 0, '0.00', '4007.00', '4007.00', 1466246047, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(302, '201606181838038055', 0, 0, 0, 0, '发件人方法', 'gejjsdj', '13568877665', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '3400.00', '7.00', '0.00', '0.00', 0, '0.00', '3407.00', '3407.00', 1466246283, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(303, '201606181841418834', 0, 0, 0, 0, '发件人方法', 'gejjsdj', '13568877665', '', 'shentong', '申通物流', NULL, '', '', '', '', '69.00', '7.00', '0.00', '0.00', 0, '0.00', '76.00', '76.00', 1466246501, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(304, '201606200025291200', 0, 0, 0, 0, '公积金', '破坏了', '13554785642', '', 'shunfeng', '顺丰物流', NULL, 'weixin', '微信支付', '', '', '207.00', '14.00', '0.00', '0.00', 0, '0.00', '221.00', '221.00', 1466353529, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(305, '201606200032112744', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, '', '', '', '', '169.00', '9.00', '0.00', '0.00', 0, '0.00', '178.00', '178.00', 1466353931, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(306, '201606201539238652', 0, 0, 0, 0, '黄先生', '通州区旗舰凯旋小区', '15889560679', 'text@tpshop.com', 'shentong', '申通物流', NULL, '', '', '', '', '6239.00', '17.00', '0.00', '0.00', 0, '0.00', '6256.00', '6256.00', 1466408363, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(307, '201606201850261915', 0, 2, 1, 1, '发件人方法', 'gejjsdj', '13568877665', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '6800.00', '7.00', '0.00', '0.00', 0, '0.00', '6807.00', '6807.00', 1466419826, 1466419938, 1466419959, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(308, '201606202310368721', 0, 3, 0, 0, '公积金', '破坏了', '13554785642', '', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '测试发票数据', '220.00', '11.00', '1.00', '0.00', 0, '0.00', '230.00', '231.00', 1466435436, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(309, '201606202333566598', 0, 0, 0, 0, '张三', '一张张', '15122083581', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '0.01', '7.00', '0.00', '0.00', 0, '0.00', '7.01', '7.01', 1466436836, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(310, '201606202335107696', 0, 0, 0, 0, '张三', '贝村305', '15057808172', '', 'shentong', '申通物流', NULL, '', '', '', '', '3400.00', '7.00', '0.00', '0.00', 0, '0.00', '3407.00', '3407.00', 1466436910, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(311, '201606210016578591', 0, 0, 0, 0, '饿了', '涂涂', '15688888888', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '69.00', '7.00', '0.00', '0.00', 0, '0.00', '76.00', '76.00', 1466439417, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(312, '201606210024507199', 0, 0, 0, 0, '张三', '贝村305', '15057808172', '', 'shentong', '申通物流', NULL, '', '', '', '', '110.00', '9.00', '0.00', '0.00', 0, '0.00', '119.00', '119.00', 1466439890, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(313, '201606210028236519', 0, 0, 0, 0, '张三', '贝村305', '15057808172', '', 'shentong', '申通物流', NULL, '', '', '', '', '100.00', '9.00', '0.00', '0.00', 0, '0.00', '109.00', '109.00', 1466440103, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(314, '201606210028559952', 0, 0, 0, 0, '1', '1', '15011805868', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '3400.00', '7.00', '0.00', '0.00', 0, '0.00', '3407.00', '3407.00', 1466440135, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(315, '201606210031183118', 0, 0, 0, 0, '张三', '贝村305', '15057808172', '', 'shentong', '申通物流', NULL, '', '', '', '', '4000.00', '7.00', '0.00', '0.00', 0, '0.00', '4007.00', '4007.00', 1466440278, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(316, '201606210032192099', 0, 0, 0, 0, '张三', '贝村305', '15057808172', '', 'shentong', '申通物流', NULL, '', '', '', '', '6858.00', '7.00', '0.00', '0.00', 0, '0.00', '6865.00', '6865.00', 1466440339, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(317, '201606210034296506', 0, 0, 0, 0, '公积金', '破坏了', '13554785642', '', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '6910.00', '11.00', '0.00', '0.00', 0, '0.00', '6921.00', '6921.00', 1466440469, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(318, '201606210155035035', 0, 0, 0, 0, '李四', '北村', '15057808172', '', 'shentong', '申通物流', NULL, '', '', '', '', '84.90', '7.00', '0.00', '0.00', 0, '0.00', '91.90', '91.90', 1466445303, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(319, '201606210155576664', 0, 0, 0, 0, '张三', '贝村305', '15057808172', '', 'shentong', '申通物流', NULL, '', '', '', '', '50.00', '7.00', '0.00', '0.00', 0, '0.00', '57.00', '57.00', 1466445357, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(320, '201606210721246692', 0, 0, 0, 0, '蒋倩俊', '赤岭头新一村111栋', '13691643717', '', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '0.01', '7.00', '0.00', '0.00', 0, '0.00', '7.01', '7.01', 1466464884, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(321, '201606211441368978', 0, 0, 0, 0, '张三', '贝村305', '15057808172', '', 'shentong', '申通物流', NULL, '', '', '', '', '4000.00', '7.00', '0.00', '0.00', 0, '0.00', '4007.00', '4007.00', 1466491296, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(322, '201606212300536593', 0, 0, 0, 1, '公积金', '破坏了', '13554785642', '', 'shentong', '申通物流', NULL, '', '', '', '', '0.00', '0.00', '0.00', '0.00', 0, '0.00', '0.00', '0.00', 1466521253, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(323, '201606212322564377', 0, 3, 0, 0, 'astat', '位置', '13144828677', '', 'shunfeng', '顺丰物流', NULL, 'weixin', '微信支付', '', '', '153.90', '12.00', '0.00', '0.00', 0, '0.00', '165.90', '165.90', 1466522576, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(324, '201606212325093991', 0, 3, 0, 0, 'astat', '位置', '13144828677', '', 'shentong', '申通物流', NULL, '', '', '', '', '110.00', '9.00', '0.00', '0.00', 0, '0.00', '119.00', '119.00', 1466522709, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(325, '201606212326334054', 0, 3, 0, 0, 'astat', '位置', '13144828677', '', 'shentong', '申通物流', NULL, '', '', '', '', '69.00', '7.00', '0.00', '0.00', 0, '0.00', '76.00', '76.00', 1466522793, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(326, '201606220051394297', 0, 0, 0, 0, 'eee', 'hh', '18588392834', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '276.00', '9.00', '0.00', '0.00', 0, '0.00', '285.00', '285.00', 1466527899, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(327, '201606220718294605', 0, 0, 0, 0, '天天天', '哈哈哈', '18888888888', '', 'shunfeng', '顺丰物流', NULL, 'weixin', '微信支付', '', '', '10663.00', '18.00', '0.00', '0.00', 0, '0.00', '10681.00', '10681.00', 1466551109, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(328, '201606221154502019', 0, 0, 0, 0, '呵呵', '呵呵', '15022222123', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '69.00', '7.00', '0.00', '0.00', 0, '0.00', '76.00', '76.00', 1466567690, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(329, '201606230931388116', 0, 0, 0, 0, '哈哈', '人民路', '15833996666', '', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '3400.00', '7.00', '0.00', '0.00', 0, '0.00', '3407.00', '3407.00', 1466645498, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(330, '201606231037323328', 0, 0, 0, 0, '哦', '看看', '13996482451', '', 'shunfeng', '顺丰物流', NULL, 'weixin', '微信支付', '', '', '248.00', '16.00', '0.00', '0.00', 0, '0.00', '264.00', '264.00', 1466649452, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(331, '201606231727298380', 0, 0, 0, 0, '我跟', ' 兔兔', '18536497653', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '69.00', '7.00', '0.00', '0.00', 0, '0.00', '76.00', '76.00', 1466674049, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(332, '201606241336107972', 0, 0, 0, 0, '陈刚', '二轻商场', '13857946000', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '84.90', '7.00', '0.00', '0.00', 0, '0.00', '91.90', '91.90', 1466746570, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(333, '201606241549346891', 0, 0, 0, 0, '张扬', '大家看见赵君很纠结', '13837160766', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '110.00', '9.00', '0.00', '0.00', 0, '0.00', '119.00', '119.00', 1466754574, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(334, '201606241800458323', 0, 0, 0, 0, '哈哈哈', '啊啊', '13068103525', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '5000.00', '9.00', '0.00', '0.00', 0, '0.00', '5009.00', '5009.00', 1466762445, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(335, '201606250116378413', 0, 0, 0, 0, '胡高山', '没有地址', '13856234796', '', 'shunfeng', '顺丰物流', NULL, 'cod', '到货付款', '', '', '50.00', '12.00', '0.00', '0.00', 0, '0.00', '62.00', '62.00', 1466788597, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(336, '201606270215053504', 0, 0, 0, 0, '张三', '贝村305', '15057808172', '', 'shentong', '申通物流', NULL, '', '', '', '', '110.00', '9.00', '0.00', '0.00', 0, '0.00', '119.00', '119.00', 1466964905, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(337, '201606271537532129', 0, 0, 0, 0, '今年', '匿名MSN', '13366645954', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '50.00', '7.00', '0.00', '0.00', 0, '0.00', '57.00', '57.00', 1467013073, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(338, '201606271625409815', 0, 0, 0, 0, '刘文浩', '呵呵', '18689208389', '', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '84.90', '7.00', '0.00', '0.00', 0, '0.00', '91.90', '91.90', 1467015940, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(339, '201606271641537578', 0, 3, 0, 0, '曾', '上梅林', '13800138000', '', 'shunfeng', '顺丰物流', NULL, 'weixin', '微信支付', '', '', '4858.00', '12.00', '0.00', '0.00', 0, '0.00', '4870.00', '4870.00', 1467016913, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(340, '201606281247405522', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, 'unionpay', '银联在线支付', '', '', '1999.00', '7.00', '0.00', '0.00', 0, '0.00', '2006.00', '2006.00', 1467089260, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(341, '201606281248459624', 0, 0, 0, 0, 'zzz', 'asdasas', '18932020010', '', 'shentong', '申通物流', NULL, 'unionpay', '银联在线支付', '', '', '1999.00', '7.00', '0.00', '0.00', 0, '0.00', '2006.00', '2006.00', 1467089325, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(342, '201606281352532022', 0, 0, 0, 0, '张小', '红红红火火', '13037105660', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '69.00', '7.00', '0.00', '0.00', 0, '0.00', '76.00', '76.00', 1467093173, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(343, '201606281512132854', 0, 0, 0, 0, '得了', '离开', '13800138000', '', 'shunfeng', '顺丰物流', NULL, 'cod', '到货付款', '', '', '3400.00', '12.00', '0.00', '0.00', 0, '0.00', '3412.00', '3412.00', 1467097933, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(344, '201606281659591118', 0, 0, 0, 0, '祁大众', '终古一战', '13837170897', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '69.00', '7.00', '0.00', '0.00', 0, '0.00', '76.00', '76.00', 1467104399, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(345, '201606281744473756', 0, 0, 0, 0, '测试', '子的人多', '15900000000', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '69.00', '7.00', '0.00', '0.00', 0, '0.00', '76.00', '76.00', 1467107087, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(346, '201606291034331288', 0, 0, 0, 0, '54546', '计算机三级的', '18373258368', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '3400.00', '7.00', '0.00', '0.00', 0, '0.00', '3407.00', '3407.00', 1467167673, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(347, '201606291541441441', 0, 0, 0, 0, '马晓明', '迎江', '18699946444', '', 'shunfeng', '顺丰物流', NULL, 'cod', '到货付款', '', '', '110.00', '14.00', '0.00', '0.00', 0, '0.00', '124.00', '124.00', 1467186104, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(348, '201606291817017545', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, '', '', '', '', '220.00', '11.00', '0.00', '0.00', 0, '0.00', '231.00', '231.00', 1467195421, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(349, '201606291855371807', 0, 0, 0, 0, '很好', '太斤斤计较咯哦', '18757790011', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '哈哈哈哈', '3400.00', '7.00', '0.00', '0.00', 0, '0.00', '3407.00', '3407.00', 1467197737, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(350, '201606292006006588', 0, 0, 0, 0, '是', 's s s', '18878888888', '', 'shentong', '申通物流', NULL, '', '', '', '', '69.00', '7.00', '0.00', '0.00', 0, '0.00', '76.00', '76.00', 1467201960, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(351, '201606292116313359', 0, 0, 0, 0, '你呢哈哈哈喽', '哦你后好', '13760832719', '', 'shunfeng', '顺丰物流', NULL, 'weixin', '微信支付', '', '', '550.00', '24.00', '0.00', '0.00', 0, '0.00', '574.00', '574.00', 1467206191, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(352, '201606292153588665', 0, 0, 0, 0, '很好', '太斤斤计较咯哦', '18757790011', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '2300.00', '7.00', '0.00', '0.00', 0, '0.00', '2307.00', '2307.00', 1467208438, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(353, '201606301231408664', 0, 0, 0, 0, 'jc', '测试', '18611116666', '', 'shentong', '申通物流', NULL, '', '', '', '', '6800.00', '7.00', '0.00', '0.00', 0, '0.00', '6807.00', '6807.00', 1467261100, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(354, '201606301521494563', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, '', '', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.01', 1467271309, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(355, '201606301621369369', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, '', '', '', '', '6998.00', '0.00', '0.00', '0.00', 0, '0.00', '6998.00', '6998.00', 1467274896, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(356, '201606301624482316', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, '', '', '', '', '42000.00', '0.00', '0.00', '0.00', 0, '0.00', '42000.00', '42000.00', 1467275088, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(357, '201606301638228951', 0, 3, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, '', '', '', '', '207.00', '0.00', '0.00', '0.00', 0, '0.00', '207.00', '207.00', 1467275902, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(358, '201606301645038458', 0, 3, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '3499.00', '0.00', '0.00', '0.00', 0, '0.00', '3499.00', '3499.00', 1467276303, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(359, '201606301712311448', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, '', '', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.01', 1467277951, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(360, '201606301722262755', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, '', '', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.01', 1467278546, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(361, '201606301724528726', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, '', '', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.01', 1467278692, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(362, '201606301727105350', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, '', '', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.01', 1467278830, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(363, '201606301729131842', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, '', '', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.01', 1467278953, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(364, '201606301734094220', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, '', '', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.01', 1467279249, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(365, '201606302130383456', 0, 0, 0, 0, '哈哈', '人民路', '15833996666', '', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.01', 1467293438, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(366, '201607011719211266', 0, 0, 0, 0, '还好风光', '互粉互粉互粉', '13880101434', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '3400.00', '0.00', '0.00', '0.00', 0, '0.00', '3400.00', '3400.00', 1467364761, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(367, '201607020141542091', 0, 3, 0, 0, 'zzz', 'zzz', '13175288808', '', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '3669.00', '0.00', '0.00', '0.00', 0, '0.00', '3669.00', '3669.00', 1467394914, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(368, '201607020726485625', 0, 0, 0, 0, '刚刚', '刚刚 v 吧', '13434427900', '', 'shunfeng', '顺丰物流', NULL, 'cod', '到货付款', '', '', '169.00', '14.00', '0.00', '0.00', 0, '0.00', '183.00', '183.00', 1467415608, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(369, '201607020936454695', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, '', '', '', '', '2565.01', '0.00', '0.00', '0.00', 0, '0.00', '2565.01', '2565.01', 1467423405, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(370, '201607020938388782', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, '', '', '', '', '6042.50', '0.00', '0.00', '0.00', 0, '0.00', '6042.50', '6042.50', 1467423518, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(371, '201607021057314894', 0, 0, 0, 0, '阿杜', '久', '13350850518', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '110.00', '0.00', '0.00', '0.00', 0, '0.00', '110.00', '110.00', 1467428251, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(372, '201607021133094357', 0, 0, 0, 0, '仅限', '这样我', '18673553535', '', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '3400.00', '0.00', '0.00', '0.00', 0, '0.00', '3400.00', '3400.00', 1467430389, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(373, '201607021317548599', 0, 0, 0, 0, '把', '中', '13445566798', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '6800.00', '0.00', '0.00', '0.00', 0, '0.00', '6800.00', '6800.00', 1467436674, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(374, '201607021319593819', 0, 0, 0, 0, '阿杜', '久', '13350850518', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '110.00', '0.00', '0.00', '0.00', 0, '0.00', '110.00', '110.00', 1467436799, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(375, '201607021444428471', 0, 0, 0, 0, '吴先生', '红牌楼', '13668127275', '', 'shentong', '申通物流', NULL, '', '', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.01', 1467441882, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(376, '201607021446267812', 0, 3, 0, 0, '坝坝', '巴拉拉能量', '18200225566', '', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '69.00', '0.00', '0.00', '0.00', 0, '0.00', '69.00', '69.00', 1467441986, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(377, '201607021528185823', 0, 0, 0, 0, '2k', '好的', '13000000000', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '110.00', '0.00', '0.00', '0.00', 0, '0.00', '110.00', '110.00', 1467444498, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(378, '201607021606308946', 0, 0, 0, 0, '2k', '好的', '13000000000', '', 'shentong', '申通物流', NULL, '', '', '', '', '69.00', '0.00', '0.00', '0.00', 0, '0.00', '69.00', '69.00', 1467446790, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(379, '201607021744342427', 0, 0, 0, 0, 'udh', 'xhs', '15897812088', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '110.00', '0.00', '0.00', '0.00', 0, '0.00', '110.00', '110.00', 1467452674, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(380, '201607021751098316', 0, 3, 1, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '379.01', '0.00', '0.00', '0.00', 0, '0.00', '379.01', '379.01', 1467453069, 1467620455, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `ruike_mall_order` (`order_id`, `order_sn`, `member_id`, `order_status`, `shipping_status`, `pay_status`, `consignee`, `address`, `mobile`, `email`, `shipping_code`, `shipping_name`, `invoice_no`, `pay_code`, `pay_name`, `transaction_id`, `invoice_title`, `goods_price`, `shipping_price`, `user_money`, `coupon_price`, `integral`, `integral_money`, `order_amount`, `total_amount`, `add_time`, `shipping_time`, `confirm_time`, `pay_time`, `order_prom_id`, `order_prom_amount`, `discount`, `user_note`, `admin_note`, `parent_sn`, `is_distribut`, `date_of_application`, `return_or_exchange`, `return_description`, `return_img`, `processing_remarks`, `coordinate`, `discount_type`, `pay_cnt`, `mark`) VALUES
(381, '201607021800094711', 0, 0, 0, 0, 'udh', 'xhs', '15897812088', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '110.00', '0.00', '0.00', '0.00', 0, '0.00', '110.00', '110.00', 1467453609, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(382, '201607021809199195', 0, 0, 0, 0, 'udh', 'xhs', '15897812088', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '110.00', '0.00', '0.00', '0.00', 0, '0.00', '110.00', '110.00', 1467454159, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(383, '201607030033537041', 0, 0, 0, 0, '公积金', '破坏了', '13554785642', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '53595.00', '0.00', '0.00', '0.00', 0, '0.00', '53595.00', '53595.00', 1467477233, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(384, '201607031325083590', 0, 0, 0, 0, '公积金', '破坏了', '13554785642', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '6858.00', '0.00', '0.00', '0.00', 0, '0.00', '6858.00', '6858.00', 1467523508, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(385, '201607031330067890', 0, 0, 0, 0, '没', '二', '18218682008', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '3400.00', '0.00', '0.00', '0.00', 0, '0.00', '3400.00', '3400.00', 1467523806, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(386, '201607031433486997', 0, 3, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '3998.00', '0.00', '0.00', '0.00', 0, '0.00', '3998.00', '3998.00', 1467527628, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(387, '201607031612432018', 0, 0, 0, 0, '1324666666', '光明', '13146164946', '', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '7994.00', '0.00', '0.00', '0.00', 0, '0.00', '7994.00', '7994.00', 1467533563, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(388, '201607031621069672', 0, 0, 0, 0, '1324666666', '光明', '13146164946', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '8000.00', '0.00', '0.00', '0.00', 0, '0.00', '8000.00', '8000.00', 1467534066, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(389, '201607031628506085', 0, 0, 0, 0, '2k', '好的', '13000000000', '', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '3499.00', '0.00', '0.00', '0.00', 0, '0.00', '3499.00', '3499.00', 1467534530, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(390, '201607032356181707', 0, 0, 0, 0, '传销', '从 v 火锅', '13354865467', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '220.00', '0.00', '0.00', '0.00', 0, '0.00', '220.00', '220.00', 1467561378, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(391, '201607041118087418', 0, 3, 0, 0, '规划环境', '不仅积极斤斤计较湖', '13422142616', '', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '110.00', '0.00', '0.00', '0.00', 0, '0.00', '110.00', '110.00', 1467602288, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(392, '201607041122067797', 0, 3, 0, 0, '规划环境', '不仅积极斤斤计较湖', '13422142616', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '110.00', '0.00', '0.00', '0.00', 0, '0.00', '110.00', '110.00', 1467602526, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(393, '201607041232542790', 0, 0, 0, 0, '测试', '好好学习', '13888888888', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '69.00', '0.00', '0.00', '0.00', 0, '0.00', '69.00', '69.00', 1467606774, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(394, '201607041653061035', 0, 0, 0, 0, '哈哈哈', '积极将计就计……不会', '18888888888', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '50.00', '0.00', '0.00', '0.00', 0, '0.00', '50.00', '50.00', 1467622386, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(395, '201607041748018938', 0, 0, 0, 0, '张威', '礼河', '15195044405', '', 'shunfeng', '顺丰物流', NULL, 'weixin', '微信支付', '', '', '1098.00', '12.00', '0.00', '0.00', 0, '0.00', '1110.00', '1110.00', 1467625681, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(396, '201607042214012294', 0, 3, 0, 0, '任杰', '住邦2000', '18600610421', '', 'shunfeng', '顺丰物流', NULL, 'weixin', '微信支付', '', '', '11736.00', '12.00', '0.00', '0.00', 0, '0.00', '11748.00', '11748.00', 1467641641, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(397, '201607051805553259', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, '', '', '', '', '4995.02', '0.00', '0.00', '0.00', 0, '0.00', '4995.02', '4995.02', 1467713155, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(398, '201607061753074643', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, 'unionpay', '银联在线支付', '', '', '2068.90', '0.00', '0.00', '0.00', 0, '0.00', '2068.90', '2068.90', 1467798787, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(399, '201607061812366062', 0, 0, 0, 0, '哈哈', '好', '15226395170', '', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '2300.00', '0.00', '0.00', '0.00', 0, '0.00', '2300.00', '2300.00', 1467799956, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(400, '201607061848161085', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, '', '', '', '', '2274.02', '0.00', '0.00', '0.00', 0, '0.00', '2274.02', '2274.02', 1467802096, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(401, '201607062047421326', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, '', '', '', '', '0.02', '0.00', '0.00', '0.00', 0, '0.00', '0.02', '0.02', 1467809262, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(402, '201607062100552105', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, '', '', '', '', '13142.80', '0.00', '0.00', '0.00', 0, '0.00', '13142.80', '13142.80', 1467810055, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(403, '201607071719166798', 0, 0, 0, 0, '问问', '算算', '15361234561', '', 'shunfeng', '顺丰物流', NULL, 'weixin', '微信支付', '', '', '84.90', '12.00', '0.00', '0.00', 0, '0.00', '96.90', '96.90', 1467883156, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(404, '201607080444434627', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, 'alipay', '支付宝支付', '', '', '1999.01', '0.00', '0.00', '0.00', 0, '0.00', '1999.01', '1999.01', 1467924283, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(405, '201607081627106800', 0, 0, 0, 0, '阿里l', '哦路吞没', '13211112222', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '110.00', '0.00', '0.00', '0.00', 0, '0.00', '110.00', '110.00', 1467966430, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(406, '201607081723238074', 0, 0, 0, 0, '阿山', '罗岗', '15889933997', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '2699.00', '0.00', '0.00', '0.00', 0, '0.00', '2699.00', '2699.00', 1467969803, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(407, '201607090823367233', 0, 0, 0, 0, '李美美', '美女街', '13569870495', '', 'shunfeng', '顺丰物流', NULL, 'cod', '到货付款', '', '', '531.00', '14.00', '12.00', '0.00', 0, '0.00', '533.00', '545.00', 1468023816, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(408, '201607101119054676', 0, 0, 0, 0, '刘等等', '多大码是你的你说呢', '13644155280', '', 'shunfeng', '顺丰物流', NULL, 'weixin', '微信支付', '', '', '69.00', '12.00', '0.00', '0.00', 0, '0.00', '81.00', '81.00', 1468120745, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(409, '201607110952144571', 0, 3, 0, 0, '蔡长权', '某天哦哦', '18657163268', '', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '2300.00', '0.00', '0.00', '0.00', 0, '0.00', '2300.00', '2300.00', 1468201934, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(410, '201607111038467814', 0, 3, 0, 0, '将计就计', '回来就好', '15920421522', '', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '6800.00', '0.00', '0.00', '0.00', 0, '0.00', '6800.00', '6800.00', 1468204726, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(411, '201607111115386881', 0, 0, 0, 0, '回到家大家', '呵呵呵', '13520239624', '', 'shentong', '申通物流', NULL, '', '', '', '', '110.00', '0.00', '0.00', '0.00', 0, '0.00', '110.00', '110.00', 1468206938, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(412, '201607111255391722', 0, 0, 0, 0, '社会青年伞', '得到的', '13744444444', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '69.00', '0.00', '0.00', '0.00', 0, '0.00', '69.00', '69.00', 1468212939, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(413, '201607111341194728', 0, 0, 0, 1, '李美美', '美女街', '13569870495', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.01', 1468215679, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(414, '201607111805285204', 0, 0, 0, 0, '汪帅锞', '123号', '15517375857', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '69.00', '0.00', '0.00', '0.00', 0, '0.00', '69.00', '69.00', 1468231528, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(415, '201607111807325815', 0, 0, 0, 1, '汪帅锞', '123号', '15517375857', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.01', 1468231652, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(416, '201607120056358374', 0, 3, 0, 0, '111', 'qqq', '18817632631', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '216.00', '0.00', '0.00', '0.00', 0, '0.00', '216.00', '216.00', 1468256195, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(417, '201607120058233677', 0, 3, 0, 0, '111', 'qqq', '18817632631', '', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '4000.00', '0.00', '0.00', '0.00', 0, '0.00', '4000.00', '4000.00', 1468256303, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(418, '201607121046554349', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, '', '', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.01', 1468291615, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(419, '201607121345025932', 0, 0, 0, 0, '楼下的人', '哦无咯无聊', '18569856987', '', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '110.00', '0.00', '0.00', '0.00', 0, '0.00', '110.00', '110.00', 1468302302, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(420, '201607121400143483', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, '', '', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.01', 1468303214, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(421, '201607121401284832', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, '', '', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.01', 1468303288, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(422, '201607121401492345', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, '', '', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.01', 1468303309, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(423, '201607121413267158', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, 'alipay', 'app支付宝', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.01', 1468304006, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(424, '201607121421536412', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, '', '', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.01', 1468304513, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(425, '201607121423287878', 0, 0, 0, 1, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, 'alipay', 'app支付宝', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.01', 1468304608, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(426, '201607121424217379', 0, 3, 0, 0, '侯超', '花湖经济开发区', '15728743912', '', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '0.02', '0.00', '0.00', '0.00', 0, '0.00', '0.02', '0.02', 1468304661, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(427, '201607121425308629', 0, 0, 0, 0, '侯超', '花湖经济开发区', '15728743912', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '138.00', '0.00', '0.00', '0.00', 0, '0.00', '138.00', '138.00', 1468304730, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(428, '201607121442105506', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, '', '', '', '', '3917.06', '0.00', '0.00', '0.00', 0, '0.00', '3917.06', '3917.06', 1468305730, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(429, '201607121450598405', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, '', '', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.01', 1468306259, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(430, '201607121459477957', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, '', '', '', '', '0.02', '0.00', '0.00', '0.00', 0, '0.00', '0.02', '0.02', 1468306787, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(431, '201607121509517516', 0, 0, 0, 0, '赵世鑫', '鼓楼区', '18378396005', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '69.00', '0.00', '0.00', '0.00', 0, '0.00', '69.00', '69.00', 1468307391, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(432, '201607121557037654', 0, 0, 0, 0, '杰哥哥', '哈哈', '13867739081', '', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '69.00', '0.00', '0.00', '0.00', 0, '0.00', '69.00', '69.00', 1468310223, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(433, '201607122226517366', 0, 0, 0, 0, '张', '我在这里', '18696186876', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '110.00', '0.00', '0.00', '0.00', 0, '0.00', '110.00', '110.00', 1468333611, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(434, '201607122319352296', 0, 0, 0, 0, '侯超', '花湖经济开发区', '15728743912', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '990.00', '0.00', '0.00', '0.00', 0, '0.00', '990.00', '990.00', 1468336775, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(435, '201607122349177591', 0, 0, 0, 0, '张', '我在这里', '18696186876', '', 'shunfeng', '顺丰物流', NULL, '', '', '', '', '2100.00', '12.00', '0.00', '0.00', 0, '0.00', '2112.00', '2112.00', 1468338557, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(436, '201607130950404035', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, 'alipayMobile', '手机网站支付宝', '', '', '98.00', '0.00', '0.00', '0.00', 0, '0.00', '98.00', '98.00', 1468374640, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(437, '201607131107216131', 0, 3, 0, 0, '网速', '合肥', '13865787655', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '59.00', '0.00', '0.00', '0.00', 0, '0.00', '59.00', '59.00', 1468379241, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(438, '201607131300361281', 0, 3, 0, 0, '科技馆', 'high', '13587458521', '', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '69.00', '0.00', '0.00', '0.00', 0, '0.00', '69.00', '69.00', 1468386036, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(439, '201607131327108310', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '1959.02', '0.00', '0.00', '0.00', 0, '0.00', '1959.02', '1959.02', 1468387630, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(440, '201607131454259080', 0, 3, 0, 0, '网速', '合肥', '13865787655', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '3499.00', '0.00', '0.00', '0.00', 0, '0.00', '3499.00', '3499.00', 1468392865, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(441, '201607131543271411', 0, 3, 0, 0, '网速', '合肥', '13865787655', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '69.00', '0.00', '0.00', '0.00', 0, '0.00', '69.00', '69.00', 1468395807, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(442, '201607131623489196', 0, 0, 0, 0, '侯超', '花湖经济开发区', '15728743912', '', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '138.00', '0.00', '0.00', '0.00', 0, '0.00', '138.00', '138.00', 1468398228, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(443, '201607132215056903', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, '', '', '', '', '979.02', '0.00', '0.00', '0.00', 0, '0.00', '979.02', '979.02', 1468419305, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(444, '201607132217334680', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, '', '', '', '', '10778.04', '0.00', '0.00', '0.00', 0, '0.00', '10778.04', '10778.04', 1468419453, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(445, '201607141011504020', 0, 0, 0, 0, '看看', '看看', '13848007649', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '3400.00', '0.00', '0.00', '0.00', 0, '0.00', '3400.00', '3400.00', 1468462310, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(446, '201607141116481718', 0, 0, 0, 0, '张先生', '啊啊啊啊啊', '13336363636', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '2100.00', '0.00', '0.00', '0.00', 0, '0.00', '2100.00', '2100.00', 1468466208, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(447, '201607141439212082', 0, 0, 0, 0, '林生', '1651', '15800000000', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '110.00', '0.00', '0.00', '0.00', 0, '0.00', '110.00', '110.00', 1468478361, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(448, '201607142031294291', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, '', '', '', '', '15091.03', '0.00', '0.00', '0.00', 0, '0.00', '15091.03', '15091.03', 1468499489, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(449, '201607151254404058', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, '', '', '', '', '3429.02', '0.00', '100.00', '0.00', 18828, '1882.80', '1446.22', '3429.02', 1468558480, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(450, '201607151513347679', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, '', '', '', '', '6956.04', '0.00', '0.00', '0.00', 0, '0.00', '6956.04', '6956.04', 1468566814, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(451, '201607151550112739', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, '', '', '', '', '3331.02', '0.00', '0.00', '0.00', 0, '0.00', '3331.02', '3331.02', 1468569011, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(452, '201607151851232572', 0, 0, 0, 0, '测试付款', '你爸不是', '13555555555', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.01', 1468579883, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(453, '201607152212402753', 0, 0, 0, 0, 'GGT', 'HHS', '13554544534', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '279.60', '0.00', '0.00', '0.00', 0, '0.00', '279.60', '279.60', 1468591960, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(454, '201607152225493331', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, '', '', '', '', '979.02', '0.00', '0.00', '0.00', 0, '0.00', '979.02', '979.02', 1468592749, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(455, '201607161029284772', 0, 0, 0, 0, '张三', '行咯', '15522223333', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '3400.00', '0.00', '0.00', '0.00', 0, '0.00', '3400.00', '3400.00', 1468636168, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(456, '201607161046124334', 0, 0, 0, 0, '王鑫', '服装城', '15356666644', '', 'shunfeng', '顺丰物流', NULL, 'cod', '到货付款', '', '', '179.00', '14.00', '0.00', '0.00', 0, '0.00', '193.00', '193.00', 1468637172, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(457, '201607161047508518', 0, 0, 0, 0, '王鑫', '服装城', '15356666644', '', 'shunfeng', '顺丰物流', NULL, 'cod', '到货付款', '', '', '200.00', '16.00', '0.00', '0.00', 0, '0.00', '216.00', '216.00', 1468637270, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(458, '201607161049591305', 0, 0, 0, 1, '徐庶', '金童路81', '13708319000', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.01', 1468637399, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(459, '201607161050406525', 0, 0, 0, 0, '吃的好', '多喝点呵呵', '13637762495', '', 'shentong', '申通物流', NULL, '', '', '', '', '299.00', '0.00', '0.00', '0.00', 0, '0.00', '299.00', '299.00', 1468637440, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(460, '201607161130451439', 0, 0, 0, 0, '回民', '164646', '13759933456', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '330.00', '0.00', '0.00', '0.00', 0, '0.00', '330.00', '330.00', 1468639845, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(461, '201607161314565500', 0, 0, 0, 0, '王鑫', '服装城', '15356666644', '', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '598.00', '0.00', '0.00', '0.00', 0, '0.00', '598.00', '598.00', 1468646096, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(462, '201607161613563097', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, '', '', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.01', 1468656836, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(463, '201607161710362583', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, '', '', '', '', '979.02', '0.00', '0.00', '0.00', 0, '0.00', '979.02', '979.02', 1468660236, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(464, '201607161858155301', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shunfeng', '顺丰物流', NULL, '', '', '', '', '1556.25', '14.00', '0.00', '0.00', 0, '0.00', '1570.25', '1570.25', 1468666695, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(465, '201607161905493455', 0, 0, 0, 0, '李建伟', '111', '15858671025', '', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '2000.00', '0.00', '0.00', '0.00', 0, '0.00', '2000.00', '2000.00', 1468667149, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(466, '201607161943433928', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, '', '', '', '', '3331.02', '0.00', '0.00', '0.00', 0, '0.00', '3331.02', '3331.02', 1468669423, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(467, '201607162137189487', 0, 0, 0, 0, '黄先生', '通州区旗舰凯旋小区', '15889560679', 'text@tpshop.com', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '5750.64', '0.00', '0.00', '0.00', 0, '0.00', '5750.64', '5750.64', 1468676238, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(468, '201607171457157741', 0, 0, 0, 0, 'haha', 'hahahajshw', '13111111980', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '3400.00', '0.00', '0.00', '0.00', 0, '0.00', '3400.00', '3400.00', 1468738635, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(469, '201607171838581253', 0, 0, 0, 0, '尹', '天安门广场', '15011903663', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '3400.00', '0.00', '0.00', '0.00', 0, '0.00', '3400.00', '3400.00', 1468751938, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(470, '201607171921505600', 0, 0, 0, 0, '哦哦哦', '因牛米', '15936987563', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '69.00', '0.00', '0.00', '0.00', 0, '0.00', '69.00', '69.00', 1468754510, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(471, '201607180047047085', 0, 3, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, '', '', '', '', '979.02', '0.00', '0.00', '0.00', 0, '0.00', '979.02', '979.02', 1468774024, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(472, '201607180335316743', 0, 0, 0, 0, '哈哈哈', '吃哦不后悔', '18909897789', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '110.00', '0.00', '0.00', '0.00', 0, '0.00', '110.00', '110.00', 1468784131, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(473, '201607180932264730', 0, 0, 0, 0, '北极光', '测试', '18888888888', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.01', 1468805546, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(474, '201607181449482031', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, '', '', '', '', '4311.02', '0.00', '0.00', '0.00', 0, '0.00', '4311.02', '4311.02', 1468824588, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(475, '201607181512011525', 0, 0, 0, 0, '大家都', '好多好多话', '17667663777', '', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '138.00', '0.00', '0.00', '0.00', 0, '0.00', '138.00', '138.00', 1468825921, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(476, '201607181532129952', 0, 3, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, '', '', '', '', '2057.02', '0.00', '0.00', '0.00', 0, '0.00', '2057.02', '2057.02', 1468827132, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(477, '201607181716576441', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, '', '', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.01', 1468833417, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(478, '201607181745422490', 0, 3, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, '', '', '', '', '2450.00', '0.00', '0.00', '0.00', 0, '0.00', '2450.00', '2450.00', 1468835142, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(479, '201607181814374461', 0, 3, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, '', '', '', '', '2351.02', '0.00', '0.00', '0.00', 0, '0.00', '2351.02', '2351.02', 1468836877, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(480, '201607182104566932', 0, 0, 0, 0, '曾曾', '宝安区', '13974042347', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '3400.00', '0.00', '0.00', '0.00', 0, '0.00', '3400.00', '3400.00', 1468847096, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(481, '201607182247337605', 0, 3, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, '', '', '', '', '3331.02', '0.00', '0.00', '0.00', 0, '0.00', '3331.02', '3331.02', 1468853253, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(482, '201607182248226670', 0, 3, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, '', '', '', '', '979.02', '0.00', '0.00', '0.00', 0, '0.00', '979.02', '979.02', 1468853302, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(483, '201607190927161365', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, '', '', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.01', 1468891636, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(484, '201607191151139322', 0, 3, 0, 0, '张', '爱的是打发第三方', '15011805878', '', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '69.00', '0.00', '0.00', '0.00', 100, '10.00', '59.00', '69.00', 1468900273, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(485, '201607191226128353', 0, 0, 0, 0, '厕所', '安排', '13589525400', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '1580.00', '0.00', '0.00', '0.00', 0, '0.00', '1580.00', '1580.00', 1468902372, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(486, '201607191239556055', 0, 0, 0, 0, '姓名', '地址', '13245678910', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '0.02', '0.00', '0.00', '0.00', 0, '0.00', '0.02', '0.02', 1468903195, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(487, '201607191446004259', 0, 0, 0, 0, '张小刚', '将健健康康快', '13466359968', '', 'shentong', '申通物流', NULL, '', '', '', '', '5100.00', '0.00', '0.00', '0.00', 0, '0.00', '5100.00', '5100.00', 1468910760, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(488, '201607191712191540', 0, 0, 0, 0, '刘勇', '地方', '15122225555', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '69.00', '0.00', '0.00', '0.00', 0, '0.00', '69.00', '69.00', 1468919539, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(489, '201607191747552103', 0, 0, 0, 0, '王某某', '河北省石家庄市裕华区东苑街道25号', '18231048102', '', 'shunfeng', '顺丰物流', NULL, 'weixin', '微信支付', '', '', '107.80', '14.00', '0.00', '0.00', 0, '0.00', '121.80', '121.80', 1468921675, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(490, '201607201138011989', 0, 0, 0, 0, '段', '哈哈', '15575920341', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '哈哈', '2699.00', '0.00', '0.00', '0.00', 0, '0.00', '2699.00', '2699.00', 1468985881, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(491, '201607201202133480', 0, 0, 0, 0, '测试', '春风骀荡', '13000000001', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '3400.00', '0.00', '0.00', '0.00', 0, '0.00', '3400.00', '3400.00', 1468987333, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(492, '201607201347433291', 0, 0, 0, 0, '刘希罕', '黄金季节', '15373883332', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '3469.00', '0.00', '0.00', '0.00', 0, '0.00', '3469.00', '3469.00', 1468993663, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(493, '201607201619146209', 0, 0, 0, 0, '赵世鑫', '鼓楼区', '18378396005', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '118.00', '0.00', '0.00', '0.00', 0, '0.00', '118.00', '118.00', 1469002754, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(494, '201607201747307952', 0, 0, 0, 0, '舒慎林', '温泉公园路28号', '13682862220', '', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '4081.90', '0.00', '0.00', '0.00', 0, '0.00', '4081.90', '4081.90', 1469008050, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(495, '201607201846093817', 0, 0, 0, 0, '哈哈哈哈哈', '哈哈哈哈', '18655522222', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '3400.00', '0.00', '0.00', '0.00', 0, '0.00', '3400.00', '3400.00', 1469011569, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(496, '201607211031018510', 0, 0, 0, 0, '哦哦', '709400', '18833253743', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '0.04', '0.00', '0.00', '0.00', 0, '0.00', '0.04', '0.04', 1469068261, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(497, '201607211120244889', 0, 3, 0, 0, '刘锦洋', '救济金', '18888884645', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.01', 1469071224, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(498, '201607211142033500', 0, 0, 0, 0, 'Fhhfy', 'Vhncdv', '13696439328', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '69.00', '0.00', '0.00', '0.00', 0, '0.00', '69.00', '69.00', 1469072523, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(499, '201607211148424427', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, '', '', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.01', 1469072922, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(500, '201607211259061006', 0, 0, 0, 1, '东哥', '我是你的谁', '15365236888', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.01', 1469077146, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(501, '201607211623261358', 0, 0, 0, 0, '测试', '12', '18888888888', '', 'shunfeng', '顺丰物流', NULL, 'weixin', '微信支付', '', '', '3400.00', '12.00', '0.00', '0.00', 0, '0.00', '3412.00', '3412.00', 1469089406, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(502, '201607211742295694', 0, 0, 0, 0, '家里', '啦啦啦', '18551855800', '', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '69.00', '0.00', '0.00', '0.00', 0, '0.00', '69.00', '69.00', 1469094149, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(503, '201607221611509037', 0, 0, 0, 0, '马晨', '弄弄看', '18631188785', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '138.00', '0.00', '0.00', '0.00', 0, '0.00', '138.00', '138.00', 1469175110, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(504, '201607221934406709', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, '', '', '', '', '120.01', '0.00', '0.00', '0.00', 0, '0.00', '120.01', '120.01', 1469187280, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(505, '201607221951198763', 0, 0, 0, 0, '哈哈哈', '记录了', '13203101492', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '3997.00', '0.00', '0.00', '0.00', 0, '0.00', '3997.00', '3997.00', 1469188279, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(506, '201607221955134324', 0, 0, 0, 0, '王某某', '河北省石家庄市裕华区东苑街道25号', '18231048102', '', 'shentong', '申通物流', NULL, 'unionpay', '银联在线支付', '', '', '3917.06', '0.00', '0.00', '0.00', 0, '0.00', '3917.06', '3917.06', 1469188513, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(507, '201607230909009105', 0, 0, 0, 0, '123', '123', '15252632716', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '3600.00', '0.00', '0.00', '0.00', 0, '0.00', '3600.00', '3600.00', 1469236140, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(508, '201607231529153831', 0, 0, 0, 0, '王文', '成都', '13708192048', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '3400.00', '0.00', '0.00', '0.00', 0, '0.00', '3400.00', '3400.00', 1469258955, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(509, '201607241530069362', 0, 0, 0, 0, '默默', '红', '13137562751', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '4858.00', '0.00', '0.00', '0.00', 0, '0.00', '4858.00', '4858.00', 1469345406, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(510, '201607241956444701', 0, 0, 0, 0, '看看', '卡托模具体的我也', '18876788112', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '3499.00', '0.00', '0.00', '0.00', 0, '0.00', '3499.00', '3499.00', 1469361404, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(511, '201607251347478413', 0, 0, 0, 0, '李美美', '美女街', '13569870495', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '9798.00', '0.00', '0.00', '0.00', 0, '0.00', '9798.00', '9798.00', 1469425667, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(512, '201607251405137322', 0, 0, 0, 0, '吴亚朋', '解放大道', '15096633245', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '69.01', '0.00', '0.00', '0.00', 0, '0.00', '69.01', '69.01', 1469426713, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(513, '201607251638359073', 0, 3, 0, 0, '小小强', '宣武门', '13966699922', '', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '108.00', '0.00', '0.00', '0.00', 0, '0.00', '108.00', '108.00', 1469435915, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(514, '201607251643103770', 0, 0, 0, 0, '小小强', '宣武门', '13966699922', '', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '69.01', '0.00', '0.00', '0.00', 0, '0.00', '69.01', '69.01', 1469436190, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(515, '201607252049308278', 0, 0, 0, 0, '哈哈', '哈哈', '18091532632', '', 'shentong', '申通物流', NULL, '', '', '', '', '3400.00', '0.00', '0.00', '0.00', 0, '0.00', '3400.00', '3400.00', 1469450970, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(516, '201607252107073621', 0, 3, 0, 0, '王某某', '河北省石家庄市裕华区东苑街道25号', '18231048102', '', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '6203.40', '0.00', '0.00', '0.00', 0, '0.00', '6203.40', '6203.40', 1469452027, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(517, '201607260955458127', 0, 0, 0, 0, '东哥', '我是你的谁', '15365236888', '', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.01', 1469498145, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(518, '201607262104213442', 0, 0, 0, 0, '介绍', '鸡鸡行吗2号', '13812345678', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '3400.00', '0.00', '0.00', '0.00', 0, '0.00', '3400.00', '3400.00', 1469538261, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(519, '201607262233147337', 0, 0, 0, 0, '李峰', '京华豪园206', '18637173160', '', 'shentong', '申通物流', NULL, '', '', '', '', '289.00', '0.00', '0.00', '0.00', 0, '0.00', '289.00', '289.00', 1469543594, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(520, '201607262302279584', 0, 0, 0, 0, '侯超', '花湖经济开发区', '15728743912', '', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '4483.00', '0.00', '0.00', '0.00', 0, '0.00', '4483.00', '4483.00', 1469545347, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(521, '201607270931154605', 0, 0, 0, 0, 'hhhe', '急急急', '17528086809', '', 'shunfeng', '顺丰物流', NULL, 'cod', '到货付款', '', '', '3400.00', '12.00', '0.00', '0.00', 0, '0.00', '3412.00', '3412.00', 1469583075, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(522, '201607271022289073', 0, 3, 0, 0, '111', 'qqq', '18817632631', '', 'shunfeng', '顺丰物流', NULL, 'cod', '到货付款', '', '', '108.00', '12.00', '0.00', '0.00', 0, '0.00', '120.00', '120.00', 1469586148, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `ruike_mall_order` (`order_id`, `order_sn`, `member_id`, `order_status`, `shipping_status`, `pay_status`, `consignee`, `address`, `mobile`, `email`, `shipping_code`, `shipping_name`, `invoice_no`, `pay_code`, `pay_name`, `transaction_id`, `invoice_title`, `goods_price`, `shipping_price`, `user_money`, `coupon_price`, `integral`, `integral_money`, `order_amount`, `total_amount`, `add_time`, `shipping_time`, `confirm_time`, `pay_time`, `order_prom_id`, `order_prom_amount`, `discount`, `user_note`, `admin_note`, `parent_sn`, `is_distribut`, `date_of_application`, `return_or_exchange`, `return_description`, `return_img`, `processing_remarks`, `coordinate`, `discount_type`, `pay_cnt`, `mark`) VALUES
(523, '201607271050554317', 0, 0, 0, 0, '网速', '合肥', '13865787655', '', 'shentong', '申通物流', NULL, '', '', '', '', '4980.00', '0.00', '0.00', '0.00', 0, '0.00', '4980.00', '4980.00', 1469587855, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(524, '201607271107029384', 0, 0, 0, 0, '111', 'qqq', '18817632631', '', 'shentong', '申通物流', NULL, '', '', '', '', '84.90', '0.00', '0.00', '0.00', 0, '0.00', '84.90', '84.90', 1469588822, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(525, '201607271158295168', 0, 3, 0, 0, '222', '123', '18923652536', '', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '3400.00', '0.00', '0.00', '0.00', 0, '0.00', '3400.00', '3400.00', 1469591909, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(526, '201607271510106034', 0, 0, 0, 0, 'nnn', '', '18566366569', '', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '110.00', '0.00', '0.00', '0.00', 0, '0.00', '110.00', '110.00', 1469603410, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(527, '201607271920089208', 0, 0, 0, 0, '销售经理', '刻苦', '13253337122', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '110.00', '0.00', '0.00', '0.00', 0, '0.00', '110.00', '110.00', 1469618408, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(528, '201607281251529577', 0, 0, 0, 0, '豆', '上海', '13262805800', '', 'shunfeng', '顺丰物流', NULL, 'weixin', '微信支付', '', '', '3400.00', '12.00', '0.00', '0.00', 0, '0.00', '3412.00', '3412.00', 1469681512, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(529, '201607281420075734', 0, 0, 0, 0, '金', '金', '15222222212', '', 'shentong', '申通物流', NULL, '', '', '', '', '820.00', '0.00', '0.00', '0.00', 0, '0.00', '820.00', '820.00', 1469686807, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(530, '201607281431358100', 0, 0, 0, 0, '何先生', '178号', '13838383388', '', 'shentong', '申通物流', NULL, '', '', '', '', '1580.00', '0.00', '0.00', '0.00', 0, '0.00', '1580.00', '1580.00', 1469687495, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(531, '201607281554184318', 0, 0, 0, 0, 'We', 'Sd', '13001541516', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '59.00', '0.00', '0.00', '0.00', 0, '0.00', '59.00', '59.00', 1469692458, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(532, '201607281557569222', 0, 0, 0, 1, 'We', 'Sd', '13001541516', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.01', 1469692676, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(533, '201607281558515714', 0, 0, 0, 0, 'We', 'Sd', '13001541516', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.01', 1469692731, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(534, '201607282126304823', 0, 0, 0, 0, '张三丰', '山顶洞', '13838384384', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '4858.01', '0.00', '0.00', '0.00', 0, '0.00', '4858.01', '4858.01', 1469712390, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(535, '201607282206346974', 0, 0, 0, 0, 'cs', '我们的生活', '13100000000', '', 'shentong', '申通物流', NULL, '', '', '', '', '3400.00', '0.00', '0.00', '0.00', 0, '0.00', '3400.00', '3400.00', 1469714794, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(536, '201607290822337346', 0, 0, 0, 0, 'uuui', '酒量的时候我就去', '15793753849', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '个人', '1999.00', '0.00', '0.00', '0.00', 0, '0.00', '1999.00', '1999.00', 1469751753, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(537, '201607291006514870', 0, 0, 0, 0, '就看你', '264', '18600586963', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '50.00', '0.00', '0.00', '0.00', 0, '0.00', '50.00', '50.00', 1469758011, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(538, '201607291023121049', 0, 0, 0, 0, '呵呵', '', '18698023556', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '69.00', '0.00', '0.00', '0.00', 0, '0.00', '69.00', '69.00', 1469758992, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(539, '201607291133133701', 0, 0, 0, 0, '刘锦洋', '救济金', '18888884645', '', 'shunfeng', '顺丰物流', NULL, 'weixin', '微信支付', '', '', '50.00', '12.00', '0.00', '0.00', 0, '0.00', '62.00', '62.00', 1469763193, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(540, '201607291146589851', 0, 0, 0, 0, '苏乐', '照顾手机膜搜了搜个', '13258965436', '', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '2000.00', '0.00', '0.00', '0.00', 0, '0.00', '2000.00', '2000.00', 1469764018, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(541, '201607291148103195', 0, 0, 0, 0, '侯8米他', '好咯婆婆', '13243688576', '', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.01', 1469764090, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(542, '201607301216571946', 0, 0, 0, 0, '苏乐', '照顾手机膜搜了搜个', '13258965436', '', 'shentong', '申通物流', NULL, '', '', '', '', '1698.00', '0.00', '0.00', '0.00', 0, '0.00', '1698.00', '1698.00', 1469852217, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(543, '201607301217381044', 0, 3, 0, 0, '呵呵', '', '18698023556', '', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '6000.00', '0.00', '0.00', '0.00', 0, '0.00', '6000.00', '6000.00', 1469852258, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(544, '201607301534135132', 0, 0, 0, 0, '11111', '狗狗名哦', '15087632916', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '2000.00', '0.00', '0.00', '0.00', 0, '0.00', '2000.00', '2000.00', 1469864053, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(545, '201607310120599609', 0, 0, 0, 0, '姓名2', '详细地址', '18676507222', '', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '4110.00', '0.00', '0.00', '0.00', 0, '0.00', '4110.00', '4110.00', 1469899259, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(546, '201607312104529671', 0, 3, 0, 0, '看看', '看看', '15875486253', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '4858.00', '0.00', '0.00', '0.00', 0, '0.00', '4858.00', '4858.00', 1469970292, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(547, '201608011131124903', 0, 0, 0, 0, '我', '是', '13656204222', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '0.02', '0.00', '0.00', '0.00', 0, '0.00', '0.02', '0.02', 1470022272, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(548, '201608011644176035', 0, 0, 0, 1, '古老啦', '咯模样', '13589067279', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.01', 1470041057, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(549, '201608011847592543', 0, 0, 0, 0, '小易', '沙贝大街', '13082531619', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '110.00', '0.00', '0.00', '0.00', 0, '0.00', '110.00', '110.00', 1470048479, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(550, '201608021541088322', 0, 0, 0, 0, '罗', '嗯', '15881642531', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '50.00', '0.00', '0.00', '0.00', 0, '0.00', '50.00', '50.00', 1470123668, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(551, '201608021553452407', 0, 0, 0, 0, '哈哈哈', '哈哈哈哈', '17773119888', '', 'shentong', '申通物流', NULL, '', '', '', '', '69.00', '0.00', '0.00', '0.00', 0, '0.00', '69.00', '69.00', 1470124425, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(552, '201608021741287189', 0, 0, 0, 0, '啦啦啦', '啦啦啦', '13123456789', '', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '2934.00', '0.00', '0.00', '0.00', 0, '0.00', '2934.00', '2934.00', 1470130888, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(553, '201608031604569358', 0, 0, 0, 0, '啦啦啦', '啦啦啦', '13123456789', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '110.00', '0.00', '0.00', '0.00', 0, '0.00', '110.00', '110.00', 1470211496, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(554, '201608031637056182', 0, 3, 0, 0, '看见了', '吧', '18432222222', '', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '3400.00', '0.00', '0.00', '0.00', 0, '0.00', '3400.00', '3400.00', 1470213425, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(555, '201608031732316639', 0, 0, 0, 0, '啦啦啦', '啦啦啦', '13123456789', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '110.00', '0.00', '0.00', '0.00', 0, '0.00', '110.00', '110.00', 1470216751, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(556, '201608031744351752', 0, 0, 0, 0, '啦啦啦', '啦啦啦', '13123456789', '', 'shentong', '申通物流', NULL, '', '', '', '', '3400.00', '0.00', '0.00', '0.00', 0, '0.00', '3400.00', '3400.00', 1470217475, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(557, '201608032211389169', 0, 0, 0, 0, 'dd', 'dd', '15696434348', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '2000.00', '0.00', '0.00', '0.00', 0, '0.00', '2000.00', '2000.00', 1470233498, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(558, '201608041256043100', 0, 0, 0, 0, 'wwe', '13000000000', '13000000000', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '110.00', '0.00', '0.00', '0.00', 0, '0.00', '110.00', '110.00', 1470286564, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(559, '201608041540103874', 0, 0, 0, 0, '王某某', '河北省石家庄市裕华区东苑街道25号', '18231048102', '', 'shentong', '申通物流', NULL, 'alipayMobile', '手机网站支付宝', '', '', '28331.80', '0.00', '0.00', '0.00', 0, '0.00', '28331.80', '28331.80', 1470296410, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(560, '201608041553573497', 0, 3, 0, 0, '测试', 'ion', '13811111111', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '1580.00', '0.00', '0.00', '0.00', 0, '0.00', '1580.00', '1580.00', 1470297237, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(561, '201608051007263644', 0, 0, 0, 0, '测试', '测试', '13834374665', '', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '2110.00', '0.00', '0.00', '0.00', 0, '0.00', '2110.00', '2110.00', 1470362846, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(562, '201608051016195759', 0, 0, 0, 0, '哈哈', '公共', '18612462777', '', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '110.00', '0.00', '0.00', '0.00', 0, '0.00', '110.00', '110.00', 1470363379, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(563, '201608051019078725', 0, 0, 0, 0, '测试', '测试', '13834374665', '', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '110.00', '0.00', '0.00', '0.00', 0, '0.00', '110.00', '110.00', 1470363547, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(564, '201608051351289324', 0, 0, 0, 0, '路补', '局座她', '13552558866', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '110.00', '0.00', '0.00', '0.00', 0, '0.00', '110.00', '110.00', 1470376288, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(565, '201608051425098615', 0, 3, 0, 0, '恩', '嗯嗯', '15870988866', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '110.00', '0.00', '0.00', '0.00', 0, '0.00', '110.00', '110.00', 1470378309, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(566, '201608051600292737', 0, 0, 0, 0, '不会', '咯佛祖 too', '18513866269', '', 'shentong', '申通物流', NULL, '', '', '', '', '220.00', '0.00', '0.00', '0.00', 0, '0.00', '220.00', '220.00', 1470384029, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(567, '201608051722107179', 0, 0, 0, 0, '不会', '咯佛祖 too', '18513866269', '', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '220.00', '0.00', '0.00', '0.00', 0, '0.00', '220.00', '220.00', 1470388930, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(568, '201608061417536620', 0, 3, 0, 0, 'micheal', '123', '18064793383', '', 'shentong', '申通物流', NULL, '', '', '', '', '169.80', '0.00', '0.00', '0.00', 0, '0.00', '169.80', '169.80', 1470464273, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(569, '201608061613053761', 0, 0, 0, 0, '。。', '习惯了', '13113111136', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '69.00', '0.00', '0.00', '0.00', 0, '0.00', '69.00', '69.00', 1470471185, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(570, '201608061756004007', 0, 3, 0, 0, '好扭扭捏捏', '白白嫩嫩', '15812347894', '', 'shunfeng', '顺丰物流', NULL, 'cod', '到货付款', '', '', '6000.00', '12.00', '0.00', '0.00', 0, '0.00', '6012.00', '6012.00', 1470477360, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(571, '201608080934063952', 0, 0, 0, 0, '不会', '咯佛祖 too', '18513866269', '', 'shentong', '申通物流', NULL, '', '', '', '', '2000.00', '0.00', '0.00', '0.00', 0, '0.00', '2000.00', '2000.00', 1470620046, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(572, '201608081752097211', 0, 0, 0, 0, '规划环境', '不仅积极斤斤计较湖', '13422142616', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '110.00', '0.00', '0.00', '0.00', 0, '0.00', '110.00', '110.00', 1470649929, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(573, '201608081755538756', 0, 0, 0, 0, '规划环境', '不仅积极斤斤计较湖', '13422142616', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '289.00', '0.00', '0.00', '0.00', 0, '0.00', '289.00', '289.00', 1470650153, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(574, '201608081756531123', 0, 0, 0, 1, '规划环境', '不仅积极斤斤计较湖', '13422142616', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.01', 1470650213, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(575, '201608081822351946', 0, 0, 0, 0, '规划环境', '不仅积极斤斤计较湖', '13422142616', '', 'shentong', '申通物流', NULL, '', '', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.01', 1470651755, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(576, '201608081830068432', 0, 0, 0, 1, '规划环境', '不仅积极斤斤计较湖', '13422142616', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '0.02', '0.00', '0.00', '0.00', 0, '0.00', '0.02', '0.02', 1470652206, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(577, '201608082206101993', 0, 0, 0, 0, '阮若水', '河东区政府', '15888888888', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '69.00', '0.00', '0.00', '0.00', 0, '0.00', '69.00', '69.00', 1470665170, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(578, '201608090942163004', 0, 0, 0, 0, '郑先生', '研发园', '18257347412', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '3997.00', '0.00', '0.00', '0.00', 0, '0.00', '3997.00', '3997.00', 1470706936, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(579, '201608091145516758', 0, 0, 0, 0, '估计', '过来', '18959277304', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '69.00', '0.00', '0.00', '0.00', 0, '0.00', '69.00', '69.00', 1470714351, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(580, '201608091448485215', 0, 0, 0, 0, '王晓东', '双京剧608号', '18863334520', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '110.00', '0.00', '0.00', '0.00', 0, '0.00', '110.00', '110.00', 1470725328, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(581, '201608091453473342', 0, 3, 0, 0, '王晓东', '双京剧608号', '18863334520', '', 'shunfeng', '顺丰物流', NULL, 'cod', '到货付款', '', '', '289.00', '12.00', '0.00', '0.00', 0, '0.00', '301.00', '301.00', 1470725627, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(582, '201608091456239951', 0, 0, 0, 0, '王晓东', '双京剧608号', '18863334520', '', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '108.00', '0.00', '0.00', '0.00', 0, '0.00', '108.00', '108.00', 1470725783, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(583, '201608091623304577', 0, 0, 0, 1, '规划环境', '不仅积极斤斤计较湖', '13422142616', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.01', 1470731010, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(584, '201608091626189593', 0, 0, 0, 0, '规划环境', '不仅积极斤斤计较湖', '13422142616', '', 'shentong', '申通物流', NULL, '', '', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.01', 1470731178, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(585, '201608091704238174', 0, 0, 0, 1, '房价将空间', 'j j k k', '13422142616', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.01', 1470733463, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(586, '201608091805293275', 0, 0, 0, 0, '规划环境', '不仅积极斤斤计较湖', '13422142616', '', 'shentong', '申通物流', NULL, '', '', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.01', 1470737129, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(587, '201608092029131906', 0, 3, 0, 0, '付先文', '改下', '18881926222', '', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '118.00', '0.00', '0.00', '0.00', 0, '0.00', '118.00', '118.00', 1470745753, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(588, '201608092230218886', 0, 0, 0, 0, '继续继续', '几下就开心', '13761477312', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '你的角度看', '84.90', '0.00', '0.00', '0.00', 0, '0.00', '84.90', '84.90', 1470753021, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(589, '201608100913395442', 0, 0, 0, 0, '不会', '咯佛祖 too', '18513866269', '', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '3400.00', '0.00', '0.00', '0.00', 0, '0.00', '3400.00', '3400.00', 1470791619, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(590, '201608101114059382', 0, 0, 0, 1, '阿巨', '万年场', '13668278660', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.01', 1470798845, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(591, '201608101244168753', 0, 3, 0, 0, '李磊', '青年路', '18976970372', '', 'shunfeng', '顺丰物流', NULL, 'weixin', '微信支付', '', '', '1580.00', '12.00', '0.00', '0.00', 0, '0.00', '1592.00', '1592.00', 1470804256, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(592, '201608101306098238', 0, 0, 0, 0, '测试', '公园路200000001号', '13611961863', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '110.00', '0.00', '0.00', '0.00', 0, '0.00', '110.00', '110.00', 1470805569, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(593, '201608101439458891', 0, 0, 0, 0, '何跃', '吧鲜花饼', '18523160096', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '对对对', '2000.00', '0.00', '0.00', '0.00', 0, '0.00', '2000.00', '2000.00', 1470811185, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(594, '201608101750029628', 0, 0, 0, 0, '12345', '她心里', '13438257635', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '6000.00', '0.00', '0.00', '0.00', 0, '0.00', '6000.00', '6000.00', 1470822602, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(595, '201608101835522786', 0, 0, 0, 0, '哈哈', '人民路', '15833996666', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.01', 1470825352, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(596, '201608101937136952', 0, 3, 0, 0, '啦啦啦', '啦啦爸爸', '13252222266', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '59.00', '0.00', '0.00', '0.00', 0, '0.00', '59.00', '59.00', 1470829033, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(597, '201608102021013951', 0, 0, 0, 0, 'test', '111号', '13486884249', '', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '8000.00', '0.00', '0.00', '0.00', 0, '0.00', '8000.00', '8000.00', 1470831661, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(598, '201608102208563594', 0, 3, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '1548.40', '0.00', '0.00', '0.00', 0, '0.00', '1548.40', '1548.40', 1470838136, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(599, '201608102210554797', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '979.02', '0.00', '0.00', '0.00', 0, '0.00', '979.02', '979.02', 1470838255, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(600, '201608102213514539', 0, 0, 0, 0, '监管', '行', '13333333333', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '84.90', '0.00', '0.00', '0.00', 0, '0.00', '84.90', '84.90', 1470838431, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(601, '201608111000013091', 0, 0, 0, 1, '规划环境', '不仅积极斤斤计较湖', '13422142616', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.01', 1470880801, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(602, '201608111134191462', 0, 0, 0, 0, '河湖', '那就纠结', '18611384636', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '3400.00', '0.00', '0.00', '0.00', 0, '0.00', '3400.00', '3400.00', 1470886459, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(603, '201608111439233182', 0, 0, 0, 0, '朱', '1122', '18017222563', '', 'shentong', '申通物流', NULL, '', '', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.01', 1470897563, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(604, '201608111633011422', 0, 0, 0, 0, '王斌', '你猜', '18556984637', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '2000.00', '0.00', '0.00', '0.00', 0, '0.00', '2000.00', '2000.00', 1470904381, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(605, '201608111652203654', 0, 0, 0, 0, '55555', '11111', '13222222121', '', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '3400.00', '0.00', '0.00', '0.00', 0, '0.00', '3400.00', '3400.00', 1470905540, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(606, '201608111712138000', 0, 3, 0, 0, '张三', '四川省成都市', '18008177265', '', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '2000.00', '0.00', '0.00', '0.00', 0, '0.00', '2000.00', '2000.00', 1470906733, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(607, '201608112256393917', 0, 0, 0, 0, '继续继续', '几下就开心', '13761477312', '', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.01', 1470927399, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(608, '201608121154006640', 0, 0, 0, 0, '啦啦啦', '啦啦爸爸', '13252222266', '', 'shentong', '申通物流', NULL, '', '', '', '', '1580.00', '0.00', '0.00', '0.00', 0, '0.00', '1580.00', '1580.00', 1470974040, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(609, '201608121328275240', 0, 0, 0, 0, '老褚', '55弄101', '18101818763', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.01', 1470979707, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(610, '201608121330084094', 0, 0, 0, 0, '啦啦啦', '啦啦爸爸', '13252222266', '', 'shentong', '申通物流', NULL, '', '', '', '', '3143.90', '0.00', '0.00', '0.00', 0, '0.00', '3143.90', '3143.90', 1470979808, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(611, '201608121444423941', 0, 0, 0, 0, '阿里l', '哦路吞没', '13211112222', '', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '50.00', '0.00', '0.00', '0.00', 0, '0.00', '50.00', '50.00', 1470984282, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(612, '201608121502595082', 0, 0, 0, 1, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, 'alipayMobile', '手机网站支付宝', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.01', 1470985379, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(613, '201608121505109438', 0, 0, 0, 0, '老家了', '啦咯啦啦啦巴拉拉', '13262686408', '', 'shentong', '申通物流', NULL, '', '', '', '', '1998.00', '0.00', '0.00', '0.00', 0, '0.00', '1998.00', '1998.00', 1470985510, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(614, '201608121758434572', 0, 0, 0, 0, 'eee', 'jjjj', '13752874002', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '110.00', '0.00', '0.00', '0.00', 0, '0.00', '110.00', '110.00', 1470995923, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(615, '201608121907159109', 0, 0, 0, 0, 'Eric', '机顶盒电话', '13801028993', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '4858.00', '0.00', '0.00', '0.00', 0, '0.00', '4858.00', '4858.00', 1471000035, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(616, '201608130823316072', 0, 0, 0, 0, '骨灰盒', '龙宝小区', '13333333333', '', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '1000.00', '0.00', '0.00', '0.00', 0, '0.00', '1000.00', '1000.00', 1471047811, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(617, '201608130925503135', 0, 0, 0, 0, '苏健柱', '啦咯啦咯啦咯', '13800138000', '', 'shunfeng', '顺丰物流', NULL, 'weixin', '微信支付', '', '', '110.00', '14.00', '0.00', '0.00', 0, '0.00', '124.00', '124.00', 1471051550, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(618, '201608131046495606', 0, 0, 0, 0, '赵蕾', '58号', '15339262388', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '3459.00', '0.00', '0.00', '0.00', 0, '0.00', '3459.00', '3459.00', 1471056409, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(619, '201608131053104049', 0, 0, 0, 0, '赵蕾', '58号', '15339262388', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '289.00', '0.00', '0.00', '0.00', 0, '0.00', '289.00', '289.00', 1471056790, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(620, '201608131709591281', 0, 0, 0, 0, '啊啊啊', '啊啊啊', '15111111111', '', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '1580.00', '0.00', '0.00', '0.00', 0, '0.00', '1580.00', '1580.00', 1471079399, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(621, '201608131917137083', 0, 0, 0, 0, '老褚', '55弄101', '18101818763', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '69.00', '0.00', '0.00', '0.00', 0, '0.00', '69.00', '69.00', 1471087033, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(622, '201608141050274023', 0, 3, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '57.82', '0.00', '0.00', '0.00', 0, '0.00', '57.82', '57.82', 1471143027, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(623, '201608141200312623', 0, 0, 0, 0, '啦啦啦', '啦啦爸爸', '13252222266', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '11317.00', '0.00', '0.00', '0.00', 0, '0.00', '11317.00', '11317.00', 1471147231, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(624, '201608151534246559', 0, 0, 0, 0, '1', '1', '13566666666', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '2000.00', '0.00', '0.00', '0.00', 0, '0.00', '2000.00', '2000.00', 1471246464, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(625, '201608160946485294', 0, 3, 0, 0, '黄先生', '通州区旗舰凯旋小区', '15889560679', 'text@tpshop.com', 'shentong', '申通物流', NULL, '', '', '', '', '3467.62', '0.00', '0.00', '0.00', 0, '0.00', '3467.62', '3467.62', 1471312008, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(626, '201608161013177344', 0, 3, 0, 0, '黄先生', '通州区旗舰凯旋小区', '15889560679', 'text@tpshop.com', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '270.48', '0.00', '0.00', '0.00', 0, '0.00', '270.48', '270.48', 1471313597, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(627, '201608161029503783', 0, 0, 0, 0, '胡', '就地解决小鸡鸡', '18664388206', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '1000.00', '0.00', '0.00', '0.00', 0, '0.00', '1000.00', '1000.00', 1471314590, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(628, '201608161615277147', 0, 0, 0, 0, '哈哈', '河南', '13333333333', '', 'shentong', '申通物流', NULL, '', '', '', '', '69.00', '0.00', '0.00', '0.00', 0, '0.00', '69.00', '69.00', 1471335327, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(629, '201608161616167840', 0, 3, 0, 0, '哎呦', '远大路', '18888888888', '', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '3400.00', '0.00', '0.00', '0.00', 0, '0.00', '3400.00', '3400.00', 1471335376, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(630, '201608161626073444', 0, 0, 0, 0, '哎呦', '远大路', '18888888888', '', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '4858.00', '0.00', '0.00', '0.00', 0, '0.00', '4858.00', '4858.00', 1471335967, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(631, '201608161627023755', 0, 0, 0, 0, '哎呦', '远大路', '18888888888', '', 'shentong', '申通物流', NULL, '', '', '', '', '69.00', '0.00', '0.00', '0.00', 0, '0.00', '69.00', '69.00', 1471336022, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(632, '201608161736582170', 0, 0, 0, 0, '家', '廵', '13525552555', '', 'shentong', '申通物流', NULL, '', '', '', '', '3219.00', '0.00', '0.00', '0.00', 0, '0.00', '3219.00', '3219.00', 1471340218, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(633, '201608161800311672', 0, 0, 0, 0, '不会', '咯佛祖 too', '18513866269', '', 'shentong', '申通物流', NULL, '', '', '', '', '69.00', '0.00', '0.00', '0.00', 0, '0.00', '69.00', '69.00', 1471341631, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(634, '201608162222146011', 0, 0, 0, 0, 'g j b b', 'vjggb', '13678198771', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '2000.00', '0.00', '0.00', '0.00', 0, '0.00', '2000.00', '2000.00', 1471357334, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(635, '201608171401444984', 0, 0, 0, 0, '噢噢噢', 'or你ing默默', '18775645455', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '3400.00', '0.00', '0.00', '0.00', 0, '0.00', '3400.00', '3400.00', 1471413704, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(636, '201608171506199684', 0, 3, 0, 0, '哈利路亚', '民族大道', '15275560311', '', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '110.00', '0.00', '0.00', '0.00', 0, '0.00', '110.00', '110.00', 1471417579, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(637, '201608171704586544', 0, 3, 0, 0, '啦啦啦', '啦啦啦', '13123456789', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '84.90', '0.00', '0.00', '0.00', 0, '0.00', '84.90', '84.90', 1471424698, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(638, '201608171748501130', 0, 0, 0, 0, '范艳月', '回来了', '15093187092', '', 'shentong', '申通物流', NULL, '', '', '', '', '110.00', '0.00', '0.00', '0.00', 0, '0.00', '110.00', '110.00', 1471427330, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(639, '201608171754076550', 0, 3, 0, 0, '朱明明', '软件园南站', '15701207315', '', 'shunfeng', '顺丰物流', NULL, 'cod', '到货付款', '', '', '2000.00', '12.00', '0.00', '0.00', 0, '0.00', '2012.00', '2012.00', 1471427647, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(640, '201608181131481563', 0, 0, 0, 0, '卫建华', '南小还在睡', '15035121696', '', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '3400.00', '0.00', '0.00', '0.00', 0, '0.00', '3400.00', '3400.00', 1471491108, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(641, '201608181250335287', 0, 0, 0, 0, '苏乐', '照顾手机膜搜了搜个', '13258965436', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '69.00', '0.00', '0.00', '0.00', 0, '0.00', '69.00', '69.00', 1471495833, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(642, '201608181534242359', 0, 3, 0, 0, '易春霖', '111', '15999999996', '', 'shunfeng', '顺丰物流', NULL, 'weixin', '微信支付', '', '', '8000.00', '16.00', '0.00', '0.00', 0, '0.00', '8016.00', '8016.00', 1471505664, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(643, '201608191128359162', 0, 0, 0, 0, '想文文', '的', '13475555555', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.01', 1471577315, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(644, '201608191717155201', 0, 0, 0, 0, '杨立业', '红旗大街', '15765713458', '', 'shentong', '申通物流', NULL, '', '', '', '', '2000.00', '0.00', '0.00', '0.00', 0, '0.00', '2000.00', '2000.00', 1471598235, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(645, '201608191828589329', 0, 0, 0, 0, '黄先生', '通州区旗舰凯旋小区', '15889560679', 'text@tpshop.com', 'shentong', '申通物流', NULL, 'tenpay', 'PC端财付通', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.01', 1471602538, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(646, '201608200840209844', 0, 0, 0, 0, '黄先生', '通州区旗舰凯旋小区', '15889560679', 'text@tpshop.com', 'shentong', '申通物流', NULL, 'alipayMobile', '手机网站支付宝', '', '', '14350.14', '0.00', '0.00', '0.00', 0, '0.00', '14350.14', '14350.14', 1471653620, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(647, '201608201504415637', 0, 0, 0, 0, '李强', '广角畸变', '15926586868', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '3400.00', '0.00', '0.00', '0.00', 0, '0.00', '3400.00', '3400.00', 1471676681, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(648, '201608202330226094', 0, 0, 0, 0, '江凡', '广州', '13642668089', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '69.00', '0.00', '0.00', '0.00', 0, '0.00', '69.00', '69.00', 1471707022, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(649, '201608211301021347', 0, 3, 0, 0, '1111', '1231233333333333', '15625509230', '', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '4740.00', '0.00', '0.00', '0.00', 0, '0.00', '4740.00', '4740.00', 1471755662, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(650, '201608211303586029', 0, 3, 0, 0, '1111', '1231233333333333', '15625509230', '', 'shentong', '申通物流', NULL, 'alipayMobile', '手机网站支付宝', '', '来来来', '21495480.00', '0.00', '0.00', '0.00', 0, '0.00', '21495480.00', '21495480.00', 1471755838, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(651, '201608211306263385', 0, 3, 0, 0, '1111', '1231233333333333', '15625509230', '', 'shentong', '申通物流', NULL, 'alipayMobile', '手机网站支付宝', '', '', '2000.00', '0.00', '0.00', '0.00', 0, '0.00', '2000.00', '2000.00', 1471755986, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(652, '201608211308506068', 0, 3, 0, 0, '1111', '1231233333333333', '15625509230', '', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '69.00', '0.00', '0.00', '0.00', 0, '0.00', '69.00', '69.00', 1471756130, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(653, '201608211442094080', 0, 0, 0, 0, '江凡', '广州', '13642668089', '', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '267.00', '0.00', '0.00', '0.00', 0, '0.00', '267.00', '267.00', 1471761729, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(654, '201608211546039859', 0, 0, 0, 0, 'b b', 'h z h j j', '18791346787', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '2399.00', '0.00', '0.00', '0.00', 0, '0.00', '2399.00', '2399.00', 1471765563, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(655, '201608220853217308', 0, 0, 0, 0, '222', '123', '18923652536', '', 'shentong', '申通物流', NULL, '', '', '', '', '110.00', '0.00', '0.00', '0.00', 0, '0.00', '110.00', '110.00', 1471827201, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(656, '201608220854375870', 0, 0, 0, 0, '222', '123', '18923652536', '', 'shentong', '申通物流', NULL, '', '', '', '', '110.00', '0.00', '0.00', '0.00', 0, '0.00', '110.00', '110.00', 1471827277, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(657, '201608220855509807', 0, 0, 0, 0, '222', '123', '18923652536', '', 'shentong', '申通物流', NULL, '', '', '', '', '3000.00', '0.00', '0.00', '0.00', 0, '0.00', '3000.00', '3000.00', 1471827350, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(658, '201608221035324027', 0, 3, 0, 0, '黄先生', '通州区旗舰凯旋小区', '15889560679', 'text@tpshop.com', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '5877.06', '0.00', '0.00', '0.00', 0, '0.00', '5877.06', '5877.06', 1471833332, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(659, '201608221221455326', 0, 0, 0, 0, '123', '43451', '13588888888', '', 'shunfeng', '顺丰物流', NULL, 'weixin', '微信支付', '', '', '2000.00', '12.00', '0.00', '0.00', 0, '0.00', '2012.00', '2012.00', 1471839705, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(660, '201608221314554508', 0, 0, 0, 0, '张老师', '是的时候来着想法师姐弟弟妹妹', '13200132000', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '110.00', '0.00', '0.00', '0.00', 0, '0.00', '110.00', '110.00', 1471842895, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(661, '201608221400135468', 0, 0, 0, 0, '头头', '广告', '13111111111', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '69.00', '0.00', '0.00', '0.00', 0, '0.00', '69.00', '69.00', 1471845613, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(662, '201608221646299956', 0, 0, 0, 0, '黄先生', '通州区旗舰凯旋小区', '15889560679', 'text@tpshop.com', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '12680.00', '0.00', '0.00', '0.00', 0, '0.00', '12680.00', '12680.00', 1471855589, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(663, '201608221917461961', 0, 0, 0, 0, '哼哼唧唧', '过会就好了', '13422142616', '', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.01', 1471864666, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(664, '201608222124337969', 0, 0, 0, 0, '黄先生', '通州区旗舰凯旋小区', '15889560679', 'text@tpshop.com', 'shentong', '申通物流', NULL, 'tenpay', 'PC端财付通', '', '', '11760.00', '0.00', '0.00', '0.00', 0, '0.00', '11760.00', '11760.00', 1471872273, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(665, '201608222139498078', 0, 0, 0, 0, '黄先生', '通州区旗舰凯旋小区', '15889560679', 'text@tpshop.com', 'shentong', '申通物流', NULL, 'tenpay', 'PC端财付通', '', '', '782.04', '0.00', '0.00', '0.00', 0, '0.00', '782.04', '782.04', 1471873189, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `ruike_mall_order` (`order_id`, `order_sn`, `member_id`, `order_status`, `shipping_status`, `pay_status`, `consignee`, `address`, `mobile`, `email`, `shipping_code`, `shipping_name`, `invoice_no`, `pay_code`, `pay_name`, `transaction_id`, `invoice_title`, `goods_price`, `shipping_price`, `user_money`, `coupon_price`, `integral`, `integral_money`, `order_amount`, `total_amount`, `add_time`, `shipping_time`, `confirm_time`, `pay_time`, `order_prom_id`, `order_prom_amount`, `discount`, `user_note`, `admin_note`, `parent_sn`, `is_distribut`, `date_of_application`, `return_or_exchange`, `return_description`, `return_img`, `processing_remarks`, `coordinate`, `discount_type`, `pay_cnt`, `mark`) VALUES
(666, '201608222141344204', 0, 0, 0, 0, '黄先生', '通州区旗舰凯旋小区', '15889560679', 'text@tpshop.com', 'shentong', '申通物流', NULL, 'alipayMobile', '手机网站支付宝', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.01', 1471873294, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(667, '201608231040516773', 0, 0, 0, 0, '就自己', '激动激动激动就睡觉', '15278392913', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '6910.00', '0.00', '0.00', '0.00', 0, '0.00', '6910.00', '6910.00', 1471920051, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(668, '201608231151572285', 0, 3, 0, 0, '黄先生', '通州区旗舰凯旋小区', '15889560679', 'text@tpshop.com', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '1960.00', '0.00', '0.00', '0.00', 0, '0.00', '1960.00', '1960.00', 1471924317, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(669, '201608231320173780', 0, 0, 0, 0, '测试', '在这', '18936521478', '', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '110.01', '0.00', '0.00', '0.00', 0, '0.00', '110.01', '110.01', 1471929617, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(670, '201608231345326306', 0, 0, 0, 0, '不会', '咯佛祖 too', '18513866269', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '238.00', '0.00', '0.00', '0.00', 0, '0.00', '238.00', '238.00', 1471931132, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(671, '201608231822077764', 0, 0, 0, 0, '任保雄', '武商亚贸b栋', '18271941009', '', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.01', 1471947727, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(672, '201608241415393276', 0, 3, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, 'alipayMobile', '手机网站支付宝', '', '', '979.02', '0.00', '0.00', '0.00', 0, '0.00', '979.02', '979.02', 1472019339, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(673, '201608241455389251', 0, 3, 0, 0, '此时', '拆', '15151515153', '', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '59.01', '0.00', '0.00', '0.00', 0, '0.00', '59.01', '59.01', 1472021738, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(674, '201608241547452569', 0, 0, 0, 0, '猪在笑', '总部企业基地', '18538263022', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '2110.00', '0.00', '0.00', '0.00', 0, '0.00', '2110.00', '2110.00', 1472024865, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(675, '201608241710262308', 0, 0, 0, 0, '哈哈', '呵呵', '13333333333', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '5269.00', '0.00', '0.00', '0.00', 0, '0.00', '5269.00', '5269.00', 1472029826, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(676, '201608242222426527', 0, 0, 0, 0, '测试一下', '测试地址', '13554756948', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '4000.00', '0.00', '0.00', '0.00', 0, '0.00', '4000.00', '4000.00', 1472048562, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(677, '201608260923408051', 0, 0, 0, 0, '司成龙', '嘉怡坊', '18916801303', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '3400.00', '0.00', '0.00', '0.00', 0, '0.00', '3400.00', '3400.00', 1472174620, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(678, '201608261453288262', 0, 0, 0, 0, '测试', '测试', '15210520361', '', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '3400.00', '0.00', '0.00', '0.00', 0, '0.00', '3400.00', '3400.00', 1472194408, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(679, '201608261700167644', 0, 0, 0, 0, '测试', '测试', '13800138000', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '59.00', '0.00', '0.00', '0.00', 0, '0.00', '59.00', '59.00', 1472202016, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(680, '201608262251576354', 0, 0, 0, 1, '何先生', '178号', '13838383388', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.01', 1472223117, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(681, '201608262313122458', 0, 0, 0, 0, '来弄', 'kang', '18629152395', '', 'shentong', '申通物流', NULL, '', '', '', '', '69.00', '0.00', '0.00', '0.00', 0, '0.00', '69.00', '69.00', 1472224392, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(682, '201608271455353839', 0, 0, 0, 0, 'dfsd', 'fdgdfg', '13561669865', '', 'shentong', '申通物流', NULL, 'alipayMobile', '手机网站支付宝', '', '', '3400.00', '0.00', '0.00', '0.00', 0, '0.00', '3400.00', '3400.00', 1472280935, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(683, '201608271522218478', 0, 0, 0, 1, '林方', '还会继续', '15262453762', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.01', 1472282541, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(684, '201608271603021827', 0, 0, 0, 0, '啊啊啊啊啊', '健健康康', '13521345421', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.01', 1472284982, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(685, '201608281418383654', 0, 0, 0, 0, '在一起', '也', '13526555555', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '69.00', '0.00', '0.00', '0.00', 0, '0.00', '69.00', '69.00', 1472365118, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(686, '201608281453276406', 0, 3, 0, 0, '测试哦', '白云', '13922777555', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '108.00', '0.00', '0.00', '0.00', 0, '0.00', '108.00', '108.00', 1472367207, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(687, '201608282103291628', 0, 3, 0, 0, '黄云建', '福建厦门', '15359206523', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '4372.20', '0.00', '0.00', '0.00', 0, '0.00', '4372.20', '4372.20', 1472389409, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(688, '201608291211124795', 0, 0, 0, 0, '石磊', '婆婆嘴', '13651454570', '', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '1580.00', '0.00', '0.00', '0.00', 0, '0.00', '1580.00', '1580.00', 1472443872, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(689, '201608291236056570', 0, 0, 0, 1, '规划环境', '不仅积极斤斤计较湖', '13422142616', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.01', 1472445365, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(690, '201608291535457107', 0, 0, 0, 0, '杨磊', '小上海新城56号502室', '13661947250', '', 'shunfeng', '顺丰物流', NULL, 'weixin', '微信支付', '', '', '138.00', '12.00', '0.00', '0.00', 0, '0.00', '150.00', '150.00', 1472456145, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(691, '201608291605564149', 0, 0, 0, 0, '离开了', '看来离去寄希望于', '14769278681', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '69.00', '0.00', '0.00', '0.00', 0, '0.00', '69.00', '69.00', 1472457956, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(692, '201608291614392897', 0, 0, 0, 0, '王老师', '二七区', '13888888888', '', 'shunfeng', '顺丰物流', NULL, 'cod', '到货付款', '', '', '220.00', '16.00', '0.00', '0.00', 0, '0.00', '236.00', '236.00', 1472458479, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(693, '201608291803017077', 0, 0, 0, 0, '马彦军', 'c x x x x x', '13699980000', '', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '999.00', '0.00', '0.00', '0.00', 0, '0.00', '999.00', '999.00', 1472464981, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(694, '201608300051473842', 0, 0, 0, 0, '223', 'gggg', '15245454545', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '2000.00', '0.00', '0.00', '0.00', 0, '0.00', '2000.00', '2000.00', 1472489507, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(695, '201608301104159644', 0, 0, 0, 0, '王子', '我', '13811100112', '', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.01', 1472526255, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(696, '201608301241199075', 0, 0, 0, 0, '刘强', '捏哄哄', '18111507332', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '110.00', '0.00', '0.00', '0.00', 0, '0.00', '110.00', '110.00', 1472532079, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(697, '201608301426256760', 0, 0, 0, 0, '夏前程', '招银大厦1808', '15638926281', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '2000.00', '0.00', '0.00', '0.00', 0, '0.00', '2000.00', '2000.00', 1472538385, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(698, '201608301627045415', 0, 0, 0, 0, '哎呦', '盛大的撒旦', '13322222222', '', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '10200.00', '0.00', '0.00', '0.00', 0, '0.00', '10200.00', '10200.00', 1472545624, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(699, '201608301715075162', 0, 0, 0, 0, '黄先生', '通州区旗舰凯旋小区', '15889560679', 'text@tpshop.com', 'shentong', '申通物流', NULL, 'alipayMobile', '手机网站支付宝', '', '', '5751.02', '0.00', '0.00', '0.00', 0, '0.00', '5751.02', '5751.02', 1472548507, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(700, '201608301813015303', 0, 0, 0, 0, 'xxx', '软件园二期', '13459000000', '', 'shentong', '申通物流', NULL, '', '', '', '', '110.00', '0.00', '0.00', '0.00', 0, '0.00', '110.00', '110.00', 1472551981, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(701, '201608310239588377', 0, 0, 0, 0, '！据了解', '恍恍惚惚哈哈哈哈', '13888888888', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '2047.60', '0.00', '0.00', '0.00', 0, '0.00', '2047.60', '2047.60', 1472582398, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(702, '201608310648013285', 0, 0, 0, 0, '谁是谁', '随时随地的大大方方分', '13366778899', '', 'shunfeng', '顺丰物流', NULL, 'weixin', '微信支付', '', '', '3998.00', '12.00', '0.00', '0.00', 0, '0.00', '4010.00', '4010.00', 1472597281, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(703, '201608310925048062', 0, 0, 0, 0, '看看', '今年', '13336666666', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '108.00', '0.00', '0.00', '0.00', 0, '0.00', '108.00', '108.00', 1472606704, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(704, '201608311136535754', 0, 3, 0, 0, '测试', '98号', '18992701234', '', 'shunfeng', '顺丰物流', NULL, 'weixin', '微信支付', '', '', '3400.00', '12.00', '0.00', '0.00', 0, '0.00', '3412.00', '3412.00', 1472614613, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(705, '201608311300521478', 0, 0, 0, 1, 'yyyy', 'hhh', '13566669999', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.01', 1472619652, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(706, '201608311329528875', 0, 0, 0, 0, '魔鬼', '4名我去洗澡', '18699654676', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '69.00', '0.00', '0.00', '0.00', 0, '0.00', '69.00', '69.00', 1472621392, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(707, '201608311348251180', 0, 0, 0, 0, '登', '了垃圾了了了来咯', '15114077394', '', 'shentong', '申通物流', NULL, '', '', '', '', '2000.00', '0.00', '0.00', '0.00', 0, '0.00', '2000.00', '2000.00', 1472622505, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(708, '201608311349599657', 0, 0, 0, 0, '登', '了垃圾了了了来咯', '15114077394', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '2000.00', '0.00', '0.00', '0.00', 0, '0.00', '2000.00', '2000.00', 1472622599, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(709, '201608311424304036', 0, 0, 0, 0, '登', '了垃圾了了了来咯', '15114077394', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '210.00', '0.00', '0.00', '0.00', 0, '0.00', '210.00', '210.00', 1472624670, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(710, '201608311610219772', 0, 3, 0, 0, '测试哦', '白云', '13922777555', '', 'shunfeng', '顺丰物流', NULL, 'weixin', '微信支付', '', '', '220.00', '16.00', '0.00', '0.00', 0, '0.00', '236.00', '236.00', 1472631021, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(711, '201608311756544002', 0, 0, 0, 0, '李美美', '美女街', '13569870495', '', 'shentong', '申通物流', NULL, '', '', '', '', '6998.00', '0.00', '0.00', '0.00', 0, '0.00', '6998.00', '6998.00', 1472637414, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(712, '201608311846329738', 0, 0, 0, 0, '介', '讲理', '15611660929', '', 'shunfeng', '顺丰物流', NULL, 'weixin', '微信支付', '', '', '69.00', '12.00', '0.00', '0.00', 0, '0.00', '81.00', '81.00', 1472640392, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(713, '201609011418062013', 0, 3, 0, 0, '黄先生', '通州区旗舰凯旋小区', '15889560679', 'text@tpshop.com', 'shentong', '申通物流', NULL, 'alipayMobile', '手机网站支付宝', '', '', '1115.24', '0.00', '0.00', '0.00', 0, '0.00', '1115.24', '1115.24', 1472710686, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(714, '201609011422385827', 0, 0, 0, 1, '黄先生', '通州区旗舰凯旋小区', '15889560679', 'text@tpshop.com', 'shentong', '申通物流', NULL, 'alipayMobile', '手机网站支付宝', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.01', 1472710958, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(715, '201609011506487543', 0, 0, 0, 1, '黄先生', '通州区旗舰凯旋小区', '15889560679', 'text@tpshop.com', 'shentong', '申通物流', NULL, 'alipayMobile', '手机网站支付宝', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.01', 1472713608, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(716, '201609011508394637', 0, 0, 0, 1, '林 sir', '鼓楼区建华支巷9号', '18606013183', '', 'shentong', '申通物流', NULL, 'alipayMobile', '手机网站支付宝', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.01', 1472713719, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(717, '201609011620002341', 0, 0, 0, 0, '黄先生', '通州区旗舰凯旋小区', '15889560679', 'text@tpshop.com', 'shentong', '申通物流', NULL, '', '', '', '', '8744.40', '0.00', '0.00', '0.00', 0, '0.00', '8744.40', '8744.40', 1472718000, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(718, '201609011638359520', 0, 3, 0, 0, '黄先生', '通州区旗舰凯旋小区', '15889560679', 'text@tpshop.com', 'shentong', '申通物流', NULL, '', '', '', '', '215.60', '0.00', '0.00', '0.00', 0, '0.00', '215.60', '215.60', 1472719115, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(719, '201609011651554642', 0, 0, 0, 0, 'ssj', 'jjw', '13388229933', '', 'shunfeng', '顺丰物流', NULL, 'weixin', '微信支付', '', '', '84.90', '12.00', '0.00', '0.00', 0, '0.00', '96.90', '96.90', 1472719915, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(720, '201609021037193962', 0, 0, 0, 0, '文文静静', '返回多喝点回电话v发v个', '13455546665', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '69.00', '0.00', '0.00', '0.00', 0, '0.00', '69.00', '69.00', 1472783839, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(721, '201609021106259103', 0, 3, 0, 0, '黄先生', '通州区旗舰凯旋小区', '15889560679', 'text@tpshop.com', 'shentong', '申通物流', NULL, '', '', '', '', '803.63', '0.00', '0.00', '0.00', 0, '0.00', '803.63', '803.63', 1472785585, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(722, '201609021109555907', 0, 0, 0, 0, '小米', '广电', '18105693928', '', 'shentong', '申通物流', NULL, '', '', '', '', '3500.01', '0.00', '0.00', '0.00', 0, '0.00', '3500.01', '3500.01', 1472785795, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(723, '201609021300012852', 0, 0, 0, 0, '测试', '测试地址', '15823128299', '', 'shentong', '申通物流', NULL, '', '', '', '', '110.00', '0.00', '0.00', '0.00', 0, '0.00', '110.00', '110.00', 1472792401, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(724, '201609021454135240', 0, 0, 0, 0, '王子', '我', '13811100112', '', 'shentong', '申通物流', NULL, '', '', '', '', '100.00', '0.00', '0.00', '0.00', 0, '0.00', '100.00', '100.00', 1472799253, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(725, '201609021613254532', 0, 0, 0, 0, '杨庆', '南二环', '18729036455', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '3400.00', '0.00', '0.00', '0.00', 0, '0.00', '3400.00', '3400.00', 1472804005, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(726, '201609021625305286', 0, 3, 0, 0, '黄先生', '通州区旗舰凯旋小区', '15889560679', 'text@tpshop.com', 'shentong', '申通物流', NULL, 'alipay', '支付宝支付', '', '', '5065.62', '0.00', '0.00', '0.00', 0, '0.00', '5065.62', '5065.62', 1472804730, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(727, '201609021729482412', 0, 0, 0, 0, '张三', '4哈还', '13588888883', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '3400.00', '0.00', '0.00', '0.00', 0, '0.00', '3400.00', '3400.00', 1472808588, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(728, '201609021805399310', 0, 0, 0, 0, '快进来', '啦啦啦啦', '15820265885', '', 'shentong', '申通物流', NULL, '', '', '', '', '110.00', '0.00', '0.00', '0.00', 0, '0.00', '110.00', '110.00', 1472810739, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(729, '201609022037148690', 0, 3, 0, 0, '空间里', '健健康康', '18648555555', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '3538.00', '0.00', '0.00', '0.00', 0, '0.00', '3538.00', '3538.00', 1472819834, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(730, '201609031242469515', 0, 3, 0, 0, '俺爸', '艾丽卡李心情不好吗隔壁那家店长小炒馆', '18102261258', '', 'shunfeng', '顺丰物流', NULL, 'cod', '到货付款', '', '', '110.00', '14.00', '0.00', '0.00', 0, '0.00', '124.00', '124.00', 1472877766, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(731, '201609031243275719', 0, 0, 0, 0, '俺爸', '艾丽卡李心情不好吗隔壁那家店长小炒馆', '18102261258', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '110.00', '0.00', '0.00', '0.00', 0, '0.00', '110.00', '110.00', 1472877807, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(732, '201609031313393331', 0, 0, 0, 0, '哦哦哦', '本机', '15811696325', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '1999.00', '0.00', '0.00', '0.00', 0, '0.00', '1999.00', '1999.00', 1472879619, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(733, '201609031445075255', 0, 0, 0, 0, 'rhh', 'Fh', '18682751599', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '450.00', '0.00', '0.00', '0.00', 0, '0.00', '450.00', '450.00', 1472885107, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(734, '201609031805182419', 0, 0, 0, 0, '测试', '形容人', '13413413214', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '50.00', '0.00', '0.00', '0.00', 0, '0.00', '50.00', '50.00', 1472897118, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(735, '201609040028287808', 0, 0, 0, 0, '那个', '佳', '14444444444', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '3400.00', '0.00', '0.00', '0.00', 0, '0.00', '3400.00', '3400.00', 1472920108, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(736, '201609050925426226', 0, 0, 0, 0, '测试一下', '测试', '13512345678', '', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '69.00', '0.00', '0.00', '0.00', 0, '0.00', '69.00', '69.00', 1473038742, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(737, '201609051716186244', 0, 3, 0, 0, '，我们都', '和利库路特', '13854855885', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.01', 1473066978, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(738, '201609061150344996', 0, 0, 0, 0, '王思远', '五成路5号', '15637375808', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '110.00', '0.00', '0.00', '0.00', 0, '0.00', '110.00', '110.00', 1473133834, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(739, '201609061333083400', 0, 3, 0, 0, '158', '通俗', '13651454508', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '39.90', '0.00', '0.00', '0.00', 0, '0.00', '39.90', '39.90', 1473139988, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(740, '201609061428078962', 0, 3, 0, 0, '黄先生', '通州区旗舰凯旋小区', '15889560679', 'text@tpshop.com', 'shentong', '申通物流', NULL, 'unionpay', '银联在线支付', '', '', '120.00', '0.00', '0.00', '0.00', 0, '0.00', '120.00', '120.00', 1473143287, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(741, '201609061542367792', 0, 0, 0, 0, '严春汉', '科学大道99号科汇金谷一街4号4楼', '13928790037', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '5499.00', '0.00', '0.00', '0.00', 0, '0.00', '5499.00', '5499.00', 1473147756, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(742, '201609061626189730', 0, 3, 0, 0, '铁路局', '急急如律令', '15767952604', '', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '3400.00', '0.00', '0.00', '0.00', 0, '0.00', '3400.00', '3400.00', 1473150378, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(743, '201609070012287438', 0, 3, 0, 0, '哈哈', '不认识', '18970452369', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '110.00', '0.00', '0.00', '0.00', 0, '0.00', '110.00', '110.00', 1473178348, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(744, '201609070014063546', 0, 0, 0, 1, '哈哈', '不认识', '18970452369', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.01', 1473178446, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(745, '201609070113192408', 0, 0, 0, 1, '哈哈', '内蒙古,兴安市,科尔沁右翼中旗,插入语', '18970452369', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.01', 1473181999, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(746, '201609071415202906', 0, 0, 0, 0, '黄先生', '通州区旗舰凯旋小区', '15889560679', 'text@tpshop.com', 'shentong', '申通物流', NULL, '', '', '', '', '11751.18', '0.00', '0.00', '0.00', 0, '0.00', '11751.18', '11751.18', 1473228920, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(747, '201609071435338779', 0, 0, 0, 0, '黄先生', '通州区旗舰凯旋小区', '15889560679', 'text@tpshop.com', 'shentong', '申通物流', NULL, '', '', '', '', '3917.06', '0.00', '0.00', '0.00', 0, '0.00', '3917.06', '3917.06', 1473230133, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(748, '201609071615107882', 0, 3, 0, 0, '黄先生', '通州区旗舰凯旋小区', '15889560679', 'text@tpshop.com', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '0.02', '0.00', '0.00', '0.00', 0, '0.00', '0.02', '0.02', 1473236110, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(749, '201609071714423087', 0, 0, 0, 0, '吧', '年', '15800467916', '', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '4372.20', '0.00', '0.00', '0.00', 0, '0.00', '4372.20', '4372.20', 1473239682, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(750, '201609071725371548', 0, 0, 0, 0, '吧', '年', '15800467916', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '108.00', '0.00', '0.00', '0.00', 0, '0.00', '108.00', '108.00', 1473240337, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(751, '201609080152033103', 0, 3, 0, 0, '黄先生', '通州区旗舰凯旋小区', '15889560679', 'text@tpshop.com', 'shentong', '申通物流', NULL, 'alipayMobile', '手机网站支付宝', '', '', '3400.02', '0.00', '0.00', '0.00', 0, '0.00', '3400.02', '3400.02', 1473270723, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(752, '201609080929217551', 0, 0, 0, 0, '策士', '还吐', '15511663354', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '3400.00', '0.00', '0.00', '0.00', 0, '0.00', '3400.00', '3400.00', 1473298161, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(753, '201609080943525665', 0, 0, 0, 0, '黄先生', '通州区旗舰凯旋小区', '15889560679', 'text@tpshop.com', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '0.05', '0.00', '0.00', '0.00', 0, '0.00', '0.05', '0.05', 1473299032, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(754, '201609080952021581', 0, 3, 0, 0, '黄先生', '通州区旗舰凯旋小区', '15889560679', 'text@tpshop.com', 'shentong', '申通物流', NULL, '', '', '', '', '1960.00', '0.00', '0.00', '0.00', 0, '0.00', '1960.00', '1960.00', 1473299522, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(755, '201609080958237757', 0, 0, 0, 0, '刘传文', '文化路88号', '15303711052', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '2000.00', '0.00', '0.00', '0.00', 0, '0.00', '2000.00', '2000.00', 1473299903, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(756, '201609080958472364', 0, 3, 0, 0, '黄先生', '通州区旗舰凯旋小区', '15889560679', 'text@tpshop.com', 'shentong', '申通物流', NULL, 'unionpay', '银联在线支付', '', '', '67.62', '0.00', '0.00', '0.00', 0, '0.00', '67.62', '67.62', 1473299927, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(757, '201609081012133652', 0, 3, 0, 0, '黄先生', '通州区旗舰凯旋小区', '15889560679', 'text@tpshop.com', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '360.00', '0.00', '0.00', '0.00', 0, '0.00', '360.00', '360.00', 1473300733, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(758, '201609081019221996', 0, 3, 0, 0, '还好', '二甲基', '15210021424', '', 'shentong', '申通物流', NULL, '', '', '', '', '3400.00', '0.00', '0.00', '0.00', 0, '0.00', '3400.00', '3400.00', 1473301162, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(759, '201609081155208576', 0, 3, 0, 0, '黄先生', '通州区旗舰凯旋小区', '15889560679', 'text@tpshop.com', 'shentong', '申通物流', NULL, '', '', '', '', '3920.00', '0.00', '0.00', '0.00', 0, '0.00', '3920.00', '3920.00', 1473306920, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(760, '201609081157178840', 0, 0, 0, 0, '张三', '小县城', '13300005555', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '3160.00', '0.00', '0.00', '0.00', 0, '0.00', '3160.00', '3160.00', 1473307037, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(761, '201609081721162056', 0, 2, 1, 1, '黄先生', '通州区旗舰凯旋小区', '15889560679', 'text@tpshop.com', 'shentong', '申通物流', NULL, 'alipay', '支付宝支付', '', '', '2940.00', '0.00', '0.00', '0.00', 0, '0.00', '2940.00', '2940.00', 1473326476, 0, 1481594655, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(762, '201609081731238525', 0, 3, 0, 0, 'Djsjsjjs', 'Ddccvv', '18976654433', '', 'shunfeng', '顺丰物流', NULL, 'cod', '到货付款', '', '', '4372.20', '12.00', '0.00', '0.00', 0, '0.00', '4384.20', '4384.20', 1473327083, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(763, '201609082033254579', 0, 0, 0, 0, '任虹机', '石岐区', '15019917554', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '110.00', '0.00', '0.00', '0.00', 0, '0.00', '110.00', '110.00', 1473338005, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(764, '201609090751409115', 0, 0, 0, 0, '1', '1', '18267165222', '', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '54.00', '0.00', '0.00', '0.00', 0, '0.00', '54.00', '54.00', 1473378700, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(765, '201609091020273676', 0, 3, 0, 0, '黄先生', '通州区旗舰凯旋小区', '15889560679', 'text@tpshop.com', 'shunfeng', '顺丰物流', NULL, '', '', '', '', '67.62', '12.00', '0.00', '0.00', 0, '0.00', '79.62', '79.62', 1473387627, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(766, '201609091028028830', 0, 0, 0, 0, '158', '通俗', '13651454508', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '4000.00', '0.00', '0.00', '0.00', 0, '0.00', '4000.00', '4000.00', 1473388082, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(767, '201609091032068550', 0, 0, 0, 0, '石磊', '婆婆嘴', '13651454570', '', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '50.00', '0.00', '0.00', '0.00', 0, '0.00', '50.00', '50.00', 1473388326, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(768, '201609091035516074', 0, 0, 0, 0, '158', '通俗', '13651454508', '', 'shentong', '申通物流', NULL, 'cod', '到货付款', '', '', '71.10', '0.00', '0.00', '0.00', 0, '0.00', '71.10', '71.10', 1473388551, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(769, '201609091100016299', 0, 0, 0, 0, '酷酷', '楠楠', '18702590321', '', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '54.00', '0.00', '0.00', '0.00', 0, '0.00', '54.00', '54.00', 1473390001, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(770, '201609191418289481', 0, 4, 1, 1, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, 'unionpay', '银联在线支付', '', '', '67.62', '0.00', '0.00', '0.00', 0, '0.00', '67.62', '67.62', 1474265908, 1474266064, 1474356170, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(771, '201609191457077685', 0, 0, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, 'weixin', '微信支付', '', '', '67.62', '0.00', '0.00', '0.00', 0, '0.00', '67.62', '67.62', 1474268227, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(772, '201609191458522685', 0, 4, 1, 1, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, 'tenpay', 'PC端财付通', '', '', '67.62', '0.00', '0.00', '0.00', 0, '0.00', '67.62', '67.62', 1474268332, 1474514527, 1474515131, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(773, '201609191644312432', 0, 5, 0, 0, '刘先生', '海兴大厦', '13986765412', 'tpshop@tpshop.com', 'shentong', '申通物流', NULL, '', '', '', '', '5880.00', '0.00', '0.00', '0.00', 0, '0.00', '5880.00', '5880.00', 1474274671, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(774, '201609221057384973', 0, 0, 0, 0, 'ghfgh', 'dgdg', '13118945648', '', 'shentong', '申通物流', NULL, '', '', '', '', '52908.24', '0.00', '0.00', '0.00', 0, '0.00', '52908.24', '52908.24', 1474513058, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(775, '201609230956343443', 0, 4, 1, 1, 'ghfgh', 'dgdg', '13118945648', '', 'shentong', '申通物流', NULL, 'alipay', '支付宝支付', '', '', '11760.00', '0.00', '0.00', '0.00', 0, '0.00', '11760.00', '11760.00', 1474595794, 1474595894, 1474595995, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(776, '201609231414093180', 0, 0, 0, 0, '撒旦发送短发', '撒旦发送短发', '13118914190', '', 'shentong', '申通物流', NULL, '', '', '', '', '11760.00', '0.00', '0.00', '0.00', 0, '0.00', '11760.00', '11760.00', 1474611249, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(777, '201609231640523444', 0, 0, 0, 0, 'ghfgh', 'dgdg', '13118945648', '', 'shunfeng', '顺丰物流', NULL, '', '', '', '', '14189.10', '14.00', '0.00', '0.00', 0, '0.00', '14203.10', '14203.10', 1474620052, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(778, '201609241040207865', 0, 0, 0, 0, '撒旦发送短发', '撒旦发送短发', '13118914190', '', 'shentong', '申通物流', NULL, '', '', '', '', '11760.00', '0.00', '0.00', '0.00', 0, '0.00', '11760.00', '11760.00', 1474684820, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(779, '201609241040546162', 0, 0, 0, 0, 'ghfgh', 'dgdg', '13118945648', '', 'shentong', '申通物流', NULL, '', '', '', '', '5880.00', '0.00', '0.00', '0.00', 0, '0.00', '5880.00', '5880.00', 1474684854, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(780, '201609241436484666', 0, 0, 0, 0, 'ghfgh', 'dgdg', '13118945648', '', 'shentong', '申通物流', NULL, '', '', '', '', '1959.02', '0.00', '0.00', '0.00', 0, '0.00', '1959.02', '1959.02', 1474699008, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(781, '201609241517111494', 0, 0, 0, 0, 'ghfgh', 'dgdg', '13118945648', '', 'shentong', '申通物流', NULL, '', '', '', '', '1959.02', '0.00', '0.00', '0.00', 0, '0.00', '1959.02', '1959.02', 1474701431, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(782, '201609261135404392', 0, 0, 0, 0, 'ghfgh', 'dgdg', '13118945648', '', 'shentong', '申通物流', NULL, 'alipay', '支付宝支付', '', '', '5880.00', '0.00', '0.00', '0.00', 0, '0.00', '5880.00', '5880.00', 1474860940, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(783, '201609301505521474', 0, 0, 0, 0, 'ghfgh', 'dgdg', '13118945648', '', 'shentong', '申通物流', NULL, '', '', '', '', '2846.90', '0.00', '0.00', '0.00', 0, '0.00', '2846.90', '2846.90', 1475219152, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(784, '201704141724241966', 1, 0, 0, 0, '张三', '宁夏,中卫市,其他,测试12', '18126152781', '', '0', '', NULL, '', '', '', '', '99.00', '0.00', '0.00', '0.00', 0, '0.00', '99.00', '99.00', 1492161864, 0, 0, '0000-00-00 00:00:00', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(786, '201704201134521048', 29, 1, 2, 1, '121e1e', '宁夏,中卫市市,其他,121221', '15689877898', '', '0', '', NULL, '', '', NULL, '', '99.00', '0.00', '0.00', '0.00', 0, '0.00', '99.00', '99.00', 1492659292, 0, 0, NULL, 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(787, '201704260122510854', 29, 2, 0, 2, '121e1e', '宁夏,吴忠市,利通区,121221', '15689877898', '', '0', '', NULL, '', '', '400825200120170426015128', '', '99.00', '3.00', '0.00', '0.00', 0, '0.00', '102.00', '102.00', 1493140971, 0, 0, '2017-04-26 01:51:28', 0, '0.00', '0.00', '', '', NULL, 0, 1493143478, NULL, '  质量问题', NULL, '', NULL, 0, NULL, NULL),
(788, '201704270338062230', 29, 0, 1, 1, '121e1e', '宁夏,吴忠市,利通区,121221', '15689877898', '', '0', '', '534462621352', '', '', '400825200120170427035234', '', '198.00', '3.00', '0.00', '158.40', 0, '0.00', '201.00', '42.60', 1493235486, 1493973439, 0, '2017-04-27 03:52:34', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(789, '201704270355332815', 29, 0, 1, 1, '121e1e', '宁夏,吴忠市,利通区,121221', '15689877898', '', '0', '', '534462621345', '', '', '400825200120170427035659', '', '99.00', '3.00', '0.00', '79.20', 0, '0.00', '102.00', '22.80', 1493236533, 1493973379, 0, '2017-04-27 03:56:59', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(790, '201704270414290280', 29, 1, 2, 1, '121e1e', '宁夏,吴忠市,利通区,121221', '15689877898', '', '0', '', '534462621175', '', '', '400825200120170427041437', '', '99.00', '3.00', '0.00', '79.20', 0, '0.00', '102.00', '22.80', 1493237669, 1493952404, 1493968194, '2017-04-27 04:14:37', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(795, '201704271900096953', 29, 1, 2, 1, '121e1e', '宁夏,吴忠市,利通区,121221', '15689877898', '', 'shentong', '', NULL, '', '', '400825200120170427190153', '', '198.00', '3.00', '0.00', '39.60', 0, '0.00', '201.00', '201.00', 1493290809, 0, 1493292929, '2017-04-27 19:01:53', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(800, '201704281704300604', 20366, 1, 2, 1, '测试', '四川,内江市,东兴区,奔', '18126152581', '', 'shentong', '', '3232332', '', '', '400825200120170428171541', '', '99.00', '0.00', '0.00', '19.80', 0, '0.00', '99.00', '99.00', 1493370270, 1493372053, 1493372089, '2017-04-28 17:15:41', 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(801, '201704281938599027', 20366, 0, 0, 0, '测试', '四川,内江市,东兴区,奔', '18126152581', '', 'shentong', '', NULL, 'weixin', '', NULL, '', '99.00', '0.00', '0.00', '19.80', 0, '0.00', '99.00', '99.00', 1493379539, 0, 0, NULL, 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, 7, NULL),
(802, '201705051109208184', 29, 0, 0, 0, '', '', '', '', 'shentong', '', NULL, '', '', NULL, '', '0.01', '0.00', '0.00', '0.00', 0, '0.00', '0.01', '0.00', 1493953760, 0, 0, NULL, 0, '0.00', '0.00', '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `ruike_mall_order_action`
--

CREATE TABLE IF NOT EXISTS `ruike_mall_order_action` (
  `action_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `order_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '订单ID',
  `action_user` int(11) DEFAULT '0' COMMENT '操作人 0 为管理员操作',
  `order_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '订单状态',
  `shipping_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '配送状态',
  `pay_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '支付状态',
  `action_note` varchar(255) NOT NULL DEFAULT '' COMMENT '操作备注',
  `log_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '操作时间',
  `status_desc` varchar(255) DEFAULT NULL COMMENT '状态描述',
  PRIMARY KEY (`action_id`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=985 ;

--
-- 转存表中的数据 `ruike_mall_order_action`
--

INSERT INTO `ruike_mall_order_action` (`action_id`, `order_id`, `action_user`, `order_status`, `shipping_status`, `pay_status`, `action_note`, `log_time`, `status_desc`) VALUES
(981, 787, 1, 2, 0, 1, '退货退款到余额', 1493143643, '退款'),
(982, 787, 1, 2, 0, 2, '退款的时候修改订单列表里面的支付状态', 1493143643, '退款'),
(983, 800, 20366, 0, 1, 1, '返现金额19.80已打到用户账户中', 1493372089, '返现1'),
(984, 790, NULL, 0, 1, 1, '返现金额79.20已打到用户账户中', 1493968194, '返现1');

-- --------------------------------------------------------

--
-- 表的结构 `ruike_mall_order_goods`
--

CREATE TABLE IF NOT EXISTS `ruike_mall_order_goods` (
  `rec_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id自增',
  `order_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '订单id',
  `member_id` int(11) NOT NULL,
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `goods_name` varchar(120) NOT NULL DEFAULT '' COMMENT '视频名称',
  `goods_sn` varchar(60) NOT NULL DEFAULT '' COMMENT '商品货号',
  `goods_num` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT '购买数量',
  `market_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '市场价',
  `goods_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '本店价',
  `cost_price` decimal(10,2) DEFAULT '0.00' COMMENT '商品成本价',
  `member_goods_price` decimal(10,2) DEFAULT '0.00' COMMENT '会员折扣价',
  `give_integral` mediumint(8) DEFAULT '0' COMMENT '购买商品赠送积分',
  `spec_key` varchar(128) NOT NULL DEFAULT '' COMMENT '商品规格key',
  `spec_key_name` varchar(128) NOT NULL DEFAULT '' COMMENT '规格对应的中文名字',
  `bar_code` varchar(64) NOT NULL DEFAULT '' COMMENT '条码',
  `is_comment` tinyint(1) DEFAULT '0' COMMENT '是否评价',
  `prom_type` tinyint(1) DEFAULT '0' COMMENT '0 普通订单,1 限时抢购, 2 团购 , 3 促销优惠',
  `prom_id` int(11) DEFAULT '0' COMMENT '活动id',
  `is_send` tinyint(1) DEFAULT '0' COMMENT '0未发货，1已发货，2已换货，3已退货',
  `delivery_id` int(11) DEFAULT '0' COMMENT '发货单ID',
  `sku` varchar(128) DEFAULT '' COMMENT 'sku',
  PRIMARY KEY (`rec_id`),
  KEY `order_id` (`order_id`),
  KEY `goods_id` (`goods_id`),
  KEY `goods_id_2` (`goods_id`),
  KEY `order_id_2` (`order_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2247 ;

--
-- 转存表中的数据 `ruike_mall_order_goods`
--

INSERT INTO `ruike_mall_order_goods` (`rec_id`, `order_id`, `member_id`, `goods_id`, `goods_name`, `goods_sn`, `goods_num`, `market_price`, `goods_price`, `cost_price`, `member_goods_price`, `give_integral`, `spec_key`, `spec_key_name`, `bar_code`, `is_comment`, `prom_type`, `prom_id`, `is_send`, `delivery_id`, `sku`) VALUES
(125, 142, 0, 51, '华为 HUAWEI Mate 8 4GB+64GB版 全网通（香槟金）', 'TP0000051', 1, '3699.00', '3699.00', '0.00', '3625.02', 0, '11_13_21', '网络:4G 内存:16G 屏幕:触屏', '', 0, 0, 0, 0, 0, ''),
(192, 191, 0, 50, '华为 HUAWEI 畅享5S 全网通 2GB RAM+16GB ROM（金色）', 'TP0000050', 1, '1299.00', '0.01', '0.00', '0.01', 0, '11_13_21_55', '网络:4G 内存:16G 屏幕:触屏 颜色:黑色', '', 0, 0, 0, 0, 0, ''),
(124, 141, 0, 51, '华为 HUAWEI Mate 8 4GB+64GB版 全网通（香槟金）', 'TP0000051', 1, '3699.00', '3699.00', '0.00', '3625.02', 0, '11_13_21', '网络:4G 内存:16G 屏幕:触屏', '', 0, 0, 0, 0, 0, ''),
(123, 140, 0, 50, '华为 HUAWEI 畅享5S 全网通 2GB RAM+16GB ROM（金色）', 'TP0000050', 1, '1199.00', '1199.00', '0.00', '1175.02', 0, '11_13_21_55', '网络:4G 内存:16G 屏幕:触屏 颜色:黑色', '', 0, 0, 0, 0, 0, ''),
(122, 139, 0, 46, '【北京移动老用户专享 话费六折】荣耀畅玩5X 双卡双待 移动版 智能手机（破晓银）', 'TP0000046', 1, '999.00', '999.00', '0.00', '979.02', 0, '11_13_21', '网络:4G 内存:16G 屏幕:触屏', '', 0, 0, 0, 0, 0, ''),
(121, 138, 0, 51, '华为 HUAWEI Mate 8 4GB+64GB版 全网通（香槟金）', 'TP0000051', 1, '3699.00', '3699.00', '0.00', '3625.02', 0, '11_13_21', '网络:4G 内存:16G 屏幕:触屏', '', 0, 0, 0, 0, 0, ''),
(120, 137, 0, 51, '华为 HUAWEI Mate 8 4GB+64GB版 全网通（香槟金）', 'TP0000051', 1, '3699.00', '3699.00', '0.00', '3625.02', 0, '11_13_21', '网络:4G 内存:16G 屏幕:触屏', '', 0, 0, 0, 0, 0, ''),
(119, 136, 0, 51, '华为 HUAWEI Mate 8 4GB+64GB版 全网通（香槟金）', 'TP0000051', 1, '3699.00', '3699.00', '0.00', '3625.02', 0, '11_13_21', '网络:4G 内存:16G 屏幕:触屏', '', 0, 0, 0, 0, 0, ''),
(191, 190, 0, 50, '华为 HUAWEI 畅享5S 全网通 2GB RAM+16GB ROM（金色）', 'TP0000050', 2, '1299.00', '0.01', '0.00', '0.01', 0, '11_13_21_55', '网络:4G 内存:16G 屏幕:触屏 颜色:黑色', '', 0, 0, 0, 1, 0, ''),
(190, 189, 0, 48, '荣耀7 双卡双待双通 移动4G版 16GB存储（冰河银）豪华套装一', 'TP0000048', 1, '2199.00', '2099.00', '0.00', '2099.00', 0, '11_13_21', '网络:4G 内存:16G 屏幕:触屏', '', 0, 0, 0, 0, 0, ''),
(116, 133, 0, 51, '华为 HUAWEI Mate 8 4GB+64GB版 全网通（香槟金）', 'TP0000051', 2, '3699.00', '3699.00', '0.00', '3625.02', 0, '11_13_21', '网络:4G 内存:16G 屏幕:触屏', '', 0, 0, 0, 0, 0, ''),
(115, 132, 0, 51, '华为 HUAWEI Mate 8 4GB+64GB版 全网通（香槟金）', 'TP0000051', 1, '3699.00', '3699.00', '0.00', '3625.02', 0, '11_13_21', '网络:4G 内存:16G 屏幕:触屏', '', 0, 0, 0, 0, 0, ''),
(114, 131, 0, 51, '华为 HUAWEI Mate 8 4GB+64GB版 全网通（香槟金）', 'TP0000051', 1, '3699.00', '3699.00', '0.00', '3625.02', 0, '11_13_21', '网络:4G 内存:16G 屏幕:触屏', '', 0, 0, 0, 0, 0, ''),
(113, 130, 0, 51, '华为 HUAWEI Mate 8 4GB+64GB版 全网通（香槟金）', 'TP0000051', 2, '3699.00', '3699.00', '0.00', '3625.02', 0, '12_13_21', '网络:3G 内存:16G 屏幕:触屏', '', 0, 0, 0, 0, 0, ''),
(112, 130, 0, 51, '华为 HUAWEI Mate 8 4GB+64GB版 全网通（香槟金）', 'TP0000051', 1, '3699.00', '3699.00', '0.00', '3625.02', 0, '11_13_21', '网络:4G 内存:16G 屏幕:触屏', '', 0, 0, 0, 0, 0, ''),
(111, 130, 0, 51, '华为 HUAWEI Mate 8 4GB+64GB版 全网通（香槟金）', 'TP0000051', 3, '3699.00', '4000.00', '0.00', '3920.00', 0, '11_14_21', '网络:4G 内存:8G 屏幕:触屏', '', 0, 0, 0, 0, 0, ''),
(110, 129, 0, 103, '珂兰钻石 18K金90分效果群镶钻石戒指 倾城 需定制', 'TP0000103', 1, '1999.00', '0.01', '0.00', '0.01', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(109, 128, 0, 103, '珂兰钻石 18K金90分效果群镶钻石戒指 倾城 需定制', 'TP0000103', 1, '1999.00', '0.01', '0.00', '0.01', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(108, 127, 0, 103, '珂兰钻石 18K金90分效果群镶钻石戒指 倾城 需定制', 'TP0000103', 1, '1999.00', '0.01', '0.00', '0.01', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(107, 126, 0, 103, '珂兰钻石 18K金90分效果群镶钻石戒指 倾城 需定制', 'TP0000103', 1, '1999.00', '0.01', '0.00', '0.01', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(106, 125, 0, 103, '珂兰钻石 18K金90分效果群镶钻石戒指 倾城 需定制', 'TP0000103', 1, '1999.00', '0.01', '0.00', '0.01', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(105, 124, 0, 103, '珂兰钻石 18K金90分效果群镶钻石戒指 倾城 需定制', 'TP0000103', 1, '1999.00', '0.01', '0.00', '0.01', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(104, 123, 0, 1, '荣耀 畅玩46', 'TP000000', 1, '1665.60', '0.01', '0.00', '0.01', 0, '3_29', '颜色2:绿色 尺码:L2', '012', 0, 0, 0, 1, 14, ''),
(54, 80, 0, 1, '荣耀 畅玩46', 'ECS000000', 4, '1665.60', '200.00', '0.00', '0.00', 100, '4_18', '尺码:S 颜色2:蓝色', '002', 0, 0, 0, 0, 0, ''),
(55, 80, 0, 1, '荣耀 畅玩46', 'ECS000000', 3, '1665.60', '300.00', '0.00', '0.00', 50, '3_4', '颜色2:绿色 尺码:S', '003', 0, 0, 0, 0, 0, ''),
(56, 81, 0, 1, '荣耀 畅玩46', 'ECS000000', 1, '1665.60', '1000.00', '0.00', '0.00', 0, '18_29', '颜色2:蓝色 尺码:L2', '010', 0, 0, 0, 1, 0, ''),
(57, 82, 0, 1, '荣耀 畅玩46', 'ECS000000', 1, '1665.60', '1000.00', '0.00', '0.00', 0, '18_29', '颜色2:蓝色 尺码:L2', '010', 0, 0, 0, 0, 0, ''),
(58, 82, 0, 1, '荣耀 畅玩46', 'ECS000000', 2, '1665.60', '200.00', '0.00', '0.00', 0, '4_18', '尺码:S 颜色2:蓝色', '002', 0, 0, 0, 0, 0, ''),
(59, 83, 0, 1, '荣耀 畅玩46', 'ECS000000', 1, '1665.60', '1000.00', '0.00', '0.00', 0, '18_29', '颜色2:蓝色 尺码:L2', '010', 0, 0, 0, 0, 0, ''),
(60, 83, 0, 1, '荣耀 畅玩46', 'ECS000000', 2, '1665.60', '200.00', '0.00', '0.00', 0, '4_18', '尺码:S 颜色2:蓝色', '002', 0, 0, 0, 0, 0, ''),
(61, 83, 0, 1, '荣耀 畅玩46', 'ECS000000', 2, '1665.60', '300.00', '0.00', '0.00', 0, '3_4', '颜色2:绿色 尺码:S', '003', 0, 0, 0, 0, 0, ''),
(62, 84, 0, 1, '荣耀 畅玩46', 'ECS000000', 1, '1665.60', '1000.00', '0.00', '0.00', 0, '18_29', '颜色2:蓝色 尺码:L2', '010', 0, 0, 0, 0, 0, ''),
(63, 84, 0, 1, '荣耀 畅玩46', 'ECS000000', 2, '1665.60', '200.00', '0.00', '0.00', 0, '4_18', '尺码:S 颜色2:蓝色', '002', 0, 0, 0, 0, 0, ''),
(64, 84, 0, 1, '荣耀 畅玩46', 'ECS000000', 2, '1665.60', '300.00', '0.00', '0.00', 0, '3_4', '颜色2:绿色 尺码:S', '003', 0, 0, 0, 0, 0, ''),
(65, 84, 0, 1, '荣耀 畅玩46', 'ECS000000', 2, '1665.60', '200.00', '0.00', '0.00', 0, '4_18', '尺码:S 颜色2:蓝色', '002', 0, 0, 0, 0, 0, ''),
(66, 85, 0, 1, '荣耀 畅玩46', 'ECS000000', 1, '1665.60', '1000.00', '0.00', '0.00', 0, '18_29', '颜色2:蓝色 尺码:L2', '010', 0, 0, 0, 0, 0, ''),
(67, 86, 0, 1, '荣耀 畅玩46', 'ECS000000', 1, '1665.60', '1000.00', '0.00', '0.00', 0, '18_29', '颜色2:蓝色 尺码:L2', '010', 0, 0, 0, 0, 0, ''),
(68, 87, 0, 1, '荣耀 畅玩46', 'ECS000000', 11, '1665.60', '1000.00', '0.00', '0.00', 0, '18_29', '颜色2:蓝色 尺码:L2', '010', 0, 0, 0, 0, 0, ''),
(69, 88, 0, 1, '荣耀 畅玩46', 'ECS000000', 11, '1665.60', '1000.00', '0.00', '0.00', 0, '18_29', '颜色2:蓝色 尺码:L2', '010', 0, 0, 0, 0, 0, ''),
(70, 89, 0, 1, '荣耀 畅玩46', 'ECS000000', 11, '1665.60', '1000.00', '0.00', '0.00', 0, '18_29', '颜色2:蓝色 尺码:L2', '010', 0, 0, 0, 0, 0, ''),
(71, 90, 0, 1, '荣耀 畅玩46', 'ECS000000', 11, '1665.60', '1000.00', '0.00', '0.00', 0, '18_29', '颜色2:蓝色 尺码:L2', '010', 0, 0, 0, 0, 0, ''),
(72, 91, 0, 1, '荣耀 畅玩46', 'ECS000000', 11, '1665.60', '1000.00', '0.00', '0.00', 0, '18_29', '颜色2:蓝色 尺码:L2', '010', 0, 0, 0, 0, 0, ''),
(73, 92, 0, 1, '荣耀 畅玩46', 'ECS000000', 11, '1665.60', '1000.00', '0.00', '0.00', 0, '18_29', '颜色2:蓝色 尺码:L2', '010', 0, 0, 0, 0, 0, ''),
(74, 93, 0, 1, '荣耀 畅玩46', 'ECS000000', 11, '1665.60', '1000.00', '0.00', '0.00', 0, '18_29', '颜色2:蓝色 尺码:L2', '010', 0, 0, 0, 0, 0, ''),
(75, 94, 0, 1, '荣耀 畅玩46', 'ECS000000', 11, '1665.60', '1000.00', '0.00', '0.00', 0, '18_29', '颜色2:蓝色 尺码:L2', '010', 0, 0, 0, 0, 0, ''),
(76, 95, 0, 1, '荣耀 畅玩46', 'ECS000000', 11, '1665.60', '1000.00', '0.00', '0.00', 0, '18_29', '颜色2:蓝色 尺码:L2', '010', 0, 0, 0, 0, 0, ''),
(77, 96, 0, 1, '荣耀 畅玩46', 'ECS000000', 11, '1665.60', '1000.00', '0.00', '0.00', 0, '18_29', '颜色2:蓝色 尺码:L2', '010', 0, 0, 0, 0, 0, ''),
(79, 97, 0, 1, '荣耀 畅玩46', 'ECS000000', 2, '1665.60', '0.03', '0.00', '0.00', 0, '3_4', '颜色2:绿色 尺码:S', '003', 0, 0, 0, 0, 0, ''),
(103, 122, 0, 1, '荣耀 畅玩46', 'ECS000000', 1, '1665.60', '0.01', '0.00', '0.01', 0, '1_5', '颜色2:红色 尺码:M', '005', 0, 0, 0, 0, 0, ''),
(81, 98, 0, 1, '荣耀 畅玩46', 'ECS000000', 1, '1665.60', '0.03', '0.00', '0.00', 0, '3_4', '颜色2:绿色 尺码:S', '003', 0, 0, 0, 0, 0, ''),
(82, 98, 0, 1, '荣耀 畅玩46', 'ECS000000', 2, '1665.60', '0.01', '0.00', '0.00', 0, '1_4', '颜色2:红色 尺码:S', '001', 0, 0, 0, 0, 0, ''),
(83, 99, 0, 1, '荣耀 畅玩46', 'ECS000000', 1, '1665.60', '0.05', '0.00', '0.00', 0, '1_5', '颜色2:红色 尺码:M', '005', 0, 0, 0, 0, 0, ''),
(84, 100, 0, 1, '荣耀 畅玩46', 'ECS000000', 1, '1665.60', '0.01', '0.00', '0.00', 0, '1_5', '颜色2:红色 尺码:M', '005', 0, 0, 0, 0, 0, ''),
(85, 101, 0, 1, '荣耀 畅玩46', 'ECS000000', 1, '1665.60', '0.02', '0.00', '0.00', 0, '4_18', '尺码:S 颜色2:蓝色', '002', 0, 0, 0, 0, 0, ''),
(86, 102, 0, 1, '荣耀 畅玩46', 'ECS000000', 1, '1665.60', '0.02', '0.00', '0.00', 0, '4_18', '尺码:S 颜色2:蓝色', '002', 0, 0, 0, 0, 0, ''),
(87, 103, 0, 1, '荣耀 畅玩46', 'ECS000000', 1, '1665.60', '0.03', '0.00', '0.00', 0, '3_4', '颜色2:绿色 尺码:S', '003', 0, 0, 0, 0, 0, ''),
(88, 104, 0, 1, '荣耀 畅玩46', 'ECS000000', 1, '1665.60', '0.02', '0.00', '0.00', 0, '4_18', '尺码:S 颜色2:蓝色', '002', 0, 0, 0, 0, 0, ''),
(89, 105, 0, 1, '荣耀 畅玩46', 'ECS000000', 1, '1665.60', '0.01', '0.00', '0.00', 0, '1_5', '颜色2:红色 尺码:M', '005', 0, 0, 0, 0, 0, ''),
(90, 106, 0, 1, '荣耀 畅玩46', 'ECS000000', 1, '1665.60', '0.01', '0.00', '0.00', 0, '1_5', '颜色2:红色 尺码:M', '005', 0, 0, 0, 0, 0, ''),
(91, 107, 0, 1, '荣耀 畅玩46', 'ECS000000', 1, '1665.60', '0.01', '0.00', '0.00', 0, '4_18', '尺码:S 颜色2:蓝色', '002', 0, 0, 0, 0, 0, ''),
(92, 108, 0, 1, '荣耀 畅玩46', 'ECS000000', 1, '1665.60', '0.01', '0.00', '0.00', 0, '1_5', '颜色2:红色 尺码:M', '005', 0, 0, 0, 0, 0, ''),
(93, 109, 0, 1, '荣耀 畅玩46', 'ECS000000', 1, '1665.60', '0.01', '0.00', '0.00', 0, '4_18', '尺码:S 颜色2:蓝色', '002', 0, 0, 0, 0, 0, ''),
(94, 110, 0, 1, '荣耀 畅玩46', 'ECS000000', 1, '1665.60', '0.01', '0.00', '0.00', 0, '4_18', '尺码:S 颜色2:蓝色', '002', 0, 0, 0, 0, 0, ''),
(95, 111, 0, 1, '荣耀 畅玩46', 'ECS000000', 1, '1665.60', '0.01', '0.00', '0.00', 0, '3_29', '颜色2:绿色 尺码:L2', '012', 0, 0, 0, 0, 0, ''),
(96, 112, 0, 1, '荣耀 畅玩46', 'ECS000000', 1, '1665.60', '0.01', '0.00', '0.00', 0, '3_4', '颜色2:绿色 尺码:S', '003', 0, 0, 0, 0, 0, ''),
(97, 113, 0, 1, '荣耀 畅玩46', 'ECS000000', 1, '1665.60', '0.01', '0.00', '0.00', 0, '1_5', '颜色2:红色 尺码:M', '005', 0, 0, 0, 0, 0, ''),
(98, 114, 0, 1, '荣耀 畅玩46', 'ECS000000', 1, '1665.60', '0.01', '0.00', '0.00', 0, '3_4', '颜色2:绿色 尺码:S', '003', 0, 0, 0, 0, 0, ''),
(99, 115, 0, 1, '荣耀 畅玩46', 'ECS000000', 1, '1665.60', '0.01', '0.00', '0.00', 0, '3_29', '颜色2:绿色 尺码:L2', '012', 0, 0, 0, 0, 0, ''),
(100, 116, 0, 1, '荣耀 畅玩46', 'ECS000000', 1, '1665.60', '0.01', '0.00', '0.00', 0, '1_5', '颜色2:红色 尺码:M', '005', 0, 0, 0, 0, 0, ''),
(101, 117, 0, 1, '荣耀 畅玩46', 'ECS000000', 1, '1665.60', '0.01', '0.00', '0.00', 0, '3_4', '颜色2:绿色 尺码:S', '003', 0, 0, 0, 0, 0, ''),
(102, 118, 0, 1, '荣耀 畅玩46', 'ECS000000', 1, '1665.60', '0.01', '0.00', '0.00', 0, '1_5', '颜色2:红色 尺码:M', '005', 0, 0, 0, 0, 0, ''),
(126, 143, 0, 50, '华为 HUAWEI 畅享5S 全网通 2GB RAM+16GB ROM（金色）', 'TP0000050', 1, '1199.00', '1199.00', '0.00', '1175.02', 0, '11_13_21_55', '网络:4G 内存:16G 屏幕:触屏 颜色:黑色', '', 0, 0, 0, 0, 0, ''),
(127, 144, 0, 48, '荣耀7 双卡双待双通 移动4G版 16GB存储（冰河银）豪华套装一', 'TP0000048', 1, '2099.00', '2099.00', '0.00', '2057.02', 0, '11_13_21', '网络:4G 内存:16G 屏幕:触屏', '', 0, 0, 0, 0, 0, ''),
(128, 145, 0, 50, '华为 HUAWEI 畅享5S 全网通 2GB RAM+16GB ROM（金色）', 'TP0000050', 1, '1199.00', '1199.00', '0.00', '1175.02', 0, '11_13_21_55', '网络:4G 内存:16G 屏幕:触屏 颜色:黑色', '', 0, 0, 0, 0, 0, ''),
(129, 146, 0, 50, '华为 HUAWEI 畅享5S 全网通 2GB RAM+16GB ROM（金色）', 'TP0000050', 1, '1199.00', '1199.00', '0.00', '1175.02', 0, '11_13_21_55', '网络:4G 内存:16G 屏幕:触屏 颜色:黑色', '', 0, 0, 0, 0, 0, ''),
(130, 147, 0, 48, '荣耀7 双卡双待双通 移动4G版 16GB存储（冰河银）豪华套装一', 'TP0000048', 1, '2099.00', '2099.00', '0.00', '2057.02', 0, '11_13_21', '网络:4G 内存:16G 屏幕:触屏', '', 0, 0, 0, 0, 0, ''),
(131, 148, 0, 50, '华为 HUAWEI 畅享5S 全网通 2GB RAM+16GB ROM（金色）', 'TP0000050', 3, '1199.00', '1199.00', '0.00', '1175.02', 0, '11_13_21_55', '网络:4G 内存:16G 屏幕:触屏 颜色:黑色', '', 0, 0, 0, 0, 0, ''),
(132, 148, 0, 51, '华为 HUAWEI Mate 8 4GB+64GB版 全网通（香槟金）', 'TP0000051', 1, '3699.00', '3699.00', '0.00', '3625.02', 0, '11_13_21', '网络:4G 内存:16G 屏幕:触屏', '', 0, 0, 0, 0, 0, ''),
(133, 149, 0, 48, '荣耀7 双卡双待双通 移动4G版 16GB存储（冰河银）豪华套装一', 'TP0000048', 5, '2099.00', '2099.00', '0.00', '2057.02', 0, '11_13_21', '网络:4G 内存:16G 屏幕:触屏', '', 0, 0, 0, 0, 0, ''),
(134, 150, 0, 51, '华为 HUAWEI Mate 8 4GB+64GB版 全网通（香槟金）', 'TP0000051', 1, '3699.00', '4000.00', '0.00', '3920.00', 0, '11_14_21', '网络:4G 内存:8G 屏幕:触屏', '', 0, 0, 0, 0, 0, ''),
(135, 150, 0, 51, '华为 HUAWEI Mate 8 4GB+64GB版 全网通（香槟金）', 'TP0000051', 1, '3699.00', '5000.00', '0.00', '4900.00', 0, '11_21_28', '网络:4G 屏幕:触屏 内存:32G', '', 0, 0, 0, 0, 0, ''),
(136, 150, 0, 103, '珂兰钻石 18K金90分效果群镶钻石戒指 倾城 需定制', 'TP0000103', 1, '1999.00', '10.00', '0.00', '9.80', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(137, 151, 0, 51, '华为 HUAWEI Mate 8 4GB+64GB版 全网通（香槟金）', 'TP0000051', 2, '3699.00', '3699.00', '0.00', '3625.02', 0, '11_13_21', '网络:4G 内存:16G 屏幕:触屏', '', 0, 0, 0, 0, 0, ''),
(138, 152, 0, 1, 'Apple iPhone 6s Plus 16G 玫瑰金 移动联通电信4G手机', 'TP000000', 1, '8000.00', '100.00', '0.00', '100.00', 0, '13_55', '内存:16G 颜色:黑色', '0001', 0, 0, 0, 0, 0, ''),
(139, 153, 0, 90, '迪奥迪奥小 姐花漾淡香氛5ml', 'TP0000090', 1, '59.00', '0.01', '0.00', '0.01', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(140, 154, 0, 51, '华为 HUAWEI Mate 8 4GB+64GB版 全网通（香槟金）', 'TP0000051', 2, '3699.00', '4000.00', '0.00', '3920.00', 0, '12_14_21', '网络:3G 内存:8G 屏幕:触屏', '', 0, 0, 0, 0, 0, ''),
(141, 154, 0, 51, '华为 HUAWEI Mate 8 4GB+64GB版 全网通（香槟金）', 'TP0000051', 1, '3699.00', '5000.00', '0.00', '4900.00', 0, '11_21_28', '网络:4G 屏幕:触屏 内存:32G', '', 0, 0, 0, 0, 0, ''),
(142, 154, 0, 51, '华为 HUAWEI Mate 8 4GB+64GB版 全网通（香槟金）', 'TP0000051', 1, '3699.00', '4000.00', '0.00', '3920.00', 0, '11_14_21', '网络:4G 内存:8G 屏幕:触屏', '', 0, 0, 0, 0, 0, ''),
(143, 154, 0, 1, 'Apple iPhone 6s Plus 16G 玫瑰金 移动联通电信4G手机', 'TP000000', 1, '8000.00', '100.00', '0.00', '100.00', 0, '28_100', '内存:32G 颜色:玫瑰金', '0006', 0, 0, 0, 0, 0, ''),
(144, 155, 0, 1, 'Apple iPhone 6s Plus 16G 玫瑰金 移动联通电信4G手机', 'TP000000', 1, '8000.00', '100.00', '0.00', '100.00', 0, '13_99', '内存:16G 颜色:银色', '0002', 0, 0, 0, 0, 0, ''),
(145, 155, 0, 51, '华为 HUAWEI Mate 8 4GB+64GB版 全网通（香槟金）', 'TP0000051', 1, '3699.00', '3699.00', '0.00', '3625.02', 0, '11_13_21', '网络:4G 内存:16G 屏幕:触屏', '', 0, 0, 0, 0, 0, ''),
(146, 155, 0, 51, '华为 HUAWEI Mate 8 4GB+64GB版 全网通（香槟金）', 'TP0000051', 2, '3699.00', '3699.00', '0.00', '3625.02', 0, '11_13_21', '网络:4G 内存:16G 屏幕:触屏', '', 0, 0, 0, 0, 0, ''),
(147, 156, 0, 104, '小米手机5,十余项黑科技，很轻狠快', 'TP0000104', 1, '2500.00', '2200.00', '0.00', '2156.00', 0, '56_102', '颜色:白色 内存:128G', 'xm0006', 0, 0, 0, 0, 0, ''),
(148, 156, 0, 104, '小米手机5,十余项黑科技，很轻狠快', 'TP0000104', 1, '2500.00', '2100.00', '0.00', '2058.00', 0, '55_101', '颜色:黑色 内存:64G', 'xm0002', 0, 0, 0, 0, 0, ''),
(149, 157, 0, 104, '小米手机5,十余项黑科技，很轻狠快', 'TP0000104', 1, '2500.00', '0.01', '0.00', '0.01', 0, '28_55', '内存:32G 颜色:黑色', 'xm0001', 0, 0, 0, 0, 0, ''),
(150, 158, 0, 104, '小米手机5,十余项黑科技，很轻狠快', 'TP0000104', 1, '2500.00', '0.01', '0.00', '0.01', 0, '28_55', '内存:32G 颜色:黑色', 'xm0001', 0, 0, 0, 0, 0, ''),
(151, 159, 0, 104, '小米手机5,十余项黑科技，很轻狠快', 'TP0000104', 1, '2500.00', '0.01', '0.00', '0.01', 0, '28_55', '内存:32G 颜色:黑色', 'xm0001', 0, 0, 0, 0, 0, ''),
(152, 160, 0, 104, '小米手机5,十余项黑科技，很轻狠快', 'TP0000104', 1, '2500.00', '0.01', '0.00', '0.01', 0, '28_55', '内存:32G 颜色:黑色', 'xm0001', 0, 0, 0, 0, 0, ''),
(153, 161, 0, 104, '小米手机5,十余项黑科技，很轻狠快', 'TP0000104', 1, '2500.00', '0.01', '0.00', '0.01', 0, '28_55', '内存:32G 颜色:黑色', 'xm0001', 1, 0, 0, 0, 0, ''),
(154, 162, 0, 104, '小米手机5,十余项黑科技，很轻狠快', 'TP0000104', 2, '2500.00', '0.01', '0.00', '0.01', 0, '28_56', '内存:32G 颜色:白色', 'xm0004', 0, 0, 0, 0, 0, ''),
(155, 163, 0, 104, '小米手机5,十余项黑科技，很轻狠快', 'TP0000104', 2, '2500.00', '0.01', '0.00', '0.01', 0, '28_55', '内存:32G 颜色:黑色', 'xm0001', 0, 0, 0, 0, 0, ''),
(156, 164, 0, 49, '荣耀畅玩5X 双卡双待 移动版 智能手机（破晓银）', 'TP0000049', 1, '1000.00', '100.00', '0.00', '100.00', 0, '11_13_21', '网络:4G 内存:16G 屏幕:触屏', '', 0, 0, 0, 0, 0, ''),
(157, 164, 0, 103, '珂兰钻石 18K金90分效果群镶钻石戒指 倾城 需定制', 'TP0000103', 1, '1999.00', '95.00', '0.00', '95.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(158, 165, 0, 104, '小米手机5,十余项黑科技，很轻狠快', 'TP0000104', 1, '2500.00', '2100.00', '0.00', '2058.00', 0, '55_101', '颜色:黑色 内存:64G', 'xm0002', 0, 0, 0, 0, 0, ''),
(159, 166, 0, 103, '珂兰钻石 18K金90分效果群镶钻石戒指 倾城 需定制', 'TP0000103', 1, '1999.00', '95.00', '0.00', '95.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(160, 166, 0, 45, '华为 HUAWEI C199S 麦芒3S 电信4G智能手机FDD-LTE /TD-LTE/CDMA2000/GSM（麦芒金）', 'TP0000045', 3, '2000.00', '1999.00', '0.00', '1959.02', 0, '11_13_21', '网络:4G 内存:16G 屏幕:触屏', '', 0, 0, 0, 0, 0, ''),
(161, 167, 0, 45, '华为 HUAWEI C199S 麦芒3S 电信4G智能手机FDD-LTE /TD-LTE/CDMA2000/GSM（麦芒金）', 'TP0000045', 1, '2000.00', '1999.00', '0.00', '1959.02', 0, '11_13_21', '网络:4G 内存:16G 屏幕:触屏', '', 0, 0, 0, 0, 0, ''),
(162, 168, 0, 103, '珂兰钻石 18K金90分效果群镶钻石戒指 倾城 需定制', 'TP0000103', 1, '1999.00', '95.00', '0.00', '95.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(163, 169, 0, 45, '华为 HUAWEI C199S 麦芒3S 电信4G智能手机FDD-LTE /TD-LTE/CDMA2000/GSM（麦芒金）', 'TP0000045', 1, '2000.00', '1999.00', '0.00', '1959.02', 0, '11_13_21', '网络:4G 内存:16G 屏幕:触屏', '', 0, 0, 0, 0, 0, ''),
(164, 170, 0, 45, '华为 HUAWEI C199S 麦芒3S 电信4G智能手机FDD-LTE /TD-LTE/CDMA2000/GSM（麦芒金）', 'TP0000045', 1, '2000.00', '2000.00', '0.00', '2000.00', 0, '11_21_28', '网络:4G 屏幕:触屏 内存:32G', '', 0, 0, 0, 0, 0, ''),
(165, 171, 0, 1, 'Apple iPhone 6s Plus 16G 玫瑰金 移动联通电信4G手机', 'TP000000', 2, '8000.00', '100.00', '0.00', '100.00', 0, '28_100', '内存:32G 颜色:玫瑰金', '0006', 0, 0, 0, 1, 7, ''),
(166, 172, 0, 1, 'Apple iPhone 6s Plus 16G 玫瑰金 移动联通电信4G手机', 'TP000000', 3, '8000.00', '100.00', '0.00', '100.00', 0, '13_100', '内存:16G 颜色:玫瑰金', '0003', 0, 0, 0, 0, 0, ''),
(167, 172, 0, 47, '【联通合约机 50元本地套餐】荣耀畅玩5X 双卡双待 增强全网通版 智能手机（落日金）', 'TP0000047', 2, '1400.00', '1399.00', '0.00', '1371.02', 0, '11_13_21', '网络:4G 内存:16G 屏幕:触屏', '', 0, 0, 0, 0, 0, ''),
(173, 177, 0, 45, '华为 HUAWEI C199S 麦芒3S 电信4G智能手机FDD-LTE /TD-LTE/CDMA2000/GSM（麦芒金）', 'TP0000045', 6, '2000.00', '1999.00', '0.00', '1959.02', 0, '11_13_21', '网络:4G 内存:16G 屏幕:触屏', '', 0, 0, 0, 1, 6, ''),
(172, 176, 0, 104, '小米手机5,十余项黑科技，很轻狠快', 'TP0000104', 1, '2500.00', '0.01', '0.00', '0.01', 0, '28_55', '内存:32G 颜色:黑色', 'xm0001', 0, 0, 0, 1, 5, ''),
(170, 174, 0, 104, '小米手机5,十余项黑科技，很轻狠快', 'TP0000104', 1, '2500.00', '0.01', '0.00', '0.01', 0, '28_55', '内存:32G 颜色:黑色', 'xm0001', 0, 0, 0, 0, 0, ''),
(171, 175, 0, 104, '小米手机5,十余项黑科技，很轻狠快', 'TP0000104', 1, '2500.00', '0.01', '0.00', '0.01', 0, '28_55', '内存:32G 颜色:黑色', 'xm0001', 0, 0, 0, 1, 4, ''),
(174, 177, 0, 104, '小米手机5,十余项黑科技，很轻狠快', 'TP0000104', 1, '2500.00', '2100.00', '0.00', '2058.00', 0, '55_101', '颜色:黑色 内存:64G', 'xm0002', 1, 0, 0, 1, 6, ''),
(175, 178, 0, 1, 'Apple iPhone 6s Plus 16G 玫瑰金 移动联通电信4G手机', 'TP000000', 1, '8000.00', '100.00', '0.00', '100.00', 0, '13_100', '内存:16G 颜色:玫瑰金', '0003', 0, 0, 0, 0, 0, ''),
(176, 179, 0, 104, '小米手机5,十余项黑科技，很轻狠快', 'TP0000104', 17, '2500.00', '2100.00', '0.00', '2058.00', 0, '56_101', '颜色:白色 内存:64G', 'xm0005', 0, 0, 0, 0, 0, ''),
(177, 180, 0, 93, 'CHANEL香奈儿 绿色邂逅 清新气息机会女士香水 EDT 35ML 进口', 'TP0000093', 1, '290.00', '0.01', '0.00', '0.01', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(178, 181, 0, 93, 'CHANEL香奈儿 绿色邂逅 清新气息机会女士香水 EDT 35ML 进口', 'TP0000093', 1, '290.00', '0.01', '0.00', '0.01', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(179, 182, 0, 93, 'CHANEL香奈儿 绿色邂逅 清新气息机会女士香水 EDT 35ML 进口', 'TP0000093', 1, '290.00', '0.01', '0.00', '0.01', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(180, 183, 0, 93, 'CHANEL香奈儿 绿色邂逅 清新气息机会女士香水 EDT 35ML 进口', 'TP0000093', 1, '290.00', '0.01', '0.00', '0.01', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(181, 184, 0, 103, '珂兰钻石 18K金90分效果群镶钻石戒指 倾城 需定制', 'TP0000103', 7, '1999.00', '95.00', '0.00', '95.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(182, 184, 0, 1, 'Apple iPhone 6s Plus 16G 玫瑰金 移动联通电信4G手机', 'TP000000', 3, '8000.00', '100.00', '0.00', '100.00', 0, '28_100', '内存:32G 颜色:玫瑰金', '0006', 0, 0, 0, 0, 0, ''),
(183, 184, 0, 100, '金地珠宝足金花之恋金花3D硬金吊坠优雅大方时尚百搭唯美花朵黄金吊坠项坠', 'TP0000100', 2, '1405.00', '1300.00', '0.00', '1300.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(184, 184, 0, 101, '六福珠宝足金百搭满天星链黄金项链女2015新款(计价)B01TBGN0009', 'TP0000101', 1, '1027.00', '1027.00', '0.00', '1027.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(185, 185, 0, 93, 'CHANEL香奈儿 绿色邂逅 清新气息机会女士香水 EDT 35ML 进口', 'TP0000093', 1, '290.00', '0.01', '0.00', '0.01', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(186, 186, 0, 48, '荣耀7 双卡双待双通 移动4G版 16GB存储（冰河银）豪华套装一', 'TP0000048', 1, '2099.00', '2099.00', '0.00', '2099.00', 0, '11_13_21', '网络:4G 内存:16G 屏幕:触屏', '', 0, 0, 0, 0, 0, ''),
(187, 186, 0, 66, '迎馨家纺全棉斜纹印花双人四件套邂逅 AB版纯棉，亲肤透气', 'TP0000066', 1, '110.00', '110.00', '0.00', '110.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(188, 187, 0, 48, '荣耀7 双卡双待双通 移动4G版 16GB存储（冰河银）豪华套装一', 'TP0000048', 1, '2099.00', '2099.00', '0.00', '2099.00', 0, '11_13_21', '网络:4G 内存:16G 屏幕:触屏', '', 0, 0, 0, 0, 0, ''),
(189, 188, 0, 56, '创维（skyworth）55M5 55英寸4K超高清网络智能液晶电视机', 'TP0000056', 3, '7999.00', '2399.00', '0.00', '2351.02', 0, '65', '尺寸:42', '', 0, 0, 0, 0, 0, ''),
(193, 192, 0, 50, '华为 HUAWEI 畅享5S 全网通 2GB RAM+16GB ROM（金色）', 'TP0000050', 1, '1299.00', '0.01', '0.00', '0.01', 0, '11_13_21_55', '网络:4G 内存:16G 屏幕:触屏 颜色:黑色', '', 0, 0, 0, 0, 0, ''),
(194, 193, 0, 50, '华为 HUAWEI 畅享5S 全网通 2GB RAM+16GB ROM（金色）', 'TP0000050', 6, '1299.00', '0.01', '0.00', '0.01', 0, '11_13_21_55', '网络:4G 内存:16G 屏幕:触屏 颜色:黑色', '', 0, 0, 0, 0, 0, ''),
(195, 195, 0, 77, '红衣主角2015冬装新款走秀款大气简约黄色羊毛呢大衣.', 'TP0000077', 1, '499.00', '299.00', '0.00', '299.00', 0, '77', '尺码:S', '', 0, 0, 0, 0, 0, ''),
(196, 194, 0, 103, '珂兰钻石 18K金90分效果群镶钻石戒指 倾城 需定制', 'TP0000103', 1, '2099.00', '95.00', '0.00', '95.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(197, 196, 0, 103, '珂兰钻石 18K金90分效果群镶钻石戒指 倾城 需定制', 'TP0000103', 1, '2099.00', '95.00', '0.00', '95.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(198, 196, 0, 1, 'Apple iPhone 6s Plus 16G 玫瑰金 移动联通电信4G手机', 'TP000000', 1, '6100.00', '100.00', '0.00', '100.00', 0, '13_99', '内存:16G 颜色:银色', '0002', 0, 0, 0, 0, 0, ''),
(199, 196, 0, 142, '海尔（Haier）BCD-251WDGW 251升 无霜两门冰箱（白色）', 'TP0000142', 1, '2799.00', '2699.00', '0.00', '2645.02', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(200, 197, 0, 104, '小米手机5,十余项黑科技，很轻狠快', 'TP0000104', 1, '2099.00', '1999.00', '0.00', '1959.02', 0, '28_57', '内存:32G 颜色:金色', 'xm0007', 0, 0, 0, 1, 9, ''),
(201, 197, 0, 77, '红衣主角2015冬装新款走秀款大气简约黄色羊毛呢大衣.', 'TP0000077', 1, '499.00', '299.00', '0.00', '299.00', 0, '77', '尺码:S', '', 0, 0, 0, 2, 8, ''),
(202, 198, 0, 1, 'Apple iPhone 6s Plus 16G 玫瑰金 移动联通电信4G手机', 'TP000000', 1, '6100.00', '100.00', '0.00', '100.00', 0, '28_100', '内存:32G 颜色:玫瑰金', '0006', 0, 0, 0, 0, 0, ''),
(203, 199, 0, 49, '荣耀畅玩5X 双卡双待 移动版 智能手机（破晓银）', 'TP0000049', 1, '1099.00', '100.00', '0.00', '100.00', 0, '11_13_21', '网络:4G 内存:16G 屏幕:触屏', '', 0, 0, 0, 0, 0, ''),
(204, 200, 0, 104, '小米手机5,十余项黑科技，很轻狠快', 'TP0000104', 1, '2099.00', '1999.00', '0.00', '1959.02', 0, '28_57', '内存:32G 颜色:金色', 'xm0007', 0, 0, 0, 1, 10, ''),
(205, 201, 0, 46, '【北京移动老用户专享 话费六折】荣耀畅玩5X 双卡双待 移动版 智能手机（破晓银）', 'TP0000046', 1, '1099.00', '999.00', '0.00', '979.02', 0, '11_13_21', '网络:4G 内存:16G 屏幕:触屏', '', 1, 0, 0, 1, 11, ''),
(206, 202, 0, 45, '华为 HUAWEI C199S 麦芒3S 电信4G智能手机FDD-LTE /TD-LTE/CDMA2000/GSM（麦芒金）', 'TP0000045', 1, '2099.00', '1999.00', '0.00', '1959.02', 0, '11_13_21', '网络:4G 内存:16G 屏幕:触屏', '', 0, 0, 0, 0, 0, ''),
(207, 202, 0, 53, '华为 HUAWEI MediaQ M330 华为盒子 4K极清网络机顶盒（黑色）', 'TP0000053', 1, '449.00', '300.00', '0.00', '300.00', 0, '61', '颜色:黑色', '', 0, 0, 0, 0, 0, ''),
(208, 202, 0, 1, 'Apple iPhone 6s Plus 16G 玫瑰金 移动联通电信4G手机', 'TP000000', 1, '6100.00', '100.00', '0.00', '100.00', 0, '28_100', '内存:32G 颜色:玫瑰金', '0006', 0, 0, 0, 0, 0, ''),
(209, 202, 0, 39, '华为（HUAWEI） M2 10.0 平板电脑 WiFi 月光银', 'TP0000039', 1, '2388.00', '2500.00', '0.00', '2450.00', 0, '42_47_51', '尺寸:7.8-9寸 内存:16G 颜色:银白色', '00002', 0, 0, 0, 0, 0, ''),
(210, 203, 0, 1, 'Apple iPhone 6s Plus 16G 玫瑰金 移动联通电信4G手机', 'TP000000', 1, '6100.00', '100.00', '0.00', '100.00', 0, '28_100', '内存:32G 颜色:玫瑰金', '0006', 0, 0, 0, 0, 0, ''),
(211, 204, 0, 53, '华为 HUAWEI MediaQ M330 华为盒子 4K极清网络机顶盒（黑色）', 'TP0000053', 1, '449.00', '300.00', '0.00', '300.00', 0, '61', '颜色:黑色', '', 0, 0, 0, 0, 0, ''),
(212, 205, 0, 53, '华为 HUAWEI MediaQ M330 华为盒子 4K极清网络机顶盒（黑色）', 'TP0000053', 2, '449.00', '300.00', '0.00', '300.00', 0, '61', '颜色:黑色', '', 0, 0, 0, 1, 0, ''),
(213, 205, 0, 59, '酷开(coocaa) K50 50英寸智能网络液晶平板电视 酷开系统WiFi', 'TP0000059', 1, '2599.00', '2100.00', '0.00', '2100.00', 0, '67', '尺寸:55', '', 0, 0, 0, 1, 0, ''),
(214, 206, 0, 1, 'Apple iPhone 6s Plus 16G 玫瑰金 移动联通电信4G手机', 'TP000000', 1, '6100.00', '100.00', '0.00', '100.00', 0, '28_100', '内存:32G 颜色:玫瑰金', '0006', 0, 0, 0, 0, 0, ''),
(215, 207, 0, 59, '酷开(coocaa) K50 50英寸智能网络液晶平板电视 酷开系统WiFi', 'TP0000059', 2, '2599.00', '2100.00', '0.00', '2100.00', 0, '67', '尺寸:55', '', 0, 0, 0, 0, 0, ''),
(216, 208, 0, 131, '【蚂蚁摄影】单反外观Sony/索尼 DSC-H400高清长焦射月数码照相机', 'TP0000131', 1, '1798.00', '1698.00', '0.00', '1698.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(2227, 786, 0, 29, '竹妃竹纤维抽纸(20包/箱)', '', 1, '99.00', '99.00', '0.00', '99.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(2228, 787, 0, 29, '竹妃竹纤维抽纸(20包/箱)', '', 1, '99.00', '99.00', '0.00', '99.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(218, 210, 0, 104, '小米手机5,十余项黑科技，很轻狠快', 'TP0000104', 1, '2099.00', '1999.00', '0.00', '1959.02', 0, '28_57', '内存:32G 颜色:金色', 'xm0007', 0, 0, 0, 0, 0, ''),
(219, 211, 0, 45, '华为 HUAWEI C199S 麦芒3S 电信4G智能手机FDD-LTE /TD-LTE/CDMA2000/GSM（麦芒金）', 'TP0000045', 3, '2099.00', '1999.00', '0.00', '1999.00', 0, '11_13_21', '网络:4G 内存:16G 屏幕:触屏', '', 0, 0, 0, 0, 0, ''),
(220, 212, 0, 66, '迎馨家纺全棉斜纹印花双人四件套邂逅 AB版纯棉，亲肤透气', 'TP0000066', 1, '210.00', '110.00', '0.00', '110.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(221, 212, 0, 140, 'Apple iPhone 6s 16GB 玫瑰金色 移动联通电信4G手机', 'TP0000140', 1, '4958.00', '5868.00', '0.00', '5868.00', 0, '11_13_57', '网络:4G 内存:16G 颜色:金色', '', 0, 0, 0, 0, 0, ''),
(222, 213, 0, 39, '华为（HUAWEI） M2 10.0 平板电脑 WiFi 月光银', 'TP0000039', 1, '2388.00', '2500.00', '0.00', '2500.00', 0, '42_47_51', '尺寸:7.8-9寸 内存:16G 颜色:银白色', '00002', 0, 0, 0, 0, 0, ''),
(223, 214, 0, 66, '迎馨家纺全棉斜纹印花双人四件套邂逅 AB版纯棉，亲肤透气', 'TP0000066', 1, '210.00', '110.00', '0.00', '110.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(224, 215, 0, 53, '华为 HUAWEI MediaQ M330 华为盒子 4K极清网络机顶盒（黑色）', 'TP0000053', 1, '449.00', '300.00', '0.00', '300.00', 0, '61', '颜色:黑色', '', 0, 0, 0, 0, 0, ''),
(225, 216, 0, 66, '迎馨家纺全棉斜纹印花双人四件套邂逅 AB版纯棉，亲肤透气', 'TP0000066', 1, '210.00', '110.00', '0.00', '110.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(226, 217, 0, 76, '韩文2015冬装新款女装红色双排扣配腰带毛呢大衣.', 'TP0000076', 1, '389.00', '0.02', '0.00', '0.02', 0, '79', '尺码:L', '65785', 0, 0, 0, 0, 0, ''),
(227, 218, 0, 76, '韩文2015冬装新款女装红色双排扣配腰带毛呢大衣.', 'TP0000076', 1, '389.00', '0.02', '0.00', '0.02', 0, '78', '尺码:M', '54657', 0, 0, 0, 0, 0, ''),
(228, 219, 0, 76, '韩文2015冬装新款女装红色双排扣配腰带毛呢大衣.', 'TP0000076', 1, '389.00', '0.02', '0.00', '0.02', 0, '78', '尺码:M', '54657', 0, 0, 0, 0, 0, ''),
(229, 220, 0, 76, '韩文2015冬装新款女装红色双排扣配腰带毛呢大衣.', 'TP0000076', 1, '389.00', '0.02', '0.00', '0.02', 0, '77', '尺码:S', '123456', 0, 0, 0, 0, 0, ''),
(230, 221, 0, 53, '华为 HUAWEI MediaQ M330 华为盒子 4K极清网络机顶盒（黑色）', 'TP0000053', 1, '449.00', '300.00', '0.00', '300.00', 0, '61', '颜色:黑色', '', 0, 0, 0, 0, 0, ''),
(231, 222, 0, 76, '韩文2015冬装新款女装红色双排扣配腰带毛呢大衣.', 'TP0000076', 1, '389.00', '0.02', '0.00', '0.02', 0, '79', '尺码:L', '65785', 0, 0, 0, 0, 0, ''),
(232, 223, 0, 76, '韩文2015冬装新款女装红色双排扣配腰带毛呢大衣.', 'TP0000076', 1, '389.00', '0.02', '0.00', '0.02', 0, '78', '尺码:M', '54657', 0, 0, 0, 0, 0, ''),
(233, 224, 0, 76, '韩文2015冬装新款女装红色双排扣配腰带毛呢大衣.', 'TP0000076', 1, '389.00', '0.02', '0.00', '0.02', 0, '78', '尺码:M', '54657', 0, 0, 0, 0, 0, ''),
(234, 224, 0, 48, '荣耀7 双卡双待双通 移动4G版 16GB存储（冰河银）豪华套装一', 'TP0000048', 1, '2199.00', '2099.00', '0.00', '2057.02', 0, '11_13_21', '网络:4G 内存:16G 屏幕:触屏', '', 0, 0, 0, 0, 0, ''),
(235, 225, 0, 76, '韩文2015冬装新款女装红色双排扣配腰带毛呢大衣.', 'TP0000076', 1, '389.00', '0.02', '0.00', '0.02', 0, '78', '尺码:M', '54657', 0, 0, 0, 0, 0, ''),
(236, 226, 0, 66, '迎馨家纺全棉斜纹印花双人四件套邂逅 AB版纯棉，亲肤透气', 'TP0000066', 1, '210.00', '110.00', '0.00', '110.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(237, 227, 0, 141, '三星 Galaxy A9高配版 (A9100) 精灵黑 全网通4G手机 双卡双待', 'TP0000141', 4, '3599.00', '3499.00', '0.00', '3499.00', 0, '56', '颜色:白色', '', 0, 0, 0, 0, 0, ''),
(238, 228, 0, 1, 'Apple iPhone 6s Plus 16G 玫瑰金 移动联通电信4G手机', 'TP000000', 1, '6100.00', '100.00', '0.00', '100.00', 0, '28_100', '内存:32G 颜色:玫瑰金', '0006', 0, 0, 0, 0, 0, ''),
(239, 229, 0, 66, '迎馨家纺全棉斜纹印花双人四件套邂逅 AB版纯棉，亲肤透气', 'TP0000066', 1, '210.00', '110.00', '0.00', '110.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(240, 230, 0, 103, '珂兰钻石 18K金90分效果群镶钻石戒指 倾城 需定制', 'TP0000103', 1, '2099.00', '95.00', '0.00', '95.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(241, 231, 0, 141, '三星 Galaxy A9高配版 (A9100) 精灵黑 全网通4G手机 双卡双待', 'TP0000141', 1, '3599.00', '3499.00', '0.00', '3499.00', 0, '56', '颜色:白色', '', 0, 0, 0, 0, 0, ''),
(242, 232, 0, 76, '韩文2015冬装新款女装红色双排扣配腰带毛呢大衣.', 'TP0000076', 1, '389.00', '0.02', '0.00', '0.02', 0, '79', '尺码:L', '65785', 0, 0, 0, 0, 0, ''),
(243, 233, 0, 76, '韩文2015冬装新款女装红色双排扣配腰带毛呢大衣.', 'TP0000076', 1, '389.00', '0.02', '0.00', '0.02', 0, '78', '尺码:M', '54657', 0, 0, 0, 0, 0, ''),
(244, 233, 0, 104, '小米手机5,十余项黑科技，很轻狠快', 'TP0000104', 1, '2099.00', '2100.00', '0.00', '2100.00', 0, '55_101', '颜色:黑色 内存:64G', 'xm0002', 0, 0, 0, 0, 0, ''),
(245, 234, 0, 76, '韩文2015冬装新款女装红色双排扣配腰带毛呢大衣.', 'TP0000076', 1, '389.00', '0.02', '0.00', '0.02', 0, '78', '尺码:M', '54657', 0, 0, 0, 0, 0, ''),
(246, 235, 0, 1, 'Apple iPhone 6s Plus 16G 玫瑰金 移动联通电信4G手机', 'TP000000', 1, '6100.00', '100.00', '0.00', '100.00', 0, '13_55', '内存:16G 颜色:黑色', '0001', 0, 0, 0, 0, 0, ''),
(247, 236, 0, 1, 'Apple iPhone 6s Plus 16G 玫瑰金 移动联通电信4G手机', 'TP000000', 1, '6100.00', '100.00', '0.00', '100.00', 0, '28_100', '内存:32G 颜色:玫瑰金', '0006', 0, 0, 0, 0, 0, ''),
(248, 237, 0, 76, '韩文2015冬装新款女装红色双排扣配腰带毛呢大衣.', 'TP0000076', 1, '389.00', '0.02', '0.00', '0.02', 0, '78', '尺码:M', '54657', 0, 0, 0, 0, 0, ''),
(249, 238, 0, 76, '韩文2015冬装新款女装红色双排扣配腰带毛呢大衣.', 'TP0000076', 1, '389.00', '0.02', '0.00', '0.02', 0, '79', '尺码:L', '65785', 0, 0, 0, 0, 0, ''),
(250, 239, 0, 76, '韩文2015冬装新款女装红色双排扣配腰带毛呢大衣.', 'TP0000076', 1, '389.00', '0.02', '0.00', '0.02', 0, '78', '尺码:M', '54657', 0, 0, 0, 0, 0, ''),
(251, 240, 0, 76, '韩文2015冬装新款女装红色双排扣配腰带毛呢大衣.', 'TP0000076', 1, '389.00', '0.02', '0.00', '0.02', 0, '78', '尺码:M', '54657', 0, 0, 0, 0, 0, ''),
(252, 241, 0, 76, '韩文2015冬装新款女装红色双排扣配腰带毛呢大衣.', 'TP0000076', 1, '389.00', '0.02', '0.00', '0.02', 0, '78', '尺码:M', '54657', 0, 0, 0, 0, 0, ''),
(253, 242, 0, 1, 'Apple iPhone 6s Plus 16G 玫瑰金 移动联通电信4G手机', 'TP000000', 1, '6100.00', '100.00', '0.00', '100.00', 0, '28_100', '内存:32G 颜色:玫瑰金', '0006', 0, 0, 0, 0, 0, ''),
(254, 243, 0, 76, '韩文2015冬装新款女装红色双排扣配腰带毛呢大衣.', 'TP0000076', 1, '389.00', '0.02', '0.00', '0.02', 0, '78', '尺码:M', '54657', 0, 0, 0, 0, 0, ''),
(255, 244, 0, 76, '韩文2015冬装新款女装红色双排扣配腰带毛呢大衣.', 'TP0000076', 1, '389.00', '0.02', '0.00', '0.02', 0, '77', '尺码:S', '123456', 0, 0, 0, 0, 0, ''),
(256, 245, 0, 39, '华为（HUAWEI） M2 10.0 平板电脑 WiFi 月光银', 'TP0000039', 3, '2388.00', '4000.00', '0.00', '4000.00', 0, '41_47_52', '尺寸:7寸及以下 内存:16G 颜色:黑色', '', 0, 0, 0, 0, 0, ''),
(257, 246, 0, 59, '酷开(coocaa) K50 50英寸智能网络液晶平板电视 酷开系统WiFi', 'TP0000059', 1, '2599.00', '2100.00', '0.00', '2100.00', 0, '67', '尺寸:55', '', 0, 0, 0, 0, 0, ''),
(258, 247, 0, 1, 'Apple iPhone 6s Plus 16G 玫瑰金 移动联通电信4G手机', 'TP000000', 1, '6100.00', '100.00', '0.00', '100.00', 0, '28_100', '内存:32G 颜色:玫瑰金', '0006', 0, 0, 0, 0, 0, ''),
(259, 248, 0, 66, '迎馨家纺全棉斜纹印花双人四件套邂逅 AB版纯棉，亲肤透气', 'TP0000066', 1, '210.00', '110.00', '0.00', '110.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(260, 249, 0, 53, '华为 HUAWEI MediaQ M330 华为盒子 4K极清网络机顶盒（黑色）', 'TP0000053', 1, '449.00', '300.00', '0.00', '300.00', 0, '61', '颜色:黑色', '', 0, 0, 0, 0, 0, ''),
(261, 249, 0, 104, '小米手机5,十余项黑科技，很轻狠快', 'TP0000104', 1, '2099.00', '2100.00', '0.00', '2100.00', 0, '55_101', '颜色:黑色 内存:64G', 'xm0002', 0, 0, 0, 0, 0, ''),
(262, 265, 0, 66, '迎馨家纺全棉斜纹印花双人四件套邂逅 AB版纯棉，亲肤透气', 'TP0000066', 1, '210.00', '110.00', '0.00', '110.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(263, 266, 0, 45, '华为 HUAWEI C199S 麦芒3S 电信4G智能手机FDD-LTE /TD-LTE/CDMA2000/GSM（麦芒金）', 'TP0000045', 1, '2099.00', '1999.00', '0.00', '1999.00', 0, '11_13_21', '网络:4G 内存:16G 屏幕:触屏', '', 0, 0, 0, 0, 0, ''),
(264, 267, 0, 119, '小米旗舰店正品手机平板通用迷你充电宝 移动电源10000毫安大容量', 'TP0000119', 1, '169.00', '69.00', '0.00', '69.00', 0, '103', '颜色:土豪金', '', 0, 0, 0, 0, 0, ''),
(265, 268, 0, 1, 'Apple iPhone 6s Plus 16G 玫瑰金 移动联通电信4G手机', 'TP000000', 1, '6100.00', '100.00', '0.00', '100.00', 0, '28_100', '内存:32G 颜色:玫瑰金', '0006', 0, 0, 0, 0, 0, ''),
(266, 268, 0, 1, 'Apple iPhone 6s Plus 16G 玫瑰金 移动联通电信4G手机', 'TP000000', 1, '6100.00', '6000.00', '0.00', '6000.00', 0, '13_55', '内存:16G 颜色:黑色', '0001', 0, 0, 0, 0, 0, ''),
(267, 268, 0, 124, 'Nikon/尼康D3300入门单反相机 升级版AF-P 18-55镜头套机 分期购', 'TP0000124', 1, '2499.00', '2399.00', '0.00', '2399.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(268, 268, 0, 125, '【0首付分期】蚂蚁摄影联保单反数码相机Canon/佳能 EOS 760D套机', 'TP0000125', 2, '5599.00', '5499.00', '0.00', '5499.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(269, 268, 0, 141, '三星 Galaxy A9高配版 (A9100) 精灵黑 全网通4G手机 双卡双待', 'TP0000141', 1, '3599.00', '3499.00', '0.00', '3499.00', 0, '55', '颜色:黑色', '', 0, 0, 0, 0, 0, ''),
(270, 269, 0, 45, '华为 HUAWEI C199S 麦芒3S 电信4G智能手机FDD-LTE /TD-LTE/CDMA2000/GSM（麦芒金）', 'TP0000045', 1, '2099.00', '1500.00', '0.00', '1500.00', 0, '11_14_21', '网络:4G 内存:8G 屏幕:触屏', '', 0, 0, 0, 0, 0, ''),
(271, 270, 0, 115, '爸爸2陆毅代言索扬20000毫安充电宝轻薄正品手机通用移动电源MAh', 'TP0000115', 8, '184.90', '84.90', '0.00', '84.90', 0, '103', '颜色:土豪金', '', 0, 0, 0, 0, 0, ''),
(272, 271, 0, 143, 'haier海尔 BC-93TMPF 93升单门冰箱', 'TP0000143', 1, '799.00', '699.00', '0.00', '699.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(273, 271, 0, 142, '海尔（Haier）BCD-251WDGW 251升 无霜两门冰箱（白色）', 'TP0000142', 1, '2799.00', '2699.00', '0.00', '2699.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(274, 272, 0, 119, '小米旗舰店正品手机平板通用迷你充电宝 移动电源10000毫安大容量', 'TP0000119', 2, '169.00', '69.00', '0.00', '69.00', 0, '103', '颜色:土豪金', '', 0, 0, 0, 0, 0, ''),
(275, 272, 0, 123, 'Canon/佳能 EOS 750D单反套机（18-55mm）高清数码相机苏宁易购', 'TP0000123', 1, '4097.00', '3997.00', '0.00', '3997.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(276, 272, 0, 124, 'Nikon/尼康D3300入门单反相机 升级版AF-P 18-55镜头套机 分期购', 'TP0000124', 2, '2499.00', '2399.00', '0.00', '2399.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(277, 273, 0, 119, '小米旗舰店正品手机平板通用迷你充电宝 移动电源10000毫安大容量', 'TP0000119', 1, '169.00', '69.00', '0.00', '69.00', 0, '103', '颜色:土豪金', '', 0, 0, 0, 0, 0, ''),
(278, 274, 0, 66, '迎馨家纺全棉斜纹印花双人四件套邂逅 AB版纯棉，亲肤透气', 'TP0000066', 1, '210.00', '110.00', '0.00', '110.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(279, 275, 0, 67, '迎馨家纺 全棉斜纹印花双人四件套 约定 桔色 1.5米床', 'TP0000067', 1, '200.00', '100.00', '0.00', '100.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(280, 276, 0, 66, '迎馨家纺全棉斜纹印花双人四件套邂逅 AB版纯棉，亲肤透气', 'TP0000066', 1, '210.00', '110.00', '0.00', '110.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(281, 277, 0, 143, 'haier海尔 BC-93TMPF 93升单门冰箱', 'TP0000143', 1, '799.00', '0.01', '0.00', '0.01', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(282, 278, 0, 143, 'haier海尔 BC-93TMPF 93升单门冰箱', 'TP0000143', 1, '799.00', '0.01', '0.00', '0.01', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(283, 279, 0, 143, 'haier海尔 BC-93TMPF 93升单门冰箱', 'TP0000143', 1, '799.00', '0.01', '0.00', '0.01', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(284, 280, 0, 143, 'haier海尔 BC-93TMPF 93升单门冰箱', 'TP0000143', 1, '799.00', '0.01', '0.00', '0.01', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(285, 281, 0, 143, 'haier海尔 BC-93TMPF 93升单门冰箱', 'TP0000143', 1, '799.00', '0.01', '0.00', '0.01', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(286, 282, 0, 143, 'haier海尔 BC-93TMPF 93升单门冰箱', 'TP0000143', 1, '799.00', '0.01', '0.00', '0.01', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(287, 283, 0, 104, '小米手机5,十余项黑科技，很轻狠快', 'TP0000104', 1, '2099.00', '1999.00', '0.00', '1999.00', 0, '28_57', '内存:32G 颜色:金色', 'xm0007', 0, 0, 0, 0, 0, ''),
(288, 284, 0, 143, 'haier海尔 BC-93TMPF 93升单门冰箱', 'TP0000143', 1, '799.00', '0.01', '0.00', '0.01', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(289, 285, 0, 143, 'haier海尔 BC-93TMPF 93升单门冰箱', 'TP0000143', 1, '799.00', '0.01', '0.00', '0.01', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(290, 286, 0, 1, 'Apple iPhone 6s Plus 16G 玫瑰金 移动联通电信4G手机', 'TP000000', 1, '6100.00', '6000.00', '0.00', '6000.00', 0, '13_100', '内存:16G 颜色:玫瑰金', '0003', 0, 0, 0, 0, 0, ''),
(291, 287, 0, 143, 'haier海尔 BC-93TMPF 93升单门冰箱', 'TP0000143', 1, '799.00', '0.01', '0.00', '0.01', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(292, 288, 0, 143, 'haier海尔 BC-93TMPF 93升单门冰箱', 'TP0000143', 1, '799.00', '0.01', '0.00', '0.01', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(293, 289, 0, 45, '华为 HUAWEI C199S 麦芒3S 电信4G智能手机FDD-LTE /TD-LTE/CDMA2000/GSM（麦芒金）', 'TP0000045', 1, '2099.00', '1999.00', '0.00', '1999.00', 0, '11_13_21', '网络:4G 内存:16G 屏幕:触屏', '', 0, 0, 0, 0, 0, ''),
(294, 290, 0, 119, '小米旗舰店正品手机平板通用迷你充电宝 移动电源10000毫安大容量', 'TP0000119', 1, '169.00', '69.00', '0.00', '69.00', 0, '103', '颜色:土豪金', '', 0, 0, 0, 0, 0, ''),
(295, 291, 0, 1, 'Apple iPhone 6s Plus 16G 玫瑰金 移动联通电信4G手机', 'TP000000', 2, '6100.00', '6000.00', '0.00', '6000.00', 0, '13_100', '内存:16G 颜色:玫瑰金', '0003', 0, 0, 0, 0, 0, ''),
(296, 291, 0, 45, '华为 HUAWEI C199S 麦芒3S 电信4G智能手机FDD-LTE /TD-LTE/CDMA2000/GSM（麦芒金）', 'TP0000045', 2, '2099.00', '1999.00', '0.00', '1999.00', 0, '11_13_21', '网络:4G 内存:16G 屏幕:触屏', '', 0, 0, 0, 0, 0, ''),
(297, 291, 0, 1, 'Apple iPhone 6s Plus 16G 玫瑰金 移动联通电信4G手机', 'TP000000', 1, '6100.00', '6000.00', '0.00', '6000.00', 0, '13_55', '内存:16G 颜色:黑色', '0001', 0, 0, 0, 0, 0, ''),
(298, 291, 0, 56, '创维（skyworth）55M5 55英寸4K超高清网络智能液晶电视机', 'TP0000056', 1, '3799.00', '2399.00', '0.00', '2399.00', 0, '65', '尺寸:42', '', 0, 0, 0, 0, 0, ''),
(299, 291, 0, 39, '华为（HUAWEI） M2 10.0 平板电脑 WiFi 月光银', 'TP0000039', 1, '2388.00', '2000.00', '0.00', '2000.00', 0, '41_47_51', '尺寸:7寸及以下 内存:16G 颜色:银白色', '00001', 0, 0, 0, 0, 0, ''),
(300, 291, 0, 103, '珂兰钻石 18K金90分效果群镶钻石戒指 倾城 需定制', 'TP0000103', 1, '2099.00', '1999.00', '0.00', '1999.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(301, 292, 0, 119, '小米旗舰店正品手机平板通用迷你充电宝 移动电源10000毫安大容量', 'TP0000119', 1, '169.00', '69.00', '0.00', '69.00', 0, '103', '颜色:土豪金', '', 0, 0, 0, 0, 0, ''),
(302, 293, 0, 66, '迎馨家纺全棉斜纹印花双人四件套邂逅 AB版纯棉，亲肤透气', 'TP0000066', 1, '210.00', '110.00', '0.00', '110.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(303, 294, 0, 1, 'Apple iPhone 6s Plus 16G 玫瑰金 移动联通电信4G手机', 'TP000000', 3, '6100.00', '6100.00', '0.00', '6100.00', 0, '28_100', '内存:32G 颜色:玫瑰金', '0006', 0, 0, 0, 0, 0, ''),
(304, 295, 0, 45, '华为 HUAWEI C199S 麦芒3S 电信4G智能手机FDD-LTE /TD-LTE/CDMA2000/GSM（麦芒金）', 'TP0000045', 1, '2099.00', '1999.00', '0.00', '1999.00', 0, '11_13_21', '网络:4G 内存:16G 屏幕:触屏', '', 0, 0, 0, 0, 0, ''),
(305, 296, 0, 124, 'Nikon/尼康D3300入门单反相机 升级版AF-P 18-55镜头套机 分期购', 'TP0000124', 1, '2499.00', '2399.00', '0.00', '2399.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(306, 297, 0, 42, 'Teclast/台电 X80 Plus WIFI 32GB Win10平板电脑双系统8英寸', 'TP0000042', 1, '599.00', '499.00', '0.00', '499.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(307, 298, 0, 1, 'Apple iPhone 6s Plus 16G 玫瑰金 移动联通电信4G手机', 'TP000000', 1, '6100.00', '100.00', '0.00', '100.00', 0, '28_100', '内存:32G 颜色:玫瑰金', '0006', 0, 0, 0, 0, 0, ''),
(308, 298, 0, 119, '小米旗舰店正品手机平板通用迷你充电宝 移动电源10000毫安大容量', 'TP0000119', 1, '169.00', '69.00', '0.00', '69.00', 0, '104', '颜色:象牙白', '', 0, 0, 0, 0, 0, ''),
(309, 299, 0, 42, 'Teclast/台电 X80 Plus WIFI 32GB Win10平板电脑双系统8英寸', 'TP0000042', 1, '599.00', '499.00', '0.00', '499.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(310, 299, 0, 66, '迎馨家纺全棉斜纹印花双人四件套邂逅 AB版纯棉，亲肤透气', 'TP0000066', 2, '210.00', '110.00', '0.00', '110.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(311, 300, 0, 45, '华为 HUAWEI C199S 麦芒3S 电信4G智能手机FDD-LTE /TD-LTE/CDMA2000/GSM（麦芒金）', 'TP0000045', 1, '2099.00', '1500.00', '0.00', '1500.00', 0, '11_14_21', '网络:4G 内存:8G 屏幕:触屏', '', 0, 0, 0, 0, 0, ''),
(312, 300, 0, 141, '三星 Galaxy A9高配版 (A9100) 精灵黑 全网通4G手机 双卡双待', 'TP0000141', 1, '3599.00', '3400.00', '0.00', '3400.00', 0, '57', '颜色:金色', '', 0, 1, 2, 0, 0, ''),
(313, 301, 0, 39, '华为（HUAWEI） M2 10.0 平板电脑 WiFi 月光银', 'TP0000039', 1, '2388.00', '4000.00', '0.00', '4000.00', 0, '41_47_52', '尺寸:7寸及以下 内存:16G 颜色:黑色', '', 0, 0, 0, 0, 0, ''),
(314, 302, 0, 141, '三星 Galaxy A9高配版 (A9100) 精灵黑 全网通4G手机 双卡双待', 'TP0000141', 1, '3599.00', '3400.00', '0.00', '3400.00', 0, '57', '颜色:金色', '', 0, 1, 2, 0, 0, ''),
(315, 303, 0, 119, '小米旗舰店正品手机平板通用迷你充电宝 移动电源10000毫安大容量', 'TP0000119', 1, '169.00', '69.00', '0.00', '69.00', 0, '103', '颜色:土豪金', '', 0, 0, 0, 0, 0, ''),
(316, 304, 0, 119, '小米旗舰店正品手机平板通用迷你充电宝 移动电源10000毫安大容量', 'TP0000119', 3, '169.00', '69.00', '0.00', '69.00', 0, '103', '颜色:土豪金', '', 0, 0, 0, 0, 0, ''),
(317, 305, 0, 119, '小米旗舰店正品手机平板通用迷你充电宝 移动电源10000毫安大容量', 'TP0000119', 1, '169.00', '69.00', '0.00', '69.00', 0, '103', '颜色:土豪金', '', 0, 0, 0, 0, 0, ''),
(318, 305, 0, 136, '靓号0元送广东联通4G/3G手机卡上网卡大流量套餐全国无漫游选号', 'TP0000136', 2, '220.00', '50.00', '0.00', '50.00', 0, '108', '合约套餐:乐享4G套餐99元', '', 0, 1, 3, 0, 0, ''),
(319, 306, 0, 98, '六福珠宝足金DIY刻字片挂饰黄金项链吊坠手链挂饰计价GMGTBP0057', 'TP0000098', 1, '339.00', '239.00', '0.00', '239.00', 0, '', '', '', 0, 0, 0, 0, 0, '');
INSERT INTO `ruike_mall_order_goods` (`rec_id`, `order_id`, `member_id`, `goods_id`, `goods_name`, `goods_sn`, `goods_num`, `market_price`, `goods_price`, `cost_price`, `member_goods_price`, `give_integral`, `spec_key`, `spec_key_name`, `bar_code`, `is_comment`, `prom_type`, `prom_id`, `is_send`, `delivery_id`, `sku`) VALUES
(320, 306, 0, 1, 'Apple iPhone 6s Plus 16G 玫瑰金 移动联通电信4G手机', 'TP000000', 1, '6100.00', '6000.00', '0.00', '6000.00', 0, '13_55', '内存:16G 颜色:黑色', '0001', 0, 0, 0, 0, 0, ''),
(321, 307, 0, 141, '三星 Galaxy A9高配版 (A9100) 精灵黑 全网通4G手机 双卡双待', 'TP0000141', 2, '3599.00', '3400.00', '0.00', '3400.00', 0, '57', '颜色:金色', '', 0, 1, 2, 1, 12, ''),
(322, 308, 0, 66, '迎馨家纺全棉斜纹印花双人四件套邂逅 AB版纯棉，亲肤透气', 'TP0000066', 2, '210.00', '110.00', '0.00', '110.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(323, 309, 0, 143, 'haier海尔 BC-93TMPF 93升单门冰箱', 'TP0000143', 1, '799.00', '0.01', '0.00', '0.01', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(324, 310, 0, 141, '三星 Galaxy A9高配版 (A9100) 精灵黑 全网通4G手机 双卡双待', 'TP0000141', 1, '3599.00', '3400.00', '0.00', '3400.00', 0, '57', '颜色:金色', '', 0, 1, 2, 0, 0, ''),
(325, 311, 0, 119, '小米旗舰店正品手机平板通用迷你充电宝 移动电源10000毫安大容量', 'TP0000119', 1, '169.00', '69.00', '0.00', '69.00', 0, '103', '颜色:土豪金', '', 0, 0, 0, 0, 0, ''),
(326, 312, 0, 66, '迎馨家纺全棉斜纹印花双人四件套邂逅 AB版纯棉，亲肤透气', 'TP0000066', 1, '210.00', '110.00', '0.00', '110.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(327, 313, 0, 67, '迎馨家纺 全棉斜纹印花双人四件套 约定 桔色 1.5米床', 'TP0000067', 1, '200.00', '100.00', '0.00', '100.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(328, 314, 0, 141, '三星 Galaxy A9高配版 (A9100) 精灵黑 全网通4G手机 双卡双待', 'TP0000141', 1, '3599.00', '3400.00', '0.00', '3400.00', 0, '57', '颜色:金色', '', 0, 1, 2, 0, 0, ''),
(329, 315, 0, 39, '华为（HUAWEI） M2 10.0 平板电脑 WiFi 月光银', 'TP0000039', 1, '2388.00', '4000.00', '0.00', '4000.00', 0, '41_47_52', '尺寸:7寸及以下 内存:16G 颜色:黑色', '', 0, 0, 0, 0, 0, ''),
(330, 316, 0, 140, 'Apple iPhone 6s 16GB 玫瑰金色 移动联通电信4G手机', 'TP0000140', 1, '4958.00', '6858.00', '0.00', '6858.00', 0, '11_28_100', '网络:4G 内存:32G 颜色:玫瑰金', '', 0, 0, 0, 0, 0, ''),
(331, 317, 0, 141, '三星 Galaxy A9高配版 (A9100) 精灵黑 全网通4G手机 双卡双待', 'TP0000141', 2, '3599.00', '3400.00', '0.00', '3400.00', 0, '57', '颜色:金色', '', 0, 1, 2, 0, 0, ''),
(332, 317, 0, 66, '迎馨家纺全棉斜纹印花双人四件套邂逅 AB版纯棉，亲肤透气', 'TP0000066', 1, '210.00', '110.00', '0.00', '110.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(333, 318, 0, 115, '爸爸2陆毅代言索扬20000毫安充电宝轻薄正品手机通用移动电源MAh', 'TP0000115', 1, '184.90', '84.90', '0.00', '84.90', 0, '105', '颜色:宝石蓝', '', 0, 0, 0, 0, 0, ''),
(334, 319, 0, 136, '靓号0元送广东联通4G/3G手机卡上网卡大流量套餐全国无漫游选号', 'TP0000136', 1, '220.00', '50.00', '0.00', '50.00', 0, '108', '合约套餐:乐享4G套餐99元', '', 0, 1, 3, 0, 0, ''),
(335, 320, 0, 143, 'haier海尔 BC-93TMPF 93升单门冰箱', 'TP0000143', 1, '799.00', '0.01', '0.00', '0.01', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(336, 321, 0, 39, '华为（HUAWEI） M2 10.0 平板电脑 WiFi 月光银', 'TP0000039', 1, '2388.00', '4000.00', '0.00', '4000.00', 0, '41_47_52', '尺寸:7寸及以下 内存:16G 颜色:黑色', '', 0, 0, 0, 0, 0, ''),
(337, 322, 0, 141, '三星 Galaxy A9高配版 (A9100) 精灵黑 全网通4G手机 双卡双待', 'TP0000141', 0, '3599.00', '3400.00', '0.00', '3400.00', 0, '56', '颜色:白色', '', 0, 1, 2, 0, 0, ''),
(338, 323, 0, 115, '爸爸2陆毅代言索扬20000毫安充电宝轻薄正品手机通用移动电源MAh', 'TP0000115', 1, '184.90', '84.90', '0.00', '84.90', 0, '104', '颜色:象牙白', '', 0, 0, 0, 0, 0, ''),
(339, 323, 0, 119, '小米旗舰店正品手机平板通用迷你充电宝 移动电源10000毫安大容量', 'TP0000119', 1, '169.00', '69.00', '0.00', '69.00', 0, '104', '颜色:象牙白', '', 0, 0, 0, 0, 0, ''),
(340, 324, 0, 66, '迎馨家纺全棉斜纹印花双人四件套邂逅 AB版纯棉，亲肤透气', 'TP0000066', 1, '210.00', '110.00', '0.00', '110.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(341, 325, 0, 119, '小米旗舰店正品手机平板通用迷你充电宝 移动电源10000毫安大容量', 'TP0000119', 1, '169.00', '69.00', '0.00', '69.00', 0, '104', '颜色:象牙白', '', 0, 0, 0, 0, 0, ''),
(342, 326, 0, 119, '小米旗舰店正品手机平板通用迷你充电宝 移动电源10000毫安大容量', 'TP0000119', 4, '169.00', '69.00', '0.00', '69.00', 0, '104', '颜色:象牙白', '', 0, 0, 0, 0, 0, ''),
(343, 327, 0, 141, '三星 Galaxy A9高配版 (A9100) 精灵黑 全网通4G手机 双卡双待', 'TP0000141', 2, '3599.00', '3400.00', '0.00', '3400.00', 0, '57', '颜色:金色', '', 0, 1, 2, 0, 0, ''),
(344, 327, 0, 134, '中国电信4G号卡手机卡电话卡上网卡 177号段套餐可选 预存120全返', 'TP0000134', 5, '220.00', '59.00', '0.00', '59.00', 0, '108', '合约套餐:乐享4G套餐99元', '', 0, 0, 0, 0, 0, ''),
(345, 327, 0, 134, '中国电信4G号卡手机卡电话卡上网卡 177号段套餐可选 预存120全返', 'TP0000134', 1, '220.00', '59.00', '0.00', '59.00', 0, '106', '合约套餐:乐享4G套餐59元', '', 0, 0, 0, 0, 0, ''),
(346, 327, 0, 135, '重庆电信手机卡电话卡语音卡选靓号3G4G卡内部5折卡低资费（飞）', 'TP0000135', 1, '160.00', '59.00', '0.00', '59.00', 0, '106', '合约套餐:乐享4G套餐59元', '', 0, 0, 0, 0, 0, ''),
(347, 327, 0, 141, '三星 Galaxy A9高配版 (A9100) 精灵黑 全网通4G手机 双卡双待', 'TP0000141', 1, '3599.00', '3400.00', '0.00', '3400.00', 0, '56', '颜色:白色', '', 0, 1, 2, 0, 0, ''),
(348, 327, 0, 136, '靓号0元送广东联通4G/3G手机卡上网卡大流量套餐全国无漫游选号', 'TP0000136', 1, '220.00', '50.00', '0.00', '50.00', 0, '108', '合约套餐:乐享4G套餐99元', '', 0, 1, 3, 0, 0, ''),
(349, 328, 0, 119, '小米旗舰店正品手机平板通用迷你充电宝 移动电源10000毫安大容量', 'TP0000119', 1, '169.00', '69.00', '0.00', '69.00', 0, '104', '颜色:象牙白', '', 0, 0, 0, 0, 0, ''),
(350, 329, 0, 141, '三星 Galaxy A9高配版 (A9100) 精灵黑 全网通4G手机 双卡双待', 'TP0000141', 1, '3599.00', '3400.00', '0.00', '3400.00', 0, '56', '颜色:白色', '', 0, 1, 2, 0, 0, ''),
(351, 330, 0, 119, '小米旗舰店正品手机平板通用迷你充电宝 移动电源10000毫安大容量', 'TP0000119', 2, '169.00', '69.00', '0.00', '69.00', 0, '103', '颜色:土豪金', '', 0, 0, 0, 0, 0, ''),
(352, 330, 0, 66, '迎馨家纺全棉斜纹印花双人四件套邂逅 AB版纯棉，亲肤透气', 'TP0000066', 1, '210.00', '110.00', '0.00', '110.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(353, 331, 0, 119, '小米旗舰店正品手机平板通用迷你充电宝 移动电源10000毫安大容量', 'TP0000119', 1, '169.00', '69.00', '0.00', '69.00', 0, '103', '颜色:土豪金', '', 0, 0, 0, 0, 0, ''),
(354, 332, 0, 115, '爸爸2陆毅代言索扬20000毫安充电宝轻薄正品手机通用移动电源MAh', 'TP0000115', 1, '184.90', '84.90', '0.00', '84.90', 0, '105', '颜色:宝石蓝', '', 0, 0, 0, 0, 0, ''),
(355, 333, 0, 66, '迎馨家纺全棉斜纹印花双人四件套邂逅 AB版纯棉，亲肤透气', 'TP0000066', 1, '210.00', '110.00', '0.00', '110.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(356, 334, 0, 39, '华为（HUAWEI） M2 10.0 平板电脑 WiFi 月光银', 'TP0000039', 2, '2388.00', '2500.00', '0.00', '2500.00', 0, '42_47_51', '尺寸:7.8-9寸 内存:16G 颜色:银白色', '00002', 0, 0, 0, 0, 0, ''),
(357, 335, 0, 136, '靓号0元送广东联通4G/3G手机卡上网卡大流量套餐全国无漫游选号', 'TP0000136', 1, '220.00', '50.00', '0.00', '50.00', 0, '108', '合约套餐:乐享4G套餐99元', '', 0, 1, 3, 0, 0, ''),
(358, 336, 0, 66, '迎馨家纺全棉斜纹印花双人四件套邂逅 AB版纯棉，亲肤透气', 'TP0000066', 1, '210.00', '110.00', '0.00', '110.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(359, 337, 0, 136, '靓号0元送广东联通4G/3G手机卡上网卡大流量套餐全国无漫游选号', 'TP0000136', 1, '220.00', '50.00', '0.00', '50.00', 0, '108', '合约套餐:乐享4G套餐99元', '', 0, 1, 3, 0, 0, ''),
(360, 338, 0, 115, '爸爸2陆毅代言索扬20000毫安充电宝轻薄正品手机通用移动电源MAh', 'TP0000115', 1, '184.90', '84.90', '0.00', '84.90', 0, '103', '颜色:土豪金', '', 0, 0, 0, 0, 0, ''),
(361, 339, 0, 140, 'Apple iPhone 6s 16GB 玫瑰金色 移动联通电信4G手机', 'TP0000140', 1, '4958.00', '4858.00', '0.00', '4858.00', 0, '11_13_55', '网络:4G 内存:16G 颜色:黑色', '', 0, 0, 0, 0, 0, ''),
(362, 340, 0, 104, '小米手机5,十余项黑科技，很轻狠快', 'TP0000104', 1, '2099.00', '1999.00', '0.00', '1999.00', 0, '28_57', '内存:32G 颜色:金色', '', 0, 0, 0, 0, 0, ''),
(363, 341, 0, 45, '华为 HUAWEI C199S 麦芒3S 电信4G智能手机FDD-LTE /TD-LTE/CDMA2000/GSM（麦芒金）', 'TP0000045', 1, '2099.00', '1999.00', '0.00', '1999.00', 0, '11_13_21', '网络:4G 内存:16G 屏幕:触屏', '', 0, 0, 0, 0, 0, ''),
(364, 342, 0, 119, '小米旗舰店正品手机平板通用迷你充电宝 移动电源10000毫安大容量', 'TP0000119', 1, '169.00', '69.00', '0.00', '69.00', 0, '103', '颜色:土豪金', '', 0, 0, 0, 0, 0, ''),
(365, 343, 0, 141, '三星 Galaxy A9高配版 (A9100) 精灵黑 全网通4G手机 双卡双待', 'TP0000141', 1, '3599.00', '3400.00', '0.00', '3400.00', 0, '55', '颜色:黑色', '', 0, 1, 2, 0, 0, ''),
(366, 344, 0, 119, '小米旗舰店正品手机平板通用迷你充电宝 移动电源10000毫安大容量', 'TP0000119', 1, '169.00', '69.00', '0.00', '69.00', 0, '103', '颜色:土豪金', '', 0, 0, 0, 0, 0, ''),
(367, 345, 0, 119, '小米旗舰店正品手机平板通用迷你充电宝 移动电源10000毫安大容量', 'TP0000119', 1, '169.00', '69.00', '0.00', '69.00', 0, '103', '颜色:土豪金', '', 0, 0, 0, 0, 0, ''),
(368, 346, 0, 141, '三星 Galaxy A9高配版 (A9100) 精灵黑 全网通4G手机 双卡双待', 'TP0000141', 1, '3599.00', '3400.00', '0.00', '3400.00', 0, '57', '颜色:金色', '', 0, 1, 2, 0, 0, ''),
(369, 347, 0, 66, '迎馨家纺全棉斜纹印花双人四件套邂逅 AB版纯棉，亲肤透气', 'TP0000066', 1, '210.00', '110.00', '0.00', '110.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(370, 348, 0, 66, '迎馨家纺全棉斜纹印花双人四件套邂逅 AB版纯棉，亲肤透气', 'TP0000066', 2, '210.00', '110.00', '0.00', '110.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(371, 349, 0, 141, '三星 Galaxy A9高配版 (A9100) 精灵黑 全网通4G手机 双卡双待', 'TP0000141', 1, '3599.00', '3400.00', '0.00', '3400.00', 0, '57', '颜色:金色', '', 0, 1, 2, 0, 0, ''),
(372, 350, 0, 119, '小米旗舰店正品手机平板通用迷你充电宝 移动电源10000毫安大容量', 'TP0000119', 1, '169.00', '69.00', '0.00', '69.00', 0, '103', '颜色:土豪金', '', 0, 0, 0, 0, 0, ''),
(373, 351, 0, 66, '迎馨家纺全棉斜纹印花双人四件套邂逅 AB版纯棉，亲肤透气', 'TP0000066', 5, '210.00', '110.00', '0.00', '110.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(374, 352, 0, 39, '华为（HUAWEI） M2 10.0 平板电脑 WiFi 月光银', 'TP0000039', 1, '2388.00', '2300.00', '0.00', '2300.00', 0, '41_48_51', '尺寸:7寸及以下 内存:32G 颜色:银白色', '', 0, 0, 0, 0, 0, ''),
(375, 353, 0, 141, '三星 Galaxy A9高配版 (A9100) 精灵黑 全网通4G手机 双卡双待', 'TP0000141', 2, '3599.00', '3400.00', '0.00', '3400.00', 0, '57', '颜色:金色', '', 0, 1, 2, 0, 0, ''),
(376, 354, 0, 1, 'Apple iPhone 6s Plus 16G 玫瑰金 移动联通电信4G手机', 'TP000000', 1, '6100.00', '0.01', '0.00', '0.01', 0, '11_100_102', '网络:4G 颜色:玫瑰金 内存:128G', '', 0, 0, 0, 0, 0, ''),
(377, 355, 0, 141, '三星 Galaxy A9高配版 (A9100) 精灵黑 全网通4G手机 双卡双待', 'TP0000141', 2, '3599.00', '3499.00', '0.00', '3499.00', 0, '57', '颜色:金色', '', 0, 1, 2, 0, 0, ''),
(378, 356, 0, 1, 'Apple iPhone 6s Plus 16G 玫瑰金 移动联通电信4G手机', 'TP000000', 7, '6100.00', '6000.00', '0.00', '6000.00', 0, '13_100', '内存:16G 颜色:玫瑰金', '', 0, 0, 0, 0, 0, ''),
(379, 357, 0, 119, '小米旗舰店正品手机平板通用迷你充电宝 移动电源10000毫安大容量', 'TP0000119', 3, '169.00', '69.00', '0.00', '69.00', 0, '103', '颜色:土豪金', '', 0, 0, 0, 0, 0, ''),
(380, 358, 0, 141, '三星 Galaxy A9高配版 (A9100) 精灵黑 全网通4G手机 双卡双待', 'TP0000141', 1, '3599.00', '3499.00', '0.00', '3499.00', 0, '55', '颜色:黑色', '', 0, 1, 2, 0, 0, ''),
(381, 359, 0, 1, 'Apple iPhone 6s Plus 16G 玫瑰金 移动联通电信4G手机', 'TP000000', 1, '6100.00', '0.01', '0.00', '0.01', 0, '11_100_102', '网络:4G 颜色:玫瑰金 内存:128G', '', 0, 0, 0, 0, 0, ''),
(382, 360, 0, 1, 'Apple iPhone 6s Plus 16G 玫瑰金 移动联通电信4G手机', 'TP000000', 1, '6100.00', '0.01', '0.00', '0.01', 0, '11_100_102', '网络:4G 颜色:玫瑰金 内存:128G', '', 0, 0, 0, 0, 0, ''),
(383, 361, 0, 1, 'Apple iPhone 6s Plus 16G 玫瑰金 移动联通电信4G手机', 'TP000000', 1, '6100.00', '0.01', '0.00', '0.01', 0, '11_100_102', '网络:4G 颜色:玫瑰金 内存:128G', '', 0, 0, 0, 0, 0, ''),
(384, 362, 0, 1, 'Apple iPhone 6s Plus 16G 玫瑰金 移动联通电信4G手机', 'TP000000', 1, '6100.00', '0.01', '0.00', '0.01', 0, '11_100_102', '网络:4G 颜色:玫瑰金 内存:128G', '', 0, 0, 0, 0, 0, ''),
(385, 363, 0, 1, 'Apple iPhone 6s Plus 16G 玫瑰金 移动联通电信4G手机', 'TP000000', 1, '6100.00', '0.01', '0.00', '0.01', 0, '11_100_102', '网络:4G 颜色:玫瑰金 内存:128G', '', 0, 0, 0, 0, 0, ''),
(386, 364, 0, 1, 'Apple iPhone 6s Plus 16G 玫瑰金 移动联通电信4G手机', 'TP000000', 1, '6100.00', '0.01', '0.00', '0.01', 0, '11_100_102', '网络:4G 颜色:玫瑰金 内存:128G', '', 0, 0, 0, 0, 0, ''),
(387, 365, 0, 143, 'haier海尔 BC-93TMPF 93升单门冰箱', 'TP0000143', 1, '799.00', '0.01', '0.00', '0.01', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(388, 366, 0, 141, '三星 Galaxy A9高配版 (A9100) 精灵黑 全网通4G手机 双卡双待', 'TP0000141', 1, '3599.00', '3400.00', '0.00', '3400.00', 0, '57', '颜色:金色', '', 0, 1, 2, 0, 0, ''),
(389, 367, 0, 141, '三星 Galaxy A9高配版 (A9100) 精灵黑 全网通4G手机 双卡双待', 'TP0000141', 1, '3599.00', '3400.00', '0.00', '3400.00', 0, '56', '颜色:白色', '', 0, 1, 2, 0, 0, ''),
(390, 367, 0, 76, '韩文2015冬装新款女装红色双排扣配腰带毛呢大衣.', 'TP0000076', 1, '389.00', '269.00', '0.00', '269.00', 0, '79', '尺码:L', '', 0, 0, 0, 0, 0, ''),
(391, 368, 0, 119, '小米旗舰店正品手机平板通用迷你充电宝 移动电源10000毫安大容量', 'TP0000119', 1, '169.00', '69.00', '0.00', '69.00', 0, '103', '颜色:土豪金', '', 0, 0, 0, 0, 0, ''),
(392, 368, 0, 67, '迎馨家纺 全棉斜纹印花双人四件套 约定 桔色 1.5米床', 'TP0000067', 1, '200.00', '100.00', '0.00', '100.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(393, 369, 0, 1, 'Apple iPhone 6s Plus 16G 玫瑰金 移动联通电信4G手机', 'TP000000', 1, '6100.00', '0.01', '0.00', '0.01', 0, '11_100_102', '网络:4G 颜色:玫瑰金 内存:128G', '', 0, 0, 0, 0, 0, ''),
(394, 369, 0, 50, '华为 HUAWEI 畅享5S 全网通 2GB RAM+16GB ROM（金色）', 'TP0000050', 2, '1299.00', '1179.00', '0.00', '1179.00', 0, '11_13_21_57', '网络:4G 内存:16G 屏幕:触屏 颜色:金色', '', 0, 0, 0, 0, 0, ''),
(395, 369, 0, 119, '小米旗舰店正品手机平板通用迷你充电宝 移动电源10000毫安大容量', 'TP0000119', 3, '169.00', '69.00', '0.00', '69.00', 0, '103', '颜色:土豪金', '', 0, 0, 0, 0, 0, ''),
(396, 370, 0, 46, '【北京移动老用户专享 话费六折】荣耀畅玩5X 双卡双待 移动版 智能手机（破晓银）', 'TP0000046', 2, '1099.00', '999.00', '0.00', '999.00', 0, '11_13_21', '网络:4G 内存:16G 屏幕:触屏', '', 0, 0, 0, 0, 0, ''),
(397, 370, 0, 50, '华为 HUAWEI 畅享5S 全网通 2GB RAM+16GB ROM（金色）', 'TP0000050', 3, '1299.00', '1189.00', '0.00', '1189.00', 0, '11_13_21_56', '网络:4G 内存:16G 屏幕:触屏 颜色:白色', '', 0, 0, 0, 0, 0, ''),
(398, 370, 0, 121, '科智50000通用充电宝20000毫安冲手机蘋果6s超薄可爱便携移动电源', 'TP0000121', 5, '169.90', '69.90', '0.00', '69.90', 0, '104', '颜色:象牙白', '', 0, 0, 0, 0, 0, ''),
(399, 370, 0, 134, '中国电信4G号卡手机卡电话卡上网卡 177号段套餐可选 预存120全返', 'TP0000134', 1, '220.00', '59.00', '0.00', '59.00', 0, '108', '合约套餐:乐享4G套餐99元', '', 0, 0, 0, 0, 0, ''),
(400, 370, 0, 119, '小米旗舰店正品手机平板通用迷你充电宝 移动电源10000毫安大容量', 'TP0000119', 1, '169.00', '69.00', '0.00', '69.00', 0, '103', '颜色:土豪金', '', 0, 0, 0, 0, 0, ''),
(401, 371, 0, 66, '迎馨家纺全棉斜纹印花双人四件套邂逅 AB版纯棉，亲肤透气', 'TP0000066', 1, '210.00', '110.00', '0.00', '110.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(402, 372, 0, 141, '三星 Galaxy A9高配版 (A9100) 精灵黑 全网通4G手机 双卡双待', 'TP0000141', 1, '3599.00', '3400.00', '0.00', '3400.00', 0, '57', '颜色:金色', '', 0, 1, 2, 0, 0, ''),
(403, 373, 0, 141, '三星 Galaxy A9高配版 (A9100) 精灵黑 全网通4G手机 双卡双待', 'TP0000141', 2, '3599.00', '3400.00', '0.00', '3400.00', 0, '57', '颜色:金色', '', 0, 1, 2, 0, 0, ''),
(404, 374, 0, 66, '迎馨家纺全棉斜纹印花双人四件套邂逅 AB版纯棉，亲肤透气', 'TP0000066', 1, '210.00', '110.00', '0.00', '110.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(405, 375, 0, 143, 'haier海尔 BC-93TMPF 93升单门冰箱', 'TP0000143', 1, '799.00', '0.01', '0.00', '0.01', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(406, 376, 0, 119, '小米旗舰店正品手机平板通用迷你充电宝 移动电源10000毫安大容量', 'TP0000119', 1, '169.00', '69.00', '0.00', '69.00', 0, '103', '颜色:土豪金', '', 0, 0, 0, 0, 0, ''),
(407, 377, 0, 66, '迎馨家纺全棉斜纹印花双人四件套邂逅 AB版纯棉，亲肤透气', 'TP0000066', 1, '210.00', '110.00', '0.00', '110.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(408, 378, 0, 119, '小米旗舰店正品手机平板通用迷你充电宝 移动电源10000毫安大容量', 'TP0000119', 1, '169.00', '69.00', '0.00', '69.00', 0, '103', '颜色:土豪金', '', 0, 0, 0, 0, 0, ''),
(409, 379, 0, 66, '迎馨家纺全棉斜纹印花双人四件套邂逅 AB版纯棉，亲肤透气', 'TP0000066', 1, '210.00', '110.00', '0.00', '110.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(410, 380, 0, 66, '迎馨家纺全棉斜纹印花双人四件套邂逅 AB版纯棉，亲肤透气', 'TP0000066', 1, '210.00', '110.00', '0.00', '110.00', 0, '', '', '', 0, 0, 0, 1, 13, ''),
(411, 380, 0, 143, 'haier海尔 BC-93TMPF 93升单门冰箱', 'TP0000143', 1, '799.00', '0.01', '0.00', '0.01', 0, '', '', '', 0, 0, 0, 1, 13, ''),
(412, 380, 0, 76, '韩文2015冬装新款女装红色双排扣配腰带毛呢大衣.', 'TP0000076', 1, '389.00', '269.00', '0.00', '269.00', 0, '79', '尺码:L', '', 0, 0, 0, 1, 13, ''),
(413, 381, 0, 66, '迎馨家纺全棉斜纹印花双人四件套邂逅 AB版纯棉，亲肤透气', 'TP0000066', 1, '210.00', '110.00', '0.00', '110.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(414, 382, 0, 66, '迎馨家纺全棉斜纹印花双人四件套邂逅 AB版纯棉，亲肤透气', 'TP0000066', 1, '210.00', '110.00', '0.00', '110.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(415, 383, 0, 141, '三星 Galaxy A9高配版 (A9100) 精灵黑 全网通4G手机 双卡双待', 'TP0000141', 9, '3599.00', '3400.00', '0.00', '3400.00', 0, '56', '颜色:白色', '', 0, 1, 2, 0, 0, ''),
(416, 383, 0, 62, '海信彩电LED55EC520UA 55英寸 14核 4K智能电视(黑色)', 'TP0000062', 3, '3699.00', '5699.00', '0.00', '5699.00', 0, '67', '尺寸:55', '', 0, 0, 0, 0, 0, ''),
(417, 383, 0, 141, '三星 Galaxy A9高配版 (A9100) 精灵黑 全网通4G手机 双卡双待', 'TP0000141', 1, '3599.00', '3499.00', '0.00', '3499.00', 0, '57', '颜色:金色', '', 0, 1, 2, 0, 0, ''),
(418, 383, 0, 124, 'Nikon/尼康D3300入门单反相机 升级版AF-P 18-55镜头套机 分期购', 'TP0000124', 1, '2499.00', '2399.00', '0.00', '2399.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(419, 384, 0, 140, 'Apple iPhone 6s 16GB 玫瑰金色 移动联通电信4G手机', 'TP0000140', 1, '4958.00', '6858.00', '0.00', '6858.00', 0, '11_28_100', '网络:4G 内存:32G 颜色:玫瑰金', '', 0, 0, 0, 0, 0, ''),
(420, 385, 0, 141, '三星 Galaxy A9高配版 (A9100) 精灵黑 全网通4G手机 双卡双待', 'TP0000141', 1, '3599.00', '3400.00', '0.00', '3400.00', 0, '57', '颜色:金色', '', 0, 1, 2, 0, 0, ''),
(421, 386, 0, 103, '珂兰钻石 18K金90分效果群镶钻石戒指 倾城 需定制', 'TP0000103', 2, '2099.00', '1999.00', '0.00', '1999.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(422, 387, 0, 123, 'Canon/佳能 EOS 750D单反套机（18-55mm）高清数码相机苏宁易购', 'TP0000123', 2, '4097.00', '3997.00', '0.00', '3997.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(423, 388, 0, 39, '华为（HUAWEI） M2 10.0 平板电脑 WiFi 月光银', 'TP0000039', 2, '2388.00', '4000.00', '0.00', '4000.00', 0, '41_47_52', '尺寸:7寸及以下 内存:16G 颜色:黑色', '', 0, 0, 0, 0, 0, ''),
(424, 389, 0, 141, '三星 Galaxy A9高配版 (A9100) 精灵黑 全网通4G手机 双卡双待', 'TP0000141', 1, '3599.00', '3499.00', '0.00', '3499.00', 0, '57', '颜色:金色', '', 0, 1, 2, 0, 0, ''),
(425, 390, 0, 66, '迎馨家纺全棉斜纹印花双人四件套邂逅 AB版纯棉，亲肤透气', 'TP0000066', 2, '210.00', '110.00', '0.00', '110.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(426, 391, 0, 66, '迎馨家纺全棉斜纹印花双人四件套邂逅 AB版纯棉，亲肤透气', 'TP0000066', 1, '210.00', '110.00', '0.00', '110.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(427, 392, 0, 66, '迎馨家纺全棉斜纹印花双人四件套邂逅 AB版纯棉，亲肤透气', 'TP0000066', 1, '210.00', '110.00', '0.00', '110.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(428, 393, 0, 119, '小米旗舰店正品手机平板通用迷你充电宝 移动电源10000毫安大容量', 'TP0000119', 1, '169.00', '69.00', '0.00', '69.00', 0, '103', '颜色:土豪金', '', 0, 0, 0, 0, 0, ''),
(429, 394, 0, 136, '靓号0元送广东联通4G/3G手机卡上网卡大流量套餐全国无漫游选号', 'TP0000136', 1, '220.00', '50.00', '0.00', '50.00', 0, '108', '合约套餐:乐享4G套餐99元', '', 0, 1, 3, 0, 0, ''),
(430, 395, 0, 129, '【蚂蚁摄影】Canon/佳能 PowerShot SX410 IS 媲单反长焦数码相机', 'TP0000129', 1, '1198.00', '1098.00', '0.00', '1098.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(431, 396, 0, 140, 'Apple iPhone 6s 16GB 玫瑰金色 移动联通电信4G手机', 'TP0000140', 2, '4958.00', '5868.00', '0.00', '5868.00', 0, '11_13_57', '网络:4G 内存:16G 颜色:金色', '', 0, 0, 0, 0, 0, ''),
(432, 397, 0, 1, 'Apple iPhone 6s Plus 16G 玫瑰金 移动联通电信4G手机', 'TP000000', 2, '6100.00', '0.01', '0.00', '0.01', 0, '11_100_102', '网络:4G 颜色:玫瑰金 内存:128G', '', 0, 0, 0, 0, 0, ''),
(433, 397, 0, 49, '荣耀畅玩5X 双卡双待 移动版 智能手机（破晓银）', 'TP0000049', 5, '1099.00', '999.00', '0.00', '999.00', 0, '11_13_21', '网络:4G 内存:16G 屏幕:触屏', '', 0, 0, 0, 0, 0, ''),
(434, 398, 0, 117, '小派M-20000超薄充电宝适用MIUI蘋果6s手机通用毫安移动电源便携', 'TP0000117', 1, '169.90', '69.90', '0.00', '69.90', 0, '103', '颜色:土豪金', '', 0, 0, 0, 0, 0, ''),
(435, 398, 0, 104, '小米手机5,十余项黑科技，很轻狠快', 'TP0000104', 1, '2099.00', '1999.00', '0.00', '1999.00', 0, '28_57', '内存:32G 颜色:金色', '', 0, 0, 0, 0, 0, ''),
(436, 399, 0, 39, '华为（HUAWEI） M2 10.0 平板电脑 WiFi 月光银', 'TP0000039', 1, '2388.00', '2300.00', '0.00', '2300.00', 0, '41_48_51', '尺寸:7寸及以下 内存:32G 颜色:银白色', '', 0, 0, 0, 0, 0, ''),
(437, 400, 0, 1, 'Apple iPhone 6s Plus 16G 玫瑰金 移动联通电信4G手机', 'TP000000', 2, '6100.00', '0.01', '0.00', '0.01', 0, '11_100_102', '网络:4G 颜色:玫瑰金 内存:128G', '', 0, 0, 0, 0, 0, ''),
(438, 400, 0, 46, '【北京移动老用户专享 话费六折】荣耀畅玩5X 双卡双待 移动版 智能手机（破晓银）', 'TP0000046', 2, '1099.00', '999.00', '0.00', '999.00', 0, '11_13_21', '网络:4G 内存:16G 屏幕:触屏', '', 0, 0, 0, 0, 0, ''),
(439, 400, 0, 119, '小米旗舰店正品手机平板通用迷你充电宝 移动电源10000毫安大容量', 'TP0000119', 4, '169.00', '69.00', '0.00', '69.00', 0, '103', '颜色:土豪金', '', 0, 0, 0, 0, 0, ''),
(440, 401, 0, 1, 'Apple iPhone 6s Plus 16G 玫瑰金 移动联通电信4G手机', 'TP000000', 2, '6100.00', '0.01', '0.00', '0.01', 0, '11_100_102', '网络:4G 颜色:玫瑰金 内存:128G', '', 0, 0, 0, 0, 0, ''),
(441, 402, 0, 46, '【北京移动老用户专享 话费六折】荣耀畅玩5X 双卡双待 移动版 智能手机（破晓银）', 'TP0000046', 11, '1099.00', '999.00', '0.00', '999.00', 0, '11_13_21', '网络:4G 内存:16G 屏幕:触屏', '', 0, 0, 0, 0, 0, ''),
(442, 402, 0, 104, '小米手机5,十余项黑科技，很轻狠快', 'TP0000104', 1, '2099.00', '1999.00', '0.00', '1999.00', 0, '28_57', '内存:32G 颜色:金色', '', 0, 0, 0, 0, 0, ''),
(443, 402, 0, 115, '爸爸2陆毅代言索扬20000毫安充电宝轻薄正品手机通用移动电源MAh', 'TP0000115', 1, '184.90', '84.90', '0.00', '84.90', 0, '103', '颜色:土豪金', '', 0, 0, 0, 0, 0, ''),
(444, 402, 0, 121, '科智50000通用充电宝20000毫安冲手机蘋果6s超薄可爱便携移动电源', 'TP0000121', 1, '169.90', '69.90', '0.00', '69.90', 0, '104', '颜色:象牙白', '', 0, 0, 0, 0, 0, ''),
(445, 403, 0, 115, '爸爸2陆毅代言索扬20000毫安充电宝轻薄正品手机通用移动电源MAh', 'TP0000115', 1, '184.90', '84.90', '0.00', '84.90', 0, '104', '颜色:象牙白', '', 0, 0, 0, 0, 0, ''),
(446, 404, 0, 1, 'Apple iPhone 6s Plus 16G 玫瑰金 移动联通电信4G手机', 'TP000000', 1, '6100.00', '0.01', '0.00', '0.01', 0, '11_100_102', '网络:4G 颜色:玫瑰金 内存:128G', '', 0, 0, 0, 0, 0, ''),
(447, 404, 0, 104, '小米手机5,十余项黑科技，很轻狠快', 'TP0000104', 1, '2099.00', '1999.00', '0.00', '1999.00', 0, '28_57', '内存:32G 颜色:金色', '', 0, 0, 0, 0, 0, ''),
(448, 405, 0, 66, '迎馨家纺全棉斜纹印花双人四件套邂逅 AB版纯棉，亲肤透气', 'TP0000066', 1, '210.00', '110.00', '0.00', '110.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(449, 406, 0, 142, '海尔（Haier）BCD-251WDGW 251升 无霜两门冰箱（白色）', 'TP0000142', 1, '2799.00', '2699.00', '0.00', '2699.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(450, 407, 0, 119, '小米旗舰店正品手机平板通用迷你充电宝 移动电源10000毫安大容量', 'TP0000119', 3, '169.00', '69.00', '0.00', '69.00', 0, '103', '颜色:土豪金', '', 0, 0, 0, 0, 0, ''),
(451, 407, 0, 81, '纤慕文胸 女无钢圈聚拢一片式无痕拉丝美背内衣', 'TP0000081', 3, '208.00', '108.00', '0.00', '108.00', 0, '87', '尺码:70A', '', 0, 0, 0, 0, 0, ''),
(452, 408, 0, 119, '小米旗舰店正品手机平板通用迷你充电宝 移动电源10000毫安大容量', 'TP0000119', 1, '169.00', '69.00', '0.00', '69.00', 0, '104', '颜色:象牙白', '', 0, 0, 0, 0, 0, ''),
(453, 409, 0, 39, '华为（HUAWEI） M2 10.0 平板电脑 WiFi 月光银', 'TP0000039', 1, '2388.00', '2300.00', '0.00', '2300.00', 0, '41_48_51', '尺寸:7寸及以下 内存:32G 颜色:银白色', '', 0, 0, 0, 0, 0, ''),
(454, 410, 0, 141, '三星 Galaxy A9高配版 (A9100) 精灵黑 全网通4G手机 双卡双待', 'TP0000141', 2, '3599.00', '3400.00', '0.00', '3400.00', 0, '55', '颜色:黑色', '', 0, 1, 2, 0, 0, ''),
(455, 411, 0, 66, '迎馨家纺全棉斜纹印花双人四件套邂逅 AB版纯棉，亲肤透气', 'TP0000066', 1, '210.00', '110.00', '0.00', '110.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(456, 412, 0, 119, '小米旗舰店正品手机平板通用迷你充电宝 移动电源10000毫安大容量', 'TP0000119', 1, '169.00', '69.00', '0.00', '69.00', 0, '103', '颜色:土豪金', '', 0, 0, 0, 0, 0, ''),
(457, 413, 0, 143, 'haier海尔 BC-93TMPF 93升单门冰箱', 'TP0000143', 1, '799.00', '0.01', '0.00', '0.01', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(458, 414, 0, 119, '小米旗舰店正品手机平板通用迷你充电宝 移动电源10000毫安大容量', 'TP0000119', 1, '169.00', '69.00', '0.00', '69.00', 0, '103', '颜色:土豪金', '', 0, 0, 0, 0, 0, ''),
(459, 415, 0, 143, 'haier海尔 BC-93TMPF 93升单门冰箱', 'TP0000143', 1, '799.00', '0.01', '0.00', '0.01', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(460, 416, 0, 81, '纤慕文胸 女无钢圈聚拢一片式无痕拉丝美背内衣', 'TP0000081', 2, '208.00', '108.00', '0.00', '108.00', 0, '97', '尺码:85B', '', 0, 0, 0, 0, 0, ''),
(461, 417, 0, 39, '华为（HUAWEI） M2 10.0 平板电脑 WiFi 月光银', 'TP0000039', 1, '2388.00', '4000.00', '0.00', '4000.00', 0, '41_47_52', '尺寸:7寸及以下 内存:16G 颜色:黑色', '', 0, 0, 0, 0, 0, ''),
(462, 418, 0, 1, 'Apple iPhone 6s Plus 16G 玫瑰金 移动联通电信4G手机', 'TP000000', 1, '6100.00', '0.01', '0.00', '0.01', 0, '11_100_102', '网络:4G 颜色:玫瑰金 内存:128G', '', 0, 0, 0, 0, 0, ''),
(463, 419, 0, 66, '迎馨家纺全棉斜纹印花双人四件套邂逅 AB版纯棉，亲肤透气', 'TP0000066', 1, '210.00', '110.00', '0.00', '110.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(464, 420, 0, 1, 'Apple iPhone 6s Plus 16G 玫瑰金 移动联通电信4G手机', 'TP000000', 1, '6100.00', '0.01', '0.00', '0.01', 0, '11_100_102', '网络:4G 颜色:玫瑰金 内存:128G', '', 0, 0, 0, 0, 0, ''),
(465, 421, 0, 1, 'Apple iPhone 6s Plus 16G 玫瑰金 移动联通电信4G手机', 'TP000000', 1, '6100.00', '0.01', '0.00', '0.01', 0, '11_100_102', '网络:4G 颜色:玫瑰金 内存:128G', '', 0, 0, 0, 0, 0, ''),
(466, 422, 0, 1, 'Apple iPhone 6s Plus 16G 玫瑰金 移动联通电信4G手机', 'TP000000', 1, '6100.00', '0.01', '0.00', '0.01', 0, '11_100_102', '网络:4G 颜色:玫瑰金 内存:128G', '', 0, 0, 0, 0, 0, ''),
(467, 423, 0, 1, 'Apple iPhone 6s Plus 16G 玫瑰金 移动联通电信4G手机', 'TP000000', 1, '6100.00', '0.01', '0.00', '0.01', 0, '11_100_102', '网络:4G 颜色:玫瑰金 内存:128G', '', 0, 0, 0, 0, 0, ''),
(468, 424, 0, 1, 'Apple iPhone 6s Plus 16G 玫瑰金 移动联通电信4G手机', 'TP000000', 1, '6100.00', '0.01', '0.00', '0.01', 0, '11_100_102', '网络:4G 颜色:玫瑰金 内存:128G', '', 0, 0, 0, 0, 0, ''),
(469, 425, 0, 1, 'Apple iPhone 6s Plus 16G 玫瑰金 移动联通电信4G手机', 'TP000000', 1, '6100.00', '0.01', '0.00', '0.01', 0, '11_100_102', '网络:4G 颜色:玫瑰金 内存:128G', '', 0, 0, 0, 0, 0, ''),
(470, 426, 0, 1, 'Apple iPhone 6s Plus 16G 玫瑰金 移动联通电信4G手机', 'TP000000', 2, '6100.00', '0.01', '0.00', '0.01', 0, '11_100_102', '网络:4G 颜色:玫瑰金 内存:128G', '', 0, 0, 0, 0, 0, ''),
(471, 427, 0, 119, '小米旗舰店正品手机平板通用迷你充电宝 移动电源10000毫安大容量', 'TP0000119', 2, '169.00', '69.00', '0.00', '69.00', 0, '103', '颜色:土豪金', '', 0, 0, 0, 0, 0, ''),
(472, 428, 0, 123, 'Canon/佳能 EOS 750D单反套机（18-55mm）高清数码相机苏宁易购', 'TP0000123', 1, '4097.00', '3997.00', '0.00', '3917.06', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(473, 429, 0, 1, 'Apple iPhone 6s Plus 16G 玫瑰金 移动联通电信4G手机', 'TP000000', 1, '6100.00', '0.01', '0.00', '0.01', 0, '11_100_102', '网络:4G 颜色:玫瑰金 内存:128G', '', 0, 0, 0, 0, 0, ''),
(474, 430, 0, 1, 'Apple iPhone 6s Plus 16G 玫瑰金 移动联通电信4G手机', 'TP000000', 2, '6100.00', '0.01', '0.00', '0.01', 0, '11_100_102', '网络:4G 颜色:玫瑰金 内存:128G', '', 0, 0, 0, 0, 0, ''),
(475, 431, 0, 119, '小米旗舰店正品手机平板通用迷你充电宝 移动电源10000毫安大容量', 'TP0000119', 1, '169.00', '69.00', '0.00', '69.00', 0, '103', '颜色:土豪金', '', 0, 0, 0, 0, 0, ''),
(476, 432, 0, 119, '小米旗舰店正品手机平板通用迷你充电宝 移动电源10000毫安大容量', 'TP0000119', 1, '169.00', '69.00', '0.00', '69.00', 0, '103', '颜色:土豪金', '', 0, 0, 0, 0, 0, ''),
(477, 433, 0, 66, '迎馨家纺全棉斜纹印花双人四件套邂逅 AB版纯棉，亲肤透气', 'TP0000066', 1, '210.00', '110.00', '0.00', '110.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(478, 434, 0, 66, '迎馨家纺全棉斜纹印花双人四件套邂逅 AB版纯棉，亲肤透气', 'TP0000066', 9, '210.00', '110.00', '0.00', '110.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(479, 435, 0, 104, '小米手机5,十余项黑科技，很轻狠快', 'TP0000104', 1, '2099.00', '2100.00', '0.00', '2100.00', 0, '55_101', '颜色:黑色 内存:64G', '', 0, 0, 0, 0, 0, ''),
(480, 436, 0, 67, '迎馨家纺 全棉斜纹印花双人四件套 约定 桔色 1.5米床', 'TP0000067', 1, '200.00', '100.00', '0.00', '98.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(481, 437, 0, 135, '重庆电信手机卡电话卡语音卡选靓号3G4G卡内部5折卡低资费（飞）', 'TP0000135', 1, '160.00', '59.00', '0.00', '59.00', 0, '107', '合约套餐:乐享4G套餐79元', '', 0, 0, 0, 0, 0, ''),
(482, 438, 0, 119, '小米旗舰店正品手机平板通用迷你充电宝 移动电源10000毫安大容量', 'TP0000119', 1, '169.00', '69.00', '0.00', '69.00', 0, '104', '颜色:象牙白', '', 0, 0, 0, 0, 0, ''),
(483, 439, 0, 104, '小米手机5,十余项黑科技，很轻狠快', 'TP0000104', 1, '2099.00', '1999.00', '0.00', '1959.02', 0, '28_57', '内存:32G 颜色:金色', '', 0, 0, 0, 0, 0, ''),
(484, 440, 0, 141, '三星 Galaxy A9高配版 (A9100) 精灵黑 全网通4G手机 双卡双待', 'TP0000141', 1, '3599.00', '3499.00', '0.00', '3499.00', 0, '55', '颜色:黑色', '', 0, 1, 2, 0, 0, ''),
(485, 441, 0, 119, '小米旗舰店正品手机平板通用迷你充电宝 移动电源10000毫安大容量', 'TP0000119', 1, '169.00', '69.00', '0.00', '69.00', 0, '103', '颜色:土豪金', '', 0, 0, 0, 0, 0, ''),
(486, 442, 0, 119, '小米旗舰店正品手机平板通用迷你充电宝 移动电源10000毫安大容量', 'TP0000119', 2, '169.00', '69.00', '0.00', '69.00', 0, '104', '颜色:象牙白', '', 0, 0, 0, 0, 0, ''),
(487, 443, 0, 46, '【北京移动老用户专享 话费六折】荣耀畅玩5X 双卡双待 移动版 智能手机（破晓银）', 'TP0000046', 1, '1099.00', '999.00', '0.00', '979.02', 0, '11_13_21', '网络:4G 内存:16G 屏幕:触屏', '', 0, 0, 0, 0, 0, ''),
(488, 444, 0, 125, '【0首付分期】蚂蚁摄影联保单反数码相机Canon/佳能 EOS 760D套机', 'TP0000125', 2, '5599.00', '5499.00', '0.00', '5389.02', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(489, 445, 0, 141, '三星 Galaxy A9高配版 (A9100) 精灵黑 全网通4G手机 双卡双待', 'TP0000141', 1, '3599.00', '3400.00', '0.00', '3400.00', 0, '57', '颜色:金色', '', 0, 1, 2, 0, 0, ''),
(490, 446, 0, 104, '小米手机5,十余项黑科技，很轻狠快', 'TP0000104', 1, '2099.00', '2100.00', '0.00', '2100.00', 0, '57_101', '颜色:金色 内存:64G', '', 0, 0, 0, 0, 0, ''),
(491, 447, 0, 66, '迎馨家纺全棉斜纹印花双人四件套邂逅 AB版纯棉，亲肤透气', 'TP0000066', 1, '210.00', '110.00', '0.00', '110.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(492, 448, 0, 1, 'Apple iPhone 6s Plus 16G 玫瑰金 移动联通电信4G手机', 'TP000000', 1, '6100.00', '0.01', '0.00', '0.01', 0, '11_100_102', '网络:4G 颜色:玫瑰金 内存:128G', '', 0, 0, 0, 0, 0, ''),
(493, 448, 0, 39, '华为（HUAWEI） M2 10.0 平板电脑 WiFi 月光银', 'TP0000039', 3, '2388.00', '4000.00', '0.00', '3920.00', 0, '41_47_52', '尺寸:7寸及以下 内存:16G 颜色:黑色', '', 0, 0, 0, 0, 0, ''),
(494, 448, 0, 56, '创维（skyworth）55M5 55英寸4K超高清网络智能液晶电视机', 'TP0000056', 1, '3799.00', '3399.00', '0.00', '3331.02', 0, '66', '尺寸:50', '', 0, 0, 0, 0, 0, ''),
(495, 449, 0, 39, '华为（HUAWEI） M2 10.0 平板电脑 WiFi 月光银', 'TP0000039', 1, '2388.00', '2500.00', '0.00', '2450.00', 0, '42_47_51', '尺寸:7.8-9寸 内存:16G 颜色:银白色', '', 0, 0, 0, 0, 0, ''),
(496, 449, 0, 46, '【北京移动老用户专享 话费六折】荣耀畅玩5X 双卡双待 移动版 智能手机（破晓银）', 'TP0000046', 1, '1099.00', '999.00', '0.00', '979.02', 0, '11_13_21', '网络:4G 内存:16G 屏幕:触屏', '', 0, 0, 0, 0, 0, ''),
(497, 450, 0, 39, '华为（HUAWEI） M2 10.0 平板电脑 WiFi 月光银', 'TP0000039', 1, '2388.00', '2300.00', '0.00', '2254.00', 0, '41_48_51', '尺寸:7寸及以下 内存:32G 颜色:银白色', '', 0, 0, 0, 0, 0, ''),
(498, 450, 0, 58, '海信彩电LED55EC290N 55英寸 全高清 智能 网络 LED液晶电视', 'TP0000058', 2, '3299.00', '2399.00', '0.00', '2351.02', 0, '66', '尺寸:50', '', 0, 0, 0, 0, 0, ''),
(499, 451, 0, 56, '创维（skyworth）55M5 55英寸4K超高清网络智能液晶电视机', 'TP0000056', 1, '3799.00', '3399.00', '0.00', '3331.02', 0, '66', '尺寸:50', '', 0, 0, 0, 0, 0, ''),
(500, 452, 0, 143, 'haier海尔 BC-93TMPF 93升单门冰箱', 'TP0000143', 1, '799.00', '0.01', '0.00', '0.01', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(501, 453, 0, 117, '小派M-20000超薄充电宝适用MIUI蘋果6s手机通用毫安移动电源便携', 'TP0000117', 4, '169.90', '69.90', '0.00', '69.90', 0, '103', '颜色:土豪金', '', 0, 0, 0, 0, 0, ''),
(502, 454, 0, 46, '【北京移动老用户专享 话费六折】荣耀畅玩5X 双卡双待 移动版 智能手机（破晓银）', 'TP0000046', 1, '1099.00', '999.00', '0.00', '979.02', 0, '11_13_21', '网络:4G 内存:16G 屏幕:触屏', '', 0, 0, 0, 0, 0, ''),
(503, 455, 0, 141, '三星 Galaxy A9高配版 (A9100) 精灵黑 全网通4G手机 双卡双待', 'TP0000141', 1, '3599.00', '3400.00', '0.00', '3400.00', 0, '56', '颜色:白色', '', 0, 1, 2, 0, 0, ''),
(504, 456, 0, 66, '迎馨家纺全棉斜纹印花双人四件套邂逅 AB版纯棉，亲肤透气', 'TP0000066', 1, '210.00', '110.00', '0.00', '110.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(505, 456, 0, 119, '小米旗舰店正品手机平板通用迷你充电宝 移动电源10000毫安大容量', 'TP0000119', 1, '169.00', '69.00', '0.00', '69.00', 0, '104', '颜色:象牙白', '', 0, 0, 0, 0, 0, ''),
(506, 457, 0, 67, '迎馨家纺 全棉斜纹印花双人四件套 约定 桔色 1.5米床', 'TP0000067', 2, '200.00', '100.00', '0.00', '100.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(507, 458, 0, 143, 'haier海尔 BC-93TMPF 93升单门冰箱', 'TP0000143', 1, '799.00', '0.01', '0.00', '0.01', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(508, 459, 0, 76, '韩文2015冬装新款女装红色双排扣配腰带毛呢大衣.', 'TP0000076', 1, '389.00', '299.00', '0.00', '299.00', 0, '78', '尺码:M', '', 0, 0, 0, 0, 0, ''),
(509, 460, 0, 66, '迎馨家纺全棉斜纹印花双人四件套邂逅 AB版纯棉，亲肤透气', 'TP0000066', 3, '210.00', '110.00', '0.00', '110.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(510, 461, 0, 76, '韩文2015冬装新款女装红色双排扣配腰带毛呢大衣.', 'TP0000076', 2, '389.00', '299.00', '0.00', '299.00', 0, '78', '尺码:M', '', 0, 0, 0, 0, 0, ''),
(511, 462, 0, 1, 'Apple iPhone 6s Plus 16G 玫瑰金 移动联通电信4G手机', 'TP000000', 1, '6100.00', '0.01', '0.00', '0.01', 0, '11_100_102', '网络:4G 颜色:玫瑰金 内存:128G', '', 0, 0, 0, 0, 0, ''),
(512, 463, 0, 46, '【北京移动老用户专享 话费六折】荣耀畅玩5X 双卡双待 移动版 智能手机（破晓银）', 'TP0000046', 1, '1099.00', '999.00', '0.00', '979.02', 0, '11_13_21', '网络:4G 内存:16G 屏幕:触屏', '', 0, 0, 0, 0, 0, ''),
(513, 464, 0, 41, '华为（HUAWEI） M2 8英寸平板电脑（1920×1200 IPS屏 海思麒麟930 16GB WiFi）香槟金', 'TP0000041', 1, '1688.00', '1588.00', '0.00', '1556.24', 0, '41_47_51', '尺寸:7寸及以下 内存:16G 颜色:银白色', '', 0, 0, 0, 0, 0, ''),
(514, 464, 0, 1, 'Apple iPhone 6s Plus 16G 玫瑰金 移动联通电信4G手机', 'TP000000', 1, '6100.00', '0.01', '0.00', '0.01', 0, '11_100_102', '网络:4G 颜色:玫瑰金 内存:128G', '', 0, 0, 0, 0, 0, ''),
(515, 465, 0, 39, '华为（HUAWEI） M2 10.0 平板电脑 WiFi 月光银', 'TP0000039', 1, '2388.00', '2000.00', '0.00', '2000.00', 0, '41_47_51', '尺寸:7寸及以下 内存:16G 颜色:银白色', '', 0, 0, 0, 0, 0, ''),
(516, 466, 0, 58, '海信彩电LED55EC290N 55英寸 全高清 智能 网络 LED液晶电视', 'TP0000058', 1, '3299.00', '3399.00', '0.00', '3331.02', 0, '67', '尺寸:55', '', 0, 0, 0, 0, 0, ''),
(517, 467, 0, 140, 'Apple iPhone 6s 16GB 玫瑰金色 移动联通电信4G手机', 'TP0000140', 1, '4958.00', '5868.00', '0.00', '5750.64', 0, '11_13_57', '网络:4G 内存:16G 颜色:金色', '', 0, 0, 0, 0, 0, ''),
(518, 468, 0, 141, '三星 Galaxy A9高配版 (A9100) 精灵黑 全网通4G手机 双卡双待', 'TP0000141', 1, '3599.00', '3400.00', '0.00', '3400.00', 0, '57', '颜色:金色', '', 0, 1, 2, 0, 0, ''),
(519, 469, 0, 141, '三星 Galaxy A9高配版 (A9100) 精灵黑 全网通4G手机 双卡双待', 'TP0000141', 1, '3599.00', '3400.00', '0.00', '3400.00', 0, '56', '颜色:白色', '', 0, 1, 2, 0, 0, ''),
(520, 470, 0, 119, '小米旗舰店正品手机平板通用迷你充电宝 移动电源10000毫安大容量', 'TP0000119', 1, '169.00', '69.00', '0.00', '69.00', 0, '103', '颜色:土豪金', '', 0, 0, 0, 0, 0, ''),
(521, 471, 0, 46, '【北京移动老用户专享 话费六折】荣耀畅玩5X 双卡双待 移动版 智能手机（破晓银）', 'TP0000046', 1, '1099.00', '999.00', '0.00', '979.02', 0, '11_13_21', '网络:4G 内存:16G 屏幕:触屏', '', 0, 0, 0, 0, 0, ''),
(522, 472, 0, 66, '迎馨家纺全棉斜纹印花双人四件套邂逅 AB版纯棉，亲肤透气', 'TP0000066', 1, '210.00', '110.00', '0.00', '110.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(523, 473, 0, 143, 'haier海尔 BC-93TMPF 93升单门冰箱', 'TP0000143', 1, '799.00', '0.01', '0.00', '0.01', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(524, 474, 0, 56, '创维（skyworth）55M5 55英寸4K超高清网络智能液晶电视机', 'TP0000056', 1, '3799.00', '4399.00', '0.00', '4311.02', 0, '67', '尺寸:55', '', 0, 0, 0, 0, 0, ''),
(525, 475, 0, 119, '小米旗舰店正品手机平板通用迷你充电宝 移动电源10000毫安大容量', 'TP0000119', 2, '169.00', '69.00', '0.00', '69.00', 0, '103', '颜色:土豪金', '', 0, 0, 0, 0, 0, ''),
(526, 476, 0, 48, '荣耀7 双卡双待双通 移动4G版 16GB存储（冰河银）豪华套装一', 'TP0000048', 1, '2199.00', '2099.00', '0.00', '2057.02', 0, '11_13_21', '网络:4G 内存:16G 屏幕:触屏', '', 0, 0, 0, 0, 0, ''),
(527, 477, 0, 1, 'Apple iPhone 6s Plus 16G 玫瑰金 移动联通电信4G手机', 'TP000000', 1, '6100.00', '0.01', '0.00', '0.01', 0, '11_100_102', '网络:4G 颜色:玫瑰金 内存:128G', '', 0, 0, 0, 0, 0, ''),
(528, 478, 0, 39, '华为（HUAWEI） M2 10.0 平板电脑 WiFi 月光银', 'TP0000039', 1, '2388.00', '2500.00', '0.00', '2450.00', 0, '42_47_51', '尺寸:7.8-9寸 内存:16G 颜色:银白色', '', 0, 0, 0, 0, 0, ''),
(529, 479, 0, 58, '海信彩电LED55EC290N 55英寸 全高清 智能 网络 LED液晶电视', 'TP0000058', 1, '3299.00', '2399.00', '0.00', '2351.02', 0, '66', '尺寸:50', '', 0, 0, 0, 0, 0, ''),
(530, 480, 0, 141, '三星 Galaxy A9高配版 (A9100) 精灵黑 全网通4G手机 双卡双待', 'TP0000141', 1, '3599.00', '3400.00', '0.00', '3400.00', 0, '55', '颜色:黑色', '', 0, 1, 2, 0, 0, ''),
(531, 481, 0, 56, '创维（skyworth）55M5 55英寸4K超高清网络智能液晶电视机', 'TP0000056', 1, '3799.00', '3399.00', '0.00', '3331.02', 0, '66', '尺寸:50', '', 0, 0, 0, 0, 0, ''),
(532, 482, 0, 46, '【北京移动老用户专享 话费六折】荣耀畅玩5X 双卡双待 移动版 智能手机（破晓银）', 'TP0000046', 1, '1099.00', '999.00', '0.00', '979.02', 0, '11_13_21', '网络:4G 内存:16G 屏幕:触屏', '', 0, 0, 0, 0, 0, ''),
(533, 483, 0, 1, 'Apple iPhone 6s Plus 16G 玫瑰金 移动联通电信4G手机', 'TP000000', 1, '6100.00', '0.01', '0.00', '0.01', 0, '11_100_102', '网络:4G 颜色:玫瑰金 内存:128G', '', 0, 0, 0, 0, 0, ''),
(534, 484, 0, 119, '小米旗舰店正品手机平板通用迷你充电宝 移动电源10000毫安大容量', 'TP0000119', 1, '169.00', '69.00', '0.00', '69.00', 0, '104', '颜色:象牙白', '', 0, 0, 0, 0, 0, ''),
(535, 485, 0, 71, '布雷尔 床 皮床 双人床 真皮床 软床 皮艺床 1.8米婚床', 'TP0000071', 1, '1680.00', '1580.00', '0.00', '1580.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(536, 486, 0, 143, 'haier海尔 BC-93TMPF 93升单门冰箱', 'TP0000143', 2, '799.00', '0.01', '0.00', '0.01', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(537, 487, 0, 67, '迎馨家纺 全棉斜纹印花双人四件套 约定 桔色 1.5米床', 'TP0000067', 1, '200.00', '100.00', '0.00', '100.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(538, 487, 0, 39, '华为（HUAWEI） M2 10.0 平板电脑 WiFi 月光银', 'TP0000039', 2, '2388.00', '2500.00', '0.00', '2500.00', 0, '42_47_51', '尺寸:7.8-9寸 内存:16G 颜色:银白色', '', 0, 0, 0, 0, 0, ''),
(539, 488, 0, 119, '小米旗舰店正品手机平板通用迷你充电宝 移动电源10000毫安大容量', 'TP0000119', 1, '169.00', '69.00', '0.00', '69.00', 0, '103', '颜色:土豪金', '', 0, 0, 0, 0, 0, ''),
(540, 489, 0, 66, '迎馨家纺全棉斜纹印花双人四件套邂逅 AB版纯棉，亲肤透气', 'TP0000066', 1, '210.00', '110.00', '0.00', '107.80', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(541, 490, 0, 142, '海尔（Haier）BCD-251WDGW 251升 无霜两门冰箱（白色）', 'TP0000142', 1, '2799.00', '2699.00', '0.00', '2699.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(542, 491, 0, 141, '三星 Galaxy A9高配版 (A9100) 精灵黑 全网通4G手机 双卡双待', 'TP0000141', 1, '3599.00', '3400.00', '0.00', '3400.00', 0, '57', '颜色:金色', '', 0, 1, 2, 0, 0, ''),
(543, 492, 0, 141, '三星 Galaxy A9高配版 (A9100) 精灵黑 全网通4G手机 双卡双待', 'TP0000141', 1, '3599.00', '3400.00', '0.00', '3400.00', 0, '55', '颜色:黑色', '', 0, 1, 2, 0, 0, ''),
(544, 492, 0, 119, '小米旗舰店正品手机平板通用迷你充电宝 移动电源10000毫安大容量', 'TP0000119', 1, '169.00', '69.00', '0.00', '69.00', 0, '103', '颜色:土豪金', '', 0, 0, 0, 0, 0, ''),
(545, 493, 0, 133, '电信手机卡 电信4G流量卡全国通用手机号码卡选号电话卡上网卡', 'TP0000133', 2, '200.00', '59.00', '0.00', '59.00', 0, '108', '合约套餐:乐享4G套餐99元', '', 0, 0, 0, 0, 0, ''),
(546, 494, 0, 123, 'Canon/佳能 EOS 750D单反套机（18-55mm）高清数码相机苏宁易购', 'TP0000123', 1, '4097.00', '3997.00', '0.00', '3997.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(547, 494, 0, 115, '爸爸2陆毅代言索扬20000毫安充电宝轻薄正品手机通用移动电源MAh', 'TP0000115', 1, '184.90', '84.90', '0.00', '84.90', 0, '105', '颜色:宝石蓝', '', 0, 0, 0, 0, 0, ''),
(548, 495, 0, 141, '三星 Galaxy A9高配版 (A9100) 精灵黑 全网通4G手机 双卡双待', 'TP0000141', 1, '3599.00', '3400.00', '0.00', '3400.00', 0, '57', '颜色:金色', '', 0, 1, 2, 0, 0, ''),
(549, 496, 0, 143, 'haier海尔 BC-93TMPF 93升单门冰箱', 'TP0000143', 4, '799.00', '0.01', '0.00', '0.01', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(550, 497, 0, 143, 'haier海尔 BC-93TMPF 93升单门冰箱', 'TP0000143', 1, '799.00', '0.01', '0.00', '0.01', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(551, 498, 0, 119, '小米旗舰店正品手机平板通用迷你充电宝 移动电源10000毫安大容量', 'TP0000119', 1, '169.00', '69.00', '0.00', '69.00', 0, '103', '颜色:土豪金', '', 0, 0, 0, 0, 0, ''),
(552, 499, 0, 1, 'Apple iPhone 6s Plus 16G 玫瑰金 移动联通电信4G手机', 'TP000000', 1, '6100.00', '0.01', '0.00', '0.01', 0, '11_100_102', '网络:4G 颜色:玫瑰金 内存:128G', '', 0, 0, 0, 0, 0, ''),
(553, 500, 0, 143, 'haier海尔 BC-93TMPF 93升单门冰箱', 'TP0000143', 1, '799.00', '0.01', '0.00', '0.01', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(554, 501, 0, 141, '三星 Galaxy A9高配版 (A9100) 精灵黑 全网通4G手机 双卡双待', 'TP0000141', 1, '3599.00', '3400.00', '0.00', '3400.00', 0, '57', '颜色:金色', '', 0, 1, 2, 0, 0, ''),
(555, 502, 0, 119, '小米旗舰店正品手机平板通用迷你充电宝 移动电源10000毫安大容量', 'TP0000119', 1, '169.00', '69.00', '0.00', '69.00', 0, '103', '颜色:土豪金', '', 0, 0, 0, 0, 0, ''),
(556, 503, 0, 119, '小米旗舰店正品手机平板通用迷你充电宝 移动电源10000毫安大容量', 'TP0000119', 2, '169.00', '69.00', '0.00', '69.00', 0, '103', '颜色:土豪金', '', 0, 0, 0, 0, 0, ''),
(557, 504, 0, 136, '靓号0元送广东联通4G/3G手机卡上网卡大流量套餐全国无漫游选号', 'TP0000136', 1, '220.00', '120.00', '0.00', '120.00', 0, '108', '合约套餐:乐享4G套餐99元', '', 0, 1, 3, 0, 0, ''),
(558, 504, 0, 1, 'Apple iPhone 6s Plus 16G 玫瑰金 移动联通电信4G手机', 'TP000000', 1, '6100.00', '0.01', '0.00', '0.01', 0, '11_100_102', '网络:4G 颜色:玫瑰金 内存:128G', '', 0, 0, 0, 0, 0, ''),
(559, 505, 0, 123, 'Canon/佳能 EOS 750D单反套机（18-55mm）高清数码相机苏宁易购', 'TP0000123', 1, '4097.00', '3997.00', '0.00', '3997.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(560, 506, 0, 123, 'Canon/佳能 EOS 750D单反套机（18-55mm）高清数码相机苏宁易购', 'TP0000123', 1, '4097.00', '3997.00', '0.00', '3917.06', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(561, 507, 0, 67, '迎馨家纺 全棉斜纹印花双人四件套 约定 桔色 1.5米床', 'TP0000067', 2, '200.00', '100.00', '0.00', '100.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(562, 507, 0, 141, '三星 Galaxy A9高配版 (A9100) 精灵黑 全网通4G手机 双卡双待', 'TP0000141', 1, '3599.00', '3400.00', '0.00', '3400.00', 0, '56', '颜色:白色', '', 0, 1, 2, 0, 0, '');
INSERT INTO `ruike_mall_order_goods` (`rec_id`, `order_id`, `member_id`, `goods_id`, `goods_name`, `goods_sn`, `goods_num`, `market_price`, `goods_price`, `cost_price`, `member_goods_price`, `give_integral`, `spec_key`, `spec_key_name`, `bar_code`, `is_comment`, `prom_type`, `prom_id`, `is_send`, `delivery_id`, `sku`) VALUES
(563, 508, 0, 141, '三星 Galaxy A9高配版 (A9100) 精灵黑 全网通4G手机 双卡双待', 'TP0000141', 1, '3599.00', '3400.00', '0.00', '3400.00', 0, '57', '颜色:金色', '', 0, 1, 2, 0, 0, ''),
(564, 509, 0, 140, 'Apple iPhone 6s 16GB 玫瑰金色 移动联通电信4G手机', 'TP0000140', 1, '4958.00', '4858.00', '0.00', '4858.00', 0, '11_13_55', '网络:4G 内存:16G 颜色:黑色', '', 0, 0, 0, 0, 0, ''),
(565, 510, 0, 126, 'Canon/佳能 EOS 700D套机（18-55mm)数码单反相机 苏宁易购', 'TP0000126', 1, '3599.00', '3499.00', '0.00', '3499.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(566, 511, 0, 141, '三星 Galaxy A9高配版 (A9100) 精灵黑 全网通4G手机 双卡双待', 'TP0000141', 1, '3599.00', '3499.00', '0.00', '3499.00', 0, '56', '颜色:白色', '', 0, 1, 2, 0, 0, ''),
(567, 511, 0, 39, '华为（HUAWEI） M2 10.0 平板电脑 WiFi 月光银', 'TP0000039', 1, '2388.00', '2500.00', '0.00', '2500.00', 0, '42_47_51', '尺寸:7.8-9寸 内存:16G 颜色:银白色', '', 0, 0, 0, 0, 0, ''),
(568, 511, 0, 67, '迎馨家纺 全棉斜纹印花双人四件套 约定 桔色 1.5米床', 'TP0000067', 3, '200.00', '100.00', '0.00', '100.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(569, 511, 0, 141, '三星 Galaxy A9高配版 (A9100) 精灵黑 全网通4G手机 双卡双待', 'TP0000141', 1, '3599.00', '3499.00', '0.00', '3499.00', 0, '57', '颜色:金色', '', 0, 1, 2, 0, 0, ''),
(570, 512, 0, 119, '小米旗舰店正品手机平板通用迷你充电宝 移动电源10000毫安大容量', 'TP0000119', 1, '169.00', '69.00', '0.00', '69.00', 0, '103', '颜色:土豪金', '', 0, 0, 0, 0, 0, ''),
(571, 512, 0, 143, 'haier海尔 BC-93TMPF 93升单门冰箱', 'TP0000143', 1, '799.00', '0.01', '0.00', '0.01', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(572, 513, 0, 81, '纤慕文胸 女无钢圈聚拢一片式无痕拉丝美背内衣', 'TP0000081', 1, '208.00', '108.00', '0.00', '108.00', 0, '95', '尺码:80C', '', 0, 0, 0, 0, 0, ''),
(573, 514, 0, 119, '小米旗舰店正品手机平板通用迷你充电宝 移动电源10000毫安大容量', 'TP0000119', 1, '169.00', '69.00', '0.00', '69.00', 0, '103', '颜色:土豪金', '', 0, 0, 0, 0, 0, ''),
(574, 514, 0, 143, 'haier海尔 BC-93TMPF 93升单门冰箱', 'TP0000143', 1, '799.00', '0.01', '0.00', '0.01', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(575, 515, 0, 141, '三星 Galaxy A9高配版 (A9100) 精灵黑 全网通4G手机 双卡双待', 'TP0000141', 1, '3599.00', '3400.00', '0.00', '3400.00', 0, '55', '颜色:黑色', '', 0, 1, 2, 0, 0, ''),
(576, 516, 0, 66, '迎馨家纺全棉斜纹印花双人四件套邂逅 AB版纯棉，亲肤透气', 'TP0000066', 3, '210.00', '110.00', '0.00', '107.80', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(577, 516, 0, 45, '华为 HUAWEI C199S 麦芒3S 电信4G智能手机FDD-LTE /TD-LTE/CDMA2000/GSM（麦芒金）', 'TP0000045', 3, '2099.00', '2000.00', '0.00', '1960.00', 0, '11_21_28', '网络:4G 屏幕:触屏 内存:32G', '', 0, 0, 0, 0, 0, ''),
(578, 517, 0, 143, 'haier海尔 BC-93TMPF 93升单门冰箱', 'TP0000143', 1, '799.00', '0.01', '0.00', '0.01', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(579, 518, 0, 141, '三星 Galaxy A9高配版 (A9100) 精灵黑 全网通4G手机 双卡双待', 'TP0000141', 1, '3599.00', '3400.00', '0.00', '3400.00', 0, '55', '颜色:黑色', '', 0, 1, 2, 0, 0, ''),
(580, 519, 0, 76, '韩文2015冬装新款女装红色双排扣配腰带毛呢大衣.', 'TP0000076', 1, '389.00', '289.00', '0.00', '289.00', 0, '77', '尺码:S', '', 0, 0, 0, 0, 0, ''),
(581, 520, 0, 119, '小米旗舰店正品手机平板通用迷你充电宝 移动电源10000毫安大容量', 'TP0000119', 6, '169.00', '69.00', '0.00', '69.00', 0, '104', '颜色:象牙白', '', 0, 0, 0, 0, 0, ''),
(582, 520, 0, 119, '小米旗舰店正品手机平板通用迷你充电宝 移动电源10000毫安大容量', 'TP0000119', 1, '169.00', '69.00', '0.00', '69.00', 0, '103', '颜色:土豪金', '', 0, 0, 0, 0, 0, ''),
(583, 520, 0, 39, '华为（HUAWEI） M2 10.0 平板电脑 WiFi 月光银', 'TP0000039', 2, '2388.00', '2000.00', '0.00', '2000.00', 0, '41_47_51', '尺寸:7寸及以下 内存:16G 颜色:银白色', '', 0, 0, 0, 0, 0, ''),
(584, 521, 0, 141, '三星 Galaxy A9高配版 (A9100) 精灵黑 全网通4G手机 双卡双待', 'TP0000141', 1, '3599.00', '3400.00', '0.00', '3400.00', 0, '55', '颜色:黑色', '', 0, 1, 2, 0, 0, ''),
(585, 522, 0, 81, '纤慕文胸 女无钢圈聚拢一片式无痕拉丝美背内衣', 'TP0000081', 1, '208.00', '108.00', '0.00', '108.00', 0, '91', '尺码:75B', '', 0, 0, 0, 0, 0, ''),
(586, 523, 0, 141, '三星 Galaxy A9高配版 (A9100) 精灵黑 全网通4G手机 双卡双待', 'TP0000141', 1, '3599.00', '3400.00', '0.00', '3400.00', 0, '55', '颜色:黑色', '', 0, 1, 2, 0, 0, ''),
(587, 523, 0, 71, '布雷尔 床 皮床 双人床 真皮床 软床 皮艺床 1.8米婚床', 'TP0000071', 1, '1680.00', '1580.00', '0.00', '1580.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(588, 524, 0, 115, '爸爸2陆毅代言索扬20000毫安充电宝轻薄正品手机通用移动电源MAh', 'TP0000115', 1, '184.90', '84.90', '0.00', '84.90', 0, '103', '颜色:土豪金', '', 0, 0, 0, 0, 0, ''),
(589, 525, 0, 141, '三星 Galaxy A9高配版 (A9100) 精灵黑 全网通4G手机 双卡双待', 'TP0000141', 1, '3599.00', '3400.00', '0.00', '3400.00', 0, '55', '颜色:黑色', '', 0, 1, 2, 0, 0, ''),
(590, 526, 0, 66, '迎馨家纺全棉斜纹印花双人四件套邂逅 AB版纯棉，亲肤透气', 'TP0000066', 1, '210.00', '110.00', '0.00', '110.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(591, 527, 0, 66, '迎馨家纺全棉斜纹印花双人四件套邂逅 AB版纯棉，亲肤透气', 'TP0000066', 1, '210.00', '110.00', '0.00', '110.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(592, 528, 0, 141, '三星 Galaxy A9高配版 (A9100) 精灵黑 全网通4G手机 双卡双待', 'TP0000141', 1, '3599.00', '3400.00', '0.00', '3400.00', 0, '55', '颜色:黑色', '', 0, 1, 2, 0, 0, ''),
(593, 529, 0, 66, '迎馨家纺全棉斜纹印花双人四件套邂逅 AB版纯棉，亲肤透气', 'TP0000066', 7, '210.00', '110.00', '0.00', '110.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(594, 529, 0, 136, '靓号0元送广东联通4G/3G手机卡上网卡大流量套餐全国无漫游选号', 'TP0000136', 1, '220.00', '50.00', '0.00', '50.00', 0, '108', '合约套餐:乐享4G套餐99元', '', 0, 1, 3, 0, 0, ''),
(595, 530, 0, 71, '布雷尔 床 皮床 双人床 真皮床 软床 皮艺床 1.8米婚床', 'TP0000071', 1, '1680.00', '1580.00', '0.00', '1580.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(596, 531, 0, 135, '重庆电信手机卡电话卡语音卡选靓号3G4G卡内部5折卡低资费（飞）', 'TP0000135', 1, '160.00', '59.00', '0.00', '59.00', 0, '106', '合约套餐:乐享4G套餐59元', '', 0, 0, 0, 0, 0, ''),
(597, 532, 0, 143, 'haier海尔 BC-93TMPF 93升单门冰箱', 'TP0000143', 1, '799.00', '0.01', '0.00', '0.01', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(598, 533, 0, 143, 'haier海尔 BC-93TMPF 93升单门冰箱', 'TP0000143', 1, '799.00', '0.01', '0.00', '0.01', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(599, 534, 0, 143, 'haier海尔 BC-93TMPF 93升单门冰箱', 'TP0000143', 1, '799.00', '0.01', '0.00', '0.01', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(600, 534, 0, 140, 'Apple iPhone 6s 16GB 玫瑰金色 移动联通电信4G手机', 'TP0000140', 1, '4958.00', '4858.00', '0.00', '4858.00', 0, '11_13_55', '网络:4G 内存:16G 颜色:黑色', '', 0, 0, 0, 0, 0, ''),
(601, 535, 0, 141, '三星 Galaxy A9高配版 (A9100) 精灵黑 全网通4G手机 双卡双待', 'TP0000141', 1, '3599.00', '3400.00', '0.00', '3400.00', 0, '55', '颜色:黑色', '', 0, 1, 2, 0, 0, ''),
(602, 536, 0, 45, '华为 HUAWEI C199S 麦芒3S 电信4G智能手机FDD-LTE /TD-LTE/CDMA2000/GSM（麦芒金）', 'TP0000045', 1, '2099.00', '1999.00', '0.00', '1999.00', 0, '11_13_21', '网络:4G 内存:16G 屏幕:触屏', '', 0, 0, 0, 0, 0, ''),
(603, 537, 0, 136, '靓号0元送广东联通4G/3G手机卡上网卡大流量套餐全国无漫游选号', 'TP0000136', 1, '220.00', '50.00', '0.00', '50.00', 0, '108', '合约套餐:乐享4G套餐99元', '', 0, 1, 3, 0, 0, ''),
(604, 538, 0, 119, '小米旗舰店正品手机平板通用迷你充电宝 移动电源10000毫安大容量', 'TP0000119', 1, '169.00', '69.00', '0.00', '69.00', 0, '103', '颜色:土豪金', '', 0, 0, 0, 0, 0, ''),
(605, 539, 0, 136, '靓号0元送广东联通4G/3G手机卡上网卡大流量套餐全国无漫游选号', 'TP0000136', 1, '220.00', '50.00', '0.00', '50.00', 0, '108', '合约套餐:乐享4G套餐99元', '', 0, 1, 3, 0, 0, ''),
(606, 540, 0, 39, '华为（HUAWEI） M2 10.0 平板电脑 WiFi 月光银', 'TP0000039', 1, '2388.00', '2000.00', '0.00', '2000.00', 0, '41_47_51', '尺寸:7寸及以下 内存:16G 颜色:银白色', '', 0, 0, 0, 0, 0, ''),
(607, 541, 0, 143, 'haier海尔 BC-93TMPF 93升单门冰箱', 'TP0000143', 1, '799.00', '0.01', '0.00', '0.01', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(608, 542, 0, 131, '【蚂蚁摄影】单反外观Sony/索尼 DSC-H400高清长焦射月数码照相机', 'TP0000131', 1, '1798.00', '1698.00', '0.00', '1698.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(609, 543, 0, 1, 'Apple iPhone 6s Plus 16G 玫瑰金 移动联通电信4G手机', 'TP000000', 1, '6100.00', '6000.00', '0.00', '6000.00', 0, '11_55_102', '网络:4G 颜色:黑色 内存:128G', '', 0, 0, 0, 0, 0, ''),
(610, 544, 0, 39, '华为（HUAWEI） M2 10.0 平板电脑 WiFi 月光银', 'TP0000039', 1, '2388.00', '2000.00', '0.00', '2000.00', 0, '41_47_51', '尺寸:7寸及以下 内存:16G 颜色:银白色', '', 0, 0, 0, 0, 0, ''),
(611, 545, 0, 39, '华为（HUAWEI） M2 10.0 平板电脑 WiFi 月光银', 'TP0000039', 2, '2388.00', '2000.00', '0.00', '2000.00', 0, '41_47_51', '尺寸:7寸及以下 内存:16G 颜色:银白色', '', 0, 0, 0, 0, 0, ''),
(612, 545, 0, 66, '迎馨家纺全棉斜纹印花双人四件套邂逅 AB版纯棉，亲肤透气', 'TP0000066', 1, '210.00', '110.00', '0.00', '110.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(613, 546, 0, 140, 'Apple iPhone 6s 16GB 玫瑰金色 移动联通电信4G手机', 'TP0000140', 1, '4958.00', '4858.00', '0.00', '4858.00', 0, '11_13_55', '网络:4G 内存:16G 颜色:黑色', '', 0, 0, 0, 0, 0, ''),
(614, 547, 0, 143, 'haier海尔 BC-93TMPF 93升单门冰箱', 'TP0000143', 2, '799.00', '0.01', '0.00', '0.01', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(615, 548, 0, 143, 'haier海尔 BC-93TMPF 93升单门冰箱', 'TP0000143', 1, '799.00', '0.01', '0.00', '0.01', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(616, 549, 0, 66, '迎馨家纺全棉斜纹印花双人四件套邂逅 AB版纯棉，亲肤透气', 'TP0000066', 1, '210.00', '110.00', '0.00', '110.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(617, 550, 0, 136, '靓号0元送广东联通4G/3G手机卡上网卡大流量套餐全国无漫游选号', 'TP0000136', 1, '220.00', '50.00', '0.00', '50.00', 0, '108', '合约套餐:乐享4G套餐99元', '', 0, 1, 3, 0, 0, ''),
(618, 551, 0, 119, '小米旗舰店正品手机平板通用迷你充电宝 移动电源10000毫安大容量', 'TP0000119', 1, '169.00', '69.00', '0.00', '69.00', 0, '103', '颜色:土豪金', '', 0, 0, 0, 0, 0, ''),
(619, 552, 0, 143, 'haier海尔 BC-93TMPF 93升单门冰箱', 'TP0000143', 4, '799.00', '699.00', '0.00', '699.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(620, 552, 0, 119, '小米旗舰店正品手机平板通用迷你充电宝 移动电源10000毫安大容量', 'TP0000119', 2, '169.00', '69.00', '0.00', '69.00', 0, '103', '颜色:土豪金', '', 0, 0, 0, 0, 0, ''),
(621, 553, 0, 66, '迎馨家纺全棉斜纹印花双人四件套邂逅 AB版纯棉，亲肤透气', 'TP0000066', 1, '210.00', '110.00', '0.00', '110.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(622, 554, 0, 141, '三星 Galaxy A9高配版 (A9100) 精灵黑 全网通4G手机 双卡双待', 'TP0000141', 1, '3599.00', '3400.00', '0.00', '3400.00', 0, '55', '颜色:黑色', '', 0, 1, 2, 0, 0, ''),
(623, 555, 0, 66, '迎馨家纺全棉斜纹印花双人四件套邂逅 AB版纯棉，亲肤透气', 'TP0000066', 1, '210.00', '110.00', '0.00', '110.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(624, 556, 0, 141, '三星 Galaxy A9高配版 (A9100) 精灵黑 全网通4G手机 双卡双待', 'TP0000141', 1, '3599.00', '3400.00', '0.00', '3400.00', 0, '55', '颜色:黑色', '', 0, 1, 2, 0, 0, ''),
(625, 557, 0, 137, '中麦通信4G联通网络手机靓号 170手机卡电话卡靓号卡可选号包邮', 'TP0000137', 2, '600.00', '1000.00', '0.00', '1000.00', 0, '106_112', '合约套餐:乐享4G套餐59元 套餐:微型卡', '', 0, 0, 0, 0, 0, ''),
(626, 558, 0, 66, '迎馨家纺全棉斜纹印花双人四件套邂逅 AB版纯棉，亲肤透气', 'TP0000066', 1, '210.00', '110.00', '0.00', '110.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(627, 559, 0, 104, '小米手机5,十余项黑科技，很轻狠快', 'TP0000104', 6, '2099.00', '2200.00', '0.00', '2156.00', 0, '56_102', '颜色:白色 内存:128G', '', 0, 0, 0, 0, 0, ''),
(628, 559, 0, 1, 'Apple iPhone 6s Plus 16G 玫瑰金 移动联通电信4G手机', 'TP000000', 2, '6100.00', '5800.00', '0.00', '5684.00', 0, '11_99_102', '网络:4G 颜色:银色 内存:128G', '', 0, 0, 0, 0, 0, ''),
(629, 559, 0, 40, '荣耀X2 标准版 双卡双待双通 移动/联通双4G 16GB ROM（月光银）', 'TP0000040', 4, '2099.00', '1000.00', '0.00', '980.00', 0, '41_49', '尺寸:7寸及以下 内存:64G', '', 0, 0, 0, 0, 0, ''),
(630, 559, 0, 66, '迎馨家纺全棉斜纹印花双人四件套邂逅 AB版纯棉，亲肤透气', 'TP0000066', 1, '210.00', '110.00', '0.00', '107.80', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(631, 560, 0, 71, '布雷尔 床 皮床 双人床 真皮床 软床 皮艺床 1.8米婚床', 'TP0000071', 1, '1680.00', '1580.00', '0.00', '1580.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(632, 561, 0, 66, '迎馨家纺全棉斜纹印花双人四件套邂逅 AB版纯棉，亲肤透气', 'TP0000066', 1, '210.00', '110.00', '0.00', '110.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(633, 561, 0, 39, '华为（HUAWEI） M2 10.0 平板电脑 WiFi 月光银', 'TP0000039', 1, '2388.00', '2000.00', '0.00', '2000.00', 0, '41_47_51', '尺寸:7寸及以下 内存:16G 颜色:银白色', '', 0, 0, 0, 0, 0, ''),
(634, 562, 0, 66, '迎馨家纺全棉斜纹印花双人四件套邂逅 AB版纯棉，亲肤透气', 'TP0000066', 1, '210.00', '110.00', '0.00', '110.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(635, 563, 0, 66, '迎馨家纺全棉斜纹印花双人四件套邂逅 AB版纯棉，亲肤透气', 'TP0000066', 1, '210.00', '110.00', '0.00', '110.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(636, 564, 0, 66, '迎馨家纺全棉斜纹印花双人四件套邂逅 AB版纯棉，亲肤透气', 'TP0000066', 1, '210.00', '110.00', '0.00', '110.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(637, 565, 0, 66, '迎馨家纺全棉斜纹印花双人四件套邂逅 AB版纯棉，亲肤透气', 'TP0000066', 1, '210.00', '110.00', '0.00', '110.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(638, 566, 0, 66, '迎馨家纺全棉斜纹印花双人四件套邂逅 AB版纯棉，亲肤透气', 'TP0000066', 2, '210.00', '110.00', '0.00', '110.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(639, 567, 0, 66, '迎馨家纺全棉斜纹印花双人四件套邂逅 AB版纯棉，亲肤透气', 'TP0000066', 2, '210.00', '110.00', '0.00', '110.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(640, 568, 0, 115, '爸爸2陆毅代言索扬20000毫安充电宝轻薄正品手机通用移动电源MAh', 'TP0000115', 2, '184.90', '84.90', '0.00', '84.90', 0, '103', '颜色:土豪金', '', 0, 0, 0, 0, 0, ''),
(641, 569, 0, 119, '小米旗舰店正品手机平板通用迷你充电宝 移动电源10000毫安大容量', 'TP0000119', 1, '169.00', '69.00', '0.00', '69.00', 0, '103', '颜色:土豪金', '', 0, 0, 0, 0, 0, ''),
(642, 570, 0, 1, 'Apple iPhone 6s Plus 16G 玫瑰金 移动联通电信4G手机', 'TP000000', 1, '6100.00', '6000.00', '0.00', '6000.00', 0, '11_55_102', '网络:4G 颜色:黑色 内存:128G', '', 0, 0, 0, 0, 0, ''),
(643, 571, 0, 39, '华为（HUAWEI） M2 10.0 平板电脑 WiFi 月光银', 'TP0000039', 1, '2388.00', '2000.00', '0.00', '2000.00', 0, '41_47_51', '尺寸:7寸及以下 内存:16G 颜色:银白色', '', 0, 0, 0, 0, 0, ''),
(644, 572, 0, 66, '迎馨家纺全棉斜纹印花双人四件套邂逅 AB版纯棉，亲肤透气', 'TP0000066', 1, '210.00', '110.00', '0.00', '110.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(645, 573, 0, 76, '韩文2015冬装新款女装红色双排扣配腰带毛呢大衣.', 'TP0000076', 1, '389.00', '289.00', '0.00', '289.00', 0, '77', '尺码:S', '', 0, 0, 0, 0, 0, ''),
(646, 574, 0, 143, 'haier海尔 BC-93TMPF 93升单门冰箱', 'TP0000143', 1, '799.00', '0.01', '0.00', '0.01', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(647, 575, 0, 143, 'haier海尔 BC-93TMPF 93升单门冰箱', 'TP0000143', 1, '799.00', '0.01', '0.00', '0.01', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(648, 576, 0, 143, 'haier海尔 BC-93TMPF 93升单门冰箱', 'TP0000143', 2, '799.00', '0.01', '0.00', '0.01', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(649, 577, 0, 119, '小米旗舰店正品手机平板通用迷你充电宝 移动电源10000毫安大容量', 'TP0000119', 1, '169.00', '69.00', '0.00', '69.00', 0, '103', '颜色:土豪金', '', 0, 0, 0, 0, 0, ''),
(650, 578, 0, 123, 'Canon/佳能 EOS 750D单反套机（18-55mm）高清数码相机苏宁易购', 'TP0000123', 1, '4097.00', '3997.00', '0.00', '3997.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(651, 579, 0, 119, '小米旗舰店正品手机平板通用迷你充电宝 移动电源10000毫安大容量', 'TP0000119', 1, '169.00', '69.00', '0.00', '69.00', 0, '103', '颜色:土豪金', '', 0, 0, 0, 0, 0, ''),
(652, 580, 0, 66, '迎馨家纺全棉斜纹印花双人四件套邂逅 AB版纯棉，亲肤透气', 'TP0000066', 1, '210.00', '110.00', '0.00', '110.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(653, 581, 0, 76, '韩文2015冬装新款女装红色双排扣配腰带毛呢大衣.', 'TP0000076', 1, '389.00', '289.00', '0.00', '289.00', 0, '77', '尺码:S', '', 0, 0, 0, 0, 0, ''),
(654, 582, 0, 81, '纤慕文胸 女无钢圈聚拢一片式无痕拉丝美背内衣', 'TP0000081', 1, '208.00', '108.00', '0.00', '108.00', 0, '87', '尺码:70A', '', 0, 0, 0, 0, 0, ''),
(655, 583, 0, 143, 'haier海尔 BC-93TMPF 93升单门冰箱', 'TP0000143', 1, '799.00', '0.01', '0.00', '0.01', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(656, 584, 0, 143, 'haier海尔 BC-93TMPF 93升单门冰箱', 'TP0000143', 1, '799.00', '0.01', '0.00', '0.01', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(657, 585, 0, 143, 'haier海尔 BC-93TMPF 93升单门冰箱', 'TP0000143', 1, '799.00', '0.01', '0.00', '0.01', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(658, 586, 0, 143, 'haier海尔 BC-93TMPF 93升单门冰箱', 'TP0000143', 1, '799.00', '0.01', '0.00', '0.01', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(659, 587, 0, 134, '中国电信4G号卡手机卡电话卡上网卡 177号段套餐可选 预存120全返', 'TP0000134', 2, '220.00', '59.00', '0.00', '59.00', 0, '106', '合约套餐:乐享4G套餐59元', '', 0, 0, 0, 0, 0, ''),
(660, 588, 0, 115, '爸爸2陆毅代言索扬20000毫安充电宝轻薄正品手机通用移动电源MAh', 'TP0000115', 1, '184.90', '84.90', '0.00', '84.90', 0, '103', '颜色:土豪金', '', 0, 0, 0, 0, 0, ''),
(661, 589, 0, 141, '三星 Galaxy A9高配版 (A9100) 精灵黑 全网通4G手机 双卡双待', 'TP0000141', 1, '3599.00', '3400.00', '0.00', '3400.00', 0, '55', '颜色:黑色', '', 0, 1, 2, 0, 0, ''),
(662, 590, 0, 143, 'haier海尔 BC-93TMPF 93升单门冰箱', 'TP0000143', 1, '799.00', '0.01', '0.00', '0.01', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(663, 591, 0, 71, '布雷尔 床 皮床 双人床 真皮床 软床 皮艺床 1.8米婚床', 'TP0000071', 1, '1680.00', '1580.00', '0.00', '1580.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(664, 592, 0, 66, '迎馨家纺全棉斜纹印花双人四件套邂逅 AB版纯棉，亲肤透气', 'TP0000066', 1, '210.00', '110.00', '0.00', '110.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(665, 593, 0, 39, '华为（HUAWEI） M2 10.0 平板电脑 WiFi 月光银', 'TP0000039', 1, '2388.00', '2000.00', '0.00', '2000.00', 0, '41_47_51', '尺寸:7寸及以下 内存:16G 颜色:银白色', '', 0, 0, 0, 0, 0, ''),
(666, 594, 0, 104, '小米手机5,十余项黑科技，很轻狠快', 'TP0000104', 1, '2099.00', '6000.00', '0.00', '6000.00', 0, '28_55', '内存:32G 颜色:黑色', '', 0, 0, 0, 0, 0, ''),
(667, 595, 0, 143, 'haier海尔 BC-93TMPF 93升单门冰箱', 'TP0000143', 1, '799.00', '0.01', '0.00', '0.01', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(668, 596, 0, 135, '重庆电信手机卡电话卡语音卡选靓号3G4G卡内部5折卡低资费（飞）', 'TP0000135', 1, '160.00', '59.00', '0.00', '59.00', 0, '106', '合约套餐:乐享4G套餐59元', '', 0, 0, 0, 0, 0, ''),
(669, 597, 0, 39, '华为（HUAWEI） M2 10.0 平板电脑 WiFi 月光银', 'TP0000039', 4, '2388.00', '2000.00', '0.00', '2000.00', 0, '41_47_51', '尺寸:7寸及以下 内存:16G 颜色:银白色', '', 0, 0, 0, 0, 0, ''),
(670, 598, 0, 71, '布雷尔 床 皮床 双人床 真皮床 软床 皮艺床 1.8米婚床', 'TP0000071', 1, '1680.00', '1580.00', '0.00', '1548.40', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(671, 599, 0, 49, '荣耀畅玩5X 双卡双待 移动版 智能手机（破晓银）', 'TP0000049', 1, '1099.00', '999.00', '0.00', '979.02', 0, '11_13_21', '网络:4G 内存:16G 屏幕:触屏', '', 0, 0, 0, 0, 0, ''),
(672, 600, 0, 115, '爸爸2陆毅代言索扬20000毫安充电宝轻薄正品手机通用移动电源MAh', 'TP0000115', 1, '184.90', '84.90', '0.00', '84.90', 0, '103', '颜色:土豪金', '', 0, 0, 0, 0, 0, ''),
(673, 601, 0, 143, 'haier海尔 BC-93TMPF 93升单门冰箱', 'TP0000143', 1, '799.00', '0.01', '0.00', '0.01', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(674, 602, 0, 141, '三星 Galaxy A9高配版 (A9100) 精灵黑 全网通4G手机 双卡双待', 'TP0000141', 1, '3599.00', '3400.00', '0.00', '3400.00', 0, '55', '颜色:黑色', '', 0, 1, 2, 0, 0, ''),
(675, 603, 0, 143, 'haier海尔 BC-93TMPF 93升单门冰箱', 'TP0000143', 1, '799.00', '0.01', '0.00', '0.01', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(676, 604, 0, 39, '华为（HUAWEI） M2 10.0 平板电脑 WiFi 月光银', 'TP0000039', 1, '2388.00', '2000.00', '0.00', '2000.00', 0, '41_47_51', '尺寸:7寸及以下 内存:16G 颜色:银白色', '', 0, 0, 0, 0, 0, ''),
(677, 605, 0, 141, '三星 Galaxy A9高配版 (A9100) 精灵黑 全网通4G手机 双卡双待', 'TP0000141', 1, '3599.00', '3400.00', '0.00', '3400.00', 0, '55', '颜色:黑色', '', 0, 1, 2, 0, 0, ''),
(678, 606, 0, 39, '华为（HUAWEI） M2 10.0 平板电脑 WiFi 月光银', 'TP0000039', 1, '2388.00', '2000.00', '0.00', '2000.00', 0, '41_47_51', '尺寸:7寸及以下 内存:16G 颜色:银白色', '', 0, 0, 0, 0, 0, ''),
(679, 607, 0, 143, 'haier海尔 BC-93TMPF 93升单门冰箱', 'TP0000143', 1, '799.00', '0.01', '0.00', '0.01', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(680, 608, 0, 71, '布雷尔 床 皮床 双人床 真皮床 软床 皮艺床 1.8米婚床', 'TP0000071', 1, '1680.00', '1580.00', '0.00', '1580.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(681, 609, 0, 143, 'haier海尔 BC-93TMPF 93升单门冰箱', 'TP0000143', 1, '799.00', '0.01', '0.00', '0.01', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(682, 610, 0, 115, '爸爸2陆毅代言索扬20000毫安充电宝轻薄正品手机通用移动电源MAh', 'TP0000115', 1, '184.90', '84.90', '0.00', '84.90', 0, '103', '颜色:土豪金', '', 0, 0, 0, 0, 0, ''),
(683, 610, 0, 116, 'ROMOSS/罗马仕 sense6 20000M毫安充电宝 正品手机通用移动电源', 'TP0000116', 3, '189.00', '1000.00', '0.00', '1000.00', 0, '103', '颜色:土豪金', '', 0, 0, 0, 0, 0, ''),
(684, 610, 0, 118, 'ROMOSS/罗马仕 sense4 正品10000+毫安移动电源 手机通用充电宝', 'TP0000118', 1, '159.00', '59.00', '0.00', '59.00', 0, '104', '颜色:象牙白', '', 0, 0, 0, 0, 0, ''),
(685, 611, 0, 136, '靓号0元送广东联通4G/3G手机卡上网卡大流量套餐全国无漫游选号', 'TP0000136', 1, '220.00', '50.00', '0.00', '50.00', 0, '108', '合约套餐:乐享4G套餐99元', '', 0, 1, 3, 0, 0, ''),
(686, 612, 0, 143, 'haier海尔 BC-93TMPF 93升单门冰箱', 'TP0000143', 1, '799.00', '0.01', '0.00', '0.01', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(687, 613, 0, 49, '荣耀畅玩5X 双卡双待 移动版 智能手机（破晓银）', 'TP0000049', 2, '1099.00', '999.00', '0.00', '999.00', 0, '11_13_21', '网络:4G 内存:16G 屏幕:触屏', '', 0, 0, 0, 0, 0, ''),
(688, 614, 0, 66, '迎馨家纺全棉斜纹印花双人四件套邂逅 AB版纯棉，亲肤透气', 'TP0000066', 1, '210.00', '110.00', '0.00', '110.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(689, 615, 0, 140, 'Apple iPhone 6s 16GB 玫瑰金色 移动联通电信4G手机', 'TP0000140', 1, '4958.00', '4858.00', '0.00', '4858.00', 0, '11_13_55', '网络:4G 内存:16G 颜色:黑色', '', 0, 0, 0, 0, 0, ''),
(690, 616, 0, 116, 'ROMOSS/罗马仕 sense6 20000M毫安充电宝 正品手机通用移动电源', 'TP0000116', 1, '189.00', '1000.00', '0.00', '1000.00', 0, '103', '颜色:土豪金', '', 0, 0, 0, 0, 0, ''),
(691, 617, 0, 66, '迎馨家纺全棉斜纹印花双人四件套邂逅 AB版纯棉，亲肤透气', 'TP0000066', 1, '210.00', '110.00', '0.00', '110.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(692, 618, 0, 141, '三星 Galaxy A9高配版 (A9100) 精灵黑 全网通4G手机 双卡双待', 'TP0000141', 1, '3599.00', '3400.00', '0.00', '3400.00', 0, '55', '颜色:黑色', '', 0, 1, 2, 0, 0, ''),
(693, 618, 0, 138, '广州电信卡|4G定制卡|含50话费|手机卡号码卡|上网卡流量卡靓号', 'TP0000138', 1, '179.00', '59.00', '0.00', '59.00', 0, '106', '合约套餐:乐享4G套餐59元', '', 0, 0, 0, 0, 0, ''),
(694, 619, 0, 76, '韩文2015冬装新款女装红色双排扣配腰带毛呢大衣.', 'TP0000076', 1, '389.00', '289.00', '0.00', '289.00', 0, '77', '尺码:S', '', 0, 0, 0, 0, 0, ''),
(695, 620, 0, 71, '布雷尔 床 皮床 双人床 真皮床 软床 皮艺床 1.8米婚床', 'TP0000071', 1, '1680.00', '1580.00', '0.00', '1580.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(696, 621, 0, 119, '小米旗舰店正品手机平板通用迷你充电宝 移动电源10000毫安大容量', 'TP0000119', 1, '169.00', '69.00', '0.00', '69.00', 0, '103', '颜色:土豪金', '', 0, 0, 0, 0, 0, ''),
(697, 622, 0, 118, 'ROMOSS/罗马仕 sense4 正品10000+毫安移动电源 手机通用充电宝', 'TP0000118', 1, '159.00', '59.00', '0.00', '57.82', 0, '104', '颜色:象牙白', '', 0, 0, 0, 0, 0, ''),
(698, 623, 0, 62, '海信彩电LED55EC520UA 55英寸 14核 4K智能电视(黑色)', 'TP0000062', 3, '3699.00', '3699.00', '0.00', '3699.00', 0, '64', '尺寸:40', '', 0, 0, 0, 0, 0, ''),
(699, 623, 0, 66, '迎馨家纺全棉斜纹印花双人四件套邂逅 AB版纯棉，亲肤透气', 'TP0000066', 2, '210.00', '110.00', '0.00', '110.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(700, 624, 0, 39, '华为（HUAWEI） M2 10.0 平板电脑 WiFi 月光银', 'TP0000039', 1, '2388.00', '2000.00', '0.00', '2000.00', 0, '41_47_51', '尺寸:7寸及以下 内存:16G 颜色:银白色', '', 0, 0, 0, 0, 0, ''),
(701, 625, 0, 119, '小米旗舰店正品手机平板通用迷你充电宝 移动电源10000毫安大容量', 'TP0000119', 1, '169.00', '69.00', '0.00', '67.62', 0, '103', '颜色:土豪金', '', 0, 0, 0, 0, 0, ''),
(702, 625, 0, 141, '三星 Galaxy A9高配版 (A9100) 精灵黑 全网通4G手机 双卡双待', 'TP0000141', 1, '3599.00', '3400.00', '0.00', '3400.00', 0, '55', '颜色:黑色', '', 0, 1, 2, 0, 0, ''),
(703, 626, 0, 119, '小米旗舰店正品手机平板通用迷你充电宝 移动电源10000毫安大容量', 'TP0000119', 4, '169.00', '69.00', '0.00', '67.62', 0, '103', '颜色:土豪金', '', 0, 0, 0, 0, 0, ''),
(704, 627, 0, 40, '荣耀X2 标准版 双卡双待双通 移动/联通双4G 16GB ROM（月光银）', 'TP0000040', 1, '2099.00', '1000.00', '0.00', '1000.00', 0, '41_47', '尺寸:7寸及以下 内存:16G', '', 0, 0, 0, 0, 0, ''),
(705, 628, 0, 119, '小米旗舰店正品手机平板通用迷你充电宝 移动电源10000毫安大容量', 'TP0000119', 1, '169.00', '69.00', '0.00', '69.00', 0, '103', '颜色:土豪金', '', 0, 0, 0, 0, 0, ''),
(706, 629, 0, 141, '三星 Galaxy A9高配版 (A9100) 精灵黑 全网通4G手机 双卡双待', 'TP0000141', 1, '3599.00', '3400.00', '0.00', '3400.00', 0, '55', '颜色:黑色', '', 0, 1, 2, 0, 0, ''),
(707, 630, 0, 140, 'Apple iPhone 6s 16GB 玫瑰金色 移动联通电信4G手机', 'TP0000140', 1, '4958.00', '4858.00', '0.00', '4858.00', 0, '11_13_55', '网络:4G 内存:16G 颜色:黑色', '', 0, 0, 0, 0, 0, ''),
(708, 631, 0, 119, '小米旗舰店正品手机平板通用迷你充电宝 移动电源10000毫安大容量', 'TP0000119', 1, '169.00', '69.00', '0.00', '69.00', 0, '103', '颜色:土豪金', '', 0, 0, 0, 0, 0, ''),
(709, 632, 0, 134, '中国电信4G号卡手机卡电话卡上网卡 177号段套餐可选 预存120全返', 'TP0000134', 1, '220.00', '59.00', '0.00', '59.00', 0, '110', '合约套餐:乐享4G套餐169元', '', 0, 0, 0, 0, 0, ''),
(710, 632, 0, 71, '布雷尔 床 皮床 双人床 真皮床 软床 皮艺床 1.8米婚床', 'TP0000071', 2, '1680.00', '1580.00', '0.00', '1580.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(711, 633, 0, 119, '小米旗舰店正品手机平板通用迷你充电宝 移动电源10000毫安大容量', 'TP0000119', 1, '169.00', '69.00', '0.00', '69.00', 0, '103', '颜色:土豪金', '', 0, 0, 0, 0, 0, ''),
(712, 634, 0, 39, '华为（HUAWEI） M2 10.0 平板电脑 WiFi 月光银', 'TP0000039', 1, '2388.00', '2000.00', '0.00', '2000.00', 0, '41_47_51', '尺寸:7寸及以下 内存:16G 颜色:银白色', '', 0, 0, 0, 0, 0, ''),
(713, 635, 0, 141, '三星 Galaxy A9高配版 (A9100) 精灵黑 全网通4G手机 双卡双待', 'TP0000141', 1, '3599.00', '3400.00', '0.00', '3400.00', 0, '55', '颜色:黑色', '', 0, 1, 2, 0, 0, ''),
(714, 636, 0, 66, '迎馨家纺全棉斜纹印花双人四件套邂逅 AB版纯棉，亲肤透气', 'TP0000066', 1, '210.00', '110.00', '0.00', '110.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(715, 637, 0, 115, '爸爸2陆毅代言索扬20000毫安充电宝轻薄正品手机通用移动电源MAh', 'TP0000115', 1, '184.90', '84.90', '0.00', '84.90', 0, '103', '颜色:土豪金', '', 0, 0, 0, 0, 0, ''),
(716, 638, 0, 66, '迎馨家纺全棉斜纹印花双人四件套邂逅 AB版纯棉，亲肤透气', 'TP0000066', 1, '210.00', '110.00', '0.00', '110.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(717, 639, 0, 39, '华为（HUAWEI） M2 10.0 平板电脑 WiFi 月光银', 'TP0000039', 1, '2388.00', '2000.00', '0.00', '2000.00', 0, '41_47_51', '尺寸:7寸及以下 内存:16G 颜色:银白色', '', 0, 0, 0, 0, 0, ''),
(718, 640, 0, 141, '三星 Galaxy A9高配版 (A9100) 精灵黑 全网通4G手机 双卡双待', 'TP0000141', 1, '3599.00', '3400.00', '0.00', '3400.00', 0, '55', '颜色:黑色', '', 0, 1, 2, 0, 0, ''),
(719, 641, 0, 119, '小米旗舰店正品手机平板通用迷你充电宝 移动电源10000毫安大容量', 'TP0000119', 1, '169.00', '69.00', '0.00', '69.00', 0, '103', '颜色:土豪金', '', 0, 0, 0, 0, 0, ''),
(720, 642, 0, 39, '华为（HUAWEI） M2 10.0 平板电脑 WiFi 月光银', 'TP0000039', 4, '2388.00', '2000.00', '0.00', '2000.00', 0, '41_47_51', '尺寸:7寸及以下 内存:16G 颜色:银白色', '', 0, 0, 0, 0, 0, ''),
(721, 643, 0, 143, 'haier海尔 BC-93TMPF 93升单门冰箱', 'TP0000143', 1, '799.00', '0.01', '0.00', '0.01', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(722, 644, 0, 39, '华为（HUAWEI） M2 10.0 平板电脑 WiFi 月光银', 'TP0000039', 1, '2388.00', '2000.00', '0.00', '2000.00', 0, '41_47_51', '尺寸:7寸及以下 内存:16G 颜色:银白色', '', 0, 0, 0, 0, 0, ''),
(723, 645, 0, 76, '韩文2015冬装新款女装红色双排扣配腰带毛呢大衣.', 'TP0000076', 1, '389.00', '0.01', '0.00', '0.01', 0, '77', '尺码:S', '', 0, 0, 0, 0, 0, ''),
(724, 646, 0, 119, '小米旗舰店正品手机平板通用迷你充电宝 移动电源10000毫安大容量', 'TP0000119', 1, '169.00', '69.00', '0.00', '67.62', 0, '103', '颜色:土豪金', '', 0, 0, 0, 0, 0, ''),
(725, 646, 0, 140, 'Apple iPhone 6s 16GB 玫瑰金色 移动联通电信4G手机', 'TP0000140', 3, '4958.00', '4858.00', '0.00', '4760.84', 0, '11_13_55', '网络:4G 内存:16G 颜色:黑色', '', 0, 0, 0, 0, 0, ''),
(726, 647, 0, 141, '三星 Galaxy A9高配版 (A9100) 精灵黑 全网通4G手机 双卡双待', 'TP0000141', 1, '3599.00', '3400.00', '0.00', '3400.00', 0, '55', '颜色:黑色', '', 0, 1, 2, 0, 0, ''),
(727, 648, 0, 119, '小米旗舰店正品手机平板通用迷你充电宝 移动电源10000毫安大容量', 'TP0000119', 1, '169.00', '69.00', '0.00', '69.00', 0, '103', '颜色:土豪金', '', 0, 0, 0, 0, 0, ''),
(728, 649, 0, 71, '布雷尔 床 皮床 双人床 真皮床 软床 皮艺床 1.8米婚床', 'TP0000071', 3, '1680.00', '1580.00', '0.00', '1580.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(729, 650, 0, 52, '荣耀路由Pro 大户型穿墙王1200Mbps智能AC有线无线双千兆旗舰路由器（白色）', 'TP0000052', 65535, '428.00', '328.00', '0.00', '328.00', 0, '58', '颜色:白色', '', 0, 0, 0, 0, 0, ''),
(730, 651, 0, 40, '荣耀X2 标准版 双卡双待双通 移动/联通双4G 16GB ROM（月光银）', 'TP0000040', 2, '2099.00', '1000.00', '0.00', '1000.00', 0, '41_47', '尺寸:7寸及以下 内存:16G', '', 0, 0, 0, 0, 0, ''),
(731, 652, 0, 119, '小米旗舰店正品手机平板通用迷你充电宝 移动电源10000毫安大容量', 'TP0000119', 1, '169.00', '69.00', '0.00', '69.00', 0, '103', '颜色:土豪金', '', 0, 0, 0, 0, 0, ''),
(732, 653, 0, 76, '韩文2015冬装新款女装红色双排扣配腰带毛呢大衣.', 'TP0000076', 1, '389.00', '267.00', '0.00', '267.00', 0, '80', '尺码:XL', '', 0, 0, 0, 0, 0, ''),
(733, 654, 0, 124, 'Nikon/尼康D3300入门单反相机 升级版AF-P 18-55镜头套机 分期购', 'TP0000124', 1, '2499.00', '2399.00', '0.00', '2399.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(734, 655, 0, 66, '迎馨家纺全棉斜纹印花双人四件套邂逅 AB版纯棉，亲肤透气', 'TP0000066', 1, '210.00', '110.00', '0.00', '110.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(735, 656, 0, 66, '迎馨家纺全棉斜纹印花双人四件套邂逅 AB版纯棉，亲肤透气', 'TP0000066', 1, '210.00', '110.00', '0.00', '110.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(736, 657, 0, 39, '华为（HUAWEI） M2 10.0 平板电脑 WiFi 月光银', 'TP0000039', 1, '2388.00', '2000.00', '0.00', '2000.00', 0, '41_47_51', '尺寸:7寸及以下 内存:16G 颜色:银白色', '', 0, 0, 0, 0, 0, ''),
(737, 657, 0, 40, '荣耀X2 标准版 双卡双待双通 移动/联通双4G 16GB ROM（月光银）', 'TP0000040', 1, '2099.00', '1000.00', '0.00', '1000.00', 0, '41_47', '尺寸:7寸及以下 内存:16G', '', 0, 0, 0, 0, 0, ''),
(738, 658, 0, 123, 'Canon/佳能 EOS 750D单反套机（18-55mm）高清数码相机苏宁易购', 'TP0000123', 1, '4097.00', '3997.00', '0.00', '3917.06', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(739, 658, 0, 39, '华为（HUAWEI） M2 10.0 平板电脑 WiFi 月光银', 'TP0000039', 1, '2388.00', '2000.00', '0.00', '1960.00', 0, '41_47_51', '尺寸:7寸及以下 内存:16G 颜色:银白色', '', 0, 0, 0, 0, 0, ''),
(740, 659, 0, 39, '华为（HUAWEI） M2 10.0 平板电脑 WiFi 月光银', 'TP0000039', 1, '2388.00', '2000.00', '0.00', '2000.00', 0, '41_47_51', '尺寸:7寸及以下 内存:16G 颜色:银白色', '', 0, 0, 0, 0, 0, ''),
(741, 660, 0, 66, '迎馨家纺全棉斜纹印花双人四件套邂逅 AB版纯棉，亲肤透气', 'TP0000066', 1, '210.00', '110.00', '0.00', '110.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(742, 661, 0, 119, '小米旗舰店正品手机平板通用迷你充电宝 移动电源10000毫安大容量', 'TP0000119', 1, '169.00', '69.00', '0.00', '69.00', 0, '103', '颜色:土豪金', '', 0, 0, 0, 0, 0, ''),
(743, 662, 0, 141, '三星 Galaxy A9高配版 (A9100) 精灵黑 全网通4G手机 双卡双待', 'TP0000141', 2, '3599.00', '3400.00', '0.00', '3400.00', 0, '55', '颜色:黑色', '', 0, 1, 2, 0, 0, ''),
(744, 662, 0, 1, 'Apple iPhone 6s Plus 16G 玫瑰金 移动联通电信4G手机', 'TP000000', 1, '6100.00', '6000.00', '0.00', '5880.00', 0, '11_55_102', '网络:4G 颜色:黑色 内存:128G', '', 0, 0, 0, 0, 0, ''),
(745, 663, 0, 143, 'haier海尔 BC-93TMPF 93升单门冰箱', 'TP0000143', 1, '799.00', '0.01', '0.00', '0.01', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(746, 664, 0, 104, '小米手机5,十余项黑科技，很轻狠快', 'TP0000104', 2, '2099.00', '6000.00', '0.00', '5880.00', 0, '28_55', '内存:32G 颜色:黑色', '', 0, 0, 0, 0, 0, ''),
(747, 665, 0, 77, '红衣主角2015冬装新款走秀款大气简约黄色羊毛呢大衣.', 'TP0000077', 2, '499.00', '399.00', '0.00', '391.02', 0, '77', '尺码:S', '', 0, 0, 0, 0, 0, ''),
(748, 666, 0, 103, '珂兰钻石 18K金90分效果群镶钻石戒指 倾城 需定制', 'TP0000103', 1, '2099.00', '0.01', '0.00', '0.01', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(749, 667, 0, 66, '迎馨家纺全棉斜纹印花双人四件套邂逅 AB版纯棉，亲肤透气', 'TP0000066', 1, '210.00', '110.00', '0.00', '110.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(750, 667, 0, 141, '三星 Galaxy A9高配版 (A9100) 精灵黑 全网通4G手机 双卡双待', 'TP0000141', 2, '3599.00', '3400.00', '0.00', '3400.00', 0, '55', '颜色:黑色', '', 0, 1, 2, 0, 0, ''),
(751, 668, 0, 39, '华为（HUAWEI） M2 10.0 平板电脑 WiFi 月光银', 'TP0000039', 1, '2388.00', '2000.00', '0.00', '1960.00', 0, '41_47_51', '尺寸:7寸及以下 内存:16G 颜色:银白色', '', 0, 0, 0, 0, 0, ''),
(752, 669, 0, 66, '迎馨家纺全棉斜纹印花双人四件套邂逅 AB版纯棉，亲肤透气', 'TP0000066', 1, '210.00', '110.00', '0.00', '110.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(753, 669, 0, 143, 'haier海尔 BC-93TMPF 93升单门冰箱', 'TP0000143', 1, '799.00', '0.01', '0.00', '0.01', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(754, 670, 0, 136, '靓号0元送广东联通4G/3G手机卡上网卡大流量套餐全国无漫游选号', 'TP0000136', 2, '220.00', '50.00', '0.00', '50.00', 0, '108', '合约套餐:乐享4G套餐99元', '', 0, 1, 3, 0, 0, ''),
(755, 670, 0, 119, '小米旗舰店正品手机平板通用迷你充电宝 移动电源10000毫安大容量', 'TP0000119', 2, '169.00', '69.00', '0.00', '69.00', 0, '103', '颜色:土豪金', '', 0, 0, 0, 0, 0, ''),
(756, 671, 0, 76, '韩文2015冬装新款女装红色双排扣配腰带毛呢大衣.', 'TP0000076', 1, '389.00', '0.01', '0.00', '0.01', 0, '77', '尺码:S', '', 0, 0, 0, 0, 0, ''),
(757, 672, 0, 46, '【北京移动老用户专享 话费六折】荣耀畅玩5X 双卡双待 移动版 智能手机（破晓银）', 'TP0000046', 1, '1099.00', '999.00', '0.00', '979.02', 0, '11_13_21', '网络:4G 内存:16G 屏幕:触屏', '', 0, 0, 0, 0, 0, ''),
(758, 673, 0, 143, 'haier海尔 BC-93TMPF 93升单门冰箱', 'TP0000143', 1, '799.00', '0.01', '0.00', '0.01', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(759, 673, 0, 139, '天翼小白49元纯流量卡（随机选号 只发辽宁）60元含100元资费', 'TP0000139', 1, '160.00', '59.00', '0.00', '59.00', 0, '106_112', '合约套餐:乐享4G套餐59元 套餐:微型卡', '', 0, 0, 0, 0, 0, ''),
(760, 674, 0, 39, '华为（HUAWEI） M2 10.0 平板电脑 WiFi 月光银', 'TP0000039', 1, '2388.00', '2000.00', '0.00', '2000.00', 0, '41_47_51', '尺寸:7寸及以下 内存:16G 颜色:银白色', '', 0, 0, 0, 0, 0, ''),
(761, 674, 0, 66, '迎馨家纺全棉斜纹印花双人四件套邂逅 AB版纯棉，亲肤透气', 'TP0000066', 1, '210.00', '110.00', '0.00', '110.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(762, 675, 0, 119, '小米旗舰店正品手机平板通用迷你充电宝 移动电源10000毫安大容量', 'TP0000119', 1, '169.00', '69.00', '0.00', '69.00', 0, '103', '颜色:土豪金', '', 0, 0, 0, 0, 0, ''),
(763, 675, 0, 40, '荣耀X2 标准版 双卡双待双通 移动/联通双4G 16GB ROM（月光银）', 'TP0000040', 1, '2099.00', '1000.00', '0.00', '1000.00', 0, '41_47', '尺寸:7寸及以下 内存:16G', '', 0, 0, 0, 0, 0, ''),
(764, 675, 0, 39, '华为（HUAWEI） M2 10.0 平板电脑 WiFi 月光银', 'TP0000039', 1, '2388.00', '4200.00', '0.00', '4200.00', 0, '41_48_52', '尺寸:7寸及以下 内存:32G 颜色:黑色', '', 0, 0, 0, 0, 0, ''),
(765, 676, 0, 39, '华为（HUAWEI） M2 10.0 平板电脑 WiFi 月光银', 'TP0000039', 2, '2388.00', '2000.00', '0.00', '2000.00', 0, '41_47_51', '尺寸:7寸及以下 内存:16G 颜色:银白色', '', 0, 0, 0, 0, 0, ''),
(766, 677, 0, 141, '三星 Galaxy A9高配版 (A9100) 精灵黑 全网通4G手机 双卡双待', 'TP0000141', 1, '3599.00', '3400.00', '0.00', '3400.00', 0, '55', '颜色:黑色', '', 0, 1, 2, 0, 0, ''),
(767, 678, 0, 141, '三星 Galaxy A9高配版 (A9100) 精灵黑 全网通4G手机 双卡双待', 'TP0000141', 1, '3599.00', '3400.00', '0.00', '3400.00', 0, '55', '颜色:黑色', '', 0, 1, 2, 0, 0, ''),
(768, 679, 0, 118, 'ROMOSS/罗马仕 sense4 正品10000+毫安移动电源 手机通用充电宝', 'TP0000118', 1, '159.00', '59.00', '0.00', '59.00', 0, '104', '颜色:象牙白', '', 0, 0, 0, 0, 0, ''),
(769, 680, 0, 143, 'haier海尔 BC-93TMPF 93升单门冰箱', 'TP0000143', 1, '799.00', '0.01', '0.00', '0.01', 0, '', '', '', 0, 3, 1, 0, 0, ''),
(770, 681, 0, 119, '小米旗舰店正品手机平板通用迷你充电宝 移动电源10000毫安大容量', 'TP0000119', 1, '169.00', '69.00', '0.00', '69.00', 0, '103', '颜色:土豪金', '', 0, 0, 0, 0, 0, ''),
(771, 682, 0, 141, '三星 Galaxy A9高配版 (A9100) 精灵黑 全网通4G手机 双卡双待', 'TP0000141', 1, '3599.00', '3400.00', '0.00', '3400.00', 0, '55', '颜色:黑色', '', 0, 1, 2, 0, 0, ''),
(772, 683, 0, 76, '韩文2015冬装新款女装红色双排扣配腰带毛呢大衣.', 'TP0000076', 1, '389.00', '0.01', '0.00', '0.01', 0, '77', '尺码:S', '', 0, 0, 0, 0, 0, ''),
(773, 684, 0, 76, '韩文2015冬装新款女装红色双排扣配腰带毛呢大衣.', 'TP0000076', 1, '389.00', '0.01', '0.00', '0.01', 0, '77', '尺码:S', '', 0, 0, 0, 0, 0, ''),
(774, 685, 0, 119, '小米旗舰店正品手机平板通用迷你充电宝 移动电源10000毫安大容量', 'TP0000119', 1, '169.00', '69.00', '0.00', '69.00', 0, '103', '颜色:土豪金', '', 0, 0, 0, 0, 0, ''),
(775, 686, 0, 139, '天翼小白49元纯流量卡（随机选号 只发辽宁）60元含100元资费', 'TP0000139', 2, '160.00', '54.00', '0.00', '54.00', 0, '106_112', '合约套餐:乐享4G套餐59元 套餐:微型卡', '', 0, 3, 1, 0, 0, ''),
(776, 687, 0, 140, 'Apple iPhone 6s 16GB 玫瑰金色 移动联通电信4G手机', 'TP0000140', 1, '4958.00', '4372.20', '0.00', '4372.20', 0, '11_13_55', '网络:4G 内存:16G 颜色:黑色', '', 0, 3, 1, 0, 0, ''),
(777, 688, 0, 71, '布雷尔 床 皮床 双人床 真皮床 软床 皮艺床 1.8米婚床', 'TP0000071', 1, '1680.00', '1580.00', '0.00', '1580.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(778, 689, 0, 143, 'haier海尔 BC-93TMPF 93升单门冰箱', 'TP0000143', 1, '799.00', '0.01', '0.00', '0.01', 0, '', '', '', 0, 3, 1, 0, 0, ''),
(779, 690, 0, 119, '小米旗舰店正品手机平板通用迷你充电宝 移动电源10000毫安大容量', 'TP0000119', 2, '169.00', '69.00', '0.00', '69.00', 0, '103', '颜色:土豪金', '', 0, 0, 0, 0, 0, ''),
(780, 691, 0, 119, '小米旗舰店正品手机平板通用迷你充电宝 移动电源10000毫安大容量', 'TP0000119', 1, '169.00', '69.00', '0.00', '69.00', 0, '103', '颜色:土豪金', '', 0, 0, 0, 0, 0, ''),
(781, 692, 0, 66, '迎馨家纺全棉斜纹印花双人四件套邂逅 AB版纯棉，亲肤透气', 'TP0000066', 2, '210.00', '110.00', '0.00', '110.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(782, 693, 0, 49, '荣耀畅玩5X 双卡双待 移动版 智能手机（破晓银）', 'TP0000049', 1, '1099.00', '999.00', '0.00', '999.00', 0, '11_13_21', '网络:4G 内存:16G 屏幕:触屏', '', 0, 0, 0, 0, 0, ''),
(783, 694, 0, 39, '华为（HUAWEI） M2 10.0 平板电脑 WiFi 月光银', 'TP0000039', 1, '2388.00', '2000.00', '0.00', '2000.00', 0, '41_47_51', '尺寸:7寸及以下 内存:16G 颜色:银白色', '', 0, 0, 0, 0, 0, ''),
(784, 695, 0, 76, '韩文2015冬装新款女装红色双排扣配腰带毛呢大衣.', 'TP0000076', 1, '389.00', '0.01', '0.00', '0.01', 0, '77', '尺码:S', '', 0, 0, 0, 0, 0, ''),
(785, 696, 0, 66, '迎馨家纺全棉斜纹印花双人四件套邂逅 AB版纯棉，亲肤透气', 'TP0000066', 1, '210.00', '110.00', '0.00', '110.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(786, 697, 0, 39, '华为（HUAWEI） M2 10.0 平板电脑 WiFi 月光银', 'TP0000039', 1, '2388.00', '2000.00', '0.00', '2000.00', 0, '41_47_51', '尺寸:7寸及以下 内存:16G 颜色:银白色', '', 0, 0, 0, 0, 0, ''),
(787, 698, 0, 141, '三星 Galaxy A9高配版 (A9100) 精灵黑 全网通4G手机 双卡双待', 'TP0000141', 3, '3599.00', '3400.00', '0.00', '3400.00', 0, '55', '颜色:黑色', '', 0, 1, 2, 0, 0, ''),
(788, 699, 0, 141, '三星 Galaxy A9高配版 (A9100) 精灵黑 全网通4G手机 双卡双待', 'TP0000141', 1, '3599.00', '3400.00', '0.00', '3400.00', 0, '55', '颜色:黑色', '', 0, 1, 2, 0, 0, ''),
(789, 699, 0, 124, 'Nikon/尼康D3300入门单反相机 升级版AF-P 18-55镜头套机 分期购', 'TP0000124', 1, '2499.00', '2399.00', '0.00', '2351.02', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(790, 700, 0, 66, '迎馨家纺全棉斜纹印花双人四件套邂逅 AB版纯棉，亲肤透气', 'TP0000066', 1, '210.00', '110.00', '0.00', '110.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(791, 701, 0, 82, '舒肤佳纯白清香型沐浴露720ml', 'TP0000082', 1, '147.60', '47.60', '0.00', '47.60', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(792, 701, 0, 39, '华为（HUAWEI） M2 10.0 平板电脑 WiFi 月光银', 'TP0000039', 1, '2388.00', '2000.00', '0.00', '2000.00', 0, '41_47_51', '尺寸:7寸及以下 内存:16G 颜色:银白色', '', 0, 0, 0, 0, 0, ''),
(793, 702, 0, 103, '珂兰钻石 18K金90分效果群镶钻石戒指 倾城 需定制', 'TP0000103', 2, '2099.00', '1999.00', '0.00', '1999.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(794, 703, 0, 134, '中国电信4G号卡手机卡电话卡上网卡 177号段套餐可选 预存120全返', 'TP0000134', 1, '220.00', '108.00', '0.00', '108.00', 0, '106', '合约套餐:乐享4G套餐59元', '', 0, 3, 1, 0, 0, ''),
(795, 704, 0, 141, '三星 Galaxy A9高配版 (A9100) 精灵黑 全网通4G手机 双卡双待', 'TP0000141', 1, '3599.00', '3400.00', '0.00', '3400.00', 0, '55', '颜色:黑色', '', 0, 1, 2, 0, 0, ''),
(796, 705, 0, 76, '韩文2015冬装新款女装红色双排扣配腰带毛呢大衣.', 'TP0000076', 1, '389.00', '0.01', '0.00', '0.01', 0, '77', '尺码:S', '', 0, 0, 0, 0, 0, ''),
(797, 706, 0, 119, '小米旗舰店正品手机平板通用迷你充电宝 移动电源10000毫安大容量', 'TP0000119', 1, '169.00', '69.00', '0.00', '69.00', 0, '103', '颜色:土豪金', '', 0, 0, 0, 0, 0, ''),
(798, 707, 0, 39, '华为（HUAWEI） M2 10.0 平板电脑 WiFi 月光银', 'TP0000039', 1, '2388.00', '2000.00', '0.00', '2000.00', 0, '41_47_51', '尺寸:7寸及以下 内存:16G 颜色:银白色', '', 0, 0, 0, 0, 0, ''),
(799, 708, 0, 39, '华为（HUAWEI） M2 10.0 平板电脑 WiFi 月光银', 'TP0000039', 1, '2388.00', '2000.00', '0.00', '2000.00', 0, '41_47_51', '尺寸:7寸及以下 内存:16G 颜色:银白色', '', 0, 0, 0, 0, 0, ''),
(800, 709, 0, 67, '迎馨家纺 全棉斜纹印花双人四件套 约定 桔色 1.5米床', 'TP0000067', 1, '200.00', '100.00', '0.00', '100.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(801, 709, 0, 66, '迎馨家纺全棉斜纹印花双人四件套邂逅 AB版纯棉，亲肤透气', 'TP0000066', 1, '210.00', '110.00', '0.00', '110.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(802, 710, 0, 66, '迎馨家纺全棉斜纹印花双人四件套邂逅 AB版纯棉，亲肤透气', 'TP0000066', 2, '210.00', '110.00', '0.00', '110.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(803, 711, 0, 141, '三星 Galaxy A9高配版 (A9100) 精灵黑 全网通4G手机 双卡双待', 'TP0000141', 2, '3599.00', '3499.00', '0.00', '3499.00', 0, '55', '颜色:黑色', '', 0, 1, 2, 0, 0, ''),
(804, 712, 0, 119, '小米旗舰店正品手机平板通用迷你充电宝 移动电源10000毫安大容量', 'TP0000119', 1, '169.00', '69.00', '0.00', '69.00', 0, '103', '颜色:土豪金', '', 0, 0, 0, 0, 0, ''),
(805, 713, 0, 119, '小米旗舰店正品手机平板通用迷你充电宝 移动电源10000毫安大容量', 'TP0000119', 2, '169.00', '69.00', '0.00', '67.62', 0, '103', '颜色:土豪金', '', 0, 0, 0, 0, 0, ''),
(806, 713, 0, 116, 'ROMOSS/罗马仕 sense6 20000M毫安充电宝 正品手机通用移动电源', 'TP0000116', 1, '189.00', '1000.00', '0.00', '980.00', 0, '103', '颜色:土豪金', '', 0, 0, 0, 0, 0, ''),
(807, 714, 0, 76, '韩文2015冬装新款女装红色双排扣配腰带毛呢大衣.', 'TP0000076', 1, '389.00', '0.01', '0.00', '0.01', 0, '77', '尺码:S', '', 0, 0, 0, 0, 0, ''),
(808, 715, 0, 76, '韩文2015冬装新款女装红色双排扣配腰带毛呢大衣.', 'TP0000076', 1, '389.00', '0.01', '0.00', '0.01', 0, '77', '尺码:S', '', 0, 0, 0, 0, 0, ''),
(809, 716, 0, 76, '韩文2015冬装新款女装红色双排扣配腰带毛呢大衣.', 'TP0000076', 1, '389.00', '0.01', '0.00', '0.01', 0, '77', '尺码:S', '', 0, 0, 0, 0, 0, ''),
(810, 717, 0, 140, 'Apple iPhone 6s 16GB 玫瑰金色 移动联通电信4G手机', 'TP0000140', 2, '4958.00', '4372.20', '0.00', '4372.20', 0, '11_13_55', '网络:4G 内存:16G 颜色:黑色', '', 0, 3, 1, 0, 0, ''),
(811, 718, 0, 66, '迎馨家纺全棉斜纹印花双人四件套邂逅 AB版纯棉，亲肤透气', 'TP0000066', 2, '210.00', '110.00', '0.00', '107.80', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(812, 719, 0, 115, '爸爸2陆毅代言索扬20000毫安充电宝轻薄正品手机通用移动电源MAh', 'TP0000115', 1, '184.90', '84.90', '0.00', '84.90', 0, '103', '颜色:土豪金', '', 0, 0, 0, 0, 0, ''),
(813, 720, 0, 119, '小米旗舰店正品手机平板通用迷你充电宝 移动电源10000毫安大容量', 'TP0000119', 1, '169.00', '69.00', '0.00', '69.00', 0, '103', '颜色:土豪金', '', 0, 0, 0, 0, 0, '');
INSERT INTO `ruike_mall_order_goods` (`rec_id`, `order_id`, `member_id`, `goods_id`, `goods_name`, `goods_sn`, `goods_num`, `market_price`, `goods_price`, `cost_price`, `member_goods_price`, `give_integral`, `spec_key`, `spec_key_name`, `bar_code`, `is_comment`, `prom_type`, `prom_id`, `is_send`, `delivery_id`, `sku`) VALUES
(814, 721, 0, 98, '六福珠宝足金DIY刻字片挂饰黄金项链吊坠手链挂饰计价GMGTBP0057', 'TP0000098', 1, '339.00', '239.00', '0.00', '234.22', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(815, 721, 0, 89, 'Versace范思哲 晶钻 女用香水 30ml', 'TP0000089', 1, '272.00', '172.00', '0.00', '168.56', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(816, 721, 0, 76, '韩文2015冬装新款女装红色双排扣配腰带毛呢大衣.', 'TP0000076', 3, '389.00', '0.01', '0.00', '0.01', 0, '77', '尺码:S', '', 0, 0, 0, 0, 0, ''),
(817, 721, 0, 99, 'CNUTI粤通国际珠宝 黄金首饰 足金花生吊坠 男女同款 宝宝礼物 约1.25克左右', 'TP0000099', 1, '509.00', '409.00', '0.00', '400.82', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(818, 722, 0, 141, '三星 Galaxy A9高配版 (A9100) 精灵黑 全网通4G手机 双卡双待', 'TP0000141', 1, '3599.00', '3400.00', '0.00', '3400.00', 0, '55', '颜色:黑色', '', 0, 1, 2, 0, 0, ''),
(819, 722, 0, 76, '韩文2015冬装新款女装红色双排扣配腰带毛呢大衣.', 'TP0000076', 1, '389.00', '0.01', '0.00', '0.01', 0, '77', '尺码:S', '', 0, 0, 0, 0, 0, ''),
(820, 722, 0, 67, '迎馨家纺 全棉斜纹印花双人四件套 约定 桔色 1.5米床', 'TP0000067', 1, '200.00', '100.00', '0.00', '100.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(821, 723, 0, 66, '迎馨家纺全棉斜纹印花双人四件套邂逅 AB版纯棉，亲肤透气', 'TP0000066', 1, '210.00', '110.00', '0.00', '110.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(822, 724, 0, 136, '靓号0元送广东联通4G/3G手机卡上网卡大流量套餐全国无漫游选号', 'TP0000136', 2, '220.00', '50.00', '0.00', '50.00', 0, '108', '合约套餐:乐享4G套餐99元', '', 0, 1, 3, 0, 0, ''),
(823, 725, 0, 141, '三星 Galaxy A9高配版 (A9100) 精灵黑 全网通4G手机 双卡双待', 'TP0000141', 1, '3599.00', '3400.00', '0.00', '3400.00', 0, '55', '颜色:黑色', '', 0, 1, 2, 0, 0, ''),
(824, 726, 0, 39, '华为（HUAWEI） M2 10.0 平板电脑 WiFi 月光银', 'TP0000039', 2, '2388.00', '2000.00', '0.00', '1960.00', 0, '41_47_51', '尺寸:7寸及以下 内存:16G 颜色:银白色', '', 0, 0, 0, 0, 0, ''),
(825, 726, 0, 50, '华为 HUAWEI 畅享5S 全网通 2GB RAM+16GB ROM（金色）', 'TP0000050', 1, '1299.00', '1169.00', '0.00', '1145.62', 0, '11_13_21_55', '网络:4G 内存:16G 屏幕:触屏 颜色:黑色', '', 0, 0, 0, 0, 0, ''),
(826, 727, 0, 141, '三星 Galaxy A9高配版 (A9100) 精灵黑 全网通4G手机 双卡双待', 'TP0000141', 1, '3599.00', '3400.00', '0.00', '3400.00', 0, '55', '颜色:黑色', '', 0, 1, 2, 0, 0, ''),
(827, 728, 0, 66, '迎馨家纺全棉斜纹印花双人四件套邂逅 AB版纯棉，亲肤透气', 'TP0000066', 1, '210.00', '110.00', '0.00', '110.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(828, 729, 0, 119, '小米旗舰店正品手机平板通用迷你充电宝 移动电源10000毫安大容量', 'TP0000119', 2, '169.00', '69.00', '0.00', '69.00', 0, '103', '颜色:土豪金', '', 0, 0, 0, 0, 0, ''),
(829, 729, 0, 141, '三星 Galaxy A9高配版 (A9100) 精灵黑 全网通4G手机 双卡双待', 'TP0000141', 1, '3599.00', '3400.00', '0.00', '3400.00', 0, '55', '颜色:黑色', '', 0, 1, 2, 0, 0, ''),
(830, 730, 0, 66, '迎馨家纺全棉斜纹印花双人四件套邂逅 AB版纯棉，亲肤透气', 'TP0000066', 1, '210.00', '110.00', '0.00', '110.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(831, 731, 0, 66, '迎馨家纺全棉斜纹印花双人四件套邂逅 AB版纯棉，亲肤透气', 'TP0000066', 1, '210.00', '110.00', '0.00', '110.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(832, 732, 0, 103, '珂兰钻石 18K金90分效果群镶钻石戒指 倾城 需定制', 'TP0000103', 1, '2099.00', '1999.00', '0.00', '1999.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(833, 733, 0, 137, '中麦通信4G联通网络手机靓号 170手机卡电话卡靓号卡可选号包邮', 'TP0000137', 1, '600.00', '450.00', '0.00', '450.00', 0, '106_112', '合约套餐:乐享4G套餐59元 套餐:微型卡', '', 0, 3, 1, 0, 0, ''),
(834, 734, 0, 136, '靓号0元送广东联通4G/3G手机卡上网卡大流量套餐全国无漫游选号', 'TP0000136', 1, '220.00', '50.00', '0.00', '50.00', 0, '108', '合约套餐:乐享4G套餐99元', '', 0, 1, 3, 0, 0, ''),
(835, 735, 0, 141, '三星 Galaxy A9高配版 (A9100) 精灵黑 全网通4G手机 双卡双待', 'TP0000141', 1, '3599.00', '3400.00', '0.00', '3400.00', 0, '55', '颜色:黑色', '', 0, 1, 2, 0, 0, ''),
(836, 736, 0, 119, '小米旗舰店正品手机平板通用迷你充电宝 移动电源10000毫安大容量', 'TP0000119', 1, '169.00', '69.00', '0.00', '69.00', 0, '103', '颜色:土豪金', '', 0, 0, 0, 0, 0, ''),
(837, 737, 0, 76, '韩文2015冬装新款女装红色双排扣配腰带毛呢大衣.', 'TP0000076', 1, '389.00', '0.01', '0.00', '0.01', 0, '77', '尺码:S', '', 0, 0, 0, 0, 0, ''),
(838, 738, 0, 66, '迎馨家纺全棉斜纹印花双人四件套邂逅 AB版纯棉，亲肤透气', 'TP0000066', 1, '210.00', '110.00', '0.00', '110.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(839, 739, 0, 83, '力士精油香氛幽莲魅肤沐浴乳1000ml（新老包装随机发货）', 'TP0000083', 1, '139.90', '39.90', '0.00', '39.90', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(840, 740, 0, 136, '靓号0元送广东联通4G/3G手机卡上网卡大流量套餐全国无漫游选号', 'TP0000136', 1, '220.00', '120.00', '0.00', '120.00', 0, '108', '合约套餐:乐享4G套餐99元', '', 0, 1, 3, 0, 0, ''),
(841, 741, 0, 125, '【0首付分期】蚂蚁摄影联保单反数码相机Canon/佳能 EOS 760D套机', 'TP0000125', 1, '5599.00', '5499.00', '0.00', '5499.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(842, 742, 0, 141, '三星 Galaxy A9高配版 (A9100) 精灵黑 全网通4G手机 双卡双待', 'TP0000141', 1, '3599.00', '3400.00', '0.00', '3400.00', 0, '55', '颜色:黑色', '', 0, 1, 2, 0, 0, ''),
(843, 743, 0, 66, '迎馨家纺全棉斜纹印花双人四件套邂逅 AB版纯棉，亲肤透气', 'TP0000066', 1, '210.00', '110.00', '0.00', '110.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(844, 744, 0, 76, '韩文2015冬装新款女装红色双排扣配腰带毛呢大衣.', 'TP0000076', 1, '389.00', '0.01', '0.00', '0.01', 0, '77', '尺码:S', '', 0, 0, 0, 0, 0, ''),
(845, 745, 0, 76, '韩文2015冬装新款女装红色双排扣配腰带毛呢大衣.', 'TP0000076', 1, '389.00', '0.01', '0.00', '0.01', 0, '77', '尺码:S', '', 0, 0, 0, 0, 0, ''),
(846, 746, 0, 123, 'Canon/佳能 EOS 750D单反套机（18-55mm）高清数码相机苏宁易购', 'TP0000123', 3, '4097.00', '3997.00', '0.00', '3917.06', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(847, 747, 0, 123, 'Canon/佳能 EOS 750D单反套机（18-55mm）高清数码相机苏宁易购', 'TP0000123', 1, '4097.00', '3997.00', '0.00', '3917.06', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(848, 748, 0, 76, '韩文2015冬装新款女装红色双排扣配腰带毛呢大衣.', 'TP0000076', 2, '389.00', '0.01', '0.00', '0.01', 0, '77', '尺码:S', '', 0, 0, 0, 0, 0, ''),
(849, 749, 0, 140, 'Apple iPhone 6s 16GB 玫瑰金色 移动联通电信4G手机', 'TP0000140', 1, '4958.00', '4372.20', '0.00', '4372.20', 0, '11_13_55', '网络:4G 内存:16G 颜色:黑色', '', 0, 3, 1, 0, 0, ''),
(850, 750, 0, 135, '重庆电信手机卡电话卡语音卡选靓号3G4G卡内部5折卡低资费（飞）', 'TP0000135', 2, '160.00', '54.00', '0.00', '54.00', 0, '106', '合约套餐:乐享4G套餐59元', '', 0, 3, 1, 0, 0, ''),
(851, 751, 0, 76, '韩文2015冬装新款女装红色双排扣配腰带毛呢大衣.', 'TP0000076', 2, '389.00', '0.01', '0.00', '0.01', 0, '77', '尺码:S', '', 0, 0, 0, 0, 0, ''),
(852, 751, 0, 141, '三星 Galaxy A9高配版 (A9100) 精灵黑 全网通4G手机 双卡双待', 'TP0000141', 1, '3599.00', '3400.00', '0.00', '3400.00', 0, '55', '颜色:黑色', '', 0, 1, 2, 0, 0, ''),
(853, 752, 0, 141, '三星 Galaxy A9高配版 (A9100) 精灵黑 全网通4G手机 双卡双待', 'TP0000141', 1, '3599.00', '3400.00', '0.00', '3400.00', 0, '55', '颜色:黑色', '', 0, 1, 2, 0, 0, ''),
(854, 753, 0, 76, '韩文2015冬装新款女装红色双排扣配腰带毛呢大衣.', 'TP0000076', 5, '389.00', '0.01', '0.00', '0.01', 0, '77', '尺码:S', '', 0, 0, 0, 0, 0, ''),
(855, 754, 0, 40, '荣耀X2 标准版 双卡双待双通 移动/联通双4G 16GB ROM（月光银）', 'TP0000040', 2, '2099.00', '1000.00', '0.00', '980.00', 0, '41_47', '尺寸:7寸及以下 内存:16G', '', 0, 0, 0, 0, 0, ''),
(856, 755, 0, 39, '华为（HUAWEI） M2 10.0 平板电脑 WiFi 月光银', 'TP0000039', 1, '2388.00', '2000.00', '0.00', '2000.00', 0, '41_47_51', '尺寸:7寸及以下 内存:16G 颜色:银白色', '', 0, 0, 0, 0, 0, ''),
(857, 756, 0, 119, '小米旗舰店正品手机平板通用迷你充电宝 移动电源10000毫安大容量', 'TP0000119', 1, '169.00', '69.00', '0.00', '67.62', 0, '103', '颜色:土豪金', '', 0, 0, 0, 0, 0, ''),
(858, 757, 0, 136, '靓号0元送广东联通4G/3G手机卡上网卡大流量套餐全国无漫游选号', 'TP0000136', 3, '220.00', '120.00', '0.00', '120.00', 0, '108', '合约套餐:乐享4G套餐99元', '', 0, 1, 3, 0, 0, ''),
(859, 758, 0, 141, '三星 Galaxy A9高配版 (A9100) 精灵黑 全网通4G手机 双卡双待', 'TP0000141', 1, '3599.00', '3400.00', '0.00', '3400.00', 0, '55', '颜色:黑色', '', 0, 1, 2, 0, 0, ''),
(860, 759, 0, 39, '华为（HUAWEI） M2 10.0 平板电脑 WiFi 月光银', 'TP0000039', 2, '2388.00', '2000.00', '0.00', '1960.00', 0, '41_47_51', '尺寸:7寸及以下 内存:16G 颜色:银白色', '', 0, 0, 0, 0, 0, ''),
(861, 760, 0, 71, '布雷尔 床 皮床 双人床 真皮床 软床 皮艺床 1.8米婚床', 'TP0000071', 2, '1680.00', '1580.00', '0.00', '1580.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(862, 761, 0, 40, '荣耀X2 标准版 双卡双待双通 移动/联通双4G 16GB ROM（月光银）', 'TP0000040', 3, '2099.00', '1000.00', '0.00', '980.00', 0, '41_47', '尺寸:7寸及以下 内存:16G', '', 0, 0, 0, 0, 0, ''),
(863, 762, 0, 140, 'Apple iPhone 6s 16GB 玫瑰金色 移动联通电信4G手机', 'TP0000140', 1, '4958.00', '4372.20', '0.00', '4372.20', 0, '11_13_55', '网络:4G 内存:16G 颜色:黑色', '', 0, 3, 1, 0, 0, ''),
(864, 763, 0, 66, '迎馨家纺全棉斜纹印花双人四件套邂逅 AB版纯棉，亲肤透气', 'TP0000066', 1, '210.00', '110.00', '0.00', '110.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(865, 764, 0, 135, '重庆电信手机卡电话卡语音卡选靓号3G4G卡内部5折卡低资费（飞）', 'TP0000135', 1, '160.00', '54.00', '0.00', '54.00', 0, '106', '合约套餐:乐享4G套餐59元', '', 0, 3, 1, 0, 0, ''),
(866, 765, 0, 119, '小米旗舰店正品手机平板通用迷你充电宝 移动电源10000毫安大容量', 'TP0000119', 1, '169.00', '69.00', '0.00', '67.62', 0, '103', '颜色:土豪金', '', 0, 0, 0, 0, 0, ''),
(867, 766, 0, 39, '华为（HUAWEI） M2 10.0 平板电脑 WiFi 月光银', 'TP0000039', 2, '2388.00', '2000.00', '0.00', '2000.00', 0, '41_47_51', '尺寸:7寸及以下 内存:16G 颜色:银白色', '', 0, 0, 0, 0, 0, ''),
(868, 767, 0, 136, '靓号0元送广东联通4G/3G手机卡上网卡大流量套餐全国无漫游选号', 'TP0000136', 1, '220.00', '50.00', '0.00', '50.00', 0, '108', '合约套餐:乐享4G套餐99元', '', 0, 1, 3, 0, 0, ''),
(869, 768, 0, 138, '广州电信卡|4G定制卡|含50话费|手机卡号码卡|上网卡流量卡靓号', 'TP0000138', 1, '179.00', '71.10', '0.00', '71.10', 0, '106', '合约套餐:乐享4G套餐59元', '', 0, 3, 1, 0, 0, ''),
(870, 769, 0, 135, '重庆电信手机卡电话卡语音卡选靓号3G4G卡内部5折卡低资费（飞）', 'TP0000135', 1, '160.00', '54.00', '0.00', '54.00', 0, '106', '合约套餐:乐享4G套餐59元', '', 0, 3, 1, 0, 0, ''),
(871, 770, 0, 119, '小米旗舰店正品手机平板通用迷你充电宝 移动电源10000毫安大容量', 'TP0000119', 1, '169.00', '69.00', '0.00', '67.62', 0, '103', '颜色:土豪金', '', 1, 0, 0, 1, 15, ''),
(872, 771, 0, 119, '小米旗舰店正品手机平板通用迷你充电宝 移动电源10000毫安大容量', 'TP0000119', 1, '169.00', '69.00', '0.00', '67.62', 0, '103', '颜色:土豪金', '', 0, 0, 0, 0, 0, ''),
(873, 772, 0, 119, '小米旗舰店正品手机平板通用迷你充电宝 移动电源10000毫安大容量', 'TP0000119', 1, '169.00', '69.00', '0.00', '67.62', 0, '103', '颜色:土豪金', '', 1, 0, 0, 1, 16, ''),
(874, 773, 0, 104, '小米手机5,十余项黑科技，很轻狠快', 'TP0000104', 1, '2099.00', '6000.00', '0.00', '5880.00', 0, '28_55', '内存:32G 颜色:黑色', '', 0, 0, 0, 0, 0, ''),
(875, 774, 0, 103, '珂兰钻石 18K金90分效果群镶钻石戒指 倾城 需定制', 'TP0000103', 12, '2099.00', '1999.00', '0.00', '1959.02', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(876, 774, 0, 1, 'Apple iPhone 6s Plus 16G 玫瑰金 移动联通电信4G手机', 'TP000000', 5, '6100.00', '6000.00', '0.00', '5880.00', 0, '11_55_102', '网络:4G 颜色:黑色 内存:128G', '', 0, 0, 0, 0, 0, ''),
(877, 775, 0, 104, '小米手机5,十余项黑科技，很轻狠快', 'TP0000104', 2, '2099.00', '6000.00', '0.00', '5880.00', 0, '28_55', '内存:32G 颜色:黑色', '', 1, 0, 0, 1, 17, ''),
(878, 776, 0, 1, 'Apple iPhone 6s Plus 16G 玫瑰金 移动联通电信4G手机', 'TP000000', 1, '6100.00', '6000.00', '0.00', '5880.00', 0, '11_55_102', '网络:4G 颜色:黑色 内存:128G', '', 0, 0, 0, 0, 0, ''),
(879, 776, 0, 104, '小米手机5,十余项黑科技，很轻狠快', 'TP0000104', 1, '2099.00', '6000.00', '0.00', '5880.00', 0, '28_55', '内存:32G 颜色:黑色', '', 0, 0, 0, 0, 0, ''),
(880, 777, 0, 1, 'Apple iPhone 6s Plus 16G 玫瑰金 移动联通电信4G手机', 'TP000000', 1, '6100.00', '6000.00', '0.00', '5880.00', 0, '11_55_102', '网络:4G 颜色:黑色 内存:128G', '', 0, 0, 0, 0, 0, ''),
(881, 777, 0, 104, '小米手机5,十余项黑科技，很轻狠快', 'TP0000104', 1, '2099.00', '6000.00', '0.00', '5880.00', 0, '28_55', '内存:32G 颜色:黑色', '', 0, 0, 0, 0, 0, ''),
(882, 777, 0, 142, '海尔（Haier）BCD-251WDGW 251升 无霜两门冰箱（白色）', 'TP0000142', 1, '2799.00', '2429.10', '0.00', '2429.10', 0, '', '', '', 0, 3, 1, 0, 0, ''),
(883, 778, 0, 1, 'Apple iPhone 6s Plus 16G 玫瑰金 移动联通电信4G手机', 'TP000000', 2, '6100.00', '6000.00', '0.00', '5880.00', 0, '11_55_102', '网络:4G 颜色:黑色 内存:128G', '', 0, 0, 0, 0, 0, ''),
(884, 779, 0, 1, 'Apple iPhone 6s Plus 16G 玫瑰金 移动联通电信4G手机', 'TP000000', 1, '6100.00', '6000.00', '0.00', '5880.00', 0, '11_55_102', '网络:4G 颜色:黑色 内存:128G', '', 0, 0, 0, 0, 0, ''),
(885, 780, 0, 103, '珂兰钻石 18K金90分效果群镶钻石戒指 倾城 需定制', 'TP0000103', 1, '2099.00', '1999.00', '0.00', '1959.02', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(886, 781, 0, 103, '珂兰钻石 18K金90分效果群镶钻石戒指 倾城 需定制', 'TP0000103', 1, '2099.00', '1999.00', '0.00', '1959.02', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(887, 782, 0, 1, 'Apple iPhone 6s Plus 16G 玫瑰金 移动联通电信4G手机', 'TP000000', 1, '6100.00', '6000.00', '0.00', '5880.00', 0, '11_55_102', '网络:4G 颜色:黑色 内存:128G', '', 0, 0, 0, 0, 0, ''),
(888, 783, 0, 81, '纤慕文胸 女无钢圈聚拢一片式无痕拉丝美背内衣', 'TP0000081', 1, '208.00', '108.00', '0.00', '105.84', 0, '92', '尺码:75C', '', 0, 0, 0, 0, 0, ''),
(889, 783, 0, 103, '珂兰钻石 18K金90分效果群镶钻石戒指 倾城 需定制', 'TP0000103', 1, '2099.00', '1999.00', '0.00', '1959.02', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(890, 783, 0, 77, '红衣主角2015冬装新款走秀款大气简约黄色羊毛呢大衣.', 'TP0000077', 2, '499.00', '399.00', '0.00', '391.02', 0, '79', '尺码:L', '', 0, 0, 0, 0, 0, ''),
(2225, 784, 0, 29, '竹妃竹纤维抽纸(20包/箱)', '', 1, '99.00', '99.00', '0.00', '99.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(2226, 785, 0, 29, '竹妃竹纤维抽纸(20包/箱)', '', 1, '99.00', '99.00', '0.00', '99.00', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(2230, 788, 0, 29, '竹妃竹纤维抽纸(20包/箱)', '', 2, '99.00', '99.00', '0.00', '19.80', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(2231, 789, 0, 29, '竹妃竹纤维抽纸(20包/箱)', '', 1, '99.00', '99.00', '0.00', '19.80', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(2232, 790, 0, 29, '竹妃竹纤维抽纸(20包/箱)', '', 1, '99.00', '99.00', '0.00', '19.80', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(2238, 795, 0, 29, '竹妃竹纤维抽纸(20包/箱)', '', 2, '99.00', '99.00', '0.00', '79.20', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(2245, 801, 0, 29, '竹妃竹纤维抽纸(20包/箱)', '', 1, '99.00', '99.00', '0.00', '79.20', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(2244, 800, 0, 29, '竹妃竹纤维抽纸(20包/箱)', '', 1, '99.00', '99.00', '0.00', '79.20', 0, '', '', '', 0, 0, 0, 0, 0, ''),
(2246, 802, 0, 29, '竹妃竹纤维抽纸(20包/箱)', '', 1, '0.01', '0.01', '0.00', '0.01', 0, '', '', '', 0, 0, 0, 0, 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `ruike_mall_seller`
--

CREATE TABLE IF NOT EXISTS `ruike_mall_seller` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seller_name` varchar(128) NOT NULL COMMENT '商户名称',
  `address` varchar(256) NOT NULL COMMENT '商户地址',
  `status` tinyint(4) NOT NULL COMMENT '状态：0关闭，正常营业',
  `type` varchar(32) NOT NULL COMMENT '经营类型：0其它，1餐饮，2奶茶，3百货',
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- 转存表中的数据 `ruike_mall_seller`
--

INSERT INTO `ruike_mall_seller` (`id`, `seller_name`, `address`, `status`, `type`, `create_time`) VALUES
(7, '袁世凯', '大清', 1, '1', '2016-12-07 09:48:53'),
(2, '蒋介石', '浙江', 1, '1', '2016-12-07 09:46:33'),
(3, '毛泽东', '湖南', 0, '1', '2016-12-07 09:46:59'),
(8, '袁世凯', '大清', 1, '1', '2016-12-07 09:48:53'),
(4, '袁世凯', '大清', 1, '1', '2016-12-07 09:48:53'),
(6, '袁世凯', '大清', 1, '1', '2016-12-07 09:48:53'),
(5, '袁世凯', '大清', 1, '1', '2016-12-07 09:48:53'),
(11, '袁世凯', '大清', 1, '1', '2016-12-07 09:48:53'),
(12, '袁世凯', '大清', 0, '1', '2016-12-07 09:48:53'),
(13, '袁世凯', '大清', 1, '1', '2016-12-07 09:48:53'),
(14, '袁世凯', '大清', 1, '1', '2016-12-07 09:48:53'),
(1, '刘云山', '中南海', 1, '1', '2016-12-07 17:01:29');

-- --------------------------------------------------------

--
-- 表的结构 `ruike_member`
--

CREATE TABLE IF NOT EXISTS `ruike_member` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `reviewed` tinyint(4) NOT NULL COMMENT '是否审核 0未审核 1已审核',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `real_name` varchar(16) NOT NULL,
  `password` varchar(64) NOT NULL DEFAULT '' COMMENT '用户密码',
  `nickname` char(16) DEFAULT '' COMMENT '昵称',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱地址',
  `mobile` varchar(20) DEFAULT NULL COMMENT '手机号码',
  `sex` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '性别',
  `birthday` date NOT NULL DEFAULT '0000-00-00' COMMENT '生日',
  `qq` char(10) NOT NULL DEFAULT '' COMMENT 'qq号',
  `score` mediumint(8) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `signature` text COMMENT '用户签名',
  `pos_province` int(11) DEFAULT '0' COMMENT '用户所在省份',
  `pos_city` int(11) DEFAULT '0' COMMENT '用户所在城市',
  `pos_district` int(11) DEFAULT '0' COMMENT '用户所在县城',
  `pos_community` int(11) DEFAULT '0' COMMENT '用户所在区域',
  `salt` varchar(255) NOT NULL DEFAULT '' COMMENT '密码盐值',
  `login` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `reg_ip` varchar(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `last_login_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '会员状态，0禁用 1正常 2暂停用于司机下班不再派送',
  `is_admin` tinyint(1) NOT NULL,
  `user_type` tinyint(4) NOT NULL COMMENT '0普通用户，1司机，2代理商，3商户',
  `businessman` varchar(24) NOT NULL,
  `logo` varchar(256) DEFAULT NULL,
  `qrcode` varchar(256) NOT NULL,
  `money` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '收入',
  `invite_code` varchar(32) DEFAULT NULL,
  `location` varchar(64) NOT NULL COMMENT '当前位置坐标',
  `account_type` varchar(32) NOT NULL COMMENT '提现账号类型',
  `account` varchar(32) NOT NULL COMMENT '账号',
  `id_card` varchar(24) NOT NULL COMMENT '身份证',
  `id_card_pic` int(11) NOT NULL COMMENT '手持身份证图片id',
  `Audited` tinyint(4) NOT NULL COMMENT '是否审核 0未审核 1已审核',
  `puid` varchar(64) DEFAULT NULL,
  `vehicle_type` varchar(512) DEFAULT NULL COMMENT '车型',
  `vechicle_plate_number` varchar(512) DEFAULT NULL COMMENT '车牌号',
  `incubator` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '是否配备保温箱',
  `refuse_num` int(10) unsigned NOT NULL COMMENT '拒绝的订单数量',
  `department` varchar(512) DEFAULT NULL COMMENT '部门',
  `positional` varchar(512) DEFAULT NULL COMMENT '职称',
  `open_id` varchar(128) NOT NULL,
  `group_id` int(11) NOT NULL DEFAULT '0',
  `level` int(11) NOT NULL DEFAULT '0',
  `distributor` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0 普通用户 1分销用户 2渠道分销用户',
  `distributor_time` datetime NOT NULL COMMENT '成为分销商时间',
  `bank_account` varchar(64) NOT NULL COMMENT '银行账号',
  `bank_name` varchar(50) NOT NULL COMMENT '银行名称',
  `bank_address` varchar(130) NOT NULL COMMENT '开户行地址',
  `alipay` varchar(50) NOT NULL COMMENT '支付宝账号',
  PRIMARY KEY (`uid`),
  KEY `status` (`status`),
  KEY `invite_code` (`invite_code`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='会员表' AUTO_INCREMENT=20370 ;

--
-- 转存表中的数据 `ruike_member`
--

INSERT INTO `ruike_member` (`uid`, `reviewed`, `username`, `real_name`, `password`, `nickname`, `email`, `mobile`, `sex`, `birthday`, `qq`, `score`, `signature`, `pos_province`, `pos_city`, `pos_district`, `pos_community`, `salt`, `login`, `reg_ip`, `reg_time`, `last_login_ip`, `last_login_time`, `status`, `is_admin`, `user_type`, `businessman`, `logo`, `qrcode`, `money`, `invite_code`, `location`, `account_type`, `account`, `id_card`, `id_card_pic`, `Audited`, `puid`, `vehicle_type`, `vechicle_plate_number`, `incubator`, `refuse_num`, `department`, `positional`, `open_id`, `group_id`, `level`, `distributor`, `distributor_time`, `bank_account`, `bank_name`, `bank_address`, `alipay`) VALUES
(1, 0, 'admin', '', 'ebdf96eec83634e09d935573abfcc977', 'wayne', 'admin@admin.com', '18126152581', 0, '0000-00-00', '', 0, NULL, 0, 0, 0, 0, 'cqzEYn', 18, '0', 1490778102, '2130706433', 1493973327, 1, 0, 0, '', '', '', '23.76', NULL, '', '', '', '', 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, '', 0, 0, 0, '0000-00-00 00:00:00', '', '', '', ''),
(20366, 0, '18126152582', '', '', '杨', NULL, '18126152582', 0, '0000-00-00', '', 0, NULL, 0, 0, 0, 0, '', 0, '127.0.0.1', 1492498156, '0', 0, 1, 0, 0, '', 'http://wx.qlogo.cn/mmopen/ibhHR6OSef7xssE5NhXqBy6KATrZf9qPbBYnicHuS0E46HoTKsjduk0DFs2qYTqAytNqPe70J9OA2ELI5dTnRylWYBs1pxSUON/0', '', '19.80', '20366kOrH', '', '', '', '', 0, 0, '20365', NULL, NULL, 0, 0, NULL, NULL, 'oKQeFwiaK7DH6hGr6UUKbyNeez6w', 0, 0, 1, '0000-00-00 00:00:00', '', '', '', ''),
(29, 0, '18126152581', '', '', 'wayne', NULL, '18126152581', 1, '0000-00-00', '', -102, NULL, 0, 0, 0, 0, '', 0, '127.0.0.1', 1492496970, '0', 0, 1, 0, 0, '', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIxXM9PedgDz7B26oyG8GoJEZiakERzkSQicqX0RIKeEZjff0ic0ibsSkTMscU5NjMFZibAWx1Itb7H8pg/0', 'uploads/poster/29_nickname.jpg', '208.92', '20362fVrt', '', '', '', '', 0, 0, '1', NULL, NULL, 0, 0, NULL, NULL, 'oKQeFwoLkwHYx5YHMXxyB_MqfFLQ', 0, 0, 1, '0000-00-00 00:00:00', '', '', '', ''),
(20365, 0, '18126152581', '', '', '颜孙植', NULL, '18126152581', 1, '0000-00-00', '', 0, NULL, 0, 0, 0, 0, '', 0, '127.0.0.1', 1492497781, '0', 0, 1, 0, 0, '', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIxXM9PedgDz7B26oyG8GoJEZiakERzkSQicqX0RIKeEZjff0ic0ibsSkTMscU5NjMFZibAWx1Itb7H8pg/0', '', '35.64', '20365mWet', '', '', '', '', 0, 0, '29', NULL, NULL, 0, 0, NULL, NULL, 'oKQeFwn2k_a7VJFH5LpkEx-4B8GE', 0, 0, 1, '0000-00-00 00:00:00', '', '', '', ''),
(20369, 0, '', '', '', '哈根达斯', NULL, NULL, 1, '0000-00-00', '', 0, NULL, 0, 0, 0, 0, '', 0, '127.0.0.1', 1493113850, '0', 0, 1, 0, 0, '', 'http://wx.qlogo.cn/mmopen/WOm5u5FTB64Tvya3Bqt3N6gUO824JmEGibn7xthN55bg3ljibOXw4XYPtBqfuxtfcszvYCCnlbUialhl3Na6iaRs7ibop4Ezb8fBx/0', '', '0.00', '20369cCLB', '', '', '', '', 0, 0, '29', NULL, NULL, 0, 0, NULL, NULL, 'oZCEfuM3t7ZJCNmgg3DwcnsZ_Bas', 0, 0, 1, '2017-04-25 17:50:50', '', '', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `ruike_member_deposit`
--

CREATE TABLE IF NOT EXISTS `ruike_member_deposit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `menoy` float NOT NULL COMMENT '充值金额',
  `type` tinyint(4) NOT NULL COMMENT '充值类型：0现金，1短信充值',
  `status` tinyint(4) NOT NULL COMMENT '状态：0未成功;1成功',
  `create_time` datetime NOT NULL COMMENT '充值时间',
  `deposit_type` tinyint(4) NOT NULL COMMENT '充值方式;0微信，1支付宝',
  `out_trade_no` varchar(32) NOT NULL,
  `transaction_id` varchar(64) NOT NULL,
  `open_id` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='充值表' AUTO_INCREMENT=24 ;

-- --------------------------------------------------------

--
-- 表的结构 `ruike_member_extend`
--

CREATE TABLE IF NOT EXISTS `ruike_member_extend` (
  `uid` int(11) NOT NULL COMMENT '用户UID',
  `education` int(10) DEFAULT '0',
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ruike_member_extend_setting`
--

CREATE TABLE IF NOT EXISTS `ruike_member_extend_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '字段名',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '字段注释',
  `length` varchar(100) NOT NULL DEFAULT '' COMMENT '字段定义',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT '数据类型',
  `value` varchar(100) NOT NULL DEFAULT '' COMMENT '字段默认值',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '备注',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '参数',
  `is_must` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否必填',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='会员字段表' AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- 表的结构 `ruike_member_group`
--

CREATE TABLE IF NOT EXISTS `ruike_member_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `status` tinyint(4) NOT NULL COMMENT '状态：0不可用 1可用',
  `remark` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ruike_member_income`
--

CREATE TABLE IF NOT EXISTS `ruike_member_income` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pay_type` varchar(32) DEFAULT NULL COMMENT '提现支付类型',
  `transaction_id` varchar(64) DEFAULT NULL COMMENT '支付交易id',
  `member_id` int(32) unsigned NOT NULL DEFAULT '0',
  `income_source` varchar(32) NOT NULL COMMENT 'IN_RED_PACKET 红包    IN_COUPON 优惠卷   IN_DRIVER_PROFIT  司机分润 ',
  `money` decimal(10,2) NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0 代表收入    1代表支出',
  `status` tinyint(4) NOT NULL COMMENT '-1 是作废  0是申请中 1是审核通过 ',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `auditor` int(11) NOT NULL,
  `auditor_time` datetime NOT NULL,
  `remark` varchar(1024) NOT NULL,
  `actual_amount` decimal(10,2) DEFAULT '0.00' COMMENT '实际提现金额',
  `tax` decimal(10,2) DEFAULT '0.00' COMMENT '税费',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='会员收益表' AUTO_INCREMENT=20 ;

--
-- 转存表中的数据 `ruike_member_income`
--

INSERT INTO `ruike_member_income` (`id`, `pay_type`, `transaction_id`, `member_id`, `income_source`, `money`, `type`, `status`, `create_time`, `auditor`, `auditor_time`, `remark`, `actual_amount`, `tax`) VALUES
(19, '', '', 29, '121', '100.00', 0, 0, '2017-04-18 13:00:00', 0, '0000-00-00 00:00:00', '', '0.00', '0.00');

-- --------------------------------------------------------

--
-- 表的结构 `ruike_member_level`
--

CREATE TABLE IF NOT EXISTS `ruike_member_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `order_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '完成订单金额升级',
  `order_count` int(11) NOT NULL DEFAULT '0' COMMENT '按完成订单数量升级',
  `discount` smallint(6) NOT NULL DEFAULT '0' COMMENT '扣扣率',
  `status` tinyint(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ruike_menu`
--

CREATE TABLE IF NOT EXISTS `ruike_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `type` varchar(10) NOT NULL DEFAULT 'admin' COMMENT '菜单类别（admin后台，user会员中心）',
  `icon` varchar(20) NOT NULL DEFAULT '' COMMENT '分类图标',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `hide` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  `tip` varchar(255) NOT NULL DEFAULT '' COMMENT '提示',
  `group` varchar(50) DEFAULT '' COMMENT '分组',
  `is_dev` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否仅开发者模式可见',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `status` (`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=126 ;

--
-- 转存表中的数据 `ruike_menu`
--

INSERT INTO `ruike_menu` (`id`, `title`, `type`, `icon`, `pid`, `sort`, `url`, `hide`, `tip`, `group`, `is_dev`, `status`, `update_time`, `create_time`) VALUES
(60, '商品管理', 'user', '', 59, 0, 'user/Mall/goods', 0, '', '购物中心', 0, 0, 1481014242, '0000-00-00 00:00:00'),
(59, '商城管理', 'user', 'icon-shangcheng', 0, 0, '', 0, '', '', 0, 0, 1484532612, '0000-00-00 00:00:00'),
(62, '分类管理', 'user', '', 59, 0, 'user/Mall/category', 0, '', '购物中心', 0, 0, 1481711740, '0000-00-00 00:00:00'),
(77, '评论管理', 'user', '', 59, 0, 'user/Mall/Comment', 0, '管理商品评论的', '购物中心', 0, 0, 1482201081, '0000-00-00 00:00:00'),
(31, '会员管理', 'user', 'icon-yonghu', 0, 2, '', 0, '', '用户管理', 0, 0, 1484533494, '0000-00-00 00:00:00'),
(78, '会员列表', 'user', '', 31, 0, 'user/Member/memberList', 0, '会员管理', '会员管理', 0, 0, 1482226304, '0000-00-00 00:00:00'),
(112, '会员分组', 'user', '', 31, 1, 'user/Member/group', 0, '', '会员管理', 0, 0, 1491461744, '0000-00-00 00:00:00'),
(113, '会员分布', 'user', '', 31, 3, 'user/Member/distribution', 0, '会员分布', '会员分布', 0, 0, 1491472797, '0000-00-00 00:00:00'),
(73, '会员等级', 'user', '', 31, 2, 'user/Member/grade', 0, '', '会员管理', 0, 0, 1482114840, '0000-00-00 00:00:00'),
(71, '订单列表', 'user', '', 114, 0, 'user/Mall/orders', 0, '', '订单管理', 0, 0, 1481443416, '0000-00-00 00:00:00'),
(114, '订单管理', 'user', 'icon-jifen', 0, 3, '', 0, '', '订单管理', 0, 0, 1481443416, '0000-00-00 00:00:00'),
(34, '财务管理', 'user', 'icon-caiwu', 0, 5, '', 0, '', '财务管理', 0, 0, 1484533542, '0000-00-00 00:00:00'),
(58, '提现管理', 'user', '', 34, 0, 'user/withdraw/index', 0, '', '', 0, 0, 0, '0000-00-00 00:00:00'),
(70, '充值管理', 'user', '', 34, 2, 'user/withdraw/deposite', 0, '', '充值管理', 0, 0, 1481437644, '0000-00-00 00:00:00'),
(115, '快递管理', 'user', 'icon-kuaidigongsi', 0, 6, '', 0, '快递管理', '快递管理', 0, 0, 1491989252, '0000-00-00 00:00:00'),
(117, '快递设置', 'user', '', 115, 0, 'User/Express/index', 0, 'User/Express/index', '快递设置', 0, 0, 1492081327, '0000-00-00 00:00:00'),
(118, '快递模板', 'user', '', 115, 0, 'User/Express/template', 0, '快递管理', '快递管理', 0, 0, 1492081754, '0000-00-00 00:00:00'),
(119, '待打印', 'user', '', 115, 0, 'User/Express/toPrint', 0, '快递管理', '快递管理', 0, 0, 1492250408, '0000-00-00 00:00:00'),
(120, '发货人', 'user', '', 115, 0, 'User/Express/consignor', 0, '快递管理', '快递管理', 0, 0, 1492082062, '0000-00-00 00:00:00'),
(122, '分销设置', 'user', '', 123, 0, 'User/Distribution/configure', 0, '分销设置', '分销设置', 0, 0, 1492442762, '0000-00-00 00:00:00'),
(123, '分销管理', 'user', 'icon-icon71', 0, 0, '', 0, '分销管理', '分销管理', 0, 0, 1491989215, '0000-00-00 00:00:00'),
(124, '分销列表', 'user', '', 123, 0, 'user/Distribution/index', 0, '分销管理', '分销管理', 0, 0, 1491993186, '0000-00-00 00:00:00'),
(121, '商城配置', 'user', '', 59, 0, 'user/Mall/configure', 0, '商城配置', '商城配置', 0, 0, 1492439564, '0000-00-00 00:00:00'),
(111, '模板消息', 'user', '', 53, 1, 'user/weixin/template', 0, '', '', 0, 0, 1491359453, '0000-00-00 00:00:00'),
(53, '微信管理', 'user', 'icon-ananzuiconv267', 0, 8, '', 0, '', '', 0, 0, 1484533446, '0000-00-00 00:00:00'),
(56, '微信菜单', 'user', '', 53, 0, 'user/weixin/wxmenu', 0, '', '', 0, 0, 1482282111, '0000-00-00 00:00:00'),
(57, '关注应答', 'user', '', 53, 0, 'user/weixin/reply', 0, '', '', 0, 0, 0, '0000-00-00 00:00:00'),
(86, '内容管理', 'user', 'icon-show', 0, 7, '', 0, '内容管理', '内容管理', 0, 0, 1484535216, '0000-00-00 00:00:00'),
(87, '栏目管理', 'user', '', 86, 0, 'user/Content/index', 0, '内容管理', '内容管理', 0, 0, 1490955406, '0000-00-00 00:00:00'),
(88, '文章管理', 'user', '', 86, 0, 'user/Content/documentList', 0, '内容管理', '内容管理', 0, 0, 1482628799, '0000-00-00 00:00:00'),
(32, '公众号配置', 'user', 'weixin', 53, 0, 'user/weixin/index', 0, '', '微信管理', 0, 0, 1480920529, '0000-00-00 00:00:00'),
(98, '广告管理', 'user', 'icon-guanggaojiazhi', 0, 9, '', 0, '广告管理', '广告管理', 0, 0, 1484533434, '0000-00-00 00:00:00'),
(99, '插件列表', 'user', '', 98, 0, 'user/Advert/index', 0, '广告管理', '广告管理', 0, 0, 1484277798, '0000-00-00 00:00:00'),
(125, '配送方式', 'user', '', 59, 0, 'user/express/mode', 0, '', '', 0, 0, 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- 表的结构 `ruike_message`
--

CREATE TABLE IF NOT EXISTS `ruike_message` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '信息id',
  `title` varchar(1024) NOT NULL COMMENT '信息标题',
  `content` text NOT NULL COMMENT '信息内容',
  `message_type` varchar(128) DEFAULT NULL COMMENT '图片',
  `status` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '0 代表未阅读   1代表已经阅读  2代表软删除',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `member_id` int(10) NOT NULL COMMENT '作者',
  `remark` varchar(1024) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

-- --------------------------------------------------------

--
-- 表的结构 `ruike_model`
--

CREATE TABLE IF NOT EXISTS `ruike_model` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '模型ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '模型标识',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '模型名称',
  `extend` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '继承的模型',
  `icon` varchar(20) NOT NULL COMMENT '模型图标',
  `relation` varchar(30) NOT NULL DEFAULT '' COMMENT '继承与被继承模型的关联字段',
  `is_user_show` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否会员中心显示',
  `need_pk` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '新建表时是否需要主键字段',
  `field_sort` text COMMENT '表单字段排序',
  `field_group` varchar(255) NOT NULL DEFAULT '1:基础' COMMENT '字段分组',
  `field_list` text COMMENT '字段列表',
  `attribute_list` text COMMENT '属性列表（表的字段）',
  `attribute_alias` varchar(255) NOT NULL DEFAULT '' COMMENT '属性别名定义',
  `list_grid` text COMMENT '列表定义',
  `list_row` smallint(2) unsigned NOT NULL DEFAULT '10' COMMENT '列表数据长度',
  `search_key` varchar(50) NOT NULL DEFAULT '' COMMENT '默认搜索字段',
  `search_list` varchar(255) NOT NULL DEFAULT '' COMMENT '高级搜索的字段',
  `template_list` varchar(255) NOT NULL DEFAULT '' COMMENT '列表显示模板',
  `template_add` varchar(255) NOT NULL DEFAULT '' COMMENT '新增模板',
  `template_edit` varchar(255) NOT NULL DEFAULT '' COMMENT '编辑模板',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `engine_type` varchar(25) NOT NULL DEFAULT 'MyISAM' COMMENT '数据库引擎',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='文档模型表' AUTO_INCREMENT=11 ;

-- --------------------------------------------------------

--
-- 表的结构 `ruike_my_address`
--

CREATE TABLE IF NOT EXISTS `ruike_my_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `address` varchar(256) NOT NULL,
  `mobile` varchar(16) NOT NULL,
  `user_name` varchar(32) NOT NULL,
  `is_default` tinyint(4) NOT NULL COMMENT '0为正常 1是默认',
  `is_send` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0是发货取货地址  1是收货地址 ',
  `coordinate` varchar(100) NOT NULL COMMENT '地址坐标',
  `sendercode` varchar(20) DEFAULT NULL COMMENT '邮编',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=48 ;

--
-- 转存表中的数据 `ruike_my_address`
--

INSERT INTO `ruike_my_address` (`id`, `member_id`, `address`, `mobile`, `user_name`, `is_default`, `is_send`, `coordinate`, `sendercode`) VALUES
(41, 1, '云南,丽江市,古城区/延昌路秋园雅苑1栋2单元4081f', '18126152581', '李四', 0, 0, '', NULL),
(46, 29, '新疆,乌鲁木齐市,乌鲁木齐县/121221', '15689877898', '121e1e', 0, 0, '', NULL),
(45, 1, '湖南省,湘西市,吉首市/具体地址1', '18126152781', '张三', 1, 1, '', NULL),
(47, 20366, '四川,内江市,东兴区/奔', '18126152581', '测试', 0, 0, '', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `ruike_page`
--

CREATE TABLE IF NOT EXISTS `ruike_page` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户uid',
  `title` varchar(200) DEFAULT NULL,
  `model_id` int(11) NOT NULL,
  `cover_id` int(11) DEFAULT '0',
  `content` text,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='单页' AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- 表的结构 `ruike_picture`
--

CREATE TABLE IF NOT EXISTS `ruike_picture` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id自增',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '路径',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '图片链接',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=356 ;

--
-- 转存表中的数据 `ruike_picture`
--

INSERT INTO `ruike_picture` (`id`, `path`, `url`, `md5`, `sha1`, `status`, `create_time`) VALUES
(340, '/uploads/picture/20170405/056afd980c91940ace110238e7300adc.gif', '/uploads/picture/20170405/056afd980c91940ace110238e7300adc.gif', '72c5df0ff21bd0f95653bc60fdd9680e', 'fdbc1bbb6542a8f16f48caee95bfba079b148636', 1, 1491401137),
(341, '/uploads/picture/20170405/3e5b674e7598b531ccfed38f6b3b8ac1.gif', '/uploads/picture/20170405/3e5b674e7598b531ccfed38f6b3b8ac1.gif', '72c5df0ff21bd0f95653bc60fdd9680e', 'fdbc1bbb6542a8f16f48caee95bfba079b148636', 1, 1491401202),
(342, '/uploads/picture/20170405/6b1cd9eb1a7ceaacfa7852a48a71f630.png', '/uploads/picture/20170405/6b1cd9eb1a7ceaacfa7852a48a71f630.png', '1f4f227b72b853156c682d59ceece061', '641d75b47e5c353b55bf69146323f79f1da3a0b7', 1, 1491401379),
(343, '/uploads/picture/20170405/001c370050568b5e58d4f12274a1527b.png', '/uploads/picture/20170405/001c370050568b5e58d4f12274a1527b.png', 'c691c431d760be4e4ef8509f93344e0f', 'dc1cb1c4f8bf81fe189db1a28b7aa7d88aa7310d', 1, 1491401414),
(344, '/uploads/picture/20170405/98f864763da07a80718985bc47f9bb1f.png', '/uploads/picture/20170405/98f864763da07a80718985bc47f9bb1f.png', '0e8937249201e8316803ba0acea44854', 'a2e18adca6c65565869de652bc55b4a1f71ceb7d', 1, 1491401507),
(345, '/uploads/picture/20170405/f2fb471667dbb99493da0fab64beff12.png', '/uploads/picture/20170405/f2fb471667dbb99493da0fab64beff12.png', '86d534a8199836ed5d75fcb12fdb1b87', '235afd95f5b926bb07ba4366592ee64e7f366406', 1, 1491401930),
(346, '/uploads/picture/20170405/f7a04789bb90f65d7152b56ce29ae262.png', '/uploads/picture/20170405/f7a04789bb90f65d7152b56ce29ae262.png', '86d534a8199836ed5d75fcb12fdb1b87', '235afd95f5b926bb07ba4366592ee64e7f366406', 1, 1491402307),
(347, '/uploads/picture/20170405/5dff9d30a28d5c4c7fb7d7d5765bc17d.jpg', '/uploads/picture/20170405/5dff9d30a28d5c4c7fb7d7d5765bc17d.jpg', 'fdd2418e8adfc6c84b0ac67bc595e5c4', '95ee9a9b8b725563557642b585b780ce29f51247', 1, 1491403657),
(348, '/uploads/picture/20170405/15291bcaef095ff5eba9a7fd0fb6fbd4.png', '/uploads/picture/20170405/15291bcaef095ff5eba9a7fd0fb6fbd4.png', '1c3a7013cba755f1502f453a828ed272', 'd8335980ea3fd327bf85e5a4835f4f1a24c59691', 1, 1491407081),
(349, '/uploads/picture/20170406/3e80613ed992861584e4e5694c157b1d.jpg', '/uploads/picture/20170406/3e80613ed992861584e4e5694c157b1d.jpg', 'd0818117a0109fb43286e1e761dc802a', '8352bcae2aebc62a9874988397d2a3cd511b7c25', 1, 1491409159),
(350, '/uploads/picture/20170406/dec23f01840c97be979421046eebcce2.jpg', '/uploads/picture/20170406/dec23f01840c97be979421046eebcce2.jpg', '268ef044b7f2e715f00c3abb346dda46', 'e7d71ce2e89096da25b56bce7c48961365848c8c', 1, 1491409337),
(351, '/uploads/picture/20170406/83a11b1b789ffacfe4b505ba1c782741.png', '/uploads/picture/20170406/83a11b1b789ffacfe4b505ba1c782741.png', 'b850e63603f19f8eb1d588ac0d86ec70', '6621aa188824b9e888a410566102d0f092aeb2f3', 1, 1491439465),
(352, '/uploads/picture/20170406/dfd80bf8f5bcafb39ad26e2c831ff7b5.png', '/uploads/picture/20170406/dfd80bf8f5bcafb39ad26e2c831ff7b5.png', 'b850e63603f19f8eb1d588ac0d86ec70', '6621aa188824b9e888a410566102d0f092aeb2f3', 1, 1491439657),
(353, '/uploads/picture/20170420/9963ff729ed6d33f3256befffd37b740.png', '/uploads/picture/20170420/9963ff729ed6d33f3256befffd37b740.png', '0ecccfc5a69f130015949835f5295210', 'f5c0564f591ed6e484499ab5f92b95056c030d87', 1, 1492667983),
(354, '/uploads/picture/20170425/d9e1c380ed6d851fb4a3ed7a5f6366d7.jpg', '/uploads/picture/20170425/d9e1c380ed6d851fb4a3ed7a5f6366d7.jpg', 'f426d7cadba7f9431d5d058dd0686f2c', '0c5d4eebef6147413c64f8bef152c9c80ecdd22f', 1, 1493085388),
(355, '/uploads/picture/20170425/abbe0e5c4bd1193dc6b5b59e731a9703.png', '/uploads/picture/20170425/abbe0e5c4bd1193dc6b5b59e731a9703.png', 'd95a84c1c81da692ff31d9eed2ffc3d9', '3fd7be83f171d55da4efb31163521640bc3db7b6', 1, 1493085446);

-- --------------------------------------------------------

--
-- 表的结构 `ruike_prom_goods`
--

CREATE TABLE IF NOT EXISTS `ruike_prom_goods` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '活动ID',
  `name` varchar(60) NOT NULL COMMENT '促销活动名称',
  `type` int(2) NOT NULL DEFAULT '0' COMMENT '促销类型',
  `expression` varchar(100) NOT NULL COMMENT '优惠体现',
  `description` text COMMENT '活动描述',
  `start_time` int(11) NOT NULL COMMENT '活动开始时间',
  `end_time` int(11) NOT NULL COMMENT '活动结束时间',
  `is_close` tinyint(1) DEFAULT '0',
  `group` varchar(255) DEFAULT NULL COMMENT '适用范围',
  `prom_img` varchar(150) DEFAULT NULL COMMENT '活动宣传图片',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- 表的结构 `ruike_prom_order`
--

CREATE TABLE IF NOT EXISTS `ruike_prom_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL COMMENT '活动名称',
  `type` int(2) NOT NULL DEFAULT '0' COMMENT '活动类型',
  `money` float(10,2) DEFAULT '0.00' COMMENT '最小金额',
  `expression` varchar(100) DEFAULT NULL COMMENT '优惠体现',
  `description` text COMMENT '活动描述',
  `start_time` int(11) DEFAULT NULL COMMENT '活动开始时间',
  `end_time` int(11) DEFAULT NULL COMMENT '活动结束时间',
  `is_close` tinyint(1) DEFAULT '0',
  `group` varchar(255) DEFAULT NULL COMMENT '适用范围',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- 表的结构 `ruike_qr`
--

CREATE TABLE IF NOT EXISTS `ruike_qr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(256) NOT NULL COMMENT '二维码名称',
  `desc` varchar(1024) NOT NULL COMMENT '描述',
  `cover` varchar(256) NOT NULL COMMENT '封面',
  `mulit_subscribe` tinyint(4) NOT NULL COMMENT '多号关注切换',
  `price` int(11) NOT NULL COMMENT '关注单价',
  `qr_exp` datetime NOT NULL COMMENT '有效时间',
  `create_time` datetime NOT NULL,
  `jump_url` varchar(256) NOT NULL,
  `area_limit` tinyint(4) NOT NULL COMMENT '区域限制：0不限制 1限制',
  `area` varchar(256) NOT NULL COMMENT '区域',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- 表的结构 `ruike_qr_record`
--

CREATE TABLE IF NOT EXISTS `ruike_qr_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `qr_id` int(11) NOT NULL COMMENT '二维码id',
  `union_id` varchar(64) NOT NULL COMMENT '微信关联id',
  `open_id` varchar(64) NOT NULL COMMENT '微信id',
  `token` varchar(64) NOT NULL COMMENT 'token',
  `status` tinyint(4) NOT NULL COMMENT '状态：0未生效  1已经生效',
  `create_time` datetime NOT NULL,
  `is_focus` tinyint(3) unsigned NOT NULL COMMENT '0 是未关注  1是已经关注',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

-- --------------------------------------------------------

--
-- 表的结构 `ruike_refuse_order`
--

CREATE TABLE IF NOT EXISTS `ruike_refuse_order` (
  `id` int(32) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `order_id` varchar(64) NOT NULL COMMENT '陪拒绝的订单id',
  `create_time` datetime NOT NULL COMMENT '创建时间，就是拒绝时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

-- --------------------------------------------------------

--
-- 表的结构 `ruike_rewrite`
--

CREATE TABLE IF NOT EXISTS `ruike_rewrite` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id自增',
  `rule` varchar(255) NOT NULL DEFAULT '' COMMENT '规则',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT 'url',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='伪静态表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ruike_seo_rule`
--

CREATE TABLE IF NOT EXISTS `ruike_seo_rule` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
  `title` text NOT NULL COMMENT '规则标题',
  `app` varchar(40) DEFAULT NULL,
  `controller` varchar(40) DEFAULT NULL,
  `action` varchar(40) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态',
  `seo_title` text NOT NULL COMMENT 'SEO标题',
  `seo_keywords` text NOT NULL COMMENT 'SEO关键词',
  `seo_description` text NOT NULL COMMENT 'SEO描述',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- 表的结构 `ruike_shakearound_page`
--

CREATE TABLE IF NOT EXISTS `ruike_shakearound_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` varchar(32) NOT NULL,
  `title` varchar(32) NOT NULL,
  `description` varchar(32) NOT NULL,
  `icon` varchar(512) NOT NULL,
  `page_url` varchar(512) NOT NULL,
  `page_type` varchar(16) NOT NULL COMMENT '页面类型：红包，优惠卷等等',
  `page_type_id` int(11) NOT NULL,
  `create_time` date NOT NULL,
  `lastupdatetime` date NOT NULL,
  `remark` text,
  `status` tinyint(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=36 ;

-- --------------------------------------------------------

--
-- 表的结构 `ruike_sms`
--

CREATE TABLE IF NOT EXISTS `ruike_sms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mobile` varchar(16) NOT NULL COMMENT '手机号码',
  `code` varchar(8) NOT NULL COMMENT 'php生成短信码',
  `status` tinyint(4) NOT NULL COMMENT '验证码状态，0已发出，1已使用',
  `create_time` datetime NOT NULL COMMENT '创建时间用于限制一天用户发送次数',
  `client_ip` varchar(128) DEFAULT NULL COMMENT '客户端ip',
  `open_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `open_id` (`open_id`),
  KEY `mobile` (`mobile`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=47 ;

--
-- 转存表中的数据 `ruike_sms`
--

INSERT INTO `ruike_sms` (`id`, `mobile`, `code`, `status`, `create_time`, `client_ip`, `open_id`) VALUES
(44, '18126152581', '4850', 1, '2017-04-15 10:37:57', '127.0.0.1', 'oKQeFwoLkwHYx5YHMXxyB_MqfFLQ'),
(45, '18126152582', '8491', 1, '2017-04-18 14:33:50', '127.0.0.1', 'oKQeFwoLkwHYx5YHMXxyB_MqfFLQ'),
(46, '18126152585', '1729', 1, '2017-04-20 00:52:39', '127.0.0.1', 'oKQeFwoLkwHYx5YHMXxyB_MqfFLQ');

-- --------------------------------------------------------

--
-- 表的结构 `ruike_spec`
--

CREATE TABLE IF NOT EXISTS `ruike_spec` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '规格表',
  `type_id` int(11) DEFAULT '0' COMMENT '规格类型',
  `name` varchar(55) DEFAULT NULL COMMENT '规格名称',
  `order` int(11) DEFAULT '50' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=30 ;

-- --------------------------------------------------------

--
-- 表的结构 `ruike_spec_goods_price`
--

CREATE TABLE IF NOT EXISTS `ruike_spec_goods_price` (
  `goods_id` int(11) DEFAULT '0' COMMENT '商品id',
  `key` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '规格键名',
  `key_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '规格键名中文',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `store_count` int(11) unsigned DEFAULT '10' COMMENT '库存数量',
  `bar_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '商品条形码',
  `sku` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT 'SKU'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ruike_spec_item`
--

CREATE TABLE IF NOT EXISTS `ruike_spec_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '规格项id',
  `spec_id` int(11) DEFAULT NULL COMMENT '规格id',
  `item` varchar(54) DEFAULT NULL COMMENT '规格项',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=132 ;

-- --------------------------------------------------------

--
-- 表的结构 `ruike_spec_type`
--

CREATE TABLE IF NOT EXISTS `ruike_spec_type` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id自增',
  `name` varchar(60) NOT NULL DEFAULT '' COMMENT '类型名称',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=43 ;

-- --------------------------------------------------------

--
-- 表的结构 `ruike_vote`
--

CREATE TABLE IF NOT EXISTS `ruike_vote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(256) NOT NULL COMMENT '标题',
  `keyword` varchar(256) NOT NULL COMMENT '关键字',
  `desc` varchar(1024) NOT NULL COMMENT '投票描述',
  `cover` int(11) NOT NULL COMMENT '封面',
  `music` varchar(256) NOT NULL,
  `vote_type` tinyint(4) NOT NULL COMMENT '投票类型：0图片 1视频 2作文',
  `status` int(11) NOT NULL COMMENT '投票状态：0禁用 1启用',
  `vote_starttime` datetime NOT NULL COMMENT '投票开始时间',
  `vote_endtime` datetime NOT NULL COMMENT '投票结束时间',
  `register_starttime` datetime NOT NULL COMMENT '报名开始时间',
  `register_endtime` datetime NOT NULL COMMENT '报名结束时间',
  `detail` text NOT NULL COMMENT '投票详情',
  `vote_user_limit` int(11) NOT NULL COMMENT '同一用户限制投票数',
  `vote_ip_limit` int(11) NOT NULL COMMENT '同一ip限制投票数',
  `browse_num` int(11) NOT NULL COMMENT '虚拟浏览人数',
  `vote_num` int(11) NOT NULL COMMENT '虚拟投票人数',
  `register_num` int(11) NOT NULL COMMENT '虚拟报名人数',
  `notice` varchar(512) NOT NULL COMMENT '首页公告',
  `vote_notice` tinyint(4) NOT NULL DEFAULT '1' COMMENT '投票通知：0不通知 1通知',
  `vote_autditing` tinyint(4) NOT NULL DEFAULT '0' COMMENT '报名审核：0不审核 1审核',
  `advert_id` int(11) unsigned DEFAULT NULL COMMENT '广告id',
  `page_view` int(255) unsigned NOT NULL COMMENT '真实的浏览量',
  `share` tinyint(4) NOT NULL COMMENT '分享开关：0关闭 1开启',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=33 ;

-- --------------------------------------------------------

--
-- 表的结构 `ruike_vote_config`
--

CREATE TABLE IF NOT EXISTS `ruike_vote_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jump_url` varchar(256) NOT NULL,
  `multi_vote` tinyint(4) NOT NULL COMMENT '多号切换投票：0关闭 1开启',
  `subscribe_vote` tinyint(4) NOT NULL COMMENT '关注自动投票成功：0关闭 1开启',
  `vote_mode` tinyint(4) NOT NULL COMMENT '投票模式：0按天 1按活动时间',
  `unsubscribe_vote` tinyint(4) NOT NULL COMMENT '取消关注扣票开关：0关闭 1开启',
  `area_vote_limit` tinyint(4) NOT NULL COMMENT '投票区域限制开关：0关闭 1开启',
  `area` varchar(256) NOT NULL COMMENT '投票限制区域，多个逗号分隔',
  `vote_limit_rule` tinyint(4) NOT NULL COMMENT '投票告警锁定开关：0关闭 1开启',
  `vote_alert_rule` int(11) NOT NULL COMMENT '投票数量告警',
  `vote_alert_notice` varchar(256) NOT NULL COMMENT '投票警告通知：空不通知，非空通知',
  `vote_lock_rule` int(11) NOT NULL COMMENT '投票数量锁定',
  `vote_lock_notice` varchar(256) NOT NULL COMMENT '投票锁定通知：空不通知，非空通知',
  `vote_score_switch` tinyint(4) NOT NULL COMMENT '投票奖励：0关闭 1开启',
  `vote_score` int(11) NOT NULL COMMENT '投票奖励积分数',
  `vote_gift` tinyint(4) NOT NULL COMMENT '送礼物：0关闭 1开启',
  `wx_id` int(11) unsigned NOT NULL COMMENT '公众号id',
  `poster_bg` int(11) NOT NULL COMMENT '海报背景',
  `poster_desc` varchar(256) NOT NULL COMMENT '引导描述',
  `competitor` varchar(1024) DEFAULT NULL COMMENT '竞争对手的微信昵称，多个逗号分隔',
  `must_focus` tinyint(2) unsigned zerofill NOT NULL COMMENT '报名功能这里是否需要强制关注，默认不关注也可以报名。',
  `vote_focus` tinyint(2) unsigned zerofill NOT NULL COMMENT '是否强制投票前先关注',
  `guide_title` varchar(256) DEFAULT NULL COMMENT '二维码标题',
  `guide_desc` varchar(1024) DEFAULT NULL COMMENT '二维码描述',
  `detail_btn` varchar(100) NOT NULL COMMENT '控制detail 页面的按钮是否显示',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- 表的结构 `ruike_vote_item`
--

CREATE TABLE IF NOT EXISTS `ruike_vote_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vote_id` int(11) NOT NULL COMMENT '投票id',
  `nickname` varchar(32) NOT NULL COMMENT '报名者昵称',
  `realname` varchar(32) NOT NULL COMMENT '报名者姓名',
  `mobile` varchar(32) NOT NULL COMMENT '手机号',
  `type` int(11) NOT NULL COMMENT '投票类型：0 图片 1视频 2 作文',
  `url` varchar(100) NOT NULL COMMENT '投票资源地址',
  `intro` varchar(512) NOT NULL COMMENT '报名者介绍',
  `vote_num` int(11) NOT NULL COMMENT '投票数',
  `vote_dnum` int(11) NOT NULL COMMENT '投票扣除数',
  `open_id` varchar(128) NOT NULL COMMENT '微信id',
  `union_id` varchar(128) NOT NULL COMMENT '微信unionid',
  `head_pic` varchar(225) NOT NULL COMMENT '从微信获取到的头像',
  `sort` int(11) NOT NULL COMMENT '排序',
  `status` int(11) NOT NULL COMMENT '状态：0锁定 1正常',
  `createtime` datetime NOT NULL COMMENT '报名时间',
  `flag` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否内定获奖人员',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- 表的结构 `ruike_vote_menu`
--

CREATE TABLE IF NOT EXISTS `ruike_vote_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL COMMENT '菜单名称',
  `url` varchar(256) NOT NULL COMMENT '打开url',
  `icon` varchar(63) NOT NULL COMMENT '图标',
  `sort` int(11) NOT NULL COMMENT '排序',
  `status` tinyint(4) NOT NULL COMMENT '状态：0不可用 1可用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `ruike_vote_menu`
--

INSERT INTO `ruike_vote_menu` (`id`, `name`, `url`, `icon`, `sort`, `status`) VALUES
(8, '奖品', 'http://tp.xiaohuaguo.com/wap/vote/content/contentId/47', 'fa fa-gift', 4, 1),
(7, '报名', 'http://tp.xiaohuaguo.com/wap/vote/signup/', 'fa  fa-edit ', 3, 1),
(6, '榜单', 'http://tp.xiaohuaguo.com/wap/vote/rank/', 'fa fa-bar-chart', 2, 1),
(5, '首页', 'http://tp.xiaohuaguo.com/wap/vote/index/', 'fa fa-home', 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `ruike_vote_record`
--

CREATE TABLE IF NOT EXISTS `ruike_vote_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vote_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `open_id` varchar(64) NOT NULL,
  `union_id` varchar(64) NOT NULL,
  `client_ip` varchar(64) NOT NULL,
  `token` varchar(64) NOT NULL,
  `create_time` datetime NOT NULL,
  `vote_num` int(11) unsigned NOT NULL COMMENT '票数',
  `status` tinyint(4) NOT NULL COMMENT '状态 0是准备投票  1是投票成功',
  `power_open_id` varchar(64) NOT NULL COMMENT '原 微信id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- 表的结构 `ruike_wx_keyword`
--

CREATE TABLE IF NOT EXISTS `ruike_wx_keyword` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(256) NOT NULL COMMENT '关键词',
  `type` varchar(64) NOT NULL COMMENT '模块类型',
  `module_id` int(11) NOT NULL COMMENT '模块id',
  PRIMARY KEY (`id`),
  KEY `key` (`key`,`type`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=32 ;

--
-- 转存表中的数据 `ruike_wx_keyword`
--

INSERT INTO `ruike_wx_keyword` (`id`, `key`, `type`, `module_id`) VALUES
(31, '', 'content', 47);

-- --------------------------------------------------------

--
-- 表的结构 `ruike_wx_menu`
--

CREATE TABLE IF NOT EXISTS `ruike_wx_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `level` tinyint(1) DEFAULT '1' COMMENT '菜单级别',
  `name` varchar(50) NOT NULL COMMENT 'name',
  `sort` int(5) DEFAULT '0' COMMENT '排序',
  `type` varchar(20) DEFAULT '' COMMENT '0 view 1 click',
  `value` varchar(255) DEFAULT NULL COMMENT 'value',
  `token` varchar(50) NOT NULL COMMENT 'token',
  `pid` int(11) DEFAULT '0' COMMENT '上级菜单',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=74 ;

-- --------------------------------------------------------

--
-- 表的结构 `ruike_wx_reply`
--

CREATE TABLE IF NOT EXISTS `ruike_wx_reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `type` tinyint(4) NOT NULL COMMENT '回复类型：0关注回复 1回答不上来',
  `content_type` tinyint(4) NOT NULL COMMENT '内容类型：0文本 1图文',
  `token` varchar(64) NOT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- 表的结构 `ruike_wx_template`
--

CREATE TABLE IF NOT EXISTS `ruike_wx_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(16) NOT NULL,
  `template_id` varchar(64) NOT NULL COMMENT '模板id',
  `template_code` varchar(64) NOT NULL,
  `title` varchar(512) NOT NULL COMMENT '标题',
  `content` varchar(2048) NOT NULL COMMENT '模板内容',
  `status` tinyint(4) NOT NULL COMMENT '状态：0不可用 1可用',
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `ruike_wx_template`
--

INSERT INTO `ruike_wx_template` (`id`, `name`, `template_id`, `template_code`, `title`, `content`, `status`, `create_time`) VALUES
(1, 'pay', 'hElJ8nhIAYFaa8M5GtIY2MEq7ax1zLjyutjJa8Fd9sk', 'OPENTM207185188', '订单付款成功通知', '{{first.DATA}}订单号：{{keyword1.DATA}}支付时间：{{keyword2.DATA}}支付金额：{{keyword3.DATA}}支付方式：{{keyword4.DATA}}{{remark.DATA}}', 1, 0),
(2, 'member', '8dmeV1R6w0mrmvGp4Cb23unLKS3oIpbO1SovvMmsEE4', 'OPENTM202967310', '新会员加入通知', '{{first.DATA}}会员编号：{{keyword1.DATA}}加入时间：{{keyword2.DATA}}{{remark.DATA}}', 1, 0),
(4, 'express', 'kIQ-ySujAASknV309_LsdC6hyM-VyZTrUkN3GNvYyx8', 'TM00303', '商品已发出通知', '{{first.DATA}} 快递公司：{{delivername.DATA}}快递单号：{{ordername.DATA}}{{remark.DATA}}', 1, 0),
(5, 'refund', 'EUY6aYXm1QyT-zz0ySkRO-6aOpYdrw8Brh9mrNrlNdY', 'TM00430', '退知款通', '{{first.DATA}}退款原因：{{reason.DATA}}退款金额：{{refund.DATA}}{{remark.DATA}}', 1, 0),
(8, 'cancelorder', 'tlhtrTFyOUsbJlb8wpjPc0kPouHr6uckpmfmtUn-_3c', 'OPENTM406411654', '订单取消通知', '{{first.DATA}}订单编号：{{keyword1.DATA}}订单内容：{{keyword2.DATA}}{{remark.DATA}}', 1, 1493258275),
(7, 'confirm', 'S3ENajSpHKgqIUatLdX59M2eul5YkcmblY__QHXyLI0', 'OPENTM202314085', '订单确认收货通知', '{{first.DATA}}订单号：{{keyword1.DATA}}商品名称：{{keyword2.DATA}}下单时间：{{keyword3.DATA}}发货时间：{{keyword4.DATA}}确认收货时间：{{keyword5.DATA}}{{remark.DATA}}', 1, 1492761875),
(9, 'withdraw', 'H5nApPcf2ew-Nbo-P_eYkUJdFIRvwCQVi3ru7-oyLsc', 'OPENTM202425107', '提现审核结果通知', '{{first.DATA}} 提现金额：{{keyword1.DATA}} 提现方式：{{keyword2.DATA}} 申请时间：{{keyword3.DATA}} 审核结果：{{keyword4.DATA}} 审核时间：{{keyword5.DATA}} {{remark.DATA}}', 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ruike_wx_template_record`
--

CREATE TABLE IF NOT EXISTS `ruike_wx_template_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tp_id` int(11) NOT NULL COMMENT '模板表中的id字段',
  `wx_id` int(11) NOT NULL COMMENT 'wx_user表中的id',
  `group_id` int(11) DEFAULT '0' COMMENT '粉丝组id，默认0 表示自定义，其它根据分组发送',
  `fans_id` int(11) DEFAULT '0' COMMENT '粉丝id',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态：0，未发送，1发送中 2，发送完成 -1 发送失败',
  `url` varchar(255) DEFAULT NULL COMMENT '消息链接',
  `color` varchar(32) DEFAULT '#173177' COMMENT '模板内容字段颜色',
  `timer` datetime NOT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ruike_wx_user`
--

CREATE TABLE IF NOT EXISTS `ruike_wx_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表id',
  `uid` int(11) NOT NULL COMMENT 'uid',
  `wxname` varchar(60) NOT NULL COMMENT '公众号名称',
  `encodingaeskey` varchar(256) NOT NULL DEFAULT '' COMMENT 'aeskey',
  `encode` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'encode',
  `appid` varchar(50) NOT NULL DEFAULT '' COMMENT 'appid',
  `appsecret` varchar(50) NOT NULL DEFAULT '' COMMENT 'appsecret',
  `qr` varchar(256) NOT NULL,
  `wxid` varchar(64) NOT NULL COMMENT '公众号原始ID',
  `weixin` char(64) NOT NULL COMMENT '微信号',
  `headerpic` char(255) NOT NULL COMMENT '头像地址',
  `token` char(255) NOT NULL COMMENT 'token',
  `create_time` int(11) NOT NULL COMMENT 'create_time',
  `updatetime` int(11) NOT NULL COMMENT 'updatetime',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '类型',
  `status` tinyint(4) unsigned NOT NULL COMMENT '0 是停用  1是启用',
  `is_default` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '是否是默认公从 0否，1是',
  `mch_id` varchar(100) NOT NULL COMMENT '商户身份标识',
  `partnerkey` varchar(100) NOT NULL COMMENT '商户权限密钥',
  `ssl_cer` varchar(500) NOT NULL COMMENT '商户证书CER',
  `ssl_key` varchar(500) NOT NULL COMMENT '商户证书KEY',
  `url` varchar(255) DEFAULT NULL COMMENT '关注引导地址',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`) USING BTREE,
  KEY `uid_2` (`uid`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='微信公共帐号' AUTO_INCREMENT=35 ;

--
-- 转存表中的数据 `ruike_wx_user`
--

INSERT INTO `ruike_wx_user` (`id`, `uid`, `wxname`, `encodingaeskey`, `encode`, `appid`, `appsecret`, `qr`, `wxid`, `weixin`, `headerpic`, `token`, `create_time`, `updatetime`, `type`, `status`, `is_default`, `mch_id`, `partnerkey`, `ssl_cer`, `ssl_key`, `url`) VALUES
(34, 0, '美易柔', '', 0, 'wx536e7ee8513cc0f5', 'd662a1c40fd3f01dc7248c9826342e42', '354', '', '', '355', 'irpfjy1484563046', 1493085449, 0, 4, 1, 1, '1464291002', 'ew934hqEajf23j923fWF8932dasf2ir2', '', '', '');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
