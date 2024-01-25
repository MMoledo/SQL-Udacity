/*
Escreva uma consulta que exiba o ID do pedido, o ID da conta e o valor total em dólares para todos os pedidos, classificados primeiro pelo ID da conta (em ordem crescente) e, em seguida, pelo valor total em dólares (em ordem decrescente).
*/
SELECT id, account_id, total_amt_usd from orders ORDER BY account_id, total_amt_usd DESC

/*
Agora, escreva uma consulta que exiba novamente o ID do pedido, o ID da conta e o valor total em dólares para cada pedido, mas desta vez classificado primeiro pelo valor total em dólares (em ordem decrescente) e, em seguida, pelo ID da conta (em ordem crescente).
*/

SELECT id, account_id, total_amt_usd from orders ORDER BY total_amt_usd DESC, account_id