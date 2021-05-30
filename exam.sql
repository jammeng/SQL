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












