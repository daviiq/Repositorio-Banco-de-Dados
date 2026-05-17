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

-- Seleciona o Artista que tem Tom e mais algo no nome --
select nomeArtista FROM ARTISTA
WHERE nomeArtista like 'Tom%'; 
