ALTER TABLE Log ADD obs VARCHAR2(80);
ALTER TABLE taluno ADD salario NUMERIC(12,2);

CREATE OR REPLACE TRIGGER audita_aluno
AFTER INSERT OR UPDATE OR DELETE ON TALUNO
FOR EACH ROW

BEGIN
  IF( DELETING) THEN
    INSERT INTO log(usuario, horario, OBS)
    VALUES (USER, SYSDATE, 'Linhas deletadas');
  ELSIF (INSERTING) THEN
    INSERT INTO Log(usuario, horario, obs)
    VALUES (USER, SYSDATE, 'Linhas inseridas');
  ELSIF (UPDATING('SALARIO') ) THEN
    INSERT INTO Log
    VALUES (:OLD.nome, SYSDATE, :old.salario, :new.salario, 'Alterado salário');
  ELSE
    INSERT INTO Log(usuario, horario, OBS)
    VALUES ( USER, SYSDATE, 'Atualização Aluno.');
  END IF;
END;

SELECT * FROM taluno;
SELECT * FROM Log;
UPDATE taluno set salario = 3000;

CREATE OR REPLACE TRIGGER gera_log_curso
BEFORE UPDATE OF valor ON tcurso
FOR EACH ROW
BEGIN
  INSERT INTO Log(usuario, horario, obs,
                  valor_antigo, valor_novo)
  VALUES (USER, SYSDATE, 'Curso Alterado:'||:OLD.nome,:old.valor,:new.valor);
END;

SELECT * FROM tcurso ;

UPDATE tcurso SET
valor = 3000
WHERE valor > 1500

SELECT * FROM Log;

ALTER TABLE tcontrato ADD valor_comissao NUMERIC(8,2);

CREATE OR REPLACE TRIGGER calc_comissao
BEFORE INSERT OR UPDATE OF total ON tContrato
REFERENCING OLD AS antigo
            NEW AS novo
FOR EACH ROW
WHEN(novo.total >=5000)
DECLARE
  vComissao NUMERIC(6,2) := 0.15;
BEGIN
  IF(:novo.total <= 10000) THEN
    :novo.valor_comissao := :novo.total*(vComissao);
  ELSE
    :novo.valor_comissao := :novo.total*(vComissao+0.01);
  END IF;
END;

INSERT INTO tcontrato(cod_contrato, total) VALUES(35,12000);

ALTER TRIGGER VALIDA_HORARIO_CURSO2 disable

SELECT * FROM tContrato;

CREATE OR REPLACE VIEW vcontratos_pares
AS SELECT cod_contrato, data, cod_aluno, desconto, total
    FROM tcontrato
    WHERE Mod( cod_contrato, 2 ) = 0;

SELECT * FROM vcontratos_pares

CREATE OR REPLACE TRIGGER tri_contratos_pares
instead OF INSERT OR DELETE OR update ON vcontratos_pares
DECLARE
BEGIN
  INSERT INTO Log( usuario, horario, obs)
  VALUES (USER, SYSDATE, 'DML da view vCONTRATO_PARES');
END;

INSERT INTO vcontratos_pares VALUES(90, SYSDATE, 10, NULL, 5000);

SELECT * FROM tcontrato;

