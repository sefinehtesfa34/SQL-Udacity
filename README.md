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

# Window functions

Window functions are sometimes confusing to figure out. When exactly do you use them? When are they appropriate over aggregate functions? There are two use cases that I’ve experienced where window functions are particularly helpful.

When you want to measure trends or changes over rows or records in your data.
When you want to rank a column for outreach or prioritization.
A few cases where you’d have these needs are described below:

Measuring change over time:
Has the average price of airline tickets gone up this year?
What’s the best way to keep the running total orders of customers?
The ranking used for outreach prioritization:
Use a combination of factors to rank companies most likely to need a loan.

The following terms will be covered over the course of this lesson broken into three types of window functions: core, ranking, and advanced. Note that the naming of these window functions are specific to this course. Most users call all of the functions below “window functions.”

Partition by: A subclause of the OVER clause. Similar to GROUP BY.
Over: Typically precedes the partition by that signals what to “GROUP BY”.
Aggregates: Aggregate functions that are used in window functions, too (e.g., sum, count, avg).
Row_number(): Ranking function where each row gets a different number.
Rank(): Ranking function where a row could get the same rank if they have the same value.
Dense_rank(): Ranking function similar to rank() but ranks are not skipped with ties.
Aliases: Shorthand that can be used if there are several window functions in one query.
Percentiles: Defines what percentile a value falls into over the entire table.
Lag/Lead: Calculating differences between rows’ values.

Syntax
AGGREGATE_FUNCTION (column_1) OVER
 (PARTITION BY column_2 ORDER BY column_3)
  AS new_column_name;
As a reminder, a window function allows users to compare one row to another without doing any joins. Window functions are effective when you want to measure trends over time or rank a specific column, and it retains the total number of records without collapsing or condensing any of the original datasets.

There are a few key terms to review as a part of understanding core window functions:

PARTITION BY: A subclause of the OVER clause. I like to think of PARTITION BY as the GROUP BY equivalent in window functions. PARTITION BY allows you to determine what you’d like to “group by” within the window function. Most often, you are partitioning by a month, region, etc. as you are tracking changes over time.
OVER: This syntax signals a window function and precedes the details of the window function itself.
The sequence of Code for Window Functions
Typically, when you are writing a window function that tracks changes or a metric over time, you are likely to structure your syntax with the following components:

An aggregation function (e.g., sum, count, or average) + the column you’d like to track
OVER
PARTITION BY + the column you’d like to “group by”
ORDER BY (optional and is often a date column)
AS + the new column name
We’ll review the key differences between aggregate functions/group by queries and window functions in the next section of this lesson.


There are three types of ranking functions that serve the same use case: how to take a column and rank its values. The choice of which ranking function to use is up to the SQL user, often created in conjunction with someone on a customer or business team.

Row_number(): Ranking is distinct amongst records even with ties in what the table is ranked against.
Rank(): Ranking is the same amongst tied values and ranks skip for subsequent values.
Dense_rank(): Ranking is the same amongst tied values and ranks do not skip for subsequent values.

Aliases Use Case
If you are planning to write multiple window functions that leverage the same PARTITION BY, OVER, and ORDER BY in a single query, leveraging aliases will help tighten your syntax.

Details of Aliases
A monthly_window alias function is defined at the end of the query in the WINDOW clause.
It is then called on each time an aggregate function is used within the SELECT clause.
Code from the Video*

SELECT order_id,
       order_total,
       order_price,
       SUM(order_total) OVER monthly_window AS running_monthly_sales,
       COUNT(order_id) OVER monthly_window AS running_monthly orders,
       AVG(order_price) OVER monthly_window AS average_monthly_price
FROM   amazon_sales_db
WHERE  order_date < '2017-01-01'
WINDOW monthly_window AS
       (PARTITION BY month(order_date) ORDER BY order_date);
*Note - This code will not run as written in the Workspaces


Instructor Notes

Let’s look at this again. We have broken down the syntax to explain LAG and LEAD functions separately.

### LAG function
Purpose

It returns the value from a previous row to the current row in the table.

Step 1:

Let’s first look at the inner query and see what this creates.

SELECT     account_id, SUM(standard_qty) AS standard_sum
FROM       orders
GROUP BY   1
What you see after running this SQL code:

The query sums the standard_qty amounts for each account_id to give the standard paper each account has purchased overall time. E.g., account_id 2951 has purchased 8181 units of standard paper.
Notice that the results are not ordered by account_id or standard_qty.

Step 2:

We start building the outer query, and name the inner query as sub.

SELECT account_id, standard_sum   
FROM   (
        SELECT   account_id, SUM(standard_qty) AS standard_sum
        FROM     orders
        GROUP BY 1
       ) sub
This still returns the same table you see above, which is also shown below.


Step 3 (Part A):
We add the Window Function OVER (ORDER BY standard_sum) in the outer query that will create a result set in ascending order based on the standard_sum column.

SELECT account_id, 
       standard_sum,
       LAG(standard_sum) OVER (ORDER BY standard_sum) AS lag
FROM   (
        SELECT   account_id, SUM(standard_qty) AS standard_sum
        FROM     orders
        GROUP BY 1
       ) sub
This ordered column will set us up for the other part of the Window Function (see below).

Step 3 (Part B):

The LAG function creates a new column called lag as part of the outer query: LAG(standard_sum) OVER (ORDER BY standard_sum) AS lag. This new column named lag uses the values from the ordered standard_sum (Part A within Step 3).

SELECT account_id,
       standard_sum,
       LAG(standard_sum) OVER (ORDER BY standard_sum) AS lag
FROM   (
        SELECT   account_id,
                 SUM(standard_qty) AS standard_sum
        FROM     orders
        GROUP BY 1
       ) sub
Each row’s value in lag is pulled from the previous row. E.g., for account_id 1901, the value in lag will come from the previous row. However, since there is no previous row to pull from, the value in lag for account_id 1901 will be NULL. For account_id 3371, the value in lag will be pulled from the previous row (i.e., account_id 1901), which will be 0. This goes on for each row in the table.

What you see after running this SQL code:


Step 4:
To compare the values between the rows, we need to use both columns (standard_sum and lag). We add a new column named lag_difference, which subtracts the lag value from the value in standard_sum for each row in the table:
standard_sum - LAG(standard_sum) OVER (ORDER BY standard_sum) AS lag_difference

SELECT account_id,
       standard_sum,
       LAG(standard_sum) OVER (ORDER BY standard_sum) AS lag,
       standard_sum - LAG(standard_sum) OVER (ORDER BY standard_sum) AS lag_difference
FROM (
       SELECT account_id,
       SUM(standard_qty) AS standard_sum
       FROM orders 
       GROUP BY 1
      ) sub
Each value in lag_difference is comparing the row values between the 2 columns (standard_sum and lag). E.g., since the value for lag in the case of account_id 1901 is NULL, the value in lag_difference for account_id 1901 will be NULL. However, for account_id 3371, the value in lag_difference will compare the value 79 (standard_sum for account_id 3371) with 0 (lag for account_id 3371) resulting in 79. This goes on for each row in the table.

What you see after running this SQL code:


Code from the Video

Query1

SELECT account_id,
       standard_sum,
       LAG(standard_sum) OVER(ORDER BY standard_sum) AS lag,
       LEAD(standard_sum) OVER (ORDER BY standard_sum) AS lead
FROM (
       SELECT account_id,
              SUM(standard_qty) AS standard_sum
       FROM orders
       GROUP BY 1
) sub
Query2

SELECT account_id,
       standard_sum,
       LAG(standard_sum) OVER(ORDER BY standard_sum) AS lag,
       LEAD(standard_sum) OVER (ORDER BY standard_sum) AS lead,
       standard_sum - LAG(standard_sum) OVER (ORDER BY standard_sum) AS lag_difference,
       LEAD(standard_sum) OVER (ORDER BY standard_sum) - standard_sum AS lead_difference
FROM (
       SELECT account_id,
              SUM(standard_qty) AS standard_sum
       FROM orders
       GROUP BY 1
) sub


# Percentiles Use Case
When there are a large number of records that need to be ranked, individual ranks (e.g., 1, 2, 3, 4…) are ineffective in helping teams determine the best of the distribution from the rest. Percentiles help better describe large datasets. For example, a team might want to reach out to the Top 5% of customers.

You can use window functions to identify what percentile (or quartile, or any other subdivision) a given row falls into. The syntax is NTILE(# of buckets). In this case, ORDER BY determines which column to use to determine the quartiles (or whatever number of ‘tiles you specify).

Percentiles Syntax
The following components are important to consider when building a query with percentiles:

NTILE + the number of buckets you’d like to create within a column (e.g., 100 buckets would create traditional percentiles, 4 buckets would create quartiles, etc.)
OVER
ORDER BY (optional, typically a date column)
AS + the new column name
Expert Tip
In cases with relatively few rows in a window, the NTILE function doesn’t calculate exactly as you might expect. For example, If you only had two records and you were measuring percentiles, you’d expect one record to define the 1st percentile, and the other record to define the 100th percentile. Using the NTILE function, what you’d actually see is one record in the 1st percentile, and one in the 2nd percentile.

In other words, when you use an NTILE function but the number of rows in the partition is less than the NTILE(number of groups), then NTILE will divide the rows into as many groups as there are members (rows) in the set but then stop short of the requested number of groups. If you’re working with very small windows, keep this in mind and consider using quartiles or similarly small bands.


Code from the Video*

NTILE(# of buckets) OVER (ORDER BY ranking_column) AS new_column_name

SELECT  customer_id,
        composite_score,
        NTILE(100) OVER(ORDER BY composite_score) AS percentile
FROM    customer_lead_score;
*Note - This code will not run as written in the Workspaces


# Glossary:
KeyTerm	Definition
Aggregates	Aggregate functions that are used in window functions, too (e.g., sum, count, avg).
Aliases	Shorthand that can be used if there are several window functions in one query.
Dense_rank()	Ranking function similar to rank() but ranks are not skipped with ties.
Dense_rank()	Ranking is the same amongst tied values and ranks do not skip for subsequent values.
Lag/Lead	Calculating differences between rows’ values.
Over	Typically precedes the partition by that signals what to “GROUP BY”.
Partition by	A subclause of the OVER clause. Similar to GROUP BY.
Percentiles	Defines what percentile a value falls into over the entire table.
Rank()	Ranking function where a row could get the same rank if they have the same value.
Rank()	Ranking is the same amongst tied values and ranks skip for subsequent values.
Row_number()	Ranking function where each row gets a different number.
Row_number()	Ranking is distinct amongst records even with ties in what the table is ranked against.




# Advanced sql joins
Appending Data via UNION
UNION Use Case
The UNION operator is used to combine the result sets of 2 or more SELECT statements. It removes duplicate rows between the various SELECT statements.
Each SELECT statement within the UNION must have the same number of fields in the result sets with similar data types.
Typically, the use case for leveraging the UNION command in SQL is when a user wants to pull together distinct values of specified columns that are spread across multiple tables. For example, a chef wants to pull together the ingredients and respective aisle across three separate meals that are maintained within different tables.
Details of UNION
There must be the same number of expressions in both SELECT statements.
The corresponding expressions must have the same data type in the SELECT statements.
For example:
Expression1 must be the same data type in both the first and second SELECT statement.
Expert Tip
UNION removes duplicate rows.
UNION ALL does not remove duplicate rows
