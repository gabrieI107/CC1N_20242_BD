CREATE DATABASE IF NOT EXISTS EMPRESA DE PASSAGENS AÉREAS;
USE EMPRESAS DE PASSAGENS AÉREAS;

CREATE TABLE IF NOT EXISTS PASSAGEIROS(
    PASS_CPF INT PRIMARY KEY,
    PASS_NOME VARCHAR (30) NOT NULL,
    PASS_TELEFONE VARCHAR (14) NOT NULL,
    PASS_RUA VARCHAR (45) NOT NULL,
    PASS_NUMRUA INT NOT NULL,
    PASS_BAIRRO VARCHAR (45) NOT NULL,
    PASS_CIDADE VARCHAR (45) NOT NULL,
    PASS_ESTADO VARCHAR (45) NOT NULL,
    PASS_CEP DECIMAL (45) NOT NULL,
    PASS_PAIS VARCHAR (30) NOT NULL
    PASS_EMAIL VARCHAR (30) NOT NULL
);

CREATE TABLE IF NOT EXISTS AEROPORTOS(
AEROP_COD INT PRIMARY KEY,
AEROP_NOME VARCHAR (30) NOT NULL,
AEROP_CIDADE VARCHAR (45) NOT NULL,
AEROP_PAIS VARCHAR (30) NOT NULL,
AEROP_LATITUDE FLOAT NOT NULL,
AEROP_LONGITUDE FLOAT NOT NULL,
);

CREATE TABLE IF NOT EXISTS AERONAVES(
AERON_PREFIXO INT PRIMARY KEY,
AERON_MODELO VARCHAR(45) NOT NULL,
AERON_ANOFABR INT NOT NULL,
AERON_AUTONOMIA VARCHAR (45) NOY NULL,
AERON_CAPACIDADE INT NOT NULL,
AERON_FABRICANTE VARCHAR (45) NOT NULL,
);

CREATE TABLE IF NOT EXISTS FUNCIONÁRIOS(
FUNC_ID INT PRIMARY KEY,
FUNC_NOME VARCHAR (30) NOT NULL,
FUNC_DATANASC DDATE NOT NULL,
FUNC_CPF DECIMAL NOT NULL,
FUNC_FUNCAO VARCHAR(30) NOT NULL,
FUNC_RUA VARCHAR (45) NOT NULL,
FUNC_CEP DECIMAL NOT NULL,
FUNC_CIDADE VARCHAR (45) NOT NULL,
FUNC_BAIRRO VARCHAR (45) NOT NULL,
FUNC_NUMRUA INT NOT NULL,
);

CREATE TABLE IF NOT EXISTS VOOS(
VOO_ID INT PRIMARY KEY,
VOO_DATA DATE NOT NULL,
VOO_HORA TIME NOT NULL,
VOO_AEROP_ORIGEM VARCHAR (45) NOT NULL,
VOO_AEROP_DESTINO VARCHAR (45) NOT NULL,
VOO_AERONAVE VARCHAR (45) NOT NULL,
);

CREATE TABLE IF NOT EXISTS RESERVAS(
    RESERVA_COD INT PRIMARY KEY,
    PASS_CPF INT NOT NULL,
    CONSTRAINT PASS_CPF FOREIGN KEY (PASS_CPF)
    REFERENCES PASSAGEIROS (PASS_CPF)
    VOO_ID INT NOT NULL,
    CONSTRAINT VOO_ID FOREIGN KEY (VOO_ID)
    REFERENCES VOOS (VOO_ID)
);

CREATE TABLE IF NOT EXISTS EQUIPES(
    FUVO_FUNCIONARIOS INT,
    FUVO_VOOS INT,
    PRIMARY KEY (FUVO_FUNCIONARIOS,FUVO_VOOS)
    CONSTRAINT FUVO_FK_FUNCIONARIOS FOREIGN KEY (FUVO_FUNCIONARIOS) REFERENCES FUNCIONARIOS (FUNC_ID)
    CONSTRAINT FUVO_FK_VOOS FOREIGN KEY (FUVO_FK_VOOS) REFERENCES VOOS (VOO_ID)
);
