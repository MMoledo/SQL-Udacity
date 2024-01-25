-- Puxa as primeiras 5 linhas e todas as colunas da tabela de ordens que têm um valor em dólares de gloss_amt_usd maior ou igual a 1000.

SELECT * FROM orders WHERE gloss_amt_usd >= 1000 LIMIT 5;

-- Puxa as primeiras 10 linhas e todas as colunas da tabela de pedidos que têm um total_amt_usd menos de 500.

SELECT * FROM orders WHERE total_amt_usd < 500 LIMIT 10;

-- Filtrar a tabela de contas para incluir a empresa name, website, e o principal ponto de contato (primary_poc) apenas para a empresa Exxon Mobil na tabela de contas.

SELECT name, website, primary_poc FROM accounts WHERE name = 'Exxon Mobil'