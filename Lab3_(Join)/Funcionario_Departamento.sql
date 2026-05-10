DROP DATABASE IF EXISTS Lab3_Join;
CREATE DATABASE Lab3_Join;
USE Lab3_Join;

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
  (5, 'TI', 50000),
  (6, 'RH', 2000),
  (7, 'Financeiro', 3000);

INSERT INTO Funcionario
  (nome,Sobrenome,idDepartamento)
VALUES
  ('Davi', 'Israel', 5),
  ('Maria', 'Silva', 6),
  ('Carlos', 'Oliveira', 5),
  ('Ana', 'Souza', 6),
  ('Pedro', 'Vieira', 6),
  ('Luiza', 'Costa', 7);

