SELECT COD_ALUNO||NOME AS "ALUNO" 
 FROM TALUNO2;
 
SELECT NOME || ' NASCEU EM ' || CIDADE AS "CIDADE NATAL DO ALUNO"
    FROM TALUNO2;
    
SELECT DISTINCT CIDADE
    FROM TALUNO2;
        
SELECT DISTINCT CIDADE, COD_ALUNO
    FROM TALUNO2;
    
SELECT NOME AS CURSO, VALOR, CARGA_HORARIA,
       ROUND(VALOR/CARGA_HORARIA,2) AS VALOR_HORA    
 FROM TCURSO2
 ORDER BY VALOR_HORA;

SELECT *
    FROM TCONTRATO2
   ORDER BY DATA;

UPDATE TCONTRATO2 SET
DESCONTO = NULL
WHERE COD_CONTRATO = 4;

SELECT COD_CONTRATO, TOTAL, DESCONTO, TOTAL-DESCONTO AS VALOR_A_PAGAR
 FROM TCONTRATO2;
 
SELECT COD_CONTRATO, TOTAL, NVL(DESCONTO,0) AS NVL_IF_NULL_RETURN_ZERO, TOTAL - NVL(DESCONTO,0) AS VALOR_A_PAGAR
 FROM TCONTRATO2;
 
SELECT 'O ' || COD_ALUNO || '� aluno, chama-se ' || INITCAP(NOME) || ' e nasceu em ' || CIDADE AS ALUNO
 FROM TALUNO2
 ORDER BY COD_ALUNO;