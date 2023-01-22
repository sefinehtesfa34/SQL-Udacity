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
