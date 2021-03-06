-- IF 문
DECLARE
   vn_num1 NUMBER := 1;
   vn_num2 NUMBER := 2;
BEGIN
	
	 IF vn_num1 >= vn_num2 THEN
	    DBMS_OUTPUT.PUT_LINE(vn_num1 ||'이 큰 수');
	 ELSE
	    DBMS_OUTPUT.PUT_LINE(vn_num2 ||'이 큰 수');	 
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
     DBMS_OUTPUT.PUT_LINE('낮음');
  
  ELSIF vn_salary BETWEEN 3001 AND 6000 THEN
     DBMS_OUTPUT.PUT_LINE('중간');
  
  ELSIF vn_salary BETWEEN 6001 AND 10000 THEN
     DBMS_OUTPUT.PUT_LINE('높음');
  
  ELSE
     DBMS_OUTPUT.PUT_LINE('최상위');
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

-- CASE 문
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
            DBMS_OUTPUT.PUT_LINE('낮음');
       WHEN vn_salary BETWEEN 3001 AND 6000 THEN
            DBMS_OUTPUT.PUT_LINE('중간');
       WHEN vn_salary BETWEEN 6001 AND 10000 THEN
            DBMS_OUTPUT.PUT_LINE('높음');
       ELSE 
            DBMS_OUTPUT.PUT_LINE('최상위');
  END CASE;

END;

-- LOOP 문
DECLARE
   vn_base_num NUMBER := 3;
   vn_cnt      NUMBER := 1;
BEGIN
   
   LOOP
      DBMS_OUTPUT.PUT_LINE (vn_base_num || '*' || vn_cnt || '= ' || vn_base_num * vn_cnt);
      
      vn_cnt := vn_cnt + 1; -- vn_cnt 값을 1씩 증가
      
      EXIT WHEN vn_cnt >9;  -- vn_cnt가 9보다 크면 루프 종료
   
   END LOOP;
    
END;


-- WHILE 문
DECLARE
   vn_base_num NUMBER := 3;
   vn_cnt      NUMBER := 1;
BEGIN
   
   WHILE  vn_cnt <= 9 -- vn_cnt가 9보다 작거나 같을 경우에만 반복처리 
   LOOP
      DBMS_OUTPUT.PUT_LINE (vn_base_num || '*' || vn_cnt || '= ' || vn_base_num * vn_cnt);
      
      vn_cnt := vn_cnt + 1; -- vn_cnt 값을 1씩 증가
      
   END LOOP;
    
END;

DECLARE
   vn_base_num NUMBER := 3;
   vn_cnt      NUMBER := 1;
BEGIN
   
   WHILE  vn_cnt <= 9 -- vn_cnt가 9보다 작거나 같을 경우에만 반복처리 
   LOOP
      DBMS_OUTPUT.PUT_LINE (vn_base_num || '*' || vn_cnt || '= ' || vn_base_num * vn_cnt);
      EXIT WHEN vn_cnt = 5;
      vn_cnt := vn_cnt + 1; -- vn_cnt 값을 1씩 증가
   END LOOP;    
END;


-- FOR 문
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
 

-- CONTINUE 문
DECLARE
   vn_base_num NUMBER := 3;
BEGIN
   FOR i IN 1..9 
   LOOP
      CONTINUE WHEN i=5;
      DBMS_OUTPUT.PUT_LINE (vn_base_num || '*' || i || '= ' || vn_base_num * i);
   END LOOP;
END;

-- GOTO문
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


-- NULL 문
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
   처리로직1;
ELSIF vn_variable = 'B' THEN
   처리로직2;
...
ELSE NULL;
END IF;

CASE WHEN vn_variable = 'A' THEN
          처리로직1;
     WHEN vn_variable = 'B' THEN
          처리로직2;      
     ...
     ELSE NULL;
END CASE;     


-- 함수

CREATE OR REPLACE FUNCTION my_mod ( num1 NUMBER, num2 NUMBER )
   RETURN NUMBER  -- 반환 데이터타입은 NUMBER
IS
   vn_remainder NUMBER := 0; -- 반환할 나머지
   vn_quotient  NUMBER := 0; -- 몫 
BEGIN
	 
	 vn_quotient  := FLOOR(num1 / num2); -- 피제수/제수 결과에서 정수 부분을 걸러낸다
	 vn_remainder := num1 - ( num2 * vn_quotient); --나머지 = 피제수 - ( 제수 * 몫)
	 
	 RETURN vn_remainder;  -- 나머지를 반환
	
END;	
  
  
SELECT my_mod(14, 3) reminder
  FROM DUAL;  
  

CREATE OR REPLACE FUNCTION fn_get_country_name ( p_country_id NUMBER )
   RETURN VARCHAR2  -- 국가명을 반환하므로 반환 데이터타입은 VARCHAR2
IS
   vs_country_name COUNTRIES.COUNTRY_NAME%TYPE;
BEGIN
	 
	 SELECT country_name
	   INTO vs_country_name
	   FROM countries
	  WHERE country_id = p_country_id;
	 
	 RETURN vs_country_name;  -- 국가명 반환
	
END;	


SELECT fn_get_country_name (52777) COUN1, fn_get_country_name(10000) COUN2
  FROM DUAL;
  
CREATE OR REPLACE FUNCTION fn_get_country_name ( p_country_id NUMBER )
   RETURN VARCHAR2  -- 국가명을 반환하므로 반환 데이터타입은 VARCHAR2
IS
   vs_country_name COUNTRIES.COUNTRY_NAME%TYPE;
   vn_count NUMBER := 0;
BEGIN
	
	
	SELECT COUNT(*)
	  INTO vn_count
	  FROM countries
	 WHERE country_id = p_country_id;
	 
  IF vn_count = 0 THEN
     vs_country_name := '해당국가 없음';
  ELSE
	
	  SELECT country_name
	    INTO vs_country_name
	    FROM countries
	   WHERE country_id = p_country_id;
	      
  END IF;
	 
 RETURN vs_country_name;  -- 국가명 반환
	
END;	  
  
SELECT fn_get_country_name (52777) COUN1, fn_get_country_name(10000) COUN2
  FROM DUAL;
  

CREATE OR REPLACE FUNCTION fn_get_user
   RETURN VARCHAR2  -- 반환 데이터타입은 VARCHAR2
IS
   vs_user_name VARCHAR2(80);
BEGIN
	SELECT USER
    INTO vs_user_name
    FROM DUAL;
		 
  RETURN vs_user_name;  -- 사용자이름 반환
	
END;	 	

SELECT fn_get_user(),fn_get_user
  FROM DUAL;


-- 프로시저 생성

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

-- 프로시저 실행

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
	
	-- 동일한 job_id가 있는지 체크
	SELECT COUNT(*)
	  INTO vn_cnt
	  FROM JOBS
	 WHERE job_id = p_job_id;
	 
	-- 없으면 INSERT 
	IF vn_cnt = 0 THEN 
	
	   INSERT INTO JOBS ( job_id, job_title, min_salary, max_salary, create_date, update_date)
	             VALUES ( p_job_id, p_job_title, p_min_sal, p_max_sal, SYSDATE, SYSDATE);
	             
	ELSE -- 있으면 UPDATE
	
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
 
 
-- 매개변수 디폴트 값 설정 
 
EXEC my_new_job_proc ('SM_JOB1', 'Sample JOB1'); 
 
 
CREATE OR REPLACE PROCEDURE my_new_job_proc 
          ( p_job_id    IN JOBS.JOB_ID%TYPE,
            p_job_title IN JOBS.JOB_TITLE%TYPE,
            p_min_sal   IN JOBS.MIN_SALARY%TYPE := 10,
            p_max_sal   IN JOBS.MAX_SALARY%TYPE := 100 )
IS
  vn_cnt NUMBER := 0;
BEGIN
	
	-- 동일한 job_id가 있는지 체크
	SELECT COUNT(*)
	  INTO vn_cnt
	  FROM JOBS
	 WHERE job_id = p_job_id;
	 
	-- 없으면 INSERT 
	IF vn_cnt = 0 THEN 
	
	   INSERT INTO JOBS ( job_id, job_title, min_salary, max_salary, create_date, update_date)
	             VALUES ( p_job_id, p_job_title, p_min_sal, p_max_sal, SYSDATE, SYSDATE);
	             
	ELSE -- 있으면 UPDATE
	
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
 
-- OUT, IN OUT 매개변수 사용

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
	
	-- 동일한 job_id가 있는지 체크
	SELECT COUNT(*)
	  INTO vn_cnt
	  FROM JOBS
	 WHERE job_id = p_job_id;
	 
	-- 없으면 INSERT 
	IF vn_cnt = 0 THEN 
	
	   INSERT INTO JOBS ( job_id, job_title, min_salary, max_salary, create_date, update_date)
	             VALUES ( p_job_id, p_job_title, p_min_sal, p_max_sal, vn_cur_date, vn_cur_date);
	             
	ELSE -- 있으면 UPDATE
	
	   UPDATE JOBS
	      SET job_title   = p_job_title,
	          min_salary  = p_min_sal,
	          max_salary  = p_max_sal,
	          update_date = vn_cur_date
	    WHERE job_id = p_job_id;
	
  END IF;
  
	-- OUT 매개변수에 일자 할당
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


-- RETURN 문
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
	-- 1000 보다 작으면 메시지 출력 후 빠져나간다
	IF p_min_sal < 1000 THEN
	   DBMS_OUTPUT.PUT_LINE('최소 급여값은 1000 이상이어야 합니다');
	   RETURN;
  END IF;
	
	-- 동일한 job_id가 있는지 체크
	SELECT COUNT(*)
	  INTO vn_cnt
	  FROM JOBS
	 WHERE job_id = p_job_id;
	 
	-- 없으면 INSERT 
	IF vn_cnt = 0 THEN 
	
	   INSERT INTO JOBS ( job_id, job_title, min_salary, max_salary, create_date, update_date)
	             VALUES ( p_job_id, p_job_title, p_min_sal, p_max_sal, vn_cur_date, vn_cur_date);
	             
	ELSE -- 있으면 UPDATE
	   UPDATE JOBS
	      SET job_title   = p_job_title,
	          min_salary  = p_min_sal,
	          max_salary  = p_max_sal,
	          update_date = vn_cur_date
	    WHERE job_id = p_job_id;
  END IF;   
	COMMIT;
END ;   


 

--- 현장 노하우 1
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

--연습문제

1. 다음은 구구단을 출력하는 익명블록이다. 이 블록을 실행해보고 결과가 왜 그렇게 나왔는지 설명해 보자. 

DECLARE
   vn_base_num NUMBER := 3;
BEGIN   
   FOR i IN REVERSE 1..9
   LOOP
      DBMS_OUTPUT.PUT_LINE (vn_base_num || '*' || i || '= ' || vn_base_num * i);      
   END LOOP;    
END;


<정답>
아무것도 출력하지 않는다. 그 이유는 REVERSE를 명시할 경우 최종값에서 시작해 1씩 감소하며 초기값에 이르는데,
최종값이 1, 초기값이 9이므로 루프를 수행하지 않는 것이다. 



2. SQL 함수 중 INITCAP이란 함수가 있다. 이 함수는 매개변수로 전달한 문자열에서 앞 글자만 대문자로 변환하는 함수이다.
   INITCAP과 똑같이 동작하는 my_initcap 이란 이름으로 함수를 만들어보자. 
   (단 여기서는 공백 한 글자로 단어 사이를 구분한다고 가정한다)

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
        vn_length := LENGTH(vs_string); -- 전체길이
        IF vn_pos = 0 THEN
            vs_return := vs_return || UPPER(SUBSTR(vs_string, 1, 1)) || SUBSTR(vs_string, 2, vn_length);
        ELSE
            vs_return := vs_return || UPPER(SUBSTR(vs_string, 1, 1)) || SUBSTR(vs_string, 2, vn_pos-1); --null + H + 다음 공백까지
        END IF;
        vs_string := SUBSTR(vs_string, vn_pos+1, vn_length);
    END LOOP;    
    RETURN vs_return;
END;

SELECT my_initcap('happy birth day to you') string
from DUAL;

<정답>

CREATE OR REPLACE FUNCTION my_initcap ( ps_string VARCHAR2 )
   RETURN VARCHAR2
IS
   vn_pos1   NUMBER := 1;   -- 각 단어 시작 위치
   vs_temp   VARCHAR2(100) :=  ps_string;
   vs_return VARCHAR2(80);  -- 반환할 대문자로 변환된 문자열 변수
   vn_len   NUMBER;         -- 
BEGIN
   
   WHILE vn_pos1 <> 0 -- 공백문자를 발견하지 못할 때까지 루프를 돈다. 
   LOOP
       -- 공백문자의 위치를 가져온다. 
       vn_pos1 := INSTR(vs_temp, ' ');
       
       IF vn_pos1 = 0 THEN -- 공백문자를 발견하지 못했을 경우, 즉 맨 마지막 단어일 경우....
          vs_return := vs_return || UPPER(SUBSTR(vs_temp, 1, 1)) ||SUBSTR(vs_temp, 2, vn_len -1);
       ELSE -- 공백문자 위치를 기준으로, 맨 첫자는 UPPER를 사용해 대문자로 변환하고, 나머지 문자를 잘라서 변수에 넣는다. 
          vs_return := vs_return || UPPER(SUBSTR(vs_temp, 1, 1)) ||SUBSTR(vs_temp, 2, vn_pos1 -2) || ' ';
       END IF;      


       vn_len := LENGTH(vs_temp);
       -- vs_temp 변수는 최초 전체 문자열이 들어오며, 루프를 돌면서 한 단어씩 차례로 없앤다.
       vs_temp := SUBSTR(vs_temp, vn_pos1+1, vn_len - vn_pos1);

   
   END LOOP;
  
   RETURN vs_return;
END;


3. 날짜형 SQL 함수 중에는 해당 월 마지막 일자를 반환하는 LAST_DAY란 함수가 있다.
   매개변수로 문자형으로 일자를 받아, 해당 일자의 월 마지막 날짜를 문자형으로 반환하는 함수를 my_last_day란 이름으로 만들어 보자.


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
        vs_input_string := '입력값 오류';
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













<정답>   
   
CREATE OR REPLACE FUNCTION my_last_day ( p_input_date VARCHAR2)
    RETURN VARCHAR2
IS
   vs_input_date  VARCHAR2(10) := p_input_date;
   vs_temp_year   VARCHAR2(4);
   vs_temp_month  VARCHAR2(2);   
   vs_return_date VARCHAR2(50);
BEGIN
	 
	 -- 입력일자에서 '-'를 제거 
	 vs_input_date := REPLACE(vs_input_date, '-', '');
	
	 -- 입력일자에서 '-'를 제거한 문자열 길이가 8이 아닐 경우 오류 메시지 출력
	 IF LENGTH(vs_input_date) <> 8 THEN
	    vs_return_date := '입력일자 오류';
	 ELSE
	   vs_temp_year  := SUBSTR(vs_input_date, 1, 4); -- 년도를 가져옴
	   vs_temp_month := SUBSTR(vs_input_date, 5, 2); -- 월을 가져옴
	   
	   IF vs_temp_month = '12' THEN -- 월이 12월이면 
	      -- 년도는 +1, 
	      vs_temp_year := TO_CHAR(TO_NUMBER(vs_temp_year) + 1);
	      -- 월은 무조건 1월 
	      vs_temp_month := '01';
	      
	   ELSE
	      -- 12월이 아니면 기존 월에서 +1
	      vs_temp_month := TRIM(TO_CHAR(TO_NUMBER(vs_temp_month) + 1, '00'));
	   END IF;   
	   
	   -- 년도 + 다음월 + 01일에서 -1일을 하면 입력일자 월의 마지막 일자가 나옴
	   vs_return_date := TO_CHAR(TO_DATE(vs_temp_year || vs_temp_month || '01', 'YYYY-MM-DD') -1, 'YYYYMMDD');
	 END IF; 
	 
	 RETURN vs_return_date;
	
END;   



4. 아래의 테이블을 생성해 보자.

   CREATE TABLE ch09_dept (
          DEPARTMENT_ID    NUMBER,
          DEPARTMENT_NAME  VARCHAR2(100),
          LEVELS           NUMBER );
          
7장에서 배웠던 부서별 계층형 쿼리를 사용해 위 테이블에 부서별 계층정보를 넣는 my_hier_dept_proc란 프로시저를 작성하는데, 
매개변수는 없고, 프로시저를 실행하면 위 테이블에 있는 기존 데이터를 삭제하고 다시 넣는 형태로 만들어 보자. 


<정답>

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


5. 아래 프로시저는 이번 장에서 학습했던 my_new_job_proc 프로시저이다. 이 프로시저는 JOBS 테이블에 기존 데이터가 없으면 INSERT, 있으면 UPDATE를 수행하는데
   IF문을 사용해 구현하였다. IF문을 제거하고 동일한 로직을 처리하도록 MERGE문을 사용해 my_new_job_proc2 란 프로시저를 생성해 보자. 

CREATE OR REPLACE PROCEDURE my_new_job_proc 
          ( p_job_id    IN JOBS.JOB_ID%TYPE,
            p_job_title IN JOBS.JOB_TITLE%TYPE,
            p_min_sal   IN JOBS.MIN_SALARY%TYPE,
            p_max_sal   IN JOBS.MAX_SALARY%TYPE )
IS
  vn_cnt NUMBER := 0;
BEGIN
-- 동일한 job_id가 있는지 체크
SELECT COUNT(*)
  INTO vn_cnt
  FROM JOBS
 WHERE job_id = p_job_id;
	 
-- 없으면 INSERT 
IF vn_cnt = 0 THEN 
   INSERT INTO JOBS ( job_id, job_title, min_salary, max_salary, create_date, update_date)
             VALUES ( p_job_id, p_job_title, p_min_sal, p_max_sal, SYSDATE, SYSDATE);
ELSE -- 있으면 UPDATE
	UPDATE JOBS
	    SET job_title   = p_job_title,
	        min_salary  = p_min_sal,
	        max_salary  = p_max_sal,
	        update_date = SYSDATE
	   WHERE job_id = p_job_id;	
END IF;
COMMIT;		
END ;


<정답>


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


6. 부서 테이블의 복사본 테이블을 다음과 같이 만들어보자.

   CREATE TABLE ch09_departments AS
   SELECT DEPARTMENT_ID, DEPARTMENT_NAME, PARENT_ID
     FROM DEPARTMENTS;
     
위 테이블을 대상으로 다음과 같은 처리를 하는 프로시저를 my_dept_manage_proc 란 이름으로 만들어보자.

(1) 매개변수 : 부서번호, 부서명, 상위부서번호, 동작 flag 
(2) 동작 flag 매개변수 값은 'upsert' -> 데이터가 있으면 UPDATE, 아니면 INSERT
                            'delete' -> 해당 부서 삭제
(3) 삭제 시, 만약 해당 부서에 속한 사원이 존재하는지 사원테이블을 체크해 존재하면 경고메시지와 함께 delete를 하지 않는다.

CREATE OR REPLACE PROCEDURE my_dept_manage_proc
          ( p_department_id     IN ch09_departments.department_id%TYPE, 
            p_department_name   IN ch09_departments.department_name%TYPE, 
            p_parent_id         IN ch09_departments.parent_id%TYPE,
            p_flag              IN VARCHAR2)
IS
    vn_cnt1 NUMBER := 0;
    vn_cnt2 NUMBER := 0; 
BEGIN
    IF p_flag = 'upsert' THEN
        MERGE INTO ch09_departments a
        USING (SELECT p_department_id as department_id
               from dual) b
           ON (a.department_id = b.department_id)
        WHEN MATCHED THEN
            UPDATE SET a.department_id = p_department_id, 
                       a.department_name = p_department_name, 
                       a.parent_id = p_parent_id
        WHEN NOT MATCHED THEN 
            INSERT (a.department_id, a.department_name, a.parent_id)
            VALUES (p_department_id, p_department_name, p_parent_id);
            
    ELSE IF p_flag = 'delete' THEN
        
        SELECT COUNT(*)
        INTO vn_cnt1
        FROM ch09_departments
        WHERE department_id = p_department_id;
        
        IF vn_cnt1 = 0 THEN
            DBMS_OUTPUT.PUT_LINE('해당 부서는 존재하지 않습니다.');
            RETURN;
        END IF;
        
        SELECT COUNT(*)
        INTO vn_cnt2
        FROM employees e
        WHERE e.department_id = p_department_id;
        
        IF vn_cnt2 > 0 THEN
            DBMS_OUTPUT.PUT_LINE('해당 부서에 아직 사원이 배정 되어 있습니다.');
            RETURN;
        END IF;
        
        DELETE ch09_departments
	    WHERE department_id = p_department_id;
        
    END IF;
    COMMIT;
END;






























<정답>

CREATE OR REPLACE PROCEDURE my_dept_manage_proc
          ( p_department_id    IN ch11_departments.DEPARTMENT_ID%TYPE,
            p_department_name  IN ch11_departments.DEPARTMENT_NAME%TYPE,
            p_parent_id        IN ch11_departments.PARENT_ID%TYPE,
            p_flag             IN VARCHAR2 )
IS
  vn_cnt1 NUMBER := 0;
  vn_cnt2 NUMBER := 0;
BEGIN
	
	-- INSERT나 UPDATE 할 경우, 동작 flag 매개변수가 소문자로 들어올 수 있으므로 대문자로 변환 후 비교함 
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
	
	-- 삭제할 경우
	ELSIF UPPER(p_flag) = 'DELETE' THEN
	
	   -- 해당 부서가 있는지 체크
	   SELECT COUNT(*)
	     INTO vn_cnt1
	     FROM ch09_departments
	    WHERE department_id = p_department_id;
	    
	   -- 해당 부서가 없으면 메시지와 함께 프로시저 종료 
	   IF vn_cnt1 = 0 THEN
	      DBMS_OUTPUT.PUT_LINE('해당 부서가 없어 삭제할 수 없습니다');
	      RETURN;
	   END IF;
	   
	   -- 해당 부서에 속한 사원이 있는지 체크
	   SELECT COUNT(*)
	     INTO vn_cnt2
	     FROM employees
	    WHERE department_id = p_department_id;
	    
	   -- 해당 부서에 속한 사원이 있으면 메시지와 함께 프로시저 종료 
	   IF vn_cnt2 > 0 THEN
        DBMS_OUTPUT.PUT_LINE('해당 부서에 속한 사원이 존재하므로 삭제할 수 없습니다');
	      RETURN;	   	   
	   END IF;
	   
	   DELETE ch09_departments
	    WHERE department_id = p_department_id;
	
  END IF;
	
	COMMIT;

END ;
