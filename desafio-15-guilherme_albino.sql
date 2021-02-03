USE desi_vendas;

SELECT date_format(p.date, "%D %M %Y") 'Data Pgto', c.nome 'Cliente', p.valor 'Valor Pgto', tp.nome 'Forma Pgto'
  FROM pagamento p, cliente c, tipo_pagamento tp
 WHERE p.tipo_pagamento = tp.id_tipo_pagamento
   and p.id_cliente = c.id_cliente;


/*Utilizar a base desi_vendas → Utilize o comando USE
Utilizar as tabelas pagamento, cliente e tipo_pagamento
Retornar como resultado a data do pagamento, o nome do cliente, o valor do pagamento e a forma de pagamento.
A data deve ter o formato dd/mm/aaaa
As colunas que devem ser mostradas no SELECT seriam:
pagamento.date
cliente.nome
pagamento.valor
tipo_pagamento.nome
Fique à vontade para utilizar os apelidos que facilitem o entendimento.*/
