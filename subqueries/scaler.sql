SELECT 
   (SELECT MAX(salary) FROM employees_db) AS top_salary,
   employee_name
FROM employees_db;