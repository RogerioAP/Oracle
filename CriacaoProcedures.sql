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
commit;

begin
  proc_inserir_pessoa('Rogerio'); /*abaixo mais uma chamada, com a finalidade de testar nos select's depois*/
  proc_inserir_pessoa('Gabriela');
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
commit;

begin
  proc_inserir_produto('Chocolate');
  proc_inserir_produto('Café');
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
commit;

begin
  proc_inserir_venda(1);
  proc_inserir_venda(1);
  proc_inserir_venda(2);
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
commit;

begin
  proc_inserir_produto_vendido(1, 1);
  proc_inserir_produto_vendido(1, 2);
  
  proc_inserir_produto_vendido(2, 1);
  proc_inserir_produto_vendido(2, 2);
  proc_inserir_produto_vendido(2, 3);
  
  proc_inserir_produto_vendido(3, 2);
  proc_inserir_produto_vendido(3, 3);
end;
/
