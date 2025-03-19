with consulting_days as(select staffs.employee_id,
  sum(engagements.end_date - engagements.start_date) as non_bench_days,
  count(staffs.job_id) as inclusive_days
from staffing as staffs
inner join consulting_engagements as engagements
on staffs.job_id = engagements.job_id
where staffs.is_consultant = 'true'
group by staffs.employee_id)

select 
  employee_id,
  365 - sum(non_bench_days) - sum(inclusive_days) as bench_days
from consulting_days
group by employee_id

;


