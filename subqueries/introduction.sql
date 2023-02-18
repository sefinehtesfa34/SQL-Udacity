-- What exactly is a subquery?
-- A subquery is a query within a query.

-- As a reminder, a query has both SELECT and FROM clauses to signify what you want to extract from a table and what table you’d like to pull data from. A query that includes subquery, as a result, has multiple SELECT and FROM clauses.
-- The subquery that sits nested inside a larger query is called an INNER QUERY. This inner query can be fully executed on its own and often is run independently before when trying to troubleshoot bugs in your code.
-- Example from the Video
-- This query cannot be run in our workspaces it is just an example

SELECT product_id,
       name,
       price
FROM db.product
Where price > (SELECT AVG(price)
              FROM db.product)



Often, SQL users will question the differences between joins and subqueries. After all, they essentially do the same thing: join tables together to create a single output. However, there are times when subqueries are more appropriate than joins and vice versa. In this section of our lesson, we’ll cover the differences between the two and when to use each.

Differences between Subqueries and Joins
Use Cases:
Subquery: When an existing table needs to be manipulated or aggregated to then be joined to a larger table.

Joins: A fully flexible and discretionary use case where a user wants to bring two or more tables together and select and filter as needed.

Syntax:
Subquery: A subquery is a query within a query. The syntax, as a result, has multiple SELECT and FROM clauses.

Joins: A join is simple stitching together multiple tables with a common key or column. A join clause cannot stand and be run independently.

Dependencies:
Subquery: A subquery clause can be run completely independently. When trying to debug code, subqueries are often run independently to pressure test results before running the larger query.

Joins: A join clause cannot stand and be run independently.

Similarities between Subqueries and Joins
Output:
Both subqueries and joins are essentially bringing multiple tables together (whether an existing table is first manipulated or not) to generate a single output.

-- Deep-dive topics:
-- What happens under the hood: Query plans are similar for both subqueries and joins. You can read more about how query plans are here. We will not be going in-depth for these in this lesson.

-- Subquery vs Joins Overview
-- Components	Subquery	JOINS
-- Combine data from multiple tables into a single result	X	X
-- Create a flexible view of tables stitched together using a “key”		X
-- Build an output to use in a later part of the query	X	
-- Subquery Plan: What happens under the hood	X	X
-- Example from the Video
-- This query cannot be run in our workspaces it is just an example

Query 1

SELECT product_id,
       name,
       price
FROM db.product
Where price > (SELECT AVG(price)
              FROM db.product)
Query 2

SELECT a.brand_id,
       a.total_brand_sales
       AVG(b.product_price)
FROM brand_table a
JOIN brand_table b
ON b.brand_id = a.brand_id
GROUP BY a.brand_id, a.total_brand_sales
ORDER BY a.total_brand_sales desc;
SQL Subqueries & Temporary Tables
