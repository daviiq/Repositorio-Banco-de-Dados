DROP DATABASE if EXISTS Bolo;
CREATE DATABASE Bolo;
USE Bolo;

CREATE TABLE Bolo (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    quantidade INT NOT NULL
);

INSERT INTO Bolo
(nome, preco, quantidade) 
VALUES
('Bolo de Chocolate', 49.99, 10),
('Bolo de Cenoura', 39.99, 15),
('Bolo de Morango', 44.99, 12),
('Bolo de Limão', 34.99, 20),
('Bolo de 4 Leites', 65.00, 7),
('Bolo de Nozes', -50.00, 5), -- Valor negativo para testar restrição de preço
('Bolo de Frutas', 29.99, -3); -- Quantidade negativa para testar restrição de quantidade

-- Consulta para verificar os dados inseridos

SELECT nome, quantidade FROM Bolo
CASE 
    WHEN quantidade = 0 THEN 'Sem estoque'
    WHEN quantidade < 5 THEN 'Baixo estoque'  
    WHEN quantidade >= 5 AND quantidade <= 15 THEN 'Estoque médio'
    ELSE 'Estoque alto'
END AS quantidade
FROM Bolo;