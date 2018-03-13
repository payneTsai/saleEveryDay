/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50721
 Source Host           : localhost:3306
 Source Schema         : crm

 Target Server Type    : MySQL
 Target Server Version : 50721
 File Encoding         : 65001

 Date: 13/03/2018 17:49:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for QRTZ_BLOB_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;
CREATE TABLE `QRTZ_BLOB_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for QRTZ_CALENDARS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CALENDARS`;
CREATE TABLE `QRTZ_CALENDARS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for QRTZ_CRON_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;
CREATE TABLE `QRTZ_CRON_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_CRON_TRIGGERS
-- ----------------------------
BEGIN;
INSERT INTO `QRTZ_CRON_TRIGGERS` VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', '0 0/30 * * * ?', 'Asia/Macau');
INSERT INTO `QRTZ_CRON_TRIGGERS` VALUES ('RenrenScheduler', 'TASK_2', 'DEFAULT', '0 0/30 * * * ?', 'Asia/Macau');
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_FIRED_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;
CREATE TABLE `QRTZ_FIRED_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`),
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for QRTZ_JOB_DETAILS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;
CREATE TABLE `QRTZ_JOB_DETAILS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_JOB_DETAILS
-- ----------------------------
BEGIN;
INSERT INTO `QRTZ_JOB_DETAILS` VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', NULL, 'io.renren.modules.job.utils.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597372002E696F2E72656E72656E2E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200084C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000158BAF593307874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000000000000000017400047465737474000672656E72656E74000FE69C89E58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000007800);
INSERT INTO `QRTZ_JOB_DETAILS` VALUES ('RenrenScheduler', 'TASK_2', 'DEFAULT', NULL, 'io.renren.modules.job.utils.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597372002E696F2E72656E72656E2E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200084C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000158C377C4607874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000274000574657374327074000FE697A0E58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000017800);
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_LOCKS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_LOCKS`;
CREATE TABLE `QRTZ_LOCKS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_LOCKS
-- ----------------------------
BEGIN;
INSERT INTO `QRTZ_LOCKS` VALUES ('RenrenScheduler', 'STATE_ACCESS');
INSERT INTO `QRTZ_LOCKS` VALUES ('RenrenScheduler', 'TRIGGER_ACCESS');
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;
CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for QRTZ_SCHEDULER_STATE
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;
CREATE TABLE `QRTZ_SCHEDULER_STATE` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_SCHEDULER_STATE
-- ----------------------------
BEGIN;
INSERT INTO `QRTZ_SCHEDULER_STATE` VALUES ('RenrenScheduler', 'ipeakMac02deiMac.local1520933647884', 1520934434850, 15000);
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_SIMPLE_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPLE_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for QRTZ_SIMPROP_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPROP_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for QRTZ_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;
CREATE TABLE `QRTZ_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`),
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `QRTZ_JOB_DETAILS` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_TRIGGERS
-- ----------------------------
BEGIN;
INSERT INTO `QRTZ_TRIGGERS` VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', 'TASK_1', 'DEFAULT', NULL, 1520935200000, -1, 5, 'WAITING', 'CRON', 1515503187000, 0, NULL, 2, 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597400B67B226A6F624964223A312C226265616E4E616D65223A22746573745461736B222C226D6574686F644E616D65223A2274657374222C22706172616D73223A2272656E72656E222C2263726F6E45787072657373696F6E223A223020302F3330202A202A202A203F222C22737461747573223A302C2272656D61726B223A22E69C89E58F82E695B0E6B58BE8AF95222C2263726561746554696D65223A2244656320312C20323031362031313A31363A343620504D227D7800);
INSERT INTO `QRTZ_TRIGGERS` VALUES ('RenrenScheduler', 'TASK_2', 'DEFAULT', 'TASK_2', 'DEFAULT', NULL, 1515504600000, -1, 5, 'PAUSED', 'CRON', 1515503187000, 0, NULL, 2, 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597400A47B226A6F624964223A322C226265616E4E616D65223A22746573745461736B222C226D6574686F644E616D65223A227465737432222C2263726F6E45787072657373696F6E223A223020302F3330202A202A202A203F222C22737461747573223A312C2272656D61726B223A22E697A0E58F82E695B0E6B58BE8AF95222C2263726561746554696D65223A2244656320332C203230313620323A35353A353620504D227D7800);
COMMIT;

-- ----------------------------
-- Table structure for schedule_job
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job`;
CREATE TABLE `schedule_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `method_name` varchar(100) DEFAULT NULL COMMENT '方法名',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `cron_expression` varchar(100) DEFAULT NULL COMMENT 'cron表达式',
  `status` tinyint(4) DEFAULT NULL COMMENT '任务状态  0：正常  1：暂停',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='定时任务';

-- ----------------------------
-- Records of schedule_job
-- ----------------------------
BEGIN;
INSERT INTO `schedule_job` VALUES (1, 'testTask', 'test', 'renren', '0 0/30 * * * ?', 0, '有参数测试', '2016-12-01 23:16:46');
INSERT INTO `schedule_job` VALUES (2, 'testTask', 'test2', NULL, '0 0/30 * * * ?', 1, '无参数测试', '2016-12-03 14:55:56');
COMMIT;

-- ----------------------------
-- Table structure for schedule_job_log
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job_log`;
CREATE TABLE `schedule_job_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志id',
  `job_id` bigint(20) NOT NULL COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `method_name` varchar(100) DEFAULT NULL COMMENT '方法名',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `status` tinyint(4) NOT NULL COMMENT '任务状态    0：成功    1：失败',
  `error` varchar(2000) DEFAULT NULL COMMENT '失败信息',
  `times` int(11) NOT NULL COMMENT '耗时(单位：毫秒)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`log_id`),
  KEY `job_id` (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='定时任务日志';

-- ----------------------------
-- Records of schedule_job_log
-- ----------------------------
BEGIN;
INSERT INTO `schedule_job_log` VALUES (1, 1, 'testTask', 'test', 'renren', 0, NULL, 1124, '2018-01-10 02:30:00');
INSERT INTO `schedule_job_log` VALUES (2, 1, 'testTask', 'test', 'renren', 0, NULL, 1051, '2018-01-10 03:00:00');
INSERT INTO `schedule_job_log` VALUES (3, 1, 'testTask', 'test', 'renren', 0, NULL, 1064, '2018-01-10 03:30:00');
INSERT INTO `schedule_job_log` VALUES (4, 1, 'testTask', 'test', 'renren', 0, NULL, 1066, '2018-01-10 04:00:00');
INSERT INTO `schedule_job_log` VALUES (5, 1, 'testTask', 'test', 'renren', 0, NULL, 1076, '2018-01-10 04:30:00');
INSERT INTO `schedule_job_log` VALUES (6, 1, 'testTask', 'test', 'renren', 0, NULL, 1050, '2018-01-10 05:00:00');
INSERT INTO `schedule_job_log` VALUES (7, 1, 'testTask', 'test', 'renren', 0, NULL, 1078, '2018-01-10 05:30:00');
INSERT INTO `schedule_job_log` VALUES (8, 1, 'testTask', 'test', 'renren', 0, NULL, 1040, '2018-01-10 06:00:00');
INSERT INTO `schedule_job_log` VALUES (9, 1, 'testTask', 'test', 'renren', 0, NULL, 1045, '2018-01-10 06:30:00');
INSERT INTO `schedule_job_log` VALUES (10, 1, 'testTask', 'test', 'renren', 0, NULL, 1045, '2018-01-10 07:00:00');
INSERT INTO `schedule_job_log` VALUES (11, 1, 'testTask', 'test', 'renren', 0, NULL, 1043, '2018-01-10 07:30:00');
INSERT INTO `schedule_job_log` VALUES (12, 1, 'testTask', 'test', 'renren', 0, NULL, 1034, '2018-01-10 08:00:00');
INSERT INTO `schedule_job_log` VALUES (13, 1, 'testTask', 'test', 'renren', 0, NULL, 1023, '2018-01-10 08:30:00');
INSERT INTO `schedule_job_log` VALUES (14, 1, 'testTask', 'test', 'renren', 0, NULL, 1036, '2018-01-10 09:00:00');
INSERT INTO `schedule_job_log` VALUES (15, 1, 'testTask', 'test', 'renren', 0, NULL, 1047, '2018-01-10 10:30:00');
INSERT INTO `schedule_job_log` VALUES (16, 1, 'testTask', 'test', 'renren', 0, NULL, 1024, '2018-03-12 13:30:00');
INSERT INTO `schedule_job_log` VALUES (17, 1, 'testTask', 'test', 'renren', 0, NULL, 1027, '2018-03-12 17:00:00');
INSERT INTO `schedule_job_log` VALUES (18, 1, 'testTask', 'test', 'renren', 0, NULL, 1023, '2018-03-12 17:30:00');
INSERT INTO `schedule_job_log` VALUES (19, 1, 'testTask', 'test', 'renren', 0, NULL, 1024, '2018-03-12 18:30:00');
INSERT INTO `schedule_job_log` VALUES (20, 1, 'testTask', 'test', 'renren', 0, NULL, 1021, '2018-03-12 19:00:00');
INSERT INTO `schedule_job_log` VALUES (21, 1, 'testTask', 'test', 'renren', 0, NULL, 1020, '2018-03-12 20:00:00');
INSERT INTO `schedule_job_log` VALUES (22, 1, 'testTask', 'test', 'renren', 0, NULL, 1009, '2018-03-12 20:30:00');
INSERT INTO `schedule_job_log` VALUES (23, 1, 'testTask', 'test', 'renren', 0, NULL, 1022, '2018-03-12 21:00:00');
INSERT INTO `schedule_job_log` VALUES (24, 1, 'testTask', 'test', 'renren', 0, NULL, 1029, '2018-03-13 09:00:00');
INSERT INTO `schedule_job_log` VALUES (25, 1, 'testTask', 'test', 'renren', 0, NULL, 1026, '2018-03-13 09:30:00');
INSERT INTO `schedule_job_log` VALUES (26, 1, 'testTask', 'test', 'renren', 0, NULL, 1024, '2018-03-13 10:00:00');
INSERT INTO `schedule_job_log` VALUES (27, 1, 'testTask', 'test', 'renren', 0, NULL, 1020, '2018-03-13 10:30:00');
INSERT INTO `schedule_job_log` VALUES (28, 1, 'testTask', 'test', 'renren', 0, NULL, 1024, '2018-03-13 11:00:00');
INSERT INTO `schedule_job_log` VALUES (29, 1, 'testTask', 'test', 'renren', 0, NULL, 1022, '2018-03-13 14:30:00');
INSERT INTO `schedule_job_log` VALUES (30, 1, 'testTask', 'test', 'renren', 0, NULL, 1027, '2018-03-13 15:00:00');
INSERT INTO `schedule_job_log` VALUES (31, 1, 'testTask', 'test', 'renren', 0, NULL, 1026, '2018-03-13 15:30:00');
INSERT INTO `schedule_job_log` VALUES (32, 1, 'testTask', 'test', 'renren', 0, NULL, 1028, '2018-03-13 16:00:00');
INSERT INTO `schedule_job_log` VALUES (33, 1, 'testTask', 'test', 'renren', 0, NULL, 1021, '2018-03-13 16:30:00');
INSERT INTO `schedule_job_log` VALUES (34, 1, 'testTask', 'test', 'renren', 0, NULL, 1024, '2018-03-13 17:30:00');
COMMIT;

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `key` varchar(50) DEFAULT NULL COMMENT 'key',
  `value` varchar(2000) DEFAULT NULL COMMENT 'value',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态   0：隐藏   1：显示',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='系统配置信息表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
BEGIN;
INSERT INTO `sys_config` VALUES (1, 'CLOUD_STORAGE_CONFIG_KEY', '{\"aliyunAccessKeyId\":\"\",\"aliyunAccessKeySecret\":\"\",\"aliyunBucketName\":\"\",\"aliyunDomain\":\"\",\"aliyunEndPoint\":\"\",\"aliyunPrefix\":\"\",\"qcloudBucketName\":\"\",\"qcloudDomain\":\"\",\"qcloudPrefix\":\"\",\"qcloudSecretId\":\"\",\"qcloudSecretKey\":\"\",\"qiniuAccessKey\":\"NrgMfABZxWLo5B-YYSjoE8-AZ1EISdi1Z3ubLOeZ\",\"qiniuBucketName\":\"ios-app\",\"qiniuDomain\":\"http://7xqbwh.dl1.z0.glb.clouddn.com\",\"qiniuPrefix\":\"upload\",\"qiniuSecretKey\":\"uIwJHevMRWU0VLxFvgy0tAcOdGqasdtVlJkdy6vV\",\"type\":1}', 0, '云存储配置信息');
COMMIT;

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) DEFAULT NULL COMMENT '用户操作',
  `method` varchar(200) DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) DEFAULT NULL COMMENT '请求参数',
  `time` bigint(20) NOT NULL COMMENT '执行时长(毫秒)',
  `ip` varchar(64) DEFAULT NULL COMMENT 'IP地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COMMENT='系统日志';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
BEGIN;
INSERT INTO `sys_log` VALUES (1, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '{\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"CRM\",\"type\":0,\"icon\":\"fa fa-th-list\",\"orderNum\":1}', 4, '0:0:0:0:0:0:0:1', '2018-01-09 21:08:25');
INSERT INTO `sys_log` VALUES (2, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '{\"parentId\":31,\"parentName\":\"CRM\",\"name\":\"员工管理\",\"url\":\"modules/base/employee.\",\"type\":1,\"icon\":\"fa fa-tasks\",\"orderNum\":0}', 7, '0:0:0:0:0:0:0:1', '2018-01-09 21:10:29');
INSERT INTO `sys_log` VALUES (3, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '{\"parentId\":31,\"parentName\":\"CRM\",\"name\":\"客户管理\",\"url\":\"modules/base/customer.html\",\"type\":1,\"icon\":\"fa fa-square\",\"orderNum\":1}', 3, '0:0:0:0:0:0:0:1', '2018-01-09 21:11:33');
INSERT INTO `sys_log` VALUES (4, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":32,\"parentId\":31,\"parentName\":\"CRM\",\"name\":\"员工管理\",\"url\":\"modules/base/employee.html\",\"type\":1,\"icon\":\"fa fa-tasks\",\"orderNum\":0}', 8, '0:0:0:0:0:0:0:1', '2018-01-09 21:11:44');
INSERT INTO `sys_log` VALUES (5, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '{\"parentId\":31,\"parentName\":\"CRM\",\"name\":\"产品管理\",\"url\":\"modules/base/product.html\",\"type\":1,\"icon\":\"fa fa-life-ring\",\"orderNum\":2}', 4, '0:0:0:0:0:0:0:1', '2018-01-09 21:12:40');
INSERT INTO `sys_log` VALUES (6, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '{\"parentId\":31,\"parentName\":\"CRM\",\"name\":\"销售机会\",\"url\":\"modules/base/chance.html\",\"type\":1,\"icon\":\"fa fa-futbol-o\",\"orderNum\":3}', 10, '0:0:0:0:0:0:0:1', '2018-01-09 21:13:34');
INSERT INTO `sys_log` VALUES (7, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '{\"parentId\":31,\"parentName\":\"CRM\",\"name\":\"合同管理\",\"url\":\"modules/base/cont.html\",\"type\":1,\"icon\":\"fa fa-sign-language\",\"orderNum\":4}', 3, '0:0:0:0:0:0:0:1', '2018-01-09 21:14:21');
INSERT INTO `sys_log` VALUES (8, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '{\"parentId\":32,\"parentName\":\"员工管理\",\"name\":\"新增\",\"perms\":\"employee:save\",\"type\":2,\"orderNum\":0}', 4, '0:0:0:0:0:0:0:1', '2018-01-09 21:18:24');
INSERT INTO `sys_log` VALUES (9, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '{\"parentId\":32,\"parentName\":\"员工管理\",\"name\":\"修改\",\"perms\":\"employee:update\",\"type\":2,\"orderNum\":0}', 3, '0:0:0:0:0:0:0:1', '2018-01-09 21:19:00');
INSERT INTO `sys_log` VALUES (10, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '{\"parentId\":32,\"parentName\":\"员工管理\",\"name\":\"删除\",\"perms\":\"employee:delete\",\"type\":2,\"orderNum\":0}', 2, '0:0:0:0:0:0:0:1', '2018-01-09 21:19:18');
INSERT INTO `sys_log` VALUES (11, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '{\"parentId\":32,\"parentName\":\"员工管理\",\"name\":\"查看\",\"perms\":\"employee:info,employee:list\",\"type\":2,\"orderNum\":0}', 2, '0:0:0:0:0:0:0:1', '2018-01-09 21:20:24');
INSERT INTO `sys_log` VALUES (12, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '{\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"销售管理\",\"type\":0,\"icon\":\"fa fa-cog\",\"orderNum\":0}', 3, '0:0:0:0:0:0:0:1', '2018-03-12 17:02:19');
INSERT INTO `sys_log` VALUES (13, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":1,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"系统管理\",\"type\":0,\"icon\":\"fa fa-cog\",\"orderNum\":1}', 5, '0:0:0:0:0:0:0:1', '2018-03-12 17:02:56');
INSERT INTO `sys_log` VALUES (14, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":41,\"parentId\":61,\"parentName\":\"销售管理\",\"name\":\"市场线索表\",\"url\":\"modules/generator/clues.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":6}', 4, '0:0:0:0:0:0:0:1', '2018-03-12 17:03:23');
INSERT INTO `sys_log` VALUES (15, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":46,\"parentId\":61,\"parentName\":\"销售管理\",\"name\":\"销售类型\",\"url\":\"modules/generator/type.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":6}', 4, '0:0:0:0:0:0:0:1', '2018-03-12 17:03:34');
INSERT INTO `sys_log` VALUES (16, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":51,\"parentId\":61,\"parentName\":\"销售管理\",\"name\":\"产品表\",\"url\":\"modules/generator/product.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":6}', 3, '0:0:0:0:0:0:0:1', '2018-03-12 17:03:43');
INSERT INTO `sys_log` VALUES (17, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":56,\"parentId\":61,\"parentName\":\"销售管理\",\"name\":\"客户表\",\"url\":\"modules/generator/customer.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":6}', 4, '0:0:0:0:0:0:0:1', '2018-03-12 17:03:52');
INSERT INTO `sys_log` VALUES (18, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":41,\"parentId\":61,\"parentName\":\"销售管理\",\"name\":\"市场线索表\",\"url\":\"modules/generator/clues.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":0}', 4, '0:0:0:0:0:0:0:1', '2018-03-12 17:04:05');
INSERT INTO `sys_log` VALUES (19, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":51,\"parentId\":61,\"parentName\":\"销售管理\",\"name\":\"产品表\",\"url\":\"modules/generator/product.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":1}', 3, '0:0:0:0:0:0:0:1', '2018-03-12 17:04:20');
INSERT INTO `sys_log` VALUES (20, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":56,\"parentId\":61,\"parentName\":\"销售管理\",\"name\":\"客户表\",\"url\":\"modules/generator/customer.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":2}', 3, '0:0:0:0:0:0:0:1', '2018-03-12 17:04:29');
INSERT INTO `sys_log` VALUES (21, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":1,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"系统管理\",\"type\":0,\"icon\":\"fa fa-cog\",\"orderNum\":1}', 2, '0:0:0:0:0:0:0:1', '2018-03-12 17:05:45');
INSERT INTO `sys_log` VALUES (22, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":61,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"销售管理\",\"type\":0,\"icon\":\"fab fa-cuttlefish\",\"orderNum\":0}', 2, '0:0:0:0:0:0:0:1', '2018-03-12 17:15:19');
INSERT INTO `sys_log` VALUES (23, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":41,\"parentId\":61,\"parentName\":\"销售管理\",\"name\":\"市场线索表\",\"url\":\"modules/generator/clues.html\",\"type\":1,\"icon\":\"fab fa-cuttlefish\",\"orderNum\":0}', 4, '0:0:0:0:0:0:0:1', '2018-03-12 17:15:44');
INSERT INTO `sys_log` VALUES (24, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":61,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"销售管理\",\"type\":0,\"icon\":\"fa fa-cog\",\"orderNum\":0}', 2, '0:0:0:0:0:0:0:1', '2018-03-12 17:16:22');
INSERT INTO `sys_log` VALUES (25, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":41,\"parentId\":61,\"parentName\":\"销售管理\",\"name\":\"市场线索表\",\"url\":\"modules/generator/clues.html\",\"type\":1,\"icon\":\"fa fa-sun-o\",\"orderNum\":0}', 2, '0:0:0:0:0:0:0:1', '2018-03-12 17:18:03');
INSERT INTO `sys_log` VALUES (26, 'admin', '保存角色', 'io.renren.modules.sys.controller.SysRoleController.save()', '{\"roleId\":1,\"roleName\":\"root\",\"remark\":\"超级管理员\",\"createUserId\":1,\"menuIdList\":[61,41,42,43,44,45,51,52,53,54,55,56,57,58,59,60,46,47,48,49,50,1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,30,29,28],\"createTime\":\"Mar 12, 2018 5:21:30 PM\"}', 82, '0:0:0:0:0:0:0:1', '2018-03-12 17:21:30');
INSERT INTO `sys_log` VALUES (27, 'admin', '保存角色', 'io.renren.modules.sys.controller.SysRoleController.save()', '{\"roleId\":2,\"roleName\":\"employee\",\"remark\":\"员工\",\"createUserId\":1,\"menuIdList\":[61,41,42,43,44,45,51,52,53,54,55,56,57,58,59,60,46,47,48,49,50],\"createTime\":\"Mar 12, 2018 5:21:51 PM\"}', 9, '0:0:0:0:0:0:0:1', '2018-03-12 17:21:52');
INSERT INTO `sys_log` VALUES (28, 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '{\"userId\":1,\"username\":\"admin\",\"salt\":\"YzcmCZNvbXocrsz9dm8e\",\"email\":\"root@renren.io\",\"mobile\":\"13612345678\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1,\"createTime\":\"Nov 11, 2016 11:11:11 AM\"}', 28, '0:0:0:0:0:0:0:1', '2018-03-12 17:22:01');
INSERT INTO `sys_log` VALUES (29, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":51,\"parentId\":61,\"parentName\":\"销售管理\",\"name\":\"产品表\",\"url\":\"modules/generator/product.html\",\"type\":1,\"icon\":\"fa fa-ravelry\",\"orderNum\":1}', 9, '0:0:0:0:0:0:0:1', '2018-03-12 17:28:44');
INSERT INTO `sys_log` VALUES (30, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":46,\"parentId\":61,\"parentName\":\"销售管理\",\"name\":\"销售类型\",\"url\":\"modules/generator/type.html\",\"type\":1,\"icon\":\"fa fa-thermometer-quarter\",\"orderNum\":6}', 4, '0:0:0:0:0:0:0:1', '2018-03-12 17:29:22');
INSERT INTO `sys_log` VALUES (31, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":56,\"parentId\":61,\"parentName\":\"销售管理\",\"name\":\"客户表\",\"url\":\"modules/generator/customer.html\",\"type\":1,\"icon\":\"fa fa-address-card-o\",\"orderNum\":2}', 3, '0:0:0:0:0:0:0:1', '2018-03-12 17:29:40');
INSERT INTO `sys_log` VALUES (32, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":41,\"parentId\":61,\"parentName\":\"销售管理\",\"name\":\"市场线索表\",\"url\":\"modules/generator/clues.html\",\"type\":1,\"icon\":\"fa fa-eye\",\"orderNum\":0}', 3, '0:0:0:0:0:0:0:1', '2018-03-12 17:30:27');
INSERT INTO `sys_log` VALUES (33, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":62,\"parentId\":61,\"parentName\":\"销售管理\",\"name\":\"产品表\",\"url\":\"modules/generator/product.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":1}', 7, '0:0:0:0:0:0:0:1', '2018-03-12 17:41:17');
INSERT INTO `sys_log` VALUES (34, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":67,\"parentId\":61,\"parentName\":\"销售管理\",\"name\":\"客户表\",\"url\":\"modules/generator/customer.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":2}', 5, '0:0:0:0:0:0:0:1', '2018-03-12 17:41:26');
INSERT INTO `sys_log` VALUES (35, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":67,\"parentId\":61,\"parentName\":\"销售管理\",\"name\":\"客户表\",\"url\":\"modules/generator/customer.html\",\"type\":1,\"icon\":\"fa fa-address-card-o\",\"orderNum\":2}', 4, '0:0:0:0:0:0:0:1', '2018-03-12 17:41:45');
INSERT INTO `sys_log` VALUES (36, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":62,\"parentId\":61,\"parentName\":\"销售管理\",\"name\":\"产品表\",\"url\":\"modules/generator/product.html\",\"type\":1,\"icon\":\"fa fa-cube\",\"orderNum\":1}', 3, '0:0:0:0:0:0:0:1', '2018-03-12 17:42:03');
INSERT INTO `sys_log` VALUES (37, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '{\"parentId\":61,\"parentName\":\"销售管理\",\"name\":\"报表\",\"url\":\"modules/generator/repo.html\",\"type\":1,\"icon\":\"fa fa-bars\",\"orderNum\":5}', 6, '0:0:0:0:0:0:0:1', '2018-03-13 14:58:30');
COMMIT;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8 COMMENT='菜单管理';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` VALUES (1, 0, '系统管理', NULL, NULL, 0, 'fa fa-cog', 1);
INSERT INTO `sys_menu` VALUES (2, 1, '管理员列表', 'modules/sys/user.html', NULL, 1, 'fa fa-user', 1);
INSERT INTO `sys_menu` VALUES (3, 1, '角色管理', 'modules/sys/role.html', NULL, 1, 'fa fa-user-secret', 2);
INSERT INTO `sys_menu` VALUES (4, 1, '菜单管理', 'modules/sys/menu.html', NULL, 1, 'fa fa-th-list', 3);
INSERT INTO `sys_menu` VALUES (5, 1, 'SQL监控', 'druid/sql.html', NULL, 1, 'fa fa-bug', 4);
INSERT INTO `sys_menu` VALUES (6, 1, '定时任务', 'modules/job/schedule.html', NULL, 1, 'fa fa-tasks', 5);
INSERT INTO `sys_menu` VALUES (7, 6, '查看', NULL, 'sys:schedule:list,sys:schedule:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (8, 6, '新增', NULL, 'sys:schedule:save', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (9, 6, '修改', NULL, 'sys:schedule:update', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (10, 6, '删除', NULL, 'sys:schedule:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (11, 6, '暂停', NULL, 'sys:schedule:pause', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (12, 6, '恢复', NULL, 'sys:schedule:resume', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (13, 6, '立即执行', NULL, 'sys:schedule:run', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (14, 6, '日志列表', NULL, 'sys:schedule:log', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (15, 2, '查看', NULL, 'sys:user:list,sys:user:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (16, 2, '新增', NULL, 'sys:user:save,sys:role:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (17, 2, '修改', NULL, 'sys:user:update,sys:role:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (18, 2, '删除', NULL, 'sys:user:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (19, 3, '查看', NULL, 'sys:role:list,sys:role:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (20, 3, '新增', NULL, 'sys:role:save,sys:menu:list', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (21, 3, '修改', NULL, 'sys:role:update,sys:menu:list', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (22, 3, '删除', NULL, 'sys:role:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (23, 4, '查看', NULL, 'sys:menu:list,sys:menu:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (24, 4, '新增', NULL, 'sys:menu:save,sys:menu:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (25, 4, '修改', NULL, 'sys:menu:update,sys:menu:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (26, 4, '删除', NULL, 'sys:menu:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (27, 1, '参数管理', 'modules/sys/config.html', 'sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete', 1, 'fa fa-sun-o', 6);
INSERT INTO `sys_menu` VALUES (28, 1, '代码生成器', 'modules/gen/generator.html', 'sys:generator:list,sys:generator:code', 1, 'fa fa-rocket', 8);
INSERT INTO `sys_menu` VALUES (29, 1, '系统日志', 'modules/sys/log.html', 'sys:log:list', 1, 'fa fa-file-text-o', 7);
INSERT INTO `sys_menu` VALUES (30, 1, '文件上传', 'modules/oss/oss.html', 'sys:oss:all', 1, 'fa fa-file-image-o', 6);
INSERT INTO `sys_menu` VALUES (41, 61, '市场线索表', 'modules/generator/clues.html', NULL, 1, 'fa fa-eye', 0);
INSERT INTO `sys_menu` VALUES (42, 41, '查看', NULL, 'clues:list,clues:info', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (43, 41, '新增', NULL, 'clues:save', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (44, 41, '修改', NULL, 'clues:update', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (45, 41, '删除', NULL, 'clues:delete', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (46, 61, '销售类型', 'modules/generator/type.html', NULL, 1, 'fa fa-thermometer-quarter', 6);
INSERT INTO `sys_menu` VALUES (47, 46, '查看', NULL, 'type:list,type:info', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (48, 46, '新增', NULL, 'type:save', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (49, 46, '修改', NULL, 'type:update', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (50, 46, '删除', NULL, 'type:delete', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (61, 0, '销售管理', NULL, NULL, 0, 'fa fa-cog', 0);
INSERT INTO `sys_menu` VALUES (62, 61, '产品表', 'modules/generator/product.html', NULL, 1, 'fa fa-cube', 1);
INSERT INTO `sys_menu` VALUES (63, 62, '查看', NULL, 'product:list,product:info', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (64, 62, '新增', NULL, 'product:save', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (65, 62, '修改', NULL, 'product:update', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (66, 62, '删除', NULL, 'product:delete', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (67, 61, '客户表', 'modules/generator/customer.html', NULL, 1, 'fa fa-address-card-o', 2);
INSERT INTO `sys_menu` VALUES (68, 67, '查看', NULL, 'customer:list,customer:info', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (69, 67, '新增', NULL, 'customer:save', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (70, 67, '修改', NULL, 'customer:update', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (71, 67, '删除', NULL, 'customer:delete', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (72, 61, '报表', 'modules/generator/repo.html', NULL, 1, 'fa fa-bars', 5);
COMMIT;

-- ----------------------------
-- Table structure for sys_oss
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss`;
CREATE TABLE `sys_oss` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(200) DEFAULT NULL COMMENT 'URL地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文件上传';

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` VALUES (1, 'root', '超级管理员', 1, '2018-03-12 17:21:30');
INSERT INTO `sys_role` VALUES (2, 'employee', '员工', 1, '2018-03-12 17:21:52');
COMMIT;

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8 COMMENT='角色与菜单对应关系';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_menu` VALUES (1, 1, 61);
INSERT INTO `sys_role_menu` VALUES (2, 1, 41);
INSERT INTO `sys_role_menu` VALUES (3, 1, 42);
INSERT INTO `sys_role_menu` VALUES (4, 1, 43);
INSERT INTO `sys_role_menu` VALUES (5, 1, 44);
INSERT INTO `sys_role_menu` VALUES (6, 1, 45);
INSERT INTO `sys_role_menu` VALUES (7, 1, 51);
INSERT INTO `sys_role_menu` VALUES (8, 1, 52);
INSERT INTO `sys_role_menu` VALUES (9, 1, 53);
INSERT INTO `sys_role_menu` VALUES (10, 1, 54);
INSERT INTO `sys_role_menu` VALUES (11, 1, 55);
INSERT INTO `sys_role_menu` VALUES (12, 1, 56);
INSERT INTO `sys_role_menu` VALUES (13, 1, 57);
INSERT INTO `sys_role_menu` VALUES (14, 1, 58);
INSERT INTO `sys_role_menu` VALUES (15, 1, 59);
INSERT INTO `sys_role_menu` VALUES (16, 1, 60);
INSERT INTO `sys_role_menu` VALUES (17, 1, 46);
INSERT INTO `sys_role_menu` VALUES (18, 1, 47);
INSERT INTO `sys_role_menu` VALUES (19, 1, 48);
INSERT INTO `sys_role_menu` VALUES (20, 1, 49);
INSERT INTO `sys_role_menu` VALUES (21, 1, 50);
INSERT INTO `sys_role_menu` VALUES (22, 1, 1);
INSERT INTO `sys_role_menu` VALUES (23, 1, 2);
INSERT INTO `sys_role_menu` VALUES (24, 1, 15);
INSERT INTO `sys_role_menu` VALUES (25, 1, 16);
INSERT INTO `sys_role_menu` VALUES (26, 1, 17);
INSERT INTO `sys_role_menu` VALUES (27, 1, 18);
INSERT INTO `sys_role_menu` VALUES (28, 1, 3);
INSERT INTO `sys_role_menu` VALUES (29, 1, 19);
INSERT INTO `sys_role_menu` VALUES (30, 1, 20);
INSERT INTO `sys_role_menu` VALUES (31, 1, 21);
INSERT INTO `sys_role_menu` VALUES (32, 1, 22);
INSERT INTO `sys_role_menu` VALUES (33, 1, 4);
INSERT INTO `sys_role_menu` VALUES (34, 1, 23);
INSERT INTO `sys_role_menu` VALUES (35, 1, 24);
INSERT INTO `sys_role_menu` VALUES (36, 1, 25);
INSERT INTO `sys_role_menu` VALUES (37, 1, 26);
INSERT INTO `sys_role_menu` VALUES (38, 1, 5);
INSERT INTO `sys_role_menu` VALUES (39, 1, 6);
INSERT INTO `sys_role_menu` VALUES (40, 1, 7);
INSERT INTO `sys_role_menu` VALUES (41, 1, 8);
INSERT INTO `sys_role_menu` VALUES (42, 1, 9);
INSERT INTO `sys_role_menu` VALUES (43, 1, 10);
INSERT INTO `sys_role_menu` VALUES (44, 1, 11);
INSERT INTO `sys_role_menu` VALUES (45, 1, 12);
INSERT INTO `sys_role_menu` VALUES (46, 1, 13);
INSERT INTO `sys_role_menu` VALUES (47, 1, 14);
INSERT INTO `sys_role_menu` VALUES (48, 1, 27);
INSERT INTO `sys_role_menu` VALUES (49, 1, 30);
INSERT INTO `sys_role_menu` VALUES (50, 1, 29);
INSERT INTO `sys_role_menu` VALUES (51, 1, 28);
INSERT INTO `sys_role_menu` VALUES (52, 2, 61);
INSERT INTO `sys_role_menu` VALUES (53, 2, 41);
INSERT INTO `sys_role_menu` VALUES (54, 2, 42);
INSERT INTO `sys_role_menu` VALUES (55, 2, 43);
INSERT INTO `sys_role_menu` VALUES (56, 2, 44);
INSERT INTO `sys_role_menu` VALUES (57, 2, 45);
INSERT INTO `sys_role_menu` VALUES (58, 2, 51);
INSERT INTO `sys_role_menu` VALUES (59, 2, 52);
INSERT INTO `sys_role_menu` VALUES (60, 2, 53);
INSERT INTO `sys_role_menu` VALUES (61, 2, 54);
INSERT INTO `sys_role_menu` VALUES (62, 2, 55);
INSERT INTO `sys_role_menu` VALUES (63, 2, 56);
INSERT INTO `sys_role_menu` VALUES (64, 2, 57);
INSERT INTO `sys_role_menu` VALUES (65, 2, 58);
INSERT INTO `sys_role_menu` VALUES (66, 2, 59);
INSERT INTO `sys_role_menu` VALUES (67, 2, 60);
INSERT INTO `sys_role_menu` VALUES (68, 2, 46);
INSERT INTO `sys_role_menu` VALUES (69, 2, 47);
INSERT INTO `sys_role_menu` VALUES (70, 2, 48);
INSERT INTO `sys_role_menu` VALUES (71, 2, 49);
INSERT INTO `sys_role_menu` VALUES (72, 2, 50);
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `salt` varchar(20) DEFAULT NULL COMMENT '盐',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态  0：禁用   1：正常',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='系统用户';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` VALUES (1, 'admin', 'e1153123d7d180ceeb820d577ff119876678732a68eef4e6ffc0b1f06a01f91b', 'YzcmCZNvbXocrsz9dm8e', 'root@renren.io', '13612345678', 1, 1, '2016-11-11 11:11:11');
COMMIT;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户与角色对应关系';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_role` VALUES (1, 1, 1);
COMMIT;

-- ----------------------------
-- Table structure for sys_user_token
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_token`;
CREATE TABLE `sys_user_token` (
  `user_id` bigint(20) NOT NULL,
  `token` varchar(100) NOT NULL COMMENT 'token',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统用户Token';

-- ----------------------------
-- Table structure for tb_clues
-- ----------------------------
DROP TABLE IF EXISTS `tb_clues`;
CREATE TABLE `tb_clues` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '市场销售表',
  `product_id` int(11) NOT NULL COMMENT '产品表Id',
  `customer_id` int(11) NOT NULL COMMENT '客户表id',
  `type_id` int(11) NOT NULL COMMENT '销售类型id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='市场线索表';

-- ----------------------------
-- Records of tb_clues
-- ----------------------------
BEGIN;
INSERT INTO `tb_clues` VALUES (1, 1, 1, 1);
INSERT INTO `tb_clues` VALUES (2, 1, 2, 2);
INSERT INTO `tb_clues` VALUES (3, 2, 1, 2);
INSERT INTO `tb_clues` VALUES (4, 3, 1, 3);
COMMIT;

-- ----------------------------
-- Table structure for tb_customer
-- ----------------------------
DROP TABLE IF EXISTS `tb_customer`;
CREATE TABLE `tb_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '客户id',
  `name` varchar(20) NOT NULL COMMENT '客户名称',
  `mobile` varchar(20) DEFAULT NULL COMMENT '客户手机号',
  `address` varchar(300) DEFAULT NULL COMMENT '客户所在地址',
  `business` varchar(40) DEFAULT NULL COMMENT '客户公司',
  `email` varchar(20) DEFAULT NULL COMMENT '客户邮箱',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='客户表';

-- ----------------------------
-- Records of tb_customer
-- ----------------------------
BEGIN;
INSERT INTO `tb_customer` VALUES (1, '吴晓晓', '19274928377', '广州市天河区广州大道南', 'A公司', '128397429@qq.com');
INSERT INTO `tb_customer` VALUES (2, '讯默', '293875682764', '珠海市珠海大道南', 'B公司', '2398498@qq.com');
COMMIT;

-- ----------------------------
-- Table structure for tb_product
-- ----------------------------
DROP TABLE IF EXISTS `tb_product`;
CREATE TABLE `tb_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '产品id',
  `name` varchar(50) NOT NULL COMMENT '产品名称',
  `describe` varchar(500) DEFAULT NULL COMMENT '产品描述',
  `unit` varchar(20) DEFAULT NULL COMMENT '产品单位',
  `price` int(11) DEFAULT NULL COMMENT '产品价格\n',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='产品表';

-- ----------------------------
-- Records of tb_product
-- ----------------------------
BEGIN;
INSERT INTO `tb_product` VALUES (1, '鼠标', '蓝牙无线鼠标', '个', 36);
INSERT INTO `tb_product` VALUES (2, '键盘', '蓝牙无线键盘', '个', 23);
INSERT INTO `tb_product` VALUES (3, '显示器', '全屏膜显示器', '台', 290);
COMMIT;

-- ----------------------------
-- Table structure for tb_type
-- ----------------------------
DROP TABLE IF EXISTS `tb_type`;
CREATE TABLE `tb_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '销售类型id',
  `type_name` varchar(50) NOT NULL COMMENT '销售类型名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='销售类型';

-- ----------------------------
-- Records of tb_type
-- ----------------------------
BEGIN;
INSERT INTO `tb_type` VALUES (1, '未销售');
INSERT INTO `tb_type` VALUES (2, '正在销售');
INSERT INTO `tb_type` VALUES (3, '销售失败');
INSERT INTO `tb_type` VALUES (4, '销售成功');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
