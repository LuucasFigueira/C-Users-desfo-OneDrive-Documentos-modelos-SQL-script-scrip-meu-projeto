CREATE VIEW alehdados.teste AS
select 
id_cliente
id_cliente_fk
from pedido p
inner join cliente c ON c.id_cliente = p.id_cliente_fk
where estatus;

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
INNER JOIN cliente c ON p.id_cliente_fk = c.id_cliente;
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
WHERE p.estatus = "AGUARDANDO"
ORDER BY p.id_pedido ASC;

SELECT * FROM vw_itenspreparando