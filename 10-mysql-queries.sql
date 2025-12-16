-- =========================================
-- Title: Top 10 MySQL Queries
-- DB: MySQL 8+
-- Author: Mehdi
-- =========================================

-- 1. REPLACE INTO
REPLACE INTO users (id, name)
VALUES (1, 'Mehdi');

-- 2. DELETE with LIMIT
DELETE FROM logs
ORDER BY created_at
LIMIT 1000;

-- 3. Temporary Table
CREATE TEMPORARY TABLE temp_users AS
SELECT id, name FROM users;

-- 4. Generated Column
ALTER TABLE products
ADD total_price DECIMAL(10,2)
GENERATED ALWAYS AS (price * quantity);

-- 5. Invisible Index
ALTER TABLE users
ALTER INDEX idx_city INVISIBLE;

-- 6. LOAD DATA INFILE
LOAD DATA INFILE '/tmp/users.csv'
INTO TABLE users
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

-- 7. Session Variable (Row Number)
SET @row := 0;
SELECT @row := @row + 1 AS rn, name FROM users;

-- 8. JSON_SET
UPDATE orders
SET data = JSON_SET(data, '$.status', 'paid');

-- 9. SIGNAL Error
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Invalid operation';

-- 10. EXPLAIN
EXPLAIN
SELECT * FROM orders WHERE user_id = 10;
