DROP DATABASE IF EXISTS lab1;
CREATE DATABASE lab1;
USE lab1;

CREATE TABLE Departamento
(
  idDepartamento int(11) NOT NULL,
  dNome varchar(255) NOT NULL,
  Orcamento decimal(10,0) NOT NULL,
  PRIMARY KEY (idDepartamento)
);

CREATE TABLE Funcionario (
 idFuncionario INT PRIMARY KEY AUTO_INCREMENT,
 Nome VARCHAR (45) NOT NULL,
 Sobrenome VARCHAR (45) NOT NULL,
 idDepartamento INT NOT NULL,
 CONSTRAINT fk_Funcionario_Departamento FOREIGN KEY (idDepartamento)
 REFERENCES Departamento (idDepartamento)
 );

INSERT INTO Departamento
  (idDepartamento,dNome,Orcamento)
VALUES
  (1, 'TI', 50000),
  (6, 'Marketing', 2000),
  (7, 'RH', 3000),
  (786,'Compras',100000),
  (2, 'P&D',400000000);
  
INSERT INTO Funcionario
  (nome,Sobrenome,idDepartamento)
VALUES
  ('Davi', 'Israel', 1),
  ('Pedro', 'Coelho', 6),
  ('Jonas', 'Pereira',7),
  ('Maria', 'José',1),
  ('Juliano', 'Souza',786),
  ('Bruna' , 'Gozales',2),
  ('Paulo', 'Aguiar',1);
  
DELETE FROM Funcionario 
WHERE idDepartamento = 1;
SELECT * FROM Funcionario
