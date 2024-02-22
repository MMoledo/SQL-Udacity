SELECT standard_qty,
        DATE_TRUNC('month', occurred_at) AS month,
        SUM(standard_qty) OVER (PARTITION BY DATE_TRUNC('month', occurred_at) ORDER BY occurred_at) AS sum_standard_qty
FROM orders