USE desi_loja;

SELECT p.id_pedido 'ID', p.data_pedido 'Data pedido', c.primeiro_nome 'Consumidor', f.nome 'Fornecedor', sp.nome 'Situação pedido'
  FROM pedido p, consumidor c, fornecedor f, situacao_pedido sp
 WHERE p.id_consumidor = c.id_consumidor
   and p.id_fornecedor = f.id_fornecedor
   and p.situacao = sp.id_situacao_pedido;


/*Utilizar a base desi_loja → Utilize o comando USE
Utilizar as tabelas pedido, consumidor, fornecedor e situacao_pedido
Retornar como resultado da consulta todos os pedidos da tabela pedido com os dados do consumidor (primeiro_nome), fornecedor (nome) e situação do pedido (nome) 
independente de possuírem valores ou não.
As colunas que devem ser mostradas no SELECT seriam:
pedido.id_pedido
pedido.data_pedido
consumidor.primeiro_nome
fornecedor.nome
situacao_pedido.nome
Fique a vontade para utilizar os apelidos que facilitem o entendimento.*/
