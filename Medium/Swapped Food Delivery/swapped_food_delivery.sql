WITH total_count AS(
  SELECT 
    COUNT(id) AS total_id
  FROM 
    orders
)

SELECT
  (CASE
    WHEN id = total_count.total_id  AND id%2 != 0 THEN id
    WHEN id%2 = 0 THEN id - 1
    ELSE id + 1
  END) AS corrected_order_id,
  item
FROM 
  orders
  CROSS JOIN 
  total_count
  
ORDER BY 
  corrected_order_id ASC;
    
