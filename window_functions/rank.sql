SELECT ROW_NUMBER() OVER(ORDER BY date_time) AS rank,
       date_time
FROM   db;
SELECT RANK() OVER(ORDER BY date_time) AS rank,
       date_time
FROM   db;

SELECT DENSE_RANK() OVER(ORDER BY date_time) AS rank,
       date_time
FROM   db;
*Note - This code will not run in Workspaces as written
