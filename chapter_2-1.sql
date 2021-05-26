CREATE TABLE ex2_1 (
    column1  CHAR(10),
    column2  VARCHAR2(10),
    column3  NVARCHAR2(10),
    column4  NUMBER
);

INSERT INTO ex2_1 (
    column1,
    column2
) VALUES (
    'abc',
    'abc'
);

SELECT
    column1,
    length(column1)     AS len1,
    column2,
    length(column2)     AS len2
FROM
    ex2_1;
    

CREATE TABLE ex2_2 (
    column1  VARCHAR2(3),
    column2  VARCHAR2(3 BYTE),
    column3  VARCHAR2(3 CHAR)
);

INSERT INTO ex2_2 VALUES('abc', 'abc', 'abc');

SELECT
    column1,
    LENGTH(column1)     AS len1,
    column2,
    LENGTH(column2)     AS len2,
    column3,
    LENGTH(column3)     AS len3
FROM
    ex2_2;
    
INSERT INTO ex2_2 VALUES('±è±â', '±è±âÈÆ', '±è±âÈÆ');

INSERT INTO ex2_2 (column3) VALUES('È«±æµ¿');

select column3, length(column3) as len3, lengthb(column3) as bytelen from ex2_2;

CREATE TABLE ex2_3 (
    col_int  INTEGER,
    col_dec  DECIMAL,
    col_num  NUMBER
);

select column_id, column_name, data_type, data_length
from user_tab_cols
where table_name = 'EX2_3'
order by column_id;

create table ex2_4(
    COL_FLOT1 FLOAT(32),
    COL_FLOT2 FLOAT
);

insert into ex2_4 (col_flot1, col_flot2) values(1234567891234, 1234567891234);

create table ex2_5(
    COL_DATE DATE,
    COL_TIMESTAMP TIMESTAMP
);

insert into ex2_5 VALUES (sysdate, systimestamp);

select* From ex2_5;

CREATE TABLE ex2_6(
    COL_NULL VARCHAR2(10),
    COL_NOT_NULL VARCHAR2(10) NOT NULL
);

insert into ex2_6 values('AA','BB');

insert into ex2_6 values('','BB');

select constraint_name, constraint_type, table_name, search_condition
--from user_constraints   
where table_name = 'EX2_6';

CREATE TABLE ex2_7 (
    COL_UNIQUE_NULL     VARCHAR2(10) UNIQUE,
    COL_UNIQUE_NULLL    VARCHAR2(10) UNIQUE NOT NULL,
    COL_UNIQUE          VARCHAR2(10),
    CONSTRAINTS unique_nm1 UNIQUE (COL_UNIQUE)
);

SELECT constraint_name, constraint_type, table_name, search_condition
    FROM user_constraints
WHERE table_name = 'EX2_7';

INSERT INTO ex2_7 VALUES ('AA', 'AA', 'AA');

INSERT INTO ex2_7 VALUES ('AA', 'AA', 'AA');

INSERT INTO ex2_7 VALUES ('', 'BB', 'BB');

INSERT INTO ex2_7 VALUES ('', 'CC', 'CC');



CREATE TABLE ex2_8 (
    COL1 VARCHAR2(10) PRIMARY KEY,
    COL2 VARCHAR2(10)
);

SELECT constraint_name, constraint_type, table_name, search_condition
    FROM user_constraints
  WHERE table_name = 'EX2_8';

INSERT INTO ex2_8 VALUES ('', 'AA'); --¿À·ù
INSERT INTO ex2_8 VALUES ('AA', 'AA'); 
INSERT INTO ex2_8 VALUES ('AA', 'AA'); --¿À·ù



create table ex2_9(
    num1 number
    constraints check1 check(num1 between 1 and 9),
    gender varchar2(10)
    constraints check2 check(gender in ('MALE','FEMALE'))
);

select constraint_name, constraint_type, table_name, search_condition
from user_constraints
where table_name = 'EX2_9';

insert into ex2_9 values (10, 'MAN');
insert into ex2_9 values (5, 'FEMALE');

create table ex2_10(
    Col1 VARCHAR2(10) NOT NULL,
    Col2 VARCHAR2(10) NULL,
    Create_date DATE DEFAULT SYSDATE
);

insert into ex2_10 (col1, col2) values ('AA','BB');
select * from ex2_10;


alter table ex2_10 rename column col1 to col11;
alter table ex2_10 modify col2 VARCHAR(30);
alter table ex2_10 add col3 number;
desc ex2_10;

alter table ex2_10 drop column col3;

alter table ex2_10 add constraints pk_ex2_10 primary key (col11);

select constraint_name, constraint_type, table_name, search_condition
from user_constraints
where table_name = 'EX2_10';

--select * from user_constraints  where table_name = 'EX2_10';

alter table ex2_10 drop constraints pk_ex2_10;


create table eee12( 
    clo1 VARCHAR2(10)
);
drop table eee12;

create table ex2_9_1 as
select *
from ex2_9;


create or replace view emp_dept_vi as
select a.employee_id, a.emp_name, a.department_id, 
        b.department_name
from employees a, 
    departments b
where a.department_id = b.department_id;

select *
from emp_dept_vi;

create or replace synonym syn_channel
for channels;

select count(*)
from syn_channel;

alter user hr identified by hr account unlock;


create or replace public  synonym syn_channel2
for channels;

grant select on syn_channel2 to public;

