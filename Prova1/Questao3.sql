DROP DATABASE IF EXISTS Bolo;
CREATE DATABASE Bolo;
USE Bolo;

-- Primeiro cria a tabela Confeiteiro
CREATE TABLE Confeiteiro (
    idConfeiteiro INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    dataNasc DATE NOT NULL
);

-- Depois cria a tabela Bolo
CREATE TABLE Bolo (
    idBolo INT PRIMARY KEY AUTO_INCREMENT,
    sabor VARCHAR(45) NOT NULL,
    cobertura VARCHAR(45) NOT NULL,
    idConfeiteiro INT NOT NULL,
    FOREIGN KEY (idConfeiteiro)
        REFERENCES Confeiteiro(idConfeiteiro)
);

-- Inserindo confeiteiros
INSERT INTO Confeiteiro
(nome, dataNasc)
VALUES
('Joao', '1990-05-12'),
('Maria', '1985-11-23'),
('Carlos', '1992-07-01');

-- Inserindo bolos
INSERT INTO Bolo
(sabor, cobertura, idConfeiteiro)
VALUES
('Chocolate', 'Morango', 1),
('Baunilha', 'Chocolate', 2),
('Cenoura', 'Chocolate', 3),
('Limão', 'Limão', 2),
('Floresta Negra', 'Chantilly', 1);

-- Atualiza o nome do confeiteiro -- 
UPDATE Confeiteiro
SET nome = 'Carlos Eduardo'
WHERE idConfeiteiro = 3;

--
