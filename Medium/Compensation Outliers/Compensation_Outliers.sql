with avg_sal_role as (
select 
  title, 
  avg(salary) as avg_sal
from employee_pay
group by title

)

select 
  employee_id,
  salary,
  status
from(

select 
  e.employee_id, 
  e.salary,
  asr.avg_sal,
  (
    case
      when e.salary > 2*asr.avg_sal then 'Overpaid'
      when e.salary < asr.avg_sal/2 then 'Underpaid'
      else 'None'
    end
  
  ) as status
from 
  employee_pay as e 
left join 
  avg_sal_role as asr on e.title = asr.title

) as subq

where status != 'None';
