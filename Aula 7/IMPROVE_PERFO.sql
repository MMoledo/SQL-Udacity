SELECT DATE_TRUNC('day', o.occurred_at) AS date,
       COUNT(DISTINCT a.sales_rep_id) AS active_sales_reps,
       COUNT(DISTINCT o.id) AS orders,
       COUNT(DISTINCT we.id) AS web_visits
FROM demo.accounts a
JOIN demo.orders o ON o.account_id = a.id
JOIN demo.web_events_full we 
ON DATE_TRUNC('day', we.occurred_at) = DATE_TRUNC('day', o.occurred_at)
GROUP BY 1
ORDER BY 1 DESC

--

