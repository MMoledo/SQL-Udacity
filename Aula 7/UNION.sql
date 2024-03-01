SELECT * FROM web_events

UNION ALL

SELECT * FROM web_events_2

--

WITH web_events AS (
  SELECT * FROM web_events
  UNION ALL
  SELECT * FROM web_events_2
)
SELECT channel,COUNT(*) FROM web_events
GROUP BY 1
ORDER BY 2 DESC
