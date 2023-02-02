--GROUP BY ROLLUP SIMPLES

SELECT COD_ALUNO, DATA, SUM(DESCONTO) SOMA_DESCONTO, SUM(TOTAL) SOMA_TOTAL
  FROM TCONTRATO2
 --GROUP BY (COD_ALUNO,DATA);
 GROUP BY ROLLUP(COD_ALUNO, DATA);
 
SELECT * FROM TCONTRATO2;

--GROUP BY ROLLUP IDENTIFICANDO OS SUBTOTAIS
SELECT COD_ALUNO,
       CASE
         WHEN DATA IS NULL AND COD_ALUNO IS NOT NULL
            THEN 'Sub-total'
         WHEN COD_ALUNO IS NULL
            THEN 'Total'
         ELSE 
            TO_CHAR(DATA) 
        END DESCRICAO,
        ROUND(AVG(DESCONTO),2) MEDIA_DESCONTO,
        SUM(TOTAL) SOMA_TOTAL
  FROM TCONTRATO2
 GROUP BY ROLLUP(COD_ALUNO, DATA);
 
 --GROUP BY CUBE
 SELECT COD_ALUNO,
        DATA,
        SUM(TOTAL)
  FROM TCONTRATO2
 GROUP BY CUBE (COD_ALUNO, DATA);     
 
 
 --GROUPING SIMPLES
 SELECT GROUPING(COD_ALUNO), SUM (TOTAL) SOMA_TOTAL
   FROM TCONTRATO2
  GROUP BY ROLLUP(COD_ALUNO);
  
  --GROUPING TRATADO
SELECT GROUPING(COD_ALUNO), 
       CASE
          WHEN GROUPING(COD_ALUNO) = 0 THEN TO_CHAR(COD_ALUNO)
          ELSE 'Total geral :'
       END AS ALUNO,
       SUM (TOTAL) SOMA_TOTAL
  FROM TCONTRATO2
 GROUP BY ROLLUP(COD_ALUNO);
 
 --GROUP BY GROUPING_ID SIMPLES
 SELECT DATA,
        GROUPING_ID(DATA) GDT,
        COD_ALUNO,
        GROUPING_ID(COD_ALUNO) GCL,
        SUM(TOTAL) SOMA_TOTAL
  FROM TCONTRATO2
  GROUP BY ROLLUP(DATA,COD_ALUNO);
  
  --GROUP BY GROUPING_ID TRATADO
  SELECT DATA,
         GROUPING_ID(DATA) GDT,
         COD_ALUNO,
         GROUPING_ID(COD_ALUNO) GCL,
         CASE
            WHEN GROUPING_ID(COD_ALUNO) = 1 AND GROUPING_ID(DATA) = 0
                THEN 'TOTAL DO DIA'
            WHEN GROUPING_ID(COD_ALUNO) = 1 AND GROUPING_ID(DATA) = 1
                THEN 'TOTAL GERAL'
                
         END AS DESCRICAO,
         SUM(TOTAL) AS SOMA_TOTAL
  FROM TCONTRATO2
  GROUP BY ROLLUP (DATA,COD_ALUNO);
  
  
--GROUPING SETS (APENAS SUBTOTAIS)
SELECT COD_ALUNO, DATA, SUM(TOTAL)
  FROM TCONTRATO2
 GROUP BY GROUPING SETS(COD_ALUNO,DATA); 