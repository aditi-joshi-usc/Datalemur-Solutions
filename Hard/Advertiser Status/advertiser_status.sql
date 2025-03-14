select COALESCE(advertiser.user_id, daily_pay.user_id) as user_id,
(
case
  when paid is null then 'CHURN'
  when paid is not null and advertiser.status in ('NEW', 'EXISTING', 'RESURRECT') then 'EXISTING' 
  when paid is not null and advertiser.status = 'CHURN' THEN 'RESURRECT'
  when paid is not null and advertiser.status is null then 'NEW'

end) as new_status
from advertiser
FULL OUTER JOIN daily_pay 
on advertiser.user_id = daily_pay.user_id
order by user_id; 
