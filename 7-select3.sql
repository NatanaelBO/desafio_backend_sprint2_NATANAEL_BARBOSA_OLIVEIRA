USE lanchonete;

SELECT
    Pedidos.id_pedido,
    Pedidos.nome_cliente,
    Produtos.nome AS produto,
    Categorias.nome AS categoria,
    Itens_Pedido.quantidade,
    Itens_Pedido.preco_unitario,
    Itens_Pedido.quantidade * Itens_Pedido.preco_unitario AS subtotal
FROM Pedidos
JOIN Itens_Pedido
    ON Pedidos.id_pedido = Itens_Pedido.id_pedido
JOIN Produtos
    ON Itens_Pedido.id_produto = Produtos.id_produto
JOIN Categorias
    ON Produtos.id_categoria = Categorias.id_categoria
ORDER BY Pedidos.id_pedido;
