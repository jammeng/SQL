--lsnrctl status
--lsnrctl start

-- SELECT   92p

SELECT employee_id, emp_name
FROM employees
WHERE salary > 5000;

SELECT employee_id, emp_name
FROM employees
WHERE salary > 5000
ORDER BY employee_id;

SELECT employee_id, emp_name
FROM employees
WHERE salary > 5000 AND job_id = 'IT_PROG'
ORDER BY employee_id;

SELECT employee_id, emp_name
FROM employees
WHERE salary > 5000 AND job_id = 'it_prog' -- 대소문자 구분 오류
ORDER BY employee_id;

SELECT employee_id, emp_name
FROM employees
WHERE salary > 5000 OR job_id = 'IT_PROG'
ORDER BY employee_id;

select a.employee_id, a.emp_name, a.department_id, 
        b.department_name AS dep_name
from employees a, 
    departments b
where a.department_id = b.department_id;


-- INSERT   95p

CREATE TABLE ex3_1(
    sname        VARCHAR2(10),
    num_id      NUMBER,
    birth_date  DATE
);

INSERT INTO ex3_1(sname, num_id, birth_date)
VALUES ('김정명', 20143005, SYSDATE);

INSERT INTO ex3_1(birth_date, sname, num_id)
VALUES ('1995-05-27','김정명',20143005);

INSERT INTO ex3_1(sname, num_id, birth_date)
VALUES ('김정명', SYSDATE,20143005);  -- 값이 안맞으면 오류


INSERT INTO ex3_1
VALUES ('김정명',20143005,SYSDATE);

INSERT INTO ex3_1(sname, num_id)
VALUES ('김정명', 21301484);

INSERT INTO ex3_1
VALUES ('김정명', 21301484); -- 값이 충분하지 않으면 오류 


-- INSERT~SELECT    98p

CREATE TABLE ex3_2(
    emp_id      NUMBER,
    emp_name    VARCHAR(100)
);

INSERT INTO ex3_2 (emp_id, emp_name)
SELECT employee_id, emp_name
FROM employees
WHERE salary > 5000;

INSERT INTO ex3_1(sname, num_id, birth_date)
VALUES (10, '10', '2016-03-14'); -- 묵시적 형변환

-- UPDATE   p99
SELECT *
FROM ex3_1;

UPDATE ex3_1
SET num_id = 50;

UPDATE ex3_1
SET birth_date = '2017-12-14'
WHERE birth_date = ''; -- 오라클에서는 사용 불가 

UPDATE ex3_1
SET birth_date = '2017-12-14'
WHERE birth_date IS NULL;


-- MERGE    101p

CREATE TABLE ex3_3(
    employee_id NUMBER,
    bonus_amt   NUMBER DEFAULT 0
);

INSERT INTO ex3_3(employee_id)
SELECT e.employee_id
FROM employees e, sales s
WHERE e.employee_id = s. employee_id
AND s.SALES_MONTH BETWEEN '200010' AND '200012'
GROUP BY e.employee_id;

SELECT *
FROM ex3_3
ORDER BY employee_id;

SELECT employee_id, manager_id, salary, salary * 0.01
FROM employees
WHERE employee_id IN (SELECT employee_id FROM ex3_3);

SELECT employee_id, manager_id, salary, salary * 0.01
FROM employees
WHERE employee_id NOT IN (SELECT employee_id FROM ex3_3)
AND manager_id = 146;

MERGE INTO ex3_3 d
    USING (SELECT employee_id, salary, manager_id
            FROM employees
            WHERE manager_id = 146) b
    ON(d.employee_id = b.employee_id)
WHEN MATCHED THEN
    UPDATE SET d.bonus_amt = d.bonus_amt + b.salary *0.01
WHEN NOT MATCHED THEN
    INSERT (d.employee_id, d.bonus_amt) VALUES (b.employee_id, b.salary * .001)
    WHERE (b.salary < 8000);
    
-- DELECT   105p

DELETE ex3_3;

SELECT *
FROM ex3_3
ORDER BY employee_id;

SELECT partition_name
FROM user_tab_partitions
WHERE table_name = 'SALES';


-- COMMIT & ROLLBACK, TRUNCATE

CREATE TABLE ex3_4(
    employee_id NUMBER
);
insert into ex3_4 VALUES (100);

select * from ex3_4;

commit;

TRUNCATE TABLE ex3_4;


-- 의사컬럼     110p

select ROWNUM, employee_id
from employees;

select ROWNUM, employee_id
from employees
where ROWNUM < 5;

select ROWNUM, employee_id, ROWID
from employees
where ROWNUM < 5;

-- 연산자  112p

SELECT employee_id || '-' || emp_name AS employee_info
FROM employees
WHERE ROWNUM < 5;

-- 표현식  113p

SELECT employee_id, salary,
CASE WHEN salary <= 5000 THEN 'C등급'
WHEN salary > 5000 AND salary <= 15000 THEN 'B등급'
ELSE 'A등급'
END AS salary_grade
FROM employees;

--조건식   114p

SELECT employee_id, salary
FROM employees
WHERE salary = ANY (2000, 3000, 4000)
ORDER BY employee_id;

SELECT employee_id, salary
FROM employees
WHERE salary = 2000
OR salary = 3000
OR salary = 4000
ORDER BY employee_id;

SELECT employee_id, salary
FROM employees
WHERE salary = ALL (2000, 3000, 4000)
ORDER BY employee_id;

SELECT employee_id, salary
FROM employees
WHERE salary = SOME (2000, 3000, 4000)
ORDER BY employee_id;

SELECT employee_id, salary
FROM employees
WHERE NOT(salary >= 2500)
ORDER BY employee_id;

SELECT employee_id, salary
FROM employees
WHERE salary BETWEEN 2000 AND 2500
ORDER BY employee_id;

SELECT employee_id, salary
FROM employees
WHERE salary IN (2000, 3000, 4000)
ORDER BY employee_id;

SELECT employee_id, salary
FROM employees
WHERE salary NOT IN (2000, 3000, 4000)
ORDER BY employee_id;

SELECT department_id, department_name
FROM departments A
WHERE EXISTS (SELECT *
                FROM employees b
                WHERE A.department_id = b.department_id
                AND b.salary > 3000)
ORDER BY A.department_name;

SELECT emp_name 
FROM employees
WHERE emp_name LIKE 'A%'
ORDER BY emp_name;
                
SELECT emp_name 
FROM employees
WHERE emp_name LIKE 'Al%'
ORDER BY emp_name;

CREATE TABLE ex3_5(NAMES VARCHAR2(30));

INSERT INTO ex3_5 VALUES ('홍길동');
INSERT INTO ex3_5 VALUES ('홍길상동');
INSERT INTO ex3_5 VALUES ('홍길용');
INSERT INTO ex3_5 VALUES ('홍길상');

SELECT* FROM ex3_5
WHERE NAMES LIKE '홍길%';

SELECT* FROM ex3_5
WHERE NAMES LIKE '홍길_';

--연습문제
-- 1
CREATE TABLE ex3_6(
    employee_id     NUMBER,
    emp_name        VARCHAR2(80),
    salary          NUMBER,
    manager_id      NUMBER
);

--select employee_id, emp_name, salary, manager_id
--from employees
--where manager_id = 124 and (2000 <= salary and salary <= 3000);

INSERT INTO ex3_6
SELECT employee_id, emp_name, salary, manager_id
FROM employees a
WHERE a.manager_id = 124 AND a.salary BETWEEN 2000 AND 3000;
--WHERE a.manager_id = 124 AND (2000 <= salary AND salary <= 3000);
-- 2

DELETE ex3_3;

INSERT INTO ex3_3(employee_id)
SELECT E.employee_id
FROM employees E, sales S
WHERE E.employee_id = S.employee_id
AND S.sales_month BETWEEN '200010' AND '200012'
GROUP BY E.employee_id;

commit;
select *  from ex3_3;
ㅋ
--select employee_id , salary, manager_id from employees where manager_id = 145;

MERGE INTO ex3_3 A
USING (SELECT employee_id , salary, manager_id FROM employees WHERE manager_id = 145) b
ON (A.employee_id = b.employee_id)
WHEN MATCHED THEN
UPDATE SET A.bonus_amt = A.bonus_amt + b.salary *.01
WHEN NOT MATCHED THEN
INSERT (A.employee_id, A.bonus_amt) VALUES(b.employee_id, b.salary*.005);

--3
SELECT employee_id, emp_name
FROM employees
WHERE commission_pct IS NULL
ORDER BY employee_id;

--4 
select employee_id, salary
from employees
where salary between 2000 and 2500
order by employee_id;

select employee_id, salary
from employees
where  2000 <= salary  and salary <= 2500
order by employee_id;

--5
select employee_id, salary
from employees
where salary in (2000, 3000, 4000)
order by employee_id;

select employee_id, salary
from employees
where salary = any (2000, 3000, 4000)
order by employee_id;

select employee_id, salary
from employees
where salary not in (2000, 3000, 4000)
order by employee_id;

select employee_id, salary
from employees
where salary <> all (2000, 3000, 4000)
order by employee_id;

