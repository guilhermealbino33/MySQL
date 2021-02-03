SELECT *
FROM pedido_item
WHERE id_pedido = 6 AND (quantidade * preco_unitario) > 30.0;
