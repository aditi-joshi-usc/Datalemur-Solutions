with segment_cte as(
select 
  customer_id,
  case 
    when employee_count< 100 then 'smb'
    when employee_count between 100 and 999 then 'mid'
    else 'enterprise'
  end as segment
from customers
),
revenue_cte as(

select 
  seg.segment,
  sum(contracts.num_seats * contracts.yearly_seat_cost)/ count(distinct seg.customer_id) as avg_revenue
from 
  segment_cte as seg
inner join
  contracts on seg.customer_id = contracts.customer_id
group by
  seg.segment
)

select 
  sum(case when segment = 'smb' then avg_revenue else 0 end) as smb_avg_revenue,
  sum(case when segment = 'mid' then avg_revenue else 0 end) as mid_avg_revenue,
  sum(case when segment = 'enterprise' then avg_revenue else 0 end) as enterprise_avg_revenue
from revenue_cte;
