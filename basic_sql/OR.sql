-- Similar to the AND operator, the OR operator can combine multiple statements. Each time you link a new statement with an OR, you will need to specify the column you are interested in looking at. You may link as many statements as you would like to consider at the same time. This operator works with all of the operations we have seen so far including arithmetic operators (+, *, -, /), LIKE, IN, NOT, AND, and BETWEEN logic can all be linked together using the OR operator.

-- When combining multiple of these operations, we frequently might need to use parentheses to assure that logic we want to perform is being executed correctly. The video below shows an example of one of these situations.
SELECT account_id,
       occurred_at,
       standard_qty,
       gloss_qty,
       poster_qty
FROM orders
WHERE standard_qty = 0 OR gloss_qty = 0 OR poster_qty = 0
-- Code from Video 2
SELECT account_id,
       occurred_at,
       standard_qty,
       gloss_qty,
       poster_qty
FROM orders
WHERE (standard_qty = 0 OR gloss_qty = 0 OR poster_qty = 0)
AND occurred_at = '2016-10-01'



-- Questions using the OR operator
-- Find list of orders ids where either gloss_qty or poster_qty is greater than 4000. Only include the id field in the resulting table.


-- Write a query that returns a list of orders where the standard_qty is zero and either the gloss_qty or poster_qty is over 1000.


-- Find all the company names that start with a 'C' or 'W', and the primary contact contains 'ana' or 'Ana', but it doesn't contain 'eana'.



-- Solutions to OR Questions
SELECT id
FROM orders
WHERE gloss_qty > 4000 OR poster_qty > 4000;
SELECT *
FROM orders
WHERE standard_qty = 0 AND (gloss_qty > 1000 OR poster_qty > 1000);
SELECT *
FROM accounts
WHERE (name LIKE 'C%' OR name LIKE 'W%') 
           AND ((primary_poc LIKE '%ana%' OR primary_poc LIKE '%Ana%') 
           AND primary_poc NOT LIKE '%eana%');

-- Recap
-- Commands
-- You have already learned a lot about writing code in SQL! Let's take a moment to recap all that we have covered before moving on:

-- Statement	How to Use It	Other Details
-- SELECT	SELECT Col1, Col2, ...	Provide the columns you want
-- FROM	FROM Table	Provide the table where the columns exist
-- LIMIT	LIMIT 10	Limits based number of rows returned
-- ORDER BY	ORDER BY Col	Orders table based on the column. Used with DESC.
-- WHERE	WHERE Col > 5	A conditional statement to filter your results
-- LIKE	WHERE Col LIKE '%me%'	Only pulls rows where column has 'me' within the text
-- IN	WHERE Col IN ('Y', 'N')	A filter for only rows with column of 'Y' or 'N'
-- NOT	WHERE Col NOT IN ('Y', 'N')	NOT is frequently used with LIKE and IN
-- AND	WHERE Col1 > 5 AND Col2 < 3	Filter rows where two or more conditions must be true
-- OR	WHERE Col1 > 5 OR Col2 < 3	Filter rows where at least one condition must be true
-- BETWEEN	WHERE Col BETWEEN 3 AND 5	Often easier syntax than using an AND
-- Key Terms
-- KeyTerm	Definition
-- CREATE TABLE	is a statement that creates a new table in a database.
-- DROP TABLE	is a statement that removes a table in a database.
-- Entity-relationship diagram (ERD)	A common way to view data in a database.
-- FROM	specifies from which table(s) you want to select the columns. Notice the columns need to exist in this table.
-- SELECT	allows you to read data and display it. This is called a query and it specifies from which table(s) you want to select the columns.
-- Other Tips
-- Though SQL is not case sensitive (it doesn't care if you write your statements as all uppercase or lowercase), we discussed some best practices. The order of the key words does matter! Using what you know so far, you will want to write your statements as:

-- SELECT col1, col2
-- FROM table1
-- WHERE col3  > 5 AND col4 LIKE '%os%'
-- ORDER BY col5
-- LIMIT 10;
-- Notice, you can retrieve different columns than those being used in the ORDER BY and WHERE statements. Assuming all of these column names existed in this way (col1, col2, col3, col4, col5) within a table calledtable1, this query would run just fine.

-- Lesson Overview
-- Now that we have completed this lesson we have covered the following and you are able to:

-- Describe why SQL is important
-- Explain how SQL data is stored and structured
-- Create SQL queries using proper syntax including
-- SELECT & FROM
-- LIMIT
-- ORDER BY
-- WHERE
-- Basic arithmetic operations
-- LIKE
-- IN
-- NOT
-- AND & BETWEEN & OR