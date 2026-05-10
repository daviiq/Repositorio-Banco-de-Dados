DROP DATABASE IF EXISTS Lab2;
CREATE DATABASE Lab2;
USE Lab2;

CREATE TABLE Assunto (
    idAssunto INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(45) NOT NULL;
);

CREATE TABLE Senha (
    idSenha INT PRIMARY KEY AUTO_INCREMENT,
    dataHoraGerada DATETIME NOT NULL,
    inicioAtendimento DATETIME NOT NULL,
    fimAtendimento DATETIME NOT NULL,
    numeroSenha INT NOT NULL;
    descricao FOREIGN KEY (descricao) REFERENCES Assunto(descricao)
);

INSERT INTO Assunto
(descricao)
 VALUES
('Pagamentos'),
('Cadastro'),
('Cancelamento'),
('Suporte Técnico'),
('Outros');

INSERT INTO Senha
(dataHoraGerada,inicioAtendimento,fimAtendimento,numeroSenha,descricao)
 VALUES
('2024-06-01 08:00:00','2024-06-01 08:05:00','2024-06-01 08:15:00',1,'Pagamentos'),
('2024-06-01 08:10:00','2024-06-01 08:20:00','2024-06-01 08:30:00',2,'Pagamentos'),
('2024-06-01 08:20:00','2024-06-01 08:25:00','2024-06-01 08:35:00',3,'Pagamentos'),
('2024-06-01 08:30:00','2024-06-01 08:40:00','2024-06-01 08:50:00',4,'Cadastro'),
('2024-06-01 08:40:00','2024-06-01 08:45:00','2024-06-01 08:55:00',5,'Cadastro');
('2024-06-01 08:50:00','2024-06-01 08:55:00','2024-06-01 09:05:00',6,'Outros'),
('2024-06-01 09:00:00','2024-06-01 09:05:00','2024-06-01 09:15:00',7,'Outros'),
('2024-06-01 09:10:00','2024-06-01 09:15:00','2024-06-01 09:25:00',8,'Outros'),
('2024-06-01 09:20:00','2024-06-01 09:25:00','2024-06-01 09:35:00',9,'Outros'),
('2024-06-01 09:30:00','2024-06-01 09:35:00','2024-06-01 09:45:00',10,'Outros');
