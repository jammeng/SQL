-- �⺻ ���� �Լ�     -152p
    
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

-- ���� ������   163p

--union
create table exp_goods_asia(
    country VARCHAR2(10),
    seq     NUMBER,
    goods   VARCHAR2(80)
);

insert into exp_goods_asia values ('�ѱ�', 1, '�������� ������');
insert into exp_goods_asia values ('�ѱ�', 2, '�ڵ���');
insert into exp_goods_asia values ('�ѱ�', 3, '��������ȸ��');
insert into exp_goods_asia values ('�ѱ�', 4, '����');
insert into exp_goods_asia values ('�ѱ�', 5, 'LCD');
insert into exp_goods_asia values ('�ѱ�', 6, '�ڵ�����ǰ');
insert into exp_goods_asia values ('�ѱ�', 7, '�޴���ȭ');
insert into exp_goods_asia values ('�ѱ�', 8, 'ȯ��źȭ����');
insert into exp_goods_asia values ('�ѱ�', 9, '�����۽ű� ���÷��� �μ�ǰ');
insert into exp_goods_asia values ('�ѱ�', 10, 'ö �Ǵ� ���ձݰ�');

insert into exp_goods_asia values ('�Ϻ�', 1, '�ڵ���');
insert into exp_goods_asia values ('�Ϻ�', 2, '�ڵ�����ǰ');
insert into exp_goods_asia values ('�Ϻ�', 3, '��������ȸ��');
insert into exp_goods_asia values ('�Ϻ�', 4, '����');
insert into exp_goods_asia values ('�Ϻ�', 5, '�ݵ�ü������');
insert into exp_goods_asia values ('�Ϻ�', 6, 'ȭ����');
insert into exp_goods_asia values ('�Ϻ�', 7, '�������� ������');
insert into exp_goods_asia values ('�Ϻ�', 8, '�Ǽ����');
insert into exp_goods_asia values ('�Ϻ�', 9, '���̿���, Ʈ��������');
insert into exp_goods_asia values ('�Ϻ�', 10, '����');

commit;

select goods
from exp_goods_asia
where country = '�ѱ�'
order by seq;

select goods
from exp_goods_asia
where country = '�Ϻ�'
order by seq;

-- union
select goods
from exp_goods_asia
where country = '�ѱ�'
union
select goods
from exp_goods_asia
where country = '�Ϻ�';

select goods
from exp_goods_asia
where country = '�ѱ�'
union all
select goods
from exp_goods_asia
where country = '�Ϻ�';

--intersect
select goods
from exp_goods_asia
where country = '�ѱ�'
intersect
select goods
from exp_goods_asia
where country = '�Ϻ�';


--minus
select goods
from exp_goods_asia
where country = '�ѱ�'
minus
select goods
from exp_goods_asia
where country = '�Ϻ�';

select goods
from exp_goods_asia
where country = '�Ϻ�'
minus
select goods
from exp_goods_asia
where country = '�ѱ�';

--���տ������� ���ѻ���
--1. ���տ����ڷ� ����Ǵ� �� select���� select����Ʈ�� ������ ������ Ÿ���� ��ġ �ؾ� �Ѵ�.
select goods -- 1��
from exp_goods_asia
where country = '�ѱ�'
union
select seq, goods -- 2��
from exp_goods_asia
where country = '�Ϻ�';

select seq, goods
from exp_goods_asia
where country = '�ѱ�'
union
select seq, goods
from exp_goods_asia
where country = '�Ϻ�';

select seq, goods
from exp_goods_asia
where country = '�ѱ�'
intersect
select seq, goods
from exp_goods_asia
where country = '�Ϻ�';

select seq -- �ٸ�
from exp_goods_asia
where country = '�ѱ�'
union
select goods -- �ٸ�
from exp_goods_asia
where country = '�Ϻ�';

--2. ���� �����ڷ� select���� �����Ҷ� order by���� �� ������ ���忡���� ����� �� �ִ�. �׿� 3,4�� å 141p  ����

select  goods
from exp_goods_asia
where country = '�ѱ�'
order by goods --����
union
select  goods
from exp_goods_asia
where country = '�Ϻ�';

select goods
from exp_goods_asia
where country = '�ѱ�'
union
select  goods
from exp_goods_asia
where country = '�Ϻ�'
order by goods;

-- �������� 174p

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


