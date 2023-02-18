-- Compare the results of these two queries above. How are the results different 
-- when you switch the column you sort on first? In query #1, all of the orders 
-- for each account ID are grouped together, and then within each of those groupings, 
-- the orders appear from the greatest order amount to the least. In query 
-- #2, since you sorted by the total dollar amount first, the orders appear 
-- from greatest to least regardless of which account ID they were from. 
-- Then they are sorted by account ID next. (The secondary sorting by account ID is 
-- difficult to see here since only if there were two orders with equal total dollar amounts 
-- would there need to be any sorting by account ID.)

-- Using the WHERE statement, we can display subsets of tables based on conditions that must be met. 
-- You can also think of the WHERE command as filtering the data.

-- This video above shows how this can be used, and in the upcoming concepts, 
-- you will learn some common operators that are useful with the WHERE statement.

-- Common symbols used in WHERE statements include:

-- > (greater than)

-- < (less than)

-- >= (greater than or equal to)

-- <= (less than or equal to)

-- = (equal to)

-- != (not equal to)

SELECT *
FROM orders
WHERE account_id = 4251
ORDER BY occurred_at
LIMIT 1000;



-- Questions
-- Write a query that:

-- Pulls the first 5 rows and all columns from the orders table that have a dollar amount of gloss_amt_usd 
-- greater than or equal to 1000.
-- Pulls the first 10 rows and all columns from the orders table that have a total_amt_usd less than 500.

-- Solution from previous WHERE Questions
SELECT *
FROM orders
WHERE gloss_amt_usd >= 1000
LIMIT 5;
SELECT *
FROM orders
WHERE total_amt_usd < 500
LIMIT 10;
-- You will notice when using these WHERE statements, 
-- we do not need to ORDER BY unless we want to actually order our data. 
-- Our condition will work without having to do any sorting of the data.


-- The WHERE statement can also be used with non-numeric data. 
-- We can use the = and != operators here. You need to be sure to use 
-- single quotes (just be careful if you have quotes in the original text)
--  with the text data, not double quotes.

-- Commonly when we are using WHERE with non-numeric data fields, we use the LIKE, 
-- NOT, or IN operators. We will see those before the end of this lesson!

-- Code from the Video
-- Query 1

SELECT *
FROM accounts
WHERE name = 'United Technologies'
Query 2

SELECT *
FROM accounts
WHERE name != 'United Technologies'

-- Practice Question Using WHERE with Non-Numeric Data
-- Filter the accounts table to include the company name, website, and the primary point of contact (primary_poc) 
-- just for the Exxon Mobil company in the accounts table.

-- Solution: from WHERE with Non-Numeric Data
SELECT name, website, primary_poc
FROM accounts
WHERE name = 'Exxon Mobil';
-- Note: If you received an error message when executing your query, remember 
-- that SQL requires single-quotes, not double-quotes, around text values like 'Exxon Mobil.'


