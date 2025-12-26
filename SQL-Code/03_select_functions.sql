USE venomsql;

-- =============================================
-- 03. SELECTS & FUNCTIONS
-- =============================================

-- --- Basic Selects ---

-- Let's count how many people fit our criteria.
SELECT COUNT(*) FROM users WHERE gender='Female';
SELECT COUNT(*) FROM users WHERE salary < 80000;

-- Who earns the least and who earns the most?
SELECT MIN(salary) AS MINIMUM_SALARY, MAX(salary) AS MAXIMUM_SALARY FROM users;

-- Show me the unique list of genders (no duplicates).
SELECT DISTINCT gender FROM users;

-- Pattern Matching (LIKE)
-- The underscore (_) matches exactly one character.
-- The percent (%) matches anything.
-- So '_a%' means: "Skip the first letter, second letter must be 'a', then anything after."
SELECT * FROM users WHERE name LIKE '_a%';

-- Pagination (LIMIT & OFFSET)
-- If you have 1,000 users, you don't want them all at once.
-- LIMIT 5 OFFSET 10 means: "Skip the first 10, then give me the next 5."
SELECT * FROM users ORDER BY id LIMIT 5 OFFSET 10;
-- Alternative syntax: LIMIT offset, count
-- SELECT * FROM users ORDER BY id LIMIT 10, 5;

-- --- Functions ---

-- String Functions
SELECT id, gender, LOWER(name) AS lower_name, CONCAT(LOWER(name), "564699") AS Username, LENGTH(name) AS Name_length FROM users;
SELECT CONCAT(name, '<', email, '>') AS User_Contact FROM users;
SELECT REPLACE(name, 'a', '@') AS Fun_Name FROM users;
SELECT REVERSE(name) AS Reverse_Name FROM users;
SELECT LENGTH(email) AS Mail_length FROM users;
SELECT UPPER(email) AS Upper_Email FROM users;
SELECT LOWER(name) AS Lower_Name FROM users;

-- Date Functions
SELECT YEAR(date_of_birth) as YOB FROM users;
SELECT name, TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) As Age FROM users;

-- Math Functions
SELECT salary,
    ROUND(salary) AS rounded,
    FLOOR(salary) AS floored,
    CEIL(salary) AS ceiled
FROM users;

SELECT id, MOD(id, 2) AS remainder FROM users;

-- Conditional Functions
SELECT name, gender, IF(gender = 'Female', 'Yes', 'No') AS is_female FROM users;