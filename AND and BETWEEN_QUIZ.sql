-- Write a query that returns all the orders where the standard_qty is over 1000, the poster_qty is 0, and the gloss_qty is 0

SELECT * FROM orders WHERE standard_qty > 1000 and poster_qty = 0 and gloss_qty = 0

-- Usando a tabela de contas, encontre todas as empresas cujos nomes não começam com 'C' e terminam com 's'.
SELECT * FROM accounts WHERE name NOT LIKE 'C%' AND name LIKE '%s'

-- Quando você usa o operador BETWEEN no SQL, os resultados incluem os valores de seus pontos de extremidade ou não? Descubra a resposta para essa pergunta importante escrevendo uma consulta que exibe a data do pedido e gloss_qty dados para todas as encomendas em que gloss_qty é entre 24 e 29. Em seguida, observe sua saída para ver se o operador BETWEEN incluiu os valores inicial e final ou não.

SELECT occurred_at, gloss_qty FROM orders WHERE gloss_qty BETWEEN 24 AND 29

-- Use a tabela web_events para encontrar todas as informações sobre indivíduos que foram contatados através do organic ou adwords E iniciou sua conta em 2016, classificada do mais novo para o mais antigo.

SELECT * FROM web_events WHERE channel IN('organic','adwords') AND occurred_at >= '2016-01-01' ORDER BY occurred_at DESC

