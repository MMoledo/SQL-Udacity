SELECT CASE WHEN total > 500 THEN 'Over 500'
            ELSE '500 or under' END AS total_group,
        COUNT(*) AS order_count
    FROM orders
GROUP BY 1  