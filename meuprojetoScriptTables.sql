-- Script do meu projeto para minha esposa. Comecei a criar dia 04/05/2026 as 19:26 horas.
CREATE DATABASE alehdados;
USE alehdados;

CREATE TABLE menu (
id_menu INT UNSIGNED NOT NULL AUTO_INCREMENT,
nome_menu VARCHAR(30) NOT NULL,
descricao TEXT NULL,
preco DECIMAL NOT NULL,

PRIMARY KEY (id_menu)
);

CREATE TABLE cliente (
id_cliente INT UNSIGNED NOT NULL AUTO_INCREMENT,
nome_cliente VARCHAR(100) NOT NULL,
telefone VARCHAR(20) NOT NULL,

PRIMARY KEY (id_cliente)
);

CREATE TABLE pedido (
id_pedido INT UNSIGNED NOT NULL AUTO_INCREMENT,
id_cliente_fk INT UNSIGNED NOT NULL,
estatus VARCHAR(30) NOT NULL,
data_pedido DATETIME,

PRIMARY KEY (id_pedido),
FOREIGN KEY (id_cliente_fk) REFERENCES cliente (id_cliente)
);

CREATE TABLE itens_pedido (
    id_item INT UNSIGNED NOT NULL AUTO_INCREMENT,
    id_pedido_fk INT UNSIGNED NOT NULL,
    id_menu_fk INT UNSIGNED NOT NULL,
    quantidade INT UNSIGNED NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (id_item),
    FOREIGN KEY (id_pedido_fk) REFERENCES pedido(id_pedido),
    FOREIGN KEY (id_menu_fk) REFERENCES menu(id_menu)
);

-- Altera a coluna telefone de cliente de int para varchar
ALTER TABLE cliente
MODIFY telefone varchar(20) NOT NULL;

-- menu ficticio para testes gerado pelo chatgpt
INSERT INTO menu (nome_menu, descricao, preco)
VALUES
('Bolo de Chocolate', 'Bolo de chocolate com cobertura de brigadeiro', 45.90),

('Bolo de Cenoura', 'Bolo de cenoura com cobertura de chocolate', 39.90),

('Bolo Red Velvet', 'Massa vermelha com recheio de cream cheese', 59.90),

('Bolo de Morango', 'Bolo recheado com creme e morangos frescos', 54.90),

('Bolo Prestigio', 'Bolo de chocolate com recheio de coco', 49.90);

-- alterei a coluna preco de menu, esqueci de definer as casas no decimal.
ALTER TABLE menu
MODIFY preco decimal(10,2);

-- clientes ficticios para testes gerado pelo chatgpt
INSERT INTO cliente (nome_cliente, telefone)
VALUES 
('João Silva', 4199991111),
('Maria Oliveira', 4198882222),
('Carlos Souza', 4197773333),
('Ana Pereira', 4196664444),
('Lucas Fernandes', 4195555555);

SELECT * FROM cliente;
SELECT * FROM menu;

-- alterei a coluna data_pedido de pedido para colocar a data automatico.
ALTER TABLE pedido
MODIFY data_pedido DATETIME DEFAULT CURRENT_TIMESTAMP;

-- inserindo pedidos ficticios, feito por mim mesmo :)
INSERT INTO pedido (id_cliente_fk, estatus)
VALUES 
(1,'PREPARANDO'),
(2, 'PREPARANDO'),
(3, 'ENTREGUE'),
(4, 'AGUARDANDO'),
(5, 'ENTREGUE');
SELECT * FROM pedido;

INSERT INTO itens_pedido (id_pedido_fk, id_menu_fk, quantidade, preco_unitario)
VALUES 
(1, 1, 1, 45.90),
(1, 2, 1, 39.90),
(2, 3, 2, 59.90),
(3, 4, 1, 54.90),
(3, 1, 2, 45.90),
(4, 5, 3, 49.90),
(5, 1, 1, 45.90),
(5, 2, 1, 39.90),
(5, 3, 1, 59.90),
(5, 4, 1, 54.90),
(5, 5, 1, 49.90);

-- criei um select para mostrar apenas itens que não foram entregue
CREATE VIEW vw_itenspreparando AS
SELECT
i.id_item AS "ID ITEM",
c.nome_cliente AS "CLIENTE",
i.id_pedido_fk AS "ID PEDIDO",
m.id_menu AS "ID MENU",
m.nome_menu AS "MENU ESCOLHIDO",
i.quantidade AS "QUANTIDADE",
i.preco_unitario AS "PREÇO UNITÁRIO",
p.estatus AS "ESTATUS",
p.data_pedido AS "DATA"
FROM itens_pedido i 
INNER JOIN menu m ON i.id_menu_fk = m.id_menu
INNER JOIN pedido p ON i.id_pedido_fk = p.id_pedido
INNER JOIN cliente c ON p.id_cliente_fk = c.id_cliente
WHERE p.estatus <> "ENTREGUE"
ORDER BY p.id_pedido ASC;

SELECT * FROM vw_itenspreparando

