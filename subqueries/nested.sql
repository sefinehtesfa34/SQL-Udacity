SELECT *
FROM students
WHERE student_id
IN (SELECT DISTINCT student_id
    FROM gpa_table
    WHERE gpa>3.5
    );

-- Use Case for a Nested Subquery
-- When a user wants to filter an output using a condition met from another table.
-- This type of placement also has advantages for making the code easy to read.
-- Code from Video
-- Does not work in our workspaces

-- Nested Query
SELECT *
FROM students
WHERE student_id
IN (SELECT DISTINCT student_id
    FROM gpa_table
    WHERE gpa>3.5
    );
