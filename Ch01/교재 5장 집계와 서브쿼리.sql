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
#p192
#p193

###############################
#22강 그룹화-GROUP BY
###############################
#p195
#p197
#p199
#p202

###############################
#23강 서브쿼리
###############################
#테이블 생성/데이터 저장
CREATE TABLE `sample54` ();
#p205
#p206
#p207
#p208
#p210
#p211
#p212
#p213

#테이블 생성/데이터 저장
CREATE TABLE `sample541` ();
#p214
#p215

###############################
#24강 상관 서브쿼리
###############################
#테이블 생성/데이터 저장
CREATE TABLE `sample551` ();
CREATE TABLE `sample552` ();
#p217
#p218
#p219
#p221
#p222