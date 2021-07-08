SELECT numero, nome, ativo
FROM banco;

CREATE OR REPLACE VIEW vw_bancos AS( -- Criando uma VIEW sem informar os campos
	SELECT numero, nome, ativo
	FROM banco
);

SELECT numero, nome, ativo
FROM vw_bancos;

CREATE OR REPLACE VIEW vw_bancos_2 (banco_numero, banco_nome, banco_ativo) AS( -- Criando uma VIEW com os campos informados
	SELECT numero, nome, ativo
	FROM banco
);

SELECT banco_numero, banco_nome, banco_ativo
FROM vw_bancos_2;

INSERT INTO vw_bancos_2 (banco_numero, banco_nome, banco_ativo) -- Inserindo valores na tabela utilizando VIEW
VALUES (51, 'Banco Boa Idéia', TRUE);

SELECT banco_numero, banco_nome, banco_ativo 
FROM vw_bancos_2
WHERE banco_numero = 51;

UPDATE vw_bancos_2 SET banco_ativo = FALSE WHERE banco_numero = 51; -- Fazendo UPDATE no valor da tabela utilizando VIEW

DELETE FROM vw_bancos_2 WHERE banco_numero = 51; -- Deletando valores da tabela utilizando VIEW


CREATE OR REPLACE TEMPORARY VIEW vw_agencia AS ( -- Criação de uma VIEW temporária
	SELECT nome FROM agencia
);

SELECT nome FROM vw_agencia;

-- Testes com WITH LOCAL CHECK & WITH CASCADED CHECK OPTIONs 
CREATE OR REPLACE VIEW vw_bancos_ativos AS ( -- VIEW para verificação de bancos ativos
	SELECT numero, nome, ativo
	FROM banco
	WHERE ativo IS TRUE
); -- WITH LOCAL CHECK OPTION;

INSERT INTO vw_bancos_ativos (numero, nome, ativo) VALUES (51, 'Banco Boa Idéia', FALSE); 
--ERRO pois a inserção de valores contem o ativo como FALSE

CREATE OR REPLACE VIEW vw_bancos_com_a AS ( -- VIEW para verificação de bancos que começem com a letra A
	SELECT numero, nome, ativo
	FROM vw_bancos_ativos
	WHERE nome ILIKE 'a%'
) WITH CASCADED CHECK OPTION; -- WITH LOCAL CHECK OPTION;

SELECT numero, nome, ativo FROM vw_bancos_com_a;

INSERT INTO vw_bancos_com_a (numero, nome, ativo) VALUES (333, 'Alfa Omega', TRUE); 
--OK pois o nome começa com A e se encontra como ativo
INSERT INTO vw_bancos_com_a (numero, nome, ativo) VALUES (331, 'Alfa Gama', FALSE); 
--ERRO pois o banco não se encontra ativo
INSERT INTO vw_bancos_com_a (numero, nome, ativo) VALUES (332, 'Alfa Gama Beta', FALSE); 
-- OK sem o WITH LOCAL do vw_bancos_ativos e ERRO com o WITH CASCADED do vw_bancos_com_a

DELETE FROM banco WHERE numero = 332;
