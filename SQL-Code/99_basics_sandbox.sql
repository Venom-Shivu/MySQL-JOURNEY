-- CREATE DATABASE venomsql;
-- USE venomsql;
-- CREATE TABLE users (
-- id INT AUTO_INCREMENT PRIMARY KEY,
-- Name VARCHAR(100) NOT NULL,
-- Email VARCHAR(100) UNIQUE NOT NULL,
-- Gender ENUM ('Male', 'Female', 'Other'),
-- Date_of_birth DATE,
-- Created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
-- );
/*
============================================================================
FILE: my_first_sql_script.sql
PURPOSE: Introductory SQL Playground
DESCRIPTION:
    This script serves as a scratchpad for learning basic SQL commands.
    It covers Database creation, Table setup, Data insertion, and
    Schema modifications.
============================================================================
*/

-- -------------------------------------------------------------------------
-- 1. DATABASE & TABLE SETUP
-- -------------------------------------------------------------------------
-- CREATE DATABASE IF NOT EXISTS venomsql;
-- USE venomsql;

/*
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    gender ENUM('Male', 'Female', 'Other'),
    date_of_birth DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
*/

-- -------------------------------------------------------------------------
-- 2. DATA MANIPULATION (DML)
-- -------------------------------------------------------------------------
-- INSERT INTO users (name, email, gender, date_of_birth) VALUES
-- ('Shiv', 's1@gmail.com', 'Male', '2010-05-10'),
-- ('Shiv1', 's22@gmail.com', 'Male', '2010-05-11'),
-- ('Shiv2', 's23@gmail.com', 'Male', '2010-05-12'),
-- ('Shiv23', 's224@gmail.com', 'Male', '2010-06-09');

-- SELECT * FROM users;

-- Manual ID Correction (Example of fixing gaps in auto-increment)
-- UPDATE users SET id = 2 WHERE id = 3;
-- UPDATE users SET id = 3 WHERE id = 4;
-- UPDATE users SET id = 4 WHERE id = 6;

-- -------------------------------------------------------------------------
-- 3. SCHEMA MODIFICATIONS (DDL)
-- -------------------------------------------------------------------------
-- DDL (Data Definition Language) commands are used to modify the structure
-- of database objects like tables.
-- The ALTER TABLE statement is the primary command used to modify the
-- structure of an existing table. It allows you to add, delete, or modify
-- columns and constraints without having to drop and recreate the table.

-- 3.1 ADD COLUMN
-- Add a new column 'is_active' to the table with a default value.
-- ALTER TABLE users ADD COLUMN is_active BOOLEAN DEFAULT TRUE;

-- 3.2 MODIFY COLUMN
-- Change the data type or size of an existing column.
-- Example: Increase the length of the 'name' column to 150 characters.
-- ALTER TABLE users MODIFY COLUMN name VARCHAR(150);

-- 3.3 REORDER COLUMN
-- Change the position of a column within the table.
-- Example: Move 'date_of_birth' to the first position and change type to DATETIME.
-- ALTER TABLE users MODIFY COLUMN date_of_birth DATETIME FIRST;

-- 3.4 DROP COLUMN
-- Remove a column from the table.
-- ALTER TABLE users DROP COLUMN is_active;
