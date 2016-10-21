select * from pessoa;
commit;
select * from produto;
commit;
select * from venda;
commit;
select * from produtos_vendidos;
commit;

/*selecionar o nome de cada pessoa e os produtos que ela comprou*/
select pessoa.nome, produto.nome from pessoa, produto, venda, produtos_vendidos
  where pessoa.idpessoa=venda.idpessoa and venda.idvenda=produtos_vendidos.idvenda and produto.idproduto=produtos_vendidos.idproduto;
commit;

/*selecionar a quantidade de produtos que a pessoa comprou em cada compra*/
select pessoa.nome, count(produtos_vendidos.idvenda) from pessoa, produto, venda, produtos_vendidos
  where pessoa.idpessoa=venda.idpessoa and venda.idvenda=produtos_vendidos.idvenda and produto.idproduto=produtos_vendidos.idproduto
  group by produtos_vendidos.idvenda, pessoa.nome
  order by produtos_vendidos.idvenda;
commit;

/*selecionar as pessoas que mais fazem compras*/
select pessoa.nome, count(venda.idpessoa) as Quantidade from pessoa, venda
  where pessoa.idpessoa=venda.idpessoa
  group by venda.idpessoa, pessoa.nome
  order by count(venda.idpessoa) desc;
commit;

/*selecionar os produtos mais vendidos*/
select produto.nome, count(produtos_vendidos.idproduto) as Quantidade from produto, produtos_vendidos
  where produto.idproduto=produtos_vendidos.idproduto
  group by produto.nome, produtos_vendidos.idproduto;
commit;

/*deletar uma venda*/
delete from produtos_vendidos where idvenda=3;
commit;
delete from venda where idvenda=3;
commit;
