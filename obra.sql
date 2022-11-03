
CREATE DATABASE obra;
USE obra;

CREATE TABLE obra(
	idObra INTEGER PRIMARY KEY AUTO_INCREMENT,
    nomeObra VARCHAR(30) NOT NULL,
    orcamentoObra DECIMAL(10, 2) NOT NULL,
    prazoObra DATE NOT NULL
);

INSERT INTO obra(nomeObra, orcamentoObra, prazoObra) VALUES ("Ed. Matriz SoulCode", "5000000.0", "2023-12-10");

CREATE TABLE engenheiro(
	idEngenheiro INTEGER PRIMARY KEY AUTO_INCREMENT,
    nomeEngenheiro VARCHAR(30) NOT NULL,
    idadeEngenheiro INTEGER NOT NULL,
    email VARCHAR(30) UNIQUE NOT NULL,
    salario DECIMAL(10, 2) NOT NULL,
    idObra INTEGER NOT NULL,
    FOREIGN KEY(idObra) REFERENCES obra(idObra)
);

INSERT INTO engenheiro(nomeEngnheiro, idadeEngenheiro, email, salario, idObra) VALUES ("Mitchel Inoue", "33", "mitchel.inoue@soulcodeacademy.com.br", 8000.0, 1);

CREATE TABLE setor(
	idSetor INTEGER PRIMARY KEY AUTO_INCREMENT,
    nomeSetor VARCHAR(30) NOT NULL,
    orcamentoSetor DECIMAL(10, 2) NOT NULL,
    prazoSetor DATE NOT NULL,
    idObra INTEGER NOT NULL,
    FOREIGN KEY(idObra) REFERENCES obra(idObra)
);

INSERT INTO setor VALUES (NULL, "Serviço Civil", 450000.0, "2023-07-23", 1);
INSERT INTO setor VALUES (NULL, "Serviço Instalacoes", 1000000.0, "2023-10-15", 1);
INSERT INTO setor VALUES (NULL, "Serviço Acabamentos", 780000.0, "2023-11-20", 1);

CREATE TABLE colaborador(
	idColaborador INTEGER PRIMARY KEY AUTO_INCREMENT,
    nomeColaborador VARCHAR(30) NOT NULL,
    salarioColaborador DECIMAL(10, 2) NOT NULL,
    dataNasc DATE NOT NULL,
    idSetor INTEGER NOT NULL,
    FOREIGN KEY(idSetor) REFERENCES setor(idSetor)
);

INSERT INTO colaborador VALUES (NULL, "João Silva", 2500.0, "1983-07-10", 1);
INSERT INTO colaborador VALUES (NULL, "Carlos Moura", 2750.0, "1975-04-08", 2);
INSERT INTO colaborador VALUES (NULL, "Ronaldo Teixeira", 3050.0, "1989-11-26", 2);
INSERT INTO colaborador VALUES (NULL, "Manoel Carvalho", 2650.0, "1991-02-13", 3);
INSERT INTO colaborador VALUES (NULL, "Thiago Rocha", 3100.0, "1986-06-19", 1);

SELECT * FROM colaborador;
SELECT nome, salario FROM colaborador;

UPDATE colaborador
SET salario = 3000.0, idSetor = 2
where idColaborador = 1; 

DELETE FROM colaborador
WHERE idColaborador = 4;

CREATE TABLE ferramenta(
	idFerramenta INTEGER PRIMARY KEY AUTO_INCREMENT,
    nomeFerramenta VARCHAR(30) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    quantidade INTEGER NOT NULL,
    descricao VARCHAR(140) NOT NULL
);

INSERT INTO ferramenta VALUES (NULL, "Martelo", 50.0, "1", "Ferramenta para carpintaria");
INSERT INTO ferramenta VALUES (NULL, "Fio", 100.0, "100", "Fio para instalações elétricas");
INSERT INTO ferramenta VALUES (NULL, "Pincél", 38.5, "5", "Ferramenta para pintura");
INSERT INTO ferramenta VALUES (NULL, "Martelete", 550.0, "3", "Ferramenta para demolição");

SELECT * FROM ferramenta;
SELECT * FROM ferramenta ORDER BY preco;

CREATE TABLE colaborador_ferramenta(
	idColaborador_ferramenta INTEGER PRIMARY KEY AUTO_INCREMENT,
    idColaborador INTEGER NOT NULL,
    idFerramenta INTEGER NOT NULL,
    FOREIGN KEY(idColaborador) REFERENCES colaborador(idColaborador),
	FOREIGN KEY(idFerramenta) REFERENCES ferramenta(idFerramenta)
);

INSERT INTO colaborador_ferramenta VALUES (NULL, 1, 3);
INSERT INTO colaborador_ferramenta VALUES (NULL, 2, 5);
INSERT INTO colaborador_ferramenta VALUES (NULL, 4, 2);

DELETE FROM colaborador_ferramenta
WHERE idColaborador_ferramenta = 1;

SELECT nomeColaborador, salarioColaborador
FROM colaborador_ferramenta
	INNER JOIN colaborador
    ON colaborador_ferramenta.idColaborador = colaborador.idColaborador
    INNER JOIN ferramenta
    ON colaborador_ferramenta.idFerramenta = ferramenta.idFerramenta
WHERE nomeFerramenta = "Martelo";


