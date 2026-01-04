/* ============================================================
   MySQL WORKBENCH – ANALYTICS & PERFORMANCE SCRIPT
   Compatible with MySQL 8.0+
   ============================================================ */


/* ============================================================
   1. GEOGRAPHIC EXPANSION ANALYSIS
   Purpose: Identify top 3 cities by user count
   ============================================================ */
SELECT
    a.city,
    a.state,
    COUNT(u.id) AS total_users
FROM users u
JOIN addresses a
    ON u.id = a.user_id
GROUP BY
    a.city,
    a.state
ORDER BY
    total_users DESC
LIMIT 3;


/* ============================================================
   2. COMPENSATION & EQUITY AUDIT
   Purpose: Find 2nd highest salary per gender
   Uses DENSE_RANK to handle salary ties correctly
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
   Purpose: Users who explicitly enabled Dark Mode
   MySQL JSON syntax (NOT PostgreSQL)
   ============================================================ */
SELECT
    u.name,
    JSON_UNQUOTE(JSON_EXTRACT(p.settings, '$.theme')) AS theme
FROM users u
JOIN user_preferences p
    ON u.id = p.user_id
WHERE JSON_EXTRACT(p.settings, '$.theme') = 'dark';


/* ============================================================
   4. INTERNAL REFERRAL NETWORK
   Purpose: Map employees to their referrers
   Self-join on users table
   ============================================================ */
SELECT
    u.name AS employee,
    r.name AS referred_by
FROM users u
JOIN users r
    ON u.referred_by_id = r.id;


/* ============================================================
   5. BASELINE QUERY PLAN (NO INDEXES)
   Purpose: Capture optimizer plan before tuning
   ============================================================ */
EXPLAIN
SELECT
    a.city,
    COUNT(u.id)
FROM users u
JOIN addresses a
    ON u.id = a.user_id
GROUP BY
    a.city;


/* ============================================================
   6. INDEX STRATEGY
   Purpose: Optimize joins and aggregations
   ============================================================ */
CREATE INDEX idx_addresses_user_id
ON addresses(user_id);

CREATE INDEX idx_addresses_city
ON addresses(city);

CREATE INDEX idx_addresses_city_state
ON addresses(city, state);


/* ============================================================
   7. QUERY PLAN AFTER INDEXING
   Purpose: Validate optimizer improvements
   ============================================================ */
EXPLAIN
SELECT
    a.city,
    COUNT(u.id)
FROM users u
JOIN addresses a
    ON u.id = a.user_id
GROUP BY
    a.city;


/* ============================================================
   8. PRECOMPUTED TABLE (Materialized View Alternative)
   Purpose: Fast city-level analytics for dashboards
   ============================================================ */
CREATE TABLE mv_city_user_density AS
SELECT
    a.city,
    a.state,
    COUNT(u.id) AS total_users
FROM users u
JOIN addresses a
    ON u.id = a.user_id
GROUP BY
    a.city,
    a.state;


/* ============================================================
   9. QUERY PRECOMPUTED CITY DATA
   ============================================================ */
SELECT
    city,
    state,
    total_users
FROM mv_city_user_density
ORDER BY
    total_users DESC
LIMIT 3;


/* ============================================================
   10. PRECOMPUTED SALARY RANKINGS
   Purpose: Avoid repeated window function execution
   ============================================================ */
CREATE TABLE mv_salary_rankings AS
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
   11. QUERY PRECOMPUTED SALARY DATA
   ============================================================ */
SELECT
    name,
    gender,
    salary
FROM mv_salary_rankings
WHERE salary_rank = 2;


/* ============================================================
   12. REFRESH LOGIC (MANUAL)
   Purpose: Rebuild precomputed tables after data changes
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
GROUP BY
    a.city,
    a.state;


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
   END OF SCRIPT
   ============================================================ */