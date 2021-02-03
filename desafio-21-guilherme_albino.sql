USE desi_loja;

UPDATE pedido
   SET comentarios = 'Cliente Ouro'
 WHERE id_consumidor IN (SELECT id_consumidor
                           FROM consumidor
                          WHERE pontos > 3000);
 
 

/*Enviar um script SQL com o nome “desafio-21-<seu_nome>.sql” que contenha o comando SQL que atenda a solicitação 
abaixo utilizando a base de dados desi_loja e necessariamente com o uso de subqueries.
Para os consumidores com pontuação maior que 3000 pontos, alterar o comentário para ‘Cliente Ouro’ na tabela pedido.
*/