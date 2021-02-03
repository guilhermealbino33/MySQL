USE desi_vendas;

SELECT * FROM compra;
SELECT * FROM cliente;

drop table compras_historico;

CREATE TABLE compras_historico AS
SELECT compra.id_compra 'ID',
	   compra.numero 'Número',
       cliente.nome 'Cliente',
       compra.total_compra 'Total Compra',
       compra.total_pagamento 'Total Pagamento',
       compra.data_compra 'Data Compra',
       compra.data_limite 'Data Limite',
       compra.data_pagamento 'Data Pagamento'
   FROM compra,
		cliente
  WHERE compra.total_pagamento > 0
	and compra.id_cliente = cliente.id_cliente;	         

SELECT *
  FROM compras_historico;
  
/*Faça uma cópia da tabela compra com o nome compras_historico que contenha:
nome do cliente invés do id_cliente
somente as compras que têm pagamento
*/