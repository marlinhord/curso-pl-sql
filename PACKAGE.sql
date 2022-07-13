CREATE OR REPLACE PACKAGE PKG_ALUNO
IS
  vCidade VARCHAR2(30);
  vMedia NUMBER(8,2);
  vNome VARCHAR2(30);
  PROCEDURE deleta_aluno(pCod_aluno number);
  PROCEDURE media_contratos;
  PROCEDURE con_aluno(pCod_aluno NUMBER);
END;

CREATE OR REPLACE PACKAGE BODY PKG_ALUNO
IS
  vTESTE VARCHAR(20);

  PROCEDURE media_contratos
  IS
  BEGIN
    vTeste := 'teste';
    SELECT Avg(total) INTO vMedia FROM tcontrato;
  END;

  PROCEDURE con_aluno(pCod_aluno NUMBER)
  IS
  BEGIN
    vNome := '';
    SELECT NOME INTO VNome FROM taluno
    WHERE cod_aluno = pCod_aluno;
  EXCEPTION
    WHEN No_Data_Found THEN
      Dbms_Output.Put_Line('Aluno não existe');
  END;

  PROCEDURE deleta_aluno(pCod_aluno NUMBER)
  IS
  BEGIN
    con_aluno(pCod_aluno);
    IF Length(vNome) > 0 THEN
      DELETE FROM taluno WHERE cod_aluno = pCod_aluno;
      Dbms_Output.Put_Line(vNome || '-> Excluido');
     END IF;
  END;

END;

EXEC pkg_aluno.deleta_aluno(5);

SELECT * FROM taluno WHERE;

DECLARE
  m NUMBER;
BEGIN
  pkg_aluno.media_contratos;
  m := pkg_aluno.vmedia;
  Dbms_Output.Put_Line('Média: ' || m);
--EXCEPTION
--  WHEN Others THEN
END;

DECLARE
  nome VARCHAR2(30);
BEGIN
  pkg_aluno.con_aluno(3);
  nome := pkg_aluno.vnome;
  Dbms_Output.Put_Line('Nome ' || nome);
--EXCEPTION
--  WHEN Others THEN
END;

BEGIN
  pkg_aluno.con_aluno(3);
  Dbms_Output.Put_Line('Nome '||pkg_aluno.vnome);
END;