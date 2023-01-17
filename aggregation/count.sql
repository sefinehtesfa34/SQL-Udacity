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