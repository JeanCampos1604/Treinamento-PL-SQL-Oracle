--PADRÃO ROWNUM >\<\>=\<=
SELECT * 
  FROM NOME_DA_TABELA 
  WHERE ROWNUM <= 3;

--PADRÃO ROWNUM =
SELECT * 
  FROM (SUBQUERY) WHERE ROWNUM = 1;

--NÃO ACEITA ROWNUM = N