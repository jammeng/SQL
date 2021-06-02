-- �������ΰ� �ܺ�����    176p

-- ���� ����            176p
SELECT A.employee_id, A.emp_name, b.department_id, b.department_name
  FROM employees A, departments b
 WHERE A.department_id = b.department_id;



--���� ����             177p
SELECT department_id, department_name
  FROM departments;

SELECT department_id
FROM employees b
WHERE b.salary > 3000
order by b.department_id;

SELECT department_id, department_name
  FROM departments A
 WHERE EXISTS(SELECT *
              FROM employees b
              WHERE A.department_id = b.department_id
              AND b.salary > 3000)
ORDER BY A.department_id;

SELECT department_id, department_name
  FROM departments A
 WHERE A.department_id IN (SELECT b.department_id
                           FROM employees b
                           WHERE b.salary > 3000)
ORDER BY A.department_id;

SELECT A.department_id, A.department_name
FROM departments A, employees b
WHERE A.department_id = b.department_id
AND b.salary > 3000
ORDER BY A.department_name;


--��Ƽ����  179p

SELECT
    a.employee_id,
    a.emp_name,
    a.department_id,
    b.department_name
FROM
    employees    a,
    departments  b
WHERE
        a.department_id = b.department_id
    AND a.department_id NOT IN (
        SELECT
            department_id
        FROM
            departments
        WHERE
            manager_id IS NULL
    );
                           
 -- ���� ���� 180p
SELECT
    a.employee_id,
    a.emp_name,
    b.employee_id,
    b.emp_name,
    a.department_id
FROM
    employees  a,
    employees  b
WHERE
        a.employee_id < b.employee_id
    AND a.department_id = b.department_id
    AND a.department_id = 20;
                           
--�ܺ� ����     181p




