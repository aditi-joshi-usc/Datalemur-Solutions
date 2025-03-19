# SQL Problem: Calculating Bench Time for Consultants in 2021

## Problem Description

In consulting, being "on the bench" means you have a gap between two client engagements. Google wants to know how many days of bench time each consultant had in 2021. Assume that each consultant is only staffed to one consulting engagement at a time.

**Task:**  
Write a query to pull each employee ID and their total bench time (in days) during 2021.

**Assumptions:**
- All listed employees are current employees who were hired before 2021.
- The engagements in the `consulting_engagements` table are complete for the year 2021.
- Only rows where `is_consultant` is true in the `staffing` table should be considered.
- Bench days are calculated by subtracting the number of days a consultant was engaged (the duration of their engagement) from 365 days.

## Table Structures

### staffing Table
| Column Name  | Type    |
|--------------|---------|
| employee_id  | integer |
| is_consultant| boolean |
| job_id       | integer |

*Example Input:*
| employee_id | is_consultant | job_id |
|-------------|---------------|--------|
| 111         | true          | 7898   |
| 121         | false         | 6789   |
| 156         | true          | 4455   |

### consulting_engagements Table
| Column Name    | Type    |
|----------------|---------|
| job_id         | integer |
| client_id      | integer |
| start_date     | date    |
| end_date       | date    |
| contract_amount| integer |

*Example Input:*
| job_id | client_id | start_date           | end_date             | contract_amount |
|--------|-----------|----------------------|----------------------|-----------------|
| 7898   | 20076     | 2021-05-25 00:00:00  | 2021-06-30 00:00:00  | 11290.00       |
| 6789   | 20045     | 2021-06-01 00:00:00  | 2021-11-12 00:00:00  | 33040.00       |
| 4455   | 20001     | 2021-01-25 00:00:00  | 2021-05-31 00:00:00  | 31839.00       |

## Example Output
| employee_id | bench_days |
|-------------|------------|
| 111         | 328        |
| 156         | 238        |

## Explanation

- **Employee 111:**  
  Engagement from **2021-05-25** to **2021-06-30** is calculated as:
  - Workdays = `DATEDIFF(2021-06-30, 2021-05-25) + 1` = 37 days  
  - Bench days = 365 - 37 = **328**
  
- **Employee 156:**  
  Engagement from **2021-01-25** to **2021-05-31** is calculated as:
  - Workdays = `DATEDIFF(2021-05-31, 2021-01-25) + 1` = 127 days  
  - Bench days = 365 - 127 = **238**

*Note:* Employees who are not consultants (e.g., `is_consultant = false`) should be excluded.

## SQL Query

```sql
-- Calculate bench time for each consultant in 2021
WITH consultant_engagements AS (
    SELECT 
        s.employee_id,
        -- Calculate the number of engaged days during 2021.
        -- Using DATEDIFF returns the difference in days; adding 1 counts both start and end dates.
        DATEDIFF(e.end_date, e.start_date) + 1 AS engaged_days
    FROM staffing s
    JOIN consulting_engagements e 
      ON s.job_id = e.job_id
    WHERE s.is_consultant = true
      -- Assuming all engagements occurred fully in 2021:
      AND YEAR(e.start_date) = 2021 
      AND YEAR(e.end_date) = 2021
)
SELECT 
    employee_id,
    365 - SUM(engaged_days) AS bench_days
FROM consultant_engagements
GROUP BY employee_id
ORDER BY employee_id ASC;
