SELECT id,
        account_id,
        occurred_at,
        ROW_NUMBER() OVER (ORDER BY occurred_at) AS row_number
FROM orders

SELECT id,
        account_id,
        occurred_at,
        ROW_NUMBER() OVER (PARTITION BY account_id ORDER BY occurred_at) AS row_number
FROM orders


-- Repete

SELECT id,
        account_id,
        occurred_at,
        RANK() OVER (ORDER BY occurred_at) AS rnk
FROM orders

