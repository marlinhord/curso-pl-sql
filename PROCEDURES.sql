CREATE OR REPLACE PROCEDURE aumenta_preco_curso(pCod_Curso NUMBER)
IS
BEGIN
  UPDATE tcurso SET valor = valor * 1.1
  WHERE cod_curso = pCod_Curso;
END;

SELECT * FROM tcurso;

EXEC aumenta_preco_curso(4);

DECLARE
  vCod INTEGER := &codigo;
BEGIN
  aumenta_preco_curso(vCod);
END;

CREATE OR REPLACE PROCEDURE aumenta_preco(pCod_Curso IN tcurso.cod_curso%TYPE)
IS
BEGIN
  UPDATE tcurso SET valor = valor * 1.1
  WHERE cod_curso = pCod_Curso;
END;

EXEC aumenta_preco(1);

SELECT * FROM tcurso;

CREATE OR replace PROCEDURE Consulta_Aluno
(pCodigo  IN TALUNO.cod_aluno%TYPE
 ,pNome    OUT taluno.nome%TYPE
 ,pCep     OUT taluno.cep%TYPE
 ,pCidade  OUT taluno.cidade%type)
IS
BEGIN
  SELECT nome, Cep, cidade
  INTO pNome, pCep, pCidade
  FROM taluno
  WHERE cod_aluno = pCodigo;
END;

DECLARE
  vnome VARCHAR2(30);
  vcidade VARCHAR2(30);
  vcep VARCHAR2(10);
  vCod INTEGER := &Codigo;
BEGIN
  Consulta_aluno(vcod, vnome, vcep, vcidade);

  Dbms_Output.Put_Line(vNome);
  Dbms_Output.Put_Line(vcep);
  Dbms_Output.Put_Line(vcidade);
END;

CREATE OR REPLACE PROCEDURE Consulta_aluno2
(pRegistro IN OUT taluno%ROWTYPE)
IS
  CURSOR csql IS
  SELECT * FROM taluno WHERE cod_aluno = pRegistro.cod_aluno;
BEGIN
  OPEN csql;
  FETCH csql INTO pRegistro;
  CLOSE csql;
--EXCEPTION
--  WHEN Others THEN
END;

DECLARE
  registro taluno%ROWTYPE;
BEGIN
  registro.cod_aluno := 1;
  Consulta_aluno2(registro);
  Dbms_Output.Put_Line(REGISTRO.Nome);
  Dbms_Output.Put_Line(REGISTRO.Cidade|| ' Cep: ' || REGISTRO.CEP);
--EXCEPTION
--  WHEN Others THEN
END;

CREATE OR REPLACE PROCEDURE formata_numero(pTelefone IN OUT VARCHAR2)
IS
BEGIN
    pTelefone := SubStr(pTelefone, 1, 4)||'-'||
                 SubStr(pTelefone, 5, 4);
END;

DECLARE
  vTelefone VARCHAR2(20);
BEGIN
  vTelefone := '12345678';
  formata_numero(vTelefone);
  Dbms_Output.Put_Line(vTelefone);
--EXCEPTION
--  WHEN Others THEN
END;