SELECT account_id,
        standard_sum,
        LAG(standard_sum) OVER (ORDER BY standard_sum) AS lag_standard_sum
        LEAD(standard_sum) OVER (ORDER BY standard_sum) AS lead_standard_sum
        standard_sum - LAG(standard_sum) OVER (ORDER BY standard_sum) AS diff_lag_standard_sum
FROM 
(SELECT
    account_id,
    SUM(standard_qty) AS standard_sum
FROM
    orders
GROUP BY 1
) sub


