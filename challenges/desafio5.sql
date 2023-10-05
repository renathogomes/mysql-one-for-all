SELECT cancao_nome AS cancao, 
COUNT(H.cancao_id) AS reproducoes
FROM SpotifyClone.cancoes AS CA
INNER JOIN SpotifyClone.historico AS H
ON CA.cancao_id = H.cancao_id
GROUP BY cancao_nome
ORDER BY reproducoes DESC, cancao
LIMIT 2;