--PIVOT
SELECT *
  FROM department --NOME DA TABELA 
       PIVOT (SUM (revenue) --VALORES QUE DESEJO USAR NAS NOVAS COLUNAS
             Revenue --COMEÇO DO NOME DAS NOVAS COLUNAS + _ EXEMPLO: REVENUE_JAN
             FOR month --
             IN ('Jan' Jan, --NOME DO CAMPO QUE SERA TRANSFORMADO EM COLUNA E SEU ALIAS
                'Feb' Feb,
                'Mar' Mar,
                'Apr' Apr,
                'May' May,
                'Jun' Jun,
                'Jul' Jul,
                'Aug' Aug,
                'Sep' Sep,
                'Oct' Oct,
                'Nov' Nov,
                'Dec' Dec));


--UNPIVOT
SELECT product_id "product_id",store "store", price "price"
FROM Products
UNPIVOT EXCLUDE NULLS
(
	price
	FOR store in (store1 AS 'store1',store2 AS 'store2',store3 AS 'store3')
);