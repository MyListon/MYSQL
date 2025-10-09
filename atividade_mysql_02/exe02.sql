-- ATIVIDADE 2: PIZZARIA
-- Criação do Banco de Dados
CREATE DATABASE db_pizzaria_legal;
USE db_pizzaria_legal;

-- REQUISITO 1: Criação da tabela tb_categorias (2 atributos adicionais)
CREATE TABLE tb_categorias (
    id BIGINT AUTO_INCREMENT,
    tipo VARCHAR(50) NOT NULL, -- Atributo extra 1: Ex: Salgada, Doce, Vegetariana
    tamanho_padrao VARCHAR(50), -- Atributo extra 2: Ex: Grande, Média, Broto
    PRIMARY KEY (id)
);

-- REQUISITO 2 e 3: Criação da tabela tb_pizzas (4 atributos adicionais + Foreign Key)
CREATE TABLE tb_pizzas (
    id BIGINT AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    valor DECIMAL(6, 2) NOT NULL, -- Atributo extra 1: Valor
    ingredientes VARCHAR(255), -- Atributo extra 2: Descrição
    massa VARCHAR(50), -- Atributo extra 3: Ex: Fina, Grossa, Recheada
    tempo_preparo_min INT, -- Atributo extra 4: Tempo de preparo em minutos
    categoria_id BIGINT, -- Foreign Key
    PRIMARY KEY (id),
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

-- REQUISITO 4: Insira 5 registros na tabela tb_categorias
INSERT INTO tb_categorias (tipo, tamanho_padrao) VALUES
("Salgada Clássica", "Grande"),
("Salgada Especial", "Grande"),
("Doce", "Broto"),
("Vegetariana", "Média"),
("Calzone", "Individual");

-- REQUISITO 5: Insira 8 registros na tabela tb_pizzas
INSERT INTO tb_pizzas (nome, valor, ingredientes, massa, tempo_preparo_min, categoria_id) VALUES
("Muçarela", 40.00, "Queijo Muçarela, Tomate e Orégano", "Fina", 20, 1),
("Calabresa", 48.00, "Calabresa, Cebola e Muçarela", "Grossa", 25, 1),
("Pepperoni Supreme", 75.00, "Pepperoni duplo e Catupiry", "Recheada", 30, 2),
("Quatro Queijos Premium", 85.00, "Provolone, Parmesão, Gorgonzola e Muçarela", "Fina", 22, 2),
("Romeu e Julieta", 55.00, "Goiabada e Queijo", "Fina", 15, 3),
("Chocolate com Morango", 62.00, "Chocolate ao Leite e Morangos Frescos", "Fina", 18, 3),
("Brócolis com Palmito", 58.00, "Brócolis, Palmito, Muçarela e Alho frito", "Média", 20, 4),
("Frango com Requeijão", 49.90, "Frango desfiado, Requeijão Cremoso", "Grossa", 25, 1);

-- REQUISITO 6: SELECT que retorne todas as pizzas cujo valor seja maior do que R$ 45,00
SELECT * FROM tb_pizzas WHERE valor > 45.00;

-- REQUISITO 7: SELECT que retorne todas as pizzas cujo valor esteja no intervalo R$ 50,00 e R$ 100,00
SELECT * FROM tb_pizzas WHERE valor BETWEEN 50.00 AND 100.00;

-- REQUISITO 8: SELECT utilizando o operador LIKE, buscando todas as pizzas que possuam a letra M no atributo nome
SELECT * FROM tb_pizzas WHERE nome LIKE "%M%";

-- REQUISITO 9: SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_pizzas com os dados da tabela tb_categorias
SELECT 
    p.nome AS Nome_Pizza, 
    p.valor, 
    c.tipo AS Categoria, 
    c.tamanho_padrao AS Tamanho_Padrão
FROM tb_pizzas p 
INNER JOIN tb_categorias c ON p.categoria_id = c.id;

-- REQUISITO 10: SELECT utilizando INNER JOIN para trazer apenas as pizzas que pertençam a uma categoria específica (Exemplo: Doces)
SELECT 
    p.nome AS Nome_Pizza, 
    p.valor
FROM tb_pizzas p 
INNER JOIN tb_categorias c ON p.categoria_id = c.id
WHERE c.tipo = "Doce";