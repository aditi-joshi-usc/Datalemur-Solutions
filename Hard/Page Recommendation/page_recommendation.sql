WITH all_friends AS(
  SELECT user_id, friend_id FROM friendship
  UNION
  SELECT friend_id, user_id FROM friendship
  
),

count_pages AS(
SELECT friend.user_id, page.page_id, COUNT(*) AS page_cnt
FROM all_friends AS friend
LEFT JOIN page_following AS page
ON friend.friend_id = page.user_id
WHERE NOT EXISTS (
  SELECT id FROM page_following AS page2
  WHERE friend.user_id = page2.user_id AND page.page_id = page2.page_id
)

GROUP BY friend.user_id, page.page_id
),
find_rank AS(

SELECT user_id, page_id, page_cnt,
  DENSE_RANK() OVER(PARTITION BY user_id ORDER BY page_cnt DESC) AS rankid
  FROM count_pages
)


SELECT user_id, page_id
FROM find_rank
WHERE rankid = 1
ORDER BY user_id;
