SELECT id_pedido, id_produto, quantidade, preco_unitario,  quantidade*preco_unitario AS preco_total
FROM desi_loja.pedido_item
WHERE id_pedido = 2
ORDER BY preco_total DESC;