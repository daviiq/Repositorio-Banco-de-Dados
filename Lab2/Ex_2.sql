DROP DATABASE IF EXISTS Lab2;
CREATE DATABASE Lab2;
USE Lab2;

CREATE TABLE Cor (
    idCor INT PRIMARY KEY AUTO_INCREMENT,
    nomeCor VARCHAR(45) NOT NULL,
    fabricante VARCHAR(45) NOT NULL;
);

CREATE TABLE Carro (
    idCarro INT PRIMARY KEY AuTO_INCREMENT,
    modelo VARCHAR(45) NOT NULL,
    ano INT NOT NULL,
    chassi VARCHAR(45) NOT NULL;
    idCor INT NOT NULL,
    fabricante VARCHAR(45) NOT NULL;
    Foreign Key (idCor) REFERENCES Cor(idCor)
    Foreign Key (fabricante) REFERENCES Cor(fabricante)
);

INSERT INTO Cor
 {nomeCor, fabricante} 
VALUES
 ('Preto', 'Volkswagen'),
 ('Branco', 'Fiat'),
 ('Vermelho','Ferrari'),
 ('Azul', 'Chevrolet'),
 ('Cinza', 'Renault');

 INSERT INTO Carro
 (modelo,ano,chassi,fabricante)
 VALUES
 ('Punto',2013,'9BD12345678901234','Fiat'),
 ('Gol',2015,'9BD12345678901235','Volkswagen'),
 ('Onix',2018,'9BD12345678901236','Chevrolet'),
 ('Corsa',2010,'9BD12345678901237','Chevrolet'),
 ('Palio',2012,'9BD12345678901238','Fiat');

 

