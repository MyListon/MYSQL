-- 1. Crie um banco de dados para um e-commerce
CREATE database db_ecommerce;

USE db_ecommerce;

-- 2. Crie uma tabela de produtos e determine 5 atributos relevantes
CREATE table tb_produtos(
	id bigint auto_increment,
    nome varchar(255) NOT NULL,
    marca varchar(100) NOT NULL,
    valor decimal(10, 2) NOT NULL,
    estoque int,
    categoria varchar(100),
    PRIMARY KEY (id)
);

-- 3. Insira nesta tabela no mínimo 8 dados (registros)
INSERT INTO tb_produtos(nome, marca, valor, estoque, categoria)
VALUES ("Smartphone X", "TechCorp", 1200.00, 50, "Eletrônicos");

INSERT INTO tb_produtos(nome, marca, valor, estoque, categoria)
VALUES ("Notbook Ultra", "InnoPC", 3500.00, 15, "Eletrônicos");

INSERT INTO tb_produtos(nome, marca, valor, estoque, categoria)
VALUES ("Camiseta Básica", "ModaDia", 49.90, 200, "Vestuário");

INSERT INTO tb_produtos(nome, marca, valor, estoque, categoria)
VALUES ("Tênis Esportivo", "RunFast", 550.00, 80, "Calçados");

INSERT INTO tb_produtos(nome, marca, valor, estoque, categoria)
VALUES ("Fones de Ouvido Bluetooth", "SoundMax", 180.00, 150, "Eletrônicos");

INSERT INTO tb_produtos(nome, marca, valor, estoque, categoria)
VALUES ("Sofá 3 Lugares", "CasaConforto", 999.99, 5, "Móveis");

INSERT INTO tb_produtos(nome, marca, valor, estoque, categoria)
VALUES ("Livro: A JOrnada", "Editora Saber", 35.75, 300, "Livros");

INSERT INTO tb_produtos(nome, marca, valor, estoque, categoria)
VALUES ("Mochila Reforçada", "Explorer", 150.00, 120, "Acessórios");

-- 4. Faça um SELECT que retorne todos os produtos com o valor maior do que 500
SELECT * FROM tb_produtos WHERE valor > 500.00;

-- 5. Faça um SELECT que retorne todes os produtos com o valor menor do que 500
SELECT * FROM tb_produtos WHERE valor < 500.00;

-- 6. Ao término, atualize um registro desta tabela através de uma query de atualização
UPDATE tb_produtos SET valor = 499.99, estoque = 90 WHERE id = 4;

-- Opcional: Visualiza a tabela atualizada
SELECT * FROM tb_produtos;

