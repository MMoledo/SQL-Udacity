-- 1

WITH t1 AS (
     SELECT s.name rep_name, r.name region_name, SUM(o.total_amt_usd) total_amt
      FROM sales_reps s
      JOIN accounts a
      ON a.sales_rep_id = s.id
      JOIN orders o
      ON o.account_id = a.id
      JOIN region r
      ON r.id = s.region_id
      GROUP BY 1,2
      ORDER BY 3 DESC), 
t2 AS (
      SELECT region_name, MAX(total_amt) total_amt
      FROM t1
      GROUP BY 1)
SELECT t1.rep_name, t1.region_name, t1.total_amt
FROM t1
JOIN t2
ON t1.region_name = t2.region_name AND t1.total_amt = t2.total_amt;

--  2
WITH region_name AS (
    SELECT
        r.name AS regio_name
    FROM
        accounts a
        JOIN orders o ON a.id = o.account_id
        JOIN sales_reps s ON a.sales_rep_id = s.id
        JOIN region r ON s.region_id = r.id
    GROUP BY
        r.name
    ORDER BY
        SUM(o.total_amt_usd) DESC
    LIMIT
        1
)
SELECT
    r.name,
    COUNT(*)
FROM
    orders o
    JOIN accounts a ON a.id = o.account_id
    JOIN sales_reps s ON a.sales_rep_id = s.id
    JOIN region r ON s.region_id = r.id
GROUP BY
    r.name
HAVING
    r.name = (
        SELECT
            regio_name
        FROM
            region_name
    );

-- 3

WITH t1 AS (
      SELECT a.name account_name, SUM(o.standard_qty) total_std, SUM(o.total) total
      FROM accounts a
      JOIN orders o
      ON o.account_id = a.id
      GROUP BY 1
      ORDER BY 2 DESC
      LIMIT 1), 
t2 AS (
      SELECT a.name
      FROM orders o
      JOIN accounts a
      ON a.id = o.account_id
      GROUP BY 1
      HAVING SUM(o.total) > (SELECT total FROM t1))
SELECT COUNT(*)
FROM t2;

-- 4

SELECT a.name, SUM(total_amt_usd) FROM accounts a
JOIN orders o ON a.id = o.account_id
GROUP BY 1
ORDER BY 2 DESC LIMIT 1

SELECT a.name, w.channel, COUNT(w.channel) FROM accounts a
JOIN web_events w ON a.id = w.account_id
GROUP BY 1,2

WITH channels AS (SELECT a.name laranja, w.channel batata, COUNT(w.channel) abacaxi FROM accounts a
JOIN web_events w ON a.id = w.account_id
GROUP BY 1,2),

player AS (SELECT a.name, SUM(total_amt_usd) FROM accounts a
JOIN orders o ON a.id = o.account_id
GROUP BY 1
ORDER BY 2 DESC LIMIT 1)

SELECT laranja,batata,abacaxi FROM channels JOIN player ON laranja = player.name