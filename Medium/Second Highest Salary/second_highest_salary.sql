SELECT 
    DISTINCT salary AS second_highest_salary
FROM 
    employee
ORDER BY 
    salary DESC
LIMIT 1
OFFSET 1;
