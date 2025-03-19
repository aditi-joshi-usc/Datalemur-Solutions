with emp_cte as (SELECT  
  employee_id,
  sum(deal_size) as amt_reached
from deals 
group by employee_id
)


select 
  e.employee_id as employee_id,
  case 
    when c.quota < e.amt_reached then c.base + (c.commission*c.quota) + (c.accelerator*c.commission* (e.amt_reached - c.quota))
    else c.base + (c.commission*e.amt_reached)
  end  as total_compensation


from emp_cte as e 
inner join employee_contract as c 
on e.employee_id = c.employee_id
order by total_compensation desc, employee_id asc  
;
