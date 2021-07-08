SELECT numero, nome, ativo FROM banco ORDER BY numero;

UPDATE banco SET ativo = FALSE WHERE numero = 0;

BEGIN;
	UPDATE banco SET ativo = TRUE WHERE numero = 0;
ROLLBACK;


BEGIN;
	UPDATE banco SET ativo = TRUE WHERE numero = 0;
COMMIT;

SELECT id, gerente, nome
FROM funcionarios;

BEGIN; -- Começando uma transação
	UPDATE funcionarios SET gerente = 2 WHERE id = 3;
SAVEPOINT sf_func; -- Ponto de retorno
	UPDATE funcionarios SET gerente = NULL;
ROLLBACK TO sf_func; -- Retornando a tabela ao estado antes do ponto de retorno
	UPDATE funcionarios SET gerente = 3 WHERE id = 5;
COMMIT; -- Transação completa
