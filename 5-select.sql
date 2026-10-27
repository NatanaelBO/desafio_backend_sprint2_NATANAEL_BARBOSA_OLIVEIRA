USE lanchonete;

SELECT nome, preco_unitario
FROM Produtos
WHERE preco_unitario > 10.00
ORDER BY preco_unitario DESC;
