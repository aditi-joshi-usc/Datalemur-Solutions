SELECT t.email_id as user_id
FROM texts t INNER JOIN emails e
ON t.email_id = e.email_id
WHERE t.signup_action = 'Confirmed'
AND (t.action_date::DATE - e.signup_date::DATE) = 1;

