-- Use a tabela de contas para localizar o nome da conta, o poc principal e o ID do representante de vendas de todas as lojas, exceto Walmart, Target e Nordstrom.

SELECT name,primary_poc,sales_rep_id FROM accounts WHERE name NOT IN ('Walmart','Target','Nordstrom')

-- Use a tabela web_events para encontrar todas as informações sobre indivíduos que foram contatados por qualquer método, exceto usando organic ou adwords Métodos.

SELECT * FROM web_events WHERE channel NOT IN ('organic','adwords')

-- Todas as empresas cujos nomes não começam com 'C'.
SELECT * FROM accounts WHERE name NOT LIKE 'C%'

-- Todas as empresas cujos nomes não contêm a cadeia de caracteres 'um' em algum lugar do nome.
SELECT * FROM accounts WHERE name NOT LIKE '%one%'

-- Todas as empresas cujos nomes não terminam com 's'.
SELECT * FROM accounts WHERE name NOT LIKE '%s'