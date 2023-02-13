--GERAIS


--ESTABELECIMENTOS
SELECT *
  FROM GEESTAB;
  
--ENDERE�OS
SELECT *
  FROM GEENDERECO
  WHERE CODENDERECO <= 10 
  ORDER BY CODENDERECO;
  
--RELACIONAMENTO ENDERE�O COM GEPAIS
SELECT GP.NOME, GE.CODENDERECO, GE.ENDERECO, GE.NUMERO,
       GE.BAIRRO, GE.CEP, GP.CODPAIS
  FROM GEPAIS GP, GEENDERECO GE
  WHERE GP.CODPAIS = GE.CODPAIS
  AND GE.CODPAIS <> 1;
  
 --RELA��O ENTRE GEESTAB E GEENDERECO
SELECT GTAB.CODESTAB, GTAB.RAZAOSOCIAL, GTAB.NOMEFANTASIA, GEND.CODENDERECO,
       GEND.ENDERECO, GEND.NUMERO, GEND.BAIRRO, GEND.CEP
  FROM GEESTAB GTAB, GEENDERECO GEND
  WHERE GTAB.CODENDERECO = GEND.CODENDERECO;
  
--PAR�METROS DA EMPRESA POR ESTABELECIMENTO
SELECT * 
  FROM GEEMPRESAPARAMESTAB
  WHERE CODEMPRESA <= 10;
    
--EMPRESA
SELECT *
 FROM GEEMPRESA
 WHERE CODEMPRESA <= 10;

--RELA��O GEEMPRESA COM GEEMPRESAPARAMESTAB
SELECT GEEMPRESA.CODEMPRESA, GEEMPRESA.RAZAOSOCIAL, GEEMPRESA.NOMEFANTASIA,
       GEEMPRESAPARAMESTAB.CODESTAB,GEEMPRESAPARAMESTAB.STATUS,GEEMPRESAPARAMESTAB.TIPOEMPRESA
  FROM GEEMPRESA, GEEMPRESAPARAMESTAB
  WHERE GEEMPRESA.CODEMPRESA = GEEMPRESAPARAMESTAB.CODEMPRESA
  AND GEEMPRESA.CODEMPRESA <=10;
  
 
--RELA��O GEEMPRESA, GEEMPRESAPARAMESTAB E GEESTAB
SELECT GEEMPRESA.CODEMPRESA, GEEMPRESA.RAZAOSOCIAL, GEEMPRESA.NOMEFANTASIA,
       GEEMPRESAPARAMESTAB.STATUS,GEEMPRESAPARAMESTAB.TIPOEMPRESA,GEEMPRESAPARAMESTAB.CODESTAB,
       GEESTAB.RAZAOSOCIAL RAZAO_SOCIAL_ESTAB, GEESTAB.NOMEFANTASIA NOME_FANTASIA_ESTAB,GEESTAB.CODENDERECO
 FROM GEEMPRESA, GEEMPRESAPARAMESTAB, GEESTAB
 WHERE GEEMPRESA.CODEMPRESA = GEEMPRESAPARAMESTAB.CODEMPRESA
 AND GEESTAB.CODESTAB = GEEMPRESAPARAMESTAB.CODESTAB
 AND GEEMPRESA.CODEMPRESA <=10
 ORDER BY CODEMPRESA;
 
--RELA��O GEEMPRESA, GEEMPRESAPARAMESTAB, GEESTAB E GEENDERECO
SELECT GEEMPRESA.CODEMPRESA, GEEMPRESA.RAZAOSOCIAL, GEEMPRESA.NOMEFANTASIA,
       GEEMPRESAPARAMESTAB.STATUS,GEEMPRESAPARAMESTAB.TIPOEMPRESA,GEEMPRESAPARAMESTAB.CODESTAB,
       GEESTAB.RAZAOSOCIAL RAZAO_SOCIAL_ESTAB, GEESTAB.NOMEFANTASIA NOME_FANTASIA_ESTAB,GEESTAB.CODENDERECO,
       GEENDERECO.ENDERECO, GEENDERECO.NUMERO, GEENDERECO.BAIRRO, GEENDERECO.CEP
 FROM GEEMPRESA, GEEMPRESAPARAMESTAB, GEESTAB, GEENDERECO
 WHERE GEEMPRESA.CODEMPRESA = GEEMPRESAPARAMESTAB.CODEMPRESA
 AND GEESTAB.CODESTAB = GEEMPRESAPARAMESTAB.CODESTAB
 AND GEENDERECO.CODENDERECO = GEESTAB.CODENDERECO
 AND GEEMPRESA.CODEMPRESA <=10;

  
--PAR�METROS DA EMPRESA POR ESTABELECIMENTO DEFININDO TIPO E STATUS
SELECT GEEMPRESA.RAZAOSOCIAL,
       GEEMPRESAPARAMESTAB.CODEMPRESA,
       CASE 
            WHEN GEEMPRESAPARAMESTAB.STATUS = 0 THEN 'NOVO'
            WHEN GEEMPRESAPARAMESTAB.STATUS = 1 THEN 'ATIVO'
            WHEN GEEMPRESAPARAMESTAB.STATUS = 2 THEN 'INATIVO'
            WHEN GEEMPRESAPARAMESTAB.STATUS = 3 THEN 'BLOQUEADO' 
       END STATUS,                                 
       CASE 
            WHEN GEEMPRESAPARAMESTAB.TIPOEMPRESA LIKE 'C' THEN 'CLIENTE'
            WHEN GEEMPRESAPARAMESTAB.TIPOEMPRESA LIKE 'F' THEN 'FORNCEDOR'
            WHEN GEEMPRESAPARAMESTAB.TIPOEMPRESA LIKE 'T' THEN 'TRANSPORTADORA'
            WHEN GEEMPRESAPARAMESTAB.TIPOEMPRESA LIKE 'R' THEN 'REPRESENTANTE'
            WHEN GEEMPRESAPARAMESTAB.TIPOEMPRESA LIKE 'V' THEN 'VENDEDOR'
            WHEN GEEMPRESAPARAMESTAB.TIPOEMPRESA LIKE 'E' THEN 'ESCOLAR'
            WHEN GEEMPRESAPARAMESTAB.TIPOEMPRESA LIKE 'P' THEN 'PROSPECT'
            WHEN GEEMPRESAPARAMESTAB.TIPOEMPRESA LIKE 'A' THEN 'REFERENCIA' 
       END TIPO_DA_EMPRESA                                     
  FROM GEEMPRESAPARAMESTAB, GEEMPRESA
  WHERE GEEMPRESA.CODEMPRESA = GEEMPRESAPARAMESTAB.CODEMPRESA
  AND GEEMPRESA.CODEMPRESA <= 10;

--TABELA DE LIGA��O DE EMPRESA COM ENDERE�O
SELECT *
  FROM GEENDEMPRESA
  WHERE CODEMPRESA <= 10;

--RELA��O ENTRE EMPRESA E ENDERE�O: GEENDEMPRESA
SELECT * 
  FROM GEEMPRESA,GEENDEMPRESA,GEENDERECO
  WHERE GEEMPRESA.CODEMPRESA = GEENDEMPRESA.CODEMPRESA
  AND GEENDERECO.CODENDERECO = GEENDEMPRESA.CODENDERECO
  AND GEEMPRESA.CODEMPRESA <=10;
  
--FUNCIONARIOS
SELECT *
  FROM GEFUNCIONARIOS
  WHERE CODFUNCIONARIO <= 10;

--PESSOAS
SELECT *
  FROM GEPESSOA
  WHERE CODPESSOA >= 297
  AND CODPESSOA <= 310
  ORDER BY CODPESSOA;
  
--TABELA DE LIGA��O ENDERE�O COM PESSOAS
SELECT *
  FROM GEPESSOAEND
  WHERE CODPESSOA >= 297
  AND CODPESSOA <= 310;
  
--RELA��O PESSOA COM ENDERE�O
SELECT PE.CODPESSOA, P.NOME, P.DTNASCIMENTO,
       PE.CODENDERECO, E.ENDERECO, E.NUMERO, E.BAIRRO,
       E.CEP
  FROM GEPESSOA P, GEENDERECO E, GEPESSOAEND PE
  WHERE P.CODPESSOA = PE.CODPESSOA
  AND  E.CODENDERECO = PE.CODENDERECO
  AND P.CODPESSOA >= 297
  AND P.CODPESSOA <= 310;  

--RELA��O PESSOA COM FUNCIONARIO
SELECT GP.CODPESSOA, GP.NOME, GP.SEXO, GP.DTNASCIMENTO,
       GP.NATURALIDADE, GP.PROFISSAO, GF.CODESTAB, GF.CODFUNCIONARIO,
       GF.STATUS, GF.CODUSUARIO
  FROM GEPESSOA GP, GEFUNCIONARIOS GF
  WHERE GP.CODPESSOA = GF.CODPESSOA
  AND GP.CODPESSOA >= 400
  AND GP.CODPESSOA <= 500;

--USUARIOS
SELECT *
  FROM GEUSUARIOS
  WHERE ROWNUM <= 10;

--GRUPO DE USUARIOS
SELECT *
  FROM GEGRPUSUARIOS
  WHERE ROWNUM <=10;
 
--TABELA DE LIGA��O DE USUARIOS COM GRUPO DE USUARIOS
SELECT *
  FROM GEUSRGRUPO; 

--RELA��O ENTRE USUARIOS E GRUPO DE USUARIOS
SELECT U.CODUSUARIO, U.NOME, GU.CODGRPUSR, GU.DESCGRPUSR
  FROM GEUSUARIOS U,GEGRPUSUARIOS GU, GEUSRGRUPO GUU
  WHERE GUU.CODGRPUSR = GU.CODGRPUSR
  AND GUU.CODUSUARIO = U.CODUSUARIO;

--RELA��O PESSOA, FUNCIOANRIO E USUARIO
SELECT GP.CODPESSOA, GP.NOME, GP.SEXO, GP.DTNASCIMENTO,
       GP.NATURALIDADE, GP.PROFISSAO, GF.CODESTAB, GF.CODFUNCIONARIO,
       GF.STATUS, GF.CODUSUARIO, NVL(GU.EMAIL,'NULL') EMAIL, GU.TIPUSUARIO
  FROM GEPESSOA GP, GEFUNCIONARIOS GF, GEUSUARIOS GU
  WHERE GP.CODPESSOA = GF.CODPESSOA
  AND GU.CODUSUARIO = GF.CODUSUARIO
  AND GP.CODPESSOA >= 400
  AND GP.CODPESSOA <= 500
  ORDER BY CODPESSOA;

--PERMISSOES
-- EXEMPLO:
--COD GRUPO  CODCONTRAFORM  CODCONTRPERMIS
--   126	      471	         15	
SELECT *
  FROM GEPERMIS;

--PERMISSOES REFERENTES AS GRUPO 126 - HINO
SELECT *
  FROM GEGRPUSUARIOS
  WHERE CODGRPUSR = 126;
  
--PERMISS�O N�471 REFERENTE A ALTERA��O DO PEDIDO DE VENDAS
SELECT *
  FROM GECONTR
  WHERE CODCONTR = 471;
  
--PERMISS�O N� 15 REFERENTE A VISUALIZAR LOG DO REGISTRO
SELECT *
  FROM GECONTR
  WHERE CODCONTR = 15;
  
--LOG GERAL
SELECT * FROM GELOG
ORDER BY DATALOG DESC;

--LOG DETALHADO
SELECT * FROM GELOGDET;

--RELA�AO LOG E LOG DET
SELECT *
  FROM GELOG, GELOGDET
  WHERE GELOG.CODLOG = GELOGDET.CODLOG
  AND ROWNUM <=100
  ORDER BY DATALOG DESC;
  
--PAISES
SELECT * 
  FROM GEPAIS
  WHERE ROWNUM <= 10;
  
--COD PAISES DE ACORCO COM BANCO CENTRAL
SELECT *
  FROM GEPAISBACEN
  WHERE ROWNUM <= 10;
  
--RELA�AO PAISES E PAISES BANCO CENTRAL
SELECT *
  FROM GEPAIS, GEPAISBACEN
  WHERE GEPAISBACEN.CODBACEN = GEPAIS.CODBACEN;

--ESTADOS
SELECT * 
  FROM GEESTADO
  WHERE NOME LIKE 'S�O%';

--COD ESTADOS DE ACORDO COM IBGE
SELECT * 
  FROM GEESTADOIBGE
  WHERE ROWNUM <= 10;  

--RELA�AO ENTRE ESTADOS E ESTADOS IBGE
SELECT * 
  FROM GEESTADO, GEESTADOIBGE
  WHERE GEESTADOIBGE.CODIBGE = GEESTADO.CODIBGE;
  
--MUNICIPIOS
SELECT * 
  FROM GEMUNICIPIO
  WHERE CODESTADO = 25
  AND NOME LIKE 'LIMEIRA';
  
--COD GIA SP SOBRE ICMS POR MUNICIPIO
SELECT *
  FROM GEMUNICIPIOGIASP
  WHERE NOME LIKE 'LIMEIRA';
 
--MUNICIPIO DE ACORDO COM IBGE
SELECT *
  FROM GEMUNICIPIOIBGE
  WHERE NOME LIKE 'LIMEIRA';
  




--VENDAS

--POLITICA COMERCIAL 
SELECT *
  FROM VEPOLITICACOM;

--PEDIDOS EM AN�LISE
SELECT *
  FROM VEPEDIDOANALISE
  WHERE ROWNUM <=100
  ORDER BY CODPEDANALISE DESC;
  
--RELA��O POLITICA COMERCIAL E PEDIDO EM AN�LISE
SELECT VEPEDIDOANALISE.CODPEDVENDA,VEPEDIDOANALISE.CODESTAB ,VEPEDIDOANALISE.CODPEDANALISE, VEPEDIDOANALISE.STATUS,
       VEPOLITICACOM.CODPOLITICA, VEPOLITICACOM.DESCRICAO
  FROM VEPOLITICACOM, VEPEDIDOANALISE
  WHERE VEPOLITICACOM.CODPOLITICA = VEPEDIDOANALISE.CODPOLITICA
  AND ROWNUM <= 100;
  
--RELA��O POLITICA COMERCIAL E PEDIDO EM AN�LISE + STATUS + CODESTAB
SELECT VEPEDIDOANALISE.CODPEDVENDA,
       VEPEDIDOANALISE.CODESTAB,
       GEESTAB.RAZAOSOCIAL, 
       VEPEDIDOANALISE.CODPEDANALISE, 
       CASE
            WHEN VEPEDIDOANALISE.STATUS = 0 THEN  'Pedido pendente'
            WHEN VEPEDIDOANALISE.STATUS = 1 THEN  'Pedido aprovado'
            WHEN VEPEDIDOANALISE.STATUS = 2 THEN  'Pedido reprovado'
        END AS STATUS,
       VEPOLITICACOM.CODPOLITICA, 
       INITCAP(VEPOLITICACOM.DESCRICAO)
  FROM GEESTAB, VEPOLITICACOM, VEPEDIDOANALISE
  WHERE VEPOLITICACOM.CODPOLITICA = VEPEDIDOANALISE.CODPOLITICA
  AND GEESTAB.CODESTAB = VEPEDIDOANALISE.CODESTAB
  AND ROWNUM <= 100;
  
--PARAMETROS DE POLITICA COMERCIAL POR ESTABELECIMENTO
SELECT *
  FROM VEPOLITICACOMESTAB
  WHERE VALOR NOT LIKE '0';
  
--RELA��O PARAMETROS, POLITICA COMERCIAL E ESTABELECIMENTO
SELECT  VEPOLITICACOMESTAB.CODESTAB, GEESTAB.RAZAOSOCIAL, GEESTAB.NOMEFANTASIA,
        VEPOLITICACOM.CODPOLITICA, VEPOLITICACOM.DESCRICAO
  FROM VEPOLITICACOM, VEPOLITICACOMESTAB, GEESTAB
  WHERE VEPOLITICACOM.CODPOLITICA = VEPOLITICACOMESTAB.CODPOLITICA
  AND GEESTAB.CODESTAB = VEPOLITICACOMESTAB.CODESTAB
  ORDER BY VEPOLITICACOMESTAB.CODESTAB;

--TABELA DE PRE�O DE VENDA
SELECT * 
  FROM VEPRVENDA;
  --WHERE CODPRVENDA = 172;

--TABELA DE PRE�O DE VENDA DA PRODU��O
SELECT * 
  FROM VEPRVENDAPROD
  WHERE ROWNUM <= 100;
  
--TABELA DE PRE�O DE VENDA POR REGI�O
SELECT * 
  FROM VEREGIAOPRECO;
  
--RELA��O ENTRE PRE�O PRE�O DE VENDA E DE PRODU��O
SELECT *
  FROM VEPRVENDA, VEPRVENDAPROD
  WHERE VEPRVENDA.CODPRVENDA = VEPRVENDAPROD.CODPRVENDA;  

--PEDIDO DE VENDA
SELECT *
  FROM VEPEDVENDA
  WHERE ROWNUM <= 100
  ORDER BY CODESTAB, DATAEMISSAO DESC;

--ITEM DO PEDIDO
SELECT *
  FROM VEITEMPEDIDO;
  
--PROGRAMA��O DE VENDA
SELECT * 
  FROM VEPROGVENDA;

--IMPOSTO SOBRE ITEM 
SELECT * 
  FROM VEITEMPEDIMP;
 
--FORMA DE PAGAMENTO
SELECT *
  FROM VEFORMAPGTO;
 
--CONDI��O DE PAGTO 
SELECT * 
  FROM VECONDPGTO;
  
--RELA�AO FORMA DE PAGAMENTO COM CONDI��O DE PAGTO
SELECT *
  FROM VEFORMAPGTO,  VECONDPGTO
  WHERE VEFORMAPGTO.CODFORMAPGTO = VECONDPGTO.CODFORMAPGTO
  ORDER BY VEFORMAPGTO.DATAMODIFICACAO DESC;
  
  
--PERSONALIZADAS
SELECT * 
  FROM PEEMPRESA;
 
SELECT *
  FROM PEPRODUTO;
  

--FISCAIS

--PRODUTO
SELECT * 
  FROM FSPRODUTO;
  
--PAR�METROS DO PRODUTO POR ESTABELECIMENTO
SELECT * 
  FROM FSPRODUTOPARAMESTAB;
  
--PAR�METROS DE PRODU��O DO PRODUTO POR ESTABELECIMENTO
SELECT * 
  FROM FSPRODUTOPCP
  WHERE ESTOQUEMINIMO <> 0;
  
SELECT * 
  FROM FSPRODCOMPLEMENTO;
  
SELECT * 
  FROM FSPRODCOMPLDET;
