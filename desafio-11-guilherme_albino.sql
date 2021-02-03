SELECT id_pedido, prod.id_produto, nome, quantidade, ped.preco_unitario
FROM desi_loja.pedido_item ped
INNER JOIN desi_loja.produto prod
ON ped.id_produto = prod.id_produto;