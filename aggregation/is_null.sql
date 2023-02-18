SELECT * FROM accounts WHERE primary_poc IS NOT NULL
-- Notice that NULLs are different than a zero - they are cells where data does not exist.

-- When identifying NULLs in a WHERE clause, we write IS NULL or IS NOT NULL. We don't use =, because NULL isn't considered a value in SQL. Rather, it is a property of the data.

NULLs - Expert Tip
-- There are two common ways in which you are likely to encounter NULLs:

-- NULLs frequently occur when performing a LEFT or RIGHT JOIN. You saw in the last lesson - when some rows in the left table of a left join are not matched with rows in the right table, those rows will contain some NULL values in the result set.
-- NULLs can also occur from simply missing data in our database.
-- Code from the Video
Query 1
SELECT *
FROM accounts
WHERE id > 1500 and id < 1600
Query 2
SELECT *
FROM accounts
WHERE primary_poc = NULL
Query 3
SELECT *
FROM accounts
WHERE primary_poc IS NOT NULL

