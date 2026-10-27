USE lanchonete;


INSERT INTO Categorias (nome, descricao) VALUES
    ('Lanches',    'Hambúrgueres, sanduíches e porções'),
    ('Bebidas',    'Refrigerantes e sucos'),
    ('Sobremesas', 'Doces e sorvetes');


INSERT INTO Fornecedores (nome, telefone, email) VALUES
    ('Frigorífico Boa Carne', '(11) 3333-1111', 'contato@boacarne.com.br'),
    ('Distribuidora Bebe Bem', '(11) 3333-2222', 'vendas@bebebem.com.br'),
    ('Doces & Cia',            '(11) 3333-3333', 'pedidos@docesecia.com.br');


INSERT INTO Produtos (nome, preco_unitario, id_categoria, id_fornecedor)
SELECT 'Hambúrguer', 18.90, c.id_categoria, f.id_fornecedor
FROM Categorias c, Fornecedores f
WHERE c.nome = 'Lanches' AND f.nome = 'Frigorífico Boa Carne';

INSERT INTO Produtos (nome, preco_unitario, id_categoria, id_fornecedor)
SELECT 'Batata Frita', 12.00, c.id_categoria, f.id_fornecedor
FROM Categorias c, Fornecedores f
WHERE c.nome = 'Lanches' AND f.nome = 'Frigorífico Boa Carne';

INSERT INTO Produtos (nome, preco_unitario, id_categoria, id_fornecedor)
SELECT 'Refrigerante', 6.00, c.id_categoria, f.id_fornecedor
FROM Categorias c, Fornecedores f
WHERE c.nome = 'Bebidas' AND f.nome = 'Distribuidora Bebe Bem';

INSERT INTO Produtos (nome, preco_unitario, id_categoria, id_fornecedor)
SELECT 'Suco Natural', 7.50, c.id_categoria, f.id_fornecedor
FROM Categorias c, Fornecedores f
WHERE c.nome = 'Bebidas' AND f.nome = 'Distribuidora Bebe Bem';

INSERT INTO Produtos (nome, preco_unitario, id_categoria, id_fornecedor)
SELECT 'Sorvete', 8.50, c.id_categoria, f.id_fornecedor
FROM Categorias c, Fornecedores f
WHERE c.nome = 'Sobremesas' AND f.nome = 'Doces & Cia';

INSERT INTO Produtos (nome, preco_unitario, id_categoria, id_fornecedor)
SELECT 'Pudim', 9.00, c.id_categoria, f.id_fornecedor
FROM Categorias c, Fornecedores f
WHERE c.nome = 'Sobremesas' AND f.nome = 'Doces & Cia';


INSERT INTO Pedidos (numero_mesa, nome_cliente) VALUES
    (5,    'Carlos'),   -- pedido 1: mesa 5
    (2,    NULL),       -- pedido 2: mesa 2, sem nome
    (NULL, 'Ana'),      -- pedido 3: balcão
    (7,    'Marcos');   -- pedido 4: será cancelado no arquivo 4


INSERT INTO Itens_Pedido (id_pedido, id_produto, quantidade, preco_unitario)
SELECT 1, id_produto, 2, preco_unitario FROM Produtos WHERE nome = 'Hambúrguer';
INSERT INTO Itens_Pedido (id_pedido, id_produto, quantidade, preco_unitario)
SELECT 1, id_produto, 2, preco_unitario FROM Produtos WHERE nome = 'Refrigerante';
INSERT INTO Itens_Pedido (id_pedido, id_produto, quantidade, preco_unitario)
SELECT 1, id_produto, 1, preco_unitario FROM Produtos WHERE nome = 'Sorvete';

INSERT INTO Itens_Pedido (id_pedido, id_produto, quantidade, preco_unitario)
SELECT 2, id_produto, 1, preco_unitario FROM Produtos WHERE nome = 'Hambúrguer';
INSERT INTO Itens_Pedido (id_pedido, id_produto, quantidade, preco_unitario)
SELECT 2, id_produto, 1, preco_unitario FROM Produtos WHERE nome = 'Batata Frita';
INSERT INTO Itens_Pedido (id_pedido, id_produto, quantidade, preco_unitario)
SELECT 2, id_produto, 1, preco_unitario FROM Produtos WHERE nome = 'Suco Natural';

INSERT INTO Itens_Pedido (id_pedido, id_produto, quantidade, preco_unitario)
SELECT 3, id_produto, 3, preco_unitario FROM Produtos WHERE nome = 'Batata Frita';
INSERT INTO Itens_Pedido (id_pedido, id_produto, quantidade, preco_unitario)
SELECT 3, id_produto, 3, preco_unitario FROM Produtos WHERE nome = 'Refrigerante';

INSERT INTO Itens_Pedido (id_pedido, id_produto, quantidade, preco_unitario)
SELECT 4, id_produto, 1, preco_unitario FROM Produtos WHERE nome = 'Hambúrguer';
