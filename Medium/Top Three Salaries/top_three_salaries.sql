WITH cte AS(
SELECT 
    department_id,
    name,
    salary,
    DENSE_RANK() OVER(
    PARTITION BY department_id ORDER BY salary DESC) AS rank
FROM
    employee  
)

SELECT 
    dep.department_name,
    emp.name,
    emp.salary
FROM cte AS emp 
INNER JOIN department AS dep 
ON emp.department_id = dep.department_id
WHERE
    emp.rank <= 3
ORDER BY dep.department_name ASC, emp.salary DESC, name ASC;
  
