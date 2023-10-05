CREATE TABLE SpotifyClone.favoritos(
    usuario_id INT NOT NULL,
    cancao_id INT NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES SpotifyClone.usuarios(usuario_id),
    FOREIGN KEY (cancao_id) REFERENCES SpotifyClone.cancoes(cancao_id),
    UNIQUE (usuario_id, cancao_id)
) engine = InnoDB;

 INSERT INTO SpotifyClone.favoritos (usuario_id, cancao_id)
    VALUES (1, 3),
    (1, 6),
    (1, 10),
    (2, 4),
    (3, 1),
    (3, 3),
    (4, 7),
    (4, 4),
    (5, 10),
    (5, 2),
    (8, 4),
    (9, 7),
    (10, 3);