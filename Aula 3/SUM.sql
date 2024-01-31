--Encontre a quantidade total de poster_qty papel encomendado na tabela de pedidos.

--Encontre a quantidade total de standard_qty papel encomendado na tabela de pedidos.

-- Encontre o valor total em dólares das vendas usando o total_amt_usd na tabela de pedidos.

SELECT SUM(poster_qty) sum_poster, SUM(standard_qty) sum_stand,SUM(total_amt_usd) total_amt_usd FROM orders

-- Find the total amount spent on standard_amt_usd and gloss_amt_usd paper for each order in the orders table. This should give a dollar amount for each order in the table.

SELECT standard_amt_usd, gloss_amt_usd, standard_amt_usd + gloss_amt_usd total FROM orders

-- Find the standard_amt_usd per unit of standard_qty paper. Your solution should use both an aggregation and a mathematical operator.

select SUM(standard_amt_usd)/SUM(standard_qty) stand_price_unit FROM orders 
