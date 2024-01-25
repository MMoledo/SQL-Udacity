/*
Limit, funcao usada para limitar a quantidade de registros retornados em uma consulta
*/

SELECT occurred_at, account_id, channel FROM web_events LIMIT 15;