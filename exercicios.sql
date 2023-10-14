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