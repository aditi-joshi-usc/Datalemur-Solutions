WITH ranked_drugs AS(
  SELECT 
  manufacturer,
  drug, 
  DENSE_RANK() OVER(PARTITION BY manufacturer ORDER BY units_sold DESC) as rank_drug
FROM 
  pharmacy_sales
)


SELECT
  manufacturer,
  drug as top_drugs
FROM 
  ranked_drugs
WHERE 
  rank_drug<3
ORDER BY manufacturer;
