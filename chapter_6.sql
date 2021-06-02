SELECT
    a.employee_id,
    a.emp_name,
    b.job_id,
    b.department_id
FROM
    employees  a,
    job_history  b
WHERE
        a.employee_id = b.employee_id (+)
    AND a.department_id = b.department_id(+);

SELECT
    a.employee_id,
    a.emp_name,
    a.department_id,
    b.department_name
FROM
    employees a,
    departments b;
    
--ANSI Á¶ÀÎ  184p
SELECT
    a.employee_id,
    a.emp_name,
    b.department_id,
    b.department_name
FROM
    employees    a,
    departments  b
WHERE
        a.department_id = b.department_id
    AND a.hire_date >= TO_DATE('2003-01-01', 'yyyy-mm-dd');


SELECT
    a.employee_id,
    a.emp_name,
    b.department_id,
    b.department_name
FROM
    employees a
INNER JOIN departments b ON ( a.department_id = b.department_id )
WHERE a.hire_date >= TO_DATE('2003-01-01', 'yyyy-mm-dd');

select a.employee_id, a.emp_name, b.department_id, b.department_name
from employees a,
     departments b
where a.department_id = b.department_id
and a.hire_date >= to_date('2013-01-01', 'yyyy-mm-dd');









