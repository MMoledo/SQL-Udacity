SELECT
    channel,
    AVG(count_event)
FROM
    (
        SELECT
            DATE_TRUNC('day', w.occurred_at) AS day,
            w.channel,
            COUNT(*) AS count_event
        FROM
            web_events w
        GROUP BY
            1,
            2
        ORDER BY
            1
    ) sub
GROUP BY
    1
ORDER BY
    2 DESC
SELECT
    *
FROM
    orders
WHERE
    DATE_TRUNC('month', occurred_at) = (
        SELECT
            DATE_TRUNC('month', MIN(occurred_at) AS min_month)
        FROM
            orders
    )
ORDER BY
    occurred_at