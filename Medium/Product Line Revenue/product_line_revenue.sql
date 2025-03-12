SELECT product_info.product_line AS product_line, SUM(transactions.amount) as total_revenue
FROM transactions INNER JOIN product_info
ON transactions.product_id = product_info.product_id
GROUP BY product_info.product_line
ORDER BY total_revenue DESC;
