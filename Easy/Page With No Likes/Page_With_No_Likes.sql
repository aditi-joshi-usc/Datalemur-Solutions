SELECT pages.page_id 
FROM pages LEFT JOIN page_likes
ON pages.page_id = page_likes.page_id
GROUP BY pages.page_id
HAVING COUNT(page_likes.liked_date) = 0;
