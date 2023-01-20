# SQL-Udacity
# Challenge: Programming for Data Science with Python

# SQL Aggregation
In the following concepts, you will be learning in detail about each of the aggregate functions mentioned as well as some additional aggregate functions that are used in SQL all the time.

SQL Aggregations Lesson Overview
In this lesson, we will cover and you will be able to:

Deal with NULL values
Create aggregations in your SQL Queries including
COUNT
SUM
MIN & MAX
AVG
GROUP BY
DISTINCT
HAVING
Create DATE functions
Implement CASE statements
Let's get started!
# NULLs:  
are a datatype that specifies where no data exists in SQL. They are often ignored in our aggregation functions, which you will get a first look at in the next concept using COUNT.

Notice that NULLs are different than a zero - they are cells where data does not exist.

When identifying NULLs in a WHERE clause, we write IS NULL or IS NOT NULL. We don't use =, because NULL isn't considered a value in SQL. Rather, it is a property of the data.
# NULLs - Expert Tip
There are two common ways in which you are likely to encounter NULLs:

NULLs frequently occur when performing a LEFT or RIGHT JOIN. You saw in the last lesson - when some rows in the left table of a left join are not matched with rows in the right table, those rows will contain some NULL values in the result set.
NULLs can also occur from simply missing data in our database.

# COUNT the Number of Rows in a Table
## Notice that:
COUNT does not consider rows that have NULL values. Therefore, this can be useful for quickly identifying which rows have missing data. You will learn GROUP BY in an upcoming concept, and then each of these aggregators will become much more useful.
# SUM
Unlike COUNT, you can only use SUM on numeric columns. However, SUM will ignore NULL values, as do the other aggregation functions you will see in the upcoming lessons.
# Aggregation Reminder
An important thing to remember: aggregators only aggregate vertically - the values of a column. If you want to perform a calculation across rows, you would do this with simple arithmetic.

We saw this in the first lesson if you need a refresher, but the quiz in the next concept should assure you still remember how to aggregate across rows.
# MIN and MAX
Notice that here we were simultaneously obtaining the MIN and MAX number of orders of each paper type. However, you could run each individually.

Notice that MIN and MAX are aggregators that again ignore NULL values. Check the expert tip below for a cool trick with MAX & MIN.

# Expert Tip
Functionally, MIN and MAX are similar to COUNT in that they can be used on non-numerical columns. Depending on the column type, MIN will return the lowest number, earliest date, or non-numerical value as early in the alphabet as possible. As you might suspect, MAX does the opposite—it returns the highest number, the latest date, or the non-numerical value closest alphabetically to “Z.”
# AVERAGE
Similar to other software AVG returns the mean of the data - that is the sum of all of the values in the column divided by the number of values in a column. This aggregate function again ignores the NULL values in both the numerator and the denominator.

If you want to count NULLs as zero, you will need to use SUM and COUNT. However, this is probably not a good idea if the NULL values truly just represent unknown values for a cell.

MEDIAN - Expert Tip
One quick note that a median might be a more appropriate measure of center for this data, but finding the median happens to be a pretty difficult thing to get using SQL alone — so difficult that finding a median is occasionally asked as an interview question.
# GROUP BY
The key takeaways here:

GROUP BY can be used to aggregate data within subsets of the data. For example, grouping for different accounts, different regions, or different sales representatives.
Any column in the SELECT statement that is not within an aggregator must be in the GROUP BY clause.
The GROUP BY always goes between WHERE and ORDER BY.
ORDER BY works like SORT in spreadsheet software.
# GROUP BY - Expert Tip
Before we dive deeper into aggregations using GROUP BY statements, it is worth noting that SQL evaluates the aggregations before the LIMIT clause. If you don’t group by any columns, you’ll get a 1-row result—no problem there. If you group by a column with enough unique values that it exceeds the LIMIT number, the aggregates will be calculated, and then some rows will simply be omitted from the results.

This is actually a nice way to do things because you know you’re going to get the correct aggregates. If SQL cuts the table down to 100 rows, then performed the aggregations, your results would be substantially different. The above query’s results exceed 100 rows, so it’s a perfect example. In the next concept, use the SQL environment to try removing the LIMIT and running it again to see what changes.
# Subqueries
# Differences between Subqueries and Joins

Often, SQL users will question the differences between joins and subqueries. After all, they essentially do the same thing: join tables together to create a single output. However, there are times when subqueries are more appropriate than joins and vice versa. In this section of our lesson, we’ll cover the differences between the two and when to use each.
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
Deep-dive topics:

What happens under the hood: Query plans are similar for both subqueries and joins. You can read more about how query plans are here. We will not be going in-depth for these in this lesson.
Subquery vs Joins Overview
Components 	Subquery 	JOINS
Combine data from multiple tables into a single result 	X 	X
Create a flexible view of tables stitched together using a “key” 		X
Build an output to use in a later part of the query 	X 	
Subquery Plan: What happens under the hood 	X 	X
Example from the Video

This query cannot be run in our workspaces it is just an example

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

