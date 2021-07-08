SELECT * FROM information_schema.columns WHERE table_name = 'banco'; -- Utilização de View para visualizar todas as informações das colunas da tabela banco
SELECT column_name FROM information_schema.columns WHERE table_name = 'banco'; -- Utilização de View para visualizar o nome das colunas da tabela banco

SELECT valor FROM cliente_transacoes; -- Mostra os dados da coluna valor da tabela cliente_transacoes

SELECT AVG(valor) FROM cliente_transacoes; -- Média de todos os valores da coluna valor

SELECT COUNT(numero) -- Contagem dos valores da coluna numero da tabela cliente
FROM cliente;

SELECT COUNT(numero), email
FROM cliente
WHERE email ILIKE '%gmail.com' -- Contagem dos dados da coluna email que terminarem com 'gmail.com'
GROUP BY email; -- Agrupa as linhas em uma tabela que tiverem o mesmo valor em todas as colunas listadas

SELECT MAX(numero) -- Maior valor da coluna numero da tabela cliente
FROM cliente;

SELECT MIN(numero) -- Menor valor da coluna numero da tabela cliente
FROM cliente;

SELECT MAX(valor)
FROM cliente_transacoes;

SELECT MIN(valor)
FROM cliente_transacoes;

SELECT MAX(valor), tipo_transacao_id
FROM cliente_transacoes
GROUP BY tipo_transacao_id;

SELECT MIN(valor), tipo_transacao_id
FROM cliente_transacoes
GROUP BY tipo_transacao_id;

SELECT COUNT(id), tipo_transacao_id
FROM cliente_transacoes
GROUP BY tipo_transacao_id
HAVING COUNT(id) > 150; -- Contagem a partir dos valores maiores que 150

SELECT SUM(valor) -- Soma dos valores da coluna valor da tabela cliente_transacoes
FROM cliente_transacoes;

SELECT SUM(valor), tipo_transacao_id
FROM cliente_transacoes
GROUP BY tipo_transacao_id;

SELECT SUM(valor), tipo_transacao_id
FROM cliente_transacoes
GROUP BY tipo_transacao_id
ORDER BY tipo_transacao_id ASC; -- Ordenado de forma Crescente

SELECT SUM(valor), tipo_transacao_id
FROM cliente_transacoes
GROUP BY tipo_transacao_id
ORDER BY tipo_transacao_id DESC; -- Ordenado de forma Descendente