-- The ORDER BY statement allows us to sort our results using the data in any column. 
-- If you are familiar with Excel or Google Sheets, 
-- using ORDER BY is similar to sorting a sheet using a column. A key difference, 
-- however, is that using ORDER BY in a SQL query only has temporary effects, 
-- for the results of that query, unlike sorting a sheet by column in Excel or Sheets.

-- In other words, when you use ORDER BY in a SQL query, your output will be sorted 
-- that way, but then the next query you run will encounter the unsorted data again. 
-- It's important to keep in mind that this is different than using common spreadsheet 
-- software, where sorting the spreadsheet by column actually alters the data in that 
-- sheet until you undo or change that sorting. This highlights the meaning and 
-- function of a SQL "query."

-- The ORDER BY statement always comes in a query after the SELECT and FROM statements, 
-- but before the LIMIT statement. If you are using the LIMIT statement, 
-- it will always appear last. As you learn additional commands, the order 
-- of these statements will matter more.

-- Pro-Tip
-- Remember DESC can be added after the column in your ORDER BY statement to 
-- sort in descending order, as the default is to sort in ascending order.

SELECT *
FROM orders
ORDER BY occurred_at
LIMIT 1000;


-- Practice
-- Lets get some practice using ORDER BY:

-- Write a query to return the 10 earliest orders in the orders table. 
-- Include the id, occurred_at, and total_amt_usd.
-- Write a query to return the top 5 orders in terms of the largest total_amt_usd. 
-- Include the id, account_id, and total_amt_usd.
-- Write a query to return the lowest 20 orders in terms of the smallest total_amt_usd. 
-- Include the id, account_id, and total_amt_usd.
-- Remember, just because a query successfully runs, 
-- does not mean you have the correct results. 
-- To see if your query worked as you wanted it to, 
-- you need to examine your output to see if it satisfies the problem or the question. 
-- You can also compare your query and results with the solution on the following page (concept).

-- Write a query to return the 10 earliest orders in the orders table. 
-- Include the id, occurred_at, and total_amt_usd.

SELECT id, occurred_at, total_amt_usd
FROM orders
ORDER BY occurred_at
LIMIT 10;

-- Write a query to return the top 5 orders in terms of the largest total_amt_usd. 
-- Include the id, account_id, and total_amt_usd.

SELECT id, account_id, total_amt_usd
FROM orders
ORDER BY total_amt_usd DESC 
LIMIT 5;


-- Write a query to return the lowest 20 orders in terms of the smallest total_amt_usd. 
-- Include the id, account_id, and total_amt_usd.

SELECT id, account_id, total_amt_usd
FROM orders
ORDER BY total_amt_usd
LIMIT 20;


-- Here, we saw that we can ORDER BY more than one column at a time. 
-- When you provide a list of columns in an ORDER BY command, 
-- the sorting occurs using the leftmost column in your list first, then the next column from the left, 
-- and so on. 
-- We still have the ability to flip the way we order using DESC.

SELECT  account_id,
        total_amt_usd
FROM orders
ORDER By total_amt_usd DESC, account_id


-- This query selected account_id and total_amt_usd from the orders table, 
-- and orders the results first by total_amt_usd in descending order and then account_id.

-- From this point in the course, the code from the videos will be provided for you without 
-- the text explanation.


-- Questions
-- Write a query that displays the order ID, account ID, and total dollar amount for all the orders, 
-- sorted first by the account ID (in ascending order), 
-- and then by the total dollar amount (in descending order).

-- Now write a query that again displays order ID, account ID, and total dollar amount for each order, 
-- but this time sorted first by total dollar amount (in descending order), 
-- and then by account ID (in ascending order).

-- Compare the results of these two queries above. How are the results different 
-- when you switch the column you sort on first?

-- Solutions to previous ORDER BY Questions
-- Write a query that displays the order ID, account ID, and total dollar amount for all the orders, 
-- sorted first by the account ID (in ascending order), and then by the total dollar amount 
-- (in descending order).

SELECT id, account_id, total_amt_usd
FROM orders
ORDER BY account_id, total_amt_usd DESC;
-- Now write a query that again displays order ID, account ID, 
-- and total dollar amount for each order, but this time sorted first by total dollar amount 
-- (in descending order), and then by account ID (in ascending order).

SELECT id, account_id, total_amt_usd
FROM orders
ORDER BY total_amt_usd DESC, account_id;
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

