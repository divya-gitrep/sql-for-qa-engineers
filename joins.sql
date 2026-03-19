-- INNER JOIN: Get users with their orders
SELECT u.user_id, u.name, o.order_id
FROM users u
INNER JOIN orders o
ON u.user_id = o.user_id;

-- LEFT JOIN: Find users with NO orders (important for testing)
SELECT u.user_id, u.name
FROM users u
LEFT JOIN orders o
ON u.user_id = o.user_id
WHERE o.order_id IS NULL;

-- RIGHT JOIN (less used but good to show knowledge)
SELECT o.order_id, u.name
FROM users u
RIGHT JOIN orders o
ON u.user_id = o.user_id;