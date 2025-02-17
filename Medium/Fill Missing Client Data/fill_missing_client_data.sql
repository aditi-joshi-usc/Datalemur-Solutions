WITH category_counter AS(
SELECT 
  *, COUNT(category) OVER(ORDER BY product_id) AS count_category
FROM 
  products)

SELECT product_id,
  COALESCE(category, MAX(category) OVER(PARTITION BY count_category)),
  name 
FROM category_counter

;
