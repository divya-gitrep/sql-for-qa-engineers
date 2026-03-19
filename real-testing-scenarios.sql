--Scenario 1: Detect Duplicate Users
SELECT email, COUNT(*)
FROM users
GROUP BY email
HAVING COUNT(*) > 1;
--QA Insight: Duplicate users = data integrity issue

--Scenario 2: Orders Without Users (Data Integrity Bug)
SELECT o.order_id
FROM orders o
LEFT JOIN users u
ON o.user_id = u.user_id
WHERE u.user_id IS NULL;
--QA Insight: Broken foreign key relationship

--Scenario 3: Negative or Invalid Payments
SELECT *
FROM orders
WHERE amount <= 0;
--QA Insight: Business logic validation

--Scenario 4: Missing Mandatory Data
SELECT *
FROM users
WHERE email IS NULL;
--QA Insight: Required field validation

--Scenario 5: Mismatch Between UI & DB (Classic QA Case)

-- Suppose UI shows total orders = 10
-- Validate from DB

SELECT COUNT(*)
FROM orders
WHERE user_id = 101;
--QA Insight: Backend validation of UI data

--Scenario 6: Recent Orders Validation
SELECT *
FROM orders
WHERE order_date >= CURRENT_DATE - INTERVAL '7 days';
--QA Insight: Validate recent activity features
