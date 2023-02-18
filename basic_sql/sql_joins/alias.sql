When we JOIN tables together, it is nice to give each table an alias. Frequently an alias is just the first letter of the table name. You actually saw something similar for column names in the Arithmetic Operators concept.

Example:

FROM tablename AS t1
JOIN tablename2 AS t2
Before, you saw something like:

SELECT col1 + col2 AS total, col3
Frequently, you might also see these statements without the AS statement. Each of the above could be written in the following way instead, and they would still produce the exact same results:

FROM tablename t1
JOIN tablename2 t2
and

SELECT col1 + col2 total, col3
-- Aliases for Columns in Resulting Table
-- While aliasing tables is the most common use case. It can also be used to alias 
-- the columns selected to have the resulting table reflect a more readable name.

-- Example:

Select t1.column1 aliasname, t2.column2 aliasname2
FROM tablename AS t1
JOIN tablename2 AS t2
-- The alias name fields will be what shows up in the returned table instead of t1.column1 
-- and t2.column2

aliasname	aliasname2
example row	example row
example row	example row
-- If you have two or more columns in your SELECT that have the same name after the table name such as 
-- accounts.name and sales_reps.name you will need to alias them. Otherwise it will only show one of the columns. You can alias them like accounts.name AS AcountName, sales_rep.name AS SalesRepName

-- Code from the Video

SELECT o.*, a.*
FROM orders o
JOIN accounts a
ON o.account_id = a.id



-- Provide a table for all the for all web_events associated with account name of Walmart. 
-- There should be three columns. Be sure to include the primary_poc, time of the event, 
-- and the channel for each event. Additionally, you might choose to add a fourth column to 
-- assure only Walmart events were chosen.

SELECT a.primary_poc, w.occurred_at, w.channel, a.name
FROM web_events w
JOIN accounts a
ON w.account_id = a.id
WHERE a.name = 'Walmart';
-- Provide a table that provides the region for each sales_rep along with their associated accounts. 
-- Your final table should include three columns: the region name, 
-- the sales rep name, and the account name. Sort the accounts alphabetically (A-Z) 
-- according to account name.

SELECT r.name region, s.name rep, a.name account
FROM sales_reps s
JOIN region r
ON s.region_id = r.id
JOIN accounts a
ON a.sales_rep_id = s.id
ORDER BY a.name;
-- Provide the name for each region for every order, as well as the account name and 
-- the unit price they paid (total_amt_usd/total) for the order. Your final 

-- table should have 3 columns: region name, account name, and unit price. 
-- A few accounts have 0 for total, so I divided by (total + 0.01) to assure not dividing by zero.

SELECT r.name region, a.name account, 
    o.total_amt_usd/(o.total + 0.01) unit_price
FROM region r
JOIN sales_reps s
ON s.region_id = r.id
JOIN accounts a
ON a.sales_rep_id = s.id
JOIN orders o
ON o.account_id = a.id;












