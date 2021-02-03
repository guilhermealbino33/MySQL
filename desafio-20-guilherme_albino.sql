USE desi_loja;

UPDATE consumidor
   SET pontos = pontos + 50
 WHERE data_aniversario < '1990-01-01';


SELECT *
  FROM consumidor

/*Adicionar 50 pontos extras a todos os consumidores que nasceram antes de 1990*/