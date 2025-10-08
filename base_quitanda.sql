-- Apagar Banco de Dados db_quitanda
DROP DATABASE db_quitanda;
 
-- Recriar o Banco de dados db_quitanda
CREATE DATABASE db_quitanda;
 
-- Selecionar o Banco de Dados db_quitanda
USE db_quitanda;
 
-- Criar a tabela tb_categorias
CREATE TABLE tb_categorias(
id bigint AUTO_INCREMENT,
descricao varchar(255) NOT NULL,
PRIMARY KEY (id)
);
 
-- Insere dados na tabela tb_categorias
INSERT INTO tb_categorias (descricao)
VALUES ("Frutas");
 
INSERT INTO tb_categorias (descricao)
VALUES ("Verduras");
 
INSERT INTO tb_categorias (descricao)
VALUES ("Legumes");
 
INSERT INTO tb_categorias (descricao)
VALUES ("Temperos");
 
INSERT INTO tb_categorias (descricao)
VALUES ("Ovos");
 
INSERT INTO tb_categorias (descricao)
VALUES ("outros");
 
-- Lista todos os dados da tabela tb_categorias
SELECT * FROM tb_categorias;
 
-- Criar a Tabela tb_produtos
CREATE TABLE tb_produtos(
id bigint AUTO_INCREMENT,
nome varchar(255) NOT NULL,
quantidade int, 
data_validade date NULL,
preco decimal(6, 2),
categoria_id bigint, 
PRIMARY KEY (id),
FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);
 
-- Insere dados na tabela tb_produtos
INSERT INTO tb_produtos (nome, quantidade, data_validade, preco, categoria_id)
VALUES ("Maçã", 1000, "2022-03-07", 1.99, 1);
 
INSERT INTO tb_produtos (nome, quantidade, data_validade, preco, categoria_id)
VALUES ("Banana", 1300, "2022-03-08", 5.00, 1);
 
INSERT INTO tb_produtos (nome, quantidade, data_validade, preco, categoria_id)
VALUES ("Batata doce", 2000, "2022-03-09", 10.00, 3);
 
INSERT INTO tb_produtos (nome, quantidade, data_validade, preco, categoria_id)
VALUES ("Alface", 300, "2022-03-10", 7.00, 2);
 
INSERT INTO tb_produtos (nome, quantidade, data_validade, preco, categoria_id)
VALUES ("Cebola", 1020, "2022-03-08", 5.00, 3);
 
INSERT INTO tb_produtos(nome, quantidade, data_validade, preco, categoria_id)
VALUES("Ovo Branco", 1000, "2022-03-07", 15.00, 5);
 
INSERT INTO tb_produtos(nome, quantidade, data_validade, preco, categoria_id)
VALUES("Agrião", 1500, "2022-03-06", 3.00, 2);
 
INSERT INTO tb_produtos(nome, quantidade, data_validade, preco, categoria_id)
VALUES("Cenoura", 1800, "2022-03-09", 3.50, 3);
 
INSERT INTO tb_produtos (nome, quantidade, data_validade, preco, categoria_id)
VALUES ("Pimenta", 1100, "2022-03-15", 10.00, 4);
 
INSERT INTO tb_produtos (nome, quantidade, data_validade, preco, categoria_id)
VALUES ("Alecrim", 130, "2022-03-10", 5.00, 4);
 
INSERT INTO tb_produtos (nome, quantidade, data_validade, preco, categoria_id)
VALUES ("Manga", 200, "2022-03-07", 5.49, 1);
 
INSERT INTO tb_produtos (nome, quantidade, data_validade, preco, categoria_id)
VALUES ("Laranja", 3000, "2022-03-13", 10.00, 1);
 
INSERT INTO tb_produtos (nome, quantidade, data_validade, preco, categoria_id)
VALUES ("Couve", 100, "2022-03-12", 1.50, 2);
 
INSERT INTO tb_produtos(nome, quantidade, data_validade, preco, categoria_id)
VALUES("Tomate", 1105, "2022-03-15", 3.00, 3);
 
INSERT INTO tb_produtos(nome, quantidade, data_validade, preco, categoria_id)
VALUES("Rabanete", 1200, "2022-03-15", 13.00, 3);
 
INSERT INTO tb_produtos(nome, quantidade, preco)
VALUES("Sacola Cinza", 1118, 0.50);
 
INSERT INTO tb_produtos(nome, quantidade, preco)
VALUES("Sacola Verde", 1118, 0.50);
 
-- Visualiza todos os dados da tabela tb_produtos
SELECT * FROM tb_produtos;

SELECT * FROM tb_produtos WHERE preco > 5.00 AND categoria_id = 2;

SELECT * FROM tb_produtos WHERE preco < 5.00 OR categoria_id = 2;

SELECT * FROM tb_produtos WHERE NOT categoria_id = 2;

SELECT * FROM tb_produtos ORDER BY nome ASC;

SELECT * FROM tb_produtos ORDER BY nome DESC;

SELECT * FROM tb_produtos ORDER BY nome, data_validade ASC;

SELECT * FROM tb_produtos WHERE preco BETWEEN 5.00 AND 15.00 ORDER BY preco;

SELECT * FROM tb_produtos WHERE preco IN (5.00, 10.00, 15.00) ORDER BY preco;

SELECT * FROM tb_produtos WHERE nome LIKE "%ra%";

SELECT * FROM tb_produtos WHERE nome LIKE "%ra";

SELECT * FROM tb_produtos WHERE nome LIKE "ra%";

SELECT @@character_set_database, @@collation_database;

SELECT * FROM tb_produtos INNER JOIN tb_categorias
ON tb_produtos.categoria_id = tb_categorias.id;

SELECT tb_produtos.id, nome, descricao
FROM tb_produtos INNER JOIN tb_categorias
ON tb_produtos.categoria_id = tb_categorias.id;

SELECT * FROM tb_produtos LEFT JOIN tb_categorias
ON tb_produtos.categorias_id = tb_categorias.id;

SELECT * FROM tb_produtos RIGHT JOIN tb_categorias
ON tb_produtos.categorias_id = tb_categorias.id;

SELECT * FROM tb_produtos INNER JOIN tb_categorias
ON tb_produtos.categoria_id = tb_categorias.id
WHERE tb_produtos.categoria_id = 2;
