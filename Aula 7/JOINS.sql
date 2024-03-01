-- FULL OTHER JOIN

SELECT column_name(s)
FROM Table_A
INNER JOIN Table_B ON Table_A.column_name = Table_B.column_name;

-- LEFT JOIN

SELECT column_name(s)
FROM Table_A
LEFT JOIN Table_B ON Table_A.column_name = Table_B.column_name;

-- RIGHT JOIN

SELECT column_name(s)
FROM Table_A
RIGHT JOIN Table_B ON Table_A.column_name = Table_B.column_name;

-- FULL JOIN

SELECT column_name(s)
FROM Table_A
FULL OUTER JOIN Table_B ON Table_A.column_name = Table_B.column_name;

-- SELF JOIN

SELECT column_name(s)
FROM Table_A T1, Table_A T2
WHERE Table_A.column_name IS NULL OR Table_B.column_name IS NULL