DROP DATABASE IF EXISTS lab1;
CREATE DATABASE lab1;
USE lab1;

 CREATE TABLE Departamento (
 idDepartamento int(11) NOT NULL,
 dNome varchar(255) NOT NULL,
 Orcamento decimal(10,0) NOT NULL,
 PRIMARY KEY (idDepartamento)
 );

CREATE TABLE Funcionario (
 idFuncionario INT PRIMARY KEY AUTO_INCREMENT,
 Nome VARCHAR(45) NOT NULL,
 Sobrenome VARCHAR(45) NOT NULL,
 idDepartamento INT NOT NULL,
 CONSTRAINT fk_Funcionario_Departamento FOREIGN KEY (idDepartamento)
 REFERENCES Departamento (idDepartamento)
 );

INSERT INTO Departamento(idDepartamento,dNome,Orcamento) VALUES
(5,'TI',5000),
(6,'TI',2000);
 INSERT INTO Funcionario(nome,Sobrenome,idDepartamento) VALUES
 ('Davi', 'Israel',5),
 ('Pedro','Israel',6);
 
 
 SELECT DISTINCT Sobrenome FROM Funcionario
 