SELECT dept_name,
       max_gpa
FROM department_db x
     (SELECT dept_id
             MAX(gpa) as max_gpa
      FROM students
      GROUP BY dept_id
      )y
WHERE x.dept_id = y.dept_id
ORDER BY dept_name;


-- Use Case for Inline Subquery
-- It is a very similar use case to ‘With’ subqueries.
-- Inline subqueries create a “pseudo table” that aggregates or manipulates an existing table to be used in a larger query.
-- The disadvantage of the inline subquery is that it is not easy to read.
-- Code from the video
-- Does not work in our workspaces

-- Inline Query
SELECT dept_name,
       max_gpa
FROM department_db x
     (SELECT dept_id
             MAX(gpa) as max_gpa
      FROM students
      GROUP BY dept_id
      )y
WHERE x.dept_id = y.dept_id
ORDER BY dept_name;
Quiz Time
