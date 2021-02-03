USE desi_loja;

SELECT pedido_item.id_pedido 'ID Pedido', 
       situacao_pedido.id_situacao_pedido 'ID Situação',
       situacao_pedido.nome 'Situação',
       SUM(pedido_item.preco_unitario * pedido_item.quantidade) as Total
  FROM situacao_pedido,
       pedido_item,
       pedido
 WHERE situacao_pedido.id_situacao_pedido = pedido.situacao
   AND pedido_item.id_pedido = pedido.id_pedido
 GROUP BY pedido_item.id_pedido,
          situacao_pedido.id_situacao_pedido,
	   	  situacao_pedido.nome
HAVING Total > 50
 ORDER BY pedido_item.id_pedido;

/*Enviar um script SQL com o nome “desafio-23-<seu_nome>.sql” que contenha o comando SQL que atenda a solicitação abaixo 
utilizando a base de dados desi_loja e necessariamente com o uso do HAVING.
Listar o código pedido, o código da situação do pedido, o nome da situação do pedido e o total ( preço unitário * quantidade ) de cada pedido;
Mostrar somente os totais maiores do que 50
Ordenar pelo pedido de maior valor no total 
*/