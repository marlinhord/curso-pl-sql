declare
    type rec_aluno is record
        (cod_aluno number not null := 0,
         nome taluno.nome%type,
         cidade taluno.cidade%type);
         
    Registro rec_aluno;
begin
    registro.cod_aluno := 50;
    registro.nome := 'Marlone';
    registro.cidade := 'Jaboatão';
    
    dbms_output.put_line('Codigo: '||registro.cod_aluno);
    dbms_output.put_line('Nome: '||registro.nome);
    dbms_output.put_line('Cidade: '||registro.cidade);
END;

declare
    reg taluno%rowtype;
    Vcep VARCHAR(10) := '98300000';
begin
    select cod_aluno, nome, cidade
    into reg.cod_aluno, reg.nome, reg.cidade
    from taluno
    where cod_aluno = 1;
    
    vCep := '98300000';
    reg.cep := vCep;
    
    dbms_output.put_line('Codigo: '||reg.cod_aluno);
    dbms_output.put_line('Nome: '||reg.nome);
    dbms_output.put_line('Cidade: '||reg.cidade);
    dbms_output.put_line('Cep: '||reg.cidade);
end;

declare 
    type t_aluno is table of taluno.nome%type
    index by binary_integer;
    
    registro t_aluno;
begin
    registro(1) := 'Marlon';
    registro(2) := 'Pedro';
    registro(3) := 'João';
    
    dbms_output.put_line('Nome 1: '||registro(1));
    dbms_output.put_line('Nome 2: '||registro(2));
    dbms_output.put_line('Nome 3: '||registro(3));
end;

declare
    type nome_type is table of taluno.nome%type;
    nome_table nome_type := nome_type();
begin
    nome_table.extend;
    nome_table(1) := 'Marlon';
    nome_table.extend;
    nome_table(2) := 'João';
    dbms_output.put_line('Nome 1: '||nome_table(1));
    dbms_output.put_line('Nome 2: '||nome_table(2));
end;

declare
    type tipo is table of varchar2(40) index by varchar2(2);
    uf_capital tipo;
begin
    uf_capital('RS') := 'PORTO ALEGRE';
    uf_capital('RJ') := 'Rio de Janeiro';
    uf_capital('PR') := 'Curitiba';
    uf_capital('MT') := 'CUIABA';
    dbms_output.put_line(uf_capital('RS'));
    dbms_output.put_line(uf_capital('RJ'));
    dbms_output.put_line(uf_capital('PR'));
    dbms_output.put_line(uf_capital('MT'));
end;

declare
    type nome_varray is varray(5) of taluno.nome%type;
    nome_vetor nome_varray := nome_varray();
begin
    nome_vetor.extend;
    nome_vetor(1) := 'Master';
    dbms_output.put_line(nome_vetor(1));
end;


