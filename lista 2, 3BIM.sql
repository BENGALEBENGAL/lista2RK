CREATE DATABASE db_ecommerce_exam;
USE db_ecommerce_exam;
CREATE TABLE produtos (
   produto_id INT AUTO_INCREMENT PRIMARY KEY,
   nome VARCHAR(100) NOT NULL,
   descricao TEXT,
   preco DECIMAL(10, 2) NOT NULL,
   estoque INT NOT NULL,
   data_adicionado DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE clientes (
   cliente_id INT AUTO_INCREMENT PRIMARY KEY,
   nome VARCHAR(100) NOT NULL,
   email VARCHAR(100) UNIQUE NOT NULL,
   telefone VARCHAR(15),
   endereco TEXT,
   data_registro DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE pedidos (
   pedido_id INT AUTO_INCREMENT PRIMARY KEY,
   cliente_id INT NOT NULL,
   data_pedido DATETIME DEFAULT CURRENT_TIMESTAMP,
   total DECIMAL(10, 2) NOT NULL,
   status VARCHAR(50),
   FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id)
);

CREATE TABLE itens_pedido (
   item_pedido_id INT AUTO_INCREMENT PRIMARY KEY,
   pedido_id INT NOT NULL,
   produto_id INT NOT NULL,
   quantidade INT NOT NULL,
   preco_unitario DECIMAL(10, 2) NOT NULL,
   FOREIGN KEY (pedido_id) REFERENCES pedidos(pedido_id),
   FOREIGN KEY (produto_id) REFERENCES produtos(produto_id)
);

-- Inserindo produtos
INSERT INTO produtos (nome, descricao, preco, estoque) VALUES
('Smartphone XYZ', 'Smartphone com 128GB de armazenamento', 1200.00, 50),
('Notebook ABC', 'Notebook com 16GB RAM e 512GB SSD', 3500.00, 30),
('Tablet DEF', 'Tablet com tela de 10 polegadas', 800.00, 40);

-- Inserindo clientes
INSERT INTO clientes (nome, email, telefone, endereco) VALUES
('João da Silva', 'joao.silva@email.com', '11999999999', 'Rua A, 123'),
('Maria Oliveira', 'maria.oliveira@email.com', '11888888888', 'Rua B, 456'),
('Carlos Pereira', 'carlos.pereira@email.com', '11777777777', 'Rua C, 789');

-- Inserindo pedidos
INSERT INTO pedidos (cliente_id, total, status) VALUES
(1, 2400.00, 'Processando'),
(2, 800.00, 'Enviado'),
(3, 3500.00, 'Entregue');

-- Inserindo itens dos pedidos
INSERT INTO itens_pedido (pedido_id, produto_id, quantidade, preco_unitario) VALUES
(1, 1, 2, 1200.00),
(2, 3, 1, 800.00),
(3, 2, 1, 3500.00);


CREATE DATABASE db_crm_exam;
USE db_crm_exam;
CREATE TABLE clientes (
   cliente_id INT AUTO_INCREMENT PRIMARY KEY,
   nome VARCHAR(100) NOT NULL,
   email VARCHAR(100) UNIQUE NOT NULL,
   telefone VARCHAR(15),
   endereco TEXT,
   data_registro DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE interacoes (
   interacao_id INT AUTO_INCREMENT PRIMARY KEY,
   cliente_id INT NOT NULL,
   tipo VARCHAR(50),
   data_interacao DATETIME DEFAULT CURRENT_TIMESTAMP,
   detalhes TEXT,
   FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id)
);

CREATE TABLE campanhas (
   campanha_id INT AUTO_INCREMENT PRIMARY KEY,
   nome VARCHAR(100) NOT NULL,
   descricao TEXT,
   data_inicio DATE,
   data_fim DATE
);

CREATE TABLE participacoes_campanha (
   participacao_id INT AUTO_INCREMENT PRIMARY KEY,
   cliente_id INT NOT NULL,
   campanha_id INT NOT NULL,
   data_participacao DATETIME DEFAULT CURRENT_TIMESTAMP,
   FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id),
   FOREIGN KEY (campanha_id) REFERENCES campanhas(campanha_id)
);

-- Inserindo clientes
INSERT INTO clientes (nome, email, telefone, endereco) VALUES
('Lucas Andrade', 'lucas.andrade@email.com', '11555555555', 'Avenida D, 1001'),
('Fernanda Costa', 'fernanda.costa@email.com', '11666666666', 'Rua E, 202'),
('Renata Souza', 'renata.souza@email.com', '11777777777', 'Rua F, 303');

-- Inserindo interações
INSERT INTO interacoes (cliente_id, tipo, detalhes) VALUES
(1, 'Telefone', 'Ligação para esclarecimento sobre produto'),
(2, 'Email', 'Enviado e-mail promocional da campanha de verão'),
(3, 'Chat', 'Suporte técnico solicitado via chat online');

-- Inserindo campanhas
INSERT INTO campanhas (nome, descricao, data_inicio, data_fim) VALUES
('Campanha Verão 2024', 'Descontos especiais para produtos de verão', '2024-01-01', '2024-03-31'),
('Campanha Black Friday', 'Ofertas de Black Friday 2024', '2024-11-25', '2024-11-30');

-- Inserindo participações em campanhas
INSERT INTO participacoes_campanha (cliente_id, campanha_id) VALUES
(1, 1),
(2, 2),
(3, 1);


CREATE DATABASE db_financas_exam;
USE db_financas_exam;

CREATE TABLE contas (
   conta_id INT AUTO_INCREMENT PRIMARY KEY,
   nome VARCHAR(100) NOT NULL,
   tipo VARCHAR(50),
   saldo DECIMAL(15, 2) DEFAULT 0.00,
   data_criacao DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE transacoes (
   transacao_id INT AUTO_INCREMENT PRIMARY KEY,
   conta_id INT NOT NULL,
   tipo VARCHAR(50),
   valor DECIMAL(15, 2) NOT NULL,
   data_transacao DATETIME DEFAULT CURRENT_TIMESTAMP,
   descricao TEXT,
   FOREIGN KEY (conta_id) REFERENCES contas(conta_id)
);

CREATE TABLE orcamentos (
   orcamento_id INT AUTO_INCREMENT PRIMARY KEY,
   categoria VARCHAR(100),
   valor_planejado DECIMAL(15, 2) NOT NULL,
   data_inicio DATE,
   data_fim DATE
);

-- Inserindo contas
INSERT INTO contas (nome, tipo, saldo) VALUES
('Conta Corrente', 'Conta Corrente', 5000.00),
('Poupança', 'Conta Poupança', 12000.00),
('Investimentos', 'Conta Investimento', 20000.00);

-- Inserindo transações
INSERT INTO transacoes (conta_id, tipo, valor, descricao) VALUES
(1, 'Débito', 1000.00, 'Pagamento de aluguel'),
(2, 'Crédito', 1500.00, 'Depósito mensal'),
(3, 'Crédito', 5000.00, 'Rendimento de investimentos');

-- Inserindo orçamentos
INSERT INTO orcamentos (categoria, valor_planejado, data_inicio, data_fim) VALUES
('Alimentação', 2000.00, '2024-01-01', '2024-01-31'),
('Transporte', 800.00, '2024-01-01', '2024-01-31'),
('Lazer', 1000.00, '2024-01-01', '2024-01-31');


CREATE DATABASE db_prontuario_exam;
USE db_prontuario_exam;

CREATE TABLE pacientes (
   paciente_id INT AUTO_INCREMENT PRIMARY KEY,
   nome VARCHAR(100) NOT NULL,
   data_nascimento DATE,
   sexo VARCHAR(10),
   telefone VARCHAR(15),
   endereco TEXT,
   data_registro DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE prontuarios (
   prontuario_id INT AUTO_INCREMENT PRIMARY KEY,
   paciente_id INT NOT NULL,
   data_consulta DATETIME DEFAULT CURRENT_TIMESTAMP,
   medico VARCHAR(100),
   diagnostico TEXT,
   prescricao TEXT,
   observacoes TEXT,
   FOREIGN KEY (paciente_id) REFERENCES pacientes(paciente_id)
);

CREATE TABLE consultas (
   consulta_id INT AUTO_INCREMENT PRIMARY KEY,
   paciente_id INT NOT NULL,
   medico VARCHAR(100),
   data_consulta DATETIME DEFAULT CURRENT_TIMESTAMP,
   motivo TEXT,
   FOREIGN KEY (paciente_id) REFERENCES pacientes(paciente_id)
);

-- Inserindo pacientes
INSERT INTO pacientes (nome, data_nascimento, sexo, telefone, endereco) VALUES
('Ana Lima', '1985-04-23', 'Feminino', '11911111111', 'Rua G, 101'),
('Bruno Souza', '1978-11-10', 'Masculino', '11822222222', 'Rua H, 202'),
('Carla Mendes', '1990-08-30', 'Feminino', '11733333333', 'Rua I, 303');

-- Inserindo prontuários
INSERT INTO prontuarios (paciente_id, medico, diagnostico, prescricao, observacoes) VALUES
(1, 'Dr. Silva', 'Gripe', 'Antitérmicos e repouso', 'Paciente deve retornar em 7 dias'),
(2, 'Dra. Pereira', 'Hipertensão', 'Controle da pressão e mudança de dieta', 'Acompanhamento mensal necessário'),
(3, 'Dr. Santos', 'Enxaqueca', 'Analgésicos e redução de estresse', 'Recomendado exame neurológico');

-- Inserindo consultas
INSERT INTO consultas (paciente_id, medico, motivo) VALUES
(1, 'Dr. Silva', 'Consulta de retorno após tratamento de gripe'),
(2, 'Dra. Pereira', 'Primeira consulta de acompanhamento da hipertensão'),
(3, 'Dr. Santos', 'Consulta inicial para avaliação de enxaqueca crônica');


CREATE DATABASE db_logistica_exam;
USE db_logistica_exam;

CREATE TABLE fornecedores (
   fornecedor_id INT AUTO_INCREMENT PRIMARY KEY,
   nome VARCHAR(100) NOT NULL,
   contato VARCHAR(100),
   telefone VARCHAR(15),
   endereco TEXT
);

CREATE TABLE produtos (
   produto_id INT AUTO_INCREMENT PRIMARY KEY,
   nome VARCHAR(100) NOT NULL,
   descricao TEXT,
   preco DECIMAL(10, 2) NOT NULL,
   fornecedor_id INT,
   estoque INT NOT NULL,
   FOREIGN KEY (fornecedor_id) REFERENCES fornecedores(fornecedor_id)
);

CREATE TABLE armazens (
   armazem_id INT AUTO_INCREMENT PRIMARY KEY,
   nome VARCHAR(100) NOT NULL,
   localizacao VARCHAR(100)
);

CREATE TABLE movimentacao_estoque (
   movimentacao_id INT AUTO_INCREMENT PRIMARY KEY,
   produto_id INT NOT NULL,
   armazem_id INT NOT NULL,
   quantidade INT NOT NULL,
   tipo_movimentacao VARCHAR(50),
   data_movimentacao DATETIME DEFAULT CURRENT_TIMESTAMP,
   FOREIGN KEY (produto_id) REFERENCES produtos(produto_id),
   FOREIGN KEY (armazem_id) REFERENCES armazens(armazem_id)
);

CREATE TABLE entregas (
   entrega_id INT AUTO_INCREMENT PRIMARY KEY,
   produto_id INT NOT NULL,
   quantidade INT NOT NULL,
   endereco_entrega TEXT,
   data_entrega DATETIME,
   status VARCHAR(50),
   FOREIGN KEY (produto_id) REFERENCES produtos(produto_id)
);

-- Inserindo fornecedores
INSERT INTO fornecedores (nome, contato, telefone, endereco) VALUES
('Fornecedor A', 'Carlos Lima', '11444444444', 'Av. J, 1000'),
('Fornecedor B', 'Mariana Costa', '11333333333', 'Rua K, 500'),
('Fornecedor C', 'Renato Santos', '11222222222', 'Rua L, 300');

-- Inserindo produtos
INSERT INTO produtos (nome, descricao, preco, fornecedor_id, estoque) VALUES
('Produto X', 'Descrição do produto X', 100.00, 1, 100),
('Produto Y', 'Descrição do produto Y', 200.00, 2, 50),
('Produto Z', 'Descrição do produto Z', 150.00, 3, 75);

-- Inserindo armazéns
INSERT INTO armazens (nome, localizacao) VALUES
('Armazém Central', 'Centro'),
('Armazém Norte', 'Zona Norte'),
('Armazém Sul', 'Zona Sul');

-- Inserindo movimentações de estoque
INSERT INTO movimentacao_estoque (produto_id, armazem_id, quantidade, tipo_movimentacao) VALUES
(1, 1, 50, 'Entrada'),
(2, 2, 30, 'Saída'),
(3, 3, 20, 'Entrada');

-- Inserindo entregas
INSERT INTO entregas (produto_id, quantidade, endereco_entrega, data_entrega, status) VALUES
(1, 10, 'Rua M, 120', '2024-09-15', 'Enviado'),
(2, 5, 'Rua N, 220', '2024-09-16', 'Entregue'),
(3, 15, 'Rua O, 320', '2024-09-17', 'Pendente');

USE db_ecommerce_exam;
USE db_financas_exam;
USE db_crm_exam;
USE db_prontuario_exam;
 
/*
SELECT ip.item_pedido_id, ip.pedido_id, p.nome AS produto_nome, ip.quantidade, ip.preco_unitario
FROM itens_pedido ip
INNER JOIN produtos p
ON ip.produto_id = p.produto_id;
*/

/*
SELECT pedidos.pedido_id, pedidos.data_pedido, pedidos.total, clientes.nome AS cliente_nome,clientes.email AS cliente_email
FROM 
    pedidos
INNER JOIN 
    clientes ON pedidos.cliente_id = clientes.cliente_id;
*/

/*
SELECT 
    clientes.cliente_id,
    clientes.nome AS cliente_nome,
    clientes.email AS cliente_email,
    interacoes.interacao_id,
    interacoes.tipo AS interacao_tipo,
    interacoes.detalhes AS interacao_detalhes,
    interacoes.data_interacao
FROM 
    clientes
LEFT JOIN 
    interacoes ON clientes.cliente_id = interacoes.cliente_id;
*/

/*
SELECT 
    t.transacao_id,
    t.conta_id,
    t.tipo AS tipo_transacao,
    t.valor,
    t.data_transacao,
    t.descricao,
    o.categoria AS categoria_orcamento
FROM 
    transacoes t
LEFT JOIN 
    orcamentos o ON t.conta_id = o.orcamento_id;
*/

/*
SELECT 
    c.nome AS cliente_nome,
    c.email AS cliente_email,
    ca.nome AS campanha_nome,
    ca.descricao AS campanha_descricao,
    pc.data_participacao
FROM 
    participacoes_campanha pc
INNER JOIN 
    clientes c ON pc.cliente_id = c.cliente_id
INNER JOIN 
    campanhas ca ON pc.campanha_id = ca.campanha_id;
*/

/*
SELECT 
    p.paciente_id,
    p.nome AS paciente_nome,
    p.data_nascimento,
    p.sexo,
    p.telefone,
    p.endereco,
    pr.prontuario_id,
    pr.data_consulta,
    pr.medico,
    pr.diagnostico,
    pr.prescricao,
    pr.observacoes
FROM 
    pacientes p
LEFT JOIN 
    prontuarios pr ON p.paciente_id = pr.paciente_id;
*/

SELECT 
    p.pedido_id,
    c.nome AS cliente_nome,
    p.total AS total_pedido,
    i.quantidade,
    pr.nome AS produto_nome,
    i.preco_unitario
FROM 
    pedidos p
INNER JOIN 
    clientes c ON p.cliente_id = c.cliente_id
INNER JOIN 
    itens_pedido i ON p.pedido_id = i.pedido_id
INNER JOIN 
    produtos pr ON i.produto_id = pr.produto_id
ORDER BY 
    p.pedido_id;

