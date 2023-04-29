create database exercicioDDLnumeroUm;
use exercicioDDLnumeroUm;

create table empregado(
	codigo		int not null,
    nome		varchar(60) not null,
    cpf			varchar(14) not null,
    sexo		char(1),
    datanasc	date,
    logradouro  varchar(50),
    nro			int,
    salario		decimal(8, 2) not null,
    depto_num 	int,
    codigo_ger 	int,
    constraint empregado_pk primary key (codigo),
    constraint empregado_sexo_ck check (sexo in ('m', 'M', 'f', 'F')),
    constraint empregado_salario_ck check (salario > 0)
);

create table departamento(
	numero			int not null,
    nome			varchar(20) not null,
    codigo_ger		int,
    data_ini_ger	date,
    constraint depto_pk primary key(numero),
    constraint depto_nome_uk unique(nome),
    constraint depto_ger_fk foreign key (codigo_ger) references empregado(codigo)

);

show tables;
desc empregado;
desc departamento;

-- metodos de alter table
-- add adiciona colunas
alter table empregado add fone varchar(20);
-- modify altera informações de colunas
alter table empregado modify fone varchar(16);
-- change renomeia coluna
alter table empregado change fone telefone varchar(16);
-- drop exclui coluna
alter table empregado drop telefone;
-- adicionando fk na tabela existente
alter table empregado add constraint emp_depto_fk foreign key(depto_num) references departamento(numero);


