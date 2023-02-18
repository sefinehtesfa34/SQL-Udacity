SELECT MIN(standard_qty) AS standard_min,
       MIN(gloss_qty) AS gloss_min,
       MIN(poster_qty) AS poster_min,
       MAX(standard_qty) AS standard_max,
       MAX(gloss_qty) AS gloss_max,
       MAX(poster_qty) AS poster_max
FROM   orders

-- Notice that here we were simultaneously obtaining the MIN and MAX number of orders of each paper type. However, you could run each individually.

-- Notice that MIN and MAX are aggregators that again ignore NULL values. Check the expert tip below for a cool trick with MAX & MIN.

-- Expert Tip
-- Functionally, MIN and MAX are similar to COUNT in that they can be used on non-numerical columns. Depending on the column type, MIN will return the lowest number, earliest date, or non-numerical value as early in the alphabet as possible. As you might suspect, MAX does the opposite—it returns the highest number, the latest date, or the non-numerical value closest alphabetically to “Z.”

-- Code from the Video
-- Query 1
SELECT MIN(standard_qty) AS standard_min,
       MIN(gloss_qty) AS gloss_min,
       MIN(poster_qty) AS poster_min,
       MAX(standard_qty) AS standard_max,
       MAX(gloss_qty) AS gloss_max,
       MAX(poster_qty) AS poster_max
FROM   orders



-- Questions: MIN, MAX, & AVERAGE
-- Use the SQL environment below to assist with answering the following questions. Whether you get stuck or you just want to double-check your solutions, my answers can be found at the top of the next concept.

-- When was the earliest order ever placed? You only need to return the date.

-- Try performing the same query as in question 1 without using an aggregation function.

-- When did the most recent (latest) web_event occur?

-- Try to perform the result of the previous query without using an aggregation function.

-- Find the mean (AVERAGE) amount spent per order on each paper type, as well as the mean amount of each paper type purchased per order. Your final answer should have 6 values - one for each paper type for the average number of sales, as well as the average amount.

-- Via the video, you might be interested in how to calculate the MEDIAN. Though this is more advanced than what we have covered so far try finding - what is the MEDIAN total_usd spent on all orders?


Solutions: MIN, MAX, and AVERAGE
1: When was the earliest order ever placed?

SELECT MIN(occurred_at) 
FROM orders;
2: Try performing the same query as in question 1 without using an aggregation function.

SELECT occurred_at 
FROM orders 
ORDER BY occurred_at
LIMIT 1;
3: When did the most recent (latest) web_event occur?

SELECT MAX(occurred_at)
FROM web_events;
4: Try to perform the result of the previous query without using an aggregation function.

SELECT occurred_at
FROM web_events
ORDER BY occurred_at DESC
LIMIT 1;
5: Find the mean (AVERAGE) amount spent per order on each paper type, as well as the mean amount of each paper type purchased per order. Your final answer should have 6 values - one for each paper type for the average number of sales, as well as the average amount.

SELECT AVG(standard_qty) mean_standard, AVG(gloss_qty) mean_gloss, 
        AVG(poster_qty) mean_poster, AVG(standard_amt_usd) mean_standard_usd, 
        AVG(gloss_amt_usd) mean_gloss_usd, AVG(poster_amt_usd) mean_poster_usd
FROM orders;
-- 6: Via the video, you might be interested in how to calculate the MEDIAN. 
-- Though this is more advanced than what we have covered so far try finding - 
-- what is the MEDIAN total_usd spent on all orders? Note, this is more advanced 
-- than the topics we have covered thus far to build a general solution, but we can hard code a 
-- solution in the following way.

SELECT *
FROM (SELECT total_amt_usd
   FROM orders
   ORDER BY total_amt_usd
   LIMIT 3457) AS Table1
ORDER BY total_amt_usd DESC
LIMIT 2;
-- Since there are 6912 orders - we want the average of the 3457 
-- and 3456 order amounts when ordered. This is the average of 2483.16 
-- and 2482.55. This gives the median of 2482.855. This obviously isnt 
-- an ideal way to compute. If we obtain new orders, we would have to change the limit. 
-- SQL didnt even calculate the median for us. The above used a SUBQUERY, but you could use 
-- any method to find the two necessary values, and then you just need the average of them.







