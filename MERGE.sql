select * from taluno
order by cod_aluno

select * from tcontrato

create sequence seq_con start with 50;

merge into tcontrato tcn
    using (select cod_aluno as aluno
            from taluno)
    on  (tcn.cod_aluno = aluno)
        when matched then
           update set desconto = 44
        when not matched then
            insert (tcn.cod_contrato, tcn.data, tcn.cod_aluno,
            tcn.desconto, tcn.total)
            values (seq_con.nextval, sysdate, ALUNO, 0, 555);