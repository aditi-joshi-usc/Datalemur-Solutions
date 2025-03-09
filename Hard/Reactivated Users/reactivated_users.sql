WITH month_find AS(
  select user_id, login_date,
  EXTRACT(MONTH FROM login_date) AS mth 
  FROM user_logins

),

find_interval AS(
  SELECT m1.user_id, m1.mth AS mth 
  FROM month_find AS m1
  WHERE m1.mth NOT IN (
  SELECT m2.mth+1 FROM month_find AS m2 WHERE m2.user_id = m1.user_id) 
)

SELECT mth, COUNT(distinct user_id) AS reactivated_users FROM find_interval
GROUP BY mth 
;
