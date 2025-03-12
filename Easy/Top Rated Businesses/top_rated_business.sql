SELECT
  SUM(CASE 
  WHEN review_stars = 5 or review_stars = 4 THEN 1 ELSE 0
  END) as business_count,
  ROUND(SUM(CASE 
  WHEN review_stars = 5 or review_stars = 4 THEN 1 ELSE 0
  END)*100.00 / COUNT(*) , 0) AS top_rated_pct
FROM reviews;
