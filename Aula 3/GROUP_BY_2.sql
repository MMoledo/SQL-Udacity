-- Para cada conta, determine a quantidade média de cada tipo de papel que eles compraram em seus pedidos. Seu resultado deve ter quatro colunas - uma para o nome da conta e outra para a quantidade média comprada para cada um dos tipos de papel para cada conta.

SELECT a.name, AVG(standard_qty) avg_standard_qty, AVG(gloss_qty) avg_gloss_qty, AVG(poster_qty) avg_poster_qty FROM accounts a JOIN orders o ON a.id = o.account_id GROUP BY a.name

-- Para cada conta, determine o valor médio gasto por pedido em cada tipo de papel. Seu resultado deve ter quatro colunas - uma para o nome da conta e outra para o valor médio gasto em cada tipo de papel.

SELECT a.name, AVG(standard_amt_usd) avg_standard_amt_usd, AVG(gloss_amt_usd) avg_gloss_amt_usd, AVG(poster_amt_usd) avg_poster_amt_usd FROM accounts a JOIN orders o ON a.id = o.account_id GROUP BY a.name

-- Determine o número de vezes que um determinado canal foi usado na tabela web_events para cada representante de vendas. Sua tabela final deve ter três colunas - o nome do representante de vendas, o canal e o número de ocorrências. Encomende primeiro a tabela com o maior número de ocorrências.

SELECT s.name, w.channel, COUNT(w.channel) FROM sales_reps s JOIN accounts a ON s.id = a.sales_rep_id JOIN web_events w ON a.id = w.account_id GROUP BY s.name, w.channel ORDER BY s.name,COUNT(w.channel)

-- Determine o número de vezes que um determinado canal foi usado na tabela web_events para cada representante de vendas. Sua tabela final deve ter três colunas - o nome do representante de vendas, o canal e o número de ocorrências. Encomende primeiro a tabela com o maior número de ocorrências.

SELECT s.name, w.channel, COUNT(w.channel) FROM sales_reps s JOIN accounts a ON s.id = a.sales_rep_id JOIN web_events w ON a.id = w.account_id GROUP BY s.name, w.channel ORDER BY s.name,COUNT(w.channel)

-- Determine o número de vezes que um determinado canal foi usado na tabela web_events para cada região. Sua tabela final deve ter três colunas - o nome da região, o canal e o número de ocorrências. Encomende primeiro a tabela com o maior número de ocorrências.

SELECT r.name,w.channel,COUNT(w.channel) FROM sales_reps s JOIN region r ON r.id = s.region_id JOIN accounts a ON a.sales_rep_id = s.id JOIN web_events w ON w.account_id = a.id GROUP BY r.name,w.channel ORDER BY r.name,w.channel

