SELECT A.album_nome AS album,
COUNT(C.cancao_id) AS favoritadas
FROM SpotifyClone.album AS A
INNER JOIN SpotifyClone.cancoes AS C
ON C.album_id = A.album_id
INNER JOIN SpotifyClone.favoritos AS F
ON F.cancao_id = C.cancao_id
GROUP BY album
ORDER BY favoritadas DESC,
album ASC
LIMIT 3;