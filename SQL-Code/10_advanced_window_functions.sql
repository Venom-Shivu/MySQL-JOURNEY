USE venomsql;

-- =============================================
-- 10. WINDOW FUNCTIONS (Analytics)
-- =============================================
-- Window functions are super useful! Unlike GROUP BY, which collapses rows into one,
-- Window functions let you perform calculations (like rankings or averages)
-- while keeping the original rows visible. It's like looking through a "window" of related data.

-- 1. ROW_NUMBER, RANK, DENSE_RANK
-- Here we assign a rank to users based on their salary.
-- PARTITION BY gender: "Restart the ranking for each gender."
SELECT
    name,
    gender,
    salary,
    ROW_NUMBER() OVER (PARTITION BY gender ORDER BY salary DESC) as row_num,
    RANK() OVER (PARTITION BY gender ORDER BY salary DESC) as rank_val,
    DENSE_RANK() OVER (PARTITION BY gender ORDER BY salary DESC) as dense_rank_val
FROM users;

-- 2. LAG and LEAD
-- These let you "peek" at other rows without joining the table to itself.
-- LAG looks back at the previous row; LEAD looks forward to the next row.
-- Great for calculating growth or differences!
SELECT
    name,
    salary,
    LAG(salary, 1, 0) OVER (ORDER BY salary) as previous_lower_salary,
    LEAD(salary, 1, 0) OVER (ORDER BY salary) as next_higher_salary,
    salary - LAG(salary, 1, 0) OVER (ORDER BY salary) as salary_diff
FROM users;

-- 3. FIRST_VALUE and LAST_VALUE
-- Want to compare everyone's salary to the highest earner in their group?
-- This grabs that specific value and repeats it for every row in the group.
SELECT
    name,
    gender,
    salary,
    FIRST_VALUE(name) OVER (PARTITION BY gender ORDER BY salary DESC) as highest_paid_person,
    MAX(salary) OVER (PARTITION BY gender) as max_salary_in_gender
FROM users;