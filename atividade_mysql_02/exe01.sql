-- ATIVIDADE 2: GAME ONLINE
-- REQUISITO 1: Criação do Banco de Dados
CREATE database db_genaration_game_online;
-- Garante que você está usando o banco de dados correto para criar as tabelas
USE db_genaration_game_online;

-- REQUISITO 1 (Cont.): Criação da tabela tb_classes:
-- Crie a tabela tb_classes e determine pelo menos 2 atributos, além da Chave Primária
CREATE TABLE tb_classes(
	id bigint auto_increment,
    nome_classe varchar(50) NOT NULL, 
    descricao varchar(255), -- Atributo extra 1: Descrição da classe
    funcao_principal varchar(50), -- Atributo extro 2: Função (Ex: Dano, Tanque, Suporte)
    PRIMARY kEY (id)
);

-- REQUISITOS 2: Criação da tabela tb_personagens
-- Crie a tabela tb_personagens e determine 4 atributos, além da Chave Priméria
-- REQUISITO 3: Criação da Foreign Key da tabela tb_classes em tb_personagens
CREATE TABLE tb_personagens(
	id bigint auto_increment,
    nome varchar(100) NOT NULL,
    poder_ataque int NOT NULL, -- Atributo extra1: Poder de Ataque
    poder_defesa int NOT NULL, -- Atributo extra 2: Poder de Defesa
    vida int, -- Atributo extra 3: Pontos de vida
    velocidade decimal(4, 2), -- Atributo extra 4: Velocidade
    classe_id bigint, -- Chave Estrangeira
    PRIMARY KEY (id),
    FOREIGN KEY (classe_id) REFERENCES tb_classes(id)
);

-- REQUISITO 4: Insira 5 registros na tabela tb_classes 
INSERT INTO tb_classes (nome_classe, descricao, funcao_principal) VALUES
("Guerreiro", "Especialista em combate corpo a corpo e defesa.", "Tanque"),
("Mago", "Utiliza magia elemental para causar dano à distância.", "Dano"),
("Arqueiro", "Ataca à distância com arcos e flechas.", "Dano"),
("Curandeiro", "Focado em restaurar a vida dos aliados.", "Suporte"),
("Assassino", "Especializado em ataques rápidos e furtivos.", "Dano");

-- REQUISITO 5: Insira 8 registros na tabela tb_personagens, preenchendo a Chave Estrangeira 
INSERT INTO tb_personagens (nome, poder_ataque, poder_defesa, vida, velocidade, classe_id) VALUES
("Conan, o Bárbaro", 3500, 2500, 5000, 5.50, 1), -- Guerreiro
("Gandalf, o Cinzento", 2800, 1200, 3000, 4.00, 2), -- Mago
("Legolas, o Elfico", 2100, 1500, 2800, 7.50, 3), -- Arqueiro
("Seraphina, a Luz", 1000, 800, 2500, 6.00, 4), -- Curandeiro
("Zephyr, a Sombra", 4000, 900, 2000, 9.90, 5), -- Assassino
("Brutus, o Rocha", 1800, 3000, 6000, 3.50, 1), -- Guerreiro
("Cygnus, o Bruxo", 2000, 1800, 3200, 4.50, 2), -- Mago
("Clarian, o Caçador", 2200, 1600, 2900, 7.00, 3); -- Arqueiro

-- REQUISITO 6: Faça um SELECT que retorne todes os personagens cujo poder de ataque seja maior do que 2000 [cite: 29]
SELECT * FROM tb_personagens WHERE poder_ataque > 2000;

-- REQUISITO 7: Faça um SELECT que retorne todes os personagens cujo poder de defesa esteja no intervalo 1000 e 2000 [cite: 30]
SELECT * FROM tb_personagens WHERE poder_defesa BETWEEN 1000 AND 2000;

-- REQUISITO 8: Faça um SELECT utilizando o operador LIKE, buscando todes os personagens que possuam a letra C no atributo nome [cite: 31]
SELECT * FROM tb_personagens WHERE nome LIKE "%C%";

-- REQUISITO 9: Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_personagens com os dados da tabela tb_classes [cite: 32]
SELECT 
    p.nome AS Personagem, 
    p.poder_ataque, 
    p.poder_defesa, 
    c.nome_classe AS Classe, 
    c.funcao_principal AS Função
FROM tb_personagens p 
INNER JOIN tb_classes c ON p.classe_id = c.id;

-- REQUISITO 10: Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados onde traga apenas os personagens que pertençam a uma classe específica (Exemplo: Todes os personagens da classe dos arqueiros) [cite: 33]
SELECT 
    p.nome AS Personagem, 
    p.poder_ataque, 
    p.poder_defesa, 
    c.nome_classe AS Classe
FROM tb_personagens p 
INNER JOIN tb_classes c ON p.classe_id = c.id
WHERE c.nome_classe = "Arqueiro"; -- Traz apenas personagens da classe "Arqueiro"

