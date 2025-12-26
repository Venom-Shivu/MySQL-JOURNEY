USE venomsql;

-- =============================================
-- 08. SETUP AUDIT LOG
-- =============================================

DROP TABLE IF EXISTS user_log;

CREATE TABLE user_log (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    name VARCHAR(100),
    created_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
