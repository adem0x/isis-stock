begin transaction;
create table bk_produtos(a,b,c,d,e);
insert into bk_produtos select * from produtos;
drop table produtos;
create table produtos(id_produto integer not null,id_categoria integer,codigo varchar(20),descricao varchar(255),valor_unitario float);
insert into produtos select * from bk_produtos;
drop table bk_produtos;
commit transaction; 