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