# 💻 MySQL Journey: Source Code & Scripts

![MySQL](https://img.shields.io/badge/mysql-8.0%2B-4479A1.svg?logo=mysql&logoColor=white)
![Code Status](https://img.shields.io/badge/Build-Passing-brightgreen.svg)
![License](https://img.shields.io/badge/License-MIT-yellow.svg)

Welcome to the **SQL-Code** section of the MySQL Journey repository! 🛠️

This directory contains the core practical implementation of the course. It is structured progressively, taking you from database creation to advanced performance tuning and security management. Each script is commented to explain *what* is happening and *why*.

---

## 📂 Code Structure

### 🟢 Phase 1: The Basics (Foundations)
*   **`00_setup_database.sql`** - Initializes the `company_db` schema.
*   **`01_insert_users.sql`** - Seeds the database with initial dummy data.
*   **`02_ddl_dml_basics.sql`** - Covers `CREATE`, `ALTER`, `INSERT`, `UPDATE`, `DELETE`.
*   **`03_select_functions.sql`** - Essential `SELECT` queries and built-in functions.

### 🟡 Phase 2: Intermediate SQL (Relational Logic)
*   **`04_aggregations.sql`** - `GROUP BY`, `HAVING`, and aggregation metrics.
*   **`05_setup_addresses.sql`** - Expands schema with address tables (1:N relationships).
*   **`06_setup_admin.sql`** - Adds administrative tables.
*   **`07_joins_subqueries.sql`** - Complex data retrieval using Joins and Subqueries.
*   **`08_setup_audit_log.sql`** - Prepares audit tables for tracking changes.
*   **`09_advanced_objects.sql`** - Views, Stored Procedures, Triggers, and Indexes.

### 🔴 Phase 3: Advanced SQL (Mastery)
*   **`10_advanced_window_functions.sql`** - Analytical queries using Window Functions.
*   **`11_advanced_ctes_recursive.sql`** - CTEs and Recursive Hierarchical queries.
*   **`12_advanced_json_handling.sql`** - Managing JSON documents within SQL.
*   **`13_advanced_performance_tuning.sql`** - Query optimization and `EXPLAIN` analysis.
*   **`14_advanced_security.sql`** - User roles, grants, and security best practices.

### 🔵 Phase 4: Professional Skills & Final Project
*   **`15_delete_vs_truncate_vs_drop.sql`** - Detailed comparison of deletion methods.
*   **`16_backup_restore.sql`** - Strategies for data backup and recovery.
*   **`17_bulk_user_preferences.sql`** - Generates 500+ users and JSON preference data for testing.

---

## ⚙️ Execution Instructions

1.  **Sequential Execution:** It is crucial to run the scripts in numerical order (00 -> 17). Later scripts depend on tables and data created in earlier ones.
2.  **Environment:** These scripts are optimized for MySQL 8.0+.
3.  **Tools:** You can execute these using MySQL Workbench, DBeaver, or the MySQL Command Line Client.

---

## 👤 Author

**Shivansh Yadav**

*   📧 Email: mrshivusinghyadav@gmail.com
*   🔗 GitHub: [Venom-Shivu](https://github.com/Venom-Shivu/MySQL-JOURNEY/blob/main/SQL-Code/)
*   💼 LinkedIn: [Shivansh Yadav](https://www.linkedin.com/in/the-venom)

> *"You provide the logic. I provide the FORCE. Together, we will crush every request until the server screams for mercy. 🤝🖤 ."* — Venom (Shivansh Yadav)💻
