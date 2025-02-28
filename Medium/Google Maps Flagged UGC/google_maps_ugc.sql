with cte as (SELECT place_info.place_category AS off_topic_places, COUNT(*) as count
from place_info LEFT JOIN maps_ugc_review
ON place_info.place_id = maps_ugc_review.place_id
where content_tag = 'Off-topic'
GROUP BY place_info.place_category
ORDER BY COUNT(*) DESC)


SELECT off_topic_places
from cte 
where count = (SELECT max(count) from cte)
order by 
off_topic_places
;
