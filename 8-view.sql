USE lanchonete;


CREATE OR REPLACE VIEW View_Detalhes_Pedidos AS
SELECT
    Pedidos.id_pedido,
    Pedidos.nome_cliente,
    Pedidos.numero_mesa,
    Produtos.nome AS produto,
    Itens_Pedido.quantidade,
    Itens_Pedido.preco_unitario,
    Itens_Pedido.quantidade * Itens_Pedido.preco_unitario AS subtotal
FROM Pedidos
JOIN Itens_Pedido
    ON Pedidos.id_pedido = Itens_Pedido.id_pedido
JOIN Produtos
    ON Itens_Pedido.id_produto = Produtos.id_produto;


CREATE OR REPLACE VIEW View_Total_Pedidos AS
SELECT
    Pedidos.id_pedido,
    Pedidos.nome_cliente,
    Pedidos.numero_mesa,
    SUM(Itens_Pedido.quantidade) AS total_itens,
    SUM(Itens_Pedido.quantidade * Itens_Pedido.preco_unitario) AS valor_total
FROM Pedidos
JOIN Itens_Pedido
    ON Pedidos.id_pedido = Itens_Pedido.id_pedido
GROUP BY Pedidos.id_pedido, Pedidos.nome_cliente, Pedidos.numero_mesa;
