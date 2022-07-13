SELECT cod_aluno, Trunc(data),
        Sum(desconto) desconto,
        Sum(total) total
FROM  tcontrato
GROUP BY rollup(cod_aluno, Trunc(data));

SELECT cod_aluno,
      CASE
        WHEN Trunc(data) IS NULL AND cod_aluno IS NOT NULL
            THEN 'SUB-TOTAL'
        WHEN cod_aluno IS NULL
            THEN  'TOTAL'
        ELSE To_Char(Trunc(data))
      END descricao,
      Round(Avg(desconto),2) desconto,
      Sum(total) total
FROM tcontrato
GROUP BY rollup(cod_aluno, Trunc(data));

SELECT cod_aluno,
        Trunc(data),
        Sum(total)
FROM tcontrato
GROUP BY cube(cod_aluno, Trunc(data));

SELECT * FROM tcontrato;

SELECT Grouping(cod_aluno), Sum(total)
FROM tcontrato
GROUP BY rollup(cod_aluno);

SELECT Grouping(cod_aluno),
      CASE
        WHEN Grouping(cod_aluno)=0 THEN To_Char(cod_aluno)
          ELSE 'Total Geral: '
        END aluno,
        Sum(total)
FROM tcontrato
GROUP BY rollup(cod_aluno);

SELECT Trunc(data),
      grouping_id(trunc(DATA)) GDT,
      cod_aluno,
      grouping_id(cod_aluno) GCL,
      Sum(total)
FROM tcontrato
GROUP BY rollup( Trunc(data), COD_ALUNO);

SELECT Trunc(data), cod_aluno,
    CASE
      WHEN grouping_id(cod_aluno)=1 AND
          grouping_id(Trunc(data))=0 THEN 'Total do dia: '
      WHEN grouping_id(cod_aluno)=1 AND
          grouping_id(Trunc(data))=1 THEN 'Total Geral: '
      END AS descricao,
      Sum(total) TOTAL
FROM tcontrato
GROUP BY rollup(trunc(data), cod_aluno);