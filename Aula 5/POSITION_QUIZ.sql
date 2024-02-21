--Use o botão accounts para criar colunas de nome e sobrenome que contêm os nomes e sobrenomes para o primary_poc.

SELECT 
primary_poc,
POSITION(' ' IN primary_poc),
LEFT(primary_poc, POSITION(' ' IN primary_poc)) first_name,
RIGHT(primary_poc, LENGTH(primary_poc)-POSITION(' ' IN primary_poc)) second_name
FROM accounts
                                  
-- Agora veja se você pode fazer a mesma coisa para todos os representantes name na sales_reps mesa. Forneça novamente colunas de nome e sobrenome.

SELECT 
name,
POSITION(' ' IN name),
LEFT(name, POSITION(' ' IN name)) first_name,
RIGHT(name, LENGTH(name)-POSITION(' ' IN name)) second_name
FROM sales_reps

--
WITH t1 AS (
    SELECT LEFT(primary_poc,     STRPOS(primary_poc, ' ') -1 ) first_name,  RIGHT(primary_poc, LENGTH(primary_poc) - STRPOS(primary_poc, ' ')) last_name, name
    FROM accounts)
SELECT first_name, last_name, CONCAT(first_name, '.', last_name, '@', name, '.com'), LEFT(LOWER(first_name), 1) || RIGHT(LOWER(first_name), 1) || LEFT(LOWER(last_name), 1) || RIGHT(LOWER(last_name), 1) || LENGTH(first_name) || LENGTH(last_name) || REPLACE(UPPER(name), ' ', '')
FROM t1;