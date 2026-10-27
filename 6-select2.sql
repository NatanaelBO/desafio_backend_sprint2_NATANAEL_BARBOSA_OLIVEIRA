USE lanchonete;


SELECT
    COUNT(*)            AS total_produtos,
    ROUND(AVG(preco_unitario), 2) AS preco_medio,
    MAX(preco_unitario) AS maior_preco,
    MIN(preco_unitario) AS menor_preco
FROM Produtos;


SELECT
    c.nome AS categoria,
    COUNT(p.id_produto)           AS qtd_produtos,
    ROUND(AVG(p.preco_unitario), 2) AS preco_medio
FROM Categorias c
LEFT JOIN Produtos p ON p.id_categoria = c.id_categoria
GROUP BY c.id_categoria, c.nome
ORDER BY qtd_produtos DESC;


SELECT nome, preco_unitario
FROM Produtos
WHERE preco_unitario > (SELECT AVG(preco_unitario) FROM Produtos)
ORDER BY preco_unitario DESC;
