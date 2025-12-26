USE venomsql;

-- =============================================
-- 15. DELETE vs TRUNCATE vs DROP
-- =============================================
-- These three commands all remove data, but they do it very differently.
-- It's one of the most common interview questions!

-- Let's use our "House" analogy:
-- 1. DELETE: Taking furniture out one piece at a time.
-- 2. TRUNCATE: Cleaning the house completely (empty rooms), but the house stays.
-- 3. DROP: Bulldozing the house. It's gone.

-- -------------------------------------------------------------
-- SETUP: Create a dummy table to practice on
-- -------------------------------------------------------------
CREATE TABLE IF NOT EXISTS trash_bin (
    id INT AUTO_INCREMENT PRIMARY KEY,
    item_name VARCHAR(50)
);

INSERT INTO trash_bin (item_name) VALUES ('Paper'), ('Plastic'), ('Metal'), ('Glass');

-- -------------------------------------------------------------
-- 1. DELETE (DML - Data Manipulation Language)
-- -------------------------------------------------------------
-- - Removes specific rows (using WHERE).
-- - If you don't use WHERE, it removes all rows, but SLOWLY (one by one).
-- - You CAN undo this with ROLLBACK (if using transactions).
-- - Does NOT reset the Auto-Increment ID counter.

-- Example: Remove just 'Paper'
DELETE FROM trash_bin WHERE item_name = 'Paper';

-- Check the IDs (Notice ID 1 is gone)
SELECT * FROM trash_bin;

-- -------------------------------------------------------------
-- 2. TRUNCATE (DDL - Data Definition Language)
-- -------------------------------------------------------------
-- - Removes ALL rows instantly.
-- - You CANNOT use a WHERE clause.
-- - Resets the Auto-Increment ID counter back to 1.
-- - Usually cannot be rolled back (it's a structural change).

-- Example: Empty the whole bin
TRUNCATE TABLE trash_bin;

-- Insert new data to see ID reset
INSERT INTO trash_bin (item_name) VALUES ('New Item');
SELECT * FROM trash_bin; -- ID should be 1

-- -------------------------------------------------------------
-- 3. DROP (DDL - Data Definition Language)
-- -------------------------------------------------------------
-- - Removes the data AND the table structure.
-- - The table ceases to exist.
-- - Cannot be rolled back.

-- Example: Destroy the bin entirely
DROP TABLE trash_bin;

-- This will throw an error because the table is gone:
-- SELECT * FROM trash_bin;