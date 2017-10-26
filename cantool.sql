/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50719
Source Host           : localhost:3306
Source Database       : cantool

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2017-10-26 15:26:24
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for can_message
-- ----------------------------
DROP TABLE IF EXISTS `can_message`;
CREATE TABLE `can_message` (
  `id` int(11) unsigned NOT NULL COMMENT 'id 唯一值 非自增',
  `messageName` varchar(32) DEFAULT NULL COMMENT '信息名称 最长32字节',
  `dcl` tinyint(1) NOT NULL COMMENT '信息长度 0-8',
  `nodeName` varchar(32) DEFAULT NULL COMMENT '发送的节点名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of can_message
-- ----------------------------
INSERT INTO `can_message` VALUES ('61', 'CDU_4', '8', 'CDU');
INSERT INTO `can_message` VALUES ('100', 'EngineData', '8', 'Engine');
INSERT INTO `can_message` VALUES ('273', 'Gateway_2', '8', 'Gateway');
INSERT INTO `can_message` VALUES ('792', 'BCM_BCAN_1', '8', 'BCM');
INSERT INTO `can_message` VALUES ('797', 'HVAC_3', '8', 'HVAC');
INSERT INTO `can_message` VALUES ('800', 'HVAC_1', '8', 'HVAC');
INSERT INTO `can_message` VALUES ('801', 'HVAC_2', '8', 'HVAC');
INSERT INTO `can_message` VALUES ('837', 'BCM_ESC_2', '8', 'BCM');
INSERT INTO `can_message` VALUES ('856', 'CDU_1', '8', 'CDU');
INSERT INTO `can_message` VALUES ('864', 'HVAC_4', '8', 'ACP');
INSERT INTO `can_message` VALUES ('867', 'ACP_1', '8', 'ACP');
INSERT INTO `can_message` VALUES ('868', 'PTC_1', '8', 'PTC');
INSERT INTO `can_message` VALUES ('915', 'BCM_VCU_2', '8', 'BCM');
INSERT INTO `can_message` VALUES ('1020', 'GearBoxInfo', '1', 'Engine');
INSERT INTO `can_message` VALUES ('1056', 'BCM_NM', '8', 'BCM');
INSERT INTO `can_message` VALUES ('1067', 'CDU_NM', '8', 'CDU');

-- ----------------------------
-- Table structure for can_msg_data
-- ----------------------------
DROP TABLE IF EXISTS `can_msg_data`;
CREATE TABLE `can_msg_data` (
  `autoId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id` varchar(8) NOT NULL COMMENT 'canMessageID 16进制',
  `dcl` tinyint(1) NOT NULL,
  `byteStr` varchar(24) DEFAULT NULL,
  `time` datetime DEFAULT NULL COMMENT '到达时间',
  PRIMARY KEY (`autoId`)
) ENGINE=MyISAM AUTO_INCREMENT=468 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of can_msg_data
-- ----------------------------
INSERT INTO `can_msg_data` VALUES ('13', '03d', '8', '07 F0 70 60 F8 4B 1C E9 ', '2017-10-18 10:41:47');
INSERT INTO `can_msg_data` VALUES ('14', '321', '8', 'B6 30 C9 47 F7 EE 44 71 ', '2017-10-18 10:41:52');
INSERT INTO `can_msg_data` VALUES ('4', '321', '8', 'D6 7A A9 AE DE A3 24 A2 ', '2017-10-18 10:41:02');
INSERT INTO `can_msg_data` VALUES ('5', '321', '8', '2C 12 7A 39 CF 5E A7 07 ', '2017-10-18 10:41:07');
INSERT INTO `can_msg_data` VALUES ('6', '321', '8', '85 F0 68 90 8A BE B7 21 ', '2017-10-18 10:41:12');
INSERT INTO `can_msg_data` VALUES ('7', '03d', '8', '29 96 66 E7 B2 7D C5 41 ', '2017-10-18 10:41:17');
INSERT INTO `can_msg_data` VALUES ('8', '03d', '8', '7A CA 38 23 55 94 9E 5F ', '2017-10-18 10:41:22');
INSERT INTO `can_msg_data` VALUES ('9', '321', '8', '95 86 99 82 3C 79 31 12 ', '2017-10-18 10:41:27');
INSERT INTO `can_msg_data` VALUES ('10', '31d', '8', '3C 85 2C B6 7E EE E3 86 ', '2017-10-18 10:41:32');
INSERT INTO `can_msg_data` VALUES ('11', '03d', '8', '83 5A 99 D2 6C C6 66 86 ', '2017-10-18 10:41:37');
INSERT INTO `can_msg_data` VALUES ('12', '321', '8', 'E8 CB 81 3E 0C C4 D7 8F ', '2017-10-18 10:41:42');
INSERT INTO `can_msg_data` VALUES ('15', '321', '8', '9E 25 8F EF E7 9A 53 8D ', '2017-10-18 10:41:57');
INSERT INTO `can_msg_data` VALUES ('16', '31d', '8', '1B 9B 6A 67 3B EE 46 5F ', '2017-10-18 10:42:02');
INSERT INTO `can_msg_data` VALUES ('17', '03d', '8', '25 35 44 F4 68 E5 95 C3 ', '2017-10-18 10:42:07');
INSERT INTO `can_msg_data` VALUES ('18', '321', '8', 'E4 6A 26 49 E4 DF 56 67 ', '2017-10-18 10:42:12');
INSERT INTO `can_msg_data` VALUES ('19', '321', '8', '37 50 57 44 EF E9 8A 1B ', '2017-10-18 10:42:17');
INSERT INTO `can_msg_data` VALUES ('20', '03d', '8', '02 62 D9 9C F7 4D 0D 4C ', '2017-10-18 10:42:22');
INSERT INTO `can_msg_data` VALUES ('21', '03d', '8', '0C 5E 6D ED 36 AC 4B 94 ', '2017-10-18 10:42:27');
INSERT INTO `can_msg_data` VALUES ('22', '31d', '8', '22 83 13 8E 7B 17 1D 9C ', '2017-10-18 10:42:32');
INSERT INTO `can_msg_data` VALUES ('23', '31d', '8', 'DF 14 08 FB FD FE 72 E0 ', '2017-10-18 10:42:37');
INSERT INTO `can_msg_data` VALUES ('24', '321', '8', '18 0F C2 10 02 DF 0C 6A ', '2017-10-18 10:42:42');
INSERT INTO `can_msg_data` VALUES ('25', '31d', '8', '0B 8D 8F F5 16 AF F5 64 ', '2017-10-18 10:42:47');
INSERT INTO `can_msg_data` VALUES ('26', '03d', '8', 'B1 08 C9 1D 1C B1 BE 39 ', '2017-10-18 10:42:52');
INSERT INTO `can_msg_data` VALUES ('27', '31d', '8', '60 D4 7C 5E F4 0E 02 38 ', '2017-10-18 10:42:57');
INSERT INTO `can_msg_data` VALUES ('28', '03d', '8', '93 F6 AD 9A A5 7C 15 43 ', '2017-10-18 10:43:02');
INSERT INTO `can_msg_data` VALUES ('29', '03d', '8', '56 64 2E 56 03 87 08 40 ', '2017-10-18 10:43:07');
INSERT INTO `can_msg_data` VALUES ('30', '31d', '8', '43 52 C2 B8 60 4E 34 09 ', '2017-10-18 10:43:12');
INSERT INTO `can_msg_data` VALUES ('31', '03d', '8', '98 B2 E9 C2 BF 93 E3 87 ', '2017-10-18 10:43:17');
INSERT INTO `can_msg_data` VALUES ('32', '321', '8', 'F2 91 A8 0E 69 3D 97 EC ', '2017-10-18 10:43:22');
INSERT INTO `can_msg_data` VALUES ('33', '03d', '8', '7F 4F 81 EB 22 10 CE 15 ', '2017-10-18 10:43:27');
INSERT INTO `can_msg_data` VALUES ('34', '03d', '8', '26 34 42 BA 8A 97 81 E5 ', '2017-10-18 10:43:32');
INSERT INTO `can_msg_data` VALUES ('35', '03d', '8', '51 A5 50 55 DE EF 54 2B ', '2017-10-18 10:43:37');
INSERT INTO `can_msg_data` VALUES ('36', '321', '8', '67 4C 5A D2 1C 3F F7 02 ', '2017-10-18 10:43:42');
INSERT INTO `can_msg_data` VALUES ('37', '03d', '8', 'CE B8 06 CC 25 E9 9A CB ', '2017-10-18 10:43:47');
INSERT INTO `can_msg_data` VALUES ('38', '321', '8', '9F 74 BC B0 C4 6A 3C 38 ', '2017-10-18 10:43:52');
INSERT INTO `can_msg_data` VALUES ('39', '31d', '8', 'EA 5E CE 08 50 8D 78 70 ', '2017-10-18 10:56:31');
INSERT INTO `can_msg_data` VALUES ('40', '31d', '8', 'FC 54 18 ED 3A 92 1E C2 ', '2017-10-18 10:56:36');
INSERT INTO `can_msg_data` VALUES ('41', '321', '8', '1D D7 4C 40 6A F6 2B 42 ', '2017-10-18 10:56:41');
INSERT INTO `can_msg_data` VALUES ('42', '31d', '8', '99 09 30 FB 63 D1 D4 70 ', '2017-10-18 10:56:46');
INSERT INTO `can_msg_data` VALUES ('43', '321', '8', '86 AF 3F AC 3A C4 1B 6A ', '2017-10-18 10:56:51');
INSERT INTO `can_msg_data` VALUES ('44', '321', '8', 'C7 50 D1 46 BE 6F 7A F3 ', '2017-10-18 10:56:56');
INSERT INTO `can_msg_data` VALUES ('45', '31d', '8', 'EB D6 76 84 32 B2 DF 2E ', '2017-10-18 10:57:01');
INSERT INTO `can_msg_data` VALUES ('46', '03d', '8', '76 C7 5F F8 5D 8E 9A 52 ', '2017-10-18 10:57:06');
INSERT INTO `can_msg_data` VALUES ('47', '31d', '8', '09 CA C3 78 ED 0E 69 46 ', '2017-10-18 10:57:11');
INSERT INTO `can_msg_data` VALUES ('48', '31d', '8', '59 8F EC 88 FC D1 B2 15 ', '2017-10-18 10:57:16');
INSERT INTO `can_msg_data` VALUES ('49', '03d', '8', '75 1A CD 8B 81 78 8C 63 ', '2017-10-18 10:57:21');
INSERT INTO `can_msg_data` VALUES ('50', '03d', '8', '98 4E ED 16 66 E1 1B DA ', '2017-10-18 10:57:26');
INSERT INTO `can_msg_data` VALUES ('51', '31d', '8', '91 40 E6 1E A8 DE 83 7A ', '2017-10-18 10:57:31');
INSERT INTO `can_msg_data` VALUES ('52', '31d', '8', 'BB E1 C1 8B EA 96 48 50 ', '2017-10-18 10:57:36');
INSERT INTO `can_msg_data` VALUES ('53', '03d', '8', 'BB 87 5A BF 3A 53 C4 CD ', '2017-10-18 10:57:41');
INSERT INTO `can_msg_data` VALUES ('54', '321', '8', '69 00 D2 D0 8A 92 28 D6 ', '2017-10-18 10:57:46');
INSERT INTO `can_msg_data` VALUES ('55', '03d', '8', '37 3C 4E 91 1A 99 0D 65 ', '2017-10-18 10:57:51');
INSERT INTO `can_msg_data` VALUES ('56', '321', '8', 'FA B0 D5 E7 96 B5 2C BE ', '2017-10-18 10:57:56');
INSERT INTO `can_msg_data` VALUES ('57', '03d', '8', '2B 80 83 0F 7E FF CF 36 ', '2017-10-18 10:58:01');
INSERT INTO `can_msg_data` VALUES ('58', '31d', '8', 'B9 FC 6A 3E E0 AF 1F B7 ', '2017-10-18 10:58:06');
INSERT INTO `can_msg_data` VALUES ('59', '31d', '8', '3B 7E 86 95 3C 32 4C 37 ', '2017-10-18 10:58:11');
INSERT INTO `can_msg_data` VALUES ('60', '321', '8', '75 6D 94 89 BF 8C 23 82 ', '2017-10-18 10:58:16');
INSERT INTO `can_msg_data` VALUES ('61', '31d', '8', 'FD E0 C1 4D D4 D1 73 89 ', '2017-10-18 10:58:21');
INSERT INTO `can_msg_data` VALUES ('62', '31d', '8', 'E4 30 B0 B8 57 1A 8E 9E ', '2017-10-18 10:58:26');
INSERT INTO `can_msg_data` VALUES ('63', '03d', '8', 'E7 C9 79 6D B5 02 A2 4F ', '2017-10-18 10:58:31');
INSERT INTO `can_msg_data` VALUES ('64', '31d', '8', 'E0 24 83 55 D7 C6 6A 1E ', '2017-10-18 10:58:36');
INSERT INTO `can_msg_data` VALUES ('65', '31d', '8', '27 DD 6F CC DE 12 F0 AF ', '2017-10-18 10:58:41');
INSERT INTO `can_msg_data` VALUES ('66', '03d', '8', '7C 2A 58 5D 47 C0 4C 46 ', '2017-10-18 10:58:46');
INSERT INTO `can_msg_data` VALUES ('67', '321', '8', 'C2 44 E4 49 85 26 C4 F1 ', '2017-10-18 10:58:51');
INSERT INTO `can_msg_data` VALUES ('68', '03d', '8', 'F6 FE EA D7 6E 0B 53 C2 ', '2017-10-18 10:58:56');
INSERT INTO `can_msg_data` VALUES ('69', '321', '8', 'EE E0 C9 33 C7 3C A2 D9 ', '2017-10-18 10:59:01');
INSERT INTO `can_msg_data` VALUES ('70', '31d', '8', '39 99 C8 E6 7F 4A D2 59 ', '2017-10-18 10:59:06');
INSERT INTO `can_msg_data` VALUES ('71', '31d', '8', 'A2 BA 9E 67 56 F2 B8 B9 ', '2017-10-18 10:59:11');
INSERT INTO `can_msg_data` VALUES ('72', '321', '8', 'E2 3F 9B 10 32 4E F7 95 ', '2017-10-18 10:59:16');
INSERT INTO `can_msg_data` VALUES ('73', '321', '8', '26 6C A6 1B DE 35 A0 F5 ', '2017-10-18 10:59:21');
INSERT INTO `can_msg_data` VALUES ('74', '31d', '8', 'DD 6B B0 9F 46 40 1A 86 ', '2017-10-18 10:59:26');
INSERT INTO `can_msg_data` VALUES ('75', '03d', '8', 'A2 29 6A 39 7F 59 52 57 ', '2017-10-18 10:59:31');
INSERT INTO `can_msg_data` VALUES ('76', '321', '8', 'BD BC E1 D8 3C F6 27 64 ', '2017-10-18 10:59:36');
INSERT INTO `can_msg_data` VALUES ('77', '03d', '8', '4F D6 E7 FD 24 CD 48 F1 ', '2017-10-18 10:59:41');
INSERT INTO `can_msg_data` VALUES ('78', '321', '8', 'C2 DD 1C E2 B3 29 CE 5A ', '2017-10-18 10:59:46');
INSERT INTO `can_msg_data` VALUES ('79', '321', '8', 'C6 C5 B1 DE 86 04 61 65 ', '2017-10-18 10:59:51');
INSERT INTO `can_msg_data` VALUES ('80', '03d', '8', '8F 28 4D 4A 02 BD FD 9A ', '2017-10-18 10:59:56');
INSERT INTO `can_msg_data` VALUES ('81', '31d', '8', '8D E0 72 BE D6 95 48 EA ', '2017-10-18 11:00:01');
INSERT INTO `can_msg_data` VALUES ('82', '31d', '8', '97 92 5D 61 7D 0B 94 13 ', '2017-10-18 11:00:06');
INSERT INTO `can_msg_data` VALUES ('83', '03d', '8', 'BB 62 DD E6 F8 77 35 4D ', '2017-10-18 11:00:11');
INSERT INTO `can_msg_data` VALUES ('84', '321', '8', 'C4 94 73 4E DB 05 61 3F ', '2017-10-18 11:00:16');
INSERT INTO `can_msg_data` VALUES ('85', '31d', '8', '9E A3 0E 70 70 C7 04 73 ', '2017-10-18 11:00:21');
INSERT INTO `can_msg_data` VALUES ('86', '03d', '8', 'A3 0E BB EF 81 E0 B8 51 ', '2017-10-18 11:00:26');
INSERT INTO `can_msg_data` VALUES ('87', '321', '8', '2D 88 FA 49 BB 69 60 55 ', '2017-10-18 11:00:31');
INSERT INTO `can_msg_data` VALUES ('88', '31d', '8', '20 28 14 D0 2A 25 54 FF ', '2017-10-18 11:00:36');
INSERT INTO `can_msg_data` VALUES ('89', '03d', '8', '95 75 6E FC 7B A0 2E 6D ', '2017-10-18 11:01:56');
INSERT INTO `can_msg_data` VALUES ('90', '03d', '8', '38 3D 3D A1 DA FE 59 79 ', '2017-10-18 11:02:01');
INSERT INTO `can_msg_data` VALUES ('91', '31d', '8', '28 C6 C8 8F 92 55 41 5D ', '2017-10-18 11:02:06');
INSERT INTO `can_msg_data` VALUES ('92', '321', '8', '1E 11 84 6E 31 43 34 CF ', '2017-10-18 11:02:11');
INSERT INTO `can_msg_data` VALUES ('93', '321', '8', '2F 1A BE 8E 1B F5 71 A2 ', '2017-10-18 11:02:16');
INSERT INTO `can_msg_data` VALUES ('94', '321', '8', '29 CE E8 AD 82 35 48 A0 ', '2017-10-18 11:02:21');
INSERT INTO `can_msg_data` VALUES ('95', '321', '8', '28 91 5F 1B 7A CB B0 FF ', '2017-10-18 11:02:26');
INSERT INTO `can_msg_data` VALUES ('96', '31d', '8', '61 33 84 E4 23 A1 B8 6B ', '2017-10-18 11:02:31');
INSERT INTO `can_msg_data` VALUES ('97', '03d', '8', '00 A7 FC 4D 9C AB 1D AC ', '2017-10-18 11:02:36');
INSERT INTO `can_msg_data` VALUES ('98', '03d', '8', '21 F1 4B E2 62 9E 1E EF ', '2017-10-18 11:02:41');
INSERT INTO `can_msg_data` VALUES ('99', '321', '8', 'DD 2B 06 2D B9 E8 A1 7C ', '2017-10-18 11:02:46');
INSERT INTO `can_msg_data` VALUES ('100', '31d', '8', '9E 24 F1 E3 2F 79 42 60 ', '2017-10-18 11:02:51');
INSERT INTO `can_msg_data` VALUES ('101', '03d', '8', '1A F4 4A EC B4 17 8F 45 ', '2017-10-18 11:02:56');
INSERT INTO `can_msg_data` VALUES ('102', '31d', '8', '3B 0F 7B 44 DA 6F E4 5F ', '2017-10-18 11:03:01');
INSERT INTO `can_msg_data` VALUES ('103', '03d', '8', '56 C0 31 FB 3E D8 BF 56 ', '2017-10-18 11:03:06');
INSERT INTO `can_msg_data` VALUES ('104', '31d', '8', '6E 7F 71 9C B3 C1 2C FD ', '2017-10-18 11:03:11');
INSERT INTO `can_msg_data` VALUES ('105', '03d', '8', '6D 3F DA 6B AB 0C 5F D6 ', '2017-10-18 11:03:16');
INSERT INTO `can_msg_data` VALUES ('106', '321', '8', 'DD A4 1E E8 4A 0B 17 A4 ', '2017-10-18 11:03:21');
INSERT INTO `can_msg_data` VALUES ('107', '31d', '8', 'E5 5F 97 53 39 4A DB 81 ', '2017-10-18 11:03:26');
INSERT INTO `can_msg_data` VALUES ('108', '321', '8', '28 74 34 3B 64 1E 96 65 ', '2017-10-18 11:03:31');
INSERT INTO `can_msg_data` VALUES ('109', '321', '8', 'B0 66 6D FD 60 9F 8C 96 ', '2017-10-18 11:03:36');
INSERT INTO `can_msg_data` VALUES ('110', '31d', '8', 'CE 52 65 24 2E 2F C9 D3 ', '2017-10-18 11:03:41');
INSERT INTO `can_msg_data` VALUES ('111', '31d', '8', '44 85 62 EC 15 45 6F 4B ', '2017-10-18 11:03:46');
INSERT INTO `can_msg_data` VALUES ('112', '31d', '8', '74 34 CE FC 55 37 60 C5 ', '2017-10-18 11:03:51');
INSERT INTO `can_msg_data` VALUES ('113', '321', '8', '73 04 CF 57 C6 7C 21 B6 ', '2017-10-18 11:03:56');
INSERT INTO `can_msg_data` VALUES ('114', '31d', '8', '1B 36 70 E6 37 9A 23 63 ', '2017-10-18 11:04:01');
INSERT INTO `can_msg_data` VALUES ('115', '321', '8', 'D9 43 3A 5E 4F 89 9E AD ', '2017-10-18 11:04:06');
INSERT INTO `can_msg_data` VALUES ('116', '31d', '8', '90 44 C9 13 1B 46 3F D5 ', '2017-10-18 11:04:11');
INSERT INTO `can_msg_data` VALUES ('117', '03d', '8', 'C1 F4 EC 3C A0 9E F4 DB ', '2017-10-18 11:04:16');
INSERT INTO `can_msg_data` VALUES ('118', '321', '8', '64 72 8F 46 B6 FC 5B 71 ', '2017-10-18 11:04:21');
INSERT INTO `can_msg_data` VALUES ('119', '31d', '8', '6C 80 D4 3C 86 F0 E2 6E ', '2017-10-18 11:04:26');
INSERT INTO `can_msg_data` VALUES ('120', '321', '8', '79 4C A4 0A 29 3A 11 37 ', '2017-10-18 11:04:31');
INSERT INTO `can_msg_data` VALUES ('121', '03d', '8', 'CC B7 E2 3B 38 17 52 73 ', '2017-10-18 11:04:36');
INSERT INTO `can_msg_data` VALUES ('122', '31d', '8', '49 28 68 25 73 93 08 19 ', '2017-10-18 11:04:41');
INSERT INTO `can_msg_data` VALUES ('123', '321', '8', '6F 44 A0 AE 4A AC 3E D3 ', '2017-10-18 11:04:46');
INSERT INTO `can_msg_data` VALUES ('124', '321', '8', 'D6 94 40 C3 29 1E 73 43 ', '2017-10-18 11:04:51');
INSERT INTO `can_msg_data` VALUES ('125', '31d', '8', '5F 11 17 D9 E5 04 F4 C5 ', '2017-10-18 11:04:56');
INSERT INTO `can_msg_data` VALUES ('126', '321', '8', '05 AE C0 1E 9B BA A5 70 ', '2017-10-18 11:05:01');
INSERT INTO `can_msg_data` VALUES ('127', '321', '8', '85 3C ED 99 BB 04 BB 8B ', '2017-10-18 11:05:06');
INSERT INTO `can_msg_data` VALUES ('128', '321', '8', '84 44 33 60 7D E8 0B 18 ', '2017-10-18 11:05:11');
INSERT INTO `can_msg_data` VALUES ('129', '03d', '8', 'C8 11 F8 74 5C 1F 55 12 ', '2017-10-18 11:05:16');
INSERT INTO `can_msg_data` VALUES ('130', '31d', '8', '8A DB F6 6E F0 6B 3D 31 ', '2017-10-18 11:05:21');
INSERT INTO `can_msg_data` VALUES ('131', '31d', '8', 'FE 10 64 78 FE 9D 53 BC ', '2017-10-18 11:05:26');
INSERT INTO `can_msg_data` VALUES ('132', '03d', '8', '33 F7 3D 84 F8 48 FA 2C ', '2017-10-18 11:05:31');
INSERT INTO `can_msg_data` VALUES ('133', '03d', '8', 'EB F5 96 7C 6E 68 BE 1F ', '2017-10-18 11:05:36');
INSERT INTO `can_msg_data` VALUES ('134', '321', '8', '00 94 68 6F 8F 6C BB 8C ', '2017-10-18 11:05:41');
INSERT INTO `can_msg_data` VALUES ('135', '321', '8', 'E5 D7 E8 A1 13 F6 F1 27 ', '2017-10-18 11:05:46');
INSERT INTO `can_msg_data` VALUES ('136', '03d', '8', '36 5A BA 68 B1 F9 06 A4 ', '2017-10-18 11:05:51');
INSERT INTO `can_msg_data` VALUES ('137', '31d', '8', '2A 6C 27 42 10 03 1A BE ', '2017-10-18 11:05:56');
INSERT INTO `can_msg_data` VALUES ('138', '31d', '8', '21 65 BA AE DF DF FA C7 ', '2017-10-18 11:06:01');
INSERT INTO `can_msg_data` VALUES ('139', '03d', '8', '11 F9 C7 19 B5 DD 96 B1 ', '2017-10-18 11:06:06');
INSERT INTO `can_msg_data` VALUES ('140', '31d', '8', 'BD EA 03 58 E5 D2 0C D2 ', '2017-10-18 11:06:11');
INSERT INTO `can_msg_data` VALUES ('141', '31d', '8', 'D6 4E 17 84 42 A3 C6 E9 ', '2017-10-18 11:06:16');
INSERT INTO `can_msg_data` VALUES ('142', '31d', '8', '9B AD F3 9A 68 08 5B 58 ', '2017-10-18 11:06:21');
INSERT INTO `can_msg_data` VALUES ('143', '321', '8', '04 89 7E 72 FA 0F 57 0A ', '2017-10-18 11:06:26');
INSERT INTO `can_msg_data` VALUES ('144', '321', '8', 'C5 51 8A 3A 38 D0 2F B3 ', '2017-10-18 11:06:31');
INSERT INTO `can_msg_data` VALUES ('145', '03d', '8', '95 61 C1 4D C5 1B EF FF ', '2017-10-18 11:06:36');
INSERT INTO `can_msg_data` VALUES ('146', '31d', '8', '00 5C BA E7 2D C3 FD 01 ', '2017-10-18 11:06:41');
INSERT INTO `can_msg_data` VALUES ('147', '31d', '8', '02 11 7F AD 8E 0F BE EC ', '2017-10-18 11:06:46');
INSERT INTO `can_msg_data` VALUES ('148', '321', '8', '8C FB A9 81 24 6B 7E D2 ', '2017-10-18 11:06:51');
INSERT INTO `can_msg_data` VALUES ('149', '03d', '8', 'B3 6A BC 87 76 C9 DD D4 ', '2017-10-18 11:06:56');
INSERT INTO `can_msg_data` VALUES ('150', '31d', '8', '80 05 D2 48 A8 CD 81 CD ', '2017-10-18 11:07:01');
INSERT INTO `can_msg_data` VALUES ('151', '31d', '8', '5D 9D DB C9 F0 51 7C E7 ', '2017-10-18 11:07:06');
INSERT INTO `can_msg_data` VALUES ('152', '31d', '8', '2D 85 68 CD 4C E7 74 85 ', '2017-10-18 11:07:11');
INSERT INTO `can_msg_data` VALUES ('153', '03d', '8', '99 25 44 9D 5D BF 7A 4F ', '2017-10-18 11:07:16');
INSERT INTO `can_msg_data` VALUES ('154', '31d', '8', 'C6 13 C2 48 D4 9A 6B 9A ', '2017-10-18 11:07:21');
INSERT INTO `can_msg_data` VALUES ('155', '03d', '8', 'E9 1A 48 2C 87 37 85 D4 ', '2017-10-18 11:07:26');
INSERT INTO `can_msg_data` VALUES ('156', '03d', '8', '14 40 28 46 CA F8 84 97 ', '2017-10-18 11:07:31');
INSERT INTO `can_msg_data` VALUES ('157', '03d', '8', '0E EB 03 7F 85 D0 A8 F5 ', '2017-10-18 11:07:36');
INSERT INTO `can_msg_data` VALUES ('158', '31d', '8', 'B9 F3 A7 4F BC 24 EA DB ', '2017-10-18 11:07:41');
INSERT INTO `can_msg_data` VALUES ('159', '31d', '8', 'CC A5 B0 2B DA 35 7C C6 ', '2017-10-18 11:07:46');
INSERT INTO `can_msg_data` VALUES ('160', '03d', '8', '21 49 D8 D0 46 50 41 9D ', '2017-10-18 11:07:51');
INSERT INTO `can_msg_data` VALUES ('161', '321', '8', 'D9 2A B4 26 8A C2 25 B0 ', '2017-10-18 11:07:56');
INSERT INTO `can_msg_data` VALUES ('162', '31d', '8', '64 B1 C9 36 42 9B 84 A1 ', '2017-10-18 11:08:01');
INSERT INTO `can_msg_data` VALUES ('163', '31d', '8', 'CB 06 11 72 74 DB C7 06 ', '2017-10-18 11:08:06');
INSERT INTO `can_msg_data` VALUES ('164', '31d', '8', '20 C9 15 AD 28 F6 98 96 ', '2017-10-18 11:08:11');
INSERT INTO `can_msg_data` VALUES ('165', '321', '8', '8F DD C6 DB E4 CB E8 08 ', '2017-10-18 11:08:16');
INSERT INTO `can_msg_data` VALUES ('166', '03d', '8', '2A 8A 5A E0 93 D4 02 C2 ', '2017-10-18 11:08:21');
INSERT INTO `can_msg_data` VALUES ('167', '03d', '8', '05 13 88 2E A9 E7 8B 19 ', '2017-10-18 11:08:26');
INSERT INTO `can_msg_data` VALUES ('168', '03d', '8', '57 97 42 FD 51 ED F6 99 ', '2017-10-18 11:08:31');
INSERT INTO `can_msg_data` VALUES ('169', '31d', '8', '23 27 3E 17 17 BB A8 9E ', '2017-10-18 11:08:36');
INSERT INTO `can_msg_data` VALUES ('170', '03d', '8', 'C3 0E 63 DE F5 76 83 6E ', '2017-10-18 11:08:41');
INSERT INTO `can_msg_data` VALUES ('171', '31d', '8', '24 5B 3D 6D 07 17 08 3D ', '2017-10-18 11:08:46');
INSERT INTO `can_msg_data` VALUES ('172', '03d', '8', '9C B7 E6 ED 63 2D 40 7E ', '2017-10-18 11:08:51');
INSERT INTO `can_msg_data` VALUES ('173', '321', '8', 'D5 39 33 AD 7B 3A D9 D7 ', '2017-10-18 11:08:56');
INSERT INTO `can_msg_data` VALUES ('174', '03d', '8', '04 9E 23 CA 6F 98 45 AB ', '2017-10-18 11:09:01');
INSERT INTO `can_msg_data` VALUES ('175', '321', '8', '01 96 6B 27 67 09 D8 26 ', '2017-10-18 11:09:06');
INSERT INTO `can_msg_data` VALUES ('176', '321', '8', '67 1F 8D 06 D8 17 F4 2E ', '2017-10-18 11:09:11');
INSERT INTO `can_msg_data` VALUES ('177', '321', '8', 'A5 7E D7 22 C9 10 9F 25 ', '2017-10-18 11:09:16');
INSERT INTO `can_msg_data` VALUES ('178', '321', '8', '69 3C 6E 6B 9C E3 58 74 ', '2017-10-18 11:09:21');
INSERT INTO `can_msg_data` VALUES ('179', '321', '8', 'CB D2 F5 57 36 94 BF FE ', '2017-10-18 11:09:26');
INSERT INTO `can_msg_data` VALUES ('180', '321', '8', '0C A6 97 7F 56 B7 67 B9 ', '2017-10-18 11:09:31');
INSERT INTO `can_msg_data` VALUES ('181', '31d', '8', '4C 65 F1 B5 F6 21 EB 8C ', '2017-10-18 11:09:36');
INSERT INTO `can_msg_data` VALUES ('182', '31d', '8', '01 99 08 54 3F 96 FE 0F ', '2017-10-18 11:09:41');
INSERT INTO `can_msg_data` VALUES ('183', '321', '8', '58 F6 E2 23 98 00 A8 C1 ', '2017-10-18 11:09:46');
INSERT INTO `can_msg_data` VALUES ('184', '321', '8', '40 A8 5D 84 D8 92 19 E0 ', '2017-10-18 11:09:51');
INSERT INTO `can_msg_data` VALUES ('185', '321', '8', 'D5 B2 FD 16 E6 4E 1D 92 ', '2017-10-18 11:09:56');
INSERT INTO `can_msg_data` VALUES ('186', '03d', '8', '65 A5 7A 1E 17 7D 03 EF ', '2017-10-18 11:10:01');
INSERT INTO `can_msg_data` VALUES ('187', '31d', '8', '88 16 C0 26 D2 22 5A 90 ', '2017-10-18 11:10:06');
INSERT INTO `can_msg_data` VALUES ('188', '321', '8', 'E8 C8 A9 40 78 D2 A9 03 ', '2017-10-18 11:10:11');
INSERT INTO `can_msg_data` VALUES ('189', '321', '8', 'C4 7D 4D 12 79 E3 88 3C ', '2017-10-18 11:10:16');
INSERT INTO `can_msg_data` VALUES ('190', '321', '8', '4D 60 F8 95 93 7C C9 CB ', '2017-10-18 11:10:21');
INSERT INTO `can_msg_data` VALUES ('191', '03d', '8', '31 D9 3D D8 22 C7 8E 61 ', '2017-10-18 11:10:26');
INSERT INTO `can_msg_data` VALUES ('192', '31d', '8', '72 77 3B 3F 2F ED 74 13 ', '2017-10-18 11:10:31');
INSERT INTO `can_msg_data` VALUES ('193', '321', '8', '38 FB B1 ED 3C 6C 90 08 ', '2017-10-18 11:10:36');
INSERT INTO `can_msg_data` VALUES ('194', '03d', '8', 'E3 DC 39 31 22 03 7E AF ', '2017-10-18 11:10:41');
INSERT INTO `can_msg_data` VALUES ('195', '31d', '8', '92 23 D4 C4 2D 67 F5 B3 ', '2017-10-18 11:10:46');
INSERT INTO `can_msg_data` VALUES ('196', '31d', '8', 'F5 AA 25 D3 3B 3C 7C 64 ', '2017-10-18 11:10:51');
INSERT INTO `can_msg_data` VALUES ('197', '31d', '8', '36 12 79 D3 00 DF 48 33 ', '2017-10-18 11:10:56');
INSERT INTO `can_msg_data` VALUES ('198', '03d', '8', 'C5 79 8F 82 24 54 FF 66 ', '2017-10-18 11:11:01');
INSERT INTO `can_msg_data` VALUES ('199', '03d', '8', '80 1D F5 4D 3E F8 57 EE ', '2017-10-18 11:11:06');
INSERT INTO `can_msg_data` VALUES ('200', '03d', '8', 'B6 E8 BD B8 08 99 94 17 ', '2017-10-18 11:11:11');
INSERT INTO `can_msg_data` VALUES ('201', '31d', '8', '67 05 26 A0 10 4C 7E D9 ', '2017-10-18 11:11:16');
INSERT INTO `can_msg_data` VALUES ('202', '31d', '8', '59 54 E6 E2 B5 22 EF DC ', '2017-10-18 11:11:21');
INSERT INTO `can_msg_data` VALUES ('203', '31d', '8', 'B5 59 6F 5E 2B D1 C4 CC ', '2017-10-18 11:11:26');
INSERT INTO `can_msg_data` VALUES ('204', '03d', '8', '4F 34 F6 A8 0A 1B CB 6D ', '2017-10-18 11:11:31');
INSERT INTO `can_msg_data` VALUES ('205', '321', '8', 'F0 17 4F 44 8A 18 36 BE ', '2017-10-18 11:11:36');
INSERT INTO `can_msg_data` VALUES ('206', '03d', '8', '64 B9 03 14 09 A3 04 03 ', '2017-10-18 11:11:41');
INSERT INTO `can_msg_data` VALUES ('207', '31d', '8', '0B 53 6F 37 86 69 1C B8 ', '2017-10-18 11:11:46');
INSERT INTO `can_msg_data` VALUES ('208', '03d', '8', 'D9 14 F6 44 C2 C5 A0 1E ', '2017-10-18 11:11:51');
INSERT INTO `can_msg_data` VALUES ('209', '321', '8', '54 3F 26 73 0F 09 B2 B4 ', '2017-10-18 11:11:56');
INSERT INTO `can_msg_data` VALUES ('210', '03d', '8', '31 3D 68 08 81 53 D9 A5 ', '2017-10-18 11:12:01');
INSERT INTO `can_msg_data` VALUES ('211', '321', '8', '7F 2E 76 E1 1B DE 75 0D ', '2017-10-18 11:12:06');
INSERT INTO `can_msg_data` VALUES ('212', '03d', '8', '0C B1 6E 6C 96 EC 50 C1 ', '2017-10-18 11:12:11');
INSERT INTO `can_msg_data` VALUES ('213', '03d', '8', '8D 7E AB E0 72 38 DF FE ', '2017-10-18 11:12:16');
INSERT INTO `can_msg_data` VALUES ('214', '321', '8', '32 46 9F 05 91 D6 CC A5 ', '2017-10-18 11:12:21');
INSERT INTO `can_msg_data` VALUES ('215', '03d', '8', '0A 7C EF F2 B4 BC C5 B9 ', '2017-10-18 11:12:26');
INSERT INTO `can_msg_data` VALUES ('216', '31d', '8', '7B 4E FC 14 E9 47 C3 20 ', '2017-10-18 11:12:31');
INSERT INTO `can_msg_data` VALUES ('217', '321', '8', 'EB 1D 5A C1 A9 C1 41 DB ', '2017-10-18 11:12:36');
INSERT INTO `can_msg_data` VALUES ('218', '03d', '8', '2B D1 C2 0E C2 1E 01 59 ', '2017-10-18 11:12:41');
INSERT INTO `can_msg_data` VALUES ('219', '31d', '8', 'AD 9C B0 DC F0 49 EC F7 ', '2017-10-18 11:12:46');
INSERT INTO `can_msg_data` VALUES ('220', '03d', '8', '3A 34 1B 66 4E E6 FF 62 ', '2017-10-18 11:12:51');
INSERT INTO `can_msg_data` VALUES ('221', '03d', '8', 'A8 F0 B5 EA 9B 3B F6 F9 ', '2017-10-18 11:12:56');
INSERT INTO `can_msg_data` VALUES ('222', '03d', '8', '69 51 D9 74 EE B2 28 C4 ', '2017-10-18 11:13:01');
INSERT INTO `can_msg_data` VALUES ('223', '31d', '8', '60 34 39 D2 30 E5 17 45 ', '2017-10-18 11:13:06');
INSERT INTO `can_msg_data` VALUES ('224', '31d', '8', '5C A0 13 3F 47 C6 57 85 ', '2017-10-18 11:13:11');
INSERT INTO `can_msg_data` VALUES ('225', '31d', '8', '5F DF 75 ED C3 AF 2F A3 ', '2017-10-18 11:13:16');
INSERT INTO `can_msg_data` VALUES ('226', '03d', '8', 'EB 31 19 CC 7B 9E 53 E3 ', '2017-10-18 11:13:21');
INSERT INTO `can_msg_data` VALUES ('227', '321', '8', '0F A0 6C 46 E2 3C A0 69 ', '2017-10-18 11:13:26');
INSERT INTO `can_msg_data` VALUES ('228', '03d', '8', '9B 41 E8 E2 0C F7 76 7B ', '2017-10-18 11:13:31');
INSERT INTO `can_msg_data` VALUES ('229', '31d', '8', '15 75 5D 99 E7 54 5B 5C ', '2017-10-18 11:13:36');
INSERT INTO `can_msg_data` VALUES ('230', '321', '8', 'B8 5B 22 0D 23 20 2A B1 ', '2017-10-18 11:13:41');
INSERT INTO `can_msg_data` VALUES ('231', '31d', '8', '29 0E D4 37 2E E9 11 E0 ', '2017-10-18 11:13:46');
INSERT INTO `can_msg_data` VALUES ('232', '03d', '8', 'C3 20 46 CC BB CD 3D 1A ', '2017-10-18 11:13:51');
INSERT INTO `can_msg_data` VALUES ('233', '31d', '8', 'AC 6C 98 1C 68 3C A1 CA ', '2017-10-18 11:13:56');
INSERT INTO `can_msg_data` VALUES ('234', '31d', '8', 'DB B6 0C A5 04 BD FF 64 ', '2017-10-18 11:14:01');
INSERT INTO `can_msg_data` VALUES ('235', '03d', '8', 'DB C8 41 34 12 E1 78 C5 ', '2017-10-18 11:14:06');
INSERT INTO `can_msg_data` VALUES ('236', '03d', '8', '42 EB AE E0 EC 03 93 49 ', '2017-10-18 11:14:11');
INSERT INTO `can_msg_data` VALUES ('237', '31d', '8', 'B0 CE 81 B0 10 88 0A 76 ', '2017-10-18 11:14:16');
INSERT INTO `can_msg_data` VALUES ('238', '31d', '8', '3A 09 16 10 48 DD 69 38 ', '2017-10-18 11:14:21');
INSERT INTO `can_msg_data` VALUES ('239', '03d', '8', '82 EF DE EC 95 09 C6 6E ', '2017-10-18 11:14:26');
INSERT INTO `can_msg_data` VALUES ('240', '03d', '8', 'C7 44 9D 39 E5 F2 B3 0E ', '2017-10-18 11:14:31');
INSERT INTO `can_msg_data` VALUES ('241', '321', '8', 'B1 92 DD E1 24 82 69 CB ', '2017-10-18 11:14:36');
INSERT INTO `can_msg_data` VALUES ('242', '31d', '8', '15 11 5E A7 30 52 5F B5 ', '2017-10-18 11:14:41');
INSERT INTO `can_msg_data` VALUES ('243', '321', '8', 'A4 2A 3F 54 3E 11 70 7B ', '2017-10-18 11:16:26');
INSERT INTO `can_msg_data` VALUES ('244', '03d', '8', 'BF DE 80 B8 F9 FA BD 20 ', '2017-10-18 11:16:31');
INSERT INTO `can_msg_data` VALUES ('245', '321', '8', 'E8 1E C3 A9 2D 50 4E 3B ', '2017-10-18 11:16:36');
INSERT INTO `can_msg_data` VALUES ('246', '31d', '8', 'C8 D9 81 8C C4 BC 46 29 ', '2017-10-18 11:16:41');
INSERT INTO `can_msg_data` VALUES ('247', '31d', '8', 'C9 4A EB F5 C7 F7 47 BA ', '2017-10-18 11:16:46');
INSERT INTO `can_msg_data` VALUES ('248', '31d', '8', '21 2B 2C 85 EF 65 3D 9C ', '2017-10-18 11:16:51');
INSERT INTO `can_msg_data` VALUES ('249', '31d', '8', '1F 4A CB 85 8C 31 30 49 ', '2017-10-18 11:16:56');
INSERT INTO `can_msg_data` VALUES ('250', '31d', '8', '2D 38 63 77 A0 91 41 80 ', '2017-10-18 11:17:01');
INSERT INTO `can_msg_data` VALUES ('251', '03d', '8', '14 68 CD E6 B0 AF ED 9E ', '2017-10-18 11:17:06');
INSERT INTO `can_msg_data` VALUES ('252', '03d', '8', '89 2B 0D 71 64 1B F3 51 ', '2017-10-18 11:17:11');
INSERT INTO `can_msg_data` VALUES ('253', '03d', '8', 'F8 0A 21 A7 6D C4 6B 25 ', '2017-10-18 11:17:16');
INSERT INTO `can_msg_data` VALUES ('254', '03d', '8', '94 40 07 14 5B 41 62 BB ', '2017-10-18 11:17:21');
INSERT INTO `can_msg_data` VALUES ('255', '321', '8', 'A4 30 27 48 D6 8D 7F 98 ', '2017-10-18 11:17:26');
INSERT INTO `can_msg_data` VALUES ('256', '321', '8', 'AA 22 92 A7 A0 08 33 6C ', '2017-10-18 11:17:31');
INSERT INTO `can_msg_data` VALUES ('257', '03d', '8', 'E8 59 3C 6C 67 2B 5E 2D ', '2017-10-18 11:17:36');
INSERT INTO `can_msg_data` VALUES ('258', '321', '8', '20 34 86 B3 5B 47 54 BD ', '2017-10-18 11:17:41');
INSERT INTO `can_msg_data` VALUES ('259', '321', '8', '8E 45 90 6E 38 FF 51 D1 ', '2017-10-18 11:17:46');
INSERT INTO `can_msg_data` VALUES ('260', '321', '8', 'AC 81 04 15 AA 84 E0 B2 ', '2017-10-18 11:17:51');
INSERT INTO `can_msg_data` VALUES ('261', '31d', '8', '54 83 3F 94 A7 2F F2 ED ', '2017-10-18 11:17:56');
INSERT INTO `can_msg_data` VALUES ('262', '31d', '8', '88 76 05 28 B1 49 3C 37 ', '2017-10-18 11:18:01');
INSERT INTO `can_msg_data` VALUES ('263', '03d', '8', '76 16 56 91 AC 06 21 DC ', '2017-10-18 11:18:06');
INSERT INTO `can_msg_data` VALUES ('264', '321', '8', '56 7E 0B 5B F8 25 08 47 ', '2017-10-18 11:18:11');
INSERT INTO `can_msg_data` VALUES ('265', '321', '8', '8F 08 FB 04 17 18 B3 BE ', '2017-10-18 11:18:16');
INSERT INTO `can_msg_data` VALUES ('266', '321', '8', '77 BE F0 64 71 B9 84 76 ', '2017-10-18 11:18:21');
INSERT INTO `can_msg_data` VALUES ('267', '31d', '8', 'DF 14 96 EF 25 2F 1C F9 ', '2017-10-18 11:18:26');
INSERT INTO `can_msg_data` VALUES ('268', '03d', '8', 'AA BC 32 9B DC 4A 30 6F ', '2017-10-18 11:18:31');
INSERT INTO `can_msg_data` VALUES ('269', '03d', '8', '8F BC D1 92 0F 29 5F 8F ', '2017-10-18 11:18:36');
INSERT INTO `can_msg_data` VALUES ('270', '03d', '8', 'FE D2 DB 24 1A E0 5C 2F ', '2017-10-18 11:18:41');
INSERT INTO `can_msg_data` VALUES ('271', '31d', '8', '8B 34 B2 F7 CB 26 6B C1 ', '2017-10-18 11:18:46');
INSERT INTO `can_msg_data` VALUES ('272', '321', '8', '38 F6 E2 73 71 B5 38 C8 ', '2017-10-18 11:18:51');
INSERT INTO `can_msg_data` VALUES ('273', '31d', '8', '84 59 1E 72 8D D0 6B B2 ', '2017-10-18 11:18:56');
INSERT INTO `can_msg_data` VALUES ('274', '03d', '8', '47 AE A4 B5 D3 6D 5D D4 ', '2017-10-18 11:19:01');
INSERT INTO `can_msg_data` VALUES ('275', '03d', '8', 'F3 F7 9A EB 69 FA A7 25 ', '2017-10-18 11:19:06');
INSERT INTO `can_msg_data` VALUES ('276', '03d', '8', '0D E7 F2 42 3F 47 FD F6 ', '2017-10-18 11:19:11');
INSERT INTO `can_msg_data` VALUES ('277', '321', '8', '6C A0 74 29 35 71 04 8A ', '2017-10-18 11:19:16');
INSERT INTO `can_msg_data` VALUES ('278', '321', '8', 'A3 73 8C 55 65 30 A2 02 ', '2017-10-18 11:19:21');
INSERT INTO `can_msg_data` VALUES ('279', '31d', '8', '06 51 B4 89 48 0A 66 E0 ', '2017-10-18 11:19:26');
INSERT INTO `can_msg_data` VALUES ('280', '321', '8', 'A7 CE FE A8 17 7E 8C 49 ', '2017-10-18 11:19:31');
INSERT INTO `can_msg_data` VALUES ('281', '321', '8', 'F0 19 F3 14 27 BA 08 5C ', '2017-10-18 11:19:36');
INSERT INTO `can_msg_data` VALUES ('282', '31d', '8', 'A2 48 0C 10 55 17 A8 EB ', '2017-10-18 11:19:41');
INSERT INTO `can_msg_data` VALUES ('283', '321', '8', '71 C0 35 3D 6C 13 37 53 ', '2017-10-18 11:19:46');
INSERT INTO `can_msg_data` VALUES ('284', '31d', '8', '03 BD 59 91 35 33 4F CD ', '2017-10-18 11:19:51');
INSERT INTO `can_msg_data` VALUES ('285', '321', '8', '24 A2 39 CC 42 C3 D4 71 ', '2017-10-18 11:19:56');
INSERT INTO `can_msg_data` VALUES ('286', '31d', '8', '2A B2 B0 20 C5 8E 04 B4 ', '2017-10-18 11:20:01');
INSERT INTO `can_msg_data` VALUES ('287', '321', '8', 'EF CA FE 95 D4 7D 7D 5D ', '2017-10-18 11:20:06');
INSERT INTO `can_msg_data` VALUES ('288', '321', '8', '88 EA 53 B6 C3 1A 76 6E ', '2017-10-18 11:20:11');
INSERT INTO `can_msg_data` VALUES ('289', '321', '8', 'A9 1E F4 B3 EC 77 D0 39 ', '2017-10-18 11:20:16');
INSERT INTO `can_msg_data` VALUES ('290', '03d', '8', '95 14 26 01 59 26 01 C5 ', '2017-10-18 11:20:21');
INSERT INTO `can_msg_data` VALUES ('291', '321', '8', '45 6B 66 BB 8E FA 67 B6 ', '2017-10-18 11:20:26');
INSERT INTO `can_msg_data` VALUES ('292', '31d', '8', '8B 5D 31 DC 9E E8 14 5E ', '2017-10-18 11:20:31');
INSERT INTO `can_msg_data` VALUES ('293', '321', '8', 'E9 2E 7D 16 C0 36 36 AE ', '2017-10-18 11:20:36');
INSERT INTO `can_msg_data` VALUES ('294', '03d', '8', 'C1 85 9A 8F 2B F7 A7 00 ', '2017-10-18 11:20:41');
INSERT INTO `can_msg_data` VALUES ('295', '31d', '8', 'DC E8 B2 1F 57 C5 DB AF ', '2017-10-18 11:20:46');
INSERT INTO `can_msg_data` VALUES ('296', '31d', '8', 'BD B0 F6 83 12 E0 18 4E ', '2017-10-18 11:20:51');
INSERT INTO `can_msg_data` VALUES ('297', '321', '8', 'D1 EE 90 5E A9 D7 38 22 ', '2017-10-18 11:20:56');
INSERT INTO `can_msg_data` VALUES ('298', '321', '8', 'D9 25 5C 22 20 14 03 6B ', '2017-10-18 11:21:01');
INSERT INTO `can_msg_data` VALUES ('299', '31d', '8', '4D 5F F6 4B 0A 47 19 9A ', '2017-10-18 11:21:06');
INSERT INTO `can_msg_data` VALUES ('300', '321', '8', '34 0E C7 78 70 83 96 22 ', '2017-10-18 11:21:11');
INSERT INTO `can_msg_data` VALUES ('301', '321', '8', '85 21 22 EF 13 30 FC F2 ', '2017-10-18 11:21:16');
INSERT INTO `can_msg_data` VALUES ('302', '03d', '8', 'F8 9D DC 0A 83 F6 53 4C ', '2017-10-18 11:21:21');
INSERT INTO `can_msg_data` VALUES ('303', '321', '8', '95 23 5C 47 F5 31 59 66 ', '2017-10-18 11:21:26');
INSERT INTO `can_msg_data` VALUES ('304', '321', '8', '7C 1C CA 9F 24 EE 66 9F ', '2017-10-18 11:21:31');
INSERT INTO `can_msg_data` VALUES ('305', '321', '8', 'E3 98 9D AB CA EE 66 83 ', '2017-10-18 11:21:36');
INSERT INTO `can_msg_data` VALUES ('306', '31d', '8', '4A 7C E0 54 F0 C1 A9 DF ', '2017-10-18 11:21:41');
INSERT INTO `can_msg_data` VALUES ('307', '321', '8', '5C 95 96 DA ED A8 D6 0B ', '2017-10-18 11:21:46');
INSERT INTO `can_msg_data` VALUES ('308', '31d', '8', '9A AA 58 65 80 DF 51 40 ', '2017-10-18 11:21:51');
INSERT INTO `can_msg_data` VALUES ('309', '321', '8', '3A 03 DC 16 3B 74 8B 68 ', '2017-10-18 11:21:56');
INSERT INTO `can_msg_data` VALUES ('310', '31d', '8', '3F 70 C2 F9 1F 8E 23 7B ', '2017-10-18 11:23:06');
INSERT INTO `can_msg_data` VALUES ('311', '31d', '8', 'AE BC 7D 06 59 47 A5 A0 ', '2017-10-18 11:23:11');
INSERT INTO `can_msg_data` VALUES ('312', '31d', '8', 'D7 A4 4E 50 8C 11 2D D0 ', '2017-10-18 11:23:16');
INSERT INTO `can_msg_data` VALUES ('313', '321', '8', '3C 8C AD 90 24 52 80 CE ', '2017-10-18 11:23:21');
INSERT INTO `can_msg_data` VALUES ('314', '321', '8', '32 11 85 4F BE 48 C1 7C ', '2017-10-18 11:23:26');
INSERT INTO `can_msg_data` VALUES ('315', '31d', '8', 'B9 D4 B8 1B 3E 06 5B 48 ', '2017-10-18 11:23:31');
INSERT INTO `can_msg_data` VALUES ('316', '31d', '8', 'F9 63 AC 66 00 55 21 7D ', '2017-10-18 11:23:36');
INSERT INTO `can_msg_data` VALUES ('317', '321', '8', 'EC 4F FD 03 31 50 A9 15 ', '2017-10-18 11:23:41');
INSERT INTO `can_msg_data` VALUES ('318', '31d', '8', '08 D7 04 40 C0 90 1D A1 ', '2017-10-18 11:23:46');
INSERT INTO `can_msg_data` VALUES ('319', '03d', '8', '58 D1 9F 04 00 4B B5 BC ', '2017-10-18 11:23:51');
INSERT INTO `can_msg_data` VALUES ('320', '321', '8', '04 4C A7 F9 DC 07 F0 20 ', '2017-10-18 11:23:56');
INSERT INTO `can_msg_data` VALUES ('321', '321', '8', '6C B1 14 A5 3D CC 8F 64 ', '2017-10-18 11:24:01');
INSERT INTO `can_msg_data` VALUES ('322', '31d', '8', 'A3 39 E7 64 C4 5B D0 3E ', '2017-10-18 11:24:06');
INSERT INTO `can_msg_data` VALUES ('323', '03d', '8', '78 5F 38 2E 58 A2 74 24 ', '2017-10-18 11:24:11');
INSERT INTO `can_msg_data` VALUES ('324', '31d', '8', '7F 9F D2 21 56 84 E0 BE ', '2017-10-18 11:24:16');
INSERT INTO `can_msg_data` VALUES ('325', '31d', '8', '1B 26 B6 5C 73 93 E2 8C ', '2017-10-18 11:39:26');
INSERT INTO `can_msg_data` VALUES ('326', '31d', '8', 'EC F2 EC 54 A5 CE AC A9 ', '2017-10-18 11:39:31');
INSERT INTO `can_msg_data` VALUES ('327', '31d', '8', '45 BE 60 2C C6 F2 2A 90 ', '2017-10-18 11:55:46');
INSERT INTO `can_msg_data` VALUES ('328', '03d', '8', '6B 70 B0 85 E6 6A 82 CB ', '2017-10-18 11:55:51');
INSERT INTO `can_msg_data` VALUES ('329', '31d', '8', '33 7C 88 67 E3 8A 7B 98 ', '2017-10-18 11:55:56');
INSERT INTO `can_msg_data` VALUES ('330', '03d', '8', 'E5 E9 80 68 BA 56 C2 21 ', '2017-10-18 11:56:01');
INSERT INTO `can_msg_data` VALUES ('331', '31d', '8', '98 4C 6D 81 59 4F EC EC ', '2017-10-18 11:56:06');
INSERT INTO `can_msg_data` VALUES ('332', '03d', '8', '52 32 E0 03 BF 5B 7B 53 ', '2017-10-18 11:56:11');
INSERT INTO `can_msg_data` VALUES ('333', '31d', '8', '05 7B 7B 86 CC 9A 3B 4A ', '2017-10-18 11:56:16');
INSERT INTO `can_msg_data` VALUES ('334', '31d', '8', 'D4 C2 05 59 E4 5B 45 59 ', '2017-10-18 11:56:21');
INSERT INTO `can_msg_data` VALUES ('335', '321', '8', 'FE 84 B7 15 A0 D8 62 99 ', '2017-10-18 11:56:26');
INSERT INTO `can_msg_data` VALUES ('336', '321', '8', '36 E7 E1 E3 42 C7 F3 74 ', '2017-10-18 11:56:31');
INSERT INTO `can_msg_data` VALUES ('337', '03d', '8', '25 98 A3 10 77 95 43 C3 ', '2017-10-18 11:56:36');
INSERT INTO `can_msg_data` VALUES ('338', '03d', '8', 'F6 68 84 93 66 BB 06 5C ', '2017-10-18 11:56:41');
INSERT INTO `can_msg_data` VALUES ('339', '31d', '8', '6A 37 29 93 45 B3 94 C2 ', '2017-10-18 11:56:46');
INSERT INTO `can_msg_data` VALUES ('340', '31d', '8', 'EE 30 17 90 E4 CF 9F F7 ', '2017-10-18 11:56:51');
INSERT INTO `can_msg_data` VALUES ('341', '321', '8', 'E4 56 5E ED C2 0F C7 47 ', '2017-10-18 11:56:56');
INSERT INTO `can_msg_data` VALUES ('342', '03d', '8', 'CA 5A FE CF A9 C9 FD 6B ', '2017-10-18 11:57:01');
INSERT INTO `can_msg_data` VALUES ('343', '31d', '8', '10 0E 9E 87 87 12 8D 70 ', '2017-10-18 11:57:06');
INSERT INTO `can_msg_data` VALUES ('344', '03d', '8', '53 B0 8D E3 F9 CE 6A A6 ', '2017-10-18 11:57:11');
INSERT INTO `can_msg_data` VALUES ('345', '321', '8', 'A4 11 0C 4D 11 51 FB 75 ', '2017-10-18 11:57:16');
INSERT INTO `can_msg_data` VALUES ('346', '321', '8', '7E B4 8A 30 21 31 1E 1E ', '2017-10-18 11:57:21');
INSERT INTO `can_msg_data` VALUES ('347', '321', '8', '8D 17 4E 3C 35 DA 59 D9 ', '2017-10-18 11:57:26');
INSERT INTO `can_msg_data` VALUES ('348', '321', '8', '99 B2 73 79 19 1D 11 F1 ', '2017-10-18 11:57:31');
INSERT INTO `can_msg_data` VALUES ('349', '321', '8', '25 44 C2 05 40 1D 18 B1 ', '2017-10-18 11:57:36');
INSERT INTO `can_msg_data` VALUES ('350', '31d', '8', '1B C5 8E C5 DC 8C 4F F1 ', '2017-10-18 11:57:41');
INSERT INTO `can_msg_data` VALUES ('351', '321', '8', '88 2D 5A DC F9 01 C3 A2 ', '2017-10-18 11:57:46');
INSERT INTO `can_msg_data` VALUES ('352', '31d', '8', '45 66 BD 54 6E D3 35 E6 ', '2017-10-18 11:57:51');
INSERT INTO `can_msg_data` VALUES ('353', '321', '8', '50 07 AE A9 C6 8E 6E 6D ', '2017-10-18 11:57:56');
INSERT INTO `can_msg_data` VALUES ('354', '321', '8', 'C7 DA 3A BA 98 2C 9A 4A ', '2017-10-18 11:58:01');
INSERT INTO `can_msg_data` VALUES ('355', '03d', '8', '3F 34 BF 2F A1 01 48 0F ', '2017-10-18 11:58:06');
INSERT INTO `can_msg_data` VALUES ('356', '03d', '8', '21 65 BC E7 F0 C1 38 77 ', '2017-10-18 11:59:01');
INSERT INTO `can_msg_data` VALUES ('357', '321', '8', '51 27 40 8B 9B C2 E7 8C ', '2017-10-18 11:59:06');
INSERT INTO `can_msg_data` VALUES ('358', '321', '8', 'D0 E5 5F 2F C8 B6 46 19 ', '2017-10-18 11:59:11');
INSERT INTO `can_msg_data` VALUES ('359', '31d', '8', '26 48 B7 F0 74 88 FC DE ', '2017-10-18 11:59:16');
INSERT INTO `can_msg_data` VALUES ('360', '31d', '8', '8E 92 D9 AA 46 C5 67 D8 ', '2017-10-18 11:59:21');
INSERT INTO `can_msg_data` VALUES ('361', '31d', '8', 'B4 7B 60 72 DC F4 B7 ED ', '2017-10-18 11:59:26');
INSERT INTO `can_msg_data` VALUES ('362', '31d', '8', 'F2 07 AA E4 2A 16 98 0E ', '2017-10-18 11:59:31');
INSERT INTO `can_msg_data` VALUES ('363', '321', '8', '47 5D 62 2E 6B F7 05 1C ', '2017-10-18 11:59:36');
INSERT INTO `can_msg_data` VALUES ('364', '03d', '8', '16 58 5A 32 5C 93 1F 66 ', '2017-10-18 11:59:41');
INSERT INTO `can_msg_data` VALUES ('365', '31d', '8', 'A0 A4 6A 4F B1 11 5B F6 ', '2017-10-18 11:59:46');
INSERT INTO `can_msg_data` VALUES ('366', '321', '8', '77 57 AE 6B 1E 2A 81 AC ', '2017-10-18 11:59:51');
INSERT INTO `can_msg_data` VALUES ('367', '31d', '8', 'B3 2C 5D 73 62 E7 AC BD ', '2017-10-18 11:59:56');
INSERT INTO `can_msg_data` VALUES ('368', '321', '8', 'E1 F1 81 B6 43 77 4A 7B ', '2017-10-18 12:00:01');
INSERT INTO `can_msg_data` VALUES ('369', '321', '8', '8A 10 53 9B CA 0F 42 BC ', '2017-10-18 12:00:06');
INSERT INTO `can_msg_data` VALUES ('370', '03d', '8', '4F 2F 0F 1E 05 D6 ED B4 ', '2017-10-18 12:00:11');
INSERT INTO `can_msg_data` VALUES ('371', '321', '8', 'EF 86 29 B1 D7 D1 12 2D ', '2017-10-18 12:00:16');
INSERT INTO `can_msg_data` VALUES ('372', '321', '8', '02 34 70 1E D3 88 33 53 ', '2017-10-18 12:00:21');
INSERT INTO `can_msg_data` VALUES ('373', '321', '8', 'D6 0B 88 8B 3D B8 14 0B ', '2017-10-18 12:00:26');
INSERT INTO `can_msg_data` VALUES ('374', '03d', '8', '93 DF B6 43 37 01 B7 36 ', '2017-10-18 12:00:31');
INSERT INTO `can_msg_data` VALUES ('375', '03d', '8', 'F6 0B 19 EA 8A 58 17 A4 ', '2017-10-18 12:00:36');
INSERT INTO `can_msg_data` VALUES ('376', '321', '8', 'FE 02 ED A7 7A F6 9D A7 ', '2017-10-18 12:00:41');
INSERT INTO `can_msg_data` VALUES ('377', '321', '8', 'B9 A1 9E 71 DD 3F 5C 0B ', '2017-10-18 12:00:46');
INSERT INTO `can_msg_data` VALUES ('378', '31d', '8', 'E4 6C 0E D9 8B 83 17 27 ', '2017-10-18 12:00:51');
INSERT INTO `can_msg_data` VALUES ('379', '321', '8', '88 6F 64 D9 C3 DD ED AE ', '2017-10-18 12:00:56');
INSERT INTO `can_msg_data` VALUES ('380', '03d', '8', '43 2F 68 BD A1 D9 F2 5F ', '2017-10-18 12:01:01');
INSERT INTO `can_msg_data` VALUES ('381', '03d', '8', '02 99 14 00 F8 D3 C1 11 ', '2017-10-18 12:01:06');
INSERT INTO `can_msg_data` VALUES ('382', '03d', '8', '3E 17 9F 97 54 29 3A D5 ', '2017-10-18 12:01:11');
INSERT INTO `can_msg_data` VALUES ('383', '03d', '8', '75 28 74 47 08 F0 E8 F3 ', '2017-10-18 12:01:16');
INSERT INTO `can_msg_data` VALUES ('384', '31d', '8', '26 7D 6F 0A 44 72 EF 6B ', '2017-10-18 12:01:21');
INSERT INTO `can_msg_data` VALUES ('385', '03d', '8', '4C 1A 6E 3F 26 29 76 9A ', '2017-10-18 12:01:26');
INSERT INTO `can_msg_data` VALUES ('386', '03d', '8', '24 1A 2E F5 7E 81 D7 96 ', '2017-10-18 12:01:31');
INSERT INTO `can_msg_data` VALUES ('387', '321', '8', '2E 26 10 56 E2 84 3D 46 ', '2017-10-18 15:50:59');
INSERT INTO `can_msg_data` VALUES ('388', '321', '8', '9C 4A 83 60 69 7B 9E BF ', '2017-10-18 15:51:04');
INSERT INTO `can_msg_data` VALUES ('389', '321', '8', 'DA 5D DC 65 1F 1F 35 70 ', '2017-10-18 15:51:09');
INSERT INTO `can_msg_data` VALUES ('390', '03d', '8', 'D4 8F ED E3 15 C2 67 60 ', '2017-10-18 15:51:14');
INSERT INTO `can_msg_data` VALUES ('391', '321', '8', '58 64 DD 1F FD 0A CB E4 ', '2017-10-18 15:51:19');
INSERT INTO `can_msg_data` VALUES ('392', '03d', '8', 'A7 B2 92 FA 1C 89 EF BD ', '2017-10-18 15:51:24');
INSERT INTO `can_msg_data` VALUES ('393', '31d', '8', 'C3 D6 73 D3 7C B8 A0 CD ', '2017-10-18 15:51:29');
INSERT INTO `can_msg_data` VALUES ('394', '31d', '8', '20 0C A7 CB 7C 2B 42 3E ', '2017-10-18 15:51:34');
INSERT INTO `can_msg_data` VALUES ('395', '321', '8', '67 DD 3E D2 A3 9A 8D 60 ', '2017-10-18 15:51:39');
INSERT INTO `can_msg_data` VALUES ('396', '03d', '8', 'D7 09 F4 AB 6B 12 9A D5 ', '2017-10-18 15:51:44');
INSERT INTO `can_msg_data` VALUES ('397', '03d', '8', '4F 78 32 0A 40 FB 15 3C ', '2017-10-18 15:51:49');
INSERT INTO `can_msg_data` VALUES ('398', '321', '8', 'C2 BC 45 69 22 2C 31 39 ', '2017-10-18 15:51:54');
INSERT INTO `can_msg_data` VALUES ('399', '31d', '8', '5C 6A D9 B2 21 5F FB 02 ', '2017-10-18 15:51:59');
INSERT INTO `can_msg_data` VALUES ('400', '31d', '8', 'AA 8E 3A AD 81 C2 95 FC ', '2017-10-18 15:52:04');
INSERT INTO `can_msg_data` VALUES ('401', '03d', '8', '44 E8 00 B8 AF 25 04 7B ', '2017-10-18 15:52:09');
INSERT INTO `can_msg_data` VALUES ('402', '31d', '8', '88 A0 2D E0 17 D0 F6 8C ', '2017-10-18 15:52:14');
INSERT INTO `can_msg_data` VALUES ('403', '31d', '8', '3E C6 0E 5F 63 8F 86 E4 ', '2017-10-18 15:53:42');
INSERT INTO `can_msg_data` VALUES ('404', '321', '8', '95 46 41 ED 2C B6 3E A1 ', '2017-10-18 15:53:47');
INSERT INTO `can_msg_data` VALUES ('405', '03d', '8', '6D 19 19 58 A4 93 55 23 ', '2017-10-18 15:53:52');
INSERT INTO `can_msg_data` VALUES ('406', '321', '8', 'B2 35 EC 63 A8 19 3E 3B ', '2017-10-18 15:53:57');
INSERT INTO `can_msg_data` VALUES ('407', '321', '8', 'D1 A4 C3 5B 0B D2 72 44 ', '2017-10-18 15:54:02');
INSERT INTO `can_msg_data` VALUES ('408', '321', '8', '0E 35 EF 72 83 67 CC 9D ', '2017-10-18 15:54:07');
INSERT INTO `can_msg_data` VALUES ('409', '03d', '8', '05 71 C0 FB ED 30 BB ED ', '2017-10-18 15:54:12');
INSERT INTO `can_msg_data` VALUES ('410', '31d', '8', '74 29 BD 81 46 1B 3F 99 ', '2017-10-18 15:54:17');
INSERT INTO `can_msg_data` VALUES ('411', '321', '8', 'EF CF F2 C7 CE E5 09 08 ', '2017-10-18 15:54:22');
INSERT INTO `can_msg_data` VALUES ('412', '03d', '8', '36 A5 BD 08 A4 C1 14 44 ', '2017-10-18 15:54:27');
INSERT INTO `can_msg_data` VALUES ('413', '31d', '8', '7E 60 8E 49 CD 22 0E 90 ', '2017-10-18 15:54:32');
INSERT INTO `can_msg_data` VALUES ('414', '321', '8', '70 83 8E D0 5C 4C 0B D9 ', '2017-10-18 15:54:37');
INSERT INTO `can_msg_data` VALUES ('415', '321', '8', '42 2A F5 F7 6E E1 CA 4A ', '2017-10-18 15:54:42');
INSERT INTO `can_msg_data` VALUES ('416', '321', '8', '77 A3 76 86 4B 12 55 A0 ', '2017-10-18 15:54:47');
INSERT INTO `can_msg_data` VALUES ('417', '321', '8', '26 78 AC 39 CF 2F 30 D3 ', '2017-10-18 15:54:52');
INSERT INTO `can_msg_data` VALUES ('418', '321', '8', 'A8 D8 5D 44 3F 5C 00 C9 ', '2017-10-18 15:54:57');
INSERT INTO `can_msg_data` VALUES ('419', '03d', '8', 'D5 DE 9A 3A 56 B6 B9 18 ', '2017-10-18 15:55:02');
INSERT INTO `can_msg_data` VALUES ('420', '31d', '8', '7A 6F C0 90 7F F8 CC A9 ', '2017-10-18 15:55:07');
INSERT INTO `can_msg_data` VALUES ('421', '31d', '8', '36 75 C7 11 28 08 B2 77 ', '2017-10-18 15:55:12');
INSERT INTO `can_msg_data` VALUES ('422', '03d', '8', 'E0 C4 E1 67 6B 7C D4 98 ', '2017-10-18 15:55:17');
INSERT INTO `can_msg_data` VALUES ('423', '321', '8', '25 4C 8E 0D A0 73 DB 51 ', '2017-10-18 15:55:22');
INSERT INTO `can_msg_data` VALUES ('424', '321', '8', 'C3 75 1D 73 2C 9C 74 2C ', '2017-10-18 15:55:27');
INSERT INTO `can_msg_data` VALUES ('425', '321', '8', '04 1C C4 36 C2 30 26 DD ', '2017-10-18 15:55:32');
INSERT INTO `can_msg_data` VALUES ('426', '03d', '8', '6B 09 25 6D D6 8D 31 E9 ', '2017-10-18 15:55:37');
INSERT INTO `can_msg_data` VALUES ('427', '03d', '8', '2E 4A 1F E5 30 BA 85 CA ', '2017-10-18 15:55:42');
INSERT INTO `can_msg_data` VALUES ('428', '321', '8', 'CC 3B 5E 4F A0 4B B1 C4 ', '2017-10-18 15:55:47');
INSERT INTO `can_msg_data` VALUES ('429', '321', '8', '49 8F 82 BF B7 A5 40 7F ', '2017-10-18 15:55:52');
INSERT INTO `can_msg_data` VALUES ('430', '03d', '8', '74 3A 50 09 11 2C 0B 46 ', '2017-10-18 15:55:57');
INSERT INTO `can_msg_data` VALUES ('431', '03d', '8', 'E9 59 4A 93 4C A6 BE CA ', '2017-10-18 15:56:02');
INSERT INTO `can_msg_data` VALUES ('432', '03d', '8', '2F FC 20 BE C0 15 EB A0 ', '2017-10-18 15:56:07');
INSERT INTO `can_msg_data` VALUES ('433', '321', '8', 'D5 C3 11 EB 2E 2F F7 DA ', '2017-10-18 15:56:12');
INSERT INTO `can_msg_data` VALUES ('434', '03d', '8', '29 54 EF 9F 5B 97 CB 08 ', '2017-10-18 15:56:17');
INSERT INTO `can_msg_data` VALUES ('435', '03d', '8', '2C 57 6B E6 99 17 96 E0 ', '2017-10-18 15:56:22');
INSERT INTO `can_msg_data` VALUES ('436', '321', '8', 'E5 C6 AB 9D C8 52 0A ED ', '2017-10-18 15:56:27');
INSERT INTO `can_msg_data` VALUES ('437', '31d', '8', '23 EE 87 4B 70 BD 5B 6D ', '2017-10-18 15:56:32');
INSERT INTO `can_msg_data` VALUES ('438', '321', '8', '80 65 41 8F 53 00 B0 F7 ', '2017-10-18 15:56:37');
INSERT INTO `can_msg_data` VALUES ('439', '321', '8', '24 62 1F 68 29 E0 6B 71 ', '2017-10-18 15:56:42');
INSERT INTO `can_msg_data` VALUES ('440', '31d', '8', '09 FA 95 E9 96 D4 FF DF ', '2017-10-18 15:56:47');
INSERT INTO `can_msg_data` VALUES ('441', '03d', '8', '87 D7 9F 52 C5 03 2B 6F ', '2017-10-18 15:56:52');
INSERT INTO `can_msg_data` VALUES ('442', '321', '8', 'CC 26 FB 74 E7 20 A3 DA ', '2017-10-18 15:56:57');
INSERT INTO `can_msg_data` VALUES ('443', '321', '8', '08 DF E1 BC 33 FE 24 B2 ', '2017-10-18 15:57:02');
INSERT INTO `can_msg_data` VALUES ('444', '31d', '8', '1B 9B D2 4A A6 F8 57 9D ', '2017-10-18 15:57:07');
INSERT INTO `can_msg_data` VALUES ('445', '321', '8', 'D8 05 02 C7 E4 C8 FD F8 ', '2017-10-18 15:57:12');
INSERT INTO `can_msg_data` VALUES ('446', '31d', '8', 'D4 4B 8C 73 9F 83 A0 D1 ', '2017-10-18 15:57:17');
INSERT INTO `can_msg_data` VALUES ('447', '321', '8', '5F 75 C6 47 C0 80 88 77 ', '2017-10-18 15:57:22');
INSERT INTO `can_msg_data` VALUES ('448', '31d', '8', '5C FB 0B E2 26 22 12 2A ', '2017-10-18 15:57:27');
INSERT INTO `can_msg_data` VALUES ('449', '03d', '8', '46 F5 C4 20 BF 85 20 36 ', '2017-10-18 15:57:32');
INSERT INTO `can_msg_data` VALUES ('450', '03d', '8', '0E EE 54 66 1A BF 9E 30 ', '2017-10-18 15:57:37');
INSERT INTO `can_msg_data` VALUES ('451', '31d', '8', '19 94 2E 0F 8C F4 59 2F ', '2017-10-18 15:57:42');
INSERT INTO `can_msg_data` VALUES ('452', '31d', '8', '57 69 25 D6 80 DB 88 D9 ', '2017-10-18 15:57:47');
INSERT INTO `can_msg_data` VALUES ('453', '31d', '8', '22 19 92 E4 A2 E2 33 A6 ', '2017-10-18 15:57:52');
INSERT INTO `can_msg_data` VALUES ('454', '03d', '8', '91 6F 6F DA 96 46 9A 31 ', '2017-10-18 15:57:57');
INSERT INTO `can_msg_data` VALUES ('455', '31d', '8', '17 1A 47 B1 28 0D 6D B7 ', '2017-10-18 15:58:02');
INSERT INTO `can_msg_data` VALUES ('456', '31d', '8', 'EF 9D 22 18 E7 52 C9 DA ', '2017-10-18 15:58:07');
INSERT INTO `can_msg_data` VALUES ('457', '321', '8', '81 64 5E EF 9B 0C DB 18 ', '2017-10-18 15:58:12');
INSERT INTO `can_msg_data` VALUES ('458', '31d', '8', 'D9 29 DF A0 86 DF 7D 52 ', '2017-10-18 15:58:17');
INSERT INTO `can_msg_data` VALUES ('459', '31d', '8', '05 72 94 4F AB CF 81 16 ', '2017-10-18 16:05:48');
INSERT INTO `can_msg_data` VALUES ('460', '321', '8', '52 30 58 C4 B9 36 98 6B ', '2017-10-18 16:05:53');
INSERT INTO `can_msg_data` VALUES ('461', '31d', '8', '90 FC 29 CF A7 03 A2 09 ', '2017-10-18 16:05:58');
INSERT INTO `can_msg_data` VALUES ('462', '31d', '8', '65 63 19 B3 EF B2 69 61 ', '2017-10-18 16:06:03');
INSERT INTO `can_msg_data` VALUES ('463', '321', '8', '47 9D 26 95 E0 3C AF 8A ', '2017-10-18 16:06:08');
INSERT INTO `can_msg_data` VALUES ('464', '321', '8', 'D3 E1 F9 1E 5C 5B 16 D6 ', '2017-10-18 16:06:13');
INSERT INTO `can_msg_data` VALUES ('465', '31d', '8', '8A 5B B2 C4 C1 4F 54 16 ', '2017-10-18 16:06:18');
INSERT INTO `can_msg_data` VALUES ('466', '31d', '8', '60 E9 FD D3 49 18 94 0E ', '2017-10-18 16:06:23');
INSERT INTO `can_msg_data` VALUES ('467', '03d', '8', '39 FC 1E 77 E6 8A EC F5 ', '2017-10-18 16:06:28');

-- ----------------------------
-- Table structure for can_phy_data
-- ----------------------------
DROP TABLE IF EXISTS `can_phy_data`;
CREATE TABLE `can_phy_data` (
  `autoId` int(11) NOT NULL,
  `ecuName` varchar(32) DEFAULT NULL,
  `data` double(4,0) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `unit` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`autoId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of can_phy_data
-- ----------------------------

-- ----------------------------
-- Table structure for can_signal
-- ----------------------------
DROP TABLE IF EXISTS `can_signal`;
CREATE TABLE `can_signal` (
  `autoId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `messageId` int(11) unsigned NOT NULL COMMENT '外键，canMessage表的id',
  `signalName` varchar(32) NOT NULL COMMENT '信号名称 最长32字节',
  `startBit` tinyint(2) NOT NULL COMMENT '起始位 0-64',
  `bitLength` tinyint(2) NOT NULL COMMENT 'bit段长 0-64',
  `bitType` tinyint(1) NOT NULL COMMENT '类型 0或1',
  `resolutionValue` double(20,8) NOT NULL COMMENT 'A的值',
  `offsetValue` double(20,8) NOT NULL COMMENT 'B的值',
  `minPhyValue` double(20,8) NOT NULL COMMENT '物理最小值',
  `maxPhyValue` double(20,8) NOT NULL COMMENT '物理最大值',
  `unit` varchar(12) DEFAULT NULL COMMENT '单位符号',
  `nodeNames` varchar(255) DEFAULT NULL COMMENT '要发送的节点字符串,逗号分隔',
  PRIMARY KEY (`autoId`),
  KEY `can信息id` (`messageId`),
  CONSTRAINT `can信息id` FOREIGN KEY (`messageId`) REFERENCES `can_message` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=322 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of can_signal
-- ----------------------------
INSERT INTO `can_signal` VALUES ('206', '856', 'CDU_HVACOffButtonSt', '0', '1', '0', '1.00000000', '0.00000000', '0.00000000', '1.00000000', '', 'HVAC');
INSERT INTO `can_signal` VALUES ('207', '856', 'CDU_HVACOffButtonStVD', '1', '1', '0', '1.00000000', '0.00000000', '0.00000000', '1.00000000', '', 'HVAC');
INSERT INTO `can_signal` VALUES ('208', '856', 'CDU_HVACAutoModeButtonSt', '2', '1', '0', '1.00000000', '0.00000000', '0.00000000', '1.00000000', '', 'HVAC');
INSERT INTO `can_signal` VALUES ('209', '856', 'CDU_HVACAutoModeButtonStVD', '3', '1', '0', '1.00000000', '0.00000000', '0.00000000', '1.00000000', '', 'HVAC');
INSERT INTO `can_signal` VALUES ('210', '856', 'CDU_HVACFDefrostButtonSt', '6', '1', '0', '1.00000000', '0.00000000', '0.00000000', '1.00000000', '', 'HVAC');
INSERT INTO `can_signal` VALUES ('211', '856', 'CDU_HVACFDefrostButtonStVD', '7', '1', '0', '1.00000000', '0.00000000', '0.00000000', '1.00000000', '', 'HVAC');
INSERT INTO `can_signal` VALUES ('212', '856', 'CDU_HVACDualButtonSt', '10', '1', '0', '1.00000000', '0.00000000', '0.00000000', '1.00000000', '', 'HVAC');
INSERT INTO `can_signal` VALUES ('213', '856', 'CDU_HVACDualButtonStVD', '11', '1', '0', '1.00000000', '0.00000000', '0.00000000', '1.00000000', '', 'HVAC');
INSERT INTO `can_signal` VALUES ('214', '856', 'CDU_HVACIonButtonSt', '12', '1', '0', '1.00000000', '0.00000000', '0.00000000', '1.00000000', '', 'HVAC');
INSERT INTO `can_signal` VALUES ('215', '856', 'CDU_HVACIonButtonStVD', '13', '1', '0', '1.00000000', '0.00000000', '0.00000000', '1.00000000', '', 'HVAC');
INSERT INTO `can_signal` VALUES ('216', '856', 'CDU_HVACCirculationButtonSt', '18', '1', '0', '1.00000000', '0.00000000', '0.00000000', '1.00000000', '', 'HVAC');
INSERT INTO `can_signal` VALUES ('217', '856', 'CDU_HVACCirculationButtonStVD', '19', '1', '0', '1.00000000', '0.00000000', '0.00000000', '1.00000000', '', 'HVAC');
INSERT INTO `can_signal` VALUES ('218', '856', 'CDU_HVACACButtonSt', '20', '1', '0', '1.00000000', '0.00000000', '0.00000000', '1.00000000', '', 'HVAC');
INSERT INTO `can_signal` VALUES ('219', '856', 'CDU_HVACACButtonStVD', '21', '1', '0', '1.00000000', '0.00000000', '0.00000000', '1.00000000', '', 'HVAC');
INSERT INTO `can_signal` VALUES ('220', '856', 'CDU_HVACACMaxButtonSt', '22', '1', '0', '1.00000000', '0.00000000', '0.00000000', '1.00000000', '', 'HVAC');
INSERT INTO `can_signal` VALUES ('221', '856', 'CDU_HVACACMaxButtonStVD', '23', '1', '0', '1.00000000', '0.00000000', '0.00000000', '1.00000000', '', 'HVAC');
INSERT INTO `can_signal` VALUES ('222', '856', 'CDU_HVACModeButtonSt', '26', '3', '0', '1.00000000', '0.00000000', '0.00000000', '7.00000000', '', 'HVAC');
INSERT INTO `can_signal` VALUES ('223', '856', 'HVAC_WindExitSpd', '30', '4', '0', '1.00000000', '0.00000000', '0.00000000', '15.00000000', '', ' Vector__XXX');
INSERT INTO `can_signal` VALUES ('224', '856', 'CDU_HVAC_DriverTempSelect', '36', '5', '0', '0.50000000', '18.00000000', '18.00000000', '32.00000000', '°C', ' Vector__XXX');
INSERT INTO `can_signal` VALUES ('225', '856', 'HVAC_PsnTempSelect', '44', '5', '0', '0.50000000', '18.00000000', '18.00000000', '32.00000000', '', ' Vector__XXX');
INSERT INTO `can_signal` VALUES ('226', '856', 'CDU_HVACCtrlModeSt', '54', '3', '0', '1.00000000', '0.00000000', '0.00000000', '7.00000000', '', 'HVAC');
INSERT INTO `can_signal` VALUES ('227', '856', 'CDU_ControlSt', '55', '1', '0', '1.00000000', '0.00000000', '0.00000000', '1.00000000', '', 'HVAC');
INSERT INTO `can_signal` VALUES ('228', '61', 'CDU_HVACACCfg', '1', '2', '0', '1.00000000', '0.00000000', '0.00000000', '3.00000000', '', 'HVAC');
INSERT INTO `can_signal` VALUES ('229', '61', 'CDU_HVACAirCirCfg', '3', '2', '0', '1.00000000', '0.00000000', '0.00000000', '3.00000000', '', 'HVAC');
INSERT INTO `can_signal` VALUES ('230', '61', 'CDU_HVACComfortCfg', '5', '2', '0', '1.00000000', '0.00000000', '0.00000000', '3.00000000', '', 'HVAC');
INSERT INTO `can_signal` VALUES ('231', '1067', 'CDU_NMDestAddress', '7', '8', '0', '1.00000000', '0.00000000', '0.00000000', '255.00000000', '', 'BCM,PEPS,ICM,CDU');
INSERT INTO `can_signal` VALUES ('232', '1067', 'CDU_NMAlive', '8', '1', '0', '1.00000000', '0.00000000', '0.00000000', '1.00000000', '', 'BCM,PEPS,ICM,CDU');
INSERT INTO `can_signal` VALUES ('233', '1067', 'CDU_NMRing', '9', '1', '0', '1.00000000', '0.00000000', '0.00000000', '1.00000000', '', 'BCM,PEPS,ICM,CDU');
INSERT INTO `can_signal` VALUES ('234', '1067', 'CDU_NMLimpHome', '10', '1', '0', '1.00000000', '0.00000000', '0.00000000', '1.00000000', '', 'BCM,PEPS,ICM,CDU');
INSERT INTO `can_signal` VALUES ('235', '1067', 'CDU_NMSleepInd', '12', '1', '0', '1.00000000', '0.00000000', '0.00000000', '1.00000000', '', 'BCM,PEPS,ICM,CDU');
INSERT INTO `can_signal` VALUES ('236', '1067', 'CDU_NMSleepAck', '13', '1', '0', '1.00000000', '0.00000000', '0.00000000', '1.00000000', '', 'BCM,PEPS,ICM,CDU');
INSERT INTO `can_signal` VALUES ('237', '1067', 'CDU_NMWakeupOrignin', '23', '8', '0', '1.00000000', '0.00000000', '0.00000000', '255.00000000', '', 'BCM,PEPS,ICM,CDU');
INSERT INTO `can_signal` VALUES ('238', '1067', 'CDU_NMDataField', '31', '40', '0', '1.00000000', '0.00000000', '0.00000000', '1.00000000', '', 'BCM,PEPS,ICM,CDU');
INSERT INTO `can_signal` VALUES ('239', '1056', 'BCM_NMDestAddress', '7', '8', '0', '1.00000000', '0.00000000', '0.00000000', '255.00000000', '', 'BCM,PEPS,ICM,CDU');
INSERT INTO `can_signal` VALUES ('240', '1056', 'BCM_NMAlive', '8', '1', '0', '1.00000000', '0.00000000', '0.00000000', '1.00000000', '', 'BCM,PEPS,ICM,CDU');
INSERT INTO `can_signal` VALUES ('241', '1056', 'BCM_NMRing', '9', '1', '0', '1.00000000', '0.00000000', '0.00000000', '1.00000000', '', 'BCM,PEPS,ICM,CDU');
INSERT INTO `can_signal` VALUES ('242', '1056', 'BCM_NMLimpHome', '10', '1', '0', '1.00000000', '0.00000000', '0.00000000', '1.00000000', '', 'BCM,PEPS,ICM,CDU');
INSERT INTO `can_signal` VALUES ('243', '1056', 'BCM_NMSleepInd', '12', '1', '0', '1.00000000', '0.00000000', '0.00000000', '1.00000000', '', 'BCM,PEPS,ICM,CDU');
INSERT INTO `can_signal` VALUES ('244', '1056', 'BCM_NMSleepAck', '13', '1', '0', '1.00000000', '0.00000000', '0.00000000', '1.00000000', '', 'BCM,PEPS,ICM,CDU');
INSERT INTO `can_signal` VALUES ('245', '1056', 'BCM_NMWakeupOrignin', '23', '8', '0', '1.00000000', '0.00000000', '0.00000000', '255.00000000', '', 'BCM,PEPS,ICM,CDU');
INSERT INTO `can_signal` VALUES ('246', '1056', 'BCM_NMDataField', '31', '40', '0', '1.00000000', '0.00000000', '0.00000000', '1.00000000', '', 'BCM,PEPS,ICM,CDU');
INSERT INTO `can_signal` VALUES ('247', '792', 'BCM_KeySt', '1', '2', '0', '1.00000000', '0.00000000', '1.00000000', '3.00000000', '', 'PEPS,ICM,AVM,CDU,HVAC');
INSERT INTO `can_signal` VALUES ('248', '837', 'ESC_VehSpdVD', '37', '1', '0', '1.00000000', '0.00000000', '0.00000000', '1.00000000', '', 'BCM,PEPS,ICM,AVM,CDU');
INSERT INTO `can_signal` VALUES ('249', '837', 'ESC_VehSpd', '36', '13', '0', '0.05625000', '0.00000000', '0.00000000', '240.00000000', '', 'BCM,PEPS,ICM,AVM,CDU');
INSERT INTO `can_signal` VALUES ('250', '915', 'VCU_CompressorPwrLimit', '21', '6', '0', '100.00000000', '0.00000000', '0.00000000', '6000.00000000', 'w', 'HVAC');
INSERT INTO `can_signal` VALUES ('251', '915', 'VCU_CompressorPwrLimitAct', '32', '1', '0', '1.00000000', '0.00000000', '0.00000000', '1.00000000', '', 'HVAC');
INSERT INTO `can_signal` VALUES ('252', '915', 'VCU_PTCPwrLimit', '29', '6', '0', '100.00000000', '0.00000000', '0.00000000', '6000.00000000', 'w', 'HVAC');
INSERT INTO `can_signal` VALUES ('253', '915', 'VCU_PTCrPwrLimitAct', '33', '1', '0', '1.00000000', '0.00000000', '0.00000000', '1.00000000', '', 'HVAC');
INSERT INTO `can_signal` VALUES ('254', '915', 'VCU_AirCompressorReq', '36', '1', '0', '1.00000000', '0.00000000', '0.00000000', '1.00000000', '', 'HVAC');
INSERT INTO `can_signal` VALUES ('255', '915', 'VCU_AirCompressorReqVD', '37', '1', '0', '1.00000000', '0.00000000', '0.00000000', '1.00000000', '', 'HVAC');
INSERT INTO `can_signal` VALUES ('256', '800', 'HVAC_AirCompressorSt', '2', '3', '0', '1.00000000', '0.00000000', '0.00000000', '1.00000000', '', 'CDU');
INSERT INTO `can_signal` VALUES ('257', '800', 'HVAC_CorrectedExterTempVD', '3', '1', '0', '1.00000000', '0.00000000', '0.00000000', '1.00000000', '', 'BCM,CDU');
INSERT INTO `can_signal` VALUES ('258', '800', 'HVAC_RawExterTempVD', '4', '1', '0', '1.00000000', '0.00000000', '0.00000000', '1.00000000', '', 'CDU');
INSERT INTO `can_signal` VALUES ('259', '800', 'HVAC_EngIdleStopProhibitReq', '5', '1', '0', '1.00000000', '0.00000000', '0.00000000', '1.00000000', '', 'CDU');
INSERT INTO `can_signal` VALUES ('260', '800', 'HVAC_ACSt', '6', '1', '0', '1.00000000', '0.00000000', '0.00000000', '1.00000000', '', 'CDU');
INSERT INTO `can_signal` VALUES ('261', '800', 'HVAC_ACmaxSt', '7', '1', '0', '1.00000000', '0.00000000', '0.00000000', '1.00000000', '', 'CDU');
INSERT INTO `can_signal` VALUES ('262', '800', 'HVAC_CorrectedExterTemp', '15', '8', '0', '0.50000000', '-40.00000000', '-40.00000000', '87.50000000', '°C', 'BCM,CDU');
INSERT INTO `can_signal` VALUES ('263', '800', 'HVAC_RawExterTemp', '23', '8', '0', '0.50000000', '-40.00000000', '-40.00000000', '87.50000000', '°C', 'CDU');
INSERT INTO `can_signal` VALUES ('264', '800', 'HVAC_TempSelect', '28', '5', '0', '0.50000000', '18.00000000', '18.00000000', '32.00000000', '°C', 'CDU');
INSERT INTO `can_signal` VALUES ('265', '800', 'HVAC_DualSt', '29', '1', '0', '1.00000000', '0.00000000', '0.00000000', '1.00000000', '', 'CDU');
INSERT INTO `can_signal` VALUES ('266', '800', 'HVAC_AutoSt', '30', '1', '0', '1.00000000', '0.00000000', '0.00000000', '1.00000000', '', 'CDU');
INSERT INTO `can_signal` VALUES ('267', '800', 'HVAC_Type', '31', '1', '0', '1.00000000', '0.00000000', '0.00000000', '1.00000000', '', 'CDU');
INSERT INTO `can_signal` VALUES ('268', '800', 'HVAC_WindExitMode', '34', '3', '0', '1.00000000', '0.00000000', '0.00000000', '7.00000000', '', 'CDU');
INSERT INTO `can_signal` VALUES ('269', '800', 'HVAC_SpdFanReq', '36', '2', '0', '1.00000000', '0.00000000', '0.00000000', '1.00000000', '', 'CDU');
INSERT INTO `can_signal` VALUES ('270', '800', 'HVAC_TelematicsSt', '42', '3', '0', '1.00000000', '0.00000000', '0.00000000', '7.00000000', '', 'CDU');
INSERT INTO `can_signal` VALUES ('271', '800', 'HVAC_AirCirculationSt', '46', '2', '0', '1.00000000', '0.00000000', '0.00000000', '3.00000000', '', 'CDU');
INSERT INTO `can_signal` VALUES ('272', '800', 'HVAC_PopUpDisplayReq', '47', '1', '0', '1.00000000', '0.00000000', '0.00000000', '1.00000000', '', 'CDU');
INSERT INTO `can_signal` VALUES ('273', '800', 'HVAC_DriverTempSelect', '53', '5', '0', '0.50000000', '18.00000000', '18.00000000', '32.00000000', '°C', 'CDU');
INSERT INTO `can_signal` VALUES ('274', '800', 'HVAC_IonMode', '55', '2', '0', '1.00000000', '0.00000000', '0.00000000', '3.00000000', '', 'CDU');
INSERT INTO `can_signal` VALUES ('275', '800', 'HVAC_WindExitSpd', '59', '4', '0', '1.00000000', '0.00000000', '0.00000000', '15.00000000', '', 'CDU');
INSERT INTO `can_signal` VALUES ('276', '800', 'HVAC_PsnTempSelect', '48', '5', '0', '0.50000000', '18.00000000', '18.00000000', '32.00000000', '', 'CDU');
INSERT INTO `can_signal` VALUES ('277', '801', 'HVAC_RawCabinTemp', '7', '8', '0', '0.50000000', '-40.00000000', '-40.00000000', '87.50000000', '°C', 'CDU');
INSERT INTO `can_signal` VALUES ('278', '801', 'HVAC_CorrectedCabinTemp', '15', '8', '0', '0.50000000', '-40.00000000', '-40.00000000', '87.50000000', '°C', 'CDU');
INSERT INTO `can_signal` VALUES ('279', '801', 'HVAC_RawCabinTempVD', '19', '1', '0', '1.00000000', '0.00000000', '0.00000000', '1.00000000', '', 'CDU');
INSERT INTO `can_signal` VALUES ('280', '801', 'HVAC_CompressorComsumpPwr', '17', '10', '0', '10.00000000', '0.00000000', '0.00000000', '8000.00000000', 'w', 'BCM');
INSERT INTO `can_signal` VALUES ('281', '801', 'HVAC_PTCPwrAct', '33', '10', '0', '10.00000000', '0.00000000', '0.00000000', '8000.00000000', 'w', 'BCM');
INSERT INTO `can_signal` VALUES ('282', '801', 'HVAC_stPTCAct', '55', '3', '0', '1.00000000', '0.00000000', '0.00000000', '1.00000000', '', 'BCM');
INSERT INTO `can_signal` VALUES ('283', '801', 'HVAC_CorrectedCabinTempVD', '18', '1', '0', '1.00000000', '0.00000000', '0.00000000', '1.00000000', '', 'CDU');
INSERT INTO `can_signal` VALUES ('284', '797', 'HVAC_ACCfgSt', '0', '1', '0', '1.00000000', '0.00000000', '0.00000000', '1.00000000', '', 'CDU');
INSERT INTO `can_signal` VALUES ('285', '797', 'HVAC_AirCirCfgSt', '1', '1', '0', '1.00000000', '0.00000000', '0.00000000', '1.00000000', '', 'CDU');
INSERT INTO `can_signal` VALUES ('286', '797', 'HVAC_ComfortCfgSt', '3', '2', '0', '1.00000000', '0.00000000', '0.00000000', '1.00000000', '', 'CDU');
INSERT INTO `can_signal` VALUES ('287', '864', 'HVAC_ACPCommandVD', '0', '1', '0', '1.00000000', '0.00000000', '0.00000000', '1.00000000', '', 'ACP');
INSERT INTO `can_signal` VALUES ('288', '864', 'HVAC_ACPCommand', '2', '2', '0', '1.00000000', '0.00000000', '0.00000000', '3.00000000', '', 'ACP');
INSERT INTO `can_signal` VALUES ('289', '864', 'HVAC_ACPSpeedSet', '14', '7', '0', '100.00000000', '0.00000000', '0.00000000', '8600.00000000', '', 'ACP');
INSERT INTO `can_signal` VALUES ('290', '864', 'HVAC_ACPHighSidePress', '21', '6', '0', '0.50000000', '0.00000000', '0.00000000', '31.00000000', '', 'ACP');
INSERT INTO `can_signal` VALUES ('291', '864', 'HVAC_PTCPowerRatio', '31', '8', '0', '1.00000000', '0.00000000', '0.00000000', '100.00000000', '', 'PTC');
INSERT INTO `can_signal` VALUES ('292', '864', 'HVAC_Checksum', '39', '8', '0', '1.00000000', '0.00000000', '155.00000000', '255.00000000', '', 'PTC');
INSERT INTO `can_signal` VALUES ('293', '867', 'ACP_Speed', '6', '7', '0', '100.00000000', '0.00000000', '0.00000000', '8600.00000000', '', 'HVAC');
INSERT INTO `can_signal` VALUES ('294', '867', 'ACPComsumpPwr', '15', '10', '0', '10.00000000', '0.00000000', '0.00000000', '8000.00000000', '', 'HVAC');
INSERT INTO `can_signal` VALUES ('295', '867', 'ACP_Current', '16', '9', '0', '0.10000000', '0.00000000', '0.00000000', '51.00000000', '', 'HVAC');
INSERT INTO `can_signal` VALUES ('296', '867', 'ACP_MotorTemp', '39', '8', '0', '1.00000000', '-40.00000000', '-40.00000000', '140.00000000', '', 'HVAC');
INSERT INTO `can_signal` VALUES ('297', '867', 'ACP_HearBeat', '55', '4', '0', '1.00000000', '0.00000000', '0.00000000', '15.00000000', '', 'HVAC');
INSERT INTO `can_signal` VALUES ('298', '867', 'ACP_ExtState', '58', '3', '0', '1.00000000', '0.00000000', '0.00000000', '7.00000000', '', 'HVAC');
INSERT INTO `can_signal` VALUES ('299', '867', 'ACP_FailGrade', '60', '2', '0', '1.00000000', '0.00000000', '0.00000000', '3.00000000', '', 'HVAC');
INSERT INTO `can_signal` VALUES ('300', '867', 'ACP_BaseState', '63', '3', '0', '1.00000000', '0.00000000', '0.00000000', '7.00000000', '', 'HVAC');
INSERT INTO `can_signal` VALUES ('301', '868', 'PTC_ElementError', '7', '4', '0', '1.00000000', '0.00000000', '0.00000000', '15.00000000', '', 'HVAC');
INSERT INTO `can_signal` VALUES ('302', '868', 'PTC_TemperatureOver', '3', '1', '0', '1.00000000', '0.00000000', '0.00000000', '1.00000000', '', 'HVAC');
INSERT INTO `can_signal` VALUES ('303', '868', 'PTC_VoltageFault', '2', '1', '0', '1.00000000', '0.00000000', '0.00000000', '1.00000000', '', 'HVAC');
INSERT INTO `can_signal` VALUES ('304', '868', 'PTC_InternalError', '1', '2', '0', '1.00000000', '0.00000000', '0.00000000', '3.00000000', '', 'HVAC');
INSERT INTO `can_signal` VALUES ('305', '868', 'PTC_Current', '15', '8', '0', '0.20000000', '0.00000000', '0.00000000', '25.40000000', 'A', 'HVAC');
INSERT INTO `can_signal` VALUES ('306', '868', 'PTCPwrAct', '23', '10', '0', '10.00000000', '0.00000000', '0.00000000', '8000.00000000', 'w', 'HVAC');
INSERT INTO `can_signal` VALUES ('307', '868', 'PTCActst', '26', '3', '0', '1.00000000', '0.00000000', '0.00000000', '7.00000000', '', 'HVAC');
INSERT INTO `can_signal` VALUES ('308', '1020', 'EcoMode', '6', '2', '1', '1.00000000', '0.00000000', '0.00000000', '1.00000000', '', 'Vector__XXX');
INSERT INTO `can_signal` VALUES ('309', '1020', 'ShiftRequest', '3', '1', '1', '1.00000000', '0.00000000', '0.00000000', '0.00000000', '', 'Vector__XXX');
INSERT INTO `can_signal` VALUES ('310', '1020', 'Gear', '0', '3', '1', '1.00000000', '0.00000000', '0.00000000', '5.00000000', '', 'Gateway');
INSERT INTO `can_signal` VALUES ('311', '100', 'PetrolLevel', '24', '8', '1', '1.00000000', '0.00000000', '0.00000000', '255.00000000', 'l', 'Vector__XXX');
INSERT INTO `can_signal` VALUES ('312', '100', 'EngPower', '48', '16', '1', '0.01000000', '0.00000000', '0.00000000', '150.00000000', 'kW', 'Vector__XXX');
INSERT INTO `can_signal` VALUES ('315', '100', 'EngTemp', '16', '7', '1', '2.00000000', '-50.00000000', '-50.00000000', '150.00000000', 'degC', 'Vector__XXX');
INSERT INTO `can_signal` VALUES ('316', '100', 'EngSpeed', '0', '16', '1', '1.00000000', '0.00000000', '0.00000000', '8000.00000000', 'rpm', 'Vector__XXX');
INSERT INTO `can_signal` VALUES ('317', '273', 'Voltage', '48', '10', '1', '0.10000000', '0.00000000', '0.00000000', '102.30000000', 'V', 'Vector__XXX');
