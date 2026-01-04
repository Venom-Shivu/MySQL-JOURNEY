USE venomsql;

-- ============================================================
-- JSON DATA HANDLING (MySQL 8.0+)
-- ============================================================
-- JSON is used for flexible, semi-structured data like settings.
-- MySQL stores JSON in binary format and validates it automatically.


-- 1. TABLE: User Preferences (one row per user)
CREATE TABLE IF NOT EXISTS user_preferences (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    settings JSON NOT NULL,
    CONSTRAINT uq_user_preferences UNIQUE (user_id),
    CONSTRAINT fk_user_preferences_users
        FOREIGN KEY (user_id)
        REFERENCES users(id)
        ON DELETE CASCADE
) ENGINE=InnoDB;


-- 2. INSERT JSON DATA
INSERT INTO user_preferences (user_id, settings) VALUES
(1, '{"theme":"dark","notifications":{"email":true,"sms":false}}'),
(2, '{"theme":"light","notifications":{"email":false,"sms":true}}'),
(3, '{"theme":"dark","language":"en-US"}'),
(4, '{"theme":"system","notifications":{"email":true,"sms":true}}'),
(5, '{"theme":"light","accessibility":{"font_size":"large"}}'),
(6, '{"theme":"dark","beta_features":true}'),
(7, '{"theme":"light","language":"es-ES"}');


-- 3. READ JSON VALUES
-- ->  returns JSON
-- ->> returns unquoted text (string)
SELECT
    user_id,
    settings->'$.theme'  AS theme_json,
    settings->>'$.theme' AS theme_text,
    settings->>'$.notifications.email' AS email_notif
FROM user_preferences;


-- 4. FILTER USING JSON VALUE
SELECT
    user_id,
    settings->>'$.theme' AS theme
FROM user_preferences
WHERE settings->>'$.theme' = 'dark';


-- 5. UPDATE JSON DATA
-- JSON_SET updates existing keys or adds new ones
UPDATE user_preferences
SET settings = JSON_SET(
    settings,
    '$.theme', 'system',
    '$.volume', 80
)
WHERE user_id = 1;


-- 6. VERIFY UPDATE
SELECT
    user_id,
    settings
FROM user_preferences
WHERE user_id = 1;
