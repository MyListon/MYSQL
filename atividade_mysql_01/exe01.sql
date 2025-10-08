-- 1. Crie um banco de dados para um serviço de RH
CREATE DATABASE db_rh;

USE db_rh;

-- 2. Crie uma tabela de colaboradores com 5 atributos relevantes
CREATE TABLE tb_colaboradores (
	id bigint AUTO_INCREMENT,
    nome varchar(255) NOT NULL,
    cargo varchar(100) NOT NULL,
    salario decimal (10, 2) NOT NULL,
    data_admissao DATE,
    departamento varchar(100),
    PRIMARY KEY (id)
);

-- 3. Insira nesta tabela no mínimo 5 (registros)
INSERT INTO tb_colaboradores(nome, cargo, salario, data_admissao, departamento) 
VALUES("Ana Silva", "Analista de RH Sênior", 3500.00, "2020-05-15", "Recursos Humanos");

INSERT INTO tb_colaboradores(nome, cargo, salario, data_admissao, departamento)
VALUES('Bruno Costa', 'Desenvolvedor Júnior', 1800.00, '2023-01-20', 'Tecnologia');

INSERT INTO tb_colaboradores (nome, cargo, salario, data_admissao, departamento)
VALUES('Carla Souza', 'Gerente de Vendas', 7000.00, '2018-11-10', 'Vendas');

INSERT INTO tb_colaboradores (nome, cargo, salario, data_admissao, departamento)
VALUES('Daniel Farias', 'Estagiário', 1500.00, '2024-03-01', 'Marketing');

INSERT INTO tb_colaboradores (nome, cargo, salario, data_admissao, departamento)
VALUES('Elisa Santos', 'Analista Financeiro', 2200.00, '2022-08-25', 'Financeiro');

-- 4. Faça um SELECT que retorne todos os colaboradores com o salário maior do que 2000
SELECT * FROM tb_colaboradores WHERE salario > 2000.00;

-- 5. Faça um SELECT que retorne todos os colaboradores com o salário menor do que 2000
SELECT * FROM tb_colaboradores WHERE salario < 2000.00;

-- 6. Ao término, atualize um registro desta tabela através de uma query de atualizaçãoptimize
UPDATE tb_colaboradores SET salario = 2400.00, cargo = "Analista Júnior" WHERE id = 5;

-- Opcional: Visualiza a tabela atualizada
SELECT * FROM tb_colaboradores;
       
       