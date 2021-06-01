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
CREATE TABLE exp_goods_asia(
    country VARCHAR2(10),
    seq     NUMBER,
    goods   VARCHAR2(80)
);

INSERT INTO exp_goods_asia VALUES ('�ѱ�', 1, '�������� ������');
INSERT INTO exp_goods_asia VALUES ('�ѱ�', 2, '�ڵ���');
INSERT INTO exp_goods_asia VALUES ('�ѱ�', 3, '��������ȸ��');
INSERT INTO exp_goods_asia VALUES ('�ѱ�', 4, '����');
INSERT INTO exp_goods_asia VALUES ('�ѱ�', 5, 'LCD');
INSERT INTO exp_goods_asia VALUES ('�ѱ�', 6, '�ڵ�����ǰ');
INSERT INTO exp_goods_asia VALUES ('�ѱ�', 7, '�޴���ȭ');
INSERT INTO exp_goods_asia VALUES ('�ѱ�', 8, 'ȯ��źȭ����');
INSERT INTO exp_goods_asia VALUES ('�ѱ�', 9, '�����۽ű� ���÷��� �μ�ǰ');
INSERT INTO exp_goods_asia VALUES ('�ѱ�', 10, 'ö �Ǵ� ���ձݰ�');

INSERT INTO exp_goods_asia VALUES ('�Ϻ�', 1, '�ڵ���');
INSERT INTO exp_goods_asia VALUES ('�Ϻ�', 2, '�ڵ�����ǰ');
INSERT INTO exp_goods_asia VALUES ('�Ϻ�', 3, '��������ȸ��');
INSERT INTO exp_goods_asia VALUES ('�Ϻ�', 4, '����');
INSERT INTO exp_goods_asia VALUES ('�Ϻ�', 5, '�ݵ�ü������');
INSERT INTO exp_goods_asia VALUES ('�Ϻ�', 6, 'ȭ����');
INSERT INTO exp_goods_asia VALUES ('�Ϻ�', 7, '�������� ������');
INSERT INTO exp_goods_asia VALUES ('�Ϻ�', 8, '�Ǽ����');
INSERT INTO exp_goods_asia VALUES ('�Ϻ�', 9, '���̿���, Ʈ��������');
INSERT INTO exp_goods_asia VALUES ('�Ϻ�', 10, '����');

COMMIT;

SELECT goods
FROM exp_goods_asia
WHERE country = '�ѱ�'
ORDER BY seq;

SELECT goods
FROM exp_goods_asia
WHERE country = '�Ϻ�'
ORDER BY seq;

-- union
SELECT goods
FROM exp_goods_asia
WHERE country = '�ѱ�'
UNION
SELECT goods
FROM exp_goods_asia
WHERE country = '�Ϻ�';

SELECT goods
FROM exp_goods_asia
WHERE country = '�ѱ�'
UNION ALL
SELECT goods
FROM exp_goods_asia
WHERE country = '�Ϻ�';

--intersect
SELECT goods
FROM exp_goods_asia
WHERE country = '�ѱ�'
INTERSECT
SELECT goods
FROM exp_goods_asia
WHERE country = '�Ϻ�';


--minus
SELECT goods
FROM exp_goods_asia
WHERE country = '�ѱ�'
MINUS
SELECT goods
FROM exp_goods_asia
WHERE country = '�Ϻ�';

SELECT goods
FROM exp_goods_asia
WHERE country = '�Ϻ�'
MINUS
SELECT goods
FROM exp_goods_asia
WHERE country = '�ѱ�';

--���տ������� ���ѻ���
--1. ���տ����ڷ� ����Ǵ� �� select���� select����Ʈ�� ������ ������ Ÿ���� ��ġ �ؾ� �Ѵ�.
SELECT goods -- 1��
FROM exp_goods_asia
WHERE country = '�ѱ�'
UNION
SELECT seq, goods -- 2��
FROM exp_goods_asia
WHERE country = '�Ϻ�';

SELECT seq, goods
FROM exp_goods_asia
WHERE country = '�ѱ�'
UNION
SELECT seq, goods
FROM exp_goods_asia
WHERE country = '�Ϻ�';

SELECT seq, goods
FROM exp_goods_asia
WHERE country = '�ѱ�'
INTERSECT
SELECT seq, goods
FROM exp_goods_asia
WHERE country = '�Ϻ�';

SELECT seq -- �ٸ�
FROM exp_goods_asia
WHERE country = '�ѱ�'
UNION
SELECT goods -- �ٸ�
FROM exp_goods_asia
WHERE country = '�Ϻ�';

--2. ���� �����ڷ� select���� �����Ҷ� order by���� �� ������ ���忡���� ����� �� �ִ�. �׿� 3,4�� å 141p  ����

SELECT  goods
FROM exp_goods_asia
WHERE country = '�ѱ�'
ORDER BY goods --����
UNION
SELECT  goods
FROM exp_goods_asia
WHERE country = '�Ϻ�';

SELECT goods
FROM exp_goods_asia
WHERE country = '�ѱ�'
UNION
SELECT  goods
FROM exp_goods_asia
WHERE country = '�Ϻ�'
ORDER BY goods;

--grouping sets
SELECT PERIOD, gubun, SUM(loan_jan_amt) totl_jan
FROM kor_loan_status
WHERE PERIOD LIKE '2013%'
GROUP BY GROUPING SETS(PERIOD, gubun);

SELECT PERIOD, gubun, region, SUM(loan_jan_amt) totl_jan
FROM kor_loan_status
WHERE PERIOD LIKE '2013%'
AND region IN ('����','���')
GROUP BY GROUPING SETS(PERIOD, (gubun,region));

-- �������� 174p

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
       CASE WHEN gubun = '���ô㺸����' THEN SUM(loan_jan_amt) ELSE 0 END ���ô㺸����� ,
       CASE WHEN gubun = '��Ÿ����' THEN SUM(loan_jan_amt) ELSE 0 END ��Ÿ�����
FROM kor_loan_status
WHERE PERIOD = '201311'
GROUP BY PERIOD, gubun;


SELECT PERIOD, CASE WHEN gubun = '���ô㺸����' THEN SUM(loan_jan_amt) ELSE 0 END ���ô㺸�����,
               CASE WHEN gubun = '��Ÿ����' THEN SUM(loan_jan_amt) ELSE 0 END ��Ÿ�����
FROM kor_loan_status
WHERE PERIOD = '201311' 
AND gubun = '��Ÿ����'
GROUP BY PERIOD, gubun
UNION
SELECT PERIOD, CASE WHEN gubun = '���ô㺸����' THEN SUM(loan_jan_amt) ELSE 0 END ���ô㺸�����,
               CASE WHEN gubun = '��Ÿ����' THEN SUM(loan_jan_amt) ELSE 0 END ��Ÿ�����
FROM kor_loan_status
WHERE PERIOD = '201311' 
AND gubun = '���ô㺸����'
GROUP BY PERIOD, gubun;




SELECT PERIOD,  SUM(loan_jan_amt) ���ô㺸�����,
                0 ��Ÿ�����
FROM kor_loan_status
WHERE PERIOD = '201311' 
AND gubun = '���ô㺸����'
GROUP BY PERIOD, gubun
UNION
SELECT PERIOD,  0 ���ô㺸�����, 
                SUM(loan_jan_amt) ��Ÿ�����  
FROM kor_loan_status
WHERE PERIOD = '201311' 
AND gubun = '��Ÿ����'
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




















