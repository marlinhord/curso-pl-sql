DECLARE
  vCod taluno.cod_aluno%TYPE := 1;
  vCidade taluno.cidade%TYPE;
  x NUMBER;
BEGIN
  SELECT Cidade
   INTO vCidade
   FROM TAluno
   -- WHERE;
   WHERE cod_aluno = vCod;
   X := 0 / 0;
   Dbms_Output.Put_Line('Cidade: ' || vCidade);
EXCEPTION
    WHEN No_Data_Found THEN
    Raise_Application_Error(-20001,'Aluno Inexistente! ' || SQLCODE || ' ' || SQLERRM);
    WHEN too_many_rows THEN
    Raise_Application_Error(-20002,'Registro Duplicado! ' || SQLCODE || ' ' || SQLERRM);
    WHEN others THEN
    Raise_Application_Error(-20003,'Exceção Desconhecida! ' || SQLCODE || ' ' || SQLERRM);
END;

CREATE TABLE contas (
Codigo INTEGER NOT NULL PRIMARY KEY,
Valor NUMBER(10,2),
Juros NUMBER(10,2),
Vencimento DATE);

INSERT INTO contas VALUES(100, 550, 50, SYSDATE-10);

SELECT * FROM contas ;

COMMIT;

DECLARE
  vDt_vencimento DATE;
  vConta NUMBER := 100;
  eConta_vencida EXCEPTION;
BEGIN
  SELECT vencimento INTO vDt_vencimento
  FROM contas
  WHERE codigo = vConta;
  IF vDt_vencimento < Trunc(SYSDATE) THEN
    RAISE eConta_vencida;
  END IF;
EXCEPTION
  WHEN eConta_vencida THEN
  Dbms_Output.Put_Line('Conta vencida');
  UPDATE contas SET valor = valor + juros
  WHERE codigo = vConta;
END;

SELECT * FROM contas WHERE;

DECLARE
  eFk_inexistente EXCEPTION;
  PRAGMA EXCEPTION_INIT(eFk_inexistente, -02291);
BEGIN
  INSERT INTO tbairro VALUES (100, 100, 'ERRO');
EXCEPTION
  WHEN eFk_inexistente THEN
    Raise_Application_Error(-20200,'Cidade não existe!');
END;

SELECT * FROM TCIDADE WHERE;


