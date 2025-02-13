SELECT 
    ab.age_bucket, 
    ROUND(100 * SUM(CASE
    WHEN ac.activity_type = 'send' THEN ac.time_spent
    ELSE 0 END
    ) / SUM(ac.time_spent),2) AS send_perc,
    ROUND(100 * SUM(CASE
    WHEN ac.activity_type = 'open' THEN ac.time_spent
    ELSE 0 END
    ) / SUM(ac.time_spent) ,2) AS open_perc
FROM 
    activities AS ac INNER JOIN age_breakdown AS ab
ON
    ac.user_id = ab.user_id
WHERE 
    ac.activity_type IN ('send', 'open') 
GROUP BY
    ab.age_bucket;
