SELECT
  country,
  sum(num_search) as total_search,
  round(sum(num_search * invalid_result_pct)/ sum(num_search),2) as invalid_searches_pct
from 
  search_category
WHERE num_search is not null and invalid_result_pct is not null 
group by 
  country
order by country asc;
