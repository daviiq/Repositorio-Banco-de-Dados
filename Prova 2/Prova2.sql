CREATE TABLE
    Autora (
        idAutora INT PRIMARY KEY AUTO_INCREMENT,
        nome VARCHAR(45),
        dataNasc DATE NOT NULL CHECK (dataNasc <= '2027-12-31'),
        pais VARCHAR(45)
    );

CREATE TABLE
    Editora (
        idEditora INT PRIMARY KEY AUTO_INCREMENT,
        nome VARCHAR(45),
        pais VARCHAR(45),
        anoFundacao INT NOT NULL,
        CHECK (
            anoFundacao > 1800
            AND anoFundacao < 2027
        )
    );

CREATE TABLE
    Saga (
        idSaga INT PRIMARY KEY AUTO_INCREMENT,
        nome VARCHAR(45) NOT NULL,
        numLivros INT NOT NULL CHECK (numLivros >= 0),
        idAutora INT NOT NULL,
        FOREIGN KEY (idAutora) REFERENCES Autora (idAutora),
        ON DELETE RESTRICT,
        idEditora INT NOT NULL,
        FOREIGN KEY (idEditora) REFERENCES Editora (idEditora),
        ON DELETE CASCADE
    );

CREATE TABLE
    Livro (
        idLivro INT PRIMARY KEY AUTO_INCREMENT,
        nome VARCHAR(45) NOT NULL,
        volume INT NOT NULL CHECK (volume > 0),
        idSaga INT NOT NULL,
        FOREIGN KEY (idSaga) REFERENCES Saga (idSaga),
        ON DELETE CASCADE
    );

INSERT INTO
    Editora (nome, anoFundacao, pais)
VALUES
    ('Bloomsbury', 1986, 'UK'),
    ('Scholastic', 1920, 'EUA'),
    ('HarperCollins', 1989, 'UK');

INSERT INTO
    Autora (nome, dataNasc, pais)
VALUES
    ('J.K. Rowling', '1965-07-31', 'UK'),
    ('Suzanne Collins', '1962-08-10', 'EUA'),
    ('J.R.R. Tolkien', '1892-01-03', 'UK'),
    ('C.S. Lewis', '1898-11-29', 'Irlanda');

INSERT INTO
    Saga (nome, numLivros, idAutora, idEditora)
VALUES
    ('Harry Potter', 7, 1, 1),
    ('Jogos Vorazes', 3, 2, 2),
    ('O Senhor dos Aneis', 3, 3, 3),
    ('As Cronicas de Narnia', 7, 4, 3),
    ('Os Grandes Contos de Tolkien', 1, 3, 3);

INSERT INTO
    Livro (nome, volume, idSaga)
VALUES
    ('A Pedra Filosofal', 1, 1),
    ('A Camara Secreta', 2, 1),
    ('Em Chamas', 2, 2),
    ('A Esperanca', 3, 2),
    ('A Sociedade do Anel', 1, 3),
    ('As Duas Torres', 2, 3),
    ('O Retorno do Rei', 3, 3),
    ('O Leao, a Feiticeira e o Guarda-Roupa', 1, 4),
    ('Principe Caspian', 2, 4),
    ('Contos Inacabados', 1, 5);

-- Consulta que retorna as sagas cujo nome contém a palavra Harry
SELECT
    nome
FROM
    Saga
WHERE
    nome LIKE '%Harry%'
    --View que exibe nome da nome da saga, nome da autora, país
    -- da autora, nome da editora e ano de fundação e Ordene o resultado
    -- por nome da saga
CREATE VIEW
    vw_sagas_autoras AS
SELECT
    S.nome AS nomeSaga,
    A.nome AS nomeAutora,
    A.pais AS paisAutora,
    E.nome AS nomeEditora,
    E.anoFundacao
FROM
    Saga S
    INNER JOIN Autora A ON S.idAutora = A.idAutora
    INNER JOIN Editora E ON S.idEditora = E.idEditora
ORDER BY
    S.nome;

--View que deve conter apenas os livros cujo nome tem mais de 10 
--caracteres. A view deve conter: 
--nome do livro, volume, nome da saga, nome da autora e volume
CREATE VIEW
    vw_livros_longos AS
SELECT
    L.nome AS nomeLivro,
    L.volume,
    S.nome AS nomeSaga,
    A.nome AS nomeAutora
FROM
    Livro L
    INNER JOIN Saga S ON L.idSaga = S.idSaga
    INNER JOIN Autora A ON S.idAutora = A.idAutora
WHERE
    LENGTH (L.nome) > 10
ORDER BY
    L.nome;

--Criação de um Case de sagas
SELECT
    S.nome AS nomeSaga,
    COUNT(L.idLivro) AS numeroReal,
    S.numLivros AS numeroEsperado,
    COUNT(L.idLivro) - S.numLivros AS diferenca,
    CASE
        WHEN COUNT(L.idLivro) - S.numLivros > 0 THEN 'Extra'
        WHEN COUNT(L.idLivro) - S.numLivros < 0 THEN 'Faltando'
        ELSE 'Exato'
    END AS status
FROM Saga S
INNER JOIN Livro L
    ON S.idSaga = L.idSaga
GROUP BY
    S.idSaga,
    S.nome,
    S.numLivros
ORDER BY diferenca DESC;