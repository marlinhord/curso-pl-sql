INSERT ALL
    INTO tcurso(Cod_curso, nome, valor)
    INTO taluno(cod_aluno, nome, salario)
      SELECT cod_contrato+50, 'INSERT ALL', 1013
        FROM tcontrato
          WHERE cod_contrato = 1;

SELECT * FROM tcurso;
SELECT * FROM taluno;

CREATE SEQUENCE seq_curso START WITH 100;

INSERT ALL
  WHEN total>=1000 THEN
    INTO tcurso(cod_curso, nome, valor)
    VALUES (seq_curso.NEXTVAL, 'CURSO>1000', total)
  WHEN desconto IS NULL then
    INTO tcurso(cod_curso, nome, valor)
    VALUES (seq_curso.NEXTVAL, 'DESCONTO IS NULL', total)
  SELECT cod_contrato, total, desconto
  FROM tcontrato WHERE cod_contrato = 1;

CREATE SEQUENCE seq_con START WITH 500;

merge INTO tcontrato tcn
      USING (SELECT  cod_aluno AS aluno
              FROM taluno
                WHERE estado = 'RS')
       ON (tcn.cod_aluno = aluno)
         WHEN matched THEN
            UPDATE SET desconto = 22
         WHEN NOT matched THEN
            INSERT(tcn.cod_contrato, tcn.data, tcn.cod_aluno,
                tcn.desconto, tcn.total)
            VALUES (seq_con.NEXTVAL, SYSDATE, aluno, 0, 555);

ALTER TABLE taluno ADD estado VARCHAR(2) DEFAULT 'RS';