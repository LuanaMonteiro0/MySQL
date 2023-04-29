create database aula2mysql;
use aula2mysql;

/*Comandos gerais*/
set SQL_SAFE_UPDATES = 0;
show tables;
show databases;

/*descrição das tabelas*/
desc empregado;
desc departamento;

/*Tabelas*/
create table empregado(
	/*Colunas da tabela*/
	codigo 			int,
    cpf 			varchar(14) not null,
    dtNascimento 	date,
    nome 			varchar(50) not null,
    salario 		numeric(8,2) not null,
    logradouro 		varchar(60),
    nro				int,
    depto_num 		int,
    codigo_ger		int,
        
	/*Especificidades das colunas (constraints)*/
    constraint pk_empregado_codigo primary key(codigo),
    constraint unq_empregado_cpf unique(cpf),
    constraint chk_empregado_salario check(salario > 0),
    constraint fk_empregado_gerente foreign key(codigo_ger) references empregado(codigo)
);

create table departamento(
	/*Colunas da tabela*/
	numero			int,
    nome			varchar(20) not null,
    codigo_ger		int,
    data_ini_ger	date,
    
    /*Especificidades das colunas (constraints)*/
    constraint pk_departamento_numero primary key(numero),
    constraint unq_departamento_nome unique(nome),
    constraint fk_departamento_gerente foreign key(codigo_ger) references empregado(codigo)
);

/*Alterações nas tabelas criadas*/
/*Altera a estrutura da tabela existente*/
Alter table departamento add fone varchar(12); /*Adiciona coluna*/
Alter table departamento modify fone varchar(15); /*modifica atributo da coluna*/
Alter table departamento change fone telefone varchar(15); /*modifica o nome da coluna*/
Alter table departamento drop telefone;

Alter table empregado add constraint fk_empregado_departamento foreign key(depto_num) references departamento(numero);



/*inserindo dados*/
insert into departamento values(10, 'Compras', null, null);
insert into departamento(nome, numero) values ('Vendas', 20);

insert into empregado values(1, '111.222.333-44', '2002-11-11', 'Miguel Antonio', 2380.50, 'rua xxx', 287, 10, null);
insert into empregado(codigo, cpf, nome, salario) values(2, '111.111.222-33', 'farofeiro lopes', 2400.90); 

insert into departamento values(30, 'Fiscal', 2, '2021-03-18');

insert into empregado(codigo, cpf, nome, salario) values(3, '551.551.222-33', 'Maria das Dores', 1100.50);
insert into empregado(codigo, cpf, nome, salario) values(4, '664.451.222-33', 'José Manoel', 1150.50), (5, '125.458.658-32', 'Paulo Ricardo', 1150.50);

/*Alterando dados*/
/*Altera os valores das tuplas*/
update empregado set logradouro = 'Av. das hortencias', nro = 1088 where codigo = 2;
update empregado set depto_num = 20 where nome = 'Miguel Antonio'; /*<-- onde o nome for Miguel Antunes muda"*/
update empregado set depto_num = 20 where codigo = 2;
update empregado set codigo_ger = 1 where codigo = 2;
/*update empregado set codigo_ger = 1, depto_num = 20 where codigo = 2*/
update empregado set salario = salario * 1.1;
update empregado set salario = salario * 1.05 where salario < 2620;
update empregado set salario = salario * 1.20 where depto_num = 40 or depto_num = 10;
update empregado set salario = salario * 1.20 where depto_num = 20 and salario > 2700;

update departamento set nome = 'T.I.' where nome = 'Vendas';
update departamento set codigo_ger = 1 where codigo_ger is null;
/* não usar = pra ver se é null, usar is pq o null não é valor*/
/*diferente em sql é representado por !=  ou  <> */
/* não usar != pra ver se não é null, usar is not*/
update departamento set codigo_ger = null where numero = 20;
/*o = é só pra setar o null*/
update departamento set data_ini_ger = current_date() where numero = 10;

/*DML data manipulation language, manipula e insere, deleta os dados*/

/*Removendo as tuplas*/
Delete from empregado where codigo = 4;
Delete from empregado where nome = 'Paulo Ricardo';

Delete from departamento where codigo_ger = 2;

Delete from departamento where numero = 20; -- -->erro tem fk apontando e sendo apontada
Delete from empregado where nome = 'Miguel Antonio';-- -->mesmo erro de cima 

 Delete from empregado; -- apaga tudinho de empregado
 Delete from departamento; -- apaga tudo de departamento 
 
 /*Deleção de fks em modo cascata*/
 Alter table  empregado  drop foreign key fk_empregado_departamento;
 Alter table empregado add constraint fk_empregado_departamento foreign key(depto_num) references departamento(numero) on delete cascade;
  /*Deleção de fks em modo set null*/
 Alter table  empregado  drop foreign key fk_empregado_departamento;
 Alter table empregado add constraint fk_empregado_departamento foreign key(depto_num) references departamento(numero) on delete set null;
 /* Volta pro valor original a fk*/
 Alter table  empregado  drop foreign key fk_empregado_departamento;
 Alter table empregado add constraint fk_empregado_departamento foreign key(depto_num) references departamento(numero);
/*Comandos de Verificação*/
select * from departamento;
select * from empregado;




