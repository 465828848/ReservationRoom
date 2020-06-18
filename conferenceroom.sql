/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : conferenceroom

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 04/06/2020 14:31:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for appoint_cause
-- ----------------------------
DROP TABLE IF EXISTS `appoint_cause`;
CREATE TABLE `appoint_cause`  (
  `appointCauseCd` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '预定原因Code',
  `appointCauseInfo` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '预定原因说明'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of appoint_cause
-- ----------------------------

-- ----------------------------
-- Table structure for appointment
-- ----------------------------
DROP TABLE IF EXISTS `appointment`;
CREATE TABLE `appointment`  (
  `createTime` bigint(13) NOT NULL COMMENT '创建预约时间',
  `conferenceRoom` char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '预约会议室',
  `userName` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建预约人',
  `appointDate` date NOT NULL COMMENT '预约日期',
  `appointBeginTime` int(2) NOT NULL COMMENT '预约开始时间',
  `appointEndTime` int(2) NOT NULL COMMENT '预约结束时间',
  `appointUser` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '预约人姓名',
  `appointPhone` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '预约人电话',
  `appointMail` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '预约人邮件',
  `appointCauseCd` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '预定原因Code',
  `appointExplain` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '预定说明'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of appointment
-- ----------------------------
INSERT INTO `appointment` VALUES (1591215752771, 'F3-508', 'gaibj', '2020-06-04', 1, 10, '王二', '12345678901', 'gaibj@mail.com', '01', NULL);
INSERT INTO `appointment` VALUES (1591246723422, 'F3-508', 'gaibj', '2020-06-04', 42, 43, '王二', '12345678901', 'gaibj@mail.com', '01', '423423423');
INSERT INTO `appointment` VALUES (1591247274376, 'F3-508', 'gaibj', '2020-06-04', 14, 15, '王二', '12345678901', '用户未登录，过滤器还没做', '01', '3123123');

-- ----------------------------
-- Table structure for room_info
-- ----------------------------
DROP TABLE IF EXISTS `room_info`;
CREATE TABLE `room_info`  (
  `buildingId` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '楼号',
  `roomId` char(3) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '会议室ID',
  `roomName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会议室名称',
  `roomPeople` int(3) NULL DEFAULT NULL COMMENT '会议室容纳人数',
  `roomState` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '会议室状态码',
  PRIMARY KEY (`buildingId`, `roomId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of room_info
-- ----------------------------
INSERT INTO `room_info` VALUES ('F3', '508', '会议室1', 40, '0');
INSERT INTO `room_info` VALUES ('F3', '509', '会议室2', 30, '0');

-- ----------------------------
-- Table structure for room_state
-- ----------------------------
DROP TABLE IF EXISTS `room_state`;
CREATE TABLE `room_state`  (
  `RoomStateId` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '会议室状态码',
  `RoomStateName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '会议室状态',
  PRIMARY KEY (`RoomStateId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of room_state
-- ----------------------------
INSERT INTO `room_state` VALUES ('0', '正常');
INSERT INTO `room_state` VALUES ('1', '维修');

-- ----------------------------
-- Table structure for time_point
-- ----------------------------
DROP TABLE IF EXISTS `time_point`;
CREATE TABLE `time_point`  (
  `timePoint` int(2) NOT NULL COMMENT '时间点',
  `time` time(0) NOT NULL COMMENT '时间',
  PRIMARY KEY (`timePoint`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of time_point
-- ----------------------------
INSERT INTO `time_point` VALUES (1, '09:00:00');
INSERT INTO `time_point` VALUES (2, '09:15:00');
INSERT INTO `time_point` VALUES (3, '09:30:00');
INSERT INTO `time_point` VALUES (4, '09:45:00');
INSERT INTO `time_point` VALUES (5, '10:00:00');
INSERT INTO `time_point` VALUES (6, '10:15:00');
INSERT INTO `time_point` VALUES (7, '10:30:00');
INSERT INTO `time_point` VALUES (8, '10:45:00');
INSERT INTO `time_point` VALUES (9, '11:00:00');
INSERT INTO `time_point` VALUES (10, '11:15:00');
INSERT INTO `time_point` VALUES (11, '11:30:00');
INSERT INTO `time_point` VALUES (12, '11:45:00');
INSERT INTO `time_point` VALUES (13, '12:00:00');
INSERT INTO `time_point` VALUES (14, '12:15:00');
INSERT INTO `time_point` VALUES (15, '12:30:00');
INSERT INTO `time_point` VALUES (16, '12:45:00');
INSERT INTO `time_point` VALUES (17, '13:00:00');
INSERT INTO `time_point` VALUES (18, '13:15:00');
INSERT INTO `time_point` VALUES (19, '13:30:00');
INSERT INTO `time_point` VALUES (20, '13:45:00');
INSERT INTO `time_point` VALUES (21, '14:00:00');
INSERT INTO `time_point` VALUES (22, '14:15:00');
INSERT INTO `time_point` VALUES (23, '14:30:00');
INSERT INTO `time_point` VALUES (24, '14:45:00');
INSERT INTO `time_point` VALUES (25, '15:00:00');
INSERT INTO `time_point` VALUES (26, '15:15:00');
INSERT INTO `time_point` VALUES (27, '15:30:00');
INSERT INTO `time_point` VALUES (28, '15:45:00');
INSERT INTO `time_point` VALUES (29, '16:00:00');
INSERT INTO `time_point` VALUES (30, '16:15:00');
INSERT INTO `time_point` VALUES (31, '16:30:00');
INSERT INTO `time_point` VALUES (32, '16:45:00');
INSERT INTO `time_point` VALUES (33, '17:00:00');
INSERT INTO `time_point` VALUES (34, '17:15:00');
INSERT INTO `time_point` VALUES (35, '17:30:00');
INSERT INTO `time_point` VALUES (36, '17:45:00');
INSERT INTO `time_point` VALUES (37, '18:00:00');
INSERT INTO `time_point` VALUES (38, '18:15:00');
INSERT INTO `time_point` VALUES (39, '18:30:00');
INSERT INTO `time_point` VALUES (40, '18:45:00');
INSERT INTO `time_point` VALUES (41, '19:00:00');
INSERT INTO `time_point` VALUES (42, '19:15:00');
INSERT INTO `time_point` VALUES (43, '19:30:00');
INSERT INTO `time_point` VALUES (44, '19:45:00');
INSERT INTO `time_point` VALUES (45, '20:00:00');
INSERT INTO `time_point` VALUES (46, '20:15:00');
INSERT INTO `time_point` VALUES (47, '20:30:00');
INSERT INTO `time_point` VALUES (48, '20:45:00');
INSERT INTO `time_point` VALUES (49, '21:00:00');

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info`  (
  `userName` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `userPassword` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户密码',
  `userFullName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户全名',
  `userEmail` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户邮箱',
  `userState` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户状态',
  PRIMARY KEY (`userName`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('gaibj', '123456', '张三', 'gaibj@mail.com', '0');

SET FOREIGN_KEY_CHECKS = 1;
