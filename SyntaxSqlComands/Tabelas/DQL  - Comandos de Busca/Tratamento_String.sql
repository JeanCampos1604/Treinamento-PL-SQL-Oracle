
--Concatenação com CONCAT
SELECT CONCAT(NOME_DA_COLUNA_1,NOME_DA_COLUNA_2)
  FROM NOME_DA_TABELA;

--Concatenação com pipe || pipe
SELECT NOME_DA_TABELA_1 || 'TEXTO QUALQUER' || NOME_DA_COLUNA_2;
  FROM NOME_DA_TABELA;

--Inicial MAIUSCULAS
SELECT INITCAP(NOME_DA_COLUNA)
  FROM NOME_DA_TABELA;

--Retorna a posição de um caracter especifico
SELECT INSTR(NOME_DA_COLUNA,'A')
  FROM NOME_DA_TABELA;

--Contagem de caracteres
SELECT LENGTH(NOME_DA_COLUNA)
  FROM NOME_DA_TABELA;

--Alterar para MAIUSCULAS
SELECT LOWER(NOME_DA_COLUNA)
  FROM NOME_DA_TABELA;

--Alterar para MINUSCULAS
SELECT UPPER(NOME_DA_COLUNA)
  FROM NOME_DA_TABELA;

--Definir espaços vazios à esquerda
SELECT LPAD(NOME_DA_COLUNA,QUANTIDADE_DE_ESPAÇOS, 'VALOR A COLOCAR NO ESPAÇO VAZIO')
  FROM NOME_DA_TABELA;

--Definir espaços vazios à direita
SELECT RPAD(NOME_DA_COLUNA,QUANTIDADE_DE_ESPAÇOS, 'VALOR A COLOCAR NO ESPAÇO VAZIO')
  FROM NOME_DA_TABELA;

--Copia parte de um texto
SELECT SUBSTR(NOME_DA_COLUNA, POSIÇÃO_INICIAL, QUANTIDADE_DE_CARACTERES)
  FROM NOME_DA_TABELA;

--Trocar um pelo outro
SELECT REPLACE(NOME_DA_COLUNA,'LETRA QUE SERÁ TROCADA','LETRA QUE IRÁ SUBSTITUIR')
  FROM NOME_DA_TABELA;

--Tirar espaços vazios
SELECT TRIM('   JEAN   CAMPOS    ') AS "NOME_SEM_ESPAÇO"
  FROM NOME_DA_TABELA;

 