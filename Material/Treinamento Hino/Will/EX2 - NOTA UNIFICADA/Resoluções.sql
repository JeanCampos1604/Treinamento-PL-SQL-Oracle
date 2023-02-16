--RESOLU��O

/*
FSNFAGRUPAMENTOS
    > FSNFSAIDA (NOTA UNIFICADA)
    > FSNFSAIDA (NOTA CLIENTE) 
        >GEEMPRESA (CLIENTE) 
        >FSNFITE 
           >VEPEDVENDA
            > GEEMPRESA (REPRES)
*/
    
SELECT NOTAGERADA.NOTAFISCAL,
       FSNFSAIDA.NOTAFISCAL,
       VEPEDVENDA.CODREPRES,
       REPRES.NOMEFANTASIA DESCREPRES,
       VEPEDVENDA.CODPEDVENDA,
       FSNFSAIDA.DTEMISSAO,
       VEPEDVENDA.CODEMPRESA,
       GEEMPRESA.NOMEFANTASIA NOME,
       FSNFITEM.CODPRODUTO,
       FSPRODUTO.DESCRICAO,
       FSNFITEM.QUANTIDADE,
       FSNFITEM.VALORUNITARIO,
       FSNFITEM.VALORTOTAL
  FROM FSNFAGRUPAMENTOS,
       FSNFSAIDA,
       FSNFSAIDA NOTAGERADA,
       VEPEDVENDA,
       FSNFITEM,
       GEEMPRESA,
       FSPRODUTO,
       GEEMPRESA REPRES
 WHERE FSNFAGRUPAMENTOS.CODESTAB = FSNFSAIDA.CODESTAB
   AND FSNFAGRUPAMENTOS.INDICENFREF = FSNFSAIDA.INDICENFSAI
   AND FSNFAGRUPAMENTOS.CODESTAB = NOTAGERADA.CODESTAB
   AND FSNFAGRUPAMENTOS.INDICENFGERADA = NOTAGERADA.INDICENFSAI
   AND FSNFITEM.CODPRODUTO = FSPRODUTO.CODPRODUTO
   AND FSNFITEM.CODESTAB = FSNFSAIDA.CODESTAB
   AND FSNFITEM.INDICENFSAI = FSNFSAIDA.INDICENFSAI
   AND FSNFITEM.CODESTAB = VEPEDVENDA.CODESTAB
   AND FSNFITEM.CODPEDVENDA = VEPEDVENDA.CODPEDVENDA
   AND REPRES.CODEMPRESA = VEPEDVENDA.CODREPRES
   AND GEEMPRESA.CODEMPRESA = VEPEDVENDA.CODEMPRESA
   ORDER BY DTEMISSAO;
   
