
--NOTAS FISCAIS DE SAIDA
SELECT *
  FROM FSNFSAIDA;
  
--ITENS DA NOTA FISCAL
SELECT *
  FROM FSNFITEM;
  
--PRODUTO
SELECT *
  FROM FSPRODUTO;
  
--ITENS DA NOTA FISCAL COM IMPOSTO
SELECT * 
  FROM FSNFITEMIMP;
  
--EMPRESAS
SELECT *
  FROM GEEMPRESA;
  
--IMPOSTOS
SELECT * 
  FROM FSIMPOSTOS;
  
--RELACIONAMENTO EMPRESA COM ENDERE�O
SELECT * 
  FROM GEENDEMPRESA;

--ENDERE�O
SELECT *
  FROM GEENDERECO;

-----------------------------------------------------
/*
SELECT N�mero da Nota,
       S�rie da Nota,
       Modelo da Nota,
       Data de Emiss�o,
       Cod. do Item,
       Descri��o do Item,
       Impostos (separados),
       Total de impostos,
       Valor do item (sem imposotos),
       Valor do item com impostos,
       Nome da empresa,
       Estado do endere�o comercial da empresa.
  FROM DUAL;
*/
 --------------------------------------------------------
 

SELECT FSNFSAIDA.NOTAFISCAL "N�mero da Nota",
       FSNFSAIDA.SERIE "S�rie da Nota",
       FSMODELONF.DESCRICAO "Modelo da Nota",
       FSNFSAIDA.DTEMISSAO "Data de Emiss�o",
       FSNFITEM.CODPRODUTO "C�digo do Item" ,
       FSPRODUTO.DESCRICAO "Descri��o do Item",
       NVL(SUM(CASE WHEN FSNFITEMIMP.CODIMPOSTO IN (0,1,2) THEN FSNFITEMIMP.VALORIMPOSTO END),0) ICMS,
       NVL(SUM(CASE WHEN FSNFITEMIMP.CODIMPOSTO = 3 THEN FSNFITEMIMP.VALORIMPOSTO END),0) IPI,
       NVL(SUM(CASE WHEN FSNFITEMIMP.CODIMPOSTO IN (4,5) THEN FSNFITEMIMP.VALORIMPOSTO END),0) PIS,
       NVL(SUM(CASE WHEN FSNFITEMIMP.CODIMPOSTO IN (6,7) THEN FSNFITEMIMP.VALORIMPOSTO END),0) COFINS,
       NVL(SUM(CASE WHEN FSNFITEMIMP.CODIMPOSTO NOT IN (0,1,2,3,4,5,6,7) THEN FSNFITEMIMP.VALORIMPOSTO END),0) "Outros Impostos",
       FSNFITEM.VALORTOTAL "Valor sem impostos",
      (NVL(SUM(CASE WHEN FSNFITEMIMP.CODIMPOSTO IN (0,1,2) THEN FSNFITEMIMP.VALORIMPOSTO END),0) + 
       NVL(SUM(CASE WHEN FSNFITEMIMP.CODIMPOSTO = 3 THEN FSNFITEMIMP.VALORIMPOSTO END),0) +
       NVL(SUM(CASE WHEN FSNFITEMIMP.CODIMPOSTO IN (4,5) THEN FSNFITEMIMP.VALORIMPOSTO END),0) +
       NVL(SUM(CASE WHEN FSNFITEMIMP.CODIMPOSTO IN (6,7) THEN FSNFITEMIMP.VALORIMPOSTO END),0) +
       NVL(SUM(CASE WHEN FSNFITEMIMP.CODIMPOSTO NOT IN (0,1,2,3,4,5,6,7) THEN FSNFITEMIMP.VALORIMPOSTO END),0)+
       FSNFITEM.VALORTOTAL) "Valor com impostos",
       GEEMPRESA.RAZAOSOCIAL "Nome da Empresa",
       GEESTADO.NOME "Estado do endere�o comercial da Empresa"
  FROM FSNFSAIDA,
       FSMODELONF,
       FSNFITEM,
       FSPRODUTO,
       FSNFITEMIMP,
       FSIMPOSTOS,
       GEEMPRESA,
       GEENDEMPRESA,
       GEENDERECO,
       GEESTADO
 WHERE FSNFSAIDA.CODESTAB = FSNFITEM.CODESTAB
   AND FSNFSAIDA.INDICENFSAI = FSNFITEM.INDICENFSAI
   AND FSMODELONF.CODMODELO = FSNFSAIDA.CODMODELO 
   AND FSPRODUTO.CODPRODUTO = FSNFITEM.CODPRODUTO
   AND FSNFITEM.CODESTAB = FSNFITEMIMP.CODESTAB
   AND FSNFITEM.SEQUENCIA = FSNFITEMIMP.SEQUENCIA
   AND FSNFITEM.INDICEITEM = FSNFITEMIMP.INDICEITEM
   AND FSIMPOSTOS.CODIMPOSTO = FSNFITEMIMP.CODIMPOSTO
   AND GEEMPRESA.CODEMPRESA = FSNFSAIDA.CODEMPRESA
   AND GEEMPRESA.CODEMPRESA = GEENDEMPRESA.CODEMPRESA
   AND GEENDERECO.CODENDERECO = GEENDEMPRESA.CODENDERECO
   AND GEENDERECO.TIPO = 0
   AND GEENDERECO.CODESTADO = GEESTADO.CODESTADO
   AND FSNFSAIDA.NOTAFISCAL = 107509
   AND FSNFITEM.CODPRODUTO = '700.00053'
 GROUP BY FSNFSAIDA.NOTAFISCAL,
          FSNFSAIDA.SERIE,
          FSMODELONF.DESCRICAO,
          FSNFSAIDA.DTEMISSAO,
          FSNFITEM.CODPRODUTO,
          FSPRODUTO.DESCRICAO,
          FSNFITEM.VALORTOTAL,
          GEEMPRESA.RAZAOSOCIAL,
          GEESTADO.NOME;