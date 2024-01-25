-- Criar uma coluna que divida o standard_amt_usd pelo standard_qty para encontrar o preço unitário do papel padrão para cada pedido. Limite os resultados às 10 primeiras ordens e inclua o id e account_id Campos.

SELECT *, standard_amt_usd/standard_qty AS unit_price FROM orders LIMIT 10

-- Escreva uma consulta que encontre a porcentagem da receita que vem do papel de cartaz para cada pedido. Você precisará usar apenas as colunas que terminam com _usd. (Tente fazer isso sem usar o total coluna.) Exibir o id e account_id campos também. NOTA - você receberá um erro com a solução correta para esta pergunta. Isso ocorre porque pelo menos um dos valores nos dados cria uma divisão por zero em sua fórmula. Você aprenderá mais tarde no curso como lidar totalmente com esse problema. Por enquanto, você pode apenas limitar seus cálculos aos primeiros 10 pedidos, como fizemos na pergunta #1, e você evitará esse conjunto de dados que causa o problema.

SELECT id,account_id,standard_amt_usd,gloss_amt_usd,poster_amt_usd, (poster_amt_usd*100)/(standard_amt_usd+gloss_amt_usd+poster_amt_usd) AS poster_porcent FROM orders LIMIT 10
