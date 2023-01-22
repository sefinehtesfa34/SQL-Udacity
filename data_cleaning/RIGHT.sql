-- Syntax
-- Left: Extracts a # of characters from a string starting from the left
-- Right: Extracts a # of characters from a string starting from the right
LEFT(student_information, 8) AS student_id
RIGHT(student_information, 6) AS salary

SELECT RIGHT(website, 3) AS domain, COUNT(*) num_companies
FROM accounts
GROUP BY 1
ORDER BY 2 DESC;


