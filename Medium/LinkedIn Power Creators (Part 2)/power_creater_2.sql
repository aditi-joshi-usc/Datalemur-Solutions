with cte as(
select a.personal_profile_id, b.followers as pfollow, max(c.followers) as cfollow
from employee_company as a inner join personal_profiles as b on a.personal_profile_id = b.profile_id
inner join company_pages as c on a.company_id = c.company_id
group by a.personal_profile_id,pfollow
)


select distinct personal_profile_id as profile_id 
from cte 
where pfollow > cfollow
order by profile_id ;
