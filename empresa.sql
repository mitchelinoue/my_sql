-- AULA MYSQL INICIAL 24.10
-- 	Comandos básicos no Workbench
-- Para o SQL tanto faz caixa baixa ou CAIXA ALTA

SHOW DATABASES; -- Lista os bancos de dados existentes no seu computador

CREATE DATABASE empresa; -- Cria um banco de dados com o nome especificar

USE empresa; -- Seleciona o banco empresa para aplicar os comendos SQL

DROP DATABASE empresa; -- Apaga o seu banco de dados(JÁ ERA TUDO APAGA)

SHOW TABLES; -- Listar todas as tabelas presentes no banco da empresa

-- CRIANDO TABELAS NO BANCO DE DADOS
-- DEPARTAMENTO: idDepartamento (numerico), nome (texto), salarioMax(numerico)

CREATE TABLE Departamento(
	idDepartamento INTEGER PRIMARY KEY AUTO_INCREMENT, -- CHAVE PRIMÁRIA Identifica unicamente um registro da tabela
    nome VARCHAR(30) NOT NULL, -- VARCHAR(LIMITE): TEXTO VARIAVEL, NOT NULL == obrigatório 
    salarioMax DECIMAL(10, 2) NOT NULL -- DECIMAL(digitos, precisão)
);

DESC departamento; -- Detalhar a ESTRUTURA tabela

DROP TABLE departamento; -- remove a tabela (apaga tudo)

-- Tabela Empregado
-- CHAVE ESTRANGEIRA = é UMA CHAVE QUE SE REFERE A CHAVE PRIMÁRIA DE OUTRA TABELA
CREATE TABLE empregado(
idEmpregado INTEGER PRIMARY KEY AUTO_INCREMENT, -- o banco preenche automaticamente para o id - auto-increment
nome VARCHAR(30) NOT NULL, -- trona nome obrigatório
email VARCHAR(30) UNIQUE NOT NULL, -- email não pode ser repetido na tabela - UNIQUE
dataNasc DATE NOT NULL, -- "1999-02-01
salario DECIMAL(10, 2) NOT NULL, -- 10= TOTAL DE DIGITOS, 2 = PRECISÃO EM DIGITOS (APÓS)
idDepartamento INTEGER NOT NULL, -- Campo para guardar a chave do departamento
FOREIGN KEY(idDepartamento) REFERENCES departamento(idDepartamento) -- Oficializa o relacionamento entre departamento - empregado
); -- O BANCO ESTÁ CIENTE DESSA RELAÇÃO ENTRE AS DUAS TABELAS 

CREATE TABLE dependente(
idDependente INTEGER PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(30) NOT NULL,
dataNasc DATE NOT NULL,
idResponsavel INTEGER NOT NULL, -- idEmpregado
FOREIGN KEY(idResponsavel) REFERENCES empregado(idEmpregado) -- Torna o banco ciente do relacionamento
);

-- Inserir dados
-- NULL na chave primária => o banco irá preencher automaticamente
INSERT INTO departamento VALUES (NULL, "Recursos Humanos", 5500.0); -- SEGUE A ORDEM DAS COLUNAS
INSERT INTO departamento VALUES (NULL, "TI", 6900.0);
INSERT INTO departamento VALUES (NULL, "Suporte", 6000.0);

SELECT * FROM departamento; -- Listar os dados da tabela

INSERT INTO empregado VALUES(NULL, "Carlos José", "carlos.jose@gmail.com", "1993-04-03", 3500.0, 1);
INSERT INTO empregado VALUES(NULL, "João Paulo", "joaopaulo@gmail.com", "1998-02-03", 4500.0, 2);
INSERT INTO empregado VALUES(NULL, "André Vieira", "andrevieira@gmail.com", "1978-01-03", 6500.0, 3);
SELECT * FROM empregado; -- Listar os dados da tabela

-- NESSA FORMA INDICA QUAIS COLUNAS SERÃO PREENCHIDAS
INSERT INTO dependente(nome, dataNasc, idResponsavel) VALUES ("Carlin Jr.", "2010-05-01", 1);
INSERT INTO dependente(nome, dataNasc, idResponsavel) VALUES ("Maria Carla", "2015-03-02", 2);
INSERT INTO dependente(nome, dataNasc, idResponsavel) VALUES ("Pedro Antônio", "2013-02-03", 3);
INSERT INTO dependente(nome, dataNasc, idResponsavel) VALUES ("André Jr.", "2012-02-02", 1);
SELECT * FROM dependente;



-- atualizar registros
UPDATE empregado SET salario = 5000.0; -- todos os empregados receberiam salario = 5000 (perigo!)

UPDATE empregado 
SET salario = 5000.0 
WHERE idEmpregado = 1; -- muda o salario do empregado 1

UPDATE empregado
SET nome= "João Paulo Marques", salario = 5500.0, idDepartamento = 1
where idEmpregado = 2; -- mudo nome, salario, departamento do empregado 2

UPDATE departamento
SET salarioMax = 9000
WHERE idDepartamento = 2; -- muda salario maximo do departamento 2

UPDATE dependente
SET idResponsavel = 2
WHERE idDependente = 3; -- muda responsavel do dependente 3

SELECT* FROM empregado;
SELECT* FROM departamento;
SELECT* FROM dependente;



-- deletar registros
DELETE FROM dependente; -- limpar os registrs da tabela

DELETE FROM dependente
WHERE idDependente = 4;

DELETE FROM departamento
WHERE idDepartamento = 3; -- não funciona se existirem empregados associados ao departamento

-- QUANDO USAR UPDATE E DELETE, SEMPRE LEMBRE DE USAR WHERE
-- create table (PK = primary key, FK = foreign key); insert into, update; delete; select;

-- DESAFIO 1: Criar uma tabela endereco (uf, cidade, cep, rua, numero) que esta relacionada ao empregado (1:1)

CREATE TABLE endereco(
	idEndereco INTEGER PRIMARY KEY AUTO_INCREMENT,
	uf CHAR(2) NOT NULL,
	cidade VARCHAR(30) NOT NULL,
	cep VARCHAR(30) NOT NULL,
	rua VARCHAR(30) NOT NULL,
	numero VARCHAR(15) NOT NULL,
    FOREIGN KEY (idEmpregado) REFERENCES empregado(idEmpregado)
);

-- DESAFIO 2: Criar uma tabela projeto (nome, prazo, orcamento, descricao). N:N (Gera uma tabela relacionamento)
-- vide arquivo empresa-tabela-projeto














