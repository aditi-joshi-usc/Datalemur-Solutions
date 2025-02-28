WITH cte AS(SELECT MAX(transaction_date) AS transaction_date, user_id
FROM user_transactions
GROUP BY user_id

)

SELECT 
cte.transaction_date, cte.user_id, COUNT(u.spend) AS purchase_count
from cte LEFT JOIN user_transactions AS u 
on cte.user_id = u.user_id AND cte.transaction_date = u.transaction_date
GROUP BY cte.transaction_date, cte.user_id
ORDER BY cte.transaction_date;

