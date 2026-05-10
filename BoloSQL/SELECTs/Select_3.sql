DROP DATABASE if EXISTS Bolo;
CREATE DATABASE Bolo;
USE Bolo;

CREATE TABLE Bolo (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    quantidade INT NOT NULL
    categoria VARCHAR(50) NOT NULL
);

INSERT INTO Bolo
(nome, preco, quantidade, categoria) 
VALUES
('Bolo de Chocolate', 49.99, 10, 'Clássico'),
('Bolo de Cenoura', 39.99, 15, 'Clássico'),
('Bolo de Morango', 44.99, 12,'Especial'),
('Bolo de Limão', 34.99, 20, 'Refrescante'),
('Bolo de 4 Leites', 65.00, 7, 'Especial');

-- Consulta para verificar os dados inseridos
SELECT nome, preco, categoria FROM Bolo
CASE 
    WHEN preco <= 35 THEN 'Barato'
    WHEN preco = 36 AND preco <=50 THEN 'Médio'
    ELSE 'Caro'
END AS preco
FROM Bolo;