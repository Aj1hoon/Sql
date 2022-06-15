#날짜 : 2022/06/15
#이름 : 안지훈
#내용 : 교재 2장 테이블에서 데이터 검색

# 테이블 생성
CREATE TABLE `SAMPLE21` (
             `NO`       INT AUTO_INCREMENT PRIMARY KEY,
             `NAME`     VARCHAR(10),
             `BIRTHDAY` CHAR(10),
             `ADDRESS`  VARCHAR(255)
                        );
                        
# 데이터 저장
INSERT INTO `SAMPLE21` (`NAME`, `BIRTHDAY`, `ADDRESS`) VALUES ('박준용', '1976-10-18', '대구광역시 수성구');
INSERT INTO `SAMPLE21` (`NAME`, `ADDRESS`) VALUES ('김재진', '대구광역시 동구');
INSERT INTO `SAMPLE21` (`NAME`, `ADDRESS`) VALUES ('홍길동', '서울특별시 마포구');

#P53
SELECT * FROM `sample21`;

#P62
DESC `sample21`;

#P66
SELECT NO, NAME FROM sample21;

#P68
SELECT * FROM sample21 WHERE NO = 2;
SELECT NO, NAME FROM sample21 WHERE NO = 2;

#P70
SELECT * FROM sample21 WHERE NO <> 2;

#P71
SELECT * FROM sample21 WHERE NAME = '박준용';
SELECT * FROM sample21 WHERE birthday = '1976-10-18';

#P73
SELECT * FROM sample21 WHERE birthday IS NULL;

# 테이블 생성 / 데이터 저장
CREATE TABLE `sample24` (
             `no` INT AUTO_INCREMENT PRIMARY KEY,
             `a`  INT,
             `b`  INT,
             `c`  INT
                        );
                        
INSERT INTO sample24 (`a`, `b`, `c`) VALUES (1, 0, 0);
INSERT INTO sample24 (`a`, `b`, `c`) VALUES (0, 1, 0);
INSERT INTO sample24 (`a`, `b`, `c`) VALUES (0, 0, 1);
INSERT INTO sample24 (`a`, `b`, `c`) VALUES (2, 2, 0);
INSERT INTO sample24 (`a`, `b`, `c`) VALUES (0, 2, 2);

#P77
SELECT * FROM sample24 WHERE a <> 0 AND b <> 0;

#P78
SELECT * FROM sample24 WHERE a <> 0 OR b <> 0;

#P80
SELECT * FROM sample24 WHERE a = 1 OR a = 2 AND b = 1 OR b = 2;
SELECT * FROM sample24 WHERE (a = 1 OR a = 2) AND (b = 1 OR b = 2);

#P82
SELECT * FROM sample24 WHERE NOT(a <> 0 OR b <> 0);

# 테이블 생성 / 데이터 저장
CREATE TABLE `sample25` (
             `no`   INT AUTO_INCREMENT PRIMARY KEY,
             `text` VARCHAR(255)
                        );
                        
INSERT INTO sample25 (`text`) VALUE ('SQL은 RDBMS를 조작하는 언어이다');
INSERT INTO sample25 (`text`) VALUE ('LIKE에서는 메타문자 %와 _를 사용할 수 있다');
INSERT INTO sample25 (`text`) VALUE ('LIKE는 SQL에서 사용할 수 있는 술어 중 하나이다');

#P85
SELECT * FROM sample25 WHERE TEXT LIKE 'SQL%';

#P86
SELECT * FROM sample25 WHERE TEXT LIKE '%SQL%';

#P88
SELECT * FROM sample25 WHERE TEXT LIKE '%\%%';