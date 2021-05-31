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
create table exp_goods_asia(
    country VARCHAR2(10),
    seq     NUMBER,
    goods   VARCHAR2(80)
);

insert into exp_goods_asia values ('한국', 1, '원유제외 석유류');
insert into exp_goods_asia values ('한국', 2, '자동차');
insert into exp_goods_asia values ('한국', 3, '전자집적회로');
insert into exp_goods_asia values ('한국', 4, '선박');
insert into exp_goods_asia values ('한국', 5, 'LCD');
insert into exp_goods_asia values ('한국', 6, '자동차부품');
insert into exp_goods_asia values ('한국', 7, '휴대전화');
insert into exp_goods_asia values ('한국', 8, '환식탄화수소');
insert into exp_goods_asia values ('한국', 9, '무선송신기 디스플레이 부속품');
insert into exp_goods_asia values ('한국', 10, '철 또는 비합금강');

insert into exp_goods_asia values ('일본', 1, '자동차');
insert into exp_goods_asia values ('일본', 2, '자동차부품');
insert into exp_goods_asia values ('일본', 3, '전자집적회로');
insert into exp_goods_asia values ('일본', 4, '선박');
insert into exp_goods_asia values ('일본', 5, '반도체웨이퍼');
insert into exp_goods_asia values ('일본', 6, '화물차');
insert into exp_goods_asia values ('일본', 7, '원유제외 석유류');
insert into exp_goods_asia values ('일본', 8, '건설기계');
insert into exp_goods_asia values ('일본', 9, '다이오드, 트렌지스터');
insert into exp_goods_asia values ('일본', 10, '기계류');

commit;

select goods
from exp_goods_asia
where country = '한국'
order by seq;

select goods
from exp_goods_asia
where country = '일본'
order by seq;

-- union
select goods
from exp_goods_asia
where country = '한국'
union
select goods
from exp_goods_asia
where country = '일본';

select goods
from exp_goods_asia
where country = '한국'
union all
select goods
from exp_goods_asia
where country = '일본';

--intersect
select goods
from exp_goods_asia
where country = '한국'
intersect
select goods
from exp_goods_asia
where country = '일본';


--minus
select goods
from exp_goods_asia
where country = '한국'
minus
select goods
from exp_goods_asia
where country = '일본';

select goods
from exp_goods_asia
where country = '일본'
minus
select goods
from exp_goods_asia
where country = '한국';

--집합연산자의 제한사항
--1. 집합연산자로 연결되는 각 select문의 select리스트의 개수와 데이터 타입은 일치 해야 한다.
select goods -- 1개
from exp_goods_asia
where country = '한국'
union
select seq, goods -- 2개
from exp_goods_asia
where country = '일본';

select seq, goods
from exp_goods_asia
where country = '한국'
union
select seq, goods
from exp_goods_asia
where country = '일본';

select seq, goods
from exp_goods_asia
where country = '한국'
intersect
select seq, goods
from exp_goods_asia
where country = '일본';

select seq -- 다름
from exp_goods_asia
where country = '한국'
union
select goods -- 다름
from exp_goods_asia
where country = '일본';

--2. 집합 연산자로 select문을 연결할때 order by절은 맨 마지막 문장에서만 사용할 수 있다. 그외 3,4는 책 141p  참조

select  goods
from exp_goods_asia
where country = '한국'
order by goods --오류
union
select  goods
from exp_goods_asia
where country = '일본';

select goods
from exp_goods_asia
where country = '한국'
union
select  goods
from exp_goods_asia
where country = '일본'
order by goods;

-- 연습문제 174p

--1 
SELECT to_char(hire_date, 'yyyy') as hire_year, COUNT(*)
FROM employees
GROUP BY to_char(hire_date, 'yyyy')
ORDER BY 1;

--2 
select period, region, SUM(loan_jan_amt) as totl_jan
from kor_loan_status
where period  Like '2012%'
group by ROLLUP(period, region);

--3

select period, gubun, SUM(loan_jan_amt) as totl_jan
from kor_loan_status
where period LIKE '2013%'
group by period, ROLLUP(gubun);

select period, gubun, SUM(loan_jan_amt) as totl_jan
from kor_loan_status
where period LIKE '2013%'
group by period, gubun
union
select period,'', SUM(loan_jan_amt) as totl_jan
from kor_loan_status
where period LIKE '2013%'
group by period;


