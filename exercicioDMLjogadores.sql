create database exercicioDMLnumeroumJogadores;
use exercicioDMLnumeroumJogadores;

desc equipe;
desc jogador;

create table equipe(
	id		smallint,
    nome 	varchar(30) not null,
    constraint pk_id_equipe primary key(id)
);

create table jogador(
	id			smallint,
    nome 		varchar(50) not null,
	cpf 		varchar(14),
    data_nasc 	date,
    salario		numeric(8, 2),
    id_equipe	smallint,
    constraint pk_id_jogador primary key(id),
    constraint unq_cpf_jogador unique(cpf),
    constraint chk_jogador_salario check(salario > 0),
    constraint fk_jogador_equipe foreign key(id_equipe) references equipe(id)
);

insert into equipe values(10, 'A'),(20, 'B'),(30, 'C'),(40, 'D');

insert into jogador(id, nome, data_nasc, salario, id_equipe) values(1, 'Luan', '1993-11-16', 100.00, 10),
(2, 'João', '1993-11-16', 200.00, 20),
(3, 'Farofeiro', '1999-10-18', 1.00, 30), 
(4, 'Tiozão', '1950-04-01', 46.00, 10),
(5, 'Serjão', '1950-10-10', 50.00, null),
(6, 'Chipado', '1966-06-06', 666.66, null);

Alter table jogador add contato varchar(30);

select * from equipe;
select * from jogador;

update jogador set id_equipe = 20 where id = 6;
update jogador set contato = '99999-7777' where id = 1;
update jogador set contato = '94444-8888' where id = 2;
update equipe set nome = 'E' where id = 40;
update jogador set data_nasc = '2011-11-11' where salario > 3000;

delete from equipe where id = 40; -- deu certo  =D

delete from equipe where id = 20; -- deu errado =C 

alter table jogador drop foreign key 








