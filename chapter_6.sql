-- 동등조인     176p
SELECT a.employee_id, a.emp_name, a.department_id, b.department_name
  FROM employees a,
       departments b
 WHERE a.department_id = b.department_id;


-- 세미조인     177p
/*EXISTS*/
SELECT department_id, department_name
  FROM departments a
 WHERE EXISTS ( SELECT * 
                 FROM employees b
                WHERE a.department_id = b.department_id
                  AND b.salary > 3000)
ORDER BY a.department_name;

/*IN*/
SELECT department_id, department_name
  FROM departments a
 WHERE a.department_id  IN ( SELECT b.department_id
                               FROM employees b
                              WHERE b.salary > 3000)
ORDER BY department_name;

/*일반조인 => 결과수 많아짐*/
SELECT a.department_id, a.department_name
  FROM departments a, employees b
 WHERE a.department_id = b.department_id
   AND b.salary > 3000
ORDER BY a.department_name;


-- 안티조인     179p
SELECT a.employee_id, a.emp_name, a.department_id, b.department_name
  FROM employees a,
       departments b
 WHERE a.department_id = b.department_id
   AND a.department_id NOT IN ( SELECT department_id
                                  FROM departments 
                                 WHERE manager_id IS NULL) ;


SELECT count(*)
  FROM employees a
 WHERE NOT EXISTS ( SELECT 1
                      FROM departments c
                     WHERE a.department_id = c.department_id 
                       AND manager_id IS NULL) ;


-- 셀프조인     180p
SELECT a.employee_id, a.emp_name, b.employee_id, b.emp_name, a.department_id
  FROM employees a,
        employees b
 WHERE a.employee_id < b.employee_id      
   AND a.department_id = b.department_id
   AND a.department_id = 20;
   
-- 외부조인     181p
/*일반조인*/
SELECT a.department_id, a.department_name, b.job_id, b.department_id
FROM departments a,
     job_history b
WHERE a.department_id = b.department_id;

/*외부조인*/
SELECT a.department_id, a.department_name, b.job_id, b.department_id
FROM departments a,
     job_history b
WHERE a.department_id = b.department_id (+) ;


SELECT a.employee_id, a.emp_name, b.job_id, b.department_id 
  FROM employees a,
       job_history b
 WHERE a.employee_id = b.employee_id(+)
   AND a.department_id = b.department_id;


select a.employee_id, a.emp_name, b.job_id, b.department_id 
  from employees a,
       job_history b
 where a.employee_id  = b.employee_id(+)
   and a.department_id = b.department_id(+);


-- 카타시안 조인      184p
SELECT a.employee_id, a.emp_name, b.department_id, b.department_name
  FROM employees a,
       departments b;


-- ANSI 조인      184p
/*기존문법*/
SELECT a.employee_id, a.emp_name, b.department_id, b.department_name
  FROM employees a,
       departments b
 WHERE a.department_id = b.department_id
   AND a.hire_date >= TO_DATE('2003-01-01','YYYY-MM-DD');

/*ANSI문법*/
SELECT a.employee_id, a.emp_name, b.department_id, b.department_name
  FROM employees a
  INNER JOIN departments b
    ON (a.department_id = b.department_id )
 WHERE a.hire_date >= TO_DATE('2003-01-01','YYYY-MM-DD');

/*잘못된 경우*/
SELECT a.employee_id, a.emp_name, b.department_id, b.department_name
  FROM employees a
  INNER JOIN departments b
    USING (department_id)
 WHERE a.hire_date >= TO_DATE('2003-01-01','YYYY-MM-DD');

/*잘된 경우*/
SELECT a.employee_id, a.emp_name, department_id, b.department_name
  FROM employees a
  INNER JOIN departments b
    USING (department_id)
 WHERE a.hire_date >= TO_DATE('2003-01-01','YYYY-MM-DD');


-- ANSI 외부조인        186p
select a.employee_id, a.emp_name, b.job_id, b.department_id 
  from employees a,
       job_history b
 where a.employee_id  = b.employee_id(+)
   and a.department_id = b.department_id(+);

/*LEFT*/
SELECT a.employee_id, a.emp_name, b.job_id, b.department_id 
  FROM employees a
  LEFT OUTER JOIN job_history b
  ON ( a.employee_id  = b.employee_id
       and a.department_id = b.department_id) ;

/*RIGHT*/
SELECT a.employee_id, a.emp_name, b.job_id, b.department_id 
  FROM job_history b 
  RIGHT OUTER JOIN employees a
  ON ( a.employee_id  = b.employee_id
       and a.department_id = b.department_id) ;

/*OUTER 생략*/
SELECT a.employee_id, a.emp_name, b.job_id, b.department_id 
  FROM employees a
  LEFT JOIN job_history b
  ON ( a.employee_id  = b.employee_id
       and a.department_id = b.department_id) ;
       
-- CROSS 조인     188p
SELECT a.employee_id, a.emp_name, b.department_id, b.department_name
  FROM employees a,
       departments b;

SELECT a.employee_id, a.emp_name, b.department_id, b.department_name
FROM employees a 
CROSS JOIN departments b;
       
-- FULL OUTER 조인    189p
CREATE TABLE HONG_A  (EMP_ID INT);

CREATE TABLE HONG_B  (EMP_ID INT);

INSERT INTO HONG_A VALUES ( 10);

INSERT INTO HONG_A VALUES ( 20);

INSERT INTO HONG_A VALUES ( 40);

INSERT INTO HONG_B VALUES ( 10);

INSERT INTO HONG_B VALUES ( 20);

INSERT INTO HONG_B VALUES ( 30);

COMMIT;

SELECT a.emp_id, b.emp_id
FROM hong_a a, 
     hong_b b
WHERE a.emp_id(+) = b.emp_id(+);

SELECT a.emp_id, b.emp_id
FROM hong_a a
FULL OUTER JOIN hong_b b
ON ( a.emp_id = b.emp_id);


-- 서브쿼리
-- 연관성 없는 서브쿼리 

SELECT count(*)
  FROM employees 
 WHERE salary >=  ( SELECT AVG(salary)
                      FROM employees );


SELECT count(*)
  FROM employees 
 WHERE department_id IN ( SELECT department_id
                            FROM departments
                           WHERE parent_id IS NULL);


SELECT employee_id, emp_name, job_id
FROM employees
WHERE (employee_id, job_id ) IN ( SELECT employee_id, job_id
                                    FROM job_history);


UPDATE employees
   SET salary = ( SELECT AVG(salary)
                    FROM employees );


DELETE employees
 WHERE salary >= ( SELECT AVG(salary)
                    FROM employees );
                    
ROLLBACK;                    


-- 연관성 있는 서브쿼리   

SELECT a.department_id, a.department_name
 FROM departments a
WHERE EXISTS ( SELECT 1 
                 FROM job_history b
                WHERE a.department_id = b.department_id );


SELECT a.employee_id, 
       ( SELECT b.emp_name
           FROM employees b
          WHERE a.employee_id = b.employee_id) AS emp_name,
       a.department_id,
       ( SELECT b.department_name
           FROM departments b
          WHERE a.department_id = b.department_id) AS dep_name     
FROM job_history a;


SELECT a.department_id, a.department_name
  FROM departments a
 WHERE EXISTS ( SELECT 1
                  FROM employees b  
                 WHERE a.department_id = b.department_id 
                   AND b.salary > ( SELECT AVG(salary)  
                                      FROM employees )
               );
               
               
SELECT department_id , AVG(salary)
  FROM employees a
 WHERE department_id IN ( SELECT department_id 
                            FROM departments
                           WHERE parent_id = 90) 
GROUP BY department_id;


UPDATE employees a
   SET a.salary = ( SELECT sal
                      FROM ( SELECT b.department_id, AVG(c.salary) as sal
                               FROM departments b, 
                                    employees c
                              WHERE b.parent_id = 90 
                                AND b.department_id = c.department_id
                              GROUP BY b.department_id ) d
                      WHERE a.department_id = d.department_id )
 WHERE a.department_id IN ( SELECT department_id 
                              FROM departments
                             WHERE parent_id = 90 ) ;


SELECT department_id , MIN(salary), MAX(salary)
  FROM employees a
 WHERE department_id  IN ( SELECT department_id 
                             FROM departments
                            WHERE parent_id = 90) 
GROUP BY department_id ;


MERGE INTO employees a
  USING ( SELECT b.department_id, AVG(c.salary) as sal
            FROM departments b, 
                  employees c
           WHERE b.parent_id = 90 
             AND b.department_id = c.department_id
            GROUP BY b.department_id ) d
      ON ( a.department_id = d.department_id )
 WHEN MATCHED THEN
 UPDATE SET a.salary = d.sal;


-- 인라인뷰

SELECT a.employee_id, a.emp_name, b.department_id, b.department_name
  FROM employees a,
       departments b,
       ( SELECT AVG(c.salary) AS avg_salary 
           FROM departments b,
                employees c
          WHERE b.parent_id = 90  -- 기획부
            AND b.department_id = c.department_id ) d
 WHERE a.department_id = b.department_id 
   AND a.salary > d.avg_salary;


SELECT a.* 
  FROM ( SELECT a.sales_month, ROUND(AVG(a.amount_sold)) AS month_avg
           FROM sales a,
                customers b,
                countries c
          WHERE a.sales_month BETWEEN '200001' AND '200012'
            AND a.cust_id = b.CUST_ID
            AND b.COUNTRY_ID = c.COUNTRY_ID
            AND c.COUNTRY_NAME = 'Italy'     
          GROUP BY a.sales_month  
       )  a,
       ( SELECT ROUND(AVG(a.amount_sold)) AS year_avg
           FROM sales a,
                customers b,
                countries c
          WHERE a.sales_month BETWEEN '200001' AND '200012'
            AND a.cust_id = b.CUST_ID
            AND b.COUNTRY_ID = c.COUNTRY_ID
            AND c.COUNTRY_NAME = 'Italy'       
       ) b
 WHERE a.month_avg > b.year_avg ;


-- 현장 노하우
SELECT SUBSTR(a.sales_month, 1, 4) as years,
        a.employee_id, 
        SUM(a.amount_sold) AS amount_sold
   FROM sales a,
        customers b,
        countries c
  WHERE a.cust_id = b.CUST_ID
    AND b.country_id = c.COUNTRY_ID
    AND c.country_name = 'Italy'     
GROUP BY SUBSTR(a.sales_month, 1, 4), a.employee_id;


SELECT  years, 
        MAX(amount_sold) AS max_sold
 FROM ( SELECT SUBSTR(a.sales_month, 1, 4) as years,
                a.employee_id, 
                SUM(a.amount_sold) AS amount_sold
 FROM sales a,
               customers b,
               countries c
  WHERE a.cust_id = b.CUST_ID
          AND b.country_id = c.COUNTRY_ID
          AND c.country_name = 'Italy'     
       GROUP BY SUBSTR(a.sales_month, 1, 4), a.employee_id    
      ) K
 GROUP BY years
 ORDER BY years;
 
 
SELECT emp.years, 
       emp.employee_id,
       emp.amount_sold
  FROM ( SELECT SUBSTR(a.sales_month, 1, 4) as years,
                a.employee_id, 
                SUM(a.amount_sold) AS amount_sold
           FROM sales a,
                customers b,
                countries c
          WHERE a.cust_id = b.CUST_ID
            AND b.country_id = c.COUNTRY_ID
            AND c.country_name = 'Italy'     
          GROUP BY SUBSTR(a.sales_month, 1, 4), a.employee_id   
        ) emp,
       ( SELECT  years, 
                 MAX(amount_sold) AS max_sold
          FROM ( SELECT SUBSTR(a.sales_month, 1, 4) as years,
                        a.employee_id, 
                        SUM(a.amount_sold) AS amount_sold
                   FROM sales a,
                        customers b,
                        countries c
                  WHERE a.cust_id = b.CUST_ID
                    AND b.country_id = c.COUNTRY_ID
                    AND c.country_name = 'Italy'     
                  GROUP BY SUBSTR(a.sales_month, 1, 4), a.employee_id    
               ) K
          GROUP BY years
       ) sale
  WHERE emp.years = sale.years
    AND emp.amount_sold = sale.max_sold 
  ORDER BY years;


SELECT emp.years, 
       emp.employee_id,
       emp2.emp_name,
       emp.amount_sold
  FROM ( SELECT SUBSTR(a.sales_month, 1, 4) as years,
                a.employee_id, 
                SUM(a.amount_sold) AS amount_sold
           FROM sales a,
                customers b,
                countries c
          WHERE a.cust_id = b.CUST_ID
            AND b.country_id = c.COUNTRY_ID
            AND c.country_name = 'Italy'     
          GROUP BY SUBSTR(a.sales_month, 1, 4), a.employee_id   
        ) emp,
       ( SELECT  years, 
                 MAX(amount_sold) AS max_sold
          FROM ( SELECT SUBSTR(a.sales_month, 1, 4) as years,
                        a.employee_id, 
                        SUM(a.amount_sold) AS amount_sold
                   FROM sales a,
                        customers b,
                        countries c
                  WHERE a.cust_id = b.CUST_ID
                    AND b.country_id = c.COUNTRY_ID
                    AND c.country_name = 'Italy'     
                  GROUP BY SUBSTR(a.sales_month, 1, 4), a.employee_id    
               ) K
          GROUP BY years
       ) sale,
       employees emp2
  WHERE emp.years = sale.years
    AND emp.amount_sold = sale.max_sold 
    AND emp.employee_id = emp2.employee_id
ORDER BY years;

--연습문제 205p
--1
SELECT E.employee_id 사번, E.emp_name 사원명, S.job_title job명칭, j.start_date job시작일자, j.end_date job종료일자, D.department_name job수행부서명
  FROM employees E,
       job_history j,
       departments D,
       jobs S
 WHERE E.employee_id = j.employee_id 
   AND j.department_id = D.department_id 
   AND j.job_id = S.job_id
   AND E.employee_id = 101;

--2
SELECT A.employee_id, A.emp_name, b.job_id, b.department_id 
  FROM employees A,
       job_history b
 WHERE A.employee_id   = b.employee_id(+)
   AND A.department_id = b.department_id(+);
   
--3
--4
SELECT a.department_id, a.department_name
  FROM departments a, employees b
 WHERE a.department_id = b.department_id
   AND b.salary > 3000
ORDER BY a.department_name;

SELECT a.department_id, a.department_name
  FROM departments a 
  INNER JOIN employees b
   ON (a.department_id = b.department_id)
 WHERE b.salary > 3000
ORDER BY a.department_name;

--5
SELECT a.department_id, a.department_name
 FROM departments a
WHERE EXISTS ( SELECT 1 
                 FROM job_history b
                WHERE a.department_id = b.department_id );

SELECT a.department_id, a.department_name
 FROM departments a
WHERE a.department_id IN ( SELECT b.department_id 
                      FROM job_history b);






