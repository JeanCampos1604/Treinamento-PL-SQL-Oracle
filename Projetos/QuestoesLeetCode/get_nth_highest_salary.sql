CREATE TABLE EMPLOYEE_FUNC 
(
    ID INTEGER PRIMARY KEY,
    SALARY INTEGER
);

INSERT INTO EMPLOYEE_FUNC VALUES (1,100);

INSERT INTO EMPLOYEE_FUNC VALUES (2,200);

INSERT INTO EMPLOYEE_FUNC VALUES (3,300);  



SELECT *
  FROM EMPLOYEE_FUNC;
 

--CRIANDO A FUNCTION
CREATE OR REPLACE FUNCTION getNthHighestSalary(N IN NUMBER) 
RETURN NUMBER 
IS
  RESULT NUMBER;
BEGIN
    SELECT SALARY
      INTO RESULT
      FROM(
          SELECT SALARY, ID, RANK () OVER (ORDER BY SALARY DESC) ORDEMSAL
            FROM EMPLOYEE_FUNC
           )
       WHERE ORDEMSAL = N;
    RETURN RESULT;
EXCEPTION 
    WHEN NO_DATA_FOUND THEN
        RETURN NULL;
END;

--CHAMANDO A FUNCTION
DECLARE
    VVALOR NUMBER := 3;
    VRESULT NUMBER;
BEGIN
    VRESULT := getNthHighestSalary(VVALOR);
    Dbms_Output.Put_Line(VRESULT);
END;

SELECT * FROM EMPLOYEE_FUNC ORDER BY SALARY DESC;

--SELECT ORDENADO POR RANK
SELECT SALARY
      FROM(
          SELECT SALARY, ID, RANK () OVER (ORDER BY SALARY DESC) ORDEMSAL
            FROM EMPLOYEE_FUNC
           )
       WHERE ORDEMSAL = 1;