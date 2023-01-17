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