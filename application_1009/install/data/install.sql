-- phpMyAdmin SQL Dump
-- version phpStudy 2014
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2017 年 04 月 01 日 10:40
-- 服务器版本: 5.5.53-0ubuntu0.14.04.1
-- PHP 版本: 5.5.9-1ubuntu4.20

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `vote`
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='行为日志表' AUTO_INCREMENT=149 ;

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='广告表' AUTO_INCREMENT=15 ;

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='广告位表' AUTO_INCREMENT=37 ;

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='分类表' AUTO_INCREMENT=17 ;

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=42 ;

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='文档模型基础表' AUTO_INCREMENT=49 ;

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='文章' AUTO_INCREMENT=49 ;

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
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=9 ;

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
  `sex` tinyint(4) DEFAULT NULL,
  `city` varchar(32) DEFAULT NULL,
  `province` varchar(32) DEFAULT NULL,
  `country` varchar(32) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1',
  `statuss` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `open_id` (`open_id`),
  KEY `union_id` (`union_id`,`token`),
  KEY `open_id_2` (`open_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=98580 ;

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='文件表' AUTO_INCREMENT=13 ;

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=27 ;

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=22 ;

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
-- 表的结构 `ruike_member`
--

CREATE TABLE IF NOT EXISTS `ruike_member` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `reviewed` tinyint(4) NOT NULL COMMENT '是否审核 0未审核 1已审核',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(64) NOT NULL DEFAULT '' COMMENT '用户密码',
  `nickname` char(16) NOT NULL DEFAULT '' COMMENT '昵称',
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
  `logo` varchar(256) NOT NULL,
  `qrcode` varchar(256) NOT NULL,
  `money` double(255,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '收入',
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
  PRIMARY KEY (`uid`),
  KEY `status` (`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='会员表' AUTO_INCREMENT=26 ;

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=54 ;

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
-- 表的结构 `ruike_member_extend_group`
--

CREATE TABLE IF NOT EXISTS `ruike_member_extend_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `name` varchar(50) NOT NULL COMMENT '分组数据表',
  `profile_name` varchar(25) NOT NULL COMMENT '扩展分组名称',
  `createTime` int(11) NOT NULL COMMENT '创建时间',
  `sort` int(11) NOT NULL COMMENT '排序',
  `visiable` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否可见，1可见，0不可见',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '字段状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

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
-- 表的结构 `ruike_member_income`
--

CREATE TABLE IF NOT EXISTS `ruike_member_income` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(32) unsigned NOT NULL DEFAULT '0',
  `income_source` varchar(32) NOT NULL COMMENT 'IN_RED_PACKET 红包    IN_COUPON 优惠卷   IN_DRIVER_PROFIT  司机分润 ',
  `money` float NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0 代表收入    1代表支出',
  `status` tinyint(4) NOT NULL COMMENT '-1 是作废  0是申请中 1是审核通过 ',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `auditor` int(11) NOT NULL,
  `auditor_time` datetime NOT NULL,
  `remark` varchar(1024) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='会员收益表' AUTO_INCREMENT=19 ;

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=102 ;

--
-- 转存表中的数据 `ruike_menu`
--

INSERT INTO `ruike_menu` (`id`, `title`, `type`, `icon`, `pid`, `sort`, `url`, `hide`, `tip`, `group`, `is_dev`, `status`, `update_time`, `create_time`) VALUES
(1, '首页', 'admin', 'home', 0, 0, 'admin/index/index', 0, '', '', 0, 0, 0, '0000-00-00 00:00:00'),
(2, '系统', 'admin', 'laptop', 0, 11, 'admin/config/group', 0, '', '', 0, 0, 0, '0000-00-00 00:00:00'),
(3, '内容', 'admin', 'list', 0, 2, 'admin/category/index', 0, '', '', 0, 0, 0, '0000-00-00 00:00:00'),
(4, '会员', 'admin', 'user', 0, 33, 'admin/user/index', 0, '', '', 0, 0, 0, '0000-00-00 00:00:00'),
(5, '运营', 'admin', 'th', 0, 44, 'admin/link/index', 0, '', '', 0, 0, 0, '0000-00-00 00:00:00'),
(6, '扩展', 'admin', 'tags', 0, 55, 'admin/addons/index', 0, '', '', 0, 0, 0, '0000-00-00 00:00:00'),
(21, '友链管理', 'admin', 'link', 5, 0, 'admin/link/index', 0, '', '运营管理', 0, 0, 0, '0000-00-00 00:00:00'),
(7, '更新缓存', 'admin', 'refresh', 1, 0, 'admin/index/clear', 0, '', '后台首页', 0, 0, 0, '0000-00-00 00:00:00'),
(8, '配置管理', 'admin', 'cog', 2, 0, 'admin/config/group', 0, '', '系统配置', 0, 0, 0, '0000-00-00 00:00:00'),
(9, '菜单管理', 'admin', 'book', 2, 0, 'admin/menu/index', 0, '', '系统配置', 0, 0, 0, '0000-00-00 00:00:00'),
(10, '导航管理', 'admin', 'map-marker', 2, 0, 'admin/channel/index', 0, '', '系统配置', 0, 0, 0, '0000-00-00 00:00:00'),
(11, '数据备份', 'admin', 'exchange', 2, 0, 'admin/database/index?type=export', 0, '', '数据库管理', 0, 0, 0, '0000-00-00 00:00:00'),
(12, '数据恢复', 'admin', 'table', 2, 0, 'admin/database/index?type=import', 0, '', '数据库管理', 0, 0, 0, '0000-00-00 00:00:00'),
(13, 'SEO设置', 'admin', 'anchor', 2, 0, 'admin/seo/index', 0, '', '优化设置', 0, 0, 0, '0000-00-00 00:00:00'),
(14, '栏目管理', 'admin', 'list-ol', 3, 0, 'admin/category/index', 0, '', '内容配置', 0, 0, 0, '0000-00-00 00:00:00'),
(15, '模型管理', 'admin', 'th-list', 3, 0, 'admin/model/index', 0, '', '内容配置', 0, 0, 0, '0000-00-00 00:00:00'),
(16, '用户列表', 'admin', 'user', 4, 0, 'admin/user/index', 0, '', '用户管理', 0, 0, 0, '0000-00-00 00:00:00'),
(17, '用户组表', 'admin', 'users', 4, 0, 'admin/group/index', 0, '', '用户管理', 0, 0, 0, '0000-00-00 00:00:00'),
(18, '权限列表', 'admin', 'paw', 4, 0, 'admin/group/access', 0, '', '用户管理', 0, 0, 0, '0000-00-00 00:00:00'),
(19, '行为列表', 'admin', 'file-text', 4, 0, 'admin/action/index', 0, '', '行为管理', 0, 0, 0, '0000-00-00 00:00:00'),
(20, '行为日志', 'admin', 'clipboard', 4, 0, 'admin/action/log', 0, '', '行为管理', 0, 0, 0, '0000-00-00 00:00:00'),
(22, '广告管理', 'admin', 'cc', 5, 0, 'admin/ad/index', 0, '', '运营管理', 0, 0, 0, '0000-00-00 00:00:00'),
(23, '插件列表', 'admin', 'usb', 6, 0, 'admin/addons/index', 0, '', '插件管理', 0, 0, 0, '0000-00-00 00:00:00'),
(24, '钩子列表', 'admin', 'code', 6, 0, 'admin/addons/hooks', 0, '', '插件管理', 0, 0, 0, '0000-00-00 00:00:00'),
(25, '自定义表单', 'admin', '', 5, 0, 'admin/form/index', 0, '', '运营管理', 0, 0, 0, '0000-00-00 00:00:00'),
(26, '伪静态规则', 'admin', '', 2, 0, 'admin/seo/rewrite', 0, '', '优化设置', 0, 0, 0, '0000-00-00 00:00:00'),
(29, '设备管理', 'user', '', 50, 0, 'user/shakearound/device', 0, '', '摇一摇周边', 0, 0, 0, '0000-00-00 00:00:00'),
(30, '页面管理', 'user', '', 50, 0, 'user/shakearound/page', 0, '', '摇一摇周边', 0, 0, 0, '0000-00-00 00:00:00'),
(31, '用户管理', 'user', 'icon-yonghu', 0, 6, 'user/member/index', 1, '', '用户管理', 0, 0, 1484533494, '0000-00-00 00:00:00'),
(32, '公众号配置', 'user', 'weixin', 53, 0, 'user/weixin/index', 0, '', '微信管理', 0, 0, 1480920529, '0000-00-00 00:00:00'),
(33, '自动应答', 'user', '', 53, 3, 'user/weixin/reply', 0, '', '微信管理', 0, 0, 0, '0000-00-00 00:00:00'),
(34, '财务管理', 'user', 'icon-caiwu', 0, 5, '', 1, '', '财务管理', 0, 0, 1484533542, '0000-00-00 00:00:00'),
(49, '快递追踪', 'user', '', 51, 3, 'user/Run/tracking', 0, '', '同城快递', 0, 0, 0, '0000-00-00 00:00:00'),
(48, '任务管理', 'user', '', 51, 0, 'user/run/index', 0, '', '同城快递', 0, 0, 0, '0000-00-00 00:00:00'),
(47, '司机管理', 'user', '', 51, 0, 'user/Run/driver', 0, '', '同城快递', 0, 0, 0, '0000-00-00 00:00:00'),
(45, ' 快递配置', 'user', '', 51, 2, 'user/Run/express', 0, '', '同城快递', 0, 0, 0, '0000-00-00 00:00:00'),
(46, '会员管理', 'user', '', 51, 0, 'user/Run/insider', 0, '', '同城快递', 0, 0, 0, '0000-00-00 00:00:00'),
(41, '卡券管理', 'user', '', 52, 0, 'user/card/index', 0, '', '活动管理', 0, 0, 0, '0000-00-00 00:00:00'),
(42, '红包管理', 'user', '', 52, 0, 'user/redbag/index', 0, '', '活动管理', 0, 0, 0, '0000-00-00 00:00:00'),
(50, '摇一摇周边', 'user', 'icon-1', 0, 1, '', 1, '', '', 0, 0, 1484533523, '0000-00-00 00:00:00'),
(51, '同城快递', 'user', 'icon-kuaidigongsi', 0, 0, '', 1, '', '', 0, 0, 1484533325, '0000-00-00 00:00:00'),
(52, '应用管理', 'user', 'icon-icon71', 0, 2, '', 1, '', '', 0, 0, 1484533420, '0000-00-00 00:00:00'),
(53, '微信管理', 'user', 'icon-ananzuiconv267', 0, 4, '', 0, '', '', 0, 0, 1484533446, '0000-00-00 00:00:00'),
(54, '大转盘', 'user', '', 52, 0, 'user/lucky/index', 0, '', '用户管理', 0, 0, 0, '0000-00-00 00:00:00'),
(56, '微信菜单', 'user', '', 53, 0, 'user/weixin/wxmenu', 0, '', '', 0, 0, 1482282111, '0000-00-00 00:00:00'),
(57, '关键词应答', 'user', '', 53, 0, 'uesr/keyword/index', 1, '', '', 0, 0, 0, '0000-00-00 00:00:00'),
(58, '提现管理', 'user', '', 34, 0, 'user/withdraw/index', 0, '', '', 0, 0, 0, '0000-00-00 00:00:00'),
(59, '商城管理', 'user', 'icon-shangcheng', 0, 0, '', 1, '', '', 0, 0, 1484532612, '0000-00-00 00:00:00'),
(60, '商品管理', 'user', '', 59, 0, 'user/Mall/goods', 0, '', '购物中心', 0, 0, 1481014242, '0000-00-00 00:00:00'),
(61, '卖家管理', 'user', '', 59, 0, 'user/Mall/sellerList', 0, '', '购物中心', 0, 0, 1481095465, '0000-00-00 00:00:00'),
(62, '分类管理', 'user', '', 59, 0, 'user/Mall/category', 0, '', '购物中心', 0, 0, 1481711740, '0000-00-00 00:00:00'),
(71, '订单管理', 'user', '', 59, 1, 'user/Mall/orders', 0, '', '购物中心', 0, 0, 1481443416, '0000-00-00 00:00:00'),
(69, '订单管理', 'user', '', 66, 2, 'user/Integralmall/intemallOrder', 0, '', '积分商城', 0, 0, 1481267786, '0000-00-00 00:00:00'),
(70, '充值管理', 'user', '', 34, 2, 'user/withdraw/deposite', 0, '', '充值管理', 0, 0, 1481437644, '0000-00-00 00:00:00'),
(66, '积分商城', 'user', 'icon-jifen', 0, 2, '', 0, '', '积分商城', 0, 0, 1484533348, '0000-00-00 00:00:00'),
(67, '积分商城', 'user', '', 66, 0, 'user/Integralmall/Index', 0, '', '积分商城', 0, 0, 1481266549, '0000-00-00 00:00:00'),
(68, '分类管理', 'user', '', 66, 1, 'user/Integralmall/integralCategory', 0, '', '积分商城', 0, 0, 1481267540, '0000-00-00 00:00:00'),
(72, '规格管理', 'user', '', 59, 0, 'user/Mall/standard', 0, '', '购物中心', 0, 0, 1481711744, '0000-00-00 00:00:00'),
(73, '会员等级', 'user', '', 31, 1, 'user/Member/grade', 0, '', '会员管理', 0, 0, 1482114840, '0000-00-00 00:00:00'),
(75, '商品促销', 'user', '', 59, 0, 'user/Promotion/Product', 0, '管理商品促销', '促销管理', 0, 0, 1484533588, '0000-00-00 00:00:00'),
(76, '订单促销', 'user', '', 59, 0, 'user/promotion/Order', 0, '订单促销', '促销管理', 0, 0, 1484533601, '0000-00-00 00:00:00'),
(77, '评论管理', 'user', '', 59, 0, 'user/Mall/Comment', 0, '管理商品评论的', '购物中心', 0, 0, 1482201081, '0000-00-00 00:00:00'),
(78, '会员列表', 'user', '', 31, 0, 'user/Member/userList', 0, '会员管理', '会员管理', 0, 0, 1482226304, '0000-00-00 00:00:00'),
(86, '内容管理', 'user', 'icon-show', 0, 3, '', 0, '内容管理', '内容管理', 0, 0, 1484535216, '0000-00-00 00:00:00'),
(87, '栏目管理', 'user', '', 86, 0, 'user/Category/index', 0, '内容管理', '内容管理', 0, 0, 1482628567, '0000-00-00 00:00:00'),
(88, '文章管理', 'user', '', 86, 0, 'user/Content/documentList', 0, '内容管理', '内容管理', 0, 0, 1482628799, '0000-00-00 00:00:00'),
(83, '图文内容', 'user', '', 82, 0, 'user/Content/documentList', 0, '内容管理', '内容管理', 0, 0, 1482491144, '0000-00-00 00:00:00'),
(84, '视频内容', 'user', '', 82, 0, 'user/Content/videoList', 0, '内容管理', '内容管理', 0, 0, 1482491217, '0000-00-00 00:00:00'),
(85, '栏目管理', 'user', '', 82, 0, 'user/Category/index', 0, '内容管理', '内容管理', 0, 0, 1482491316, '0000-00-00 00:00:00'),
(89, '视频管理', 'user', '', 86, 0, 'user/Content/videoList', 1, '内容管理', '内容管理', 0, 0, 1482628897, '0000-00-00 00:00:00'),
(90, '投票管理', 'user', 'icon-toupiao', 0, 0, '', 0, '投票管理', '投票管理', 0, 0, 1484533404, '0000-00-00 00:00:00'),
(91, '投票列表', 'user', '', 90, 2, 'user/Vote/index', 0, '投票列表', '投票管理', 0, 0, 1483067053, '0000-00-00 00:00:00'),
(92, '投票设置', 'user', '', 90, 1, 'user/Vote/config', 0, '投票管理', '投票设置', 0, 0, 1483067321, '0000-00-00 00:00:00'),
(93, '报名结果', 'user', '', 90, 3, 'user/Vote/Item', 0, '投票管理', '投票管理', 0, 0, 1484535770, '0000-00-00 00:00:00'),
(94, '投票记录', 'user', '', 90, 4, 'User/Vote/Record', 0, '投票记录', '投票管理', 0, 0, 1483067627, '0000-00-00 00:00:00'),
(95, '查看结果', 'user', '', 90, 5, 'User/Vote/voteResult', 0, '投票管理', '投票管理', 0, 0, 1483343311, '0000-00-00 00:00:00'),
(96, '扫码模块', 'user', 'icon-saoma', 0, 1, '', 0, '扫码模块', '扫描二维码', 0, 0, 1484533467, '0000-00-00 00:00:00'),
(97, '扫描二维码', 'user', '', 96, 0, 'user/qrcode/index', 0, '扫描二维码', '扫描二维码', 0, 0, 1483429654, '0000-00-00 00:00:00'),
(98, '广告管理', 'user', 'icon-guanggaojiazhi', 0, 0, '', 0, '广告管理', '广告管理', 0, 0, 1484533434, '0000-00-00 00:00:00'),
(99, '插件列表', 'user', '', 98, 0, 'user/Advert/index', 0, '广告管理', '广告管理', 0, 0, 1484277798, '0000-00-00 00:00:00'),
(100, '投票菜单', 'user', '', 90, 0, 'user/Vote/menu', 0, '', '', 0, 0, 1485163326, '0000-00-00 00:00:00'),
(101, '投诉列表', 'user', '', 90, 0, 'user/Vote/complain', 0, '投票的投诉列表', '投票管理', 0, 0, 1486455648, '0000-00-00 00:00:00');

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
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=41 ;

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=411 ;

--
-- 转存表中的数据 `ruike_picture`
--

INSERT INTO `ruike_picture` (`id`, `path`, `url`, `md5`, `sha1`, `status`, `create_time`) VALUES
(409, '/uploads/picture/20170330/fe0c9e4ea70c91d0f34c4f4db10b49f4.jpg', '/uploads/picture/20170330/fe0c9e4ea70c91d0f34c4f4db10b49f4.jpg', '5db95ebd20ff2deb5086cf170fb3986a', '0635caf9f038c30e903c4060353d4fe6580aa96a', 1, 1490839472),
(410, '/uploads/picture/20170330/c9d7569a2fdb2b0c8ebeabd703aec139.jpg', '/uploads/picture/20170330/c9d7569a2fdb2b0c8ebeabd703aec139.jpg', '5db95ebd20ff2deb5086cf170fb3986a', '0635caf9f038c30e903c4060353d4fe6580aa96a', 1, 1490844935);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=35 ;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
-- 表的结构 `ruike_user_level`
--

CREATE TABLE IF NOT EXISTS `ruike_user_level` (
  `level_id` smallint(4) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `level_name` varchar(30) DEFAULT NULL COMMENT '头衔名称',
  `amount` decimal(10,2) DEFAULT NULL COMMENT '等级必要金额',
  `discount` smallint(4) DEFAULT NULL COMMENT '折扣',
  `describe` varchar(200) DEFAULT NULL COMMENT '头街 描述',
  PRIMARY KEY (`level_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=38 ;

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=26 ;

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=148 ;

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
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=56 ;

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=53 ;

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='微信公共帐号' AUTO_INCREMENT=34 ;

--
-- 转存表中的数据 `ruike_wx_user`
--

INSERT INTO `ruike_wx_user` (`id`, `uid`, `wxname`, `encodingaeskey`, `encode`, `appid`, `appsecret`, `qr`, `wxid`, `weixin`, `headerpic`, `token`, `create_time`, `updatetime`, `type`, `status`, `is_default`, `mch_id`, `partnerkey`, `ssl_cer`, `ssl_key`, `url`) VALUES
(30, 0, '吕梁人俱乐部', '', 0, 'wx41c0e07804690e52', 'f899520273ee7265f00ea6c1c159af23', '335', 'gh_00104ecbf96d', '', '334', 'ygpwlc1484809425', 1484810460, 0, 4, 1, 1, '1427757002', 'dqhIRxKrWJwtDLgtkHvVOzNPczmzMlrT', '', '', NULL),
(29, 0, '临县人俱乐部', '', 0, 'wxcafc0f3657fe696f', '2dc361c4a87f83a5fef4643ee53db80e', '333', 'gh_818094e2cac9', 'QiKouChuZu', '332', 'atdskb1484806844', 1484806844, 0, 2, 1, 0, '', '', '', '', NULL),
(31, 0, '东北人小品二人转', '', 0, 'wxbfe48f552b3b2c49', '8a560fa6b57a064bd8b39fb3264aa9ef', '351', 'gh_34440dc36b37', 'qikoulvyou', '350', 'fdwewy1485445075', 1485445075, 0, 1, 1, 0, '', '', '', '', NULL);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
