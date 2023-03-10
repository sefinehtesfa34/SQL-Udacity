SELECT 
   (SELECT MAX(salary) FROM employees_db) AS top_salary,
   employee_name
FROM employees_db;


-- Use Case for Scalar subquery placement
-- It selects only one column or expression and returns one row, used in the select clause of the main query
-- It has the advantage of performance or if the data set is small
-- Details:
-- If a scalar subquery does not find a match, it returns a NULL.
-- If a scalar subquery finds multiple matches, it returns an ERROR.
-- Code from the video
-- Does not work in our workspaces

Scalar Query
SELECT 
   (SELECT MAX(salary) FROM employees_db) AS top_salary,
   employee_name
FROM employees_db;
