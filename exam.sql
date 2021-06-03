CREATE TABLE PRODUCT(
    PRODUCT_ID      NUMBER(12,0) PRIMARY KEY,
    PRODUCT_NAME    VARCHAR2(8 BYTE),
    QUANTITY        NUMBER(10,0)default 0,
    ORDER_DATE      DATE,
    ORDER_MODE      VARCHAR2(8 BYTE),
    DESCRIPTION     VARCHAR2(20 BYTE),
    STANDARD_COST   NUMBER(4,0),
    LIST_PRICE      NUMBER(8,2) default 0,
    CATEGORY_ID     NUMBER(6,0),
    PROMOTION_ID    NUMBER(6,0),
    constraints mode1 CHECK ( order_mode IN ( 'direct', 'online' ) )
);

--2
CREATE TABLE exam2_1(
    employee_id     NUMBER(6),
    emp_name        VARCHAR2(80),
    salary          NUMBER(8,2),
    manager_id      NUMBER(6)
);

--3
Insert INTO exam2_1 
SELECT employee_id, emp_name, salary, manager_id
FROM employees E
WHERE E.manager_id = 147 AND (6000 <= E.salary AND E.salary <= 7000);

--select *
--from exam2_1;

CREATE TABLE exam2_2(
    employee_id     NUMBER,
    bonus_amt       NUMBER DEFAULT 0
);
drop table exam2_2;
INSERT Into exam2_2(employee_id)
SELECT e.employee_id
FROM employees e, sales s
WHERE e.employee_id = s.employee_id
AND s.SALES_MONTH BETWEEN '200010' AND '200012'
Group By e.employee_id;

COMMIT;
SELECT * FROM exam2_2;

MERGE INTO exam2_2 A
USING(SELECT employee_id, salary, manager_id
      FROM employees 
      WHERE manager_id = 146) E
ON(A.employee_id = E.employee_id)
WHEN MATCHED THEN
UPDATE SET A.bonus_amt = A.bonus_amt + E.salary * .05
WHEN NOT MATCHED THEN
INSERT (A.employee_id , A.bonus_amt) VALUES (E.employee_id, E.salary * .02);

--6
select employee_id, emp_name
from employees
where department_id is null;

select employee_id, salary
from employees
--where salary BETWEEN 4500 AND 5000
where 4500<=salary AND salary <=5000
order by employee_id;

--0601

--1
SELECT REPLACE(LPAD(SUBSTR(phone_number, 4), 14, '(031)'), '.', '-') 
FROM employees;

select SUBSTR(phone_number, 5) from employees;

--2
SELECT employee_id 사원번호, emp_name 사원명 , hire_date 입사일자, round((sysdate - hire_date)/365) 근속년수 
FROM employees
WHERE round((sysdate - hire_date)/365) >= 22
ORDER BY 근속년수;

--3
SELECT cust_name, TRANSLATE(cust_main_phone_number, '0123456789-', 'abcdefghijk')
FROM customers
ORDER BY cust_name;

--4
CREATE TABLE exam3(
	NAME VARCHAR2(100),
	new_phone_number    VARCHAR2(25)
);

--5
INSERT INTO exam3(NAME, new_phone_number)
SELECT cust_name, 
       TRANSLATE(cust_main_phone_number, '0123456789-', 'abcdefghijk')
FROM customers;

--6
SELECT NAME, TRANSLATE(new_phone_number, 'abcdefghijk', '0123456789-')
FROM exam3;

--7
SELECT cust_name, cust_year_of_birth, 
  CASE WHEN 1950<= cust_year_of_birth AND cust_year_of_birth <1960 THEN '1950년대'
       WHEN 1960<= cust_year_of_birth AND cust_year_of_birth <1970 THEN '1960년대'
       WHEN 1970<= cust_year_of_birth AND cust_year_of_birth <1980 THEN '1970년대'
       WHEN 1980<= cust_year_of_birth AND cust_year_of_birth <1990 THEN '1980년대'
       WHEN 1990<= cust_year_of_birth AND cust_year_of_birth <2000 THEN '1990년대'
       ELSE '기타'
       END AS generation
FROM customers;
--
SELECT cust_name, cust_year_of_birth, 
       decode( mod( round(( cust_year_of_birth / 10 ),10),10), 5, '50년대',
                                                         6, '60년대',
                                                         7, '70년대',
                                                         8, '80년대',
                                                         9, '90년대',
                                                         '기타') ger
from customers;
--8
SELECT to_char(hire_date, 'yyyy') AS hire_year, COUNT(*)
FROM employees
GROUP BY to_char(hire_date, 'yyyy');

--9
SELECT region, SUM(loan_jan_amt) AS totl_jan
FROM kor_loan_status
WHERE PERIOD LIKE '2011%'
GROUP BY region;