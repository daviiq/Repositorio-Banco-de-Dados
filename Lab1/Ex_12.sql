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
  (786,'Compras',100000);
  
INSERT INTO Funcionario
  (nome,Sobrenome,idDepartamento)
VALUES
  ('Davi', 'Israel', 1),
  ('Pedro', 'Coelho', 6),
  ('Jonas', 'Pereira',7),
  ('Maria', 'José',1),
  ('Juliano', 'Souza',786);

DELETE from Departamento
WHERE dNome = 'TI';

/* O comando DELETE não é permitido, pois a tabela Funcionario tem uma chave estrangeira que referencia a tabela Departamento. Para excluir um departamento, primeiro é necessário excluir os funcionários associados a ele ou atualizar a chave estrangeira para apontar para outro departamento. 
*/
