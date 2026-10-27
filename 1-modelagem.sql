DROP DATABASE IF EXISTS lanchonete;

CREATE DATABASE lanchonete
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE lanchonete;


CREATE TABLE Categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome         VARCHAR(50)  NOT NULL UNIQUE,
    descricao    VARCHAR(255)
) ENGINE = InnoDB;

CREATE TABLE Fornecedores (
    id_fornecedor INT AUTO_INCREMENT PRIMARY KEY,
    nome          VARCHAR(100) NOT NULL,
    telefone      VARCHAR(20),
    email         VARCHAR(100) UNIQUE
) ENGINE = InnoDB;

CREATE TABLE Produtos (
    id_produto     INT AUTO_INCREMENT PRIMARY KEY,
    nome           VARCHAR(100)   NOT NULL,
    preco_unitario DECIMAL(10, 2) NOT NULL,
    id_categoria   INT            NOT NULL,
    id_fornecedor  INT            NULL,

    CONSTRAINT chk_produto_preco CHECK (preco_unitario >= 0),

    CONSTRAINT fk_produto_categoria
        FOREIGN KEY (id_categoria)
        REFERENCES Categorias (id_categoria),

    CONSTRAINT fk_produto_fornecedor
        FOREIGN KEY (id_fornecedor)
        REFERENCES Fornecedores (id_fornecedor)
        ON DELETE SET NULL
) ENGINE = InnoDB;

CREATE TABLE Pedidos (
    id_pedido    INT AUTO_INCREMENT PRIMARY KEY,
    data_hora    DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    numero_mesa  INT,
    nome_cliente VARCHAR(100),

    CONSTRAINT chk_pedido_mesa
        CHECK (numero_mesa IS NULL OR numero_mesa > 0),
    CONSTRAINT chk_pedido_identificacao
        CHECK (numero_mesa IS NOT NULL OR nome_cliente IS NOT NULL)
) ENGINE = InnoDB;

CREATE TABLE Itens_Pedido (
    id_item        INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido      INT            NOT NULL,
    id_produto     INT            NOT NULL,
    quantidade     INT            NOT NULL,
    preco_unitario DECIMAL(10, 2) NOT NULL,

    CONSTRAINT chk_item_quantidade CHECK (quantidade > 0),
    CONSTRAINT chk_item_preco      CHECK (preco_unitario >= 0),

    CONSTRAINT fk_item_pedido
        FOREIGN KEY (id_pedido)
        REFERENCES Pedidos (id_pedido)
        ON DELETE CASCADE,

    CONSTRAINT fk_item_produto
        FOREIGN KEY (id_produto)
        REFERENCES Produtos (id_produto)
) ENGINE = InnoDB;
