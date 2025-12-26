-- =============================================
-- 00. DATABASE & TABLE SETUP
-- =============================================
CREATE DATABASE IF NOT EXISTS venomsql;
USE venomsql;

DROP TABLE IF EXISTS users;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    gender ENUM('Male' , 'Female' , 'Other'),
    date_of_birth DATE,
    salary DECIMAL(10, 2), -- Changed to DECIMAL for currency precision
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);