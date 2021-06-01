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
WHERE b.salary > 3000;

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
ORDER BY A.department_name;


