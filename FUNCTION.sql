CREATE OR REPLACE FUNCTION consulta_preco
(pCod_curso NUMBER) RETURN NUMBER
AS
  vValor NUMBER;
BEGIN
  SELECT valor INTO vValor
  FROM TCurso
  WHERE cod_curso = pCod_curso;

  RETURN(vValor);
--EXCEPTION
END;


DECLARE
  vCod NUMBER :=&codigo;
  vValor NUMBER;
BEGIN
  vValor := consulta_preco(vCod);
  Dbms_Output.Put_Line('Preco do curso: '||vValor);
END;

CREATE OR REPLACE FUNCTION existe_aluno
( pCod_Aluno IN taluno.cod_aluno%type)
RETURN BOOLEAN
IS
  vAluno NUMBER(10);
BEGIN
  SELECT cod_aluno
  INTO valuno
   FROM taluno
    WHERE cod_aluno = pCod_aluno;
    RETURN( TRUE );
EXCEPTION
WHEN Others THEN
    RETURN ( FALSE );
END;

DECLARE
  vCodigo INTEGER := 1;
BEGIN
  IF existe_aluno(vCodigo) THEN
  Dbms_Output.Put_Line('Codigo encontrado');
  ELSE
  Dbms_Output.Put_Line('Codigo não encontrado');
  END IF;
--  WHEN Others THEN
END;

CREATE OR REPLACE PROCEDURE cadastra_aluno
(pCod_aluno IN taluno.cod_aluno%TYPE,
 pNome      IN taluno.nome%TYPE,
 pCidade    IN taluno.cidade%TYPE,
 pCep    IN taluno.Cep%TYPE)
IS
BEGIN
  IF (NOT existe_aluno(pCod_Aluno) )THEN
  INSERT INTO taluno (cod_aluno, nome, cidade, cep)
  VALUES(pCod_Aluno, pNome, pCidade, pCep);
  Dbms_Output.Put_Line('Aluno cadastrado com sucesso');
  ELSE
  Dbms_Output.Put_Line('Codigo ja existe');
  END IF;

END;

BEGIN
  cadastra_aluno(1, 'PAULO', 'SAO PAULO', 'SP');
END;