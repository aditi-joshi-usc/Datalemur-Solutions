-- select count(distinct u.user_id )
-- from user_transactions as u
-- WHERE
--   u.transaction_date = (select min(t.transaction_date) from user_transactions as t where t.user_id = u.user_id) 
-- and 
--   spend>=50;


with cte as(
select 
  user_id,
  spend,
  rank() over(partition by user_id order by transaction_date) as ranking
FROM
  user_transactions

)


select count(distinct user_id) 
from cte
where ranking = 1
and spend >= 50;
