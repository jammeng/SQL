DROP SYNONYM syn_channel;

DROP PUBLIC SYNONYM syn_channel2;

CREATE SEQUENCE my_sql1 INCREMENT BY 1 START WITH 1 MINVALUE 1 MAXVALUE 1000 NOCYCLE NOCACHE;

DELETE ex2_8;

INSERT INTO ex2_8 ( col1 ) VALUES ( my_sql1.NEXTVAL );

SELECT
    *
FROM
    ex2_8;

CREATE TABLE orders (
    order_id      NUMBER(12, 0) PRIMARY KEY,
    order_date    DATE,
    order_mode    VARCHAR2(8 BYTE),
    constraints   mode1 CHECK ( order_mode IN ( 'direct', 'online' ) ),
    customer_id   NUMBER(6, 0),
    order_status  NUMBER(2, 0),
    order_total   NUMBER(8, 2) DEFAULT 0,
    sales_rep_id  NUMBER(6, 0),
    promotion_id  NUMBER(6, 0)
);

CREATE TABLE ORDER_ITEMS (
    ORDER_ID      NUMBER(12, 0),
    LINE_ITEM_ID  NUMBER(3, 0),
    PRODUCT_ID    NUMBER(3, 0),
    UNIT_PRICE    NUMBER(8, 2) DEFAULT 0,
    QUANTITY      NUMBER(8, 0) DEFAULT 0,
    CONSTRAINT PK_ITEMS PRIMARY KEY ( ORDER_ID,
                                      LINE_ITEM_ID )
);

CREATE TABLE PROMOTIONS (
    PROMO_ID    NUMBER(6, 0) PRIMARY KEY,
    PROMO_NAME  VARCHAR2(20)
);

CREATE SEQUENCE ORDERS_SEQ INCREMENT BY 1 START WITH 1000 MINVALUE 1 MAXVALUE 99999999 NOCYCLE NOCACHE;

SELECT
    employee_id,
    emp_name
FROM
    employees
WHERE
        salary > 5000
    AND job_id = 'IT_PROG'
ORDER BY
    employee_id;