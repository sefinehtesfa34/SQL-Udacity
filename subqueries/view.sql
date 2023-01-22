create view v1
as
select S.id, S.name as Rep_Name, R.name as Region_Name
from sales_reps S
join region R
on S.region_id = R.id
and R.name = 'Northeast';


CREATE VIEW V2
AS
SELECT r.name region, a.name account, 
       o.total_amt_usd/(o.total + 0.01) unit_price
FROM region r
JOIN sales_reps s
ON s.region_id = r.id
JOIN accounts a
ON a.sales_rep_id = s.id
JOIN orders o
ON o.account_id = a.id;

-- You can save the result set of the query as a view (virtual table) with the name 
-- “V2” that can be queried later.

-- Note - You can use any SELECT query in the CREATE VIEW query. 
-- The above two examples show a join query, whereas the next example shows a subquery used in creating a view.


-- Example 3 - The subquery you saw earlier, can be also stored as a view.

-- Show the report which channels send the most traffic per day on average to Parch and Posey.

CREATE VIEW V3
AS
SELECT channel, AVG(events) AS average_events
FROM (SELECT DATE_TRUNC('day',occurred_at) AS day,
                channel, COUNT(*) as events
         FROM web_events 
         GROUP BY 1,2) sub
GROUP BY channel

-- Now, this view can be queried for any information that it contains. 
-- For example, you can see the maximum value of average_events as:

select max(average_events)
from v3;



-- The Question
-- Now our questions to answer in this section are:

-- What is the top channel used by each account to market products?
-- How often was that same channel used?
-- However, we will need to do two aggregations and two subqueries to make this happen.

-- Let's find the number of times each channel is used by each account.

-- So we will need to count the number of rows by Account and Channel. This count will be our first aggregation needed.

SELECT accounts.name, web_events.channel, Count(*)
FROM accounts
JOIN web_events ON accounts.id = Web_events.account_id
GROUP BY 1, 2
ORDER BY 1,3


-- Ok, now we have how often each channel was used by each account. 
-- How do we only return the most used account (or accounts if multiple are tied for the most)?




-- Ok, now we have how often each channel was used by each account. 
-- How do we only return the most used account (or accounts if multiple are tied for the most)?
-- We need to see which usage of the channel in our first query is equal to the maximum usage channel for that account. 
-- So, a keyword should jump out to you - maximum. 
-- This will be our second aggregation and it utilizes the data from the first 
-- table we returned so this will be our subquery. Let's take the maximum count from each account
--  to create a table with the maximum usage channel amount per account.

SELECT T1.name, Max(T1.count)
FROM (
       SELECT accounts.name as name, web_events.channel as channel, Count(*) as count
       FROM accounts
       JOIN web_events ON accounts.id = Web_events.account_id
       GROUP BY 1, 2
       ORDER BY 1,3
) as T1
GROUP BY 1