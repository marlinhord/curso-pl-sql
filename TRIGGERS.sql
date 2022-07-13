BEGIN
  IF(To_Char(SYSDATE, 'DAY') IN ('SÁBADO', 'DOMINGO') OR
  To_Number(To_Char(SYSDATE, 'HH24')) NOT BETWEEN 8 AND 18) THEN
  Raise_Application_Error(-20999,'Fora do horário comercial');
  END IF;
--  WHEN Others THEN
END;

CREATE OR REPLACE TRIGGER VALIDA_HORARIO_CURSO
BEFORE INSERT OR DELETE ON Tcontrato
BEGIN
  IF(To_Char(SYSDATE, 'D') IN (1, 7) OR
  To_Number(To_Char(SYSDATE, 'HH24'))
  NOT BETWEEN 8 AND 18) THEN
  Raise_Application_Error(-20999,'Fora do horário comercial');
  END IF;
END;

INSERT INTO tContrato VALUES (7665, SYSDATE, 10, 1500, NULL)

SELECT * FROM Tcontrato WHERE;

CREATE TABLE Log
( usuario VARCHAR2(30),
  horario DATE,
  valor_antigo VARCHAR2(10),
  valor_novo VARCHAR2(10))

CREATE OR REPLACE TRIGGER gera_log_alt
AFTER UPDATE OF total ON tContrato
DECLARE
  --variaveis
BEGIN
  INSERT INTO Log(Usuario, Horario) VALUES (USER, SYSDATE);
END;

SELECT * FROM tContrato

UPDATE tcontrato SET total = 5000 WHERE cod_contrato = 1;

SELECT * FROM log;

CREATE OR REPLACE TRIGGER valida_horario_curso2
BEFORE INSERT OR UPDATE OR DELETE ON tcontrato
BEGIN
  IF(To_Char(SYSDATE, 'D') IN (1, 7) OR
    To_Number(To_Char(SYSDATE, 'HH24'))NOT BETWEEN 8 AND 23)THEN
    IF (INSERTING) THEN
      Raise_Application_Error(-20999,'Não pode inserir');
    ELSIF (DELETING) THEN
      Raise_Application_Error(-20999,'Não pode deletar');
    ELSIF (UPDATING('TOTAL')) THEN
      Raise_Application_Error(-20999,'Não pode alterar o valor');
    ELSE
      Raise_Application_Error(-20999,'Não pode alterar');
    END IF;
  END IF;
END;

ALTER TRIGGER valida_horario_curso DISABLE;

DELETE FROM tcontrato;
UPDATE tcontrato SET (total) = (5000) WHERE cod_contrato = 1;
INSERT INTO tcontrato VALUES (90, SYSDATE, 10, 1500, NULL)