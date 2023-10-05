SELECT AR.artista_nome AS artista,
AL.album_nome AS album
FROM SpotifyClone.artistas AS AR
INNER JOIN SpotifyClone.album AS AL
ON AL.artista_id = AR.artista_id
WHERE AR.artista_nome = 'Elis Regina';