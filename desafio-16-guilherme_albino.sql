USE desi_loja;
-- explicita
SELECT f.nome Fornecedor,
	   p.nome Produto
  FROM fornecedor f
 CROSS JOIN produto p;
-- implicita

SELECT f.nome Fornecedor,
	   p.nome Produto
  FROM fornecedor f,
	   produto p;

/*Faça um CROSS JOIN entre as tabelas fornecedor e produto utilizando a sintaxe implícita e a sintaxe explícita.
As colunas retornadas em ambos os casos devem ser as que contém o nome do fornecedor e a que contém o nome do produto
Fique à vontade para utilizar os apelidos que facilitem o entendimento.
*/