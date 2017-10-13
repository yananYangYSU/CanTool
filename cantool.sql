/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50541
Source Host           : localhost:3306
Source Database       : cantool

Target Server Type    : MYSQL
Target Server Version : 50541
File Encoding         : 65001

Date: 2017-10-13 11:05:10
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `candata`
-- ----------------------------
DROP TABLE IF EXISTS `candata`;
CREATE TABLE `candata` (
  `autoId` int(11) NOT NULL,
  `ecuName` varchar(32) DEFAULT NULL,
  `data` double(4,0) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `unit` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`autoId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of candata
-- ----------------------------

-- ----------------------------
-- Table structure for `canmessage`
-- ----------------------------
DROP TABLE IF EXISTS `canmessage`;
CREATE TABLE `canmessage` (
  `id` int(11) unsigned NOT NULL COMMENT 'id 唯一值 非自增',
  `messageName` varchar(32) DEFAULT NULL COMMENT '信息名称 最长32字节',
  `dcl` tinyint(1) NOT NULL COMMENT '信息长度 0-8',
  `nodeName` varchar(32) DEFAULT NULL COMMENT '发送的节点名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of canmessage
-- ----------------------------

-- ----------------------------
-- Table structure for `canmessagestr`
-- ----------------------------
DROP TABLE IF EXISTS `canmessagestr`;
CREATE TABLE `canmessagestr` (
  `autoId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id` varchar(8) NOT NULL COMMENT 'canMessageID 16进制',
  `dcl` tinyint(1) NOT NULL,
  `byte0` char(2) DEFAULT NULL,
  `byte1` char(2) DEFAULT NULL,
  `byte2` char(2) DEFAULT NULL,
  `byte3` char(2) DEFAULT NULL,
  `byte4` char(2) DEFAULT NULL,
  `byte5` char(2) DEFAULT NULL,
  `byte6` char(2) DEFAULT NULL,
  `byte7` char(2) DEFAULT NULL,
  `time` datetime DEFAULT NULL COMMENT '到达时间',
  PRIMARY KEY (`autoId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of canmessagestr
-- ----------------------------

-- ----------------------------
-- Table structure for `cansignal`
-- ----------------------------
DROP TABLE IF EXISTS `cansignal`;
CREATE TABLE `cansignal` (
  `messageId` int(11) unsigned NOT NULL COMMENT '外键，canMessage表的id',
  `signalName` varchar(32) NOT NULL COMMENT '信号名称 最长32字节',
  `startBit` tinyint(2) NOT NULL COMMENT '起始位 0-64',
  `bitLength` tinyint(2) NOT NULL COMMENT 'bit段长 0-64',
  `bitType` tinyint(1) NOT NULL COMMENT '类型 0或1',
  `resolution` double(4,0) NOT NULL COMMENT 'A的值',
  `offset` double(4,0) NOT NULL COMMENT 'B的值',
  `minValue` double(4,0) NOT NULL COMMENT '物理最小值',
  `maxValue` double(4,0) NOT NULL COMMENT '物理最大值',
  `unit` varchar(12) DEFAULT NULL COMMENT '单位符号',
  `nodeNames` varchar(255) DEFAULT NULL COMMENT '要发送的节点字符串,逗号分隔',
  PRIMARY KEY (`signalName`),
  KEY `can信息id` (`messageId`),
  CONSTRAINT `can信息id` FOREIGN KEY (`messageId`) REFERENCES `canmessage` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cansignal
-- ----------------------------
