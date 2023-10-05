SELECT U.usuario_nome AS pessoa_usuaria,
CASE
	WHEN MAX(H.data_reproducao) >= '2021-01-01'
    THEN 'Ativa' ELSE 'Inativa'  END AS status_pessoa_usuaria
FROM SpotifyClone.usuarios AS U
INNER JOIN SpotifyClone.historico AS H
ON H.usuario_id = U.usuario_id
GROUP BY U.usuario_nome
ORDER BY U.usuario_nome;
