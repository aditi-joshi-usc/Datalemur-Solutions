-- SELECT user_id, MAX(post_date:: DATE) - MIN(post_date::DATE) AS days_between
-- FROM posts
-- WHERE DATE_PART('year', post_date::DATE) = 2021
-- GROUP BY user_id
-- HAVING COUNT(post_id) > 1;

select user_id, extract(day from max(post_date)-min(post_date)) from posts
where extract(year from post_date) = 2021
group by user_id
having min(post_date) != max(post_date);
