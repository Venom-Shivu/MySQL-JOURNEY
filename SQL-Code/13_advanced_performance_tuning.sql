USE venomsql;

-- =============================================
-- 13. PERFORMANCE TUNING & OPTIMIZATION
-- =============================================
-- Writing code that works is good. Writing code that is FAST is better!
-- As your data grows, queries can get slow. We use EXPLAIN to see "under the hood"
-- and find out why a query is taking so long.

-- -------------------------------------------------------------
-- 1. THE EXPLAIN STATEMENT
-- -------------------------------------------------------------
-- Just put EXPLAIN before your query. It tells you:
-- 1. type: "ALL" is bad (it reads the whole book). "ref" is good (it uses the index).
-- 2. key: Which index (shortcut) it decided to use.
-- 3. rows: How many rows it had to look at to find the answer.

-- Example 1: Analyzing a query on a non-indexed column
-- (Assuming 'date_of_birth' is not indexed)
EXPLAIN SELECT * FROM users WHERE date_of_birth = '1995-05-14';
-- Expected Result: type = ALL (Full Table Scan) -> Slow on large data.

-- Example 2: Analyzing a query on an indexed column
-- (We created an index on 'gender' in file 09)
EXPLAIN SELECT * FROM users WHERE gender = 'Female';
-- Expected Result: type = ref, key = idx_gender -> Fast.

-- -------------------------------------------------------------
-- 2. EXPLAIN ANALYZE (MySQL 8.0+)
-- -------------------------------------------------------------
-- EXPLAIN just guesses. EXPLAIN ANALYZE actually runs the query and times it!
-- It tells you exactly how many milliseconds each step took.

EXPLAIN ANALYZE SELECT * FROM users WHERE salary > 80000;

-- -------------------------------------------------------------
-- 3. OPTIMIZATION TIPS
-- -------------------------------------------------------------

-- Tip A: Avoid SELECT *
-- Only ask for the columns you need! If you select everything (*), the database
-- has to do more work to fetch data it might not even need.
EXPLAIN SELECT name, gender FROM users WHERE gender = 'Male';

-- Tip B: Avoid Functions on Indexed Columns in WHERE clause
-- BAD: YEAR(date_of_birth) = 1995 (This hides the column inside a function, so the index breaks!)
-- GOOD: date_of_birth BETWEEN '1995-01-01' AND '1995-12-31' (The index works perfectly here.)