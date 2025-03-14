select ROUND(SUM(case when event_type = 'webinar' then 1 else 0 end) * 100.00/ count(event_id), 0) as webinar_pct

from marketing_touches

where extract(month from event_date) = 4 and extract(year from event_date) = 2022;
