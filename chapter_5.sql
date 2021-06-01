-- 기본 집계 함수     -152p
    
-- count    -152p

select count(*)
from employees;

select count(employee_id)
from employees;

select count(department_id)
from employees;

select count(distinct department_id)
from employees;

select distinct department_id
from employees
order by 1;

-- sum

select sum(salary)
from employees;

select sum(salary), sum(distinct salary)
from employees;

--avg
select avg(salary), avg(distinct salary)
from employees;

--min, max
select min(salary), max(salary)
from employees;

select min(distinct salary), max(distinct salary)
from employees;


--variance stddev 
SELECT VARIANCE(salary), STDDEV(salary)
    FROM employees;
    
SELECT department_id, SUM(salary)
    FROM employees
    GROUP BY department_id
    ORDER BY department_id;
    
SELECT *
    FROM kor_loan_status;
    
SELECT period, region, SUM(loan_jan_amt) totl_jan
FROM kor_loan_status
WHERE period LIKE '2013%'
GROUP BY period, region
ORDER BY period, region;


SELECT  period, region, SUM(loan_jan_amt) totl_jan
FROM    kor_loan_status
WHERE   period = '201311'
GROUP BY region
ORDER BY region;

SELECT  period, region, SUM(loan_jan_amt) totl_jan
FROM    kor_loan_status
WHERE   period = '201310'
GROUP BY period, region
HAVING SUM(loan_jan_amt) <20000
ORDER BY totl_jan ASC ;

--rollup, cube  158p
SELECT period, gubun, SUM(loan_jan_amt) totl_jan
FROM kor_loan_status
WHERE period LIKE '2013%'
GROUP BY period, gubun
ORDER BY period;

SELECT  period, gubun, SUM(loan_jan_amt) totl_jam
FROM    kor_loan_status
WHERE   PERIOD like '2013%'
GROUP   BY ROLLUP(period, gubun);

SELECT  period, gubun, SUM(loan_jan_amt) totl_jam
FROM    kor_loan_status
WHERE   PERIOD like '2013%'
GROUP   BY ROLLUP(period), gubun;

SELECT  period, gubun, SUM(loan_jan_amt) totl_jam
FROM    kor_loan_status
WHERE   PERIOD like '2013%'
GROUP   BY CUBE(period, gubun);

SELECT  period, gubun, SUM(loan_jan_amt) totl_jam
FROM    kor_loan_status
WHERE   PERIOD like '2013%'
GROUP   BY period, CUBE(gubun);

-- 집합 연산자   163p

--union
CREATE TABLE exp_goods_asia(
    country VARCHAR2(10),
    seq     NUMBER,
    goods   VARCHAR2(80)
);

INSERT INTO exp_goods_asia VALUES ('한국', 1, '원유제외 석유류');
INSERT INTO exp_goods_asia VALUES ('한국', 2, '자동차');
INSERT INTO exp_goods_asia VALUES ('한국', 3, '전자집적회로');
INSERT INTO exp_goods_asia VALUES ('한국', 4, '선박');
INSERT INTO exp_goods_asia VALUES ('한국', 5, 'LCD');
INSERT INTO exp_goods_asia VALUES ('한국', 6, '자동차부품');
INSERT INTO exp_goods_asia VALUES ('한국', 7, '휴대전화');
INSERT INTO exp_goods_asia VALUES ('한국', 8, '환식탄화수소');
INSERT INTO exp_goods_asia VALUES ('한국', 9, '무선송신기 디스플레이 부속품');
INSERT INTO exp_goods_asia VALUES ('한국', 10, '철 또는 비합금강');

INSERT INTO exp_goods_asia VALUES ('일본', 1, '자동차');
INSERT INTO exp_goods_asia VALUES ('일본', 2, '자동차부품');
INSERT INTO exp_goods_asia VALUES ('일본', 3, '전자집적회로');
INSERT INTO exp_goods_asia VALUES ('일본', 4, '선박');
INSERT INTO exp_goods_asia VALUES ('일본', 5, '반도체웨이퍼');
INSERT INTO exp_goods_asia VALUES ('일본', 6, '화물차');
INSERT INTO exp_goods_asia VALUES ('일본', 7, '원유제외 석유류');
INSERT INTO exp_goods_asia VALUES ('일본', 8, '건설기계');
INSERT INTO exp_goods_asia VALUES ('일본', 9, '다이오드, 트렌지스터');
INSERT INTO exp_goods_asia VALUES ('일본', 10, '기계류');

COMMIT;

SELECT goods
FROM exp_goods_asia
WHERE country = '한국'
ORDER BY seq;

SELECT goods
FROM exp_goods_asia
WHERE country = '일본'
ORDER BY seq;

-- union
SELECT goods
FROM exp_goods_asia
WHERE country = '한국'
UNION
SELECT goods
FROM exp_goods_asia
WHERE country = '일본';

SELECT goods
FROM exp_goods_asia
WHERE country = '한국'
UNION ALL
SELECT goods
FROM exp_goods_asia
WHERE country = '일본';

--intersect
SELECT goods
FROM exp_goods_asia
WHERE country = '한국'
INTERSECT
SELECT goods
FROM exp_goods_asia
WHERE country = '일본';


--minus
SELECT goods
FROM exp_goods_asia
WHERE country = '한국'
MINUS
SELECT goods
FROM exp_goods_asia
WHERE country = '일본';

SELECT goods
FROM exp_goods_asia
WHERE country = '일본'
MINUS
SELECT goods
FROM exp_goods_asia
WHERE country = '한국';

--집합연산자의 제한사항
--1. 집합연산자로 연결되는 각 select문의 select리스트의 개수와 데이터 타입은 일치 해야 한다.
SELECT goods -- 1개
FROM exp_goods_asia
WHERE country = '한국'
UNION
SELECT seq, goods -- 2개
FROM exp_goods_asia
WHERE country = '일본';

SELECT seq, goods
FROM exp_goods_asia
WHERE country = '한국'
UNION
SELECT seq, goods
FROM exp_goods_asia
WHERE country = '일본';

SELECT seq, goods
FROM exp_goods_asia
WHERE country = '한국'
INTERSECT
SELECT seq, goods
FROM exp_goods_asia
WHERE country = '일본';

SELECT seq -- 다름
FROM exp_goods_asia
WHERE country = '한국'
UNION
SELECT goods -- 다름
FROM exp_goods_asia
WHERE country = '일본';

--2. 집합 연산자로 select문을 연결할때 order by절은 맨 마지막 문장에서만 사용할 수 있다. 그외 3,4는 책 141p  참조

SELECT  goods
FROM exp_goods_asia
WHERE country = '한국'
ORDER BY goods --오류
UNION
SELECT  goods
FROM exp_goods_asia
WHERE country = '일본';

SELECT goods
FROM exp_goods_asia
WHERE country = '한국'
UNION
SELECT  goods
FROM exp_goods_asia
WHERE country = '일본'
ORDER BY goods;

--grouping sets
SELECT PERIOD, gubun, SUM(loan_jan_amt) totl_jan
FROM kor_loan_status
WHERE PERIOD LIKE '2013%'
GROUP BY GROUPING SETS(PERIOD, gubun);

SELECT PERIOD, gubun, region, SUM(loan_jan_amt) totl_jan
FROM kor_loan_status
WHERE PERIOD LIKE '2013%'
AND region IN ('서울','경기')
GROUP BY GROUPING SETS(PERIOD, (gubun,region));

-- 연습문제 174p

--1 
SELECT to_char(hire_date, 'yyyy') AS hire_year, COUNT(*)
FROM employees
GROUP BY to_char(hire_date, 'yyyy')
ORDER BY 1;

--2 
SELECT PERIOD, region, SUM(loan_jan_amt) AS totl_jan
FROM kor_loan_status
WHERE PERIOD  LIKE '2012%'
GROUP BY ROLLUP(PERIOD, region);

--3

SELECT PERIOD, gubun, SUM(loan_jan_amt) AS totl_jan
FROM kor_loan_status
WHERE PERIOD LIKE '2013%'
GROUP BY PERIOD, ROLLUP(gubun);

SELECT PERIOD, gubun, SUM(loan_jan_amt) AS totl_jan
FROM kor_loan_status
WHERE PERIOD LIKE '2013%'
GROUP BY PERIOD, gubun
UNION
SELECT PERIOD,'', SUM(loan_jan_amt) AS totl_jan
FROM kor_loan_status
WHERE PERIOD LIKE '2013%'
GROUP BY PERIOD;

--4
SELECT PERIOD,
       CASE WHEN gubun = '주택담보대출' THEN SUM(loan_jan_amt) ELSE 0 END 주택담보대출액 ,
       CASE WHEN gubun = '기타대출' THEN SUM(loan_jan_amt) ELSE 0 END 기타대출액
FROM kor_loan_status
WHERE PERIOD = '201311'
GROUP BY PERIOD, gubun;


SELECT PERIOD, CASE WHEN gubun = '주택담보대출' THEN SUM(loan_jan_amt) ELSE 0 END 주택담보대출액,
               CASE WHEN gubun = '기타대출' THEN SUM(loan_jan_amt) ELSE 0 END 기타대출액
FROM kor_loan_status
WHERE PERIOD = '201311' 
AND gubun = '기타대출'
GROUP BY PERIOD, gubun
UNION
SELECT PERIOD, CASE WHEN gubun = '주택담보대출' THEN SUM(loan_jan_amt) ELSE 0 END 주택담보대출액,
               CASE WHEN gubun = '기타대출' THEN SUM(loan_jan_amt) ELSE 0 END 기타대출액
FROM kor_loan_status
WHERE PERIOD = '201311' 
AND gubun = '주택담보대출'
GROUP BY PERIOD, gubun;




SELECT PERIOD,  SUM(loan_jan_amt) 주택담보대출액,
                0 기타대출액
FROM kor_loan_status
WHERE PERIOD = '201311' 
AND gubun = '주택담보대출'
GROUP BY PERIOD, gubun
UNION
SELECT PERIOD,  0 주택담보대출액, 
                SUM(loan_jan_amt) 기타대출액  
FROM kor_loan_status
WHERE PERIOD = '201311' 
AND gubun = '기타대출'
GROUP BY PERIOD, gubun;



--5 
select region,
        case when period = '201111' then loan_jan_amt else 0 end amt1,
        case when period = '201112' then loan_jan_amt else 0 end amt2,
        case when period = '201210' then loan_jan_amt else 0 end amt3,
        case when period = '201211' then loan_jan_amt else 0 end amt4,
        case when period = '201212' then loan_jan_amt else 0 end amt5,
        case when period = '201310' then loan_jan_amt else 0 end amt6,
        case when period = '201311' then loan_jan_amt else 0 end amt7
from kor_loan_status;


SELECT region,
       SUM(amt1) "201111",
       SUM(amt2) "201112",
       SUM(amt3) "201210",
       SUM(amt4) "201211",
       SUM(amt5) "201212",
       SUM(amt6) "201310",
       SUM(amt7) "201311"  
FROM (
     SELECT region,
             CASE WHEN PERIOD = '201111' THEN loan_jan_amt ELSE 0 END amt1,
             CASE WHEN PERIOD = '201112' THEN loan_jan_amt ELSE 0 END amt2,
             CASE WHEN PERIOD = '201210' THEN loan_jan_amt ELSE 0 END amt3,
             CASE WHEN PERIOD = '201211' THEN loan_jan_amt ELSE 0 END amt4,
             CASE WHEN PERIOD = '201212' THEN loan_jan_amt ELSE 0 END amt5,
             CASE WHEN PERIOD = '201310' THEN loan_jan_amt ELSE 0 END amt6,
             CASE WHEN PERIOD = '201311' THEN loan_jan_amt ELSE 0 END amt7
     FROM kor_loan_status
     )
GROUP BY region
order by region;




















