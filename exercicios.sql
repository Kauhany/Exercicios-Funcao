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