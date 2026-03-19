-- Count number of orders per user
SELECT user_id, COUNT(order_id) AS total_orders
FROM orders
GROUP BY user_id;

-- Find users with more than 3 orders
SELECT user_id, COUNT(order_id) AS total_orders
FROM orders
GROUP BY user_id
HAVING COUNT(order_id) > 3;

-- Find total revenue per user
SELECT user_id, SUM(amount) AS total_spent
FROM orders
GROUP BY user_id;