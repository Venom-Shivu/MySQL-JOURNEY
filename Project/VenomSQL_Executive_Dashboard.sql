USE venomsql;

-- ============================================================
-- MySQL WORKBENCH – ANALYTICS & PERFORMANCE SCRIPT
-- Compatible with MySQL 8.0+
-- ============================================================


/* ============================================================
   1. GEOGRAPHIC EXPANSION ANALYSIS
   Top 3 cities by user count
   ============================================================ */
SELECT
    a.city,
    a.state,
    COUNT(u.id) AS total_users
FROM users u
JOIN addresses a
    ON u.id = a.user_id
GROUP BY a.city, a.state
ORDER BY total_users DESC
LIMIT 3;


/* ============================================================
   2. COMPENSATION & EQUITY AUDIT
   2nd highest salary per gender (tie-safe)
   ============================================================ */
WITH salary_ranking AS (
    SELECT
        name,
        gender,
        salary,
        DENSE_RANK() OVER (
            PARTITION BY gender
            ORDER BY salary DESC
        ) AS salary_rank
    FROM users
)
SELECT
    name,
    gender,
    salary
FROM salary_ranking
WHERE salary_rank = 2;


/* ============================================================
   3. UI PREFERENCE ANALYSIS (JSON)
   Users who enabled Dark Mode
   ============================================================ */
SELECT
    u.name,
    p.settings->>'$.theme' AS theme
FROM users u
JOIN user_preferences p
    ON u.id = p.user_id
WHERE p.settings->>'$.theme' = 'dark';


/* ============================================================
   4. INTERNAL REFERRAL NETWORK
   Show employees and their referrers
   ============================================================ */
SELECT
    u.name AS employee,
    r.name AS referred_by
FROM users u
LEFT JOIN users r
    ON u.referred_by_id = r.id;


/* ============================================================
   5. BASELINE QUERY PLAN (Before Indexing)
   ============================================================ */
EXPLAIN
SELECT
    a.city,
    COUNT(u.id)
FROM users u
JOIN addresses a
    ON u.id = a.user_id
GROUP BY a.city;


/* ============================================================
   6. INDEX STRATEGY (Safe Creation)
   ============================================================ */
CREATE INDEX IF NOT EXISTS idx_addresses_user_id
    ON addresses(user_id);

CREATE INDEX IF NOT EXISTS idx_addresses_city
    ON addresses(city);

CREATE INDEX IF NOT EXISTS idx_addresses_city_state
    ON addresses(city, state);


/* ============================================================
   7. QUERY PLAN AFTER INDEXING
   ============================================================ */
EXPLAIN
SELECT
    a.city,
    COUNT(u.id)
FROM users u
JOIN addresses a
    ON u.id = a.user_id
GROUP BY a.city;


/* ============================================================
   8. PRECOMPUTED TABLE: City User Density
   (Materialized View Alternative)
   ============================================================ */
CREATE TABLE IF NOT EXISTS mv_city_user_density (
    city VARCHAR(100),
    state VARCHAR(100),
    total_users INT
);


/* ============================================================
   9. REFRESH CITY USER DENSITY
   ============================================================ */
TRUNCATE TABLE mv_city_user_density;

INSERT INTO mv_city_user_density
SELECT
    a.city,
    a.state,
    COUNT(u.id)
FROM users u
JOIN addresses a
    ON u.id = a.user_id
GROUP BY a.city, a.state;


/* ============================================================
   10. QUERY CITY USER DENSITY
   ============================================================ */
SELECT
    city,
    state,
    total_users
FROM mv_city_user_density
ORDER BY total_users DESC
LIMIT 3;


/* ============================================================
   11. PRECOMPUTED TABLE: Salary Rankings
   ============================================================ */
CREATE TABLE IF NOT EXISTS mv_salary_rankings (
    name VARCHAR(100),
    gender VARCHAR(20),
    salary DECIMAL(10,2),
    salary_rank INT
);


/* ============================================================
   12. REFRESH SALARY RANKINGS
   ============================================================ */
TRUNCATE TABLE mv_salary_rankings;

INSERT INTO mv_salary_rankings
SELECT
    name,
    gender,
    salary,
    DENSE_RANK() OVER (
        PARTITION BY gender
        ORDER BY salary DESC
    ) AS salary_rank
FROM users;


/* ============================================================
   13. QUERY SALARY RANKINGS
   ============================================================ */
SELECT
    name,
    gender,
    salary
FROM mv_salary_rankings
WHERE salary_rank = 2;


-- ============================================================
-- END OF SCRIPT
-- ============================================================
