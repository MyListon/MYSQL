-- ATIVIDADE 3: FARMÁCIA

-- Criação do Banco de Dados
CREATE DATABASE db_farmacia_bem_estar;
USE db_farmacia_bem_estar;

-- REQUISITO 1: Criação da tabela tb_categorias (2 atributos adicionais)
CREATE TABLE tb_categorias (
    id BIGINT AUTO_INCREMENT,
    setor VARCHAR(50) NOT NULL, -- Atributo extra 1: Ex: Medicamento, Cosmético, Higiene
    receita_obrigatoria BOOLEAN, -- Atributo extra 2: Se o produto precisa de receita
    PRIMARY KEY (id)
);

-- REQUISITO 2 e 3: Criação da tabela tb_produtos (4 atributos adicionais + Foreign Key)
CREATE TABLE tb_produtos (
    id BIGINT AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    valor DECIMAL(6, 2) NOT NULL, -- Atributo extra 1: Valor
    fabricante VARCHAR(100), -- Atributo extra 2: Fabricante do produto
    quantidade_estoque INT, -- Atributo extra 3: Quantidade em estoque
    uso VARCHAR(50), -- Atributo extra 4: Ex: Oral, Tópico
    categoria_id BIGINT, -- Foreign Key
    PRIMARY KEY (id),
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

-- REQUISITO 4: Insira 5 registros na tabela tb_categorias
INSERT INTO tb_categorias (setor, receita_obrigatoria) VALUES
("Medicamentos Tarjados", TRUE),
("Medicamentos Livres", FALSE),
("Cosméticos", FALSE),
("Higiene Pessoal", FALSE),
("Suplementos", FALSE);

-- REQUISITO 5: Insira 8 registros na tabela tb_produtos
INSERT INTO tb_produtos (nome, valor, fabricante, quantidade_estoque, uso, categoria_id) VALUES
("Protetor Solar FPS 50", 75.50, "SunCare", 200, "Tópico", 3),
("Shampoo Hidratante", 25.90, "HairLux", 350, "Tópico", 4),
("Dipirona 500mg", 12.00, "Genérico Labs", 800, "Oral", 2),
("Amoxicilina 500mg", 45.00, "Pharma Forte", 150, "Oral", 1),
("Vitamina C Efervescente", 38.99, "Nutri Mais", 400, "Oral", 5),
("Creme Anti-idade", 95.00, "BeautySkin", 90, "Tópico", 3),
("Escova Dental", 9.99, "CleanBrush", 600, "Oral", 4),
("Ibuprofeno 400mg", 55.50, "DorFree", 250, "Oral", 2);

-- REQUISITO 6: SELECT que retorne todes os produtos cujo valor seja maior do que R$ 50,00
SELECT * FROM tb_produtos WHERE valor > 50.00;

-- REQUISITO 7: SELECT que retorne todes os produtos cujo valor esteja no intervalo R$ 5,00 e R$ 60,00
SELECT * FROM tb_produtos WHERE valor BETWEEN 5.00 AND 60.00;

-- REQUISITO 8: SELECT utilizando o operador LIKE, buscando todes os produtos que possuam a letra C no atributo nome
SELECT * FROM tb_produtos WHERE nome LIKE "%C%";

-- REQUISITO 9: SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_produtos com os dados da tabela tb_categorias
SELECT 
    p.nome AS Nome_Produto, 
    p.valor, 
    c.setor AS Categoria, 
    c.receita_obrigatoria AS Receita
FROM tb_produtos p 
INNER JOIN tb_categorias c ON p.categoria_id = c.id;

-- REQUISITO 10: SELECT utilizando INNER JOIN para trazer apenas os produtos que pertençam a uma categoria específica (Exemplo: Cosméticos)
SELECT 
    p.nome AS Nome_Produto, 
    p.valor
FROM tb_produtos p 
INNER JOIN tb_categorias c ON p.categoria_id = c.id
WHERE c.setor = "Cosméticos";