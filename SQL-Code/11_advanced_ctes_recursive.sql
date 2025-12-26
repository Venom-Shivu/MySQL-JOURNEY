USE venomsql;

-- =============================================
-- 11. COMMON TABLE EXPRESSIONS (CTEs)
-- =============================================
-- Think of a CTE as a "temporary variable" for a table.
-- Instead of writing a huge, messy query, you can break it down into
-- small, named chunks (CTEs) that are easier to read and reuse.

-- 1. Basic CTE
-- Here we break the logic into two steps: First find high earners, then filter for females.
-- It reads like a story from top to bottom!
WITH HighSalaryUsers AS (
    SELECT * FROM users WHERE salary > 80000
),
FemaleHighEarners AS (
    SELECT * FROM HighSalaryUsers WHERE gender = 'Female'
)
SELECT name, email, salary FROM FemaleHighEarners;

-- 2. Recursive CTE
-- This is a special CTE that calls itself!
-- It's perfect for generating sequences (like numbers 1-10) or filling in missing dates.

-- Example: Generate a sequence of numbers from 1 to 10
WITH RECURSIVE NumberSeries AS (
    SELECT 1 AS n
    UNION ALL
    SELECT n + 1 FROM NumberSeries WHERE n < 10
)
SELECT * FROM NumberSeries;

-- Example: Generate a Date Series for the current month
-- (Useful for filling gaps in reports where some dates have no data)
WITH RECURSIVE DateSeries AS (
    SELECT CURDATE() AS dt
    UNION ALL
    SELECT dt + INTERVAL 1 DAY FROM DateSeries
    WHERE dt < LAST_DAY(CURDATE())
)
SELECT * FROM DateSeries;