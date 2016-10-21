/*
criação de procedures
*/
create or replace procedure proc_inserir_pessoa(
  par_nome in pessoa.nome%type
)
is
vid_pessoa number;
begin
  select seq_idpessoa.nextval into vid_pessoa from dual;
  insert into pessoa values(vid_pessoa, par_nome);
  commit;
end proc_inserir_pessoa;
/

begin
  proc_inserir_pessoa('Rodrigo');
end;
/



create or replace procedure proc_inserir_produto(
par_nome in produto.nome%type
)
is
vid_produto number;
begin
  select seq_idproduto.nextval into vid_produto from dual;
  insert into produto values(vid_produto, par_nome);
  commit;
end proc_inserir_produto;
/

begin
  proc_inserir_produto('Açúcar');
end;
/



create or replace procedure proc_inserir_venda(
par_idpessoa in pessoa.idpessoa%type
)
is
vid_venda number;
begin
  select seq_idvenda.nextval into vid_venda from dual;
  insert into venda values(vid_venda, par_idpessoa);
  commit;
end proc_inserir_venda;
/

begin
  proc_inserir_venda(3);
end;
/


create or replace procedure proc_inserir_produto_vendido(
par_idvenda in venda.idvenda%type,
par_idproduto in produto.idproduto%type
)
is
begin
  insert into produtos_vendidos values(par_idvenda, par_idproduto);
  commit;
end proc_inserir_produto_vendido;
/

begin
  proc_inserir_produto_vendido(4, 3);
end;
/
