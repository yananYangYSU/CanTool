/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50719
Source Host           : localhost:3306
Source Database       : cantool

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2017-10-13 15:54:24
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for candata
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
-- Table structure for canmessage
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
INSERT INTO `canmessage` VALUES ('61', 'CDU_4', '8', 'CDU');
INSERT INTO `canmessage` VALUES ('792', 'BCM_BCAN_1', '8', 'BCM');
INSERT INTO `canmessage` VALUES ('797', 'HVAC_3', '8', 'HVAC');
INSERT INTO `canmessage` VALUES ('800', 'HVAC_1', '8', 'HVAC');
INSERT INTO `canmessage` VALUES ('801', 'HVAC_2', '8', 'HVAC');
INSERT INTO `canmessage` VALUES ('837', 'BCM_ESC_2', '8', 'BCM');
INSERT INTO `canmessage` VALUES ('856', 'CDU_1', '8', 'CDU');
INSERT INTO `canmessage` VALUES ('864', 'HVAC_4', '8', 'ACP');
INSERT INTO `canmessage` VALUES ('867', 'ACP_1', '8', 'ACP');
INSERT INTO `canmessage` VALUES ('868', 'PTC_1', '8', 'PTC');
INSERT INTO `canmessage` VALUES ('915', 'BCM_VCU_2', '8', 'BCM');
INSERT INTO `canmessage` VALUES ('1056', 'BCM_NM', '8', 'BCM');
INSERT INTO `canmessage` VALUES ('1067', 'CDU_NM', '8', 'CDU');

-- ----------------------------
-- Table structure for canmessagestr
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
-- Table structure for cansignal
-- ----------------------------
DROP TABLE IF EXISTS `cansignal`;
CREATE TABLE `cansignal` (
  `messageId` int(11) unsigned NOT NULL COMMENT '外键，canMessage表的id',
  `signalName` varchar(32) NOT NULL COMMENT '信号名称 最长32字节',
  `startBit` tinyint(2) NOT NULL COMMENT '起始位 0-64',
  `bitLength` tinyint(2) NOT NULL COMMENT 'bit段长 0-64',
  `bitType` tinyint(1) NOT NULL COMMENT '类型 0或1',
  `resolution` double(4,0) NOT NULL COMMENT 'A的值',
  `offsets` double(4,0) NOT NULL COMMENT 'B的值',
  `minValue` double(4,0) NOT NULL COMMENT '物理最小值',
  `maxValues` double(4,0) NOT NULL COMMENT '物理最大值',
  `unit` varchar(12) DEFAULT NULL COMMENT '单位符号',
  `nodeNames` varchar(255) DEFAULT NULL COMMENT '要发送的节点字符串,逗号分隔',
  PRIMARY KEY (`messageId`,`signalName`),'因信号名称有重复，所以将messageId和signalName联合作为主键'
  KEY `can信息id` (`messageId`),
  CONSTRAINT `can信息id` FOREIGN KEY (`messageId`) REFERENCES `canmessage` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cansignal
-- ----------------------------
INSERT INTO `cansignal` VALUES ('61', 'CDU_HVACACCfg', '1', '2', '0', '1', '0', '0', '3', '', 'HVAC');
INSERT INTO `cansignal` VALUES ('61', 'CDU_HVACAirCirCfg', '3', '2', '0', '1', '0', '0', '3', '', 'HVAC');
INSERT INTO `cansignal` VALUES ('61', 'CDU_HVACComfortCfg', '5', '2', '0', '1', '0', '0', '3', '', 'HVAC');
INSERT INTO `cansignal` VALUES ('792', 'BCM_KeySt', '1', '2', '0', '1', '0', '1', '3', '', 'PEPS,ICM,AVM,CDU,HVAC');
INSERT INTO `cansignal` VALUES ('797', 'HVAC_ACCfgSt', '0', '1', '0', '1', '0', '0', '1', '', 'CDU');
INSERT INTO `cansignal` VALUES ('797', 'HVAC_AirCirCfgSt', '1', '1', '0', '1', '0', '0', '1', '', 'CDU');
INSERT INTO `cansignal` VALUES ('797', 'HVAC_ComfortCfgSt', '3', '2', '0', '1', '0', '0', '1', '', 'CDU');
INSERT INTO `cansignal` VALUES ('800', 'HVAC_ACmaxSt', '7', '1', '0', '1', '0', '0', '1', '', 'CDU');
INSERT INTO `cansignal` VALUES ('800', 'HVAC_ACSt', '6', '1', '0', '1', '0', '0', '1', '', 'CDU');
INSERT INTO `cansignal` VALUES ('800', 'HVAC_AirCirculationSt', '46', '2', '0', '1', '0', '0', '3', '', 'CDU');
INSERT INTO `cansignal` VALUES ('800', 'HVAC_AirCompressorSt', '2', '3', '0', '1', '0', '0', '1', '', 'CDU');
INSERT INTO `cansignal` VALUES ('800', 'HVAC_AutoSt', '30', '1', '0', '1', '0', '0', '1', '', 'CDU');
INSERT INTO `cansignal` VALUES ('800', 'HVAC_CorrectedExterTemp', '15', '8', '0', '0', '-40', '-40', '87', '??C', 'BCM,CDU');
INSERT INTO `cansignal` VALUES ('800', 'HVAC_CorrectedExterTempVD', '3', '1', '0', '1', '0', '0', '1', '', 'BCM,CDU');
INSERT INTO `cansignal` VALUES ('800', 'HVAC_DriverTempSelect', '53', '5', '0', '0', '18', '18', '32', '??C', 'CDU');
INSERT INTO `cansignal` VALUES ('800', 'HVAC_DualSt', '29', '1', '0', '1', '0', '0', '1', '', 'CDU');
INSERT INTO `cansignal` VALUES ('800', 'HVAC_EngIdleStopProhibitReq', '5', '1', '0', '1', '0', '0', '1', '', 'CDU');
INSERT INTO `cansignal` VALUES ('800', 'HVAC_IonMode', '55', '2', '0', '1', '0', '0', '3', '', 'CDU');
INSERT INTO `cansignal` VALUES ('800', 'HVAC_PopUpDisplayReq', '47', '1', '0', '1', '0', '0', '1', '', 'CDU');
INSERT INTO `cansignal` VALUES ('800', 'HVAC_PsnTempSelect', '48', '5', '0', '0', '18', '18', '32', '', 'CDU');
INSERT INTO `cansignal` VALUES ('800', 'HVAC_RawExterTemp', '23', '8', '0', '0', '-40', '-40', '87', '??C', 'CDU');
INSERT INTO `cansignal` VALUES ('800', 'HVAC_RawExterTempVD', '4', '1', '0', '1', '0', '0', '1', '', 'CDU');
INSERT INTO `cansignal` VALUES ('800', 'HVAC_SpdFanReq', '36', '2', '0', '1', '0', '0', '1', '', 'CDU');
INSERT INTO `cansignal` VALUES ('800', 'HVAC_TelematicsSt', '42', '3', '0', '1', '0', '0', '7', '', 'CDU');
INSERT INTO `cansignal` VALUES ('800', 'HVAC_TempSelect', '28', '5', '0', '0', '18', '18', '32', '??C', 'CDU');
INSERT INTO `cansignal` VALUES ('800', 'HVAC_Type', '31', '1', '0', '1', '0', '0', '1', '', 'CDU');
INSERT INTO `cansignal` VALUES ('800', 'HVAC_WindExitMode', '34', '3', '0', '1', '0', '0', '7', '', 'CDU');
INSERT INTO `cansignal` VALUES ('800', 'HVAC_WindExitSpd', '59', '4', '0', '1', '0', '0', '15', '', 'CDU');
INSERT INTO `cansignal` VALUES ('801', 'HVAC_CompressorComsumpPwr', '17', '10', '0', '10', '0', '0', '8000', 'w', 'BCM');
INSERT INTO `cansignal` VALUES ('801', 'HVAC_CorrectedCabinTemp', '15', '8', '0', '0', '-40', '-40', '87', '??C', 'CDU');
INSERT INTO `cansignal` VALUES ('801', 'HVAC_CorrectedCabinTempVD', '18', '1', '0', '1', '0', '0', '1', '', 'CDU');
INSERT INTO `cansignal` VALUES ('801', 'HVAC_PTCPwrAct', '33', '10', '0', '10', '0', '0', '8000', 'w', 'BCM');
INSERT INTO `cansignal` VALUES ('801', 'HVAC_RawCabinTemp', '7', '8', '0', '0', '-40', '-40', '87', '??C', 'CDU');
INSERT INTO `cansignal` VALUES ('801', 'HVAC_RawCabinTempVD', '19', '1', '0', '1', '0', '0', '1', '', 'CDU');
INSERT INTO `cansignal` VALUES ('801', 'HVAC_stPTCAct', '55', '3', '0', '1', '0', '0', '1', '', 'BCM');
INSERT INTO `cansignal` VALUES ('837', 'ESC_VehSpd', '36', '13', '0', '0', '0', '0', '240', '', 'BCM,PEPS,ICM,AVM,CDU');
INSERT INTO `cansignal` VALUES ('837', 'ESC_VehSpdVD', '37', '1', '0', '1', '0', '0', '1', '', 'BCM,PEPS,ICM,AVM,CDU');
INSERT INTO `cansignal` VALUES ('856', 'CDU_ControlSt', '55', '1', '0', '1', '0', '0', '1', '', 'HVAC');
INSERT INTO `cansignal` VALUES ('856', 'CDU_HVACACButtonSt', '20', '1', '0', '1', '0', '0', '1', '', 'HVAC');
INSERT INTO `cansignal` VALUES ('856', 'CDU_HVACACButtonStVD', '21', '1', '0', '1', '0', '0', '1', '', 'HVAC');
INSERT INTO `cansignal` VALUES ('856', 'CDU_HVACACMaxButtonSt', '22', '1', '0', '1', '0', '0', '1', '', 'HVAC');
INSERT INTO `cansignal` VALUES ('856', 'CDU_HVACACMaxButtonStVD', '23', '1', '0', '1', '0', '0', '1', '', 'HVAC');
INSERT INTO `cansignal` VALUES ('856', 'CDU_HVACAutoModeButtonSt', '2', '1', '0', '1', '0', '0', '1', '', 'HVAC');
INSERT INTO `cansignal` VALUES ('856', 'CDU_HVACAutoModeButtonStVD', '3', '1', '0', '1', '0', '0', '1', '', 'HVAC');
INSERT INTO `cansignal` VALUES ('856', 'CDU_HVACCirculationButtonSt', '18', '1', '0', '1', '0', '0', '1', '', 'HVAC');
INSERT INTO `cansignal` VALUES ('856', 'CDU_HVACCirculationButtonStVD', '19', '1', '0', '1', '0', '0', '1', '', 'HVAC');
INSERT INTO `cansignal` VALUES ('856', 'CDU_HVACCtrlModeSt', '54', '3', '0', '1', '0', '0', '7', '', 'HVAC');
INSERT INTO `cansignal` VALUES ('856', 'CDU_HVACDualButtonSt', '10', '1', '0', '1', '0', '0', '1', '', 'HVAC');
INSERT INTO `cansignal` VALUES ('856', 'CDU_HVACDualButtonStVD', '11', '1', '0', '1', '0', '0', '1', '', 'HVAC');
INSERT INTO `cansignal` VALUES ('856', 'CDU_HVACFDefrostButtonSt', '6', '1', '0', '1', '0', '0', '1', '', 'HVAC');
INSERT INTO `cansignal` VALUES ('856', 'CDU_HVACFDefrostButtonStVD', '7', '1', '0', '1', '0', '0', '1', '', 'HVAC');
INSERT INTO `cansignal` VALUES ('856', 'CDU_HVACIonButtonSt', '12', '1', '0', '1', '0', '0', '1', '', 'HVAC');
INSERT INTO `cansignal` VALUES ('856', 'CDU_HVACIonButtonStVD', '13', '1', '0', '1', '0', '0', '1', '', 'HVAC');
INSERT INTO `cansignal` VALUES ('856', 'CDU_HVACModeButtonSt', '26', '3', '0', '1', '0', '0', '7', '', 'HVAC');
INSERT INTO `cansignal` VALUES ('856', 'CDU_HVACOffButtonSt', '0', '1', '0', '1', '0', '0', '1', '', 'HVAC');
INSERT INTO `cansignal` VALUES ('856', 'CDU_HVACOffButtonStVD', '1', '1', '0', '1', '0', '0', '1', '', 'HVAC');
INSERT INTO `cansignal` VALUES ('856', 'CDU_HVAC_DriverTempSelect', '36', '5', '0', '0', '18', '18', '32', '??C', ' Vector__XXX');
INSERT INTO `cansignal` VALUES ('856', 'HVAC_PsnTempSelect', '44', '5', '0', '0', '18', '18', '32', '', ' Vector__XXX');
INSERT INTO `cansignal` VALUES ('856', 'HVAC_WindExitSpd', '30', '4', '0', '1', '0', '0', '15', '', ' Vector__XXX');
INSERT INTO `cansignal` VALUES ('864', 'HVAC_ACPCommand', '2', '2', '0', '1', '0', '0', '3', '', 'ACP');
INSERT INTO `cansignal` VALUES ('864', 'HVAC_ACPCommandVD', '0', '1', '0', '1', '0', '0', '1', '', 'ACP');
INSERT INTO `cansignal` VALUES ('864', 'HVAC_ACPHighSidePress', '21', '6', '0', '0', '0', '0', '31', '', 'ACP');
INSERT INTO `cansignal` VALUES ('864', 'HVAC_ACPSpeedSet', '14', '7', '0', '100', '0', '0', '8600', '', 'ACP');
INSERT INTO `cansignal` VALUES ('864', 'HVAC_Checksum', '39', '8', '0', '1', '0', '155', '255', '', 'PTC');
INSERT INTO `cansignal` VALUES ('864', 'HVAC_PTCPowerRatio', '31', '8', '0', '1', '0', '0', '100', '', 'PTC');
INSERT INTO `cansignal` VALUES ('867', 'ACPComsumpPwr', '15', '10', '0', '10', '0', '0', '8000', '', 'HVAC');
INSERT INTO `cansignal` VALUES ('867', 'ACP_BaseState', '63', '3', '0', '1', '0', '0', '7', '', 'HVAC');
INSERT INTO `cansignal` VALUES ('867', 'ACP_Current', '16', '9', '0', '0', '0', '0', '51', '', 'HVAC');
INSERT INTO `cansignal` VALUES ('867', 'ACP_ExtState', '58', '3', '0', '1', '0', '0', '7', '', 'HVAC');
INSERT INTO `cansignal` VALUES ('867', 'ACP_FailGrade', '60', '2', '0', '1', '0', '0', '3', '', 'HVAC');
INSERT INTO `cansignal` VALUES ('867', 'ACP_HearBeat', '55', '4', '0', '1', '0', '0', '15', '', 'HVAC');
INSERT INTO `cansignal` VALUES ('867', 'ACP_MotorTemp', '39', '8', '0', '1', '-40', '-40', '140', '', 'HVAC');
INSERT INTO `cansignal` VALUES ('867', 'ACP_Speed', '6', '7', '0', '100', '0', '0', '8600', '', 'HVAC');
INSERT INTO `cansignal` VALUES ('868', 'PTCActst', '26', '3', '0', '1', '0', '0', '7', '', 'HVAC');
INSERT INTO `cansignal` VALUES ('868', 'PTCPwrAct', '23', '10', '0', '10', '0', '0', '8000', 'w', 'HVAC');
INSERT INTO `cansignal` VALUES ('868', 'PTC_Current', '15', '8', '0', '0', '0', '0', '25', 'A', 'HVAC');
INSERT INTO `cansignal` VALUES ('868', 'PTC_ElementError', '7', '4', '0', '1', '0', '0', '15', '', 'HVAC');
INSERT INTO `cansignal` VALUES ('868', 'PTC_InternalError', '1', '2', '0', '1', '0', '0', '3', '', 'HVAC');
INSERT INTO `cansignal` VALUES ('868', 'PTC_TemperatureOver', '3', '1', '0', '1', '0', '0', '1', '', 'HVAC');
INSERT INTO `cansignal` VALUES ('868', 'PTC_VoltageFault', '2', '1', '0', '1', '0', '0', '1', '', 'HVAC');
INSERT INTO `cansignal` VALUES ('915', 'VCU_AirCompressorReq', '36', '1', '0', '1', '0', '0', '1', '', 'HVAC');
INSERT INTO `cansignal` VALUES ('915', 'VCU_AirCompressorReqVD', '37', '1', '0', '1', '0', '0', '1', '', 'HVAC');
INSERT INTO `cansignal` VALUES ('915', 'VCU_CompressorPwrLimit', '21', '6', '0', '100', '0', '0', '6000', 'w', 'HVAC');
INSERT INTO `cansignal` VALUES ('915', 'VCU_CompressorPwrLimitAct', '32', '1', '0', '1', '0', '0', '1', '', 'HVAC');
INSERT INTO `cansignal` VALUES ('915', 'VCU_PTCPwrLimit', '29', '6', '0', '100', '0', '0', '6000', 'w', 'HVAC');
INSERT INTO `cansignal` VALUES ('915', 'VCU_PTCrPwrLimitAct', '33', '1', '0', '1', '0', '0', '1', '', 'HVAC');
INSERT INTO `cansignal` VALUES ('1056', 'BCM_NMAlive', '8', '1', '0', '1', '0', '0', '1', '', 'BCM,PEPS,ICM,CDU');
INSERT INTO `cansignal` VALUES ('1056', 'BCM_NMDataField', '31', '40', '0', '1', '0', '0', '1', '', 'BCM,PEPS,ICM,CDU');
INSERT INTO `cansignal` VALUES ('1056', 'BCM_NMDestAddress', '7', '8', '0', '1', '0', '0', '255', '', 'BCM,PEPS,ICM,CDU');
INSERT INTO `cansignal` VALUES ('1056', 'BCM_NMLimpHome', '10', '1', '0', '1', '0', '0', '1', '', 'BCM,PEPS,ICM,CDU');
INSERT INTO `cansignal` VALUES ('1056', 'BCM_NMRing', '9', '1', '0', '1', '0', '0', '1', '', 'BCM,PEPS,ICM,CDU');
INSERT INTO `cansignal` VALUES ('1056', 'BCM_NMSleepAck', '13', '1', '0', '1', '0', '0', '1', '', 'BCM,PEPS,ICM,CDU');
INSERT INTO `cansignal` VALUES ('1056', 'BCM_NMSleepInd', '12', '1', '0', '1', '0', '0', '1', '', 'BCM,PEPS,ICM,CDU');
INSERT INTO `cansignal` VALUES ('1056', 'BCM_NMWakeupOrignin', '23', '8', '0', '1', '0', '0', '255', '', 'BCM,PEPS,ICM,CDU');
INSERT INTO `cansignal` VALUES ('1067', 'CDU_NMAlive', '8', '1', '0', '1', '0', '0', '1', '', 'BCM,PEPS,ICM,CDU');
INSERT INTO `cansignal` VALUES ('1067', 'CDU_NMDataField', '31', '40', '0', '1', '0', '0', '1', '', 'BCM,PEPS,ICM,CDU');
INSERT INTO `cansignal` VALUES ('1067', 'CDU_NMDestAddress', '7', '8', '0', '1', '0', '0', '255', '', 'BCM,PEPS,ICM,CDU');
INSERT INTO `cansignal` VALUES ('1067', 'CDU_NMLimpHome', '10', '1', '0', '1', '0', '0', '1', '', 'BCM,PEPS,ICM,CDU');
INSERT INTO `cansignal` VALUES ('1067', 'CDU_NMRing', '9', '1', '0', '1', '0', '0', '1', '', 'BCM,PEPS,ICM,CDU');
INSERT INTO `cansignal` VALUES ('1067', 'CDU_NMSleepAck', '13', '1', '0', '1', '0', '0', '1', '', 'BCM,PEPS,ICM,CDU');
INSERT INTO `cansignal` VALUES ('1067', 'CDU_NMSleepInd', '12', '1', '0', '1', '0', '0', '1', '', 'BCM,PEPS,ICM,CDU');
INSERT INTO `cansignal` VALUES ('1067', 'CDU_NMWakeupOrignin', '23', '8', '0', '1', '0', '0', '255', '', 'BCM,PEPS,ICM,CDU');
