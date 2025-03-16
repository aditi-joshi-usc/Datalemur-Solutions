SELECT
  a.employee_id as employee_id,
  (case 
  when sum(a.deal_size) >= b.quota then 'yes'
  else 'no'
  end) as made_quota 
from 
  deals as a
left join 
  sales_quotas as b
ON
  a.employee_id = b.employee_id
group by a.employee_id, b.quota
order by a.employee_id;
