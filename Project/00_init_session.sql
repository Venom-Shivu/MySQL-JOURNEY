-- ==============================================================
-- SETUP SCRIPT: Initialize Database Session
-- ==============================================================
-- PURPOSE:
-- The scripts in this folder are "dbt-style" models, meaning they
-- are pure SELECT statements without a database definition.
--
-- INSTRUCTIONS:
-- Run this script FIRST to select the correct database.
-- Then, you can run any other .sql file in this folder without errors.
-- ==============================================================

USE venomsql;

SELECT 'Database selected successfully! You can now run the project models.' AS status;