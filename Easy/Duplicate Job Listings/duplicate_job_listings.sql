SELECT COUNT(DISTINCT j1.company_id) as duplicate_companies
FROM job_listings j1
JOIN job_listings j2
ON j1.job_id != j2.job_id
WHERE j1.title = j2.title and j1.description = j2.description and j1.company_id = j2.company_id;
