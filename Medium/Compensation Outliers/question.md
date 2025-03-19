# Compensation Outliers Analysis

Your team at Accenture is helping a Fortune 500 client revamp their compensation and benefits program. The first step in this analysis is to manually review employees who are potentially overpaid or underpaid.

An employee is considered to be potentially overpaid if they earn more than **2 times** the average salary for people with the same title. Similarly, an employee might be underpaid if they earn less than **half** of the average salary for their title. We'll refer to these employees as **compensation outliers**.

## Task

Write a query that shows the following data for each compensation outlier:
- `employee_id`
- `salary`
- `status` (indicating whether they are "Overpaid" or "Underpaid")

The query should only include employees who are compensation outliers and should sort the results by `employee_id` in ascending order.

## Table Schema: employee_pay

- **employee_id**: integer
- **salary**: integer
- **title**: varchar

## Example Input

| employee_id | salary  | title          |
|-------------|---------|----------------|
| 101         | 80000   | Data Analyst   |
| 102         | 90000   | Data Analyst   |
| 103         | 100000  | Data Analyst   |
| 104         | 30000   | Data Analyst   |
| 105         | 120000  | Data Scientist |
| 106         | 100000  | Data Scientist |
| 107         | 80000   | Data Scientist |
| 108         | 310000  | Data Scientist |

## Expected Output

| employee_id | salary  | status    |
|-------------|---------|-----------|
| 104         | 30000   | Underpaid |
| 108         | 310000  | Overpaid  |

**Explanation:**
- For **Data Analyst**:
  - The average salary is calculated as (80000 + 90000 + 100000 + 30000) / 4 = 75000.
  - Employee 104 earns 30000, which is less than half of 75000 (i.e., less than 37500), so they are **Underpaid**.
- For **Data Scientist**:
  - The average salary is calculated as (120000 + 100000 + 80000 + 310000) / 4 = 152500.
  - Employee 108 earns 310000, which is more than twice 152500 (i.e., more than 305000), so they are **Overpaid**.

## SQL Query

```sql
WITH title_avg AS (
    SELECT 
        title, 
        AVG(salary) AS avg_salary
    FROM 
        employee_pay
    GROUP BY 
        title
)
SELECT 
    e.employee_id,
    e.salary,
    CASE
        WHEN e.salary > 2 * t.avg_salary THEN 'Overpaid'
        WHEN e.salary < 0.5 * t.avg_salary THEN 'Underpaid'
    END AS status
FROM 
    employee_pay e
JOIN 
    title_avg t ON e.title = t.title
WHERE 
    e.salary > 2 * t.avg_salary
    OR e.salary < 0.5 * t.avg_salary
ORDER BY 
    e.employee_id ASC;
