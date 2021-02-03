USE desi_loja;

SELECT p.id_produto, p.nome, pi.quantidade
FROM produto p
LEFT JOIN pedido_item pi
	ON pi.quantidade
ORDER BY p.id_produto;




/*Utilizar a base desi_loja → Utilize o comando USE
Utilizar as tabelas produto e pedido_item
Retornar como resultado da consulta com o OUTER JOIN todos os produtos da tabela produto com a quantidade deles que foi utilizada nos pedidos, caso tenha.
As colunas que devem ser mostradas no SELECT seriam produto.id_produto, produto.nome e pedido_item.quantidade.*/
