DISTINCT --is always used in SELECT statements, and it provides the unique rows for all columns written in the SELECT statement. 
-- Therefore, you only use DISTINCT once in any particular SELECT statement.
SELECT DISTINCT column1, column2, column3
FROM table1;

You would not write:

SELECT DISTINCT column1, DISTINCT column2, DISTINCT column3
FROM table1;

-- You can think of DISTINCT the same way you might think of the statement "unique".

-- DISTINCT - Expert Tip
-- It’s worth noting that using DISTINCT, particularly in aggregations, can slow your queries down quite a bit.

SELECT account_id,
       channel,
       COUNT(id) as events
FROM web_events
GROUP BY account_id, channel
ORDER BY account_id, channel DESC

SELECT DISTINCT account_id,
       channel
FROM web_events
ORDER BY account_id