
with cte as(
select ticker, date, close, 
lag(close) over(partition by ticker order by date asc) as prev_close
from stock_prices
)



select ticker, date, close, ROUND((close - prev_close)*100 / prev_close ,2)
from cte
order by ticker asc, date asc
;
