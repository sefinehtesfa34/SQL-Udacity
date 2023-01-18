-- HAVING - Expert Tip
-- HAVING is the “clean” way to filter a query that has been aggregated, but this is also commonly done using a subquery. Essentially, 
-- any time you want to perform a WHERE on an element of your query that was created by an aggregate, you need to use HAVING instead.
SELECT account_id,
       SUM(total_amt_usd) AS sum_total_amt_usd
FROM orders
GROUP BY 1
ORDER BY 2 DESC

SELECT account_id,
       SUM(total_amt_usd) AS sum_total_amt_usd
FROM orders
WHERE SUM(total_amt_usd) >= 250000
GROUP BY 1 -- equal to say GROUP BY account_id 
ORDER BY 2 DESC --Equal to say GROUP BY sum_total_amt_usd

SELECT account_id,
       SUM(total_amt_usd) AS sum_total_amt_usd
FROM orders
GROUP BY 1
HAVING SUM(total_amt_usd) >= 250000

SELECT account_id,
       SUM(total_amt_usd) AS sum_total_amt_usd
FROM orders
GROUP BY 1
HAVING SUM(total_amt_usd) >= 250000

-- How many of the sales reps have more than 5 accounts that they manage?

SELECT s.id, s.name, COUNT(*) num_accounts
FROM accounts a
JOIN sales_reps s
ON s.id = a.sales_rep_id
GROUP BY s.id, s.name
HAVING COUNT(*) > 5
ORDER BY num_accounts;

-- How many accounts have more than 20 orders
SELECT a.id, a.name, COUNT(*) counts
FROM accounts a 
JOIN orders o
ON o.account_id = a.id
GROUP BY a.id, a.name
HAVING COUNT(*) > 20
ORDER BY counts