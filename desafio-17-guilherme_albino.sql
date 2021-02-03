USE desi_loja;

SELECT id_consumidor, 
	   primeiro_nome,
       pontos, 'Bronze' AS 'tipo' 
  FROM consumidor
 WHERE pontos < 2000
 UNION
 -- MENORES QUE 2000
 SELECT id_consumidor, 
	   primeiro_nome,
       pontos, 'Prata' AS 'tipo' 
  FROM consumidor
 WHERE pontos BETWEEN 2000 and 3000 
 UNION
  SELECT id_consumidor, 
	   primeiro_nome,
       pontos, 'Ouro' AS 'tipo' 
  FROM consumidor
 WHERE pontos > 3000 
ORDER BY primeiro_nome;


