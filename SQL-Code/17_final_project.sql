USE venomsql;

-- =============================================
-- 17. FINAL PROJECT: THE CEO'S DASHBOARD
-- =============================================
-- Congratulations! You've learned the syntax, the logic, and the magic of SQL.
-- Now, it's time to put it all together.

-- SCENARIO:
-- The CEO of VenomSQL Corp needs a detailed report to decide where to open
-- the next office branch and who to promote.
-- You have been given 5 tasks. Good luck!

-- -------------------------------------------------------------
-- TASK 1: GEOGRAPHIC ANALYSIS (Joins & Aggregation)
-- -------------------------------------------------------------
-- Find the Top 3 Cities with the highest number of users.
-- Columns needed: City, State, Total_Users
-- Hint: You'll need to join 'users' and 'addresses'.

-- [WRITE YOUR QUERY HERE]


-- -------------------------------------------------------------
-- TASK 2: SALARY AUDIT (Window Functions)
-- -------------------------------------------------------------
-- We need to identify the 2nd highest earner in EACH Gender group.
-- Columns needed: Name, Gender, Salary, Rank
-- Hint: Use DENSE_RANK() partitioned by gender.

-- [WRITE YOUR QUERY HERE]


-- -------------------------------------------------------------
-- TASK 3: THE "DARK MODE" CLUB (JSON Handling)
-- -------------------------------------------------------------
-- The UX team wants to know which users prefer "Dark Mode".
-- Find the names of users whose JSON settings have "theme": "dark".
-- Hint: Use the ->> operator on the 'user_preferences' table.

-- [WRITE YOUR QUERY HERE]


-- -------------------------------------------------------------
-- TASK 4: RECURSIVE REFERRALS (Self Joins)
-- -------------------------------------------------------------
-- We want to see who referred whom.
-- Create a list showing the "Employee Name" and their "Referrer's Name".
-- Only show employees who were actually referred by someone.

-- [WRITE YOUR QUERY HERE]


-- -------------------------------------------------------------
-- TASK 5: PERFORMANCE CHECK (Optimization)
-- -------------------------------------------------------------
-- Take your query from Task 1.
-- Run EXPLAIN on it.
-- Question: Is it using the Primary Key index? Is it doing a Full Table Scan?
-- (Write your observation as a comment)

-- [WRITE YOUR OBSERVATION HERE]


