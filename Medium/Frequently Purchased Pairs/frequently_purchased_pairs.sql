WITH cte AS(
  SELECT 
    transaction_id, 
    ARRAY_AGG(CAST(product_id AS TEXT) ORDER BY product_id) AS combinations
  FROM 
    transactions
  GROUP BY transaction_id
)


SELECT 
  DISTINCT combinations
FROM 
  cte 
WHERE 
  ARRAY_LENGTH(combinations, 1) > 1
ORDER BY combinations;
