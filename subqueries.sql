-- Find users who placed more than 3 orders
SELECT user_id
FROM orders
GROUP BY user_id
HAVING COUNT(order_id) > 3;

-- Find orders above average amount
SELECT order_id, amount
FROM orders
WHERE amount > (
    SELECT AVG(amount) FROM orders
);

-- Find users who never placed an order
SELECT user_id, name
FROM users
WHERE user_id NOT IN (
    SELECT user_id FROM orders
);