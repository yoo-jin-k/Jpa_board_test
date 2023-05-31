/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 110100
 Source Host           : localhost:3306
 Source Schema         : mc_cost

 Target Server Type    : MySQL
 Target Server Version : 110100
 File Encoding         : 65001

 Date: 31/05/2023 17:49:19
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for board
-- ----------------------------
DROP TABLE IF EXISTS `board`;
CREATE TABLE `board`  (
  `bno` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_date` datetime(6) NULL DEFAULT NULL,
  `modified_date` datetime(6) NULL DEFAULT NULL,
  `content` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`bno`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of board
-- ----------------------------
INSERT INTO `board` VALUES (1, '2023-05-31 10:47:57.079787', '2023-05-31 10:47:57.079787', '1', '1', '1');
INSERT INTO `board` VALUES (2, '2023-05-31 10:48:03.829207', '2023-05-31 10:48:03.829207', '2', '2', '2');
INSERT INTO `board` VALUES (3, '2023-05-31 10:48:09.405064', '2023-05-31 10:48:44.889314', '333', '3', '333');
INSERT INTO `board` VALUES (4, '2023-05-31 10:48:53.293552', '2023-05-31 10:48:53.293552', '4', '4', '4');
INSERT INTO `board` VALUES (5, '2023-05-31 10:48:57.341959', '2023-05-31 10:48:57.341959', '5', '5', '5');
INSERT INTO `board` VALUES (6, '2023-05-31 10:49:01.677053', '2023-05-31 10:49:01.677053', '6', '6', '6');
INSERT INTO `board` VALUES (7, '2023-05-31 10:49:05.601518', '2023-05-31 10:49:05.601518', '7', '7', '7');
INSERT INTO `board` VALUES (8, '2023-05-31 10:49:09.803010', '2023-05-31 10:49:09.803010', '8', '8', '8');
INSERT INTO `board` VALUES (9, '2023-05-31 10:49:13.927965', '2023-05-31 10:49:13.927965', '9', '9', '9');
INSERT INTO `board` VALUES (10, '2023-05-31 10:49:18.012299', '2023-05-31 10:49:18.012299', '10', '10', '10');
INSERT INTO `board` VALUES (11, '2023-05-31 10:49:21.803596', '2023-05-31 10:49:21.803596', '11', '11', '11');

-- ----------------------------
-- Table structure for ids
-- ----------------------------
DROP TABLE IF EXISTS `ids`;
CREATE TABLE `ids`  (
  `TABLE_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `NEXT_ID` decimal(30, 0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`TABLE_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ids
-- ----------------------------
INSERT INTO `ids` VALUES ('BBS_ID', 1);
INSERT INTO `ids` VALUES ('FILE_ID', 1);
INSERT INTO `ids` VALUES ('SAMPLE', 1);
INSERT INTO `ids` VALUES ('SCHDUL_ID', 1);
INSERT INTO `ids` VALUES ('TMPLAT_ID', 1);

-- ----------------------------
-- Table structure for lettccmmnclcode
-- ----------------------------
DROP TABLE IF EXISTS `lettccmmnclcode`;
CREATE TABLE `lettccmmnclcode`  (
  `CL_CODE` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `CL_CODE_NM` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `CL_CODE_DC` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `USE_AT` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime(0) NULL DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime(0) NULL DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  PRIMARY KEY (`CL_CODE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lettccmmnclcode
-- ----------------------------
INSERT INTO `lettccmmnclcode` VALUES ('LET', '전자정부 프레임워크 경량환경 템플릿', '전자정부 프레임워크 경량환경 템플릿', 'Y', '2011-08-02 21:01:59', 'SYSTEM', '2011-08-02 21:01:59', 'SYSTEM');

-- ----------------------------
-- Table structure for lettccmmncode
-- ----------------------------
DROP TABLE IF EXISTS `lettccmmncode`;
CREATE TABLE `lettccmmncode`  (
  `CODE_ID` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `CODE_ID_NM` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `CODE_ID_DC` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `USE_AT` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `CL_CODE` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime(0) NULL DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime(0) NULL DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  PRIMARY KEY (`CODE_ID`) USING BTREE,
  INDEX `R_179`(`CL_CODE`) USING BTREE,
  CONSTRAINT `LETTCCMMNCODE_ibfk_1` FOREIGN KEY (`CL_CODE`) REFERENCES `lettccmmnclcode` (`CL_CODE`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lettccmmncode
-- ----------------------------
INSERT INTO `lettccmmncode` VALUES ('COM001', '등록구분', '게시판, 커뮤니티, 동호회 등록구분코드', 'Y', 'LET', '2011-08-02 21:01:59', 'SYSTEM', '2011-08-02 21:01:59', 'SYSTEM');
INSERT INTO `lettccmmncode` VALUES ('COM003', '업무구분', '업무구분코드', 'Y', 'LET', '2011-08-02 21:01:59', 'SYSTEM', '2011-08-02 21:01:59', 'SYSTEM');
INSERT INTO `lettccmmncode` VALUES ('COM004', '게시판유형', '게시판유형구분코드', 'Y', 'LET', '2011-08-02 21:01:59', 'SYSTEM', '2011-08-02 21:01:59', 'SYSTEM');
INSERT INTO `lettccmmncode` VALUES ('COM005', '템플릿유형', '템플릿유형구분코드', 'Y', 'LET', '2011-08-02 21:01:59', 'SYSTEM', '2011-08-02 21:01:59', 'SYSTEM');
INSERT INTO `lettccmmncode` VALUES ('COM009', '게시판속성', '게시판 속성', 'Y', 'LET', '2011-08-02 21:01:59', 'SYSTEM', '2011-08-02 21:01:59', 'SYSTEM');
INSERT INTO `lettccmmncode` VALUES ('COM019', '일정중요도', '일정중요도 낮음/보통/높음 상태구분', 'Y', 'LET', '2011-08-02 21:01:59', 'SYSTEM', '2011-08-02 21:01:59', 'SYSTEM');
INSERT INTO `lettccmmncode` VALUES ('COM030', '일정구분', '일정구분 코드', 'Y', 'LET', '2011-08-02 21:01:59', 'SYSTEM', '2011-08-02 21:01:59', 'SYSTEM');
INSERT INTO `lettccmmncode` VALUES ('COM031', '반복구분', '일정 반복구분 코드', 'Y', 'LET', '2011-08-02 21:01:59', 'SYSTEM', '2011-08-02 21:01:59', 'SYSTEM');

-- ----------------------------
-- Table structure for lettccmmndetailcode
-- ----------------------------
DROP TABLE IF EXISTS `lettccmmndetailcode`;
CREATE TABLE `lettccmmndetailcode`  (
  `CODE_ID` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `CODE` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `CODE_NM` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `CODE_DC` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `USE_AT` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime(0) NULL DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime(0) NULL DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  PRIMARY KEY (`CODE_ID`, `CODE`) USING BTREE,
  CONSTRAINT `LETTCCMMNDETAILCODE_ibfk_1` FOREIGN KEY (`CODE_ID`) REFERENCES `lettccmmncode` (`CODE_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lettccmmndetailcode
-- ----------------------------
INSERT INTO `lettccmmndetailcode` VALUES ('COM001', 'REGC01', '단일 게시판 이용등록', '단일 게시판 이용등록', 'Y', '2011-08-02 21:01:59', 'SYSTEM', '2011-08-02 21:01:59', 'SYSTEM');
INSERT INTO `lettccmmndetailcode` VALUES ('COM001', 'REGC07', '게시판사용자등록', '게시판사용자등록', 'Y', '2011-08-02 21:01:59', 'SYSTEM', '2011-08-02 21:01:59', 'SYSTEM');
INSERT INTO `lettccmmndetailcode` VALUES ('COM003', 'BBS', '게시판', '게시판', 'Y', '2011-08-02 21:01:59', 'SYSTEM', '2011-08-02 21:01:59', 'SYSTEM');
INSERT INTO `lettccmmndetailcode` VALUES ('COM004', 'BBST01', '일반게시판', '일반게시판', 'Y', '2011-08-02 21:01:59', 'SYSTEM', '2011-08-02 21:01:59', 'SYSTEM');
INSERT INTO `lettccmmndetailcode` VALUES ('COM004', 'BBST02', '익명게시판', '익명게시판', 'N', '2011-08-02 21:01:59', 'SYSTEM', '2011-08-02 21:01:59', 'SYSTEM');
INSERT INTO `lettccmmndetailcode` VALUES ('COM004', 'BBST03', '공지게시판', '공지게시판', 'Y', '2011-08-02 21:01:59', 'SYSTEM', '2011-08-02 21:01:59', 'SYSTEM');
INSERT INTO `lettccmmndetailcode` VALUES ('COM005', 'TMPT01', '게시판템플릿', '게시판템플릿', 'Y', '2011-08-02 21:01:59', 'SYSTEM', '2011-08-02 21:01:59', 'SYSTEM');
INSERT INTO `lettccmmndetailcode` VALUES ('COM009', 'BBSA01', '유효게시판', '유효게시판', 'N', '2011-08-02 21:01:59', 'SYSTEM', '2011-08-02 21:01:59', 'SYSTEM');
INSERT INTO `lettccmmndetailcode` VALUES ('COM009', 'BBSA02', '갤러리', '갤러리', 'Y', '2011-08-02 21:01:59', 'SYSTEM', '2011-08-02 21:01:59', 'SYSTEM');
INSERT INTO `lettccmmndetailcode` VALUES ('COM009', 'BBSA03', '일반게시판', '일반게시판', 'Y', '2011-08-02 21:01:59', 'SYSTEM', '2011-08-02 21:01:59', 'SYSTEM');
INSERT INTO `lettccmmndetailcode` VALUES ('COM019', 'A', '높음', '높음', 'Y', '2011-08-02 21:02:00', 'SYSTEM', '2011-08-02 21:02:00', 'SYSTEM');
INSERT INTO `lettccmmndetailcode` VALUES ('COM019', 'B', '보통', '보통', 'Y', '2011-08-02 21:02:00', 'SYSTEM', '2011-08-02 21:02:00', 'SYSTEM');
INSERT INTO `lettccmmndetailcode` VALUES ('COM019', 'C', '낮음', '낮음', 'Y', '2011-08-02 21:02:00', 'SYSTEM', '2011-08-02 21:02:00', 'SYSTEM');
INSERT INTO `lettccmmndetailcode` VALUES ('COM030', '1', '회의', '회의', 'Y', '2011-08-02 21:01:59', 'SYSTEM', '2011-08-02 21:01:59', 'SYSTEM');
INSERT INTO `lettccmmndetailcode` VALUES ('COM030', '2', '세미나', '세미나', 'Y', '2011-08-02 21:01:59', 'SYSTEM', '2011-08-02 21:01:59', 'SYSTEM');
INSERT INTO `lettccmmndetailcode` VALUES ('COM030', '3', '강의', '강의', 'Y', '2011-08-02 21:01:59', 'SYSTEM', '2011-08-02 21:01:59', 'SYSTEM');
INSERT INTO `lettccmmndetailcode` VALUES ('COM030', '4', '교육', '교육', 'Y', '2011-08-02 21:01:59', 'SYSTEM', '2011-08-02 21:01:59', 'SYSTEM');
INSERT INTO `lettccmmndetailcode` VALUES ('COM030', '5', '기타', '기타', 'Y', '2011-08-02 21:01:59', 'SYSTEM', '2011-08-02 21:01:59', 'SYSTEM');
INSERT INTO `lettccmmndetailcode` VALUES ('COM031', '1', '당일', '당일', 'Y', '2011-08-02 21:01:59', 'SYSTEM', '2011-08-02 21:01:59', 'SYSTEM');
INSERT INTO `lettccmmndetailcode` VALUES ('COM031', '2', '반복', '반복', 'Y', '2011-08-02 21:02:00', 'SYSTEM', '2011-08-02 21:02:00', 'SYSTEM');
INSERT INTO `lettccmmndetailcode` VALUES ('COM031', '3', '연속', '연속', 'Y', '2011-08-02 21:02:00', 'SYSTEM', '2011-08-02 21:02:00', 'SYSTEM');
INSERT INTO `lettccmmndetailcode` VALUES ('COM031', '4', '요일반복', '요일반복', 'Y', '2011-08-02 21:02:00', 'SYSTEM', '2011-08-02 21:02:00', 'SYSTEM');

-- ----------------------------
-- Table structure for lettnauthorgroupinfo
-- ----------------------------
DROP TABLE IF EXISTS `lettnauthorgroupinfo`;
CREATE TABLE `lettnauthorgroupinfo`  (
  `GROUP_ID` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `GROUP_NM` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `GROUP_CREAT_DE` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `GROUP_DC` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  PRIMARY KEY (`GROUP_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lettnauthorgroupinfo
-- ----------------------------
INSERT INTO `lettnauthorgroupinfo` VALUES ('GROUP_00000000000000', '기본 그룹입니다', '2011-08-02 21:01:59', '기본 그룹');

-- ----------------------------
-- Table structure for lettnbbs
-- ----------------------------
DROP TABLE IF EXISTS `lettnbbs`;
CREATE TABLE `lettnbbs`  (
  `NTT_ID` decimal(20, 0) NOT NULL,
  `BBS_ID` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `NTT_NO` decimal(20, 0) NULL DEFAULT NULL,
  `NTT_SJ` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `NTT_CN` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
  `ANSWER_AT` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `PARNTSCTT_NO` decimal(10, 0) NULL DEFAULT NULL,
  `ANSWER_LC` int(11) NULL DEFAULT NULL,
  `SORT_ORDR` decimal(8, 0) NULL DEFAULT NULL,
  `RDCNT` decimal(10, 0) NULL DEFAULT NULL,
  `USE_AT` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `NTCE_BGNDE` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `NTCE_ENDDE` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `NTCR_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `NTCR_NM` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `PASSWORD` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `ATCH_FILE_ID` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime(0) NOT NULL,
  `FRST_REGISTER_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `LAST_UPDT_PNTTM` datetime(0) NULL DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  PRIMARY KEY (`NTT_ID`, `BBS_ID`) USING BTREE,
  INDEX `LETTNBBS_ibfk_1`(`BBS_ID`) USING BTREE,
  CONSTRAINT `LETTNBBS_ibfk_1` FOREIGN KEY (`BBS_ID`) REFERENCES `lettnbbsmaster` (`BBS_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lettnbbs
-- ----------------------------
INSERT INTO `lettnbbs` VALUES (1, 'BBSMSTR_AAAAAAAAAAAA', 1, '홈페이지 샘플공지1', '홈페이지 샘플공지1', 'N', 0, 0, 2, 0, 'Y', '10000101', '99991231', '', '', '', NULL, '2023-05-08 09:17:29', 'USRCNFRM_00000000000', NULL, NULL);
INSERT INTO `lettnbbs` VALUES (2, 'BBSMSTR_AAAAAAAAAAAA', 1, '홈페이지 샘플공지2', '홈페이지 샘플공지2', 'N', 0, 0, 2, 0, 'Y', '10000101', '99991231', '', '', '', NULL, '2023-05-08 09:17:29', 'USRCNFRM_00000000000', NULL, NULL);
INSERT INTO `lettnbbs` VALUES (3, 'BBSMSTR_AAAAAAAAAAAA', 1, '홈페이지 샘플공지3', '홈페이지 샘플공지3', 'N', 0, 0, 2, 0, 'Y', '10000101', '99991231', '', '', '', NULL, '2023-05-08 09:17:29', 'USRCNFRM_00000000000', NULL, NULL);
INSERT INTO `lettnbbs` VALUES (4, 'BBSMSTR_AAAAAAAAAAAA', 1, '홈페이지 샘플공지4', '홈페이지 샘플공지4', 'N', 0, 0, 2, 0, 'Y', '10000101', '99991231', '', '', '', NULL, '2023-05-08 09:17:29', 'USRCNFRM_00000000000', NULL, NULL);
INSERT INTO `lettnbbs` VALUES (5, 'BBSMSTR_AAAAAAAAAAAA', 1, '홈페이지 샘플공지5', '홈페이지 샘플공지5', 'N', 0, 0, 2, 0, 'Y', '10000101', '99991231', '', '', '', NULL, '2023-05-08 09:17:29', 'USRCNFRM_00000000000', NULL, NULL);
INSERT INTO `lettnbbs` VALUES (6, 'BBSMSTR_BBBBBBBBBBBB', 1, '홈페이지 샘플게시1', '홈페이지 샘플게시1', 'N', 0, 0, 2, 0, 'Y', '10000101', '99991231', '', '', '', NULL, '2023-05-08 09:17:29', 'USRCNFRM_00000000000', NULL, NULL);
INSERT INTO `lettnbbs` VALUES (7, 'BBSMSTR_BBBBBBBBBBBB', 1, '홈페이지 샘플게시2', '홈페이지 샘플게시2', 'N', 0, 0, 2, 0, 'Y', '10000101', '99991231', '', '', '', NULL, '2023-05-08 09:17:29', 'USRCNFRM_00000000000', NULL, NULL);
INSERT INTO `lettnbbs` VALUES (8, 'BBSMSTR_BBBBBBBBBBBB', 1, '홈페이지 샘플게시3', '홈페이지 샘플게시3', 'N', 0, 0, 2, 0, 'Y', '10000101', '99991231', '', '', '', NULL, '2023-05-08 09:17:29', 'USRCNFRM_00000000000', NULL, NULL);
INSERT INTO `lettnbbs` VALUES (9, 'BBSMSTR_BBBBBBBBBBBB', 1, '홈페이지 샘플게시4', '홈페이지 샘플게시4', 'N', 0, 0, 2, 0, 'Y', '10000101', '99991231', '', '', '', NULL, '2023-05-08 09:17:29', 'USRCNFRM_00000000000', NULL, NULL);
INSERT INTO `lettnbbs` VALUES (10, 'BBSMSTR_BBBBBBBBBBBB', 1, '홈페이지 샘플게시5', '홈페이지 샘플게시5', 'N', 0, 0, 2, 0, 'Y', '10000101', '99991231', '', '', '', NULL, '2023-05-08 09:17:29', 'USRCNFRM_00000000000', NULL, NULL);

-- ----------------------------
-- Table structure for lettnbbsmaster
-- ----------------------------
DROP TABLE IF EXISTS `lettnbbsmaster`;
CREATE TABLE `lettnbbsmaster`  (
  `BBS_ID` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `BBS_NM` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `BBS_INTRCN` varchar(2400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `BBS_TY_CODE` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `BBS_ATTRB_CODE` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `REPLY_POSBL_AT` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `FILE_ATCH_POSBL_AT` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `ATCH_POSBL_FILE_NUMBER` decimal(2, 0) NOT NULL,
  `ATCH_POSBL_FILE_SIZE` decimal(8, 0) NULL DEFAULT NULL,
  `USE_AT` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `TMPLAT_ID` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `FRST_REGIST_PNTTM` datetime(0) NOT NULL,
  `LAST_UPDUSR_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`BBS_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lettnbbsmaster
-- ----------------------------
INSERT INTO `lettnbbsmaster` VALUES ('BBSMSTR_AAAAAAAAAAAA', '공지사항', '공지사항게시판', 'BBST03', 'BBSA03', 'Y', 'Y', 2, 5242880, 'Y', 'TMPLAT_BOARD_DEFAULT', 'USRCNFRM_00000000000', '2011-08-31 12:00:00', 'USRCNFRM_00000000000', '2011-08-31 12:00:00');
INSERT INTO `lettnbbsmaster` VALUES ('BBSMSTR_BBBBBBBBBBBB', '갤러리', '갤러리게시판', 'BBST01', 'BBSA02', 'Y', 'Y', 2, 5242880, 'Y', 'TMPLAT_BOARD_DEFAULT', 'USRCNFRM_00000000000', '2011-08-31 12:00:00', 'USRCNFRM_00000000000', '2011-08-31 12:00:00');
INSERT INTO `lettnbbsmaster` VALUES ('BBSMSTR_CCCCCCCCCCCC', '자료실', '자료실게시판', 'BBST01', 'BBSA03', 'Y', 'Y', 2, 5242880, 'Y', 'TMPLAT_BOARD_DEFAULT', 'USRCNFRM_00000000000', '2011-08-31 12:00:00', 'USRCNFRM_00000000000', '2011-08-31 12:00:00');

-- ----------------------------
-- Table structure for lettnbbsmasteroptn
-- ----------------------------
DROP TABLE IF EXISTS `lettnbbsmasteroptn`;
CREATE TABLE `lettnbbsmasteroptn`  (
  `BBS_ID` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `ANSWER_AT` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `STSFDG_AT` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `FRST_REGIST_PNTTM` datetime(0) NOT NULL DEFAULT '1900-01-01 00:00:00',
  `LAST_UPDT_PNTTM` datetime(0) NULL DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `LAST_UPDUSR_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  PRIMARY KEY (`BBS_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for lettnbbsuse
-- ----------------------------
DROP TABLE IF EXISTS `lettnbbsuse`;
CREATE TABLE `lettnbbsuse`  (
  `BBS_ID` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `TRGET_ID` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `USE_AT` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `REGIST_SE_CODE` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime(0) NULL DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `LAST_UPDT_PNTTM` datetime(0) NULL DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  PRIMARY KEY (`BBS_ID`, `TRGET_ID`) USING BTREE,
  CONSTRAINT `LETTNBBSUSE_ibfk_1` FOREIGN KEY (`BBS_ID`) REFERENCES `lettnbbsmaster` (`BBS_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lettnbbsuse
-- ----------------------------
INSERT INTO `lettnbbsuse` VALUES ('BBSMSTR_AAAAAAAAAAAA', 'SYSTEM_DEFAULT_BOARD', 'Y', 'REGC01', '2011-08-31 12:00:00', 'USRCNFRM_00000000000', '2011-09-05 18:15:31', '');
INSERT INTO `lettnbbsuse` VALUES ('BBSMSTR_BBBBBBBBBBBB', 'SYSTEM_DEFAULT_BOARD', 'Y', 'REGC01', '2011-08-31 12:00:00', 'USRCNFRM_00000000000', '2011-08-31 12:00:00', 'USRCNFRM_00000000000');
INSERT INTO `lettnbbsuse` VALUES ('BBSMSTR_CCCCCCCCCCCC', 'SYSTEM_DEFAULT_BOARD', 'Y', 'REGC01', '2011-08-31 12:00:00', 'USRCNFRM_00000000000', '2011-08-31 12:00:00', 'USRCNFRM_00000000000');

-- ----------------------------
-- Table structure for lettnemplyrinfo
-- ----------------------------
DROP TABLE IF EXISTS `lettnemplyrinfo`;
CREATE TABLE `lettnemplyrinfo`  (
  `EMPLYR_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `ORGNZT_ID` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `USER_NM` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `PASSWORD` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `EMPL_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `IHIDNUM` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `SEXDSTN_CODE` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `BRTHDY` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `FXNUM` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `HOUSE_ADRES` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `PASSWORD_HINT` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `PASSWORD_CNSR` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `HOUSE_END_TELNO` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `AREA_NO` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `DETAIL_ADRES` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `ZIP` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `OFFM_TELNO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `MBTLNUM` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `EMAIL_ADRES` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `OFCPS_NM` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `HOUSE_MIDDLE_TELNO` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `GROUP_ID` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `PSTINST_CODE` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `EMPLYR_STTUS_CODE` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `ESNTL_ID` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `CRTFC_DN_VALUE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `SBSCRB_DE` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`EMPLYR_ID`) USING BTREE,
  INDEX `LETTNEMPLYRINFO_ibfk_2`(`GROUP_ID`) USING BTREE,
  INDEX `LETTNEMPLYRINFO_ibfk_1`(`ORGNZT_ID`) USING BTREE,
  CONSTRAINT `LETTNEMPLYRINFO_ibfk_1` FOREIGN KEY (`ORGNZT_ID`) REFERENCES `lettnorgnztinfo` (`ORGNZT_ID`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `LETTNEMPLYRINFO_ibfk_2` FOREIGN KEY (`GROUP_ID`) REFERENCES `lettnauthorgroupinfo` (`GROUP_ID`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lettnemplyrinfo
-- ----------------------------
INSERT INTO `lettnemplyrinfo` VALUES ('admin', 'ORGNZT_0000000000000', '관리자', 'JfQ7FIatlaE5jj7rPYO8QBABX8yb7bNbQy4AKY1QIfc=', '', '', 'F', '', '', '관리자 주소', '', '', '', '', '', '', '', '', '', '', '', 'GROUP_00000000000000', '00000000', 'P', 'USRCNFRM_00000000000', '', '2011-08-02 21:01:59');

-- ----------------------------
-- Table structure for lettnentrprsmber
-- ----------------------------
DROP TABLE IF EXISTS `lettnentrprsmber`;
CREATE TABLE `lettnentrprsmber`  (
  `ENTRPRS_MBER_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `ENTRPRS_SE_CODE` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `BIZRNO` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `JURIRNO` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `CMPNY_NM` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `CXFC` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `ZIP` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `ADRES` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `ENTRPRS_MIDDLE_TELNO` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `FXNUM` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `INDUTY_CODE` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `APPLCNT_NM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `APPLCNT_IHIDNUM` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `SBSCRB_DE` datetime(0) NULL DEFAULT NULL,
  `ENTRPRS_MBER_STTUS` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `ENTRPRS_MBER_PASSWORD` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `ENTRPRS_MBER_PASSWORD_HINT` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `ENTRPRS_MBER_PASSWORD_CNSR` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `GROUP_ID` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `DETAIL_ADRES` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `ENTRPRS_END_TELNO` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `AREA_NO` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `APPLCNT_EMAIL_ADRES` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `ESNTL_ID` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`ENTRPRS_MBER_ID`) USING BTREE,
  INDEX `LETTNENTRPRSMBER_ibfk_1`(`GROUP_ID`) USING BTREE,
  CONSTRAINT `LETTNENTRPRSMBER_ibfk_1` FOREIGN KEY (`GROUP_ID`) REFERENCES `lettnauthorgroupinfo` (`GROUP_ID`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for lettnfile
-- ----------------------------
DROP TABLE IF EXISTS `lettnfile`;
CREATE TABLE `lettnfile`  (
  `ATCH_FILE_ID` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `CREAT_DT` datetime(0) NOT NULL,
  `USE_AT` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ATCH_FILE_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for lettnfiledetail
-- ----------------------------
DROP TABLE IF EXISTS `lettnfiledetail`;
CREATE TABLE `lettnfiledetail`  (
  `ATCH_FILE_ID` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `FILE_SN` decimal(10, 0) NOT NULL,
  `FILE_STRE_COURS` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `STRE_FILE_NM` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `ORIGNL_FILE_NM` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `FILE_EXTSN` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `FILE_CN` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
  `FILE_SIZE` decimal(8, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`ATCH_FILE_ID`, `FILE_SN`) USING BTREE,
  CONSTRAINT `LETTNFILEDETAIL_ibfk_1` FOREIGN KEY (`ATCH_FILE_ID`) REFERENCES `lettnfile` (`ATCH_FILE_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for lettngnrlmber
-- ----------------------------
DROP TABLE IF EXISTS `lettngnrlmber`;
CREATE TABLE `lettngnrlmber`  (
  `MBER_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `PASSWORD` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `PASSWORD_HINT` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `PASSWORD_CNSR` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `IHIDNUM` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `MBER_NM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `ZIP` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `ADRES` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `AREA_NO` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `MBER_STTUS` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `DETAIL_ADRES` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `END_TELNO` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `MBTLNUM` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `GROUP_ID` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `MBER_FXNUM` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `MBER_EMAIL_ADRES` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `MIDDLE_TELNO` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `SBSCRB_DE` datetime(0) NULL DEFAULT NULL,
  `SEXDSTN_CODE` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `ESNTL_ID` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`MBER_ID`) USING BTREE,
  INDEX `LETTNGNRLMBER_ibfk_1`(`GROUP_ID`) USING BTREE,
  CONSTRAINT `LETTNGNRLMBER_ibfk_1` FOREIGN KEY (`GROUP_ID`) REFERENCES `lettnauthorgroupinfo` (`GROUP_ID`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for lettnorgnztinfo
-- ----------------------------
DROP TABLE IF EXISTS `lettnorgnztinfo`;
CREATE TABLE `lettnorgnztinfo`  (
  `ORGNZT_ID` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `ORGNZT_NM` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `ORGNZT_DC` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ORGNZT_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lettnorgnztinfo
-- ----------------------------
INSERT INTO `lettnorgnztinfo` VALUES ('ORGNZT_0000000000000', '기본조직', '기본조직');

-- ----------------------------
-- Table structure for lettnschdulinfo
-- ----------------------------
DROP TABLE IF EXISTS `lettnschdulinfo`;
CREATE TABLE `lettnschdulinfo`  (
  `SCHDUL_ID` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `SCHDUL_SE` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `SCHDUL_DEPT_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `SCHDUL_KND_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `SCHDUL_BEGINDE` datetime(0) NULL DEFAULT NULL,
  `SCHDUL_ENDDE` datetime(0) NULL DEFAULT NULL,
  `SCHDUL_NM` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `SCHDUL_CN` varchar(2500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `SCHDUL_PLACE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `SCHDUL_IPCR_CODE` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `SCHDUL_CHARGER_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `ATCH_FILE_ID` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime(0) NULL DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime(0) NULL DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `REPTIT_SE_CODE` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  PRIMARY KEY (`SCHDUL_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mc_cost_mst
-- ----------------------------
DROP TABLE IF EXISTS `mc_cost_mst`;
CREATE TABLE `mc_cost_mst`  (
  `cost_cd` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`cost_cd`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `author` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES (1, 'author@gmail.com', '테스트 content', '테스트 title');

-- ----------------------------
-- Table structure for tb_com_cust
-- ----------------------------
DROP TABLE IF EXISTS `tb_com_cust`;
CREATE TABLE `tb_com_cust`  (
  `BIZ_CD` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '사업자 코드',
  `CUST_CD` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '고객사 코드',
  `CUST_NM` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '고객사명',
  `ABBR_NM` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '고객사명 약어',
  `BIZREG_NO` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '사업자등록번호',
  `BIZ_TYPE` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '사업 구분',
  `CEO_NM` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '대표자',
  `COMP_NM` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '사업장명',
  `ADDR1` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '사업장 주소',
  `ADDR2` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '사업장 상세 주소',
  `ZIP_CD` varchar(14) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '우편번호',
  `TEL1` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '연락처1',
  `TEL2` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '연락처2',
  `FAX` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'FAX',
  `EMAIL` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'EMAIL',
  `ORDER_NUM` int(11) NULL DEFAULT NULL COMMENT '정렬 순서',
  `RMK` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '비고',
  `USE_YN` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '사용 여부',
  `DEL_YN` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT 'N' COMMENT '삭제 여부',
  `REG_ID` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '등록자',
  `REG_DT` datetime(0) NULL DEFAULT NULL COMMENT '등록일',
  `MOD_ID` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '수정자',
  `MOD_DT` datetime(0) NULL DEFAULT NULL COMMENT '수정일',
  `PIC_NM` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '담당자',
  `PIC_TEL` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '담당자 연락처',
  PRIMARY KEY (`BIZ_CD`, `CUST_CD`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_com_cust
-- ----------------------------
INSERT INTO `tb_com_cust` VALUES ('BIZ01', '111', '1222222', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_com_cust` VALUES ('BIZ01', 'CUST_20210407_001', '삼성전자', '삼전', '11-1111-11', '법인', '대표자1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 'Y', 'N', 'system', '2021-04-07 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `tb_com_cust` VALUES ('BIZ01', 'CUST_20210407_003', 'LG전자', '엘전', '33-3333-33', '법인', '대표자3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 'Y', 'N', 'system', '2021-04-13 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `tb_com_cust` VALUES ('BIZ01', 'CUST_20210407_004', 'LG디스플레이', '엘디플', '44-4444-44', '법인', '대표자4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 'Y', 'N', 'system', '2021-04-07 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `tb_com_cust` VALUES ('BIZ01', 'CUST_20210712_001', '삼성 디스플레이', 'SDC', '55-5555-55', '법인', '대표', '', '', '', '', NULL, NULL, NULL, NULL, 0, '', 'Y', 'N', 'system', '2021-07-12 17:10:02', NULL, NULL, NULL, NULL);
INSERT INTO `tb_com_cust` VALUES ('BIZ01', 'CUST_20210712_002', '한화토탈', '한화', '11-1111-11', '법인', '대표3', '', '', '', '', NULL, NULL, NULL, NULL, 0, '', 'Y', 'N', 'system', '2021-07-12 18:04:50', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for tb_notice
-- ----------------------------
DROP TABLE IF EXISTS `tb_notice`;
CREATE TABLE `tb_notice`  (
  `id` int(11) NOT NULL,
  `content` varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `created` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `hit` int(11) NULL DEFAULT NULL,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `writer` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- View structure for comvnusermaster
-- ----------------------------
DROP VIEW IF EXISTS `comvnusermaster`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`%` SQL SECURITY DEFINER VIEW `comvnusermaster` AS select `lettngnrlmber`.`ESNTL_ID` AS `ESNTL_ID`,`lettngnrlmber`.`MBER_ID` AS `USER_ID`,`lettngnrlmber`.`PASSWORD` AS `PASSWORD`,`lettngnrlmber`.`MBER_NM` AS `USER_NM`,`lettngnrlmber`.`ZIP` AS `USER_ZIP`,`lettngnrlmber`.`ADRES` AS `USER_ADRES`,`lettngnrlmber`.`MBER_EMAIL_ADRES` AS `USER_EMAIL`,' ' AS `GROUP_ID`,'GNR' AS `USER_SE`,' ' AS `ORGNZT_ID` from `lettngnrlmber` union all select `lettnemplyrinfo`.`ESNTL_ID` AS `ESNTL_ID`,`lettnemplyrinfo`.`EMPLYR_ID` AS `EMPLYR_ID`,`lettnemplyrinfo`.`PASSWORD` AS `PASSWORD`,`lettnemplyrinfo`.`USER_NM` AS `USER_NM`,`lettnemplyrinfo`.`ZIP` AS `ZIP`,`lettnemplyrinfo`.`HOUSE_ADRES` AS `HOUSE_ADRES`,`lettnemplyrinfo`.`EMAIL_ADRES` AS `EMAIL_ADRES`,`lettnemplyrinfo`.`GROUP_ID` AS `GROUP_ID`,'USR' AS `USER_SE`,`lettnemplyrinfo`.`ORGNZT_ID` AS `ORGNZT_ID` from `lettnemplyrinfo` union all select `lettnentrprsmber`.`ESNTL_ID` AS `ESNTL_ID`,`lettnentrprsmber`.`ENTRPRS_MBER_ID` AS `ENTRPRS_MBER_ID`,`lettnentrprsmber`.`ENTRPRS_MBER_PASSWORD` AS `ENTRPRS_MBER_PASSWORD`,`lettnentrprsmber`.`CMPNY_NM` AS `CMPNY_NM`,`lettnentrprsmber`.`ZIP` AS `ZIP`,`lettnentrprsmber`.`ADRES` AS `ADRES`,`lettnentrprsmber`.`APPLCNT_EMAIL_ADRES` AS `APPLCNT_EMAIL_ADRES`,' ' AS `Name_exp_8`,'ENT' AS `USER_SE`,' ' AS `ORGNZT_ID` from `lettnentrprsmber`; ;

SET FOREIGN_KEY_CHECKS = 1;
