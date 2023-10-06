SELECT AR.artista_nome AS artista,
CASE 
WHEN COUNT(C.cancao_id) >= 5 THEN 'A'
WHEN COUNT(C.cancao_id) IN (3, 4) THEN 'B'
WHEN COUNT(C.cancao_id) IN (1, 2) THEN 'C'
ELSE '-'
END AS ranking
FROM SpotifyClone.favoritos AS F
INNER JOIN SpotifyClone.cancoes AS C
ON F.cancao_id = C.cancao_id
INNER JOIN SpotifyClone.album AS AL
ON AL.album_id = C.album_id
RIGHT JOIN SpotifyClone.artistas AS AR
ON AR.artista_id = AL.artista_id
GROUP BY AR.artista_nome
ORDER BY COUNT(C.cancao_id) DESC;