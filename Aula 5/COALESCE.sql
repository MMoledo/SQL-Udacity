SELECT *, COALESCE(primary_poc, 'No primary_poc') AS primary_poc_modified
FROM accounts
WHERE primary_poc IS NULL