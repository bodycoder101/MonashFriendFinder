/*
Navicat MySQL Data Transfer

Source Server         : MoashFriendFinder
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : monashfriendfinder

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-05-17 18:27:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `course`
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `course_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `coursename` varchar(50) NOT NULL,
  PRIMARY KEY (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('1', 'FIT5183');
INSERT INTO `course` VALUES ('2', 'MBIS');
INSERT INTO `course` VALUES ('3', 'MNS');
INSERT INTO `course` VALUES ('4', 'MDS');
INSERT INTO `course` VALUES ('5', 'FIT5186');

-- ----------------------------
-- Table structure for `friendship`
-- ----------------------------
DROP TABLE IF EXISTS `friendship`;
CREATE TABLE `friendship` (
  `friendship_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `friend_id` bigint(20) unsigned NOT NULL,
  `starting_time` datetime NOT NULL,
  `ending_time` datetime DEFAULT NULL,
  PRIMARY KEY (`friendship_id`),
  UNIQUE KEY `uq_friendship_user_friend` (`user_id`,`friend_id`),
  KEY `FK_FRIENDSHIP` (`user_id`),
  KEY `FK_FRIENDSHIPO` (`friend_id`),
  CONSTRAINT `FK_FRIENDSHIP` FOREIGN KEY (`user_id`) REFERENCES `profile` (`student_id`),
  CONSTRAINT `FK_FRIENDSHIPO` FOREIGN KEY (`friend_id`) REFERENCES `profile` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of friendship
-- ----------------------------
INSERT INTO `friendship` VALUES ('1', '1', '2', '2017-02-08 11:03:32', '2017-05-15 00:17:21');
INSERT INTO `friendship` VALUES ('2', '2', '3', '2015-02-08 11:03:32', '2017-03-20 11:03:47');
INSERT INTO `friendship` VALUES ('24', '1', '6', '2017-05-15 01:01:29', null);
INSERT INTO `friendship` VALUES ('25', '1', '5', '2017-05-15 02:37:37', '2017-05-16 02:21:53');
INSERT INTO `friendship` VALUES ('26', '1', '3', '2017-05-15 15:10:56', null);
INSERT INTO `friendship` VALUES ('27', '1', '8', '2017-05-16 02:59:23', null);
INSERT INTO `friendship` VALUES ('28', '1', '7', '2017-05-16 03:00:20', null);
INSERT INTO `friendship` VALUES ('29', '7', '2', '2017-05-16 03:15:43', null);
INSERT INTO `friendship` VALUES ('30', '7', '4', '2017-05-16 03:17:17', null);
INSERT INTO `friendship` VALUES ('31', '10', '5', '2017-05-16 03:22:40', null);
INSERT INTO `friendship` VALUES ('39', '11', '3', '2017-05-16 04:45:48', null);
INSERT INTO `friendship` VALUES ('40', '11', '7', '2017-05-16 05:24:33', null);
INSERT INTO `friendship` VALUES ('41', '11', '5', '2017-05-16 05:24:45', null);
INSERT INTO `friendship` VALUES ('43', '11', '8', '2017-05-16 05:25:06', null);

-- ----------------------------
-- Table structure for `location`
-- ----------------------------
DROP TABLE IF EXISTS `location`;
CREATE TABLE `location` (
  `location_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` bigint(20) unsigned NOT NULL,
  `longtitude` decimal(20,6) NOT NULL,
  `latitude` decimal(20,6) NOT NULL,
  `time` datetime NOT NULL,
  `location_name` varchar(50) NOT NULL,
  `current` int(1) NOT NULL,
  PRIMARY KEY (`location_id`),
  KEY `fk_location_studentId` (`student_id`),
  CONSTRAINT `fk_location_studentId` FOREIGN KEY (`student_id`) REFERENCES `profile` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of location
-- ----------------------------
INSERT INTO `location` VALUES ('1', '1', '116.420366', '39.909622', '2017-05-01 11:01:18', 'Beijing', '0');
INSERT INTO `location` VALUES ('2', '2', '121.474488', '31.233341', '2017-03-11 11:02:46', 'Shanghai', '0');
INSERT INTO `location` VALUES ('3', '3', '118.801741', '32.065714', '2017-03-12 12:02:46', 'NanJing', '0');
INSERT INTO `location` VALUES ('4', '4', '114.308382', '30.598428', '2017-03-13 13:02:46', 'Wuhan', '0');
INSERT INTO `location` VALUES ('5', '5', '120.592488', '31.303332', '2017-03-14 11:02:46', 'Suzhou', '0');
INSERT INTO `location` VALUES ('6', '6', '120.165142', '30.281556', '2017-03-10 12:01:18', 'Hangzhou', '0');
INSERT INTO `location` VALUES ('7', '2', '116.420366', '39.909622', '2017-03-11 13:02:46', 'Beijing', '1');
INSERT INTO `location` VALUES ('8', '2', '121.474488', '31.233341', '2017-03-12 14:02:46', 'Shanghai', '1');
INSERT INTO `location` VALUES ('9', '1', '113.269643', '23.136371', '2017-03-13 15:02:46', 'Guangzhou', '1');
INSERT INTO `location` VALUES ('10', '1', '114.067549', '22.543041', '2017-03-14 16:02:46', 'Shenzhen', '1');
INSERT INTO `location` VALUES ('11', '7', '121.474488', '31.233341', '2017-05-15 00:23:39', 'Shanghai', '0');
INSERT INTO `location` VALUES ('12', '8', '120.318540', '31.501329', '2017-05-15 00:24:45', 'WuXi', '0');
INSERT INTO `location` VALUES ('13', '9', '119.982154', '31.816055', '2017-05-15 00:26:26', 'Changzhou', '0');
INSERT INTO `location` VALUES ('14', '10', '120.165142', '30.281556', '2017-05-16 04:26:21', 'Hangzhou', '0');
INSERT INTO `location` VALUES ('15', '1', '113.269643', '23.136371', '2017-04-01 05:40:45', 'Guangzhou', '1');
INSERT INTO `location` VALUES ('16', '1', '114.067549', '22.543041', '2017-04-02 05:43:27', 'Shenzhen', '1');
INSERT INTO `location` VALUES ('17', '1', '114.067549', '22.543041', '2017-05-03 05:44:58', 'Shenzhen', '1');

-- ----------------------------
-- Table structure for `profile`
-- ----------------------------
DROP TABLE IF EXISTS `profile`;
CREATE TABLE `profile` (
  `student_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(10) NOT NULL,
  `sur_name` varchar(10) NOT NULL,
  `DOB` datetime NOT NULL,
  `gender` char(2) NOT NULL,
  `address` varchar(50) NOT NULL,
  `suburb` varchar(50) NOT NULL,
  `nationality` varchar(10) NOT NULL,
  `native_language` varchar(10) DEFAULT NULL,
  `favourite_movie` varchar(50) DEFAULT NULL,
  `favourite_unit` bigint(20) unsigned DEFAULT NULL,
  `favourite_sport` varchar(50) DEFAULT NULL,
  `current_job` varchar(20) DEFAULT NULL,
  `monash_email` varchar(50) DEFAULT NULL,
  `s_password` varchar(255) DEFAULT NULL,
  `study_mode` char(2) NOT NULL,
  `subscription_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`student_id`),
  UNIQUE KEY `uq_student_password` (`student_id`,`s_password`),
  KEY `favourite_unit` (`favourite_unit`),
  CONSTRAINT `profile_ibfk_1` FOREIGN KEY (`favourite_unit`) REFERENCES `course` (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of profile
-- ----------------------------
INSERT INTO `profile` VALUES ('1', 'liang', 'zhang', '2017-05-17 00:00:00', 'M', 'suzhou', 'Nanjing', 'China', 'English', 'Titanic', '1', 'Basketball', null, 'lzhang001@student.monash.edu', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'F', '2016-09-12 10:53:23');
INSERT INTO `profile` VALUES ('2', 'yun', 'zhao', '1996-12-16 10:55:40', 'M', 'suzhou', 'suzhou', 'China', 'chinese', 'Titanic', '2', 'badminton', null, 'yzhao001@student.monash.edu', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'P', '2016-09-20 10:58:17');
INSERT INTO `profile` VALUES ('3', 'liang', 'zhuge', '1996-07-11 10:48:51', 'F', 'suzhou', 'suzhou', 'China', 'chinese', 'Avatar', '3', 'basketball', null, 'lzhuge001@student.monash.edu', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'F', '2016-08-12 10:53:23');
INSERT INTO `profile` VALUES ('4', 'cao', 'haha', '1996-05-06 00:00:00', 'F', 'suzhou', 'suzhou', 'China', 'Chinese', 'Titanic', '4', 'Basketball', null, 'ccao001@student.monash.edu', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'P', '2016-11-20 10:58:17');
INSERT INTO `profile` VALUES ('5', 'yu', 'guan', '1996-05-11 10:48:51', 'F', 'suzhou', 'suzhou', 'China', 'chinese', 'Her', '5', 'basketball', null, 'yguan001@student.monash.edu', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'F', '2016-03-12 10:53:23');
INSERT INTO `profile` VALUES ('6', 'chao', 'ma', '1996-02-16 10:55:40', 'M', 'suzhou', 'suzhou', 'China', 'chinese', 'Titanic', '1', 'badminton', null, 'cma001@student.monash.edu', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'P', '2016-08-20 10:58:17');
INSERT INTO `profile` VALUES ('7', 'zhang', 'jie', '2017-04-10 00:00:00', 'M', 'shanghai', 'nanjing', 'China', 'Chinese', 'her', '1', 'Basketball', 'student', 'cma003@student.monash.edu', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'P', '2017-05-14 00:00:00');
INSERT INTO `profile` VALUES ('8', 'xiao', 'ming', '2017-04-05 00:00:00', 'M', 'nanjing', 'nanjing', 'China', 'Chinese', '1947', '2', 'Basketball', 'teacher', 'cma004@student.monash.edu', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'P', '2017-05-14 00:00:00');
INSERT INTO `profile` VALUES ('9', 'xiao', 'hong', '2017-04-03 00:00:00', 'M', 'Beijing', 'Nanjing', 'China', 'Chinese', '1947', '2', 'Basketball', 'teacher', 'cma002@student.monash.edu', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'P', '2017-05-14 00:00:00');
INSERT INTO `profile` VALUES ('10', 'kang', 'ming', '2017-05-16 00:00:00', 'M', 'wuxi', 'Nanjing', 'China', 'Chinese', 'her', '5', 'Basketball', 'doctor', 'cma005@student.monash.edu', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'P', '2017-05-16 00:00:00');
INSERT INTO `profile` VALUES ('11', 'guang', 'ming', '2017-05-16 00:00:00', 'F', 'shanghai', 'Nanjing', 'China', 'Chinese', 'Titanic', '5', 'Basketball', 'student', 'gm@student.monash.edu', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'P', '2017-05-16 00:00:00');
INSERT INTO `profile` VALUES ('12', 'body', 'coder', '2017-05-17 00:00:00', 'M', 'shanghai', 'Nanjing', 'China', 'Chinese', 'her', '1', 'Basketball', 'student', 'yy@student.monash.edu', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'P', '2017-05-17 00:00:00');
INSERT INTO `profile` VALUES ('13', 'aa', 'aa', '2017-04-08 00:00:00', 'M', 'suzhou', 'Shanghai', 'Amercia', 'Chinese', 'her', '1', 'Basketball', 'student', 're@qq.com', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'P', '2017-05-17 00:00:00');

-- ----------------------------
-- Table structure for `sleceted_course`
-- ----------------------------
DROP TABLE IF EXISTS `sleceted_course`;
CREATE TABLE `sleceted_course` (
  `sc_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` bigint(20) unsigned DEFAULT NULL,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`sc_id`),
  KEY `fk_studentcourse_courseid` (`course_id`),
  KEY `fk_studentcourse_studentid` (`student_id`),
  CONSTRAINT `fk_studentcourse_courseid` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`),
  CONSTRAINT `fk_studentcourse_studentid` FOREIGN KEY (`student_id`) REFERENCES `profile` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sleceted_course
-- ----------------------------
INSERT INTO `sleceted_course` VALUES ('1', '1', '2');
INSERT INTO `sleceted_course` VALUES ('2', '1', '3');
INSERT INTO `sleceted_course` VALUES ('3', '2', '3');
INSERT INTO `sleceted_course` VALUES ('4', '2', '4');
INSERT INTO `sleceted_course` VALUES ('5', '3', '5');
DROP TRIGGER IF EXISTS `tg_trim_friendship_user`;
DELIMITER ;;
CREATE TRIGGER `tg_trim_friendship_user` BEFORE INSERT ON `friendship` FOR EACH ROW BEGIN
  DECLARE
    isExists int default 0;
  select count(*) into isExists from friendship WHERE user_id = NEW.friend_id and friend_id = NEW.user_id;
  IF isExists > 0 THEN
    /*
     * Error: 1062 SQLSTATE: 23000 (ER_DUP_ENTRY)
     * Message: Duplicate entry '%s' for key %d
     * The message returned with this error uses the format string for ER_DUP_ENTRY_WITH_KEY_NAME.
     */
    SIGNAL SQLSTATE '23000' SET MESSAGE_TEXT = 'Storing reverse pairs';
  END IF;
END
;;
DELIMITER ;
