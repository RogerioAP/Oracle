/*
criação de tabelas simples
*/
drop table produtos_vendidos;
commit;
drop table venda;
commit;
drop sequence seq_idvenda;
commit;
drop table produto;
commit;
drop sequence seq_idproduto;
commit;
drop table pessoa;
commit;
drop sequence seq_idpessoa;
commit;

create table pessoa(
idpessoa number not null,
nome varchar2(40) not null,
constraint pk_id_pessoa primary key(idpessoa)
);
commit;
create sequence seq_idpessoa
  minvalue 1
  start with 1
  increment by 1
  nocache;
commit;


create table produto(
idproduto number not null,
nome varchar2(40) not null,
constraint pk_id_produto primary key(idproduto)
);
commit;
create sequence seq_idproduto
  minvalue 1
  start with 1
  increment by 1
  nocache;
commit;

  
create table venda(
idvenda number not null,
idpessoa number not null,
constraint pk_id_venda primary key(idvenda)
);
commit;
create sequence seq_idvenda
  minvalue 1
  start with 1
  increment by 1
  nocache;
commit;

alter table venda add constraint fk_id_pessoa foreign key(idpessoa) references pessoa(idpessoa);
commit;


create table produtos_vendidos(
idvenda number not null,
idproduto number not null
);
commit;

alter table produtos_vendidos add constraint fk_id_venda foreign key(idvenda) references venda(idvenda);
commit;
alter table produtos_vendidos add constraint fk_id_venda_produto foreign key(idproduto) references produto(idproduto);
commit;