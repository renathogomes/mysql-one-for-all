SELECT MIN(P.plano_preco) AS faturamento_minimo,
MAX(P.plano_preco) AS faturamento_maximo,
ROUND(AVG(P.plano_preco), 2) AS faturamento_medio,
SUM(P.plano_preco) AS faturamento_total

FROM SpotifyClone.planos AS P
INNER JOIN SpotifyClone.usuarios AS U
ON P.plano_id = U.plano_id;