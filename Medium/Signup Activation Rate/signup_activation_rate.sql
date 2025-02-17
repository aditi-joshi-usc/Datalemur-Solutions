SELECT 
  ROUND(1.0 *SUM(
  CASE 
    WHEN texts.signup_action = 'Confirmed' THEN 1
    ELSE 0
    END
  )/ COUNT(texts.signup_action) ,2) AS confirm_rate
FROM
  emails LEFT JOIN texts
  ON emails.email_id = texts.email_id
;
