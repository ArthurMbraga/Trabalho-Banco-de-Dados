DROP DATABASE IF EXISTS consultoria;
CREATE DATABASE consultoria;
USE consultoria;

CREATE TABLE clientes (
    cpf CHAR(11) NOT NULL,
	nome VARCHAR(128) NOT NULL, 
    setor VARCHAR(128),
    email VARCHAR(128) NOT NULL,
    PRIMARY KEY (cpf));

CREATE TABLE telefones (
    cpf_cliente CHAR(11) NOT NULL,
    telefone CHAR(15) NOT NULL,
    PRIMARY KEY (cpf_cliente, telefone),
    FOREIGN KEY (cpf_cliente) REFERENCES clientes (cpf)
    ON DELETE CASCADE);

CREATE TABLE demanda_cliente (
	cpf_cliente CHAR(11) NOT NULL,
    codigo INT NOT NULL,
    PRIMARY KEY (cpf_cliente, codigo),
    FOREIGN KEY (cpf_cliente) REFERENCES clientes(cpf)
    ON DELETE CASCADE);

CREATE TABLE consultores (
    cpf CHAR(11) NOT NULL,   	
    email VARCHAR(128) NOT NULL,
    entrada DATE NOT NULL,
    saida DATE,
	telefone_empresarial CHAR(15),
    nome VARCHAR(128) NOT NULL,
    PRIMARY KEY (cpf));

CREATE TABLE endereco (
    cpf_consultor VARCHAR(128) NOT NULL,
    estado VARCHAR(128),
    cidade VARCHAR(128),
    rua VARCHAR(128),
    PRIMARY KEY (cpf_consultor),
    FOREIGN KEY (cpf_consultor) REFERENCES consultores(cpf)
    ON DELETE CASCADE);

CREATE TABLE propostas (
	codigo INT NOT NULL,
    cpf_cliente CHAR(11) NOT NULL,
	data_proposta DATE NOT NULL,
    origem VARCHAR(255),
    valor FLOAT NOT NULL,
	PRIMARY KEY (codigo),
    FOREIGN KEY (cpf_cliente) REFERENCES clientes(cpf)
    ON DELETE CASCADE );

CREATE TABLE projetos (
	sigla VARCHAR(32) NOT NULL,
	codigo_proposta INT NOT NULL,
    custo FLOAT NOT NULL,
    nps CHAR(5) NOT NULL,
    inicio DATE NOT NULL,
    termino DATE,
    PRIMARY KEY (sigla),
    FOREIGN KEY (codigo_proposta) REFERENCES propostas(codigo));

CREATE TABLE executam (
	cpf_consultor CHAR(11) NOT NULL,
    sigla_projeto VARCHAR(32) NOT NULL,
    horas_trabalhadas INT NOT NULL,
    PRIMARY KEY (cpf_consultor, sigla_projeto),
    FOREIGN KEY (cpf_consultor) REFERENCES consultores(cpf)
    ON DELETE CASCADE,
    FOREIGN KEY (sigla_projeto) REFERENCES projetos(sigla)
    ON DELETE CASCADE);

CREATE TABLE fazem (
	cpf_consultor VARCHAR(128) NOT NULL,
	codigo_proposta INT NOT NULL,
    PRIMARY KEY (cpf_consultor, codigo_proposta),
    FOREIGN KEY (cpf_consultor) REFERENCES consultores(cpf)
    ON DELETE CASCADE,
    FOREIGN KEY (codigo_proposta) REFERENCES propostas(codigo)
    ON DELETE CASCADE );