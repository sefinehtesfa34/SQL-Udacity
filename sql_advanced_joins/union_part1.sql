CREATE VIEW web_events_2
AS (SELECT * FROM web_events)

SELECT *
FROM web_events
UNION
SELECT *
FROM web_events_2



CREATE VIEW web_events_2
AS (SELECT * FROM web_events)

SELECT *
FROM web_events
WHERE channel = 'facebook'
UNION ALL
SELECT *
FROM web_events_2


CREATE VIEW web_events_2
AS (SELECT * FROM web_events)

SELECT channel,
       COUNT(*) AS sessions
FROM (
      SELECT *
      FROM web_events
      UNION ALL
      SELECT *
      FROM web_events_2
     ) web_events
GROUP BY 1
ORDER BY 2 DESC


CREATE VIEW web_events_2
AS (SELECT * FROM web_events)

WITH web_events AS (
      SELECT *
      FROM web_events
      UNION ALL
      SELECT *
      FROM web_events_2
     )
SELECT channel,
       COUNT(*) AS sessions
FROM  web_events
GROUP BY 1
ORDER BY 2 DESC

