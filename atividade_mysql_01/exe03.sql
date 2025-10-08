-- 1. Crie um banco de dados para um registro de uma escola
CREATE database db_escola;

USE db_escola;

-- 2. Crie uma tabela estudantes e determine 5 atributos relevantes
CREATE TABLE tb_estudantes (
    id BIGINT AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    idade INT,
    turma VARCHAR(50) NOT NULL,
    nota DECIMAL(4, 2) NOT NULL,
    turno VARCHAR(20),
    PRIMARY KEY (id)
);

-- 3. Insira nesta tabela no mínimo 8 dados (registros)
INSERT INTO tb_estudantes (nome, idade, turma, nota, turno) 
VALUES ("Joana Marques", 8, "3A", 8.5, "Manhã");

INSERT INTO tb_estudantes (nome, idade, turma, nota, turno) 
VALUES ("Pedro Almeida", 9, "4B", 6.8, "Tarde");

INSERT INTO tb_estudantes (nome, idade, turma, nota, turno) 
VALUES ("Sofia Ribeiro", 10, "5C", 9.2, "Manhã");

INSERT INTO tb_estudantes (nome, idade, turma, nota, turno) 
VALUES ("Lucas Pereira", 7, "2A", 5.5, "Tarde");

INSERT INTO tb_estudantes (nome, idade, turma, nota, turno) 
VALUES ("Mariana Rocha", 11, "6D", 7.0, "Manhã");

INSERT INTO tb_estudantes (nome, idade, turma, nota, turno) 
VALUES ("Gustavo Lima", 8, "3B", 4.9, "Tarde");

INSERT INTO tb_estudantes (nome, idade, turma, nota, turno) 
VALUES ("Laura Mendes", 10, "5A", 7.5, "Manhã");

INSERT INTO tb_estudantes (nome, idade, turma, nota, turno) 
VALUES ("Felipe Barros", 9, "4C", 6.0, "Tarde");

-- 4. Faça um SELECT que retorne todos os estudantes com a nota maior do que 7.0
SELECT * FROM tb_estudantes WHERE nota > 7.0;

-- 5. Faça um SELECT que retorne todos os estudantes com a nota menor do que 7.0
SELECT * FROM tb_estudantes WHERE nota < 7.0;

-- 6. Ao término, atualize um registro desta tabela através de uma query de atualização
UPDATE tb_estudantes SET nota = 7.1, turma = '4B' WHERE id = 2;

-- Opcional: Visualiza a tabela atualizada
SELECT * FROM tb_estudantes;