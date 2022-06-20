#날짜 : 2022/06/20
#이름 : 안지훈
#내용 : SQL 연습문제

DROP TABLE `Orders`

#문제1
CREATE TABLE `Book` (
             `bookid`    INT PRIMARY KEY,
             `bookname`  VARCHAR(20),
             `publisher` VARCHAR(20),
             `price`     INT
                    );
                    
INSERT INTO `Book` VALUES (1, '축구의 역사',        '굿스포츠',   7000);
INSERT INTO `Book` VALUES (2, '축구아는 여자',      '나무수',     13000);
INSERT INTO `Book` VALUES (3, '축구의 이해',        '대한미디어', 22000);
INSERT INTO `Book` VALUES (4, '골프 바이블',        '대한미디어', 35000);
INSERT INTO `Book` VALUES (5, '피겨 교본',          '굿스포츠',   8000);
INSERT INTO `Book` VALUES (6, '역도 단계별기술',    '굿스포츠',   6000);
INSERT INTO `Book` VALUES (7, '야구의 추억',        '이상미디어', 20000);
INSERT INTO `Book` VALUES (8, '야구를 부탁해',      '이상미디어', 13000);
INSERT INTO `Book` VALUES (9, '올림픽 이야기',      '삼성당',     7500);
INSERT INTO `Book` VALUES (10, 'Olympic Champions', 'Pearson',    13000);

#문제2
CREATE TABLE `Customer` (
             `custid`  INT PRIMARY KEY AUTO_INCREMENT,
             `name`    VARCHAR(5),
             `address` VARCHAR(20),
             `phone`    VARCHAR(20) UNIQUE DEFAULT NULL
                    );
                    
INSERT INTO `Customer` VALUES ('1', '박지성', '영국 맨체스터',   '000-5000-0001')
INSERT INTO `Customer` VALUES ('2', '김연아', '대한민국 서울',   '000-6000-0001')
INSERT INTO `Customer` VALUES ('3', '장미란', '대한민국 강원도', '000-7000-0001')
INSERT INTO `Customer` VALUES ('4', '추신수', '미국 클리블랜드', '000-8000-0001')
INSERT INTO `Customer` (`custid`, `name`, `address`) VALUES ('5', '박세리', '대한민국 대전')

#문제3
CREATE TABLE `Orders` (
             `orderid`   INT PRIMARY KEY AUTO_INCREMENT,
             `custid`    INT,
             `bookid`    INT,
             `saleprice` INT,
             `orderdate` DATE
                       );

INSERT INTO `Orders` (`custid`, `bookid`, `saleprice`, `orderdate`) VALUES (1, 1,  6000,  '2014-07-01');
INSERT INTO `Orders` (`custid`, `bookid`, `saleprice`, `orderdate`) VALUES (1, 3,  21000, '2014-07-03');
INSERT INTO `Orders` (`custid`, `bookid`, `saleprice`, `orderdate`) VALUES (2, 5,  8000,  '2014-07-03');
INSERT INTO `Orders` (`custid`, `bookid`, `saleprice`, `orderdate`) VALUES (3, 6,  6000,  '2014-07-04');
INSERT INTO `Orders` (`custid`, `bookid`, `saleprice`, `orderdate`) VALUES (4, 7,  20000, '2014-07-05');
INSERT INTO `Orders` (`custid`, `bookid`, `saleprice`, `orderdate`) VALUES (1, 2,  12000, '2014-07-07');
INSERT INTO `Orders` (`custid`, `bookid`, `saleprice`, `orderdate`) VALUES (4, 8,  13000, '2014-07-07');
INSERT INTO `Orders` (`custid`, `bookid`, `saleprice`, `orderdate`) VALUES (3, 10, 12000, '2014-07-08');
INSERT INTO `Orders` (`custid`, `bookid`, `saleprice`, `orderdate`) VALUES (2, 10, 7000,  '2014-07-09');
INSERT INTO `Orders` (`custid`, `bookid`, `saleprice`, `orderdate`) VALUES (3, 8,  13000, '2014-07-10');

#문제4
SELECT `custid`, `name`, `address` 
FROM `Customer`;

#문제5
SELECT `bookname`, `price` 
FROM `Book`;

#문제6
SELECT `price`, `bookname`
FROM `Book`;

#문제7
SELECT `bookid`, `bookname`, `publisher`, `price`
FROM `Book`;

#문제8
SELECT `publisher`
FROM `Book`;

#문제9
SELECT DISTINCT `publisher`
FROM `Book`;

#문제10
SELECT `bookid`, `bookname`, `publisher`, `price`
FROM `Book`
WHERE 20000 <= `price`;

#문제11
SELECT `bookid`, `bookname`, `publisher`, `price`
FROM `Book`
WHERE 20000 > `price`;

#문제12
SELECT `bookid`, `bookname`, `publisher`, `price`
FROM `Book`
WHERE 20000 >= `price` AND `price` >= 10000;

#문제13
SELECT `bookid`, `bookname`, `price`
FROM `Book`
WHERE 30000 >= `price` AND `price` >= 15000;

#문제14
SELECT `bookid`, `bookname`, `publisher`, `price`
FROM `Book`
WHERE `bookid` = 2 OR `bookid` = 3 OR `bookid` = 5;

SELECT `bookid`, `bookname`, `publisher`, `price`
FROM `Book`
WHERE `bookid` IN(2, 3, 5);

#문제15
SELECT `bookid`, `bookname`, `publisher`, `price`
FROM `Book`
WHERE `bookid` % 2 = 0;

#문제16
SELECT `custid`, `name`, `address`, `phone`
FROM `Customer`
WHERE `name` LIKE '박%';

#문제17
SELECT `custid`, `name`, `address`, `phone`
FROM `Customer`
WHERE `address` LIKE '대%';

#문제18
SELECT `custid`, `name`, `address`, `phone`
FROM `Customer`
WHERE `phone` != 'NOT NULL';

SELECT `custid`, `name`, `address`, `phone`
FROM `Customer`
WHERE NOT `phone` IS NULL;

#문제19
SELECT `bookid`, `bookname`, `publisher`, `price`
FROM `Book`
WHERE `publisher` = '굿스포츠' or `publisher` = '대한미디어';
WHERE `publisher` IN('굿스포츠', '대한미디어');

#문제20
SELECT `publisher`
FROM `Book`
WHERE `bookname` = '축구의 역사';

#문제21
SELECT `publisher`
FROM `Book`
WHERE `bookname` LIKE '%축구%';

#문제22
SELECT `bookid`, `bookname`, `publisher`, `price`
FROM `Book`
WHERE `bookname` LIKE '_구%';

#문제23
SELECT `bookid`, `bookname`, `publisher`, `price`
FROM `Book`
WHERE `bookname` LIKE '%축구%' AND `price` >= 20000;

#문제24
SELECT `bookid`, `bookname`, `publisher`, `price`
FROM `Book`
ORDER BY `bookname` ASC;

#문제25
SELECT `bookid`, `bookname`, `publisher`, `price`
FROM `Book`
ORDER BY `price` ASC, `bookname` ASC;

#문제26
SELECT `bookid`, `bookname`, `publisher`, `price`
FROM `Book`
ORDER BY `price` DESC, `publisher` ASC;

#문제27
SELECT `bookid`, `bookname`, `publisher`, `price`
FROM `Book`
ORDER BY `price` DESC LIMIT 3;

#문제28
SELECT `bookid`, `bookname`, `publisher`, `price`
FROM `Book`
ORDER BY `price` ASC LIMIT 3;

#문제29
SELECT SUM(saleprice) AS `총판매액` FROM `Orders`;

#문제30
SELECT SUM(saleprice) AS `총판매액`, 
       AVG(saleprice) AS `평균값`,   
       MIN(saleprice) AS `최저가`,   
       MAX(saleprice) AS `최저가`
FROM `Orders`;
