-- ATIVIDADE 5: MATERIAL DE CONSTRUÇÃO

-- Criação do Banco de Dados
CREATE DATABASE db_construindo_vidas;
USE db_construindo_vidas;

-- REQUISITO 1: Criação da tabela tb_categorias (2 atributos adicionais)
CREATE TABLE tb_categorias (
    id BIGINT AUTO_INCREMENT,
    setor VARCHAR(50) NOT NULL, -- Atributo extra 1: Ex: Hidráulica, Elétrica, Acabamento
    unidade_medida VARCHAR(50), -- Atributo extra 2: Ex: Unidade, Metro, Kg
    PRIMARY KEY (id)
);

-- REQUISITO 2 e 3: Criação da tabela tb_produtos (4 atributos adicionais + Foreign Key)
CREATE TABLE tb_produtos (
    id BIGINT AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    valor DECIMAL(6, 2) NOT NULL, -- Atributo extra 1: Valor
    marca VARCHAR(100), -- Atributo extra 2: Marca
    material VARCHAR(50), -- Atributo extra 3: Material predominante
    disponivel_estoque BOOLEAN, -- Atributo extra 4: Status de estoque
    categoria_id BIGINT, -- Foreign Key
    PRIMARY KEY (id),
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

-- REQUISITO 4: Insira 5 registros na tabela tb_categorias
INSERT INTO tb_categorias (setor, unidade_medida) VALUES
("Hidráulica", "Unidade"),
("Elétrica", "Metro"),
("Acabamento", "Caixa"),
("Ferramentas", "Unidade"),
("Cimento e Argamassa", "Saco");

-- REQUISITO 5: Insira 8 registros na tabela tb_produtos
INSERT INTO tb_produtos (nome, valor, marca, material, disponivel_estoque, categoria_id) VALUES
("Tubo PVC 100mm", 85.00, "PlastMax", "PVC", TRUE, 1),
("Fio Flexível 4mm", 120.00, "EletricSeg", "Cobre", TRUE, 2),
("Piso Porcelanato A", 150.00, "RevesteTop", "Cerâmica", TRUE, 3),
("Argamassa ACIII", 35.00, "Fortfix", "Cimento", TRUE, 5),
("Torneira Simples", 65.00, "AquaFlow", "Metal", TRUE, 1),
("Disjuntor Bipolar", 40.00, "EletricSeg", "Plástico", TRUE, 2),
("Trena 5 Metros", 75.00, "ToolPro", "Aço", TRUE, 4),
("Cimento Estrutural", 45.00, "Fortfix", "Cimento", TRUE, 5);

-- REQUISITO 6: SELECT que retorne todes os produtos cujo valor seja maior do que R$ 100,00
SELECT * FROM tb_produtos WHERE valor > 100.00;

-- REQUISITO 7: SELECT que retorne todes os produtos cujo valor esteja no intervalo R$ 70,00 e R$ 150,00
SELECT * FROM tb_produtos WHERE valor BETWEEN 70.00 AND 150.00;

-- REQUISITO 8: SELECT utilizando o operador LIKE, buscando todes os produtos que possuam a letra C no atributo nome
SELECT * FROM tb_produtos WHERE nome LIKE "%C%";

-- REQUISITO 9: SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_produtos com os dados da tabela tb_categorias
SELECT 
    p.nome AS Produto, 
    p.valor, 
    c.setor AS Setor, 
    c.unidade_medida AS Unidade_de_Medida
FROM tb_produtos p 
INNER JOIN tb_categorias c ON p.categoria_id = c.id;

-- REQUISITO 10: SELECT utilizando INNER JOIN para trazer apenas os produtos que pertençam a uma categoria específica (Exemplo: Hidráulica)
SELECT 
    p.nome AS Produto, 
    p.valor
FROM tb_produtos p 
INNER JOIN tb_categorias c ON p.categoria_id = c.id
WHERE c.setor = "Hidráulica";