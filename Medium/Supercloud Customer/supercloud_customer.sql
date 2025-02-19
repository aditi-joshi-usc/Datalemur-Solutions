SELECT 
  customer_contracts.customer_id AS customer_id
FROM 
  customer_contracts JOIN products
  ON customer_contracts.product_id = products.product_id
GROUP BY 
  customer_contracts.customer_id
HAVING
  COUNT(DISTINCT products.product_category) = (
    SELECT 
      COUNT(DISTINCT product_category) as cat_count
    FROM products
);
