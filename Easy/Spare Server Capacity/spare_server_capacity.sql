with cte as (
select datacenter_id, SUM(monthly_demand) as sum_cap
FROM forecasted_demand 
group by datacenter_id
)


SELECT d.datacenter_id as datacenter_id,
d.monthly_capacity - f.sum_cap as spare_capacity
FROM datacenters as d 
LEFT JOIN cte as f
ON d.datacenter_id = f.datacenter_id
ORDER BY d.datacenter_id;
