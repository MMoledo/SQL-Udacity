-- Encontre as vendas em termos de dólares totais para todos os pedidos em cada um year, ordenado do maior para o menor. Você percebe alguma tendência nos totais anuais de vendas?

SELECT DATE_PART('year', occurred_at) ord_year,  SUM(total_amt_usd) total_spent
FROM orders
GROUP BY 1
ORDER BY 2 DESC;

-- Qual mês Parch & Posey teve as maiores vendas em termos de dólares totais? Todos os meses são representados uniformemente pelo conjunto de dados?

SELECT DATE_PART('month', occurred_at) ord_month, SUM(total_amt_usd) total_spent
FROM orders
WHERE occurred_at BETWEEN '2014-01-01' AND '2017-01-01'
GROUP BY 1
ORDER BY 2 DESC; 

-- Em que ano a Parch & Posey teve as maiores vendas em termos de número total de pedidos? Todos os anos são representados uniformemente pelo conjunto de dados?

SELECT DATE_PART('year', occurred_at) ord_year,  COUNT(*) total_sales
FROM orders
GROUP BY 1
ORDER BY 2 DESC;

-- 4. Em que mês a Parch & Posey teve as maiores vendas em termos de número total de pedidos? Todos os meses são representados uniformemente pelo conjunto de dados?

SELECT DATE_PART('month', occurred_at) ord_month, COUNT(*) total_sales
FROM orders
WHERE occurred_at BETWEEN '2014-01-01' AND '2017-01-01'
GROUP BY 1
ORDER BY 2 DESC; 

-- 5. Em que mês de que ano Walmart gastar mais em papel brilhante em termos de dólares?

SELECT DATE_TRUNC('month', o.occurred_at) ord_date, SUM(o.gloss_amt_usd) tot_spent
FROM orders o 
JOIN accounts a
ON a.id = o.account_id
WHERE a.name = 'Walmart'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;

