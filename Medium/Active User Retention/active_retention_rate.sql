
WITH mth_table as(
  select user_id, extract(month from event_date) as mth 
  from user_actions
),

cte as (
  select a.user_id as user_id, a.mth AS month 
  from mth_table as a inner join mth_table as b
  on a.user_id = b.user_id and a.mth = b.mth + 1
)

select month, count(distinct user_id) AS monthly_active_users 
from cte where month = 7
group by month;
