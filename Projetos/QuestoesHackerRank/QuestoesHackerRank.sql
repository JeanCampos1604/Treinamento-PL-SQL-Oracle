SELECT DISTINCT CIDADES
  FROM(
SELECT CASE
           WHEN NOME NOT LIKE 'A%' AND NOME NOT LIKE'%A' 
            AND NOME NOT LIKE 'E%' AND NOME NOT LIKE'%E' 
            AND NOME NOT LIKE 'I%' AND NOME NOT LIKE'%I'
            AND NOME NOT LIKE 'O%' AND NOME NOT LIKE'%O'
            AND NOME NOT LIKE 'U%' AND NOME NOT LIKE'%U'
           THEN NOME 
        END AS CIDADES
  FROM TCIDADE
  ) WHERE CIDADES IS NOT NULL;
  
  
SELECT *
  FROM TCIDADE;
 
CREATE TABLE STUDENTS
(
    ID INTEGER PRIMARY KEY,
    NAME VARCHAR(30),
    MARKS INTEGER
);

INSERT INTO STUDENTS VALUES (2,'SAMANTA',85);

SELECT NAME
  FROM (
       SELECT SUBSTR(NAME,-3,3) AS FILTER, NAME
         FROM STUDENTS
         WHERE MARKS > 75
         ORDER BY FILTER, ID
       );
       
       
 
 CREATE TABLE STATION
 (
    LAT_N NUMBER, 
    LONG_W NUMBER
 );
 
 SELECT * FROM STATION;
 
 
SELECT ROUND(LONG_W,4)
  FROM STATION
  WHERE LAT_N = ( SELECT  MIN(LAT_N)
                    FROM STATION
                    WHERE LAT_N > 38.7780
                );
    
    
 SELECT ROUND(LONG_W,4)
  FROM STATION
  WHERE LAT_N IN (SELECT MIN(LAT_N)
                     FROM STATION
                     WHERE LAT_N > 38.7780);