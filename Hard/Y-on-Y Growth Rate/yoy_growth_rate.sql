with cte1 as ( 
select extract(year from transaction_date) as year, product_id, spend 
from user_transactions
)

select a.year, a.product_id, a.spend as curr_year_spend, b.spend as prev_year_spend,
ROUND((a.spend-b.spend)*100.00/b.spend,2) as yoy_rate
from cte1 as a 
left join cte1 as b
on a.product_id = b.product_id and a.year = b.year+1
order by  a.product_id, a.year;
