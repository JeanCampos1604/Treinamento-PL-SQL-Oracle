CREATE TABLE USERS2 (USER_ID INT, JOIN_DATE DATE, FAVORITE_BRAND VARCHAR(10));

CREATE TABLE ORDERS (ORDER_ID INT, ORDER_DATE DATE, ITEM_ID INT, BUYER_ID INT, SELLER_ID INT);

CREATE TABLE ITEMS (ITEM_ID INT, ITEM_BRAND VARCHAR(10));


INSERT INTO USERS2 (USER_ID, JOIN_DATE, FAVORITE_BRAND) VALUES ('1', '01/01/2018', 'Lenovo');
INSERT INTO USERS2 (USER_ID, JOIN_DATE, FAVORITE_BRAND) VALUES ('2', '09/02/2018', 'Samsung');
INSERT INTO USERS2 (USER_ID, JOIN_DATE, FAVORITE_BRAND) VALUES ('3', '19/01/2018', 'LG');
INSERT INTO USERS2 (USER_ID, JOIN_DATE, FAVORITE_BRAND) VALUES ('4', '21/05/2018', 'HP');

INSERT INTO ORDERS (ORDER_ID, ORDER_DATE, ITEM_ID, BUYER_ID, SELLER_ID) VALUES ('1', '01/08/2019', '4', '1', '2');
INSERT INTO ORDERS (ORDER_ID, ORDER_DATE, ITEM_ID, BUYER_ID, SELLER_ID) VALUES ('2', '02/08/2018', '2', '1', '3');
INSERT INTO ORDERS (ORDER_ID, ORDER_DATE, ITEM_ID, BUYER_ID, SELLER_ID) VALUES ('3', '03/08/2019', '3', '2', '3');
INSERT INTO ORDERS (ORDER_ID, ORDER_DATE, ITEM_ID, BUYER_ID, SELLER_ID) VALUES ('4', '04/08/2018', '1', '4', '2');
INSERT INTO ORDERS (ORDER_ID, ORDER_DATE, ITEM_ID, BUYER_ID, SELLER_ID) VALUES ('5', '04/08/2018', '1', '3', '4');
INSERT INTO ORDERS (ORDER_ID, ORDER_DATE, ITEM_ID, BUYER_ID, SELLER_ID) VALUES ('6', '05/08/2019', '2', '2', '4');


INSERT INTO ITEMS (ITEM_ID, ITEM_BRAND) VALUES ('1', 'Samsung');
INSERT INTO ITEMS (ITEM_ID, ITEM_BRAND) VALUES ('2', 'Lenovo');
INSERT INTO ITEMS (ITEM_ID, ITEM_BRAND) VALUES ('3', 'LG');
INSERT INTO ITEMS (ITEM_ID, ITEM_BRAND) VALUES ('4', 'HP');

  
SELECT * FROM USERS2;
  
SELECT * FROM ORDERS;

SELECT * FROM ITEMS;
  
  
SELECT U.USER_ID, U.JOIN_DATE,O.ORDER_ID,O.ORDER_DATE,I.ITEM_ID,O.BUYER_ID,O.SELLER_ID, I.ITEM_BRAND
  FROM USERS2 U,ORDERS O,ITEMS I
 WHERE U.USER_ID = O.BUYER_ID
 AND I.ITEM_ID = O.ITEM_ID
 ORDER BY USER_ID, ORDER_DATE;
    
   
SELECT U.USER_ID "buyer_id",
       U.JOIN_DATE "join_date",
       COUNT(CASE
           WHEN (ORDER_DATE BETWEEN '01/01/2019' AND '31/12/2019') THEN 1
           ELSE NULL
       END) "orders_in_2019"
  FROM USERS2 U,ORDERS O
 WHERE U.USER_ID = O.BUYER_ID (+)
 GROUP BY U.USER_ID, U.JOIN_DATE
 ORDER BY 1;
 

 SELECT * FROM USERS2;
 
 SELECT * FROM ORDERS;