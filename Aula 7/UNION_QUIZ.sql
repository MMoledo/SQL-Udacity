SELECT *
    FROM accounts

UNION ALL

SELECT *
  FROM accounts

  --

SELECT *
    FROM accounts
    WHERE name = 'Walmart'

UNION ALL

SELECT *
  FROM accounts
  WHERE name = 'Disney'

--

WITH double_accounts AS (
    SELECT *
      FROM accounts
    
    UNION ALL
    
    SELECT *
      FROM accounts
)

SELECT name,
       COUNT(*) AS name_count
 FROM double_accounts 
GROUP BY 1
ORDER BY 2 DESC
  