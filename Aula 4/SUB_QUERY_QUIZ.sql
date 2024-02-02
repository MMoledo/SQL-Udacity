-- Forneça o nome do sales_rep em cada região com a maior quantidade de total_amt_usd vendas.
-- 1 passo
SELECT s.name rep_name, r.name region_name, SUM(o.total_amt_usd) total_amt
FROM sales_reps s
JOIN accounts a
ON a.sales_rep_id = s.id
JOIN orders o
ON o.account_id = a.id
JOIN region r
ON r.id = s.region_id
GROUP BY 1,2
ORDER BY 3 DESC;

-- 2 passo
SELECT region_name, MAX(total_amt) total_amt
        FROM(SELECT s.name rep_name, r.name region_name, SUM(o.total_amt_usd) total_amt
                FROM sales_reps s
                JOIN accounts a
                ON a.sales_rep_id = s.id
                JOIN orders o
                ON o.account_id = a.id
                JOIN region r
                ON r.id = s.region_id
                GROUP BY 1, 2) t1
        GROUP BY 1;

-- 3 passo

SELECT t3.rep_name, t3.region_name, t3.total_amt
FROM(SELECT region_name, MAX(total_amt) total_amt
        FROM(SELECT s.name rep_name, r.name region_name, SUM(o.total_amt_usd) total_amt
                FROM sales_reps s
                JOIN accounts a
                ON a.sales_rep_id = s.id
                JOIN orders o
                ON o.account_id = a.id
                JOIN region r
                ON r.id = s.region_id
                GROUP BY 1, 2) t1
        GROUP BY 1) t2
JOIN (SELECT s.name rep_name, r.name region_name, SUM(o.total_amt_usd) total_amt
        FROM sales_reps s
        JOIN accounts a
        ON a.sales_rep_id = s.id
        JOIN orders o
        ON o.account_id = a.id
        JOIN region r
        ON r.id = s.region_id
        GROUP BY 1,2
        ORDER BY 3 DESC) t3
ON t3.region_name = t2.region_name AND t3.total_amt = t2.total_amt;

-- Minha resolucao:

SELECT t3.reg_name,t3.reps_name,t3.total
FROM(SELECT t1.reg_name,MAX(t1.total) max 
    FROM (SELECT s.name reps_name,r.name reg_name,SUM(o.total_amt_usd) total
            FROM sales_reps s 
            JOIN region r ON r.id = s.region_id
            JOIN accounts a ON a.sales_rep_id = s.id
            JOIN orders o ON a.id = o.account_id
            GROUP BY s.name,r.name
            ORDER BY 1,2) t1
            GROUP BY t1.reg_name) t2
JOIN (SELECT s.name reps_name,r.name reg_name,SUM(o.total_amt_usd) total
    FROM sales_reps s 
    JOIN region r ON r.id = s.region_id
    JOIN accounts a ON a.sales_rep_id = s.id
    JOIN orders o ON a.id = o.account_id
    GROUP BY s.name,r.name
    ORDER BY 1,2) t3
ON t2.reg_name = t3.reg_name AND t2.max = t3.total
ORDER BY 3 DESC

-- For the region with the largest sales total_amt_usd, how many total orders were placed?

-- 1 passo 
SELECT r.name region_name, SUM(o.total_amt_usd) total_amt
FROM sales_reps s
JOIN accounts a
ON a.sales_rep_id = s.id
JOIN orders o
ON o.account_id = a.id
JOIN region r
ON r.id = s.region_id
GROUP BY r.name;

-- 2 passo
SELECT MAX(total_amt)
FROM (SELECT r.name region_name, SUM(o.total_amt_usd) total_amt
                FROM sales_reps s
                JOIN accounts a
                ON a.sales_rep_id = s.id
                JOIN orders o
                ON o.account_id = a.id
                JOIN region r
                ON r.id = s.region_id
                GROUP BY r.name) sub;

-- 3 passo

SELECT r.name, COUNT(o.total) total_orders
FROM sales_reps s
JOIN accounts a
ON a.sales_rep_id = s.id
JOIN orders o
ON o.account_id = a.id
JOIN region r
ON r.id = s.region_id
GROUP BY r.name
HAVING SUM(o.total_amt_usd) = (
         SELECT MAX(total_amt)
         FROM (SELECT r.name region_name, SUM(o.total_amt_usd) total_amt
                 FROM sales_reps s
                 JOIN accounts a
                 ON a.sales_rep_id = s.id
                 JOIN orders o
                 ON o.account_id = a.id
                 JOIN region r
                 ON r.id = s.region_id
                 GROUP BY r.name) sub);

-- Minha resolucao:

SELECT r.name, COUNT(o.total) total_orders
FROM sales_reps s
JOIN accounts a
ON a.sales_rep_id = s.id
JOIN orders o
ON o.account_id = a.id
JOIN region r
ON r.id = s.region_id
GROUP BY r.name
HAVING r.name = (
SELECT r.name AS region_name
FROM sales_reps s
JOIN accounts a ON a.sales_rep_id = s.id
JOIN orders o ON o.account_id = a.id
JOIN region r ON r.id = s.region_id
GROUP BY r.name
ORDER BY SUM(o.total_amt_usd) DESC
LIMIT 1)

-- Quantas contas tiveram mais compras totais do que o nome da conta que comprou mais papel standard_qty ao longo de sua vida como cliente?
-- 1 passo

SELECT a.name account_name, SUM(o.standard_qty) total_std, SUM(o.total) total
FROM accounts a
JOIN orders o
ON o.account_id = a.id
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;

-- 2 passo
SELECT a.name
FROM orders o
JOIN accounts a
ON a.id = o.account_id
GROUP BY 1
HAVING SUM(o.total) > (SELECT total 
                      FROM (SELECT a.name act_name, SUM(o.standard_qty) tot_std, SUM(o.total) total
                            FROM accounts a
                            JOIN orders o
                            ON o.account_id = a.id
                            GROUP BY 1
                            ORDER BY 2 DESC
                            LIMIT 1) sub);

-- 3 passo 
SELECT COUNT(*)
FROM (SELECT a.name
          FROM orders o
          JOIN accounts a
          ON a.id = o.account_id
          GROUP BY 1
          HAVING SUM(o.total) > (SELECT total 
                      FROM (SELECT a.name act_name, SUM(o.standard_qty) tot_std, SUM(o.total) total
                            FROM accounts a
                            JOIN orders o
                            ON o.account_id = a.id
                            GROUP BY 1
                            ORDER BY 2 DESC
                            LIMIT 1) inner_tab)
                ) counter_tab;

-- Para o cliente que gastou mais (no total ao longo de sua vida como cliente) total_amt_usd, quantos web_events eles tinham para cada canal?

-- 1 passo
SELECT a.id, a.name, SUM(o.total_amt_usd) tot_spent
FROM orders o
JOIN accounts a
ON a.id = o.account_id
GROUP BY a.id, a.name
ORDER BY 3 DESC
LIMIT 1;

-- 2 passo

SELECT a.name, w.channel, COUNT(*)
FROM accounts a
JOIN web_events w
ON a.id = w.account_id AND a.id =  (SELECT id
                        FROM (SELECT a.id, a.name, SUM(o.total_amt_usd) tot_spent
                              FROM orders o
                              JOIN accounts a
                              ON a.id = o.account_id
                              GROUP BY a.id, a.name
                              ORDER BY 3 DESC
                              LIMIT 1) inner_table)
GROUP BY 1, 2
ORDER BY 3 DESC;

-- Minha resolucao:

SELECT a.name,w.channel,COUNT(w.channel) FROM web_events w
JOIN accounts a ON a.id = w.account_id AND
 w.account_id = (SELECT a.id FROM accounts a 
    JOIN orders o ON a.id = o.account_id 
    GROUP BY 1 
    ORDER BY SUM(o.total_amt_usd) DESC LIMIT 1)
GROUP BY 1,2
ORDER BY 1,2

-- 5 Qual é o valor médio gasto ao longo da vida em termos de total_amt_usd para as 10 principais contas de gastos totais?

-- Minha resolucao 

SELECT AVG(sum) FROM (SELECT a.name,SUM(o.total_amt_usd) sum FROM accounts a 
JOIN orders o ON a.id = o.account_id
GROUP BY 1
ORDER BY 2 DESC LIMIT 10) sub;







