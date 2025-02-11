SELECT e.employee_id, e.name
FROM employee e 
INNER JOIN employee m 
ON e.manager_id = m.employee_id 
AND e.salary > m.salary;
