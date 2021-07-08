CREATE OR REPLACE FUNCTION func_somar (INTEGER, INTEGER)
RETURNS INTEGER
SECURITY DEFINER
-- RETURNS NULL ON NULL INPUT
CALLED ON NULL INPUT
LANGUAGE SQL
AS $$
	SELECT COALESCE($1,0) + COALESCE($2,0); -- COALESCE mostra o primeiro valor não nulo que ele encontrar
$$;

SELECT func_somar (1, NULL);

SELECT COALESCE (NULL, NULL, 'digital', 'daniel');

------------------------------------------------------

CREATE OR REPLACE FUNCTION bancos_add(p_numero INTEGER, p_nome VARCHAR, p_ativo BOOLEAN)
RETURNS INTEGER
SECURITY INVOKER
LANGUAGE PLPGSQL
CALLED ON NULL INPUT
AS $$
DECLARE variavel_id INTEGER;
BEGIN
	IF p_numero IS NULL OR p_nome IS NULL OR p_ativo IS NULL THEN -- Verifica se qualquer um dos dados inseridos é nulo, se for, retorna 0
		RETURN 0;
	END IF;
	-- Se nenhum dos dados forem nulos
	SELECT INTO variavel_id numero -- Busca se o numero do banco informado já existe na tabela
	FROM banco
	WHERE numero = p_numero;
	
	IF variavel_id IS NULL THEN -- Se não existir, fara a inserção dos novos dados na tabela
		INSERT INTO banco(numero, nome, ativo)
		VALUES (p_numero, p_nome, p_ativo);
	ELSE -- Senão, retornará a id do dado na tabela
		RETURN variavel_id;
	END IF;
	-- Tendo os dados sido inseridos corretamente
	SELECT INTO variavel_id numero -- Busca a id dos novos dados inseridos
	FROM banco
	WHERE numero = p_numero;	
	
	RETURN variavel_id; -- E retorna a id dos dados novos
END; $$;

SELECT bancos_add(5433, 'Banco novo em outra porta', true);

SELECT numero, nome, ativo FROM banco WHERE numero = 5433;