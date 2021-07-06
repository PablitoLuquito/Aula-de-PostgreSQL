CREATE TABLE IF NOT EXISTS funcionarios ( -- Criação da tabela funcionarios
	id SERIAL,
	nome VARCHAR (50),
	gerente INTEGER,
	PRIMARY KEY (id),
	FOREIGN KEY (gerente) REFERENCES funcionarios (id)
);

-- Inserção de dados na tabela
INSERT INTO funcionarios (nome, gerente) VALUES ('Ancelmo', NULL);
INSERT INTO funcionarios (nome, gerente) VALUES ('Beatriz', 1);
INSERT INTO funcionarios (nome, gerente) VALUES ('Magno', 1);
INSERT INTO funcionarios (nome, gerente) VALUES ('Cremilda', 2);
INSERT INTO funcionarios (nome, gerente) VALUES ('Wagner', 4);

SELECT * FROM funcionarios WHERE gerente IS NULL
UNION ALL
SELECT id, nome, gerente FROM funcionarios WHERE id = 999; -- APENAS PARA EXEMPLIFICAR

CREATE OR REPLACE RECURSIVE VIEW vw_func(id, gerente, funcionario) AS ( -- Criação de VIEW recursiva
	SELECT id, gerente, nome
	FROM funcionarios
	WHERE gerente IS NULL
	
	UNION ALL
	
	SELECT funcionarios.id, funcionarios.gerente, funcionarios.nome
	FROM funcionarios
	JOIN vw_func ON vw_func.id = funcionarios.gerente
);

-- A VIEW vai fazer um loop chamando si própria até que todos os resultados possíveis se esgotem

SELECT *
FROM vw_func;

DROP VIEW vw_func;

-- Desafio: fazer com que a VIEW mostre os nomes de cada gerente ao invés dos ids

CREATE OR REPLACE RECURSIVE VIEW vw_func (id, gerente, funcionario) AS (
	SELECT id, CAST('' AS VARCHAR) AS gerente, nome -- O comando CAST converte o tipo de dado da coluna gerente de INTEGER para VARCHAR  
	FROM funcionarios
	WHERE gerente IS NULL
	UNION ALL
	SELECT funcionarios.id, gerentes.nome, funcionarios.nome
	FROM funcionarios
	JOIN vw_func ON vw_func.id = funcionarios.gerente
	JOIN funcionarios gerentes ON gerentes.id = vw_func.id  
);

-- Vai ler o número que se encontra na coluna de gerente e relacionar com os ids de funcionários da tabela
-- trocando o valor numérico da coluna de gerente, pelo nome que corresponde ao id de funcionário

SELECT *
FROM vw_func;