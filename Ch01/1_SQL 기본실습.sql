#날짜 : 2022/06/13
#이름 : 안지훈
#내용 : SQL 기본실습

#실습하기 1-1
CREATE DATABASE `MyDB`;
DROP DATABASE `MYDB`;
#실습하기 1-2
CREATE TABLE `USER1` (
`UID` VARCHAR(10),
`NAME` VARCHAR(10),
`HP` CHAR(13),
`AGE` TINYINT
);

DROP TABLE `USER1`;

#실습하기 1-3
INSERT INTO `User1` VALUES ('A101', '김유신', '010-1234-1111', 25);
INSERT INTO `User1` VALUES ('A102', '김춘추', '010-1234-2222', 23);
INSERT INTO `User1` VALUES ('A103', '장보고', '010-1234-3333', 32);
INSERT INTO `User1` (`UID`, `NAME`, `AGE`)
             VALUES ('A104', '강감찬', 45);
         
INSERT INTO `User1` SET
                        `UID`  = 'A105',
                        `NAME` = '이순신',
                        `HP` = '010-1234-5555';
             
#실습하기 1-4
SELECT * FROM `User1`;
SELECT * FROM `User1` WHERE `UID` = 'A101';
SELECT * FROM `User1` WHERE `NAME` = '김춘추';
SELECT * FROM `User1` WHERE `AGE` > 30;
SELECT `UID`, `NAME`, `AGE` FROM `User1`;

#실습하기 1-5
UPDATE `User1` SET `HP` = '010-1234-4444' WHERE `UID` = 'A104';
UPDATE `User1` SET `AGE` = 51 WHERE `UID` = 'A105';
UPDATE `User1` SET `HP` = '010-1234-1001', `AGE` = 27 WHERE `UID` = 'A104';

#실습하기 1-6
DELETE FROM `User1` WHERE `UID`  = 'A101';
DELETE FROM `User1` WHERE `UID`  = 'A102' AND `AGE` = 25;
DELETE FROM `User1` WHERE `AGE` >= 30;
