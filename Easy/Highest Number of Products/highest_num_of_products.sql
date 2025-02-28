WITH cte as(SELECT user_id, count(product_id) as product_num, SUM(spend) as spend_total
FROM user_transactions
GROUP BY user_id)

SELECT user_id, product_num
from cte
where spend_total >= 1000
order by product_num desc, spend_total DESC
LIMIT 3;


