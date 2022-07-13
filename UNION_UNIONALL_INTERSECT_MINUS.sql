SELECT cod_aluno, total, desconto
FROM tcontrato
WHERE cod_aluno = 1

--UNION all
union

SELECT cod_aluno, total, desconto
FROM tcontrato
WHERE total >= 1000;

SELECT cod_contrato, data, total, 'UNION 1' AS query
FROM tcontrato
WHERE total >= 1000 AND total < 2000

UNION ALL

SELECT cod_contrato, data, total, 'UNION 2' AS query
FROM tcontrato
WHERE desconto IS NOT NULL

union

SELECT cod_contrato, data, total, 'UNION 3' AS query
FROM tcontrato
WHERE total > 2000

ORDER BY 4;

SELECT cod_contrato, data, desconto, total
FROM tcontrato
WHERE desconto IS NOT NULL

INTERSECT

SELECT cod_contrato, data,  desconto, total
FROM tcontrato
WHERE total > 1000

ORDER BY 1 ;


SELECT cod_contrato, data, desconto, total
FROM tcontrato
WHERE desconto IS NOT NULL

minus

SELECT cod_contrato, data,  desconto, total
FROM tcontrato
WHERE total > 2000

ORDER BY 1 ;





