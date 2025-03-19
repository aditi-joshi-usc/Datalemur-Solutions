# SQL Problem: Calculate Total Compensation for Salespersons at Oracle

## Problem Description

As the Sales Operations Analyst at Oracle, you have been tasked with assisting the VP of Sales in determining the final compensation earned by each salesperson for the year. The compensation structure includes a fixed base salary, a commission based on total deals, and potential accelerators for exceeding their quota.

**Compensation Details:**

- Each salesperson earns a fixed base salary.
- They earn a commission on their total deals.
- If a salesperson meets or exceeds their quota:
  - They receive the base salary.
  - They earn a commission on deals up to their quota.
  - They earn an additional (accelerated) commission on any deals beyond their quota.
- If a salesperson does not meet their quota, their compensation consists of the base salary plus the commission on their total deals.

The output should include the employee ID and the corresponding total compensation, sorted in descending order of total compensation. In the case of ties, sort the employee IDs in ascending order.

## Table Structures

### employee_contract Table
| Column Name  | Type    |
|--------------|---------|
| employee_id  | integer |
| base         | integer |
| commission   | double  |
| quota        | integer |
| accelerator  | double  |

### deals Table
| Column Name  | Type    |
|--------------|---------|
| employee_id  | integer |
| deal_size    | integer |

## Example Input

### employee_contract
| employee_id | base   | commission | quota  | accelerator |
|-------------|--------|------------|--------|-------------|
| 101         | 60000  | 0.1        | 500000 | 1.5         |
| 102         | 50000  | 0.1        | 400000 | 1.5         |

### deals
| employee_id | deal_size |
|-------------|-----------|
| 101         | 400000    |
| 101         | 400000    |
| 102         | 100000    |
| 102         | 200000    |

## Example Output
| employee_id | total_compensation |
|-------------|--------------------|
| 101         | 155000             |
| 102         | 80000              |

**Explanation:**

- **Salesperson 101:**
  - **Total Deals:** 400,000 + 400,000 = 800,000.
  - **Quota:** 500,000.
  - Since total deals >= quota, the compensation is calculated as:
    - **Base Salary:** 60,000.
    - **Commission on Target:** 0.1 * 500,000 = 50,000.
    - **Accelerated Commission on Excess:** 0.1 * (800,000 - 500,000) * 1.5 = 45,000.
  - **Total Compensation:** 60,000 + 50,000 + 45,000 = 155,000.

- **Salesperson 102:**
  - **Total Deals:** 100,000 + 200,000 = 300,000.
  - **Quota:** 400,000.
  - Since total deals < quota, the compensation is:
    - **Base Salary:** 50,000.
    - **Commission on Total Deals:** 0.1 * 300,000 = 30,000.
  - **Total Compensation:** 50,000 + 30,000 = 80,000.

## SQL Query

```sql
WITH total_deals AS (
    SELECT 
        employee_id,
        SUM(deal_size) AS total_deal
    FROM deals
    GROUP BY employee_id
)
SELECT 
    ec.employee_id,
    CASE 
        WHEN td.total_deal >= ec.quota THEN 
            ec.base 
            + (ec.commission * ec.quota)
            + (ec.commission * (td.total_deal - ec.quota) * ec.accelerator)
        ELSE 
            ec.base 
            + (ec.commission * td.total_deal)
    END AS total_compensation
FROM employee_contract ec
JOIN total_deals td 
    ON ec.employee_id = td.employee_id
ORDER BY total_compensation DESC, ec.employee_id ASC;
