DROP DATABASE if EXISTS Bolo;
CREATE DATABASE Bolo;
USE Bolo;

CREATE TABLE Bolo (
    idBolo INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    quantidade INT NOT NULL
    categoria VARCHAR(50) NOT NULL
);

CREATE TABLE Venda (
    idVenda INT PRIMARY KEY AUTO_INCREMENT,
    idBolo INT NOT NULL,
    dataVenda DATE NOT NULL,
    quantidadeVendida INT NOT NULL CHECK (quantidadeVendida > 0),
    FOREIGN KEY (idBolo) REFERENCES Bolo(idBolo)
);


INSERT INTO Bolo
(nome, preco, quantidade, categoria) 
VALUES
('Bolo de Chocolate', 49.99, 10, 'Clássico'),
('Bolo de Cenoura', 39.99, 15, 'Clássico'),
('Bolo de Morango', 44.99, 12,'Especial'),
('Bolo de Limão', 34.99, 20, 'Refrescante'),
('Bolo de 4 Leites', 65.00, 7, 'Especial');

INSERT INTO Venda
(idBolo, dataVenda, quantidadeVendida)
VALUES
(1, '2024-06-01', 2),
(2, '2024-06-01', 3),
(3, '2024-06-01', 1),
(4, '2024-06-01', 5),
(5, '2024-06-01', 2);

UPDATE Bolo
SET quantidade = quantidade - (SELECT SUM(quantidadeVendida) FROM Venda WHERE Venda.idBolo = Bolo.idBolo);
SELECT * FROM Bolo;