-- ATIVIDADE 6: CURSOS ONLINE (EAD)

-- Criação do Banco de Dados
CREATE DATABASE db_curso_da_minha_vida;
USE db_curso_da_minha_vida;

-- REQUISITO 1: Criação da tabela tb_categorias (2 atributos adicionais)
CREATE TABLE tb_categorias (
    id BIGINT AUTO_INCREMENT,
    area_tecnologica VARCHAR(50) NOT NULL, -- Atributo extra 1: Ex: Backend, Frontend, Gestão
    nivel VARCHAR(50), -- Atributo extra 2: Ex: Básico, Intermediário, Avançado
    PRIMARY KEY (id)
);

-- REQUISITO 2 e 3: Criação da tabela tb_cursos (4 atributos adicionais + Foreign Key)
-- Nota: O requisito 2 mencionou "relevantes aos produtos da farmácia" por erro de cópia, mas entende-se que é "relevantes aos cursos"
CREATE TABLE tb_cursos (
    id BIGINT AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    valor DECIMAL(6, 2) NOT NULL, -- Atributo extra 1: Valor
    duracao_horas INT, -- Atributo extra 2: Duração em horas
    certificado BOOLEAN, -- Atributo extra 3: Se oferece certificado
    instrutor VARCHAR(100), -- Atributo extra 4: Nome do instrutor
    categoria_id BIGINT, -- Foreign Key
    PRIMARY KEY (id),
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

-- REQUISITO 4: Insira 5 registros na tabela tb_categorias
INSERT INTO tb_categorias (area_tecnologica, nivel) VALUES
("Desenvolvimento Backend", "Avançado"),
("Desenvolvimento Frontend", "Intermediário"),
("Análise de Dados", "Básico"),
("Cloud Computing", "Avançado"),
("Design UX/UI", "Intermediário");

-- REQUISITO 5: Insira 8 registros na tabela tb_cursos
INSERT INTO tb_cursos (nome, valor, duracao_horas, certificado, instrutor, categoria_id) VALUES
("Java Completo", 850.00, 120, TRUE, "Ana Silva", 1),
("SQL e Modelagem", 480.00, 60, TRUE, "Bruno Mendes", 3),
("ReactJS Profissional", 950.00, 80, TRUE, "Carlos Rocha", 2),
("DevOps com Azure", 1200.00, 150, TRUE, "Diana Farias", 4),
("JavaScript Essencial", 620.00, 40, TRUE, "Fábio Lima", 2),
("Python para Dados", 700.00, 90, TRUE, "Eva Castro", 3),
("Docker e Kubernetes", 1100.00, 75, TRUE, "Diana Farias", 4),
("Spring Boot Expert", 899.90, 100, TRUE, "Ana Silva", 1);

-- REQUISITO 6: SELECT que retorne todes os cursos cujo valor seja maior do que R$ 500,00
SELECT * FROM tb_cursos WHERE valor > 500.00;

-- REQUISITO 7: SELECT que retorne todes os cursos cujo valor esteja no intervalo R$ 600,00 e R$ 1000,00
SELECT * FROM tb_cursos WHERE valor BETWEEN 600.00 AND 1000.00;

-- REQUISITO 8: SELECT utilizando o operador LIKE, buscando todes os cursos que possuam a letra J no atributo nome
SELECT * FROM tb_cursos WHERE nome LIKE "%J%";

-- REQUISITO 9: SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_cursos com os dados da tabela tb_categorias
SELECT 
    c.nome AS Nome_Curso, 
    c.valor, 
    c.duracao_horas,
    cat.area_tecnologica AS Área, 
    cat.nivel AS Nível
FROM tb_cursos c 
INNER JOIN tb_categorias cat ON c.categoria_id = cat.id;

-- REQUISITO 10: SELECT utilizando INNER JOIN para trazer apenas os produtos que pertençam a uma categoria específica (Exemplo: Java - usando "Desenvolvimento Backend")
SELECT 
    c.nome AS Nome_Curso, 
    c.valor
FROM tb_cursos c 
INNER JOIN tb_categorias cat ON c.categoria_id = cat.id
WHERE cat.area_tecnologica = "Desenvolvimento Backend";