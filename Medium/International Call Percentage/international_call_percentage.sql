WITH cte AS(
SELECT a.caller_id, a.receiver_id, b.country_id AS call_country, c.country_id AS rec_country

FROM phone_calls as a 
left join phone_info as b on a.caller_id = b.caller_id
left join phone_info as c on a.receiver_id = c.caller_id
)


SELECT ROUND(SUM(
CASE
WHEN call_country != rec_country THEN 1 ELSE 0
END
) * 100.00/ COUNT(*), 1) as international_calls_pct
FROM cte;
