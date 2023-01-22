-- Simple Subquery
WITH dept_average AS 
  (SELECT dept, AVG(salary) AS avg_dept_salary
   FROM employee
   GROUP BY employee.dept
  )
SELECT E.eid, E.ename, D.avg_dept_salary
FROM employee E
JOIN dept.average D
ON E.dept = D.dept
WHERE E.salary > D.avg_dept_salary

-- Correlated Subquery
SELECT employee_id,
       name
FROM employees_db emp
WHERE salary > 
      (SELECT AVG(salary)
       FROM employees_db
       WHERE department = emp.department
      );
-- The second concept to consider before writing any code is the dependency of your subquery to the larger query. 
-- A subquery can either be simple or correlated. 
-- In my experience, it’s better to keep subqueries simple to increase readability 
-- for other users that might leverage your code to run or adjust.

-- Simple Subquery: The inner subquery is completely independent of the larger query.

-- Correlated Subquery: The inner subquery is dependent on the larger query.
-- When to use Correlated Query
-- However, sometimes, it’s slick to include a correlated subquery, specifically 
-- when the value of the inner query is dependent on a value outputted 
-- from the main query (e.g., the filter statement constantly changes). 
-- In the example below, you’ll notice that the value of the inner query 
-- average GPA -- keeps adjusting depending on the university the student goes to. 
-- THAT is a great use case for the correlated subquery.

SELECT first_name, last_name, GPA, university
 FROM student_db outer_db
 WHERE GPA >
                (SELECT AVG(GPA)
                 FROM student_db
                 WHERE university = outer_db.university);
                 