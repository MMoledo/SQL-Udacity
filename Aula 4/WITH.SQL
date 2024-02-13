WITH events AS (
    SELECT
        DATE_TRUNC('day', w.occurred_at) AS day,
        w.channel,
        COUNT(*) AS count_event
    FROM
        web_events w
    GROUP BY
        1,
        2
    ORDER BY
        1
) 
SELECT
    channel,
    AVG(count_event)
FROM
    events
GROUP BY
    1
ORDER BY
    2 DESC

-- exrcicio

WITH max AS (
  SELECT s.name,SUM(total_amt_usd) total FROM accounts a
JOIN orders o ON a.id = o.account_id
JOIN sales_reps s ON a.sales_rep_id = s.id
 GROUP BY 1)
 

SELECT r.name,s.name FROM accounts a
JOIN orders o ON a.id = o.account_id
JOIN sales_reps s ON a.sales_rep_id = s.id
JOIN region r ON r.id = s.region_id
GROUP BY 1,2