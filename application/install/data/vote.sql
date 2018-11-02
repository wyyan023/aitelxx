-- phpMyAdmin SQL Dump
-- version phpStudy 2014
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2017 年 05 月 17 日 11:06
-- 服务器版本: 5.5.53-0ubuntu0.14.04.1
-- PHP 版本: 5.5.9-1ubuntu4.20

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `diyijia`
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

--
-- 转存表中的数据 `ruike_action`
--

INSERT INTO `ruike_action` (`id`, `name`, `title`, `remark`, `rule`, `log`, `type`, `status`, `update_time`) VALUES
(1, 'user_login', '用户登录', '积分+10，每天一次', 'table:member|field:score|condition:uid={$self} AND status>-1|rule:score+10|cycle:24|max:1;', '[user|get_nickname]在[time|time_format]登录了后台', 1, 1, 1387181220),
(2, 'add_article', '发布文章', '积分+5，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:5', '', 2, 1, 1380173180),
(3, 'review', '评论', '评论积分+1，无限制', 'table:member|field:score|condition:uid={$self}|rule:score+1', '', 2, 1, 1383285646),
(4, 'add_document', '发表文档', '积分+10，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+10|cycle:24|max:5', '[user|get_nickname]在[time|time_format]发表了一篇文章。\r\n表[model]，记录编号[record]。', 2, 1, 1386139726),
(5, 'add_document_topic', '发表讨论', '积分+5，每天上限10次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:10', '', 2, 1, 1383285551),
(6, 'update_config', '更新配置', '新增或修改或删除配置', '', '', 1, 1, 1383294988),
(7, 'update_model', '更新模型', '新增或修改模型', '', '', 1, 1, 1383295057),
(8, 'update_attribute', '更新属性', '新增或更新或删除属性', '', '', 1, 1, 1383295963),
(9, 'update_channel', '更新导航', '新增或修改或删除导航', '', '', 1, 1, 1383296301),
(10, 'update_menu', '更新菜单', '新增或修改或删除菜单', '', '', 1, 1, 1383296392),
(11, 'update_category', '更新分类', '新增或修改或删除分类.', '', '', 1, 1, 1383296765);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='行为日志表' AUTO_INCREMENT=152 ;

--
-- 转存表中的数据 `ruike_action_log`
--

INSERT INTO `ruike_action_log` (`id`, `action_id`, `user_id`, `action_ip`, `model`, `record_id`, `remark`, `status`, `create_time`) VALUES
(1, 6, 1, 0, 'config', 1, '操作url：/ruikecms/index.php/admin/config/add.html', 1, 1471534950),
(2, 10, 1, 0, 'Menu', 1, '操作url：/ruikecms/index.php/admin/menu/add/pid/0.html', 1, 1471535370),
(3, 10, 1, 0, 'Menu', 28, '操作url：/ruikecms/index.php/admin/menu/edit/id/28.html', 1, 1471535414),
(4, 10, 1, 0, 'Menu', 28, '操作url：/ruikecms/index.php/admin/menu/edit/id/28.html', 1, 1471535511),
(5, 10, 1, 0, 'Menu', 28, '操作url：/ruikecms/index.php/admin/menu/edit/id/28.html', 1, 1471535575),
(6, 10, 1, 0, 'Menu', 28, '操作url：/ruikecms/index.php/admin/menu/edit/id/28.html', 1, 1471535616),
(7, 10, 1, 0, 'Menu', 28, '操作url：/ruikecms/index.php/admin/menu/edit/id/28.html', 1, 1471535626),
(8, 10, 1, 0, 'Menu', 1, '操作url：/ruikecms/index.php/admin/menu/add/pid/0.html', 1, 1471535900),
(9, 10, 1, 0, 'Menu', 1, '操作url：/ruikecms/index.php/admin/menu/add/pid/0.html', 1, 1471536046),
(10, 10, 1, 0, 'Menu', 28, '操作url：/ruikecms/index.php/admin/menu/edit/id/28.html', 1, 1471536591),
(11, 10, 1, 0, 'Menu', 1, '操作url：/ruikecms/index.php/admin/menu/add/pid/0.html', 1, 1471536797),
(12, 10, 1, 0, 'Menu', 1, '操作url：/ruikecms/index.php/admin/menu/add/pid/0.html', 1, 1471537000),
(13, 10, 1, 0, 'Menu', 1, '操作url：/ruikecms/index.php/admin/menu/add/pid/0.html', 1, 1471537173),
(14, 10, 1, 0, 'Menu', 33, '操作url：/ruikecms/index.php/admin/menu/edit/id/33.html', 1, 1471537188),
(15, 10, 1, 0, 'Menu', 1, '操作url：/ruikecms/index.php/admin/menu/add/pid/0.html', 1, 1471537525),
(16, 10, 1, 0, 'Menu', 34, '操作url：/ruikecms/index.php/admin/menu/edit/id/34.html', 1, 1471537625),
(17, 10, 1, 0, 'Menu', 33, '操作url：/ruikecms/index.php/admin/menu/edit/id/33.html', 1, 1471537641),
(18, 10, 1, 0, 'Menu', 32, '操作url：/ruikecms/index.php/admin/menu/edit/id/32.html', 1, 1471537679),
(19, 10, 1, 0, 'Menu', 0, '操作url：/ruikecms/index.php/admin/menu/del/id/28.html', 1, 1471538426),
(20, 11, 1, 2130706433, 'category', 1, '操作url：/index.php/admin/category/add.html', 1, 1472526450),
(21, 11, 1, 2130706433, 'category', 8, '操作url：/index.php/admin/category/edit.html', 1, 1472526607),
(22, 10, 1, 2130706433, 'Menu', 1, '操作url：/index.php/admin/menu/add/pid/0.html', 1, 1473066666),
(23, 10, 1, 2130706433, 'Menu', 1, '操作url：/index.php/admin/menu/add/pid/0.html', 1, 1473066782),
(24, 10, 1, 2130706433, 'Menu', 36, '操作url：/index.php/admin/menu/edit/id/36.html', 1, 1473066839),
(25, 10, 1, 2130706433, 'Menu', 1, '操作url：/index.php/admin/menu/add/pid/0.html', 1, 1473066946),
(26, 10, 1, 2130706433, 'Menu', 1, '操作url：/index.php/admin/menu/add/pid/0.html', 1, 1473126076),
(27, 10, 1, 2130706433, 'Menu', 38, '操作url：/index.php/admin/menu/edit/id/38.html', 1, 1473126603),
(28, 10, 1, 2130706433, 'Menu', 1, '操作url：/index.php/admin/menu/add/pid/0.html', 1, 1473126857),
(29, 10, 1, 2130706433, 'Menu', 1, '操作url：/index.php/admin/menu/add/pid/0.html', 1, 1473146085),
(30, 10, 1, 2130706433, 'Menu', 1, '操作url：/index.php/admin/menu/add/pid/0.html', 1, 1473146418),
(31, 10, 1, 2130706433, 'Menu', 40, '操作url：/index.php/admin/menu/edit/id/40.html', 1, 1473146493),
(32, 10, 1, 2130706433, 'Menu', 40, '操作url：/index.php/admin/menu/edit/id/40.html', 1, 1473146805),
(33, 10, 1, 2130706433, 'Menu', 40, '操作url：/index.php/admin/menu/edit/id/40.html', 1, 1473146846),
(34, 10, 1, 2130706433, 'Menu', 41, '操作url：/index.php/admin/menu/edit/id/41.html', 1, 1473147523),
(35, 10, 1, 2130706433, 'Menu', 1, '操作url：/index.php/admin/menu/add/pid/0.html', 1, 1473417253),
(36, 10, 1, 2130706433, 'Menu', 42, '操作url：/index.php/admin/menu/edit/id/42.html', 1, 1473417724),
(37, 10, 1, 2130706433, 'Menu', 0, '操作url：/index.php/admin/menu/del/id/36.html', 1, 1473760825),
(38, 10, 1, 2130706433, 'Menu', 0, '操作url：/index.php/admin/menu/del/id/35.html', 1, 1473760846),
(39, 10, 1, 2130706433, 'Menu', 0, '操作url：/index.php/admin/menu/del.html', 1, 1473760874),
(40, 10, 1, 2130706433, 'Menu', 0, '操作url：/index.php/admin/menu/del/id/40.html', 1, 1473844187),
(41, 10, 1, 2130706433, 'Menu', 1, '操作url：/index.php/admin/menu/add/pid/0.html', 1, 1474506290),
(42, 10, 1, 2130706433, 'Menu', 43, '操作url：/index.php/admin/menu/edit/id/43.html', 1, 1474507715),
(43, 10, 1, 2130706433, 'Menu', 1, '操作url：/index.php/admin/menu/add/pid/0.html', 1, 1474507824),
(44, 10, 1, 2130706433, 'Menu', 0, '操作url：/index.php/admin/menu/del.html', 1, 1474507901),
(45, 10, 1, 2130706433, 'Menu', 1, '操作url：/index.php/admin/menu/add/pid/0.html', 1, 1474507976),
(46, 10, 1, 2130706433, 'Menu', 1, '操作url：/index.php/admin/menu/add/pid/0.html', 1, 1474508057),
(47, 10, 1, 2130706433, 'Menu', 1, '操作url：/index.php/admin/menu/add/pid/0.html', 1, 1474508121),
(48, 10, 1, 2130706433, 'Menu', 1, '操作url：/index.php/admin/menu/add/pid/0.html', 1, 1474508157),
(49, 10, 1, 2130706433, 'Menu', 45, '操作url：/index.php/admin/menu/edit/id/45.html', 1, 1474508243),
(50, 10, 1, 2130706433, 'Menu', 45, '操作url：/index.php/admin/menu/edit/id/45.html', 1, 1474509442),
(51, 10, 1, 2130706433, 'Menu', 1, '操作url：/index.php/admin/menu/add/pid/0.html', 1, 1474941225),
(52, 10, 1, 2130706433, 'Menu', 49, '操作url：/index.php/admin/menu/edit/id/49.html', 1, 1474941474),
(53, 10, 1, 2130706433, 'Menu', 49, '操作url：/index.php/admin/menu/edit/id/49.html', 1, 1474941523),
(54, 10, 1, 2130706433, 'Menu', 33, '操作url：/admin/menu/edit/id/33.html', 1, 1475725196),
(55, 10, 1, 2130706433, 'Menu', 32, '操作url：/admin/menu/edit/id/32.html', 1, 1475725218),
(56, 10, 1, 2130706433, 'Menu', 1, '操作url：/admin/menu/add/pid/0.html', 1, 1475807016),
(57, 10, 1, 2130706433, 'Menu', 29, '操作url：/admin/menu/edit/id/29.html', 1, 1475807054),
(58, 10, 1, 2130706433, 'Menu', 30, '操作url：/admin/menu/edit/id/30.html', 1, 1475807090),
(59, 10, 1, 2130706433, 'Menu', 1, '操作url：/admin/menu/add/pid/0.html', 1, 1475807114),
(60, 10, 1, 2130706433, 'Menu', 48, '操作url：/admin/menu/edit/id/48.html', 1, 1475807126),
(61, 10, 1, 2130706433, 'Menu', 47, '操作url：/admin/menu/edit/id/47.html', 1, 1475807139),
(62, 10, 1, 2130706433, 'Menu', 46, '操作url：/admin/menu/edit/id/46.html', 1, 1475807153),
(63, 10, 1, 2130706433, 'Menu', 45, '操作url：/admin/menu/edit/id/45.html', 1, 1475807167),
(64, 10, 1, 2130706433, 'Menu', 49, '操作url：/admin/menu/edit/id/49.html', 1, 1475807182),
(65, 10, 1, 2130706433, 'Menu', 1, '操作url：/admin/menu/add/pid/0.html', 1, 1475807206),
(66, 10, 1, 2130706433, 'Menu', 41, '操作url：/admin/menu/edit/id/41.html', 1, 1475807235),
(67, 10, 1, 2130706433, 'Menu', 42, '操作url：/admin/menu/edit/id/42.html', 1, 1475807245),
(68, 10, 1, 2130706433, 'Menu', 1, '操作url：/admin/menu/add/pid/0.html', 1, 1475807305),
(69, 10, 1, 2130706433, 'Menu', 32, '操作url：/admin/menu/edit/id/32.html', 1, 1475807314),
(70, 10, 1, 2130706433, 'Menu', 33, '操作url：/admin/menu/edit/id/33.html', 1, 1475807329),
(71, 10, 1, 2130706433, 'Menu', 51, '操作url：/admin/menu/edit/id/51.html', 1, 1475815640),
(72, 10, 1, 2130706433, 'Menu', 29, '操作url：/admin/menu/edit/id/29.html', 1, 1475820435),
(73, 10, 1, 2130706433, 'Menu', 30, '操作url：/admin/menu/edit/id/30.html', 1, 1475820457),
(74, 10, 1, 2130706433, 'Menu', 46, '操作url：/admin/menu/edit/id/46.html', 1, 1475820465),
(75, 10, 1, 2130706433, 'Menu', 47, '操作url：/admin/menu/edit/id/47.html', 1, 1475820472),
(76, 10, 1, 2130706433, 'Menu', 48, '操作url：/admin/menu/edit/id/48.html', 1, 1475820478),
(77, 10, 1, 2130706433, 'Menu', 45, '操作url：/admin/menu/edit/id/45.html', 1, 1475820485),
(78, 10, 1, 2130706433, 'Menu', 49, '操作url：/admin/menu/edit/id/49.html', 1, 1475820493),
(79, 10, 1, 2130706433, 'Menu', 41, '操作url：/admin/menu/edit/id/41.html', 1, 1475820503),
(80, 10, 1, 2130706433, 'Menu', 42, '操作url：/admin/menu/edit/id/42.html', 1, 1475822555),
(81, 10, 1, 2130706433, 'Menu', 48, '操作url：/admin/menu/edit/id/48.html', 1, 1475822617),
(82, 10, 1, 2130706433, 'Menu', 41, '操作url：/admin/menu/edit/id/41.html', 1, 1475828970),
(83, 10, 1, 2130706433, 'Menu', 42, '操作url：/admin/menu/edit/id/42.html', 1, 1475828977),
(84, 10, 1, 2130706433, 'Menu', 32, '操作url：/admin/menu/edit/id/32.html', 1, 1475829008),
(85, 10, 1, 2130706433, 'Menu', 33, '操作url：/admin/menu/edit/id/33.html', 1, 1475829017),
(86, 11, 1, 2130706433, 'category', 8, '操作url：/admin/category/remove/id/8.html', 1, 1475830128),
(87, 10, 1, 2130706433, 'Menu', 1, '操作url：/admin/menu/add/pid/52.html', 1, 1475916161),
(88, 10, 1, 2130706433, 'Menu', 1, '操作url：/admin/menu/add/pid/52.html', 1, 1475916373),
(89, 10, 1, 2130706433, 'Menu', 1, '操作url：/admin/menu/add/pid/53.html', 1, 1475916410),
(90, 10, 1, 2130706433, 'Menu', 55, '操作url：/admin/menu/edit/id/55.html', 1, 1475920140),
(91, 10, 1, 2130706433, 'Menu', 1, '操作url：/admin/menu/add/pid/53.html', 1, 1475920371),
(92, 10, 1, 2130706433, 'Menu', 34, '操作url：/index.php/admin/menu/edit/id/34.html', 1, 1477546995),
(93, 10, 1, 2130706433, 'Menu', 1, '操作url：/index.php/admin/menu/add/pid/34.html', 1, 1477547158),
(94, 10, 1, 2130706433, 'Menu', 34, '操作url：/index.php/admin/menu/edit/id/34.html', 1, 1477547299),
(95, 10, 1, 2130706433, 'Menu', 58, '操作url：/index.php/admin/menu/edit/id/58.html', 1, 1477547816),
(96, 11, 1, 2130706433, 'category', 8, '操作url：/index.php/user/category/remove/id/8', 1, 1478225535),
(97, 11, 1, 2130706433, 'category', 1, '操作url：/index.php/user/category/add', 1, 1478226045),
(98, 11, 1, 2130706433, 'category', 9, '操作url：/index.php/user/category/remove/id/9', 1, 1478226050),
(99, 10, 1, 2130706433, 'Menu', 56, '操作url：/index.php/admin/menu/edit/id/56.html', 1, 1480920427),
(100, 10, 1, 2130706433, 'Menu', 32, '操作url：/index.php/admin/menu/edit/id/32.html', 1, 1480920510),
(101, 10, 1, 2130706433, 'Menu', 32, '操作url：/index.php/admin/menu/edit/id/32.html', 1, 1480920529),
(102, 11, 1, 2130706433, 'category', 8, '操作url：/index.php/user/category/remove/id/8', 1, 1481076812),
(103, 7, 1, 2130706433, 'model', 2, '操作url：/index.php/admin/model/update.html', 1, 1481080679),
(104, 7, 1, 2130706433, 'model', 1, '操作url：/index.php/admin/model/update.html', 1, 1481080740),
(105, 7, 1, 2130706433, 'model', 11, '操作url：/index.php/admin/model/update.html', 1, 1481080984),
(114, 10, 1, 2130706433, 'Menu', 0, '操作url：/index.php/admin/menu/del/id/55.html', 1, 1483023163),
(115, 10, 1, 2130706433, 'Menu', 1, '操作url：/index.php/admin/menu/add/pid/0.html', 1, 1483024237),
(116, 10, 1, 2130706433, 'Menu', 1, '操作url：/index.php/admin/menu/add/pid/90.html', 1, 1483024298),
(117, 10, 1, 2130706433, 'Menu', 91, '操作url：/index.php/admin/menu/edit/id/91.html', 1, 1483024319),
(126, 10, 1, 2130706433, 'Menu', 0, '操作url：/index.php/admin/menu/del/id/55.html', 1, 1484531028),
(127, 10, 1, 2130706433, 'Menu', 59, '操作url：/index.php/admin/menu/edit/id/59.html', 1, 1484532613),
(128, 10, 1, 2130706433, 'Menu', 51, '操作url：/index.php/admin/menu/edit/id/51.html', 1, 1484533325),
(129, 10, 1, 2130706433, 'Menu', 66, '操作url：/index.php/admin/menu/edit/id/66.html', 1, 1484533348),
(130, 10, 1, 2130706433, 'Menu', 86, '操作url：/index.php/admin/menu/edit/id/86.html', 1, 1484533391),
(131, 10, 1, 2130706433, 'Menu', 90, '操作url：/index.php/admin/menu/edit/id/90.html', 1, 1484533404),
(132, 10, 1, 2130706433, 'Menu', 52, '操作url：/index.php/admin/menu/edit/id/52.html', 1, 1484533421),
(133, 10, 1, 2130706433, 'Menu', 98, '操作url：/index.php/admin/menu/edit/id/98.html', 1, 1484533434),
(134, 10, 1, 2130706433, 'Menu', 53, '操作url：/index.php/admin/menu/edit/id/53.html', 1, 1484533446),
(135, 10, 1, 2130706433, 'Menu', 96, '操作url：/index.php/admin/menu/edit/id/96.html', 1, 1484533467),
(136, 10, 1, 2130706433, 'Menu', 31, '操作url：/index.php/admin/menu/edit/id/31.html', 1, 1484533494),
(137, 10, 1, 2130706433, 'Menu', 50, '操作url：/index.php/admin/menu/edit/id/50.html', 1, 1484533523),
(138, 10, 1, 2130706433, 'Menu', 34, '操作url：/index.php/admin/menu/edit/id/34.html', 1, 1484533542),
(139, 10, 1, 2130706433, 'Menu', 75, '操作url：/index.php/admin/menu/edit/id/75.html', 1, 1484533588),
(140, 10, 1, 2130706433, 'Menu', 76, '操作url：/index.php/admin/menu/edit/id/76.html', 1, 1484533602),
(141, 10, 1, 2130706433, 'Menu', 0, '操作url：/index.php/admin/menu/del/id/74.html', 1, 1484533612),
(142, 10, 1, 2130706433, 'Menu', 86, '操作url：/index.php/admin/menu/edit/id/86.html', 1, 1484535216),
(143, 10, 1, 2130706433, 'Menu', 93, '操作url：/index.php/admin/menu/edit/id/93.html', 1, 1484535770),
(144, 11, 1, -745188880, 'category', 1, '操作url：/user/category/add', 1, 1484791830),
(145, 11, 1, -745188880, 'category', 14, '操作url：/user/category/remove/id/14', 1, 1484792095),
(146, 11, 1, -745188880, 'category', 14, '操作url：/user/category/remove/id/14', 1, 1484793400),
(147, 11, 1, -548811144, 'category', 14, '操作url：/user/category/edit', 1, 1493108406),
(148, 11, 1, -548863934, 'category', 8, '操作url：/user/category/edit', 1, 1493344281),
(149, 11, 1, -548863934, 'category', 8, '操作url：/user/category/edit', 1, 1493344305),
(150, 11, 1, -548863934, 'category', 2, '操作url：/user/category/edit', 1, 1493344461),
(151, 11, 1, -548863934, 'category', 1, '操作url：/user/category/add', 1, 1493350394);

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
(13, 36, '投票', 337, '', '', '', '', '', 1485328122, 1485328122, 0);

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

--
-- 转存表中的数据 `ruike_addons`
--

INSERT INTO `ruike_addons` (`id`, `name`, `title`, `description`, `status`, `config`, `author`, `version`, `isinstall`, `create_time`, `has_adminlist`) VALUES
(1, 'Devteam', '开发团队信息', '开发团队成员信息', 0, '', 'molong', '0.1', 1, 0, 0),
(2, 'Sitestat', '站点统计信息', '统计站点的基础信息', 0, '', 'thinkphp', '0.2', 1, 0, 0),
(3, 'Systeminfo', '系统环境信息', '用于显示一些服务器的信息', 0, '', 'molong', '0.1', 1, 0, 0);

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

--
-- 转存表中的数据 `ruike_ad_place`
--

INSERT INTO `ruike_ad_place` (`id`, `title`, `name`, `show_type`, `show_num`, `start_time`, `end_time`, `create_time`, `update_time`, `template`, `status`) VALUES
(36, '投票广告', '', 1, 0, 1485327578, 1501214138, 1485328094, 1490953364, '', 1);

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

--
-- 转存表中的数据 `ruike_apply_device`
--

INSERT INTO `ruike_apply_device` (`applyId`, `apply_id`, `audit_status`, `apply_time`, `device_id`, `audit_comment`, `audit_time`) VALUES
(1, '418591', 1, NULL, NULL, '测试', 0),
(2, '418852', 1, NULL, NULL, '审核中', 0),
(3, '418859', 1, NULL, NULL, '审核中', 1472108346),
(4, '418861', 1, NULL, NULL, '审核中', 1472108404),
(5, '418864', 1, NULL, NULL, '审核中', 1472108574),
(6, '418868', 1, NULL, NULL, '审核中', 1472108670),
(7, '420616', 1, 1472553402, NULL, '审核中', 1472553402),
(8, '420620', 1, 1472554208, NULL, '审核中', 1472554208),
(9, '422518', 1, 1473070425, NULL, '审核中', 1473070425);

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

--
-- 转存表中的数据 `ruike_attribute`
--

INSERT INTO `ruike_attribute` (`id`, `name`, `title`, `length`, `type`, `value`, `remark`, `is_show`, `extra`, `model_id`, `is_must`, `status`, `update_time`, `create_time`, `validate_rule`, `validate_time`, `error_info`, `validate_type`, `auto_rule`, `auto_time`, `auto_type`) VALUES
(1, 'uid', '用户ID', '10', 'num', '0', '', 0, '', 1, 0, 1, 1384508362, 1383891233, '', 0, '', '', '', 0, ''),
(2, 'name', '标识', '40', 'string', '', '同一根节点下标识不重复', 1, '', 1, 0, 1, 1383894743, 1383891233, '', 0, '', '', '', 0, ''),
(3, 'title', '标题', '80', 'string', '', '文档标题', 1, '', 1, 0, 1, 1383894778, 1383891233, '', 0, '', '', '', 0, ''),
(4, 'category_id', '所属分类', '10', 'bind', '', '', 1, 'category', 1, 0, 1, 1384508336, 1383891233, '', 0, '', '', '', 0, ''),
(5, 'description', '描述', '140', 'textarea', '', '', 1, '', 1, 0, 1, 1383894927, 1383891233, '', 0, '', '', '', 0, ''),
(8, 'model_id', '内容模型ID', '3', 'num', '0', '该文档所对应的模型', 0, '', 1, 0, 1, 1384508350, 1383891233, '', 0, '', '', '', 0, ''),
(10, 'position', '推荐位', '5', 'select', '0', '多个推荐则将其推荐值相加', 1, '[DOCUMENT_POSITION]', 1, 0, 1, 1383895640, 1383891233, '', 0, '', '', '', 0, ''),
(11, 'link_id', '外链', '10', 'num', '0', '0-非外链，大于0-外链ID,需要函数进行链接与编号的转换', 1, '', 1, 0, 1, 1383895757, 1383891233, '', 0, '', '', '', 0, ''),
(12, 'cover_id', '封面', '10', 'image', '0', '0-无封面，大于0-封面图片ID，需要函数处理', 1, '', 1, 0, 1, 1384147827, 1383891233, '', 0, '', '', '', 0, ''),
(13, 'display', '可见性', '3', 'bool', '1', '', 1, '0:不可见\r\n1:所有人可见', 1, 0, 1, 1386662271, 1383891233, '', 0, '', 'regex', '', 0, 'function'),
(14, 'deadline', '截至时间', '10', 'datetime', '0', '0-永久有效', 1, '', 1, 0, 1, 1387163248, 1383891233, '', 0, '', 'regex', '', 0, 'function'),
(15, 'attach', '附件数量', '3', 'num', '0', '', 0, '', 1, 0, 1, 1387260355, 1383891233, '', 0, '', 'regex', '', 0, 'function'),
(16, 'view', '浏览量', '10', 'num', '0', '', 1, '', 1, 0, 1, 1383895835, 1383891233, '', 0, '', '', '', 0, ''),
(17, 'comment', '评论数', '10', 'num', '0', '', 1, '', 1, 0, 1, 1383895846, 1383891233, '', 0, '', '', '', 0, ''),
(18, 'extend', '扩展统计字段', '10', 'num', '0', '根据需求自行使用', 0, '', 1, 0, 1, 1384508264, 1383891233, '', 0, '', '', '', 0, ''),
(19, 'level', '优先级', '10', 'num', '0', '越高排序越靠前', 1, '', 1, 0, 1, 1453278679, 1383891233, '', 0, '', '0', '', 0, '0'),
(20, 'create_time', '创建时间', '10', 'datetime', '0', '', 1, '', 1, 0, 1, 1383895903, 1383891233, '', 0, '', '', '', 0, ''),
(21, 'update_time', '更新时间', '10', 'text', '0', '', 0, '', 1, 0, 1, 1453278665, 1383891233, '', 0, '', '0', '', 0, '0'),
(22, 'status', '数据状态', '4', 'select', '1', '', 0, '-1:删除\r\n0:禁用\r\n1:正常\r\n2:待审核\r\n3:草稿', 1, 0, 1, 1453278660, 1383891233, '', 0, '', '0', '', 0, '0'),
(24, 'content', '内容', '', 'editor', '', '', 1, '', 2, 0, 1, 1453859207, 1453859207, '', 0, '', '0', '', 0, '0'),
(25, 'tags', '标签', '20', 'tags', '', '', 1, '', 2, 0, 1, 1453881165, 1453881107, '', 0, '', '0', '', 0, '0'),
(26, 'photo_list', '图片列表', '50', 'images', '', '', 1, '', 3, 0, 1, 1454052339, 1454052339, '', 0, '', '0', '', 0, '0'),
(27, 'content', '内容', '', 'editor', '', '', 1, '', 3, 0, 1, 1454052355, 1454052355, '', 0, '', '0', '', 0, '0'),
(28, 'title', '标题', '200', 'text', '', '', 1, '', 4, 0, 0, 0, 0, '', 0, '', '0', '', 0, '0'),
(29, 'model_id', '模型ID', '11', 'num', '', '', 0, '', 4, 1, 0, 0, 0, '', 0, '', '0', '', 0, '0'),
(30, 'cover_id', '封面', '11', 'image', '0', '', 1, '', 4, 0, 0, 0, 0, '', 0, '', '0', '', 0, '0'),
(31, 'content', '内容', '', 'editor', '', '', 1, '', 4, 0, 0, 0, 0, '', 0, '', '0', '', 0, '0'),
(32, 'create_time', '创建时间', '11', 'datetime', '', '', 1, '', 4, 0, 0, 0, 0, '', 0, '', '0', '', 0, '0'),
(33, 'update_time', '更新时间', '11', 'datetime', '', '', 1, '', 4, 0, 0, 0, 0, '', 0, '', '0', '', 0, '0'),
(34, 'is_top', '是否置顶', '1', 'bool', '0', '', 1, '0:否\r\n1:是', 1, 0, 0, 1466041260, 1466041226, '', 0, '', '0', '', 0, '0');

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

--
-- 转存表中的数据 `ruike_auth_group`
--

INSERT INTO `ruike_auth_group` (`id`, `module`, `type`, `title`, `description`, `status`, `rules`) VALUES
(1, 'admin', '1', '网站编辑', '网站编辑，针对内容进行管理', 1, '2,1'),
(2, 'admin', '1', '网站运营', '针对网站SEO进行管理', 1, '21,20,14,12,3,19,18,17,16,15,13,1');

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

--
-- 转存表中的数据 `ruike_auth_group_access`
--

INSERT INTO `ruike_auth_group_access` (`uid`, `group_id`) VALUES
(1, 2),
(14, 2);

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

--
-- 转存表中的数据 `ruike_auth_rule`
--

INSERT INTO `ruike_auth_rule` (`id`, `module`, `type`, `name`, `title`, `group`, `status`, `condition`) VALUES
(1, 'admin', 2, 'admin/index/index', '后台首页', '首页管理', 1, ''),
(2, 'admin', 2, 'admin/form/index', '自定义表单', '运营管理', 1, ''),
(3, 'admin', 2, 'admin/addons/hooks', '钩子列表', '扩展管理', 1, ''),
(4, 'admin', 2, 'admin/addons/index', '插件列表', '扩展管理', 1, ''),
(5, 'admin', 2, 'admin/ad/index', '广告管理', '运营管理', 1, ''),
(6, 'admin', 2, 'admin/link/index', '友链管理', '运营管理', 1, ''),
(7, 'admin', 2, 'admin/action/log', '行为日志', '会员管理', 1, ''),
(8, 'admin', 2, 'admin/action/index', '行为列表', '会员管理', 1, ''),
(9, 'admin', 2, 'admin/group/access', '权限列表', '会员管理', 1, ''),
(10, 'admin', 2, 'admin/group/index', '用户组表', '会员管理', 1, ''),
(11, 'admin', 2, 'admin/user/index', '用户列表', '会员管理', 1, ''),
(12, 'admin', 2, 'admin/model/index', '模型管理', '内容管理', 1, ''),
(13, 'admin', 2, 'admin/category/index', '栏目管理', '内容管理', 1, ''),
(14, 'admin', 2, 'admin/seo/index', 'SEO设置', '系统管理', 1, ''),
(15, 'admin', 2, 'admin/database/index?type=import', '数据恢复', '系统管理', 1, ''),
(16, 'admin', 2, 'admin/database/index?type=export', '数据备份', '系统管理', 1, ''),
(17, 'admin', 2, 'admin/channel/index', '导航管理', '系统管理', 1, ''),
(18, 'admin', 2, 'admin/menu/index', '菜单管理', '系统管理', 1, ''),
(19, 'admin', 2, 'admin/config/group', '配置管理', '系统管理', 1, ''),
(20, 'admin', 2, 'admin/index/clear', '更新缓存', '首页管理', 1, ''),
(21, 'admin', 1, 'admin/config/add', '配置添加', '系统管理', 1, ''),
(22, 'admin', 2, 'admin/content/index', '内容列表', '内容管理', 1, ''),
(23, 'admin', 2, 'admin/content/add', '内容添加', '内容管理', 1, ''),
(24, 'admin', 1, 'admin/content/edit', '内容编辑', '内容管理', 1, ''),
(25, 'admin', 1, 'admin/content/del', '内容删除', '内容管理', 1, ''),
(26, 'admin', 1, 'admin/content/status', '内容设置状态', '内容管理', 1, ''),
(27, 'admin', 1, 'admin/category/add', '栏目添加', '内容管理', 1, ''),
(28, 'admin', 1, 'admin/category/edit', '栏目编辑', '内容管理', 1, ''),
(29, 'admin', 1, 'admin/category/editable', '栏目单字编辑', '内容管理', 1, ''),
(30, 'admin', 1, 'admin/category/remove', '栏目删除', '内容管理', 1, ''),
(31, 'admin', 1, 'admin/category/merge', '栏目合并', '内容管理', 1, ''),
(32, 'admin', 1, 'admin/category/move', '栏目移动', '内容管理', 1, ''),
(33, 'admin', 1, 'admin/category/status', '栏目状态', '内容管理', 1, '');

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

--
-- 转存表中的数据 `ruike_card`
--

INSERT INTO `ruike_card` (`id`, `card_type`, `code_type`, `color`, `title`, `sub_title`, `description`, `quantity`, `discount`, `condition`, `type`, `begin_time`, `end_time`, `fixed_term`, `fixed_begin_term`, `status`, `operation_tips`, `detail`, `service_phone`, `location_id_list`, `use_all_locations`, `get_limit`, `can_share`, `oper_id`, `create_time`, `last_update_time`) VALUES
(1, 'DISCOUNT', 1, '#54BD46', '一群太监上青楼', '问群能有几多愁', '折扣券详情', 400, 5, '', 1, '2016-12-27 23:04:00', '2017-09-30 23:59:00', 100, 0, 1, '恭喜', '1\r\n2\r\n3', '14738383388', '', 1, 4, 1, 1, '2016-09-08 10:36:05', '2016-09-08 10:36:05'),
(2, 'DISCOUNT', 1, '#54BD46', '一群太监上青楼', '问群能有几多愁', '折扣券详情', 400, 5, '', 1, '2016-12-27 23:04:00', '2017-09-30 23:59:00', 100, 0, 0, '恭喜', '1\r\n2\r\n3', '14738383388', '', 1, 4, 1, 1, '2016-09-08 10:39:33', '2016-09-08 10:39:33'),
(3, 'CASH', 1, '#9162C1', '定点数king', '亨利福德', '代金券详情', 800, 8, '虚化', 1, '2016-12-27 23:04:00', '2017-09-30 23:59:00', 100, 0, 1, '操作提示', '冰灯', '1242223532434', '', 1, 5, 1, 1, '2016-09-08 11:05:42', '2016-09-08 11:05:42'),
(4, 'GIFT', 1, '#54BD46', ' 礼品券主标题', '礼品券副标题', 'king', 900, 0, '', 1, '2016-12-27 23:04:00', '2017-09-30 23:59:00', 100, 0, 0, '虾', '龙虾', '14777788888', '', 1, 6, 1, 1, '2016-09-08 11:07:32', '2016-09-08 11:07:32'),
(5, 'GROUPON', 1, '#54BD46', '团购券主标题', '团购券副标题', '团购优惠详情团购优惠详情团购优惠详情', 1000, 0, '', 1, '2016-12-27 23:04:00', '2017-09-30 23:59:00', 100, 0, 0, '操作提示', '旱地', '14799998888', '', 1, 4, 1, 1, '2016-09-08 11:10:42', '2016-09-08 11:10:42'),
(6, 'GENERAL_COUPON', 1, '#54BD46', '看优惠券主标题', '优惠券副标题', '优惠详情优惠详情优惠详情', 800, 0, '', 1, '2016-12-27 23:04:00', '2017-09-30 23:59:00', 100, 0, 0, '啊u菲尔', '使用须知使用须知', '147888888888', '', 1, 4, 1, 1, '2016-09-08 11:14:42', '2016-09-08 11:14:42'),
(7, 'CASH', 1, '#54BD46', '代金券主标题', '代金券主标题', '代金券详情', 900, 0.7, '7.88', 1, '2016-12-27 23:04:00', '2017-09-30 23:59:00', 100, 0, 0, '请用扫描二维码', 'heney', '14722222222', '', 1, 3, 1, 1, '2016-09-08 16:45:51', '2016-09-08 16:45:51'),
(8, 'GROUPON', 1, '#54BD46', 'i can and', '团购', '你可以团购', 600, 0, '', 2, '2016-12-27 23:04:00', '2017-09-30 23:59:00', 100, 0, 0, '请出示', '哦普', '13722222222', '', 1, 6, 1, 1, '2016-09-08 16:59:03', '2016-09-08 16:59:03'),
(13, 'CASH', 1, '#9162C1', '清风明月', '冰冻 honey', '代金券详情', 6666, 22, '222', 1, '2016-12-27 23:04:00', '2017-09-30 23:59:00', 100, 0, 0, 'fire', '框架 Mail to fire', '13799999999', '', 1, 5, 1, 1, '2016-09-09 14:52:15', '2016-09-09 14:52:15'),
(12, 'GENERAL_COUPON', 1, '#CD463C', '购物优惠券', 'lucky', 'voice', 700, 10, '40', 2, '2016-12-27 23:04:00', '2017-09-30 23:59:00', 100, 1, 1, 'your voice', 'king return of king', '14788888888', '', 1, 2, 1, 1, '2016-10-11 17:36:44', '2016-10-11 17:36:44'),
(11, 'GROUPON', 1, '#9162C1', '秋天枫叶是红色的', '平分秋色', '是否可以分享', 7000, 0, '', 1, '2016-12-27 23:04:00', '2017-09-30 23:59:00', 100, 0, 0, '是否可以分享', '是否可以分享', '13899999999', '', 1, 7, 1, 1, '2016-09-09 15:19:31', '2016-09-09 15:19:31'),
(14, 'CASH', 1, '#509FC9', '100元代金券', '混蛋', '代金券详情', 9000, 10, '100', 1, '2016-12-27 23:04:00', '2017-09-30 23:59:00', 100, 0, 0, '体魄', '风雨', '14788888888', '', 1, 9, 1, 1, '2016-09-09 14:56:49', '2016-09-09 14:56:49'),
(15, 'DISCOUNT', 1, '#54BD46', '也', '阿斯', '折扣券详情', 63555, 7, '', 1, '2016-12-27 23:04:00', '2017-09-30 23:59:00', 100, 0, 0, '44', '坎坎坷坷', '13888888888', '', 1, 23, 1, 1, '2016-09-09 16:32:54', '2016-09-09 16:32:54'),
(16, 'DISCOUNT', 1, '#54BD46', '也', '阿斯', '折扣券详情', 63555, 7, '', 1, '2016-12-27 23:04:00', '2017-09-30 23:59:00', 100, 0, 0, '44', '坎坎坷坷', '13888888888', '', 1, 23, 1, 1, '2016-09-09 16:33:41', '2016-09-09 16:33:41'),
(17, 'DISCOUNT', 1, '#54BD46', '也', '阿斯', '折扣券详情', 63555, 7, '', 1, '2016-12-27 23:04:00', '2017-09-30 23:59:00', 100, 0, 0, '44', '坎坎坷坷', '13888888888', '', 1, 23, 1, 1, '2016-09-09 16:40:25', '2016-09-09 16:40:25'),
(18, 'DISCOUNT', 1, '#54BD46', '也', '阿斯', '折扣券详情', 20, 7, '', 1, '2016-12-27 23:04:00', '2017-09-30 23:59:00', 100, 0, 0, '44', '坎坎坷坷', '13888888888', '', 1, 2, 1, 1, '2016-09-09 16:48:49', '2016-09-09 16:48:49'),
(37, 'GENERAL_COUPON', 1, '#9162C1', '测试用的优惠卷', '大多数', '青花瓷', 80, 23, '150', 1, '2017-02-27 23:04:00', '2017-09-30 23:59:00', 100, 0, 1, '出示', '消费满20元才能用', '14795520542', '', 1, 8, 1, 1, '2016-10-11 17:27:14', '2016-10-11 17:27:14');

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

--
-- 转存表中的数据 `ruike_card_code`
--

INSERT INTO `ruike_card_code` (`card_id`, `code`, `status`, `member_id`, `openid`, `receive_people`, `receive_time`, `auditor`, `auditor_time`) VALUES
('35', '354397194277', 0, 0, '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
('35', '351391495152', 0, 0, '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
('35', '350901382352', 0, 0, '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
('35', '357409269329', 0, 0, '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
('35', '355451971761', 0, 0, '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
('35', '352494809638', 0, 0, '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
('35', '352408733788', 0, 0, '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
('35', '358793916158', 0, 0, '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
('35', '351918255565', 0, 0, '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
('35', '350809758940', 0, 0, '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
('35', '355315229991', 0, 0, '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
('35', '358122152798', 0, 0, '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
('35', '351827875574', 0, 0, '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
('35', '359294988380', 0, 0, '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
('35', '356714017219', 0, 0, '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
('35', '352159930925', 0, 0, '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
('35', '353285482352', 0, 0, '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
('35', '355988377035', 0, 0, '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
('35', '357222319928', 1, 1, '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
('35', '352901346008', 1, 1, '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
('36', '365235857630', 1, 1, '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
('36', '362655467508', 1, 1, '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
('36', '367299927058', 1, 1, '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
('36', '367859536912', 1, 1, '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
('36', '365609982600', 1, 1, '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
('36', '367824630045', 1, 1, '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
('36', '369611753693', 1, 1, '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
('36', '363888764910', 1, 1, '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
('36', '366639757078', 1, 1, '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
('36', '365805326895', 1, 1, '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
('36', '365708876129', 0, 0, '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
('36', '360746764302', 0, 0, '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
('36', '366521430016', 0, 0, '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
('36', '369500664449', 0, 0, '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
('36', '364562449157', 0, 0, '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
('36', '360448084873', 0, 0, '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
('12', '367158227597', 2, 1, '', '', '2017-03-26 15:20:51', '', '0000-00-00 00:00:00'),
('12', '362107713094', 2, 1, '', '', '2017-03-30 15:21:01', '', '0000-00-00 00:00:00'),
('12', '366621730195', 2, 1, '', '', '2017-03-27 15:21:09', '', '0000-00-00 00:00:00'),
('36', '369684689857', 0, 0, '', '', '2017-03-30 00:00:00', '', '0000-00-00 00:00:00'),
('37', '377265511286', 1, 1, '', '', '2017-03-27 15:21:09', '', '0000-00-00 00:00:00'),
('37', '378395805579', 1, 1, '', '', '2017-03-27 15:21:09', '', '0000-00-00 00:00:00'),
('37', '379978426653', 1, 1, '', '', '2017-03-27 15:21:09', '', '0000-00-00 00:00:00'),
('37', '371539941891', 1, 1, '', '', '2017-03-27 15:21:09', '', '0000-00-00 00:00:00'),
('37', '371060442723', 1, 1, '', '', '2017-03-27 15:21:09', '', '0000-00-00 00:00:00'),
('37', '371505191482', 1, 1, '', '', '2017-03-27 15:21:09', '', '0000-00-00 00:00:00'),
('37', '375508739749', 1, 1, '', '', '2017-03-27 15:21:09', '', '0000-00-00 00:00:00'),
('37', '378673573568', 1, 1, '', '', '2017-03-27 15:21:09', '', '0000-00-00 00:00:00'),
('37', '370166155969', 1, 1, '', '', '2017-03-27 15:21:09', '', '0000-00-00 00:00:00'),
('37', '372000019611', 1, 1, '', '', '2017-03-27 15:21:09', '', '0000-00-00 00:00:00'),
('37', '378121516368', 1, 1, '', '', '2017-03-27 15:21:09', '', '0000-00-00 00:00:00'),
('37', '379536922180', 1, 1, '', '', '2017-03-27 15:21:09', '', '0000-00-00 00:00:00'),
('37', '374060187228', 1, 1, '', '', '2017-03-27 15:21:09', '', '0000-00-00 00:00:00'),
('37', '379285610050', 1, 1, '', '', '2017-03-27 15:21:09', '', '0000-00-00 00:00:00'),
('37', '370215944697', 1, 1, '', '', '2017-03-27 15:21:09', '', '0000-00-00 00:00:00'),
('37', '370855998665', 1, 1, '', '', '2017-03-27 15:21:09', '', '0000-00-00 00:00:00'),
('37', '374020489579', 1, 1, '', '', '2017-03-27 15:21:09', '', '0000-00-00 00:00:00'),
('37', '376544811309', 1, 1, '', '', '2017-03-27 15:21:09', '', '0000-00-00 00:00:00'),
('37', '370905686867', 1, 1, '', '', '2017-03-27 15:21:09', '', '0000-00-00 00:00:00'),
('37', '372471994792', 1, 1, '', '', '2017-03-27 15:21:09', '', '0000-00-00 00:00:00'),
('37', '376378606996', 1, 1, '', '', '2017-03-27 15:21:09', '', '0000-00-00 00:00:00'),
('37', '374512496565', 1, 1, '', '', '2017-03-27 15:21:09', '', '0000-00-00 00:00:00'),
('37', '374242478667', 1, 1, '', '', '2017-03-27 15:21:09', '', '0000-00-00 00:00:00'),
('37', '376048279232', 1, 1, '', '', '2017-03-27 15:21:09', '', '0000-00-00 00:00:00'),
('37', '372818042752', 1, 1, '', '', '2017-03-27 15:21:09', '', '0000-00-00 00:00:00'),
('37', '376189396665', 1, 1, '', '', '2017-03-27 15:21:09', '', '0000-00-00 00:00:00'),
('37', '378352026838', 1, 1, '', '', '2017-03-27 15:21:09', '', '0000-00-00 00:00:00'),
('37', '372772923161', 1, 1, '', '', '2017-03-27 15:21:09', '', '0000-00-00 00:00:00'),
('37', '372252242776', 1, 1, '', '', '2017-03-27 15:21:09', '', '0000-00-00 00:00:00'),
('37', '374096090332', 1, 1, '', '', '2017-03-27 15:21:09', '', '0000-00-00 00:00:00'),
('37', '379097148648', 1, 1, '', '', '2017-03-27 15:21:09', '', '0000-00-00 00:00:00'),
('37', '370819402861', 1, 1, '', '', '2017-03-27 15:21:09', '', '0000-00-00 00:00:00'),
('37', '379821757701', 1, 1, '', '', '2017-03-27 15:21:09', '', '0000-00-00 00:00:00'),
('37', '373940024260', 1, 1, '', '', '2017-03-27 15:21:09', '', '0000-00-00 00:00:00'),
('37', '372459390880', 1, 1, '', '', '2017-03-27 15:21:09', '', '0000-00-00 00:00:00'),
('37', '372821409931', 1, 1, '', '', '2017-03-27 15:21:09', '', '0000-00-00 00:00:00'),
('37', '375896213068', 1, 1, '', '', '2017-03-27 15:21:09', '', '0000-00-00 00:00:00'),
('37', '372595577287', 1, 1, '', '', '2017-03-27 15:21:09', '', '0000-00-00 00:00:00'),
('37', '379449309233', 1, 1, '', '', '2017-03-27 15:21:09', '', '0000-00-00 00:00:00'),
('37', '374349474826', 1, 1, '', '', '2017-03-27 15:21:09', '', '0000-00-00 00:00:00'),
('37', '372989291813', 1, 1, '', '', '2017-03-27 15:21:09', '', '0000-00-00 00:00:00'),
('37', '378156084771', 1, 1, '', '', '2017-03-27 15:21:09', '', '0000-00-00 00:00:00'),
('37', '378921383012', 1, 1, '', '', '2017-03-27 15:21:09', '', '0000-00-00 00:00:00'),
('37', '379017647458', 1, 1, '', '', '2017-03-27 15:21:09', '', '0000-00-00 00:00:00'),
('37', '378328588700', 1, 1, '', '', '2017-03-27 15:21:09', '', '0000-00-00 00:00:00'),
('37', '374565382093', 1, 1, '', '', '2017-03-27 15:21:09', '', '0000-00-00 00:00:00'),
('37', '375745481010', 1, 1, '', '', '2017-03-27 15:21:09', '', '0000-00-00 00:00:00'),
('37', '370216817274', 1, 1, '', '', '2017-03-27 15:21:09', '', '0000-00-00 00:00:00'),
('37', '374468338970', 1, 1, '', '', '2017-03-27 15:21:09', '', '0000-00-00 00:00:00'),
('37', '371690554437', 1, 1, '', '', '2017-03-27 15:21:09', '', '0000-00-00 00:00:00'),
('37', '378170703383', 1, 1, '', '', '2017-03-27 15:21:09', '', '0000-00-00 00:00:00'),
('37', '377735246045', 1, 1, '', '', '2017-03-27 15:21:09', '', '0000-00-00 00:00:00'),
('37', '371292825880', 1, 1, '', '', '2017-03-27 15:21:09', '', '0000-00-00 00:00:00'),
('37', '371133021113', 1, 1, '', '', '2017-03-27 15:21:09', '', '0000-00-00 00:00:00'),
('37', '376689181017', 1, 1, '', '', '2017-03-27 15:21:09', '', '0000-00-00 00:00:00'),
('37', '376488634759', 1, 1, '', '', '2017-03-27 15:21:09', '', '0000-00-00 00:00:00'),
('37', '371021260574', 1, 1, '', '', '2017-03-27 15:21:09', '', '0000-00-00 00:00:00'),
('37', '375863934666', 1, 1, '', '', '2017-03-27 15:21:09', '', '0000-00-00 00:00:00'),
('37', '370533944961', 1, 1, '', '', '2017-03-27 15:21:09', '', '0000-00-00 00:00:00'),
('37', '377369099505', 1, 1, '', '', '2017-03-27 15:21:09', '', '0000-00-00 00:00:00'),
('37', '375125347385', 1, 1, '', '', '2017-03-27 15:21:09', '', '0000-00-00 00:00:00'),
('37', '376871117432', 1, 1, '', '', '2017-03-27 15:21:09', '', '0000-00-00 00:00:00'),
('37', '371492529381', 1, 1, '', '', '2017-03-27 15:21:09', '', '0000-00-00 00:00:00'),
('37', '372249210071', 1, 1, '', '', '2017-03-27 15:21:09', '', '0000-00-00 00:00:00'),
('37', '371604629333', 1, 1, '', '', '2017-03-27 15:21:09', '', '0000-00-00 00:00:00'),
('37', '371165880244', 1, 1, '', '', '2017-03-27 15:21:09', '', '0000-00-00 00:00:00'),
('37', '375769637609', 1, 1, '', '', '2017-03-27 15:21:09', '', '0000-00-00 00:00:00'),
('37', '371959592525', 1, 1, '', '', '2017-03-27 15:21:09', '', '0000-00-00 00:00:00'),
('37', '379901749474', 1, 1, '', '', '2017-03-27 15:21:09', '', '0000-00-00 00:00:00'),
('37', '373754520508', 1, 1, '', '', '2017-03-27 15:21:09', '', '0000-00-00 00:00:00'),
('37', '376800677610', 1, 1, '', '', '2017-03-27 15:21:09', '', '0000-00-00 00:00:00'),
('37', '375742498082', 1, 1, '', '', '2017-03-27 15:21:09', '', '0000-00-00 00:00:00'),
('37', '374712373262', 1, 1, '', '', '2017-03-27 15:21:09', '', '0000-00-00 00:00:00'),
('37', '373170708881', 1, 1, '', '', '2017-03-27 15:21:09', '', '0000-00-00 00:00:00'),
('37', '372860281598', 1, 1, '', '', '2017-03-27 15:21:09', '', '0000-00-00 00:00:00'),
('37', '371561369016', 1, 1, '', '', '2017-03-27 15:21:09', '', '0000-00-00 00:00:00'),
('37', '374469038504', 1, 1, '', '', '2017-03-27 15:21:09', '', '0000-00-00 00:00:00'),
('37', '378177404796', 1, 1, '', '', '2017-03-27 15:21:09', '', '0000-00-00 00:00:00'),
('37', '370454604976', 1, 1, '', '', '2017-03-27 15:21:09', '', '0000-00-00 00:00:00'),
('37', '370185150163', 1, 1, '', '', '2017-03-27 15:21:09', '', '0000-00-00 00:00:00');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='分类表' AUTO_INCREMENT=16 ;

--
-- 转存表中的数据 `ruike_category`
--

INSERT INTO `ruike_category` (`id`, `name`, `title`, `pid`, `sort`, `list_row`, `meta_title`, `keywords`, `description`, `template_index`, `template_lists`, `template_detail`, `template_edit`, `model`, `model_sub`, `type`, `link_id`, `allow_publish`, `display`, `reply`, `check`, `reply_model`, `extend`, `create_time`, `update_time`, `status`, `icon`, `groups`) VALUES
(1, 'news', '新闻动态', 0, 0, 10, '', '', '', '', '', '', '', '', '2', '2,1', 0, 0, 1, 0, 0, '1', 'null', 1379474947, 1463561497, 1, 0, ''),
(2, 'company_news', '国内新闻', 1, 1, 10, '', '', '', '', '', '', '', '2,3', '2', '2,1,3', 0, 1, 1, 0, 1, '1', '', 1379475028, 1493344461, 1, 536, ''),
(3, '', '国外新闻', 1, 2, 10, '', '', '', '', '', '', '', '', '', '', 0, 1, 1, 0, 0, '', '', 0, 0, 1, 0, ''),
(8, 'f/z担当', 'kong', 0, 0, 10, '', '', '', '', '', '', '', '', '', '', 0, 2, 1, 0, 0, '', NULL, 1472526449, 1493344305, 1, 535, '道不同不相为谋'),
(9, 'driver_news', '司机活动', 0, 0, 10, '', '', '', '', '', '', '', '', '', '', 0, 2, 1, 0, 0, '', NULL, 1478246451, 1478246451, 1, 0, '秋叶枫红'),
(10, 'user_news', '用户活动', 0, 0, 10, '', '', '', '', '', '', '', '', '', '', 0, 2, 1, 0, 0, '', NULL, 1478246508, 1478246508, 1, 0, '枫叶秋天叶儿红'),
(11, 'tstx', '天上天下', 0, 0, 10, '', '', '', '', '', '', '', '', '', '', 0, 2, 1, 0, 0, '', NULL, 1478247445, 1478247584, 1, 0, '定义'),
(12, 'ddd', '短短的', 3, 0, 10, '', '', '', '', '', '', '', '', '', '', 0, 2, 1, 0, 0, '', NULL, 1481098996, 1481098996, 1, 0, 'houtai'),
(13, 'sss', 'ffffff哦哦', 12, 0, 10, '', '', '', '', '', '', '', '', '', '', 0, 1, 1, 0, 0, '', NULL, 1481108125, 1481108125, 1, 0, 'asdfasd'),
(14, '2222', '大小姐', 0, 0, 10, '', '', '', '', '', '', '', '', '', '', 0, 1, 1, 0, 1, '', NULL, 1487130979, 1493108406, 1, 534, '分组'),
(15, '233', '第一个分类', 0, 0, 10, '', '', '', '', '', '', '', '', '', '', 0, 1, 1, 0, 0, '', NULL, 1493350394, 1493350394, 1, 537, '423');

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

--
-- 转存表中的数据 `ruike_channel`
--

INSERT INTO `ruike_channel` (`id`, `pid`, `title`, `url`, `sort`, `icon`, `color`, `band_color`, `band_text`, `active`, `create_time`, `update_time`, `status`, `target`) VALUES
(1, 0, '网站首页', 'index/index/index', 1, 'home', '', '', '', 'home', 1379475111, 1464490544, 1, 0),
(2, 0, '新闻资讯', 'article/list/1', 1, 'article', '', '', '', 'article', 1379475111, 1464490544, 1, 0);

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

--
-- 转存表中的数据 `ruike_config`
--

INSERT INTO `ruike_config` (`id`, `name`, `type`, `title`, `group`, `extra`, `remark`, `icon`, `create_time`, `update_time`, `status`, `value`, `sort`) VALUES
(1, 'config_group_list', 'textarea', '配置分组', 99, '', '', '', 1447305542, 1452323143, 1, '1:基本\r\n2:会员\r\n3:邮件\r\n4:微信\r\n99:系统', 0),
(2, 'hooks_type', 'textarea', '钩子的类型', 99, '', '类型 1-用于扩展显示内容，2-用于扩展业务处理', '', 1379313397, 1379313407, 1, '1:视图\r\n2:控制器', 6),
(3, 'auth_config', 'textarea', 'Auth配置', 99, '', '自定义Auth.class.php类配置', '', 1379409310, 1379409564, 1, 'AUTH_ON:1\r\nAUTH_TYPE:2', 8),
(5, 'data_backup_path', 'text', '数据库备份根路径', 99, '', '路径必须以 / 结尾', '', 1381482411, 1381482411, 1, './data/backup/', 5),
(6, 'data_backup_part_size', 'text', '数据库备份卷大小', 99, '', '该值用于限制压缩后的分卷最大长度。单位：B；建议设置20M', '', 1381482488, 1381729564, 1, '20971520', 7),
(7, 'data_backup_compress', 'bool', '数据库备份文件是否启用压缩', 99, '0:不压缩\r\n1:启用压缩', '压缩备份文件需要PHP环境支持gzopen,gzwrite函数', '', 1381713345, 1447306018, 1, '1', 9),
(8, 'data_backup_compress_level', 'select', '数据库备份文件压缩级别', 99, '1:普通\r\n4:一般\r\n9:最高', '数据库备份文件的压缩级别，该配置在开启压缩时生效', '', 1381713408, 1447305979, 1, '9', 10),
(9, 'develop_mode', 'bool', '开启开发者模式', 99, '0:关闭\r\n1:开启', '是否开启开发者模式', '', 1383105995, 1447305960, 1, '1', 11),
(10, 'allow_visit', 'textarea', '不受限控制器方法', 99, '', '', '', 1386644047, 1438075615, 1, '0:article/draftbox\r\n1:article/mydocument\r\n2:Category/tree\r\n3:Index/verify\r\n4:file/upload\r\n5:file/download\r\n6:user/updatePassword\r\n7:user/updateNickname\r\n8:user/submitPassword\r\n9:user/submitNickname\r\n10:file/uploadpicture', 0),
(11, 'deny_visit', 'textarea', '超管专限控制器方法', 99, '', '仅超级管理员可访问的控制器方法', '', 1386644141, 1438075628, 1, '0:Addons/addhook\r\n1:Addons/edithook\r\n2:Addons/delhook\r\n3:Addons/updateHook\r\n4:Admin/getMenus\r\n5:Admin/recordList\r\n6:AuthManager/updateRules\r\n7:AuthManager/tree', 0),
(12, 'admin_allow_ip', 'text', '后台允许访问IP', 99, '', '多个用逗号分隔，如果不配置表示不限制IP访问', '', 1387165454, 1452307198, 1, '', 12),
(13, 'show_page_trace', 'bool', '是否显示页面Trace', 99, '0:关闭\r\n1:开启', '是否显示页面Trace信息', '', 1387165685, 1447306056, 1, '0', 1),
(14, 'web_site_title', 'text', '网站标题', 1, '', '网站标题前台显示标题', '', 1378898976, 1379235274, 1, 'RuiKe网站管理系统', 0),
(15, 'web_site_url', 'text', '网站URL', 1, '', '网站网址', '', 1378898976, 1379235274, 1, '', 1),
(16, 'web_site_description', 'textarea', '网站描述', 1, '', '网站搜索引擎描述', '', 1378898976, 1379235841, 1, 'RuiKe网站管理系统', 3),
(17, 'web_site_keyword', 'textarea', '网站关键字', 1, '', '网站搜索引擎关键字', '', 1378898976, 1381390100, 1, 'RuiKe网站管理系统,RuiKe', 6),
(18, 'web_site_close', 'bool', '关闭站点', 1, '0:否,1:是', '站点关闭后其他用户不能访问，管理员可以正常访问', '', 1378898976, 1447321395, 1, '0', 4),
(19, 'web_site_icp', 'text', '网站备案号', 1, '', '设置在网站底部显示的备案号，如“赣ICP备13006622号', '', 1378900335, 1379235859, 1, '赣ICP备13006622号', 7),
(20, 'open_mobile_site', 'bool', '开启手机站', 1, '0:关闭\r\n1:开启', '', '', 1440901307, 1440901543, 1, '0', 4),
(21, 'list_rows', 'num', '列表条数', 99, '', '', '', 1448937662, 1448937662, 1, '20', 10),
(22, 'user_allow_register', 'bool', '是否可注册', 2, '1:是\r\n0:否', '', '', 1449043544, 1449043586, 1, '1', 0),
(23, 'user_group_type', 'textarea', '会员分组类别', 2, '', '', '', 1449196835, 1449196835, 1, 'admin:系统管理员\r\nfront:会员等级', 1),
(24, 'config_type_list', 'textarea', '字段类型', 99, '', '', '', 1459136529, 1459136529, 1, 'text:单行文本:varchar\r\nstring:字符串:int\r\npassword:密码:varchar\r\ntextarea:文本框:text\r\nbool:布尔型:int\r\nselect:选择:varchar\r\nnum:数字:int\r\ndecimal:金额:decimal\r\ntags:标签:varchar\r\ndatetime:时间控件:int\r\ndate:日期控件:varchar\r\neditor:编辑器:text\r\nbind:模型绑定:int\r\nimage:图片上传:int\r\nimages:多图上传:varchar\r\nattach:文件上传:varchar', 0),
(25, 'document_position', 'textarea', '文档推荐位', 99, '', '', '', 1453449698, 1453449698, 1, '1:首页推荐\r\n2:列表推荐', 0),
(26, 'mail_host', 'text', 'smtp服务器的名称', 3, '', 'smtp服务器的名称', '', 1455690530, 1455690556, 1, 'smtp.163.com', 0),
(27, 'mail_smtpauth', 'select', '启用smtp认证', 3, '0:否,1:是', '启用smtp认证', '', 1455690641, 1455690689, 1, '1', 0),
(28, 'mail_username', 'text', '邮件发送用户名', 3, '', '邮件发送用户名', '', 1455690771, 1455690771, 1, '你的邮箱账号', 0),
(29, 'mail_password', 'text', '邮箱密码', 3, '', '邮箱密码，如果是qq邮箱，则填安全密码', '', 1455690802, 1455690802, 1, '你的邮箱密码', 0),
(30, 'mail_fromname', 'text', '发件人姓名', 3, '', '发件人姓名', '', 1455690838, 1455690838, 1, '发件人姓名', 0),
(31, 'mail_ishtml', 'select', '是否HTML格式邮件', 3, '0:否,1:是', '是否HTML格式邮件', '', 1455690888, 1455690888, 1, '1', 0),
(32, 'mail_charset', 'text', '邮件编码', 3, '', '设置发送邮件的编码', '', 1455690920, 1455690920, 1, 'UTF8', 0),
(33, 'wechat_name', 'text', '微信名称', 4, '', '填写微信名称', '', 1459136529, 1461898406, 1, '', 0),
(41, 'menu_type', 'select', '菜单类型', 99, 'admin:后生\r\nuser:用户', '', '', 1471534950, 1471534950, 1, 'admin', 10);

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
  `praise` int(10) unsigned DEFAULT NULL COMMENT '点赞数',
  `comment` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `level` int(10) NOT NULL DEFAULT '0' COMMENT '优先级',
  `is_top` int(2) NOT NULL DEFAULT '0' COMMENT '是否置顶  1是置顶，0是不置顶',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  `video_link` varchar(256) DEFAULT NULL COMMENT '视频链接地址',
  `keyword` varchar(256) DEFAULT NULL COMMENT '关键字，自动应答的关键词回复。',
  `is_share` tinyint(2) unsigned zerofill NOT NULL COMMENT '是否允许分享',
  PRIMARY KEY (`id`),
  KEY `idx_category_status` (`category_id`,`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='文档模型基础表' AUTO_INCREMENT=48 ;

--
-- 转存表中的数据 `ruike_content`
--

INSERT INTO `ruike_content` (`id`, `uid`, `title`, `author`, `category_id`, `description`, `type`, `position`, `external_link`, `cover_id`, `display`, `deadline`, `view`, `praise`, `comment`, `level`, `is_top`, `create_time`, `update_time`, `status`, `video_link`, `keyword`, `is_share`) VALUES
(5, 1, '测试', '', 10, '', 1, 0, '0', 30, 0, 1463648554, 2, NULL, 0, 0, 0, 1463648554, 1463648554, 1, '', NULL, 00),
(4, 1, '南昌腾速科技有限公司关于春节放假通知', '', 3, '南昌腾速科技有限公司关于春节放假通知', 1, 0, '0', 31, 0, 1461809278, 5, NULL, 0, 0, 0, 1461809278, 1461809278, 1, '', NULL, 00),
(6, 1, '我校辅导员赴天津观摩全国辅导员职业技能大赛第一赛区复赛', '', 10, '', 1, 0, '0', 32, 0, 1461809225, 3, NULL, 0, 0, 0, 1461809225, 1461809225, 1, '', NULL, 00),
(7, 1, '我校举办高校教师教学发展主题培训会', '', 3, '', 1, 0, '0', 33, 0, 1461809234, 9, NULL, 0, 0, 0, 1461809234, 1461809234, 1, '', NULL, 00),
(11, 1, '测试文档标题', '', 10, '', 1, 1, '0', 34, 0, 0, 22589, 32, 222, 3, 0, 0, 1486601492, 0, NULL, NULL, 00),
(12, 1, '测试文章的添加功能', '', 10, '测试文章的添加功能', 1, 1, '0', 35, 0, 1465207807, 45, 41, 44, 11, 0, 1465207807, 1486601275, 0, NULL, NULL, 00),
(13, 1, '天地之间是否有真爱。', '', 10, '为了什么？', 1, 1, '0', 36, 0, 1472195482, 0, NULL, 0, 0, 1, 1472197004, 1472197004, 2, '', NULL, 00),
(14, 1, '啊十大', '', 10, '反反复复', 1, 1, '0', 519, 0, 1523320236, 666, NULL, 6, 1, 0, 1487122236, 1490944303, 1, NULL, '', 00),
(15, 1, '啊是否大是大非', '', 10, 'kk', 1, 1, '0', 348, 0, 1543373400, 345, NULL, 12, 1, 1, 1487849704, 1487907336, 1, NULL, NULL, 00),
(16, 1, '二', '', 10, '嘎嘎嘎第三方', 1, 1, '0', 521, 0, 1494710700, 233, NULL, 56, 5, 1, 1483070105, 1490944528, 1, NULL, '', 00),
(17, 1, '333', '', 10, '3', 1, 1, '0', 522, 1, 1496199022, 542, NULL, 23, 4, 1, 1485799145, 1490944614, 1, NULL, '', 00),
(18, 1, '4444', '', 10, '444', 1, 1, '0', 523, 1, 1506480602, 24423, NULL, 23, 5, 1, 1488855022, 1490944690, 1, NULL, '', 00),
(19, 1, '555555', '', 10, '555', 1, 1, '0', 520, 1, 1493351702, 55, NULL, 4, 3, 1, 1472195482, 1490944414, 1, NULL, '', 00),
(20, 1, '6666666', '', 10, '666666', 1, 1, '0', 36, 1, 1482195482, 0, NULL, 0, 0, 1, 1472195482, 1472195482, 1, '', NULL, 00),
(21, 1, '雨一样的女人', '红玫瑰', 9, '9999999', 1, 1, '0', 436, 1, 1501469422, 433, NULL, 33, 2, 1, 1482195482, 1488523576, 1, NULL, '红色诱惑', 01),
(22, 1, '大幅', '作者', 9, 'asdfasdffsdsd', 1, 1, '0', 435, 1, 1509432622, 4294967295, NULL, 4232, 2, 1, 1482195682, 1488512727, 1, NULL, '蛤蟆，乌龟，王八', 00),
(23, 1, '23234生大幅', '刘德华', 9, '乌龟，王八，乌龟，王八，乌龟，王八，乌龟，王八，乌龟，王八，乌龟，王八', 1, 1, '0', 434, 1, 1509418222, 234234524, NULL, 234423, 24, 1, 1482195682, 1488512614, 1, NULL, '刘德华，周润发，李嘉欣，乌龟，王八', 01),
(24, 1, '李嘉欣', '李嘉欣', 9, '7阿斯发大水地方', 1, 1, '0', 433, 1, 1501469422, 24212, NULL, 12, 2, 1, 1482195682, 1488512427, 1, NULL, '刘德华，周润发，李嘉欣，杨恭如', 00),
(25, 1, '樱花', '樱花树下', 9, '7阿斯发大水地方', 1, 1, '0', 432, 1, 1504147822, 212423, NULL, 442, 2, 1, 1482195682, 1488512303, 1, NULL, '刘德华，周润发，李嘉欣', 00),
(26, 1, '风云', '哦看', 9, '7阿斯发大水地方', 1, 1, '0', 431, 1, 1496213422, 322, NULL, 12, 2, 0, 1482195682, 1488512186, 1, NULL, '蛤蟆，乌龟，王八', 01),
(27, 1, '莫奈', '萨克拉', 9, '7阿斯发大水地方', 1, 1, '0', 430, 1, 1506743722, 2345, NULL, 63, 2, 0, 1482195682, 1488512089, 0, NULL, '空谷幽明', 01),
(28, 1, 'nakama生大幅', 'oyakama', 9, '7阿斯发大水地方', 1, 1, '0', 429, 1, 1498838122, 12345, NULL, 123, 2, 0, 1482195682, 1488511457, 1, NULL, '由纪子', 01),
(32, 1, '标题', '', 12, '描述', 1, 2, '85', 209, 1, 1482465300, 0, NULL, 0, 0, 0, 1482551700, 1482462508, 0, '', NULL, 00),
(33, 1, '图片标题', '天一', 10, '发烧碟发烧碟', 1, 2, '70', 340, 1, 1483170900, 9000000, 80, 90, 8, 0, 1483070100, 1486999103, 0, NULL, NULL, 00),
(34, 1, 'title', '玉皇大帝', 11, '好看吗', 1, 1, '99', 222, 1, 1482425700, 9, NULL, 6, 990, 0, 1482979800, 1482463743, 1, '', NULL, 00),
(35, 1, '移到', '63', 12, '撒旦发生大幅', 1, 2, 'http://www.qq.com/', 0, 1, 1504147800, 671, 1, 55, 8, 0, 1483156500, 1489999281, 0, NULL, '', 00),
(36, 1, '天权', '玉皇大帝', 12, '撒旦发生大幅', 1, 2, 'http://my.dingdone.com/content', 221, 1, 1490842200, 656, NULL, 55, 8, 0, 1483156500, 1487917232, 1, NULL, NULL, 00),
(37, 1, '春天的故事', '山本正义', 11, '是月季，不是玫瑰哦', 1, 2, 'http://www.qq.com/', 234, 1, 1488282900, 915, 1, 90, 9, 0, 1483199700, 1484212782, 0, '', NULL, 00),
(38, 1, '月季不是玫瑰', '天使', 11, '世事无常', 1, 2, 'http://news.qq.com/a/20161223/', 235, 1, 1482479700, 900, NULL, 90, 9, 0, 1483070100, 1482483750, 0, '', NULL, 00),
(39, 1, '很多人认为的玫瑰花实际上是月季花', '天使', 11, '世事无常', 1, 2, 'http://news.qq.com/a/20161223/', 339, 1, 1488282900, 900, 52, 90, 9, 0, 1483070100, 1486978833, 0, NULL, NULL, 00),
(40, 1, '第一个视频', '习近平', 10, '冷风，冷遇', 2, 2, 'https://www.hao123.com', 236, 1, 1482504600, 6000, NULL, 90, 1, 0, 1483156500, 1482489555, 0, 'http://www.daman.cc/comic1/18912/', NULL, 00),
(41, 1, '第二个内容页面', '诸位战神', 12, '日本，民主国家也。', 2, 2, 'http://www.qq.com/', 0, 1, 1485399000, 234777, 45, 6633, 70, 0, 1482807000, 1487751131, 0, 'http://www.qq.com/', '莫奈，奈良', 00),
(42, 1, '命运之夜', '民国大作者', 10, '他圣大非省古典风格告诉对方', 2, 1, '外链', 240, 1, 1482648600, 4294967295, NULL, 90000, 900, 0, 1480474200, 1482631713, 0, 'http://ruikecmssvn.test.com/index.php/user/content/adddocument/type/2', NULL, 00),
(43, 1, '历史的天空', '奥巴马', 3, '问题描述3', 1, 1, 'http://www.hao123.com/?1486969', 341, 1, 1488250240, 5243, 32, 53, 6, 0, 1486983340, 1486998945, 0, NULL, NULL, 00),
(44, 1, '刘芳菲', '我了', 2, '描述', 1, 1, 'http://demo.yun235.net/index.p', 343, 0, 1488282949, 534, 4, 63, 7, 0, 1486999129, 1487726769, 0, NULL, '', 01),
(45, 1, '股本', '工单', 2, '截至时间', 1, 1, 'http://ruikecmssvn.test.com/in', 344, 1, 1488246316, 4444534, 245, 745, 9, 0, 1486999456, 1486999828, 0, '', NULL, 00),
(46, 1, '挖矿', '你是谁', 2, '老子，儿子。', 1, 2, 'http://demo.yun235.net/index.p', 345, 1, 1488282935, 53424, 43, 532, 3, 0, 1487041415, 1487069764, 0, NULL, '王八', 00),
(47, 1, 'target', '千年', 2, '描述', 1, 2, '', 347, 1, 1498794900, 67, NULL, 7, 4, 0, 1487922900, 1487904906, 0, '', NULL, 00);

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

--
-- 转存表中的数据 `ruike_content_comment`
--

INSERT INTO `ruike_content_comment` (`comment_id`, `content_id`, `email`, `username`, `content`, `deliver_rank`, `add_time`, `ip_address`, `is_show`, `parent_id`, `user_id`, `img`, `service_rank`) VALUES
(1, 1, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 3, 1457746403, '127.0.0.1', 1, 0, 1, '', 4),
(2, 39, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 3, 1457746403, '127.0.0.1', 1, 0, 1, '', 3),
(3, 40, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 2, 1457746403, '127.0.0.1', 1, 0, 1, '', 4),
(4, 41, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 2, 1457746403, '127.0.0.1', 1, 0, 1, '', 5),
(330, 1, '', 'admin', '发反反复复反反复复发生大幅沙敦府', 0, 1482312962, '', 1, 1, 1, NULL, NULL),
(329, 41, '', 'admin', '阿斯顿发生的发生的', 0, 1482312928, '', 1, 4, 1, NULL, NULL),
(7, 44, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 2, 1457746403, '127.0.0.1', 0, 0, 1, '', 4),
(327, 41, '', 'admin', '100yuan', 0, 1482225257, '', 1, 4, 1, NULL, NULL),
(328, 41, '', 'admin', '共产主义', 0, 1482225499, '', 1, 327, 1, NULL, NULL),
(9, 46, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 2, 1457746403, '127.0.0.1', 0, 0, 1, '', 5),
(10, 47, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 5, 1457746403, '127.0.0.1', 0, 0, 1, '', 3),
(11, 48, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 4, 1457746403, '127.0.0.1', 0, 0, 1, '', 5),
(12, 49, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 2, 1457746403, '127.0.0.1', 0, 0, 1, '', 5),
(13, 50, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 4, 1457746403, '127.0.0.1', 0, 0, 1, '', 5),
(14, 51, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 3, 1457746403, '127.0.0.1', 0, 0, 1, '', 5),
(15, 52, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 4, 1457746403, '127.0.0.1', 0, 0, 1, '', 4),
(16, 53, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 2, 1457746403, '127.0.0.1', 1, 0, 1, '', 3),
(17, 54, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 5, 1457746403, '127.0.0.1', 1, 0, 1, '', 3),
(18, 55, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 5, 1457746403, '127.0.0.1', 1, 0, 1, '', 4),
(19, 56, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 5, 1457746403, '127.0.0.1', 1, 0, 1, '', 3),
(20, 57, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 3, 1457746403, '127.0.0.1', 1, 0, 1, '', 4),
(21, 58, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 3, 1457746403, '127.0.0.1', 1, 0, 1, '', 4),
(22, 59, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 3, 1457746403, '127.0.0.1', 1, 0, 1, '', 4),
(23, 60, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 2, 1457746403, '127.0.0.1', 1, 0, 1, '', 3),
(24, 61, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 4, 1457746403, '127.0.0.1', 1, 0, 1, '', 5),
(25, 62, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 5, 1457746403, '127.0.0.1', 1, 0, 1, '', 4),
(26, 63, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 2, 1457746403, '127.0.0.1', 1, 0, 1, '', 5),
(27, 64, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 2, 1457746403, '127.0.0.1', 1, 0, 1, '', 4),
(28, 65, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 2, 1457746403, '127.0.0.1', 1, 0, 1, '', 4),
(29, 66, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 4, 1457746403, '127.0.0.1', 1, 0, 1, '', 5),
(30, 67, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 4, 1457746403, '127.0.0.1', 1, 0, 1, '', 5),
(31, 68, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 5, 1457746403, '127.0.0.1', 1, 0, 1, '', 3),
(32, 69, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 3, 1457746403, '127.0.0.1', 1, 0, 1, '', 4),
(33, 70, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 3, 1457746403, '127.0.0.1', 1, 0, 1, '', 5),
(34, 71, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 3, 1457746403, '127.0.0.1', 1, 0, 1, '', 5),
(35, 72, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 5, 1457746403, '127.0.0.1', 1, 0, 1, '', 3),
(36, 73, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 4, 1457746403, '127.0.0.1', 1, 0, 1, '', 3),
(37, 74, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 4, 1457746403, '127.0.0.1', 1, 0, 1, '', 4),
(38, 75, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 2, 1457746403, '127.0.0.1', 1, 0, 1, '', 4),
(39, 76, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 5, 1457746403, '127.0.0.1', 1, 0, 1, '', 4),
(40, 77, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 4, 1457746403, '127.0.0.1', 1, 0, 1, '', 3),
(41, 78, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 4, 1457746403, '127.0.0.1', 1, 0, 1, '', 4),
(42, 79, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 3, 1457746403, '127.0.0.1', 1, 0, 1, '', 5),
(43, 80, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 2, 1457746403, '127.0.0.1', 1, 0, 1, '', 3),
(44, 81, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 3, 1457746403, '127.0.0.1', 1, 0, 1, '', 4),
(45, 82, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 3, 1457746403, '127.0.0.1', 1, 0, 1, '', 4),
(46, 83, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 2, 1457746403, '127.0.0.1', 1, 0, 1, '', 5),
(47, 84, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 5, 1457746403, '127.0.0.1', 1, 0, 1, '', 3),
(48, 85, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 4, 1457746403, '127.0.0.1', 1, 0, 1, '', 3),
(49, 86, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 2, 1457746403, '127.0.0.1', 1, 0, 1, '', 3),
(50, 87, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 5, 1457746403, '127.0.0.1', 1, 0, 1, '', 4),
(51, 88, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 2, 1457746403, '127.0.0.1', 1, 0, 1, '', 3),
(52, 89, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 2, 1457746403, '127.0.0.1', 1, 0, 1, '', 5),
(53, 90, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 3, 1457746403, '127.0.0.1', 1, 0, 1, '', 5),
(54, 91, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 2, 1457746403, '127.0.0.1', 1, 0, 1, '', 4),
(55, 92, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 4, 1457746403, '127.0.0.1', 1, 0, 1, '', 3),
(56, 93, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 3, 1457746403, '127.0.0.1', 1, 0, 1, '', 3),
(57, 94, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 4, 1457746403, '127.0.0.1', 1, 0, 1, '', 5),
(58, 95, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 4, 1457746403, '127.0.0.1', 1, 0, 1, '', 5),
(59, 96, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 3, 1457746403, '127.0.0.1', 1, 0, 1, '', 5),
(60, 97, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 4, 1457746403, '127.0.0.1', 1, 0, 1, '', 3),
(61, 98, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 5, 1457746403, '127.0.0.1', 1, 0, 1, '', 4),
(62, 99, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 2, 1457746403, '127.0.0.1', 1, 0, 1, '', 3),
(63, 100, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 4, 1457746403, '127.0.0.1', 1, 0, 1, '', 3),
(64, 101, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 3, 1457746403, '127.0.0.1', 1, 0, 1, '', 5),
(65, 102, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 5, 1457746403, '127.0.0.1', 1, 0, 1, '', 4),
(66, 103, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 3, 1457746403, '127.0.0.1', 1, 0, 1, '', 5),
(67, 1, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 5, 1457746449, '127.0.0.1', 0, 0, 1, '', 3),
(68, 39, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 5, 1457746449, '127.0.0.1', 1, 0, 1, '', 3),
(69, 40, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 4, 1457746449, '127.0.0.1', 1, 0, 1, '', 5),
(70, 41, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 4, 1457746449, '127.0.0.1', 1, 0, 1, '', 4),
(71, 42, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 2, 1457746449, '127.0.0.1', 1, 0, 1, '', 4),
(73, 44, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 5, 1457746449, '127.0.0.1', 1, 0, 1, '', 4),
(74, 45, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 5, 1457746449, '127.0.0.1', 1, 0, 1, '', 4),
(75, 46, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 5, 1457746449, '127.0.0.1', 1, 0, 1, '', 5),
(76, 47, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 3, 1457746449, '127.0.0.1', 1, 0, 1, '', 3),
(77, 48, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 4, 1457746449, '127.0.0.1', 1, 0, 1, '', 4),
(78, 49, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 4, 1457746449, '127.0.0.1', 1, 0, 1, '', 5),
(79, 50, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 3, 1457746449, '127.0.0.1', 1, 0, 1, '', 4),
(80, 51, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 5, 1457746449, '127.0.0.1', 1, 0, 1, '', 4),
(81, 52, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 4, 1457746449, '127.0.0.1', 1, 0, 1, '', 5),
(82, 53, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 4, 1457746449, '127.0.0.1', 1, 0, 1, '', 3),
(83, 54, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 5, 1457746449, '127.0.0.1', 1, 0, 1, '', 3),
(84, 55, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 5, 1457746449, '127.0.0.1', 1, 0, 1, '', 5),
(85, 56, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 4, 1457746449, '127.0.0.1', 1, 0, 1, '', 5),
(86, 57, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 4, 1457746449, '127.0.0.1', 1, 0, 1, '', 3),
(87, 58, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 4, 1457746449, '127.0.0.1', 1, 0, 1, '', 4),
(88, 59, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 5, 1457746449, '127.0.0.1', 1, 0, 1, '', 3),
(89, 60, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 5, 1457746449, '127.0.0.1', 1, 0, 1, '', 5),
(90, 61, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 2, 1457746449, '127.0.0.1', 1, 0, 1, '', 5),
(91, 62, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 5, 1457746449, '127.0.0.1', 1, 0, 1, '', 4),
(92, 63, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 2, 1457746449, '127.0.0.1', 1, 0, 1, '', 5),
(93, 64, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 2, 1457746449, '127.0.0.1', 1, 0, 1, '', 3),
(94, 65, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 4, 1457746449, '127.0.0.1', 1, 0, 1, '', 4),
(95, 66, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 2, 1457746449, '127.0.0.1', 1, 0, 1, '', 4),
(96, 67, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 2, 1457746449, '127.0.0.1', 1, 0, 1, '', 5),
(97, 68, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 4, 1457746449, '127.0.0.1', 1, 0, 1, '', 5),
(98, 69, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 2, 1457746449, '127.0.0.1', 1, 0, 1, '', 3),
(99, 70, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 2, 1457746449, '127.0.0.1', 1, 0, 1, '', 4),
(100, 71, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 2, 1457746449, '127.0.0.1', 1, 0, 1, '', 3),
(101, 72, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 2, 1457746449, '127.0.0.1', 1, 0, 1, '', 4),
(102, 73, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 2, 1457746449, '127.0.0.1', 1, 0, 1, '', 5),
(103, 74, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 5, 1457746449, '127.0.0.1', 1, 0, 1, '', 3),
(104, 75, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 4, 1457746449, '127.0.0.1', 1, 0, 1, '', 4),
(105, 76, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 2, 1457746449, '127.0.0.1', 1, 0, 1, '', 5),
(106, 77, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 2, 1457746449, '127.0.0.1', 1, 0, 1, '', 5),
(107, 78, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 2, 1457746449, '127.0.0.1', 1, 0, 1, '', 4),
(108, 79, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 3, 1457746449, '127.0.0.1', 1, 0, 1, '', 4),
(109, 80, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 2, 1457746449, '127.0.0.1', 1, 0, 1, '', 3),
(110, 81, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 2, 1457746449, '127.0.0.1', 1, 0, 1, '', 5),
(111, 82, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 3, 1457746449, '127.0.0.1', 1, 0, 1, '', 3),
(112, 83, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 2, 1457746449, '127.0.0.1', 1, 0, 1, '', 4),
(113, 84, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 4, 1457746449, '127.0.0.1', 1, 0, 1, '', 4),
(114, 85, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 3, 1457746449, '127.0.0.1', 1, 0, 1, '', 5),
(115, 86, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 5, 1457746449, '127.0.0.1', 1, 0, 1, '', 5),
(116, 87, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 4, 1457746449, '127.0.0.1', 1, 0, 1, '', 5),
(117, 88, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 3, 1457746449, '127.0.0.1', 1, 0, 1, '', 3),
(118, 89, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 5, 1457746449, '127.0.0.1', 1, 0, 1, '', 4),
(119, 90, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 5, 1457746449, '127.0.0.1', 1, 0, 1, '', 3),
(120, 91, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 3, 1457746449, '127.0.0.1', 1, 0, 1, '', 3),
(121, 92, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 3, 1457746449, '127.0.0.1', 1, 0, 1, '', 5),
(122, 93, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 3, 1457746449, '127.0.0.1', 1, 0, 1, '', 4),
(123, 94, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 4, 1457746449, '127.0.0.1', 1, 0, 1, '', 5),
(124, 95, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 4, 1457746449, '127.0.0.1', 1, 0, 1, '', 3),
(125, 96, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 5, 1457746449, '127.0.0.1', 1, 0, 1, '', 3),
(126, 97, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 5, 1457746449, '127.0.0.1', 1, 0, 1, '', 5),
(127, 98, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 4, 1457746449, '127.0.0.1', 1, 0, 1, '', 3),
(128, 99, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 4, 1457746449, '127.0.0.1', 1, 0, 1, '', 5),
(129, 100, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 5, 1457746449, '127.0.0.1', 1, 0, 1, '', 3),
(130, 101, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 5, 1457746449, '127.0.0.1', 1, 0, 1, '', 3),
(131, 102, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 5, 1457746449, '127.0.0.1', 1, 0, 1, '', 3),
(132, 103, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 3, 1457746449, '127.0.0.1', 1, 0, 1, '', 3),
(133, 1, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 5, 1457746625, '127.0.0.1', 0, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/03-09/56e01a54a2c6d.jpg";i:1;s:49:"/Public/upload/goods/2016/03-09/56e01a54bcc53.jpg";i:2;s:49:"/Public/upload/goods/2016/03-09/56e01a54de5a9.jpg";}', 1),
(134, 39, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 1, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-13/5695bc6403c1b.jpg";i:1;s:49:"/Public/upload/goods/2016/01-13/5695bc6426660.jpg";i:2;s:49:"/Public/upload/goods/2016/01-13/5695bc644906d.jpg";}', 5),
(135, 40, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 4, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-13/5695be3a2a47b.jpg";i:1;s:49:"/Public/upload/goods/2016/01-13/5695be3a4ced1.jpg";i:2;s:49:"/Public/upload/goods/2016/01-13/5695be3a60cc2.jpg";}', 3),
(136, 41, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 0, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-13/5695bfa3130fe.jpg";i:1;s:49:"/Public/upload/goods/2016/01-13/5695bfa2f2b92.jpg";i:2;s:49:"/Public/upload/goods/2016/01-13/5695bfa2d3f78.jpg";}', 5),
(137, 42, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 0, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-13/5695c8835131f.jpg";i:1;s:49:"/Public/upload/goods/2016/01-13/5695c7340c3c7.png";i:2;s:49:"/Public/upload/goods/2016/01-13/5695c884b21c0.jpg";}', 2),
(139, 44, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 3, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-13/5695c1f7ca3c0.jpg";i:1;s:49:"/Public/upload/goods/2016/01-13/5695c1f7b4037.jpg";i:2;s:49:"/Public/upload/goods/2016/01-13/5695c1f79accb.jpg";}', 0),
(140, 45, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 4, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-13/5695e931ca316.jpg";i:1;s:49:"/Public/upload/goods/2016/01-13/5695e931b2751.jpg";i:2;s:49:"/Public/upload/goods/2016/01-13/5695e9319ae9b.jpg";}', 0),
(141, 46, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 5, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-13/5695ef5a121e0.jpg";i:1;s:49:"/Public/upload/goods/2016/01-13/5695ef59edc08.jpg";i:2;s:49:"/Public/upload/goods/2016/01-13/5695ef59db973.jpg";}', 1),
(142, 47, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 0, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-13/5695f46121de2.jpg";i:1;s:49:"/Public/upload/goods/2016/01-13/5695f46109a55.jpg";i:2;s:49:"/Public/upload/goods/2016/01-13/5695f460d9be3.jpg";}', 4),
(143, 48, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 4, 1457746626, '127.0.0.1', 1, 0, 1, 'a:2:{i:0;s:49:"/Public/upload/goods/2016/01-13/5695f99db14f2.jpg";i:1;s:49:"/Public/upload/goods/2016/01-13/5695f99d8cf8f.jpg";}', 0),
(144, 49, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 3, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-13/569600fcb09e9.jpg";i:1;s:49:"/Public/upload/goods/2016/01-13/569600fc992df.jpg";i:2;s:49:"/Public/upload/goods/2016/01-13/569600fc73203.jpg";}', 0),
(145, 50, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 5, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-13/569603691addc.jpg";i:1;s:49:"/Public/upload/goods/2016/01-13/56960369057f8.jpg";i:2;s:49:"/Public/upload/goods/2016/01-13/56960368e45f5.jpg";}', 0),
(146, 51, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 1, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-13/56960931469a8.jpg";i:1;s:49:"/Public/upload/goods/2016/01-13/56960930d4628.jpg";i:2;s:49:"/Public/upload/goods/2016/01-13/56960930b6a32.jpg";}', 1),
(147, 52, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 5, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-13/56960d9958b28.jpg";i:1;s:49:"/Public/upload/goods/2016/01-13/56960d99415e4.jpg";i:2;s:49:"/Public/upload/goods/2016/01-13/56960d992f857.jpg";}', 1),
(148, 53, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 0, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-13/5696114bd63f7.jpg";i:1;s:49:"/Public/upload/goods/2016/01-13/5696114bc21c5.jpg";i:2;s:49:"/Public/upload/goods/2016/01-13/5696114baf034.jpg";}', 2),
(149, 54, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 0, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-13/569612581ea27.jpg";i:1;s:49:"/Public/upload/goods/2016/01-13/569612580975d.jpg";i:2;s:49:"/Public/upload/goods/2016/01-13/56961257eb4bb.jpg";}', 1),
(150, 55, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 2, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-13/5696137544eff.jpg";i:1;s:49:"/Public/upload/goods/2016/01-13/56961375304b1.jpg";i:2;s:49:"/Public/upload/goods/2016/01-13/569613751cd2d.jpg";}', 4),
(151, 56, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 3, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-14/56970ffcb99f8.jpg";i:1;s:49:"/Public/upload/goods/2016/01-14/56970ffc7cfca.jpg";i:2;s:49:"/Public/upload/goods/2016/01-14/56970ffc37d61.jpg";}', 3),
(152, 57, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 1, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-14/5697110e71cca.jpg";i:1;s:49:"/Public/upload/goods/2016/01-14/5697110e518b1.jpg";i:2;s:49:"/Public/upload/goods/2016/01-14/5697110e3e83f.jpg";}', 2),
(153, 58, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 2, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-14/569714ad81e71.jpg";i:1;s:49:"/Public/upload/goods/2016/01-14/569714ad5db16.jpg";i:2;s:49:"/Public/upload/goods/2016/01-14/569714ad445ad.jpg";}', 2),
(154, 59, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 3, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-14/5697492ac6ce6.jpg";i:1;s:49:"/Public/upload/goods/2016/01-14/5697492aa9c2a.jpg";i:2;s:49:"/Public/upload/goods/2016/01-14/5697492a899e1.jpg";}', 0),
(155, 60, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 3, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-14/5697525ce387e.jpg";i:1;s:49:"/Public/upload/goods/2016/01-14/5697525cc175c.jpg";i:2;s:49:"/Public/upload/goods/2016/01-14/569752597836f.jpg";}', 4),
(156, 61, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 4, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-14/56975c9e889f0.jpg";i:1;s:49:"/Public/upload/goods/2016/01-14/56975c9e712d2.jpg";i:2;s:49:"/Public/upload/goods/2016/01-14/56975c9e5b5e9.jpg";}', 0),
(157, 62, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 4, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-14/569769e715c1a.jpg";i:1;s:49:"/Public/upload/goods/2016/01-14/569769e6f2f82.jpg";i:2;s:49:"/Public/upload/goods/2016/01-14/569769e6de4df.jpg";}', 0),
(158, 63, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 3, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-15/56985460def2d.jpg";i:1;s:49:"/Public/upload/goods/2016/01-15/56985460be7df.jpg";i:2;s:49:"/Public/upload/goods/2016/01-15/56985460a59db.jpg";}', 4),
(159, 64, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 3, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-15/5698555a28000.jpg";i:1;s:49:"/Public/upload/goods/2016/01-15/5698555a0bf59.jpg";i:2;s:49:"/Public/upload/goods/2016/01-15/56985559dbde4.jpg";}', 1),
(160, 65, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 3, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-15/569856df42cbd.jpg";i:1;s:49:"/Public/upload/goods/2016/01-15/569856df2086d.jpg";i:2;s:49:"/Public/upload/goods/2016/01-15/569856df05157.jpg";}', 2),
(161, 66, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 0, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-15/56985aaf7fd1b.jpg";i:1;s:49:"/Public/upload/goods/2016/01-15/56985aaf556a0.jpg";i:2;s:49:"/Public/upload/goods/2016/01-15/56985aaf2de8a.jpg";}', 2),
(162, 67, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 4, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-15/569862a30290b.jpg";i:1;s:49:"/Public/upload/goods/2016/01-15/569862a2db60b.jpg";i:2;s:49:"/Public/upload/goods/2016/01-15/569862a2b953e.jpg";}', 0),
(163, 68, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 5, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-15/56986502e0a52.jpg";i:1;s:49:"/Public/upload/goods/2016/01-15/56986502c6e5a.jpg";i:2;s:49:"/Public/upload/goods/2016/01-15/56986502a475c.jpg";}', 1),
(164, 69, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 1, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-15/56988e0e6f15d.jpg";i:1;s:49:"/Public/upload/goods/2016/01-15/56988e0e5024a.jpg";i:2;s:49:"/Public/upload/goods/2016/01-15/56988e0e379b4.jpg";}', 1),
(165, 70, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 0, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-15/56989004b635d.jpg";i:1;s:49:"/Public/upload/goods/2016/01-15/5698900493b9e.jpg";i:2;s:49:"/Public/upload/goods/2016/01-15/569890047b83d.jpg";}', 3),
(166, 71, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 5, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-15/5698b4de40ef3.jpg";i:1;s:49:"/Public/upload/goods/2016/01-15/5698b4de205b1.jpg";i:2;s:49:"/Public/upload/goods/2016/01-15/5698b4de0409e.jpg";}', 1),
(167, 72, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 3, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-15/5698c8bd543f7.jpg";i:1;s:49:"/Public/upload/goods/2016/01-15/5698c8bd3a9a0.jpg";i:2;s:49:"/Public/upload/goods/2016/01-15/5698c8bd19b19.jpg";}', 1),
(168, 73, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 4, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-16/5699b40fef3f6.jpg";i:1;s:49:"/Public/upload/goods/2016/01-16/5699b40fcb646.jpg";i:2;s:49:"/Public/upload/goods/2016/01-16/5699b40f99a6b.jpg";}', 0),
(169, 74, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 5, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-16/5699f30f76a97.jpg";i:1;s:49:"/Public/upload/goods/2016/01-16/5699f30f5286d.jpg";i:2;s:49:"/Public/upload/goods/2016/01-16/5699f30f28676.jpg";}', 2),
(170, 75, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 5, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-18/569c3ef96aa71.jpg";i:1;s:49:"/Public/upload/goods/2016/01-18/569c3ef943711.jpg";i:2;s:49:"/Public/upload/goods/2016/01-18/569c3ef91f666.jpg";}', 3),
(171, 76, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 0, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-18/569c41f5937a9.jpg";i:1;s:49:"/Public/upload/goods/2016/01-18/569c41f571d08.jpg";i:2;s:49:"/Public/upload/goods/2016/01-18/569c41f546a70.jpg";}', 4),
(172, 77, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 4, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-18/569c5abc25e65.jpg";i:1;s:49:"/Public/upload/goods/2016/01-18/569c5abc09442.jpg";i:2;s:49:"/Public/upload/goods/2016/01-18/569c5abbdbea5.jpg";}', 2),
(173, 78, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 2, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-18/569c5d27ad1b7.jpg";i:1;s:49:"/Public/upload/goods/2016/01-18/569c5d2793d1b.jpg";i:2;s:49:"/Public/upload/goods/2016/01-18/569c5d2776313.jpg";}', 2),
(174, 79, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 1, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-18/569c82ed7d5aa.jpg";i:1;s:49:"/Public/upload/goods/2016/01-18/569c82ed59c7a.jpg";i:2;s:49:"/Public/upload/goods/2016/01-18/569c82ed43834.jpg";}', 3),
(175, 80, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 1, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-18/569c86423ab5f.jpg";i:1;s:49:"/Public/upload/goods/2016/01-18/569c86422181d.jpg";i:2;s:49:"/Public/upload/goods/2016/01-18/569c8641f21a2.jpg";}', 0),
(176, 81, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 0, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-18/569cb7174c173.jpg";i:1;s:49:"/Public/upload/goods/2016/01-18/569cb71732782.jpg";i:2;s:49:"/Public/upload/goods/2016/01-18/569cb71712765.jpg";}', 4),
(177, 82, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 2, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-19/569de0d4100cb.jpg";i:1;s:49:"/Public/upload/goods/2016/01-19/569de0d3dc011.jpg";i:2;s:49:"/Public/upload/goods/2016/01-19/569de0d3bcb9a.jpg";}', 3),
(178, 83, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 3, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-19/569de27026343.jpg";i:1;s:49:"/Public/upload/goods/2016/01-19/569de27008d44.jpg";i:2;s:49:"/Public/upload/goods/2016/01-19/569de26fdd1a1.jpg";}', 0),
(179, 84, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 2, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-20/569f355dc2852.jpg";i:1;s:49:"/Public/upload/goods/2016/01-20/569f355d98268.jpg";i:2;s:49:"/Public/upload/goods/2016/01-20/569f355d6a8c4.jpg";}', 3),
(180, 85, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 2, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-20/569f361a147e3.jpg";i:1;s:49:"/Public/upload/goods/2016/01-20/569f3619eb9ad.jpg";i:2;s:49:"/Public/upload/goods/2016/01-20/569f3619c8ec4.jpg";}', 4),
(181, 86, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 5, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-20/569f36c197ea6.jpg";i:1;s:49:"/Public/upload/goods/2016/01-20/569f36c17498e.jpg";i:2;s:49:"/Public/upload/goods/2016/01-20/569f36c14820c.jpg";}', 1),
(182, 87, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 1, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-20/569f379d13b6e.jpg";i:1;s:49:"/Public/upload/goods/2016/01-20/569f379ce020f.jpg";i:2;s:49:"/Public/upload/goods/2016/01-20/569f379cba59a.jpg";}', 4),
(183, 88, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 2, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-20/569f5f4203f96.jpg";i:1;s:49:"/Public/upload/goods/2016/01-20/569f5f41d29d6.jpg";i:2;s:49:"/Public/upload/goods/2016/01-20/569f5f41acd33.jpg";}', 4),
(184, 89, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 3, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-21/56a033c190b20.jpg";i:1;s:49:"/Public/upload/goods/2016/01-21/56a033c1722bb.jpg";i:2;s:49:"/Public/upload/goods/2016/01-21/56a033c1530fb.jpg";}', 4),
(185, 90, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 3, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-21/56a04168c20be.jpg";i:1;s:49:"/Public/upload/goods/2016/01-21/56a041688d362.jpg";i:2;s:49:"/Public/upload/goods/2016/01-21/56a0416867bbf.jpg";}', 2),
(186, 91, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 0, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-21/56a08a626e7d6.jpg";i:1;s:49:"/Public/upload/goods/2016/01-21/56a08a624e240.jpg";i:2;s:49:"/Public/upload/goods/2016/01-21/56a08a622ffc3.jpg";}', 3),
(187, 92, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 0, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-21/56a08b0393510.jpg";i:1;s:49:"/Public/upload/goods/2016/01-21/56a08b0374d84.jpg";i:2;s:49:"/Public/upload/goods/2016/01-21/56a08b035878e.jpg";}', 5),
(188, 93, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 2, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-21/56a08b83f03f6.jpg";i:1;s:49:"/Public/upload/goods/2016/01-21/56a08b83d1225.jpg";i:2;s:49:"/Public/upload/goods/2016/01-21/56a08b83af7b1.jpg";}', 3),
(189, 94, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 4, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-21/56a08c04e2b94.jpg";i:1;s:49:"/Public/upload/goods/2016/01-21/56a08c04c5ac7.jpg";i:2;s:49:"/Public/upload/goods/2016/01-21/56a08c04a4150.jpg";}', 1),
(190, 95, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 0, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-21/56a08cbe3cbc3.jpg";i:1;s:49:"/Public/upload/goods/2016/01-21/56a08cbe1d096.jpg";i:2;s:49:"/Public/upload/goods/2016/01-21/56a08cbdf153c.jpg";}', 1),
(191, 96, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 4, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-21/56a08d4c42e99.jpg";i:1;s:49:"/Public/upload/goods/2016/01-21/56a08d4c25b37.jpg";i:2;s:49:"/Public/upload/goods/2016/01-21/56a08d4c0a8cb.jpg";}', 3),
(192, 97, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 5, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-21/56a08e46bfddf.jpg";i:1;s:49:"/Public/upload/goods/2016/01-21/56a08e46a58be.jpg";i:2;s:49:"/Public/upload/goods/2016/01-21/56a08e4686fa8.jpg";}', 1),
(193, 98, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 5, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-21/56a08ebdef116.jpg";i:1;s:49:"/Public/upload/goods/2016/01-21/56a08ebdd7128.jpg";i:2;s:49:"/Public/upload/goods/2016/01-21/56a08ebdbdf39.jpg";}', 5),
(194, 99, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 1, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-21/56a08f7370fba.jpg";i:1;s:49:"/Public/upload/goods/2016/01-21/56a08f734e42e.jpg";i:2;s:49:"/Public/upload/goods/2016/01-21/56a08f7336991.jpg";}', 3),
(195, 100, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 1, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-21/56a08fd941a91.jpg";i:1;s:49:"/Public/upload/goods/2016/01-21/56a08fd9235fe.jpg";i:2;s:49:"/Public/upload/goods/2016/01-21/56a08fd8ef1c9.jpg";}', 0),
(196, 101, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 1, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-21/56a0904e6e31e.jpg";i:1;s:49:"/Public/upload/goods/2016/01-21/56a0904e4cf35.jpg";i:2;s:49:"/Public/upload/goods/2016/01-21/56a0904e2d706.jpg";}', 5),
(197, 102, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 1, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-21/56a092513dc93.jpg";i:1;s:49:"/Public/upload/goods/2016/01-21/56a092512352f.jpg";i:2;s:49:"/Public/upload/goods/2016/01-21/56a092510cb8f.jpg";}', 3),
(198, 103, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 5, 1457746626, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/01-21/56a092d85d0df.jpg";i:1;s:49:"/Public/upload/goods/2016/01-21/56a092d8406fc.jpg";i:2;s:49:"/Public/upload/goods/2016/01-21/56a092d81fe22.jpg";}', 0),
(203, 51, 'zuanshi@tpshop.com', 'guangmu', '打的', 3, 1457754388, '116.24.126.90', 1, 0, 1, 'a:1:{i:0;s:51:"/Public/upload/comment/2016-03-12/56e3911410d61.png";}', 3),
(204, 104, 'www.tp-shop.cn', '茱莉亚', '这东西不错,下次还会来买', 3, 1457746403, '127.0.0.1', 1, 0, 1, '', 4),
(205, 104, 'www.tp-shop.cn', '蒙娜丽莎', '不错,买回来老公很喜欢', 5, 1457746449, '127.0.0.1', 1, 0, 1, '', 3),
(206, 104, 'www.99soubao.com', '嫦娥', '晒单给大家看看.我刚买的.', 5, 1457746625, '127.0.0.1', 1, 0, 1, 'a:4:{i:0;s:49:"/Public/upload/goods/2016/03-12/56e3eb73912ff.jpg";i:1;s:50:"/Public/upload//goods/2016/03-12/56e3e6e13859a.jpg";i:2;s:50:"/Public/upload//goods/2016/03-12/56e3e6dae9b86.jpg";i:3;s:50:"/Public/upload//goods/2016/03-12/56e3e6ce7efcb.jpg";}', 1),
(207, 104, 'zuanshi@tpshop.com', 'guangmu', '雨啊', 4, 1458027430, '113.118.69.135', 1, 0, 1, NULL, 4),
(208, 104, 'zuanshi@tpshop.com', 'guangmu', '测试一下评论', 3, 1460455593, '121.35.69.191', 1, 0, 1, 'a:1:{i:0;s:51:"/Public/upload/comment/2016-04-12/570cc8a9b355f.png";}', 4),
(209, 105, 'www.99soubao.com', '美丽淑女', '少女们都很喜欢.', 0, 1461243531, '127.0.0.1', 1, 0, 1, NULL, 2),
(210, 106, 'www.99soubao.com', '美丽淑女', '少女们都很喜欢.', 4, 1461243531, '127.0.0.1', 1, 0, 1, NULL, 2),
(211, 107, 'www.99soubao.com', '美丽淑女', '少女们都很喜欢.', 1, 1461243531, '127.0.0.1', 1, 0, 1, NULL, 4),
(212, 108, 'www.99soubao.com', '美丽淑女', '少女们都很喜欢.', 3, 1461243531, '127.0.0.1', 1, 0, 1, NULL, 0),
(213, 109, 'www.99soubao.com', '美丽淑女', '少女们都很喜欢.', 3, 1461243531, '127.0.0.1', 1, 0, 1, NULL, 1),
(214, 110, 'www.99soubao.com', '美丽淑女', '少女们都很喜欢.', 0, 1461243531, '127.0.0.1', 1, 0, 1, NULL, 0),
(215, 111, 'www.99soubao.com', '美丽淑女', '少女们都很喜欢.', 3, 1461243531, '127.0.0.1', 1, 0, 1, NULL, 3),
(216, 112, 'www.99soubao.com', '美丽淑女', '少女们都很喜欢.', 4, 1461243531, '127.0.0.1', 1, 0, 1, NULL, 5),
(217, 113, 'www.99soubao.com', '美丽淑女', '少女们都很喜欢.', 2, 1461243531, '127.0.0.1', 1, 0, 1, NULL, 0),
(218, 114, 'www.99soubao.com', '美丽淑女', '少女们都很喜欢.', 1, 1461243531, '127.0.0.1', 1, 0, 1, NULL, 5),
(219, 115, 'www.99soubao.com', '美丽淑女', '少女们都很喜欢.', 3, 1461243531, '127.0.0.1', 1, 0, 1, NULL, 5),
(220, 116, 'www.99soubao.com', '美丽淑女', '少女们都很喜欢.', 2, 1461243531, '127.0.0.1', 1, 0, 1, NULL, 4),
(221, 117, 'www.99soubao.com', '美丽淑女', '少女们都很喜欢.', 5, 1461243531, '127.0.0.1', 1, 0, 1, NULL, 2),
(222, 118, 'www.99soubao.com', '美丽淑女', '少女们都很喜欢.', 2, 1461243531, '127.0.0.1', 1, 0, 1, NULL, 2),
(223, 119, 'www.99soubao.com', '美丽淑女', '少女们都很喜欢.', 0, 1461243531, '127.0.0.1', 1, 0, 1, NULL, 5),
(224, 120, 'www.99soubao.com', '美丽淑女', '少女们都很喜欢.', 5, 1461243531, '127.0.0.1', 1, 0, 1, NULL, 2),
(225, 121, 'www.99soubao.com', '美丽淑女', '少女们都很喜欢.', 2, 1461243531, '127.0.0.1', 1, 0, 1, NULL, 0),
(226, 122, 'www.99soubao.com', '美丽淑女', '少女们都很喜欢.', 1, 1461243531, '127.0.0.1', 1, 0, 1, NULL, 2),
(227, 123, 'www.99soubao.com', '美丽淑女', '少女们都很喜欢.', 3, 1461243531, '127.0.0.1', 1, 0, 1, NULL, 0),
(228, 124, 'www.99soubao.com', '美丽淑女', '少女们都很喜欢.', 1, 1461243531, '127.0.0.1', 1, 0, 1, NULL, 4),
(229, 125, 'www.99soubao.com', '美丽淑女', '少女们都很喜欢.', 5, 1461243531, '127.0.0.1', 1, 0, 1, NULL, 1),
(230, 126, 'www.99soubao.com', '美丽淑女', '少女们都很喜欢.', 4, 1461243531, '127.0.0.1', 1, 0, 1, NULL, 2),
(231, 127, 'www.99soubao.com', '美丽淑女', '少女们都很喜欢.', 4, 1461243531, '127.0.0.1', 1, 0, 1, NULL, 3),
(232, 129, 'www.99soubao.com', '美丽淑女', '少女们都很喜欢.', 4, 1461243531, '127.0.0.1', 1, 0, 1, NULL, 3),
(233, 130, 'www.99soubao.com', '美丽淑女', '少女们都很喜欢.', 0, 1461243531, '127.0.0.1', 1, 0, 1, NULL, 4),
(234, 131, 'www.99soubao.com', '美丽淑女', '少女们都很喜欢.', 5, 1461243531, '127.0.0.1', 1, 0, 1, NULL, 1),
(235, 132, 'www.99soubao.com', '美丽淑女', '少女们都很喜欢.', 4, 1461243531, '127.0.0.1', 1, 0, 1, NULL, 4),
(236, 133, 'www.99soubao.com', '美丽淑女', '少女们都很喜欢.', 2, 1461243531, '127.0.0.1', 1, 0, 1, NULL, 0),
(237, 134, 'www.99soubao.com', '美丽淑女', '少女们都很喜欢.', 4, 1461243531, '127.0.0.1', 1, 0, 1, NULL, 5),
(238, 135, 'www.99soubao.com', '美丽淑女', '少女们都很喜欢.', 2, 1461243531, '127.0.0.1', 1, 0, 1, NULL, 3),
(239, 136, 'www.99soubao.com', '美丽淑女', '少女们都很喜欢.', 2, 1461243531, '127.0.0.1', 1, 0, 1, NULL, 4),
(240, 137, 'www.99soubao.com', '美丽淑女', '少女们都很喜欢.', 2, 1461243531, '127.0.0.1', 1, 0, 1, NULL, 5),
(241, 138, 'www.99soubao.com', '美丽淑女', '少女们都很喜欢.', 3, 1461243531, '127.0.0.1', 1, 0, 1, NULL, 2),
(242, 139, 'www.99soubao.com', '美丽淑女', '少女们都很喜欢.', 2, 1461243531, '127.0.0.1', 1, 0, 1, NULL, 4),
(243, 105, 'www.99soubao.com', '美女', '买回去男朋友很喜欢 ..', 4, 1461243560, '127.0.0.1', 1, 0, 1, NULL, 5),
(244, 106, 'www.99soubao.com', '美女', '买回去男朋友很喜欢 ..', 5, 1461243560, '127.0.0.1', 1, 0, 1, NULL, 3),
(245, 107, 'www.99soubao.com', '美女', '买回去男朋友很喜欢 ..', 2, 1461243560, '127.0.0.1', 1, 0, 1, NULL, 3),
(246, 108, 'www.99soubao.com', '美女', '买回去男朋友很喜欢 ..', 3, 1461243560, '127.0.0.1', 1, 0, 1, NULL, 3),
(247, 109, 'www.99soubao.com', '美女', '买回去男朋友很喜欢 ..', 4, 1461243560, '127.0.0.1', 1, 0, 1, NULL, 1),
(248, 110, 'www.99soubao.com', '美女', '买回去男朋友很喜欢 ..', 3, 1461243560, '127.0.0.1', 1, 0, 1, NULL, 2),
(249, 111, 'www.99soubao.com', '美女', '买回去男朋友很喜欢 ..', 3, 1461243560, '127.0.0.1', 1, 0, 1, NULL, 1),
(250, 112, 'www.99soubao.com', '美女', '买回去男朋友很喜欢 ..', 0, 1461243560, '127.0.0.1', 1, 0, 1, NULL, 5),
(251, 113, 'www.99soubao.com', '美女', '买回去男朋友很喜欢 ..', 5, 1461243560, '127.0.0.1', 1, 0, 1, NULL, 1),
(252, 114, 'www.99soubao.com', '美女', '买回去男朋友很喜欢 ..', 2, 1461243560, '127.0.0.1', 1, 0, 1, NULL, 5),
(253, 115, 'www.99soubao.com', '美女', '买回去男朋友很喜欢 ..', 3, 1461243560, '127.0.0.1', 1, 0, 1, NULL, 4),
(254, 116, 'www.99soubao.com', '美女', '买回去男朋友很喜欢 ..', 4, 1461243560, '127.0.0.1', 1, 0, 1, NULL, 1),
(255, 117, 'www.99soubao.com', '美女', '买回去男朋友很喜欢 ..', 1, 1461243560, '127.0.0.1', 1, 0, 1, NULL, 2),
(256, 118, 'www.99soubao.com', '美女', '买回去男朋友很喜欢 ..', 4, 1461243560, '127.0.0.1', 1, 0, 1, NULL, 4),
(257, 119, 'www.99soubao.com', '美女', '买回去男朋友很喜欢 ..', 0, 1461243560, '127.0.0.1', 1, 0, 1, NULL, 2),
(258, 120, 'www.99soubao.com', '美女', '买回去男朋友很喜欢 ..', 2, 1461243560, '127.0.0.1', 1, 0, 1, NULL, 3),
(259, 121, 'www.99soubao.com', '美女', '买回去男朋友很喜欢 ..', 2, 1461243560, '127.0.0.1', 1, 0, 1, NULL, 4),
(260, 122, 'www.99soubao.com', '美女', '买回去男朋友很喜欢 ..', 1, 1461243560, '127.0.0.1', 1, 0, 1, NULL, 4),
(261, 123, 'www.99soubao.com', '美女', '买回去男朋友很喜欢 ..', 3, 1461243560, '127.0.0.1', 1, 0, 1, NULL, 4),
(262, 124, 'www.99soubao.com', '美女', '买回去男朋友很喜欢 ..', 5, 1461243560, '127.0.0.1', 1, 0, 1, NULL, 5),
(263, 125, 'www.99soubao.com', '美女', '买回去男朋友很喜欢 ..', 3, 1461243560, '127.0.0.1', 1, 0, 1, NULL, 1),
(264, 126, 'www.99soubao.com', '美女', '买回去男朋友很喜欢 ..', 1, 1461243560, '127.0.0.1', 1, 0, 1, NULL, 3),
(265, 127, 'www.99soubao.com', '美女', '买回去男朋友很喜欢 ..', 0, 1461243560, '127.0.0.1', 1, 0, 1, NULL, 1),
(266, 129, 'www.99soubao.com', '美女', '买回去男朋友很喜欢 ..', 5, 1461243560, '127.0.0.1', 1, 0, 1, NULL, 1),
(267, 130, 'www.99soubao.com', '美女', '买回去男朋友很喜欢 ..', 2, 1461243560, '127.0.0.1', 1, 0, 1, NULL, 1),
(268, 131, 'www.99soubao.com', '美女', '买回去男朋友很喜欢 ..', 2, 1461243560, '127.0.0.1', 1, 0, 1, NULL, 2),
(269, 132, 'www.99soubao.com', '美女', '买回去男朋友很喜欢 ..', 4, 1461243560, '127.0.0.1', 1, 0, 1, NULL, 1),
(270, 133, 'www.99soubao.com', '美女', '买回去男朋友很喜欢 ..', 1, 1461243560, '127.0.0.1', 1, 0, 1, NULL, 4),
(271, 134, 'www.99soubao.com', '美女', '买回去男朋友很喜欢 ..', 0, 1461243560, '127.0.0.1', 1, 0, 1, NULL, 5),
(272, 135, 'www.99soubao.com', '美女', '买回去男朋友很喜欢 ..', 0, 1461243560, '127.0.0.1', 1, 0, 1, NULL, 3),
(273, 136, 'www.99soubao.com', '美女', '买回去男朋友很喜欢 ..', 4, 1461243560, '127.0.0.1', 1, 0, 1, NULL, 5),
(274, 137, 'www.99soubao.com', '美女', '买回去男朋友很喜欢 ..', 4, 1461243560, '127.0.0.1', 1, 0, 1, NULL, 1),
(275, 138, 'www.99soubao.com', '美女', '买回去男朋友很喜欢 ..', 1, 1461243560, '127.0.0.1', 1, 0, 1, NULL, 2),
(276, 139, 'www.99soubao.com', '美女', '买回去男朋友很喜欢 ..', 1, 1461243560, '127.0.0.1', 1, 0, 1, NULL, 1),
(277, 105, 'www.99soubao.com', '貌美如花', '买来送给我老公的, 嘻嘻....', 0, 1461243599, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/04-19/5715e06372f03.jpg";i:1;s:49:"/Public/upload/goods/2016/04-19/5715e09a61ded.jpg";i:2;s:49:"/Public/upload/goods/2016/04-19/5715e09a54c53.jpg";}', 5),
(278, 106, 'www.99soubao.com', '貌美如花', '买来送给我老公的, 嘻嘻....', 0, 1461243599, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/04-19/5715eb1f78393.jpg";i:1;s:49:"/Public/upload/goods/2016/04-19/5715eb3995d92.png";i:2;s:49:"/Public/upload/goods/2016/04-19/5715eb397e45c.jpg";}', 4),
(279, 107, 'www.99soubao.com', '貌美如花', '买来送给我老公的, 嘻嘻....', 5, 1461243599, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/04-19/5715efc3bc242.jpg";i:1;s:49:"/Public/upload/goods/2016/04-19/5715efe45f613.jpg";i:2;s:49:"/Public/upload/goods/2016/04-19/5715efe44e074.jpg";}', 4),
(280, 108, 'www.99soubao.com', '貌美如花', '买来送给我老公的, 嘻嘻....', 1, 1461243599, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/04-19/5715f4e32340f.jpg";i:1;s:49:"/Public/upload/goods/2016/04-19/5715f4f9ae27e.jpg";i:2;s:49:"/Public/upload/goods/2016/04-19/5715f4f989a1b.jpg";}', 5),
(281, 109, 'www.99soubao.com', '貌美如花', '买来送给我老公的, 嘻嘻....', 1, 1461243599, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/04-19/5715f7b35a3f7.jpg";i:1;s:49:"/Public/upload/goods/2016/04-19/5715f7c928765.jpg";i:2;s:49:"/Public/upload/goods/2016/04-19/5715f7c900afe.jpg";}', 4),
(282, 110, 'www.99soubao.com', '貌美如花', '买来送给我老公的, 嘻嘻....', 1, 1461243599, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/04-20/5716dda75a263.jpg";i:1;s:49:"/Public/upload/goods/2016/04-20/5716ddca0083c.jpg";i:2;s:49:"/Public/upload/goods/2016/04-20/5716ddc9a0403.jpg";}', 0),
(283, 111, 'www.99soubao.com', '貌美如花', '买来送给我老公的, 嘻嘻....', 5, 1461243599, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/04-20/5716ed08448b7.jpg";i:1;s:49:"/Public/upload/goods/2016/04-20/5716ed26cda84.png";i:2;s:49:"/Public/upload/goods/2016/04-20/5716ed2695c83.jpg";}', 1),
(284, 112, 'www.99soubao.com', '貌美如花', '买来送给我老公的, 嘻嘻....', 2, 1461243599, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/04-20/5716ef7989479.jpg";i:1;s:49:"/Public/upload/goods/2016/04-20/5716ef91b2d09.jpg";i:2;s:49:"/Public/upload/goods/2016/04-20/5716ef9160e03.jpg";}', 5),
(285, 113, 'www.99soubao.com', '貌美如花', '买来送给我老公的, 嘻嘻....', 3, 1461243599, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/04-20/5717262e577ed.jpg";i:1;s:49:"/Public/upload/goods/2016/04-20/5717264b7f416.jpg";i:2;s:49:"/Public/upload/goods/2016/04-20/5717264b5ff9d.jpg";}', 4),
(286, 114, 'www.99soubao.com', '貌美如花', '买来送给我老公的, 嘻嘻....', 4, 1461243599, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/04-20/571733f4f2ff4.jpg";i:1;s:49:"/Public/upload/goods/2016/04-20/57173415c5e7a.jpg";i:2;s:49:"/Public/upload/goods/2016/04-20/5717341543764.jpg";}', 5),
(287, 115, 'www.99soubao.com', '貌美如花', '买来送给我老公的, 嘻嘻....', 3, 1461243599, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/04-20/57175033b5c37.jpg";i:1;s:49:"/Public/upload/goods/2016/04-20/5717505a692de.jpg";i:2;s:49:"/Public/upload/goods/2016/04-20/57175059b2046.jpg";}', 1),
(288, 116, 'www.99soubao.com', '貌美如花', '买来送给我老公的, 嘻嘻....', 1, 1461243599, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/04-20/57175203bd715.jpg";i:1;s:49:"/Public/upload/goods/2016/04-20/5717521b0b94c.jpg";i:2;s:49:"/Public/upload/goods/2016/04-20/5717521abe1ba.jpg";}', 1),
(289, 117, 'www.99soubao.com', '貌美如花', '买来送给我老公的, 嘻嘻....', 2, 1461243599, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/04-21/57182dc652219.jpg";i:1;s:49:"/Public/upload/goods/2016/04-21/57182dd9dee42.jpg";i:2;s:49:"/Public/upload/goods/2016/04-21/57182dd9c365c.jpg";}', 0),
(290, 118, 'www.99soubao.com', '貌美如花', '买来送给我老公的, 嘻嘻....', 2, 1461243599, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/04-21/571835ac8f4db.jpg";i:1;s:49:"/Public/upload/goods/2016/04-21/571835c77b583.jpg";i:2;s:49:"/Public/upload/goods/2016/04-21/571835c764bac.jpg";}', 5);
INSERT INTO `ruike_content_comment` (`comment_id`, `content_id`, `email`, `username`, `content`, `deliver_rank`, `add_time`, `ip_address`, `is_show`, `parent_id`, `user_id`, `img`, `service_rank`) VALUES
(291, 119, 'www.99soubao.com', '貌美如花', '买来送给我老公的, 嘻嘻....', 4, 1461243599, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/04-21/571836416e936.jpg";i:1;s:49:"/Public/upload/goods/2016/04-21/5718365665d97.jpg";i:2;s:49:"/Public/upload/goods/2016/04-21/571836564b297.jpg";}', 5),
(292, 120, 'www.99soubao.com', '貌美如花', '买来送给我老公的, 嘻嘻....', 2, 1461243599, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/04-21/571836cf3102e.jpg";i:1;s:49:"/Public/upload/goods/2016/04-21/571836e336b14.jpg";i:2;s:49:"/Public/upload/goods/2016/04-21/571836e30aaba.jpg";}', 4),
(293, 121, 'www.99soubao.com', '貌美如花', '买来送给我老公的, 嘻嘻....', 0, 1461243599, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/04-21/5718379d770a2.jpg";i:1;s:49:"/Public/upload/goods/2016/04-21/571837b36fb87.jpg";i:2;s:49:"/Public/upload/goods/2016/04-21/571837b34a48e.jpg";}', 2),
(294, 122, 'www.99soubao.com', '貌美如花', '买来送给我老公的, 嘻嘻....', 2, 1461243599, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/04-21/5718384936f8a.jpg";i:1;s:49:"/Public/upload/goods/2016/04-21/5718385e082c2.jpg";i:2;s:49:"/Public/upload/goods/2016/04-21/5718385dea007.jpg";}', 4),
(295, 123, 'www.99soubao.com', '貌美如花', '买来送给我老公的, 嘻嘻....', 3, 1461243599, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/04-21/57186b06906be.jpg";i:1;s:49:"/Public/upload/goods/2016/04-21/57186b2487f06.jpg";i:2;s:49:"/Public/upload/goods/2016/04-21/57186b2475e75.jpg";}', 3),
(296, 124, 'www.99soubao.com', '貌美如花', '买来送给我老公的, 嘻嘻....', 3, 1461243599, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/04-21/571878f368468.jpg";i:1;s:49:"/Public/upload/goods/2016/04-21/5718790944465.jpg";i:2;s:49:"/Public/upload/goods/2016/04-21/571879090f7aa.jpg";}', 2),
(297, 125, 'www.99soubao.com', '貌美如花', '买来送给我老公的, 嘻嘻....', 4, 1461243599, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/04-21/57187b42bfc0c.jpg";i:1;s:49:"/Public/upload/goods/2016/04-21/57187b5841296.jpg";i:2;s:49:"/Public/upload/goods/2016/04-21/57187b580abe4.jpg";}', 1),
(298, 126, 'www.99soubao.com', '貌美如花', '买来送给我老公的, 嘻嘻....', 1, 1461243599, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/04-21/57187bc13f7f6.jpg";i:1;s:49:"/Public/upload/goods/2016/04-21/57187bd601eaf.jpg";i:2;s:49:"/Public/upload/goods/2016/04-21/57187bd5dd859.jpg";}', 0),
(299, 127, 'www.99soubao.com', '貌美如花', '买来送给我老公的, 嘻嘻....', 0, 1461243599, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/04-21/57187c4a0ee19.jpg";i:1;s:49:"/Public/upload/goods/2016/04-21/57187c5d48daa.jpg";i:2;s:49:"/Public/upload/goods/2016/04-21/57187c5d36631.jpg";}', 2),
(300, 129, 'www.99soubao.com', '貌美如花', '买来送给我老公的, 嘻嘻....', 2, 1461243599, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/04-21/57187dbb16571.jpg";i:1;s:49:"/Public/upload/goods/2016/04-21/57187dd92a26f.jpg";i:2;s:49:"/Public/upload/goods/2016/04-21/57187dd8e18e8.jpg";}', 5),
(301, 130, 'www.99soubao.com', '貌美如花', '买来送给我老公的, 嘻嘻....', 4, 1461243599, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/04-21/57187e4c5a833.jpg";i:1;s:49:"/Public/upload/goods/2016/04-21/57187e647a9e0.jpg";i:2;s:49:"/Public/upload/goods/2016/04-21/57187e64208f2.jpg";}', 2),
(302, 131, 'www.99soubao.com', '貌美如花', '买来送给我老公的, 嘻嘻....', 0, 1461243599, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/04-21/57187f2652a09.jpg";i:1;s:49:"/Public/upload/goods/2016/04-21/57187f3e13b73.jpg";i:2;s:49:"/Public/upload/goods/2016/04-21/57187f3d96daf.gif";}', 2),
(303, 132, 'www.99soubao.com', '貌美如花', '买来送给我老公的, 嘻嘻....', 1, 1461243599, '127.0.0.1', 1, 0, 1, 'N;', 5),
(304, 133, 'www.99soubao.com', '貌美如花', '买来送给我老公的, 嘻嘻....', 4, 1461243599, '127.0.0.1', 1, 0, 1, 'N;', 2),
(305, 134, 'www.99soubao.com', '貌美如花', '买来送给我老公的, 嘻嘻....', 2, 1461243599, '127.0.0.1', 1, 0, 1, 'N;', 5),
(306, 135, 'www.99soubao.com', '貌美如花', '买来送给我老公的, 嘻嘻....', 4, 1461243599, '127.0.0.1', 1, 0, 1, 'a:2:{i:0;s:49:"/Public/upload/goods/2016/04-21/5718883514695.jpg";i:1;s:49:"/Public/upload/goods/2016/04-21/57188845afa4a.jpg";}', 3),
(307, 136, 'www.99soubao.com', '貌美如花', '买来送给我老公的, 嘻嘻....', 5, 1461243599, '127.0.0.1', 1, 0, 1, 'N;', 0),
(308, 137, 'www.99soubao.com', '貌美如花', '买来送给我老公的, 嘻嘻....', 5, 1461243599, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/04-21/571888ed55109.jpg";i:1;s:49:"/Public/upload/goods/2016/04-21/5718890105ad8.jpg";i:2;s:49:"/Public/upload/goods/2016/04-21/57188900836e7.jpg";}', 3),
(309, 138, 'www.99soubao.com', '貌美如花', '买来送给我老公的, 嘻嘻....', 5, 1461243599, '127.0.0.1', 1, 0, 1, 'N;', 3),
(310, 139, 'www.99soubao.com', '貌美如花', '买来送给我老公的, 嘻嘻....', 1, 1461243599, '127.0.0.1', 1, 0, 1, 'N;', 0),
(311, 140, 'www.99soubao.com', '貌美如花', '买来送给我老公的, 嘻嘻....', 3, 1461305493, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/04-22/5719843a87434.jpg";i:1;s:49:"/Public/upload/goods/2016/04-22/57198456a2514.jpg";i:2;s:49:"/Public/upload/goods/2016/04-22/57198456932b4.jpg";}', 3),
(312, 141, 'www.99soubao.com', '貌美如花', '买来送给我老公的, 嘻嘻....', 5, 1461305493, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/04-22/57198a178e5c1.jpg";i:1;s:49:"/Public/upload/goods/2016/04-22/57198a2ccddd3.jpg";i:2;s:49:"/Public/upload/goods/2016/04-22/57198a2cbc726.jpg";}', 5),
(313, 142, 'www.99soubao.com', '貌美如花', '买来送给我老公的, 嘻嘻....', 0, 1461305493, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/04-22/57199141d9c05.jpg";i:1;s:49:"/Public/upload/goods/2016/04-22/57199164c3a67.jpg";i:2;s:49:"/Public/upload/goods/2016/04-22/57199164b5284.jpg";}', 3),
(314, 143, 'www.99soubao.com', '貌美如花', '买来送给我老公的, 嘻嘻....', 3, 1461305493, '127.0.0.1', 1, 0, 1, 'a:3:{i:0;s:49:"/Public/upload/goods/2016/04-22/5719923fb2708.jpg";i:1;s:49:"/Public/upload/goods/2016/04-22/57199253bf198.jpg";i:2;s:49:"/Public/upload/goods/2016/04-22/57199253abf3d.jpg";}', 0),
(315, 140, 'www.99soubao.com', '貌美如花', '第二次光顾了, 不错 ,不错 ....', 1, 1461305549, '127.0.0.1', 1, 0, 1, NULL, 5),
(316, 141, 'www.99soubao.com', '貌美如花', '第二次光顾了, 不错 ,不错 ....', 5, 1461305549, '127.0.0.1', 1, 0, 1, NULL, 2),
(317, 142, 'www.99soubao.com', '貌美如花', '第二次光顾了, 不错 ,不错 ....', 5, 1461305549, '127.0.0.1', 1, 0, 1, NULL, 5),
(318, 143, 'www.99soubao.com', '貌美如花', '第二次光顾了, 不错 ,不错 ....', 4, 1461305549, '127.0.0.1', 1, 0, 1, NULL, 0),
(319, 140, 'www.99soubao.com', '淑女', '买回来用了一段时间, 真心感觉不错  ....', 4, 1461305593, '127.0.0.1', 1, 0, 1, NULL, 4),
(320, 141, 'www.99soubao.com', '淑女', '买回来用了一段时间, 真心感觉不错  ....', 5, 1461305593, '127.0.0.1', 1, 0, 1, NULL, 0),
(321, 142, 'www.99soubao.com', '淑女', '买回来用了一段时间, 真心感觉不错  ....', 3, 1461305593, '127.0.0.1', 1, 0, 1, NULL, 4),
(322, 143, 'www.99soubao.com', '淑女', '买回来用了一段时间, 真心感觉不错  ....', 5, 1461305593, '127.0.0.1', 1, 0, 1, NULL, 5),
(324, 119, 'dfgdfg@163.com', 'hello', '', 3, 1474537525, '192.168.0.103', 0, 0, 1, 's:0:"";', 3),
(325, 119, 'dfgdfg@163.com', 'hello', '', 4, 1474537731, '192.168.0.103', 0, 0, 1, 's:0:"";', 4),
(326, 104, 'dfgdfg@163.com', 'hello', '', 4, 1474595970, '192.168.0.101', 0, 0, 1, 's:0:"";', 4),
(342, 1, '', 'admin', 'an 安', 0, 1483057671, '', 1, 330, 1, NULL, NULL),
(340, 1, '', 'admin', '儿子', 0, 1482388248, '', 1, 1, 1, NULL, NULL),
(339, 1, '', 'admin', '玉帝', 0, 1482388232, '', 1, 1, 1, NULL, NULL),
(334, 1, '', 'admin', '再回复', 0, 1482379464, '', 1, 333, 1, NULL, NULL),
(335, 1, '', 'admin', '7是', 0, 1482379562, '', 1, 334, 1, NULL, NULL),
(336, 54, '', 'admin', '54', 0, 1482386830, '', 1, 149, 1, NULL, NULL),
(337, 54, '', 'admin', '凤飞飞', 0, 1482387027, '', 1, 149, 1, NULL, NULL),
(338, 1, '', 'admin', '86', 0, 1482387232, '', 1, 335, 1, NULL, NULL);

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
(2, '<p>我校辅导员赴天津观摩全国辅导员职业技能大赛第一赛区复赛</p>', ''),
(4, '<p>南昌腾速科技有限公司关于春节放假通知7777777777777</p>', ''),
(6, '<p>我校辅导员赴天津观摩全国辅导员职业技能大赛第一赛区复赛</p>', ''),
(7, '<p>我校举办高校教师教学发展主题培训会</p>', ''),
(11, '<p>测试文档标题</p>', ''),
(8, '<p>市场陈列</p>', ''),
(12, '<p>测试文章的添加功能</p>', ''),
(13, '<p>古墓丽影。</p>', '心还在吗？'),
(32, '内容', NULL),
(36, '<p>标签测试<img style="width:300px;" src="/uploads/editor/20170224/697d5ac1634235063186b9e3a6a3b0b3.jpg" _src="/uploads/editor/20170224/697d5ac1634235063186b9e3a6a3b0b3.jpg"/></p><p style="text-align: center; "><strong>红色家族</strong></p><p style="text-align: center; "><strong><img src="http://diyijia.ruikesoft.com/uploads/editor/20170224/d42dd1be8e384b2915d9a6eba4aca422.jpg" _src="http://diyijia.ruikesoft.com/uploads/editor/20170224/d42dd1be8e384b2915d9a6eba4aca422.jpg"/></strong></p>', '标签，分子，阿斯顿发，分红');
INSERT INTO `ruike_content_detail` (`doc_id`, `content`, `tags`) VALUES
(37, '<section data-id="85557" class="135editor" style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; color: rgb(62, 62, 62); white-space: normal; border: 0px none; font-size: 14px; font-family: 微软雅黑; word-wrap: break-word !important; background-color: rgb(255, 255, 255);"><section style="margin: 100px 0px 0px; padding: 10px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; line-height: 24px; border: 3px solid rgb(128, 177, 53); border-radius: 8px;"><section data-style="color:rgb(33,33,33);text-align:center;" style="margin: 0px; padding: 10px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; color: inherit;"><p style="margin-top: -123px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; white-space: pre-wrap; color: inherit; text-align: center; word-wrap: break-word !important;"><img src="http://cdn.xykj1012.cn/static/upload/avatar/image/20161207/1481090137700275.jpg" title="1481090137700275.jpg" alt="300000933095129357611866281_950.jpg"/></p><section class="135brush" style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;"><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">咳~咳~~咳~~~<br style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;"/></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">没娃的，安安静静的坐看晒娃风云。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">有娃的，轰轰烈烈的加入比拼大军。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">参赛的，热热闹闹的寻求亲朋好友。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">投票的，高高兴兴的投出宝贵一票。</p></section></section><section style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; border: 0px none rgb(128, 177, 53); clear: both; color: inherit;"><section data-width="6px" style="margin: 0px 0px -3px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; color: rgb(255, 255, 255); float: right; width: 6px; border-radius: 50%; box-shadow: rgb(117, 117, 117) 0px 0px 5px; border-color: rgb(172, 196, 136); height: 6px !important; background-color: rgb(128, 177, 53);"></section><section data-width="6px" style="margin: 0px 0px -2px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; color: rgb(255, 255, 255); width: 6px; border-radius: 50%; box-shadow: rgb(117, 117, 117) 0px 0px 5px; border-color: rgb(172, 196, 136); height: 6px !important; background-color: rgb(128, 177, 53);"></section></section></section></section><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; line-height: 25.6000003814697px; widows: auto; box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgb(255, 255, 255);"><br/></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; line-height: 25.6000003814697px; box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgb(255, 255, 255);"><br/></p><section style="margin: 0px; padding: 0px; max-width: 100%; color: rgb(62, 62, 62); font-family: &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; line-height: 25.6000003814697px; white-space: normal; widows: auto; box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgb(255, 255, 255);"><section class="wxqq-borderTopColor wxqq-borderRightColor wxqq-borderBottomColor wxqq-borderLeftColor" style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; border: 1px solid rgb(129, 209, 171); text-align: center;"><section class="wxqq-borderTopColor wxqq-borderRightColor wxqq-borderBottomColor wxqq-borderLeftColor" style="margin: 1em auto; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; border-radius: 6em; border: 0.1em solid rgb(129, 209, 171); width: 12em; height: 12em;"><section class="wxqq-bg" style="margin: 0.4em auto; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; border-radius: 5.5em; width: 11em; height: 11em; display: table; max-height: 11em; background-color: rgb(129, 209, 171);"><section style="margin: 1em; padding: 1em; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: white; line-height: 1.2em; font-size: 1.5em; vertical-align: middle; display: table-cell; max-height: 11em;"><span style="margin: 0px; padding: 0px; max-width: 100%; color: rgb(0, 0, 0); box-sizing: border-box !important; word-wrap: break-word !important;"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">终极拉票</strong></span><br style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"/></section></section></section><section class="wxqq-bg" style="margin: 1em 1em 2em; padding: 0.5em 1em; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; border-radius: 1em; color: white; line-height: 1.5em; font-size: 1em; display: inline-block; background-color: rgb(129, 209, 171);"><span style="color: rgb(0, 0, 0);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="color: rgb(0, 0, 0); margin: 0px; padding: 0px; max-width: 100%; font-size: 24px; box-sizing: border-box !important; word-wrap: break-word !important;">秘籍</span></strong></span></section></section><section class="wxqq-borderTopColor wxqq-borderRightColor wxqq-borderBottomColor wxqq-borderLeftColor" style="margin: 0px; padding: 1em; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(129, 209, 171); text-align: center; line-height: 1.4em; font-size: 1em;"><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(255, 0, 0);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 20px;">没有你不会用的！！</span></strong></span></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(255, 0, 0);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 20px;">只有你想不到的！！</span></strong></span><strong class="wxqq-color" style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; line-height: 28px; font-family: 微软雅黑; text-align: justify; white-space: normal; color: rgb(129, 209, 171);"></strong></p></section></section><p><br/></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; line-height: 25.6000003814697px; widows: auto; box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgb(255, 255, 255);"><br/></p><section class="tn-Powered-by-XIUMI" style="margin: 0px; padding: 0px; max-width: 100%; color: rgb(62, 62, 62); font-family: &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; line-height: 25.6000003814697px; white-space: normal; widows: auto; box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgb(255, 255, 255);"><section class="tn-Powered-by-XIUMI" style="margin: 0px; padding: 0px 2px 2px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; display: inline-block; border-bottom-width: 2px; border-bottom-style: solid; line-height: 1; font-size: 21px; font-family: inherit; font-weight: inherit; text-align: center; text-decoration: inherit; color: rgb(255, 255, 255); border-color: rgb(71, 193, 168);"><section class="tn-Powered-by-XIUMI" style="margin: 0px; padding: 0.3em 0.4em; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; display: inline-block; min-width: 1.8em; min-height: 1.6em; border-radius: 80% 100% 90% 20%; line-height: 1; font-size: 27.5625px; font-family: inherit; background-color: rgb(71, 193, 168);"><section class="tn-Powered-by-XIUMI" style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;">1</section></section><span class="tn-Powered-by-XIUMI" style="margin: 0px 0px 0px 0.4em; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; display: inline-block; color: rgb(0, 112, 192); line-height: 1.4; font-size: 1em;"><span class="tn-Powered-by-XIUMI" style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; font-size: 1em; font-family: inherit; font-weight: bolder; text-align: inherit; text-decoration: inherit; color: rgb(71, 193, 168);"><section class="tn-Powered-by-XIUMI" style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;">每个ID每天可投3票</section></span></span></section></section><blockquote class="wxqq-borderTopColor wxqq-borderRightColor wxqq-borderBottomColor wxqq-borderLeftColor" style="margin: 0px; padding: 0px 0px 0px 10px; max-width: 100%; border-left-width: 3px; border-left-style: solid; border-left-color: rgb(219, 219, 219); color: rgb(62, 62, 62); font-family: &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; line-height: 25.6000003814697px; white-space: normal; widows: auto; box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgb(255, 255, 255);"><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">so？你懂得了，亲朋好友多多益善，认识的不认识的，只要有微信的就都拉来投票啊！<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(255, 0, 0);"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 18px;"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">3票就好</strong></span>！！！</span></p></blockquote><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; line-height: 25.6000003814697px; widows: auto; box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgb(255, 255, 255);"><br style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"/></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; line-height: 25.6000003814697px; widows: auto; box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgb(255, 255, 255);"><br/></p><section class="tn-Powered-by-XIUMI" style="margin: 0px; padding: 0px; max-width: 100%; color: rgb(62, 62, 62); font-family: &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; line-height: 25.6000003814697px; white-space: normal; widows: auto; box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgb(255, 255, 255);"><section class="tn-Powered-by-XIUMI" style="margin: 0px; padding: 0px 2px 2px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; display: inline-block; border-bottom-width: 2px; border-bottom-style: solid; line-height: 1; font-size: 21px; font-family: inherit; font-weight: inherit; text-align: center; text-decoration: inherit; color: rgb(255, 255, 255); border-color: rgb(71, 193, 168);"><section class="tn-Powered-by-XIUMI" style="margin: 0px; padding: 0.3em 0.4em; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; display: inline-block; min-width: 1.8em; min-height: 1.6em; border-radius: 80% 100% 90% 20%; line-height: 1; font-size: 27.5625px; font-family: inherit; background-color: rgb(71, 193, 168);"><section class="tn-Powered-by-XIUMI" style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;">2</section></section><span class="tn-Powered-by-XIUMI" style="margin: 0px 0px 0px 0.4em; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; display: inline-block; color: rgb(0, 112, 192); line-height: 1.4; font-size: 1em;"><span class="tn-Powered-by-XIUMI" style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; font-size: 1em; font-family: inherit; font-weight: bolder; text-align: inherit; text-decoration: inherit; color: rgb(71, 193, 168);"><section class="tn-Powered-by-XIUMI" style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;">直接分享萌娃比赛页面</section></span></span></section></section><blockquote class="wxqq-borderTopColor wxqq-borderRightColor wxqq-borderBottomColor wxqq-borderLeftColor" style="margin: 0px; padding: 0px 0px 0px 10px; max-width: 100%; border-left-width: 3px; border-left-style: solid; border-left-color: rgb(219, 219, 219); color: rgb(62, 62, 62); font-family: &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; line-height: 25.6000003814697px; white-space: normal; widows: auto; box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgb(255, 255, 255);"><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">每天发一堆内容给亲朋好友喊着投票，不如直接把自己的主页丢给他们喔，这样他们就可以<strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(255, 0, 0);">一键投票</span></strong>了！</p></blockquote><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; line-height: 25.6000003814697px; widows: auto; box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgb(255, 255, 255);"><br style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"/></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; line-height: 25.6000003814697px; widows: auto; box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgb(255, 255, 255);"><br/></p><section class="tn-Powered-by-XIUMI" style="margin: 0px; padding: 0px; max-width: 100%; color: rgb(62, 62, 62); font-family: &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; line-height: 25.6000003814697px; white-space: normal; widows: auto; box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgb(255, 255, 255);"><section class="tn-Powered-by-XIUMI" style="margin: 0px; padding: 0px 2px 2px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; display: inline-block; border-bottom-width: 2px; border-bottom-style: solid; line-height: 1; font-size: 21px; font-family: inherit; font-weight: inherit; text-align: center; text-decoration: inherit; color: rgb(255, 255, 255); border-color: rgb(71, 193, 168);"><section class="tn-Powered-by-XIUMI" style="margin: 0px; padding: 0.3em 0.4em; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; display: inline-block; min-width: 1.8em; min-height: 1.6em; border-radius: 80% 100% 90% 20%; line-height: 1; font-size: 27.5625px; font-family: inherit; background-color: rgb(71, 193, 168);"><section class="tn-Powered-by-XIUMI" style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;">3</section></section><span class="tn-Powered-by-XIUMI" style="margin: 0px 0px 0px 0.4em; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; display: inline-block; color: rgb(0, 112, 192); line-height: 1.4; font-size: 1em;"><span class="tn-Powered-by-XIUMI" style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; font-size: 1em; font-family: inherit; font-weight: bolder; text-align: inherit; text-decoration: inherit; color: rgb(71, 193, 168);"><section class="tn-Powered-by-XIUMI" style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;">别忘了微信群发</section></span></span></section></section><blockquote class="wxqq-borderTopColor wxqq-borderRightColor wxqq-borderBottomColor wxqq-borderLeftColor" style="margin: 0px; padding: 0px 0px 0px 10px; max-width: 100%; border-left-width: 3px; border-left-style: solid; border-left-color: rgb(219, 219, 219); color: rgb(62, 62, 62); font-family: &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; line-height: 25.6000003814697px; white-space: normal; widows: auto; box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgb(255, 255, 255);"><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">微信的群发功能简直逆天我跟你说！<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 18px; color: rgb(255, 0, 0);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">微信群发</strong></span>，不仅仅是群发消息那么简单，在你第一次群发的同时微信会默认把群组建好！这对拉票而言简直太方便，直接成立了一个投票打卡群有木有？</p></blockquote><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; line-height: 25.6000003814697px; widows: auto; box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgb(255, 255, 255);"><img src="http://cdn.xykj1012.cn/static/upload/avatar/image/20161206/1481007756316449.png" title="1481007756316449.png" alt="1445520781533240.png"/></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; line-height: 25.6000003814697px; widows: auto; box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgb(255, 255, 255);"><br/></p><section class="tn-Powered-by-XIUMI" style="margin: 0px; padding: 0px; max-width: 100%; color: rgb(62, 62, 62); font-family: &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; line-height: 25.6000003814697px; white-space: normal; widows: auto; box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgb(255, 255, 255);"><section class="tn-Powered-by-XIUMI" style="margin: 0px; padding: 0px 2px 2px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; display: inline-block; border-bottom-width: 2px; border-bottom-style: solid; line-height: 1; font-size: 21px; font-family: inherit; font-weight: inherit; text-align: center; text-decoration: inherit; color: rgb(255, 255, 255); border-color: rgb(71, 193, 168);"><section class="tn-Powered-by-XIUMI" style="margin: 0px; padding: 0.3em 0.4em; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; display: inline-block; min-width: 1.8em; min-height: 1.6em; border-radius: 80% 100% 90% 20%; line-height: 1; font-size: 27.5625px; font-family: inherit; background-color: rgb(71, 193, 168);"><section class="tn-Powered-by-XIUMI" style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;">4</section></section><span class="tn-Powered-by-XIUMI" style="margin: 0px 0px 0px 0.4em; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; display: inline-block; color: rgb(0, 112, 192); line-height: 1.4; font-size: 1em;"><span class="tn-Powered-by-XIUMI" style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; font-size: 1em; font-family: inherit; font-weight: bolder; text-align: inherit; text-decoration: inherit; color: rgb(71, 193, 168);"><section class="tn-Powered-by-XIUMI" style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;">QQ群发不能少</section></span></span></section></section><blockquote class="wxqq-borderTopColor wxqq-borderRightColor wxqq-borderBottomColor wxqq-borderLeftColor" style="margin: 0px; padding: 0px 0px 0px 10px; max-width: 100%; border-left-width: 3px; border-left-style: solid; border-left-color: rgb(219, 219, 219); color: rgb(62, 62, 62); font-family: &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; line-height: 25.6000003814697px; white-space: normal; widows: auto; box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgb(255, 255, 255);"><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 18px; color: rgb(255, 0, 0);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">群发先祖：QQ群</strong></span>。话不多说，地球人都知道。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">赶紧建一个群，把七大姑八大姨，好基友，好同事，不管大学同学们，还是小学同学统统拉进去！</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">专业投票100年，拉票从此变得简单。</p></blockquote><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; line-height: 25.6000003814697px; widows: auto; box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgb(255, 255, 255);"><br style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"/></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; line-height: 25.6000003814697px; widows: auto; box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgb(255, 255, 255);"><br/></p><section class="tn-Powered-by-XIUMI" style="margin: 0px; padding: 0px; max-width: 100%; color: rgb(62, 62, 62); font-family: &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; line-height: 25.6000003814697px; white-space: normal; widows: auto; box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgb(255, 255, 255);"><section class="tn-Powered-by-XIUMI" style="margin: 0px; padding: 0px 2px 2px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; display: inline-block; border-bottom-width: 2px; border-bottom-style: solid; line-height: 1; font-size: 21px; font-family: inherit; font-weight: inherit; text-align: center; text-decoration: inherit; color: rgb(255, 255, 255); border-color: rgb(71, 193, 168);"><section class="tn-Powered-by-XIUMI" style="margin: 0px; padding: 0.3em 0.4em; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; display: inline-block; min-width: 1.8em; min-height: 1.6em; border-radius: 80% 100% 90% 20%; line-height: 1; font-size: 27.5625px; font-family: inherit; background-color: rgb(71, 193, 168);"><section class="tn-Powered-by-XIUMI" style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;">5</section></section><span class="tn-Powered-by-XIUMI" style="margin: 0px 0px 0px 0.4em; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; display: inline-block; color: rgb(0, 112, 192); line-height: 1.4; font-size: 1em;"><span class="tn-Powered-by-XIUMI" style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; font-size: 1em; font-family: inherit; font-weight: bolder; text-align: inherit; text-decoration: inherit; color: rgb(71, 193, 168);"><section class="tn-Powered-by-XIUMI" style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;">请顺便捎上QQ空间</section></span></span></section></section><blockquote class="wxqq-borderTopColor wxqq-borderRightColor wxqq-borderBottomColor wxqq-borderLeftColor" style="margin: 0px; padding: 0px 0px 0px 10px; max-width: 100%; border-left-width: 3px; border-left-style: solid; border-left-color: rgb(219, 219, 219); color: rgb(62, 62, 62); font-family: &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; line-height: 25.6000003814697px; white-space: normal; widows: auto; box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgb(255, 255, 255);"><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">反正是个<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 18px; color: rgb(255, 0, 0);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">分享</strong></span>，复制活动页面链接捎上QQ空间一起怀个旧。一大波投票正在前来的路上！！！</p></blockquote><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; line-height: 25.6000003814697px; widows: auto; box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgb(255, 255, 255);"><br style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"/></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; line-height: 25.6000003814697px; widows: auto; box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgb(255, 255, 255);"><br/></p><section class="tn-Powered-by-XIUMI" style="margin: 0px; padding: 0px; max-width: 100%; color: rgb(62, 62, 62); font-family: &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; line-height: 25.6000003814697px; white-space: normal; widows: auto; box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgb(255, 255, 255);"><section class="tn-Powered-by-XIUMI" style="margin: 0px; padding: 0px 2px 2px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; display: inline-block; border-bottom-width: 2px; border-bottom-style: solid; line-height: 1; font-size: 21px; font-family: inherit; font-weight: inherit; text-align: center; text-decoration: inherit; color: rgb(255, 255, 255); border-color: rgb(71, 193, 168);"><section class="tn-Powered-by-XIUMI" style="margin: 0px; padding: 0.3em 0.4em; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; display: inline-block; min-width: 1.8em; min-height: 1.6em; border-radius: 80% 100% 90% 20%; line-height: 1; font-size: 27.5625px; font-family: inherit; background-color: rgb(71, 193, 168);"><section class="tn-Powered-by-XIUMI" style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;">6</section></section><span class="tn-Powered-by-XIUMI" style="margin: 0px 0px 0px 0.4em; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; display: inline-block; color: rgb(0, 112, 192); line-height: 1.4; font-size: 1em;"><span class="tn-Powered-by-XIUMI" style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; font-size: 1em; font-family: inherit; font-weight: bolder; text-align: inherit; text-decoration: inherit; color: rgb(71, 193, 168);"><section class="tn-Powered-by-XIUMI" style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;">微·博怎能错过热闹</section></span></span></section></section><blockquote class="wxqq-borderTopColor wxqq-borderRightColor wxqq-borderBottomColor wxqq-borderLeftColor" style="margin: 0px; padding: 0px 0px 0px 10px; max-width: 100%; border-left-width: 3px; border-left-style: solid; border-left-color: rgb(219, 219, 219); color: rgb(62, 62, 62); font-family: &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; line-height: 25.6000003814697px; white-space: normal; widows: auto; box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgb(255, 255, 255);"><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">拉票类的活动怎可放过微·博？简直太方便了好吗！宝爸宝妈还不快行动起来！！！</p></blockquote><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; line-height: 25.6000003814697px; widows: auto; box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgb(255, 255, 255);"><br style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"/></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; line-height: 25.6000003814697px; widows: auto; box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgb(255, 255, 255);"><br/></p><section class="tn-Powered-by-XIUMI" style="margin: 0px; padding: 0px; max-width: 100%; color: rgb(62, 62, 62); font-family: &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; line-height: 25.6000003814697px; white-space: normal; widows: auto; box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgb(255, 255, 255);"><section class="tn-Powered-by-XIUMI" style="margin: 0px; padding: 0px 2px 2px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; display: inline-block; border-bottom-width: 2px; border-bottom-style: solid; line-height: 1; font-size: 21px; font-family: inherit; font-weight: inherit; text-align: center; text-decoration: inherit; color: rgb(255, 255, 255); border-color: rgb(71, 193, 168);"><section class="tn-Powered-by-XIUMI" style="margin: 0px; padding: 0.3em 0.4em; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; display: inline-block; min-width: 1.8em; min-height: 1.6em; border-radius: 80% 100% 90% 20%; line-height: 1; font-size: 27.5625px; font-family: inherit; background-color: rgb(71, 193, 168);"><section class="tn-Powered-by-XIUMI" style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;">7</section></section><span class="tn-Powered-by-XIUMI" style="margin: 0px 0px 0px 0.4em; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; display: inline-block; color: rgb(0, 112, 192); line-height: 1.4; font-size: 1em;"><span class="tn-Powered-by-XIUMI" style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; font-size: 1em; font-family: inherit; font-weight: bolder; text-align: inherit; text-decoration: inherit; color: rgb(71, 193, 168);"><section class="tn-Powered-by-XIUMI" style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;">若害羞请单发</section></span></span></section></section><blockquote class="wxqq-borderTopColor wxqq-borderRightColor wxqq-borderBottomColor wxqq-borderLeftColor" style="margin: 0px; padding: 0px 0px 0px 10px; max-width: 100%; border-left-width: 3px; border-left-style: solid; border-left-color: rgb(219, 219, 219); color: rgb(62, 62, 62); font-family: &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; line-height: 25.6000003814697px; white-space: normal; widows: auto; box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgb(255, 255, 255);"><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">不愿刷屏？没关系！</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">朋友不多？没关系！</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">脸皮太薄？没关系！</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">只要你有铁杆朋友两三，足矣！</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">直接将宝宝的参赛页面<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 18px; color: rgb(255, 0, 0);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">单独发给TA们</strong></span>吧！萌宝大赛，图的就是个热闹！！</p></blockquote><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; line-height: 25.6000003814697px; widows: auto; box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgb(255, 255, 255);"><br/></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; line-height: 25.6000003814697px; widows: auto; box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgb(255, 255, 255);"><br/></p><section class="tn-Powered-by-XIUMI" style="margin: 0px; padding: 0px; max-width: 100%; color: rgb(62, 62, 62); font-family: &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; line-height: 25.6000003814697px; white-space: normal; widows: auto; box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgb(255, 255, 255);"><section class="tn-Powered-by-XIUMI" style="margin: 0px; padding: 0px 2px 2px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; display: inline-block; border-bottom-width: 2px; border-bottom-style: solid; line-height: 1; font-size: 21px; font-family: inherit; font-weight: inherit; text-align: center; text-decoration: inherit; color: rgb(255, 255, 255); border-color: rgb(71, 193, 168);"><section class="tn-Powered-by-XIUMI" style="margin: 0px; padding: 0.3em 0.4em; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; display: inline-block; min-width: 1.8em; min-height: 1.6em; border-radius: 80% 100% 90% 20%; line-height: 1; font-size: 27.5625px; font-family: inherit; background-color: rgb(71, 193, 168);"><section class="tn-Powered-by-XIUMI" style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;">8</section></section><span class="tn-Powered-by-XIUMI" style="margin: 0px 0px 0px 0.4em; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; display: inline-block; color: rgb(0, 112, 192); line-height: 1.4; font-size: 1em;"><span class="tn-Powered-by-XIUMI" style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; font-size: 1em; font-family: inherit; font-weight: bolder; text-align: inherit; text-decoration: inherit; color: rgb(71, 193, 168);"><section class="tn-Powered-by-XIUMI" style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;">组建专属的亲友助威团</section></span></span></section></section><blockquote class="wxqq-borderTopColor wxqq-borderRightColor wxqq-borderBottomColor wxqq-borderLeftColor" style="margin: 0px; padding: 0px 0px 0px 10px; max-width: 100%; border-left-width: 3px; border-left-style: solid; border-left-color: rgb(219, 219, 219); color: rgb(62, 62, 62); font-family: &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; line-height: 25.6000003814697px; white-space: normal; widows: auto; box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgb(255, 255, 255);"><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">我们可以把所有朋友都拉进助威团，绝不浪费每天一次的投票机会！还能可以和老朋友聚一聚，聊一聊！让大家帮你去拉票</p></blockquote><blockquote class="wxqq-borderTopColor wxqq-borderRightColor wxqq-borderBottomColor wxqq-borderLeftColor" style="margin: 0px; padding: 0px 0px 0px 10px; max-width: 100%; border-left-width: 3px; border-left-style: solid; border-left-color: rgb(219, 219, 219); color: rgb(62, 62, 62); font-family: &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; line-height: 25.6000003814697px; white-space: normal; widows: auto; box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgb(255, 255, 255);"><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">这简直就是懒人拉票攻略啊，或者直接分享此篇文章给亲戚朋友，人人变身拉票高手，这样一来，支持你家宝贝的人啊，那简直是简直了哈哈哈，做梦都笑啊~~</p></blockquote><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; line-height: 25.6000003814697px; widows: auto; box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgb(255, 255, 255);"><br/></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; line-height: 25.6000003814697px; widows: auto; box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgb(255, 255, 255);"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(112, 48, 160);">......天高任鸟飞、海阔凭鱼跃！各位妈妈们为了宝宝大胆发挥你们的想象力吧！</span></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; line-height: 25.6000003814697px; widows: auto; box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgb(255, 255, 255);"><br style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"/></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; line-height: 25.6000003814697px; widows: auto; box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgb(255, 255, 255);"><br/></p><section class="tn-Powered-by-XIUMI" style="margin: 0px; padding: 0px; max-width: 100%; color: rgb(62, 62, 62); font-family: &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; line-height: 25.6000003814697px; white-space: normal; widows: auto; box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgb(255, 255, 255);"><section class="tn-Powered-by-XIUMI" style="margin: 0px; padding: 0px 2px 2px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; display: inline-block; border-bottom-width: 2px; border-bottom-style: solid; line-height: 1; font-size: 21px; font-family: inherit; font-weight: inherit; text-align: center; text-decoration: inherit; color: rgb(255, 255, 255); border-color: rgb(71, 193, 168);"><section class="tn-Powered-by-XIUMI" style="margin: 0px; padding: 0.3em 0.4em; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; display: inline-block; min-width: 1.8em; min-height: 1.6em; border-radius: 80% 100% 90% 20%; line-height: 1; font-size: 27.5625px; font-family: inherit; background-color: rgb(71, 193, 168);"><section class="tn-Powered-by-XIUMI" style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;">9</section></section><span class="tn-Powered-by-XIUMI" style="margin: 0px 0px 0px 0.4em; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; display: inline-block; color: rgb(0, 112, 192); line-height: 1.4; font-size: 1em;"><span class="tn-Powered-by-XIUMI" style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important; font-size: 1em; font-family: inherit; font-weight: bolder; text-align: inherit; text-decoration: inherit; color: rgb(71, 193, 168);"><section class="tn-Powered-by-XIUMI" style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;">参与报名有奖品吗？</section></span></span></section></section><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; line-height: 25.6000003814697px; widows: auto; box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgb(255, 255, 255);">答案：有！</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; line-height: 25.6000003814697px; widows: auto; box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgb(255, 255, 255);">您只要有效报名后</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; line-height: 25.6000003814697px; widows: auto; box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgb(255, 255, 255);">添加客服微信<strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(192, 0, 0); font-size: 20px;"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; text-align: center; font-size: 18px;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(151, 72, 6);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(192, 0, 0); font-size: 20px;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(151, 72, 6);"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(255, 0, 0);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(192, 0, 0);"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(151, 72, 6);"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(255, 0, 0);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(192, 0, 0); font-size: 20px;"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 15px;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 20px;"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 16.470588684082px;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(128, 0, 128);"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 20px;"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; white-space: normal;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(255, 0, 0); background-color: rgb(255, 255, 0);"><strong style="margin: 0px; padding: 0px; max-width: 100%; color: rgb(62, 62, 62); font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; line-height: 25.6000003814697px; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgb(255, 255, 255);"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(255, 0, 0); background-color: rgb(255, 255, 0);"><strong style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(128, 0, 128);"><span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; line-height: 45px; font-size: 20px;">uyg5852</span></span></span></strong></span></strong></span></strong></span></span></span></strong></span></strong></span></strong></span></span></strong></span></span></strong></span></strong></span></strong>所有报名者可获得</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; line-height: 25.6000003814697px; widows: auto; box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgb(255, 255, 255);"><strong>由山西格调准备的宝宝祝福<span style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; color: rgb(255, 0, 0);">红包</span>一个</strong></p><p><br/></p>', '刘德华，周润发，李嘉欣');
INSERT INTO `ruike_content_detail` (`doc_id`, `content`, `tags`) VALUES
(38, '<p style="text-align: center; "><img src="http://ruikecmssvn.test.com/uploads/editor/20161223/f138250260499c6ab429ed22fb4a9a73.jpg" _src="http://ruikecmssvn.test.com/uploads/editor/20161223/f138250260499c6ab429ed22fb4a9a73.jpg"/>&nbsp; <span style="background-color: rgb(112, 48, 160);color:#ff0000">人生</span></p>', '天使，魔鬼'),
(1, '<p style="text-align: center; "><img src="http://ruikecmssvn.test.com/uploads/editor/20161223/f138250260499c6ab429ed22fb4a9a73.jpg" _src="http://ruikecmssvn.test.com/uploads/editor/20161223/f138250260499c6ab429ed22fb4a9a73.jpg"/>&nbsp; <span style="background-color: rgb(112, 48, 160);color:#ff0000">人生</span></p>', '天使，魔鬼'),
(40, '<p>冷雨</p><p><img src="http://ruikecmssvn.test.com/uploads/editor/20161223/327976e7476591ddb53932cd5d806a6c.jpg" _src="http://ruikecmssvn.test.com/uploads/editor/20161223/327976e7476591ddb53932cd5d806a6c.jpg"/></p>', '刘德华，周润发，李嘉欣'),
(41, '<p>谁才是</p>', '内柔，民主，共和'),
(42, '<p style="text-align: center;"><span style="background-color: rgb(112, 48, 160);">他圣大非省古典风格告诉对方855656756</span><img src="http://ruikecmssvn.test.com/uploads/editor/20161225/9e0bfffcfaa9fe5a00655aa398dacbbb.jpg" _src="http://ruikecmssvn.test.com/uploads/editor/20161225/9e0bfffcfaa9fe5a00655aa398dacbbb.jpg"/></p>', '刘德华，周润发，李嘉欣'),
(15, '<p><img style="width:300px;" src="/uploads/editor/20170224/551b956af97b916c363d2392d4c7dabb.jpg" _src="/uploads/editor/20170224/551b956af97b916c363d2392d4c7dabb.jpg"/></p><p><br/></p><p><br/></p><p><br/></p><p><img style="width:300px;" src="/uploads/editor/20170224/70f0699a27215d12a6e813b3ef1d05c2.jpg" _src="/uploads/editor/20170224/70f0699a27215d12a6e813b3ef1d05c2.jpg"/></p>', ''),
(47, '<p><span style="color: rgb(0, 0, 0); font-family: "Microsoft Yahei", Helvetica, sans-serif; line-height: 28px; text-indent: 32px; white-space: normal;">本周四在新闻发布会上，IMF发言人Gerry Rice重申了IMF此前对人民币汇率的评价，称人民币“与基本面大体一致”。Rice此次主要提到希腊债务问题，称IMF希望充分讨论希腊的经济改革与债务重组</span></p><p><span style="color: rgb(0, 0, 0); font-family: "Microsoft Yahei", Helvetica, sans-serif; line-height: 28px; text-indent: 32px; white-space: normal;"><img src="http://diyijia.ruikesoft.com/uploads/editor/20170224/8faababaabda1b3bac61ee94cfdbb328.jpg" _src="http://diyijia.ruikesoft.com/user/content/adddocument/type/php//uploads/editor/20170224/8faababaabda1b3bac61ee94cfdbb328.jpg"/></span></p>', '刘德华，周润发，李嘉欣'),
(28, '<p><br/><img style="width:350px;" src="http://diyijia.ruikesoft.com/uploads/editor/20170303/5b74d614d06af50991128a2d42ba7370.jpeg" _src="http://diyijia.ruikesoft.com/uploads/editor/20170303/5b74d614d06af50991128a2d42ba7370.jpeg"/></p>', '吉田'),
(27, '<p><img style="width:350px;" src="http://diyijia.ruikesoft.com/uploads/editor/20170303/1c6368683f64806d327019c5bfb271b2.jpg" _src="http://diyijia.ruikesoft.com/uploads/editor/20170303/1c6368683f64806d327019c5bfb271b2.jpg"/></p>', '晕车'),
(26, '<p><img style="width:350px;" src="http://diyijia.ruikesoft.com/uploads/editor/20170303/cc3f8a25431b0c10b0ee18705a4974e5.jpg" _src="http://diyijia.ruikesoft.com/uploads/editor/20170303/cc3f8a25431b0c10b0ee18705a4974e5.jpg"/></p>', '刘德华，周润发，李嘉欣'),
(25, '<p><img style="width:340px;" src="http://diyijia.ruikesoft.com/uploads/editor/20170303/d7c87cdf897b8da1db8128fb9a7fe5b2.jpg" _src="http://diyijia.ruikesoft.com/uploads/editor/20170303/d7c87cdf897b8da1db8128fb9a7fe5b2.jpg"/></p>', '刘德华，周润发，李嘉欣'),
(24, '<p><img style="width:350px;" src="http://diyijia.ruikesoft.com/uploads/editor/20170303/42d4111046de51790cf143bb0465cf01.jpg" _src="http://diyijia.ruikesoft.com/uploads/editor/20170303/42d4111046de51790cf143bb0465cf01.jpg"/></p>', '刘德华，周润发，李嘉欣，杨恭如'),
(23, '<p><span style="color: rgb(115, 115, 115); font-family: "Microsoft YaHei", "Open Sans", sans-serif; font-size: 12.25px; white-space: normal;">乌龟就是王八</span></p><p><span style="color: rgb(115, 115, 115); font-family: "Microsoft YaHei", "Open Sans", sans-serif; font-size: 12.25px; white-space: normal;"><img style="width:350px;" src="http://diyijia.ruikesoft.com/uploads/editor/20170303/e0956d09fa7d837c6f553093aab80018.jpg" _src="http://diyijia.ruikesoft.com/uploads/editor/20170303/e0956d09fa7d837c6f553093aab80018.jpg"/></span></p>', '刘德华，周润发，李嘉欣'),
(22, '<p><img style="width:350px;" src="http://diyijia.ruikesoft.com/uploads/editor/20170303/2e3c0f9cd3f7a842b3d2ec9104883668.jpg" _src="http://diyijia.ruikesoft.com/uploads/editor/20170303/2e3c0f9cd3f7a842b3d2ec9104883668.jpg"/></p>', '标签，蛤蟆，乌龟，王八'),
(21, '<p><img style="width:340px;" src="http://diyijia.ruikesoft.com/uploads/editor/20170303/a5176d3e8cd746f4e814427421bf6901.jpg" _src="http://diyijia.ruikesoft.com/uploads/editor/20170303/a5176d3e8cd746f4e814427421bf6901.jpg"/></p>', '里万'),
(18, '<p><img style="width:340px;" src="http://diyijia.ruikesoft.com/uploads/editor/20170307/cfa26ee692ddf53292d072b8d79eca58.jpg" _src="http://diyijia.ruikesoft.com/uploads/editor/20170307/cfa26ee692ddf53292d072b8d79eca58.jpg"/></p><p style="text-align: center;"><span arial="" font-size:="" white-space:="" background-color:="" style="background-color: rgb(0, 0, 0);color:#ffff00">靠，这种男人谁做你老婆得倒霉</span></p>', ''),
(35, '<div class="rich_media_inner"><div id="page-content"><div id="img-content" class="rich_media_area_primary"><div class="rich_media_meta_list"><div id="js_profile_qrcode" class="profile_container" style="display:none;"><div class="profile_inner"><strong class="profile_nickname">数码流量精灵</strong> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<img class="profile_avatar" id="js_profile_qrcode_img" src alt=""/><p class="profile_meta"><label class="profile_meta_label">微信号</label><span class="profile_meta_value"></span></p><p class="profile_meta"><label class="profile_meta_label">功能介绍</label><span class="profile_meta_value">“流量一站式”服务，带您任性玩流量！为您提供最给力的流量优惠活动，最便捷的流量订购通道，最详细的流量产品介绍！有流量,才有派头!</span></p></div><span class="profile_arrow_wrp" id="js_profile_arrow_wrp"> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<em class="profile_arrow arrow_out"></em> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<em class="profile_arrow arrow_in"></em> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span></div></div><div class="rich_media_content " id="js_content"><p style="max-width: 100%; box-sizing: border-box; min-height: 1em; white-space: normal; line-height: 25.6px; color: rgb(65, 65, 66); text-align: center; word-wrap: break-word !important; background-color: rgb(255, 255, 255);"><img data-type="gif" data-ratio="0.6600719424460432" data-w="" data-src="http://mmbiz.qpic.cn/mmbiz/4PvNNj7B9Ix8PqzRLNmY4Z3wXpQibicZfQ0U8UibydXl97jQLEI3T2qhdKbS1Sia90kXM5zd5t2vfmyJvtoBuDs4Tw/0?wx_fmt=gif" style="box-sizing: border-box !important; word-wrap: break-word !important; visibility: visible !important; width: auto !important; height: auto !important;" _width="auto" src="http://mmbiz.qpic.cn/mmbiz/4PvNNj7B9Ix8PqzRLNmY4Z3wXpQibicZfQ0U8UibydXl97jQLEI3T2qhdKbS1Sia90kXM5zd5t2vfmyJvtoBuDs4Tw/0?wx_fmt=gif&tp=webp&wxfrom=5&wx_lazy=1" class=" __bg_gif" data-order="0" data-fail="0"/></p><p style="max-width: 100%; box-sizing: border-box; min-height: 1em; white-space: normal; line-height: 25.6px; color: rgb(65, 65, 66); text-align: center; word-wrap: break-word !important; background-color: rgb(255, 255, 255);"><strong style="max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">听说，每月大家都是这样的：</strong></p><p style="max-width: 100%; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); line-height: 25.6px; box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgb(255, 255, 255);"><br style="max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"/></p><p style="max-width: 100%; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); line-height: 25.6px; box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgb(255, 255, 255);"><br style="max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"/></p><p></p><section style="max-width: 100%; box-sizing: border-box; line-height: 25.6px; white-space: normal; color: rgb(65, 65, 66); text-align: center; word-wrap: break-word !important; background-color: rgb(255, 255, 255);"><span style="max-width: 100%; color: rgb(255, 0, 0); box-sizing: border-box !important; word-wrap: break-word !important;">月初：啊哈哈，我终于有流量了...</span></section><section style="max-width: 100%; box-sizing: border-box; line-height: 25.6px; white-space: normal; color: rgb(65, 65, 66); text-align: center; word-wrap: break-word !important; background-color: rgb(255, 255, 255);"><span style="max-width: 100%; color: rgb(69, 180, 60); box-sizing: border-box !important; word-wrap: break-word !important;">月中：流量快用完啦，不敢玩手机了...</span></section><section style="max-width: 100%; box-sizing: border-box; line-height: 25.6px; white-space: normal; color: rgb(65, 65, 66); text-align: center; word-wrap: break-word !important; background-color: rgb(255, 255, 255);"><span style="max-width: 100%; color: rgb(255, 129, 36); box-sizing: border-box !important; word-wrap: break-word !important;">月末：流量爆灯了，月初啥时候才到啊...</span></section><p></p><p style="max-width: 100%; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); line-height: 25.6px; box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgb(255, 255, 255);"><br style="max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"/></p><p style="max-width: 100%; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); line-height: 25.6px; box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgb(255, 255, 255);"><br style="max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"/></p><p style="max-width: 100%; min-height: 1em; white-space: normal; line-height: 25.6px; color: rgb(65, 65, 66); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgb(255, 255, 255);"><span style="max-width: 100%; font-size: 18px; box-sizing: border-box !important; word-wrap: break-word !important;"><strong style="max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">憋担心，免费领流量啦~~</strong></span></p><p style="max-width: 100%; min-height: 1em; white-space: normal; line-height: 25.6px; color: rgb(65, 65, 66); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgb(255, 255, 255);"><span style="max-width: 100%; font-size: 18px; color: rgb(255, 0, 0); box-sizing: border-box !important; word-wrap: break-word !important;"><strong style="max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">免费、免费、免费</strong></span></p><p style="max-width: 100%; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); line-height: 25.6px; box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgb(255, 255, 255);"><br style="max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"/></p><p style="max-width: 100%; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); line-height: 25.6px; box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgb(255, 255, 255);"><br style="max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"/></p><p></p><section class="" label="Copyright © 2015 Yead All Rights Reserved." style="max-width: 100%; box-sizing: border-box; color: rgb(62, 62, 62); line-height: 25.6px; white-space: normal; word-wrap: break-word !important; background-color: rgb(255, 255, 255);"><p style="max-width: 100%; min-height: 1em; white-space: pre-wrap; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="max-width: 100%; color: rgb(255, 255, 255); font-size: 18px; box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgb(0, 0, 0);">人人都可领取</span></p><p style="max-width: 100%; min-height: 1em; white-space: pre-wrap; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="max-width: 100%; color: rgb(255, 255, 255); font-size: 18px; box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgb(0, 0, 0);">最高8G流量</span></p><p style="max-width: 100%; min-height: 1em; white-space: pre-wrap; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="max-width: 100%; color: rgb(255, 0, 0); font-size: 18px; box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgb(0, 0, 0);">移动-联通-电信</span></p><p style="max-width: 100%; min-height: 1em; white-space: pre-wrap; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="max-width: 100%; color: rgb(255, 0, 0); font-size: 18px; box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgb(0, 0, 0);">三网都可参加本次活动</span></p><section class="" label="Copyright © 2015 Yead All Rights Reserved." style="max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;"><section style="margin-bottom: 10px; padding-top: 20px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;"><section style="max-width: 100%; display: inline-block; transform: rotate(0deg); box-sizing: border-box !important; word-wrap: break-word !important;"><section class="" style="padding-right: 8px; padding-left: 8px; max-width: 100%; box-sizing: border-box; height: 30px; line-height: 30px; display: inline-block; vertical-align: top; text-align: center; color: rgb(255, 255, 255); word-wrap: break-word !important; background-color: rgb(135, 201, 67);">活动规则</section><section class="" style="max-width: 100%; box-sizing: border-box; display: inline-block; vertical-align: top; width: 0px; border-left-width: 10px; border-left-style: solid; border-left-color: rgb(135, 201, 67); font-size: 18px; word-wrap: break-word !important; border-top-width: 15px !important; border-top-style: solid !important; border-top-color: transparent !important; border-bottom-width: 15px !important; border-bottom-style: solid !important; border-bottom-color: transparent !important;"></section><section class="" style="max-width: 100%; box-sizing: border-box; width: 0px; border-right-width: 0.6em; border-right-style: solid; border-right-color: rgb(135, 201, 67); border-top-width: 0.6em; border-top-style: solid; border-top-color: rgb(135, 201, 67); word-wrap: break-word !important; border-left-width: 0.6em !important; border-left-style: solid !important; border-left-color: transparent !important; border-bottom-width: 0.6em !important; border-bottom-style: solid !important; border-bottom-color: transparent !important;"></section></section><section class="" style="margin-top: -60px; margin-left: 1.1em; padding: 10px; max-width: 100%; box-sizing: border-box; border: 1px solid rgb(135, 201, 67); line-height: 30px; word-wrap: break-word !important;"><p class="" style="max-width: 100%; min-height: 1em; white-space: pre-wrap; text-align: right; color: rgb(135, 201, 67); box-sizing: border-box !important; word-wrap: break-word !important;"><br style="max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"/></p><p style="margin-bottom: 5px; padding-right: 10px; padding-left: 10px; max-width: 100%; min-height: 1em; white-space: pre-wrap; border: 0px; font-family: 宋体; font-stretch: inherit; vertical-align: baseline; widows: auto; text-indent: 2em; color: rgb(238, 87, 94); box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgb(248, 247, 245);"><span style="max-width: 100%; border: 0px; font-family: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; color: rgb(0, 0, 0); box-sizing: border-box !important; word-wrap: break-word !important;">1、活动对象：移动、联通、电信3G、4G用户（本次活动不适用于预付费20元卡用户、上网卡用户、流量随意享套餐用户及2G套餐用户）。</span></p><p style="margin-bottom: 5px; padding-right: 10px; padding-left: 10px; max-width: 100%; min-height: 1em; white-space: pre-wrap; border: 0px; font-family: 宋体; font-stretch: inherit; vertical-align: baseline; widows: auto; text-indent: 2em; color: rgb(238, 87, 94); box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgb(248, 247, 245);"><span style="max-width: 100%; border: 0px; font-family: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; color: rgb(0, 0, 0); box-sizing: border-box !important; word-wrap: break-word !important;">2、同一微信、手机号限领活动流量一次，100%可领取到流量</span></p><p style="margin-bottom: 5px; padding-right: 10px; padding-left: 10px; max-width: 100%; min-height: 1em; white-space: pre-wrap; border: 0px; font-family: 宋体; font-stretch: inherit; vertical-align: baseline; widows: auto; text-indent: 2em; color: rgb(238, 87, 94); box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgb(248, 247, 245);"><span style="max-width: 100%; border: 0px; font-family: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; color: rgb(0, 0, 0); box-sizing: border-box !important; word-wrap: break-word !important;">3、 获赠的全国流量，请以服务商短信为准，如遇延迟可能需要30分钟左右才可到账。</span></p><p style="margin-bottom: 5px; padding-right: 10px; padding-left: 10px; max-width: 100%; min-height: 1em; white-space: pre-wrap; border: 0px; font-family: 宋体; font-stretch: inherit; vertical-align: baseline; widows: auto; text-indent: 2em; color: rgb(238, 87, 94); box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgb(248, 247, 245);"><span style="max-width: 100%; border: 0px; font-family: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; color: rgb(0, 0, 0); box-sizing: border-box !important; word-wrap: break-word !important;">3、 如因用户自身问题（如手机欠费及停机状态等）出现流量不能成功充值的情况，由用户自行负责；</span></p><p style="margin-bottom: 5px; padding-right: 10px; padding-left: 10px; max-width: 100%; min-height: 1em; white-space: pre-wrap; border: 0px; font-family: 宋体; font-stretch: inherit; vertical-align: baseline; widows: auto; text-indent: 2em; color: rgb(238, 87, 94); box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgb(248, 247, 245);"><span style="max-width: 100%; border: 0px; font-family: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; color: rgb(0, 0, 0); box-sizing: border-box !important; word-wrap: break-word !important;">4、 获赠的流量当月账期内有效（后付费用户按自然月，预付费用户按月结日），仅供省内使用，不可跨月、转赠及全国漫游，月底清零。</span></p></section></section></section></section><section class="" data-id="24" style="max-width: 100%; box-sizing: border-box; color: rgb(62, 62, 62); line-height: 25.6px; white-space: normal; border: 0px none; word-wrap: break-word !important; background-color: rgb(255, 255, 255);"><p style="margin: 3px auto; padding: 15px; max-width: 100%; min-height: 1em; white-space: pre-wrap; line-height: 24px; box-shadow: rgb(170, 170, 170) 0px 0px 3px; border: 2px solid rgb(240, 240, 240); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="max-width: 100%; color: rgb(255, 0, 0); font-size: 24px; box-sizing: border-box !important; word-wrap: break-word !important;">领取到的样式截图，<br style="max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"/>请注意查收此信息。</span><span style="max-width: 100%; color: rgb(255, 0, 0); box-sizing: border-box !important; word-wrap: break-word !important;"><br style="max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"/></span><img data-type="gif" data-ratio="0.9099616858237548" data-w="522" width="auto" data-src="http://mmbiz.qpic.cn/mmbiz/kL85twVKlCo6sZPvNbgcQQv2eErQV5CYw2C8OrzyMdK0CgHMEuc7l5dOFacwKU3siaJ29wg0kykuBlTm758lC4Q/0?wx_fmt=gif" style="box-sizing: border-box !important; word-wrap: break-word !important; visibility: visible !important; width: auto !important; height: auto !important;" _width="auto" src="http://mmbiz.qpic.cn/mmbiz/kL85twVKlCo6sZPvNbgcQQv2eErQV5CYw2C8OrzyMdK0CgHMEuc7l5dOFacwKU3siaJ29wg0kykuBlTm758lC4Q/0?wx_fmt=gif&tp=webp&wxfrom=5&wx_lazy=1" class=" __bg_gif" data-order="1" data-fail="0"/></p></section><section class="" data-id="3" style="max-width: 100%; box-sizing: border-box; color: rgb(62, 62, 62); line-height: 25.6px; white-space: normal; border: 0px none; word-wrap: break-word !important; background-color: rgb(255, 255, 255);"><section class="" style="margin: 2px auto; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;"><section style="margin-left: 1em; max-width: 100%; box-sizing: border-box; line-height: 1.4em; word-wrap: break-word !important;"><br/></section></section></section></div></div></div></div>', '标签，分子'),
(14, '<p><img style="width:375px;" src="/uploads/editor/20170224/dc7d46ef1f254e5826d7e728fcc3f2e5.bmp" _src="/uploads/editor/20170224/dc7d46ef1f254e5826d7e728fcc3f2e5.bmp"/></p><p><img style="width:375px;" src="http://diyijia.ruikesoft.com//uploads/editor/20170224/da8cadc6608fd87c4e0a5d208ea52a56.jpg" _src="http://diyijia.ruikesoft.com//uploads/editor/20170224/da8cadc6608fd87c4e0a5d208ea52a56.jpg"/></p><p><img style="width:375px;" src="/uploads/editor/20170224/77c0b06046cf92225ae42fddbd55f728.jpg" _src="/uploads/editor/20170224/77c0b06046cf92225ae42fddbd55f728.jpg"/></p><p><br/></p>', '刘德华，周润发，李嘉欣'),
(19, '<p><img style="width:375px;" src="http://diyijia.ruikesoft.com/uploads/editor/20170331/4296dc71fb7ab5d31bcdf0a39c394a8b.jpg" _src="http://diyijia.ruikesoft.com/uploads/editor/20170331/4296dc71fb7ab5d31bcdf0a39c394a8b.jpg"/></p>', ''),
(16, '<p><img style="width:375px;" src="http://diyijia.ruikesoft.com/uploads/editor/20170331/9b0c768e783f2ff78a494786c7099e2a.jpeg" _src="http://diyijia.ruikesoft.com/uploads/editor/20170331/9b0c768e783f2ff78a494786c7099e2a.jpeg"/></p>', ''),
(17, '<p><img style="width:375px;" src="http://diyijia.ruikesoft.com/uploads/editor/20170331/b2be5945bcb22262005dc080ec75d59f.jpg" _src="http://diyijia.ruikesoft.com/uploads/editor/20170331/b2be5945bcb22262005dc080ec75d59f.jpg"/></p>', '');

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

--
-- 转存表中的数据 `ruike_district`
--

INSERT INTO `ruike_district` (`id`, `name`, `level`, `upid`) VALUES
(1, '北京市', 1, 0),
(2, '天津市', 1, 0),
(3, '河北省', 1, 0),
(4, '山西省', 1, 0),
(5, '内蒙古自治区', 1, 0),
(6, '辽宁省', 1, 0),
(7, '吉林省', 1, 0),
(8, '黑龙江省', 1, 0),
(9, '上海市', 1, 0),
(10, '江苏省', 1, 0),
(11, '浙江省', 1, 0),
(12, '安徽省', 1, 0),
(13, '福建省', 1, 0),
(14, '江西省', 1, 0),
(15, '山东省', 1, 0),
(16, '河南省', 1, 0),
(17, '湖北省', 1, 0),
(18, '湖南省', 1, 0),
(19, '广东省', 1, 0),
(20, '广西壮族自治区', 1, 0),
(21, '海南省', 1, 0),
(22, '重庆市', 1, 0),
(23, '四川省', 1, 0),
(24, '贵州省', 1, 0),
(25, '云南省', 1, 0),
(26, '西藏自治区', 1, 0),
(27, '陕西省', 1, 0),
(28, '甘肃省', 1, 0),
(29, '青海省', 1, 0),
(30, '宁夏回族自治区', 1, 0),
(31, '新疆维吾尔自治区', 1, 0),
(32, '台湾省', 1, 0),
(33, '香港特别行政区', 1, 0),
(34, '澳门特别行政区', 1, 0),
(35, '海外', 1, 0),
(36, '其他', 1, 0),
(37, '东城区', 2, 1),
(38, '西城区', 2, 1),
(39, '崇文区', 2, 1),
(40, '宣武区', 2, 1),
(41, '朝阳区', 2, 1),
(42, '丰台区', 2, 1),
(43, '石景山区', 2, 1),
(44, '海淀区', 2, 1),
(45, '门头沟区', 2, 1),
(46, '房山区', 2, 1),
(47, '通州区', 2, 1),
(48, '顺义区', 2, 1),
(49, '昌平区', 2, 1),
(50, '大兴区', 2, 1),
(51, '怀柔区', 2, 1),
(52, '平谷区', 2, 1),
(53, '密云县', 2, 1),
(54, '延庆县', 2, 1),
(55, '和平区', 2, 2),
(56, '河东区', 2, 2),
(57, '河西区', 2, 2),
(58, '南开区', 2, 2),
(59, '河北区', 2, 2),
(60, '红桥区', 2, 2),
(61, '塘沽区', 2, 2),
(62, '汉沽区', 2, 2),
(63, '大港区', 2, 2),
(64, '东丽区', 2, 2),
(65, '西青区', 2, 2),
(66, '津南区', 2, 2),
(67, '北辰区', 2, 2),
(68, '武清区', 2, 2),
(69, '宝坻区', 2, 2),
(70, '宁河县', 2, 2),
(71, '静海县', 2, 2),
(72, '蓟县', 2, 2),
(73, '石家庄市', 2, 3),
(74, '唐山市', 2, 3),
(75, '秦皇岛市', 2, 3),
(76, '邯郸市', 2, 3),
(77, '邢台市', 2, 3),
(78, '保定市', 2, 3),
(79, '张家口市', 2, 3),
(80, '承德市', 2, 3),
(81, '衡水市', 2, 3),
(82, '廊坊市', 2, 3),
(83, '沧州市', 2, 3),
(84, '太原市', 2, 4),
(85, '大同市', 2, 4),
(86, '阳泉市', 2, 4),
(87, '长治市', 2, 4),
(88, '晋城市', 2, 4),
(89, '朔州市', 2, 4),
(90, '晋中市', 2, 4),
(91, '运城市', 2, 4),
(92, '忻州市', 2, 4),
(93, '临汾市', 2, 4),
(94, '吕梁市', 2, 4),
(95, '呼和浩特市', 2, 5),
(96, '包头市', 2, 5),
(97, '乌海市', 2, 5),
(98, '赤峰市', 2, 5),
(99, '通辽市', 2, 5),
(100, '鄂尔多斯市', 2, 5),
(101, '呼伦贝尔市', 2, 5),
(102, '巴彦淖尔市', 2, 5),
(103, '乌兰察布市', 2, 5),
(104, '兴安盟', 2, 5),
(105, '锡林郭勒盟', 2, 5),
(106, '阿拉善盟', 2, 5),
(107, '沈阳市', 2, 6),
(108, '大连市', 2, 6),
(109, '鞍山市', 2, 6),
(110, '抚顺市', 2, 6),
(111, '本溪市', 2, 6),
(112, '丹东市', 2, 6),
(113, '锦州市', 2, 6),
(114, '营口市', 2, 6),
(115, '阜新市', 2, 6),
(116, '辽阳市', 2, 6),
(117, '盘锦市', 2, 6),
(118, '铁岭市', 2, 6),
(119, '朝阳市', 2, 6),
(120, '葫芦岛市', 2, 6),
(121, '长春市', 2, 7),
(122, '吉林市', 2, 7),
(123, '四平市', 2, 7),
(124, '辽源市', 2, 7),
(125, '通化市', 2, 7),
(126, '白山市', 2, 7),
(127, '松原市', 2, 7),
(128, '白城市', 2, 7),
(129, '延边朝鲜族自治州', 2, 7),
(130, '哈尔滨市', 2, 8),
(131, '齐齐哈尔市', 2, 8),
(132, '鸡西市', 2, 8),
(133, '鹤岗市', 2, 8),
(134, '双鸭山市', 2, 8),
(135, '大庆市', 2, 8),
(136, '伊春市', 2, 8),
(137, '佳木斯市', 2, 8),
(138, '七台河市', 2, 8),
(139, '牡丹江市', 2, 8),
(140, '黑河市', 2, 8),
(141, '绥化市', 2, 8),
(142, '大兴安岭地区', 2, 8),
(143, '黄浦区', 2, 9),
(144, '卢湾区', 2, 9),
(145, '徐汇区', 2, 9),
(146, '长宁区', 2, 9),
(147, '静安区', 2, 9),
(148, '普陀区', 2, 9),
(149, '闸北区', 2, 9),
(150, '虹口区', 2, 9),
(151, '杨浦区', 2, 9),
(152, '闵行区', 2, 9),
(153, '宝山区', 2, 9),
(154, '嘉定区', 2, 9),
(155, '浦东新区', 2, 9),
(156, '金山区', 2, 9),
(157, '松江区', 2, 9),
(158, '青浦区', 2, 9),
(159, '南汇区', 2, 9),
(160, '奉贤区', 2, 9),
(161, '崇明县', 2, 9),
(162, '南京市', 2, 10),
(163, '无锡市', 2, 10),
(164, '徐州市', 2, 10),
(165, '常州市', 2, 10),
(166, '苏州市', 2, 10),
(167, '南通市', 2, 10),
(168, '连云港市', 2, 10),
(169, '淮安市', 2, 10),
(170, '盐城市', 2, 10),
(171, '扬州市', 2, 10),
(172, '镇江市', 2, 10),
(173, '泰州市', 2, 10),
(174, '宿迁市', 2, 10),
(175, '杭州市', 2, 11),
(176, '宁波市', 2, 11),
(177, '温州市', 2, 11),
(178, '嘉兴市', 2, 11),
(179, '湖州市', 2, 11),
(180, '绍兴市', 2, 11),
(181, '舟山市', 2, 11),
(182, '衢州市', 2, 11),
(183, '金华市', 2, 11),
(184, '台州市', 2, 11),
(185, '丽水市', 2, 11),
(186, '合肥市', 2, 12),
(187, '芜湖市', 2, 12),
(188, '蚌埠市', 2, 12),
(189, '淮南市', 2, 12),
(190, '马鞍山市', 2, 12),
(191, '淮北市', 2, 12),
(192, '铜陵市', 2, 12),
(193, '安庆市', 2, 12),
(194, '黄山市', 2, 12),
(195, '滁州市', 2, 12),
(196, '阜阳市', 2, 12),
(197, '宿州市', 2, 12),
(198, '巢湖市', 2, 12),
(199, '六安市', 2, 12),
(200, '亳州市', 2, 12),
(201, '池州市', 2, 12),
(202, '宣城市', 2, 12),
(203, '福州市', 2, 13),
(204, '厦门市', 2, 13),
(205, '莆田市', 2, 13),
(206, '三明市', 2, 13),
(207, '泉州市', 2, 13),
(208, '漳州市', 2, 13),
(209, '南平市', 2, 13),
(210, '龙岩市', 2, 13),
(211, '宁德市', 2, 13),
(212, '南昌市', 2, 14),
(213, '景德镇市', 2, 14),
(214, '萍乡市', 2, 14),
(215, '九江市', 2, 14),
(216, '新余市', 2, 14),
(217, '鹰潭市', 2, 14),
(218, '赣州市', 2, 14),
(219, '吉安市', 2, 14),
(220, '宜春市', 2, 14),
(221, '抚州市', 2, 14),
(222, '上饶市', 2, 14),
(223, '济南市', 2, 15),
(224, '青岛市', 2, 15),
(225, '淄博市', 2, 15),
(226, '枣庄市', 2, 15),
(227, '东营市', 2, 15),
(228, '烟台市', 2, 15),
(229, '潍坊市', 2, 15),
(230, '济宁市', 2, 15),
(231, '泰安市', 2, 15),
(232, '威海市', 2, 15),
(233, '日照市', 2, 15),
(234, '莱芜市', 2, 15),
(235, '临沂市', 2, 15),
(236, '德州市', 2, 15),
(237, '聊城市', 2, 15),
(238, '滨州市', 2, 15),
(239, '菏泽市', 2, 15),
(240, '郑州市', 2, 16),
(241, '开封市', 2, 16),
(242, '洛阳市', 2, 16),
(243, '平顶山市', 2, 16),
(244, '安阳市', 2, 16),
(245, '鹤壁市', 2, 16),
(246, '新乡市', 2, 16),
(247, '焦作市', 2, 16),
(248, '濮阳市', 2, 16),
(249, '许昌市', 2, 16),
(250, '漯河市', 2, 16),
(251, '三门峡市', 2, 16),
(252, '南阳市', 2, 16),
(253, '商丘市', 2, 16),
(254, '信阳市', 2, 16),
(255, '周口市', 2, 16),
(256, '驻马店市', 2, 16),
(257, '济源市', 2, 16),
(258, '武汉市', 2, 17),
(259, '黄石市', 2, 17),
(260, '十堰市', 2, 17),
(261, '宜昌市', 2, 17),
(262, '襄樊市', 2, 17),
(263, '鄂州市', 2, 17),
(264, '荆门市', 2, 17),
(265, '孝感市', 2, 17),
(266, '荆州市', 2, 17),
(267, '黄冈市', 2, 17),
(268, '咸宁市', 2, 17),
(269, '随州市', 2, 17),
(270, '恩施土家族苗族自治州', 2, 17),
(271, '仙桃市', 2, 17),
(272, '潜江市', 2, 17),
(273, '天门市', 2, 17),
(274, '神农架林区', 2, 17),
(275, '长沙市', 2, 18),
(276, '株洲市', 2, 18),
(277, '湘潭市', 2, 18),
(278, '衡阳市', 2, 18),
(279, '邵阳市', 2, 18),
(280, '岳阳市', 2, 18),
(281, '常德市', 2, 18),
(282, '张家界市', 2, 18),
(283, '益阳市', 2, 18),
(284, '郴州市', 2, 18),
(285, '永州市', 2, 18),
(286, '怀化市', 2, 18),
(287, '娄底市', 2, 18),
(288, '湘西土家族苗族自治州', 2, 18),
(289, '广州市', 2, 19),
(290, '韶关市', 2, 19),
(291, '深圳市', 2, 19),
(292, '珠海市', 2, 19),
(293, '汕头市', 2, 19),
(294, '佛山市', 2, 19),
(295, '江门市', 2, 19),
(296, '湛江市', 2, 19),
(297, '茂名市', 2, 19),
(298, '肇庆市', 2, 19),
(299, '惠州市', 2, 19),
(300, '梅州市', 2, 19),
(301, '汕尾市', 2, 19),
(302, '河源市', 2, 19),
(303, '阳江市', 2, 19),
(304, '清远市', 2, 19),
(305, '东莞市', 2, 19),
(306, '中山市', 2, 19),
(307, '潮州市', 2, 19),
(308, '揭阳市', 2, 19),
(309, '云浮市', 2, 19),
(310, '南宁市', 2, 20),
(311, '柳州市', 2, 20),
(312, '桂林市', 2, 20),
(313, '梧州市', 2, 20),
(314, '北海市', 2, 20),
(315, '防城港市', 2, 20),
(316, '钦州市', 2, 20),
(317, '贵港市', 2, 20),
(318, '玉林市', 2, 20),
(319, '百色市', 2, 20),
(320, '贺州市', 2, 20),
(321, '河池市', 2, 20),
(322, '来宾市', 2, 20),
(323, '崇左市', 2, 20),
(324, '海口市', 2, 21),
(325, '三亚市', 2, 21),
(326, '五指山市', 2, 21),
(327, '琼海市', 2, 21),
(328, '儋州市', 2, 21),
(329, '文昌市', 2, 21),
(330, '万宁市', 2, 21),
(331, '东方市', 2, 21),
(332, '定安县', 2, 21),
(333, '屯昌县', 2, 21),
(334, '澄迈县', 2, 21),
(335, '临高县', 2, 21),
(336, '白沙黎族自治县', 2, 21),
(337, '昌江黎族自治县', 2, 21),
(338, '乐东黎族自治县', 2, 21),
(339, '陵水黎族自治县', 2, 21),
(340, '保亭黎族苗族自治县', 2, 21),
(341, '琼中黎族苗族自治县', 2, 21),
(342, '西沙群岛', 2, 21),
(343, '南沙群岛', 2, 21),
(344, '中沙群岛的岛礁及其海域', 2, 21),
(345, '万州区', 2, 22),
(346, '涪陵区', 2, 22),
(347, '渝中区', 2, 22),
(348, '大渡口区', 2, 22),
(349, '江北区', 2, 22),
(350, '沙坪坝区', 2, 22),
(351, '九龙坡区', 2, 22),
(352, '南岸区', 2, 22),
(353, '北碚区', 2, 22),
(354, '双桥区', 2, 22),
(355, '万盛区', 2, 22),
(356, '渝北区', 2, 22),
(357, '巴南区', 2, 22),
(358, '黔江区', 2, 22),
(359, '长寿区', 2, 22),
(360, '綦江县', 2, 22),
(361, '潼南县', 2, 22),
(362, '铜梁县', 2, 22),
(363, '大足县', 2, 22),
(364, '荣昌县', 2, 22),
(365, '璧山县', 2, 22),
(366, '梁平县', 2, 22),
(367, '城口县', 2, 22),
(368, '丰都县', 2, 22),
(369, '垫江县', 2, 22),
(370, '武隆县', 2, 22),
(371, '忠县', 2, 22),
(372, '开县', 2, 22),
(373, '云阳县', 2, 22),
(374, '奉节县', 2, 22),
(375, '巫山县', 2, 22),
(376, '巫溪县', 2, 22),
(377, '石柱土家族自治县', 2, 22),
(378, '秀山土家族苗族自治县', 2, 22),
(379, '酉阳土家族苗族自治县', 2, 22),
(380, '彭水苗族土家族自治县', 2, 22),
(381, '江津市', 2, 22),
(382, '合川市', 2, 22),
(383, '永川市', 2, 22),
(384, '南川市', 2, 22),
(385, '成都市', 2, 23),
(386, '自贡市', 2, 23),
(387, '攀枝花市', 2, 23),
(388, '泸州市', 2, 23),
(389, '德阳市', 2, 23),
(390, '绵阳市', 2, 23),
(391, '广元市', 2, 23),
(392, '遂宁市', 2, 23),
(393, '内江市', 2, 23),
(394, '乐山市', 2, 23),
(395, '南充市', 2, 23),
(396, '眉山市', 2, 23),
(397, '宜宾市', 2, 23),
(398, '广安市', 2, 23),
(399, '达州市', 2, 23),
(400, '雅安市', 2, 23),
(401, '巴中市', 2, 23),
(402, '资阳市', 2, 23),
(403, '阿坝藏族羌族自治州', 2, 23),
(404, '甘孜藏族自治州', 2, 23),
(405, '凉山彝族自治州', 2, 23),
(406, '贵阳市', 2, 24),
(407, '六盘水市', 2, 24),
(408, '遵义市', 2, 24),
(409, '安顺市', 2, 24),
(410, '铜仁地区', 2, 24),
(411, '黔西南布依族苗族自治州', 2, 24),
(412, '毕节地区', 2, 24),
(413, '黔东南苗族侗族自治州', 2, 24),
(414, '黔南布依族苗族自治州', 2, 24),
(415, '昆明市', 2, 25),
(416, '曲靖市', 2, 25),
(417, '玉溪市', 2, 25),
(418, '保山市', 2, 25),
(419, '昭通市', 2, 25),
(420, '丽江市', 2, 25),
(421, '思茅市', 2, 25),
(422, '临沧市', 2, 25),
(423, '楚雄彝族自治州', 2, 25),
(424, '红河哈尼族彝族自治州', 2, 25),
(425, '文山壮族苗族自治州', 2, 25),
(426, '西双版纳傣族自治州', 2, 25),
(427, '大理白族自治州', 2, 25),
(428, '德宏傣族景颇族自治州', 2, 25),
(429, '怒江傈僳族自治州', 2, 25),
(430, '迪庆藏族自治州', 2, 25),
(431, '拉萨市', 2, 26),
(432, '昌都地区', 2, 26),
(433, '山南地区', 2, 26),
(434, '日喀则地区', 2, 26),
(435, '那曲地区', 2, 26),
(436, '阿里地区', 2, 26),
(437, '林芝地区', 2, 26),
(438, '西安市', 2, 27),
(439, '铜川市', 2, 27),
(440, '宝鸡市', 2, 27),
(441, '咸阳市', 2, 27),
(442, '渭南市', 2, 27),
(443, '延安市', 2, 27),
(444, '汉中市', 2, 27),
(445, '榆林市', 2, 27),
(446, '安康市', 2, 27),
(447, '商洛市', 2, 27),
(448, '兰州市', 2, 28),
(449, '嘉峪关市', 2, 28),
(450, '金昌市', 2, 28),
(451, '白银市', 2, 28),
(452, '天水市', 2, 28),
(453, '武威市', 2, 28),
(454, '张掖市', 2, 28),
(455, '平凉市', 2, 28),
(456, '酒泉市', 2, 28),
(457, '庆阳市', 2, 28),
(458, '定西市', 2, 28),
(459, '陇南市', 2, 28),
(460, '临夏回族自治州', 2, 28),
(461, '甘南藏族自治州', 2, 28),
(462, '西宁市', 2, 29),
(463, '海东地区', 2, 29),
(464, '海北藏族自治州', 2, 29),
(465, '黄南藏族自治州', 2, 29),
(466, '海南藏族自治州', 2, 29),
(467, '果洛藏族自治州', 2, 29),
(468, '玉树藏族自治州', 2, 29),
(469, '海西蒙古族藏族自治州', 2, 29),
(470, '银川市', 2, 30),
(471, '石嘴山市', 2, 30),
(472, '吴忠市', 2, 30),
(473, '固原市', 2, 30),
(474, '中卫市', 2, 30),
(475, '乌鲁木齐市', 2, 31),
(476, '克拉玛依市', 2, 31),
(477, '吐鲁番地区', 2, 31),
(478, '哈密地区', 2, 31),
(479, '昌吉回族自治州', 2, 31),
(480, '博尔塔拉蒙古自治州', 2, 31),
(481, '巴音郭楞蒙古自治州', 2, 31),
(482, '阿克苏地区', 2, 31),
(483, '克孜勒苏柯尔克孜自治州', 2, 31),
(484, '喀什地区', 2, 31),
(485, '和田地区', 2, 31),
(486, '伊犁哈萨克自治州', 2, 31),
(487, '塔城地区', 2, 31),
(488, '阿勒泰地区', 2, 31),
(489, '石河子市', 2, 31),
(490, '阿拉尔市', 2, 31),
(491, '图木舒克市', 2, 31),
(492, '五家渠市', 2, 31),
(493, '台北市', 2, 32),
(494, '高雄市', 2, 32),
(495, '基隆市', 2, 32),
(496, '台中市', 2, 32),
(497, '台南市', 2, 32),
(498, '新竹市', 2, 32),
(499, '嘉义市', 2, 32),
(500, '台北县', 2, 32),
(501, '宜兰县', 2, 32),
(502, '桃园县', 2, 32),
(503, '新竹县', 2, 32),
(504, '苗栗县', 2, 32),
(505, '台中县', 2, 32),
(506, '彰化县', 2, 32),
(507, '南投县', 2, 32),
(508, '云林县', 2, 32),
(509, '嘉义县', 2, 32),
(510, '台南县', 2, 32),
(511, '高雄县', 2, 32),
(512, '屏东县', 2, 32),
(513, '澎湖县', 2, 32),
(514, '台东县', 2, 32),
(515, '花莲县', 2, 32),
(516, '中西区', 2, 33),
(517, '东区', 2, 33),
(518, '九龙城区', 2, 33),
(519, '观塘区', 2, 33),
(520, '南区', 2, 33),
(521, '深水埗区', 2, 33),
(522, '黄大仙区', 2, 33),
(523, '湾仔区', 2, 33);

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

--
-- 转存表中的数据 `ruike_express`
--

INSERT INTO `ruike_express` (`id`, `express_id`, `from_memer_id`, `from`, `from_mobile`, `to`, `to_username`, `to_mobile`, `goods_type`, `remark`, `status`, `cancel_member`, `cancel_reason`, `express_type`, `total_money`, `goods_price`, `card_id`, `real_pay_money`, `goods_pic`, `score`, `rate`, `car_type`, `insurance`, `scheduled_time`, `create_time`, `incubator`, `time_of_receipt`, `shipping_coordinates`, `receiving_coordinates`, `goods_receipt_pic`, `goods_receipt_code`) VALUES
('1', 1, 2, '广州', '13799983347', '东莞', NULL, '14783849724', '衣服', '大衣', 1, 2, NULL, 2, 47.21, 23.23, '232442332', 22.323, 24, 3, '好', 1, 20, '2016-11-30 14:29:33', '2016-09-22 08:17:05', '1', NULL, '113.672161,23.665754', '114.052265,22.659931', 0, ''),
('2', 1, 1, '河内', '18955555555', '广州', NULL, '13866666666', '食品', '杂粮', -1, 5, NULL, 1, 75.34, 45.45, '534563456', 66.24, 24, 2, '良', 1, 55, '0000-00-00 00:00:00', '2016-09-24 08:29:08', '1', NULL, '114.44028,22.825754', '114.052265,22.659931', 0, ''),
('3', 29, 3, '非洲', '5', '欧洲', '声音', '7', '8', '生活用品', 4, 9, NULL, 3, 9, 7, '78', 78, 502, 0, '优', 0, 6, NULL, '2016-10-12 11:22:59', '1', NULL, '114.44028,22.825754', '114.052265,22.659931', 503, ''),
('4', 29, 5, '亚洲', '5', '北欧', NULL, '5', '5', '5', 4, 5, NULL, 1, 90, 9, '0', 980, 506, 0, '一般', 0, 0, NULL, '0000-00-00 00:00:00', '1', '2017-03-06 17:33:19', '114.44028,22.825754', '114.052265,22.659931', 508, ''),
('5', 29, 5, '东南亚', '5', '中美洲', NULL, '5', '虚拟商品', '话费', 4, 2, NULL, 2, 0, 0, '0', 0, 509, 0, '良', 0, 0, NULL, '0000-00-00 00:00:00', '1', '2017-03-06 17:40:00', '114.44028,22.825754', '114.052265,22.659931', 511, ''),
('181475999446234', 1, 1, '广东惠州惠州城啊订单', '14777323453', '广西桂林龙胜县2', '陆柒', '14796453457', '文件 美食 手机 ...', '2244', 4, 1, NULL, 2, 120, 0, '', 123, 70, 5, '1、2、9999999999', 0, 3, '2016-12-13 14:12:00', '2016-10-09 15:50:46', '1', '2016-11-18 16:55:41', '114.44028,22.825754', '114.052265,22.659931', 0, '8556'),
('181476000429160', 29, 1, '广东惠州惠州城啊订单', '14777323453', '广西桂林龙胜县', '陆柒', '14796453457', '文件 美食 手机 ...', '2244', 4, 0, NULL, 2, 0, 0, '0', 0, 512, 0, '', 0, 0, '2016-12-13 14:12:00', '2016-10-09 16:07:09', '1', '2017-03-06 17:44:06', '114.44028,22.825754', '114.052265,22.659931', 513, ''),
('181476015578442', 1, 1, '广东惠州惠州城啊订单', '14777323453', '广西桂林龙胜县', '陆柒', '14796453457', '易碎 蛋糕 贵重物品', '2342', 1, 0, NULL, 2, 0, 0, '0', 23, 0, 0, '', 0, 3, '0000-00-00 00:00:00', '2016-10-09 20:19:38', '1', NULL, '114.44028,22.825754', '114.052265,22.659931', 0, ''),
('181476015926243', 1, 1, '广东惠州惠州城啊订单', '14777323453', '广西桂林龙胜县', '陆柒', '14796453457', '易碎 蛋糕 贵重物品', '测试是否成功', 1, 0, NULL, 1, 0, 0, '0', 23, 0, 0, '', 0, 3, '0000-00-00 00:00:00', '2016-10-09 20:25:26', '1', NULL, '114.44028,22.825754', '114.052265,22.659931', 0, ''),
('181476015944987', 1, 1, '广东惠州惠州城啊订单', '14777323453', '广西桂林龙胜县', '陆柒', '14796453457', '易碎 蛋糕 贵重物品', '测试是否成功', 4, 0, NULL, 1, 0, 0, '0', 25, 0, 0, '', 0, 3, '2016-10-10 02:12:00', '2016-10-09 20:25:44', '1', NULL, '114.44028,22.825754', '114.052265,22.659931', 0, ''),
('181476016424109', 1, 1, '广东惠州惠州城啊订单', '14777323453', '广西桂林龙胜县', '陆柒', '14796453457', '洗衣 贵重物品 普通', '速度发生非的', 0, 0, NULL, 1, 0, 0, '0', 16, 0, 0, '', 0, 3, '2016-10-10 16:10:00', '2016-10-09 20:33:44', '1', NULL, '114.44028,22.825754', '114.052265,22.659931', 0, ''),
('181476064855563', 5, 1, '广东惠州惠州城南10公里处', '14777323453', '广西桂林龙胜县', '陆柒', '14796453457', '文件 美食 蛋糕', '发烧碟发', 1, 0, NULL, 2, 0, 0, '0', 25, 0, 0, '', 0, 3, '2016-10-11 02:10:00', '2016-10-10 10:00:55', '1', NULL, '114.44028,22.825754', '114.052265,22.659931', 0, ''),
('181476064871746', 5, 1, '广东惠州惠州城南10公里处', '14777323453', '广西桂林龙胜县', '陆柒', '14796453457', '文件 美食 蛋糕', '发烧碟发', 0, 0, NULL, 2, 0, 0, '0', 25, 0, 0, '', 0, 3, '2016-10-11 02:10:00', '2016-10-10 10:01:11', '1', NULL, '114.44028,22.825754', '114.052265,22.659931', 0, ''),
('181476084516254', 5, 1, '广西南宁江南区', '14712355342', '广西桂林龙胜县', '陆柒', '14796453457', '贵重物品 钥匙 普通', '但', 1, 0, NULL, 1, 0, 0, '0', 54, 0, 0, '', 0, 3, '2016-10-12 22:10:00', '2016-10-10 15:28:36', '1', NULL, '114.44028,22.825754', '114.052265,22.659931', 0, ''),
('181476085382604', 5, 1, '广西南宁江南区', '14712355342', '广西桂林龙胜县', '陆柒', '14796453457', '洗衣 手机 普通', '发烧碟', 1, 0, NULL, 1, 0, 0, '0', 174, 0, 0, '', 0, 3, '2016-10-14 22:10:00', '2016-10-10 15:43:02', '1', NULL, '114.44028,22.825754', '114.052265,22.659931', 0, ''),
('181476100683512', 0, 1, '广西南宁江南区', '14712355342', '广西桂林龙胜县', '陆柒', '14796453457', '美食 洗衣 蛋糕', '测试beyond', 0, 0, NULL, 1, 174, 0, '0', 0, 0, 0, '', 0, 4, '2016-10-11 02:10:00', '2016-10-10 19:58:03', '1', NULL, '114.44028,22.825754', '114.052265,22.659931', 0, ''),
('181476100919904', 0, 1, '广西南宁江南区', '14712355342', '广西桂林龙胜县', '陆柒', '14796453457', '洗衣 蛋糕 贵重物品', '基本', 0, 0, NULL, 1, 170, 0, '0', 0, 0, 0, '', 0, 3, '2016-10-11 15:11:00', '2016-10-10 20:01:59', '1', NULL, '114.44028,22.825754', '114.052265,22.659931', 0, ''),
('181476156225696', 0, 1, '广西南宁江南区', '14712355342', '广西崇左江州区', '杨新华', '13788888888', '洗衣 蛋糕 贵重物品', 'lis', 0, 0, NULL, 1, 173, 0, '0', 0, 0, 0, '', 0, 3, '2016-10-14 23:10:00', '2016-10-11 11:23:45', '1', NULL, '114.44028,22.825754', '114.052265,22.659931', 0, ''),
('181476156333810', 0, 1, '广西南宁江南区', '14712355342', '广西崇左江州区', '杨新华', '13788888888', '洗衣 贵重物品', '历史额天空', 0, 1, '物品不好,物品质量有问题,物流慢', 2, 173, 0, '37116588024', 154, 0, 0, '', 0, 4, '2016-10-12 23:10:00', '2016-10-11 11:25:33', '1', NULL, '114.44028,22.825754', '114.052265,22.659931', 0, ''),
('181476156463722', 0, 1, '广西南宁江南区', '14712355342', '广西崇左江州区', '杨新华', '13788888888', '美食 洗衣 手机 ...', '', 0, 0, '', 1, 173, 0, '37116588024', 153, 0, 0, '', 0, 3, '2016-10-12 23:10:00', '2016-10-11 11:27:43', '1', NULL, '114.44028,22.825754', '114.052265,22.659931', 0, ''),
('181476959256500', 0, 1, '广西南宁江南区', '14712355342', '广西崇左江州区', '杨新华', '13788888888', '贵重物品', '', 0, 0, '', 1, 260, 0, '', 0, 0, 0, '', 0, 3, '2016-11-10 10:10:00', '2016-10-20 18:27:36', '1', NULL, '114.44028,22.825754', '114.052265,22.659931', 0, ''),
('181478490190654', 0, 1, '深圳市宝安区秋园雅苑地名', '14788888888', '广西柳州柳北区', '孙大炮的孙子', '14788888888', '洗衣', '饭后工作', 0, 0, NULL, 2, 43, 0, '', 0, 0, 0, '', 0, 4, '2016-11-10 10:10:00', '2016-11-07 11:43:10', '1', NULL, '114.44028,22.825754', '114.052265,22.659931', 0, ''),
('181478490380422', 0, 1, '深圳市宝安区秋园雅苑地名', '14788888888', '深圳市龙岗区帝王酒店89号房', '阿六', '14777323453', '蛋糕', '吃吧', 0, 0, NULL, 2, 43, 0, '', 0, 0, 0, '', 0, 0, '2016-11-12 10:10:00', '2016-11-07 11:46:20', '1', NULL, '114.44028,22.825754', '114.052265,22.659931', 0, ''),
('181478490414805', 0, 1, '深圳市宝安区秋园雅苑地名', '14788888888', '深圳市龙岗区帝王酒店89号房', '阿六', '14777323453', '美食', '吃吧', 0, 0, NULL, 2, 43, 0, '', 0, 0, 0, '', 0, 4, '2016-11-10 10:10:00', '2016-11-07 11:46:54', '1', NULL, '114.44028,22.825754', '114.052265,22.659931', 0, ''),
('181478490513131', 0, 1, '深圳市宝安区秋园雅苑地名', '14788888888', '深圳市龙岗区帝王酒店89号房', '阿六', '14777323453', '贵重物品', '吃吧', 1, 0, NULL, 2, 43, 0, '', 46, 0, 0, '', 0, 3, '2016-11-10 10:10:00', '2016-11-07 11:48:33', '1', NULL, '114.44028,22.825754', '114.052265,22.659931', 0, ''),
('181478494299296', 0, 1, '深圳市宝安区秋园雅苑地名', '14788888888', '深圳市龙岗区帝王酒店89号房', '阿六', '14777323453', '贵重物品', 'test', 1, 0, NULL, 1, 43, 0, '', 47, 0, 0, '', 0, 4, '2016-11-10 10:10:00', '2016-11-07 12:51:39', '1', NULL, '114.44028,22.825754', '114.052265,22.659931', 0, ''),
('181478494429655', 0, 1, '深圳市宝安区秋园雅苑地名', '14788888888', '深圳市龙岗区帝王酒店89号房', '阿六', '14777323453', '钥匙', '特殊', 1, 0, NULL, 1, 43, 0, '', 52, 0, 0, '', 0, 9, '2016-12-10 10:10:00', '2016-11-07 12:53:49', '1', NULL, '114.44028,22.825754', '114.052265,22.659931', 0, ''),
('181480142244446', 0, 1, '东莞市市辖区房东实业有限公司发烧碟', '14788888888', '深圳市福田区深圳市第二人民医院住院部', '粉丝', '14795520542', '手机 蛋糕 普通', '一起吧', 0, 0, NULL, 1, 43, 0, '', 0, 0, 0, '', 0, 4, '2016-12-10 10:10:00', '2016-11-26 14:37:24', '1', NULL, '114.44028,22.825754', '114.052265,22.659931', 0, ''),
('181480143606930', 0, 1, '东莞市市辖区房东实业有限公司发烧碟', '14788888888', '深圳市福田区深圳市第二人民医院住院部', '粉丝', '14795520542', '手机 蛋糕', '方法', 0, 0, NULL, 2, 43, 0, '', 0, 0, 0, '', 0, 3, '2016-12-12 10:10:00', '2016-11-26 15:00:06', '1', NULL, '114.44028,22.825754', '114.052265,22.659931', 0, ''),
('181480297037825', 0, 1, '广西壮族自治区广西', '14777323453', '深圳市福田区深圳市第二人民医院住院部', '粉丝', '14795520542', '蛋糕', 'fsdff', 3, 0, NULL, 1, 43, 0, '', 0, 0, 0, '', 0, 3, '2016-12-10 10:10:00', '2016-11-28 09:37:17', '1', NULL, '114.44028,22.825754', '114.052265,22.659931', 0, ''),
('181480297207272', 0, 1, '惠州市惠阳区秋长市场无望完成', '14777323453', '深圳市宝安区深圳市是源医学科技有限公司52 ', '搜索', '13788888888', '洗衣', '凤飞飞', 1, 0, NULL, 1, 43, 0, '', 0, 0, 0, '', 0, 2, '0000-00-00 00:00:00', '2016-11-28 09:40:07', '1', NULL, '114.44028,22.825754', '114.052265,22.659931', 0, ''),
('181480297209812', 0, 1, '惠州市惠阳区秋长市场无望完成', '14777323453', '深圳市宝安区深圳市是源医学科技有限公司52 ', '搜索', '13788888888', '洗衣', '凤飞飞', 2, 0, NULL, 1, 43, 0, '', 0, 0, 0, '', 0, 2, '0000-00-00 00:00:00', '2016-11-28 09:40:09', '1', NULL, '114.44028,22.825754', '114.052265,22.659931', 0, ''),
('181480297321860', 0, 1, '惠州市惠阳区秋长市场无望完成', '14777323453', '深圳市宝安区深圳市是源医学科技有限公司52 ', '搜索', '13788888888', '洗衣 蛋糕', '方法', 0, 0, NULL, 2, 43, 0, '', 0, 0, 0, '', 0, 0, '0000-00-00 00:00:00', '2016-11-28 09:42:01', '1', NULL, '114.44028,22.825754', '114.052265,22.659931', 0, ''),
('181482846140178', 0, 1, '惠州市惠阳区秋长市场无望完成', '14777323453', '深圳市宝安区深圳市是源医学科技有限公司52 ', '搜索', '13788888888', '蛋糕 贵重物品', '林啊大是大非', 0, 0, NULL, 1, 44, 0, '', 0, 0, 0, '', 0, 3, '2016-12-30 21:37:00', '2016-12-27 21:42:20', '1', NULL, '114.44028,22.825754', '114.052265,22.659931', 0, ''),
('181482847295001', 0, 1, '惠州市惠阳区秋长市场无望完成', '14777323453', '深圳市宝安区深圳市是源医学科技有限公司52 ', '搜索', '13788888888', '美食 洗衣', 'fasdfasdfasafsd', -1, 0, NULL, 2, 44, 0, '', 0, 0, 0, '', 0, 3, '2016-12-29 22:01:00', '2016-12-27 22:01:35', '1', NULL, '114.44028,22.825754', '114.052265,22.659931', 0, ''),
('181482847601022', 0, 1, '惠州市惠阳区秋长市场无望完成', '14777323453', '深圳市宝安区深圳市是源医学科技有限公司52 ', '搜索', '13788888888', '文件 美食', '1', -1, 1, '钱不够了,已经不需要了,物品质量有问题。其它原因：发生大幅士大夫。', 1, 44, 0, '36715822759', 36, 0, 0, '', 0, 2, '2016-12-30 22:06:00', '2016-12-27 22:06:41', '1', NULL, '114.44028,22.825754', '114.052265,22.659931', 0, ''),
('181483586576916', 0, 1, '南宁市青秀区南宁市埌东汽车站浪', '14795520542', '广西崇左江州区', '杨新华', '13788888888', '洗衣 贵重物品', 'test', 1, 0, NULL, 1, 43, 0, '36210771309', 41, 0, 0, '', 0, 8, '2017-01-06 11:22:00', '2017-01-05 11:22:56', '1', NULL, '108.42496,22.817978', '114.047804,22.619572', 0, ''),
('181483587622415', 0, 1, '南宁市青秀区南宁市埌东汽车站浪', '14795520542', '广西崇左江州区', '杨新华', '13788888888', '手机', '很大的', 1, 0, NULL, 2, 43, 0, '36662173019', 37, 0, 0, '', 0, 4, '0000-00-00 00:00:00', '2017-01-05 11:40:23', '1', NULL, '108.42496,22.817978', '114.047804,22.619572', 0, ''),
('181487831274451', 0, 1, '南宁市青秀区南宁市埌东汽车站浪', '14795520542', '广西崇左江州区', '杨新华', '13788888888', '文件 易碎', '73fasdfa', 0, 0, NULL, 1, 260, 0, '', 0, 0, 0, '', 0, 3, '2017-02-24 14:21:00', '2017-02-23 14:27:54', '1', NULL, '108.42496,22.817978', '114.047804,22.619572', 0, ''),
('181487920308707', 1, 1, '深圳市福田区福田红树林自然保护区公母不分', '14795520542', '广西桂林龙胜县', '陆柒', '14796453457', '手机 鲜花 贵重物品', '花草树木', 4, 0, NULL, 2, 260, 0, '37116588024', 241, 462, 0, '', 0, 4, '2017-02-25 15:10:00', '2017-02-24 15:11:48', '1', NULL, '114.008318,22.532039', '114.047804,22.619572', 465, ''),
('181487921129180', 0, 1, '深圳市南山区深圳湾口岸帝王大厦', '14752369856', '广西崇左江州区', '杨新华主任', '13788888888', '手机 蛋糕 鲜花', '包玉米', 0, 0, NULL, 1, 260, 0, '', 0, 0, 0, '', 0, 4, '2017-02-27 18:25:00', '2017-02-24 15:25:29', '1', NULL, '113.95595,22.508675', '114.047804,22.619572', 0, ''),
('181487921437356', 0, 1, '广州市天河区广州天河汽车客运站56号', '14795520542', '广西崇左江州区', '杨新华主任', '13788888888', '贵重物品', '又测试', 0, 0, NULL, 2, 260, 0, '', 0, 0, 0, '', 0, 4, '2017-02-28 15:30:00', '2017-02-24 15:30:37', '1', NULL, '114.047804,22.619572', '114.047804,22.619572', 0, ''),
('181487921635838', 0, 1, '广州市天河区广州天河汽车客运站56号', '14795520542', '广州市天河区东圃大厦河西', '南方', '14752896325', '美食', '了可', 0, 0, NULL, 1, 260, 0, '', 0, 0, 0, '', 0, 4, '2017-02-25 15:33:00', '2017-02-24 15:33:55', '1', NULL, '114.047804,22.619572', '113.422016,23.125779', 0, ''),
('181488179079713', 0, 1, '广州市天河区广州天河汽车客运站56号', '14795520542', '广西柳州柳北区', '孙大炮的孙子', '14788888888', '蛋糕 贵重物品', '美人', -1, 1, '钱不够了。其它原因：没钱了。。', 1, 260, 0, '', 0, 0, 0, '', 0, 6, '2017-02-28 15:04:00', '2017-02-27 15:04:39', '1', NULL, '114.047804,22.619572', '114.047804,22.619572', 0, ''),
('181488179202885', 0, 1, '广州市天河区广州天河汽车客运站56号', '14795520542', '广西柳州柳北区', '孙大炮的孙子', '14788888888', '易碎 手机', '药', 0, 0, NULL, 2, 260, 0, '', 0, 0, 0, '', 0, 4, '2017-02-28 15:06:00', '2017-02-27 15:06:42', '1', NULL, '114.047804,22.619572', '114.047804,22.619572', 0, ''),
('181488527631543', 1, 1, '深圳市宝安区共和花园共识', '14765239852', '深圳市宝安区秋园雅苑乐天', '朴信惠', '14795520542', '蛋糕 贵重物品', '秋天来了', 4, 0, NULL, 1, 260, 0, '37576963760', 244, 466, 0, '', 0, 7, '0000-00-00 00:00:00', '2017-03-03 15:53:51', '1', NULL, '114.04279,22.653813', '113.912589,22.765825', 467, ''),
('181488536288912', 29, 1, '深圳市宝安区共和花园共识', '14765239852', '深圳市宝安区秋园雅苑乐天', '朴信惠', '14795520542', '手机 蛋糕', '', 4, 0, NULL, 1, 260, 0, '37195959252', 245, 496, 0, '', 0, 8, '0000-00-00 00:00:00', '2017-03-03 18:18:08', '1', NULL, '114.04279,22.653813', '113.912589,22.765825', 497, ''),
('181488536439211', 1, 1, '深圳市南山区阳光雅苑该喝喝', '13766666222', '深圳市宝安区秋园雅苑乐天', '朴信惠', '14795520542', '鲜花 贵重物品', '梵蒂冈', 3, 0, NULL, 1, 260, 0, '37990174947', 240, 473, 0, '', 0, 3, '0000-00-00 00:00:00', '2017-03-03 18:20:39', '1', NULL, '113.929362,22.551192', '113.912589,22.765825', 0, ''),
('181488771136401', 29, 1, '深圳市南山区阳光雅苑该喝喝', '13766666222', '深圳市宝安区秋园雅苑乐天', '朴信惠', '14795520542', '手机 蛋糕', '子树立', 4, 0, NULL, 1, 260, 0, '37375452050', 241, 499, 0, '', 0, 4, '0000-00-00 00:00:00', '2017-03-06 11:32:16', '1', NULL, '113.929362,22.551192', '113.912589,22.765825', 501, ''),
('181488771475748', 29, 1, '深圳市宝安区秋园雅苑子贡', '14795520543', '深圳市龙岗区阳光雅苑滚滚滚', '非常吃饭', '14796583265', '贵重物品', '', 4, 0, NULL, 1, 260, 0, '37680067761', 240, 494, 0, '', 0, 3, '0000-00-00 00:00:00', '2017-03-06 11:37:55', '1', NULL, '113.912589,22.765825', '114.160728,22.618668', 495, ''),
('181488780464667', 29, 1, '深圳市宝安区秋园雅苑子贡', '14795520543', '深圳市龙岗区阳光雅苑滚滚滚', '非常吃饭', '14796583265', '易碎 手机', '', 4, 0, NULL, 1, 260, 0, '37574249808', 243, 498, 0, '', 0, 6, '0000-00-00 00:00:00', '2017-03-06 14:07:44', '1', NULL, '113.912589,22.765825', '114.160728,22.618668', 500, ''),
('181488789068193', 29, 1, '深圳市宝安区秋园雅苑子贡', '14795520543', '深圳市龙岗区阳光雅苑滚滚滚', '非常吃饭', '14796583265', '贵重物品', '', 4, 0, NULL, 1, 266, 0, '37471237326', 251, 504, 0, '', 0, 8, '2017-03-06 22:30:00', '2017-03-06 16:31:08', '1', '2017-03-06 17:08:29', '113.912589,22.765825', '114.160728,22.618668', 505, ''),
('181488793645897', 29, 1, '深圳市宝安区秋园雅苑子贡', '14795520543', '深圳市龙岗区阳光雅苑滚滚滚', '非常吃饭', '14796583265', '鲜花 贵重物品', '', 4, 0, NULL, 1, 260, 0, '37317070888', 246, 514, 0, '', 0, 9, '2017-03-06 18:47:00', '2017-03-06 17:47:25', '1', '2017-03-06 17:48:55', '113.912589,22.765825', '114.160728,22.618668', 515, ''),
('181488794474351', 29, 1, '深圳市宝安区秋园雅苑子贡', '14795520543', '深圳市龙岗区阳光雅苑滚滚滚', '非常吃饭', '14796583265', '贵重物品', '子孙满堂', 2, 0, NULL, 1, 266, 0, '37286028159', 251, 0, 0, '', 0, 8, '2017-03-06 22:01:00', '2017-03-06 18:01:14', '1', NULL, '113.912589,22.765825', '114.160728,22.618668', 0, ''),
('181488850818023', 29, 1, '深圳市宝安区秋园雅苑子贡', '14795520543', '深圳市龙岗区阳光雅苑滚滚滚', '非常吃饭', '14796583265', '文件 易碎', '敢当', 4, 0, NULL, 1, 260, 0, '37156136901', 245, 516, 5, '送货速度快、接单快、评论', 0, 8, '2017-03-07 09:42:00', '2017-03-07 09:40:18', '1', NULL, '113.912589,22.765825', '114.160728,22.618668', 0, '4303'),
('181488854381075', 29, 1, '深圳市宝安区秋园雅苑子贡', '14795520543', '深圳市龙岗区阳光雅苑滚滚滚', '非常吃饭', '14796583265', '蛋糕 贵重物品', '至少互联网', 4, 0, NULL, 1, 260, 0, '37446903850', 240, 517, 5, '服务态度好、发货速度快、很好、人生。', 0, 3, '2017-03-07 11:43:00', '2017-03-07 10:39:41', '1', '2017-03-07 10:45:26', '113.912589,22.765825', '114.160728,22.618668', 0, ''),
('181490852177786', 31, 1, '台州市路桥区台州电子数码城b925', '13106030008', '台州市路桥区泰隆大厦13楼', '颜孙植', '13656580029', '美食', '小心輕放', 2, 0, NULL, 1, 260, 0, '37817740479', 237, 0, 0, '', 0, 0, '0000-00-00 00:00:00', '2017-03-30 13:36:17', '', NULL, '121.376373,28.595854', '121.376717,28.582354', 0, ''),
('181490853900926', 31, 1, '台州市路桥区台州电子数码城b925', '13106030008', '台州市路桥区泰隆大厦13楼', '颜孙植', '13656580029', '贵重物品', '物品贵重', 2, 0, NULL, 1, 260, 0, '37045460497', 246, 0, 0, '', 0, 9, '0000-00-00 00:00:00', '2017-03-30 14:05:00', '', NULL, '121.376373,28.595854', '121.376717,28.582354', 0, ''),
('181490931150585', 0, 32, '深圳市龙岗区五和-地铁站地钱口', '13738383388', '深圳市宝安区风和日丽门口', '杨恭如', '13568523698', '美食 洗衣 蛋糕', '付了吗？', 0, 0, NULL, 2, 260, 0, '', 0, 0, 0, '', 0, 3, '2017-03-31 17:32:00', '2017-03-31 11:32:30', '1', NULL, '114.067352,22.632603', '114.0363,22.647104', 0, ''),
('181490933054160', 0, 32, '深圳市福田区枫丹雅苑正门', '15933336666', '深圳市宝安区风和日丽门口', '杨恭如', '13568523698', '蛋糕', '日美', 0, 0, NULL, 1, 260, 0, '', 0, 0, 0, '', 0, 8, '2017-03-31 15:04:00', '2017-03-31 12:04:14', '', NULL, '114.029705,22.559672', '114.0363,22.647104', 0, ''),
('181490942773835', 0, 33, '深圳市宝安区中国工商银行(深圳龙华支行)2手', '15936852693', '深圳市罗湖区地王大厦王老师', '王卸', '18125843695', '洗衣 蛋糕', '全球通', 0, 0, NULL, 1, 266, 0, '', 0, 0, 0, '', 0, 8, '2017-03-31 23:46:00', '2017-03-31 14:46:13', '1', NULL, '114.030914,22.658303', '114.11652,22.548793', 0, ''),
('181490945270099', 30, 35, '深圳市宝安区中国工商银行(深圳龙华支行)可以', '14796325865', '深圳市宝安区深圳观澜湖高尔夫球会土匪', '共识', '14798563256', '蛋糕', '5823', 2, 0, NULL, 1, 260, 0, '', 263, 0, 0, '', 0, 3, '2017-04-25 15:27:00', '2017-03-31 15:27:50', '', NULL, '114.030914,22.658303', '114.083891,22.744453', 0, ''),
('181491786346079', 0, 36, '台州市路桥区泰隆大厦13楼', '13106030008', '台州市椒江区城市港湾-公交车站4502', 'YY', '13656580029', '文件', '重要', 0, 0, NULL, 1, 260, 0, '', 0, 0, 0, '', 0, 0, '2017-04-10 09:07:00', '2017-04-10 09:05:46', '', NULL, '121.376717,28.582354', '121.392523,28.605352', 0, ''),
('181491871108519', 37, 36, '台州市路桥区泰隆大厦13楼', '13106030008', '台州市椒江区城市港湾-公交车站4502', 'YY', '13656580029', '文件', '', 4, 0, NULL, 1, 260, 0, '', 260, 525, 0, '', 0, 0, '2017-04-11 08:39:00', '2017-04-11 08:38:28', '', '2017-04-11 10:54:04', '121.376717,28.582354', '121.392523,28.605352', 526, ''),
('181491875540475', 37, 36, '台州市路桥区泰隆大厦13楼', '13106030008', '台州市椒江区城市港湾-公交车站4502', 'YY', '13656580029', '文件', '', 4, 0, NULL, 1, 260, 0, '', 260, 532, 0, '', 0, 0, '2017-04-11 09:53:00', '2017-04-11 09:52:20', '', '2017-04-25 09:03:25', '121.376717,28.582354', '121.392523,28.605352', 533, ''),
('181491879698434', 37, 36, '台州市路桥区泰隆大厦13楼', '13106030008', '台州市椒江区城市港湾-公交车站4502', 'YY', '13656580029', '美食', '', 4, 0, NULL, 1, 260, 0, '', 260, 529, 0, '', 0, 0, '2017-04-11 11:02:00', '2017-04-11 11:01:38', '', '2017-04-25 08:57:15', '121.376717,28.582354', '121.392523,28.605352', 530, ''),
('181491974751196', 37, 36, '台州市路桥区泰隆商务大厦', '13656580029', '台州市椒江区城市港湾-公交车站4502', 'YY', '13656580029', '易碎', '', 2, 0, NULL, 1, 260, 0, '', 260, 0, 0, '', 0, 0, '2017-04-12 13:26:00', '2017-04-12 13:25:51', '', NULL, '121.362626,28.593332', '121.392523,28.605352', 0, ''),
('181492059683085', 0, 36, '台州市路桥区泰隆商务大厦', '13656580029', '台州市椒江区城市港湾-公交车站4502', 'YY', '13656580029', '文件', '', 0, 0, NULL, 1, 260, 0, '', 0, 0, 0, '', 0, 0, '2017-04-13 14:01:00', '2017-04-13 13:01:23', '', NULL, '121.362626,28.593332', '121.392523,28.605352', 0, ''),
('181492060628785', 37, 36, '台州市路桥区泰隆商务大厦', '13656580029', '台州市椒江区城市港湾-公交车站4502', 'YY', '13656580029', '文件', '', 2, 0, NULL, 1, 260, 0, '', 260, 0, 0, '', 0, 0, '2017-04-13 13:19:00', '2017-04-13 13:17:08', '', NULL, '121.362626,28.593332', '121.392523,28.605352', 0, ''),
('181492420430655', 0, 36, '台州市路桥区泰隆商务大厦', '13656580029', '台州市椒江区城市港湾-公交车站4502', 'YY', '13656580029', '文件', '', 1, 0, NULL, 1, 260, 0, '', 260, 0, 0, '', 0, 0, '2017-04-17 17:15:00', '2017-04-17 17:13:50', '', NULL, '121.362626,28.593332', '121.392523,28.605352', 0, ''),
('181493081132461', 0, 36, '台州市路桥区泰隆商务大厦', '13656580029', '台州市椒江区城市港湾-公交车站4502', 'YY', '13656580029', '文件', '太太太', 1, 0, NULL, 1, 260, 0, '', 260, 0, 0, '', 0, 0, '2017-04-25 08:46:00', '2017-04-25 08:45:32', '', NULL, '121.362626,28.593332', '121.392523,28.605352', 0, ''),
('181493708547323', 0, 36, '台州市路桥区泰隆商务大厦', '13656580029', '台州市椒江区城市港湾-公交车站4502', 'YY', '13656580029', '文件', '', 1, 0, NULL, 1, 260, 0, '', 260, 0, 0, '', 0, 0, '2017-05-02 15:05:00', '2017-05-02 15:02:27', '', NULL, '121.362626,28.593332', '121.392523,28.605352', 0, '');

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

--
-- 转存表中的数据 `ruike_express_record`
--

INSERT INTO `ruike_express_record` (`id`, `express_id`, `open_id`, `client_ip`, `status`, `location`, `create_time`, `remark`) VALUES
(1, '181476084516254', '1', '1', 0, '113.777778,34.765535', '2016-10-21 11:36:17', 'test'),
(2, '181476084516254', '1', '2', 1, '113.721778,34.615535', '2016-10-21 14:23:48', 'two');

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

--
-- 转存表中的数据 `ruike_express_setting`
--

INSERT INTO `ruike_express_setting` (`id`, `name`, `express_type`, `rule`, `status`, `start_time`, `end_time`, `remark`, `level`) VALUES
(1, '十月一日国庆节', 1, '{"normal":[{"start":"0","end":"3","money":"4"},{"start":"3","end":"5","money":"1"},{"start":"5","end":"7","money":"2"},{"start":"7","end":"9","money":"1"},{"start":"9","end":"10","money":"1"}],"TipMoney":[{"startTime":"18:59","endTime":"22:59","timeMoney":"1"},{"startTime":"23:00","endTime":"00:59","timeMoney":"2"}],"beyond":{"beyond":"30","beyondMoney":"6"}}', 1, '2016-10-09 14:50:00', '2017-01-31 10:30:00', '备注', 3),
(7, '圣诞节', 2, '{"normal":[{"start":"","end":"10","money":"4"},{"start":"10","end":"20","money":"5"},{"start":"20","end":"30","money":"7"},{"start":"30","end":"60","money":"8"},{"start":"60","end":"1000","money":"9"}],"TipMoney":[{"startTime":"18:00","endTime":"01:59","timeMoney":"7"},{"startTime":"01:59","endTime":"06:59","timeMoney":"9"}],"beyond":{"beyond":"1000","beyondMoney":"5"}}', 1, '2016-10-08 09:35:00', '2017-01-31 10:50:00', '备注', 4),
(8, '元旦', 1, '{"normal":[{"start":"","end":"2","money":"4"},{"start":"2","end":"6","money":"5"},{"start":"6","end":"8","money":"6"},{"start":"8","end":"10","money":"7"},{"start":"10","end":"30","money":"9"}],"TipMoney":[{"startTime":"18:59","endTime":"01:59","timeMoney":"6"},{"startTime":"01:59","endTime":"06:59","timeMoney":"7"}],"beyond":{"beyond":"30","beyondMoney":"6"}}', 1, '2017-02-18 07:35:00', '2017-05-31 10:50:00', '备注', 6),
(5, '九月九日重阳节', 1, '{"normal":[{"start":"0","end":"10","money":"10"},{"start":"10","end":"15","money":"3"},{"start":"15","end":"30","money":"5"},{"start":"30","end":"50","money":"9"}],"TipMoney":[{"startTime":"18:59","endTime":"00:59","timeMoney":"3"},{"startTime":"00:59","endTime":"06:00","timeMoney":"4"}]}', 1, '2016-09-26 10:50:00', '2016-10-19 14:50:00', '备注', 2),
(6, '圣诞节', 1, '{"normal":[{"start":"0","end":"10","money":"10"},{"start":"10","end":"15","money":"3"},{"start":"15","end":"30","money":"5"},{"start":"30","end":"50","money":"9"}],"TipMoney":[{"startTime":"18:59","endTime":"00:59","timeMoney":"3"},{"startTime":"00:59","endTime":"06:00","timeMoney":"4"}],"beyond":{"beyond":"30","beyondMoney":"5"}]}', 1, '2016-09-26 10:50:00', '2016-10-19 14:50:00', '安', 5);

-- --------------------------------------------------------

--
-- 表的结构 `ruike_fans`
--

CREATE TABLE IF NOT EXISTS `ruike_fans` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '记录id',
  `mobile` varchar(13) DEFAULT NULL COMMENT '手机号码',
  `head_pic` varchar(256) DEFAULT NULL COMMENT '头像',
  `is_focus` tinyint(4) unsigned NOT NULL COMMENT '是否关注：0没关注 ，1关注',
  `open_id` varchar(60) DEFAULT NULL,
  `power_open_id` varchar(64) NOT NULL COMMENT '服务号的openid',
  `client_ip` varchar(20) DEFAULT NULL COMMENT '投票客户端的IP地址',
  `union_id` varchar(60) DEFAULT NULL,
  `token` varchar(60) DEFAULT NULL,
  `nickname` varchar(256) DEFAULT NULL,
  `integral` int(20) unsigned DEFAULT NULL COMMENT '积分',
  `sex` tinyint(4) NOT NULL,
  `city` varchar(32) NOT NULL,
  `province` varchar(32) NOT NULL,
  `country` varchar(32) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=83 ;

--
-- 转存表中的数据 `ruike_fans`
--

INSERT INTO `ruike_fans` (`id`, `mobile`, `head_pic`, `is_focus`, `open_id`, `power_open_id`, `client_ip`, `union_id`, `token`, `nickname`, `integral`, `sex`, `city`, `province`, `country`, `status`) VALUES
(73, NULL, 'http://wx.qlogo.cn/mmopen/WOm5u5FTB64Tvya3Bqt3N6gUO824JmEGibn7xthN55bg3ljibOXw4XYPtBqfuxtfcszvYCCnlbUialhl3Na6iaRs7ibop4Ezb8fBx/0', 1, 'oZCEfuM3t7ZJCNmgg3DwcnsZ_Bas', 'o_Vaow7ZKJtnrL9-FlPn9AY5EAbA', NULL, 'oPzkCwD6-QwYuYg6AMYOTcnniQIE', 'atdskb1484806844', '哈根达斯', 0, 1, '', '', 'CN', 1),
(72, NULL, 'http://wx.qlogo.cn/mmopen/mm3yJHj7xy2MwjvvTZUJI1hlia1tmPr6m2Ac9iaprDwicThlyhXHemfHSgvgicK2r6fFkV8DIGrANnicFUnKMLluUkNtUaoET9jMy/0', 1, 'oZCEfuD6RyfKK9hRGW6aA30i2r6k', 'o_VaowzPNiJfjOIvzFpF5SUJlJzI', NULL, 'oPzkCwBFoc3Uc-CTgdfBStv7PjYg', 'atdskb1484806844', 'drin', NULL, 1, '深圳', '广东', '中国', 1),
(74, NULL, 'http://wx.qlogo.cn/mmopen/25q12yBoJH5RibHDl7tBpTNFZia9pYpI0PGSFA2VCj0jxv9SN8vNN51bL7Tm2u43g9TusEnJb8IjdaODYsiaEc6f5dWTjaMFHIy/0', 0, 'oZCEfuJPt7lZLUmExGRmESiVvwF8', 'oZCEfuJPt7lZLUmExGRmESiVvwF8', NULL, 'oPzkCwD7xm_OsGFoLxgOWhPWH6ok', 'atdskb1484806844', '我是老兵', NULL, 0, '', '', '', 1),
(67, NULL, 'http://wx.qlogo.cn/mmopen/ICicLd1X1MMSbGZyFHEhruUQzQWWlaLDfAsiadFw1sV5bMaiaAcpXFEULS1aOP1E7Ss8VicEiaWJBY8YJ6RZsH3cc8S8rYkKP1n7A/0', 1, 'o_VaowzPNiJfjOIvzFpF5SUJlJzI', '', NULL, 'oPzkCwBFoc3Uc-CTgdfBStv7PjYg', 'ygpwlc1484809425', 'drin', 799, 1, 'Shenzhen', 'Guangdong', 'CN', 1),
(75, NULL, 'http://wx.qlogo.cn/mmopen/ibhHR6OSef7xssE5NhXqBy6KATrZf9qPbBYnicHuS0E46HoTKsjduk0DFs2qYTqAytNqPe70J9OA2ELI5dTnRylWYBs1pxSUON/0', 0, 'oKQeFwiaK7DH6hGr6UUKbyNeez6w', 'oKQeFwiaK7DH6hGr6UUKbyNeez6w', NULL, '', 'irpfjy1484563046', '杨', NULL, 0, '', '', 'CN', 1),
(76, NULL, 'http://wx.qlogo.cn/mmopen/tb4TQrOLLazQMQtbic6FMW4R1XgXOC3Isy0DqzKNKl3oWAIqZPnIIsJP4vjusSdmicghYggRkVhNicVpUXMV50sRRbGB5GXZOdD/0', 0, 'oKQeFwoLkwHYx5YHMXxyB_MqfFLQ', 'oKQeFwoLkwHYx5YHMXxyB_MqfFLQ', NULL, '', 'irpfjy1484563046', 'wayne', NULL, 1, 'Shenzhen', 'Guangdong', 'CN', 1),
(77, NULL, 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIxXM9PedgDz7B26oyG8GoJEZiakERzkSQicqX0RIKeEZjff0ic0ibsSkTMscU5NjMFZibAWx1Itb7H8pg/0', 0, 'oKQeFwn2k_a7VJFH5LpkEx-4B8GE', 'oKQeFwn2k_a7VJFH5LpkEx-4B8GE', NULL, '', 'irpfjy1484563046', '颜孙植', NULL, 1, 'Taizhou', 'Zhejiang', 'CN', 1),
(78, NULL, 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEKyxRnD1iagNQYA8gnhln7RPPlSWLmWQjeMJ4sFMMke7TtFYWzSt7MbVMic84ZRYQLn6xU6uicC2p5gg/0', 0, 'oKQeFwlA3r0gt2EJHPRNVkAholhs', 'oKQeFwlA3r0gt2EJHPRNVkAholhs', NULL, '', 'irpfjy1484563046', '明德文化-郭玉军', NULL, 1, 'Taizhou', 'Zhejiang', 'CN', 1),
(79, NULL, 'http://wx.qlogo.cn/mmopen/ibhHR6OSef7xbBRpJnzdKeNUQfaQWRn3DPL3SMA9n0icCFxQsnBkfW5oLiaZ9f2C555VLeMdZFvRGUt3LU75DFEKBrDYTayhBpp/0', 0, 'oKQeFwuLSUHcDMVqHSlyOfdq6Nbk', 'oKQeFwuLSUHcDMVqHSlyOfdq6Nbk', NULL, '', 'irpfjy1484563046', 'chinalu', NULL, 0, 'Taizhou', 'Zhejiang', 'CN', 1),
(80, NULL, 'http://wx.qlogo.cn/mmopen/tb4TQrOLLaxVuOa9G1aP1dAm1v1lNHDfNMSkO9LoLXgLwvMmVk7jnGy8OeYbDptSauiblYVXHA8XjpFbjoIOperxukgAoicojq/0', 0, 'oKQeFwqDTUP3FRty2XG05PXpZkyM', 'oKQeFwqDTUP3FRty2XG05PXpZkyM', NULL, '', 'irpfjy1484563046', '晓睿', NULL, 1, '', '', 'CN', 1),
(81, NULL, 'http://wx.qlogo.cn/mmopen/PiajxSqBRaELoaibybwibiaLIq2uxpqerhgEbCEEKZMNCvUhDVHnmd8LRRtgicL83EwticsphDsMRibA8iaP459vOp004Q/0', 0, 'oKQeFwkQeh6BQMjldW2qvbi_bB0g', 'oKQeFwkQeh6BQMjldW2qvbi_bB0g', NULL, '', 'irpfjy1484563046', '公益顺风车', NULL, 1, 'Luliang', 'Shanxi', 'CN', 1),
(82, NULL, 'http://wx.qlogo.cn/mmopen/csNZOjnGQEZH7nmJoE1hbf0XuWoqTfcgdLZQJT9TVmtmcLXpWkUnqhS8N2htSfDW6S5hM0T0icXyHz0ib4v4SCiccVQvvUBDiaWM/0', 0, 'oKQeFwhrUrBF9MWPDOW1erz9ruU0', 'oKQeFwhrUrBF9MWPDOW1erz9ruU0', NULL, '', 'irpfjy1484563046', '哈根达斯', NULL, 1, '', '', 'CN', 1);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `ruike_feedback`
--

INSERT INTO `ruike_feedback` (`id`, `question`, `phone`, `imglist`, `create_time`) VALUES
(1, 'fdasedfeasdf', '14745333349', './uploads/picture/20161110/14787718082.jpg,./uploads/picture/20161110/14787718082.jpg', 1478771808),
(2, 'fdasedfeasdf', '14745333349', '64,65', 1478771841),
(3, '工具箱', '18345679999', '420,421', 1488446708),
(4, '天使的心跳', '18345679999', '422,423', 1488446894),
(5, '30', '', '474,475', 1488590179),
(6, '伊豆', '14788884444', '493', 1488769840);

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文件表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ruike_forum`
--

CREATE TABLE IF NOT EXISTS `ruike_forum` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL COMMENT '版块名称',
  `desc` text NOT NULL,
  `cover` int(11) NOT NULL COMMENT '封面',
  `posts_num` int(11) NOT NULL COMMENT '帖子数',
  `status` int(11) NOT NULL COMMENT '状态',
  `token` varchar(64) NOT NULL,
  `is_share` tinyint(4) NOT NULL,
  `is_focus` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `ruike_forum`
--

INSERT INTO `ruike_forum` (`id`, `name`, `desc`, `cover`, `posts_num`, `status`, `token`, `is_share`, `is_focus`) VALUES
(1, '秋天的落叶', '', 381, 1234, 1, '看哦你咯', 0, 0),
(2, '微风岸', '', 380, 234, 0, 'dfasdf', 0, 0);

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
  `status` int(11) NOT NULL,
  `client_ip` varchar(64) NOT NULL,
  `create_time` datetime NOT NULL,
  `likes_num` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=64 ;

--
-- 转存表中的数据 `ruike_forum_comments`
--

INSERT INTO `ruike_forum_comments` (`id`, `fid`, `pid`, `content`, `member_id`, `nickname`, `avatar`, `status`, `client_ip`, `create_time`, `likes_num`, `parent_id`) VALUES
(1, 1, 8, '评论一', 5, '12', 'http://ruikecmssvn.test.com/uploads/picture/20170308/4fcd34bd2c85ad236048e4427599a32e.jpeg', 1, '192.168.1.1', '2017-03-15 16:13:44', 0, 0),
(2, 1, 8, '评论2', 5, '23', 'http://ruikecmssvn.test.com/uploads/picture/20170308/4fcd34bd2c85ad236048e4427599a32e.jpeg', 1, '192.168.1.1', '2017-03-15 16:13:44', 0, 0),
(3, 1, 8, '评论3', 5, 'saber', 'http://ruikecmssvn.test.com/uploads/picture/20170308/4fcd34bd2c85ad236048e4427599a32e.jpeg', 1, '192.168.1.1', '2017-03-15 16:13:44', 0, 0),
(4, 1, 8, '评论4', 5, 'saber', 'http://ruikecmssvn.test.com/uploads/picture/20170308/4fcd34bd2c85ad236048e4427599a32e.jpeg', 1, '192.168.1.1', '2017-03-15 16:13:44', 0, 0),
(14, 1, 8, '评论4', 5, 'saber', 'http://ruikecmssvn.test.com/uploads/picture/20170308/4fcd34bd2c85ad236048e4427599a32e.jpeg', 1, '192.168.1.1', '2017-03-15 16:13:44', 0, 0),
(15, 1, 8, '评论4', 5, 'saber', 'http://ruikecmssvn.test.com/uploads/picture/20170308/4fcd34bd2c85ad236048e4427599a32e.jpeg', 1, '192.168.1.1', '2017-03-15 16:13:44', 0, 0),
(16, 1, 8, '评论4', 5, 'saber', 'http://ruikecmssvn.test.com/uploads/picture/20170308/4fcd34bd2c85ad236048e4427599a32e.jpeg', 1, '192.168.1.1', '2017-03-15 16:13:44', 0, 0),
(19, 1, 8, '评论4', 5, 'saber', 'http://ruikecmssvn.test.com/uploads/picture/20170308/4fcd34bd2c85ad236048e4427599a32e.jpeg', 1, '192.168.1.1', '2017-03-15 16:13:44', 0, 0),
(18, 1, 8, '评论4', 5, 'saber', 'http://ruikecmssvn.test.com/uploads/picture/20170308/4fcd34bd2c85ad236048e4427599a32e.jpeg', 1, '192.168.1.1', '2017-03-15 16:13:44', 0, 0),
(17, 1, 8, '评论4', 5, 'saber', 'http://ruikecmssvn.test.com/uploads/picture/20170308/4fcd34bd2c85ad236048e4427599a32e.jpeg', 1, '192.168.1.1', '2017-03-15 16:13:44', 0, 0),
(20, 1, 8, '评论4', 5, 'saber', 'http://ruikecmssvn.test.com/uploads/picture/20170308/4fcd34bd2c85ad236048e4427599a32e.jpeg', 1, '192.168.1.1', '2017-03-15 16:13:44', 0, 0),
(21, 1, 8, '评论4', 5, 'saber', 'http://ruikecmssvn.test.com/uploads/picture/20170308/4fcd34bd2c85ad236048e4427599a32e.jpeg', 1, '192.168.1.1', '2017-03-15 16:13:44', 0, 0),
(22, 1, 8, '评论4', 5, 'saber', 'http://ruikecmssvn.test.com/uploads/picture/20170308/4fcd34bd2c85ad236048e4427599a32e.jpeg', 1, '192.168.1.1', '2017-03-15 16:13:44', 0, 0),
(23, 0, 8, 'asdfasd', 0, '', 'http://ruikecmssvn.test.com/application/wap/static/forum/images/2.jpg', 1, '127.0.0.1', '2017-03-16 15:39:51', 0, 0),
(24, 0, 8, 'asdfasdf', 0, '', 'http://ruikecmssvn.test.com/application/wap/static/forum/images/7.jpg', 1, '127.0.0.1', '2017-03-16 15:40:08', 0, 0),
(25, 0, 8, 'asdfasdfsf', 0, '', 'http://ruikecmssvn.test.com/application/wap/static/forum/images/3.jpg', 1, '127.0.0.1', '2017-03-16 15:42:32', 0, 0),
(26, 0, 8, '风雅士大夫', 0, '', 'http://ruikecmssvn.test.com/application/wap/static/forum/images/2.jpg', 1, '127.0.0.1', '2017-03-16 15:42:56', 0, 0),
(27, 0, 7, '爱疯无', 0, '', 'http://ruikecmssvn.test.com/application/wap/static/forum/images/4.jpg', 1, '127.0.0.1', '2017-03-16 16:43:57', 0, 0),
(28, 0, 7, '碍士大夫', 0, '', 'http://ruikecmssvn.test.com/application/wap/static/forum/images/8.jpg', 1, '127.0.0.1', '2017-03-16 16:45:29', 0, 0),
(29, 0, 7, '阿斯顿飞', 0, '', 'http://ruikecmssvn.test.com/application/wap/static/forum/images/7.jpg', 1, '127.0.0.1', '2017-03-16 16:46:11', 0, 0),
(30, 0, 7, '发烧碟发烧碟', 0, '', 'http://ruikecmssvn.test.com/application/wap/static/forum/images/5.jpg', 1, '127.0.0.1', '2017-03-16 16:46:47', 0, 0),
(31, 0, 7, '发烧碟发', 0, '', 'http://ruikecmssvn.test.com/application/wap/static/forum/images/3.jpg', 1, '127.0.0.1', '2017-03-16 16:47:26', 0, 0),
(32, 0, 7, '发生的地方公共', 7, '', 'http://ruikecmssvn.test.com/application/wap/static/forum/images/2.jpg', 1, '127.0.0.1', '2017-03-16 16:48:09', 0, 0),
(33, 0, 8, '666', 0, '', 'http://ruikecmssvn.test.com/application/wap/static/forum/images/6.jpg', 1, '127.0.0.1', '2017-03-16 17:21:55', 0, 0),
(34, 0, 8, 'uuuuuuuuuu', 0, '', 'http://ruikecmssvn.test.com/application/wap/static/forum/images/3.jpg', 1, '127.0.0.1', '2017-03-16 17:27:58', 0, 0),
(35, 0, 3, '255954368', 0, 'yang', 'http://wx.qlogo.cn/mmopen/WOm5u5FTB64Tvya3Bqt3N6gUO824JmEGibn7xthN55bg3ljibOXw4XYPtBqfuxtfcszvYCCnlbUialhl3Na6iaRs7ibop4Ezb8fBx/0', 1, '223.73.0.70', '2017-03-17 09:32:53', 0, 0),
(36, 0, 3, '英雄联盟', 0, 'yang', 'http://wx.qlogo.cn/mmopen/WOm5u5FTB64Tvya3Bqt3N6gUO824JmEGibn7xthN55bg3ljibOXw4XYPtBqfuxtfcszvYCCnlbUialhl3Na6iaRs7ibop4Ezb8fBx/0', 1, '223.73.0.70', '2017-03-17 09:33:05', 0, 0),
(37, 0, 3, 'http://diyijia.ruikesoft.com/index.php/wap/forum/detail/token/ygpwlc1484809425/openId/o_VaowzPNiJfjOIvzFpF5SUJlJzI/lid/3', 0, 'yang', 'http://wx.qlogo.cn/mmopen/WOm5u5FTB64Tvya3Bqt3N6gUO824JmEGibn7xthN55bg3ljibOXw4XYPtBqfuxtfcszvYCCnlbUialhl3Na6iaRs7ibop4Ezb8fBx/0', 1, '223.73.0.70', '2017-03-17 09:34:56', 0, 0),
(38, 0, 3, '阿斯顿飞', 0, 'yang', 'http://wx.qlogo.cn/mmopen/WOm5u5FTB64Tvya3Bqt3N6gUO824JmEGibn7xthN55bg3ljibOXw4XYPtBqfuxtfcszvYCCnlbUialhl3Na6iaRs7ibop4Ezb8fBx/0', 1, '223.73.0.70', '2017-03-17 09:35:48', 0, 0),
(44, 0, 32, '有钱法律', 0, 'yang', 'http://wx.qlogo.cn/mmopen/WOm5u5FTB64Tvya3Bqt3N6gUO824JmEGibn7xthN55bg3ljibOXw4XYPtBqfuxtfcszvYCCnlbUialhl3Na6iaRs7ibop4Ezb8fBx/0', 0, '223.73.0.70', '2017-03-17 15:16:07', 0, 0),
(40, 0, 3, '剑姬如千泷', 0, 'yang', 'http://wx.qlogo.cn/mmopen/WOm5u5FTB64Tvya3Bqt3N6gUO824JmEGibn7xthN55bg3ljibOXw4XYPtBqfuxtfcszvYCCnlbUialhl3Na6iaRs7ibop4Ezb8fBx/0', 1, '223.73.0.70', '2017-03-17 09:56:28', 0, 0),
(41, 0, 3, '千万', 0, 'yang', 'http://wx.qlogo.cn/mmopen/WOm5u5FTB64Tvya3Bqt3N6gUO824JmEGibn7xthN55bg3ljibOXw4XYPtBqfuxtfcszvYCCnlbUialhl3Na6iaRs7ibop4Ezb8fBx/0', 1, '223.73.0.70', '2017-03-17 10:02:42', 0, 0),
(42, 0, 27, '这个是的', 0, 'yang', 'http://wx.qlogo.cn/mmopen/WOm5u5FTB64Tvya3Bqt3N6gUO824JmEGibn7xthN55bg3ljibOXw4XYPtBqfuxtfcszvYCCnlbUialhl3Na6iaRs7ibop4Ezb8fBx/0', 1, '223.73.0.70', '2017-03-17 10:29:19', 0, 0),
(43, 0, 8, '半财产权', 0, 'yang', 'http://wx.qlogo.cn/mmopen/WOm5u5FTB64Tvya3Bqt3N6gUO824JmEGibn7xthN55bg3ljibOXw4XYPtBqfuxtfcszvYCCnlbUialhl3Na6iaRs7ibop4Ezb8fBx/0', 1, '223.73.0.70', '2017-03-17 10:39:55', 0, 0),
(47, 0, 33, 'fasdfasdf', 1, 'yang', 'http://wx.qlogo.cn/mmopen/WOm5u5FTB64Tvya3Bqt3N6gUO824JmEGibn7xthN55bg3ljibOXw4XYPtBqfuxtfcszvYCCnlbUialhl3Na6iaRs7ibop4Ezb8fBx/0', 1, '223.73.0.70', '2017-03-17 18:34:25', 0, 0),
(45, 0, 32, '长时间', 0, 'yang', 'http://wx.qlogo.cn/mmopen/WOm5u5FTB64Tvya3Bqt3N6gUO824JmEGibn7xthN55bg3ljibOXw4XYPtBqfuxtfcszvYCCnlbUialhl3Na6iaRs7ibop4Ezb8fBx/0', 1, '223.73.0.70', '2017-03-17 15:17:08', 0, 0),
(46, 0, 32, '政策', 0, 'yang', 'http://wx.qlogo.cn/mmopen/WOm5u5FTB64Tvya3Bqt3N6gUO824JmEGibn7xthN55bg3ljibOXw4XYPtBqfuxtfcszvYCCnlbUialhl3Na6iaRs7ibop4Ezb8fBx/0', 1, '223.73.0.70', '2017-03-17 15:22:25', 0, 0),
(48, 0, 36, '托管班', 1, 'yang', 'http://wx.qlogo.cn/mmopen/WOm5u5FTB64Tvya3Bqt3N6gUO824JmEGibn7xthN55bg3ljibOXw4XYPtBqfuxtfcszvYCCnlbUialhl3Na6iaRs7ibop4Ezb8fBx/0', 1, '223.73.0.105', '2017-03-21 14:53:11', 0, 0),
(49, 0, 37, '恶兽后', 1, 'yang', 'http://wx.qlogo.cn/mmopen/WOm5u5FTB64Tvya3Bqt3N6gUO824JmEGibn7xthN55bg3ljibOXw4XYPtBqfuxtfcszvYCCnlbUialhl3Na6iaRs7ibop4Ezb8fBx/0', 1, '223.73.0.105', '2017-03-21 14:58:41', 0, 0),
(50, 0, 37, '巍峨哦', 1, 'yang', 'http://wx.qlogo.cn/mmopen/WOm5u5FTB64Tvya3Bqt3N6gUO824JmEGibn7xthN55bg3ljibOXw4XYPtBqfuxtfcszvYCCnlbUialhl3Na6iaRs7ibop4Ezb8fBx/0', 1, '223.73.0.105', '2017-03-21 14:58:51', 0, 0),
(51, 0, 37, '发烧碟的哦', 1, 'yang', 'http://wx.qlogo.cn/mmopen/WOm5u5FTB64Tvya3Bqt3N6gUO824JmEGibn7xthN55bg3ljibOXw4XYPtBqfuxtfcszvYCCnlbUialhl3Na6iaRs7ibop4Ezb8fBx/0', 1, '223.73.0.105', '2017-03-21 14:59:48', 0, 0),
(52, 0, 37, 'ab', 1, 'yang', 'http://wx.qlogo.cn/mmopen/WOm5u5FTB64Tvya3Bqt3N6gUO824JmEGibn7xthN55bg3ljibOXw4XYPtBqfuxtfcszvYCCnlbUialhl3Na6iaRs7ibop4Ezb8fBx/0', 1, '223.73.0.105', '2017-03-21 15:16:43', 0, 0),
(53, 0, 36, '好的', 67, 'drin', 'http://wx.qlogo.cn/mmopen/ICicLd1X1MMSbGZyFHEhruUQzQWWlaLDfAsiadFw1sV5bMaiaAcpXFEULS1aOP1E7Ss8VicEiaWJBY8YJ6RZsH3cc8S8rYkKP1n7A/0', 1, '223.73.0.96', '2017-03-24 10:06:11', 0, 0),
(54, 0, 37, '恐龙是龙虾', 67, 'drin', 'http://wx.qlogo.cn/mmopen/ICicLd1X1MMSbGZyFHEhruUQzQWWlaLDfAsiadFw1sV5bMaiaAcpXFEULS1aOP1E7Ss8VicEiaWJBY8YJ6RZsH3cc8S8rYkKP1n7A/0', 1, '223.73.0.96', '2017-03-24 10:32:37', 0, 0),
(55, 0, 37, '工具箱', 67, 'drin', 'http://wx.qlogo.cn/mmopen/ICicLd1X1MMSbGZyFHEhruUQzQWWlaLDfAsiadFw1sV5bMaiaAcpXFEULS1aOP1E7Ss8VicEiaWJBY8YJ6RZsH3cc8S8rYkKP1n7A/0', 1, '223.73.0.96', '2017-03-24 10:44:06', 0, 0),
(56, 0, 37, '凡是', 67, 'drin', 'http://wx.qlogo.cn/mmopen/ICicLd1X1MMSbGZyFHEhruUQzQWWlaLDfAsiadFw1sV5bMaiaAcpXFEULS1aOP1E7Ss8VicEiaWJBY8YJ6RZsH3cc8S8rYkKP1n7A/0', 1, '223.73.0.96', '2017-03-24 10:44:40', 0, 0),
(57, 0, 37, '分俄罗斯', 67, 'drin', 'http://wx.qlogo.cn/mmopen/ICicLd1X1MMSbGZyFHEhruUQzQWWlaLDfAsiadFw1sV5bMaiaAcpXFEULS1aOP1E7Ss8VicEiaWJBY8YJ6RZsH3cc8S8rYkKP1n7A/0', 1, '223.73.0.96', '2017-03-24 10:46:13', 0, 50),
(58, 0, 37, '工商管理', 67, 'drin', 'http://wx.qlogo.cn/mmopen/ICicLd1X1MMSbGZyFHEhruUQzQWWlaLDfAsiadFw1sV5bMaiaAcpXFEULS1aOP1E7Ss8VicEiaWJBY8YJ6RZsH3cc8S8rYkKP1n7A/0', 1, '223.73.0.96', '2017-03-24 10:46:34', 0, 54),
(59, 0, 37, '自生自灭', 67, 'drin', 'http://wx.qlogo.cn/mmopen/ICicLd1X1MMSbGZyFHEhruUQzQWWlaLDfAsiadFw1sV5bMaiaAcpXFEULS1aOP1E7Ss8VicEiaWJBY8YJ6RZsH3cc8S8rYkKP1n7A/0', 1, '223.73.0.96', '2017-03-24 10:47:04', 0, 58),
(60, 0, 37, '凡是分俄罗斯', 67, 'drin', 'http://wx.qlogo.cn/mmopen/ICicLd1X1MMSbGZyFHEhruUQzQWWlaLDfAsiadFw1sV5bMaiaAcpXFEULS1aOP1E7Ss8VicEiaWJBY8YJ6RZsH3cc8S8rYkKP1n7A/0', 1, '223.73.0.96', '2017-03-24 10:47:24', 0, 0),
(61, 0, 37, '么没', 67, 'drin', 'http://wx.qlogo.cn/mmopen/ICicLd1X1MMSbGZyFHEhruUQzQWWlaLDfAsiadFw1sV5bMaiaAcpXFEULS1aOP1E7Ss8VicEiaWJBY8YJ6RZsH3cc8S8rYkKP1n7A/0', 1, '223.73.0.96', '2017-03-24 10:47:52', 0, 49),
(62, 0, 37, '亚古惑仔', 67, 'drin', 'http://wx.qlogo.cn/mmopen/ICicLd1X1MMSbGZyFHEhruUQzQWWlaLDfAsiadFw1sV5bMaiaAcpXFEULS1aOP1E7Ss8VicEiaWJBY8YJ6RZsH3cc8S8rYkKP1n7A/0', 1, '223.73.0.96', '2017-03-24 10:59:05', 0, 49),
(63, 0, 37, '能帮帮助学金', 67, 'drin', 'http://wx.qlogo.cn/mmopen/ICicLd1X1MMSbGZyFHEhruUQzQWWlaLDfAsiadFw1sV5bMaiaAcpXFEULS1aOP1E7Ss8VicEiaWJBY8YJ6RZsH3cc8S8rYkKP1n7A/0', 1, '223.73.0.96', '2017-03-24 10:59:37', 0, 0);

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
  `cid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pid` (`pid`,`member_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- 转存表中的数据 `ruike_forum_likes`
--

INSERT INTO `ruike_forum_likes` (`id`, `pid`, `member_id`, `is_like`, `client_ip`, `last_time`, `cid`) VALUES
(1, 21, 1, 0, '223.73.0.70', '2017-03-17 19:11:22', 0),
(2, 3, 1, 1, '223.73.0.70', '2017-03-17 10:19:48', 0),
(3, 2, 1, 1, '223.73.0.70', '2017-03-17 09:55:46', 0),
(4, 14, 1, 1, '223.73.0.70', '2017-03-17 09:55:22', 0),
(5, 18, 1, 1, '223.73.0.70', '2017-03-17 09:56:03', 0),
(6, 27, 1, 1, '223.73.0.70', '2017-03-17 10:29:08', 0),
(7, 8, 1, 1, '223.73.0.70', '2017-03-17 11:10:34', 0),
(8, 33, 1, 1, '223.73.0.70', '2017-03-17 19:15:03', 0),
(9, 34, 1, 0, '223.73.0.70', '2017-03-17 19:22:39', 0),
(10, 32, 1, 0, '223.73.0.70', '2017-03-17 19:14:57', 0),
(11, 35, 1, 0, '223.73.0.70', '2017-03-17 19:22:21', 0);

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
  `head_pic` int(10) NOT NULL COMMENT '头部图像',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=39 ;

--
-- 转存表中的数据 `ruike_forum_posts`
--

INSERT INTO `ruike_forum_posts` (`id`, `fid`, `content`, `status`, `member_id`, `nickname`, `avatar`, `client_ip`, `likes_num`, `comments_num`, `create_time`, `bg_color`, `head_pic`) VALUES
(33, 0, 'diyijiadfasdfasf', 1, 1, 'yang', 'http://wx.qlogo.cn/mmopen/WOm5u5FTB64Tvya3Bqt3N6gUO824JmEGibn7xthN55bg3ljibOXw4XYPtBqfuxtfcszvYCCnlbUialhl3Na6iaRs7ibop4Ezb8fBx/0', '223.73.0.70', -1, 1, '2017-03-17 18:33:52', '#dba6a1', 9),
(1, 1, '第一条', 1, 5, '刘德华', '/uploads/picture/20170220/38a34aa56f32bbc219ab12c1a3e08eb0.jpg', '192.168.1.1', 125, 41, '2017-03-15 14:10:07', '#000000', 0),
(3, 1, '第一条', 1, 5, '刘德华', '/uploads/picture/20170220/38a34aa56f32bbc219ab12c1a3e08eb0.jpg', '192.168.1.1', 124, 6, '2017-03-15 14:10:07', '#000000', 0),
(4, 1, '第一条', 1, 5, '刘德华', '/uploads/picture/20170220/38a34aa56f32bbc219ab12c1a3e08eb0.jpg', '192.168.1.1', 124, 41, '2017-03-15 14:10:07', '#000000', 0),
(7, 1, '第一条', 1, 5, '刘德华', '/uploads/picture/20170220/38a34aa56f32bbc219ab12c1a3e08eb0.jpg', '192.168.1.1', 123, 41, '2017-03-15 14:10:07', '#000000', 0),
(8, 1, '第8条', 1, 5, '刘德华', '/uploads/picture/20170220/38a34aa56f32bbc219ab12c1a3e08eb0.jpg', '192.168.1.1', 111, 20, '2017-03-15 14:10:07', '#000000', 0),
(9, 1, '第一条', 1, 5, '刘德华', '/uploads/picture/20170220/38a34aa56f32bbc219ab12c1a3e08eb0.jpg', '192.168.1.1', 123, 41, '2017-03-15 14:10:07', '#000000', 0),
(10, 1, '第一条', 1, 5, '刘德华', '/uploads/picture/20170220/38a34aa56f32bbc219ab12c1a3e08eb0.jpg', '192.168.1.1', 123, 41, '2017-03-15 14:10:07', '#000000', 0),
(11, 1, '第一条', 1, 5, '刘德华', '/uploads/picture/20170220/38a34aa56f32bbc219ab12c1a3e08eb0.jpg', '192.168.1.1', 123, 41, '2017-03-15 14:10:07', '#000000', 0),
(12, 1, '第一条', 1, 5, '刘德华', '/uploads/picture/20170220/38a34aa56f32bbc219ab12c1a3e08eb0.jpg', '192.168.1.1', 123, 41, '2017-03-15 14:10:07', '#000000', 0),
(13, 1, '第一条', 1, 5, '刘德华', '/uploads/picture/20170220/38a34aa56f32bbc219ab12c1a3e08eb0.jpg', '192.168.1.1', 123, 41, '2017-03-15 14:10:07', '#000000', 0),
(14, 1, '第一条', 1, 5, '刘德华', '/uploads/picture/20170220/38a34aa56f32bbc219ab12c1a3e08eb0.jpg', '192.168.1.1', 124, 41, '2017-03-15 14:10:07', '#000000', 0),
(15, 0, '说的个啊撒旦发生大幅发生告诉对方', 1, 0, '', 'http://ruikecmssvn.test.com/application/wap/static/forum/images/11.png', '127.0.0.1', 0, 0, '2017-03-16 16:16:11', '#89cccb', 0),
(16, 0, '说个鸟啊是发烧碟发', 1, 0, '', 'http://ruikecmssvn.test.com/application/wap/static/forum/images/1.png', '127.0.0.1', 0, 0, '2017-03-16 16:18:33', '#e9d4a9', 0),
(17, 0, '说个鸟啊的', 1, 0, '', 'http://ruikecmssvn.test.com/application/wap/static/forum/images/9.png', '127.0.0.1', 0, 0, '2017-03-16 16:18:47', '#c6a6c1', 0),
(18, 0, '说个鸟发烧碟发', 1, 0, '', 'http://ruikecmssvn.test.com/application/wap/static/forum/images/3.png', '127.0.0.1', 1, 0, '2017-03-16 16:19:36', '#e9d4a9', 0),
(19, 0, '说个鸟发阿斯顿发生的', 1, 0, '', 'http://ruikecmssvn.test.com/application/wap/static/forum/images/5.png', '127.0.0.1', 0, 0, '2017-03-16 16:21:10', '#dba6a1', 0),
(20, 0, '说个鸟啊', 1, 0, '', 'http://ruikecmssvn.test.com/application/wap/static/forum/images/6.png', '127.0.0.1', 0, 0, '2017-03-16 16:22:02', '#89cccb', 0),
(21, 0, '发撒旦发生大幅阿斯顿发生的发生发大沙发阿斯顿飞发烧碟', 1, 0, '', 'http://ruikecmssvn.test.com/application/wap/static/forum/images/6.png', '127.0.0.1', -2, 0, '2017-03-16 17:26:43', '#e9d4a9', 0),
(22, 0, '了我半小时', 1, 0, 'yang', 'http://wx.qlogo.cn/mmopen/WOm5u5FTB64Tvya3Bqt3N6gUO824JmEGibn7xthN55bg3ljibOXw4XYPtBqfuxtfcszvYCCnlbUialhl3Na6iaRs7ibop4Ezb8fBx/0', '223.73.0.70', 0, 0, '2017-03-17 09:28:44', '#d3cc72', 0),
(23, 0, '共产党', 1, 0, 'yang', 'http://wx.qlogo.cn/mmopen/WOm5u5FTB64Tvya3Bqt3N6gUO824JmEGibn7xthN55bg3ljibOXw4XYPtBqfuxtfcszvYCCnlbUialhl3Na6iaRs7ibop4Ezb8fBx/0', '223.73.0.70', 0, 0, '2017-03-17 10:03:38', '#d3cc72', 0),
(24, 0, '坪洲际导弹', 1, 0, 'yang', 'http://wx.qlogo.cn/mmopen/WOm5u5FTB64Tvya3Bqt3N6gUO824JmEGibn7xthN55bg3ljibOXw4XYPtBqfuxtfcszvYCCnlbUialhl3Na6iaRs7ibop4Ezb8fBx/0', '223.73.0.70', 0, 0, '2017-03-17 10:05:34', '#90cbe3', 0),
(25, 0, '你们都实？', 1, 0, 'yang', 'http://wx.qlogo.cn/mmopen/WOm5u5FTB64Tvya3Bqt3N6gUO824JmEGibn7xthN55bg3ljibOXw4XYPtBqfuxtfcszvYCCnlbUialhl3Na6iaRs7ibop4Ezb8fBx/0', '223.73.0.70', 0, 0, '2017-03-17 10:13:38', NULL, 0),
(26, 0, '好的好的', 1, 0, 'yang', 'http://wx.qlogo.cn/mmopen/WOm5u5FTB64Tvya3Bqt3N6gUO824JmEGibn7xthN55bg3ljibOXw4XYPtBqfuxtfcszvYCCnlbUialhl3Na6iaRs7ibop4Ezb8fBx/0', '223.73.0.70', 0, 0, '2017-03-17 10:14:01', '#62ad98', 0),
(27, 0, 'xxx工具', 1, 0, 'yang', 'http://wx.qlogo.cn/mmopen/WOm5u5FTB64Tvya3Bqt3N6gUO824JmEGibn7xthN55bg3ljibOXw4XYPtBqfuxtfcszvYCCnlbUialhl3Na6iaRs7ibop4Ezb8fBx/0', '223.73.0.70', 1, 1, '2017-03-17 10:19:31', '#f5d575', 0),
(28, 0, '绿色的', 1, 0, 'yang', 'http://wx.qlogo.cn/mmopen/WOm5u5FTB64Tvya3Bqt3N6gUO824JmEGibn7xthN55bg3ljibOXw4XYPtBqfuxtfcszvYCCnlbUialhl3Na6iaRs7ibop4Ezb8fBx/0', '223.73.0.70', 0, 0, '2017-03-17 11:27:50', '#89cccb', 0),
(29, 0, '蓝色的', 1, 0, 'yang', 'http://wx.qlogo.cn/mmopen/WOm5u5FTB64Tvya3Bqt3N6gUO824JmEGibn7xthN55bg3ljibOXw4XYPtBqfuxtfcszvYCCnlbUialhl3Na6iaRs7ibop4Ezb8fBx/0', '223.73.0.70', 0, 0, '2017-03-17 11:28:03', '#90cbe3', 0),
(30, 0, '紫色烟花', 1, 0, 'yang', 'http://wx.qlogo.cn/mmopen/WOm5u5FTB64Tvya3Bqt3N6gUO824JmEGibn7xthN55bg3ljibOXw4XYPtBqfuxtfcszvYCCnlbUialhl3Na6iaRs7ibop4Ezb8fBx/0', '223.73.0.70', 0, 0, '2017-03-17 11:28:15', '#c6a6c1', 0),
(31, 0, '红色的', 1, 0, 'yang', 'http://wx.qlogo.cn/mmopen/WOm5u5FTB64Tvya3Bqt3N6gUO824JmEGibn7xthN55bg3ljibOXw4XYPtBqfuxtfcszvYCCnlbUialhl3Na6iaRs7ibop4Ezb8fBx/0', '223.73.0.70', 0, 0, '2017-03-17 11:28:40', '#dba6a1', 0),
(32, 0, 'NW', 1, 0, 'yang', 'http://wx.qlogo.cn/mmopen/WOm5u5FTB64Tvya3Bqt3N6gUO824JmEGibn7xthN55bg3ljibOXw4XYPtBqfuxtfcszvYCCnlbUialhl3Na6iaRs7ibop4Ezb8fBx/0', '223.73.0.70', -2, 3, '2017-03-17 11:59:43', '#c6a6c1', 1),
(34, 0, '给v刚刚', 1, 1, 'yang', 'http://wx.qlogo.cn/mmopen/WOm5u5FTB64Tvya3Bqt3N6gUO824JmEGibn7xthN55bg3ljibOXw4XYPtBqfuxtfcszvYCCnlbUialhl3Na6iaRs7ibop4Ezb8fBx/0', '223.73.0.70', -2, 0, '2017-03-17 18:33:53', '#6e7d8f', 3),
(35, 0, '代表什么', 1, 1, 'yang', 'http://wx.qlogo.cn/mmopen/WOm5u5FTB64Tvya3Bqt3N6gUO824JmEGibn7xthN55bg3ljibOXw4XYPtBqfuxtfcszvYCCnlbUialhl3Na6iaRs7ibop4Ezb8fBx/0', '223.73.0.70', 0, 0, '2017-03-17 19:22:01', '#d3cc72', 4),
(36, 0, '说什么呢', 1, 1, 'yang', 'http://wx.qlogo.cn/mmopen/WOm5u5FTB64Tvya3Bqt3N6gUO824JmEGibn7xthN55bg3ljibOXw4XYPtBqfuxtfcszvYCCnlbUialhl3Na6iaRs7ibop4Ezb8fBx/0', '223.73.0.105', 0, 2, '2017-03-21 14:52:59', '#6e7d8f', 11),
(37, 0, '卡米拉', 1, 1, 'yang', 'http://wx.qlogo.cn/mmopen/WOm5u5FTB64Tvya3Bqt3N6gUO824JmEGibn7xthN55bg3ljibOXw4XYPtBqfuxtfcszvYCCnlbUialhl3Na6iaRs7ibop4Ezb8fBx/0', '223.73.0.105', 0, 14, '2017-03-21 14:58:31', '#e9d4a9', 9),
(38, 0, '匿名留言', 1, 67, 'drin', 'http://wx.qlogo.cn/mmopen/ICicLd1X1MMSbGZyFHEhruUQzQWWlaLDfAsiadFw1sV5bMaiaAcpXFEULS1aOP1E7Ss8VicEiaWJBY8YJ6RZsH3cc8S8rYkKP1n7A/0', '223.73.0.105', 0, 0, '2017-03-22 11:51:52', '', 0);

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

--
-- 转存表中的数据 `ruike_hooks`
--

INSERT INTO `ruike_hooks` (`id`, `name`, `description`, `type`, `update_time`, `addons`, `status`) VALUES
(1, 'pageHeader', '页面header钩子，一般用于加载插件CSS文件和代码', 1, 0, '', 1),
(2, 'pageFooter', '页面footer钩子，一般用于加载插件JS文件和JS代码', 1, 0, '', 1),
(3, 'documentEditForm', '添加编辑表单的 扩展内容钩子', 1, 0, '', 1),
(4, 'documentDetailAfter', '文档末尾显示', 1, 0, '', 1),
(5, 'documentDetailBefore', '页面内容前显示用钩子', 1, 0, '', 1),
(6, 'documentSaveComplete', '保存文档数据后的扩展钩子', 2, 0, '', 1),
(7, 'documentEditFormContent', '添加编辑表单的内容显示钩子', 1, 0, '', 1),
(8, 'adminArticleEdit', '后台内容编辑页编辑器', 1, 1378982734, '', 1),
(13, 'AdminIndex', '首页小格子个性化显示', 1, 1382596073, 'Sitestat,Devteam,Systeminfo', 1),
(14, 'topicComment', '评论提交方式扩展钩子。', 1, 1380163518, '', 1),
(16, 'app_begin', '应用开始', 2, 1384481614, '', 1),
(17, 'J_China_City', '每个系统都需要的一个中国省市区三级联动插件。', 1, 1455877345, '', 1);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=25 ;

--
-- 转存表中的数据 `ruike_integral_mall`
--

INSERT INTO `ruike_integral_mall` (`id`, `title`, `integral`, `unit`, `status`, `number`, `cover`, `content`, `category`, `sort`, `hot`, `create_time`, `request_express`, `exchange_quantity`) VALUES
(23, '梅花', 80, '梅花币', 1, 897, '344', '<p>hellor<img src="/uploads/editor/20161208/802e4165d8a251395fc3149e024ffe94.jpg" _src="/uploads/editor/20161208/802e4165d8a251395fc3149e024ffe94.jpg"/></p>', 2, 3, 1, '2016-12-08 18:35:31', 0, 12),
(24, '桃花', 80, '桃花币', 1, 898, '345', '<p>hellor<img src="/uploads/editor/20161208/802e4165d8a251395fc3149e024ffe94.jpg" _src="/uploads/editor/20161208/802e4165d8a251395fc3149e024ffe94.jpg"/></p>', 2, 3, 1, '2016-12-08 18:35:31', 0, 12);

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

--
-- 转存表中的数据 `ruike_integral_mall_category`
--

INSERT INTO `ruike_integral_mall_category` (`id`, `category_name`, `sort`, `pid`) VALUES
(1, '衣装', 1, 0),
(2, '男装', 2, 5),
(3, '女装', 3, 1),
(4, '童装', 4, 1),
(5, '食品', 5, 0),
(6, '外套', 4, 1),
(7, '女装外3', 6, 3),
(8, '书院', 6, 0),
(10, '男童装', 7, 4),
(11, '女童装', 7, 10);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

--
-- 转存表中的数据 `ruike_integral_mall_order`
--

INSERT INTO `ruike_integral_mall_order` (`id`, `product_id`, `member_id`, `integral`, `status`, `client_ip`, `create_time`, `express_id`, `remarks`) VALUES
(1, 2, 1, 0, 0, '192.167.1.1', '2016-12-09 11:30:38', '1', '好货'),
(2, 2, 1, 30, 3, '192.167.1.1', '2016-12-09 11:30:38', '2', NULL),
(3, 2, 1, 30, 0, '192.167.1.1', '2016-12-09 11:30:38', '3', NULL),
(4, 2, 1, 30, 3, '192.167.1.1', '2016-12-09 11:30:38', '123456789', NULL),
(5, 2, 1, 30, 3, '192.167.1.1', '2016-12-09 11:30:38', '5', NULL),
(6, 2, 1, 30, 0, '192.167.1.1', '2016-12-09 11:30:38', '6', '货物不好'),
(7, 2, 1, 30, 1, '192.167.1.1', '2016-12-09 11:30:38', '7', NULL),
(8, 2, 1, 30, 1, '192.167.1.1', '2016-12-09 11:30:38', '8', NULL),
(9, 2, 1, 30, 1, '192.167.1.1', '2016-12-09 11:30:38', '9', NULL),
(10, 2, 1, 30, 3, '192.167.1.1', '2016-12-09 11:30:38', '10', NULL),
(11, 2, 1, 30, 1, '192.167.1.1', '2016-12-09 11:30:38', '11', NULL),
(12, 2, 1, 30, 3, '192.167.1.1', '2016-12-09 11:30:38', '12', NULL),
(13, 18, 1, 0, 1, '127.0.0.1', '2017-01-16 20:17:21', '1811484569041', '订单id是商品id+fansId+时间戳'),
(14, 18, 1, 0, 1, '127.0.0.1', '2017-01-16 20:17:38', '1811484569058', '订单id是商品id+fansId+时间戳'),
(15, 18, 1, 0, 1, '127.0.0.1', '2017-01-17 17:16:10', '1811484644570', '订单id是商品id+fansId+时间戳'),
(16, 18, 1, 0, 1, '127.0.0.1', '2017-01-17 17:16:55', '1811484644615', '订单id是商品id+fansId+时间戳'),
(17, 3, 68, 0, 1, '14.17.37.68', '2017-01-22 22:49:11', '3681485096551', '订单id是商品id+fansId+时间戳'),
(18, 5, 68, 0, 1, '14.17.37.102', '2017-01-23 09:42:38', '5681485135758', '订单id是商品id+fansId+时间戳'),
(19, 7, 73, 0, 1, '183.61.52.71', '2017-01-26 13:01:11', '7731485406871', '订单id是商品id+fansId+时间戳'),
(20, 7, 73, 0, 1, '183.61.52.71', '2017-01-26 13:14:01', '7731485407641', '订单id是商品id+fansId+时间戳');

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

--
-- 转存表中的数据 `ruike_invite`
--

INSERT INTO `ruike_invite` (`id`, `invite_id`, `be_invited_id`, `invite_time`, `entry_time`, `status`, `type`, `reward_type`, `reward`, `remarks`) VALUES
(1, 1, 5, '2016-10-25 10:40:22', '2016-10-26 10:40:26', 1, 1, 1, '20', 'test'),
(2, 1, 5, '2016-10-25 10:40:22', '2016-10-26 10:40:26', 1, 1, 0, '20', 'test'),
(3, 1, 2, '2016-10-25 10:40:22', '2016-10-26 10:40:26', 1, 1, 0, '20', 'test'),
(4, 1, 3, '2016-10-25 10:40:22', '2016-10-26 10:40:26', 1, 1, 0, '20', 'test'),
(5, 1, 4, '2016-10-25 10:40:22', '2016-10-26 10:40:26', 1, 1, 0, '20', 'test'),
(6, 1, 6, '2016-10-25 10:40:22', '2016-10-26 10:40:26', 1, 1, 0, '20', 'test'),
(7, 1, 7, '2016-10-25 10:40:22', '2016-10-26 10:40:26', 1, 1, 0, '20', 'test'),
(8, 1, 8, '2016-10-25 10:40:22', '2016-10-26 10:40:26', 1, 1, 0, '20', 'test'),
(9, 1, 9, '2016-10-25 10:40:22', '2016-10-26 10:40:26', 1, 1, 0, '20', 'test'),
(10, 1, 10, '2016-10-25 10:40:22', '2016-10-26 10:40:26', 1, 1, 0, '20', 'test'),
(11, 1, 11, '2016-10-25 10:40:22', '2016-10-26 10:40:26', 1, 1, 0, '20', 'test'),
(12, 1, 12, '2016-10-25 10:40:22', '2016-10-26 10:40:26', 1, 1, 0, '20', 'test'),
(13, 1, 13, '2016-10-25 10:40:22', '2016-10-26 10:40:26', 1, 1, 0, '20', 'test'),
(14, 1, 14, '2016-10-25 10:40:22', '2016-10-26 10:40:26', 1, 1, 0, '20', 'test'),
(15, 1, 15, '2016-10-25 10:40:22', '2016-10-26 10:40:26', 1, 1, 0, '20', 'test'),
(16, 1, 16, '2016-10-25 10:40:22', '2016-10-26 10:40:26', 1, 1, 0, '20', 'test'),
(17, 1, 17, '2016-10-25 10:40:22', '2016-10-26 10:40:26', 1, 1, 0, '20', 'test'),
(18, 1, 18, '2016-10-25 10:40:22', '2016-10-26 10:40:26', 1, 1, 0, '20', 'test'),
(19, 1, 19, '2016-10-25 10:40:22', '2016-10-26 10:40:26', 1, 1, 1, '20', 'test'),
(20, 1, 20, '2016-10-25 10:40:22', '2016-10-26 10:40:26', 1, 1, 0, '20', 'test'),
(21, 1, 21, '2016-11-25 09:59:31', NULL, 1, 1, 0, '12', 'test');

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
  `open_id` varchar(512) NOT NULL,
  PRIMARY KEY (`uid`),
  KEY `status` (`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='会员表' AUTO_INCREMENT=42 ;

--
-- 转存表中的数据 `ruike_member`
--

INSERT INTO `ruike_member` (`uid`, `reviewed`, `username`, `password`, `nickname`, `email`, `mobile`, `sex`, `birthday`, `qq`, `score`, `signature`, `pos_province`, `pos_city`, `pos_district`, `pos_community`, `salt`, `login`, `reg_ip`, `reg_time`, `last_login_ip`, `last_login_time`, `status`, `is_admin`, `user_type`, `businessman`, `logo`, `qrcode`, `money`, `invite_code`, `location`, `account_type`, `account`, `id_card`, `id_card_pic`, `Audited`, `puid`, `vehicle_type`, `vechicle_plate_number`, `incubator`, `refuse_num`, `open_id`) VALUES
(2, 0, '疯子', '', '风姿', '13413241233@qq.com', '13666666666', 1, '0000-00-00', '', 0, NULL, 0, 0, 0, 0, '', 0, '0', 0, '0', 0, 0, 0, 1, '', '33', '', 0.00, NULL, '113.638647,34.875535', '银行账户支付', '134123412341234', '653546345634534534', 34, 0, NULL, NULL, NULL, 1, 0, ''),
(3, 0, '银', '44057d5918345638a27712ba07cc910f', '金', 'adfasdf@126.com', '14795520541', 0, '0000-00-00', '', 0, NULL, 0, 0, 0, 0, '', 0, '0', 0, '127.0.0.1', 1483596408, 2, 0, 1, '', '/application/wap/static/images/king2.png', '', 0.00, NULL, '113.777778,34.765535', '微信支付', '2345234333', '4525453456365345634', 36, 1, NULL, NULL, NULL, 1, 0, ''),
(4, 0, '风姿', '', '风姿', '13413241233@qq.com', '14795520541', 1, '0000-00-00', '', 0, NULL, 0, 0, 0, 0, '', 0, '0', 0, '2130706433', 1475110381, 1, 0, 1, '', '31', '', 0.00, NULL, '113.777778,34.765535', '支付宝', '2122222222', '123424341235412341234', 32, 1, NULL, NULL, NULL, 1, 0, ''),
(5, 0, 'saber', '', '审核测试', '132342343@qq.com', '14722224444', 1, '0000-00-00', '', 0, NULL, 0, 0, 0, 0, '', 0, '0', 0, '0', 0, 0, 0, 0, '', '/application/wap/static/images/king2.png', '', 0.00, NULL, '113.636348,34.729467', '支付宝', 'aafa13412342', '3465345634564563456546', 38, 0, NULL, NULL, NULL, 0, 0, ''),
(9, 0, '黑金', '', '黑云', '132342343@qq.com', '13788888888', 1, '2016-09-14', '6324523453', 0, '三菱', 0, 0, 0, 0, '', 0, '0', 0, '0', 0, 0, 0, 0, '', '37', '', 6666.00, NULL, '113.736384,34.727569', '', '', '', 0, 0, NULL, NULL, NULL, 0, 0, ''),
(8, 0, '蓝天', '', '白云', 'adfasdf@126.com', '14788888888', 0, '2016-09-23', '3456346456', 0, '次郎', 0, 0, 0, 0, '', 0, '0', 0, '0', 0, 0, 0, 0, '', '38', '', 6666.00, NULL, '113.777778,34.765535', '', '', '', 0, 0, NULL, NULL, NULL, 0, 0, ''),
(7, 0, '海洋', '', '红海', '132342343@qq.com', '14795520541', 1, '2016-09-28', '132342343', 0, '二郎', 0, 0, 0, 0, 'OUHHB', 0, '0', 1471420236, '0', 0, 0, 0, 0, '', '39', '', 6666.00, NULL, '113.654746,34.751775', '', '', '', 0, 0, NULL, NULL, NULL, 0, 0, ''),
(31, 0, '13656580029', '7984d31fd454f00536ea181b80ddf686', '', '', '13656580029', 0, '0000-00-00', '', 0, NULL, 0, 0, 0, 0, 'AVtONQ', 4, '0', 1489386872, '3703148162', 1491974671, 1, 0, 1, '', '', '', 10000.00, 'BnkC8SOrsq', '', '', '', '', 0, 0, NULL, NULL, NULL, 0, 0, ''),
(24, 0, '天海', '44057d5918345638a27712ba07cc910f', '蓝色', 'admin@admin.com', '14795520541', 1, '2016-12-14', '2345234525', 494, '次郎', 0, 0, 0, 0, 'asdf', 0, '0', 0, '127.0.0.1', 1483596408, 0, 0, 0, '', '', '', 21700.00, NULL, '113.777778,34.765535', '', '', '', 0, 0, NULL, NULL, NULL, 0, 0, ''),
(30, 0, '18126152581', '1bf241e9d7a3f2185916df179738a93f', '', '', '18126152581', 0, '0000-00-00', '', 0, NULL, 0, 0, 0, 0, 'ybQUiD', 22, '0', 1489377749, '3746103302', 1491821209, 2, 0, 1, '', '', '', 99999.00, 'vhIqBKLy47', '', '', '', '', 0, 0, NULL, NULL, NULL, 0, 0, ''),
(1, 0, 'admin', 'd027fe888de32993a9c9f51e86a62678', 'gfy1', 'admin@admin.com', '14795520543', 0, '0000-00-00', '3232', 150, '', 0, 0, 0, 0, 'HEUYOK', 234, '0', 1471420236, '3079973186', 1494982732, 2, 1, 0, '', '482', '', 42077.04, '122333', '113.66,34.75', '', '', '653546345634534534', 36, 0, NULL, '豪华车型', '粤B-88888888', 1, 1, ''),
(29, 0, '14795520542', 'bc2a3fd32044f6a94b8951ffb7c09d9a', 'king', '', '14795520542', 0, '0000-00-00', '', 5440, NULL, 0, 0, 0, 0, 'LglNjp', 16, '0', 1488623214, '3746156157', 1488770671, 2, 0, 1, '', '492', '', 75212.80, 'pLOC2XYmTc', '', '', '', '', 0, 0, NULL, NULL, NULL, 1, 0, ''),
(35, 0, '', '', '', NULL, '14795520542', 0, '0000-00-00', '', 0, NULL, 0, 0, 0, 0, '', 0, '0', 0, '223.73.0.194', 1490943422, 0, 0, 0, '', '', '', 41814.04, NULL, '113.777778,34.765535', '', '', '', 0, 0, NULL, NULL, NULL, 0, 0, 'oKQeFwiaK7DH6hGr6UUKbyNeez6w'),
(34, 0, '', '', '', NULL, '18126152581', 0, '0000-00-00', '', 0, NULL, 0, 0, 0, 0, '', 0, '0', 0, '223.73.0.194', 1490942992, 0, 0, 0, '', '', '', 99999.00, NULL, '113.777778,34.765535', '', '', '', 0, 0, NULL, NULL, NULL, 0, 0, 'oKQeFwoLkwHYx5YHMXxyB_MqfFLQ'),
(36, 0, '', '', '', NULL, '13656580029', 0, '0000-00-00', '', 0, NULL, 0, 0, 0, 0, '', 0, '0', 0, '183.249.55.58', 1490943517, 0, 0, 0, '', '', '', 64846.00, NULL, '113.777778,34.765535', '', '', '', 0, 0, NULL, NULL, NULL, 0, 0, 'oKQeFwn2k_a7VJFH5LpkEx-4B8GE'),
(37, 0, '13106030008', '3ee1e8a7192b82f560cb5613fb18298c', '', '', '13106030008', 0, '0000-00-00', '', 0, NULL, 0, 0, 0, 0, 'KQXfor', 14, '0', 1491730123, '3746156152', 1493081507, 1, 0, 1, '', '', '', 9512.00, 'GK1oiICZy7', '', '', '', '', 0, 0, NULL, NULL, NULL, 0, 0, ''),
(38, 0, '13586037778', '15ae3496191d6aae53fad24d6fec2a8b', '', '', '13586037778', 0, '0000-00-00', '', 0, NULL, 0, 0, 0, 0, 'HuqnQN', 2, '0', 1491751148, '1880037385', 1491751187, 2, 0, 1, '', '', '', 6666.00, 'IJlXLnVe5Q', '', '', '', '', 0, 0, NULL, NULL, NULL, 0, 0, ''),
(39, 0, '', '', '', NULL, '15103584446', 0, '0000-00-00', '', 0, NULL, 0, 0, 0, 0, '', 0, '0', 0, '218.26.55.79', 1493453843, 0, 0, 0, '', '', '', 0.00, NULL, '113.777778,34.765535', '', '', '', 0, 0, NULL, NULL, NULL, 0, 0, 'oKQeFwkQeh6BQMjldW2qvbi_bB0g'),
(40, 0, '', '', '', NULL, '18126152581', 0, '0000-00-00', '', 0, NULL, 0, 0, 0, 0, '', 0, '0', 0, '14.30.184.58', 1494301328, 0, 0, 0, '', '', '', 0.00, NULL, '113.777778,34.765535', '', '', '', 0, 0, NULL, NULL, NULL, 0, 0, 'oKQeFwhrUrBF9MWPDOW1erz9ruU0'),
(41, 0, '', '', '', NULL, '14795520541', 0, '0000-00-00', '', 0, NULL, 0, 0, 0, 0, '', 0, '0', 0, '223.73.0.52', 1494561309, 0, 0, 0, '', '', '', 0.00, NULL, '113.777778,34.765535', '', '', '', 0, 0, NULL, NULL, NULL, 0, 0, 'o_VaowzPNiJfjOIvzFpF5SUJlJzI');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `ruike_member_deposit`
--

INSERT INTO `ruike_member_deposit` (`id`, `member_id`, `menoy`, `type`, `status`, `create_time`, `deposit_type`, `out_trade_no`, `transaction_id`, `open_id`) VALUES
(1, 67, 600, 0, 1, '2017-01-23 15:07:34', 0, 'DzUjCnAaXmFyJXgm', '4008252001201701237297736771', 'o_VaowzPNiJfjOIvzFpF5SUJlJzI'),
(2, 73, 600, 0, 0, '2017-01-26 12:37:06', 0, 'aAtsykDGRaejxbHp', '', 'o_Vaow7ZKJtnrL9-FlPn9AY5EAbA'),
(3, 73, 600, 0, 0, '2017-01-26 12:38:00', 0, 'yAJDpKnOLKNuaZRO', '', 'o_Vaow7ZKJtnrL9-FlPn9AY5EAbA'),
(4, 73, 600, 0, 0, '2017-01-26 12:39:51', 0, 'YFvvqykusNpgTTrm', '', 'o_Vaow7ZKJtnrL9-FlPn9AY5EAbA'),
(5, 73, 6, 0, 0, '2017-01-26 13:15:46', 0, 'XAyIahnZUfTfrtUZ', '', 'o_Vaow7ZKJtnrL9-FlPn9AY5EAbA'),
(6, 73, 6, 0, 0, '2017-01-26 13:16:08', 0, 'cyfyHWkGjTACNdZG', '', 'o_Vaow7ZKJtnrL9-FlPn9AY5EAbA'),
(7, 72, 6, 0, 1, '2017-01-26 13:22:25', 0, 'tdZvAZDkansbrOVg', '4008252001201701267614259267', 'o_VaowzPNiJfjOIvzFpF5SUJlJzI'),
(8, 72, 6, 0, 1, '2017-01-26 13:23:39', 0, 'AXQmORKWcFBivHMr', '4008252001201701267619754070', 'o_VaowzPNiJfjOIvzFpF5SUJlJzI');

-- --------------------------------------------------------

--
-- 表的结构 `ruike_member_extend`
--

CREATE TABLE IF NOT EXISTS `ruike_member_extend` (
  `uid` int(11) NOT NULL COMMENT '用户UID',
  `education` int(10) DEFAULT '0',
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ruike_member_extend`
--

INSERT INTO `ruike_member_extend` (`uid`, `education`) VALUES
(1, 0);

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

--
-- 转存表中的数据 `ruike_member_extend_group`
--

INSERT INTO `ruike_member_extend_group` (`id`, `name`, `profile_name`, `createTime`, `sort`, `visiable`, `status`) VALUES
(1, 'member_extend', '个人资料', 1403847366, 0, 1, 1);

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

--
-- 转存表中的数据 `ruike_member_extend_setting`
--

INSERT INTO `ruike_member_extend_setting` (`id`, `name`, `title`, `length`, `type`, `value`, `remark`, `is_show`, `extra`, `is_must`, `status`, `update_time`, `create_time`) VALUES
(1, 'education', '学历', '10', 'select', '', '', 1, '1:小学\r\n2:初中\r\n3:高中', 0, 1, 1455930923, 1455930787);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='会员收益表' AUTO_INCREMENT=31 ;

--
-- 转存表中的数据 `ruike_member_income`
--

INSERT INTO `ruike_member_income` (`id`, `member_id`, `income_source`, `money`, `type`, `status`, `create_time`, `auditor`, `auditor_time`, `remark`) VALUES
(1, 1, 'IN_RED_PACKET', 30, 1, 1, '2016-09-14 19:00:04', 2, '2016-09-16 19:00:15', ''),
(2, 1, 'IN_RED_PACKET', 40, 1, 1, '2016-09-14 19:02:51', 0, '2016-09-16 19:03:00', '人前人后'),
(3, 1, 'IN_RED_PACKET', 50, 0, -1, '2016-09-14 19:12:19', 0, '2016-09-15 19:12:28', '测试不通过'),
(4, 1, 'IN_RED_PACKET', 60, 0, 1, '2016-09-14 19:13:06', 0, '2016-09-16 19:13:16', ''),
(5, 1, 'IN_RED_PACKET', 70, 0, -1, '2016-09-14 19:14:00', 0, '2016-09-16 19:14:09', '特啊'),
(6, 1, 'IN_RED_PACKET', 80, 0, 1, '2016-09-14 19:14:42', 0, '2016-09-29 19:14:53', '可以啊'),
(7, 1, 'IN_RED_PACKET', 90, 0, 1, '2016-09-15 19:15:22', 0, '2016-09-27 19:15:37', ''),
(8, 1, 'IN_RED_PACKET', 100, 0, 1, '2016-09-14 19:16:03', 0, '2016-09-24 19:16:16', ''),
(9, 1, 'IN_RED_PACKET', 110, 0, 0, '2016-09-14 19:16:50', 0, '2016-09-30 19:17:26', ''),
(10, 1, 'IN_RED_PACKET', 120, 0, 0, '2016-09-16 19:19:34', 0, '2016-09-21 19:19:44', ''),
(11, 1, 'IN_RED_PACKET', 130, 1, -1, '2016-09-13 19:20:35', 0, '2016-09-29 19:20:46', '买吃的去了'),
(12, 1, 'IN_DRIVER_PROFIT', 10, 0, 1, '2016-11-18 19:21:24', 0, '2016-09-28 19:21:33', ''),
(13, 1, 'IN_RED_PACKET', 20, 1, 1, '2016-09-16 19:22:11', 0, '2016-09-27 19:22:23', ''),
(14, 1, 'IN_RED_PACKET', 1000, 0, -1, '2016-09-18 11:02:38', 9, '2016-09-18 11:02:53', '捐款'),
(15, 1, 'IN_DRIVER_PROFIT', 1, 0, 1, '2016-11-18 14:09:58', 0, '2016-09-19 14:09:58', '提现'),
(16, 1, 'IN_DRIVER_PROFIT', 1, 0, 1, '2016-11-18 14:15:23', 0, '2016-09-19 14:15:23', '提现'),
(17, 1, 'IN_DRIVER_PROFIT', 1, 0, 1, '2016-11-18 14:19:16', 0, '2016-09-19 14:19:16', '提现'),
(18, 1, 'IN_DRIVER_PROFIT', 6, 0, 1, '2016-11-18 14:23:43', 0, '2016-09-19 14:23:43', '提现'),
(19, 29, '提现', 500, 1, 0, '2017-03-06 11:08:18', 0, '0000-00-00 00:00:00', ''),
(20, 29, 'IN_DRIVER_PROFIT', 200.8, 0, 1, '2017-03-06 17:08:29', 0, '0000-00-00 00:00:00', '跑腿费'),
(21, 29, 'IN_DRIVER_PROFIT', 784, 0, 1, '2017-03-06 17:30:17', 0, '0000-00-00 00:00:00', '跑腿费'),
(22, 29, 'IN_DRIVER_PROFIT', 784, 0, 1, '2017-03-06 17:33:19', 0, '0000-00-00 00:00:00', '跑腿费'),
(23, 29, 'IN_DRIVER_PROFIT', 0, 0, 1, '2017-03-06 17:39:37', 0, '0000-00-00 00:00:00', '跑腿费'),
(24, 29, 'IN_DRIVER_PROFIT', 0, 0, 1, '2017-03-06 17:40:00', 0, '0000-00-00 00:00:00', '跑腿费'),
(25, 29, 'IN_DRIVER_PROFIT', 0, 0, 1, '2017-03-06 17:44:06', 0, '0000-00-00 00:00:00', '跑腿费'),
(26, 29, 'IN_DRIVER_PROFIT', 196.8, 0, 1, '2017-03-06 17:48:55', 0, '0000-00-00 00:00:00', '跑腿费'),
(27, 29, 'IN_DRIVER_PROFIT', 192, 0, 1, '2017-03-07 10:45:26', 0, '0000-00-00 00:00:00', '跑腿费'),
(28, 37, 'IN_DRIVER_PROFIT', 208, 0, 1, '2017-04-11 10:54:04', 0, '0000-00-00 00:00:00', '跑腿费'),
(29, 37, 'IN_DRIVER_PROFIT', 208, 0, 1, '2017-04-25 08:57:15', 0, '0000-00-00 00:00:00', '跑腿费'),
(30, 37, 'IN_DRIVER_PROFIT', 208, 0, 1, '2017-04-25 09:03:25', 0, '0000-00-00 00:00:00', '跑腿费');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=104 ;

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
(101, '社区管理', 'user', 'icon-guanggaojiazhi', 0, 0, '', 0, '社区管理', '社区管理', 0, 0, 1489546563, '0000-00-00 00:00:00'),
(102, '社区管理', 'user', '', 101, 0, 'user/Forum/index', 0, '社区管理', '社区管理', 0, 0, 1489546690, '0000-00-00 00:00:00'),
(103, '帖子管理', 'user', '', 101, 0, 'user/Forum/posts', 0, '', '社区管理', 0, 0, 1489549866, '0000-00-00 00:00:00');

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

--
-- 转存表中的数据 `ruike_message`
--

INSERT INTO `ruike_message` (`id`, `title`, `content`, `message_type`, `status`, `create_time`, `member_id`, `remark`) VALUES
(1, 'test', '带过业绩查询业绩查询业绩查询业绩查询业绩查询业绩查询业绩查询业绩查询业绩查询业绩查询', '/uploads/picture/20160914/ab360f6422081d97d70f6962fd1e1eb6.jpg', 1, '2016-10-27 10:01:30', 0, '测试用的'),
(2, '测试用例', '资本家必须是自学的，逐利的。这样企业才有竞争进步的驱动力。不要跟东家谈感情，管理者的报酬东家已经在薪资和激励中给你了。觉得不满意可以走嘛。尊重协议，尊重市场规律，才是进步之道', '文字', 1, '2016-11-17 08:33:10', 1, '海洋'),
(3, '测试用例', '测试数据内容测试数据内容测试数据内容测试数据内容测试数据内容测试数据内容测试数据内容测试数据内容测试数据内容测试数据内容', '文字', 1, '2016-11-17 08:33:10', 1, '海洋'),
(4, '测试用例', '测试数据内容测试数据内容测试数据内容测试数据内容测试数请编写一个函数，可以接受一个表名，然后把表的头和记录显示在网页请编写一个函数，可以接受一个表名，然后把表的头和记录显示在网页请编写一个函数，可以接受一个表名，然后把表的头和记录显示在网页据内容测试数据内容测试数据内容', '文字', 1, '2016-11-17 08:33:10', 1, '海洋'),
(5, '测试用例', '测试数据内容测试数据内容测试数据内容测试数据内容测试数据内容测试数据内容测试数据内容', '文字', 1, '2016-11-17 08:33:10', 1, '海洋'),
(6, '测试用例', '测试数据内容测试数据内容测试数据内容测试数据内容测试数据内容测试数据内容测试数据内容测试数据内容', '文字', 1, '2016-11-17 08:33:10', 1, '海洋'),
(7, '测试用例', '测试数据内容测试测试数据内容测试数据内容测试数据内容测试数据内容测试数据内容数据内容', '文字', 1, '2016-11-17 08:33:10', 1, '海洋'),
(8, '测试用例', '测试数据内容测试数据内容测试数据内容测试数据内容测试数据内容测试数据内容测试数据内容测试数据内容测试数据内容测试数据内容', '文字', 1, '2016-11-17 08:33:10', 1, '海洋'),
(9, '测试用例', '测试数据内容测试数据内容测试数据内容测试数据内容测试数据内容测试数据内容测试数据内容测试数据内容测试数据内容测试数据内容测试数据内容', '文字', 1, '2016-11-17 08:33:10', 1, '海洋'),
(10, '测试用例', '测试数据内容测试数据内容测试数据内容测试数据内容测试数据内容测试数据内容测试数据内容', '文字', 1, '2016-11-17 08:33:10', 1, '海洋'),
(11, '测试用例', '请编写一个函数，可以接受一个表名，然后把表的头和记录显示在网页请编写一个函数，可以接受一个表名，然后把表的头和记录显示在网页请编写一个函数，可以接受一个表名，然后把表的头和记录显示在网页请编写一个函数，可以接受一个表名，然后把表的头和记录显示在网页请编写一个函数，可以接受一个表名，然后把表的头和记录显示在网页', '文字', 1, '2016-11-17 08:33:10', 1, '海洋'),
(12, '测试用例', '请编写一个函数，可以接受一个表名，然后把表的头和记录显示在网页请编写一个函数，可以接受一个表名，然后把表的头和记录显示在网页请编写一个函数，可以接受一个表名，然后把表的头和记录显示在网页请编写一个函数，可以接受一个表名，然后把表的头和记录显示在网页请编写一个函数，可以接受一个表名，然后把表的头和记录显示在网页请编写一个函数，可以接受一个表名，然后把表的头和记录显示在网页请编写一个函数，可以接受一个表名，然后把表的头和记录显示在网页请编写一个函数，可以接受一个表名，然后把表的头和记录显示在网页请编写一个函数，可以接受一个表名，然后把表的头和记录显示在网页请编写一个函数，可以接受一个表名，然后把表的头和记录显示在网页', '文字', 1, '2016-11-17 08:33:10', 1, '海洋'),
(13, '测试用例', '请编写一个函数，可以接受一个表名，然后把表的头和记录显示在网页请编写一个函数，可以接受一个表名，然后把表的头和记录显示在网页请编写一个函数，可以接受一个表名，然后把表的头和记录显示在网页请编写一个函数，可以接受一个表名，然后把表的头和记录显示在网页请编写一个函数，可以接受一个表名，然后把表的头和记录显示在网页请编写一个函数，可以接受一个表名，然后把表的头和记录显示在网页请编写一个函数，可以接受一个表名，然后把表的头和记录显示在网页', '文字', 1, '2016-11-17 08:33:10', 1, '海洋'),
(14, '测试用例', '请编写一个函数，可以接受一个表名，然后把表的头和记录显示在网页请编写一个函数，可以接受一个表名，然后把表的头和记录显示在网页请编写一个函数，可以接受一个表名，然后把表的头和记录显示在网页请编写一个函数，可以接受一个表名，然后把表的头和记录显示在网页请编写一个函数，可以接受一个表名，然后把表的头和记录显示在网页请编写一个函数，可以接受一个表名，然后把表的头和记录显示在网页请编写一个函数，可以接受一个表名，然后把表的头和记录显示在网页请编写一个函数，可以接受一个表名，然后把表的头和记录显示在网页请编写一个函数，可以接受一个表名，然后把表的头和记录显示在网页', '文字', 1, '2016-11-17 08:33:10', 1, '海洋');

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

--
-- 转存表中的数据 `ruike_model`
--

INSERT INTO `ruike_model` (`id`, `name`, `title`, `extend`, `icon`, `relation`, `is_user_show`, `need_pk`, `field_sort`, `field_group`, `field_list`, `attribute_list`, `attribute_alias`, `list_grid`, `list_row`, `search_key`, `search_list`, `template_list`, `template_add`, `template_edit`, `create_time`, `update_time`, `status`, `engine_type`) VALUES
(1, 'document', '通用模型', 0, '', '', 1, 1, '{"1":["17","16","19","20","14","13","4","3","2","5","12","11","10"]}', '1:基础,2:扩展', '1,7,8,9,10,2,11,12,13,3,4,14,25,15,5,6,23,22,24', '', '', 'id:ID\r\ntitle:标题\r\nuid:发布人|get_username\r\ncreate_time:创建时间|time_format\r\nupdate_time:更新时间|time_format\r\nstatus:状态|get_content_status', 10, '', '', '', '', '', 1450088499, 1454054412, 1, 'MyISAM'),
(2, 'article', '文章', 1, 'file-word-o', '', 0, 1, '{"1":["3","2","4","25","12","5","24","55"],"2":["11","10","13","19","17","16","14","20"]}', '1:基础,2:扩展', '', '', '', 'id:ID\r\ntitle:标题\r\nuid:发布人|get_username\r\ncreate_time:创建时间|time_format\r\nupdate_time:更新时间|time_format\r\nstatus:状态|get_content_status', 10, '', '', '', '', '', 1453859167, 1467019566, 1, 'MyISAM'),
(3, 'photo', '图片', 1, 'file-image-o', '', 0, 1, '{"1":["3","2","4","12","26","5","27","55"],"2":["11","10","19","13","16","17","14","20"]}', '1:基础,2:扩展', '', '', '', 'id:ID\r\ntitle:标题\r\nuid:发布人|get_username\r\ncreate_time:创建时间|time_format\r\nupdate_time:更新时间|time_format\r\nstatus:状态|get_content_status', 10, '', '', '', '', '', 1454052310, 1467019679, 1, 'MyISAM'),
(4, 'page', '单页', 2, 'file-text-o', '', 0, 1, '{"1":["28","55","30","31","32","33"]}', '1:基础', '', '', '', 'id:ID\r\ntitle:标题\r\nupdate_time:更新时间|time_format', 10, '', '', '', '', '', 1456296668, 1470240568, 1, 'MyISAM');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=80 ;

--
-- 转存表中的数据 `ruike_my_address`
--

INSERT INTO `ruike_my_address` (`id`, `member_id`, `address`, `mobile`, `user_name`, `is_default`, `is_send`, `coordinate`) VALUES
(6, 1, '广西柳州/柳北区', '14788888888', '孙大炮的孙子', 0, 1, '114.047804,22.619572'),
(69, 41, '深圳市宝安区风和日丽/门口', '13568523698', '杨恭如', 1, 1, '114.0363,22.647104'),
(8, 1, '广西桂林/龙胜县', '14796453457', '陆柒', 0, 1, '114.047804,22.619572'),
(9, 1, '广西崇左/江州区', '13788888888', '杨新华', 0, 1, '114.047804,22.619572'),
(10, 41, '广西崇左/江州区', '13788888888', '杨新华主任', 1, 0, '114.047804,22.619572'),
(66, 1, '台州市路桥区台州电子数码城/b925', '13106030008', '颜孙植', 1, 0, '121.376373,28.595854'),
(67, 1, '台州市路桥区泰隆大厦/13楼', '13656580029', '颜孙植', 1, 1, '121.376717,28.582354'),
(14, 1, '山东青岛/山东泰山 孔老二', '13788888888', '杜云', 0, 0, '114.047804,22.619572'),
(68, 32, '深圳市龙岗区五和-地铁站/地钱口', '13738383388', '杨幂', 0, 0, '114.067352,22.632603'),
(23, 1, '广州市天河区广州天河汽车客运站/56号', '14795520542', '林肯', 0, 0, '114.047804,22.619572'),
(65, 1, '山东青岛/山东泰山 孔老二', '13788888888', '杜云', 0, 0, '114.047804,22.619572'),
(46, 1, '广西崇左/江州区', '13788888888', '杨新华主任', 0, 1, '114.047804,22.619572'),
(24, 1, '广州市天河区广州东站/东站', '18744554444', '种田', 0, 0, '113.33116,23.155875'),
(70, 32, '深圳市福田区枫丹雅苑/正门', '15933336666', '李嘉欣', 1, 0, '114.029705,22.559672'),
(53, 1, '湖南/湖南常德市', '14777323453', '胡锦涛', 0, 0, '114.047804,22.619572'),
(49, 1, '广州市天河区东圃大厦/河西', '14752896325', '南方', 0, 1, '113.422016,23.125779'),
(50, 1, '深圳市宝安区共和花园/共识', '14765239852', '子孙', 0, 0, '114.04279,22.653813'),
(51, 1, '广西柳州/柳北区', '14788888888', '孙大炮的孙子', 0, 1, '114.047804,22.619572'),
(55, 1, '深圳市宝安区秋园雅苑/乐天', '14795520542', '朴信惠', 0, 1, '113.912589,22.765825'),
(56, 1, '深圳市南山区阳光雅苑/该喝喝', '13766666222', '特工队', 0, 0, '113.929362,22.551192'),
(57, 1, '深圳市宝安区秋园雅苑/子贡', '14795520543', '花虹', 0, 0, '113.912589,22.765825'),
(58, 1, '深圳市龙岗区阳光雅苑/滚滚滚', '14796583265', '非常吃饭', 0, 1, '114.160728,22.618668'),
(59, 67, '台州市椒江区城市港湾(城市港湾东南)', '13106030008', '颜孙植', 0, 0, '121.392802,28.604039'),
(36, 1, '深圳市福田区雪松大厦b座/樱花雪', '14777323453', '尼禄', 0, 0, '114.02833,22.537301'),
(61, 67, '台州市椒江区城市港湾(城市港湾东南)', '13106030008', '颜孙植', 0, 0, '121.392802,28.604039'),
(62, 67, '台州市路桥区嘉绿苑/23撞', '13968686815', '刘香林', 1, 1, '121.364826,28.596539'),
(63, 67, '台州市椒江区城市港湾(城市港湾东南)', '13106030008', '颜孙植', 0, 0, '121.392802,28.604039'),
(64, 67, '台州市椒江区城市港湾(城市港湾东南)', '13106030008', '颜孙植', 1, 0, '121.392802,28.604039'),
(42, 1, '红茶馆/地毯', '14795520542', '红颜祸水', 0, 0, '114.062083,22.726182'),
(47, 1, '深圳市南山区深圳湾口岸/帝王大厦', '14752369856', '江泽民', 0, 0, '113.95595,22.508675'),
(54, 1, '深圳市宝安区共和花园/共识', '14765239852', '子孙', 0, 0, '114.04279,22.653813'),
(71, 33, '深圳市宝安区中国工商银行(深圳龙华支行)/2手', '15936852693', '麻将馆', 1, 0, '114.030914,22.658303'),
(72, 33, '深圳市罗湖区地王大厦/王老师', '18125843695', '王卸', 1, 1, '114.11652,22.548793'),
(74, 35, '深圳市宝安区中国工商银行(深圳龙华支行)/可以', '14796325865', '风丹丽舍', 0, 0, '114.030914,22.658303'),
(75, 35, '深圳市宝安区中国工商银行(深圳龙华支行)/可以', '14796325865', '风丹丽舍', 1, 0, '114.030914,22.658303'),
(76, 35, '深圳市宝安区深圳观澜湖高尔夫球会/土匪', '14798563256', '共识', 1, 1, '114.083891,22.744453'),
(78, 36, '台州市椒江区城市港湾-公交车站/4502', '13656580029', 'YY', 1, 1, '121.392523,28.605352'),
(79, 36, '台州市路桥区泰隆商务大厦', '13656580029', '颜孙植', 1, 0, '121.362626,28.593332');

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

--
-- 转存表中的数据 `ruike_page`
--

INSERT INTO `ruike_page` (`id`, `uid`, `title`, `model_id`, `cover_id`, `content`, `create_time`, `update_time`) VALUES
(1, 0, '单页测试', 4, 169, '<p><img src="http://ruikecmssvn.test.com/uploads/editor/20161222/6ab85beb1c1e908a5732dc93ff8d8f1c.jpg" _src="http://ruikecmssvn.test.com/uploads/editor/20161222/6ab85beb1c1e908a5732dc93ff8d8f1c.jpg" style=""/></p><p><img src="http://ruikecmssvn.test.com/uploads/editor/20161222/f475eddb3724a2ce0be142ca1d3b7386.jpg" _src="http://ruikecmssvn.test.com/uploads/editor/20161222/f475eddb3724a2ce0be142ca1d3b7386.jpg" style=""/></p><p><br/></p>', 1482370620, 1482370620);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=538 ;

--
-- 转存表中的数据 `ruike_picture`
--

INSERT INTO `ruike_picture` (`id`, `path`, `url`, `md5`, `sha1`, `status`, `create_time`) VALUES
(75, '/uploads/picture/20170119/c467d67f72cad805023c052f53f1c046.jpg', '/uploads/picture/20170119/c467d67f72cad805023c052f53f1c046.jpg', '665f4c08d69ca98d08dc44324b178b5e', 'f2c9010e4a58d75e7f96d97ed8c2a79174d60e5d', 1, 1484806791),
(111, '/uploads/picture/20170119/d873a202b0fe78cc3e61be2468e93618.jpg', '/uploads/picture/20170119/d873a202b0fe78cc3e61be2468e93618.jpg', '791531a3dadd074a6eb2ac42c67ef511', 'f8e35a35d305641e46a98c321e287ad583c8e315', 1, 1484806819),
(334, '/uploads/picture/20170119/4da3fd6ff4a89ddcc5cc16cb5d5982bb.jpg', '/uploads/picture/20170119/4da3fd6ff4a89ddcc5cc16cb5d5982bb.jpg', 'ea7a7a70c9cfc4a132e7e95333151cca', 'c6b7c07f24b3138aeff801601f9d8bac6de65efa', 1, 1484809340),
(335, '/uploads/picture/20170119/22d7e4e6041e33f255c19de9932332b8.jpg', '/uploads/picture/20170119/22d7e4e6041e33f255c19de9932332b8.jpg', '20accc2c38d9c3a2b292315c87f88490', '74e01de04ba4aaf908ee57839a38842d37645331', 1, 1484809411),
(336, '/uploads/picture/20170125/9e6e4dacd685b54bc209acc88bf5956b.jpg', '/uploads/picture/20170125/9e6e4dacd685b54bc209acc88bf5956b.jpg', '56188288b8969dd7a9d81ec845bf4aae', '6e9834299b852f3bfb6567eb8528ea52fc12e519', 1, 1485327434),
(337, '/uploads/picture/20170125/af58a8a57a9023b73d70ace83780362d.jpg', '/uploads/picture/20170125/af58a8a57a9023b73d70ace83780362d.jpg', '29fa0162f8a49a4d933309461a86908f', 'a984d69c1e425dfc08622f0e5a979bdb22cb6da4', 1, 1485328115),
(338, '/uploads/picture/20170126/991faee826357fa04b13659766ed8ccf.jpg', '/uploads/picture/20170126/991faee826357fa04b13659766ed8ccf.jpg', '133a28d7ca44f02ed98cf31da43053ef', '7891a8ae3ee25f84f81df6a0a07338201f5ad83c', 1, 1485366104),
(339, '/uploads/picture/20170126/1ee200acb4ecf057f4228738054fe20f.jpg', '/uploads/picture/20170126/1ee200acb4ecf057f4228738054fe20f.jpg', '133a28d7ca44f02ed98cf31da43053ef', '7891a8ae3ee25f84f81df6a0a07338201f5ad83c', 1, 1485366457),
(340, '/uploads/picture/20170126/ba589dc4c36069ba84a5ec65713d6467.jpg', '/uploads/picture/20170126/ba589dc4c36069ba84a5ec65713d6467.jpg', '133a28d7ca44f02ed98cf31da43053ef', '7891a8ae3ee25f84f81df6a0a07338201f5ad83c', 1, 1485367178),
(341, '/uploads/picture/20170126/a3e609f9ee5622d879d2e2e9cd94f7ce.jpg', '/uploads/picture/20170126/a3e609f9ee5622d879d2e2e9cd94f7ce.jpg', '133a28d7ca44f02ed98cf31da43053ef', '7891a8ae3ee25f84f81df6a0a07338201f5ad83c', 1, 1485367434),
(342, '/uploads/picture/20170126/b418dd76ba6143731de56eccf86fe483.jpg', '/uploads/picture/20170126/b418dd76ba6143731de56eccf86fe483.jpg', '56188288b8969dd7a9d81ec845bf4aae', '6e9834299b852f3bfb6567eb8528ea52fc12e519', 1, 1485397219),
(343, '/uploads/picture/20170126/1b47b01f3c83da38a6578c6a55988ce6.jpg', '/uploads/picture/20170126/1b47b01f3c83da38a6578c6a55988ce6.jpg', '0df3f8758e6e6585d9ab4abde7de527b', '527498649b9f835513cb43bb407d9d8b0b02d28b', 1, 1485397435),
(344, '/uploads/picture/20170126/19566577b71ef5291a101f513782c5b1.jpg', '/uploads/picture/20170126/19566577b71ef5291a101f513782c5b1.jpg', 'f82da5d2c0462f535547c207b2297148', 'ed232fc12ed2aef357c508bc3bc7716da8e9c99c', 1, 1485405328),
(345, '/uploads/picture/20170126/1bbf4f2d0ad19349e646b669dc980397.jpg', '/uploads/picture/20170126/1bbf4f2d0ad19349e646b669dc980397.jpg', 'f82da5d2c0462f535547c207b2297148', 'ed232fc12ed2aef357c508bc3bc7716da8e9c99c', 1, 1485405401),
(346, '/uploads/picture/20170126/9cbfc3b3d19cac207c490d4cdbf8bd47.jpg', '/uploads/picture/20170126/9cbfc3b3d19cac207c490d4cdbf8bd47.jpg', 'c90cb46ec6f32d7f571292b1d6a4c1b3', '7ef71f4d2bff453ce55b82463f926e16664537f6', 1, 1485407878),
(347, '/uploads/picture/20170224/9b7ff4a0cc89c41bb5b4111cf9ee753d.jpg', '/uploads/picture/20170224/9b7ff4a0cc89c41bb5b4111cf9ee753d.jpg', 'fdeb98c7ee27cb950ba7bfdb92dcbb1d', '5c78e2a1b94a9896ad033be2eb4992541a16f39f', 1, 1487904732),
(348, '/uploads/picture/20170224/63eac8a4a090bced037eab108a6c9b6e.jpg', '/uploads/picture/20170224/63eac8a4a090bced037eab108a6c9b6e.jpg', 'fd9fe2dce5d575d971e80bf2e82ed3f1', '366535093144e07cff1787e15ab6d103f9ac6b41', 1, 1487906902),
(349, './uploads/picture/20170227/1488193783.jpg', './uploads/picture/20170227/1488193783.jpg', '', '', 1, 1488193783),
(350, './uploads/picture/20170301/1488336854.jpg', './uploads/picture/20170301/1488336854.jpg', '', '', 1, 1488336854),
(351, './uploads/picture/20170302/14884377430.jpg', './uploads/picture/20170302/14884377430.jpg', '', '', 1, 1488437743),
(352, './uploads/picture/20170302/14884377431.jpg', './uploads/picture/20170302/14884377431.jpg', '', '', 1, 1488437743),
(353, './uploads/picture/20170302/14884377432.jpg', './uploads/picture/20170302/14884377432.jpg', '', '', 1, 1488437743),
(354, './uploads/picture/20170302/14884385890.jpg', './uploads/picture/20170302/14884385890.jpg', '', '', 1, 1488438589),
(355, './uploads/picture/20170302/14884385891.jpg', './uploads/picture/20170302/14884385891.jpg', '', '', 1, 1488438589),
(356, './uploads/picture/20170302/14884385892.jpg', './uploads/picture/20170302/14884385892.jpg', '', '', 1, 1488438589),
(357, './uploads/picture/20170302/14884385893.jpg', './uploads/picture/20170302/14884385893.jpg', '', '', 1, 1488438589),
(358, './uploads/picture/20170302/14884386400.jpg', './uploads/picture/20170302/14884386400.jpg', '', '', 1, 1488438640),
(359, './uploads/picture/20170302/14884386401.jpg', './uploads/picture/20170302/14884386401.jpg', '', '', 1, 1488438640),
(360, './uploads/picture/20170302/14884386402.jpg', './uploads/picture/20170302/14884386402.jpg', '', '', 1, 1488438640),
(361, './uploads/picture/20170302/14884386403.jpg', './uploads/picture/20170302/14884386403.jpg', '', '', 1, 1488438640),
(362, './uploads/picture/20170302/14884386990.jpg', './uploads/picture/20170302/14884386990.jpg', '', '', 1, 1488438699),
(363, './uploads/picture/20170302/14884386991.jpg', './uploads/picture/20170302/14884386991.jpg', '', '', 1, 1488438699),
(364, './uploads/picture/20170302/14884388330.jpg', './uploads/picture/20170302/14884388330.jpg', '', '', 1, 1488438833),
(365, './uploads/picture/20170302/14884388331.jpg', './uploads/picture/20170302/14884388331.jpg', '', '', 1, 1488438833),
(366, './uploads/picture/20170302/14884393710.jpg', './uploads/picture/20170302/14884393710.jpg', '', '', 1, 1488439371),
(367, './uploads/picture/20170302/14884393711.jpg', './uploads/picture/20170302/14884393711.jpg', '', '', 1, 1488439371),
(368, './uploads/picture/20170302/14884393910.jpg', './uploads/picture/20170302/14884393910.jpg', '', '', 1, 1488439391),
(369, './uploads/picture/20170302/14884393911.jpg', './uploads/picture/20170302/14884393911.jpg', '', '', 1, 1488439391),
(370, './uploads/picture/20170302/14884393912.jpg', './uploads/picture/20170302/14884393912.jpg', '', '', 1, 1488439391),
(371, './uploads/picture/20170302/14884402810.jpg', './uploads/picture/20170302/14884402810.jpg', '', '', 1, 1488440281),
(372, './uploads/picture/20170302/14884402811.jpg', './uploads/picture/20170302/14884402811.jpg', '', '', 1, 1488440281),
(373, './uploads/picture/20170302/14884402850.jpg', './uploads/picture/20170302/14884402850.jpg', '', '', 1, 1488440285),
(374, './uploads/picture/20170302/14884402851.jpg', './uploads/picture/20170302/14884402851.jpg', '', '', 1, 1488440285),
(375, './uploads/picture/20170302/14884405160.jpg', './uploads/picture/20170302/14884405160.jpg', '', '', 1, 1488440516),
(376, './uploads/picture/20170302/14884405160fuben.jpg', './uploads/picture/20170302/14884405160fuben.jpg', '', '', 1, 1488440516),
(377, './uploads/picture/20170302/14884405161.jpg', './uploads/picture/20170302/14884405161.jpg', '', '', 1, 1488440516),
(378, './uploads/picture/20170302/14884405160fuben.jpg', './uploads/picture/20170302/14884405160fuben.jpg', '', '', 1, 1488440516),
(379, './uploads/picture/20170302/14884405161fuben.jpg', './uploads/picture/20170302/14884405161fuben.jpg', '', '', 1, 1488440516),
(380, './uploads/picture/20170302/14884405162.jpg', './uploads/picture/20170302/14884405162.jpg', '', '', 1, 1488440516),
(381, './uploads/picture/20170302/14884405170.jpg', './uploads/picture/20170302/14884405170.jpg', '', '', 1, 1488440517),
(382, './uploads/picture/20170302/14884405171.jpg', './uploads/picture/20170302/14884405171.jpg', '', '', 1, 1488440517),
(383, './uploads/picture/20170302/14884405172.jpg', './uploads/picture/20170302/14884405172.jpg', '', '', 1, 1488440517),
(384, './uploads/picture/20170302/14884405173.jpg', './uploads/picture/20170302/14884405173.jpg', '', '', 1, 1488440517),
(385, './uploads/picture/20170302/14884409520.jpg', './uploads/picture/20170302/14884409520.jpg', '', '', 1, 1488440952),
(386, './uploads/picture/20170302/14884409521.jpg', './uploads/picture/20170302/14884409521.jpg', '', '', 1, 1488440952),
(387, './uploads/picture/20170302/14884419321610125108.jpg', './uploads/picture/20170302/14884419321610125108.jpg', '', '', 1, 1488441932),
(388, './uploads/picture/20170302/1488442587214316145.jpg', './uploads/picture/20170302/1488442587214316145.jpg', '', '', 1, 1488442587),
(389, './uploads/picture/20170302/14884425871344961217.jpg', './uploads/picture/20170302/14884425871344961217.jpg', '', '', 1, 1488442587),
(390, './uploads/picture/20170302/14884425872111324512.jpg', './uploads/picture/20170302/14884425872111324512.jpg', '', '', 1, 1488442587),
(391, './uploads/picture/20170302/14884427281228376200.jpg', './uploads/picture/20170302/14884427281228376200.jpg', '', '', 1, 1488442728),
(392, './uploads/picture/20170302/1488442729483528508.jpg', './uploads/picture/20170302/1488442729483528508.jpg', '', '', 1, 1488442729),
(393, './uploads/picture/20170302/1488442729172577507.jpg', './uploads/picture/20170302/1488442729172577507.jpg', '', '', 1, 1488442729),
(394, './uploads/picture/20170302/1488442953824714840.jpg', './uploads/picture/20170302/1488442953824714840.jpg', '', '', 1, 1488442953),
(395, './uploads/picture/20170302/14884429571801120329.jpg', './uploads/picture/20170302/14884429571801120329.jpg', '', '', 1, 1488442957),
(396, './uploads/picture/20170302/14884430491296349974.jpg', './uploads/picture/20170302/14884430491296349974.jpg', '', '', 1, 1488443049),
(397, './uploads/picture/20170302/1488443049834576670.jpg', './uploads/picture/20170302/1488443049834576670.jpg', '', '', 1, 1488443049),
(398, './uploads/picture/20170302/14884430492064678176.jpg', './uploads/picture/20170302/14884430492064678176.jpg', '', '', 1, 1488443049),
(399, './uploads/picture/20170302/14884434901574022346.jpg', './uploads/picture/20170302/14884434901574022346.jpg', '', '', 1, 1488443490),
(400, './uploads/picture/20170302/1488443490991426882.jpg', './uploads/picture/20170302/1488443490991426882.jpg', '', '', 1, 1488443490),
(401, './uploads/picture/20170302/14884435241041673853.jpg', './uploads/picture/20170302/14884435241041673853.jpg', '', '', 1, 1488443524),
(402, './uploads/picture/20170302/1488443524131339968.jpg', './uploads/picture/20170302/1488443524131339968.jpg', '', '', 1, 1488443524),
(403, './uploads/picture/20170302/1488443594141472647.jpg', './uploads/picture/20170302/1488443594141472647.jpg', '', '', 1, 1488443594),
(404, './uploads/picture/20170302/14884435941710287186.jpg', './uploads/picture/20170302/14884435941710287186.jpg', '', '', 1, 1488443594),
(405, './uploads/picture/20170302/1488443653971014232.jpg', './uploads/picture/20170302/1488443653971014232.jpg', '', '', 1, 1488443653),
(406, './uploads/picture/20170302/1488443653570724631.jpg', './uploads/picture/20170302/1488443653570724631.jpg', '', '', 1, 1488443653),
(407, './uploads/picture/20170302/14884438621536696239.jpg', './uploads/picture/20170302/14884438621536696239.jpg', '', '', 1, 1488443862),
(408, './uploads/picture/20170302/14884438951960521416.jpg', './uploads/picture/20170302/14884438951960521416.jpg', '', '', 1, 1488443895),
(409, './uploads/picture/20170302/1488443905767057885.jpg', './uploads/picture/20170302/1488443905767057885.jpg', '', '', 1, 1488443905),
(410, './uploads/picture/20170302/1488445125246604407.jpg', './uploads/picture/20170302/1488445125246604407.jpg', '', '', 1, 1488445125),
(411, './uploads/picture/20170302/1488445170512204178.jpg', './uploads/picture/20170302/1488445170512204178.jpg', '', '', 1, 1488445170),
(412, './uploads/picture/20170302/1488445254919590953.jpg', './uploads/picture/20170302/1488445254919590953.jpg', '', '', 1, 1488445254),
(413, './uploads/picture/20170302/1488445312920942352.jpg', './uploads/picture/20170302/1488445312920942352.jpg', '', '', 1, 1488445312),
(414, './uploads/picture/20170302/14884453461926496007.jpg', './uploads/picture/20170302/14884453461926496007.jpg', '', '', 1, 1488445346),
(415, './uploads/picture/20170302/14884453581559692822.jpg', './uploads/picture/20170302/14884453581559692822.jpg', '', '', 1, 1488445358),
(416, './uploads/picture/20170302/1488445476356861546.jpg', './uploads/picture/20170302/1488445476356861546.jpg', '', '', 1, 1488445476),
(417, './uploads/picture/20170302/1488445628266478734.jpg', './uploads/picture/20170302/1488445628266478734.jpg', '', '', 1, 1488445628),
(418, './uploads/picture/20170302/14884456751721815204.jpg', './uploads/picture/20170302/14884456751721815204.jpg', '', '', 1, 1488445675),
(419, './uploads/picture/20170302/1488446671.jpg', './uploads/picture/20170302/1488446671.jpg', '', '', 1, 1488446671),
(420, './uploads/picture/20170302/14884467080.jpg', './uploads/picture/20170302/14884467080.jpg', '', '', 1, 1488446708),
(421, './uploads/picture/20170302/14884467081.jpg', './uploads/picture/20170302/14884467081.jpg', '', '', 1, 1488446708),
(422, './uploads/picture/20170302/14884468940.jpg', './uploads/picture/20170302/14884468940.jpg', '', '', 1, 1488446894),
(423, './uploads/picture/20170302/14884468941.jpg', './uploads/picture/20170302/14884468941.jpg', '', '', 1, 1488446894),
(424, './uploads/picture/20170302/1488446955.jpg', './uploads/picture/20170302/1488446955.jpg', '', '', 1, 1488446955),
(425, './uploads/picture/20170302/1488447687.jpg', './uploads/picture/20170302/1488447687.jpg', '', '', 1, 1488447687),
(426, './uploads/picture/20170302/1488447703.jpg', './uploads/picture/20170302/1488447703.jpg', '', '', 1, 1488447703),
(427, './uploads/picture/20170302/1488448574.jpg', './uploads/picture/20170302/1488448574.jpg', '', '', 1, 1488448574),
(428, './uploads/picture/20170302/1488451412.jpg', './uploads/picture/20170302/1488451412.jpg', '', '', 1, 1488451412),
(429, '/uploads/picture/20170303/28270c2a6d4152d1275f08359fcccd85.png', '/uploads/picture/20170303/28270c2a6d4152d1275f08359fcccd85.png', '8a52d2c987a40f968d8ab9c6e55fbeaf', '565c43cf2f44da90c525a4ee49a07c7700e5b7e4', 1, 1488511449),
(430, '/uploads/picture/20170303/a5f3e8e2e4810e614087b2f0bd289c11.jpg', '/uploads/picture/20170303/a5f3e8e2e4810e614087b2f0bd289c11.jpg', '8aaef3c51f035a63fe2c6ddaad4c9b96', '9255f9c2e9a5197e2f6be8d725452893973eea84', 1, 1488511974),
(431, '/uploads/picture/20170303/6ad22fb894aedb7101147b0bb5bb9ce2.jpg', '/uploads/picture/20170303/6ad22fb894aedb7101147b0bb5bb9ce2.jpg', 'efddc49da0a25212994cebbd98469e6e', '1bd24dd12910d5104b3994b70718658298360243', 1, 1488512136),
(432, '/uploads/picture/20170303/952a9544150ea5a1bb04f46247b1ae83.jpg', '/uploads/picture/20170303/952a9544150ea5a1bb04f46247b1ae83.jpg', 'e19e5b89a0cd6cf9ea2bf77165514b1b', '763ecca86d9cbf99767d21d4f012fce224917a32', 1, 1488512241),
(433, '/uploads/picture/20170303/a3b0438185258ac4aa2a015a13df8eee.jpg', '/uploads/picture/20170303/a3b0438185258ac4aa2a015a13df8eee.jpg', 'efddc49da0a25212994cebbd98469e6e', '1bd24dd12910d5104b3994b70718658298360243', 1, 1488512380),
(434, '/uploads/picture/20170303/0d5a1e72b798eb43142321d00495b3a0.jpeg', '/uploads/picture/20170303/0d5a1e72b798eb43142321d00495b3a0.jpeg', 'cca2fdaed29045c391abdd9a0b1491c9', '9087aea00b119ae0b9aae2cbab9d6baf1c62a840', 1, 1488512492),
(435, '/uploads/picture/20170303/79c699f56fb834999217c1e32c4b8900.jpg', '/uploads/picture/20170303/79c699f56fb834999217c1e32c4b8900.jpg', 'fd9fe2dce5d575d971e80bf2e82ed3f1', '366535093144e07cff1787e15ab6d103f9ac6b41', 1, 1488512661),
(436, '/uploads/picture/20170303/b3cf894503fcddd07ce243fc988b296a.jpg', '/uploads/picture/20170303/b3cf894503fcddd07ce243fc988b296a.jpg', 'c8741fbc34f44121936fed97f50984c8', '2da6213a7923eb0ebeb7833edddd536b53b5ce14', 1, 1488523490),
(437, './uploads/picture/20170303/1488528835234285266.jpg', './uploads/picture/20170303/1488528835234285266.jpg', '', '', 1, 1488528835),
(438, './uploads/picture/20170303/1488528856372021872.jpg', './uploads/picture/20170303/1488528856372021872.jpg', '', '', 1, 1488528856),
(439, './uploads/picture/20170303/14885289001720920046.jpg', './uploads/picture/20170303/14885289001720920046.jpg', '', '', 1, 1488528900),
(440, './uploads/picture/20170303/1488533238.jpg', './uploads/picture/20170303/1488533238.jpg', '', '', 1, 1488533238),
(441, './uploads/picture/20170303/1488533242.jpg', './uploads/picture/20170303/1488533242.jpg', '', '', 1, 1488533242),
(442, './uploads/picture/20170303/1488533256.jpg', './uploads/picture/20170303/1488533256.jpg', '', '', 1, 1488533256),
(443, './uploads/picture/20170303/1488533256fuben.jpg', './uploads/picture/20170303/1488533256fuben.jpg', '', '', 1, 1488533256),
(444, './uploads/picture/20170303/1488533256fuben.jpg', './uploads/picture/20170303/1488533256fuben.jpg', '', '', 1, 1488533256),
(445, './uploads/picture/20170303/1488533282.jpg', './uploads/picture/20170303/1488533282.jpg', '', '', 1, 1488533282),
(446, './uploads/picture/20170303/1488533283.jpg', './uploads/picture/20170303/1488533283.jpg', '', '', 1, 1488533283),
(447, './uploads/picture/20170303/1488533637.jpg', './uploads/picture/20170303/1488533637.jpg', '', '', 1, 1488533637),
(448, './uploads/picture/20170303/1488533639.jpg', './uploads/picture/20170303/1488533639.jpg', '', '', 1, 1488533639),
(449, './uploads/picture/20170303/1488533640.jpg', './uploads/picture/20170303/1488533640.jpg', '', '', 1, 1488533640),
(450, './uploads/picture/20170303/1488533644.jpg', './uploads/picture/20170303/1488533644.jpg', '', '', 1, 1488533644),
(451, './uploads/picture/20170303/1488533646.jpg', './uploads/picture/20170303/1488533646.jpg', '', '', 1, 1488533646),
(452, './uploads/picture/20170303/1488533646fuben.jpg', './uploads/picture/20170303/1488533646fuben.jpg', '', '', 1, 1488533646),
(453, './uploads/picture/20170303/1488533646fuben.jpg', './uploads/picture/20170303/1488533646fuben.jpg', '', '', 1, 1488533646),
(454, './uploads/picture/20170303/1488533646fuben.jpg', './uploads/picture/20170303/1488533646fuben.jpg', '', '', 1, 1488533646),
(455, './uploads/picture/20170303/1488533647.jpg', './uploads/picture/20170303/1488533647.jpg', '', '', 1, 1488533647),
(456, './uploads/picture/20170303/1488533736.jpg', './uploads/picture/20170303/1488533736.jpg', '', '', 1, 1488533736),
(457, './uploads/picture/20170303/1488533801.jpg', './uploads/picture/20170303/1488533801.jpg', '', '', 1, 1488533801),
(458, './uploads/picture/20170303/1488533908.jpg', './uploads/picture/20170303/1488533908.jpg', '', '', 1, 1488533908),
(459, './uploads/picture/20170303/1488534012.jpg', './uploads/picture/20170303/1488534012.jpg', '', '', 1, 1488534012),
(460, './uploads/picture/20170303/1488534389.jpg', './uploads/picture/20170303/1488534389.jpg', '', '', 1, 1488534389),
(461, './uploads/picture/20170303/1488534399.jpg', './uploads/picture/20170303/1488534399.jpg', '', '', 1, 1488534399),
(462, './uploads/picture/20170303/1488534455.jpg', './uploads/picture/20170303/1488534455.jpg', '', '', 1, 1488534455),
(463, './uploads/picture/20170303/1488534540.jpg', './uploads/picture/20170303/1488534540.jpg', '', '', 1, 1488534540),
(464, './uploads/picture/20170303/1488535243.jpg', './uploads/picture/20170303/1488535243.jpg', '', '', 1, 1488535243),
(465, './uploads/picture/20170303/1488535269.jpg', './uploads/picture/20170303/1488535269.jpg', '', '', 1, 1488535269),
(466, './uploads/picture/20170303/1488535299.jpg', './uploads/picture/20170303/1488535299.jpg', '', '', 1, 1488535299),
(467, './uploads/picture/20170303/1488535408.jpg', './uploads/picture/20170303/1488535408.jpg', '', '', 1, 1488535408),
(468, './uploads/picture/20170303/1488536805.jpg', './uploads/picture/20170303/1488536805.jpg', '', '', 1, 1488536805),
(469, './uploads/picture/20170303/1488536887.jpg', './uploads/picture/20170303/1488536887.jpg', '', '', 1, 1488536887),
(470, './uploads/picture/20170303/1488537012.jpg', './uploads/picture/20170303/1488537012.jpg', '', '', 1, 1488537012),
(471, './uploads/picture/20170303/1488537072.jpg', './uploads/picture/20170303/1488537072.jpg', '', '', 1, 1488537072),
(472, './uploads/picture/20170303/1488537133.jpg', './uploads/picture/20170303/1488537133.jpg', '', '', 1, 1488537133),
(473, './uploads/picture/20170303/1488537835.jpg', './uploads/picture/20170303/1488537835.jpg', '', '', 1, 1488537835),
(474, './uploads/picture/20170304/14885901790.jpg', './uploads/picture/20170304/14885901790.jpg', '', '', 1, 1488590179),
(475, './uploads/picture/20170304/14885901791.jpg', './uploads/picture/20170304/14885901791.jpg', '', '', 1, 1488590179),
(476, './uploads/picture/20170304/1488591273.jpg', './uploads/picture/20170304/1488591273.jpg', '', '', 1, 1488591273),
(477, './uploads/picture/20170304/1488591279.jpg', './uploads/picture/20170304/1488591279.jpg', '', '', 1, 1488591279),
(478, './uploads/picture/20170304/1488591284.jpg', './uploads/picture/20170304/1488591284.jpg', '', '', 1, 1488591284),
(479, './uploads/picture/20170304/1488596474.jpg', './uploads/picture/20170304/1488596474.jpg', '', '', 1, 1488596474),
(480, './uploads/picture/20170304/1488596582.jpg', './uploads/picture/20170304/1488596582.jpg', '', '', 1, 1488596582),
(481, './uploads/picture/20170304/1488623286.jpg', './uploads/picture/20170304/1488623286.jpg', '', '', 1, 1488623286),
(482, './uploads/picture/20170304/1488623793.jpg', './uploads/picture/20170304/1488623793.jpg', '', '', 1, 1488623793),
(483, './uploads/picture/20170304/1488624042.jpg', './uploads/picture/20170304/1488624042.jpg', '', '', 1, 1488624042),
(484, './uploads/picture/20170306/1488764377.jpg', './uploads/picture/20170306/1488764377.jpg', '', '', 1, 1488764377),
(485, './uploads/picture/20170306/1488764690.jpg', './uploads/picture/20170306/1488764690.jpg', '', '', 1, 1488764690),
(486, './uploads/picture/20170306/1488764932.jpg', './uploads/picture/20170306/1488764932.jpg', '', '', 1, 1488764932),
(487, './uploads/picture/20170306/1488764959.jpg', './uploads/picture/20170306/1488764959.jpg', '', '', 1, 1488764959),
(488, './uploads/picture/20170306/1488766843.jpg', './uploads/picture/20170306/1488766843.jpg', '', '', 1, 1488766843),
(489, './uploads/picture/20170306/1488767253.jpg', './uploads/picture/20170306/1488767253.jpg', '', '', 1, 1488767253),
(490, './uploads/picture/20170306/1488767839.jpg', './uploads/picture/20170306/1488767839.jpg', '', '', 1, 1488767839),
(491, './uploads/picture/20170306/1488767851.jpg', './uploads/picture/20170306/1488767851.jpg', '', '', 1, 1488767851),
(492, './uploads/picture/20170306/1488767897.jpg', './uploads/picture/20170306/1488767897.jpg', '', '', 1, 1488767897),
(493, './uploads/picture/20170306/14887698400.jpg', './uploads/picture/20170306/14887698400.jpg', '', '', 1, 1488769840),
(494, './uploads/picture/20170306/1488772380.jpg', './uploads/picture/20170306/1488772380.jpg', '', '', 1, 1488772380),
(495, './uploads/picture/20170306/1488772554.jpg', './uploads/picture/20170306/1488772554.jpg', '', '', 1, 1488772554),
(496, './uploads/picture/20170306/1488772743.jpg', './uploads/picture/20170306/1488772743.jpg', '', '', 1, 1488772743),
(497, './uploads/picture/20170306/1488772771.jpg', './uploads/picture/20170306/1488772771.jpg', '', '', 1, 1488772771),
(498, './uploads/picture/20170306/1488780677.jpg', './uploads/picture/20170306/1488780677.jpg', '', '', 1, 1488780677),
(499, './uploads/picture/20170306/1488780974.jpg', './uploads/picture/20170306/1488780974.jpg', '', '', 1, 1488780974),
(500, './uploads/picture/20170306/1488781018.jpg', './uploads/picture/20170306/1488781018.jpg', '', '', 1, 1488781018),
(501, './uploads/picture/20170306/1488781070.jpg', './uploads/picture/20170306/1488781070.jpg', '', '', 1, 1488781070),
(502, './uploads/picture/20170306/1488782501.jpg', './uploads/picture/20170306/1488782501.jpg', '', '', 1, 1488782501),
(503, './uploads/picture/20170306/1488786271.jpg', './uploads/picture/20170306/1488786271.jpg', '', '', 1, 1488786271),
(504, './uploads/picture/20170306/1488791272.jpg', './uploads/picture/20170306/1488791272.jpg', '', '', 1, 1488791272),
(505, './uploads/picture/20170306/1488791309.jpg', './uploads/picture/20170306/1488791309.jpg', '', '', 1, 1488791309),
(506, './uploads/picture/20170306/1488792516.jpg', './uploads/picture/20170306/1488792516.jpg', '', '', 1, 1488792516),
(507, './uploads/picture/20170306/1488792617.jpg', './uploads/picture/20170306/1488792617.jpg', '', '', 1, 1488792617),
(508, './uploads/picture/20170306/1488792799.jpg', './uploads/picture/20170306/1488792799.jpg', '', '', 1, 1488792799),
(509, './uploads/picture/20170306/1488793107.jpg', './uploads/picture/20170306/1488793107.jpg', '', '', 1, 1488793107),
(510, './uploads/picture/20170306/1488793177.jpg', './uploads/picture/20170306/1488793177.jpg', '', '', 1, 1488793177),
(511, './uploads/picture/20170306/1488793200.jpg', './uploads/picture/20170306/1488793200.jpg', '', '', 1, 1488793200),
(512, './uploads/picture/20170306/1488793427.jpg', './uploads/picture/20170306/1488793427.jpg', '', '', 1, 1488793427),
(513, './uploads/picture/20170306/1488793446.jpg', './uploads/picture/20170306/1488793446.jpg', '', '', 1, 1488793446),
(514, './uploads/picture/20170306/1488793716.jpg', './uploads/picture/20170306/1488793716.jpg', '', '', 1, 1488793716),
(515, './uploads/picture/20170306/1488793735.jpg', './uploads/picture/20170306/1488793735.jpg', '', '', 1, 1488793735),
(516, './uploads/picture/20170307/1488850971.jpg', './uploads/picture/20170307/1488850971.jpg', '', '', 1, 1488850971),
(517, './uploads/picture/20170307/1488854468.jpg', './uploads/picture/20170307/1488854468.jpg', '', '', 1, 1488854468),
(518, '/uploads/picture/20170313/77bb0085db6637205097ccd0398556b2.jpg', '/uploads/picture/20170313/77bb0085db6637205097ccd0398556b2.jpg', '45a1d0248ce5fc7d87c062d7920e2a82', 'b08cd74009944eab86ee6ce67c26abc3e77a8b7a', 1, 1489388946),
(519, '/uploads/picture/20170331/c69612aa21863b465c67c109e2144dd0.jpg', '/uploads/picture/20170331/c69612aa21863b465c67c109e2144dd0.jpg', 'defed9b24225af0ca98f97c4e118346e', '2ad9020a2ac0b4e15f2df3c342c8f79561859253', 1, 1490944292),
(520, '/uploads/picture/20170331/027364d3f9484ed0bfd390403c5dcc0a.jpg', '/uploads/picture/20170331/027364d3f9484ed0bfd390403c5dcc0a.jpg', '078da39173c8d46a8a061e6246c07f06', '4aa3199f23773989a0c012f5870f321177343a45', 1, 1490944372),
(521, '/uploads/picture/20170331/a69c92830397f4af1946cd46a5b2c166.jpg', '/uploads/picture/20170331/a69c92830397f4af1946cd46a5b2c166.jpg', '2b06c5b7199a520e989385471e258632', '063291041db4a88a31a481da35538f7dbc4ca705', 1, 1490944455),
(522, '/uploads/picture/20170331/b8a3d6f263e15288ecc20a6666212dd6.jpg', '/uploads/picture/20170331/b8a3d6f263e15288ecc20a6666212dd6.jpg', '9895696182717bb3eda08a2a26ef781a', '99451c3e225f00171106b9826a6dec78aa110294', 1, 1490944560),
(523, '/uploads/picture/20170331/044fa0b0ac5c746dc9692679454dc314.jpg', '/uploads/picture/20170331/044fa0b0ac5c746dc9692679454dc314.jpg', '9895696182717bb3eda08a2a26ef781a', '99451c3e225f00171106b9826a6dec78aa110294', 1, 1490944680),
(524, './uploads/picture/20170411/1491874904.jpg', './uploads/picture/20170411/1491874904.jpg', '', '', 1, 1491874904),
(525, './uploads/picture/20170411/1491875279.jpg', './uploads/picture/20170411/1491875279.jpg', '', '', 1, 1491875279),
(526, './uploads/picture/20170411/1491879244.jpg', './uploads/picture/20170411/1491879244.jpg', '', '', 1, 1491879244),
(527, './uploads/picture/20170425/1493081561.jpg', './uploads/picture/20170425/1493081561.jpg', '', '', 1, 1493081561),
(528, './uploads/picture/20170425/1493081612.jpg', './uploads/picture/20170425/1493081612.jpg', '', '', 1, 1493081612),
(529, './uploads/picture/20170425/1493081777.jpg', './uploads/picture/20170425/1493081777.jpg', '', '', 1, 1493081777),
(530, './uploads/picture/20170425/1493081835.jpg', './uploads/picture/20170425/1493081835.jpg', '', '', 1, 1493081835),
(531, './uploads/picture/20170425/1493081866.jpg', './uploads/picture/20170425/1493081866.jpg', '', '', 1, 1493081866),
(532, './uploads/picture/20170425/1493082178.jpg', './uploads/picture/20170425/1493082178.jpg', '', '', 1, 1493082178),
(533, './uploads/picture/20170425/1493082205.jpg', './uploads/picture/20170425/1493082205.jpg', '', '', 1, 1493082205),
(534, '/uploads/picture/20170425/af38610f14d5fcf1ff761a4080a0785f.jpg', '/uploads/picture/20170425/af38610f14d5fcf1ff761a4080a0785f.jpg', 'bb8bf5f5cb6d0f646d1c9b994d8fb603', 'df622d5d589064cde65e76a3416fe046f3360c7b', 1, 1493108396),
(535, '/uploads/picture/20170428/18c83a7ba50a2549df319e0ada5a221f.jpg', '/uploads/picture/20170428/18c83a7ba50a2549df319e0ada5a221f.jpg', 'bb8bf5f5cb6d0f646d1c9b994d8fb603', 'df622d5d589064cde65e76a3416fe046f3360c7b', 1, 1493344264),
(536, '/uploads/picture/20170428/afb794af492f9e4984d8e24f2900e36c.png', '/uploads/picture/20170428/afb794af492f9e4984d8e24f2900e36c.png', 'ec64bbe939d072c762704333171f2edc', '315d75a523aaf8c4e4b9d943c386cd44deaf7e54', 1, 1493344457),
(537, '/uploads/picture/20170428/de3296d0fc5e6d3018366f273698f587.jpg', '/uploads/picture/20170428/de3296d0fc5e6d3018366f273698f587.jpg', 'ae7830e09bcef4fcf6b8b6e9f0a638bf', '00092e2e5a11a7811baf334d82d447cd1ad11890', 1, 1493350392);

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

--
-- 转存表中的数据 `ruike_qr`
--

INSERT INTO `ruike_qr` (`id`, `title`, `desc`, `cover`, `mulit_subscribe`, `price`, `qr_exp`, `create_time`, `jump_url`, `area_limit`, `area`) VALUES
(1, 'test', 'test用a', '262', 0, 1, '2017-01-03 15:57:28', '2017-01-04 15:57:33', 'http://www.baidu.com', 1, 'www'),
(2, '斯大林', 'test用', '262', 1, 1, '2017-01-03 15:57:28', '2017-01-04 15:57:33', '', 0, ''),
(3, '卡斯特罗', 'test用', '262', 1, 1, '2017-01-03 15:57:28', '2017-01-04 15:57:33', '', 0, ''),
(4, '哈尔滨', 'test用', '262', 1, 1, '2017-01-03 15:57:28', '2017-01-04 15:57:33', '', 0, ''),
(6, '紫色其', '美人图', '292', 1, 90, '2017-01-17 14:45:07', '2017-01-31 19:50:07', '', 0, '');

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

--
-- 转存表中的数据 `ruike_qr_record`
--

INSERT INTO `ruike_qr_record` (`id`, `qr_id`, `union_id`, `open_id`, `token`, `status`, `create_time`, `is_focus`) VALUES
(10, 1, 'oPzkCwBFoc3Uc-CTgdfBStv7PjYg', 'o_VaowzPNiJfjOIvzFpF5SUJlJzI', 'irpfjy1484563046', 0, '2017-01-24 02:34:28', 0),
(11, 1, 'oPzkCwBFoc3Uc-CTgdfBStv7PjYg', 'o_VaowzPNiJfjOIvzFpF5SUJlJzI', 'atdskb1484806844', 0, '2017-01-24 02:35:04', 0);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `ruike_refuse_order`
--

INSERT INTO `ruike_refuse_order` (`id`, `uid`, `order_id`, `create_time`) VALUES
(1, 1, '181488536288912', '2017-03-03 18:25:23');

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

--
-- 转存表中的数据 `ruike_seo_rule`
--

INSERT INTO `ruike_seo_rule` (`id`, `title`, `app`, `controller`, `action`, `status`, `seo_title`, `seo_keywords`, `seo_description`, `sort`) VALUES
(1, '整站标题', '', '', '', 1, 'RuiKe网站管理系统', 'RuiKe网站管理系统', 'RuiKe网站管理系统', 7);

-- --------------------------------------------------------

--
-- 表的结构 `ruike_sms`
--

CREATE TABLE IF NOT EXISTS `ruike_sms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mobile` varchar(16) NOT NULL COMMENT '手机号码',
  `client_ip` varchar(50) NOT NULL COMMENT '客户端ip',
  `code` varchar(8) NOT NULL COMMENT 'php生成短信码',
  `status` tinyint(4) NOT NULL COMMENT '验证码状态，0已发出，1已使用',
  `create_time` datetime NOT NULL COMMENT '创建时间用于限制一天用户发送次数',
  `open_id` varchar(1024) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=83 ;

--
-- 转存表中的数据 `ruike_sms`
--

INSERT INTO `ruike_sms` (`id`, `mobile`, `client_ip`, `code`, `status`, `create_time`, `open_id`) VALUES
(46, '14795520542', '223.73.206.28', '7245', 1, '2017-03-04 18:26:32', ''),
(47, '14796583265', '223.73.206.125', '4303', 1, '2017-03-06 11:53:00', ''),
(48, '14795520543', '223.73.206.125', '2746', 0, '2017-03-06 11:59:03', ''),
(49, '14796583265', '223.73.206.125', '3235', 0, '2017-03-06 14:11:18', ''),
(50, '14795520542', '223.73.206.125', '3891', 0, '2017-03-06 14:16:14', ''),
(51, '14796583265', '223.73.206.125', '9564', 0, '2017-03-06 17:07:52', ''),
(52, '14796453457', '223.73.206.125', '4784', 0, '2017-03-06 17:43:48', ''),
(53, '14796583265', '223.73.206.125', '4966', 0, '2017-03-06 17:48:36', ''),
(54, '13766666222', '223.73.206.125', '5937', 0, '2017-03-06 18:38:53', ''),
(55, '13766666222', '223.73.206.125', '1170', 0, '2017-03-06 18:43:15', ''),
(56, '14795520543', '223.73.206.125', '2053', 0, '2017-03-07 09:07:18', ''),
(57, '14796583265', '223.73.206.125', '9385', 0, '2017-03-07 09:42:51', ''),
(58, '14795520543', '223.73.206.125', '1521', 0, '2017-03-07 09:57:56', ''),
(59, '14795520543', '223.73.206.125', '4532', 0, '2017-03-07 10:20:26', ''),
(60, '14796583265', '223.73.206.125', '1482', 0, '2017-03-07 10:41:08', ''),
(61, '18126152581', '223.73.0.99', '2530', 1, '2017-03-13 12:02:11', ''),
(62, '13656580029', '123.97.111.216', '8835', 1, '2017-03-13 14:34:09', ''),
(63, '14795520542', '', '5201', 1, '2017-03-31 10:29:37', ''),
(64, '14795520542', '', '8253', 1, '2017-03-31 14:38:42', ''),
(65, '18126152581', '', '8580', 1, '2017-03-31 14:49:22', ''),
(66, '14795520542', '', '7660', 1, '2017-03-31 14:56:56', ''),
(67, '13656580029', '', '8402', 1, '2017-03-31 14:58:28', ''),
(68, '13106030008', '123.97.117.225', '2649', 1, '2017-04-09 17:28:05', ''),
(69, '13586037778', '112.15.24.9', '7839', 0, '2017-04-09 23:03:53', ''),
(70, '13586037778', '112.15.24.9', '5207', 0, '2017-04-09 23:05:00', ''),
(71, '13586037778', '112.15.24.9', '593', 0, '2017-04-09 23:16:59', ''),
(72, '13586037778', '112.15.24.9', '4533', 1, '2017-04-09 23:18:38', ''),
(73, '13656580029', '220.185.149.130', '3213', 0, '2017-04-11 09:41:45', ''),
(74, '13656580029', '220.185.149.130', '6512', 0, '2017-04-11 09:47:59', ''),
(75, '13656580029', '223.73.206.120', '3829', 0, '2017-04-25 08:52:41', ''),
(76, '13656580029', '223.73.206.120', '3285', 0, '2017-04-25 08:56:18', ''),
(77, '13656580029', '223.73.206.120', '8872', 0, '2017-04-25 08:57:47', ''),
(78, '13656580029', '123.97.103.30', '6458', 0, '2017-04-25 09:02:58', ''),
(79, '15103584446', '', '2933', 1, '2017-04-29 16:17:14', ''),
(80, '18126152581', '', '6794', 1, '2017-05-09 11:42:01', ''),
(81, '14795520542', '', '1947', 1, '2017-05-12 11:55:04', ''),
(82, '18126152581', '14.24.210.217', '330', 1, '2017-05-17 09:33:43', '');

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

--
-- 转存表中的数据 `ruike_user_level`
--

INSERT INTO `ruike_user_level` (`level_id`, `level_name`, `amount`, `discount`, `describe`) VALUES
(1, '注册会员', 0.00, 100, '注册会员'),
(2, '铜牌会员', 10000.00, 98, '铜牌会员'),
(3, '白银会员', 30000.00, 95, '白银会员'),
(4, '黄金会员', 50000.00, 92, '黄金会员'),
(5, '钻石会员', 100000.00, 90, '钻石会员'),
(6, '超级VIP', 200000.00, 88, '超级VIP');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=35 ;

--
-- 转存表中的数据 `ruike_vote`
--

INSERT INTO `ruike_vote` (`id`, `title`, `keyword`, `desc`, `cover`, `music`, `vote_type`, `status`, `vote_starttime`, `vote_endtime`, `register_starttime`, `register_endtime`, `detail`, `vote_user_limit`, `vote_ip_limit`, `browse_num`, `vote_num`, `register_num`, `notice`, `vote_notice`, `vote_autditing`, `advert_id`, `page_view`, `share`) VALUES
(34, '2012017萌宝投票', '投票', '分享本次投票到您的朋友圈吧', 342, '', 0, 1, '2017-01-26 10:17:42', '2017-01-31 10:15:42', '2017-01-26 10:17:42', '2017-01-31 10:15:42', '<div style="word-wrap: break-word; color: rgb(0, 0, 0); font-family: "sans serif", tahoma, verdana, helvetica; font-size: 12px; white-space: normal;"><span style="line-height: 1.5;">一等奖（3名）：</span><span style="line-height: 1.5;">2000元内定制礼物一份：智能电视机、空气净化器、平衡车等</span></div><div style="word-wrap: break-word; color: rgb(0, 0, 0); font-family: "sans serif", tahoma, verdana, helvetica; font-size: 12px; white-space: normal;"><span style="line-height: 1.5;">二等奖（5名）：</span><span style="line-height: 1.5;">800元内定制礼物一份：咖啡机、净水器、空气炸锅、榨汁机等</span></div><div style="word-wrap: break-word; color: rgb(0, 0, 0); font-family: "sans serif", tahoma, verdana, helvetica; font-size: 12px; white-space: normal;"><span style="line-height: 1.5;">三等奖（20名）：</span><span style="line-height: 1.5;">200元内定制礼物一份：年货礼盒、加湿器、面包机、电水壶等</span></div><div style="word-wrap: break-word; color: rgb(0, 0, 0); font-family: "sans serif", tahoma, verdana, helvetica; font-size: 12px; white-space: normal;"><span style="line-height: 1.5;">纪念奖（50名）：</span><span style="line-height: 1.5;">精美浪潮ERP台历一份</span></div><div style="word-wrap: break-word; color: rgb(0, 0, 0); font-family: "sans serif", tahoma, verdana, helvetica; font-size: 12px; white-space: normal;"><span style="line-height: 1.5;">参与奖（@所有人）：</span><span style="line-height: 1.5;">活动期间拨打客户专线400-658-6000购买财务软件，产品再享88折优惠。</span></div><div><span style="line-height: 1.5;"><br/></span></div><p><br/></p>', 3, 10, 1000, 1000, 1000, '投票开始啦！', 1, 1, 0, 178, 1);

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
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `ruike_vote_config`
--

INSERT INTO `ruike_vote_config` (`id`, `jump_url`, `multi_vote`, `subscribe_vote`, `vote_mode`, `unsubscribe_vote`, `area_vote_limit`, `area`, `vote_limit_rule`, `vote_alert_rule`, `vote_alert_notice`, `vote_lock_rule`, `vote_lock_notice`, `vote_score_switch`, `vote_score`, `vote_gift`, `wx_id`) VALUES
(1, 'http://www.baidu.com', 1, 1, 0, 1, 0, '广西', 1, 999990, '投票警告通知 34投票警告通知投票警告通知', 4450, '投票锁定通知投票锁定通知897', 1, 7850, 1, 29),
(2, '', 1, 1, 1, 1, 1, '投票限制区域，8099，lisa', 1, 990, '投票警告通知 34投票警告通知投票警告通知', 4450, '投票锁定通知投票锁定通知897', 1, 7850, 1, 0);

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
  `wecha_id` varchar(128) NOT NULL COMMENT '微信id',
  `union_id` varchar(128) NOT NULL COMMENT '微信unionid',
  `head_pic` varchar(225) NOT NULL COMMENT '从微信获取到的头像',
  `sort` int(11) NOT NULL COMMENT '排序',
  `status` int(11) NOT NULL COMMENT '状态：0锁定 1正常',
  `createtime` datetime NOT NULL COMMENT '报名时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `ruike_vote_item`
--

INSERT INTO `ruike_vote_item` (`id`, `vote_id`, `nickname`, `realname`, `mobile`, `type`, `url`, `intro`, `vote_num`, `vote_dnum`, `wecha_id`, `union_id`, `head_pic`, `sort`, `status`, `createtime`) VALUES
(8, 34, '', '力', '18126152681', 0, '346', '天天', 0, 0, 'oZCEfuM3t7ZJCNmgg3DwcnsZ_Bas', 'oPzkCwD6-QwYuYg6AMYOTcnniQIE', 'http://wx.qlogo.cn/mmopen/WOm5u5FTB64Tvya3Bqt3N6gUO824JmEGibn7xthN55bg3ljibOXw4XYPtBqfuxtfcszvYCCnlbUialhl3Na6iaRs7ibop4Ezb8fBx/0', 0, 1, '0000-00-00 00:00:00'),
(7, 34, '', '裴', '18126152581', 0, '343', '天天', 39, 3, 'o_VaowzPNiJfjOIvzFpF5SUJlJzI', 'oPzkCwBFoc3Uc-CTgdfBStv7PjYg', 'http://wx.qlogo.cn/mmopen/mm3yJHj7xy2MwjvvTZUJI1hlia1tmPr6m2Ac9iaprDwicThlyhXHemfHSgvgicK2r6fFkV8DIGrANnicFUnKMLluUkNtUaoET9jMy/0', 0, 1, '0000-00-00 00:00:00');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `ruike_vote_menu`
--

INSERT INTO `ruike_vote_menu` (`id`, `name`, `url`, `icon`, `sort`, `status`) VALUES
(1, '首页', 'http://diyijia.ruikesoft.com/wap/vote/index/', 'fa fa-home', 0, 1),
(2, '榜单', 'http://diyijia.ruikesoft.com/wap/vote/rank/', 'fa fa-bar-chart', 0, 1),
(3, '报名', 'http://diyijia.ruikesoft.com/wap/vote/signup/', 'fa  fa-edit ', 0, 1),
(4, '奖品', 'http://diyijia.ruikesoft.com/wap/vote/content/contentId/39', 'fa fa-gift', 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `ruike_vote_record`
--

CREATE TABLE IF NOT EXISTS `ruike_vote_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vote_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `wecha_id` varchar(64) NOT NULL,
  `union_id` varchar(64) NOT NULL,
  `client_ip` varchar(64) NOT NULL,
  `token` varchar(64) NOT NULL,
  `create_time` datetime NOT NULL,
  `vote_num` int(11) unsigned NOT NULL COMMENT '票数',
  `status` tinyint(4) unsigned NOT NULL COMMENT '状态 0是准备投票  1是投票成功',
  `power_open_id` varchar(64) NOT NULL COMMENT '原 微信id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=22 ;

--
-- 转存表中的数据 `ruike_vote_record`
--

INSERT INTO `ruike_vote_record` (`id`, `vote_id`, `item_id`, `wecha_id`, `union_id`, `client_ip`, `token`, `create_time`, `vote_num`, `status`, `power_open_id`) VALUES
(21, 34, 8, '', 'oPzkCwBFoc3Uc-CTgdfBStv7PjYg', '183.61.52.70', 'atdskb1484806844', '2017-01-26 13:19:49', 0, 0, 'o_VaowzPNiJfjOIvzFpF5SUJlJzI'),
(20, 34, 7, 'oZCEfuM3t7ZJCNmgg3DwcnsZ_Bas', 'oPzkCwD6-QwYuYg6AMYOTcnniQIE', '183.61.52.71', 'atdskb1484806844', '2017-01-26 13:14:01', 12, 1, 'oZCEfuM3t7ZJCNmgg3DwcnsZ_Bas'),
(19, 34, 7, 'oZCEfuM3t7ZJCNmgg3DwcnsZ_Bas', 'oPzkCwD6-QwYuYg6AMYOTcnniQIE', '183.61.52.71', 'atdskb1484806844', '2017-01-26 13:01:11', 12, 1, 'oZCEfuM3t7ZJCNmgg3DwcnsZ_Bas'),
(18, 34, 7, 'oZCEfuM3t7ZJCNmgg3DwcnsZ_Bas', 'oPzkCwD6-QwYuYg6AMYOTcnniQIE', '219.133.40.15', 'atdskb1484806844', '2017-01-26 10:50:55', 1, 1, 'o_Vaow7ZKJtnrL9-FlPn9AY5EAbA'),
(17, 34, 7, 'oZCEfuM3t7ZJCNmgg3DwcnsZ_Bas', 'oPzkCwD6-QwYuYg6AMYOTcnniQIE', '219.133.40.15', 'atdskb1484806844', '2017-01-26 10:50:47', 1, 1, 'o_Vaow7ZKJtnrL9-FlPn9AY5EAbA'),
(16, 34, 7, 'oZCEfuM3t7ZJCNmgg3DwcnsZ_Bas', 'oPzkCwD6-QwYuYg6AMYOTcnniQIE', '183.61.52.71', 'atdskb1484806844', '2017-01-26 10:46:28', 1, 1, 'o_Vaow7ZKJtnrL9-FlPn9AY5EAbA');

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
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=28 ;

--
-- 转存表中的数据 `ruike_wx_keyword`
--

INSERT INTO `ruike_wx_keyword` (`id`, `key`, `type`, `module_id`) VALUES
(3, '4', 'vote_item', 4),
(6, '7', 'vote_item', 7),
(4, '6', 'vote_item', 6),
(5, '投票', 'vote', 34),
(7, '8', 'vote_item', 8),
(8, '吉田', 'content', 28),
(10, '晕车', 'content', 27),
(11, '刘德华，周润发，李嘉欣', 'content', 26),
(12, '刘德华，周润发，李嘉欣', 'content', 25),
(13, '刘德华，周润发，李嘉欣，杨恭如', 'content', 24),
(15, '刘德华，周润发，李嘉欣', 'content', 23),
(16, '标签，蛤蟆，乌龟，王八', 'content', 22),
(17, '里万', 'content', 21),
(27, '', 'content', 18),
(21, '标签，分子', 'content', 35),
(23, '刘德华，周润发，李嘉欣', 'content', 14),
(24, '', 'content', 19),
(25, '', 'content', 16),
(26, '', 'content', 17);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=48 ;

--
-- 转存表中的数据 `ruike_wx_menu`
--

INSERT INTO `ruike_wx_menu` (`id`, `level`, `name`, `sort`, `type`, `value`, `token`, `pid`) VALUES
(28, 1, '搜豹官网', 0, 'view', 'http://www.tp-shop.cn/index.php/Mobile/', 'irpfjy1484563046', 0),
(42, 1, '商城', 0, 'view', 'http://www.tp-shop.cn/index.php/Mobile/', 'irpfjy1484563046', 0),
(30, 1, '你好TP', 0, 'click', '你好', 'irpfjy1484563046', 28),
(46, 1, '黑暗圣杯', 0, 'click', '圣杯', 'irpfjy1484563046', 45),
(47, 1, '伏笔', 0, 'click', '约束', 'irpfjy1484563046', 45),
(43, 1, '爱丽丝.菲尔', 0, 'view', 'http://www.tp-shop.cn/index.php/Mobile/', 'irpfjy1484563046', 42),
(44, 1, '美丽的樱花', 0, 'view', 'http://www.tp-shop.cn/index.php/Mobile/', 'irpfjy1484563046', 42),
(45, 1, '樱花', 0, 'view', 'http://ruikecmssvn.test.com/index.php/user/weixin/wxmenu', 'irpfjy1484563046', 0);

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

--
-- 转存表中的数据 `ruike_wx_reply`
--

INSERT INTO `ruike_wx_reply` (`id`, `content`, `type`, `content_type`, `token`, `create_time`) VALUES
(1, '亲，你终于来了！', 0, 0, '', '0000-00-00 00:00:00'),
(2, '对不起您的问题我回答不上来，我已上报领导，请耐心等待！', 1, 0, '', '0000-00-00 00:00:00');

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
  `url` varchar(1024) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`) USING BTREE,
  KEY `uid_2` (`uid`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='微信公共帐号' AUTO_INCREMENT=32 ;

--
-- 转存表中的数据 `ruike_wx_user`
--

INSERT INTO `ruike_wx_user` (`id`, `uid`, `wxname`, `encodingaeskey`, `encode`, `appid`, `appsecret`, `qr`, `wxid`, `weixin`, `headerpic`, `token`, `create_time`, `updatetime`, `type`, `status`, `is_default`, `mch_id`, `partnerkey`, `ssl_cer`, `ssl_key`, `url`) VALUES
(31, 0, '递一家', '', 0, 'wx7dfee87079341f21', '14d9af4259ffc97a99db7044f782fd43', '518', '', '', '', 'irpfjy1484563046', 1490689370, 0, 3, 1, 1, '', '', '', '', ''),
(30, 0, '吕梁人俱乐部', '', 0, 'wx41c0e07804690e52', 'f899520273ee7265f00ea6c1c159af23', '335', 'gh_00104ecbf96d', '', '334', 'ygpwlc1484809425', 1484810460, 0, 4, 0, 1, '1427757002', 'dqhIRxKrWJwtDLgtkHvVOzNPczmzMlrT', '', '', ''),
(29, 0, '临县人俱乐部', '', 0, 'wxcafc0f3657fe696f', '2dc361c4a87f83a5fef4643ee53db80e', '333', 'gh_818094e2cac9', 'QiKouChuZu', '332', 'atdskb1484806844', 1484806844, 0, 2, 0, 0, '', '', '', '', '');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
