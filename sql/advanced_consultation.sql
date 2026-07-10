USE vertex_industries;

-- Faturamento total da empresa
SELECT
	ROUND(SUM(valor_total), 2) AS faturamento_total
FROM pedidos;

-- Ticket médio
SELECT
	ROUND(AVG(valor_total), 2) AS ticket_medio
FROM pedidos;

-- Quantidade total de pedidos
SELECT
	COUNT(id_pedido) AS total_pedidos
FROM pedidos;

-- Produtos mais vendidos
SELECT
    p.nome_produto,
    SUM(i.quantidade) AS quantidade_vendida
FROM itens_pedido i
JOIN produtos p
    ON i.id_produto = p.id_produto
GROUP BY p.nome_produto
ORDER BY quantidade_vendida DESC;

-- Produtos mais lucrativos
SELECT
	p.nome_produto,
    
    ROUND(
		SUM(
			i.subtotal - 
            (p.custo_unitario * i.quantidade)
		), 2
	) AS lucro_total

FROM itens_pedido i
JOIN produtos p
	ON i.id_produto = p.id_produto
GROUP BY p.nome_produto
ORDER BY lucro_total DESC;

-- Clientes que mais compram
SELECT
	c.nome_cliente,
    
    ROUND(SUM(pe.valor_total), 2) AS total_comprado

FROM pedidos pe
JOIN clientes c
	ON pe.id_cliente = c.id_cliente
GROUP BY c.nome_cliente
ORDER BY total_comprado DESC
LIMIT 10;

-- Faturamento por estado
SELECT
	c.estado,
    
    ROUND(SUM(pe.valor_total), 2) AS faturamento

FROM pedidos pe
JOIN clientes c
	ON pe.id_cliente = c.id_cliente
GROUP BY c.estado
ORDER BY faturamento DESC;

-- Faturamento por setor
SELECT
	c.setor,
    
    ROUND(SUM(pe.valor_total), 2) AS faturamento_setor

FROM pedidos pe
JOIN clientes c
	ON pe.id_cliente = c.id_cliente
GROUP BY c.setor
ORDER BY faturamento_setor DESC;

-- Quantidade de clientes por setor
SELECT
    setor,
    COUNT(id_cliente) AS total_clientes
FROM clientes
GROUP BY setor
ORDER BY total_clientes DESC;

-- Pedidos por status
SELECT
	status_pedido,
    COUNT(*) AS quantidade
FROM pedidos
GROUP BY status_pedido;

-- Status dos pagamentos
SELECT
	status_pagamento,
    COUNT(*) AS total
FROM pagamentos
GROUP BY status_pagamento;

-- Formas de pagamento mais utilizadas
SELECT
	forma_pagamento,
    COUNT(*) AS quantidade
FROM pagamentos
GROUP BY forma_pagamento
ORDER BY quantidade DESC;

-- Entregas por transportadora
SELECT
	transportadora,
    COUNT(*) AS total_entregas
FROM entregas
GROUP BY transportadora
ORDER BY total_entregas DESC;

-- Pedidos Entregues X Pedidos Em Transporte
SELECT
    status_entrega,
    COUNT(*) AS quantidade
FROM entregas
GROUP BY status_entrega;

-- Produtos com estoque baixo
SELECT
	p.nome_produto,
    e.quantidade_disponivel,
    e.estoque_minimo

FROM estoque e
JOIN produtos p
	ON e.id_produto = p.id_produto
WHERE e.quantidade_disponivel <= e.estoque_minimo;

-- Faturamento mensal
SELECT
	YEAR(data_pedido) AS ano,
    MONTH(data_pedido) AS mes,
    
    ROUND(SUM(valor_total), 2) AS faturamento

FROM pedidos
GROUP BY ano, mes
ORDER BY ano, mes;