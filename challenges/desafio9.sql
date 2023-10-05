SELECT COUNT(H.cancao_id) AS musicas_no_historico
FROM SpotifyClone.historico AS H
INNER JOIN SpotifyClone.usuarios AS U
ON H.usuario_id = U.usuario_id
WHERE U.usuario_nome = 'Barbara Liskov';