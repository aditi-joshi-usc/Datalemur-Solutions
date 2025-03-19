select 
count(user_id) as repeat_purchases

from 
(

select 
  user_id,
  product_id,
  count( distinct purchase_date:: date) as purchase_repeats
  
from
  purchases
group by 
  user_id,
  product_id
) as subq
where purchase_repeats > 1;
