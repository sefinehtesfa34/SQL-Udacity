-- This entire lesson will be focused on JOINs. The whole purpose of JOIN statements is to allow us to pull data from more than one table at a time.

-- Again - JOINs are useful for allowing us to pull data from multiple tables. This is both simple and powerful all at the same time.

-- With the addition of the JOIN statement to our toolkit, we will also be adding the ON statement.

-- We use ON clause to specify a JOIN condition which is a logical statement to combine the table in FROM and JOIN statements.
SELECT orders.*
FROM orders

SELECT orders.*,
       accounts.*
FROM orders 
JOIN accounts
ON orders.account_id = accounts.id;


-- Write Your First JOIN
-- Below we see an example of a query using a JOIN statement. 
-- Lets discuss what the different clauses of this query mean.

SELECT orders.*
FROM orders
JOIN accounts
ON orders.account_id = accounts.id;
-- As we've learned, the SELECT clause indicates which column(s) of data you'd like to see in the output (For Example, orders.* gives us all the columns in the orders table in the output). The FROM clause indicates the first table from which we're pulling data, 
-- and the JOIN indicates the second table. The ON clause specifies the column on which you'd like to merge the two tables together. Try running this query yourself below.

Solutions
SELECT orders.*, accounts.*
FROM accounts
JOIN orders
ON accounts.id = orders.account_id;
-- Notice this result is the same as if you switched the tables in the FROM and JOIN. 
-- Additionally, which side of the = a column is listed doesnt matter.
SELECT orders.standard_qty, orders.gloss_qty, 
 orders.poster_qty,  accounts.website, 
 accounts.primary_poc
FROM orders
JOIN accounts
ON orders.account_id = accounts.id
-- Notice that we need to specify every table a column comes from in the SELECT statement.
SELECT orders.*
FROM orders
JOIN accounts
ON orders.account_id = accounts.id;

SELECT *
FROM web_events
JOIN accounts
ON web_events.account_id = accounts.id
JOIN orders
ON accounts.id = orders.account_id


-- Alternatively, we can create a SELECT statement that could pull specific columns 
-- from any of the three tables. Again, our JOIN holds a table, and ON is a 
-- link for our PK to equal the FK.

-- To pull specific columns, the SELECT statement will need to specify the table 
-- that you are wishing to pull the column from, as well as the column name. We could pull only three columns in the above by changing the select statement to the below, but maintaining the rest of the JOIN information:

SELECT web_events.channel, accounts.name, orders.total
-- We could continue this same process to link all of the tables if we wanted. 
-- For efficiency reasons, we probably dont want to do this unless we actually 
-- need information from all of the tables.











