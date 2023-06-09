CREATE DATABASE AULA1BD1;
SHOW DATABASES;
USE AULA1BD1;
CREATE TABLE ESTUDANTE(
	ID INT PRIMARY KEY, 
    NOME VARCHAR(25) NOT NULL,
    NIVEL VARCHAR(15) DEFAULT 'GRADUACAO',
    IRA FLOAT,
    PERIODO INT DEFAULT 1,
    CHECK(NIVEL IN ('GRADUACAO', 'MESTRADO', 'DOUTORADO'))
);

CREATE TABLE TESTE(
	CODIGO INT AUTO_INCREMENT,
    DESCRICAO VARCHAR(30) NOT NULL,
    OBSERVACAO VARCHAR(100),
    STATUS_PEDIDO INT,
    CONSTRAINT TESTE_PK PRIMARY KEY(CODIGO),
    CONSTRAINT TESTE_DESC_UNIQUE UNIQUE(DESCRICAO),
    CONSTRAINT TESTE_STATS_CK CHECK(STATUS_PEDIDO IN(0, 1, 2, 3))    
    );
    
CREATE TABLE TESTE2(
	ID INT,
    NOME VARCHAR(40),
    COD_TESTE INT,
    CONSTRAINT TESTE2_PK PRIMARY KEY(ID),
    CONSTRAINT TESTE2_CODTESTE_FK FOREIGN KEY(COD_TESTE) REFERENCES TESTE(CODIGO)
);

SHOW TABLES;
DESC ESTUDANTE;
DESC TESTE;
DESC TESTE2;












