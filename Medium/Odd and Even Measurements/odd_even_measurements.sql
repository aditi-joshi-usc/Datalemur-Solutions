WITH cte AS(

SELECT
  measurement_time:: DATE as measurement_day,
  measurement_value,
  ROW_NUMBER() OVER(PARTITION BY measurement_time:: DATE ORDER BY measurement_time) AS row_cnt
  FROM measurements
)



SELECT
  measurement_day,
  SUM( measurement_value) FILTER (WHERE row_cnt % 2 != 0) AS odd_sum,
  SUM( measurement_value) FILTER (WHERE row_cnt % 2 = 0) AS even_sum
FROM 
  cte 
GROUP BY measurement_day; 
