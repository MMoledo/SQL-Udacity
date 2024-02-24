SELECT 	account_id, SUM(standard_qty) AS standard_sum
FROM       orders
GROUP BY   1

