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
