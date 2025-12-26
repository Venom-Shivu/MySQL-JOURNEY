-- =============================================
-- SOLUTIONS (Don't peek until you try!)
-- =============================================

/*
-- SOLUTION 1:
SELECT a.City, a.State, COUNT(u.id) as Total_Users
FROM users u
JOIN addresses a ON u.id = a.user_id
GROUP BY a.City, a.State
ORDER BY Total_Users DESC
LIMIT 3;

-- SOLUTION 2:
WITH RankedSalaries AS (
    SELECT name, gender, salary,
    DENSE_RANK() OVER (PARTITION BY gender ORDER BY salary DESC) as rank_val
    FROM users
)
SELECT * FROM RankedSalaries WHERE rank_val = 2;

-- SOLUTION 3:
SELECT u.name, p.settings->>'$.theme' as theme
FROM users u
JOIN user_preferences p ON u.id = p.user_id
WHERE p.settings->>'$.theme' = 'dark';

-- SOLUTION 4:
SELECT u.name AS Employee, r.name AS Referred_By
FROM users u
INNER JOIN users r ON u.referred_by_id = r.id;

-- SOLUTION 5:
EXPLAIN SELECT a.City, COUNT(u.id)
FROM users u JOIN addresses a ON u.id = a.user_id
GROUP BY a.City;
*/