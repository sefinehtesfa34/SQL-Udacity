
-- We have already seen the SELECT (to choose columns) and FROM (to choose tables) 
-- statements. The LIMIT statement is useful when you want to see just the first 
-- few rows of a table. This can be much faster for loading than if we load the entire dataset.

-- The LIMIT command is always the very last part of a query. An example of showing just the first 10 rows of the orders table with all of the columns might look like the following:

SELECT *
FROM orders
LIMIT 10;
-- Try using LIMIT yourself below by writing a query that displays all the data in the occurred_at, account_id, and channel columns of the web_events table, 
-- and limits the output to only the first 15 rows.

SELECT occurred_at, account_id, channel
FROM web_events
LIMIT 15;
