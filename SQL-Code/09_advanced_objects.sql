USE venomsql;

-- =============================================
-- 09. ADVANCED OBJECTS (Views, Procs, Triggers)
-- =============================================
-- --- Views ---

-- A View is like a "Saved Search".
-- Instead of typing this complex query every time, we just query the view name.
CREATE VIEW high_salary_users AS
SELECT id, name, salary
FROM users WHERE salary > 70000;

-- Select from the view
SELECT * FROM high_salary_users;

-- Fun Fact: You can sometimes update the real table THROUGH the view!
-- UPDATE users SET salary = 92000 WHERE name = "Rohan";

-- --- Indexes ---

-- Indexes are like the index at the back of a book.
-- They help MySQL find data instantly without reading every single page (row).
SHOW INDEXES FROM users;

-- Create Index

-- 1. Create a simple index on the 'gender' column
CREATE INDEX idx_gender ON users(gender);

-- 2. Create a composite index on 'gender' and 'salary'
CREATE INDEX idx_gender_salary ON users(gender, salary);

-- Drop Index (Removing an index)
-- DROP INDEX idx_gender ON users;
-- DROP INDEX idx_gender_salary ON users;

-- --- Stored Procedures ---

-- Think of a Procedure as a function in programming.
-- You save a bunch of code (like this INSERT) and call it later with one line.
DELIMITER $$

CREATE PROCEDURE AddUser(
    IN p_name VARCHAR(100),
    IN p_email VARCHAR(100),
    IN p_gender ENUM('Male', 'Female', 'Other'),
    IN p_dob DATE,
    IN p_salary INT
)
BEGIN
    INSERT INTO users (name, email, gender, date_of_birth, salary)
    VALUES (p_name, p_email, p_gender, p_dob, p_salary);
END$$

DELIMITER ;

-- Call the procedure
-- CALL AddUser('SHIU', 'shiu@example.com', 'Male', '1999-10-12', 78952);

-- Check procedure status
SHOW PROCEDURE STATUS WHERE Db = 'venomsql';

-- --- Triggers ---

-- Triggers are like security cameras.
-- They watch for specific events (like an INSERT) and automatically do something else (like logging).
DELIMITER $$

CREATE TRIGGER after_user_insert
AFTER INSERT ON users
FOR EACH ROW
BEGIN
    INSERT INTO user_log(user_id, name)
    VALUES(NEW.id, NEW.name);
END $$

DELIMITER ;

-- Test Trigger
-- INSERT INTO users (name, email, gender, date_of_birth, salary) VALUES ("Rohan Singh", "rohan@rohan.com", "Male", "2001-05-01", 85210);

-- Drop Trigger
-- DROP TRIGGER IF EXISTS after_user_insert;