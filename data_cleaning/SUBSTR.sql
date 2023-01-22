-- Syntax
-- Substr: Extracts a substring from a string (starting at any position)
SUBSTR(string, start, length)
SUBSTR(student_information, 11, 1) AS gender

SELECT date orig_date, (SUBSTR(date, 7, 4) || '-' || LEFT(date, 2) || '-' || SUBSTR(date, 4, 2)) new_date
FROM sf_crime_data;
