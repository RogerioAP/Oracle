/*
criação de tabelas simples
*/
create table pessoa(
idpessoa number not null,
nome varchar2(40) not null,
constraint pk_id_pessoa primary key(idpessoa)
);
create sequence seq_idpessoa
  minvalue 1
  start with 1
  increment by 1
  nocache;


create table produto(
idproduto number not null,
nome varchar2(40) not null,
constraint pk_id_produto primary key(idproduto)
);
create sequence seq_idproduto
  minvalue 1
  start with 1
  increment by 1
  nocache;
  
  
create table venda(
idvenda number not null,
idpessoa number not null,
constraint pk_id_venda primary key(idvenda)
);
create sequence seq_idvenda
  minvalue 1
  start with 1
  increment by 1
  nocache;
  
alter table venda add constraint fk_id_pessoa foreign key(idpessoa) references pessoa(idpessoa);


create table produtos_vendidos(
idvenda number not null,
idproduto number not null
);

alter table produtos_vendidos add constraint fk_id_venda foreign key(idvenda) references venda(idvenda);
alter table produtos_vendidos add constraint fk_id_venda_produto foreign key(idproduto) references produto(idproduto);