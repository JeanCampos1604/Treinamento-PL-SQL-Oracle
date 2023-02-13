CREATE TABLE TRIPS 
(
ID INT PRIMARY KEY, 
CLIENT_ID INT, 
DRIVER_ID INT, 
CITY_ID INT, 
STATUS VARCHAR(30), 
REQUEST_AT VARCHAR(50)
);

CREATE TABLE USERS3 (
USERS_ID INT PRIMARY KEY, 
BANNED VARCHAR(50), 
ROLE VARCHAR(10)
);


INSERT INTO TRIPS (ID, CLIENT_ID, DRIVER_ID, CITY_ID, STATUS, REQUEST_AT) VALUES ('1', '1', '10', '1', 'completed', '2013-10-01');
INSERT INTO TRIPS (ID, CLIENT_ID, DRIVER_ID, CITY_ID, STATUS, REQUEST_AT) VALUES ('2', '2', '11', '1', 'cancelled_by_driver', '2013-10-01');
INSERT INTO TRIPS (ID, CLIENT_ID, DRIVER_ID, CITY_ID, STATUS, REQUEST_AT) VALUES ('3', '3', '12', '6', 'completed', '2013-10-01');
INSERT INTO TRIPS (ID, CLIENT_ID, DRIVER_ID, CITY_ID, STATUS, REQUEST_AT) VALUES ('4', '4', '13', '6', 'cancelled_by_client', '2013-10-01');
INSERT INTO TRIPS (ID, CLIENT_ID, DRIVER_ID, CITY_ID, STATUS, REQUEST_AT) VALUES ('5', '1', '10', '1', 'completed', '2013-10-02');
INSERT INTO TRIPS (ID, CLIENT_ID, DRIVER_ID, CITY_ID, STATUS, REQUEST_AT) VALUES ('6', '2', '11', '6', 'completed', '2013-10-02');
INSERT INTO TRIPS (ID, CLIENT_ID, DRIVER_ID, CITY_ID, STATUS, REQUEST_AT) VALUES ('7', '3', '12', '6', 'completed', '2013-10-02');
INSERT INTO TRIPS (ID, CLIENT_ID, DRIVER_ID, CITY_ID, STATUS, REQUEST_AT) VALUES ('8', '2', '12', '12', 'completed', '2013-10-03');
INSERT INTO TRIPS (ID, CLIENT_ID, DRIVER_ID, CITY_ID, STATUS, REQUEST_AT) VALUES ('9', '3', '10', '12', 'completed', '2013-10-03');
INSERT INTO TRIPS (ID, CLIENT_ID, DRIVER_ID, CITY_ID, STATUS, REQUEST_AT) VALUES ('10', '4', '13', '12', 'cancelled_by_driver', '2013-10-03');

INSERT INTO USERS3 (USERS_ID, BANNED, ROLE) VALUES ('1', 'No', 'client');
INSERT INTO USERS3 (USERS_ID, BANNED, ROLE) VALUES ('2', 'Yes', 'client');
INSERT INTO USERS3 (USERS_ID, BANNED, ROLE) VALUES ('3', 'No', 'client');
INSERT INTO USERS3 (USERS_ID, BANNED, ROLE) VALUES ('4', 'No', 'client');
INSERT INTO USERS3 (USERS_ID, BANNED, ROLE) VALUES ('10', 'No', 'driver');
INSERT INTO USERS3 (USERS_ID, BANNED, ROLE) VALUES ('11', 'No', 'driver');
INSERT INTO USERS3 (USERS_ID, BANNED, ROLE) VALUES ('12', 'No', 'driver');
INSERT INTO USERS3 (USERS_ID, BANNED, ROLE) VALUES ('13', 'No', 'driver');


SELECT *
  FROM USERS3;
 
SELECT *
  FROM TRIPS;
 

SELECT REQUEST_AT "Day",  TRUNC(CORRIDAS_CANCELADAS / CORRIDAS_TOTAL, 2) "Cancellation Rate" FROM(
SELECT T.REQUEST_AT,
        COUNT(CASE
                WHEN DRIVER_ID IN (SELECT USERS_ID FROM USERS3 WHERE BANNED LIKE 'No') 
                AND CLIENT_ID  IN (SELECT USERS_ID FROM USERS3 WHERE BANNED LIKE 'No') THEN 1
             END) AS CORRIDAS_TOTAL,
        COUNT (CASE
                 WHEN T.STATUS LIKE 'cancelled_by_driver' AND DRIVER_ID IN (SELECT USERS_ID FROM USERS3 WHERE BANNED LIKE 'No') 
                 AND CLIENT_ID  IN (SELECT USERS_ID FROM USERS3 WHERE BANNED LIKE 'No') 
                 OR T.STATUS LIKE 'cancelled_by_client' AND DRIVER_ID IN (SELECT USERS_ID FROM USERS3 WHERE BANNED LIKE 'No') 
                 AND CLIENT_ID  IN (SELECT USERS_ID FROM USERS3 WHERE BANNED LIKE 'No') THEN 1
              END) AS CORRIDAS_CANCELADAS
  FROM TRIPS T, USERS3 U
 WHERE U.USERS_ID = T.DRIVER_ID
 AND REQUEST_AT BETWEEN '2013-10-01' AND '2013-10-03'
 GROUP BY T.REQUEST_AT
 ORDER BY 1);
 
SELECT T.REQUEST_AT "Day", 
       ROUND(COUNT(CASE T.STATUS
                      WHEN 'completed' THEN NULL
                      ELSE 0
                    END)/COUNT(*), 2) "Cancellation Rate"
  FROM TRIPS T, USERS3 C, USERS3 D
 WHERE T.CLIENT_ID = C.USERS_ID AND C.BANNED = 'No' 
 AND (T.REQUEST_AT BETWEEN '2013-10-01' AND '2013-10-03')
 AND T.DRIVER_ID = D.USERS_ID AND D.BANNED = 'No'
 GROUP BY T.REQUEST_AT
 ORDER BY 1;