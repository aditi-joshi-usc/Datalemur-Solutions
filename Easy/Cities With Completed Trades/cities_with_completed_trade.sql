SELECT users.city, COUNT(trades.order_id) AS total_orders
FROM trades
LEFT JOIN users
ON users.user_id = trades.user_id
WHERE trades.status = 'Completed'
GROUP BY users.city
ORDER BY total_orders DESC
LIMIT 3;
