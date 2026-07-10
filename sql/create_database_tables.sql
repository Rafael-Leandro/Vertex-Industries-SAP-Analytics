CREATE DATABASE vertex_industries;

USE vertex_industries;

-- Criar a tabela CLIENTES
CREATE TABLE clientes (
	id_cliente INT AUTO_INCREMENT,
    nome_cliente VARCHAR(150) NOT NULL,
    cnpj VARCHAR(18) UNIQUE,
    cidade VARCHAR(100),
    estado VARCHAR(50),
    setor VARCHAR(100),
    
    PRIMARY KEY (id_cliente)
);

-- Criar a tabela PRODUTOS
CREATE TABLE produtos (
	id_produto INT AUTO_INCREMENT,
    nome_produto VARCHAR(150) NOT NULL,
    categoria VARCHAR(100),
    preco_unitario DECIMAL(10,2),
    custo_unitario DECIMAL(10,2),
    status_produto VARCHAR(50),
    
    PRIMARY KEY (id_produto)
);

-- Criar a tabela FORNECEDORES
CREATE TABLE fornecedores (
	id_fornecedor INT AUTO_INCREMENT,
    nome_fornecedor VARCHAR(150) NOT NULL,
    cnpj VARCHAR(18) UNIQUE,
    cidade VARCHAR(100),
    estado VARCHAR(50),
    categoria_fornecimento VARCHAR(100),
    
    PRIMARY KEY (id_fornecedor)
);

-- Criar a tabela ESTOQUE
CREATE TABLE estoque (
	id_estoque INT AUTO_INCREMENT,
    id_produto INT NOT NULL,
    quantidade_disponivel INT,
    estoque_minimo INT,
    local_armazenagem VARCHAR(100),
    
    PRIMARY KEY (id_estoque),
    
    CONSTRAINT fk_estoque_produto
		FOREIGN KEY (id_produto)
        REFERENCES produtos(id_produto)
);

-- Criar a tabela PEDIDOS
CREATE TABLE pedidos (
	id_pedido INT AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    data_pedido DATE,
    valor_total DECIMAL(10,2),
    status_pedido VARCHAR(50),
    
    PRIMARY KEY (id_pedido),
    
    CONSTRAINT fk_pedido_cliente
		FOREIGN KEY (id_cliente)
        REFERENCES clientes(id_cliente)
);

-- Criar a tabela ITENS_PEDIDO
CREATE TABLE itens_pedido (
	id_item_pedido INT AUTO_INCREMENT,
    id_pedido INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT,
    preco_unitario DECIMAL(10,2),
    subtotal DECIMAL(10,2),
    
    PRIMARY KEY (id_item_pedido),
    
    CONSTRAINT fk_item_pedido
		FOREIGN KEY (id_pedido)
        REFERENCES pedidos(id_pedido),
	
    CONSTRAINT fk_item_produto
		FOREIGN KEY (id_produto)
        REFERENCES produtos(id_produto)
);

-- Criar a tabela PAGAMENTOS
CREATE TABLE pagamentos (
	id_pagamento INT AUTO_INCREMENT,
    id_pedido INT NOT NULL,
    forma_pagamento VARCHAR(50),
    valor_pago DECIMAL(10,2),
    data_pagamento DATE,
    status_pagamento VARCHAR(50),
    
    PRIMARY KEY (id_pagamento),
    
    CONSTRAINT fk_pagamento_pedido
		FOREIGN KEY (id_pedido)
        REFERENCES pedidos(id_pedido)
);

-- Criar a tabela ENTREGAS
CREATE TABLE entregas (
	id_entrega INT AUTO_INCREMENT,
    id_pedido INT NOT NULL,
    transportadora VARCHAR(100),
    data_envio DATE,
    data_entrega DATE,
    status_entrega VARCHAR(50),
    
    PRIMARY KEY (id_entrega),
    
    CONSTRAINT fk_entrega_pedido
		FOREIGN KEY (id_pedido)
        REFERENCES pedidos(id_pedido)
);

-- Verificar se todas as tabelas foram criadas
SHOW TABLES;