/* ============================================================
   SOLUTION 1: Geographic Expansion Analysis
   ============================================================
   Identifies top cities with the highest number of users.
*/

SELECT
    a.city   AS city,
    a.state  AS state,
    COUNT(u.id) AS total_users
FROM users u
INNER JOIN addresses a
    ON u.id = a.user_id
GROUP BY
    a.city,
    a.state
ORDER BY
    total_users DESC
LIMIT 3;


/* ============================================================
   SOLUTION 2: Compensation & Equity Audit
   ============================================================
   Finds the second-highest salary within each gender group.
*/

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
    salary,
    salary_rank
FROM salary_ranking
WHERE salary_rank = 2;


/* ============================================================
   SOLUTION 3: UI Preference Analysis (JSON)
   ============================================================
   Extracts users who explicitly enabled Dark Mode.
*/

SELECT
    u.name,
    p.settings ->> '$.theme' AS theme
FROM users u
INNER JOIN user_preferences p
    ON u.id = p.user_id
WHERE p.settings ->> '$.theme' = 'dark';


/* ============================================================
   SOLUTION 4: Internal Referral Network Mapping
   ============================================================
   Displays employees and their respective referrers.
*/

SELECT
    u.name AS employee,
    r.name AS referred_by
FROM users u
INNER JOIN users r
    ON u.referred_by_id = r.id;


/* ============================================================
   SOLUTION 5: BASELINE PERFORMANCE ANALYSIS (NO INDEXES)
   ============================================================
   Captures execution plan before optimization.
*/

EXPLAIN ANALYZE
SELECT
    a.city,
    COUNT(u.id)
FROM users u
INNER JOIN addresses a
    ON u.id = a.user_id
GROUP BY
    a.city;


/* ============================================================
   INDEX STRATEGY
   ============================================================
   Optimizes joins and aggregation performance.
*/

-- Foreign key join optimization
CREATE INDEX idx_addresses_user_id
ON addresses(user_id);

-- Aggregation optimization
CREATE INDEX idx_addresses_city
ON addresses(city);

-- Optional composite index for city + state queries
CREATE INDEX idx_addresses_city_state
ON addresses(city, state);


/* ============================================================
   PERFORMANCE ANALYSIS AFTER INDEXING
   ============================================================
   Validates reduced cost and improved execution plan.
*/

EXPLAIN ANALYZE
SELECT
    a.city,
    COUNT(u.id)
FROM users u
INNER JOIN addresses a
    ON u.id = a.user_id
GROUP BY
    a.city;


/* ============================================================
   MATERIALIZED VIEW: City-Level User Density
   ============================================================
   Used for executive dashboards and heavy read workloads.
*/

CREATE MATERIALIZED VIEW mv_city_user_density AS
SELECT
    a.city,
    a.state,
    COUNT(u.id) AS total_users
FROM users u
INNER JOIN addresses a
    ON u.id = a.user_id
GROUP BY
    a.city,
    a.state;


/* ============================================================
   QUERY USING MATERIALIZED VIEW
   ============================================================
*/

SELECT
    city,
    state,
    total_users
FROM mv_city_user_density
ORDER BY
    total_users DESC
LIMIT 3;


/* ============================================================
   MATERIALIZED VIEW: Salary Ranking Snapshot
   ============================================================
   Avoids repeated window function computation.
*/

CREATE MATERIALIZED VIEW mv_salary_rankings AS
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
   QUERY USING MATERIALIZED VIEW
   ============================================================
*/

SELECT
    name,
    gender,
    salary
FROM mv_salary_rankings
WHERE salary_rank = 2;


/* ============================================================
   MATERIALIZED VIEW REFRESH
   ============================================================
   Execute after bulk inserts or scheduled updates.
*/

REFRESH MATERIALIZED VIEW mv_city_user_density;
REFRESH MATERIALIZED VIEW mv_salary_rankings;
