--VARIÁVEIS DEFAULT
DECLARE
 NOME_DA_VARIAVEL TIPO;
 NOME_DA_VARIAVEL TIPO := VALOR_ATRIBUIDO;
BEGIN
--ATRIBUIÇÃO DEFAULT 
NOME_DA_VARIAVEL := VALOR_ATRIBUIDO;
END;

--BIND VARIABLE
VARIABLE NOME_DA_VARIAVEL
DECLARE
NOME_DA_VARIAVEL_2 := 0;
BEGIN
--ATRIBUIÇÃO PARA BIND VARIABLE
:NOME_DA_VARIAVEL := 10
END: