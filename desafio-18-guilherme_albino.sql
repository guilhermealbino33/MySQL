USE desi_inventario;

SELECT *
  FROM produto;
  
INSERT INTO produto (id_produto, nome, quantidade_estoque, preco_unitario) VALUES (null, 'Vassoura Nylon', 14, 3.50);
INSERT INTO produto (id_produto, nome, quantidade_estoque, preco_unitario) VALUES (null, 'Saco de lixo 100 lt', 100, 10.50);
INSERT INTO produto (id_produto, nome, quantidade_estoque, preco_unitario) VALUES (null, 'Balde plástico', 40, 30.50);