WITH tweet_count_per_user AS (
  SELECT user_id, COUNT(tweet_id) AS tweet_count 
  FROM tweets
  WHERE tweet_date BETWEEN '2022-01-01' AND '2022-12-31'
  GROUP BY user_id)
  
SELECT tweet_count AS tweet_bucket, COUNT(user_id) AS users_num
FROM tweet_count_per_user
GROUP BY tweet_bucket
ORDER BY tweet_bucket ASC;
