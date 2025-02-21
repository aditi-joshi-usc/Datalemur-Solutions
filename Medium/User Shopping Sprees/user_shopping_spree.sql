SELECT DISTINCT a.user_id
FROM 
  transactions a
  INNER JOIN 
  transactions b
  ON a.user_id = b.user_id
  AND a.transaction_date:: DATE - b.transaction_date:: DATE = 1
GROUP BY a.user_id
HAVING COUNT(a.amount)>=2
;
