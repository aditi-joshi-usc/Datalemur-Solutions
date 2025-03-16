# Who Made Quota? Oracle SQL Interview Question

This Markdown document describes the problem, provides an example input/output, outlines an Oracle SQL solution, and discusses the approach to determine whether each salesperson met their annual quota.

## Problem Description

As a data analyst on the Oracle Sales Operations team, you are given two tables: one with a list of sales deals and one with the annual quota each salesperson needs to hit.

- **Deals Table (`deals`):**
  - **Columns:**
    - `employee_id` (integer)
    - `deal_size` (integer) – the value of each deal.
  - **Note:** A salesperson may have more than one deal.

- **Sales Quotas Table (`sales_quotas`):**
  - **Columns:**
    - `employee_id` (integer)
    - `quota` (integer) – the annual sales quota.

Your task is to write a query that outputs each `employee_id` and whether they hit the quota or not. The result should:
- **Include each `employee_id`.**
- **Display `'yes'` if the sum of an employee's deals is equal to or greater than the quota.**
- **Display `'no'` otherwise.**
- **Order the results by `employee_id` in ascending order.**

## Example Input

**Deals Table (`deals`):**

| employee_id | deal_size |
|-------------|-----------|
| 101         | 400000    |
| 101         | 300000    |
| 201         | 500000    |
| 301         | 500000    |

**Sales Quotas Table (`sales_quotas`):**

| employee_id | quota   |
|-------------|---------|
| 101         | 500000  |
| 201         | 400000  |
| 301         | 600000  |

## Example Output

| employee_id | made_quota |
|-------------|------------|
| 101         | yes        |
| 201         | yes        |
| 301         | no         |

**Explanation:**
- **Employee 101:** Total sales = 400000 + 300000 = 700000, which exceeds their quota of 500000 → **yes**
- **Employee 201:** Total sales = 500000, which exceeds their quota of 400000 → **yes**
- **Employee 301:** Total sales = 500000, which does not meet their quota of 600000 → **no**

## SQL Solution

Below is the Oracle SQL query to achieve the desired output:

```sql
SELECT
    sq.employee_id,
    CASE 
        WHEN NVL(SUM(d.deal_size), 0) >= sq.quota THEN 'yes'
        ELSE 'no'
    END AS made_quota
FROM sales_quotas sq
LEFT JOIN deals d ON sq.employee_id = d.employee_id
GROUP BY sq.employee_id, sq.quota
ORDER BY sq.employee_id;
