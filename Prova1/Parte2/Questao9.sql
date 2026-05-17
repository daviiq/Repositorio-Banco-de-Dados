DROP DATABASE IF EXISTS Musica;
CREATE DATABASE Musica;
USE Musica;

CREATE TABLE GRAVADORA (
idGravadora INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
pais VARCHAR(50) NOT NULL
) Engine InnoDB;

CREATE TABLE ARTISTA (
idArtista INT AUTO_INCREMENT PRIMARY KEY,
nomeArtista VARCHAR(100) NOT NULL,
nacionalidade VARCHAR(50) NOT NULL
) Engine InnoDB;

CREATE TABLE ALBUM (
idAlbum INT AUTO_INCREMENT PRIMARY KEY,
titulo VARCHAR(100) NOT NULL,
ano INT NOT NULL,
idArtista INT NOT NULL,
idGravadora INT NOT NULL,
FOREIGN KEY (idArtista) REFERENCES ARTISTA(idArtista),
FOREIGN KEY (idGravadora) REFERENCES GRAVADORA(idGravadora)
) Engine InnoDB;

CREATE TABLE MUSICA (
dMusica INT AUTO_INCREMENT PRIMARY KEY,
titulo VARCHAR(100) NOT NULL,
duracao DECIMAL(3,1) NOT NULL,
idAlbum INT NOT NULL,
FOREIGN KEY (idAlbum) REFERENCES ALBUM(idAlbum)
) Engine InnoDB;

-- Gravadoras
INSERT INTO GRAVADORA (nome, pais) VALUES
('Universal Music', 'EUA'),
('Sony Music', 'EUA'),
('Warner Music', 'EUA');
-- Artistas
INSERT INTO ARTISTA (nomeArtista, nacionalidade) VALUES
('Taylor Swift', 'EUA'),
('The Beatles', 'Reino Unido'),
('IU', 'Coreia do Sul'),
('Tom Jobim', 'Brasil');
-- Albuns
INSERT INTO ALBUM (titulo, ano, idArtista, idGravadora) VALUES
('1989', 2014, 1, 1),
('Evermore', 2020, 1, 2),
('Abbey Road', 1969, 2, 1),
('Lovelight', 2015, 3, 2),
('Wave', 1967, 4, 3);
-- Musicas
INSERT INTO MUSICA (titulo, duracao, idAlbum) VALUES
('Blank Space', 3.5, 1),
('Style', 3.7, 1),
('Willow', 3.4, 2),
('Something', 3.0, 3),
('Come Together', 4.2, 3),
('Palette', 3.5, 4),
('Chega de Saudade', 2.5, 5),
('Wave', 4.0, 5);

--  Crie uma procedure que liste todas as músicas lançadas a partir de 2015, mostrando:
-- Título da música, Álbum, Artista e Gravadora. Com esses exatos nomes das colunas-- 

DELIMITER $$

CREATE PROCEDURE ListarMusicasApartir2015()
BEGIN
    SELECT
        M.titulo AS 'Título da música',
        AL.titulo AS 'Álbum',
        A.nomeArtista AS 'Artista',
        G.nome AS 'Gravadora'
    FROM MUSICA M
    INNER JOIN ALBUM AL
        ON M.idAlbum = AL.idAlbum
    INNER JOIN ARTISTA A
        ON AL.idArtista = A.idArtista
    INNER JOIN GRAVADORA G
        ON AL.idGravadora = G.idGravadora
    WHERE AL.ano >= 2015;
END $$

DELIMITER ;

-- Para executar a procedure:
CALL ListarMusicasApartir2015();
