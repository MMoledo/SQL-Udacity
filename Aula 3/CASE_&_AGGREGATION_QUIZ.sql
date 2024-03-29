-- Escreva uma consulta para exibir para cada pedido, o ID da conta, o valor total do pedido e o nível do pedido - 'Grande' ou 'Pequeno' - dependendo se o pedido é de US $ 3000 ou mais, ou menor que US $ 3000.

SELECT
    o.account_id,
    o.total_amt_usd,
    CASE
        WHEN o.total_amt_usd > 3000 THEN 'GRANDE'
        ELSE 'PEQUENO'
    END AS tamanho
FROM
    orders o 
    
--Write a query to display the number of orders in each of three categories, based on the total number of items in each order. The three categories are: 'At Least 2000', 'Between 1000 and 2000' and 'Less than 1000'.

SELECT
    CASE
        WHEN total > 2000 THEN 'At Least 2000'
        WHEN total > 1000 THEN 'Between 1000 and 2000'
        ELSE 'Less than 1000'
    END AS categories,
    COUNT(*) as total_count
FROM
    orders
GROUP BY
    1 
    
-- We would like to understand 3 different levels of customers based on the amount associated with their purchases. The top level includes anyone with a Lifetime Value (total sales of all orders) greater than 200,000 usd. The second level is between 200,000 and 100,000 usd. The lowest level is anyone under 100,000 usd. Provide a table that includes the level associated with each account. You should provide the account name, the total sales of all orders for the customer, and the level. Order with the top spending customers listed first.

SELECT
    a.name,
    SUM(o.total) total_qty,
    SUM(o.total_amt_usd) total_amt_usd,
    CASE
        WHEN SUM(o.total_amt_usd) > 200000 THEN 'greater than 200,000'
        WHEN SUM(o.total_amt_usd) > 100000 THEN '200,000 and 100,000'
        ELSE 'under 100,000'
    END AS level
FROM
    orders o
    JOIN accounts a ON a.id = o.account_id
GROUP BY
    1
ORDER BY
    3 DESC 
    
-- We would now like to perform a similar calculation to the first, but we want to obtain the total amount spent by customers only in 2016 and 2017. Keep the same levels as in the previous question. Order with the top spending customers listed first.
SELECT
    a.name,
    SUM(o.total) total_qty,
    SUM(o.total_amt_usd) total_amt_usd,
    CASE
        WHEN SUM(o.total_amt_usd) > 200000 THEN 'greater than 200,000'
        WHEN SUM(o.total_amt_usd) > 100000 THEN '200,000 and 100,000'
        ELSE 'under 100,000'
    END AS level
FROM
    orders o
    JOIN accounts a ON a.id = o.account_id
WHERE
    o.occurred_at BETWEEN '2016-01-01'
    AND '2018-01-01'
GROUP BY
    1
ORDER BY
    3 DESC 
    
-- We would like to identify top performing sales reps, which are sales reps associated with more than 200 orders. Create a table with the sales rep name, the total number of orders, and a column with top or not depending on if they have more than 200 orders. Place the top sales people first in your final table.
SELECT
    s.name,
    COUNT(*) total_orders,
    CASE
        WHEN COUNT(*) > 200 THEN 'top'
        ELSE 'not'
    END AS top
FROM
    orders o
    JOIN accounts a ON a.id = o.account_id
    JOIN sales_reps s ON s.id = a.sales_rep_id
GROUP BY
    1
ORDER BY
    2 DESC 
    
-- 6. O anterior não contabilizava o meio, nem o valor em dólar associado às vendas. A administração decide que quer ver essas características representadas também. Gostaríamos de identificar os representantes de vendas com melhor desempenho, que são representantes de vendas associados a mais de 200 pedidos ou mais de 750000 em vendas totais. O middle grupo tem qualquer representante com mais de 150 pedidos ou 500000 em vendas. Crie uma tabela com o nome do representante de vendas, o número total de pedidos, o total de vendas em todos os pedidos e uma coluna com top, middleou low dependendo deste critério. Coloque os principais vendedores com base na quantidade de vendas em dólares primeiro em sua tabela final.
SELECT
    s.name,
    COUNT(*),
    SUM(o.total_amt_usd) total_spent,
    CASE
        WHEN COUNT(*) > 200
        OR SUM(o.total_amt_usd) > 750000 THEN 'top'
        WHEN COUNT(*) > 150
        OR SUM(o.total_amt_usd) > 500000 THEN 'middle'
        ELSE 'low'
    END AS sales_rep_level
FROM
    orders o
    JOIN accounts a ON o.account_id = a.id
    JOIN sales_reps s ON s.id = a.sales_rep_id
GROUP BY
    s.name
ORDER BY
    3 DESC;