CREATE DATABASE funcao;

USE funcao;

DROP TABLE nomes;

-- Exercicio 1 A

CREATE TABLE nomes (
    nome VARCHAR(50)
);

INSERT INTO nomes (nome) 
VALUES ('Roberta'),
('Roberto'),
('Maria Clara'),
('João');


-- Exercicio 1 B

SELECT UPPER(nome) AS nome
FROM nomes;


-- Exercicio 1 C

SELECT nome, LENGTH(nome) AS tamanhoNome
FROM nomes;



-- Exercicio 1 D

SELECT
    CASE
        WHEN nome IN ('João', 'Roberto') THEN CONCAT('Sr. ', nome)
        ELSE CONCAT('Sra. ', nome)
    END AS nome
FROM nomes;



-- Exercicio 2 A

CREATE TABLE produtos (
    produto VARCHAR(255),
    preco DECIMAL(10, 3),
    quantidade INT
);

INSERT INTO produtos (produto, preco, quantidade)
VALUES
    ('Produto 1', 19.99, 50),
    ('Produto 2', 9.49, 30),
    ('Produto 3', 49.95, 20),
    ('Produto 4', 15, 15),
    ('Produto 5', 29.99, 40);
    


    
-- Exercicio 2 B

SELECT ROUND(preco, 2) AS preco
FROM produtos;



-- Exercicio 2 C

SELECT produto, preco, ABS(quantidade) as qtdAbsoluta
FROM produtos;