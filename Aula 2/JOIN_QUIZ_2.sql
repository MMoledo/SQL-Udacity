-- Fornecer uma tabela para todos os web_events associados ao nome da conta de Walmart. Deve haver três colunas. Certifique-se de incluir o primary_poc, hora do evento e o channel para cada evento. Além disso, você pode optar por adicionar uma quarta coluna para garantir apenas Walmart eventos foram escolhidos.

SELECT a.id, a.primary_poc,w.occurred_at,a.name FROM accounts a JOIN web_events w ON w.account_id = a.id WHERE a.name = 'Walmart'

-- Forneça uma tabela que forneça a região de cada sales_rep juntamente com suas contas associadas. A tabela final deve incluir três colunas: o nome da região, o nome do representante de vendas e o nome da conta. Classifique as contas em ordem alfabética (A-Z) de acordo com o nome da conta.

SELECT r.name, s.name, a.name FROM sales_reps s JOIN region r ON s.region_id = r.id JOIN accounts a ON a.sales_rep_id = s.id ORDER BY a.name

SELECT r.name AS region_name, s.name AS reps_name ,a.name AS account_name FROM sales_reps s JOIN accounts a ON a.sales_rep_id = s.id JOIN region r ON r.id = s.region_id ORDER BY a.name

-- Provide the name for each region for every order, as well as the account name and the unit price they paid (total_amt_usd/total) for the order. Your final table should have 3 columns: region name, account name, and unit price. A few accounts have 0 for total, so I divided by (total + 0.01) to assure not dividing by zero.

SELECT r.name AS region_name, a.name AS account_name, o.total_amt_usd/(o.total + 0.01) AS unit_price FROM orders o JOIN accounts a ON o.account_id = a.id JOIN sales_reps s ON a.sales_rep_id = s.id JOIN region r ON s.region_id = r.id

SELECT r.name AS region_name, a.name AS account_name, o.total_amt_usd/(o.total+0.01) AS price_unity FROM accounts a JOIN orders o ON a.id = o.account_id JOIN sales_reps s ON s.id = a.sales_rep_id JOIN region r ON r.id = s.region_id
