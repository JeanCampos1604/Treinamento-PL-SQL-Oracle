-- Gerais

Estabelecimento - GEESTAB

Endere�o - GEENDERECO (Compartilhado)

Empresa - GEEMPRESA
Par�metros da empres por estabelecimento - GEEMPRESAPARAMESTAB
Relacionamento entre empresa e endere�o - GEENDEMPRESA
Personalizados - PEEMPRESA

select *
from geempresa
where codempresa = 107

select *
from geendempresa
where codempresa = 107

select *
from geendereco
where codendereco in (116, 4696)

Colaboradores - GEFUNCIONARIOS
Pessoas - GEPESSOA
Endere�o - GEPESSOAEND

Produto - FSPRODUTO
Par�metros do produto por estabelecimento - FSPRODUTOPARAMESTAB
Par�metros de produ��o do produto por estabelecimento - FSPRODUTOPCP
Personaliz�vel - PEPRODUTO
Complemento - FSPRODCOMPLEMENTO / FSPRODCOMPLDET

Pa�s, estados e munic�pio - GEPAIS, GEESTADO e GEMUNICIPIO
                            GEPAISBACEN, GEESTADOIBGE, GEMUNICIPIOIBGE
                            
 Forma e condi��o de pagamento - VEFORMAPGTO, VECONDPGTO, VEDETCONDPGTO                          
 
 Usu�rios - GEUSUARIOS
 Grupo de usu�rios - GEGRPUSUARIOS
 Vinculo entre o usu�rio e o grupo - GEUSRGRUPO
 Permiss�es - GEPERMIS
 
 Log - GELOG, GELOGDET
 
 Compras
 Solicita��o - CPSOLCMP, CPSOLCMPDET
 Cotacao - CPCOTACAO, CPCOTACAOFORNEC, CPCOTACAOVALOR
 Pedido - CPPEDCOMPRA, CPPEDCOMPRADET, CPPEDCOMPRAPROG, CPITEMPEDIMP
 
 Vendas
 Pol�tica comercial - VEPOLITICACOM
 Tabela de pre�o - VEPRVENDA, VEPRVENDAPROD
 Pedido - VEPEDVENDA, VEITEMPEDIDO, VEPROGVENDA, VEITEMPEDIMP