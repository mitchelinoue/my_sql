


CREATE DATABASE obra;
USE obra;

CREATE TABLE obra(
	idObra INTEGER PRIMARY KEY AUTO_INCREMENT,
    nomeObra VARCHAR(30) NOT NULL,
    orcamentoObra DECIMAL(10, 2) NOT NULL,
    prazoObra DATE NOT NULL
);

CREATE TABLE engenheiro(
	idEngenheiro INTEGER PRIMARY KEY AUTO_INCREMENT,
    nomeEngenheiro VARCHAR(30) NOT NULL,
    idadeEngenheiro INTEGER NOT NULL,
    email VARCHAR(30) UNIQUE NOT NULL,
    salario DECIMAL(10, 2) NOT NULL,
    idObra INTEGER NOT NULL,
    FOREIGN KEY(idObra) REFERENCES obra(idObra)
);

CREATE TABLE setor(
	idSetor INTEGER PRIMARY KEY AUTO_INCREMENT,
    nomeSetor VARCHAR(30) NOT NULL,
    orcamentoSetor DECIMAL(10, 2) NOT NULL,
    prazoSetor DATE NOT NULL,
    idObra INTEGER NOT NULL,
    FOREIGN KEY(idObra) REFERENCES obra(idObra)
);

CREATE TABLE colaborador(
	idColaborador INTEGER PRIMARY KEY AUTO_INCREMENT,
    nomeColaborador VARCHAR(30) NOT NULL,
    salarioColaborador DECIMAL(10, 2) NOT NULL,
    dataNasc DATE NOT NULL,
    idSetor INTEGER NOT NULL,
    FOREIGN KEY(idSetor) REFERENCES setor(idSetor)
);

CREATE TABLE colaborador_ferramenta(
	idColaborador_ferramenta INTEGER PRIMARY KEY AUTO_INCREMENT,
    idColaborador INTEGER NOT NULL,
    idFerramenta INTEGER NOT NULL,
    FOREIGN KEY(idColaborador) REFERENCES colaborador(idColaborador),
	FOREIGN KEY(idFerramenta) REFERENCES ferramenta(idFerramenta)
);

CREATE TABLE ferramenta(
	idFerramenta INTEGER PRIMARY KEY AUTO_INCREMENT,
    nomeFerramenta VARCHAR(30) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    quantidade INTEGER NOT NULL,
    descricao VARCHAR(140) NOT NULL
);