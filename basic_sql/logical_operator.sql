-- Introduction to Logical Operators
-- In the next concepts, you will be learning about Logical Operators. Logical Operators include:

-- LIKE This allows you to perform operations similar to using WHERE and =, but for cases when you might not know exactly what you are looking for.

-- IN This allows you to perform operations similar to using WHERE and =, but for more than one condition.

-- NOT This is used with IN and LIKE to select all of the rows NOT LIKE or NOT IN a certain condition.

-- AND & BETWEEN These allow you to combine operations where all combined conditions must be true.

-- OR This allows you to combine operations where at least one of the combined conditions must be true.

-- Don't worry if this doesn't make total sense right now. You will get practice with each in the next sections.


-- The LIKE operator is extremely useful for working with text. 
-- You will use LIKE within a WHERE clause. The LIKE operator is frequently used with %. 
-- The % tells us that we might want any number of characters leading up to a particular 
-- set of characters or following a certain set of characters, as we saw with the google syntax above. 
-- Remember you will need to use single quotes for the text you pass to the LIKE 
-- operator because these lower and uppercase letters are not the same within the string. 
-- Searching for 'T' is not the same as searching for 't'. In other SQL environments 
-- (outside the classroom), you can use either single or double-quotes.

-- Hopefully, you are starting to get more comfortable with SQL, 
-- as we are starting to move toward operations that have more applications, 
-- but this also means we can't show you every use case. Hopefully, 
-- you can start to think about how you might use these types of applications to 
-- identify phone numbers from a certain region or an individual where you can't 
-- quite remember the full name.



-- This code has been modified to work properly with the data schema in our workspace, 
-- but functions the same as the code in the video.

SELECT *
FROM accounts
WHERE website LIKE '%google%';


-- Questions using the LIKE operator
-- Use the accounts table to find

-- All the companies whose names start with 'C'.
-- All companies whose names contain the string 'one' somewhere in the name.
-- All companies whose names end with 's'.

-- Solutions for LIKE operator

SELECT name
FROM accounts
WHERE name LIKE 'C%';
SELECT name
FROM accounts
WHERE name LIKE '%one%';
SELECT name
FROM accounts
WHERE name LIKE '%s';

