-- The NOT operator is an extremely useful operator for working with the previous two operators we introduced: IN and LIKE. By specifying NOT LIKE or NOT IN, we can grab all of the rows that do not meet particular criteria.

-- Code from the Video
-- Query 1

SELECT sales_rep_id, 
       name
FROM accounts
WHERE sales_rep_id NOT IN (321500,321570)
ORDER BY sales_rep_id
-- Query 2

-- Code from the video has been modified to match our database schema in the workspaces.

SELECT *
FROM accounts
WHERE website NOT LIKE '%com%';

-- Questions using the NOT operator
-- We can pull all of the rows that were excluded from the queries in the previous two concepts with our new operator.

-- Use the accounts table to find the account name, primary poc, and sales rep id for all stores except Walmart, Target, and Nordstrom.
-- Use the web_events table to find all information regarding individuals who were contacted via any method except using organic or adwords methods.
-- Use the accounts table to find:

-- All the companies whose names do not start with 'C'.
-- All companies whose names do not contain the string 'one' somewhere in the name.
-- All companies whose names do not end with 's'.

-- Solutions to NOT IN Questions
SELECT name, primary_poc, sales_rep_id
FROM accounts
WHERE name NOT IN ('Walmart', 'Target', 'Nordstrom');
SELECT *
FROM web_events
WHERE channel NOT IN ('organic', 'adwords');
-- Solutions to NOT LIKE Questions
SELECT name
FROM accounts
WHERE name NOT LIKE 'C%';
SELECT name
FROM accounts
WHERE name NOT LIKE '%one%';
SELECT name
FROM accounts
WHERE name NOT LIKE '%s';
