--Perguntas: GROUP BY
--Use o ambiente SQL abaixo para ajudar a responder às perguntas a seguir. Se você ficar preso ou você só quer verificar suas soluções, minhas respostas podem ser encontradas no topo do próximo conceito.

--Uma parte que pode ser difícil de reconhecer é quando pode ser mais fácil usar uma agregação ou uma das outras funcionalidades SQL. Tente algumas das opções abaixo para ver se você pode diferenciar para encontrar a solução mais fácil.

--Qual conta (pelo nome) fez o pedido mais antigo? Sua solução deve ter o nome da conta e a data do pedido.
 
SELECT a.name,o.occurred_at FROM accounts a JOIN orders o ON a.id = o.account_id ORDER BY o.occurred_at LIMIT 1

-- Encontre o total de vendas em usd para cada conta. Você deve incluir duas colunas - o total de vendas para os pedidos de cada empresa em usd e o nome da empresa.

SELECT a.name, SUM(o.total_amt_usd) FROM accounts a JOIN orders o ON a.id = o.account_id GROUP BY a.name

-- Por meio de qual canal ocorreu a web_event mais recente (mais recente), qual conta foi associada a esse web_event? Sua consulta deve retornar apenas três valores - a data, o canal e o nome da conta.

SELECT w.occurred_at,w.channel,a.name FROM web_events w JOIN accounts a ON a.id = w.account_id ORDER BY w.occurred_at DESC LIMIT 1

-- Encontre o número total de vezes que cada tipo de canal do web_events foi usado. Sua tabela final deve ter duas colunas - o canal e o número de vezes que o canal foi usado.

SELECT w.channel, COUNT(w.channel) FROM web_events w GROUP BY w.channel

-- Quem foi o principal contato associado à primeira web_event?

SELECT a.primary_poc , w.occurred_at FROM accounts a JOIN web_events w ON a.id = w.account_id ORDER BY w.occurred_at LIMIT 1

-- Qual foi o menor pedido feito por cada conta em termos de total de dólares. Forneça apenas duas colunas - o nome da conta e o total usd. Encomenda do menor dólar equivale ao maior.

SELECT a.name,MIN(o.total_amt_usd) FROM accounts a JOIN orders o ON a.id = o.account_id GROUP BY a.name ORDER BY MIN(o.total_amt_usd)

-- Encontre o número de representantes de vendas em cada região. Sua tabela final deve ter duas colunas - a região e o número de sales_reps. Ordem do menor número de representantes para a maioria dos representantes.

SELECT r.name, COUNT(s.name) FROM region r JOIN sales_reps s ON s.region_id = r.id GROUP BY r.name

