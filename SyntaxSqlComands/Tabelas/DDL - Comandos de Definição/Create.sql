
--CRIAÇÃO DE TABELA
CREATE TABLE NOME_DA_TABELA
(
  ATRIBUTO1 TIPO(),
  ATRIBUTO2 TIPO(),
  ATRIBUTO3 TIPO(),
  ATRIBUTO4 TIPO()
);

--CRIAÇÃO DE TABELA COM CONSTRAINTS
CREATE TABLE NOME_DA_TABELA
(
  ATRIBUTO1 TIPO() NOT NULL,
  ATRIBUTO2 TIPO(),
  ATRIBUTO3 TIPO(),
  ATRIBUTO4 TIPO()
  PRIMARY KEY (ATRIBUTO1)
);

--CRIAÇÃO DE TABELA A PARTIR DE OUTRA
CREATE TABLE NOME_DA_NOVA_TABELA
  AS 
    SELECT *
     FROM NOME_DA_TABELA_A_SER_COPIADA


