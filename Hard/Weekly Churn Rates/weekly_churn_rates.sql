
SELECT signup_week, ROUND(SUM(CASE WHEN churned = 'Y' THEN 1 ELSE 0 END)::DECIMAL *100 / COUNT(user_id),2)
FROM(

SELECT *, (CASE WHEN last_login:: DATE - signup_date:: DATE <=28 THEN 'Y' ELSE 'N' END) as churned,
  DENSE_RANK() OVER( ORDER BY EXTRACT(WEEK FROM signup_date)) as signup_week
  FROM users
  WHERE EXTRACT(MONTH FROM signup_date) = 06 AND EXTRACT(YEAR FROM signup_date) = 2022
  
) AS cte 

GROUP BY signup_week;
