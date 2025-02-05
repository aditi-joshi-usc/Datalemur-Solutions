-- WITH python_skill as(
--   SELECT candidate_id 
--   FROM candidates
--   WHERE skill = 'Python'

-- ),

-- tableau_skill as(
--   SELECT candidate_id 
--   FROM candidates
--   WHERE skill = 'Tableau'

-- ),

-- postgre_skill as(
--   SELECT candidate_id 
--   FROM candidates
--   WHERE skill = 'PostgreSQL'

-- )



-- SELECT DISTINCT candidate_id
-- FROM candidates
-- WHERE candidate_id IN (
-- SELECT candidate_id FROM python_skill
-- ) AND
-- candidate_id IN (
-- SELECT candidate_id FROM tableau_skill
-- ) AND
-- candidate_id IN (
-- SELECT candidate_id FROM postgre_skill
-- )
-- ;


SELECT candidate_id 
FROM candidates
WHERE skill IN ('Python', 'Tableau','PostgreSQL')
GROUP BY candidate_id
HAVING COUNT(DISTINCT skill) = 3;

