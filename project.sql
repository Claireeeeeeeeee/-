/*
 Navicat Premium Data Transfer

 Source Server         : hotel
 Source Server Type    : MySQL
 Source Server Version : 80031 (8.0.31)
 Source Host           : localhost:3306
 Source Schema         : project

 Target Server Type    : MySQL
 Target Server Version : 80031 (8.0.31)
 File Encoding         : 65001

 Date: 19/12/2022 21:10:02
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer`  (
  `cid` int NOT NULL AUTO_INCREMENT,
  `phonenum` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `time` int NULL DEFAULT NULL,
  `rid` int NOT NULL,
  `mid` int NULL DEFAULT NULL,
  `cname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `cost` decimal(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`cid`, `rid`) USING BTREE,
  INDEX `rid`(`rid` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES (1, '1', 3, 1, 1, 'm1', 30.00);
INSERT INTO `customer` VALUES (2, '2', 1, 4, 2, 'm2', 20.00);
INSERT INTO `customer` VALUES (31, '4', 2, 7, 4, 'm4', 40.00);
INSERT INTO `customer` VALUES (32, '6', 2, 1, 6, 'm6', 20.00);

-- ----------------------------
-- Table structure for customer_history
-- ----------------------------
DROP TABLE IF EXISTS `customer_history`;
CREATE TABLE `customer_history`  (
  `cid_h` int NOT NULL AUTO_INCREMENT,
  `phonenum` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `time` int NULL DEFAULT NULL,
  `rid` int NOT NULL,
  `mid` int NULL DEFAULT NULL,
  `cname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `cost` decimal(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`cid_h`, `rid`) USING BTREE,
  INDEX `c_r`(`rid` ASC) USING BTREE,
  INDEX `cid`(`cid_h` ASC) USING BTREE,
  CONSTRAINT `customer_history_ibfk_1` FOREIGN KEY (`rid`) REFERENCES `room` (`rid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customer_history
-- ----------------------------
INSERT INTO `customer_history` VALUES (28, '1', 3, 3, 2, 'm2', 30.00);
INSERT INTO `customer_history` VALUES (30, '4', 2, 4, 3, NULL, NULL);
INSERT INTO `customer_history` VALUES (31, '4', 2, 4, 3, NULL, NULL);
INSERT INTO `customer_history` VALUES (32, '4', 2, 4, 3, 'm4', 30.00);
INSERT INTO `customer_history` VALUES (33, '4', 2, 7, 4, 'm4', NULL);

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee`  (
  `eid` int NOT NULL AUTO_INCREMENT,
  `ename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `salary` decimal(10, 2) NULL DEFAULT NULL,
  `epassword` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `department` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`eid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES (1, 'e', 5000.00, '1', '经理');
INSERT INTO `employee` VALUES (2, 'e2', 3000.00, '2', '厨师');
INSERT INTO `employee` VALUES (3, 'e3', 2000.00, '3', '清洁工');
INSERT INTO `employee` VALUES (4, 'e4', 2500.00, '4', '维修工');
INSERT INTO `employee` VALUES (5, 'm7', NULL, '7', NULL);

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member`  (
  `mid` int NOT NULL AUTO_INCREMENT,
  `level` int NULL DEFAULT NULL,
  `mcount` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `mname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `mpassword` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `phonenum` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`mid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES (1, 2, '29', 'm1', '1', '1');
INSERT INTO `member` VALUES (2, 2, '76', 'm2', '2', '1');
INSERT INTO `member` VALUES (3, 1, '11', 'm3', '3', '3');
INSERT INTO `member` VALUES (4, 1, '1', 'm4', '4', '4');
INSERT INTO `member` VALUES (5, 1, '6', 'm5', '5', '5');
INSERT INTO `member` VALUES (6, 1, '6', 'm6', '6', '6');
INSERT INTO `member` VALUES (8, 1, '1', 'm8', '8', '8');
INSERT INTO `member` VALUES (9, 1, '1', 'm9', '9', '9');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `type` int NOT NULL,
  `ordername` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `class` int NULL DEFAULT NULL,
  PRIMARY KEY (`type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (1, '早饭', 0);
INSERT INTO `menu` VALUES (2, '午饭', 0);
INSERT INTO `menu` VALUES (3, '晚饭', 0);
INSERT INTO `menu` VALUES (4, '夜宵', 0);
INSERT INTO `menu` VALUES (5, '修空调', 1);
INSERT INTO `menu` VALUES (6, '修电视', 1);
INSERT INTO `menu` VALUES (7, '通水管', 1);
INSERT INTO `menu` VALUES (8, '换被套枕头', 2);
INSERT INTO `menu` VALUES (9, '打扫浴室', 2);
INSERT INTO `menu` VALUES (10, '打扫全部', 2);

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `oid` int NOT NULL AUTO_INCREMENT,
  `type` int NOT NULL,
  `cid` int NOT NULL,
  `class` int NULL DEFAULT NULL,
  PRIMARY KEY (`oid`, `cid`) USING BTREE,
  INDEX `type`(`type` ASC) USING BTREE,
  INDEX `order_customer`(`cid` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES (4, 2, 1, 0);
INSERT INTO `order` VALUES (9, 5, 2, 1);
INSERT INTO `order` VALUES (10, 9, 2, 2);

-- ----------------------------
-- Table structure for order_history
-- ----------------------------
DROP TABLE IF EXISTS `order_history`;
CREATE TABLE `order_history`  (
  `oid` int NOT NULL AUTO_INCREMENT,
  `type` int NOT NULL,
  `cid` int NOT NULL,
  `class` int NULL DEFAULT NULL,
  PRIMARY KEY (`oid`, `cid`) USING BTREE,
  INDEX `type`(`type` ASC) USING BTREE,
  INDEX `order_customer`(`cid` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_history
-- ----------------------------
INSERT INTO `order_history` VALUES (2, 3, 13, 0);
INSERT INTO `order_history` VALUES (3, 3, 1, 0);
INSERT INTO `order_history` VALUES (5, 1, 2, 0);
INSERT INTO `order_history` VALUES (6, 1, 2, 0);
INSERT INTO `order_history` VALUES (7, 3, 19, 0);
INSERT INTO `order_history` VALUES (8, 3, 19, 0);

-- ----------------------------
-- Table structure for present
-- ----------------------------
DROP TABLE IF EXISTS `present`;
CREATE TABLE `present`  (
  `pid` int NOT NULL AUTO_INCREMENT,
  `pname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `pcount` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `pnum` int NULL DEFAULT NULL,
  `plevel` int NULL DEFAULT NULL,
  PRIMARY KEY (`pid`, `pname`) USING BTREE,
  INDEX `pid`(`pid` ASC, `pname` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of present
-- ----------------------------
INSERT INTO `present` VALUES (1, '书', '2', 2, 1);
INSERT INTO `present` VALUES (2, '玩偶', '5', 4, 2);

-- ----------------------------
-- Table structure for present_order
-- ----------------------------
DROP TABLE IF EXISTS `present_order`;
CREATE TABLE `present_order`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `mid` int NULL DEFAULT NULL,
  `pname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `pid` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `pname`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of present_order
-- ----------------------------
INSERT INTO `present_order` VALUES (1, 1, 'm1', 1);

-- ----------------------------
-- Table structure for reserve
-- ----------------------------
DROP TABLE IF EXISTS `reserve`;
CREATE TABLE `reserve`  (
  `mid` int NOT NULL,
  `mname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `phonenum` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `rid` int NULL DEFAULT NULL,
  `time` int NULL DEFAULT NULL,
  PRIMARY KEY (`mid`) USING BTREE,
  INDEX `re_ro`(`rid` ASC) USING BTREE,
  CONSTRAINT `re_m` FOREIGN KEY (`mid`) REFERENCES `member` (`mid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `re_ro` FOREIGN KEY (`rid`) REFERENCES `room` (`rid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reserve
-- ----------------------------
INSERT INTO `reserve` VALUES (5, 'm5', '5', 6, 2);

-- ----------------------------
-- Table structure for room
-- ----------------------------
DROP TABLE IF EXISTS `room`;
CREATE TABLE `room`  (
  `rid` int NOT NULL AUTO_INCREMENT,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `rclass` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`rid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of room
-- ----------------------------
INSERT INTO `room` VALUES (1, 'inuse', 10.00, 'A');
INSERT INTO `room` VALUES (2, 'reserved', 10.00, 'A');
INSERT INTO `room` VALUES (3, 'reserved', 10.00, 'A');
INSERT INTO `room` VALUES (4, 'empty', 10.00, 'A');
INSERT INTO `room` VALUES (5, 'reserved', 10.00, 'A');
INSERT INTO `room` VALUES (6, 'reserved', 10.00, 'A');
INSERT INTO `room` VALUES (7, 'inuse', 20.00, 'B');
INSERT INTO `room` VALUES (8, 'empty', 20.00, 'B');
INSERT INTO `room` VALUES (9, 'reserved', 20.00, 'B');
INSERT INTO `room` VALUES (10, 'empty', 30.00, 'C');
INSERT INTO `room` VALUES (11, 'empty', 30.00, 'C');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `phonenum` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `identity` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (2, '1', NULL, '', '1');
INSERT INTO `user` VALUES (3, '1', '1', '1', 'e');
INSERT INTO `user` VALUES (4, '1', '1', '0', 'c');
INSERT INTO `user` VALUES (6, '2', '2', '1', 'e2');
INSERT INTO `user` VALUES (7, '4', '4', '0', 'm4');
INSERT INTO `user` VALUES (8, '4', '4', '', 'm4');
INSERT INTO `user` VALUES (9, '5', '5', '', 'm5');
INSERT INTO `user` VALUES (10, '6', '6', '', 'm6');
INSERT INTO `user` VALUES (11, '7', '7', '1', 'm7');
INSERT INTO `user` VALUES (13, '8', '8', '0', 'm8');
INSERT INTO `user` VALUES (16, '9', '9', '', 'm9');

-- ----------------------------
-- View structure for clean
-- ----------------------------
DROP VIEW IF EXISTS `clean`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `clean` AS select `order`.`oid` AS `oid`,`order`.`type` AS `type`,`order`.`cid` AS `cid`,`order`.`class` AS `class` from `order` where (`order`.`class` = 1);

-- ----------------------------
-- View structure for cleaner
-- ----------------------------
DROP VIEW IF EXISTS `cleaner`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `cleaner` AS select `employee`.`eid` AS `eid`,`employee`.`ename` AS `ename`,`employee`.`salary` AS `salary` from `employee` where (`employee`.`department` = '清洁工');

-- ----------------------------
-- View structure for cooker
-- ----------------------------
DROP VIEW IF EXISTS `cooker`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `cooker` AS select `employee`.`eid` AS `eid`,`employee`.`ename` AS `ename`,`employee`.`salary` AS `salary` from `employee` where (`employee`.`department` = '厨师');

-- ----------------------------
-- View structure for fix
-- ----------------------------
DROP VIEW IF EXISTS `fix`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `fix` AS select `order`.`oid` AS `oid`,`order`.`type` AS `type`,`order`.`cid` AS `cid`,`order`.`class` AS `class` from `order` where (`order`.`class` = 2);

-- ----------------------------
-- View structure for fixer
-- ----------------------------
DROP VIEW IF EXISTS `fixer`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `fixer` AS select `employee`.`eid` AS `eid`,`employee`.`ename` AS `ename`,`employee`.`salary` AS `salary` from `employee` where (`employee`.`department` = '维修工');

-- ----------------------------
-- View structure for food
-- ----------------------------
DROP VIEW IF EXISTS `food`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `food` AS select `order`.`oid` AS `oid`,`order`.`type` AS `type`,`order`.`cid` AS `cid`,`order`.`class` AS `class` from `order` where (`order`.`class` = 0);

-- ----------------------------
-- View structure for present_order_number
-- ----------------------------
DROP VIEW IF EXISTS `present_order_number`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `present_order_number` AS select `present_order`.`pid` AS `pid`,count(0) AS `present_number` from `present_order` group by `present_order`.`pid`;

-- ----------------------------
-- View structure for presentnum
-- ----------------------------
DROP VIEW IF EXISTS `presentnum`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `presentnum` AS select `present_order`.`pid` AS `pid`,count(0) AS `present_number` from `present_order` group by `present_order`.`pid`;

-- ----------------------------
-- View structure for restroom
-- ----------------------------
DROP VIEW IF EXISTS `restroom`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `restroom` AS select `room`.`rclass` AS `rclass`,count(0) AS `number` from `room` where (`room`.`status` = 'empty') group by `room`.`rclass`;

-- ----------------------------
-- Procedure structure for p1
-- ----------------------------
DROP PROCEDURE IF EXISTS `p1`;
delimiter ;;
CREATE PROCEDURE `p1`(IN `S_cname` varchar(255))
BEGIN
	#Routine body goes here...
DECLARE S_count int;
	select count(*) into S_count
	from reserve
	where mname=S_cname;
	IF S_count=0 THEN
	signal sqlstate 'ERROR' set message_text='没有这位会员';
	END IF;
	IF S_count >0 THEN
	select *
	from reserve
	where mname=S_cname;
	END IF;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for p2
-- ----------------------------
DROP PROCEDURE IF EXISTS `p2`;
delimiter ;;
CREATE PROCEDURE `p2`(IN `S_pname` varchar(255))
BEGIN
	#Routine body goes here...
select pnum
from present
where pname = S_pname;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for p3
-- ----------------------------
DROP PROCEDURE IF EXISTS `p3`;
delimiter ;;
CREATE PROCEDURE `p3`(IN `S_pid` int)
BEGIN
	#Routine body goes here...
select pnum
from present
where pid=S_pid;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for p4
-- ----------------------------
DROP PROCEDURE IF EXISTS `p4`;
delimiter ;;
CREATE PROCEDURE `p4`(OUT `maxnum` varchar(255))
BEGIN
	#Routine body goes here...
select pname 
from present
where pid IN(
	select pid
	from present_order_number
	where present_number IN(
				select max(present_number)
				from present_order_number));
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for p5
-- ----------------------------
DROP PROCEDURE IF EXISTS `p5`;
delimiter ;;
CREATE PROCEDURE `p5`(OUT `minnum` varchar(255))
BEGIN
	#Routine body goes here...
select pname 
from present
where pid IN(
	select pid
	from present_order_number
	where present_number IN(
				select min(present_number)
				from present_order_number));
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table customer
-- ----------------------------
DROP TRIGGER IF EXISTS `deletecustomer`;
delimiter ;;
CREATE TRIGGER `deletecustomer` AFTER DELETE ON `customer` FOR EACH ROW BEGIN
INSERT INTO customer_history
(phonenum,time,rid,mid,cname,cost)
VALUES
(old.phonenum,old.time,old.rid,old.mid,old.cname,old.cost);
UPDATE room
SET `status`='empty'
WHERE rid=old.rid;
DELETE FROM `order`
WHERE cid=old.cid;
IF old.mid =(SELECT mid FROM member WHERE mid=old.mid) THEN
UPDATE member
SET mcount=mcount+old.cost
WHERE mid=old.mid;
END IF;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table order
-- ----------------------------
DROP TRIGGER IF EXISTS `deleteorder`;
delimiter ;;
CREATE TRIGGER `deleteorder` AFTER DELETE ON `order` FOR EACH ROW BEGIN
INSERT INTO order_history
(oid,type,cid,class)
VALUES
(old.oid,old.type,old.cid,old.class);
IF old.class=0 THEN
UPDATE customer
SET cost=cost+10
WHERE cid=old.cid;
END IF;
IF old.class=1 THEN
UPDATE customer
SET cost=cost+5
WHERE cid=old.cid;
END IF;
IF old.class=2 THEN
UPDATE customer
SET cost=cost+7
WHERE cid=old.cid;
END IF;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table present_order
-- ----------------------------
DROP TRIGGER IF EXISTS `add_presentorder`;
delimiter ;;
CREATE TRIGGER `add_presentorder` BEFORE INSERT ON `present_order` FOR EACH ROW BEGIN
if(SELECT mcount FROM member WHERE mid=new.mid)<(SELECT pcount FROM present WHERE pid=new.pid)THEN
signal sqlstate 'ERROR' set message_text='积分不足';
END if;
if(SELECT `level` FROM member WHERE mid=new.mid)<(SELECT plevel FROM present WHERE pid=new.pid)THEN
signal sqlstate 'ERROR' set message_text='等级不足';
END if;
UPDATE present
SET pnum=pnum-1
WHERE pid=new.pid;
UPDATE member
SET mcount=mcount-(SELECT pcount FROM present WHERE pid=new.pid)
WHERE mid=new.mid;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table reserve
-- ----------------------------
DROP TRIGGER IF EXISTS `addreserve`;
delimiter ;;
CREATE TRIGGER `addreserve` BEFORE INSERT ON `reserve` FOR EACH ROW BEGIN
if (select `status` from room WHERE rid=new.rid)='inuse'
OR (select `status` from room WHERE rid=new.rid)='reserved' THEN
signal sqlstate 'ERROR' set message_text='房间不能被预定';
end IF;
IF (select `status` from room WHERE rid=new.rid)='empty' THEN
UPDATE room
SET `status`='reserved'
WHERE rid=new.rid;
end IF;
UPDATE member
SET mcount=mcount+5
WHERE mid=new.mid;
if (SELECT mcount FROM member WHERE mid=new.mid)>(SELECT `level` FROM member WHERE mid=new.mid)*20 THEN
UPDATE member
SET `level`=`level`+1 
WHERE mid=new.mid;
END IF;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table reserve
-- ----------------------------
DROP TRIGGER IF EXISTS `delete`;
delimiter ;;
CREATE TRIGGER `delete` AFTER DELETE ON `reserve` FOR EACH ROW BEGIN 
if old.mid=(SELECT mid FROM customer WHERE mid=old.mid) THEN
UPDATE customer
SET cost=old.time*(SELECT price FROM room WHERE rid=old.rid)
WHERE mid=old.mid;
UPDATE room
SET `status`='inuse'
WHERE rid=old.rid;
END IF;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table user
-- ----------------------------
DROP TRIGGER IF EXISTS `trigger_u`;
delimiter ;;
CREATE TRIGGER `trigger_u` BEFORE INSERT ON `user` FOR EACH ROW BEGIN 
IF new.identity=1 THEN 
INSERT INTO employee
(ename,epassword)
VALUES
(new.`name`,new.`password`);
END IF;
IF new.identity=0 THEN
INSERT INTO member
(mname,mpassword,phonenum,mcount,`level`)
VALUES
(new.name,new.`password`,new.phonenum,1,1);
END IF;
IF new.identity=NULL THEN
INSERT INTO member
(mname,mpassword,phonenum,mcount,`level`)
VALUES
(new.name,new.`password`,new.phonenum,1,1);
END IF;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
