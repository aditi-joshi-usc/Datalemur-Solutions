select 
  user_id, 
  session_type,
  rank() over(partition by session_type order by sum(duration) DESC) as ranking

from 
  sessions
  
where 
  start_date BETWEEN '2022-01-01' AND '2022-02-01'
group by user_id, session_type
