SELECT U.usuario_nome AS pessoa_usuaria,
COUNT(H.cancao_id) AS musicas_ouvidas,
ROUND(SUM(C.duracao_segundos) / 60, 2) AS total_minutos
FROM SpotifyClone.usuarios AS U
INNER JOIN SpotifyClone.historico AS H
ON U.usuario_id = H.usuario_id
INNER JOIN SpotifyClone.cancoes AS C
ON H.cancao_id = C.cancao_id
GROUP BY U.usuario_nome
ORDER BY U.usuario_nome ASC;