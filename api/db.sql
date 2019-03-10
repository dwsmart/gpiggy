/*
Navicat MariaDB Data Transfer

Source Server         : Tame The Bots
Source Server Version : 100134
Source Host           : localhost:3306
Source Database       : gpig

Target Server Type    : MariaDB
Target Server Version : 100134
File Encoding         : 65001

Date: 2019-03-10 18:40:51
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_title` varchar(255) DEFAULT NULL,
  `category_desc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES ('1', 'Good Piggies', '<p>Well behaved, good cavies</p>');
INSERT INTO `categories` VALUES ('2', 'Naughty Piggies', '<p>Cheeky little Guinea Pigs.</p>');

-- ----------------------------
-- Table structure for pigs
-- ----------------------------
DROP TABLE IF EXISTS `pigs`;
CREATE TABLE `pigs` (
  `pig_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `desc` text,
  `category` int(11) DEFAULT NULL,
  PRIMARY KEY (`pig_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of pigs
-- ----------------------------
INSERT INTO `pigs` VALUES ('1', 'Bob', 'https://tamethebots.com/demos/gpigs/bob.jpg', '<p>Nice piggy, helps old ladies across the road</p>', '1');
INSERT INTO `pigs` VALUES ('2', 'Gerald', 'https://tamethebots.com/demos/gpigs/gerald.jpg', '<p>Naughty chap, hangs round late at night drinking cider and causing a kerfuffle.</p>', '2');
INSERT INTO `pigs` VALUES ('3', 'Janet', 'https://tamethebots.com/demos/gpigs/janet.jpg', '<p>An angel! Such a kind Cavie, often bakes cakes for the needy.</p>', '1');
INSERT INTO `pigs` VALUES ('4', 'Malcom', 'https://tamethebots.com/demos/gpigs/malcom.jpg', '<p>Very nice chap, always a kind squeak for anyone!</p>', '1');
INSERT INTO `pigs` VALUES ('5', 'Mary', 'https://tamethebots.com/demos/gpigs/mary.jpg', '<p>Untrustworthy, convicted of defrauding the local petshop.</p>', '2');
INSERT INTO `pigs` VALUES ('6', 'Baron von Squeak', 'https://tamethebots.com/demos/gpigs/baron_von_squeak.jpg', '<p>Concidered by many to be the purest of all evil, currently on the run and wanted for War Crimes by 18 different countries. Real name is Steve but thinks the fake Baron make him sound cool.</p>', '2');

-- ----------------------------
-- Table structure for routes
-- ----------------------------
DROP TABLE IF EXISTS `routes`;
CREATE TABLE `routes` (
  `route_id` int(255) NOT NULL AUTO_INCREMENT,
  `request` varchar(255) DEFAULT NULL,
  `target` varchar(255) DEFAULT NULL,
  `type` varchar(11) DEFAULT '0',
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`route_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of routes
-- ----------------------------
INSERT INTO `routes` VALUES ('1', 'good', '1', 'cat', 'Good Piggies', 'All about nice guinea pigs');
INSERT INTO `routes` VALUES ('2', 'naughty', '2', 'cat', 'Bad Piggies', 'Those wicked piggies!');
INSERT INTO `routes` VALUES ('3', 'terrible', 'naughty', 'redirect', null, null);
INSERT INTO `routes` VALUES ('4', 'good/bob', '1', 'pig', 'Bob', 'Nice Bob');
INSERT INTO `routes` VALUES ('5', 'naughty/gerald', '2', 'pig', 'Gerald', 'Bad Gerald');
INSERT INTO `routes` VALUES ('6', 'good/janet', '3', 'pig', 'Janet', 'Good Janet');
INSERT INTO `routes` VALUES ('7', 'good/malcom', '4', 'pig', 'Malcom', 'Good Malcom');
INSERT INTO `routes` VALUES ('8', 'naughty/mary', '5', 'pig', 'Mary', 'Bad Mary');
INSERT INTO `routes` VALUES ('9', 'naughty/baron-von-squeak', '6', 'pig', 'Baron von Squeak', 'True Evil');
SET FOREIGN_KEY_CHECKS=1;
