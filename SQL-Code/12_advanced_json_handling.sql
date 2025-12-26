USE venomsql;

-- =============================================
-- 12. JSON DATA HANDLING
-- =============================================
-- Sometimes data doesn't fit neatly into columns (like user settings or configs).
-- MySQL allows us to store this flexible data as JSON.
-- It's like having a mini-database inside a single cell!

-- 1. Create a table with JSON column
CREATE TABLE IF NOT EXISTS user_preferences (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    settings JSON,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- 2. Insert JSON data
INSERT INTO user_preferences (user_id, settings) VALUES
(1, '{"theme": "dark", "notifications": {"email": true, "sms": false}}'),
(2, '{"theme": "light", "notifications": {"email": false, "sms": true}}'),
(3, '{"theme": "dark", "language": "en-US"}');

-- 3. Querying JSON
-- We use special arrows to get data out of the JSON:
-- ->  gets the value as a JSON object (good if you want to keep the quotes).
-- ->> gets the value as plain text (removes quotes, good for displaying).

SELECT
    user_id,
    settings->'$.theme' AS theme_json,
    settings->>'$.theme' AS theme_text,
    settings->>'$.notifications.email' AS email_notif
FROM user_preferences;

-- 4. Filtering by JSON value
SELECT * FROM user_preferences
WHERE settings->>'$.theme' = 'dark';

-- 5. Updating JSON
-- JSON_SET replaces existing values or adds new ones
UPDATE user_preferences
SET settings = JSON_SET(settings, '$.theme', 'system', '$.volume', 80)
WHERE user_id = 1;

-- SELECT * FROM user_preferences;