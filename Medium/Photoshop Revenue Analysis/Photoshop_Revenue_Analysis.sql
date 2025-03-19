select 
  customer_id,
  SUM(revenue) as revenue
FROM 
  adobe_transactions
where product != 'Photoshop'
group by customer_id

HAVING customer_id IN
(SELECT
  distinct customer_id 
from 
  adobe_transactions 
WHERE
  product = 'Photoshop'
) 
order by customer_id ASC;
