USE venomsql;

-- =============================================
-- 07. JOINS, UNIONS & SUBQUERIES
-- =============================================
-- --- Joins ---

-- Inner Join is like the intersection of two circles.
-- We only get users who HAVE an address. If they don't have one, they disappear.
SELECT users.name, users.gender, users.salary, addresses.City, addresses.State, addresses.id AS ADD_ID
FROM users
INNER JOIN addresses ON users.id = addresses.User_id;

-- Self Join: This is weird but cool. We join the table to itself!
-- Useful for relationships like "Who referred whom?" (Parent-Child relationship).
SELECT
    a.id,
    a.name AS user_name,
    b.name AS referred_by_name
FROM users a
LEFT JOIN users b ON a.referred_by_id = b.id;

-- Let's find out which users have referred more than one person.
SELECT referred_by_id, COUNT(*) AS total_referred
FROM users
WHERE referred_by_id IS NOT NULL
GROUP BY referred_by_id
HAVING COUNT(*) > 1;

-- --- Unions ---

-- UNION just glues two results together, one on top of the other.
-- Note: The columns must match in both queries!
SELECT email, name, 'User' AS Role FROM users
UNION
SELECT email, name, 'Admin' AS Role FROM admin_users
ORDER BY Role, email ASC;

-- --- Subqueries ---

-- A Subquery is a query inside a query.
-- Step 1: Calculate the average salary (Inner Query).
-- Step 2: Find users who earn less than that (Outer Query).
SELECT * FROM users WHERE salary < (SELECT AVG(salary) FROM users);

-- Subquery with IN operator
-- Find users who were referred by "Rich People" (salary > 75k).
SELECT id, name, referred_by_id
FROM users
WHERE referred_by_id IN (
    SELECT id FROM users WHERE salary > 75000
);

-- You can even put a subquery in the SELECT list to show a calculated value on every row.
SELECT name, salary,
    (SELECT AVG(salary) FROM users) AS avg_salary
FROM users;