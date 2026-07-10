USE vertex_industries;

INSERT INTO clientes
(nome_cliente, cnpj, cidade, estado, setor)
VALUES
('TechNova Solutions', '12.345.678/0001-10', 'Sao Paulo', 'SP', 'Tecnologia'),
('LogiSmart Distribuicao', '98.765.432/0001-55', 'Rio de Janeiro', 'RJ', 'Logistica'),
('Mercado Digital Express', '45.321.789/0001-22', 'Belo Horizonte', 'MG', 'Varejo'),
('Alpha Retail Group', '11.222.333/0001-44', 'Curitiba', 'PR', 'Varejo'),
('Vision Industrial Tech', '55.666.777/0001-88', 'Porto Alegre', 'RS', 'Industria');

INSERT INTO produtos
(nome_produto, categoria, preco_unitario, custo_unitario, status_produto)
VALUES
('Scanner Logistico VX-100', 'Hardware', 1200.00, 800.00, 'Ativo'),
('Tablet Industrial VX-200', 'Hardware', 3500.00, 2400.00, 'Ativo'),
('Sensor RFID VX-300', 'IoT', 450.00, 220.00, 'Ativo'),
('Coletor de Dados VX-400', 'Logistica', 2800.00, 1900.00, 'Ativo'),
('Gateway Inteligente VX-500', 'Automacao', 5200.00, 3900.00, 'Ativo'),
('Switch Catalyst C-48', 'Infraestrutura', 2700.00, 1800.00, 'Ativo'),
('Roteador AX5400', 'Infraestrutura', 700.00, 450.00, 'Ativo'),
('Firewall FH-Sense', 'Software', 4800.00, 3500.00, 'Ativo'),
('Ponto de Acesso UniFi 6', 'Hardware', 900.00, 500.00, 'Ativo'),
('Medium Server PowerEdge', 'Infraestrutura', 4600.00, 3000.00, 'Ativo');

INSERT INTO fornecedores
(nome_fornecedor, cnpj, cidade, estado, categoria_fornecimento)
VALUES
('Global Components Ltda', '10.111.222/0001-01', 'Campinas', 'SP', 'Componentes Eletronicos'),
('RFID Connect Brasil', '20.333.444/0001-02', 'Sao Paulo', 'SP', 'Sensores RFID'),
('Industrial Devices Corp', '30.555.666/0001-03', 'Joinville', 'SC', 'Hardware Industrial'),
('Smart Logistics Supply', '40.777.888/0001-04', 'Curitiba', 'PR', 'Equipamentos Logisticos');

INSERT INTO estoque
(id_produto, quantidade_disponivel, estoque_minimo, local_armazenagem)
VALUES
(1, 150, 30, 'Galpao A'),
(2, 80, 20, 'Galpao A'),
(3, 300, 50, 'Galpao B'),
(4, 120, 25, 'Galpao B'),
(5, 60, 15, 'Galpao C'),
(6, 120, 30, 'Galpao C'),
(7, 90, 20, 'Galpao B'),
(8, 200, 50, 'Galpao A'),
(9, 300, 25, 'Galpao B'),
(10, 60, 15, 'Galpao C');

INSERT INTO pedidos
(id_cliente, data_pedido, valor_total, status_pedido)
VALUES
(1, '2026-05-01', 2400.00, 'Faturado'),
(2, '2026-05-02', 3500.00, 'Em Transporte'),
(3, '2026-05-03', 900.00, 'Entregue'),
(4, '2026-05-04', 5200.00, 'Processando'),
(5, '2026-05-05', 5600.00, 'Faturado');

INSERT INTO itens_pedido
(id_pedido, id_produto, quantidade, preco_unitario, subtotal)
VALUES
(1, 1, 2, 1200.00, 2400.00),
(2, 2, 1, 3500.00, 3500.00),
(3, 3, 2, 450.00, 900.00),
(4, 5, 1, 5200.00, 5200.00),
(5, 4, 2, 2800.00, 5600.00);

INSERT INTO pagamentos
(id_pedido, forma_pagamento, valor_pago, data_pagamento, status_pagamento)
VALUES
(1, 'PIX', 2400.00, '2026-05-01', 'Pago'),
(2, 'Boleto', 3500.00, '2026-05-03', 'Pendente'),
(3, 'Cartao Corporativo', 900.00, '2026-05-03', 'Pago'),
(4, 'Transferencia Bancaria', 5200.00, '2026-05-05', 'Processando'),
(5, 'PIX', 5600.00, '2026-05-05', 'Pago');

INSERT INTO entregas
(id_pedido, transportadora, data_envio, data_entrega, status_entrega)
VALUES
(1, 'RapidExpress', '2026-05-02', '2026-05-05', 'Entregue'),
(2, 'LogMaster', '2026-05-03', NULL, 'Em Transporte'),
(3, 'CargoFly', '2026-05-03', '2026-05-04', 'Entregue'),
(4, 'RapidExpress', NULL, NULL, 'Separacao'),
(5, 'PrimeLog', '2026-05-06', NULL, 'Em Transporte');
