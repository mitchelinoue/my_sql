-- DESAFIO 2: Criar uma tabela projeto (nome, prazo, orcamento, descricao). N:N (Gera uma tabela relacionamento)

USE empresa;

SELECT * FROM empregados;

CREATE TABLE projeto(
	idProjeto INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    prazo DATE NOT NULL,
    orcamento DECIMAL(10, 2) NOT NULL, 
    descricao VARCHAR(140) NOT NULL
);

INSERT INTO projeto VALUES (NULL, "Goodpay", "2023-05-11", 5500, "Plataforma financeira e educacional feita em JS");
INSERT INTO projeto (nome, prazo, descricao, orcamento) VALUES("Helpr", "2022-12-16", "É uma plataforma estilo Helpdesk", 10000.0);
INSERT INTO projeto (nome, descricao, prazo, orcamento) VALUES ("Shopin", "É uma plataforma de e-commerce", "2023-01-01", 20000.0);


SELECT * FROM projeto;
SELECT * FROM empregado;


-- join table / tabela relacionamento (quando temos N:N)
CREATE TABLE rel_empregado_projeto(  
	idRelacionamento INTEGER PRIMARY KEY AUTO_INCREMENT,
    idEmpregado INTEGER NOT NULL, -- chave estrangeira da tabelaempregado
    idProjeto INTEGER NOT NULL, -- chave estrangeira da tablea de projeto
    FOREIGN KEY (idEmpregado) REFERENCES empregado(idEmpregado),
    FOREIGN KEY (idProjeto) REFERENCES projeto(idProjeto)
);

-- como associar as entidades?

-- carlos josé(1) = goodpay(1) e shopin(3)
INSERT INTO rel_empregado_projeto VALUES (NULL, 1, 1); -- carlos trabalha no goodpay
INSERT INTO rel_empregado_projeto VALUES (NULL, 1, 3); -- carlos trabalha no shopin


 -- joão paulo(2) = helpr(2) e shopin(3)
INSERT INTO rel_empregado_projeto VALUES (NULL, 2, 2); -- joão trabalha no helpr
INSERT INTO rel_empregado_projeto VALUES (NULL, 2, 3); -- joão trabalha no shopin

 -- andré vieria(3) = goodpay(1), helpr(2) e shopin(3)
INSERT INTO rel_empregado_projeto VALUES (NULL, 3, 1); -- andré trabalha no goodpay
INSERT INTO rel_empregado_projeto VALUES (NULL, 3, 2); -- andré trabalha no helpr
INSERT INTO rel_empregado_projeto VALUES (NULL, 3, 3); -- andré trabalha no shopin


SELECT * FROM rel_empregado_projeto; -- guarda apenas os relacionamentos

-- join nas 3 tabelas

SELECT empregado.nome, projeto.nome AS projetoNome, email, salario, prazo, orcamento
FROM rel_empregado_projeto
	INNER JOIN empregado
    ON rel_empregado_projeto.idEmpregado = empregado.idEmpregado
    INNER JOIN projeto
    ON rel_empregado_projeto.idProjeto = projeto.idProjeto
WHERE projeto.nome = "Goodpay"; -- lista os empregados envilvidos no projeto goodpay

SELECT empregado.nome, projeto.nome
FROM rel_empregado_projeto
	INNER JOIN empregado
    ON rel_empregado_projeto.idEmpregado = empregado.idEmpregado
    INNER JOIN projeto
    ON rel_empregado_projeto.idProjeto = projeto.idProjeto
WHERE empregado.nome = "Carlos José";









