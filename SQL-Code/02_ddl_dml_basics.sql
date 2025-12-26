USE venomsql;

-- =============================================
-- 02. SQL BASICS: DDL, DML, and TCL
-- =============================================
-- Welcome to the building blocks of SQL!
-- We will learn how to build tables (DDL), change data (DML), and handle mistakes (TCL).

-- -------------------------------------------------------------
-- 1. SYSTEM COMMANDS
-- -------------------------------------------------------------

-- Show available storage engines (InnoDB, MyISAM, etc.)
SHOW ENGINES;

-- -------------------------------------------------------------
-- 2. DDL (Data Definition Language)
-- Think of DDL as "Building the House".
-- These commands create or change the structure (tables, columns) where data lives.
-- -------------------------------------------------------------

-- 2.1 Creating a Table
-- Let's create a sandbox table so we don't mess up our main data.
CREATE TABLE IF NOT EXISTS practice_users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    age INT CHECK (age >= 18), -- Constraint: Age must be 18+
    signup_date DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- 2.2 Altering a Table
-- Forgot a column? No problem. We can add it later.
ALTER TABLE practice_users ADD COLUMN phone_number VARCHAR(15);

-- Need to change a column's rules? (e.g., make the username longer)
ALTER TABLE practice_users MODIFY COLUMN username VARCHAR(100);

-- Rename a column (MySQL 8.0+)
ALTER TABLE practice_users CHANGE COLUMN phone_number contact_number VARCHAR(15);

-- [PROJECT SETUP] The following DDL is required for the 'Joins' tutorial file:
ALTER TABLE users ADD COLUMN referred_by_id INT;

-- 2.3 Viewing Table Structure
DESCRIBE practice_users;

-- -------------------------------------------------------------
-- 3. DML (Data Manipulation Language)
-- Think of DML as "Moving Furniture".
-- These commands put data IN the house, move it around, or throw it out.
-- -------------------------------------------------------------

-- 3.1 Inserting Data
-- Adding a new person to the list.
INSERT INTO practice_users (username, email, age) 
VALUES ('john_doe', 'john@example.com', 25);

-- Insert multiple rows
INSERT INTO practice_users (username, email, age) VALUES 
('alice_wonder', 'alice@example.com', 30),
('bob_builder', 'bob@example.com', 45);

-- 3.2 Updating Data
-- WARNING: Always use WHERE! If you forget it, you'll update EVERYONE'S age.
UPDATE practice_users 
SET age = 26 
WHERE username = 'john_doe';

-- [PROJECT SETUP] Populating referrer data for Self-Joins in later files:
UPDATE users SET referred_by_id = 1 WHERE id IN (2, 3, 16, 18, 20, 13);
UPDATE users SET referred_by_id = 2 WHERE id = 4;
UPDATE users SET referred_by_id = 4 WHERE id = 5;
UPDATE users SET referred_by_id = 5 WHERE id = 7;
UPDATE users SET referred_by_id = 6 WHERE id = 9;
UPDATE users SET referred_by_id = 28 WHERE id IN (21, 24, 26, 27);
UPDATE users SET referred_by_id = 22 WHERE id IN (19, 18, 17, 8);

-- 3.3 Deleting Data
-- Removing a specific person. Again, don't forget the WHERE clause!
DELETE FROM practice_users 
WHERE username = 'bob_builder';

-- 3.4 Truncating Data (DDL/DML Hybrid)
-- This is the "Nuclear Option". It wipes the table clean and resets the ID counter.
-- TRUNCATE TABLE practice_users;

-- -------------------------------------------------------------
-- 4. TCL (Transaction Control Language)
-- This is your "Undo" button.
-- Transactions let you group commands so they either all happen, or none happen.
-- -------------------------------------------------------------

-- Start a transaction
START TRANSACTION;

-- Perform operations (these are temporary until committed)
UPDATE practice_users SET age = 31 WHERE username = 'alice_wonder';

-- Oops! Made a mistake? ROLLBACK undoes everything since the transaction started.
ROLLBACK;

-- To save changes permanently, use COMMIT instead of ROLLBACK
-- COMMIT;