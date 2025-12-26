USE venomsql;

-- =============================================
-- 06. SETUP ADMIN USERS
-- =============================================
DROP TABLE IF EXISTS admin_users;
CREATE TABLE admin_users (
id INT PRIMARY KEY,
name VARCHAR(100),
email VARCHAR(100),
gender ENUM ('Male', 'Female', 'Other'),
date_of_birth DATE,
salary INT
);
INSERT INTO admin_users (id, name, email, gender, date_of_birth, salary) VALUES
(101, 'Prakhar Mishra', 'prakhar@exapmle.com', 'Male', '2000-10-12', 80000),
(102, 'Jahnvi Singh', 'jahnvi@email.com', 'Female', '2001-09-11', 75000),
(103, 'Sakshi Singhaniya', 'sakshi.s@yahoo.com', 'Female', '1999-11-11', 79000),
(104, 'Priyanshu Soni', 'Priyanshu.s@aol.com', 'Male', '2002-09-10', 87000);
SELECT * FROM admin_users;