USE venomsql;

-- =============================================
-- 04. AGGREGATIONS & GROUPING
-- =============================================
-- --- Grouping and Aggregations ---
-- Aggregations crunch numbers. Instead of listing every row, we summarize them.

-- How many people earn each specific salary amount?
SELECT COUNT(salary) AS total_salary FROM users GROUP BY salary;

-- Let's put users into "Gender Buckets" and calculate stats for each bucket.
SELECT gender, AVG(salary), COUNT(*) AS 'Average Salary'
FROM users
GROUP BY gender;

-- Group by with Rollup (Subtotals and Grand Total)
-- ROLLUP is a bonus feature: It adds a "Total" row at the bottom automatically.
SELECT gender, COUNT(*) AS total_users
FROM users
GROUP BY gender WITH ROLLUP;

-- Group by with Having Clause
-- The Golden Rule:
-- 1. WHERE filters individual rows (before grouping).
-- 2. HAVING filters the summary results (after grouping).
SELECT gender as 'GENDER', AVG(salary) AS 'Average Salary', COUNT(*) AS 'COUNT'
FROM users
WHERE id < 29
GROUP BY gender WITH ROLLUP
HAVING AVG(salary) > 50000;

-- --- Case Statements ---

-- CASE is like an "IF-ELSE" statement inside your query.
-- It lets us create new labels based on data values.
SELECT name, salary,
    CASE
        WHEN salary BETWEEN 60000 AND 80000 THEN 'NEW EMPLOYEE'
        WHEN salary BETWEEN 81000 AND 120000 THEN 'EXPERIENCED EMPLOYEE'
        ELSE 'EX'
    END AS Employee_Status
FROM users;