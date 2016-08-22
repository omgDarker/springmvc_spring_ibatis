/*
Navicat MySQL Data Transfer

Source Server         : AK
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : ssi

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2016-08-22 14:36:43
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for birthday
-- ----------------------------
DROP TABLE IF EXISTS `birthday`;
CREATE TABLE `birthday` (
  `Id` int(32) NOT NULL AUTO_INCREMENT COMMENT '生日ID',
  `username` varchar(50) NOT NULL COMMENT '生日名称',
  `age` varchar(10) DEFAULT NULL COMMENT '年龄',
  `birthday` varchar(50) NOT NULL COMMENT '生日日期',
  `flag` int(2) DEFAULT NULL COMMENT '标识',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of birthday
-- ----------------------------
INSERT INTO `birthday` VALUES ('1', 'darker', '25', '1991-08-17', '1');

-- ----------------------------
-- Table structure for login
-- ----------------------------
DROP TABLE IF EXISTS `login`;
CREATE TABLE `login` (
  `managerId` int(32) NOT NULL AUTO_INCREMENT COMMENT '登录ID',
  `managerName` varchar(50) NOT NULL COMMENT '登录名',
  `managerPassword` varchar(50) DEFAULT NULL COMMENT '登录密码',
  `flag` int(2) DEFAULT NULL COMMENT '标识',
  PRIMARY KEY (`managerId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of login
-- ----------------------------
INSERT INTO `login` VALUES ('1', 'administrator', 'ninemax', '1');

-- ----------------------------
-- Table structure for movie
-- ----------------------------
DROP TABLE IF EXISTS `movie`;
CREATE TABLE `movie` (
  `movieId` int(32) NOT NULL AUTO_INCREMENT COMMENT '电影ID',
  `movieName` varchar(50) NOT NULL COMMENT '电影名称',
  `movieTime` varchar(10) DEFAULT NULL COMMENT '上映时间',
  `movieMoney` varchar(10) NOT NULL COMMENT '票价',
  `movieNumber` varchar(10) DEFAULT NULL COMMENT '票数',
  `flag` int(2) DEFAULT NULL COMMENT '标识',
  PRIMARY KEY (`movieId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of movie
-- ----------------------------
INSERT INTO `movie` VALUES ('1', '我们诞生在中国', '2016-08-12', '90', '200', '1');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userId` int(32) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `userName` varchar(50) NOT NULL COMMENT '用户名',
  `age` varchar(10) DEFAULT NULL COMMENT '用户年龄',
  `flag` int(2) DEFAULT NULL COMMENT '标识',
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'darker', '25', '1');

-- ----------------------------
-- Table structure for watchmovie
-- ----------------------------
DROP TABLE IF EXISTS `watchmovie`;
CREATE TABLE `watchmovie` (
  `watchmovieId` int(32) NOT NULL AUTO_INCREMENT COMMENT '观影ID',
  `watchmovieName` varchar(50) NOT NULL COMMENT '观影名称',
  `watchmovieUrl` varchar(500) DEFAULT NULL COMMENT '观影地址',
  `watchmovieSource` varchar(50) NOT NULL COMMENT '观影资源来源',
  `flag` int(2) DEFAULT NULL COMMENT '标识',
  PRIMARY KEY (`watchmovieId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of watchmovie
-- ----------------------------
INSERT INTO `watchmovie` VALUES ('1', '惊天魔盗团2', 'http://dy206.com/?m=vod-detail-id-39.html', '木瓜影院', '1');
