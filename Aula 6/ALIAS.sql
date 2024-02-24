SELECT id,
        account_id,
        standard_qty,
        DATE_TRUNC('month', occurred_at) AS month,
        DENSE_RANK() OVER w AS dense_rank,
        SUM(standard_qty) OVER w AS sum_std_qty,
        COUNT(standard_qty) OVER w AS count_std_qty,
        AVG(standard_qty) OVER w AS avg_std_qty,
        MIN(standard_qty) OVER w AS min_std_qty,
        MAX(standard_qty) OVER w AS max_std_qty
FROM orders
WINDOW w AS (PARTITION BY account_id ORDER BY DATE_TRUNC('month', occurred_at))
