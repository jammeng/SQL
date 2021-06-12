-- IF ��
DECLARE
   vn_num1 NUMBER := 1;
   vn_num2 NUMBER := 2;
BEGIN
	
	 IF vn_num1 >= vn_num2 THEN
	    DBMS_OUTPUT.PUT_LINE(vn_num1 ||'�� ū ��');
	 ELSE
	    DBMS_OUTPUT.PUT_LINE(vn_num2 ||'�� ū ��');	 
	 END IF;

END;


DECLARE
   vn_salary NUMBER := 0;
   vn_department_id NUMBER := 0;
BEGIN
	
	vn_department_id := ROUND(DBMS_RANDOM.VALUE (10, 120), -1);
    
    dbms_output.put_line(vn_department_id);

   SELECT salary
     INTO vn_salary
     FROM employees
    WHERE department_id = vn_department_id
      AND ROWNUM = 1;

  DBMS_OUTPUT.PUT_LINE(vn_salary);
  
  IF vn_salary BETWEEN 1 AND 3000 THEN
     DBMS_OUTPUT.PUT_LINE('����');
  
  ELSIF vn_salary BETWEEN 3001 AND 6000 THEN
     DBMS_OUTPUT.PUT_LINE('�߰�');
  
  ELSIF vn_salary BETWEEN 6001 AND 10000 THEN
     DBMS_OUTPUT.PUT_LINE('����');
  
  ELSE
     DBMS_OUTPUT.PUT_LINE('�ֻ���');
  END IF;  
   
	
END;


DECLARE
   vn_salary NUMBER := 0;
   vn_department_id NUMBER := 0;
   vn_commission NUMBER := 0;
BEGIN
	
	vn_department_id := ROUND(DBMS_RANDOM.VALUE (10, 120), -1);
  
   SELECT salary, commission_pct
     INTO vn_salary, vn_commission
     FROM employees
    WHERE department_id = vn_department_id
      AND ROWNUM = 1;

  DBMS_OUTPUT.PUT_LINE(vn_salary);
  
  IF vn_commission > 0 THEN
     IF vn_commission > 0.15 THEN
        DBMS_OUTPUT.PUT_LINE(vn_salary * vn_commission );
     END IF;  
  ELSE
     DBMS_OUTPUT.PUT_LINE(vn_salary);
  END IF;  
END;

-- CASE ��
DECLARE
   vn_salary NUMBER := 0;
   vn_department_id NUMBER := 0;
BEGIN
	
	vn_department_id := ROUND(DBMS_RANDOM.VALUE (10, 120), -1);
  
   SELECT salary
     INTO vn_salary
     FROM employees
    WHERE department_id = vn_department_id
      AND ROWNUM = 1;

  DBMS_OUTPUT.PUT_LINE(vn_salary);
  
  CASE WHEN vn_salary BETWEEN 1 AND 3000 THEN
            DBMS_OUTPUT.PUT_LINE('����');
       WHEN vn_salary BETWEEN 3001 AND 6000 THEN
            DBMS_OUTPUT.PUT_LINE('�߰�');
       WHEN vn_salary BETWEEN 6001 AND 10000 THEN
            DBMS_OUTPUT.PUT_LINE('����');
       ELSE 
            DBMS_OUTPUT.PUT_LINE('�ֻ���');
  END CASE;

END;

-- LOOP ��
DECLARE
   vn_base_num NUMBER := 3;
   vn_cnt      NUMBER := 1;
BEGIN
   
   LOOP
      DBMS_OUTPUT.PUT_LINE (vn_base_num || '*' || vn_cnt || '= ' || vn_base_num * vn_cnt);
      
      vn_cnt := vn_cnt + 1; -- vn_cnt ���� 1�� ����
      
      EXIT WHEN vn_cnt >9;  -- vn_cnt�� 9���� ũ�� ���� ����
   
   END LOOP;
    
END;


-- WHILE ��
DECLARE
   vn_base_num NUMBER := 3;
   vn_cnt      NUMBER := 1;
BEGIN
   
   WHILE  vn_cnt <= 9 -- vn_cnt�� 9���� �۰ų� ���� ��쿡�� �ݺ�ó�� 
   LOOP
      DBMS_OUTPUT.PUT_LINE (vn_base_num || '*' || vn_cnt || '= ' || vn_base_num * vn_cnt);
      
      vn_cnt := vn_cnt + 1; -- vn_cnt ���� 1�� ����
      
   END LOOP;
    
END;

DECLARE
   vn_base_num NUMBER := 3;
   vn_cnt      NUMBER := 1;
BEGIN
   
   WHILE  vn_cnt <= 9 -- vn_cnt�� 9���� �۰ų� ���� ��쿡�� �ݺ�ó�� 
   LOOP
      DBMS_OUTPUT.PUT_LINE (vn_base_num || '*' || vn_cnt || '= ' || vn_base_num * vn_cnt);
      EXIT WHEN vn_cnt = 5;
      vn_cnt := vn_cnt + 1; -- vn_cnt ���� 1�� ����
   END LOOP;    
END;


-- FOR ��
DECLARE
   vn_base_num NUMBER := 3;
BEGIN
   
   FOR i IN 1..9 
   LOOP
      DBMS_OUTPUT.PUT_LINE (vn_base_num || '*' || i || '= ' || vn_base_num * i);
      
   END LOOP;
    
END;


DECLARE
   vn_base_num NUMBER := 3;
BEGIN
   FOR i IN REVERSE 9..1
   LOOP
      DBMS_OUTPUT.PUT_LINE (vn_base_num || '*' || i || '= ' || vn_base_num * i);
   END LOOP;
END;
 

-- CONTINUE ��
DECLARE
   vn_base_num NUMBER := 3;
BEGIN
   FOR i IN 1..9 
   LOOP
      CONTINUE WHEN i=5;
      DBMS_OUTPUT.PUT_LINE (vn_base_num || '*' || i || '= ' || vn_base_num * i);
   END LOOP;
END;

-- GOTO��
DECLARE
   vn_base_num NUMBER := 3;
BEGIN 
   <<third>>
   FOR i IN 1..9 
   LOOP
      DBMS_OUTPUT.PUT_LINE (vn_base_num || '*' || i || '= ' || vn_base_num * i);    
      IF i = 3 THEN
         GOTO fourth;
      END IF;   
   END LOOP;  
   <<fourth>>
   vn_base_num := 4;
   FOR i IN 1..9 
   LOOP
      DBMS_OUTPUT.PUT_LINE (vn_base_num || '*' || i || '= ' || vn_base_num * i);
   END LOOP;      
END;


-- NULL ��
DECLARE
    vn_variable VARCHAR2(3) := 'C';
BEGIN
    IF vn_variable = 'A' THEN
        DBMS_OUTPUT.PUT_LINE ('A');
    ELSIF vn_variable = 'B' THEN
        DBMS_OUTPUT.PUT_LINE ('B');
    ELSE NULL;
    END IF;
END;

IF vn_variable = 'A' THEN
   ó������1;
ELSIF vn_variable = 'B' THEN
   ó������2;
...
ELSE NULL;
END IF;

CASE WHEN vn_variable = 'A' THEN
          ó������1;
     WHEN vn_variable = 'B' THEN
          ó������2;      
     ...
     ELSE NULL;
END CASE;     


-- �Լ�

CREATE OR REPLACE FUNCTION my_mod ( num1 NUMBER, num2 NUMBER )
   RETURN NUMBER  -- ��ȯ ������Ÿ���� NUMBER
IS
   vn_remainder NUMBER := 0; -- ��ȯ�� ������
   vn_quotient  NUMBER := 0; -- �� 
BEGIN
	 
	 vn_quotient  := FLOOR(num1 / num2); -- ������/���� ������� ���� �κ��� �ɷ�����
	 vn_remainder := num1 - ( num2 * vn_quotient); --������ = ������ - ( ���� * ��)
	 
	 RETURN vn_remainder;  -- �������� ��ȯ
	
END;	
  
  
SELECT my_mod(14, 3) reminder
  FROM DUAL;  
  

CREATE OR REPLACE FUNCTION fn_get_country_name ( p_country_id NUMBER )
   RETURN VARCHAR2  -- �������� ��ȯ�ϹǷ� ��ȯ ������Ÿ���� VARCHAR2
IS
   vs_country_name COUNTRIES.COUNTRY_NAME%TYPE;
BEGIN
	 
	 SELECT country_name
	   INTO vs_country_name
	   FROM countries
	  WHERE country_id = p_country_id;
	 
	 RETURN vs_country_name;  -- ������ ��ȯ
	
END;	


SELECT fn_get_country_name (52777) COUN1, fn_get_country_name(10000) COUN2
  FROM DUAL;
  
CREATE OR REPLACE FUNCTION fn_get_country_name ( p_country_id NUMBER )
   RETURN VARCHAR2  -- �������� ��ȯ�ϹǷ� ��ȯ ������Ÿ���� VARCHAR2
IS
   vs_country_name COUNTRIES.COUNTRY_NAME%TYPE;
   vn_count NUMBER := 0;
BEGIN
	
	
	SELECT COUNT(*)
	  INTO vn_count
	  FROM countries
	 WHERE country_id = p_country_id;
	 
  IF vn_count = 0 THEN
     vs_country_name := '�ش籹�� ����';
  ELSE
	
	  SELECT country_name
	    INTO vs_country_name
	    FROM countries
	   WHERE country_id = p_country_id;
	      
  END IF;
	 
 RETURN vs_country_name;  -- ������ ��ȯ
	
END;	  
  
SELECT fn_get_country_name (52777) COUN1, fn_get_country_name(10000) COUN2
  FROM DUAL;
  

CREATE OR REPLACE FUNCTION fn_get_user
   RETURN VARCHAR2  -- ��ȯ ������Ÿ���� VARCHAR2
IS
   vs_user_name VARCHAR2(80);
BEGIN
	SELECT USER
    INTO vs_user_name
    FROM DUAL;
		 
  RETURN vs_user_name;  -- ������̸� ��ȯ
	
END;	 	

SELECT fn_get_user(),fn_get_user
  FROM DUAL;


-- ���ν��� ����

CREATE OR REPLACE PROCEDURE my_new_job_proc 
          ( p_job_id    IN JOBS.JOB_ID%TYPE,
            p_job_title IN JOBS.JOB_TITLE%TYPE,
            p_min_sal   IN JOBS.MIN_SALARY%TYPE,
            p_max_sal   IN JOBS.MAX_SALARY%TYPE )
IS

BEGIN
	
	INSERT INTO JOBS ( job_id, job_title, min_salary, max_salary, create_date, update_date)
	          VALUES ( p_job_id, p_job_title, p_min_sal, p_max_sal, SYSDATE, SYSDATE);
	          
	COMMIT;
	
	
END ;            

-- ���ν��� ����

EXEC my_new_job_proc ('SM_JOB1', 'Sample JOB1', 1000, 5000);

SELECT *
  FROM jobs
 WHERE job_id = 'SM_JOB1';
 
EXEC my_new_job_proc ('SM_JOB1', 'Sample JOB1', 1000, 5000); 
 
 
CREATE OR REPLACE PROCEDURE my_new_job_proc 
          ( p_job_id    IN JOBS.JOB_ID%TYPE,
            p_job_title IN JOBS.JOB_TITLE%TYPE,
            p_min_sal   IN JOBS.MIN_SALARY%TYPE,
            p_max_sal   IN JOBS.MAX_SALARY%TYPE )
IS
  vn_cnt NUMBER := 0;
BEGIN
	
	-- ������ job_id�� �ִ��� üũ
	SELECT COUNT(*)
	  INTO vn_cnt
	  FROM JOBS
	 WHERE job_id = p_job_id;
	 
	-- ������ INSERT 
	IF vn_cnt = 0 THEN 
	
	   INSERT INTO JOBS ( job_id, job_title, min_salary, max_salary, create_date, update_date)
	             VALUES ( p_job_id, p_job_title, p_min_sal, p_max_sal, SYSDATE, SYSDATE);
	             
	ELSE -- ������ UPDATE
	
	   UPDATE JOBS
	      SET job_title   = p_job_title,
	          min_salary  = p_min_sal,
	          max_salary  = p_max_sal,
	          update_date = SYSDATE
	    WHERE job_id = p_job_id;
	
  END IF;
	          
	COMMIT;
	
	
END ;   

EXEC my_new_job_proc ('SM_JOB1', 'Sample JOB1', 2000, 6000);


SELECT *
  FROM jobs
 WHERE job_id = 'SM_JOB1';
 
 
-- �Ű����� ����Ʈ �� ���� 
 
EXEC my_new_job_proc ('SM_JOB1', 'Sample JOB1'); 
 
 
CREATE OR REPLACE PROCEDURE my_new_job_proc 
          ( p_job_id    IN JOBS.JOB_ID%TYPE,
            p_job_title IN JOBS.JOB_TITLE%TYPE,
            p_min_sal   IN JOBS.MIN_SALARY%TYPE := 10,
            p_max_sal   IN JOBS.MAX_SALARY%TYPE := 100 )
IS
  vn_cnt NUMBER := 0;
BEGIN
	
	-- ������ job_id�� �ִ��� üũ
	SELECT COUNT(*)
	  INTO vn_cnt
	  FROM JOBS
	 WHERE job_id = p_job_id;
	 
	-- ������ INSERT 
	IF vn_cnt = 0 THEN 
	
	   INSERT INTO JOBS ( job_id, job_title, min_salary, max_salary, create_date, update_date)
	             VALUES ( p_job_id, p_job_title, p_min_sal, p_max_sal, SYSDATE, SYSDATE);
	             
	ELSE -- ������ UPDATE
	
	   UPDATE JOBS
	      SET job_title   = p_job_title,
	          min_salary  = p_min_sal,
	          max_salary  = p_max_sal,
	          update_date = SYSDATE
	    WHERE job_id = p_job_id;
	
  END IF;
	          
	COMMIT;
	
	
END ;    


EXECUTE my_new_job_proc ('SM_JOB1', 'Sample JOB1');

SELECT *
  FROM jobs
 WHERE job_id = 'SM_JOB1';
 
-- OUT, IN OUT �Ű����� ���

CREATE OR REPLACE PROCEDURE my_new_job_proc 
          ( p_job_id    IN  JOBS.JOB_ID%TYPE,
            p_job_title IN  JOBS.JOB_TITLE%TYPE,
            p_min_sal   IN  JOBS.MIN_SALARY%TYPE := 10,
            p_max_sal   IN  JOBS.MAX_SALARY%TYPE := 100,
            p_upd_date  OUT JOBS.UPDATE_DATE%TYPE  )
IS
  vn_cnt NUMBER := 0;
  vn_cur_date JOBS.UPDATE_DATE%TYPE := SYSDATE;
BEGIN
	
	-- ������ job_id�� �ִ��� üũ
	SELECT COUNT(*)
	  INTO vn_cnt
	  FROM JOBS
	 WHERE job_id = p_job_id;
	 
	-- ������ INSERT 
	IF vn_cnt = 0 THEN 
	
	   INSERT INTO JOBS ( job_id, job_title, min_salary, max_salary, create_date, update_date)
	             VALUES ( p_job_id, p_job_title, p_min_sal, p_max_sal, vn_cur_date, vn_cur_date);
	             
	ELSE -- ������ UPDATE
	
	   UPDATE JOBS
	      SET job_title   = p_job_title,
	          min_salary  = p_min_sal,
	          max_salary  = p_max_sal,
	          update_date = vn_cur_date
	    WHERE job_id = p_job_id;
	
  END IF;
  
	-- OUT �Ű������� ���� �Ҵ�
	p_upd_date := vn_cur_date;
	          
	COMMIT;
	
	
END ;   


DECLARE
   vd_cur_date JOBS.UPDATE_DATE%TYPE;
BEGIN
	 my_new_job_proc ('SM_JOB1', 'Sample JOB1', 2000, 6000, vd_cur_date);
	 
	 DBMS_OUTPUT.PUT_LINE(vd_cur_date);
END;


CREATE OR REPLACE PROCEDURE my_parameter_test_proc (
               p_var1        VARCHAR2,
               p_var2 OUT    VARCHAR2,
               p_var3 IN OUT VARCHAR2 )
IS

BEGIN
	 DBMS_OUTPUT.PUT_LINE('p_var1 value = ' || p_var1);
	 DBMS_OUTPUT.PUT_LINE('p_var2 value = ' || p_var2);
	 DBMS_OUTPUT.PUT_LINE('p_var3 value = ' || p_var3);
	 
	 p_var2 := 'B2';
	 p_var3 := 'C2';
	
END;               


DECLARE 
   v_var1 VARCHAR2(10) := 'A';
   v_var2 VARCHAR2(10) := 'B';
   v_var3 VARCHAR2(10) := 'C';
BEGIN
	 my_parameter_test_proc (v_var1, v_var2, v_var3);
	 
	 DBMS_OUTPUT.PUT_LINE('v_var2 value = ' || v_var2);
	 DBMS_OUTPUT.PUT_LINE('v_var3 value = ' || v_var3);
END;


-- RETURN ��
CREATE OR REPLACE PROCEDURE my_new_job_proc 
          ( p_job_id    IN  JOBS.JOB_ID%TYPE,
            p_job_title IN  JOBS.JOB_TITLE%TYPE,
            p_min_sal   IN  JOBS.MIN_SALARY%TYPE := 10,
            p_max_sal   IN  JOBS.MAX_SALARY%TYPE := 100
            --p_upd_date  OUT JOBS.UPDATE_DATE%TYPE  
            )
IS
  vn_cnt NUMBER := 0;
  vn_cur_date JOBS.UPDATE_DATE%TYPE := SYSDATE;
BEGIN
	-- 1000 ���� ������ �޽��� ��� �� ����������
	IF p_min_sal < 1000 THEN
	   DBMS_OUTPUT.PUT_LINE('�ּ� �޿����� 1000 �̻��̾�� �մϴ�');
	   RETURN;
  END IF;
	
	-- ������ job_id�� �ִ��� üũ
	SELECT COUNT(*)
	  INTO vn_cnt
	  FROM JOBS
	 WHERE job_id = p_job_id;
	 
	-- ������ INSERT 
	IF vn_cnt = 0 THEN 
	
	   INSERT INTO JOBS ( job_id, job_title, min_salary, max_salary, create_date, update_date)
	             VALUES ( p_job_id, p_job_title, p_min_sal, p_max_sal, vn_cur_date, vn_cur_date);
	             
	ELSE -- ������ UPDATE
	   UPDATE JOBS
	      SET job_title   = p_job_title,
	          min_salary  = p_min_sal,
	          max_salary  = p_max_sal,
	          update_date = vn_cur_date
	    WHERE job_id = p_job_id;
  END IF;   
	COMMIT;
END ;   


 

--- ���� ���Ͽ� 1
DECLARE
  vs_emp_name VARCHAR2(80);
BEGIN
	vs_emp_name := 'kim';
	
	UPDATE employees 
	   SET emp_name = vs_emp_name
	 WHERE employee_id = 100;
	 
	SELECT emp_name
	  INTO vs_emp_name
	  FROM employees
	 WHERE employee_id = 100;
	 
	DBMS_OUTPUT.PUT_LINE(vs_emp_name);
	
END;

--��������

1. ������ �������� ����ϴ� �͸����̴�. �� ����� �����غ��� ����� �� �׷��� ���Դ��� ������ ����. 

DECLARE
   vn_base_num NUMBER := 3;
BEGIN   
   FOR i IN REVERSE 1..9
   LOOP
      DBMS_OUTPUT.PUT_LINE (vn_base_num || '*' || i || '= ' || vn_base_num * i);      
   END LOOP;    
END;


<����>
�ƹ��͵� ������� �ʴ´�. �� ������ REVERSE�� ����� ��� ���������� ������ 1�� �����ϸ� �ʱⰪ�� �̸��µ�,
�������� 1, �ʱⰪ�� 9�̹Ƿ� ������ �������� �ʴ� ���̴�. 



2. SQL �Լ� �� INITCAP�̶� �Լ��� �ִ�. �� �Լ��� �Ű������� ������ ���ڿ����� �� ���ڸ� �빮�ڷ� ��ȯ�ϴ� �Լ��̴�.
   INITCAP�� �Ȱ��� �����ϴ� my_initcap �̶� �̸����� �Լ��� ������. 
   (�� ���⼭�� ���� �� ���ڷ� �ܾ� ���̸� �����Ѵٰ� �����Ѵ�)

CREATE OR REPLACE FUNCTION my_initcap (input_string VARCHAR2)
    RETURN VARCHAR2
IS
    vs_string VARCHAR2(80) := input_string;
    vn_pos NUMBER := 1;
    vn_length NUMBER;    
    vs_return VARCHAR2(100);
BEGIN
    while vn_pos != 0
    LOOP
        vn_pos := INSTR(vs_string, ' '); -- 6
        vn_length := LENGTH(vs_string); -- ��ü����
        IF vn_pos = 0 THEN
            vs_return := vs_return || UPPER(SUBSTR(vs_string, 1, 1)) || SUBSTR(vs_string, 2, vn_length);
        ELSE
            vs_return := vs_return || UPPER(SUBSTR(vs_string, 1, 1)) || SUBSTR(vs_string, 2, vn_pos-1); --null + H + ���� �������
        END IF;
        vs_string := SUBSTR(vs_string, vn_pos+1, vn_length);
    END LOOP;    
    RETURN vs_return;
END;

SELECT my_initcap('happy birth day to you') string
from DUAL;

<����>

CREATE OR REPLACE FUNCTION my_initcap ( ps_string VARCHAR2 )
   RETURN VARCHAR2
IS
   vn_pos1   NUMBER := 1;   -- �� �ܾ� ���� ��ġ
   vs_temp   VARCHAR2(100) :=  ps_string;
   vs_return VARCHAR2(80);  -- ��ȯ�� �빮�ڷ� ��ȯ�� ���ڿ� ����
   vn_len   NUMBER;         -- 
BEGIN
   
   WHILE vn_pos1 <> 0 -- ���鹮�ڸ� �߰����� ���� ������ ������ ����. 
   LOOP
       -- ���鹮���� ��ġ�� �����´�. 
       vn_pos1 := INSTR(vs_temp, ' ');
       
       IF vn_pos1 = 0 THEN -- ���鹮�ڸ� �߰����� ������ ���, �� �� ������ �ܾ��� ���....
          vs_return := vs_return || UPPER(SUBSTR(vs_temp, 1, 1)) ||SUBSTR(vs_temp, 2, vn_len -1);
       ELSE -- ���鹮�� ��ġ�� ��������, �� ù�ڴ� UPPER�� ����� �빮�ڷ� ��ȯ�ϰ�, ������ ���ڸ� �߶� ������ �ִ´�. 
          vs_return := vs_return || UPPER(SUBSTR(vs_temp, 1, 1)) ||SUBSTR(vs_temp, 2, vn_pos1 -2) || ' ';
       END IF;      


       vn_len := LENGTH(vs_temp);
       -- vs_temp ������ ���� ��ü ���ڿ��� ������, ������ ���鼭 �� �ܾ ���ʷ� ���ش�.
       vs_temp := SUBSTR(vs_temp, vn_pos1+1, vn_len - vn_pos1);

   
   END LOOP;
  
   RETURN vs_return;
END;


3. ��¥�� SQL �Լ� �߿��� �ش� �� ������ ���ڸ� ��ȯ�ϴ� LAST_DAY�� �Լ��� �ִ�.
   �Ű������� ���������� ���ڸ� �޾�, �ش� ������ �� ������ ��¥�� ���������� ��ȯ�ϴ� �Լ��� my_last_day�� �̸����� ����� ����.


CREATE OR REPLACE FUNCTION my_last_day ( input_date VARCHAR2 )
    RETURN VARCHAR2
IS
    vs_input_string VARCHAR2(20);
    vs_return_date VARCHAR2(20);
    vs_year VARCHAR2(100);
    vs_month VARCHAR2(100);
BEGIN
    vs_input_string := REPLACE(input_date, '-', '');
    IF LENGTH(vs_input_string) <> 8 THEN
        vs_input_string := '�Է°� ����';
    ELSE
        vs_year := SUBSTR(vs_input_string, 1, 4);
        vs_month := SUBSTR(vs_input_string, 5, 2);
        
        IF vs_month = 12 THEN
            vs_year := TO_CHAR(TO_NUMBER(vs_year)+1);
            vs_month := '01';
        ELSE
            vs_month := TRIM(TO_CHAR(TO_NUMBER(vs_month)+1, '00'));
        END IF;
        
        vs_return_date := TO_CHAR(TO_DATE(vs_year || vs_month || '01', 'YYYY-MM-DD') -1, 'YYYYMMDD');
    END IF;
    
    RETURN vs_return_date;
END;

SELECT my_last_day('2021-12-11') ddate
FROM DUAL;













<����>   
   
CREATE OR REPLACE FUNCTION my_last_day ( p_input_date VARCHAR2)
    RETURN VARCHAR2
IS
   vs_input_date  VARCHAR2(10) := p_input_date;
   vs_temp_year   VARCHAR2(4);
   vs_temp_month  VARCHAR2(2);   
   vs_return_date VARCHAR2(50);
BEGIN
	 
	 -- �Է����ڿ��� '-'�� ���� 
	 vs_input_date := REPLACE(vs_input_date, '-', '');
	
	 -- �Է����ڿ��� '-'�� ������ ���ڿ� ���̰� 8�� �ƴ� ��� ���� �޽��� ���
	 IF LENGTH(vs_input_date) <> 8 THEN
	    vs_return_date := '�Է����� ����';
	 ELSE
	   vs_temp_year  := SUBSTR(vs_input_date, 1, 4); -- �⵵�� ������
	   vs_temp_month := SUBSTR(vs_input_date, 5, 2); -- ���� ������
	   
	   IF vs_temp_month = '12' THEN -- ���� 12���̸� 
	      -- �⵵�� +1, 
	      vs_temp_year := TO_CHAR(TO_NUMBER(vs_temp_year) + 1);
	      -- ���� ������ 1�� 
	      vs_temp_month := '01';
	      
	   ELSE
	      -- 12���� �ƴϸ� ���� ������ +1
	      vs_temp_month := TRIM(TO_CHAR(TO_NUMBER(vs_temp_month) + 1, '00'));
	   END IF;   
	   
	   -- �⵵ + ������ + 01�Ͽ��� -1���� �ϸ� �Է����� ���� ������ ���ڰ� ����
	   vs_return_date := TO_CHAR(TO_DATE(vs_temp_year || vs_temp_month || '01', 'YYYY-MM-DD') -1, 'YYYYMMDD');
	 END IF; 
	 
	 RETURN vs_return_date;
	
END;   



4. �Ʒ��� ���̺��� ������ ����.

   CREATE TABLE ch09_dept (
          DEPARTMENT_ID    NUMBER,
          DEPARTMENT_NAME  VARCHAR2(100),
          LEVELS           NUMBER );
          
7�忡�� ����� �μ��� ������ ������ ����� �� ���̺� �μ��� ���������� �ִ� my_hier_dept_proc�� ���ν����� �ۼ��ϴµ�, 
�Ű������� ����, ���ν����� �����ϸ� �� ���̺� �ִ� ���� �����͸� �����ϰ� �ٽ� �ִ� ���·� ����� ����. 


<����>

CREATE OR REPLACE PROCEDURE my_hier_dept_proc
IS
BEGIN
	
	DELETE ch09_dept;
	
	INSERT INTO ch11_dept 
	SELECT department_id, LPAD(' ' , 3 * (LEVEL-1)) || department_name, LEVEL
    FROM departments
   START WITH parent_id IS NULL
 CONNECT BY PRIOR department_id  = parent_id;
 
 COMMIT;
	
	
END;


5. �Ʒ� ���ν����� �̹� �忡�� �н��ߴ� my_new_job_proc ���ν����̴�. �� ���ν����� JOBS ���̺� ���� �����Ͱ� ������ INSERT, ������ UPDATE�� �����ϴµ�
   IF���� ����� �����Ͽ���. IF���� �����ϰ� ������ ������ ó���ϵ��� MERGE���� ����� my_new_job_proc2 �� ���ν����� ������ ����. 

CREATE OR REPLACE PROCEDURE my_new_job_proc 
          ( p_job_id    IN JOBS.JOB_ID%TYPE,
            p_job_title IN JOBS.JOB_TITLE%TYPE,
            p_min_sal   IN JOBS.MIN_SALARY%TYPE,
            p_max_sal   IN JOBS.MAX_SALARY%TYPE )
IS
  vn_cnt NUMBER := 0;
BEGIN
-- ������ job_id�� �ִ��� üũ
SELECT COUNT(*)
  INTO vn_cnt
  FROM JOBS
 WHERE job_id = p_job_id;
	 
-- ������ INSERT 
IF vn_cnt = 0 THEN 
   INSERT INTO JOBS ( job_id, job_title, min_salary, max_salary, create_date, update_date)
             VALUES ( p_job_id, p_job_title, p_min_sal, p_max_sal, SYSDATE, SYSDATE);
ELSE -- ������ UPDATE
	UPDATE JOBS
	    SET job_title   = p_job_title,
	        min_salary  = p_min_sal,
	        max_salary  = p_max_sal,
	        update_date = SYSDATE
	   WHERE job_id = p_job_id;	
END IF;
COMMIT;		
END ;


<����>


CREATE OR REPLACE PROCEDURE my_new_job_proc2
          ( p_job_id    IN JOBS.JOB_ID%TYPE,
            p_job_title IN JOBS.JOB_TITLE%TYPE,
            p_min_sal   IN JOBS.MIN_SALARY%TYPE,
            p_max_sal   IN JOBS.MAX_SALARY%TYPE )
IS
BEGIN
	
	MERGE INTO jobs a
	USING ( SELECT p_job_id AS job_id
	          FROM DUAL ) b
	   ON ( a.job_id = b.job_id )
	 WHEN MATCHED THEN
	   UPDATE SET a.job_title  = p_job_title, 
	              a.min_salary = p_min_sal,
	              a.max_salary = p_max_sal
	 WHEN NOT MATCHED THEN 
	   INSERT ( a.job_id, a.job_title, a.min_salary, a.max_salary, a.create_date, a.update_date )
	   VALUES ( p_job_id, p_job_title, p_min_sal, p_max_sal SYSDATE, SYSDATE );
	   
	 COMMIT;

END ;


6. �μ� ���̺��� ���纻 ���̺��� ������ ���� ������.

   CREATE TABLE ch09_departments AS
   SELECT DEPARTMENT_ID, DEPARTMENT_NAME, PARENT_ID
     FROM DEPARTMENTS;
     
�� ���̺��� ������� ������ ���� ó���� �ϴ� ���ν����� my_dept_manage_proc �� �̸����� ������.

(1) �Ű����� : �μ���ȣ, �μ���, �����μ���ȣ, ���� flag 
(2) ���� flag �Ű����� ���� 'upsert' -> �����Ͱ� ������ UPDATE, �ƴϸ� INSERT
                            'delete' -> �ش� �μ� ����
(3) ���� ��, ���� �ش� �μ��� ���� ����� �����ϴ��� ������̺��� üũ�� �����ϸ� ���޽����� �Բ� delete�� ���� �ʴ´�. 



<����>

CREATE OR REPLACE PROCEDURE my_dept_manage_proc
          ( p_department_id    IN ch11_departments.DEPARTMENT_ID%TYPE,
            p_department_name  IN ch11_departments.DEPARTMENT_NAME%TYPE,
            p_parent_id        IN ch11_departments.PARENT_ID%TYPE,
            p_flag             IN VARCHAR2 )
IS
  vn_cnt1 NUMBER := 0;
  vn_cnt2 NUMBER := 0;
BEGIN
	
	-- INSERT�� UPDATE �� ���, ���� flag �Ű������� �ҹ��ڷ� ���� �� �����Ƿ� �빮�ڷ� ��ȯ �� ���� 
	IF UPPER(p_flag) = 'UPSERT' THEN
	
	  MERGE INTO ch09_departments a
  	USING ( SELECT p_department_id AS department_id
	            FROM DUAL ) b
	     ON ( a.department_id = b.department_id )
	   WHEN MATCHED THEN
	     UPDATE SET a.department_name  = p_department_name, 
	                a.parent_id        = p_parent_id
	   WHEN NOT MATCHED THEN 
	     INSERT ( a.department_id, a.department_name, a.parent_id )
	     VALUES ( p_department_id, p_department_name, p_parent_id );	
	
	-- ������ ���
	ELSIF UPPER(p_flag) = 'DELETE' THEN
	
	   -- �ش� �μ��� �ִ��� üũ
	   SELECT COUNT(*)
	     INTO vn_cnt1
	     FROM ch09_departments
	    WHERE department_id = p_department_id;
	    
	   -- �ش� �μ��� ������ �޽����� �Բ� ���ν��� ���� 
	   IF vn_cnt1 = 0 THEN
	      DBMS_OUTPUT.PUT_LINE('�ش� �μ��� ���� ������ �� �����ϴ�');
	      RETURN;
	   END IF;
	   
	   -- �ش� �μ��� ���� ����� �ִ��� üũ
	   SELECT COUNT(*)
	     INTO vn_cnt2
	     FROM employees
	    WHERE department_id = p_department_id;
	    
	   -- �ش� �μ��� ���� ����� ������ �޽����� �Բ� ���ν��� ���� 
	   IF vn_cnt2 > 0 THEN
        DBMS_OUTPUT.PUT_LINE('�ش� �μ��� ���� ����� �����ϹǷ� ������ �� �����ϴ�');
	      RETURN;	   	   
	   END IF;
	   
	   DELETE ch09_departments
	    WHERE department_id = p_department_id;
	
  END IF;
	
	COMMIT;

END ;
