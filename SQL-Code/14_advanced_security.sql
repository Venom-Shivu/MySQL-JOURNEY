USE venomsql;

-- =============================================
-- 14. ADVANCED SECURITY (Users & Permissions)
-- =============================================
-- Security is key! You wouldn't give your house keys to a stranger, right?
-- In SQL, we create specific users and give them only the permissions they need.
-- This is called the "Principle of Least Privilege".

-- -------------------------------------------------------------
-- 1. CREATING USERS
-- -------------------------------------------------------------
-- Let's create a new user named 'intern_bob'.
-- 'localhost' means he can only connect from this specific computer.
-- IDENTIFIED BY sets the password.

CREATE USER IF NOT EXISTS 'intern_bob'@'localhost' IDENTIFIED BY 'secure_password_123';

-- -------------------------------------------------------------
-- 2. GRANTING PERMISSIONS
-- -------------------------------------------------------------
-- By default, Bob can't do anything. He can't even see the tables!
-- Let's give him permission to VIEW data (SELECT) but not change it.

GRANT SELECT ON venomsql.* TO 'intern_bob'@'localhost';

-- Now let's create a 'manager_alice' who can view AND update data.
CREATE USER IF NOT EXISTS 'manager_alice'@'localhost' IDENTIFIED BY 'manager_pass_456';

GRANT SELECT, INSERT, UPDATE ON venomsql.* TO 'manager_alice'@'localhost';

-- Check what permissions a user has:
SHOW GRANTS FOR 'intern_bob'@'localhost';

-- -------------------------------------------------------------
-- 3. REVOKING PERMISSIONS
-- -------------------------------------------------------------
-- Bob is messing up? Let's take away his access.
-- REVOKE is the opposite of GRANT.

REVOKE SELECT ON venomsql.* FROM 'intern_bob'@'localhost';

-- -------------------------------------------------------------
-- 4. ROLES (MySQL 8.0+)
-- -------------------------------------------------------------
-- Managing users one by one is tiring.
-- Roles are like "Job Titles". You give permissions to the Title,
-- and then give the Title to the User.

-- Step 1: Create the Role
CREATE ROLE IF NOT EXISTS 'app_developer';

-- Step 2: Give permissions to the Role
GRANT SELECT, INSERT, UPDATE, DELETE ON venomsql.* TO 'app_developer';

-- Step 3: Assign the Role to a User
CREATE USER IF NOT EXISTS 'dev_sara'@'localhost' IDENTIFIED BY 'dev_pass_789';
GRANT 'app_developer' TO 'dev_sara'@'localhost';

-- Important: Roles are not active by default when a user logs in!
-- They usually need to run: SET ROLE 'app_developer';
-- Or the admin can make it default:
SET DEFAULT ROLE 'app_developer' TO 'dev_sara'@'localhost';

-- -------------------------------------------------------------
-- 5. CLEANUP
-- -------------------------------------------------------------
-- Removing users and roles when they are no longer needed.

-- DROP USER IF EXISTS 'intern_bob'@'localhost';
-- DROP USER IF EXISTS 'manager_alice'@'localhost';
-- DROP USER IF EXISTS 'dev_sara'@'localhost';
-- DROP ROLE IF EXISTS 'app_developer';