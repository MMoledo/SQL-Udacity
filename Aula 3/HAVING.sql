-- Quantos dos representantes de vendas têm mais de 5 contas que gerenciam?

SELECT s.name, COUNT(a.id) FROM sales_reps s JOIN accounts a ON s.id = a.sales_rep_id GROUP BY s.name HAVING COUNT(a.id) > 5

-- Quantas contas têm mais de 20 pedidos?

SELECT a.name, COUNT(o.id) FROM accounts a JOIN orders o ON a.id = o.account_id GROUP BY a.name HAVING COUNT(o.id) > 20
SELECT o.account_id,COUNT(o.account_id) FROM orders o GROUP BY o.account_id HAVING COUNT(o.account_id) > 20 

-- Qual conta tem mais pedidos?

SELECT a.name, COUNT(o.id) FROM accounts a JOIN orders o ON a.id = o.account_id GROUP BY a.name ORDER BY COUNT(o.id) DESC LIMIT 1
SELECT o.account_id,COUNT(o.account_id) FROM orders o GROUP BY o.account_id ORDER BY COUNT(o.account_id) DESC LIMIT 1

-- Which accounts spent more than 30,000 usd total across all orders?

SELECT a.name, SUM(o.total_amt_usd) FROM accounts a JOIN orders o ON a.id = o.account_id GROUP BY a.name HAVING SUM(o.total_amt_usd) > 30000
SELECT o.account_id,SUM(o.total_amt_usd) FROM orders o GROUP BY o.account_id HAVING SUM(o.total_amt_usd) > 30000

-- Which accounts spent less than 1,000 usd total across all orders?

SELECT a.name, SUM(o.total_amt_usd) FROM accounts a JOIN orders o ON a.id = o.account_id GROUP BY a.name HAVING SUM(o.total_amt_usd) < 1000

-- Which account has spent the most with us?

SELECT a.name, SUM(o.total_amt_usd) FROM accounts a JOIN orders o ON a.id = o.account_id GROUP BY a.name ORDER BY SUM(o.total_amt_usd) DESC LIMIT 1

-- Which account has spent the least with us?

SELECT a.name, SUM(o.total_amt_usd) FROM accounts a JOIN orders o ON a.id = o.account_id GROUP BY a.name ORDER BY SUM(o.total_amt_usd) LIMIT 1

-- Which accounts used facebook as a channel to contact customers more than 6 times?

SELECT a.name, COUNT(w.channel) FROM accounts a JOIN web_events w ON a.id = w.account_id GROUP BY a.name, w.channel HAVING w.channel = 'facebook' AND COUNT(w.channel) > 6

-- Which account used facebook most as a channel?

SELECT a.name, COUNT(w.channel) FROM accounts a JOIN web_events w ON a.id = w.account_id GROUP BY a.name, w.channel HAVING w.channel = 'facebook' ORDER BY COUNT(w.channel) DESC LIMIT 1

-- Which channel was most frequently used by most accounts?

SELECT a.name, w.channel, COUNT(w.channel) FROM accounts a JOIN web_events w ON a.id = w.account_id GROUP BY a.name, w.channel ORDER BY COUNT(w.channel) DESC LIMIT 1