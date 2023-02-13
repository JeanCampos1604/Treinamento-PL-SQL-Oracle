CREATE TABLE VISITS
(
    VISIT_ID INTEGER PRIMARY KEY,
    CUSTOMER_ID INTEGER
);

CREATE TABLE TRANSACTIONS
(
    TRANSACTION_ID INTEGER PRIMARY KEY,
    VISIT_ID INTEGER,
    AMOUNT INTEGER
);

INSERT INTO VISITS VALUES (1,23);
INSERT INTO VISITS VALUES (2,9);
INSERT INTO VISITS VALUES (4,30);
INSERT INTO VISITS VALUES (5,54);
INSERT INTO VISITS VALUES (6,96);
INSERT INTO VISITS VALUES (7,54);
INSERT INTO VISITS VALUES (8,54);


INSERT INTO TRANSACTIONS VALUES (2,5,310);
INSERT INTO TRANSACTIONS VALUES (3,5,300);
INSERT INTO TRANSACTIONS VALUES (9,5,200);
INSERT INTO TRANSACTIONS VALUES (12,1,910);
INSERT INTO TRANSACTIONS VALUES (13,2,970);


SELECT * 
  FROM TRANSACTIONS;

SELECT *
  FROM VISITS;
  
SELECT V.CUSTOMER_ID "customer_id",
       COUNT(V.VISIT_ID) "count_no_trans"
  FROM VISITS V, TRANSACTIONS T
  WHERE V.VISIT_ID = T.VISIT_ID (+)
  AND TRANSACTION_ID IS NULL
  GROUP BY V.CUSTOMER_ID;