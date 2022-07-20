create or replace function consulta_preco
(pCod_curso NUMBER) return number
as 
 vValor Number;
begin
    select valor into vValor
    from tCurso 
    where cod_curso = pCod_curso;

    return(vValor);
end;

declare
    vCod number := &codigo;
    vValor number;
begin
    vValor := consulta_preco(vCod);
    dbms_output.put_line('Preço do curso: ' || vValor);
end;

grant create any type to marlon;

drop type table_reg_aluno;

create or replace type reg_aluno as object
(codigo integer,
 nome varchar2(30),
 cidade varchar2(30));
 
create or replace type table_reg_aluno as table of reg_aluno;

create or replace function get_aluno(pCodigo number)
return table_reg_aluno pipelined
is
 outlista reg_aluno;
 cursor csql is
    select alu.cod_aluno, alu.nome, alu.cidade
    from taluno alu
    where alu.cod_aluno = pCodigo;
   reg csql%rowtype;
begin
    open csql;
    fetch csql into reg;
    outLista := reg_aluno(reg.cod_aluno, reg.nome, reg.cidade);
    pipe row(outLista);
    close csql;
    return;
end;

select * from table(get_aluno(1));

select alu.*, con.total
from table(get_aluno(1)) alu, tcontrato con
where con.cod_aluno = alu.codigo

create or replace function get_alunos return table_reg_aluno pipelined
is
 outLista reg_aluno;
 cursor csql is
   select cod_aluno, nome, cidade from taluno;
  reg csql%rowtype;
begin
 for reg in csql
 loop
       outLista := reg_aluno(reg.cod_aluno, reg.nome, reg.cidade);
       pipe row(outLista);
  end loop;
  return;
end;