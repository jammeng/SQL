--  �����Լ�    126p

SELECT ABS(10), ABS(-10), ABS(-10.123) FROM dual; --���� ��ȯ

SELECT CEIL(10.123), CEIL(10.541), CEIL(11.001) FROM DUAL;

SELECT FLOOR(10.123), FLOOR(10.541), FLOOR(11.001) FROM DUAL;
 
SELECT ROUND(10.123), ROUND(10.541), ROUND(11.001) FROM DUAL;

SELECT ROUND(10.154, 1), ROUND(10.154,2), ROUND(10.154,3) FROM DUAL;

SELECT ROUND(0 ,3), ROUND(115.155, -1), ROUND(115.155, -2) FROM DUAL;

SELECT TRUNC(115.155), TRUNC(115.155, 1), TRUNC(115.155, 2), TRUNC(115.155, -2) FROM DUAL;

SELECT POWER(3,2), POWER(3,3), POWER(3, 3.0001) FROM DUAL;

SELECT POWER(-3, 3.0001) FROM DUAL; -- ���� ���� �����̸� ���ǰ��� ������ �ü� ����

SELECT SQRT(2), SQRT(5) FROM DUAL;

SELECT MOD(19, 4), MOD(19.123, 4.2) FROM DUAL;

SELECT REMAINDER(19, 4), REMAINDER(19.123, 4.2) FROM DUAL;

SELECT EXP(2), LN(2.713), LOG(10, 100) FROM DUAL;

-- �����Լ�     130p

SELECT INITCAP('never say goodbye'), INITCAP('never6say*good��bye') FROM DUAL;

SELECT LOWER('NEVER SAY GOODBYE'), UPPER('never say goodbye') FROM DUAL;

SELECT CONCAT('I Have',' A Dream'), 'I Have' || ' A Dream' FROM DUAL; 

SELECT SUBSTR('ABCDEFG', 1, 4), SUBSTR('ABCDEFG', -1, 4) FROM DUAL;

SELECT SUBSTRB('ABCDEFG', 1, 4), SUBSTRB('�����ٶ󸶹ٻ�', 1, 6) FROM DUAL; -- ���� ȯ���� �ѱ��� �ѱ��ڿ� 3����Ʈ�� �ν�

SELECT LTRIM('ABCDEFGABC', 'ABC'),
LTRIM('�����ٶ�', '��'),
RTRIM('ABCDEFGABC', 'ABC'),
RTRIM('�����ٶ�', '��') FROM DUAL;

SELECT LTRIM('�����ٶ�','��'),RTRIM('�����ٶ�','��') FROM DUAL;

CREATE TABLE EX4_1(
    PHONE_NUM VARCHAR2(30)
);

INSERT INTO EX4_1 VALUES('111-1111');
INSERT INTO EX4_1 VALUES('111-2222');
INSERT INTO EX4_1 VALUES('111-3333');

SELECT * FROM EX4_1;

SELECT LPAD(PHONE_NUM, 12, '(02)') FROM EX4_1;

SELECT RPAD(PHONE_NUM, 12, '(02)') FROM EX4_1;

SELECT REPLACE('���� �ʸ� �𸣴µ� �ʴ� ���� �˰ڴ°�?', '��', '��') FROM DUAL;

SELECT  LTRIM(' ABC DEF '),
RTRIM(' ABC DEF '),
REPLACE(' ABC DEF ', ' ', '')
FROM DUAL;

SELECT REPLACE('���� �ʸ� �𸣴µ� �ʴ� ���� �˰ڴ°�?', '����', '�ʸ�') AS REP,
TRANSLATE('���� �ʸ� �𸣴µ� �ʴ� ���� �˰ڴ°�?', '����', '�ʸ�') AS TRN FROM DUAL;

SELECT EMPLOYEE_ID,
TRANSLATE(EMP_NAME, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'thehillsarealivewhitthesou') AS TRANS_NAME FROM EMPLOYEES;

SELECT
    INSTR('���� ���� �ܷο� ����,���� ���� ���οﶧ��,���� ���� ��ſ� ����', '����')                AS INSTR1,
    INSTR('���� ���� �ܷο� ����, ���� ���� ���οﶧ��, ���� ���� ��ſ� ����', '����', 5)           AS INSTR2,
    INSTR('���� ���� �ܷο� ����, ���� ���� ���οﶧ��, ���� ���� ��ſ� ����', '����', 5, 2)        AS INSTR3,
    instr('���� ���� �ܷο� ����, ���� ���� ���οﶧ��, ���� ���� ��ſ� ����', '��', 5, 2) as instr4
    FROM
    DUAL;

SELECT
    LENGTH('���ѹα�'),
    LENGTHB('���ѹα�')
FROM
    DUAL;
    
-- ��¥ �Լ�    138p     

SELECT SYSDATE, SYSTIMESTAMP FROM DUAL;

SELECT ADD_MONTHS(SYSDATE, 1), ADD_MONTHS(SYSDATE, -1) FROM DUAL;

SELECT
    months_between(sysdate, add_months(sysdate, 1))          mon1,
    months_between(add_months(sysdate, 1), sysdate)          mon2,
    months_between(add_months(sysdate, 2), sysdate)          mon3 
    
FROM
    dual;

SELECT LAST_DAY(SYSDATE) FROM DUAL;

SELECT SYSDATE, ROUND(SYSDATE, 'month'), TRUNC(SYSDATE, 'month') FROM DUAL;

SELECT NEXT_DAY(SYSDATE, '�ݿ���') FROM DUAL;

-- ��ȯ �Լ�    140p

SELECT to_char(123456789, '999,999,999') FROM dual;
SELECT to_char(sysdate, 'yyyy-mm-dd') FROM dual;

SELECT TO_NUMBER('123456') FROM dual;

SELECT TO_DATE('20140101 13:44:50', 'yyyy-mm-dd HH24:MI:ss') FROM dual;

--NULL ���� �Լ�    143p
SELECT NVL(manager_id, employee_id)
FROM employees
WHERE manager_id IS NULL;

SELECT employee_id,
NVL2(commission_pct, salary + (salary * commission_pct), salary) AS salary2
FROM employees;

SELECT employee_id, salary, commission_pct,
COALESCE (salary * commission_pct, salary) AS salary2
FROM employees;

SELECT EMPLOYEE_ID, COMMISSION_PCT
FROM EMPLOYEES
WHERE COMMISSION_PCT < 0.2;

SELECT COUNT(*)
FROM EMPLOYEES
WHERE NVL(COMMISSION_PCT, 0) <0.2;

SELECT COUNT(*)
FROM EMPLOYEES
WHERE LNNVL(COMMISSION_PCT >=0.2) ;

SELECT EMPLOYEE_ID,
TO_CHAR(START_DATE, 'yyyy') START_TEAR,
TO_CHAR(END_DATE, 'yyyy') END_YEAR,
NULLIF(TO_CHAR(END_DATE, 'yyyy'),TO_CHAR(START_DATE, 'yyyy')) NULLIF_YEAR FROM JOB_HISTORY;

-- ��Ÿ �Լ�    147p

select greatest(1, 2, 3, 2),
least(1, 2, 3, 2) from dual;

select greatest('�̼���', '������', '�������'),
least('�̼���', '������', '�������') from dual;

select prod_id,
decode(channel_id, 3, 'Direct',
                   9, 'Direct',
                   5, 'Indirect',
                   4, 'Indirect',
                      'Others') decodes
from sales
where rownum < 10;

-- ��������     150p
--1
SELECT LPAD(phone_number, 16, '(02)')
FROM employees;

--2
--SELECT employee_id, emp_name, hire_date, ROUND(months_between(sysdate, hire_date)/12) AS mon1
--FROM employees
--WHERE ROUND(months_between(sysdate, hire_date)/12) >= 10
--ORDER BY -mon1;
SELECT employee_id, emp_name, hire_date, ROUND((sysdate - hire_date)/365) AS mon1
FROM employees
WHERE ROUND((sysdate - hire_date)/365) >= 10
--ORDER BY mon1 DESC;
ORDER BY 3 ;

--3
SELECT REPLACE(cust_main_phone_number, '-', '/') AS cust_main_phone_number
FROM customers;

--4
SELECT TRANSLATE(cust_main_phone_number, '0123456789-', 'acielsifkeO') AS secret
FROM customers;

--5
SELECT cust_name, cust_year_of_birth,
       decode((to_char(sysdate, 'YYYY') - cust_year_of_birth), 30, '30��',
                                                               40, '40��',
                                                               50, '50��',
                                                                   '��Ÿ') generation
FROM customers
ORDER BY 2 DESC;

--6
SELECT cust_name, cust_year_of_birth, 
CASE WHEN 30 <= (to_char(sysdate, 'YYYY') - cust_year_of_birth) and (to_char(sysdate, 'YYYY') - cust_year_of_birth < 40) THEN '30��'
     WHEN 40 <= (to_char(sysdate, 'YYYY') - cust_year_of_birth) and (to_char(sysdate, 'YYYY') - cust_year_of_birth < 50) THEN '40��'
     ELSE '��Ÿ'
END AS generation
FROM customers;