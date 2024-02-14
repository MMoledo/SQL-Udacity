-- Na tabela de contas, há uma coluna contendo o site de cada empresa. Os últimos três dígitos especificam o tipo de endereço da Web que eles estão usando. Uma lista de extensões (e preços) é fornecida aqui(abre em uma nova aba). Puxe essas extensões e forneça quantos de cada tipo de site existem na tabela de contas.

SELECT RIGHT(website,3) AS prefix, COUNT(*) FROM accounts 
GROUP BY 1

-- Há muito debate sobre quanto o nome (ou mesmo a primeira letra do nome de uma empresa)(abre em uma nova aba) Importa. Use a tabela de contas para extrair a primeira letra de cada nome de empresa para ver a distribuição dos nomes de empresas que começam com cada letra (ou número).

SELECT RIGHT(UPPER(name),1) AS prefix, COUNT(*) FROM accounts 
GROUP BY 1
ORDER BY 1

-- Use the accounts table and a CASE statement to create two groups: one group of company names that start with a number and a second group of those company names that start with a letter. What proportion of company names start with a letter?

SELECT 
    CASE
        WHEN LEFT(name,1) BETWEEN '0' AND '9' THEN 'number'
        ELSE 'letter'
    END AS prefix, 
    COUNT(*)
FROM accounts
GROUP BY 1

-- Consider vowels as a, e, i, o, and u. What proportion of company names start with a vowel, and what percent start with anything else?

SELECT 
    CASE
        WHEN LEFT(UPPER(name),1) IN ('A','E','I','O','U') THEN 'vowel'
        ELSE 'consonant'
    END AS prefix, 
    COUNT(*)
FROM accounts
GROUP BY 1