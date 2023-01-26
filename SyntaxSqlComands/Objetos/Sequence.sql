--CREATE SEQUENCE
CREATE SEQUENECE NOME_DA_SEQUENCE
    INCREMENT BY N
    START WITH N
    MAXVALUE N
    MINVALUE N
    CYCLE --CHEGANDO AO FIM REINICIA A SEQUENCIA
    NOCYCLE --CHEGANDO AO FIM TERMINA OS NUMEROS
    CACHE --CACHE DE 20 NUMEROS
    NOCACHE --SEM CACHE

--ALTERAR VALOR DA SEQUENCE
ALTER SEQUENCE NOME_DA_SEQUENCE 
    MAXVALUE  500;

--EXCLUIR SEQUENCE
DROP SEQUENCE NOME_DA_SEQUENCE;

--USAR SEQUENCE
INSERT INTO 
    NOME_DA_TABELA (NOME_DA_COLUNA_1, NOME_DA_COLUNA_2) 
    VALUES (NOME_DA_SEQUENCE.NEXTVAL, NOME_DA_COLUNA_2);

--CONSULTAR VALOR ATUAL
SELECT NOME_DA_SEQUENCE.CURRVAL FROM NOME_DA_TABELA;


