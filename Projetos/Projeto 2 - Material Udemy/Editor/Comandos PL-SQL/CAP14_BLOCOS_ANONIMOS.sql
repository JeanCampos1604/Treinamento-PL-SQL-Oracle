
DECLARE
    X INTEGER;
    Y INTEGER;
    C INTEGER;
BEGIN
    X := 100;
    Y := 500;
    C := X+Y;
    
    Dbms_Output.Put_Line('RESULTADO: ' || C);
   
END;


DECLARE 
  VDESCONTO NUMBER(6,2) := 0.5;
  VCIDADE VARCHAR(30) := 'NOVO HAMBURGO';
  VCOD_ALUNO TALUNO2.COD_ALUNO%TYPE := 5;
  VTOTAL NUMBER(8,2) := 1345.89;
  
  BEGIN
    VTOTAL := ROUND(VTOTAL*VDESCONTO, 2);
    DBMS_OUTPUT.PUT_LINE('Total: '||VTOTAL);
    VDESCONTO := 1.2;
    --VCIDADE := VCIDADE);
    Dbms_Output.Put_Line('CIDADE: ' || INITCAP(VCIDADE));
    DBMS_OUTPUT.PUT_LINE('DESCONTO: ' || VDESCONTO);
    DBMS_OUTPUT.PUT_LINE('ALUNO: ' || VCOD_ALUNO);
  END;
  
DECLARE
   VPRECO1 NUMBER(8,2) := 10;
   VPRECO2 NUMBER(8,2) := 20;
   VFLAG BOOLEAN;
BEGIN
   VFLAG := (VPRECO1>VPRECO2);
   IF (VFLAG = TRUE) THEN
    Dbms_Output.Put_Line('VERDADEIRO');
   ELSE
    Dbms_Output.Put_Line('FALSO');
   END IF;
   IF (VPRECO1 > VPRECO2) THEN
    Dbms_Output.Put_Line('VPRE�O1 � MAIOR QUE VPRE�O2');
   ELSE
    Dbms_Output.Put_Line('VPRE�O2 � MAIOR QUE VPRE�O1');
   END IF;
END;


--BIND VARIABLE

VARIABLE VDESCONTO2

DECLARE 
    VCOD_ALUNO NUMBER := 1;
BEGIN
    :VDESCONTO2 := 0.9;
    DBMS_OUTPUT.PUT_LINE('DESCONTO 2: ' || :VDESCONTO2);
    
    UPDATE TCONTRATO SET
    TOTAL = TOTAL * :VDESCONTO2
    WHERE COD_ALUNO = VCOD_ALUNO;
END;

SELECT *
  FROM TCONTRATO;
  
 
--ANINHAMENTO
DECLARE
    VTESTE VARCHAR(10) := 'JOSE';
BEGIN
    
    DECLARE
    VTESTE VARCHAR(10) := 'PEDRO';
    BEGIN
    DBMS_OUTPUT.PUT_LINE('BLOCO INTERNO: ' || VTESTE);
    END;
  DBMS_OUTPUT.PUT_LINE('BLOCO EXTERNO: ' || VTESTE);
END;
  