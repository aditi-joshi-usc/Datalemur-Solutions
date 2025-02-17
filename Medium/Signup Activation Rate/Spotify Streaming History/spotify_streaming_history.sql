WITH cte AS(
  SELECT user_id,
  song_id,
  song_plays
  FROM songs_history
  
  UNION ALL
  
  SELECT user_id, song_id, 
  COUNT(*) as song_plays
  FROM songs_weekly
  WHERE EXTRACT(DAY FROM listen_time) <=4
  GROUP BY user_id, song_id
)



SELECT 
  user_id,
  song_id,
  SUM(song_plays) AS song_count
FROM cte 
GROUP BY user_id, song_id
ORDER BY SUM(song_plays) DESC;
  
