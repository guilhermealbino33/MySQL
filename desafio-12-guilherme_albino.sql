USE desi_vendas;

SELECT p.date, p.id_pagamento, p.valor, c.nome, t.nome
FROM pagamento p 
JOIN cliente c
	ON p.id_cliente = c.id_cliente
JOIN tipo_pagamento t;
	
    /*ON t.id_pagamento = p.id_cliente;*/


/*data do pagamento, nº do pagamento, valor do pagamento, nome do cliente e a descrição da forma de pagamento utilizada no pedido*/