-- Before writing any code, a strong SQL user considers what problem he or she is trying to solve, where the subquery needs to be placed, and larger tradeoffs (e.g., readability).

-- The key concept of placement is where exactly the subquery is placed within the context of the larger query. There are four different places where a subquery can be inserted. From my experience, the decision of which placement to leverage stems from (1) the problem at hand and (2) the readability of the query.

-- Subquery Placement:
-- With: This subquery is used when you’d like to “pseudo-create” a table from an existing table and visually scope the temporary table at the top of the larger query.

-- Nested: This subquery is used when you’d like the temporary table to act as a filter within the larger query, which implies that it often sits within the where clause.

-- Inline: This subquery is used in the same fashion as the WITH use case above. However, instead of the temporary table sitting on top of the larger query, it’s embedded within the from clause.

-- Scalar: This subquery is used when you’d like to generate a scalar value to be used as a benchmark of some sort.

-- For example, when you’d like to calculate the average salary across an entire organization to compare to individual employee salaries. Because it’s often a single value that is generated and used as a benchmark, the scalar subquery often sits within the select clause.

-- Advantages:
-- Readability: With and Nested subqueries are most advantageous for readability.

-- Performance: Scalar subqueries are advantageous for performance and are often used on smaller datasets.

-- Quiz time
-- Use the image below for the quiz towards the end of the page. We know that you have not seen the detailed examples of subquery placements yet, but this is a good exercise to start building intuition around the placement of subqueries. So give it a try! Subquery placements are a tricky topic, so lets get more practice with it.

1:

WITH subquery_name (column_name1, ...) AS
 (SELECT ...)
SELECT ...
2:

SELECT student_name
FROM
  (SELECT student_id, student_name, grade
   FROM student
   WHERE teacher =10)
WHERE grade >80;

3:

SELECT s.s_id, s.s_name, g.final_grade
FROM student s, grades g
WHERE s.s_id = g.s_id
IN (SELECT final_grade
    FROM grades g
    WHERE final_grade >3.7
   );

4:

SELECT s.student_name
  (SELECT AVG(final_score)
   FROM grades g
   WHERE g.student_id = s.student_id) AS
     avg_score
FROM student s;



-- Subqueries
-- In the video above, we review what it’s really like to build and execute a subquery. You’ll notice the following order of operations.

-- Build the Subquery: The aggregation of an existing table that you’d like to leverage as a part of the larger query.
-- Run the Subquery: Because a subquery can stand independently, it’s important to run its content first to get a sense of whether this aggregation is the interim output you are expecting.
-- Encapsulate and Name: Close this subquery off with parentheses and call it something. In this case, we called the subquery table ‘sub.’
-- Test Again: Run a SELECT * within the larger query to determine if all syntax of the subquery is good to go.
-- Build Outer Query: Develop the SELECT * clause as you see fit to solve the problem at hand, leveraging the subquery appropriately.
-- Now, it’s time to try your hand at building subqueries. Run through the checklist below -- Good luck!

-- Code from Video
SELECT channel,
       AVG(event_count) AS avg_event_count
FROM
(SELECT DATE_TRUNC('day',occurred_at) AS day,
        channel,
        count(*) as event_count
   FROM web_events
   GROUP BY 1,2
   ) sub
   GROUP BY 1
   ORDER BY 2 DESC

-- Solutions to Your First Subquery
-- First, we needed to group by the day and channel. Then ordering by the number of events (the third column) gave us a quick way to answer the first question.

SELECT DATE_TRUNC('day',occurred_at) AS day,
       channel, COUNT(*) as events
FROM web_events
GROUP BY 1,2
ORDER BY 3 DESC;
-- Here you can see that to get the entire table in question 1 back, we included an * in our SELECT statement. You will need to be sure to alias your table.

SELECT *
FROM (SELECT DATE_TRUNC('day',occurred_at) AS day,
                channel, COUNT(*) as events
          FROM web_events 
          GROUP BY 1,2
          ORDER BY 3 DESC) sub;
-- Finally, here we are able to get a table that shows the average number of events a day for each channel.

SELECT channel, AVG(events) AS average_events
FROM (SELECT DATE_TRUNC('day',occurred_at) AS day,
                channel, COUNT(*) as events
         FROM web_events 
         GROUP BY 1,2) sub
GROUP BY channel
ORDER BY 2 DESC;


-- Subquery Formatting
-- The first concept that helps when thinking about the format of a subquery is the placement of it: with, nested, inline, or scalar.

-- The second concept to consider is an indentation, which helps heighten readability for your future self or other users that want to leverage your code. The examples in this class are indented quite far—all the way to the parentheses. This isn’t practical if you nest many subqueries, but in general, be thinking about how to write your queries in a readable way. Examples of the same query written in multiple different ways are provided below. You will see that some are much easier to read than others.

-- Badly Formatted Queries
-- Though these poorly formatted examples will execute the same way as the well-formatted examples, 
-- they just arent very friendly for understanding what is happening!

-- Here is the first, where it is impossible to decipher what is going on:

SELECT * FROM (SELECT DATE_TRUNC('day',occurred_at) AS day, channel, COUNT(*) as events FROM web_events GROUP BY 1,2 ORDER BY 3 DESC) sub;
-- This second version, which includes some helpful line breaks, is easier to read than the previous version, but it is still not as easy to read as the queries in the Well Formatted Query section.

SELECT *
FROM (
SELECT DATE_TRUNC('day',occurred_at) AS day,
channel, COUNT(*) as events
FROM web_events 
GROUP BY 1,2
ORDER BY 3 DESC) sub;
Well Formatted Query
-- Now for a well-formatted example, you can see the table we are pulling from much easier than in the previous queries.

SELECT *
FROM (SELECT DATE_TRUNC('day',occurred_at) AS day,
                channel, COUNT(*) as events
      FROM web_events 
      GROUP BY 1,2
      ORDER BY 3 DESC) sub;
-- Additionally, if we have a GROUP BY, ORDER BY, WHERE, HAVING, or any other statement following our subquery, we would then indent it at the same level as our outer query.

-- The query below is similar to the above, but it is applying additional statements to the outer query, so you can see there are GROUP BY and ORDER BY statements used on the output and are not tabbed. The inner query GROUP BY and ORDER BY statements are indented to match the inner table.

SELECT *
FROM (SELECT DATE_TRUNC('day',occurred_at) AS day,
                channel, COUNT(*) as events
      FROM web_events 
      GROUP BY 1,2
      ORDER BY 3 DESC) sub
GROUP BY day, channel, events
ORDER BY 2 DESC;



-- Expert Tip
-- Note that you should not include an alias when you write a subquery in a conditional statement. This is because the subquery is treated as an individual value (or set of values in the IN case) rather than as a table. Nested and Scalar subqueries often do not require aliases the way With and Inline subqueries do.

-- Code from the video
-- You can test this query in our workspace below!

-- Nested Subquery
SELECT *
FROM orders
WHERE DATE_TRUNC('month',occurred_at) =
 (SELECT DATE_TRUNC('month',MIN(occurred_at)) AS min_month
  FROM orders)
ORDER BY occurred_at


-- Queries Needed to Find the Solutions to the Previous Quiz
-- Here is the necessary quiz to pull the first month/year combo from the orders table.
SELECT DATE_TRUNC('month', MIN(occurred_at)) 
FROM orders;
-- Then to pull the average for each, we could do this all in one query, but for readability, I provided two queries below to perform each separately.
SELECT AVG(standard_qty) avg_std, AVG(gloss_qty) avg_gls, AVG(poster_qty) avg_pst
FROM orders
WHERE DATE_TRUNC('month', occurred_at) = 
     (SELECT DATE_TRUNC('month', MIN(occurred_at)) FROM orders);

SELECT SUM(total_amt_usd)
FROM orders
WHERE DATE_TRUNC('month', occurred_at) = 
      (SELECT DATE_TRUNC('month', MIN(occurred_at)) FROM orders);


Erratum: At timestamp 0:35 in the video above, the "Simple" query under the slide titled "B. Subqueries: Simple vs. Correlated" needs a minor correction. The correct query is shown in the query below:

-- Code from the video
-- Does not work in our workspaces

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
-- The second concept to consider before writing any code is the dependency of your subquery to the larger query. A subquery can either be simple or correlated. In my experience, it’s better to keep subqueries simple to increase readability for other users that might leverage your code to run or adjust.

-- Simple Subquery: The inner subquery is completely independent of the larger query.

-- Correlated Subquery: The inner subquery is dependent on the larger query.

-- When to use Correlated Query
-- However, sometimes, it’s slick to include a correlated subquery, specifically when the value of the inner query is dependent on a value outputted from the main query (e.g., the filter statement constantly changes). In the example below, you’ll notice that the value of the inner query -- average GPA -- keeps adjusting depending on the university the student goes to. THAT is a great use case for the correlated subquery.

SELECT first_name, last_name, GPA, university
 FROM student_db outer_db
 WHERE GPA >
                (SELECT AVG(GPA)
                 FROM student_db
                 WHERE university = outer_db.university);
-- Quiz Time
-- Try the following quiz to full grasp the difference between the output of a Simple and Correlated Query. Use the image below for the quiz at the end of the page.

-- dependencies_subquery_quiz
-- dependencies_subquery_quiz

-- Subquery 1.
SELECT first_name, last_name, (
                 SELECT AVG(GPA)
                 FROM outer_db
                 WHERE university = outer_db.university) GPA, university
 FROM student_db outer_db;
-- Subquery 2.
SELECT first_name, last_name, GPA, university
 FROM student_db outer_db
 WHERE GPA >
                (SELECT AVG(GPA)
                 FROM student_db
                 WHERE university = outer_db.university);






