CREATE TABLE PRODUCTS
(
    product_id INTEGER PRIMARY KEY,
    product_name VARCHAR(30),
    unit_price INTEGER
);

CREATE TABLE SALES
(
    SELLER_ID  INTEGER,
    PRODUCT_ID INTEGER,
    BUYER_ID   INTEGER, 
    SALE_DATE  DATE,
    QUANTITY   INTEGER,
    PRICE      INTEGER  
);

INSERT INTO PRODUCTS VALUES (1,'S8',1000);

INSERT INTO PRODUCTS VALUES (2,'G4',800);

INSERT INTO PRODUCTS VALUES (3,'IPHONE',1400);


SELECT * FROM SALES;


INSERT INTO SALES VALUES (1,1,1,'2019-01-21',2,2000);

INSERT INTO SALES VALUES (1,2,2,'2019-02-17',1,800);

INSERT INTO SALES VALUES (2,2,3,'2019-06-02',1,800);

INSERT INTO SALES VALUES (3,3,4,'2019-05-13',2,2800);