-- Each company in the accounts table wants to create an email address for each primary_poc. The email address should be the first name of the primary_poc . last name primary_poc @ company name .com.
SELECT
    CONCAT(
        LEFT(primary_poc, POSITION(' ' IN primary_poc) -1),
        '.',
        RIGHT(
            primary_poc,
            LENGTH(primary_poc) - POSITION(' ' IN primary_poc)
        ),
        '@',
        name,
        '.com'
    ) email
FROM
    accounts --Você deve ter notado que na solução anterior alguns dos nomes de empresas incluem espaços, que certamente não funcionarão em um endereço de e-mail. Veja se você pode criar um endereço de e-mail que funcionará removendo todos os espaços na conta name, mas caso contrário, sua solução deve ser exatamente como em questão 1. Algumas documentações úteis são aqui(abre em uma nova aba).
SELECT
    CONCAT(
        LEFT(primary_poc, POSITION(' ' IN primary_poc) -1),
        '.',
        RIGHT(
            primary_poc,
            LENGTH(primary_poc) - POSITION(' ' IN primary_poc)
        ),
        '@',
        replace(name, ' ', ''),
        '.com'
    ) email
FROM
    accounts --
SELECT
    CONCAT(
        LEFT(primary_poc, POSITION(' ' IN primary_poc) -1),
        '.',
        RIGHT(
            primary_poc,
            LENGTH(primary_poc) - POSITION(' ' IN primary_poc)
        ),
        '@',
        replace(name, ' ', ''),
        '.com'
    ) email,
    CONCAT(
        LEFT(primary_poc, 1),
        LOWER(
            LEFT(
                name,
                POSITION(' ' IN name) -1
            )
        )
            RIGHT(
                LEFT(
                    name,
                    POSITION(' ' IN name) -1
                ),
                1
            )
        )
FROM
    accounts