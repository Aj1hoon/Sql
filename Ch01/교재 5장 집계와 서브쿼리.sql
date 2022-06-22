#날짜 : 2022/06/21
#이름 : 안지훈
#내용 : 교재 5장 집계와 서브쿼리

###############################
#20강 행 개수 구하기
###############################
#테이블 생성/데이터 저장
CREATE TABLE `sample51` (
             `no`       INT,
             `name`     VARCHAR(20) DEFAULT NULL,
             `quantity` INT         DEFAULT NULL
);

INSERT INTO `sample51` (NO, NAME, quantity) VALUES (1, 'A', 1);
INSERT INTO `sample51` (NO, NAME, quantity) VALUES (2, 'A', 2);
INSERT INTO `sample51` (NO, NAME, quantity) VALUES (3, 'B', 10);
INSERT INTO `sample51` (NO, NAME, quantity) VALUES (4, 'C', 3);
INSERT INTO `sample51` (NO)                 VALUES (5);

DROP TABLE `sample51`;
SELECT * FROM `sample51`;

#p183
SELECT COUNT(*) FROM sample51;

#p185
SELECT * FROM sample51 WHERE NAME = 'A'; 
SELECT COUNT(*) FROM sample51 WHERE NAME = 'A';

#p186
SELECT * FROM `sample51`;

SELECT COUNT(NO),
       COUNT(NAME),
		 COUNT(quantity)
FROM sample51;

#p188
SELECT ALL NAME FROM sample51;
SELECT DISTINCT NAME FROM sample51;

#p189
SELECT COUNT(ALL NAME),
       COUNT(DISTINCT NAME) 
FROM sample51;

###############################
#21강 COUNT 이외의 집계함수
###############################
#p191
SELECT * FROM sample51;

SELECT
SUM(quantity)
FROM sample51;

#p192
SELECT
AVG(quantity)
FROM sample51;

SELECT
AVG(quantity) AS 'A.C', SUM(quantity)/COUNT(quantity) AS 'B.C'
FROM sample51;

#p193
SELECT
AVG(CASE WHEN quantity IS NULL THEN 0 ELSE quantity END) AS 'AVG(NULL = 0)'
FROM sample51;

SELECT
MIN(quantity),
MAX(quantity),
MIN(name),
MAX(name)
FROM sample51;

###############################
#22강 그룹화-GROUP BY
###############################
#p195
SELECT * FROM sample51;

SELECT NAME
FROM sample51
GROUP BY NAME;

#p197
SELECT NAME,
COUNT(NAME),
SUM(quantity)
FROM sample51
GROUP BY NAME;

#p199
SELECT NAME,
COUNT(NAME)
FROM sample51
GROUP BY NAME;

SELECT NAME,
COUNT(NAME)
FROM sample51
GROUP BY NAME
HAVING COUNT(NAME) = 1;

SELECT NO, NAME
FROM sample51
GROUP BY NO, NAME;

#p202
SELECT NAME,
COUNT(NAME),
SUM(quantity)
FROM sample51
GROUP BY NAME
ORDER BY SUM(quantity) DESC;

###############################
#23강 서브쿼리
###############################
#테이블 생성/데이터 저장
CREATE TABLE `sample54` (
             `no` INT,
             `a`  INT
);

INSERT INTO `sample54` (NO, a) VALUES (1, 100);
INSERT INTO `sample54` (NO, a) VALUES (2, 900);
INSERT INTO `sample54` (NO, a) VALUES (3, 20);
INSERT INTO `sample54` (NO, a) VALUES (4, 80);

SELECT * FROM sample54;
DROP TABLE `sample54`;

#p205
SELECT
MIN(a)
FROM sample54;

#p206
DELETE
FROM sample54
WHERE a = (SELECT MIN(a) FROM sample54);

#p207
SELECT MIN(a) FROM sample54;

SELECT `no` FROM sample54;

SELECT MIN(a),
       MAX(no)
FROM sample54;

SELECT no, a
FROM sample54;

SELECT 
COUNT(*) 
FROM sample51

#p210
SELECT
      (SELECT COUNT(*) FROM sample51) AS sq1,
      (SELECT COUNT(*) FROM sample54) AS sq2;
      
#p211
UPDATE sample54 SET a = (SELECT MAX(a) FROM sample54);

SELECT * FROM sample54;
UPDATE sample54 SET NO = 1, a = 100;
UPDATE sample54 SET NO = 2, a = 900;
UPDATE sample54 SET NO = 3, a = 20;
UPDATE sample54 SET NO = 4, a = 80;

#p212
SELECT * FROM (SELECT * FROM sample54) AS sq;

#p213
SELECT * FROM (SELECT * FROM ( SELECT * FROM sample54) AS sq)AS sqq;

#테이블 생성/데이터 저장
CREATE TABLE `sample541` (
             `a` INT,
             `b` INT
);

INSERT INTO `sample541` (a, b) VALUES (5, 3);
INSERT INTO `sample541` (a, b) VALUES (2, 900);
INSERT INTO `sample541` (a, b) VALUES (3, 20);
INSERT INTO `sample541` (a, b) VALUES (4, 80);

SELECT * FROM sample541;
DROP TABLE `sample541`;

#p214
INSERT INTO sample541 VALUES (
(SELECT COUNT(*) FROM sample51),
(SELECT COUNT(*) FROM sample54)
);

SELECT * FROM sample541;

#p215
INSERT INTO sample541 SELECT 1, 2;

INSERT INTO sample541
SELECT * FROM sample541;

###############################
#24강 상관 서브쿼리
###############################
#테이블 생성/데이터 저장
CREATE TABLE `sample551` (
             `no` INT,
             `a`  VARCHAR(25) DEFAULT NULL
);

INSERT INTO `sample551` (no) VALUES (1);
INSERT INTO `sample551` (no) VALUES (2);
INSERT INTO `sample551` (no) VALUES (3);
INSERT INTO `sample551` (no) VALUES (4);
INSERT INTO `sample551` (no) VALUES (5);

SELECT * FROM `sample551`;

#-#

CREATE TABLE `sample552` (
             `no2` INT
);

INSERT INTO `sample552` (NO2) VALUES (3);
INSERT INTO `sample552` (NO2) VALUES (5);

SELECT * FROM `sample552`;

#p218
UPDATE sample551 SET a = '있음' WHERE
EXISTS (SELECT * FROM sample552 WHERE `no2` = `no`);

SELECT * FROM `sample551`;

#p219
UPDATE sample551 SET a = '없음' WHERE
NOT EXISTS (SELECT * FROM sample552 WHERE `no2` = `no`);

SELECT * FROM `sample551`;

#p221
UPDATE sample551 SET a = '있음' WHERE
EXISTS (SELECT * FROM sample552 WHERE sample552.no2 = sample551.no);

#p222
SELECT * FROM sample551 WHERE `no` IN (3, 5)
SELECT * FROM sample551 WHERE `no` IN (SELECT `no2` FROM `sample552`);