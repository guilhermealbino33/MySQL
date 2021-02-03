USE desi_loja;

SELECT situacao_pedido.id_situacao_pedido ID,
       situacao_pedido.nome Nome,
       SUM(pedido_item.quantidade) 'Qnt Pedidos'
  FROM situacao_pedido,
       pedido_item,
       pedido
 WHERE situacao_pedido.id_situacao_pedido = pedido.situacao
   AND pedido_item.id_pedido = pedido.id_pedido
 GROUP BY situacao_pedido.id_situacao_pedido,
		  situacao_pedido.nome;
   
/*Enviar um script SQL com o nome “desafio-22-<seu_nome>.sql” que contenha o comando SQL que atenda a solicitação 
abaixo utilizando a base de dados desi_loja e necessariamente com o uso do GROUP BY.
Listar o código da situação, a descrição da situação e a quantidade de pedidos que estão em cada uma das situações.
*/