SELECT *
FROM students
WHERE student_id
IN (SELECT DISTINCT student_id
    FROM gpa_table
    WHERE gpa>3.5
    );

