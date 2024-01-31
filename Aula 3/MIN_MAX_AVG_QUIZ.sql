--Quando foi feito o primeiro pedido? Você só precisa devolver a data.

SELECT MIN(occurred_at) FROM orders

--Tente executar a mesma consulta da pergunta 1 sem usar uma função de agregação.

SELECT occurred_at FROM orders ORDER BY occurred_at LIMIT 1

--Quando ocorreu a web_event mais recente (mais recente)?

SELECT MAX(occurred_at) FROM web_events

--Tente executar o resultado da consulta anterior sem usar uma função de agregação.

SELECT occurred_at FROM web_events ORDER BY occurred_at DESC LIMIT 1

--Encontre o valor médio (MÉDIO) gasto por pedido em cada tipo de papel, bem como o valor médio de cada tipo de papel comprado por pedido. Sua resposta final deve ter 6 valores - um para cada tipo de papel para o número médio de vendas, bem como o valor médio.

SELECT AVG(standard_amt_usd) avg_standard, AVG(gloss_amt_usd) avg_gloss, AVG(poster_amt_usd) avg_poster, AVG(standard_qty) avg_standard_qty, AVG(gloss_qty) avg_gloss_qty, AVG(poster_qty) avg_poster_qty FROM orders
--Através do vídeo, você pode estar interessado em como calcular o MEDIAN. Embora isso seja mais avançado do que o que cobrimos até agora tente encontrar - qual é o total_usd MEDIANO gasto em todos os pedidos?

SELECT *
FROM (SELECT total_amt_usd
         FROM orders
         ORDER BY total_amt_usd
         LIMIT 3457) AS Table1
ORDER BY total_amt_usd DESC
LIMIT 2;