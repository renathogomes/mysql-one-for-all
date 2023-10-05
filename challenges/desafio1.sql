DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;

CREATE TABLE SpotifyClone.planos(
    plano_id INT PRIMARY KEY AUTO_INCREMENT,
    plano_nome VARCHAR(50) NOT NULL UNIQUE,
    plano_preco DECIMAL(4,2) NOT NULL,
) engine = InnoDB;

CREATE TABLE SpotifyClone.usuarios(
    usuario_id INT PRIMARY KEY AUTO_INCREMENT,
    usuario_nome VARCHAR(50) NOT NULL,
    usuario_idade INT NOT NULL,
    plano_id INT NOT NULL,
    FOREIGN KEY (plano_id) REFERENCES SpotifyClone.planos(plano_id),
    data_assinatura DATE NOT NULL,
) engine = InnoDB;

CREATE TABLE SpotifyClone.artistas(
    artista_id INT PRIMARY KEY AUTO_INCREMENT,
    artista_nome VARCHAR(50) NOT NULL,
) engine = InnoDB;

CREATE TABLE SpotifyClone.album(
    album_id INT PRIMARY KEY AUTO_INCREMENT,
    album_nome VARCHAR(50) NOT NULL,
    artista_id INT NOT NULL,
    FOREIGN KEY (artista_id) REFERENCES SpotifyClone.artistas(artista_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.cancoes(
    cancao_id INT PRIMARY KEY AUTO_INCREMENT,
    cancao_nome VARCHAR(50) NOT NULL,
    album_id INT NOT NULL,
    FOREIGN KEY (album_id) REFERENCES SpotifyClone.album(album_id),
    ano_lancamento INT NOT NULL,
    duracao_segundos INT NOT NULL,
) engine = InnoDB;

CREATE TABLE SpotifyClone.seguidor(
    seguidor_id INT PRIMARY KEY AUTO_INCREMENT,
    usuario_id INT NOT NULL,
    artista_id INT,
    FOREIGN KEY (usuario_id) REFERENCES SpotifyClone.usuarios(usuario_id),
    FOREIGN KEY (artista_id) REFERENCES SpotifyClone.artistas(artista_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.historico(
    historico_id INT PRIMARY KEY AUTO_INCREMENT,
    usuario_id INT NOT NULL,
    cancao_id INT NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES SpotifyClone.usuarios(usuario_id),
    FOREIGN KEY (cancao_id) REFERENCES SpotifyClone.cancoes(cancao_id),
    data_reproducao DATE NOT NULL,
) engine = InnoDB;

INSERT INTO SpotifyClone.usuarios (usuario_nome, idade, plano_id, data_assinatura)
  VALUES ('Barbara Liskov', 82, 1, 2019-10-20),
  ('Robert Cecil Martin', 58, 1, 2017-01-06)
  ('Ada Lovelace', 37, 2, 2017-12-30),
  ('Martin Fowler', 46, 2, 2017-01-17),
  ('Sandi Metz', 58, 2, 2018-04-29),
  ('Paulo Freire', 19, 3, 2018-02-14),
  ('Bell Hooks', 26, 3, 2018-01-05),
  ('Christopher Alexander', 85, 4, 2019-06-05),
  ('Judith Butler', 45, 4, 2020-05-13),
  ('Jorge Amado', 58, 4, 2017-02-17);

INSERT INTO SpotifyClone.planos (plano_nome, plano_preco)
    VALUES ('gratuito', 0),
    ('familiar', 7.99),
    ('universitario', 5.99),
    ('pessoal', 6.99);

INSERT INTO SpotifyClone.artistas (artista_nome)
    VALUES ('Beyoncé'),
    ('Queen'),
    ('Elis Regina'),
    ('Baco Exu do Blues'),
    ('Blind Guardian'),
    ('Nina Simone');

INSERT INTO SpotifyClone.album (album_nome, artista_id)
    VALUES ('Renaissance', 1),
    ('Jazz', 2),
    ('Hot Space', 2),
    ('Falso Brilhante', 3),
    ('Vento de Maio', 3),
    ('QVVJFA?', 4),
    ('Somewhere Far Beyond', 5),
    ('I Put A Spell On You', 6);

INSERT INTO SpotifyClone.cancoes (cancao_nome, album_id, ano_lancamento, duracao_segundos)
    VALUES ("BREAK MY SOUL", 1, 2022, 279),
    ("VIRGO'S GROOVE", 1, 2022, 369),
    ("ALIEN SUPERSTAR", 1, 2022, 116),
    ("Don't Stop Me Now", 2, 1978, 203),
    ("Under Pressure", 3, 1982, 152),
    ("Como Nossos Pais", 4, 1998, 105),
    ("O Medo de Amar é o Medo de Ser Livre", 5, 2001, 207),
    ("Samba em Paris", 6, 2003, 267),
    ("The Bard's Song", 7, 2007, 244),
    ("Feeling Good", 8, 2012, 100);

INSERT INTO SpotifyClone.seguidor (usuario_id, artista_id)
    VALUES (1, 1),
    (1, 2),
    (1, 3),
    (2, 1),
    (2, 3),
    (3, 2),
    (4, 4),
    (5, 5),
    (5, 6),
    (6, 6),
    (6, 1),
    (7, 6),
    (8, NULL),
    (9, 3),
    (10, 2);

INSERT INTO SpotifyClone.historico (usuario_id, cancao_id, data_reproducao)
    VALUES (1, 8, 2022-02-28),
    (1, 2, 2020-05-02 ),
    (1, 10, 2020-03-06 ),
    (2, 10, 2022-08-05 ),
    (2, 7, 2020-01-02 ),
    (3, 10, 2020-11-13 ),
    (3, 2, 2020-12-05 ),
    (4, 8, 2021-08-15 ),
    (5, 8, 2022-01-09 ),
    (5, 5, 2020-08-06 ),
    (6, 7, 2017-01-24 ),
    (6, 1, 2017-10-12 ),
    (7, 4, 2011-12-15 ),
    (8, 4, 2012-03-17 ),
    (9, 9, 2022-02-24 ),
    (10, 3, 2015-12-13 );
```