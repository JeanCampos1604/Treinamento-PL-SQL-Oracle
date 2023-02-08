-- Gerais

Estabelecimento - GEESTAB

Endereço - GEENDERECO (Compartilhado)

Empresa - GEEMPRESA
Parâmetros da empres por estabelecimento - GEEMPRESAPARAMESTAB
Relacionamento entre empresa e endereço - GEENDEMPRESA
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
Endereço - GEPESSOAEND

Produto - FSPRODUTO
Parâmetros do produto por estabelecimento - FSPRODUTOPARAMESTAB
Parâmetros de produção do produto por estabelecimento - FSPRODUTOPCP
Personalizável - PEPRODUTO
Complemento - FSPRODCOMPLEMENTO / FSPRODCOMPLDET

País, estados e município - GEPAIS, GEESTADO e GEMUNICIPIO
                            GEPAISBACEN, GEESTADOIBGE, GEMUNICIPIOIBGE
                            
 Forma e condição de pagamento - VEFORMAPGTO, VECONDPGTO, VEDETCONDPGTO                          
 
 Usuários - GEUSUARIOS
 Grupo de usuários - GEGRPUSUARIOS
 Vinculo entre o usuário e o grupo - GEUSRGRUPO
 Permissões - GEPERMIS
 
 Log - GELOG, GELOGDET
 
 Compras
 Solicitação - CPSOLCMP, CPSOLCMPDET
 Cotacao - CPCOTACAO, CPCOTACAOFORNEC, CPCOTACAOVALOR
 Pedido - CPPEDCOMPRA, CPPEDCOMPRADET, CPPEDCOMPRAPROG, CPITEMPEDIMP
 
 Vendas
 Política comercial - VEPOLITICACOM
 Tabela de preço - VEPRVENDA, VEPRVENDAPROD
 Pedido - VEPEDVENDA, VEITEMPEDIDO, VEPROGVENDA, VEITEMPEDIMP