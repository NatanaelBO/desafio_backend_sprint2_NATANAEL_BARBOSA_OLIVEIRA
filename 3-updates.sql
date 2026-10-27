USE lanchonete;

UPDATE Produtos
SET preco_unitario = 20.00
WHERE id_produto = 1;

UPDATE Produtos
SET nome = 'Refrigerante Lata',
    preco_unitario = 6.50
WHERE id_produto = 3;


UPDATE Pedidos
SET nome_cliente = 'Beatriz'
WHERE id_pedido = 2;
