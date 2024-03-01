SELECT o.id,o.occurred_at order_date,w.* FROM orders o
LEFT JOIN web_events_full w ON w.account_id = o.account_id
AND w.occurred_at < o.occurred_at
WHERE DATE_TRUNC('month', occurred_at) = (SELECT DATE_TRUNC('month', MIN(occurred_at)) FROM orders)
ORDER BY o.account_id,o.occurred_at

--

