SELECT AR.artista_nome AS artista,
AL.album_nome AS album,
COUNT(S.artista_id) AS pessoas_seguidoras
FROM SpotifyClone.artistas AS AR
INNER JOIN SpotifyClone.album AS AL
ON AL.artista_id = AR.artista_id
INNER JOIN SpotifyClone.seguidor AS S
ON S.artista_id = AL.artista_id
GROUP BY artista, album
ORDER BY pessoas_seguidoras DESC, artista ASC, album ASC;