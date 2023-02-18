SELECT COUNT(*)
FROM accounts; -- Will return one number which is the count of the numebr of rows
-- But we could have just as easily chosen a column to drop into the aggregation function:

SELECT COUNT(accounts.id)
FROM accounts;
-- These two statements are equivalent, but this isn't always the case, which we will see in the next video.


SELECT COUNT(*) AS order_count
FROM orders
WHERE occurred_at >= '2016-12-01'
AND occurred_at < '2017-01-01'

-- Notice that COUNT does not consider rows that have NULL values. Therefore, this can be useful for quickly identifying which rows have missing data. You will learn GROUP BY in an upcoming concept, and then each of these aggregators will become much more useful.

-- Code from the Video
Query 1
SELECT COUNT (*) AS account_count
FROM accounts
Query 2
SELECT COUNT (id) AS account_id_count
FROM accounts
Query 3
SELECT COUNT(primary_poc) AS account_primary_poc_count
FROM accounts
Query 4
Example: there will not be any NULL values in the workspace.

SELECT *
FROM accounts
WHERE primary_poc IS NULL

