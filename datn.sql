/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 100427
 Source Host           : localhost:3306
 Source Schema         : datn

 Target Server Type    : MySQL
 Target Server Version : 100427
 File Encoding         : 65001

 Date: 24/04/2024 22:27:00
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for loaisanpham
-- ----------------------------
DROP TABLE IF EXISTS `loaisanpham`;
CREATE TABLE `loaisanpham`  (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Ten` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BieuTuong` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TrangThai` int NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of loaisanpham
-- ----------------------------
INSERT INTO `loaisanpham` VALUES (1, 'Ti vi', 'icon01.png', 1);
INSERT INTO `loaisanpham` VALUES (2, 'Tủ lạnh', 'icon02.png', 1);
INSERT INTO `loaisanpham` VALUES (3, 'Máy giặt', 'icon03.png', 1);
INSERT INTO `loaisanpham` VALUES (4, 'Điều hoà', 'icon04.png', 1);
INSERT INTO `loaisanpham` VALUES (5, 'Điện thoại', 'icon05.png', 1);
INSERT INTO `loaisanpham` VALUES (6, 'Máy tính bảng', 'icon06.png', 1);
INSERT INTO `loaisanpham` VALUES (7, 'Laptop', 'icon07.png', 1);
INSERT INTO `loaisanpham` VALUES (8, 'Thiết bị văn phòng', 'icon08.png', 1);
INSERT INTO `loaisanpham` VALUES (9, 'Phụ kiện', 'icon09.png', 1);

SET FOREIGN_KEY_CHECKS = 1;
