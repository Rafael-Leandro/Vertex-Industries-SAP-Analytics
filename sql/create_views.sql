USE vertex_industries;

-- View 1 - Visão Comercial de Vendas
CREATE VIEW vw_vendas_comercial AS

SELECT

    pe.id_pedido,
    pe.data_pedido,

    c.id_cliente,
    c.nome_cliente,
    c.estado,
    c.setor,

    p.id_produto,
    p.nome_produto,
    p.categoria,

    i.quantidade,
    i.preco_unitario,
    i.subtotal,

    pe.status_pedido

FROM pedidos pe

INNER JOIN clientes c
    ON pe.id_cliente = c.id_cliente

INNER JOIN itens_pedido i
    ON pe.id_pedido = i.id_pedido

INNER JOIN produtos p
    ON i.id_produto = p.id_produto;
    
-- View 2 - Performance dos Produtos
CREATE VIEW vw_performance_produtos AS

SELECT

    p.id_produto,
    p.nome_produto,
    p.categoria,

    SUM(i.quantidade) AS quantidade_vendida,

    SUM(i.subtotal) AS receita_total,

    SUM(
        (i.subtotal) -
        (p.custo_unitario * i.quantidade)
    ) AS lucro_total

FROM produtos p

INNER JOIN itens_pedido i

ON p.id_produto = i.id_produto

GROUP BY
p.id_produto,
p.nome_produto,
p.categoria;

-- View 3 - Visão Financeira
CREATE VIEW vw_financeiro AS

SELECT

    pg.id_pagamento,

    pe.id_pedido,

    c.nome_cliente,

    pg.forma_pagamento,

    pg.valor_pago,

    pg.data_pagamento,

    pg.status_pagamento,

    pe.valor_total

FROM pagamentos pg

INNER JOIN pedidos pe

ON pg.id_pedido = pe.id_pedido

INNER JOIN clientes c

ON pe.id_cliente = c.id_cliente;

-- View 4 - Visão Logística
CREATE VIEW vw_logistica AS

SELECT

    e.id_entrega,

    pe.id_pedido,

    c.nome_cliente,

    e.transportadora,

    e.data_envio,

    e.data_entrega,

    e.status_entrega,

    DATEDIFF(
        e.data_entrega,
        e.data_envio
    ) AS dias_entrega

FROM entregas e

INNER JOIN pedidos pe

ON e.id_pedido = pe.id_pedido

INNER JOIN clientes c

ON pe.id_cliente = c.id_cliente;

-- View 5 - Dashboard Executivo
CREATE VIEW vw_dashboard_executivo AS

SELECT

    COUNT(DISTINCT pe.id_pedido)
        AS total_pedidos,

    SUM(pe.valor_total)
        AS faturamento_total,

    AVG(pe.valor_total)
        AS ticket_medio,

    COUNT(DISTINCT c.id_cliente)
        AS total_clientes

FROM pedidos pe

INNER JOIN clientes c

ON pe.id_cliente = c.id_cliente;

-- Conferir as Views Criadas
SHOW FULL TABLES
WHERE Table_type = 'VIEW';

-- Testar uma View
SELECT *
FROM vw_vendas_comercial
LIMIT 10;