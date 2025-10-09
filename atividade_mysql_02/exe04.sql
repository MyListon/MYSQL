-- ATIVIDADE 4: AÇOUGUE/HORTIFRUTI (Escolha: Açougue - db_cidade_das_carnes)

-- Criação do Banco de Dados
CREATE DATABASE db_cidade_das_carnes;
USE db_cidade_das_carnes;

-- REQUISITO 1: Criação da tabela tb_categorias (2 atributos adicionais)
CREATE TABLE tb_categorias (
    id BIGINT AUTO_INCREMENT,
    tipo_corte VARCHAR(50) NOT NULL, -- Atributo extra 1: Ex: Bovina, Suína, Aves
    conservacao VARCHAR(50), -- Atributo extra 2: Ex: Congelado, Resfriado
    PRIMARY KEY (id)
);

-- REQUISITO 2 e 3: Criação da tabela tb_produtos (4 atributos adicionais + Foreign Key)
CREATE TABLE tb_produtos (
    id BIGINT AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    valor DECIMAL(6, 2) NOT NULL, -- Atributo extra 1: Valor (por kg)
    peso_medio_kg DECIMAL(5, 2), -- Atributo extra 2: Peso médio da peça
    origem VARCHAR(50), -- Atributo extra 3: Ex: Nacional, Importado
    data_validade DATE, -- Atributo extra 4: Data de validade
    categoria_id BIGINT, -- Foreign Key
    PRIMARY KEY (id),
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

-- REQUISITO 4: Insira 5 registros na tabela tb_categorias
INSERT INTO tb_categorias (tipo_corte, conservacao) VALUES
("Bovina Prime", "Resfriado"),
("Bovina Padrão", "Resfriado"),
("Suína", "Congelado"),
("Aves", "Resfriado"),
("Embutidos", "Resfriado");

-- REQUISITO 5: Insira 8 registros na tabela tb_produtos (Valores por Kg)
INSERT INTO tb_produtos (nome, valor, peso_medio_kg, origem, data_validade, categoria_id) VALUES
("Picanha Angus", 120.00, 1.20, "Nacional", '2025-10-15', 1),
("Filé Mignon", 95.50, 1.80, "Nacional", '2025-10-14', 1),
("Acém", 45.00, 3.00, "Nacional", '2025-10-12', 2),
("Costelinha Suína", 65.90, 1.50, "Nacional", '2026-03-20', 3),
("Coxa e Sobrecoxa", 35.00, 2.00, "Nacional", '2025-10-10', 4),
("Salsicha Hot Dog", 28.00, 1.00, "Nacional", '2025-11-01', 5),
("Linguiça Calabresa", 55.00, 0.50, "Nacional", '2025-10-25', 5),
("Contra Filé", 78.50, 2.50, "Nacional", '2025-10-13', 2);

-- REQUISITO 6: SELECT que retorne todes os produtos cujo valor seja maior do que R$ 50,00
SELECT * FROM tb_produtos WHERE valor > 50.00;

-- REQUISITO 7: SELECT que retorne todes os produtos cujo valor esteja no intervalo R$ 50,00 e R$ 150,00
SELECT * FROM tb_produtos WHERE valor BETWEEN 50.00 AND 150.00;

-- REQUISITO 8: SELECT utilizando o operador LIKE, buscando todes os produtos que possuam a letra C no atributo nome
SELECT * FROM tb_produtos WHERE nome LIKE "%C%";

-- REQUISITO 9: SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_produtos com os dados da tabela tb_categorias
SELECT 
    p.nome AS Produto, 
    p.valor AS Valor_por_Kg, 
    c.tipo_corte AS Tipo, 
    c.conservacao AS Conservação
FROM tb_produtos p 
INNER JOIN tb_categorias c ON p.categoria_id = c.id;

-- REQUISITO 10: SELECT utilizando INNER JOIN para trazer apenas os produtos que pertençam a uma categoria específica (Exemplo: Aves)
SELECT 
    p.nome AS Produto, 
    p.valor AS Valor_por_Kg
FROM tb_produtos p 
INNER JOIN tb_categorias c ON p.categoria_id = c.id
WHERE c.tipo_corte = "Aves";