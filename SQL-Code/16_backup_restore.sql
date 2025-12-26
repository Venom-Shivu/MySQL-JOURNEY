USE venomsql;

-- =============================================
-- 16. BACKUP AND RESTORE
-- =============================================
-- Imagine working on a document for days and forgetting to save it. Nightmare, right?
-- Databases are the same. We need to take "snapshots" (Backups) so we can
-- restore them if something breaks.

-- IMPORTANT NOTE:
-- The commands in sections 1 & 2 are run in your TERMINAL (Command Prompt / PowerShell),
-- NOT inside the MySQL Workbench query editor.

-- -------------------------------------------------------------
-- 0. CONCEPTS: LOGICAL VS PHYSICAL BACKUPS
-- -------------------------------------------------------------
-- Before we start, it's important to know there are two main ways to backup:

-- 1. Logical Backup (e.g., mysqldump)
--    - What it is: Converts your data into SQL statements (CREATE TABLE, INSERT INTO...).
--    - Pros: Flexible, human-readable, can be restored to different MySQL versions.
--    - Cons: Slower for huge databases because it has to replay all those INSERT commands.

-- 2. Physical Backup (e.g., Copying data folder, MySQL Enterprise Backup)
--    - What it is: Copies the actual raw files from the hard drive (where MySQL stores bits and bytes).
--    - Pros: Extremely fast restore (just paste the files back).
--    - Cons: Not portable (must be same MySQL version/OS), harder to set up manually.

-- -------------------------------------------------------------
-- 1. BACKUP (mysqldump)
-- -------------------------------------------------------------
-- We use a tool called 'mysqldump' to export data into a .sql file.
-- It turns your database into a long list of SQL statements (CREATE, INSERT, etc.).

-- SYNTAX (Run this in CMD/Terminal):
-- mysqldump -u [username] -p [database_name] > [backup_file.sql]

-- Example: Backup the entire 'venomsql' database
-- mysqldump -u root -p venomsql > venomsql_backup.sql

-- Example: Backup only specific tables (e.g., users and addresses)
-- mysqldump -u root -p venomsql users addresses > users_backup.sql

-- -------------------------------------------------------------
-- 2. RESTORE
-- -------------------------------------------------------------
-- Something went wrong? Let's bring the data back.

-- Option A: Using Command Line (The standard way)
-- 1. Create an empty database first (if the original was dropped).
-- mysql -u root -p -e "CREATE DATABASE venomsql_restored;"
-- 2. Import the backup file into it.
-- mysql -u root -p venomsql_restored < venomsql_backup.sql

-- Option B: Using SQL Command (If you are already logged in)
-- You can run a .sql file from within the MySQL client.
-- SOURCE /path/to/your/venomsql_backup.sql;

-- -------------------------------------------------------------
-- 3. QUICK TABLE BACKUP (SQL Only)
-- -------------------------------------------------------------
-- Want a quick backup of just one table before you do a risky update?
-- You don't need the command line for this. You can do it right here!

-- Create a copy of the 'users' table structure and data
CREATE TABLE users_backup AS
SELECT * FROM users;

-- Verify the backup
SELECT * FROM users_backup;

-- If you mess up the main table, you can restore from this copy:
-- TRUNCATE TABLE users;
-- INSERT INTO users SELECT * FROM users_backup;

-- Clean up (Delete the backup table when done)
-- DROP TABLE users_backup;