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



-- Exercicio 2 D

SELECT AVG(preco) AS mediaPrecos
FROM produtos;



-- Exercicio 3 A

CREATE TABLE eventos (
    data_evento DATETIME
);

INSERT INTO eventos (data_evento)
VALUES
    ('2023-10-15'),
    ('2023-10-20'),
    ('2023-11-05'),
    ('2023-11-12'),
    ('2023-12-02');



-- Exercicio 3 B

INSERT INTO eventos (data_evento) 
VALUES(now());

SELECT * FROM eventos;




-- Exercicio 3 C

SELECT DATEDIFF('2023-10-20', '2023-10-15') AS numero_de_dias;



-- Exercicio 3 D

SELECT data_evento, DAYNAME(data_evento) AS nome_dia_da_semana
FROM eventos;



-- Exercicio 4 A

SELECT produto, preco, quantidade,
    IF(quantidade > 0, 'Em estoque', 'Fora de estoque') AS estoque
FROM produtos;



-- Exercicio 4 B

SELECT produto, preco, quantidade,
    CASE
        WHEN preco < 10.0 THEN 'Barato'
        WHEN preco >= 10.0 AND preco <= 50.0 THEN 'Médio'
        WHEN preco > 50.0 THEN 'Caro'
    END AS categoriaPreco
FROM produtos;



-- Exercicio 5 A

DELIMITER //
CREATE FUNCTION TOTAL_VALOR(preco DECIMAL(10, 2), quantidade INT)
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10, 2);
    SET total = preco * quantidade;
    RETURN total;
END;
//
DELIMITER ;

SELECT produto, preco, quantidade, TOTAL_VALOR(preco, quantidade) AS valorTotal
FROM produtos;



-- Exercicio 6 A

SELECT COUNT(*) AS totalProdutos
FROM produtos;



-- Exercicio 6 B

SELECT produto, preco
FROM produtos
WHERE preco = (SELECT MAX(preco) FROM produtos);



-- Exercicio 6 C

SELECT produto, preco
FROM produtos
WHERE preco = (SELECT MIN(preco) FROM produtos);



-- Exercicio 6 D

SELECT SUM(IF(quantidade > 0, preco * quantidade, 0)) AS somaToal
FROM produtos;



-- Exercicio 7 A

DELIMITER //
CREATE FUNCTION calcularFatorial(n INT)
RETURNS BIGINT
DETERMINISTIC
BEGIN
    DECLARE resultado BIGINT DEFAULT 1;
    DECLARE i INT DEFAULT 1;
    
    WHILE i <= n DO
        SET resultado = resultado * i;
        SET i = i + 1;
    END WHILE;
    
    RETURN resultado;
END;
//
DELIMITER ;

SELECT calcularFatorial(5) AS resultado_fatorial;



-- Exercicio 7 B

DELIMITER //
CREATE FUNCTION calcularExponencial(base DECIMAL(10, 2), expoente DECIMAL(10, 2))
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE resultado DECIMAL(10, 2);
    SET resultado = POWER(base, expoente);
    RETURN resultado;
END;
//
DELIMITER ;

SELECT calcularExponencial(2, 3) AS resultado_exponencial;



-- Exercicio 7 C

DELIMITER //
CREATE FUNCTION verificarPalindromo(palavra VARCHAR(255))
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE inversa VARCHAR(255);
    SET inversa = REVERSE(palavra);
    
    IF palavra = inversa THEN
        RETURN 1;
    ELSE
        RETURN 0;
    END IF;
END;
//
DELIMITER ;

SELECT verificarPalindromo('ana') AS resultado;